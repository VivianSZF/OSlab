#ifndef JOS_INC_STDIO_H
#define JOS_INC_STDIO_H

#include "stdarg.h"

#ifndef NULL
#define NULL	((void *) 0)
#endif /* !NULL */


// lib/printfmt.c
void	printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);
void	vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list);
int	snprintf(char *str, int size, const char *fmt, ...);
int	vsnprintf(char *str, int size, const char *fmt, va_list);

int	printf(const char *fmt, ...);
int	vprintf(const char *fmt, va_list);



#endif /* !JOS_INC_STDIO_H */
