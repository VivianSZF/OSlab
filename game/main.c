#include "game.h"
#include "irq.h"
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

	printk("game start!\n");
	enable_interrupt();
	main_loop();
	assert(0); /* main_loop是死循环，永远无法返回这�?*/
}
