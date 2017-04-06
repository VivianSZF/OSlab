#include "stdio.h"
#include "timer.h"
#include "video.h"
#include "keyboard.h"
#include "serial.h"
#include "irq.h"
#include "x86.h"
#include "assert.h"


static int tick = 0;
static int last_code = -1;

void timer_event(void)
{
	tick++;
}
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

	init_serial();
	init_video();
	init_timer();
	init_idt();
	init_intr();

	set_timer_intr_handler(timer_event);
	set_keyboard_intr_handler(keyboard_event);

	//enable_interrupt();
	while(1);

	return 0;
}