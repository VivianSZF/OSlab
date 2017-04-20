#include "x86.h"
#include "common.h"
#include "pcb.h"
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
	list *one;
	list *head=&block;
	for(one=head->next;one!=head;one=one->next){
		PCB *p=list_entry(one,PCB,plist);
		p->timecount--;
		if(p->timecount==0){
			list_del(one);
			list_add_before(&ready,one);
		}
	}
	if(!list_empty(&ready)){
		list *re=&ready;
		if(now->next==re)
			now=re->next;
		else
			now=now->next;
		pcbnow=list_entry(now,PCB,plist);
		uint32_t t=(uint32_t)((void*)pcbnow+STACKSIZE);
		lcr3(PADDR(pcbnow->pgdir));
		set_tss_esp0(t);
	}
	else{
		pcbnow=&idle;
		now=&ready;
		lcr3(PADDR(kern_pgdir));
	}
}
