#include "common.h"

static int key_code[] = {
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
		key_pressed[i]=FALSE;
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}

void release_key(int index) {
	assert(0 <= index && index < 4);
	key_pressed[index] = FALSE;
}

bool query_key(int index) {
	assert(0 <= index && index < 4);
	return key_pressed[index];
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}


