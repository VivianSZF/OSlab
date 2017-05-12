#include "x86.h"
#include "common.h"
#include "pcb.h"
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
	list *one,*ne;
	list *bl=&block;
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
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
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
		set_tss_esp0(t);
		lcr3(PADDR(pcbnow->pgdir));
		
	}
	else{
		pcbnow=&init;
		now=&ready;
		lcr3(PADDR(kern_pgdir));
	}
}
