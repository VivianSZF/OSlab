#include "sema.h"
#include "x86.h"
#include "common.h"
#include "list.h"


int sem_init(Sema *sema,int value)
{
	sema->value=value;
	sema->link=0;
//	list_add_before(&sem_wait,&sema->slist);
	return 0;
}

int sem_destroy(Sema *sema)
{
	sema->value=-1;
	sema->link=0;
	list_del(&sema->wait);
	return 0;
}

int sem_wait(Sema *sema)
{
	if(sema->value>0)
	{
		sema->value--;
		return 0;
	}
	else{
		list_del(&pcbnow->slist);
		list_add_before(&sema->wait,&pcbnow->slist);
		schedule();
	}
	return -1;
}

int sem_trywait(Sema *sema)
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

int sem_post(Sema *sema)
{
	if(list_empty(&sema->wait)){
		sema->value++;
	}
	else{
		list *one=(sema->wait)->next;
		list_del(one);
		list_add_before(&ready,one);
	}
}


