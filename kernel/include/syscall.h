#ifndef __SYSCALL_H__
#define __SYSCALL_H__

#include "mmu.h"

void do_syscall(struct TrapFrame*);

#define SYS_printf 1
#define SYS_time 2
#define SYS_readkey 3
#define SYS_write 4
#define SYS_fork 5
#define SYS_getpid 6
#define SYS_exit 7
#define SYS_sleep 8

#endif
