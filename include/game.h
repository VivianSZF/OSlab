#ifndef __GAME_H__
#define __GAME_H__


#include "include/adt/linklist.h"

typedef struct{
	int x,y,w,v;
}Plane;
Plane pl;

/* 初始化串口 */
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

/* 主循环 */
void main_loop(void);

/* 游戏逻辑相关 */
void control_plane(int);
void create_new_stone(void);
void update_stone_pos(void);
void update_bang(void);

void redraw_screen(void);

/* 随机数 */
int rand(void);
void srand(int seed);

#endif
