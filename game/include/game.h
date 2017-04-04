#ifndef __GAME_H__
#define __GAME_H__

#include "types.h"
#include "adt/linklist.h"

typedef struct{
	int x,y,w,v;
}Plane;
Plane pl;

void draw_bomb(int x,int y,int w,int color);

/* 初始化串�?*/
void init_serial();

/* 中断时调用的函数 */
void timer_event(void);
void keyboard_event(int scan_code);

/* 按键相关 */
void press_key(int scan_code);
void release_key(int ch);
bool query_key(int ch);
void key_operation(void);

/* 定义st链表 */
LINKLIST_DEF(st)
	int x,y,w,v;
LINKLIST_DEF_FI(st)

st_t get_st_head(void);
/* 主循�?*/
void main_loop(void);

/* 游戏逻辑相关 */
void control_plane(int);
void create_new_stone(void);
void update_stone_pos(void);
void update_bang(void);

void redraw_screen(void);


int get_score(void);
int get_miss(void);
int get_fps(void);

/* 随机�?*/
int rand(void);
void srand(int seed);

#endif
