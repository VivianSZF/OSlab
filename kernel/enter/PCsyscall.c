#include "pcb.h"
#include "common.h"
#include "memlayout.h"
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_copy(PCB*,PCB*,int);
void sys_fork(){
	PCB* fa=pcbnow;
	PCB* ch=pcb_alloc();
	pcb_copy(fa,ch,DEEP);//written in pcb.c
	ch->ppid=fa->pid;
	(fa->tf)->eax=ch->pid;
	(ch->tf)->eax=0;
}

uint32_t sys_getpid(){
	return pcbnow->pid;
}

void sys_exit(){
	printk("teminate the thread %d successfully!\n",pcbnow->pid);
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

int kthread(void *addr)
{
	PCB *p=pcb_alloc();
	pcb_copy(pcbnow,p,SHALLOW);
	mm_malloc(p->pgdir,USTACKTOP-USTACKSIZE,USTACKSIZE);
	TrapFrame *tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);
	tf->eip=(uint32_t)addr;
	tf->esp=USTACKTOP-12;
	return 0;
}