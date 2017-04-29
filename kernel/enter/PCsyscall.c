#include "pcb.h"
#include "common.h"

extern pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
	PCB *fa=pcbnow;
	PCB *ch=pcb_alloc();
	pcb_deepcopy(fa,ch);
	ch->ppid=fa->pid;
	fa->tf->eax=ch->pid;
	ch->tf->eax=0;
}

void sys_getpid(){
	return pcbnow->pid;
}

void sys_exit(){
	list
}
