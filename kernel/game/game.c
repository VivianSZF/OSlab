#include "include/x86.h"
#include "include/game.h"
#include "include/string.h"
#include "include/timer.h"
#include "include/assert.h"

#define FPS 30
#define CREATE_NEW_STONE 1
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30

volatile int tick = 0;
       
void timer_event(void) {
	tick ++;
}

static int real_fps;
void set_fps(int value) {
	real_fps = value;
}
int get_fps() {
	return real_fps;
}

/* 游戏主循环。
 * 在初始化工作结束后，main函数就跳转到主循环执行。
 * 在主循环执行期间随时会插入异步的中断。时钟中断最终调用timer_event，
 * 键盘中断最终调用keyboard_event。中断处理完成后将返回主循环原位置继续执行。
 *
 * tick是时钟中断中维护的信号，数值含义是“系统到当前时刻已经发生过的时钟中断数”
 * HZ是时钟控制器硬件每秒产生的中断数，在include/device/timer.h中定义
 * now是主循环已经正确处理的时钟中断数，即游戏已经处理到的物理时间点
 *
 * 由于qemu-kvm在访问内存映射IO区域时每次都会产生陷入，在30FPS时，
 * 对显存区域每秒会产生30*320*200/4次陷入，从而消耗过多时间导致跳帧的产生(实际FPS<30)。
 * 在CFLAGS中增加-DSLOW可以在此情况下提升FPS。如果FPS仍太小，可以尝试
 * -DTOOSLOW，此时将会采用隔行扫描的方式更新屏幕(可能会降低显示效果)。
 * 这些机制的实现在device/video.c中。
 * */
extern void key_operation();
void main_loop(void) {
	int now = 0,target;
	int num_draw = 0;
	bool redraw;

	pl.x=100;
	pl.y=160;
	pl.w=10;
	pl.v=15;
	
	while (TRUE) {
	
		key_operation();
		target = tick; 
		redraw = FALSE;
		while (now < target) { 

			if (now % (HZ / CREATE_NEW_STONE) == 0) {
				create_new_stone();
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
				update_stone_pos();
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
				update_bang();
			}
			
			if (now % (HZ / FPS) == 0) {
				redraw = TRUE;
			}
		
			if (now % (HZ / 2) == 0) {
				int now_fps = num_draw * 2 + 1;
				if (now_fps > FPS) now_fps = FPS;
				set_fps(now_fps);
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
			num_draw ++;
			redraw_screen();
		}
	}
}
