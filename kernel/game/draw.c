#include "game.h"
#include "string.h"
#include "video.h"
#include "stdio.h"

void
redraw_screen() {
	st_t it;
	prepare_buffer(); 

	for (it = get_st_head(); it != NULL; it = it->_next) {
		draw_bomb(it->x, it->y, it->w, 6);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,16);
	const char *score=itoa(get_score());
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
	
	const char *miss = itoa(get_miss());
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
	
	draw_string(itoa(get_fps()), 0, 0, 14);
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);

	display_buffer();
}

