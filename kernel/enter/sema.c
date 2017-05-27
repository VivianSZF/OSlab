#include "sema.h"
#include "x86.h"
#include "common.h"

void sem_init(Sema *sema)
{
	sema->value=0;
	sema->link=0;
	sema->slist=NULL;
}

