#include "game.h"
#include "adt/linklist.h"
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)

static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
	switch(op){
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
		default:assert(0);
	}
}


int get_score(void) {
	return score;
}

int get_miss(void) {
	return miss;
}

st_t get_st_head(void){
	return head;
}

void create_new_stone(void) {
	if (head == NULL) {
		head = st_new(); 
	} else {
		st_t now = st_new();
		st_insert(NULL, head, now); 
		head = now;
	}
	head->x = 0;
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
	head->v = (rand() % 1000 / 1000.0 + 1) / 2.0;
	head->w = 2;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
		st_t next = st_next(it);
		it->x += it->v; 
		if (it->x + it->w > SCR_HEIGHT) {
			miss ++; 
			st_remove(it);
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
}


bool bang_or_not(Plane pl,st_t it){
	Stone i;
	i.x=it->x;
	i.y=it->y;
	i.w=it->w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
		st_t next=st_next(it);
		if(bang_or_not(pl,it)){
			score++;
			st_remove(it);
			if(it==head)
				head=next;
			st_free(it);
		}
		it=next;
	}

}

