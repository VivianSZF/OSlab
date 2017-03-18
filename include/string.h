#ifndef __STRING_H__
#define __STRING_H__

#include "common.h"

char *itoa(int);
void memcpy(void *, const void *, size_t);
void memset(void *, int, size_t);
size_t strlen(const char *);
void strcpy(char *d, const char *s);


int	strnlen(const char *s, size_t size);

char *	strncpy(char *dst, const char *src, size_t size);
size_t	strlcpy(char *dst, const char *src, size_t size);
int	strcmp(const char *s1, const char *s2);
int	strncmp(const char *s1, const char *s2, size_t size);
char *	strchr(const char *s, char c);
char *	strfind(const char *s, char c);


/* no memcpy - use memmove instead */
void *	memmove(void *dst, const void *src, size_t len);
int	memcmp(const void *s1, const void *s2, size_t len);
void *	memfind(const void *s, int c, size_t len);

long	strtol(const char *s, char **endptr, int base);

#endif
