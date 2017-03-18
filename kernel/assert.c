#include "stdio.h"
#include "string.h"
#include "assert.h"
#include "x86.h"

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
	va_list ap;

	if (panicstr)
		hlt();
	panicstr = fmt;

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");

	va_start(ap, fmt);
	printk("kernel panic at %s:%d: ", file, line);
	vprintk(fmt, ap);
	printk("\n");
	va_end(ap);

}

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
	va_list ap;

	va_start(ap, fmt);
	printk("kernel warning at %s:%d: ", file, line);
	vprintk(fmt, ap);
	printk("\n");
	va_end(ap);
}
