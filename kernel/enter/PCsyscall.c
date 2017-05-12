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
	(fa->tf)->eax=ch->pid;
	(ch->tf)->eax=0;
}

uint32_t sys_getpid(){
	return pcbnow->pid;
}

void sys_exit(int suc){
	if(suc==0)
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
	else
		printk("Not teminate the process of pid %d!!!\n",pcbnow->pid);
	list *lnext;
	list *t=&ready;
	if(now->next==t)
 	{
		if(t->next==now)
			lnext=t;
		else
			lnext=t->next;
	}
	else
	{
		if(now->next==now)
			lnext=t;
		else
			lnext=now->next;
 	}
	list_del(now);
	list_add_before(&free,now);
	lcr3(PADDR(kern_pgdir));
	pcb_remove(pcbnow);
	now=lnext;
	if(now==&ready)
		pcbnow=&init;
	else
		pcbnow=list_entry(now,PCB,plist);
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
	lcr3(PADDR(pcbnow->pgdir));
}

void sys_sleep(int time){
	list *lnext;
	list *t=&ready;
	if(now->next==t)
	{
		if(t->next==now)
			lnext=t;
		else
			lnext=t->next;
	}
	else
	{
		if(now->next==now)
			lnext=t;
		else
			lnext=now->next;
	}
	list_del(now);
	list_add_before(&block,now);
	pcbnow->state=BLOCKED;
	pcbnow->timecount=time*60;
	now=lnext;
	if(now==&ready)
		pcbnow=&init;
	else
		pcbnow=list_entry(now,PCB,plist);
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
	lcr3(PADDR(pcbnow->pgdir));
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
