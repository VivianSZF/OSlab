#include "pcb.h"
#include "list.h"
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

void sys_sleep(){
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
	pcbnow->timecount++;
	now=next;
	if(now==&ready)
		pcbnow=&init;
	else
		pcbnow=list_entry(now,PCB,list);
	lcr3(PADDR(pcbnow->pgdir);
}
