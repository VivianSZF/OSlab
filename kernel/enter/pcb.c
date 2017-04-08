#include "mmu.h"
#include "common.h"
#include "pcb.h"
#include "memlayout.h"
#include "pmap.h"
#include "string.h"
#include "elf.h"
#include "x86.h"

PCB pcb[MAXN_PCB];
PCB *pcb_free_list;
#define SECT_SIZE 512
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];

void init_pcb()
{
	int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}
}
PCB* pcb_alloc()
{
	PCB *p = pcb_free_list;
	if (p == NULL) return NULL;
	struct Page *pp = page_alloc(ALLOC_ZERO);
	if (pp == NULL) return NULL;
	p->pgdir = page2kva(pp);
	pp->pp_ref ++;
	memcpy(p->pgdir, kern_pgdir, PGSIZE);
	p->pgdir[PDX(UVPT)] = PADDR(p->pgdir) | PTE_P | PTE_U;
	memset(&p->tf, 0, sizeof(p->tf));
	p->tf.ds = GD_UD | 3;
	p->tf.es = GD_UD | 3;
	p->tf.ss = GD_UD | 3;
	p->tf.esp = USTACKTOP;
	p->tf.cs = GD_UT | 3;
	p->tf.eflags = 0x2 | FL_IF;
	pcb_free_list = pcb_free_list->pcbo;
	return p;
}

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
	struct PageInfo *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;

	for (i = va_start; i < va_end; i += PGSIZE) {
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
		readsect(disks, sect);
		uint32_t rem = offset & 0x1ff;
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}

void readsect(void *dst, uint32_t offset)
{
	while ((inb(0x1F7) & 0xC0) != 0x40);
	outb(0x1F2, 1);
	outb(0x1F3, offset);
	outb(0x1F4, offset >> 8);
	outb(0x1F5, offset >> 16);
	outb(0x1F6, (offset >> 24) | 0xE0);
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
	insl(0x1F0, dst, SECT_SIZE / 4);
}

PCB* pcb_new()
{
	PCB *p = pcb_alloc();
	if (p == NULL) return NULL;
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) {
		if (ph -> p_type != ELF_PROG_LOAD) continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	p->tf.eip = elf -> e_entry;
	mm_malloc(pcb->pgdir, USTACKTOP - KSTKSIZE, KSTKSIZE);
	lcr3(PADDR(kern_pgdir));
	return p;
}
