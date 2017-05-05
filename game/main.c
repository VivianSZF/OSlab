#include "game.h"
#include "x86.h"
#include "timer.h"
#include "assert.h"
#include "types.h"
#include "cpu.h"

extern void init_serial();
extern void init_timer();
extern void init_idt();
extern void init_intr();

void
game_init(void) {

	printf("game start!\n");
	//init_keyboard();
	//main_loop();
	if(fork()==0){
		while(1){
			printf("ping.\n");
			sleep(1);
		}
	}
	else{
		while(1){
			printf("pong.\n");
			sleep(2);
		}
	}
	exit(0);
	assert(0); /* main_loop是死循环，永远无法返回这�?*/
}
