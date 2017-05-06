#include "syscall.h"
#include "assert.h"
#include "types.h"
#include "string.h"
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
	buff[(x << 8) + (x << 6) + y] = color;
}


void sysclean(void)
{
	memset(buff, 0, sizeof(buff));
}
int syspr()
{
	return syscall(SYS_pr, buff);
}

int systime(void)
{
	return syscall(SYS_time);
}

int sysreadkey(void)
{
	return syscall(SYS_readkey);
}

int syswrite(int fd, const void*buf1, int n)
{
	return syscall(SYS_write, fd, buf1, n);
}

int fork(void)
{
	return syscall(SYS_fork);
}

int getpid(void)
{
	return syscall(SYS_getpid);
}

void exit(int suc)
{
	syscall(SYS_exit,suc);
}

void sleep(int sec)
{
	syscall(SYS_sleep,sec);
}
