#ifndef __PCB_H__
#define __PCB_H__

#include "types.h"
#include "mmu.h"
#include "memlayout.h"
#include "list.h"
#define MAXN_PCB 10
#define KSTACK_SIZE 4096
#define RUNNABLE 0
#define RUNNING 1
#define BLOCKED 2
#define DEAD 3


typedef union ProcessControlBlock {
	uint8_t kstack[KSTACK_SIZE];
	struct{
		TrapFrame *tf;
		pde_t *pgdir;
		list plist;
		uint32_t pid,ppid;
		int state;
		int timecount;
		int sleeptime;
		void *addr;
	};
	//struct ProcessControlBlock *pcbo;
}PCB;

list ready,block,free;
PCB init;
PCB *pcbnow;
list *now;

void set_tss_esp0(uint32_t);
#endif
