#ifndef __LIST_H__
#define __LIST_H__

#include "assert.h"

struct list {
	struct list *prev, *next;
};
typedef struct list list;

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
	assert(data != NULL);
	data->prev = prev;
	data->next = next;
	if (prev != NULL) prev->next = data;
	if (next != NULL) next->prev = data;
}

static inline void
list_add_before(list *one, list *data) {
	assert(one != NULL);
	list_add(one->prev, one, data);
}

static inline void
list_add_after(list *one, list *data) {
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
	assert(data != NULL);
	list *prev = data->prev;
	list *next = data->next;
	if (prev != NULL) prev->next = next;
	if (next != NULL) next->prev = prev;
}

static inline void
list_init(list *one) {
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
	assert(one != NULL);
	return one == one->next;
}

#define list_foreach(ptr, head) \
	for ((ptr) = (head)->next; (ptr) != (head); (ptr) = (ptr)->next)

#endif

