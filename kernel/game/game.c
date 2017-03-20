#include "x86.h"
#include "game.h"
#include "string.h"
#include "timer.h"
#include "assert.h"

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


extern void key_operation();
void main_loop(void) {
	int now = 0,target;
	int num_draw = 0;
	bool redraw;

	pl.x=100;
	pl.y=150;
	pl.w=10;
	pl.v=10;
	
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
		
			if (now % (HZ/2) == 0) {
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
