#include "stdio.h"
#include "timer.h"
#include "video.h"
#include "keyboard.h"
#include "serial.h"
#include "irq.h"
#include "x86.h"
#include "assert.h"
#include "pmap.h"
#include "pcb.h"

void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
	tick++;
}
static int last_code = -1;
void keyboard_event(int code)
{
	last_code = code;
}
int sys_time(void)
{
	return tick;
}
int sys_readkey(void)
{
	int code = last_code;
	last_code = -1;
	return code;
}

int main()
{
	page_init();
	//printk("here");
	init_segment();
	pcb_init();
	//printk("here");
	init_serial();
	init_video();
	init_timer();
	init_idt();
	init_intr();
	
	//printk("here");

	set_timer_intr_handler(timer_event);
	set_keyboard_intr_handler(keyboard_event);
	//printk("here");
	pcb_new();
	//PCB* p=pcb_new();
	enable_interrupt();
	hlt();
	printk("we are here");
	//to_user(p);
	//printk("here");
	while(1);
	return 0;
}
