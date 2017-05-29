
game.bin:     file format elf32-i386


Disassembly of section .text:

08048000 <game_init>:
extern void exit(int suc);
extern void sleep(int sec); 


void
game_init(void) {
 8048000:	55                   	push   %ebp
 8048001:	89 e5                	mov    %esp,%ebp
 8048003:	83 ec 18             	sub    $0x18,%esp

	printf("Welcome to our game~~~ready ~~~go~~~\n");
 8048006:	c7 04 24 b8 9f 04 08 	movl   $0x8049fb8,(%esp)
 804800d:	e8 1e 11 00 00       	call   8049130 <printf>
	init_keyboard();
 8048012:	e8 35 00 00 00       	call   804804c <init_keyboard>
	main_loop();//add the syscall fork,sleep,getpid,exit in it(written in game.c)
 8048017:	e8 69 05 00 00       	call   8048585 <main_loop>
			sleep(2);
			printf("qweqwe");
		}
	}
	*/
	exit(0);
 804801c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048023:	e8 aa 0f 00 00       	call   8048fd2 <exit>
	assert(0); /* main_loop是死循环，永远无法返回这�?*/
 8048028:	c7 44 24 0c de 9f 04 	movl   $0x8049fde,0xc(%esp)
 804802f:	08 
 8048030:	c7 44 24 08 e0 9f 04 	movl   $0x8049fe0,0x8(%esp)
 8048037:	08 
 8048038:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
 804803f:	00 
 8048040:	c7 04 24 f5 9f 04 08 	movl   $0x8049ff5,(%esp)
 8048047:	e8 2a 01 00 00       	call   8048176 <_panic>

0804804c <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 804804c:	55                   	push   %ebp
 804804d:	89 e5                	mov    %esp,%ebp
 804804f:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 8048052:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048059:	eb 12                	jmp    804806d <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 804805b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804805e:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 8048065:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 8048069:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804806d:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048071:	7e e8                	jle    804805b <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 8048073:	c9                   	leave  
 8048074:	c3                   	ret    

08048075 <press_key>:

void press_key(int scan_code) {
 8048075:	55                   	push   %ebp
 8048076:	89 e5                	mov    %esp,%ebp
 8048078:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 804807b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048082:	eb 21                	jmp    80480a5 <press_key+0x30>
		if (key_code[i] == scan_code) {
 8048084:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048087:	8b 04 85 00 b0 04 08 	mov    0x804b000(,%eax,4),%eax
 804808e:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048091:	75 0e                	jne    80480a1 <press_key+0x2c>
			key_pressed[i] = TRUE;
 8048093:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048096:	c7 04 85 20 b4 04 08 	movl   $0x1,0x804b420(,%eax,4)
 804809d:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 80480a1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80480a5:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 80480a9:	7e d9                	jle    8048084 <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 80480ab:	c9                   	leave  
 80480ac:	c3                   	ret    

080480ad <release_key>:

void release_key(int index) {
 80480ad:	55                   	push   %ebp
 80480ae:	89 e5                	mov    %esp,%ebp
 80480b0:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80480b7:	78 06                	js     80480bf <release_key+0x12>
 80480b9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80480bd:	7e 24                	jle    80480e3 <release_key+0x36>
 80480bf:	c7 44 24 0c 01 a0 04 	movl   $0x804a001,0xc(%esp)
 80480c6:	08 
 80480c7:	c7 44 24 08 19 a0 04 	movl   $0x804a019,0x8(%esp)
 80480ce:	08 
 80480cf:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80480d6:	00 
 80480d7:	c7 04 24 2e a0 04 08 	movl   $0x804a02e,(%esp)
 80480de:	e8 93 00 00 00       	call   8048176 <_panic>
	key_pressed[index] = FALSE;
 80480e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80480e6:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 80480ed:	00 00 00 00 
}
 80480f1:	c9                   	leave  
 80480f2:	c3                   	ret    

080480f3 <query_key>:

bool query_key(int index) {
 80480f3:	55                   	push   %ebp
 80480f4:	89 e5                	mov    %esp,%ebp
 80480f6:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480f9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80480fd:	78 06                	js     8048105 <query_key+0x12>
 80480ff:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 8048103:	7e 24                	jle    8048129 <query_key+0x36>
 8048105:	c7 44 24 0c 01 a0 04 	movl   $0x804a001,0xc(%esp)
 804810c:	08 
 804810d:	c7 44 24 08 19 a0 04 	movl   $0x804a019,0x8(%esp)
 8048114:	08 
 8048115:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 804811c:	00 
 804811d:	c7 04 24 2e a0 04 08 	movl   $0x804a02e,(%esp)
 8048124:	e8 4d 00 00 00       	call   8048176 <_panic>
	return key_pressed[index];
 8048129:	8b 45 08             	mov    0x8(%ebp),%eax
 804812c:	8b 04 85 20 b4 04 08 	mov    0x804b420(,%eax,4),%eax
}
 8048133:	c9                   	leave  
 8048134:	c3                   	ret    

08048135 <key_operation>:

extern void control_plane(int);
void key_operation(void){
 8048135:	55                   	push   %ebp
 8048136:	89 e5                	mov    %esp,%ebp
 8048138:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 804813b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048142:	eb 2a                	jmp    804816e <key_operation+0x39>
		if(query_key(i)==TRUE){
 8048144:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048147:	89 04 24             	mov    %eax,(%esp)
 804814a:	e8 a4 ff ff ff       	call   80480f3 <query_key>
 804814f:	83 f8 01             	cmp    $0x1,%eax
 8048152:	75 16                	jne    804816a <key_operation+0x35>
			control_plane(i);
 8048154:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048157:	89 04 24             	mov    %eax,(%esp)
 804815a:	e8 54 08 00 00       	call   80489b3 <control_plane>
			release_key(i);
 804815f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048162:	89 04 24             	mov    %eax,(%esp)
 8048165:	e8 43 ff ff ff       	call   80480ad <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 804816a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804816e:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 8048172:	7e d0                	jle    8048144 <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 8048174:	c9                   	leave  
 8048175:	c3                   	ret    

08048176 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 8048176:	55                   	push   %ebp
 8048177:	89 e5                	mov    %esp,%ebp
 8048179:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 804817c:	a1 30 b4 04 08       	mov    0x804b430,%eax
 8048181:	85 c0                	test   %eax,%eax
 8048183:	74 01                	je     8048186 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 8048185:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 8048186:	8b 45 10             	mov    0x10(%ebp),%eax
 8048189:	a3 30 b4 04 08       	mov    %eax,0x804b430

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 804818e:	fa                   	cli    
 804818f:	fc                   	cld    

	va_start(ap, fmt);
 8048190:	8d 45 14             	lea    0x14(%ebp),%eax
 8048193:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 8048196:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048199:	89 44 24 08          	mov    %eax,0x8(%esp)
 804819d:	8b 45 08             	mov    0x8(%ebp),%eax
 80481a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481a4:	c7 04 24 3e a0 04 08 	movl   $0x804a03e,(%esp)
 80481ab:	e8 80 0f 00 00       	call   8049130 <printf>
	vprintf(fmt, ap);
 80481b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481b7:	8b 45 10             	mov    0x10(%ebp),%eax
 80481ba:	89 04 24             	mov    %eax,(%esp)
 80481bd:	e8 3b 0f 00 00       	call   80490fd <vprintf>
	printf("\n");
 80481c2:	c7 04 24 56 a0 04 08 	movl   $0x804a056,(%esp)
 80481c9:	e8 62 0f 00 00       	call   8049130 <printf>
	va_end(ap);

}
 80481ce:	c9                   	leave  
 80481cf:	c3                   	ret    

080481d0 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 80481d0:	55                   	push   %ebp
 80481d1:	89 e5                	mov    %esp,%ebp
 80481d3:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 80481d6:	8d 45 14             	lea    0x14(%ebp),%eax
 80481d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 80481dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481df:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80481e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481ea:	c7 04 24 58 a0 04 08 	movl   $0x804a058,(%esp)
 80481f1:	e8 3a 0f 00 00       	call   8049130 <printf>
	vprintf(fmt, ap);
 80481f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481fd:	8b 45 10             	mov    0x10(%ebp),%eax
 8048200:	89 04 24             	mov    %eax,(%esp)
 8048203:	e8 f5 0e 00 00       	call   80490fd <vprintf>
	printf("\n");
 8048208:	c7 04 24 56 a0 04 08 	movl   $0x804a056,(%esp)
 804820f:	e8 1c 0f 00 00       	call   8049130 <printf>
	va_end(ap);
}
 8048214:	c9                   	leave  
 8048215:	c3                   	ret    

08048216 <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 8048216:	55                   	push   %ebp
 8048217:	89 e5                	mov    %esp,%ebp
 8048219:	83 ec 38             	sub    $0x38,%esp
 804821c:	8b 45 08             	mov    0x8(%ebp),%eax
 804821f:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 8048222:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 8048226:	79 24                	jns    804824c <draw_character+0x36>
 8048228:	c7 44 24 0c 72 a0 04 	movl   $0x804a072,0xc(%esp)
 804822f:	08 
 8048230:	c7 44 24 08 83 a0 04 	movl   $0x804a083,0x8(%esp)
 8048237:	08 
 8048238:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 804823f:	00 
 8048240:	c7 04 24 98 a0 04 08 	movl   $0x804a098,(%esp)
 8048247:	e8 2a ff ff ff       	call   8048176 <_panic>
	char *p = font8x8_basic[(int)ch];
 804824c:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 8048250:	c1 e0 03             	shl    $0x3,%eax
 8048253:	05 20 b0 04 08       	add    $0x804b020,%eax
 8048258:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 804825b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048262:	eb 59                	jmp    80482bd <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 8048264:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804826b:	eb 46                	jmp    80482b3 <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 804826d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048270:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048273:	01 d0                	add    %edx,%eax
 8048275:	0f b6 00             	movzbl (%eax),%eax
 8048278:	0f be d0             	movsbl %al,%edx
 804827b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804827e:	89 c1                	mov    %eax,%ecx
 8048280:	d3 fa                	sar    %cl,%edx
 8048282:	89 d0                	mov    %edx,%eax
 8048284:	83 e0 01             	and    $0x1,%eax
 8048287:	85 c0                	test   %eax,%eax
 8048289:	74 24                	je     80482af <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 804828b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804828e:	8b 55 10             	mov    0x10(%ebp),%edx
 8048291:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048294:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048297:	8b 55 0c             	mov    0xc(%ebp),%edx
 804829a:	01 c2                	add    %eax,%edx
 804829c:	8b 45 14             	mov    0x14(%ebp),%eax
 804829f:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482a3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80482a7:	89 14 24             	mov    %edx,(%esp)
 80482aa:	e8 02 0c 00 00       	call   8048eb1 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 80482af:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80482b3:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 80482b7:	7e b4                	jle    804826d <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 80482b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80482bd:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 80482c1:	7e a1                	jle    8048264 <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 80482c3:	c9                   	leave  
 80482c4:	c3                   	ret    

080482c5 <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 80482c5:	55                   	push   %ebp
 80482c6:	89 e5                	mov    %esp,%ebp
 80482c8:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 80482cb:	eb 4a                	jmp    8048317 <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 80482cd:	8b 45 08             	mov    0x8(%ebp),%eax
 80482d0:	8d 50 01             	lea    0x1(%eax),%edx
 80482d3:	89 55 08             	mov    %edx,0x8(%ebp)
 80482d6:	0f b6 00             	movzbl (%eax),%eax
 80482d9:	0f be c0             	movsbl %al,%eax
 80482dc:	8b 55 14             	mov    0x14(%ebp),%edx
 80482df:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80482e3:	8b 55 10             	mov    0x10(%ebp),%edx
 80482e6:	89 54 24 08          	mov    %edx,0x8(%esp)
 80482ea:	8b 55 0c             	mov    0xc(%ebp),%edx
 80482ed:	89 54 24 04          	mov    %edx,0x4(%esp)
 80482f1:	89 04 24             	mov    %eax,(%esp)
 80482f4:	e8 1d ff ff ff       	call   8048216 <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 80482f9:	8b 45 10             	mov    0x10(%ebp),%eax
 80482fc:	83 c0 08             	add    $0x8,%eax
 80482ff:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 8048304:	7e 0d                	jle    8048313 <draw_string+0x4e>
			x += 8; y = 0;
 8048306:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 804830a:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8048311:	eb 04                	jmp    8048317 <draw_string+0x52>
		} else {
			y += 8;
 8048313:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 8048317:	8b 45 08             	mov    0x8(%ebp),%eax
 804831a:	0f b6 00             	movzbl (%eax),%eax
 804831d:	84 c0                	test   %al,%al
 804831f:	75 ac                	jne    80482cd <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 8048321:	c9                   	leave  
 8048322:	c3                   	ret    

08048323 <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 8048323:	55                   	push   %ebp
 8048324:	89 e5                	mov    %esp,%ebp
 8048326:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 8048329:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048330:	eb 3d                	jmp    804836f <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 8048332:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048339:	eb 28                	jmp    8048363 <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 804833b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804833e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048341:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048344:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048347:	8b 55 08             	mov    0x8(%ebp),%edx
 804834a:	01 c2                	add    %eax,%edx
 804834c:	8b 45 14             	mov    0x14(%ebp),%eax
 804834f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048353:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048357:	89 14 24             	mov    %edx,(%esp)
 804835a:	e8 52 0b 00 00       	call   8048eb1 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 804835f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048363:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048366:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048369:	7c d0                	jl     804833b <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 804836b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804836f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048372:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048375:	7c bb                	jl     8048332 <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 8048377:	c9                   	leave  
 8048378:	c3                   	ret    

08048379 <redraw_screen>:

void
redraw_screen() {
 8048379:	55                   	push   %ebp
 804837a:	89 e5                	mov    %esp,%ebp
 804837c:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 804837f:	e8 95 0b 00 00       	call   8048f19 <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 8048384:	e8 49 07 00 00       	call   8048ad2 <get_st_head>
 8048389:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804838c:	eb 37                	jmp    80483c5 <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 804838e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048391:	8b 48 08             	mov    0x8(%eax),%ecx
 8048394:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048397:	8b 50 04             	mov    0x4(%eax),%edx
 804839a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804839d:	8b 00                	mov    (%eax),%eax
 804839f:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 80483a6:	00 
 80483a7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483ab:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483af:	89 04 24             	mov    %eax,(%esp)
 80483b2:	e8 6c ff ff ff       	call   8048323 <draw_bomb>
		it=st_next(it);
 80483b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483ba:	89 04 24             	mov    %eax,(%esp)
 80483bd:	e8 d6 04 00 00       	call   8048898 <st_next>
 80483c2:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 80483c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80483c9:	75 c3                	jne    804838e <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 80483cb:	8b 0d 14 5c 09 08    	mov    0x8095c14,%ecx
 80483d1:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80483d7:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 80483dc:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 80483e3:	00 
 80483e4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483e8:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483ec:	89 04 24             	mov    %eax,(%esp)
 80483ef:	e8 2f ff ff ff       	call   8048323 <draw_bomb>
	const char *score=itoa(get_score());
 80483f4:	e8 c5 06 00 00       	call   8048abe <get_score>
 80483f9:	89 04 24             	mov    %eax,(%esp)
 80483fc:	e8 70 0d 00 00       	call   8049171 <itoa>
 8048401:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 8048404:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048407:	89 04 24             	mov    %eax,(%esp)
 804840a:	e8 fe 0d 00 00       	call   804920d <strlen>
 804840f:	89 c2                	mov    %eax,%edx
 8048411:	b8 00 00 00 00       	mov    $0x0,%eax
 8048416:	29 d0                	sub    %edx,%eax
 8048418:	c1 e0 03             	shl    $0x3,%eax
 804841b:	05 10 01 00 00       	add    $0x110,%eax
 8048420:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048427:	00 
 8048428:	89 44 24 08          	mov    %eax,0x8(%esp)
 804842c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048433:	00 
 8048434:	c7 04 24 a4 a0 04 08 	movl   $0x804a0a4,(%esp)
 804843b:	e8 85 fe ff ff       	call   80482c5 <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 8048440:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048443:	89 04 24             	mov    %eax,(%esp)
 8048446:	e8 c2 0d 00 00       	call   804920d <strlen>
 804844b:	89 c2                	mov    %eax,%edx
 804844d:	b8 00 00 00 00       	mov    $0x0,%eax
 8048452:	29 d0                	sub    %edx,%eax
 8048454:	c1 e0 03             	shl    $0x3,%eax
 8048457:	05 40 01 00 00       	add    $0x140,%eax
 804845c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048463:	00 
 8048464:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048468:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804846f:	00 
 8048470:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048473:	89 04 24             	mov    %eax,(%esp)
 8048476:	e8 4a fe ff ff       	call   80482c5 <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 804847b:	e8 48 06 00 00       	call   8048ac8 <get_miss>
 8048480:	89 04 24             	mov    %eax,(%esp)
 8048483:	e8 e9 0c 00 00       	call   8049171 <itoa>
 8048488:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 804848b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804848e:	89 04 24             	mov    %eax,(%esp)
 8048491:	e8 77 0d 00 00       	call   804920d <strlen>
 8048496:	89 c2                	mov    %eax,%edx
 8048498:	b8 00 00 00 00       	mov    $0x0,%eax
 804849d:	29 d0                	sub    %edx,%eax
 804849f:	c1 e0 03             	shl    $0x3,%eax
 80484a2:	05 18 01 00 00       	add    $0x118,%eax
 80484a7:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484ae:	00 
 80484af:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484b3:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484ba:	00 
 80484bb:	c7 04 24 ab a0 04 08 	movl   $0x804a0ab,(%esp)
 80484c2:	e8 fe fd ff ff       	call   80482c5 <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80484c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484ca:	89 04 24             	mov    %eax,(%esp)
 80484cd:	e8 3b 0d 00 00       	call   804920d <strlen>
 80484d2:	89 c2                	mov    %eax,%edx
 80484d4:	b8 00 00 00 00       	mov    $0x0,%eax
 80484d9:	29 d0                	sub    %edx,%eax
 80484db:	c1 e0 03             	shl    $0x3,%eax
 80484de:	05 40 01 00 00       	add    $0x140,%eax
 80484e3:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484ea:	00 
 80484eb:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484ef:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484f6:	00 
 80484f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484fa:	89 04 24             	mov    %eax,(%esp)
 80484fd:	e8 c3 fd ff ff       	call   80482c5 <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 8048502:	e8 74 00 00 00       	call   804857b <get_fps>
 8048507:	89 04 24             	mov    %eax,(%esp)
 804850a:	e8 62 0c 00 00       	call   8049171 <itoa>
 804850f:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048516:	00 
 8048517:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804851e:	00 
 804851f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048526:	00 
 8048527:	89 04 24             	mov    %eax,(%esp)
 804852a:	e8 96 fd ff ff       	call   80482c5 <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 804852f:	e8 47 00 00 00       	call   804857b <get_fps>
 8048534:	89 04 24             	mov    %eax,(%esp)
 8048537:	e8 35 0c 00 00       	call   8049171 <itoa>
 804853c:	89 04 24             	mov    %eax,(%esp)
 804853f:	e8 c9 0c 00 00       	call   804920d <strlen>
 8048544:	c1 e0 03             	shl    $0x3,%eax
 8048547:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 804854e:	00 
 804854f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048553:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804855a:	00 
 804855b:	c7 04 24 b1 a0 04 08 	movl   $0x804a0b1,(%esp)
 8048562:	e8 5e fd ff ff       	call   80482c5 <draw_string>
	syspr();
 8048567:	e8 d1 09 00 00       	call   8048f3d <syspr>
}
 804856c:	c9                   	leave  
 804856d:	c3                   	ret    

0804856e <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 804856e:	55                   	push   %ebp
 804856f:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 8048571:	8b 45 08             	mov    0x8(%ebp),%eax
 8048574:	a3 34 b4 04 08       	mov    %eax,0x804b434
}
 8048579:	5d                   	pop    %ebp
 804857a:	c3                   	ret    

0804857b <get_fps>:
int get_fps() {
 804857b:	55                   	push   %ebp
 804857c:	89 e5                	mov    %esp,%ebp
	return real_fps;
 804857e:	a1 34 b4 04 08       	mov    0x804b434,%eax
}
 8048583:	5d                   	pop    %ebp
 8048584:	c3                   	ret    

08048585 <main_loop>:


extern void key_operation();
void main_loop(void) {
 8048585:	55                   	push   %ebp
 8048586:	89 e5                	mov    %esp,%ebp
 8048588:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 804858b:	e8 c9 09 00 00       	call   8048f59 <systime>
 8048590:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 8048593:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 804859a:	c7 05 0c 5c 09 08 64 	movl   $0x64,0x8095c0c
 80485a1:	00 00 00 
	pl.y=150;
 80485a4:	c7 05 10 5c 09 08 96 	movl   $0x96,0x8095c10
 80485ab:	00 00 00 
	pl.w=10;
 80485ae:	c7 05 14 5c 09 08 0a 	movl   $0xa,0x8095c14
 80485b5:	00 00 00 
	pl.v=10;
 80485b8:	c7 05 18 5c 09 08 0a 	movl   $0xa,0x8095c18
 80485bf:	00 00 00 
	int k=0;
 80485c2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	while (TRUE) {
	
		key_operation();
 80485c9:	e8 67 fb ff ff       	call   8048135 <key_operation>
		target = systime(); 
 80485ce:	e8 86 09 00 00       	call   8048f59 <systime>
 80485d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
		redraw = FALSE;
 80485d6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 80485dd:	e9 06 01 00 00       	jmp    80486e8 <main_loop+0x163>
			int code=sysreadkey();
 80485e2:	e8 86 09 00 00       	call   8048f6d <sysreadkey>
 80485e7:	89 45 dc             	mov    %eax,-0x24(%ebp)
			if(code!=-1){
 80485ea:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
 80485ee:	74 0b                	je     80485fb <main_loop+0x76>
				press_key(code);
 80485f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
 80485f3:	89 04 24             	mov    %eax,(%esp)
 80485f6:	e8 7a fa ff ff       	call   8048075 <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 80485fb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80485fe:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 8048603:	89 c8                	mov    %ecx,%eax
 8048605:	f7 ea                	imul   %edx
 8048607:	c1 fa 05             	sar    $0x5,%edx
 804860a:	89 c8                	mov    %ecx,%eax
 804860c:	c1 f8 1f             	sar    $0x1f,%eax
 804860f:	29 c2                	sub    %eax,%edx
 8048611:	89 d0                	mov    %edx,%eax
 8048613:	6b c0 64             	imul   $0x64,%eax,%eax
 8048616:	29 c1                	sub    %eax,%ecx
 8048618:	89 c8                	mov    %ecx,%eax
 804861a:	85 c0                	test   %eax,%eax
 804861c:	75 05                	jne    8048623 <main_loop+0x9e>
				create_new_stone();
 804861e:	e8 b9 04 00 00       	call   8048adc <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 8048623:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048626:	ba 56 55 55 55       	mov    $0x55555556,%edx
 804862b:	89 c8                	mov    %ecx,%eax
 804862d:	f7 ea                	imul   %edx
 804862f:	89 c8                	mov    %ecx,%eax
 8048631:	c1 f8 1f             	sar    $0x1f,%eax
 8048634:	29 c2                	sub    %eax,%edx
 8048636:	89 d0                	mov    %edx,%eax
 8048638:	01 c0                	add    %eax,%eax
 804863a:	01 d0                	add    %edx,%eax
 804863c:	29 c1                	sub    %eax,%ecx
 804863e:	89 ca                	mov    %ecx,%edx
 8048640:	85 d2                	test   %edx,%edx
 8048642:	75 05                	jne    8048649 <main_loop+0xc4>
				update_stone_pos();
 8048644:	e8 36 05 00 00       	call   8048b7f <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 8048649:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804864c:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048651:	89 c8                	mov    %ecx,%eax
 8048653:	f7 ea                	imul   %edx
 8048655:	89 c8                	mov    %ecx,%eax
 8048657:	c1 f8 1f             	sar    $0x1f,%eax
 804865a:	29 c2                	sub    %eax,%edx
 804865c:	89 d0                	mov    %edx,%eax
 804865e:	01 c0                	add    %eax,%eax
 8048660:	01 d0                	add    %edx,%eax
 8048662:	29 c1                	sub    %eax,%ecx
 8048664:	89 ca                	mov    %ecx,%edx
 8048666:	85 d2                	test   %edx,%edx
 8048668:	75 05                	jne    804866f <main_loop+0xea>
				update_bang();
 804866a:	e8 aa 07 00 00       	call   8048e19 <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 804866f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048672:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048677:	89 c8                	mov    %ecx,%eax
 8048679:	f7 ea                	imul   %edx
 804867b:	89 c8                	mov    %ecx,%eax
 804867d:	c1 f8 1f             	sar    $0x1f,%eax
 8048680:	29 c2                	sub    %eax,%edx
 8048682:	89 d0                	mov    %edx,%eax
 8048684:	01 c0                	add    %eax,%eax
 8048686:	01 d0                	add    %edx,%eax
 8048688:	29 c1                	sub    %eax,%ecx
 804868a:	89 ca                	mov    %ecx,%edx
 804868c:	85 d2                	test   %edx,%edx
 804868e:	75 07                	jne    8048697 <main_loop+0x112>
				redraw = TRUE;
 8048690:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 8048697:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804869a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804869f:	89 c8                	mov    %ecx,%eax
 80486a1:	f7 ea                	imul   %edx
 80486a3:	c1 fa 04             	sar    $0x4,%edx
 80486a6:	89 c8                	mov    %ecx,%eax
 80486a8:	c1 f8 1f             	sar    $0x1f,%eax
 80486ab:	29 c2                	sub    %eax,%edx
 80486ad:	89 d0                	mov    %edx,%eax
 80486af:	6b c0 32             	imul   $0x32,%eax,%eax
 80486b2:	29 c1                	sub    %eax,%ecx
 80486b4:	89 c8                	mov    %ecx,%eax
 80486b6:	85 c0                	test   %eax,%eax
 80486b8:	75 2a                	jne    80486e4 <main_loop+0x15f>
				int now_fps = num_draw * 2 + 1;
 80486ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80486bd:	01 c0                	add    %eax,%eax
 80486bf:	83 c0 01             	add    $0x1,%eax
 80486c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 80486c5:	83 7d e4 1e          	cmpl   $0x1e,-0x1c(%ebp)
 80486c9:	7e 07                	jle    80486d2 <main_loop+0x14d>
 80486cb:	c7 45 e4 1e 00 00 00 	movl   $0x1e,-0x1c(%ebp)
				set_fps(now_fps);
 80486d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80486d5:	89 04 24             	mov    %eax,(%esp)
 80486d8:	e8 91 fe ff ff       	call   804856e <set_fps>
				num_draw = 0;
 80486dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 80486e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 80486e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80486eb:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 80486ee:	0f 8c ee fe ff ff    	jl     80485e2 <main_loop+0x5d>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 80486f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 80486f8:	74 09                	je     8048703 <main_loop+0x17e>
			num_draw ++;
 80486fa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 80486fe:	e8 76 fc ff ff       	call   8048379 <redraw_screen>
		}

		if(k==0){        //for test
 8048703:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 8048707:	75 23                	jne    804872c <main_loop+0x1a7>
			fork();
 8048709:	e8 9c 08 00 00       	call   8048faa <fork>
			k=1;
 804870e:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
			printf("%d\n",getpid());
 8048715:	e8 a4 08 00 00       	call   8048fbe <getpid>
 804871a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804871e:	c7 04 24 b5 a0 04 08 	movl   $0x804a0b5,(%esp)
 8048725:	e8 06 0a 00 00       	call   8049130 <printf>
 804872a:	eb 73                	jmp    804879f <main_loop+0x21a>
		}
		else if(k%10==0)
 804872c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 804872f:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8048734:	89 c8                	mov    %ecx,%eax
 8048736:	f7 ea                	imul   %edx
 8048738:	c1 fa 02             	sar    $0x2,%edx
 804873b:	89 c8                	mov    %ecx,%eax
 804873d:	c1 f8 1f             	sar    $0x1f,%eax
 8048740:	29 c2                	sub    %eax,%edx
 8048742:	89 d0                	mov    %edx,%eax
 8048744:	c1 e0 02             	shl    $0x2,%eax
 8048747:	01 d0                	add    %edx,%eax
 8048749:	01 c0                	add    %eax,%eax
 804874b:	29 c1                	sub    %eax,%ecx
 804874d:	89 ca                	mov    %ecx,%edx
 804874f:	85 d2                	test   %edx,%edx
 8048751:	75 12                	jne    8048765 <main_loop+0x1e0>
		{
			sleep(1);
 8048753:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804875a:	e8 8e 08 00 00       	call   8048fed <sleep>
			k++;
 804875f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 8048763:	eb 3a                	jmp    804879f <main_loop+0x21a>
		}
		else if(k%100==0)
 8048765:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048768:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804876d:	89 c8                	mov    %ecx,%eax
 804876f:	f7 ea                	imul   %edx
 8048771:	c1 fa 05             	sar    $0x5,%edx
 8048774:	89 c8                	mov    %ecx,%eax
 8048776:	c1 f8 1f             	sar    $0x1f,%eax
 8048779:	29 c2                	sub    %eax,%edx
 804877b:	89 d0                	mov    %edx,%eax
 804877d:	6b c0 64             	imul   $0x64,%eax,%eax
 8048780:	29 c1                	sub    %eax,%ecx
 8048782:	89 c8                	mov    %ecx,%eax
 8048784:	85 c0                	test   %eax,%eax
 8048786:	75 0e                	jne    8048796 <main_loop+0x211>
		{
			exit(0);
 8048788:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804878f:	e8 3e 08 00 00       	call   8048fd2 <exit>
 8048794:	eb 09                	jmp    804879f <main_loop+0x21a>
		}
		else
			k++;
 8048796:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
	}
 804879a:	e9 2a fe ff ff       	jmp    80485c9 <main_loop+0x44>
 804879f:	e9 25 fe ff ff       	jmp    80485c9 <main_loop+0x44>

080487a4 <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 80487a4:	55                   	push   %ebp
 80487a5:	89 e5                	mov    %esp,%ebp
 80487a7:	83 ec 28             	sub    $0x28,%esp
 80487aa:	a1 d8 5d 08 08       	mov    0x8085dd8,%eax
 80487af:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80487b2:	c7 45 ec 40 b4 04 08 	movl   $0x804b440,-0x14(%ebp)
 80487b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80487bd:	75 47                	jne    8048806 <st_new+0x62>
 80487bf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 80487c6:	eb 2f                	jmp    80487f7 <st_new+0x53>
 80487c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80487cb:	89 d0                	mov    %edx,%eax
 80487cd:	01 c0                	add    %eax,%eax
 80487cf:	01 d0                	add    %edx,%eax
 80487d1:	c1 e0 03             	shl    $0x3,%eax
 80487d4:	8d 50 e8             	lea    -0x18(%eax),%edx
 80487d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80487da:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80487dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80487e0:	89 d0                	mov    %edx,%eax
 80487e2:	01 c0                	add    %eax,%eax
 80487e4:	01 d0                	add    %edx,%eax
 80487e6:	c1 e0 03             	shl    $0x3,%eax
 80487e9:	89 c2                	mov    %eax,%edx
 80487eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80487ee:	01 d0                	add    %edx,%eax
 80487f0:	89 41 14             	mov    %eax,0x14(%ecx)
 80487f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80487f7:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 80487fe:	7e c8                	jle    80487c8 <st_new+0x24>
 8048800:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048803:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048806:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048809:	8b 40 14             	mov    0x14(%eax),%eax
 804880c:	85 c0                	test   %eax,%eax
 804880e:	75 24                	jne    8048834 <st_new+0x90>
 8048810:	c7 44 24 0c b9 a0 04 	movl   $0x804a0b9,0xc(%esp)
 8048817:	08 
 8048818:	c7 44 24 08 d2 a0 04 	movl   $0x804a0d2,0x8(%esp)
 804881f:	08 
 8048820:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048827:	00 
 8048828:	c7 04 24 e7 a0 04 08 	movl   $0x804a0e7,(%esp)
 804882f:	e8 42 f9 ff ff       	call   8048176 <_panic>
 8048834:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048837:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804883a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804883d:	8b 40 14             	mov    0x14(%eax),%eax
 8048840:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048845:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048848:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 804884f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048852:	8b 50 14             	mov    0x14(%eax),%edx
 8048855:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048858:	89 50 10             	mov    %edx,0x10(%eax)
 804885b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804885e:	c9                   	leave  
 804885f:	c3                   	ret    

08048860 <st_prev>:
 8048860:	55                   	push   %ebp
 8048861:	89 e5                	mov    %esp,%ebp
 8048863:	83 ec 18             	sub    $0x18,%esp
 8048866:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804886a:	75 24                	jne    8048890 <st_prev+0x30>
 804886c:	c7 44 24 0c f5 a0 04 	movl   $0x804a0f5,0xc(%esp)
 8048873:	08 
 8048874:	c7 44 24 08 d2 a0 04 	movl   $0x804a0d2,0x8(%esp)
 804887b:	08 
 804887c:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048883:	00 
 8048884:	c7 04 24 e7 a0 04 08 	movl   $0x804a0e7,(%esp)
 804888b:	e8 e6 f8 ff ff       	call   8048176 <_panic>
 8048890:	8b 45 08             	mov    0x8(%ebp),%eax
 8048893:	8b 40 10             	mov    0x10(%eax),%eax
 8048896:	c9                   	leave  
 8048897:	c3                   	ret    

08048898 <st_next>:
 8048898:	55                   	push   %ebp
 8048899:	89 e5                	mov    %esp,%ebp
 804889b:	83 ec 18             	sub    $0x18,%esp
 804889e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80488a2:	75 24                	jne    80488c8 <st_next+0x30>
 80488a4:	c7 44 24 0c f5 a0 04 	movl   $0x804a0f5,0xc(%esp)
 80488ab:	08 
 80488ac:	c7 44 24 08 d2 a0 04 	movl   $0x804a0d2,0x8(%esp)
 80488b3:	08 
 80488b4:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488bb:	00 
 80488bc:	c7 04 24 e7 a0 04 08 	movl   $0x804a0e7,(%esp)
 80488c3:	e8 ae f8 ff ff       	call   8048176 <_panic>
 80488c8:	8b 45 08             	mov    0x8(%ebp),%eax
 80488cb:	8b 40 14             	mov    0x14(%eax),%eax
 80488ce:	c9                   	leave  
 80488cf:	c3                   	ret    

080488d0 <st_insert>:
 80488d0:	55                   	push   %ebp
 80488d1:	89 e5                	mov    %esp,%ebp
 80488d3:	83 ec 18             	sub    $0x18,%esp
 80488d6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80488da:	75 2a                	jne    8048906 <st_insert+0x36>
 80488dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80488e0:	75 24                	jne    8048906 <st_insert+0x36>
 80488e2:	c7 44 24 0c 02 a1 04 	movl   $0x804a102,0xc(%esp)
 80488e9:	08 
 80488ea:	c7 44 24 08 d2 a0 04 	movl   $0x804a0d2,0x8(%esp)
 80488f1:	08 
 80488f2:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488f9:	00 
 80488fa:	c7 04 24 e7 a0 04 08 	movl   $0x804a0e7,(%esp)
 8048901:	e8 70 f8 ff ff       	call   8048176 <_panic>
 8048906:	8b 45 10             	mov    0x10(%ebp),%eax
 8048909:	8b 55 08             	mov    0x8(%ebp),%edx
 804890c:	89 50 10             	mov    %edx,0x10(%eax)
 804890f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048912:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048915:	89 50 14             	mov    %edx,0x14(%eax)
 8048918:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804891c:	74 09                	je     8048927 <st_insert+0x57>
 804891e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048921:	8b 55 10             	mov    0x10(%ebp),%edx
 8048924:	89 50 14             	mov    %edx,0x14(%eax)
 8048927:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804892b:	74 09                	je     8048936 <st_insert+0x66>
 804892d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048930:	8b 55 10             	mov    0x10(%ebp),%edx
 8048933:	89 50 10             	mov    %edx,0x10(%eax)
 8048936:	c9                   	leave  
 8048937:	c3                   	ret    

08048938 <st_remove>:
 8048938:	55                   	push   %ebp
 8048939:	89 e5                	mov    %esp,%ebp
 804893b:	83 ec 28             	sub    $0x28,%esp
 804893e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048941:	8b 40 10             	mov    0x10(%eax),%eax
 8048944:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048947:	8b 45 08             	mov    0x8(%ebp),%eax
 804894a:	8b 40 14             	mov    0x14(%eax),%eax
 804894d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048950:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048954:	75 24                	jne    804897a <st_remove+0x42>
 8048956:	c7 44 24 0c f5 a0 04 	movl   $0x804a0f5,0xc(%esp)
 804895d:	08 
 804895e:	c7 44 24 08 d2 a0 04 	movl   $0x804a0d2,0x8(%esp)
 8048965:	08 
 8048966:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804896d:	00 
 804896e:	c7 04 24 e7 a0 04 08 	movl   $0x804a0e7,(%esp)
 8048975:	e8 fc f7 ff ff       	call   8048176 <_panic>
 804897a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804897e:	74 09                	je     8048989 <st_remove+0x51>
 8048980:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048983:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048986:	89 50 14             	mov    %edx,0x14(%eax)
 8048989:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804898d:	74 09                	je     8048998 <st_remove+0x60>
 804898f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048992:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048995:	89 50 10             	mov    %edx,0x10(%eax)
 8048998:	c9                   	leave  
 8048999:	c3                   	ret    

0804899a <st_free>:
 804899a:	55                   	push   %ebp
 804899b:	89 e5                	mov    %esp,%ebp
 804899d:	8b 15 d8 5d 08 08    	mov    0x8085dd8,%edx
 80489a3:	8b 45 08             	mov    0x8(%ebp),%eax
 80489a6:	89 50 14             	mov    %edx,0x14(%eax)
 80489a9:	8b 45 08             	mov    0x8(%ebp),%eax
 80489ac:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 80489b1:	5d                   	pop    %ebp
 80489b2:	c3                   	ret    

080489b3 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 80489b3:	55                   	push   %ebp
 80489b4:	89 e5                	mov    %esp,%ebp
 80489b6:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 80489b9:	8b 45 08             	mov    0x8(%ebp),%eax
 80489bc:	83 f8 01             	cmp    $0x1,%eax
 80489bf:	74 4e                	je     8048a0f <control_plane+0x5c>
 80489c1:	83 f8 01             	cmp    $0x1,%eax
 80489c4:	7f 09                	jg     80489cf <control_plane+0x1c>
 80489c6:	85 c0                	test   %eax,%eax
 80489c8:	74 18                	je     80489e2 <control_plane+0x2f>
 80489ca:	e9 c9 00 00 00       	jmp    8048a98 <control_plane+0xe5>
 80489cf:	83 f8 02             	cmp    $0x2,%eax
 80489d2:	74 6c                	je     8048a40 <control_plane+0x8d>
 80489d4:	83 f8 03             	cmp    $0x3,%eax
 80489d7:	0f 84 8a 00 00 00    	je     8048a67 <control_plane+0xb4>
 80489dd:	e9 b6 00 00 00       	jmp    8048a98 <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 80489e2:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 80489e8:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489ed:	39 c2                	cmp    %eax,%edx
 80489ef:	7c 19                	jl     8048a0a <control_plane+0x57>
 80489f1:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 80489f7:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489fc:	29 c2                	sub    %eax,%edx
 80489fe:	89 d0                	mov    %edx,%eax
 8048a00:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 8048a05:	e9 b2 00 00 00       	jmp    8048abc <control_plane+0x109>
 8048a0a:	e9 ad 00 00 00       	jmp    8048abc <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048a0f:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048a15:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048a1a:	01 c2                	add    %eax,%edx
 8048a1c:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048a21:	01 d0                	add    %edx,%eax
 8048a23:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048a28:	7f 14                	jg     8048a3e <control_plane+0x8b>
 8048a2a:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048a30:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048a35:	01 d0                	add    %edx,%eax
 8048a37:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 8048a3c:	eb 7e                	jmp    8048abc <control_plane+0x109>
 8048a3e:	eb 7c                	jmp    8048abc <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 8048a40:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 8048a46:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048a4b:	39 c2                	cmp    %eax,%edx
 8048a4d:	7c 16                	jl     8048a65 <control_plane+0xb2>
 8048a4f:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 8048a55:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048a5a:	29 c2                	sub    %eax,%edx
 8048a5c:	89 d0                	mov    %edx,%eax
 8048a5e:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 8048a63:	eb 57                	jmp    8048abc <control_plane+0x109>
 8048a65:	eb 55                	jmp    8048abc <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 8048a67:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 8048a6d:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048a72:	01 c2                	add    %eax,%edx
 8048a74:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048a79:	01 d0                	add    %edx,%eax
 8048a7b:	3d 40 01 00 00       	cmp    $0x140,%eax
 8048a80:	7f 14                	jg     8048a96 <control_plane+0xe3>
 8048a82:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 8048a88:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048a8d:	01 d0                	add    %edx,%eax
 8048a8f:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 8048a94:	eb 26                	jmp    8048abc <control_plane+0x109>
 8048a96:	eb 24                	jmp    8048abc <control_plane+0x109>
		default:assert(0);
 8048a98:	c7 44 24 0c 1f a1 04 	movl   $0x804a11f,0xc(%esp)
 8048a9f:	08 
 8048aa0:	c7 44 24 08 d2 a0 04 	movl   $0x804a0d2,0x8(%esp)
 8048aa7:	08 
 8048aa8:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048aaf:	00 
 8048ab0:	c7 04 24 e7 a0 04 08 	movl   $0x804a0e7,(%esp)
 8048ab7:	e8 ba f6 ff ff       	call   8048176 <_panic>
	}
}
 8048abc:	c9                   	leave  
 8048abd:	c3                   	ret    

08048abe <get_score>:


int get_score(void) {
 8048abe:	55                   	push   %ebp
 8048abf:	89 e5                	mov    %esp,%ebp
	return score;
 8048ac1:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
}
 8048ac6:	5d                   	pop    %ebp
 8048ac7:	c3                   	ret    

08048ac8 <get_miss>:

int get_miss(void) {
 8048ac8:	55                   	push   %ebp
 8048ac9:	89 e5                	mov    %esp,%ebp
	return miss;
 8048acb:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
}
 8048ad0:	5d                   	pop    %ebp
 8048ad1:	c3                   	ret    

08048ad2 <get_st_head>:

st_t get_st_head(void){
 8048ad2:	55                   	push   %ebp
 8048ad3:	89 e5                	mov    %esp,%ebp
	return head;
 8048ad5:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
}
 8048ada:	5d                   	pop    %ebp
 8048adb:	c3                   	ret    

08048adc <create_new_stone>:

void create_new_stone(void) {
 8048adc:	55                   	push   %ebp
 8048add:	89 e5                	mov    %esp,%ebp
 8048adf:	53                   	push   %ebx
 8048ae0:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048ae3:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ae8:	85 c0                	test   %eax,%eax
 8048aea:	75 0c                	jne    8048af8 <create_new_stone+0x1c>
		head = st_new(); 
 8048aec:	e8 b3 fc ff ff       	call   80487a4 <st_new>
 8048af1:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
 8048af6:	eb 2c                	jmp    8048b24 <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048af8:	e8 a7 fc ff ff       	call   80487a4 <st_new>
 8048afd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048b00:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b05:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048b08:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048b10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048b17:	e8 b4 fd ff ff       	call   80488d0 <st_insert>
		head = now;
 8048b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b1f:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
	}
	head->x = 0;
 8048b24:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b29:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048b2f:	8b 1d dc 5d 08 08    	mov    0x8085ddc,%ebx
 8048b35:	e8 c9 11 00 00       	call   8049d03 <rand>
 8048b3a:	89 c1                	mov    %eax,%ecx
 8048b3c:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048b41:	89 c8                	mov    %ecx,%eax
 8048b43:	f7 ea                	imul   %edx
 8048b45:	c1 fa 04             	sar    $0x4,%edx
 8048b48:	89 c8                	mov    %ecx,%eax
 8048b4a:	c1 f8 1f             	sar    $0x1f,%eax
 8048b4d:	29 c2                	sub    %eax,%edx
 8048b4f:	89 d0                	mov    %edx,%eax
 8048b51:	6b c0 26             	imul   $0x26,%eax,%eax
 8048b54:	29 c1                	sub    %eax,%ecx
 8048b56:	89 c8                	mov    %ecx,%eax
 8048b58:	83 c0 01             	add    $0x1,%eax
 8048b5b:	c1 e0 03             	shl    $0x3,%eax
 8048b5e:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048b61:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b66:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048b6d:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b72:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048b79:	83 c4 24             	add    $0x24,%esp
 8048b7c:	5b                   	pop    %ebx
 8048b7d:	5d                   	pop    %ebp
 8048b7e:	c3                   	ret    

08048b7f <update_stone_pos>:

void update_stone_pos(void) {
 8048b7f:	55                   	push   %ebp
 8048b80:	89 e5                	mov    %esp,%ebp
 8048b82:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048b85:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048b8d:	eb 6f                	jmp    8048bfe <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b92:	89 04 24             	mov    %eax,(%esp)
 8048b95:	e8 fe fc ff ff       	call   8048898 <st_next>
 8048b9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ba0:	8b 10                	mov    (%eax),%edx
 8048ba2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ba5:	8b 40 0c             	mov    0xc(%eax),%eax
 8048ba8:	01 c2                	add    %eax,%edx
 8048baa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bad:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bb2:	8b 10                	mov    (%eax),%edx
 8048bb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bb7:	8b 40 08             	mov    0x8(%eax),%eax
 8048bba:	01 d0                	add    %edx,%eax
 8048bbc:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048bc1:	7e 35                	jle    8048bf8 <update_stone_pos+0x79>
			miss++; 
 8048bc3:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
 8048bc8:	83 c0 01             	add    $0x1,%eax
 8048bcb:	a3 e4 5d 08 08       	mov    %eax,0x8085de4
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bd3:	89 04 24             	mov    %eax,(%esp)
 8048bd6:	e8 5d fd ff ff       	call   8048938 <st_remove>
			if (it == head) head = next; 
 8048bdb:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048be0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048be3:	75 08                	jne    8048bed <update_stone_pos+0x6e>
 8048be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048be8:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bf0:	89 04 24             	mov    %eax,(%esp)
 8048bf3:	e8 a2 fd ff ff       	call   804899a <st_free>
		}
		it = next;
 8048bf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048bfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048bfe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048c02:	75 8b                	jne    8048b8f <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048c04:	c9                   	leave  
 8048c05:	c3                   	ret    

08048c06 <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048c06:	55                   	push   %ebp
 8048c07:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048c09:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c0c:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048c0f:	7f 29                	jg     8048c3a <inplane+0x34>
 8048c11:	8b 55 10             	mov    0x10(%ebp),%edx
 8048c14:	8b 45 18             	mov    0x18(%ebp),%eax
 8048c17:	01 d0                	add    %edx,%eax
 8048c19:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048c1c:	7c 1c                	jl     8048c3a <inplane+0x34>
 8048c1e:	8b 45 14             	mov    0x14(%ebp),%eax
 8048c21:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048c24:	7f 14                	jg     8048c3a <inplane+0x34>
 8048c26:	8b 55 14             	mov    0x14(%ebp),%edx
 8048c29:	8b 45 18             	mov    0x18(%ebp),%eax
 8048c2c:	01 d0                	add    %edx,%eax
 8048c2e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048c31:	7c 07                	jl     8048c3a <inplane+0x34>
 8048c33:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c38:	eb 05                	jmp    8048c3f <inplane+0x39>
 8048c3a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048c3f:	5d                   	pop    %ebp
 8048c40:	c3                   	ret    

08048c41 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048c41:	55                   	push   %ebp
 8048c42:	89 e5                	mov    %esp,%ebp
 8048c44:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048c47:	8b 45 18             	mov    0x18(%ebp),%eax
 8048c4a:	8b 00                	mov    (%eax),%eax
 8048c4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048c4f:	8b 45 18             	mov    0x18(%ebp),%eax
 8048c52:	8b 40 04             	mov    0x4(%eax),%eax
 8048c55:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048c58:	8b 45 18             	mov    0x18(%ebp),%eax
 8048c5b:	8b 40 08             	mov    0x8(%eax),%eax
 8048c5e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048c61:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c64:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048c67:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048c6d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c70:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048c73:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c76:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c79:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048c7c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048c80:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048c83:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048c87:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048c8a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048c8e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048c92:	89 04 24             	mov    %eax,(%esp)
 8048c95:	e8 6c ff ff ff       	call   8048c06 <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048c9a:	85 c0                	test   %eax,%eax
 8048c9c:	0f 85 69 01 00 00    	jne    8048e0b <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048ca2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ca5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048ca8:	8b 55 10             	mov    0x10(%ebp),%edx
 8048cab:	01 d1                	add    %edx,%ecx
 8048cad:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048cb0:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048cb4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048cb7:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048cbb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048cbe:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048cc2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cc6:	89 0c 24             	mov    %ecx,(%esp)
 8048cc9:	e8 38 ff ff ff       	call   8048c06 <inplane>
 8048cce:	85 c0                	test   %eax,%eax
 8048cd0:	0f 85 35 01 00 00    	jne    8048e0b <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048cd6:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048cd9:	8b 45 10             	mov    0x10(%ebp),%eax
 8048cdc:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048cdf:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ce2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048ce5:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048ce9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048cec:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048cf0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048cf3:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048cf7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048cfb:	89 04 24             	mov    %eax,(%esp)
 8048cfe:	e8 03 ff ff ff       	call   8048c06 <inplane>
 8048d03:	85 c0                	test   %eax,%eax
 8048d05:	0f 85 00 01 00 00    	jne    8048e0b <bang_or_not+0x1ca>
 8048d0b:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048d0e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d11:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d14:	8b 55 08             	mov    0x8(%ebp),%edx
 8048d17:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d1a:	01 c2                	add    %eax,%edx
 8048d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d1f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d23:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d26:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048d2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d2d:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048d31:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d35:	89 14 24             	mov    %edx,(%esp)
 8048d38:	e8 c9 fe ff ff       	call   8048c06 <inplane>
 8048d3d:	85 c0                	test   %eax,%eax
 8048d3f:	0f 85 c6 00 00 00    	jne    8048e0b <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048d45:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d4b:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048d4e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048d52:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048d55:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048d59:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048d5c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048d60:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048d64:	89 04 24             	mov    %eax,(%esp)
 8048d67:	e8 9a fe ff ff       	call   8048c06 <inplane>
 8048d6c:	85 c0                	test   %eax,%eax
 8048d6e:	0f 85 97 00 00 00    	jne    8048e0b <bang_or_not+0x1ca>
 8048d74:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d77:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048d7a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048d7d:	01 d1                	add    %edx,%ecx
 8048d7f:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048d82:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048d86:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048d89:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048d8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048d90:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048d94:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048d98:	89 0c 24             	mov    %ecx,(%esp)
 8048d9b:	e8 66 fe ff ff       	call   8048c06 <inplane>
 8048da0:	85 c0                	test   %eax,%eax
 8048da2:	75 67                	jne    8048e0b <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048da4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048da7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048daa:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048dad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048db0:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048db3:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048db7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048dba:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048dbe:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048dc1:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048dc5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048dc9:	89 04 24             	mov    %eax,(%esp)
 8048dcc:	e8 35 fe ff ff       	call   8048c06 <inplane>
 8048dd1:	85 c0                	test   %eax,%eax
 8048dd3:	75 36                	jne    8048e0b <bang_or_not+0x1ca>
 8048dd5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048dd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ddb:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048dde:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048de1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048de4:	01 c2                	add    %eax,%edx
 8048de6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048de9:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048ded:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048df0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048df7:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048dfb:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048dff:	89 14 24             	mov    %edx,(%esp)
 8048e02:	e8 ff fd ff ff       	call   8048c06 <inplane>
 8048e07:	85 c0                	test   %eax,%eax
 8048e09:	74 07                	je     8048e12 <bang_or_not+0x1d1>
 8048e0b:	b8 01 00 00 00       	mov    $0x1,%eax
 8048e10:	eb 05                	jmp    8048e17 <bang_or_not+0x1d6>
 8048e12:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048e17:	c9                   	leave  
 8048e18:	c3                   	ret    

08048e19 <update_bang>:

void update_bang(void) {
 8048e19:	55                   	push   %ebp
 8048e1a:	89 e5                	mov    %esp,%ebp
 8048e1c:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048e1f:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048e24:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e27:	eb 7c                	jmp    8048ea5 <update_bang+0x8c>
		st_t next=st_next(it);
 8048e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e2c:	89 04 24             	mov    %eax,(%esp)
 8048e2f:	e8 64 fa ff ff       	call   8048898 <st_next>
 8048e34:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048e37:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e3a:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048e3e:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 8048e43:	89 04 24             	mov    %eax,(%esp)
 8048e46:	a1 10 5c 09 08       	mov    0x8095c10,%eax
 8048e4b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048e4f:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048e54:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048e58:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048e5d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048e61:	e8 db fd ff ff       	call   8048c41 <bang_or_not>
 8048e66:	85 c0                	test   %eax,%eax
 8048e68:	74 35                	je     8048e9f <update_bang+0x86>
			score++;
 8048e6a:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
 8048e6f:	83 c0 01             	add    $0x1,%eax
 8048e72:	a3 e0 5d 08 08       	mov    %eax,0x8085de0
			st_remove(it);
 8048e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e7a:	89 04 24             	mov    %eax,(%esp)
 8048e7d:	e8 b6 fa ff ff       	call   8048938 <st_remove>
			if(it==head)
 8048e82:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048e87:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048e8a:	75 08                	jne    8048e94 <update_bang+0x7b>
				head=next;
 8048e8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e8f:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e97:	89 04 24             	mov    %eax,(%esp)
 8048e9a:	e8 fb fa ff ff       	call   804899a <st_free>
		}
		it=next;
 8048e9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ea2:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048ea5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048ea9:	0f 85 7a ff ff ff    	jne    8048e29 <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8048eaf:	c9                   	leave  
 8048eb0:	c3                   	ret    

08048eb1 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8048eb1:	55                   	push   %ebp
 8048eb2:	89 e5                	mov    %esp,%ebp
 8048eb4:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8048eb7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048ebb:	78 18                	js     8048ed5 <draw_pixel+0x24>
 8048ebd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048ec1:	78 12                	js     8048ed5 <draw_pixel+0x24>
 8048ec3:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 8048eca:	7f 09                	jg     8048ed5 <draw_pixel+0x24>
 8048ecc:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8048ed3:	7e 24                	jle    8048ef9 <draw_pixel+0x48>
 8048ed5:	c7 44 24 0c 24 a1 04 	movl   $0x804a124,0xc(%esp)
 8048edc:	08 
 8048edd:	c7 44 24 08 58 a1 04 	movl   $0x804a158,0x8(%esp)
 8048ee4:	08 
 8048ee5:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
 8048eec:	00 
 8048eed:	c7 04 24 6d a1 04 08 	movl   $0x804a16d,(%esp)
 8048ef4:	e8 7d f2 ff ff       	call   8048176 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 8048ef9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048efc:	c1 e0 08             	shl    $0x8,%eax
 8048eff:	89 c2                	mov    %eax,%edx
 8048f01:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f04:	c1 e0 06             	shl    $0x6,%eax
 8048f07:	01 c2                	add    %eax,%edx
 8048f09:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f0c:	01 c2                	add    %eax,%edx
 8048f0e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048f11:	88 82 00 5e 08 08    	mov    %al,0x8085e00(%edx)
}
 8048f17:	c9                   	leave  
 8048f18:	c3                   	ret    

08048f19 <sysclean>:


void sysclean(void)
{
 8048f19:	55                   	push   %ebp
 8048f1a:	89 e5                	mov    %esp,%ebp
 8048f1c:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
 8048f1f:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 8048f26:	00 
 8048f27:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048f2e:	00 
 8048f2f:	c7 04 24 00 5e 08 08 	movl   $0x8085e00,(%esp)
 8048f36:	e8 b9 02 00 00       	call   80491f4 <memset>
}
 8048f3b:	c9                   	leave  
 8048f3c:	c3                   	ret    

08048f3d <syspr>:
int syspr()
{
 8048f3d:	55                   	push   %ebp
 8048f3e:	89 e5                	mov    %esp,%ebp
 8048f40:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
 8048f43:	c7 44 24 04 00 5e 08 	movl   $0x8085e00,0x4(%esp)
 8048f4a:	08 
 8048f4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048f52:	e8 53 01 00 00       	call   80490aa <syscall>
}
 8048f57:	c9                   	leave  
 8048f58:	c3                   	ret    

08048f59 <systime>:

int systime(void)
{
 8048f59:	55                   	push   %ebp
 8048f5a:	89 e5                	mov    %esp,%ebp
 8048f5c:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
 8048f5f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048f66:	e8 3f 01 00 00       	call   80490aa <syscall>
}
 8048f6b:	c9                   	leave  
 8048f6c:	c3                   	ret    

08048f6d <sysreadkey>:

int sysreadkey(void)
{
 8048f6d:	55                   	push   %ebp
 8048f6e:	89 e5                	mov    %esp,%ebp
 8048f70:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
 8048f73:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048f7a:	e8 2b 01 00 00       	call   80490aa <syscall>
}
 8048f7f:	c9                   	leave  
 8048f80:	c3                   	ret    

08048f81 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8048f81:	55                   	push   %ebp
 8048f82:	89 e5                	mov    %esp,%ebp
 8048f84:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
 8048f87:	8b 45 10             	mov    0x10(%ebp),%eax
 8048f8a:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f8e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f91:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f95:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f98:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f9c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048fa3:	e8 02 01 00 00       	call   80490aa <syscall>
}
 8048fa8:	c9                   	leave  
 8048fa9:	c3                   	ret    

08048faa <fork>:

int fork(void)
{
 8048faa:	55                   	push   %ebp
 8048fab:	89 e5                	mov    %esp,%ebp
 8048fad:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
 8048fb0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 8048fb7:	e8 ee 00 00 00       	call   80490aa <syscall>
}
 8048fbc:	c9                   	leave  
 8048fbd:	c3                   	ret    

08048fbe <getpid>:

int getpid(void)
{
 8048fbe:	55                   	push   %ebp
 8048fbf:	89 e5                	mov    %esp,%ebp
 8048fc1:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
 8048fc4:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
 8048fcb:	e8 da 00 00 00       	call   80490aa <syscall>
}
 8048fd0:	c9                   	leave  
 8048fd1:	c3                   	ret    

08048fd2 <exit>:

void exit(int suc)
{
 8048fd2:	55                   	push   %ebp
 8048fd3:	89 e5                	mov    %esp,%ebp
 8048fd5:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
 8048fd8:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fdb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fdf:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 8048fe6:	e8 bf 00 00 00       	call   80490aa <syscall>
}
 8048feb:	c9                   	leave  
 8048fec:	c3                   	ret    

08048fed <sleep>:

void sleep(int sec)
{
 8048fed:	55                   	push   %ebp
 8048fee:	89 e5                	mov    %esp,%ebp
 8048ff0:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
 8048ff3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ff6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ffa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049001:	e8 a4 00 00 00       	call   80490aa <syscall>
	//printf("qweqwe");
}
 8049006:	c9                   	leave  
 8049007:	c3                   	ret    

08049008 <thread>:

int thread(void *addr)
{
 8049008:	55                   	push   %ebp
 8049009:	89 e5                	mov    %esp,%ebp
 804900b:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
 804900e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049011:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049015:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 804901c:	e8 89 00 00 00       	call   80490aa <syscall>
}
 8049021:	c9                   	leave  
 8049022:	c3                   	ret    

08049023 <sem_init>:

int sem_init(Sema* sema)
{
 8049023:	55                   	push   %ebp
 8049024:	89 e5                	mov    %esp,%ebp
 8049026:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema);
 8049029:	8b 45 08             	mov    0x8(%ebp),%eax
 804902c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049030:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 8049037:	e8 6e 00 00 00       	call   80490aa <syscall>
}
 804903c:	c9                   	leave  
 804903d:	c3                   	ret    

0804903e <sem_destroy>:

int sem_destroy(Sema* sema)
{
 804903e:	55                   	push   %ebp
 804903f:	89 e5                	mov    %esp,%ebp
 8049041:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
 8049044:	8b 45 08             	mov    0x8(%ebp),%eax
 8049047:	89 44 24 04          	mov    %eax,0x4(%esp)
 804904b:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 8049052:	e8 53 00 00 00       	call   80490aa <syscall>
}
 8049057:	c9                   	leave  
 8049058:	c3                   	ret    

08049059 <sem_wait>:

int sem_wait(Sema* sema)
{
 8049059:	55                   	push   %ebp
 804905a:	89 e5                	mov    %esp,%ebp
 804905c:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
 804905f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049062:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049066:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 804906d:	e8 38 00 00 00       	call   80490aa <syscall>
}
 8049072:	c9                   	leave  
 8049073:	c3                   	ret    

08049074 <sem_trywait>:

int sem_trywait(Sema *sema)
{
 8049074:	55                   	push   %ebp
 8049075:	89 e5                	mov    %esp,%ebp
 8049077:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
 804907a:	8b 45 08             	mov    0x8(%ebp),%eax
 804907d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049081:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 8049088:	e8 1d 00 00 00       	call   80490aa <syscall>
}
 804908d:	c9                   	leave  
 804908e:	c3                   	ret    

0804908f <sem_post>:

int sem_post(Sema *sema)
{
 804908f:	55                   	push   %ebp
 8049090:	89 e5                	mov    %esp,%ebp
 8049092:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
 8049095:	8b 45 08             	mov    0x8(%ebp),%eax
 8049098:	89 44 24 04          	mov    %eax,0x4(%esp)
 804909c:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 80490a3:	e8 02 00 00 00       	call   80490aa <syscall>
}
 80490a8:	c9                   	leave  
 80490a9:	c3                   	ret    

080490aa <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 80490aa:	55                   	push   %ebp
 80490ab:	89 e5                	mov    %esp,%ebp
 80490ad:	53                   	push   %ebx
 80490ae:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 80490b1:	8d 45 08             	lea    0x8(%ebp),%eax
 80490b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 80490b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80490ba:	8b 00                	mov    (%eax),%eax
 80490bc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80490bf:	83 c2 04             	add    $0x4,%edx
 80490c2:	8b 1a                	mov    (%edx),%ebx
 80490c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80490c7:	83 c2 08             	add    $0x8,%edx
 80490ca:	8b 0a                	mov    (%edx),%ecx
 80490cc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80490cf:	83 c2 0c             	add    $0xc,%edx
 80490d2:	8b 12                	mov    (%edx),%edx
 80490d4:	cd 80                	int    $0x80
 80490d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 80490d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80490dc:	83 c4 10             	add    $0x10,%esp
 80490df:	5b                   	pop    %ebx
 80490e0:	5d                   	pop    %ebp
 80490e1:	c3                   	ret    

080490e2 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 80490e2:	55                   	push   %ebp
 80490e3:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 80490e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490e8:	8b 00                	mov    (%eax),%eax
 80490ea:	8d 48 01             	lea    0x1(%eax),%ecx
 80490ed:	8b 55 0c             	mov    0xc(%ebp),%edx
 80490f0:	89 0a                	mov    %ecx,(%edx)
 80490f2:	8b 55 08             	mov    0x8(%ebp),%edx
 80490f5:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 80490fb:	5d                   	pop    %ebp
 80490fc:	c3                   	ret    

080490fd <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 80490fd:	55                   	push   %ebp
 80490fe:	89 e5                	mov    %esp,%ebp
 8049100:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 8049103:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 804910a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804910d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049111:	8b 45 08             	mov    0x8(%ebp),%eax
 8049114:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049118:	8d 45 f4             	lea    -0xc(%ebp),%eax
 804911b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804911f:	c7 04 24 e2 90 04 08 	movl   $0x80490e2,(%esp)
 8049126:	e8 d1 06 00 00       	call   80497fc <vprintfmt>
	return cnt;
 804912b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804912e:	c9                   	leave  
 804912f:	c3                   	ret    

08049130 <printf>:
int printf(const char *fmt, ...)
{
 8049130:	55                   	push   %ebp
 8049131:	89 e5                	mov    %esp,%ebp
 8049133:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8049136:	8d 45 0c             	lea    0xc(%ebp),%eax
 8049139:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 804913c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804913f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049143:	8b 45 08             	mov    0x8(%ebp),%eax
 8049146:	89 04 24             	mov    %eax,(%esp)
 8049149:	e8 af ff ff ff       	call   80490fd <vprintf>
 804914e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 8049151:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049154:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049158:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 804915f:	08 
 8049160:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049167:	e8 15 fe ff ff       	call   8048f81 <syswrite>
	return cnt;
 804916c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804916f:	c9                   	leave  
 8049170:	c3                   	ret    

08049171 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 8049171:	55                   	push   %ebp
 8049172:	89 e5                	mov    %esp,%ebp
 8049174:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 8049177:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 804917e:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049182:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049185:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804918a:	89 c8                	mov    %ecx,%eax
 804918c:	f7 ea                	imul   %edx
 804918e:	c1 fa 02             	sar    $0x2,%edx
 8049191:	89 c8                	mov    %ecx,%eax
 8049193:	c1 f8 1f             	sar    $0x1f,%eax
 8049196:	29 c2                	sub    %eax,%edx
 8049198:	89 d0                	mov    %edx,%eax
 804919a:	c1 e0 02             	shl    $0x2,%eax
 804919d:	01 d0                	add    %edx,%eax
 804919f:	01 c0                	add    %eax,%eax
 80491a1:	29 c1                	sub    %eax,%ecx
 80491a3:	89 ca                	mov    %ecx,%edx
 80491a5:	89 d0                	mov    %edx,%eax
 80491a7:	83 c0 30             	add    $0x30,%eax
 80491aa:	89 c2                	mov    %eax,%edx
 80491ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80491af:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 80491b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80491b4:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80491b9:	89 c8                	mov    %ecx,%eax
 80491bb:	f7 ea                	imul   %edx
 80491bd:	c1 fa 02             	sar    $0x2,%edx
 80491c0:	89 c8                	mov    %ecx,%eax
 80491c2:	c1 f8 1f             	sar    $0x1f,%eax
 80491c5:	29 c2                	sub    %eax,%edx
 80491c7:	89 d0                	mov    %edx,%eax
 80491c9:	89 45 08             	mov    %eax,0x8(%ebp)
 80491cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80491d0:	75 ac                	jne    804917e <itoa+0xd>
	return p;
 80491d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80491d5:	c9                   	leave  
 80491d6:	c3                   	ret    

080491d7 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 80491d7:	55                   	push   %ebp
 80491d8:	89 e5                	mov    %esp,%ebp
 80491da:	57                   	push   %edi
 80491db:	56                   	push   %esi
 80491dc:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 80491dd:	8b 45 10             	mov    0x10(%ebp),%eax
 80491e0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80491e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80491e6:	89 c1                	mov    %eax,%ecx
 80491e8:	89 d6                	mov    %edx,%esi
 80491ea:	89 df                	mov    %ebx,%edi
 80491ec:	fc                   	cld    
 80491ed:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 80491ef:	5b                   	pop    %ebx
 80491f0:	5e                   	pop    %esi
 80491f1:	5f                   	pop    %edi
 80491f2:	5d                   	pop    %ebp
 80491f3:	c3                   	ret    

080491f4 <memset>:

void memset(void *dest, int data, size_t size) {
 80491f4:	55                   	push   %ebp
 80491f5:	89 e5                	mov    %esp,%ebp
 80491f7:	57                   	push   %edi
 80491f8:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 80491f9:	8b 55 10             	mov    0x10(%ebp),%edx
 80491fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049202:	89 d1                	mov    %edx,%ecx
 8049204:	89 df                	mov    %ebx,%edi
 8049206:	fc                   	cld    
 8049207:	f3 aa                	rep stos %al,%es:(%edi)
}
 8049209:	5b                   	pop    %ebx
 804920a:	5f                   	pop    %edi
 804920b:	5d                   	pop    %ebp
 804920c:	c3                   	ret    

0804920d <strlen>:

size_t strlen(const char *str) {
 804920d:	55                   	push   %ebp
 804920e:	89 e5                	mov    %esp,%ebp
 8049210:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 8049213:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 804921a:	eb 04                	jmp    8049220 <strlen+0x13>
 804921c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049220:	8b 45 08             	mov    0x8(%ebp),%eax
 8049223:	8d 50 01             	lea    0x1(%eax),%edx
 8049226:	89 55 08             	mov    %edx,0x8(%ebp)
 8049229:	0f b6 00             	movzbl (%eax),%eax
 804922c:	84 c0                	test   %al,%al
 804922e:	75 ec                	jne    804921c <strlen+0xf>
	return len;
 8049230:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049233:	c9                   	leave  
 8049234:	c3                   	ret    

08049235 <strcpy>:

void strcpy(char *d, const char *s) {
 8049235:	55                   	push   %ebp
 8049236:	89 e5                	mov    %esp,%ebp
 8049238:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 804923b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804923e:	89 04 24             	mov    %eax,(%esp)
 8049241:	e8 c7 ff ff ff       	call   804920d <strlen>
 8049246:	83 c0 01             	add    $0x1,%eax
 8049249:	89 44 24 08          	mov    %eax,0x8(%esp)
 804924d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049250:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049254:	8b 45 08             	mov    0x8(%ebp),%eax
 8049257:	89 04 24             	mov    %eax,(%esp)
 804925a:	e8 78 ff ff ff       	call   80491d7 <memcpy>
}
 804925f:	c9                   	leave  
 8049260:	c3                   	ret    

08049261 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 8049261:	55                   	push   %ebp
 8049262:	89 e5                	mov    %esp,%ebp
 8049264:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049267:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804926e:	eb 0c                	jmp    804927c <strnlen+0x1b>
		n++;
 8049270:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049274:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049278:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 804927c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049280:	74 0a                	je     804928c <strnlen+0x2b>
 8049282:	8b 45 08             	mov    0x8(%ebp),%eax
 8049285:	0f b6 00             	movzbl (%eax),%eax
 8049288:	84 c0                	test   %al,%al
 804928a:	75 e4                	jne    8049270 <strnlen+0xf>
		n++;
	return n;
 804928c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 804928f:	c9                   	leave  
 8049290:	c3                   	ret    

08049291 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 8049291:	55                   	push   %ebp
 8049292:	89 e5                	mov    %esp,%ebp
 8049294:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 8049297:	8b 45 08             	mov    0x8(%ebp),%eax
 804929a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 804929d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80492a4:	eb 23                	jmp    80492c9 <strncpy+0x38>
		*dst++ = *src;
 80492a6:	8b 45 08             	mov    0x8(%ebp),%eax
 80492a9:	8d 50 01             	lea    0x1(%eax),%edx
 80492ac:	89 55 08             	mov    %edx,0x8(%ebp)
 80492af:	8b 55 0c             	mov    0xc(%ebp),%edx
 80492b2:	0f b6 12             	movzbl (%edx),%edx
 80492b5:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 80492b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492ba:	0f b6 00             	movzbl (%eax),%eax
 80492bd:	84 c0                	test   %al,%al
 80492bf:	74 04                	je     80492c5 <strncpy+0x34>
			src++;
 80492c1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 80492c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80492c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492cc:	3b 45 10             	cmp    0x10(%ebp),%eax
 80492cf:	72 d5                	jb     80492a6 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 80492d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80492d4:	c9                   	leave  
 80492d5:	c3                   	ret    

080492d6 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 80492d6:	55                   	push   %ebp
 80492d7:	89 e5                	mov    %esp,%ebp
 80492d9:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 80492dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80492df:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 80492e2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80492e6:	74 33                	je     804931b <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 80492e8:	eb 17                	jmp    8049301 <strlcpy+0x2b>
			*dst++ = *src++;
 80492ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80492ed:	8d 50 01             	lea    0x1(%eax),%edx
 80492f0:	89 55 08             	mov    %edx,0x8(%ebp)
 80492f3:	8b 55 0c             	mov    0xc(%ebp),%edx
 80492f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 80492f9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80492fc:	0f b6 12             	movzbl (%edx),%edx
 80492ff:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 8049301:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049305:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049309:	74 0a                	je     8049315 <strlcpy+0x3f>
 804930b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804930e:	0f b6 00             	movzbl (%eax),%eax
 8049311:	84 c0                	test   %al,%al
 8049313:	75 d5                	jne    80492ea <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 8049315:	8b 45 08             	mov    0x8(%ebp),%eax
 8049318:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 804931b:	8b 55 08             	mov    0x8(%ebp),%edx
 804931e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049321:	29 c2                	sub    %eax,%edx
 8049323:	89 d0                	mov    %edx,%eax
}
 8049325:	c9                   	leave  
 8049326:	c3                   	ret    

08049327 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 8049327:	55                   	push   %ebp
 8049328:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 804932a:	eb 08                	jmp    8049334 <strcmp+0xd>
		p++, q++;
 804932c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049330:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 8049334:	8b 45 08             	mov    0x8(%ebp),%eax
 8049337:	0f b6 00             	movzbl (%eax),%eax
 804933a:	84 c0                	test   %al,%al
 804933c:	74 10                	je     804934e <strcmp+0x27>
 804933e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049341:	0f b6 10             	movzbl (%eax),%edx
 8049344:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049347:	0f b6 00             	movzbl (%eax),%eax
 804934a:	38 c2                	cmp    %al,%dl
 804934c:	74 de                	je     804932c <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 804934e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049351:	0f b6 00             	movzbl (%eax),%eax
 8049354:	0f b6 d0             	movzbl %al,%edx
 8049357:	8b 45 0c             	mov    0xc(%ebp),%eax
 804935a:	0f b6 00             	movzbl (%eax),%eax
 804935d:	0f b6 c0             	movzbl %al,%eax
 8049360:	29 c2                	sub    %eax,%edx
 8049362:	89 d0                	mov    %edx,%eax
}
 8049364:	5d                   	pop    %ebp
 8049365:	c3                   	ret    

08049366 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 8049366:	55                   	push   %ebp
 8049367:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 8049369:	eb 0c                	jmp    8049377 <strncmp+0x11>
		n--, p++, q++;
 804936b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 804936f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049373:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 8049377:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804937b:	74 1a                	je     8049397 <strncmp+0x31>
 804937d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049380:	0f b6 00             	movzbl (%eax),%eax
 8049383:	84 c0                	test   %al,%al
 8049385:	74 10                	je     8049397 <strncmp+0x31>
 8049387:	8b 45 08             	mov    0x8(%ebp),%eax
 804938a:	0f b6 10             	movzbl (%eax),%edx
 804938d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049390:	0f b6 00             	movzbl (%eax),%eax
 8049393:	38 c2                	cmp    %al,%dl
 8049395:	74 d4                	je     804936b <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 8049397:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804939b:	75 07                	jne    80493a4 <strncmp+0x3e>
		return 0;
 804939d:	b8 00 00 00 00       	mov    $0x0,%eax
 80493a2:	eb 16                	jmp    80493ba <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 80493a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80493a7:	0f b6 00             	movzbl (%eax),%eax
 80493aa:	0f b6 d0             	movzbl %al,%edx
 80493ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493b0:	0f b6 00             	movzbl (%eax),%eax
 80493b3:	0f b6 c0             	movzbl %al,%eax
 80493b6:	29 c2                	sub    %eax,%edx
 80493b8:	89 d0                	mov    %edx,%eax
}
 80493ba:	5d                   	pop    %ebp
 80493bb:	c3                   	ret    

080493bc <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 80493bc:	55                   	push   %ebp
 80493bd:	89 e5                	mov    %esp,%ebp
 80493bf:	83 ec 04             	sub    $0x4,%esp
 80493c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493c5:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80493c8:	eb 14                	jmp    80493de <strchr+0x22>
		if (*s == c)
 80493ca:	8b 45 08             	mov    0x8(%ebp),%eax
 80493cd:	0f b6 00             	movzbl (%eax),%eax
 80493d0:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80493d3:	75 05                	jne    80493da <strchr+0x1e>
			return (char *) s;
 80493d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80493d8:	eb 13                	jmp    80493ed <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 80493da:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80493de:	8b 45 08             	mov    0x8(%ebp),%eax
 80493e1:	0f b6 00             	movzbl (%eax),%eax
 80493e4:	84 c0                	test   %al,%al
 80493e6:	75 e2                	jne    80493ca <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 80493e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80493ed:	c9                   	leave  
 80493ee:	c3                   	ret    

080493ef <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 80493ef:	55                   	push   %ebp
 80493f0:	89 e5                	mov    %esp,%ebp
 80493f2:	83 ec 04             	sub    $0x4,%esp
 80493f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493f8:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80493fb:	eb 11                	jmp    804940e <strfind+0x1f>
		if (*s == c)
 80493fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049400:	0f b6 00             	movzbl (%eax),%eax
 8049403:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049406:	75 02                	jne    804940a <strfind+0x1b>
			break;
 8049408:	eb 0e                	jmp    8049418 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 804940a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804940e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049411:	0f b6 00             	movzbl (%eax),%eax
 8049414:	84 c0                	test   %al,%al
 8049416:	75 e5                	jne    80493fd <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 8049418:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804941b:	c9                   	leave  
 804941c:	c3                   	ret    

0804941d <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 804941d:	55                   	push   %ebp
 804941e:	89 e5                	mov    %esp,%ebp
 8049420:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 8049423:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049426:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 8049429:	8b 45 08             	mov    0x8(%ebp),%eax
 804942c:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 804942f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049432:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049435:	73 3d                	jae    8049474 <memmove+0x57>
 8049437:	8b 45 10             	mov    0x10(%ebp),%eax
 804943a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804943d:	01 d0                	add    %edx,%eax
 804943f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049442:	76 30                	jbe    8049474 <memmove+0x57>
		s += n;
 8049444:	8b 45 10             	mov    0x10(%ebp),%eax
 8049447:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 804944a:	8b 45 10             	mov    0x10(%ebp),%eax
 804944d:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 8049450:	eb 13                	jmp    8049465 <memmove+0x48>
			*--d = *--s;
 8049452:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 8049456:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 804945a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804945d:	0f b6 10             	movzbl (%eax),%edx
 8049460:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049463:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 8049465:	8b 45 10             	mov    0x10(%ebp),%eax
 8049468:	8d 50 ff             	lea    -0x1(%eax),%edx
 804946b:	89 55 10             	mov    %edx,0x10(%ebp)
 804946e:	85 c0                	test   %eax,%eax
 8049470:	75 e0                	jne    8049452 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 8049472:	eb 26                	jmp    804949a <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049474:	eb 17                	jmp    804948d <memmove+0x70>
			*d++ = *s++;
 8049476:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049479:	8d 50 01             	lea    0x1(%eax),%edx
 804947c:	89 55 f8             	mov    %edx,-0x8(%ebp)
 804947f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049482:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049485:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 8049488:	0f b6 12             	movzbl (%edx),%edx
 804948b:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 804948d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049490:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049493:	89 55 10             	mov    %edx,0x10(%ebp)
 8049496:	85 c0                	test   %eax,%eax
 8049498:	75 dc                	jne    8049476 <memmove+0x59>
			*d++ = *s++;

	return dst;
 804949a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804949d:	c9                   	leave  
 804949e:	c3                   	ret    

0804949f <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 804949f:	55                   	push   %ebp
 80494a0:	89 e5                	mov    %esp,%ebp
 80494a2:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 80494a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80494a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 80494ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494ae:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 80494b1:	eb 30                	jmp    80494e3 <memcmp+0x44>
		if (*s1 != *s2)
 80494b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80494b6:	0f b6 10             	movzbl (%eax),%edx
 80494b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80494bc:	0f b6 00             	movzbl (%eax),%eax
 80494bf:	38 c2                	cmp    %al,%dl
 80494c1:	74 18                	je     80494db <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 80494c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80494c6:	0f b6 00             	movzbl (%eax),%eax
 80494c9:	0f b6 d0             	movzbl %al,%edx
 80494cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80494cf:	0f b6 00             	movzbl (%eax),%eax
 80494d2:	0f b6 c0             	movzbl %al,%eax
 80494d5:	29 c2                	sub    %eax,%edx
 80494d7:	89 d0                	mov    %edx,%eax
 80494d9:	eb 1a                	jmp    80494f5 <memcmp+0x56>
		s1++, s2++;
 80494db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80494df:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 80494e3:	8b 45 10             	mov    0x10(%ebp),%eax
 80494e6:	8d 50 ff             	lea    -0x1(%eax),%edx
 80494e9:	89 55 10             	mov    %edx,0x10(%ebp)
 80494ec:	85 c0                	test   %eax,%eax
 80494ee:	75 c3                	jne    80494b3 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 80494f0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80494f5:	c9                   	leave  
 80494f6:	c3                   	ret    

080494f7 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 80494f7:	55                   	push   %ebp
 80494f8:	89 e5                	mov    %esp,%ebp
 80494fa:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 80494fd:	8b 45 10             	mov    0x10(%ebp),%eax
 8049500:	8b 55 08             	mov    0x8(%ebp),%edx
 8049503:	01 d0                	add    %edx,%eax
 8049505:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 8049508:	eb 13                	jmp    804951d <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 804950a:	8b 45 08             	mov    0x8(%ebp),%eax
 804950d:	0f b6 10             	movzbl (%eax),%edx
 8049510:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049513:	38 c2                	cmp    %al,%dl
 8049515:	75 02                	jne    8049519 <memfind+0x22>
			break;
 8049517:	eb 0c                	jmp    8049525 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 8049519:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804951d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049520:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8049523:	72 e5                	jb     804950a <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 8049525:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049528:	c9                   	leave  
 8049529:	c3                   	ret    

0804952a <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 804952a:	55                   	push   %ebp
 804952b:	89 e5                	mov    %esp,%ebp
 804952d:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 8049530:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 8049537:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 804953e:	eb 04                	jmp    8049544 <strtol+0x1a>
		s++;
 8049540:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049544:	8b 45 08             	mov    0x8(%ebp),%eax
 8049547:	0f b6 00             	movzbl (%eax),%eax
 804954a:	3c 20                	cmp    $0x20,%al
 804954c:	74 f2                	je     8049540 <strtol+0x16>
 804954e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049551:	0f b6 00             	movzbl (%eax),%eax
 8049554:	3c 09                	cmp    $0x9,%al
 8049556:	74 e8                	je     8049540 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 8049558:	8b 45 08             	mov    0x8(%ebp),%eax
 804955b:	0f b6 00             	movzbl (%eax),%eax
 804955e:	3c 2b                	cmp    $0x2b,%al
 8049560:	75 06                	jne    8049568 <strtol+0x3e>
		s++;
 8049562:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049566:	eb 15                	jmp    804957d <strtol+0x53>
	else if (*s == '-')
 8049568:	8b 45 08             	mov    0x8(%ebp),%eax
 804956b:	0f b6 00             	movzbl (%eax),%eax
 804956e:	3c 2d                	cmp    $0x2d,%al
 8049570:	75 0b                	jne    804957d <strtol+0x53>
		s++, neg = 1;
 8049572:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049576:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 804957d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049581:	74 06                	je     8049589 <strtol+0x5f>
 8049583:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 8049587:	75 24                	jne    80495ad <strtol+0x83>
 8049589:	8b 45 08             	mov    0x8(%ebp),%eax
 804958c:	0f b6 00             	movzbl (%eax),%eax
 804958f:	3c 30                	cmp    $0x30,%al
 8049591:	75 1a                	jne    80495ad <strtol+0x83>
 8049593:	8b 45 08             	mov    0x8(%ebp),%eax
 8049596:	83 c0 01             	add    $0x1,%eax
 8049599:	0f b6 00             	movzbl (%eax),%eax
 804959c:	3c 78                	cmp    $0x78,%al
 804959e:	75 0d                	jne    80495ad <strtol+0x83>
		s += 2, base = 16;
 80495a0:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 80495a4:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 80495ab:	eb 2a                	jmp    80495d7 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 80495ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80495b1:	75 17                	jne    80495ca <strtol+0xa0>
 80495b3:	8b 45 08             	mov    0x8(%ebp),%eax
 80495b6:	0f b6 00             	movzbl (%eax),%eax
 80495b9:	3c 30                	cmp    $0x30,%al
 80495bb:	75 0d                	jne    80495ca <strtol+0xa0>
		s++, base = 8;
 80495bd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80495c1:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 80495c8:	eb 0d                	jmp    80495d7 <strtol+0xad>
	else if (base == 0)
 80495ca:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80495ce:	75 07                	jne    80495d7 <strtol+0xad>
		base = 10;
 80495d0:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 80495d7:	8b 45 08             	mov    0x8(%ebp),%eax
 80495da:	0f b6 00             	movzbl (%eax),%eax
 80495dd:	3c 2f                	cmp    $0x2f,%al
 80495df:	7e 1b                	jle    80495fc <strtol+0xd2>
 80495e1:	8b 45 08             	mov    0x8(%ebp),%eax
 80495e4:	0f b6 00             	movzbl (%eax),%eax
 80495e7:	3c 39                	cmp    $0x39,%al
 80495e9:	7f 11                	jg     80495fc <strtol+0xd2>
			dig = *s - '0';
 80495eb:	8b 45 08             	mov    0x8(%ebp),%eax
 80495ee:	0f b6 00             	movzbl (%eax),%eax
 80495f1:	0f be c0             	movsbl %al,%eax
 80495f4:	83 e8 30             	sub    $0x30,%eax
 80495f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80495fa:	eb 48                	jmp    8049644 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 80495fc:	8b 45 08             	mov    0x8(%ebp),%eax
 80495ff:	0f b6 00             	movzbl (%eax),%eax
 8049602:	3c 60                	cmp    $0x60,%al
 8049604:	7e 1b                	jle    8049621 <strtol+0xf7>
 8049606:	8b 45 08             	mov    0x8(%ebp),%eax
 8049609:	0f b6 00             	movzbl (%eax),%eax
 804960c:	3c 7a                	cmp    $0x7a,%al
 804960e:	7f 11                	jg     8049621 <strtol+0xf7>
			dig = *s - 'a' + 10;
 8049610:	8b 45 08             	mov    0x8(%ebp),%eax
 8049613:	0f b6 00             	movzbl (%eax),%eax
 8049616:	0f be c0             	movsbl %al,%eax
 8049619:	83 e8 57             	sub    $0x57,%eax
 804961c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804961f:	eb 23                	jmp    8049644 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 8049621:	8b 45 08             	mov    0x8(%ebp),%eax
 8049624:	0f b6 00             	movzbl (%eax),%eax
 8049627:	3c 40                	cmp    $0x40,%al
 8049629:	7e 3d                	jle    8049668 <strtol+0x13e>
 804962b:	8b 45 08             	mov    0x8(%ebp),%eax
 804962e:	0f b6 00             	movzbl (%eax),%eax
 8049631:	3c 5a                	cmp    $0x5a,%al
 8049633:	7f 33                	jg     8049668 <strtol+0x13e>
			dig = *s - 'A' + 10;
 8049635:	8b 45 08             	mov    0x8(%ebp),%eax
 8049638:	0f b6 00             	movzbl (%eax),%eax
 804963b:	0f be c0             	movsbl %al,%eax
 804963e:	83 e8 37             	sub    $0x37,%eax
 8049641:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 8049644:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049647:	3b 45 10             	cmp    0x10(%ebp),%eax
 804964a:	7c 02                	jl     804964e <strtol+0x124>
			break;
 804964c:	eb 1a                	jmp    8049668 <strtol+0x13e>
		s++, val = (val * base) + dig;
 804964e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049652:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049655:	0f af 45 10          	imul   0x10(%ebp),%eax
 8049659:	89 c2                	mov    %eax,%edx
 804965b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804965e:	01 d0                	add    %edx,%eax
 8049660:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 8049663:	e9 6f ff ff ff       	jmp    80495d7 <strtol+0xad>

	if (endptr)
 8049668:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804966c:	74 08                	je     8049676 <strtol+0x14c>
		*endptr = (char *) s;
 804966e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049671:	8b 55 08             	mov    0x8(%ebp),%edx
 8049674:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 8049676:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 804967a:	74 07                	je     8049683 <strtol+0x159>
 804967c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804967f:	f7 d8                	neg    %eax
 8049681:	eb 03                	jmp    8049686 <strtol+0x15c>
 8049683:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 8049686:	c9                   	leave  
 8049687:	c3                   	ret    

08049688 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 8049688:	55                   	push   %ebp
 8049689:	89 e5                	mov    %esp,%ebp
 804968b:	53                   	push   %ebx
 804968c:	83 ec 34             	sub    $0x34,%esp
 804968f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049692:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049695:	8b 45 14             	mov    0x14(%ebp),%eax
 8049698:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 804969b:	8b 45 18             	mov    0x18(%ebp),%eax
 804969e:	ba 00 00 00 00       	mov    $0x0,%edx
 80496a3:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80496a6:	77 72                	ja     804971a <printnum+0x92>
 80496a8:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80496ab:	72 05                	jb     80496b2 <printnum+0x2a>
 80496ad:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 80496b0:	77 68                	ja     804971a <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 80496b2:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80496b5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 80496b8:	8b 45 18             	mov    0x18(%ebp),%eax
 80496bb:	ba 00 00 00 00       	mov    $0x0,%edx
 80496c0:	89 44 24 08          	mov    %eax,0x8(%esp)
 80496c4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80496c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80496cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80496ce:	89 04 24             	mov    %eax,(%esp)
 80496d1:	89 54 24 04          	mov    %edx,0x4(%esp)
 80496d5:	e8 56 06 00 00       	call   8049d30 <__udivdi3>
 80496da:	8b 4d 20             	mov    0x20(%ebp),%ecx
 80496dd:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 80496e1:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 80496e5:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80496e8:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 80496ec:	89 44 24 08          	mov    %eax,0x8(%esp)
 80496f0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80496f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80496fb:	8b 45 08             	mov    0x8(%ebp),%eax
 80496fe:	89 04 24             	mov    %eax,(%esp)
 8049701:	e8 82 ff ff ff       	call   8049688 <printnum>
 8049706:	eb 1c                	jmp    8049724 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 8049708:	8b 45 0c             	mov    0xc(%ebp),%eax
 804970b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804970f:	8b 45 20             	mov    0x20(%ebp),%eax
 8049712:	89 04 24             	mov    %eax,(%esp)
 8049715:	8b 45 08             	mov    0x8(%ebp),%eax
 8049718:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 804971a:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 804971e:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 8049722:	7f e4                	jg     8049708 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 8049724:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049727:	bb 00 00 00 00       	mov    $0x0,%ebx
 804972c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804972f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049732:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049736:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804973a:	89 04 24             	mov    %eax,(%esp)
 804973d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049741:	e8 1a 07 00 00       	call   8049e60 <__umoddi3>
 8049746:	05 08 a2 04 08       	add    $0x804a208,%eax
 804974b:	0f b6 00             	movzbl (%eax),%eax
 804974e:	0f be c0             	movsbl %al,%eax
 8049751:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049754:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049758:	89 04 24             	mov    %eax,(%esp)
 804975b:	8b 45 08             	mov    0x8(%ebp),%eax
 804975e:	ff d0                	call   *%eax
}
 8049760:	83 c4 34             	add    $0x34,%esp
 8049763:	5b                   	pop    %ebx
 8049764:	5d                   	pop    %ebp
 8049765:	c3                   	ret    

08049766 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 8049766:	55                   	push   %ebp
 8049767:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 8049769:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 804976d:	7e 14                	jle    8049783 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 804976f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049772:	8b 00                	mov    (%eax),%eax
 8049774:	8d 48 08             	lea    0x8(%eax),%ecx
 8049777:	8b 55 08             	mov    0x8(%ebp),%edx
 804977a:	89 0a                	mov    %ecx,(%edx)
 804977c:	8b 50 04             	mov    0x4(%eax),%edx
 804977f:	8b 00                	mov    (%eax),%eax
 8049781:	eb 30                	jmp    80497b3 <getuint+0x4d>
	else if (lflag)
 8049783:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049787:	74 16                	je     804979f <getuint+0x39>
		return va_arg(*ap, unsigned long);
 8049789:	8b 45 08             	mov    0x8(%ebp),%eax
 804978c:	8b 00                	mov    (%eax),%eax
 804978e:	8d 48 04             	lea    0x4(%eax),%ecx
 8049791:	8b 55 08             	mov    0x8(%ebp),%edx
 8049794:	89 0a                	mov    %ecx,(%edx)
 8049796:	8b 00                	mov    (%eax),%eax
 8049798:	ba 00 00 00 00       	mov    $0x0,%edx
 804979d:	eb 14                	jmp    80497b3 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 804979f:	8b 45 08             	mov    0x8(%ebp),%eax
 80497a2:	8b 00                	mov    (%eax),%eax
 80497a4:	8d 48 04             	lea    0x4(%eax),%ecx
 80497a7:	8b 55 08             	mov    0x8(%ebp),%edx
 80497aa:	89 0a                	mov    %ecx,(%edx)
 80497ac:	8b 00                	mov    (%eax),%eax
 80497ae:	ba 00 00 00 00       	mov    $0x0,%edx
}
 80497b3:	5d                   	pop    %ebp
 80497b4:	c3                   	ret    

080497b5 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 80497b5:	55                   	push   %ebp
 80497b6:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 80497b8:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 80497bc:	7e 14                	jle    80497d2 <getint+0x1d>
		return va_arg(*ap, long long);
 80497be:	8b 45 08             	mov    0x8(%ebp),%eax
 80497c1:	8b 00                	mov    (%eax),%eax
 80497c3:	8d 48 08             	lea    0x8(%eax),%ecx
 80497c6:	8b 55 08             	mov    0x8(%ebp),%edx
 80497c9:	89 0a                	mov    %ecx,(%edx)
 80497cb:	8b 50 04             	mov    0x4(%eax),%edx
 80497ce:	8b 00                	mov    (%eax),%eax
 80497d0:	eb 28                	jmp    80497fa <getint+0x45>
	else if (lflag)
 80497d2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80497d6:	74 12                	je     80497ea <getint+0x35>
		return va_arg(*ap, long);
 80497d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80497db:	8b 00                	mov    (%eax),%eax
 80497dd:	8d 48 04             	lea    0x4(%eax),%ecx
 80497e0:	8b 55 08             	mov    0x8(%ebp),%edx
 80497e3:	89 0a                	mov    %ecx,(%edx)
 80497e5:	8b 00                	mov    (%eax),%eax
 80497e7:	99                   	cltd   
 80497e8:	eb 10                	jmp    80497fa <getint+0x45>
	else
		return va_arg(*ap, int);
 80497ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80497ed:	8b 00                	mov    (%eax),%eax
 80497ef:	8d 48 04             	lea    0x4(%eax),%ecx
 80497f2:	8b 55 08             	mov    0x8(%ebp),%edx
 80497f5:	89 0a                	mov    %ecx,(%edx)
 80497f7:	8b 00                	mov    (%eax),%eax
 80497f9:	99                   	cltd   
}
 80497fa:	5d                   	pop    %ebp
 80497fb:	c3                   	ret    

080497fc <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 80497fc:	55                   	push   %ebp
 80497fd:	89 e5                	mov    %esp,%ebp
 80497ff:	56                   	push   %esi
 8049800:	53                   	push   %ebx
 8049801:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049804:	eb 18                	jmp    804981e <vprintfmt+0x22>
			if (ch == '\0')
 8049806:	85 db                	test   %ebx,%ebx
 8049808:	75 05                	jne    804980f <vprintfmt+0x13>
				return;
 804980a:	e9 e9 03 00 00       	jmp    8049bf8 <vprintfmt+0x3fc>
			putch(ch, putdat);
 804980f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049812:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049816:	89 1c 24             	mov    %ebx,(%esp)
 8049819:	8b 45 08             	mov    0x8(%ebp),%eax
 804981c:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 804981e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049821:	8d 50 01             	lea    0x1(%eax),%edx
 8049824:	89 55 10             	mov    %edx,0x10(%ebp)
 8049827:	0f b6 00             	movzbl (%eax),%eax
 804982a:	0f b6 d8             	movzbl %al,%ebx
 804982d:	83 fb 25             	cmp    $0x25,%ebx
 8049830:	75 d4                	jne    8049806 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 8049832:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 8049836:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 804983d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 8049844:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 804984b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 8049852:	8b 45 10             	mov    0x10(%ebp),%eax
 8049855:	8d 50 01             	lea    0x1(%eax),%edx
 8049858:	89 55 10             	mov    %edx,0x10(%ebp)
 804985b:	0f b6 00             	movzbl (%eax),%eax
 804985e:	0f b6 d8             	movzbl %al,%ebx
 8049861:	8d 43 dd             	lea    -0x23(%ebx),%eax
 8049864:	83 f8 55             	cmp    $0x55,%eax
 8049867:	0f 87 5a 03 00 00    	ja     8049bc7 <vprintfmt+0x3cb>
 804986d:	8b 04 85 2c a2 04 08 	mov    0x804a22c(,%eax,4),%eax
 8049874:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 8049876:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 804987a:	eb d6                	jmp    8049852 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 804987c:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 8049880:	eb d0                	jmp    8049852 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049882:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 8049889:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804988c:	89 d0                	mov    %edx,%eax
 804988e:	c1 e0 02             	shl    $0x2,%eax
 8049891:	01 d0                	add    %edx,%eax
 8049893:	01 c0                	add    %eax,%eax
 8049895:	01 d8                	add    %ebx,%eax
 8049897:	83 e8 30             	sub    $0x30,%eax
 804989a:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 804989d:	8b 45 10             	mov    0x10(%ebp),%eax
 80498a0:	0f b6 00             	movzbl (%eax),%eax
 80498a3:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 80498a6:	83 fb 2f             	cmp    $0x2f,%ebx
 80498a9:	7e 0b                	jle    80498b6 <vprintfmt+0xba>
 80498ab:	83 fb 39             	cmp    $0x39,%ebx
 80498ae:	7f 06                	jg     80498b6 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 80498b0:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 80498b4:	eb d3                	jmp    8049889 <vprintfmt+0x8d>
			goto process_precision;
 80498b6:	eb 33                	jmp    80498eb <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 80498b8:	8b 45 14             	mov    0x14(%ebp),%eax
 80498bb:	8d 50 04             	lea    0x4(%eax),%edx
 80498be:	89 55 14             	mov    %edx,0x14(%ebp)
 80498c1:	8b 00                	mov    (%eax),%eax
 80498c3:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 80498c6:	eb 23                	jmp    80498eb <vprintfmt+0xef>

		case '.':
			if (width < 0)
 80498c8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80498cc:	79 0c                	jns    80498da <vprintfmt+0xde>
				width = 0;
 80498ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 80498d5:	e9 78 ff ff ff       	jmp    8049852 <vprintfmt+0x56>
 80498da:	e9 73 ff ff ff       	jmp    8049852 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 80498df:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 80498e6:	e9 67 ff ff ff       	jmp    8049852 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 80498eb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80498ef:	79 12                	jns    8049903 <vprintfmt+0x107>
				width = precision, precision = -1;
 80498f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80498f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80498f7:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 80498fe:	e9 4f ff ff ff       	jmp    8049852 <vprintfmt+0x56>
 8049903:	e9 4a ff ff ff       	jmp    8049852 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 8049908:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 804990c:	e9 41 ff ff ff       	jmp    8049852 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 8049911:	8b 45 14             	mov    0x14(%ebp),%eax
 8049914:	8d 50 04             	lea    0x4(%eax),%edx
 8049917:	89 55 14             	mov    %edx,0x14(%ebp)
 804991a:	8b 00                	mov    (%eax),%eax
 804991c:	8b 55 0c             	mov    0xc(%ebp),%edx
 804991f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049923:	89 04 24             	mov    %eax,(%esp)
 8049926:	8b 45 08             	mov    0x8(%ebp),%eax
 8049929:	ff d0                	call   *%eax
			break;
 804992b:	e9 c2 02 00 00       	jmp    8049bf2 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 8049930:	8b 45 14             	mov    0x14(%ebp),%eax
 8049933:	8d 50 04             	lea    0x4(%eax),%edx
 8049936:	89 55 14             	mov    %edx,0x14(%ebp)
 8049939:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 804993b:	85 db                	test   %ebx,%ebx
 804993d:	79 02                	jns    8049941 <vprintfmt+0x145>
				err = -err;
 804993f:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049941:	83 fb 06             	cmp    $0x6,%ebx
 8049944:	7f 0b                	jg     8049951 <vprintfmt+0x155>
 8049946:	8b 34 9d ec a1 04 08 	mov    0x804a1ec(,%ebx,4),%esi
 804994d:	85 f6                	test   %esi,%esi
 804994f:	75 23                	jne    8049974 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 8049951:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049955:	c7 44 24 08 19 a2 04 	movl   $0x804a219,0x8(%esp)
 804995c:	08 
 804995d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049960:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049964:	8b 45 08             	mov    0x8(%ebp),%eax
 8049967:	89 04 24             	mov    %eax,(%esp)
 804996a:	e8 90 02 00 00       	call   8049bff <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 804996f:	e9 7e 02 00 00       	jmp    8049bf2 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 8049974:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049978:	c7 44 24 08 22 a2 04 	movl   $0x804a222,0x8(%esp)
 804997f:	08 
 8049980:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049983:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049987:	8b 45 08             	mov    0x8(%ebp),%eax
 804998a:	89 04 24             	mov    %eax,(%esp)
 804998d:	e8 6d 02 00 00       	call   8049bff <printfmt>
			break;
 8049992:	e9 5b 02 00 00       	jmp    8049bf2 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 8049997:	8b 45 14             	mov    0x14(%ebp),%eax
 804999a:	8d 50 04             	lea    0x4(%eax),%edx
 804999d:	89 55 14             	mov    %edx,0x14(%ebp)
 80499a0:	8b 30                	mov    (%eax),%esi
 80499a2:	85 f6                	test   %esi,%esi
 80499a4:	75 05                	jne    80499ab <vprintfmt+0x1af>
				p = "(null)";
 80499a6:	be 25 a2 04 08       	mov    $0x804a225,%esi
			if (width > 0 && padc != '-')
 80499ab:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80499af:	7e 37                	jle    80499e8 <vprintfmt+0x1ec>
 80499b1:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 80499b5:	74 31                	je     80499e8 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 80499b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80499ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499be:	89 34 24             	mov    %esi,(%esp)
 80499c1:	e8 9b f8 ff ff       	call   8049261 <strnlen>
 80499c6:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 80499c9:	eb 17                	jmp    80499e2 <vprintfmt+0x1e6>
					putch(padc, putdat);
 80499cb:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 80499cf:	8b 55 0c             	mov    0xc(%ebp),%edx
 80499d2:	89 54 24 04          	mov    %edx,0x4(%esp)
 80499d6:	89 04 24             	mov    %eax,(%esp)
 80499d9:	8b 45 08             	mov    0x8(%ebp),%eax
 80499dc:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 80499de:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80499e2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80499e6:	7f e3                	jg     80499cb <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 80499e8:	eb 38                	jmp    8049a22 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 80499ea:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 80499ee:	74 1f                	je     8049a0f <vprintfmt+0x213>
 80499f0:	83 fb 1f             	cmp    $0x1f,%ebx
 80499f3:	7e 05                	jle    80499fa <vprintfmt+0x1fe>
 80499f5:	83 fb 7e             	cmp    $0x7e,%ebx
 80499f8:	7e 15                	jle    8049a0f <vprintfmt+0x213>
					putch('?', putdat);
 80499fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a01:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 8049a08:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a0b:	ff d0                	call   *%eax
 8049a0d:	eb 0f                	jmp    8049a1e <vprintfmt+0x222>
				else
					putch(ch, putdat);
 8049a0f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a12:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a16:	89 1c 24             	mov    %ebx,(%esp)
 8049a19:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a1c:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049a1e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049a22:	89 f0                	mov    %esi,%eax
 8049a24:	8d 70 01             	lea    0x1(%eax),%esi
 8049a27:	0f b6 00             	movzbl (%eax),%eax
 8049a2a:	0f be d8             	movsbl %al,%ebx
 8049a2d:	85 db                	test   %ebx,%ebx
 8049a2f:	74 10                	je     8049a41 <vprintfmt+0x245>
 8049a31:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049a35:	78 b3                	js     80499ea <vprintfmt+0x1ee>
 8049a37:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 8049a3b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049a3f:	79 a9                	jns    80499ea <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049a41:	eb 17                	jmp    8049a5a <vprintfmt+0x25e>
				putch(' ', putdat);
 8049a43:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a46:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a4a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049a51:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a54:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049a56:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049a5a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049a5e:	7f e3                	jg     8049a43 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 8049a60:	e9 8d 01 00 00       	jmp    8049bf2 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 8049a65:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049a68:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a6c:	8d 45 14             	lea    0x14(%ebp),%eax
 8049a6f:	89 04 24             	mov    %eax,(%esp)
 8049a72:	e8 3e fd ff ff       	call   80497b5 <getint>
 8049a77:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a7a:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 8049a7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049a80:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049a83:	85 d2                	test   %edx,%edx
 8049a85:	79 26                	jns    8049aad <vprintfmt+0x2b1>
				putch('-', putdat);
 8049a87:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a8a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a8e:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 8049a95:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a98:	ff d0                	call   *%eax
				num = -(long long) num;
 8049a9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049a9d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049aa0:	f7 d8                	neg    %eax
 8049aa2:	83 d2 00             	adc    $0x0,%edx
 8049aa5:	f7 da                	neg    %edx
 8049aa7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049aaa:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049aad:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049ab4:	e9 c5 00 00 00       	jmp    8049b7e <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 8049ab9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049abc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ac0:	8d 45 14             	lea    0x14(%ebp),%eax
 8049ac3:	89 04 24             	mov    %eax,(%esp)
 8049ac6:	e8 9b fc ff ff       	call   8049766 <getuint>
 8049acb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049ace:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049ad1:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049ad8:	e9 a1 00 00 00       	jmp    8049b7e <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 8049add:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ae0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ae4:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049aeb:	8b 45 08             	mov    0x8(%ebp),%eax
 8049aee:	ff d0                	call   *%eax
			putch('X', putdat);
 8049af0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049af3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049af7:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049afe:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b01:	ff d0                	call   *%eax
			putch('X', putdat);
 8049b03:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b06:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b0a:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049b11:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b14:	ff d0                	call   *%eax
			break;
 8049b16:	e9 d7 00 00 00       	jmp    8049bf2 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 8049b1b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b1e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b22:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 8049b29:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b2c:	ff d0                	call   *%eax
			putch('x', putdat);
 8049b2e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b31:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b35:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049b3c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b3f:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049b41:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b44:	8d 50 04             	lea    0x4(%eax),%edx
 8049b47:	89 55 14             	mov    %edx,0x14(%ebp)
 8049b4a:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049b4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049b56:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049b5d:	eb 1f                	jmp    8049b7e <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049b5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b62:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b66:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b69:	89 04 24             	mov    %eax,(%esp)
 8049b6c:	e8 f5 fb ff ff       	call   8049766 <getuint>
 8049b71:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b74:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049b77:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049b7e:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049b82:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b85:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049b89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049b8c:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049b90:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b97:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049b9a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b9e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049ba2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ba9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bac:	89 04 24             	mov    %eax,(%esp)
 8049baf:	e8 d4 fa ff ff       	call   8049688 <printnum>
			break;
 8049bb4:	eb 3c                	jmp    8049bf2 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bb9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bbd:	89 1c 24             	mov    %ebx,(%esp)
 8049bc0:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bc3:	ff d0                	call   *%eax
			break;
 8049bc5:	eb 2b                	jmp    8049bf2 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bca:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bce:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049bd5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bd8:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049bda:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049bde:	eb 04                	jmp    8049be4 <vprintfmt+0x3e8>
 8049be0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049be4:	8b 45 10             	mov    0x10(%ebp),%eax
 8049be7:	83 e8 01             	sub    $0x1,%eax
 8049bea:	0f b6 00             	movzbl (%eax),%eax
 8049bed:	3c 25                	cmp    $0x25,%al
 8049bef:	75 ef                	jne    8049be0 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049bf1:	90                   	nop
		}
	}
 8049bf2:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049bf3:	e9 26 fc ff ff       	jmp    804981e <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049bf8:	83 c4 40             	add    $0x40,%esp
 8049bfb:	5b                   	pop    %ebx
 8049bfc:	5e                   	pop    %esi
 8049bfd:	5d                   	pop    %ebp
 8049bfe:	c3                   	ret    

08049bff <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049bff:	55                   	push   %ebp
 8049c00:	89 e5                	mov    %esp,%ebp
 8049c02:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049c05:	8d 45 14             	lea    0x14(%ebp),%eax
 8049c08:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c0e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049c12:	8b 45 10             	mov    0x10(%ebp),%eax
 8049c15:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049c19:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c1c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c20:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c23:	89 04 24             	mov    %eax,(%esp)
 8049c26:	e8 d1 fb ff ff       	call   80497fc <vprintfmt>
	va_end(ap);
}
 8049c2b:	c9                   	leave  
 8049c2c:	c3                   	ret    

08049c2d <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049c2d:	55                   	push   %ebp
 8049c2e:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049c30:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c33:	8b 40 08             	mov    0x8(%eax),%eax
 8049c36:	8d 50 01             	lea    0x1(%eax),%edx
 8049c39:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c3c:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049c3f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c42:	8b 10                	mov    (%eax),%edx
 8049c44:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c47:	8b 40 04             	mov    0x4(%eax),%eax
 8049c4a:	39 c2                	cmp    %eax,%edx
 8049c4c:	73 12                	jae    8049c60 <sprintputch+0x33>
		*b->buf++ = ch;
 8049c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c51:	8b 00                	mov    (%eax),%eax
 8049c53:	8d 48 01             	lea    0x1(%eax),%ecx
 8049c56:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049c59:	89 0a                	mov    %ecx,(%edx)
 8049c5b:	8b 55 08             	mov    0x8(%ebp),%edx
 8049c5e:	88 10                	mov    %dl,(%eax)
}
 8049c60:	5d                   	pop    %ebp
 8049c61:	c3                   	ret    

08049c62 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049c62:	55                   	push   %ebp
 8049c63:	89 e5                	mov    %esp,%ebp
 8049c65:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049c68:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c6b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049c6e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c71:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049c74:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c77:	01 d0                	add    %edx,%eax
 8049c79:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049c83:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049c87:	74 06                	je     8049c8f <vsnprintf+0x2d>
 8049c89:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049c8d:	7f 07                	jg     8049c96 <vsnprintf+0x34>
		return -E_INVAL;
 8049c8f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049c94:	eb 2a                	jmp    8049cc0 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049c96:	8b 45 14             	mov    0x14(%ebp),%eax
 8049c99:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049c9d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ca0:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ca4:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049ca7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cab:	c7 04 24 2d 9c 04 08 	movl   $0x8049c2d,(%esp)
 8049cb2:	e8 45 fb ff ff       	call   80497fc <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049cb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049cba:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049cbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049cc0:	c9                   	leave  
 8049cc1:	c3                   	ret    

08049cc2 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049cc2:	55                   	push   %ebp
 8049cc3:	89 e5                	mov    %esp,%ebp
 8049cc5:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049cc8:	8d 45 14             	lea    0x14(%ebp),%eax
 8049ccb:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049cce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049cd1:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049cd5:	8b 45 10             	mov    0x10(%ebp),%eax
 8049cd8:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049cdc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cdf:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ce3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ce6:	89 04 24             	mov    %eax,(%esp)
 8049ce9:	e8 74 ff ff ff       	call   8049c62 <vsnprintf>
 8049cee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049cf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049cf4:	c9                   	leave  
 8049cf5:	c3                   	ret    

08049cf6 <srand>:
static int seed = 0;

void
srand(int s) {
 8049cf6:	55                   	push   %ebp
 8049cf7:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049cf9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cfc:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049d01:	5d                   	pop    %ebp
 8049d02:	c3                   	ret    

08049d03 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049d03:	55                   	push   %ebp
 8049d04:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049d06:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049d0b:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049d11:	83 c0 01             	add    $0x1,%eax
 8049d14:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049d19:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049d1e:	c1 f8 10             	sar    $0x10,%eax
 8049d21:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049d26:	5d                   	pop    %ebp
 8049d27:	c3                   	ret    
 8049d28:	66 90                	xchg   %ax,%ax
 8049d2a:	66 90                	xchg   %ax,%ax
 8049d2c:	66 90                	xchg   %ax,%ax
 8049d2e:	66 90                	xchg   %ax,%ax

08049d30 <__udivdi3>:
 8049d30:	55                   	push   %ebp
 8049d31:	57                   	push   %edi
 8049d32:	56                   	push   %esi
 8049d33:	83 ec 0c             	sub    $0xc,%esp
 8049d36:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049d3a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049d3e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049d42:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049d46:	85 c0                	test   %eax,%eax
 8049d48:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049d4c:	89 ea                	mov    %ebp,%edx
 8049d4e:	89 0c 24             	mov    %ecx,(%esp)
 8049d51:	75 2d                	jne    8049d80 <__udivdi3+0x50>
 8049d53:	39 e9                	cmp    %ebp,%ecx
 8049d55:	77 61                	ja     8049db8 <__udivdi3+0x88>
 8049d57:	85 c9                	test   %ecx,%ecx
 8049d59:	89 ce                	mov    %ecx,%esi
 8049d5b:	75 0b                	jne    8049d68 <__udivdi3+0x38>
 8049d5d:	b8 01 00 00 00       	mov    $0x1,%eax
 8049d62:	31 d2                	xor    %edx,%edx
 8049d64:	f7 f1                	div    %ecx
 8049d66:	89 c6                	mov    %eax,%esi
 8049d68:	31 d2                	xor    %edx,%edx
 8049d6a:	89 e8                	mov    %ebp,%eax
 8049d6c:	f7 f6                	div    %esi
 8049d6e:	89 c5                	mov    %eax,%ebp
 8049d70:	89 f8                	mov    %edi,%eax
 8049d72:	f7 f6                	div    %esi
 8049d74:	89 ea                	mov    %ebp,%edx
 8049d76:	83 c4 0c             	add    $0xc,%esp
 8049d79:	5e                   	pop    %esi
 8049d7a:	5f                   	pop    %edi
 8049d7b:	5d                   	pop    %ebp
 8049d7c:	c3                   	ret    
 8049d7d:	8d 76 00             	lea    0x0(%esi),%esi
 8049d80:	39 e8                	cmp    %ebp,%eax
 8049d82:	77 24                	ja     8049da8 <__udivdi3+0x78>
 8049d84:	0f bd e8             	bsr    %eax,%ebp
 8049d87:	83 f5 1f             	xor    $0x1f,%ebp
 8049d8a:	75 3c                	jne    8049dc8 <__udivdi3+0x98>
 8049d8c:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049d90:	39 34 24             	cmp    %esi,(%esp)
 8049d93:	0f 86 9f 00 00 00    	jbe    8049e38 <__udivdi3+0x108>
 8049d99:	39 d0                	cmp    %edx,%eax
 8049d9b:	0f 82 97 00 00 00    	jb     8049e38 <__udivdi3+0x108>
 8049da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049da8:	31 d2                	xor    %edx,%edx
 8049daa:	31 c0                	xor    %eax,%eax
 8049dac:	83 c4 0c             	add    $0xc,%esp
 8049daf:	5e                   	pop    %esi
 8049db0:	5f                   	pop    %edi
 8049db1:	5d                   	pop    %ebp
 8049db2:	c3                   	ret    
 8049db3:	90                   	nop
 8049db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049db8:	89 f8                	mov    %edi,%eax
 8049dba:	f7 f1                	div    %ecx
 8049dbc:	31 d2                	xor    %edx,%edx
 8049dbe:	83 c4 0c             	add    $0xc,%esp
 8049dc1:	5e                   	pop    %esi
 8049dc2:	5f                   	pop    %edi
 8049dc3:	5d                   	pop    %ebp
 8049dc4:	c3                   	ret    
 8049dc5:	8d 76 00             	lea    0x0(%esi),%esi
 8049dc8:	89 e9                	mov    %ebp,%ecx
 8049dca:	8b 3c 24             	mov    (%esp),%edi
 8049dcd:	d3 e0                	shl    %cl,%eax
 8049dcf:	89 c6                	mov    %eax,%esi
 8049dd1:	b8 20 00 00 00       	mov    $0x20,%eax
 8049dd6:	29 e8                	sub    %ebp,%eax
 8049dd8:	89 c1                	mov    %eax,%ecx
 8049dda:	d3 ef                	shr    %cl,%edi
 8049ddc:	89 e9                	mov    %ebp,%ecx
 8049dde:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049de2:	8b 3c 24             	mov    (%esp),%edi
 8049de5:	09 74 24 08          	or     %esi,0x8(%esp)
 8049de9:	89 d6                	mov    %edx,%esi
 8049deb:	d3 e7                	shl    %cl,%edi
 8049ded:	89 c1                	mov    %eax,%ecx
 8049def:	89 3c 24             	mov    %edi,(%esp)
 8049df2:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049df6:	d3 ee                	shr    %cl,%esi
 8049df8:	89 e9                	mov    %ebp,%ecx
 8049dfa:	d3 e2                	shl    %cl,%edx
 8049dfc:	89 c1                	mov    %eax,%ecx
 8049dfe:	d3 ef                	shr    %cl,%edi
 8049e00:	09 d7                	or     %edx,%edi
 8049e02:	89 f2                	mov    %esi,%edx
 8049e04:	89 f8                	mov    %edi,%eax
 8049e06:	f7 74 24 08          	divl   0x8(%esp)
 8049e0a:	89 d6                	mov    %edx,%esi
 8049e0c:	89 c7                	mov    %eax,%edi
 8049e0e:	f7 24 24             	mull   (%esp)
 8049e11:	39 d6                	cmp    %edx,%esi
 8049e13:	89 14 24             	mov    %edx,(%esp)
 8049e16:	72 30                	jb     8049e48 <__udivdi3+0x118>
 8049e18:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049e1c:	89 e9                	mov    %ebp,%ecx
 8049e1e:	d3 e2                	shl    %cl,%edx
 8049e20:	39 c2                	cmp    %eax,%edx
 8049e22:	73 05                	jae    8049e29 <__udivdi3+0xf9>
 8049e24:	3b 34 24             	cmp    (%esp),%esi
 8049e27:	74 1f                	je     8049e48 <__udivdi3+0x118>
 8049e29:	89 f8                	mov    %edi,%eax
 8049e2b:	31 d2                	xor    %edx,%edx
 8049e2d:	e9 7a ff ff ff       	jmp    8049dac <__udivdi3+0x7c>
 8049e32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049e38:	31 d2                	xor    %edx,%edx
 8049e3a:	b8 01 00 00 00       	mov    $0x1,%eax
 8049e3f:	e9 68 ff ff ff       	jmp    8049dac <__udivdi3+0x7c>
 8049e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049e48:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049e4b:	31 d2                	xor    %edx,%edx
 8049e4d:	83 c4 0c             	add    $0xc,%esp
 8049e50:	5e                   	pop    %esi
 8049e51:	5f                   	pop    %edi
 8049e52:	5d                   	pop    %ebp
 8049e53:	c3                   	ret    
 8049e54:	66 90                	xchg   %ax,%ax
 8049e56:	66 90                	xchg   %ax,%ax
 8049e58:	66 90                	xchg   %ax,%ax
 8049e5a:	66 90                	xchg   %ax,%ax
 8049e5c:	66 90                	xchg   %ax,%ax
 8049e5e:	66 90                	xchg   %ax,%ax

08049e60 <__umoddi3>:
 8049e60:	55                   	push   %ebp
 8049e61:	57                   	push   %edi
 8049e62:	56                   	push   %esi
 8049e63:	83 ec 14             	sub    $0x14,%esp
 8049e66:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049e6a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049e6e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049e72:	89 c7                	mov    %eax,%edi
 8049e74:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e78:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049e7c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049e80:	89 34 24             	mov    %esi,(%esp)
 8049e83:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049e87:	85 c0                	test   %eax,%eax
 8049e89:	89 c2                	mov    %eax,%edx
 8049e8b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049e8f:	75 17                	jne    8049ea8 <__umoddi3+0x48>
 8049e91:	39 fe                	cmp    %edi,%esi
 8049e93:	76 4b                	jbe    8049ee0 <__umoddi3+0x80>
 8049e95:	89 c8                	mov    %ecx,%eax
 8049e97:	89 fa                	mov    %edi,%edx
 8049e99:	f7 f6                	div    %esi
 8049e9b:	89 d0                	mov    %edx,%eax
 8049e9d:	31 d2                	xor    %edx,%edx
 8049e9f:	83 c4 14             	add    $0x14,%esp
 8049ea2:	5e                   	pop    %esi
 8049ea3:	5f                   	pop    %edi
 8049ea4:	5d                   	pop    %ebp
 8049ea5:	c3                   	ret    
 8049ea6:	66 90                	xchg   %ax,%ax
 8049ea8:	39 f8                	cmp    %edi,%eax
 8049eaa:	77 54                	ja     8049f00 <__umoddi3+0xa0>
 8049eac:	0f bd e8             	bsr    %eax,%ebp
 8049eaf:	83 f5 1f             	xor    $0x1f,%ebp
 8049eb2:	75 5c                	jne    8049f10 <__umoddi3+0xb0>
 8049eb4:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049eb8:	39 3c 24             	cmp    %edi,(%esp)
 8049ebb:	0f 87 e7 00 00 00    	ja     8049fa8 <__umoddi3+0x148>
 8049ec1:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049ec5:	29 f1                	sub    %esi,%ecx
 8049ec7:	19 c7                	sbb    %eax,%edi
 8049ec9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049ecd:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049ed1:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049ed5:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049ed9:	83 c4 14             	add    $0x14,%esp
 8049edc:	5e                   	pop    %esi
 8049edd:	5f                   	pop    %edi
 8049ede:	5d                   	pop    %ebp
 8049edf:	c3                   	ret    
 8049ee0:	85 f6                	test   %esi,%esi
 8049ee2:	89 f5                	mov    %esi,%ebp
 8049ee4:	75 0b                	jne    8049ef1 <__umoddi3+0x91>
 8049ee6:	b8 01 00 00 00       	mov    $0x1,%eax
 8049eeb:	31 d2                	xor    %edx,%edx
 8049eed:	f7 f6                	div    %esi
 8049eef:	89 c5                	mov    %eax,%ebp
 8049ef1:	8b 44 24 04          	mov    0x4(%esp),%eax
 8049ef5:	31 d2                	xor    %edx,%edx
 8049ef7:	f7 f5                	div    %ebp
 8049ef9:	89 c8                	mov    %ecx,%eax
 8049efb:	f7 f5                	div    %ebp
 8049efd:	eb 9c                	jmp    8049e9b <__umoddi3+0x3b>
 8049eff:	90                   	nop
 8049f00:	89 c8                	mov    %ecx,%eax
 8049f02:	89 fa                	mov    %edi,%edx
 8049f04:	83 c4 14             	add    $0x14,%esp
 8049f07:	5e                   	pop    %esi
 8049f08:	5f                   	pop    %edi
 8049f09:	5d                   	pop    %ebp
 8049f0a:	c3                   	ret    
 8049f0b:	90                   	nop
 8049f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f10:	8b 04 24             	mov    (%esp),%eax
 8049f13:	be 20 00 00 00       	mov    $0x20,%esi
 8049f18:	89 e9                	mov    %ebp,%ecx
 8049f1a:	29 ee                	sub    %ebp,%esi
 8049f1c:	d3 e2                	shl    %cl,%edx
 8049f1e:	89 f1                	mov    %esi,%ecx
 8049f20:	d3 e8                	shr    %cl,%eax
 8049f22:	89 e9                	mov    %ebp,%ecx
 8049f24:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049f28:	8b 04 24             	mov    (%esp),%eax
 8049f2b:	09 54 24 04          	or     %edx,0x4(%esp)
 8049f2f:	89 fa                	mov    %edi,%edx
 8049f31:	d3 e0                	shl    %cl,%eax
 8049f33:	89 f1                	mov    %esi,%ecx
 8049f35:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049f39:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049f3d:	d3 ea                	shr    %cl,%edx
 8049f3f:	89 e9                	mov    %ebp,%ecx
 8049f41:	d3 e7                	shl    %cl,%edi
 8049f43:	89 f1                	mov    %esi,%ecx
 8049f45:	d3 e8                	shr    %cl,%eax
 8049f47:	89 e9                	mov    %ebp,%ecx
 8049f49:	09 f8                	or     %edi,%eax
 8049f4b:	8b 7c 24 10          	mov    0x10(%esp),%edi
 8049f4f:	f7 74 24 04          	divl   0x4(%esp)
 8049f53:	d3 e7                	shl    %cl,%edi
 8049f55:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049f59:	89 d7                	mov    %edx,%edi
 8049f5b:	f7 64 24 08          	mull   0x8(%esp)
 8049f5f:	39 d7                	cmp    %edx,%edi
 8049f61:	89 c1                	mov    %eax,%ecx
 8049f63:	89 14 24             	mov    %edx,(%esp)
 8049f66:	72 2c                	jb     8049f94 <__umoddi3+0x134>
 8049f68:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 8049f6c:	72 22                	jb     8049f90 <__umoddi3+0x130>
 8049f6e:	8b 44 24 0c          	mov    0xc(%esp),%eax
 8049f72:	29 c8                	sub    %ecx,%eax
 8049f74:	19 d7                	sbb    %edx,%edi
 8049f76:	89 e9                	mov    %ebp,%ecx
 8049f78:	89 fa                	mov    %edi,%edx
 8049f7a:	d3 e8                	shr    %cl,%eax
 8049f7c:	89 f1                	mov    %esi,%ecx
 8049f7e:	d3 e2                	shl    %cl,%edx
 8049f80:	89 e9                	mov    %ebp,%ecx
 8049f82:	d3 ef                	shr    %cl,%edi
 8049f84:	09 d0                	or     %edx,%eax
 8049f86:	89 fa                	mov    %edi,%edx
 8049f88:	83 c4 14             	add    $0x14,%esp
 8049f8b:	5e                   	pop    %esi
 8049f8c:	5f                   	pop    %edi
 8049f8d:	5d                   	pop    %ebp
 8049f8e:	c3                   	ret    
 8049f8f:	90                   	nop
 8049f90:	39 d7                	cmp    %edx,%edi
 8049f92:	75 da                	jne    8049f6e <__umoddi3+0x10e>
 8049f94:	8b 14 24             	mov    (%esp),%edx
 8049f97:	89 c1                	mov    %eax,%ecx
 8049f99:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 8049f9d:	1b 54 24 04          	sbb    0x4(%esp),%edx
 8049fa1:	eb cb                	jmp    8049f6e <__umoddi3+0x10e>
 8049fa3:	90                   	nop
 8049fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049fa8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 8049fac:	0f 82 0f ff ff ff    	jb     8049ec1 <__umoddi3+0x61>
 8049fb2:	e9 1a ff ff ff       	jmp    8049ed1 <__umoddi3+0x71>
