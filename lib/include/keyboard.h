#ifndef __KEYBOARD_H__
#define __KEYBOARD_H__

void press_key(int);
void process_keys(void);

void set_keyboard_intr_handler(void (*)(int));

#endif
