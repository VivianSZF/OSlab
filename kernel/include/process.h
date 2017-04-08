#ifndef __PROCESS_H__
#define __PROCESS_H__

#include "mmu.h"
#include "types.h"
#include "memlayout.h"

#define KSTACK_SIZE 4096
#define MAX_PCB 10

typedef struct ProcessControlBlock {
	struct TrapFrame tf;
	pde_t *pgdir;
	struct ProcessControlBlock *pcbo;
	uint8_t kstack[KSTACK_SIZE];
} PCB;

void init_pcb(void);
PCB* pcb_create(void);
void loader(PCB*);

#endif
