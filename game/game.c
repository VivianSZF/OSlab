#include "x86.h"
#include "game.h"
#include "string.h"
#include "timer.h"
#include "assert.h"
#include "keyboard.h"

#define HZ 100
#define FPS 30
#define CREATE_NEW_STONE 1
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
	real_fps = value;
}
int get_fps() {
	return real_fps;
}


extern void key_operation();
void main_loop(void) {
	int now = systime();
	int target;
	int num_draw = 0;
	bool redraw;

	pl.x=100;
	pl.y=150;
	pl.w=10;
	pl.v=10;
	int k=0;
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
			int code=sysreadkey();
			if(code!=-1){
				press_key(code);
			}
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

		if(k==0){        //for test
			fork();
			k=1;
			printf("%d\n",getpid());
		}
		else if(k%10==0)
		{
			sleep(1);
			k++;
		}
		else if(k%100==0)
		{
			exit(0);
		}
		else
			k++;
	}
}
