#include "game.h"
#include "string.h"
#include "video.h"
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
		draw_character(*str ++, x, y, color);
		if (y + 8 >= SCR_WIDTH) {
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}

void
redraw_screen() {
	st_t it;
	prepare_buffer(); 

	for (it = get_st_head(); it != NULL; ) {
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
	const char *score=itoa(get_score());
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);

	display_buffer();
}

