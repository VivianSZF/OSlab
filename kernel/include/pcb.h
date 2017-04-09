#ifndef __PCB_H__
#define __PCB_H__

#include "types.h"
#include "mmu.h"
#include "memlayout.h"
#define MAXN_PCB 10


typedef struct ProcessControlBlock {
	struct TrapFrame tf;
	pde_t *pgdir;
	struct ProcessControlBlock *pcbo;
} PCB;


#endif
