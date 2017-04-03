#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
			serial_printc(buf[i]);
		}
	}
	return n;
}