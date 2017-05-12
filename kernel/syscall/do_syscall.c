#include "x86.h"
#include "syscall.h"

int sys_pr(void*);
int sys_readkey(void);
int sys_write(int,void*,int);
int sys_time(void);
void sys_fork(void);
uint32_t sys_getpid(void);
void sys_exit(int suc);
void sys_sleep(int time);

void do_syscall(struct TrapFrame *tf) {
	//printk("%d\n",tf->eax);
	switch(tf->eax) {
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
			break;
		case SYS_time:
			tf->eax=sys_time();
			break;
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
			break;
		case SYS_write: 
			tf->eax=sys_write(tf->ebx,(void*)tf->ecx,tf->edx); 
			break;
		case SYS_fork:
			sys_fork();
			break;
		case SYS_getpid:
			tf->eax=sys_getpid();
			break;
		case SYS_exit:
			sys_exit(tf->ebx);
			break;
		case SYS_sleep:
			sys_sleep(tf->ebx);
			break;
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
 	}
} 

