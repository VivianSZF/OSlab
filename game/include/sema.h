#ifndef __SEMA_H__
#define __SEMA_H__

#include "list.h"

typedef struct Sema{
	int value;
	int link;
	list wait;
}Sema;

#endif
