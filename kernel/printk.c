#include "stdio.h"
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
	putchar(ch);
	++*cnt;
}

int vprintk(const char *fmt, va_list ap)
{
	int cnt = 0;
	vprintfmt((void*)putch, &cnt, fmt, ap);
	return cnt;
}

int printk(const char *fmt, ...)
{
	va_list ap;
	int cnt;
	va_start(ap, fmt);
	cnt = vprintk(fmt, ap);
	va_end(ap);
	return cnt;
}