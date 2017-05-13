
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
 8048006:	c7 04 24 18 9f 04 08 	movl   $0x8049f18,(%esp)
 804800d:	e8 7c 10 00 00       	call   804908e <printf>
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
 8048028:	c7 44 24 0c 3e 9f 04 	movl   $0x8049f3e,0xc(%esp)
 804802f:	08 
 8048030:	c7 44 24 08 40 9f 04 	movl   $0x8049f40,0x8(%esp)
 8048037:	08 
 8048038:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
 804803f:	00 
 8048040:	c7 04 24 55 9f 04 08 	movl   $0x8049f55,(%esp)
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
 80480bf:	c7 44 24 0c 61 9f 04 	movl   $0x8049f61,0xc(%esp)
 80480c6:	08 
 80480c7:	c7 44 24 08 79 9f 04 	movl   $0x8049f79,0x8(%esp)
 80480ce:	08 
 80480cf:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80480d6:	00 
 80480d7:	c7 04 24 8e 9f 04 08 	movl   $0x8049f8e,(%esp)
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
 8048105:	c7 44 24 0c 61 9f 04 	movl   $0x8049f61,0xc(%esp)
 804810c:	08 
 804810d:	c7 44 24 08 79 9f 04 	movl   $0x8049f79,0x8(%esp)
 8048114:	08 
 8048115:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 804811c:	00 
 804811d:	c7 04 24 8e 9f 04 08 	movl   $0x8049f8e,(%esp)
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
 80481a4:	c7 04 24 9e 9f 04 08 	movl   $0x8049f9e,(%esp)
 80481ab:	e8 de 0e 00 00       	call   804908e <printf>
	vprintf(fmt, ap);
 80481b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481b7:	8b 45 10             	mov    0x10(%ebp),%eax
 80481ba:	89 04 24             	mov    %eax,(%esp)
 80481bd:	e8 99 0e 00 00       	call   804905b <vprintf>
	printf("\n");
 80481c2:	c7 04 24 b6 9f 04 08 	movl   $0x8049fb6,(%esp)
 80481c9:	e8 c0 0e 00 00       	call   804908e <printf>
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
 80481ea:	c7 04 24 b8 9f 04 08 	movl   $0x8049fb8,(%esp)
 80481f1:	e8 98 0e 00 00       	call   804908e <printf>
	vprintf(fmt, ap);
 80481f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481fd:	8b 45 10             	mov    0x10(%ebp),%eax
 8048200:	89 04 24             	mov    %eax,(%esp)
 8048203:	e8 53 0e 00 00       	call   804905b <vprintf>
	printf("\n");
 8048208:	c7 04 24 b6 9f 04 08 	movl   $0x8049fb6,(%esp)
 804820f:	e8 7a 0e 00 00       	call   804908e <printf>
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
 8048228:	c7 44 24 0c d2 9f 04 	movl   $0x8049fd2,0xc(%esp)
 804822f:	08 
 8048230:	c7 44 24 08 e3 9f 04 	movl   $0x8049fe3,0x8(%esp)
 8048237:	08 
 8048238:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 804823f:	00 
 8048240:	c7 04 24 f8 9f 04 08 	movl   $0x8049ff8,(%esp)
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
 80483fc:	e8 ce 0c 00 00       	call   80490cf <itoa>
 8048401:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 8048404:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048407:	89 04 24             	mov    %eax,(%esp)
 804840a:	e8 5c 0d 00 00       	call   804916b <strlen>
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
 8048434:	c7 04 24 04 a0 04 08 	movl   $0x804a004,(%esp)
 804843b:	e8 85 fe ff ff       	call   80482c5 <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 8048440:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048443:	89 04 24             	mov    %eax,(%esp)
 8048446:	e8 20 0d 00 00       	call   804916b <strlen>
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
 8048483:	e8 47 0c 00 00       	call   80490cf <itoa>
 8048488:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 804848b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804848e:	89 04 24             	mov    %eax,(%esp)
 8048491:	e8 d5 0c 00 00       	call   804916b <strlen>
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
 80484bb:	c7 04 24 0b a0 04 08 	movl   $0x804a00b,(%esp)
 80484c2:	e8 fe fd ff ff       	call   80482c5 <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80484c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484ca:	89 04 24             	mov    %eax,(%esp)
 80484cd:	e8 99 0c 00 00       	call   804916b <strlen>
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
 804850a:	e8 c0 0b 00 00       	call   80490cf <itoa>
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
 8048537:	e8 93 0b 00 00       	call   80490cf <itoa>
 804853c:	89 04 24             	mov    %eax,(%esp)
 804853f:	e8 27 0c 00 00       	call   804916b <strlen>
 8048544:	c1 e0 03             	shl    $0x3,%eax
 8048547:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 804854e:	00 
 804854f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048553:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804855a:	00 
 804855b:	c7 04 24 11 a0 04 08 	movl   $0x804a011,(%esp)
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
 804871e:	c7 04 24 15 a0 04 08 	movl   $0x804a015,(%esp)
 8048725:	e8 64 09 00 00       	call   804908e <printf>
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
 8048810:	c7 44 24 0c 19 a0 04 	movl   $0x804a019,0xc(%esp)
 8048817:	08 
 8048818:	c7 44 24 08 32 a0 04 	movl   $0x804a032,0x8(%esp)
 804881f:	08 
 8048820:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048827:	00 
 8048828:	c7 04 24 47 a0 04 08 	movl   $0x804a047,(%esp)
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
 804886c:	c7 44 24 0c 55 a0 04 	movl   $0x804a055,0xc(%esp)
 8048873:	08 
 8048874:	c7 44 24 08 32 a0 04 	movl   $0x804a032,0x8(%esp)
 804887b:	08 
 804887c:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048883:	00 
 8048884:	c7 04 24 47 a0 04 08 	movl   $0x804a047,(%esp)
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
 80488a4:	c7 44 24 0c 55 a0 04 	movl   $0x804a055,0xc(%esp)
 80488ab:	08 
 80488ac:	c7 44 24 08 32 a0 04 	movl   $0x804a032,0x8(%esp)
 80488b3:	08 
 80488b4:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488bb:	00 
 80488bc:	c7 04 24 47 a0 04 08 	movl   $0x804a047,(%esp)
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
 80488e2:	c7 44 24 0c 62 a0 04 	movl   $0x804a062,0xc(%esp)
 80488e9:	08 
 80488ea:	c7 44 24 08 32 a0 04 	movl   $0x804a032,0x8(%esp)
 80488f1:	08 
 80488f2:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488f9:	00 
 80488fa:	c7 04 24 47 a0 04 08 	movl   $0x804a047,(%esp)
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
 8048956:	c7 44 24 0c 55 a0 04 	movl   $0x804a055,0xc(%esp)
 804895d:	08 
 804895e:	c7 44 24 08 32 a0 04 	movl   $0x804a032,0x8(%esp)
 8048965:	08 
 8048966:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804896d:	00 
 804896e:	c7 04 24 47 a0 04 08 	movl   $0x804a047,(%esp)
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
 8048a98:	c7 44 24 0c 7f a0 04 	movl   $0x804a07f,0xc(%esp)
 8048a9f:	08 
 8048aa0:	c7 44 24 08 32 a0 04 	movl   $0x804a032,0x8(%esp)
 8048aa7:	08 
 8048aa8:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048aaf:	00 
 8048ab0:	c7 04 24 47 a0 04 08 	movl   $0x804a047,(%esp)
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
 8048b35:	e8 27 11 00 00       	call   8049c61 <rand>
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
#include "video.h"

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
 8048ed5:	c7 44 24 0c 84 a0 04 	movl   $0x804a084,0xc(%esp)
 8048edc:	08 
 8048edd:	c7 44 24 08 b8 a0 04 	movl   $0x804a0b8,0x8(%esp)
 8048ee4:	08 
 8048ee5:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048eec:	00 
 8048eed:	c7 04 24 cd a0 04 08 	movl   $0x804a0cd,(%esp)
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
 8048f36:	e8 17 02 00 00       	call   8049152 <memset>
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
 8048f52:	e8 b1 00 00 00       	call   8049008 <syscall>
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
 8048f66:	e8 9d 00 00 00       	call   8049008 <syscall>
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
 8048f7a:	e8 89 00 00 00       	call   8049008 <syscall>
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
 8048fa3:	e8 60 00 00 00       	call   8049008 <syscall>
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
 8048fb7:	e8 4c 00 00 00       	call   8049008 <syscall>
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
 8048fcb:	e8 38 00 00 00       	call   8049008 <syscall>
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
 8048fe6:	e8 1d 00 00 00       	call   8049008 <syscall>
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
 8049001:	e8 02 00 00 00       	call   8049008 <syscall>
	//printf("qweqwe");
}
 8049006:	c9                   	leave  
 8049007:	c3                   	ret    

08049008 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 8049008:	55                   	push   %ebp
 8049009:	89 e5                	mov    %esp,%ebp
 804900b:	53                   	push   %ebx
 804900c:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 804900f:	8d 45 08             	lea    0x8(%ebp),%eax
 8049012:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 8049015:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049018:	8b 00                	mov    (%eax),%eax
 804901a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804901d:	83 c2 04             	add    $0x4,%edx
 8049020:	8b 1a                	mov    (%edx),%ebx
 8049022:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8049025:	83 c2 08             	add    $0x8,%edx
 8049028:	8b 0a                	mov    (%edx),%ecx
 804902a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804902d:	83 c2 0c             	add    $0xc,%edx
 8049030:	8b 12                	mov    (%edx),%edx
 8049032:	cd 80                	int    $0x80
 8049034:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 8049037:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804903a:	83 c4 10             	add    $0x10,%esp
 804903d:	5b                   	pop    %ebx
 804903e:	5d                   	pop    %ebp
 804903f:	c3                   	ret    

08049040 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 8049040:	55                   	push   %ebp
 8049041:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 8049043:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049046:	8b 00                	mov    (%eax),%eax
 8049048:	8d 48 01             	lea    0x1(%eax),%ecx
 804904b:	8b 55 0c             	mov    0xc(%ebp),%edx
 804904e:	89 0a                	mov    %ecx,(%edx)
 8049050:	8b 55 08             	mov    0x8(%ebp),%edx
 8049053:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 8049059:	5d                   	pop    %ebp
 804905a:	c3                   	ret    

0804905b <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 804905b:	55                   	push   %ebp
 804905c:	89 e5                	mov    %esp,%ebp
 804905e:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 8049061:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 8049068:	8b 45 0c             	mov    0xc(%ebp),%eax
 804906b:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804906f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049072:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049076:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8049079:	89 44 24 04          	mov    %eax,0x4(%esp)
 804907d:	c7 04 24 40 90 04 08 	movl   $0x8049040,(%esp)
 8049084:	e8 d1 06 00 00       	call   804975a <vprintfmt>
	return cnt;
 8049089:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804908c:	c9                   	leave  
 804908d:	c3                   	ret    

0804908e <printf>:
int printf(const char *fmt, ...)
{
 804908e:	55                   	push   %ebp
 804908f:	89 e5                	mov    %esp,%ebp
 8049091:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8049094:	8d 45 0c             	lea    0xc(%ebp),%eax
 8049097:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 804909a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804909d:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490a1:	8b 45 08             	mov    0x8(%ebp),%eax
 80490a4:	89 04 24             	mov    %eax,(%esp)
 80490a7:	e8 af ff ff ff       	call   804905b <vprintf>
 80490ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 80490af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490b2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490b6:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 80490bd:	08 
 80490be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80490c5:	e8 b7 fe ff ff       	call   8048f81 <syswrite>
	return cnt;
 80490ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490cd:	c9                   	leave  
 80490ce:	c3                   	ret    

080490cf <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 80490cf:	55                   	push   %ebp
 80490d0:	89 e5                	mov    %esp,%ebp
 80490d2:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 80490d5:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 80490dc:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 80490e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80490e3:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80490e8:	89 c8                	mov    %ecx,%eax
 80490ea:	f7 ea                	imul   %edx
 80490ec:	c1 fa 02             	sar    $0x2,%edx
 80490ef:	89 c8                	mov    %ecx,%eax
 80490f1:	c1 f8 1f             	sar    $0x1f,%eax
 80490f4:	29 c2                	sub    %eax,%edx
 80490f6:	89 d0                	mov    %edx,%eax
 80490f8:	c1 e0 02             	shl    $0x2,%eax
 80490fb:	01 d0                	add    %edx,%eax
 80490fd:	01 c0                	add    %eax,%eax
 80490ff:	29 c1                	sub    %eax,%ecx
 8049101:	89 ca                	mov    %ecx,%edx
 8049103:	89 d0                	mov    %edx,%eax
 8049105:	83 c0 30             	add    $0x30,%eax
 8049108:	89 c2                	mov    %eax,%edx
 804910a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804910d:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 804910f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049112:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8049117:	89 c8                	mov    %ecx,%eax
 8049119:	f7 ea                	imul   %edx
 804911b:	c1 fa 02             	sar    $0x2,%edx
 804911e:	89 c8                	mov    %ecx,%eax
 8049120:	c1 f8 1f             	sar    $0x1f,%eax
 8049123:	29 c2                	sub    %eax,%edx
 8049125:	89 d0                	mov    %edx,%eax
 8049127:	89 45 08             	mov    %eax,0x8(%ebp)
 804912a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804912e:	75 ac                	jne    80490dc <itoa+0xd>
	return p;
 8049130:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049133:	c9                   	leave  
 8049134:	c3                   	ret    

08049135 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 8049135:	55                   	push   %ebp
 8049136:	89 e5                	mov    %esp,%ebp
 8049138:	57                   	push   %edi
 8049139:	56                   	push   %esi
 804913a:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 804913b:	8b 45 10             	mov    0x10(%ebp),%eax
 804913e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049141:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049144:	89 c1                	mov    %eax,%ecx
 8049146:	89 d6                	mov    %edx,%esi
 8049148:	89 df                	mov    %ebx,%edi
 804914a:	fc                   	cld    
 804914b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 804914d:	5b                   	pop    %ebx
 804914e:	5e                   	pop    %esi
 804914f:	5f                   	pop    %edi
 8049150:	5d                   	pop    %ebp
 8049151:	c3                   	ret    

08049152 <memset>:

void memset(void *dest, int data, size_t size) {
 8049152:	55                   	push   %ebp
 8049153:	89 e5                	mov    %esp,%ebp
 8049155:	57                   	push   %edi
 8049156:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 8049157:	8b 55 10             	mov    0x10(%ebp),%edx
 804915a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804915d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049160:	89 d1                	mov    %edx,%ecx
 8049162:	89 df                	mov    %ebx,%edi
 8049164:	fc                   	cld    
 8049165:	f3 aa                	rep stos %al,%es:(%edi)
}
 8049167:	5b                   	pop    %ebx
 8049168:	5f                   	pop    %edi
 8049169:	5d                   	pop    %ebp
 804916a:	c3                   	ret    

0804916b <strlen>:

size_t strlen(const char *str) {
 804916b:	55                   	push   %ebp
 804916c:	89 e5                	mov    %esp,%ebp
 804916e:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 8049171:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 8049178:	eb 04                	jmp    804917e <strlen+0x13>
 804917a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804917e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049181:	8d 50 01             	lea    0x1(%eax),%edx
 8049184:	89 55 08             	mov    %edx,0x8(%ebp)
 8049187:	0f b6 00             	movzbl (%eax),%eax
 804918a:	84 c0                	test   %al,%al
 804918c:	75 ec                	jne    804917a <strlen+0xf>
	return len;
 804918e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049191:	c9                   	leave  
 8049192:	c3                   	ret    

08049193 <strcpy>:

void strcpy(char *d, const char *s) {
 8049193:	55                   	push   %ebp
 8049194:	89 e5                	mov    %esp,%ebp
 8049196:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 8049199:	8b 45 0c             	mov    0xc(%ebp),%eax
 804919c:	89 04 24             	mov    %eax,(%esp)
 804919f:	e8 c7 ff ff ff       	call   804916b <strlen>
 80491a4:	83 c0 01             	add    $0x1,%eax
 80491a7:	89 44 24 08          	mov    %eax,0x8(%esp)
 80491ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491b2:	8b 45 08             	mov    0x8(%ebp),%eax
 80491b5:	89 04 24             	mov    %eax,(%esp)
 80491b8:	e8 78 ff ff ff       	call   8049135 <memcpy>
}
 80491bd:	c9                   	leave  
 80491be:	c3                   	ret    

080491bf <strnlen>:

int
strnlen(const char *s, size_t size)
{
 80491bf:	55                   	push   %ebp
 80491c0:	89 e5                	mov    %esp,%ebp
 80491c2:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 80491c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80491cc:	eb 0c                	jmp    80491da <strnlen+0x1b>
		n++;
 80491ce:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 80491d2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80491d6:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 80491da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80491de:	74 0a                	je     80491ea <strnlen+0x2b>
 80491e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80491e3:	0f b6 00             	movzbl (%eax),%eax
 80491e6:	84 c0                	test   %al,%al
 80491e8:	75 e4                	jne    80491ce <strnlen+0xf>
		n++;
	return n;
 80491ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80491ed:	c9                   	leave  
 80491ee:	c3                   	ret    

080491ef <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 80491ef:	55                   	push   %ebp
 80491f0:	89 e5                	mov    %esp,%ebp
 80491f2:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 80491f5:	8b 45 08             	mov    0x8(%ebp),%eax
 80491f8:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 80491fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049202:	eb 23                	jmp    8049227 <strncpy+0x38>
		*dst++ = *src;
 8049204:	8b 45 08             	mov    0x8(%ebp),%eax
 8049207:	8d 50 01             	lea    0x1(%eax),%edx
 804920a:	89 55 08             	mov    %edx,0x8(%ebp)
 804920d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049210:	0f b6 12             	movzbl (%edx),%edx
 8049213:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 8049215:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049218:	0f b6 00             	movzbl (%eax),%eax
 804921b:	84 c0                	test   %al,%al
 804921d:	74 04                	je     8049223 <strncpy+0x34>
			src++;
 804921f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 8049223:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049227:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804922a:	3b 45 10             	cmp    0x10(%ebp),%eax
 804922d:	72 d5                	jb     8049204 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 804922f:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 8049232:	c9                   	leave  
 8049233:	c3                   	ret    

08049234 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 8049234:	55                   	push   %ebp
 8049235:	89 e5                	mov    %esp,%ebp
 8049237:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 804923a:	8b 45 08             	mov    0x8(%ebp),%eax
 804923d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 8049240:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049244:	74 33                	je     8049279 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 8049246:	eb 17                	jmp    804925f <strlcpy+0x2b>
			*dst++ = *src++;
 8049248:	8b 45 08             	mov    0x8(%ebp),%eax
 804924b:	8d 50 01             	lea    0x1(%eax),%edx
 804924e:	89 55 08             	mov    %edx,0x8(%ebp)
 8049251:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049254:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049257:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 804925a:	0f b6 12             	movzbl (%edx),%edx
 804925d:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 804925f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049263:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049267:	74 0a                	je     8049273 <strlcpy+0x3f>
 8049269:	8b 45 0c             	mov    0xc(%ebp),%eax
 804926c:	0f b6 00             	movzbl (%eax),%eax
 804926f:	84 c0                	test   %al,%al
 8049271:	75 d5                	jne    8049248 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 8049273:	8b 45 08             	mov    0x8(%ebp),%eax
 8049276:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 8049279:	8b 55 08             	mov    0x8(%ebp),%edx
 804927c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804927f:	29 c2                	sub    %eax,%edx
 8049281:	89 d0                	mov    %edx,%eax
}
 8049283:	c9                   	leave  
 8049284:	c3                   	ret    

08049285 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 8049285:	55                   	push   %ebp
 8049286:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 8049288:	eb 08                	jmp    8049292 <strcmp+0xd>
		p++, q++;
 804928a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804928e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 8049292:	8b 45 08             	mov    0x8(%ebp),%eax
 8049295:	0f b6 00             	movzbl (%eax),%eax
 8049298:	84 c0                	test   %al,%al
 804929a:	74 10                	je     80492ac <strcmp+0x27>
 804929c:	8b 45 08             	mov    0x8(%ebp),%eax
 804929f:	0f b6 10             	movzbl (%eax),%edx
 80492a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492a5:	0f b6 00             	movzbl (%eax),%eax
 80492a8:	38 c2                	cmp    %al,%dl
 80492aa:	74 de                	je     804928a <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 80492ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80492af:	0f b6 00             	movzbl (%eax),%eax
 80492b2:	0f b6 d0             	movzbl %al,%edx
 80492b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492b8:	0f b6 00             	movzbl (%eax),%eax
 80492bb:	0f b6 c0             	movzbl %al,%eax
 80492be:	29 c2                	sub    %eax,%edx
 80492c0:	89 d0                	mov    %edx,%eax
}
 80492c2:	5d                   	pop    %ebp
 80492c3:	c3                   	ret    

080492c4 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 80492c4:	55                   	push   %ebp
 80492c5:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 80492c7:	eb 0c                	jmp    80492d5 <strncmp+0x11>
		n--, p++, q++;
 80492c9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 80492cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80492d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 80492d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80492d9:	74 1a                	je     80492f5 <strncmp+0x31>
 80492db:	8b 45 08             	mov    0x8(%ebp),%eax
 80492de:	0f b6 00             	movzbl (%eax),%eax
 80492e1:	84 c0                	test   %al,%al
 80492e3:	74 10                	je     80492f5 <strncmp+0x31>
 80492e5:	8b 45 08             	mov    0x8(%ebp),%eax
 80492e8:	0f b6 10             	movzbl (%eax),%edx
 80492eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492ee:	0f b6 00             	movzbl (%eax),%eax
 80492f1:	38 c2                	cmp    %al,%dl
 80492f3:	74 d4                	je     80492c9 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 80492f5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80492f9:	75 07                	jne    8049302 <strncmp+0x3e>
		return 0;
 80492fb:	b8 00 00 00 00       	mov    $0x0,%eax
 8049300:	eb 16                	jmp    8049318 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 8049302:	8b 45 08             	mov    0x8(%ebp),%eax
 8049305:	0f b6 00             	movzbl (%eax),%eax
 8049308:	0f b6 d0             	movzbl %al,%edx
 804930b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804930e:	0f b6 00             	movzbl (%eax),%eax
 8049311:	0f b6 c0             	movzbl %al,%eax
 8049314:	29 c2                	sub    %eax,%edx
 8049316:	89 d0                	mov    %edx,%eax
}
 8049318:	5d                   	pop    %ebp
 8049319:	c3                   	ret    

0804931a <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 804931a:	55                   	push   %ebp
 804931b:	89 e5                	mov    %esp,%ebp
 804931d:	83 ec 04             	sub    $0x4,%esp
 8049320:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049323:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 8049326:	eb 14                	jmp    804933c <strchr+0x22>
		if (*s == c)
 8049328:	8b 45 08             	mov    0x8(%ebp),%eax
 804932b:	0f b6 00             	movzbl (%eax),%eax
 804932e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049331:	75 05                	jne    8049338 <strchr+0x1e>
			return (char *) s;
 8049333:	8b 45 08             	mov    0x8(%ebp),%eax
 8049336:	eb 13                	jmp    804934b <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 8049338:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804933c:	8b 45 08             	mov    0x8(%ebp),%eax
 804933f:	0f b6 00             	movzbl (%eax),%eax
 8049342:	84 c0                	test   %al,%al
 8049344:	75 e2                	jne    8049328 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 8049346:	b8 00 00 00 00       	mov    $0x0,%eax
}
 804934b:	c9                   	leave  
 804934c:	c3                   	ret    

0804934d <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 804934d:	55                   	push   %ebp
 804934e:	89 e5                	mov    %esp,%ebp
 8049350:	83 ec 04             	sub    $0x4,%esp
 8049353:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049356:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 8049359:	eb 11                	jmp    804936c <strfind+0x1f>
		if (*s == c)
 804935b:	8b 45 08             	mov    0x8(%ebp),%eax
 804935e:	0f b6 00             	movzbl (%eax),%eax
 8049361:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049364:	75 02                	jne    8049368 <strfind+0x1b>
			break;
 8049366:	eb 0e                	jmp    8049376 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 8049368:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804936c:	8b 45 08             	mov    0x8(%ebp),%eax
 804936f:	0f b6 00             	movzbl (%eax),%eax
 8049372:	84 c0                	test   %al,%al
 8049374:	75 e5                	jne    804935b <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 8049376:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049379:	c9                   	leave  
 804937a:	c3                   	ret    

0804937b <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 804937b:	55                   	push   %ebp
 804937c:	89 e5                	mov    %esp,%ebp
 804937e:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 8049381:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049384:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 8049387:	8b 45 08             	mov    0x8(%ebp),%eax
 804938a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 804938d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049390:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049393:	73 3d                	jae    80493d2 <memmove+0x57>
 8049395:	8b 45 10             	mov    0x10(%ebp),%eax
 8049398:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804939b:	01 d0                	add    %edx,%eax
 804939d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80493a0:	76 30                	jbe    80493d2 <memmove+0x57>
		s += n;
 80493a2:	8b 45 10             	mov    0x10(%ebp),%eax
 80493a5:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 80493a8:	8b 45 10             	mov    0x10(%ebp),%eax
 80493ab:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 80493ae:	eb 13                	jmp    80493c3 <memmove+0x48>
			*--d = *--s;
 80493b0:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 80493b4:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 80493b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80493bb:	0f b6 10             	movzbl (%eax),%edx
 80493be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80493c1:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 80493c3:	8b 45 10             	mov    0x10(%ebp),%eax
 80493c6:	8d 50 ff             	lea    -0x1(%eax),%edx
 80493c9:	89 55 10             	mov    %edx,0x10(%ebp)
 80493cc:	85 c0                	test   %eax,%eax
 80493ce:	75 e0                	jne    80493b0 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 80493d0:	eb 26                	jmp    80493f8 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 80493d2:	eb 17                	jmp    80493eb <memmove+0x70>
			*d++ = *s++;
 80493d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80493d7:	8d 50 01             	lea    0x1(%eax),%edx
 80493da:	89 55 f8             	mov    %edx,-0x8(%ebp)
 80493dd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80493e0:	8d 4a 01             	lea    0x1(%edx),%ecx
 80493e3:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 80493e6:	0f b6 12             	movzbl (%edx),%edx
 80493e9:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 80493eb:	8b 45 10             	mov    0x10(%ebp),%eax
 80493ee:	8d 50 ff             	lea    -0x1(%eax),%edx
 80493f1:	89 55 10             	mov    %edx,0x10(%ebp)
 80493f4:	85 c0                	test   %eax,%eax
 80493f6:	75 dc                	jne    80493d4 <memmove+0x59>
			*d++ = *s++;

	return dst;
 80493f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80493fb:	c9                   	leave  
 80493fc:	c3                   	ret    

080493fd <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 80493fd:	55                   	push   %ebp
 80493fe:	89 e5                	mov    %esp,%ebp
 8049400:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 8049403:	8b 45 08             	mov    0x8(%ebp),%eax
 8049406:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 8049409:	8b 45 0c             	mov    0xc(%ebp),%eax
 804940c:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 804940f:	eb 30                	jmp    8049441 <memcmp+0x44>
		if (*s1 != *s2)
 8049411:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049414:	0f b6 10             	movzbl (%eax),%edx
 8049417:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804941a:	0f b6 00             	movzbl (%eax),%eax
 804941d:	38 c2                	cmp    %al,%dl
 804941f:	74 18                	je     8049439 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 8049421:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049424:	0f b6 00             	movzbl (%eax),%eax
 8049427:	0f b6 d0             	movzbl %al,%edx
 804942a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804942d:	0f b6 00             	movzbl (%eax),%eax
 8049430:	0f b6 c0             	movzbl %al,%eax
 8049433:	29 c2                	sub    %eax,%edx
 8049435:	89 d0                	mov    %edx,%eax
 8049437:	eb 1a                	jmp    8049453 <memcmp+0x56>
		s1++, s2++;
 8049439:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804943d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 8049441:	8b 45 10             	mov    0x10(%ebp),%eax
 8049444:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049447:	89 55 10             	mov    %edx,0x10(%ebp)
 804944a:	85 c0                	test   %eax,%eax
 804944c:	75 c3                	jne    8049411 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 804944e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8049453:	c9                   	leave  
 8049454:	c3                   	ret    

08049455 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 8049455:	55                   	push   %ebp
 8049456:	89 e5                	mov    %esp,%ebp
 8049458:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 804945b:	8b 45 10             	mov    0x10(%ebp),%eax
 804945e:	8b 55 08             	mov    0x8(%ebp),%edx
 8049461:	01 d0                	add    %edx,%eax
 8049463:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 8049466:	eb 13                	jmp    804947b <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 8049468:	8b 45 08             	mov    0x8(%ebp),%eax
 804946b:	0f b6 10             	movzbl (%eax),%edx
 804946e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049471:	38 c2                	cmp    %al,%dl
 8049473:	75 02                	jne    8049477 <memfind+0x22>
			break;
 8049475:	eb 0c                	jmp    8049483 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 8049477:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804947b:	8b 45 08             	mov    0x8(%ebp),%eax
 804947e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8049481:	72 e5                	jb     8049468 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 8049483:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049486:	c9                   	leave  
 8049487:	c3                   	ret    

08049488 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 8049488:	55                   	push   %ebp
 8049489:	89 e5                	mov    %esp,%ebp
 804948b:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 804948e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 8049495:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 804949c:	eb 04                	jmp    80494a2 <strtol+0x1a>
		s++;
 804949e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 80494a2:	8b 45 08             	mov    0x8(%ebp),%eax
 80494a5:	0f b6 00             	movzbl (%eax),%eax
 80494a8:	3c 20                	cmp    $0x20,%al
 80494aa:	74 f2                	je     804949e <strtol+0x16>
 80494ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80494af:	0f b6 00             	movzbl (%eax),%eax
 80494b2:	3c 09                	cmp    $0x9,%al
 80494b4:	74 e8                	je     804949e <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 80494b6:	8b 45 08             	mov    0x8(%ebp),%eax
 80494b9:	0f b6 00             	movzbl (%eax),%eax
 80494bc:	3c 2b                	cmp    $0x2b,%al
 80494be:	75 06                	jne    80494c6 <strtol+0x3e>
		s++;
 80494c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80494c4:	eb 15                	jmp    80494db <strtol+0x53>
	else if (*s == '-')
 80494c6:	8b 45 08             	mov    0x8(%ebp),%eax
 80494c9:	0f b6 00             	movzbl (%eax),%eax
 80494cc:	3c 2d                	cmp    $0x2d,%al
 80494ce:	75 0b                	jne    80494db <strtol+0x53>
		s++, neg = 1;
 80494d0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80494d4:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 80494db:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80494df:	74 06                	je     80494e7 <strtol+0x5f>
 80494e1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 80494e5:	75 24                	jne    804950b <strtol+0x83>
 80494e7:	8b 45 08             	mov    0x8(%ebp),%eax
 80494ea:	0f b6 00             	movzbl (%eax),%eax
 80494ed:	3c 30                	cmp    $0x30,%al
 80494ef:	75 1a                	jne    804950b <strtol+0x83>
 80494f1:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f4:	83 c0 01             	add    $0x1,%eax
 80494f7:	0f b6 00             	movzbl (%eax),%eax
 80494fa:	3c 78                	cmp    $0x78,%al
 80494fc:	75 0d                	jne    804950b <strtol+0x83>
		s += 2, base = 16;
 80494fe:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 8049502:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 8049509:	eb 2a                	jmp    8049535 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 804950b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804950f:	75 17                	jne    8049528 <strtol+0xa0>
 8049511:	8b 45 08             	mov    0x8(%ebp),%eax
 8049514:	0f b6 00             	movzbl (%eax),%eax
 8049517:	3c 30                	cmp    $0x30,%al
 8049519:	75 0d                	jne    8049528 <strtol+0xa0>
		s++, base = 8;
 804951b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804951f:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 8049526:	eb 0d                	jmp    8049535 <strtol+0xad>
	else if (base == 0)
 8049528:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804952c:	75 07                	jne    8049535 <strtol+0xad>
		base = 10;
 804952e:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 8049535:	8b 45 08             	mov    0x8(%ebp),%eax
 8049538:	0f b6 00             	movzbl (%eax),%eax
 804953b:	3c 2f                	cmp    $0x2f,%al
 804953d:	7e 1b                	jle    804955a <strtol+0xd2>
 804953f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049542:	0f b6 00             	movzbl (%eax),%eax
 8049545:	3c 39                	cmp    $0x39,%al
 8049547:	7f 11                	jg     804955a <strtol+0xd2>
			dig = *s - '0';
 8049549:	8b 45 08             	mov    0x8(%ebp),%eax
 804954c:	0f b6 00             	movzbl (%eax),%eax
 804954f:	0f be c0             	movsbl %al,%eax
 8049552:	83 e8 30             	sub    $0x30,%eax
 8049555:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049558:	eb 48                	jmp    80495a2 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 804955a:	8b 45 08             	mov    0x8(%ebp),%eax
 804955d:	0f b6 00             	movzbl (%eax),%eax
 8049560:	3c 60                	cmp    $0x60,%al
 8049562:	7e 1b                	jle    804957f <strtol+0xf7>
 8049564:	8b 45 08             	mov    0x8(%ebp),%eax
 8049567:	0f b6 00             	movzbl (%eax),%eax
 804956a:	3c 7a                	cmp    $0x7a,%al
 804956c:	7f 11                	jg     804957f <strtol+0xf7>
			dig = *s - 'a' + 10;
 804956e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049571:	0f b6 00             	movzbl (%eax),%eax
 8049574:	0f be c0             	movsbl %al,%eax
 8049577:	83 e8 57             	sub    $0x57,%eax
 804957a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804957d:	eb 23                	jmp    80495a2 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 804957f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049582:	0f b6 00             	movzbl (%eax),%eax
 8049585:	3c 40                	cmp    $0x40,%al
 8049587:	7e 3d                	jle    80495c6 <strtol+0x13e>
 8049589:	8b 45 08             	mov    0x8(%ebp),%eax
 804958c:	0f b6 00             	movzbl (%eax),%eax
 804958f:	3c 5a                	cmp    $0x5a,%al
 8049591:	7f 33                	jg     80495c6 <strtol+0x13e>
			dig = *s - 'A' + 10;
 8049593:	8b 45 08             	mov    0x8(%ebp),%eax
 8049596:	0f b6 00             	movzbl (%eax),%eax
 8049599:	0f be c0             	movsbl %al,%eax
 804959c:	83 e8 37             	sub    $0x37,%eax
 804959f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 80495a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80495a5:	3b 45 10             	cmp    0x10(%ebp),%eax
 80495a8:	7c 02                	jl     80495ac <strtol+0x124>
			break;
 80495aa:	eb 1a                	jmp    80495c6 <strtol+0x13e>
		s++, val = (val * base) + dig;
 80495ac:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80495b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80495b3:	0f af 45 10          	imul   0x10(%ebp),%eax
 80495b7:	89 c2                	mov    %eax,%edx
 80495b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80495bc:	01 d0                	add    %edx,%eax
 80495be:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 80495c1:	e9 6f ff ff ff       	jmp    8049535 <strtol+0xad>

	if (endptr)
 80495c6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80495ca:	74 08                	je     80495d4 <strtol+0x14c>
		*endptr = (char *) s;
 80495cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495cf:	8b 55 08             	mov    0x8(%ebp),%edx
 80495d2:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 80495d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 80495d8:	74 07                	je     80495e1 <strtol+0x159>
 80495da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80495dd:	f7 d8                	neg    %eax
 80495df:	eb 03                	jmp    80495e4 <strtol+0x15c>
 80495e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80495e4:	c9                   	leave  
 80495e5:	c3                   	ret    

080495e6 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 80495e6:	55                   	push   %ebp
 80495e7:	89 e5                	mov    %esp,%ebp
 80495e9:	53                   	push   %ebx
 80495ea:	83 ec 34             	sub    $0x34,%esp
 80495ed:	8b 45 10             	mov    0x10(%ebp),%eax
 80495f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80495f3:	8b 45 14             	mov    0x14(%ebp),%eax
 80495f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 80495f9:	8b 45 18             	mov    0x18(%ebp),%eax
 80495fc:	ba 00 00 00 00       	mov    $0x0,%edx
 8049601:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 8049604:	77 72                	ja     8049678 <printnum+0x92>
 8049606:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 8049609:	72 05                	jb     8049610 <printnum+0x2a>
 804960b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 804960e:	77 68                	ja     8049678 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 8049610:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049613:	8d 58 ff             	lea    -0x1(%eax),%ebx
 8049616:	8b 45 18             	mov    0x18(%ebp),%eax
 8049619:	ba 00 00 00 00       	mov    $0x0,%edx
 804961e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049622:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049626:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049629:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804962c:	89 04 24             	mov    %eax,(%esp)
 804962f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049633:	e8 58 06 00 00       	call   8049c90 <__udivdi3>
 8049638:	8b 4d 20             	mov    0x20(%ebp),%ecx
 804963b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 804963f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 8049643:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049646:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 804964a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804964e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049652:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049655:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049659:	8b 45 08             	mov    0x8(%ebp),%eax
 804965c:	89 04 24             	mov    %eax,(%esp)
 804965f:	e8 82 ff ff ff       	call   80495e6 <printnum>
 8049664:	eb 1c                	jmp    8049682 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 8049666:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049669:	89 44 24 04          	mov    %eax,0x4(%esp)
 804966d:	8b 45 20             	mov    0x20(%ebp),%eax
 8049670:	89 04 24             	mov    %eax,(%esp)
 8049673:	8b 45 08             	mov    0x8(%ebp),%eax
 8049676:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 8049678:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 804967c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 8049680:	7f e4                	jg     8049666 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 8049682:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049685:	bb 00 00 00 00       	mov    $0x0,%ebx
 804968a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804968d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049690:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049694:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049698:	89 04 24             	mov    %eax,(%esp)
 804969b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804969f:	e8 1c 07 00 00       	call   8049dc0 <__umoddi3>
 80496a4:	05 68 a1 04 08       	add    $0x804a168,%eax
 80496a9:	0f b6 00             	movzbl (%eax),%eax
 80496ac:	0f be c0             	movsbl %al,%eax
 80496af:	8b 55 0c             	mov    0xc(%ebp),%edx
 80496b2:	89 54 24 04          	mov    %edx,0x4(%esp)
 80496b6:	89 04 24             	mov    %eax,(%esp)
 80496b9:	8b 45 08             	mov    0x8(%ebp),%eax
 80496bc:	ff d0                	call   *%eax
}
 80496be:	83 c4 34             	add    $0x34,%esp
 80496c1:	5b                   	pop    %ebx
 80496c2:	5d                   	pop    %ebp
 80496c3:	c3                   	ret    

080496c4 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 80496c4:	55                   	push   %ebp
 80496c5:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 80496c7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 80496cb:	7e 14                	jle    80496e1 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 80496cd:	8b 45 08             	mov    0x8(%ebp),%eax
 80496d0:	8b 00                	mov    (%eax),%eax
 80496d2:	8d 48 08             	lea    0x8(%eax),%ecx
 80496d5:	8b 55 08             	mov    0x8(%ebp),%edx
 80496d8:	89 0a                	mov    %ecx,(%edx)
 80496da:	8b 50 04             	mov    0x4(%eax),%edx
 80496dd:	8b 00                	mov    (%eax),%eax
 80496df:	eb 30                	jmp    8049711 <getuint+0x4d>
	else if (lflag)
 80496e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80496e5:	74 16                	je     80496fd <getuint+0x39>
		return va_arg(*ap, unsigned long);
 80496e7:	8b 45 08             	mov    0x8(%ebp),%eax
 80496ea:	8b 00                	mov    (%eax),%eax
 80496ec:	8d 48 04             	lea    0x4(%eax),%ecx
 80496ef:	8b 55 08             	mov    0x8(%ebp),%edx
 80496f2:	89 0a                	mov    %ecx,(%edx)
 80496f4:	8b 00                	mov    (%eax),%eax
 80496f6:	ba 00 00 00 00       	mov    $0x0,%edx
 80496fb:	eb 14                	jmp    8049711 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 80496fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049700:	8b 00                	mov    (%eax),%eax
 8049702:	8d 48 04             	lea    0x4(%eax),%ecx
 8049705:	8b 55 08             	mov    0x8(%ebp),%edx
 8049708:	89 0a                	mov    %ecx,(%edx)
 804970a:	8b 00                	mov    (%eax),%eax
 804970c:	ba 00 00 00 00       	mov    $0x0,%edx
}
 8049711:	5d                   	pop    %ebp
 8049712:	c3                   	ret    

08049713 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 8049713:	55                   	push   %ebp
 8049714:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 8049716:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 804971a:	7e 14                	jle    8049730 <getint+0x1d>
		return va_arg(*ap, long long);
 804971c:	8b 45 08             	mov    0x8(%ebp),%eax
 804971f:	8b 00                	mov    (%eax),%eax
 8049721:	8d 48 08             	lea    0x8(%eax),%ecx
 8049724:	8b 55 08             	mov    0x8(%ebp),%edx
 8049727:	89 0a                	mov    %ecx,(%edx)
 8049729:	8b 50 04             	mov    0x4(%eax),%edx
 804972c:	8b 00                	mov    (%eax),%eax
 804972e:	eb 28                	jmp    8049758 <getint+0x45>
	else if (lflag)
 8049730:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049734:	74 12                	je     8049748 <getint+0x35>
		return va_arg(*ap, long);
 8049736:	8b 45 08             	mov    0x8(%ebp),%eax
 8049739:	8b 00                	mov    (%eax),%eax
 804973b:	8d 48 04             	lea    0x4(%eax),%ecx
 804973e:	8b 55 08             	mov    0x8(%ebp),%edx
 8049741:	89 0a                	mov    %ecx,(%edx)
 8049743:	8b 00                	mov    (%eax),%eax
 8049745:	99                   	cltd   
 8049746:	eb 10                	jmp    8049758 <getint+0x45>
	else
		return va_arg(*ap, int);
 8049748:	8b 45 08             	mov    0x8(%ebp),%eax
 804974b:	8b 00                	mov    (%eax),%eax
 804974d:	8d 48 04             	lea    0x4(%eax),%ecx
 8049750:	8b 55 08             	mov    0x8(%ebp),%edx
 8049753:	89 0a                	mov    %ecx,(%edx)
 8049755:	8b 00                	mov    (%eax),%eax
 8049757:	99                   	cltd   
}
 8049758:	5d                   	pop    %ebp
 8049759:	c3                   	ret    

0804975a <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 804975a:	55                   	push   %ebp
 804975b:	89 e5                	mov    %esp,%ebp
 804975d:	56                   	push   %esi
 804975e:	53                   	push   %ebx
 804975f:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049762:	eb 18                	jmp    804977c <vprintfmt+0x22>
			if (ch == '\0')
 8049764:	85 db                	test   %ebx,%ebx
 8049766:	75 05                	jne    804976d <vprintfmt+0x13>
				return;
 8049768:	e9 e9 03 00 00       	jmp    8049b56 <vprintfmt+0x3fc>
			putch(ch, putdat);
 804976d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049770:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049774:	89 1c 24             	mov    %ebx,(%esp)
 8049777:	8b 45 08             	mov    0x8(%ebp),%eax
 804977a:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 804977c:	8b 45 10             	mov    0x10(%ebp),%eax
 804977f:	8d 50 01             	lea    0x1(%eax),%edx
 8049782:	89 55 10             	mov    %edx,0x10(%ebp)
 8049785:	0f b6 00             	movzbl (%eax),%eax
 8049788:	0f b6 d8             	movzbl %al,%ebx
 804978b:	83 fb 25             	cmp    $0x25,%ebx
 804978e:	75 d4                	jne    8049764 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 8049790:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 8049794:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 804979b:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 80497a2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 80497a9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 80497b0:	8b 45 10             	mov    0x10(%ebp),%eax
 80497b3:	8d 50 01             	lea    0x1(%eax),%edx
 80497b6:	89 55 10             	mov    %edx,0x10(%ebp)
 80497b9:	0f b6 00             	movzbl (%eax),%eax
 80497bc:	0f b6 d8             	movzbl %al,%ebx
 80497bf:	8d 43 dd             	lea    -0x23(%ebx),%eax
 80497c2:	83 f8 55             	cmp    $0x55,%eax
 80497c5:	0f 87 5a 03 00 00    	ja     8049b25 <vprintfmt+0x3cb>
 80497cb:	8b 04 85 8c a1 04 08 	mov    0x804a18c(,%eax,4),%eax
 80497d2:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 80497d4:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 80497d8:	eb d6                	jmp    80497b0 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 80497da:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 80497de:	eb d0                	jmp    80497b0 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 80497e0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 80497e7:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80497ea:	89 d0                	mov    %edx,%eax
 80497ec:	c1 e0 02             	shl    $0x2,%eax
 80497ef:	01 d0                	add    %edx,%eax
 80497f1:	01 c0                	add    %eax,%eax
 80497f3:	01 d8                	add    %ebx,%eax
 80497f5:	83 e8 30             	sub    $0x30,%eax
 80497f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 80497fb:	8b 45 10             	mov    0x10(%ebp),%eax
 80497fe:	0f b6 00             	movzbl (%eax),%eax
 8049801:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 8049804:	83 fb 2f             	cmp    $0x2f,%ebx
 8049807:	7e 0b                	jle    8049814 <vprintfmt+0xba>
 8049809:	83 fb 39             	cmp    $0x39,%ebx
 804980c:	7f 06                	jg     8049814 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 804980e:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 8049812:	eb d3                	jmp    80497e7 <vprintfmt+0x8d>
			goto process_precision;
 8049814:	eb 33                	jmp    8049849 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 8049816:	8b 45 14             	mov    0x14(%ebp),%eax
 8049819:	8d 50 04             	lea    0x4(%eax),%edx
 804981c:	89 55 14             	mov    %edx,0x14(%ebp)
 804981f:	8b 00                	mov    (%eax),%eax
 8049821:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 8049824:	eb 23                	jmp    8049849 <vprintfmt+0xef>

		case '.':
			if (width < 0)
 8049826:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804982a:	79 0c                	jns    8049838 <vprintfmt+0xde>
				width = 0;
 804982c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 8049833:	e9 78 ff ff ff       	jmp    80497b0 <vprintfmt+0x56>
 8049838:	e9 73 ff ff ff       	jmp    80497b0 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 804983d:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 8049844:	e9 67 ff ff ff       	jmp    80497b0 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 8049849:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804984d:	79 12                	jns    8049861 <vprintfmt+0x107>
				width = precision, precision = -1;
 804984f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049852:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8049855:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 804985c:	e9 4f ff ff ff       	jmp    80497b0 <vprintfmt+0x56>
 8049861:	e9 4a ff ff ff       	jmp    80497b0 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 8049866:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 804986a:	e9 41 ff ff ff       	jmp    80497b0 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 804986f:	8b 45 14             	mov    0x14(%ebp),%eax
 8049872:	8d 50 04             	lea    0x4(%eax),%edx
 8049875:	89 55 14             	mov    %edx,0x14(%ebp)
 8049878:	8b 00                	mov    (%eax),%eax
 804987a:	8b 55 0c             	mov    0xc(%ebp),%edx
 804987d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049881:	89 04 24             	mov    %eax,(%esp)
 8049884:	8b 45 08             	mov    0x8(%ebp),%eax
 8049887:	ff d0                	call   *%eax
			break;
 8049889:	e9 c2 02 00 00       	jmp    8049b50 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 804988e:	8b 45 14             	mov    0x14(%ebp),%eax
 8049891:	8d 50 04             	lea    0x4(%eax),%edx
 8049894:	89 55 14             	mov    %edx,0x14(%ebp)
 8049897:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 8049899:	85 db                	test   %ebx,%ebx
 804989b:	79 02                	jns    804989f <vprintfmt+0x145>
				err = -err;
 804989d:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 804989f:	83 fb 06             	cmp    $0x6,%ebx
 80498a2:	7f 0b                	jg     80498af <vprintfmt+0x155>
 80498a4:	8b 34 9d 4c a1 04 08 	mov    0x804a14c(,%ebx,4),%esi
 80498ab:	85 f6                	test   %esi,%esi
 80498ad:	75 23                	jne    80498d2 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 80498af:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 80498b3:	c7 44 24 08 79 a1 04 	movl   $0x804a179,0x8(%esp)
 80498ba:	08 
 80498bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498be:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498c2:	8b 45 08             	mov    0x8(%ebp),%eax
 80498c5:	89 04 24             	mov    %eax,(%esp)
 80498c8:	e8 90 02 00 00       	call   8049b5d <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 80498cd:	e9 7e 02 00 00       	jmp    8049b50 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 80498d2:	89 74 24 0c          	mov    %esi,0xc(%esp)
 80498d6:	c7 44 24 08 82 a1 04 	movl   $0x804a182,0x8(%esp)
 80498dd:	08 
 80498de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498e5:	8b 45 08             	mov    0x8(%ebp),%eax
 80498e8:	89 04 24             	mov    %eax,(%esp)
 80498eb:	e8 6d 02 00 00       	call   8049b5d <printfmt>
			break;
 80498f0:	e9 5b 02 00 00       	jmp    8049b50 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 80498f5:	8b 45 14             	mov    0x14(%ebp),%eax
 80498f8:	8d 50 04             	lea    0x4(%eax),%edx
 80498fb:	89 55 14             	mov    %edx,0x14(%ebp)
 80498fe:	8b 30                	mov    (%eax),%esi
 8049900:	85 f6                	test   %esi,%esi
 8049902:	75 05                	jne    8049909 <vprintfmt+0x1af>
				p = "(null)";
 8049904:	be 85 a1 04 08       	mov    $0x804a185,%esi
			if (width > 0 && padc != '-')
 8049909:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804990d:	7e 37                	jle    8049946 <vprintfmt+0x1ec>
 804990f:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 8049913:	74 31                	je     8049946 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 8049915:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049918:	89 44 24 04          	mov    %eax,0x4(%esp)
 804991c:	89 34 24             	mov    %esi,(%esp)
 804991f:	e8 9b f8 ff ff       	call   80491bf <strnlen>
 8049924:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 8049927:	eb 17                	jmp    8049940 <vprintfmt+0x1e6>
					putch(padc, putdat);
 8049929:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 804992d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049930:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049934:	89 04 24             	mov    %eax,(%esp)
 8049937:	8b 45 08             	mov    0x8(%ebp),%eax
 804993a:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 804993c:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049940:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049944:	7f e3                	jg     8049929 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049946:	eb 38                	jmp    8049980 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 8049948:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 804994c:	74 1f                	je     804996d <vprintfmt+0x213>
 804994e:	83 fb 1f             	cmp    $0x1f,%ebx
 8049951:	7e 05                	jle    8049958 <vprintfmt+0x1fe>
 8049953:	83 fb 7e             	cmp    $0x7e,%ebx
 8049956:	7e 15                	jle    804996d <vprintfmt+0x213>
					putch('?', putdat);
 8049958:	8b 45 0c             	mov    0xc(%ebp),%eax
 804995b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804995f:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 8049966:	8b 45 08             	mov    0x8(%ebp),%eax
 8049969:	ff d0                	call   *%eax
 804996b:	eb 0f                	jmp    804997c <vprintfmt+0x222>
				else
					putch(ch, putdat);
 804996d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049970:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049974:	89 1c 24             	mov    %ebx,(%esp)
 8049977:	8b 45 08             	mov    0x8(%ebp),%eax
 804997a:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 804997c:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049980:	89 f0                	mov    %esi,%eax
 8049982:	8d 70 01             	lea    0x1(%eax),%esi
 8049985:	0f b6 00             	movzbl (%eax),%eax
 8049988:	0f be d8             	movsbl %al,%ebx
 804998b:	85 db                	test   %ebx,%ebx
 804998d:	74 10                	je     804999f <vprintfmt+0x245>
 804998f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049993:	78 b3                	js     8049948 <vprintfmt+0x1ee>
 8049995:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 8049999:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 804999d:	79 a9                	jns    8049948 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 804999f:	eb 17                	jmp    80499b8 <vprintfmt+0x25e>
				putch(' ', putdat);
 80499a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499a8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 80499af:	8b 45 08             	mov    0x8(%ebp),%eax
 80499b2:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 80499b4:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80499b8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80499bc:	7f e3                	jg     80499a1 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 80499be:	e9 8d 01 00 00       	jmp    8049b50 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 80499c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80499c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499ca:	8d 45 14             	lea    0x14(%ebp),%eax
 80499cd:	89 04 24             	mov    %eax,(%esp)
 80499d0:	e8 3e fd ff ff       	call   8049713 <getint>
 80499d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80499d8:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 80499db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80499de:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80499e1:	85 d2                	test   %edx,%edx
 80499e3:	79 26                	jns    8049a0b <vprintfmt+0x2b1>
				putch('-', putdat);
 80499e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499ec:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 80499f3:	8b 45 08             	mov    0x8(%ebp),%eax
 80499f6:	ff d0                	call   *%eax
				num = -(long long) num;
 80499f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80499fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80499fe:	f7 d8                	neg    %eax
 8049a00:	83 d2 00             	adc    $0x0,%edx
 8049a03:	f7 da                	neg    %edx
 8049a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a08:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049a0b:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049a12:	e9 c5 00 00 00       	jmp    8049adc <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 8049a17:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049a1a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a1e:	8d 45 14             	lea    0x14(%ebp),%eax
 8049a21:	89 04 24             	mov    %eax,(%esp)
 8049a24:	e8 9b fc ff ff       	call   80496c4 <getuint>
 8049a29:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a2c:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049a2f:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049a36:	e9 a1 00 00 00       	jmp    8049adc <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 8049a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a3e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a42:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049a49:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a4c:	ff d0                	call   *%eax
			putch('X', putdat);
 8049a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a51:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a55:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049a5c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a5f:	ff d0                	call   *%eax
			putch('X', putdat);
 8049a61:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a64:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a68:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049a6f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a72:	ff d0                	call   *%eax
			break;
 8049a74:	e9 d7 00 00 00       	jmp    8049b50 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 8049a79:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a7c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a80:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 8049a87:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a8a:	ff d0                	call   *%eax
			putch('x', putdat);
 8049a8c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a8f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a93:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049a9a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a9d:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049a9f:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aa2:	8d 50 04             	lea    0x4(%eax),%edx
 8049aa5:	89 55 14             	mov    %edx,0x14(%ebp)
 8049aa8:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049aaa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049aad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049ab4:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049abb:	eb 1f                	jmp    8049adc <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049abd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049ac0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ac4:	8d 45 14             	lea    0x14(%ebp),%eax
 8049ac7:	89 04 24             	mov    %eax,(%esp)
 8049aca:	e8 f5 fb ff ff       	call   80496c4 <getuint>
 8049acf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049ad2:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049ad5:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049adc:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049ae0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049ae3:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049ae7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049aea:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049aee:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049af2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049af5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049af8:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049afc:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049b00:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b03:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b07:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b0a:	89 04 24             	mov    %eax,(%esp)
 8049b0d:	e8 d4 fa ff ff       	call   80495e6 <printnum>
			break;
 8049b12:	eb 3c                	jmp    8049b50 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049b14:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b17:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b1b:	89 1c 24             	mov    %ebx,(%esp)
 8049b1e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b21:	ff d0                	call   *%eax
			break;
 8049b23:	eb 2b                	jmp    8049b50 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049b25:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b28:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b2c:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049b33:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b36:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049b38:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049b3c:	eb 04                	jmp    8049b42 <vprintfmt+0x3e8>
 8049b3e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049b42:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b45:	83 e8 01             	sub    $0x1,%eax
 8049b48:	0f b6 00             	movzbl (%eax),%eax
 8049b4b:	3c 25                	cmp    $0x25,%al
 8049b4d:	75 ef                	jne    8049b3e <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049b4f:	90                   	nop
		}
	}
 8049b50:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049b51:	e9 26 fc ff ff       	jmp    804977c <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049b56:	83 c4 40             	add    $0x40,%esp
 8049b59:	5b                   	pop    %ebx
 8049b5a:	5e                   	pop    %esi
 8049b5b:	5d                   	pop    %ebp
 8049b5c:	c3                   	ret    

08049b5d <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049b5d:	55                   	push   %ebp
 8049b5e:	89 e5                	mov    %esp,%ebp
 8049b60:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049b63:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b66:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049b6c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b70:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b73:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b77:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b7a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b7e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b81:	89 04 24             	mov    %eax,(%esp)
 8049b84:	e8 d1 fb ff ff       	call   804975a <vprintfmt>
	va_end(ap);
}
 8049b89:	c9                   	leave  
 8049b8a:	c3                   	ret    

08049b8b <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049b8b:	55                   	push   %ebp
 8049b8c:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b91:	8b 40 08             	mov    0x8(%eax),%eax
 8049b94:	8d 50 01             	lea    0x1(%eax),%edx
 8049b97:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b9a:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049b9d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba0:	8b 10                	mov    (%eax),%edx
 8049ba2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba5:	8b 40 04             	mov    0x4(%eax),%eax
 8049ba8:	39 c2                	cmp    %eax,%edx
 8049baa:	73 12                	jae    8049bbe <sprintputch+0x33>
		*b->buf++ = ch;
 8049bac:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049baf:	8b 00                	mov    (%eax),%eax
 8049bb1:	8d 48 01             	lea    0x1(%eax),%ecx
 8049bb4:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049bb7:	89 0a                	mov    %ecx,(%edx)
 8049bb9:	8b 55 08             	mov    0x8(%ebp),%edx
 8049bbc:	88 10                	mov    %dl,(%eax)
}
 8049bbe:	5d                   	pop    %ebp
 8049bbf:	c3                   	ret    

08049bc0 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049bc0:	55                   	push   %ebp
 8049bc1:	89 e5                	mov    %esp,%ebp
 8049bc3:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049bc6:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bc9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049bcc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bcf:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049bd2:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bd5:	01 d0                	add    %edx,%eax
 8049bd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bda:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049be1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049be5:	74 06                	je     8049bed <vsnprintf+0x2d>
 8049be7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049beb:	7f 07                	jg     8049bf4 <vsnprintf+0x34>
		return -E_INVAL;
 8049bed:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049bf2:	eb 2a                	jmp    8049c1e <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049bf4:	8b 45 14             	mov    0x14(%ebp),%eax
 8049bf7:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049bfb:	8b 45 10             	mov    0x10(%ebp),%eax
 8049bfe:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049c02:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049c05:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c09:	c7 04 24 8b 9b 04 08 	movl   $0x8049b8b,(%esp)
 8049c10:	e8 45 fb ff ff       	call   804975a <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049c15:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c18:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049c1e:	c9                   	leave  
 8049c1f:	c3                   	ret    

08049c20 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049c20:	55                   	push   %ebp
 8049c21:	89 e5                	mov    %esp,%ebp
 8049c23:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049c26:	8d 45 14             	lea    0x14(%ebp),%eax
 8049c29:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049c2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049c2f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049c33:	8b 45 10             	mov    0x10(%ebp),%eax
 8049c36:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049c3a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c3d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c41:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c44:	89 04 24             	mov    %eax,(%esp)
 8049c47:	e8 74 ff ff ff       	call   8049bc0 <vsnprintf>
 8049c4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049c4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049c52:	c9                   	leave  
 8049c53:	c3                   	ret    

08049c54 <srand>:
static int seed = 0;

void
srand(int s) {
 8049c54:	55                   	push   %ebp
 8049c55:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049c57:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c5a:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049c5f:	5d                   	pop    %ebp
 8049c60:	c3                   	ret    

08049c61 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049c61:	55                   	push   %ebp
 8049c62:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049c64:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049c69:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049c6f:	83 c0 01             	add    $0x1,%eax
 8049c72:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049c77:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049c7c:	c1 f8 10             	sar    $0x10,%eax
 8049c7f:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049c84:	5d                   	pop    %ebp
 8049c85:	c3                   	ret    
 8049c86:	66 90                	xchg   %ax,%ax
 8049c88:	66 90                	xchg   %ax,%ax
 8049c8a:	66 90                	xchg   %ax,%ax
 8049c8c:	66 90                	xchg   %ax,%ax
 8049c8e:	66 90                	xchg   %ax,%ax

08049c90 <__udivdi3>:
 8049c90:	55                   	push   %ebp
 8049c91:	57                   	push   %edi
 8049c92:	56                   	push   %esi
 8049c93:	83 ec 0c             	sub    $0xc,%esp
 8049c96:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049c9a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049c9e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049ca2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049ca6:	85 c0                	test   %eax,%eax
 8049ca8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049cac:	89 ea                	mov    %ebp,%edx
 8049cae:	89 0c 24             	mov    %ecx,(%esp)
 8049cb1:	75 2d                	jne    8049ce0 <__udivdi3+0x50>
 8049cb3:	39 e9                	cmp    %ebp,%ecx
 8049cb5:	77 61                	ja     8049d18 <__udivdi3+0x88>
 8049cb7:	85 c9                	test   %ecx,%ecx
 8049cb9:	89 ce                	mov    %ecx,%esi
 8049cbb:	75 0b                	jne    8049cc8 <__udivdi3+0x38>
 8049cbd:	b8 01 00 00 00       	mov    $0x1,%eax
 8049cc2:	31 d2                	xor    %edx,%edx
 8049cc4:	f7 f1                	div    %ecx
 8049cc6:	89 c6                	mov    %eax,%esi
 8049cc8:	31 d2                	xor    %edx,%edx
 8049cca:	89 e8                	mov    %ebp,%eax
 8049ccc:	f7 f6                	div    %esi
 8049cce:	89 c5                	mov    %eax,%ebp
 8049cd0:	89 f8                	mov    %edi,%eax
 8049cd2:	f7 f6                	div    %esi
 8049cd4:	89 ea                	mov    %ebp,%edx
 8049cd6:	83 c4 0c             	add    $0xc,%esp
 8049cd9:	5e                   	pop    %esi
 8049cda:	5f                   	pop    %edi
 8049cdb:	5d                   	pop    %ebp
 8049cdc:	c3                   	ret    
 8049cdd:	8d 76 00             	lea    0x0(%esi),%esi
 8049ce0:	39 e8                	cmp    %ebp,%eax
 8049ce2:	77 24                	ja     8049d08 <__udivdi3+0x78>
 8049ce4:	0f bd e8             	bsr    %eax,%ebp
 8049ce7:	83 f5 1f             	xor    $0x1f,%ebp
 8049cea:	75 3c                	jne    8049d28 <__udivdi3+0x98>
 8049cec:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049cf0:	39 34 24             	cmp    %esi,(%esp)
 8049cf3:	0f 86 9f 00 00 00    	jbe    8049d98 <__udivdi3+0x108>
 8049cf9:	39 d0                	cmp    %edx,%eax
 8049cfb:	0f 82 97 00 00 00    	jb     8049d98 <__udivdi3+0x108>
 8049d01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049d08:	31 d2                	xor    %edx,%edx
 8049d0a:	31 c0                	xor    %eax,%eax
 8049d0c:	83 c4 0c             	add    $0xc,%esp
 8049d0f:	5e                   	pop    %esi
 8049d10:	5f                   	pop    %edi
 8049d11:	5d                   	pop    %ebp
 8049d12:	c3                   	ret    
 8049d13:	90                   	nop
 8049d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049d18:	89 f8                	mov    %edi,%eax
 8049d1a:	f7 f1                	div    %ecx
 8049d1c:	31 d2                	xor    %edx,%edx
 8049d1e:	83 c4 0c             	add    $0xc,%esp
 8049d21:	5e                   	pop    %esi
 8049d22:	5f                   	pop    %edi
 8049d23:	5d                   	pop    %ebp
 8049d24:	c3                   	ret    
 8049d25:	8d 76 00             	lea    0x0(%esi),%esi
 8049d28:	89 e9                	mov    %ebp,%ecx
 8049d2a:	8b 3c 24             	mov    (%esp),%edi
 8049d2d:	d3 e0                	shl    %cl,%eax
 8049d2f:	89 c6                	mov    %eax,%esi
 8049d31:	b8 20 00 00 00       	mov    $0x20,%eax
 8049d36:	29 e8                	sub    %ebp,%eax
 8049d38:	89 c1                	mov    %eax,%ecx
 8049d3a:	d3 ef                	shr    %cl,%edi
 8049d3c:	89 e9                	mov    %ebp,%ecx
 8049d3e:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049d42:	8b 3c 24             	mov    (%esp),%edi
 8049d45:	09 74 24 08          	or     %esi,0x8(%esp)
 8049d49:	89 d6                	mov    %edx,%esi
 8049d4b:	d3 e7                	shl    %cl,%edi
 8049d4d:	89 c1                	mov    %eax,%ecx
 8049d4f:	89 3c 24             	mov    %edi,(%esp)
 8049d52:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049d56:	d3 ee                	shr    %cl,%esi
 8049d58:	89 e9                	mov    %ebp,%ecx
 8049d5a:	d3 e2                	shl    %cl,%edx
 8049d5c:	89 c1                	mov    %eax,%ecx
 8049d5e:	d3 ef                	shr    %cl,%edi
 8049d60:	09 d7                	or     %edx,%edi
 8049d62:	89 f2                	mov    %esi,%edx
 8049d64:	89 f8                	mov    %edi,%eax
 8049d66:	f7 74 24 08          	divl   0x8(%esp)
 8049d6a:	89 d6                	mov    %edx,%esi
 8049d6c:	89 c7                	mov    %eax,%edi
 8049d6e:	f7 24 24             	mull   (%esp)
 8049d71:	39 d6                	cmp    %edx,%esi
 8049d73:	89 14 24             	mov    %edx,(%esp)
 8049d76:	72 30                	jb     8049da8 <__udivdi3+0x118>
 8049d78:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049d7c:	89 e9                	mov    %ebp,%ecx
 8049d7e:	d3 e2                	shl    %cl,%edx
 8049d80:	39 c2                	cmp    %eax,%edx
 8049d82:	73 05                	jae    8049d89 <__udivdi3+0xf9>
 8049d84:	3b 34 24             	cmp    (%esp),%esi
 8049d87:	74 1f                	je     8049da8 <__udivdi3+0x118>
 8049d89:	89 f8                	mov    %edi,%eax
 8049d8b:	31 d2                	xor    %edx,%edx
 8049d8d:	e9 7a ff ff ff       	jmp    8049d0c <__udivdi3+0x7c>
 8049d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049d98:	31 d2                	xor    %edx,%edx
 8049d9a:	b8 01 00 00 00       	mov    $0x1,%eax
 8049d9f:	e9 68 ff ff ff       	jmp    8049d0c <__udivdi3+0x7c>
 8049da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049da8:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049dab:	31 d2                	xor    %edx,%edx
 8049dad:	83 c4 0c             	add    $0xc,%esp
 8049db0:	5e                   	pop    %esi
 8049db1:	5f                   	pop    %edi
 8049db2:	5d                   	pop    %ebp
 8049db3:	c3                   	ret    
 8049db4:	66 90                	xchg   %ax,%ax
 8049db6:	66 90                	xchg   %ax,%ax
 8049db8:	66 90                	xchg   %ax,%ax
 8049dba:	66 90                	xchg   %ax,%ax
 8049dbc:	66 90                	xchg   %ax,%ax
 8049dbe:	66 90                	xchg   %ax,%ax

08049dc0 <__umoddi3>:
 8049dc0:	55                   	push   %ebp
 8049dc1:	57                   	push   %edi
 8049dc2:	56                   	push   %esi
 8049dc3:	83 ec 14             	sub    $0x14,%esp
 8049dc6:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049dca:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049dce:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049dd2:	89 c7                	mov    %eax,%edi
 8049dd4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dd8:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049ddc:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049de0:	89 34 24             	mov    %esi,(%esp)
 8049de3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049de7:	85 c0                	test   %eax,%eax
 8049de9:	89 c2                	mov    %eax,%edx
 8049deb:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049def:	75 17                	jne    8049e08 <__umoddi3+0x48>
 8049df1:	39 fe                	cmp    %edi,%esi
 8049df3:	76 4b                	jbe    8049e40 <__umoddi3+0x80>
 8049df5:	89 c8                	mov    %ecx,%eax
 8049df7:	89 fa                	mov    %edi,%edx
 8049df9:	f7 f6                	div    %esi
 8049dfb:	89 d0                	mov    %edx,%eax
 8049dfd:	31 d2                	xor    %edx,%edx
 8049dff:	83 c4 14             	add    $0x14,%esp
 8049e02:	5e                   	pop    %esi
 8049e03:	5f                   	pop    %edi
 8049e04:	5d                   	pop    %ebp
 8049e05:	c3                   	ret    
 8049e06:	66 90                	xchg   %ax,%ax
 8049e08:	39 f8                	cmp    %edi,%eax
 8049e0a:	77 54                	ja     8049e60 <__umoddi3+0xa0>
 8049e0c:	0f bd e8             	bsr    %eax,%ebp
 8049e0f:	83 f5 1f             	xor    $0x1f,%ebp
 8049e12:	75 5c                	jne    8049e70 <__umoddi3+0xb0>
 8049e14:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049e18:	39 3c 24             	cmp    %edi,(%esp)
 8049e1b:	0f 87 e7 00 00 00    	ja     8049f08 <__umoddi3+0x148>
 8049e21:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049e25:	29 f1                	sub    %esi,%ecx
 8049e27:	19 c7                	sbb    %eax,%edi
 8049e29:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049e2d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049e31:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049e35:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049e39:	83 c4 14             	add    $0x14,%esp
 8049e3c:	5e                   	pop    %esi
 8049e3d:	5f                   	pop    %edi
 8049e3e:	5d                   	pop    %ebp
 8049e3f:	c3                   	ret    
 8049e40:	85 f6                	test   %esi,%esi
 8049e42:	89 f5                	mov    %esi,%ebp
 8049e44:	75 0b                	jne    8049e51 <__umoddi3+0x91>
 8049e46:	b8 01 00 00 00       	mov    $0x1,%eax
 8049e4b:	31 d2                	xor    %edx,%edx
 8049e4d:	f7 f6                	div    %esi
 8049e4f:	89 c5                	mov    %eax,%ebp
 8049e51:	8b 44 24 04          	mov    0x4(%esp),%eax
 8049e55:	31 d2                	xor    %edx,%edx
 8049e57:	f7 f5                	div    %ebp
 8049e59:	89 c8                	mov    %ecx,%eax
 8049e5b:	f7 f5                	div    %ebp
 8049e5d:	eb 9c                	jmp    8049dfb <__umoddi3+0x3b>
 8049e5f:	90                   	nop
 8049e60:	89 c8                	mov    %ecx,%eax
 8049e62:	89 fa                	mov    %edi,%edx
 8049e64:	83 c4 14             	add    $0x14,%esp
 8049e67:	5e                   	pop    %esi
 8049e68:	5f                   	pop    %edi
 8049e69:	5d                   	pop    %ebp
 8049e6a:	c3                   	ret    
 8049e6b:	90                   	nop
 8049e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049e70:	8b 04 24             	mov    (%esp),%eax
 8049e73:	be 20 00 00 00       	mov    $0x20,%esi
 8049e78:	89 e9                	mov    %ebp,%ecx
 8049e7a:	29 ee                	sub    %ebp,%esi
 8049e7c:	d3 e2                	shl    %cl,%edx
 8049e7e:	89 f1                	mov    %esi,%ecx
 8049e80:	d3 e8                	shr    %cl,%eax
 8049e82:	89 e9                	mov    %ebp,%ecx
 8049e84:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e88:	8b 04 24             	mov    (%esp),%eax
 8049e8b:	09 54 24 04          	or     %edx,0x4(%esp)
 8049e8f:	89 fa                	mov    %edi,%edx
 8049e91:	d3 e0                	shl    %cl,%eax
 8049e93:	89 f1                	mov    %esi,%ecx
 8049e95:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049e99:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049e9d:	d3 ea                	shr    %cl,%edx
 8049e9f:	89 e9                	mov    %ebp,%ecx
 8049ea1:	d3 e7                	shl    %cl,%edi
 8049ea3:	89 f1                	mov    %esi,%ecx
 8049ea5:	d3 e8                	shr    %cl,%eax
 8049ea7:	89 e9                	mov    %ebp,%ecx
 8049ea9:	09 f8                	or     %edi,%eax
 8049eab:	8b 7c 24 10          	mov    0x10(%esp),%edi
 8049eaf:	f7 74 24 04          	divl   0x4(%esp)
 8049eb3:	d3 e7                	shl    %cl,%edi
 8049eb5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049eb9:	89 d7                	mov    %edx,%edi
 8049ebb:	f7 64 24 08          	mull   0x8(%esp)
 8049ebf:	39 d7                	cmp    %edx,%edi
 8049ec1:	89 c1                	mov    %eax,%ecx
 8049ec3:	89 14 24             	mov    %edx,(%esp)
 8049ec6:	72 2c                	jb     8049ef4 <__umoddi3+0x134>
 8049ec8:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 8049ecc:	72 22                	jb     8049ef0 <__umoddi3+0x130>
 8049ece:	8b 44 24 0c          	mov    0xc(%esp),%eax
 8049ed2:	29 c8                	sub    %ecx,%eax
 8049ed4:	19 d7                	sbb    %edx,%edi
 8049ed6:	89 e9                	mov    %ebp,%ecx
 8049ed8:	89 fa                	mov    %edi,%edx
 8049eda:	d3 e8                	shr    %cl,%eax
 8049edc:	89 f1                	mov    %esi,%ecx
 8049ede:	d3 e2                	shl    %cl,%edx
 8049ee0:	89 e9                	mov    %ebp,%ecx
 8049ee2:	d3 ef                	shr    %cl,%edi
 8049ee4:	09 d0                	or     %edx,%eax
 8049ee6:	89 fa                	mov    %edi,%edx
 8049ee8:	83 c4 14             	add    $0x14,%esp
 8049eeb:	5e                   	pop    %esi
 8049eec:	5f                   	pop    %edi
 8049eed:	5d                   	pop    %ebp
 8049eee:	c3                   	ret    
 8049eef:	90                   	nop
 8049ef0:	39 d7                	cmp    %edx,%edi
 8049ef2:	75 da                	jne    8049ece <__umoddi3+0x10e>
 8049ef4:	8b 14 24             	mov    (%esp),%edx
 8049ef7:	89 c1                	mov    %eax,%ecx
 8049ef9:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 8049efd:	1b 54 24 04          	sbb    0x4(%esp),%edx
 8049f01:	eb cb                	jmp    8049ece <__umoddi3+0x10e>
 8049f03:	90                   	nop
 8049f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f08:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 8049f0c:	0f 82 0f ff ff ff    	jb     8049e21 <__umoddi3+0x61>
 8049f12:	e9 1a ff ff ff       	jmp    8049e31 <__umoddi3+0x71>
