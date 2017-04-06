#ifndef __VIDEO_H__
#define __VIDEO_H__

#include "types.h"
#include "const.h"
#include "assert.h"

#define SCR_WIDTH  320
#define SCR_HEIGHT 200
#define SCR_SIZE ((SCR_WIDTH) * (SCR_HEIGHT))
#define VMEM_ADDR  ((uint8_t*)0xA0000)




int syspr();
void sysclean();
void draw_string(const char*, int, int, int);
#endif
