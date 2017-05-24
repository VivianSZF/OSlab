#ifndef __SEMA_H__
#define __SEMA_H__

#include "list.h"

typedef struct Sema{
	char name[20];
	int value;
	int plink;
	bool bin;
	list slist;
}Sema;

Sema sema[1000];

