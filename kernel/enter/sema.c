#include "sema.h"
#include "x86.h"
#include "common.h"
#include "list.h"
#include "pcb.h"

int ksem_init(Sema *sema,int value)
{
	//printk("%d\n",value);
	sema->value=value;
	sema->link=0;
	list_init(&sema->wait);
	return 0;
}

int ksem_destroy(Sema *sema)
{
	sema->value=-1;
	sema->link=0;
	list *one;
	list_foreach(one,&sema->wait)
	{
		list_del(one);
		list_add_before(&ready,one);	
	}
	list_del(&sema->wait);
	return 0;
}

int ksem_wait(Sema *sema)
{
	if(sema->value>0)
	{
		sema->value--;
		return 0;
	}
	else{
		sema->value--;
		list *it = now;
		list_del(it);
		schedule(0);
		list_add_before(&sema->wait,it);
	}
	return -1;
}

int ksem_trywait(Sema *sema)
{
	if(sema->value>0)
	{
		sema->value--;
		return 0;
	}
	else{
		return -1;
	}
}

int ksem_post(Sema *sema)
{
	if(list_empty(&sema->wait)){
		sema->value++;
	}
	else{
		sema->value++;
		list *one=sema->wait.next;
		list_del(one);
		list_add_before(&ready,one);
		schedule(0);
	}
}


