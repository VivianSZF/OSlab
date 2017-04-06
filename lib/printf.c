#include "stdarg.h"
#include "stdio.h"
#include "sysreal.h"

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
	buf[(*cnt)++] = ch;
}
int vprintf(const char *fmt, va_list ap)
{
	int cnt = 0;
	vprintfmt((void *)putch, &cnt, fmt, ap);
	return cnt;
}
int printf(const char *fmt, ...)
{
	va_list ap;
	int cnt;

	va_start(ap, fmt);
	cnt = vprintf(fmt, ap);
	va_end(ap);

	syswrite(stdout, buf, cnt);
	return cnt;
}