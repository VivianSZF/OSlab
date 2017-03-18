#include "types.h"
#include "string.h"
#include "video.h"
#include "font.h"
#include "assert.h"

/* 绘制屏幕的帧缓冲实现�?
 * 在某些版本的qemu-kvm上，由于每次访问显存映射区域都会产生一次VM exit�?
 * 更新屏幕的速度可能非常缓慢从而引起游戏跳帧。定义宏SLOW以只重绘屏幕变化
 * 的部�?*/
#define SLOW


#ifdef SLOW
	#define PARTIAL_UPDATE
#endif


uint8_t *vmem = VMEM_ADDR;
static uint8_t vbuf[SCR_SIZE];
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void prepare_buffer(void) {
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
#endif
	vmem = vbuf;
	memset(vmem, 0, SCR_SIZE);
}

void display_buffer(void) {
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
		if (buf[i] != ref[i]) {
			mem[i] = buf[i];
		}
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}

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