#ifndef __SYSCALL_H__
#define __SYSCALL_H__

#include "mmu.h"

void do_syscall(TrapFrame*);

#define SYS_printf 1
#define SYS_time 2
#define SYS_readkey 3
#define SYS_write 4
#define SYS_fork 5
#define SYS_getpid 6
#define SYS_exit 7
#define SYS_sleep 8
#define SYS_thread 9
#define SYS_sem_init 10
#define SYS_sem_destroy 11
#define SYS_sem_wait 12
#define SYS_sem_trywait 13
#define SYS_sem_post 14

#endif
