#include "pcb.h"
#include "common.h"
#include "memlayout.h"
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
	PCB* fa=pcbnow;
	PCB* ch=pcb_alloc();
	pcb_deepcopy(fa,ch);//written in pcb.c
	ch->ppid=fa->pid;
	fa->tf->eax=ch->pid;
	ch->tf->eax=0;
}

uint32_t sys_getpid(){
	return pcbnow->pid;
}

void sys_exit(int suc){
	if(suc==0)
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
	else
		printk("Not teminate the process of pid %d successfully!!!\n",pcbnow->pid);
	list *next;
	list *t=&ready;
	if(now->next==t)
 	{
		if(t->next==now)
			next=t;
		else
			next=t->next;
	}
	else
	{
		if(now->next==now)
			next=t;
		else
			next=now->next;
 	}
	list_del(now);
	list_add_before(&free,now);
	//??lcr3(PADDR(kern_pgdir));
	pcb_remove(pcbnow);
	now=next;
	if(now==&ready)
		pcbnow=&init;
	else
		pcbnow=list_entry(now,PCB,plist);
	lcr3(PADDR(pcbnow->pgdir));
}

void sys_sleep(int time){
	list *next;
	list *t=&ready;
	if(now->next==t)
	{
		if(t->next==now)
			next=t;
		else
			next=t->next;
	}
	else
	{
		if(now->next==now)
			next=t;
		else
			next=now->next;
	}
	list_del(now);
	list_add_before(&block,now);
	pcbnow->state=BLOCKED;
	pcbnow->timecount=time*60;
	now=next;
	if(now==&ready)
		pcbnow=&init;
	else
		pcbnow=list_entry(now,PCB,plist);
	lcr3(PADDR(pcbnow->pgdir));
}
