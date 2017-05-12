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
extern int fork(void);
extern int getpid(void);
extern void exit(int suc);
extern void sleep(int sec); 


void
game_init(void) {

	printf("game start!\n");
	//init_keyboard();
	//main_loop();
        //fork();
	//exit(0);
	//sleep(1);
	//printf("skskkssks");
	//while(1);
	if(fork()==0){
		while(1){
			printf("ping\n");
			sleep(1);
		}
	}
	else{
		while(1){
			printf("pong\n");
			sleep(2);
			printf("qweqwe");
		}
	}
	
	exit(0);
	assert(0); /* main_loop是死循环，永远无法返回这�?*/
}
