#ifndef JOS_INC_STDIO_H
#define JOS_INC_STDIO_H

#include "stdarg.h"

#ifndef NULL
#define NULL	((void *) 0)
#endif /* !NULL */

// kernel/serial.c
void putchar(int ch);

// lib/printfmt.c
void	printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);
void	vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list);
int	snprintf(char *str, int size, const char *fmt, ...);
int	vsnprintf(char *str, int size, const char *fmt, va_list);

// kernel/printk.c
int	printk(const char *fmt, ...);
int	vprintk(const char *fmt, va_list);



#endif /* !JOS_INC_STDIO_H */
