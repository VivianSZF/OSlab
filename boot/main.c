#include "x86.h"
#include "elf.h"

#define SECTSIZE 512

void readseg(unsigned char *, int, int);
void readsect(void *, int);

void bootmain(void) {
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	unsigned char* pa, *i;

	elf = (struct Elf*)0x8000;

	readseg((unsigned char*)elf, SECTSIZE*8, 0);

	if (elf -> e_magic != ELF_MAGIC) {
		// Invalid ELF
		goto bad;
	}
	
	ph = (struct Proghdr*)((uint8_t *)elf + elf->e_phoff);
	eph = ph + elf->e_phnum;
	for(; ph < eph; ph ++) {
		pa = (unsigned char*)ph->p_pa; 
		readseg(pa, ph->p_filesz, ph->p_offset); 
		for (i = pa + ph->p_filesz; i < pa + ph->p_memsz; *i ++ = 0);
	}

	((void(*)(void))elf->e_entry)();
	
bad:
	outw(0x8A00, 0x8A00);
	outw(0x8A00, 0x8E00);
	while (1);
}

void readseg(unsigned char *pa, int count, int offset) {
	unsigned char *epa;
	epa = pa + count;
	pa -= offset % SECTSIZE;
	offset = (offset / SECTSIZE) + 1;
	for(; pa < epa; pa += SECTSIZE, offset ++)
		readsect(pa, offset);
}

void waitdisk(void) {
	while((inb(0x1F7) & 0xC0) != 0x40); 
}

void readsect(void *dst, int offset) {
	waitdisk();
	outb(0x1F2, 1);
	outb(0x1F3, offset);
	outb(0x1F4, offset >> 8);
	outb(0x1F5, offset >> 16);
	outb(0x1F6, (offset >> 24) | 0xE0);
	outb(0x1F7, 0x20);

	waitdisk();
	
	insl(0x1F0, dst, SECTSIZE/4);
}




