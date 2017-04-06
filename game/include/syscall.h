#ifndef __SYSCALL_H__
#define __SYSCALL_H__

int syscall(int, ...);

#define SYS_printf 1
#define SYS_time 2
#define SYS_readkey 3
#define SYS_write 4

#endif