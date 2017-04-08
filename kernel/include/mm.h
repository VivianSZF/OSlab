#ifndef __MM_H__
#define __MM_H__

#include "pcb.h"
#include "mmu.h"

void mm_alloc(pde_t*, uint32_t, size_t);

#endif
