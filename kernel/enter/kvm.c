#include "mmu.h"
#include "x86.h"
#include "common.h"
#include "process.h"
#include "pmap.h"

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
	ptr->limit_15_0  = 0xFFFF;
	ptr->base_15_0   = 0x0;
	ptr->base_23_16  = 0x0;
	ptr->type = type;
	ptr->segment_type = 1;
	ptr->privilege_level = pl;
	ptr->present = 1;
	ptr->limit_19_16 = 0xF;
	ptr->soft_use = 0;
	ptr->operation_size = 0;
	ptr->pad0 = 1;
	ptr->granularity = 1;
	ptr->base_31_24  = 0x0;
}

static TSS tss; 

inline static void
set_tss(Segdesc *ptr) {
	tss.ss0 = SELECTOR_KERNEL(SEG_KERNEL_DATA);
	tss.esp0 = KSTACKTOP;
	uint32_t base = (uint32_t)&tss;
	uint32_t limit = sizeof(TSS) - 1;
	ptr->limit_15_0  = limit & 0xffff;
	ptr->base_15_0   = base & 0xffff;
	ptr->base_23_16  = (base >> 16) & 0xff;
	ptr->type = STS_T32A;
	ptr->segment_type = 0;
	ptr->privilege_level = DPL_USER;
	ptr->present = 1;
	ptr->limit_19_16 = limit >> 16;
	ptr->soft_use = 0;
	ptr->operation_size = 0;
	ptr->pad0 = 1;
	ptr->granularity = 0;
	ptr->base_31_24  = base >> 24;
}


void load_gdt(void *addr, uint32_t size)
{
	static volatile uint16_t data[3];
	data[0] = size - 1;
	data[1] = (uint32_t)addr;
	data[2] = ((uint32_t)addr) >> 16;
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
}

void
init_segment(void) {
	memset(gdt, 0, sizeof(gdt));
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);

	load_gdt(gdt, sizeof(gdt));
	set_tss(&gdt[SEG_TSS]);
	load_tr(SELECTOR_USER(SEG_TSS));
}

void enter_user_space(PCB *p)
{
	lcr3(PADDR(p->pgdir));
	asm volatile("mov %0, %%ds" : : "r"(p->tf.ds));
	asm volatile("mov %0, %%es" : : "r"(p->tf.es));
	asm volatile("mov %0, %%fs" : : "r"(p->tf.fs));
	asm volatile("mov %0, %%gs" : : "r"(p->tf.gs));
	asm volatile("pushl %0" : : "r"((uint32_t)p->tf.ss));
	asm volatile("pushl %0" : : "r"(p->tf.esp));
	asm volatile("pushl %0" : : "r"(p->tf.eflags));
	asm volatile("pushl %0" : : "r"((uint32_t)p->tf.cs));
	asm volatile("pushl %0" : : "r"(p->tf.eip));
	asm volatile("iret");	
}
