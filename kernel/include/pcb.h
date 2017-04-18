#ifndef __PCB_H__
#define __PCB_H__

#include "types.h"
#include "mmu.h"
#include "memlayout.h"
#include "list.h"
#define MAXN_PCB 10


typedef struct ProcessControlBlock {
	struct TrapFrame tf;
	pde_t *pgdir;
	list plist;
	uint32_t pid,ppid;
	uint32_t timer;
	//struct ProcessControlBlock *pcbo;
} PCB;

list pnow,pzu,pready,pfree;

#endif
