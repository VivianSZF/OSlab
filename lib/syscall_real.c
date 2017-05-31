#include "syscall.h"
#include "assert.h"
#include "types.h"
#include "string.h"
#include "video.h"
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
	buff[(x << 8) + (x << 6) + y] = color;
}


void sysclean(void)
{
	//printf("1");
	memset(buff, 0, sizeof(buff));
}
int syspr()
{
	//printf("2");
	return syscall(SYS_pr, buff);
}

int systime(void)
{
	//printf("3");
	return syscall(SYS_time);
}

int sysreadkey(void)
{
	//printf("4");
	return syscall(SYS_readkey);
}

int syswrite(int fd, const void*buf1, int n)
{
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
}

int fork(void)
{
	//printf("6");
	return syscall(SYS_fork);
}

int getpid(void)
{
	//printf("7");
	return syscall(SYS_getpid);
}

void exit(void)
{
	//printf("8");
	syscall(SYS_exit);
}

void sleep(int sec)
{
	//printf("9");	
	syscall(SYS_sleep,sec);
	//printf("qweqwe");
}

int thread(void *addr)
{
	return syscall(SYS_thread,addr);
}

int sem_init(Sema *sema,int value)
{
	return syscall(SYS_sem_init,sema,value);
}

int sem_destroy(Sema *sema)
{
	return syscall(SYS_sem_destroy,sema);
}

int sem_wait(Sema *sema)
{
	return syscall(SYS_sem_wait,sema);
}

int sem_trywait(Sema *sema)
{
	return syscall(SYS_sem_trywait,sema);
}

int sem_post(Sema *sema)
{
	return syscall(SYS_sem_post,sema);
}

int thread_join(void)
{
	return syscall(SYS_thread_join);
} 