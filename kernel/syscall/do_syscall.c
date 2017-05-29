#include "x86.h"
#include "syscall.h"
#include "sema.h"

int sys_pr(void*);
int sys_readkey(void);
int sys_write(int,void*,int);
int sys_time(void);
void sys_fork(void);
uint32_t sys_getpid(void);
void sys_exit(int suc);
void sys_sleep(int time);
int kthread(void *addr);
int ksem_init(Sema *sema,int value);
int ksem_destroy(Sema *sema);
int ksem_wait(Sema *sema);
int ksem_trywait(Sema *sema);
int ksem_post(Sema *sema);


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
		case SYS_thread:
			tf->eax=kthread((void*)tf->ebx);
			break;
		case SYS_sem_init:
			tf->eax=ksem_init((Sema*)tf->ebx,tf->ecx);
			break;
		case SYS_sem_destroy:
			tf->eax=ksem_destroy((Sema*)tf->ebx);
			break;
		case SYS_sem_wait:
			tf->eax=ksem_wait((Sema*)tf->ebx);
			break;
		case SYS_sem_trywait:
			tf->eax=ksem_trywait((Sema*)tf->ebx);
			break;
		case SYS_sem_post:
			tf->eax=ksem_post((Sema*)tf->ebx);
			break;
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
 	}
} 

