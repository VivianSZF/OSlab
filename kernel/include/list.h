#ifndef __LIST_H__
#define __LIST_H__

struct list{
	struct list *pre,*next;
};

static inline void list_in(list *pre,list *next,list *one){
	one->pre=pre;
	one->next=next;
	if(pre!=NULL)
		pre->next=one;
	if(next!=NULL)
		next->pre=one;
}

static inline void list_out(list *one){
	list *pre=one->pre;
	list *next=one->next;
	if(pre!=NULL)
		pre->next=next;
	if(next!=NULL)
		next->pre=pre;
}
