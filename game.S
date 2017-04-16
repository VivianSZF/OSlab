
game.bin:     file format elf32-i386


Disassembly of section .text:

08048000 <game_init>:
extern void init_timer();
extern void init_idt();
extern void init_intr();

void
game_init(void) {
 8048000:	55                   	push   %ebp
 8048001:	89 e5                	mov    %esp,%ebp
 8048003:	83 ec 18             	sub    $0x18,%esp

	printf("game start!\n");
 8048006:	c7 04 24 08 9e 04 08 	movl   $0x8049e08,(%esp)
 804800d:	e8 74 0f 00 00       	call   8048f86 <printf>
	init_keyboard();
 8048012:	e8 29 00 00 00       	call   8048040 <init_keyboard>
	main_loop();
 8048017:	e8 5d 05 00 00       	call   8048579 <main_loop>
	assert(0); /* main_loop是死循环，永远无法返回这�?*/
 804801c:	c7 44 24 0c 15 9e 04 	movl   $0x8049e15,0xc(%esp)
 8048023:	08 
 8048024:	c7 44 24 08 17 9e 04 	movl   $0x8049e17,0x8(%esp)
 804802b:	08 
 804802c:	c7 44 24 04 13 00 00 	movl   $0x13,0x4(%esp)
 8048033:	00 
 8048034:	c7 04 24 2c 9e 04 08 	movl   $0x8049e2c,(%esp)
 804803b:	e8 2a 01 00 00       	call   804816a <_panic>

08048040 <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 8048040:	55                   	push   %ebp
 8048041:	89 e5                	mov    %esp,%ebp
 8048043:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 8048046:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804804d:	eb 12                	jmp    8048061 <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 804804f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048052:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 8048059:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 804805d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048061:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048065:	7e e8                	jle    804804f <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 8048067:	c9                   	leave  
 8048068:	c3                   	ret    

08048069 <press_key>:

void press_key(int scan_code) {
 8048069:	55                   	push   %ebp
 804806a:	89 e5                	mov    %esp,%ebp
 804806c:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 804806f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048076:	eb 21                	jmp    8048099 <press_key+0x30>
		if (key_code[i] == scan_code) {
 8048078:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804807b:	8b 04 85 00 b0 04 08 	mov    0x804b000(,%eax,4),%eax
 8048082:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048085:	75 0e                	jne    8048095 <press_key+0x2c>
			key_pressed[i] = TRUE;
 8048087:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804808a:	c7 04 85 20 b4 04 08 	movl   $0x1,0x804b420(,%eax,4)
 8048091:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 8048095:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048099:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 804809d:	7e d9                	jle    8048078 <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 804809f:	c9                   	leave  
 80480a0:	c3                   	ret    

080480a1 <release_key>:

void release_key(int index) {
 80480a1:	55                   	push   %ebp
 80480a2:	89 e5                	mov    %esp,%ebp
 80480a4:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80480ab:	78 06                	js     80480b3 <release_key+0x12>
 80480ad:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80480b1:	7e 24                	jle    80480d7 <release_key+0x36>
 80480b3:	c7 44 24 0c 38 9e 04 	movl   $0x8049e38,0xc(%esp)
 80480ba:	08 
 80480bb:	c7 44 24 08 50 9e 04 	movl   $0x8049e50,0x8(%esp)
 80480c2:	08 
 80480c3:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80480ca:	00 
 80480cb:	c7 04 24 65 9e 04 08 	movl   $0x8049e65,(%esp)
 80480d2:	e8 93 00 00 00       	call   804816a <_panic>
	key_pressed[index] = FALSE;
 80480d7:	8b 45 08             	mov    0x8(%ebp),%eax
 80480da:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 80480e1:	00 00 00 00 
}
 80480e5:	c9                   	leave  
 80480e6:	c3                   	ret    

080480e7 <query_key>:

bool query_key(int index) {
 80480e7:	55                   	push   %ebp
 80480e8:	89 e5                	mov    %esp,%ebp
 80480ea:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80480f1:	78 06                	js     80480f9 <query_key+0x12>
 80480f3:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80480f7:	7e 24                	jle    804811d <query_key+0x36>
 80480f9:	c7 44 24 0c 38 9e 04 	movl   $0x8049e38,0xc(%esp)
 8048100:	08 
 8048101:	c7 44 24 08 50 9e 04 	movl   $0x8049e50,0x8(%esp)
 8048108:	08 
 8048109:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 8048110:	00 
 8048111:	c7 04 24 65 9e 04 08 	movl   $0x8049e65,(%esp)
 8048118:	e8 4d 00 00 00       	call   804816a <_panic>
	return key_pressed[index];
 804811d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048120:	8b 04 85 20 b4 04 08 	mov    0x804b420(,%eax,4),%eax
}
 8048127:	c9                   	leave  
 8048128:	c3                   	ret    

08048129 <key_operation>:

extern void control_plane(int);
void key_operation(void){
 8048129:	55                   	push   %ebp
 804812a:	89 e5                	mov    %esp,%ebp
 804812c:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 804812f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048136:	eb 2a                	jmp    8048162 <key_operation+0x39>
		if(query_key(i)==TRUE){
 8048138:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804813b:	89 04 24             	mov    %eax,(%esp)
 804813e:	e8 a4 ff ff ff       	call   80480e7 <query_key>
 8048143:	83 f8 01             	cmp    $0x1,%eax
 8048146:	75 16                	jne    804815e <key_operation+0x35>
			control_plane(i);
 8048148:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804814b:	89 04 24             	mov    %eax,(%esp)
 804814e:	e8 b6 07 00 00       	call   8048909 <control_plane>
			release_key(i);
 8048153:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048156:	89 04 24             	mov    %eax,(%esp)
 8048159:	e8 43 ff ff ff       	call   80480a1 <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 804815e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048162:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 8048166:	7e d0                	jle    8048138 <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 8048168:	c9                   	leave  
 8048169:	c3                   	ret    

0804816a <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 804816a:	55                   	push   %ebp
 804816b:	89 e5                	mov    %esp,%ebp
 804816d:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 8048170:	a1 30 b4 04 08       	mov    0x804b430,%eax
 8048175:	85 c0                	test   %eax,%eax
 8048177:	74 01                	je     804817a <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 8048179:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 804817a:	8b 45 10             	mov    0x10(%ebp),%eax
 804817d:	a3 30 b4 04 08       	mov    %eax,0x804b430

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 8048182:	fa                   	cli    
 8048183:	fc                   	cld    

	va_start(ap, fmt);
 8048184:	8d 45 14             	lea    0x14(%ebp),%eax
 8048187:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 804818a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804818d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048191:	8b 45 08             	mov    0x8(%ebp),%eax
 8048194:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048198:	c7 04 24 75 9e 04 08 	movl   $0x8049e75,(%esp)
 804819f:	e8 e2 0d 00 00       	call   8048f86 <printf>
	vprintf(fmt, ap);
 80481a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481ab:	8b 45 10             	mov    0x10(%ebp),%eax
 80481ae:	89 04 24             	mov    %eax,(%esp)
 80481b1:	e8 9d 0d 00 00       	call   8048f53 <vprintf>
	printf("\n");
 80481b6:	c7 04 24 8d 9e 04 08 	movl   $0x8049e8d,(%esp)
 80481bd:	e8 c4 0d 00 00       	call   8048f86 <printf>
	va_end(ap);

}
 80481c2:	c9                   	leave  
 80481c3:	c3                   	ret    

080481c4 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 80481c4:	55                   	push   %ebp
 80481c5:	89 e5                	mov    %esp,%ebp
 80481c7:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 80481ca:	8d 45 14             	lea    0x14(%ebp),%eax
 80481cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 80481d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481d7:	8b 45 08             	mov    0x8(%ebp),%eax
 80481da:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481de:	c7 04 24 8f 9e 04 08 	movl   $0x8049e8f,(%esp)
 80481e5:	e8 9c 0d 00 00       	call   8048f86 <printf>
	vprintf(fmt, ap);
 80481ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481f1:	8b 45 10             	mov    0x10(%ebp),%eax
 80481f4:	89 04 24             	mov    %eax,(%esp)
 80481f7:	e8 57 0d 00 00       	call   8048f53 <vprintf>
	printf("\n");
 80481fc:	c7 04 24 8d 9e 04 08 	movl   $0x8049e8d,(%esp)
 8048203:	e8 7e 0d 00 00       	call   8048f86 <printf>
	va_end(ap);
}
 8048208:	c9                   	leave  
 8048209:	c3                   	ret    

0804820a <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 804820a:	55                   	push   %ebp
 804820b:	89 e5                	mov    %esp,%ebp
 804820d:	83 ec 38             	sub    $0x38,%esp
 8048210:	8b 45 08             	mov    0x8(%ebp),%eax
 8048213:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 8048216:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 804821a:	79 24                	jns    8048240 <draw_character+0x36>
 804821c:	c7 44 24 0c a9 9e 04 	movl   $0x8049ea9,0xc(%esp)
 8048223:	08 
 8048224:	c7 44 24 08 ba 9e 04 	movl   $0x8049eba,0x8(%esp)
 804822b:	08 
 804822c:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048233:	00 
 8048234:	c7 04 24 cf 9e 04 08 	movl   $0x8049ecf,(%esp)
 804823b:	e8 2a ff ff ff       	call   804816a <_panic>
	char *p = font8x8_basic[(int)ch];
 8048240:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 8048244:	c1 e0 03             	shl    $0x3,%eax
 8048247:	05 20 b0 04 08       	add    $0x804b020,%eax
 804824c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 804824f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048256:	eb 59                	jmp    80482b1 <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 8048258:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804825f:	eb 46                	jmp    80482a7 <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 8048261:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048264:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048267:	01 d0                	add    %edx,%eax
 8048269:	0f b6 00             	movzbl (%eax),%eax
 804826c:	0f be d0             	movsbl %al,%edx
 804826f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048272:	89 c1                	mov    %eax,%ecx
 8048274:	d3 fa                	sar    %cl,%edx
 8048276:	89 d0                	mov    %edx,%eax
 8048278:	83 e0 01             	and    $0x1,%eax
 804827b:	85 c0                	test   %eax,%eax
 804827d:	74 24                	je     80482a3 <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 804827f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048282:	8b 55 10             	mov    0x10(%ebp),%edx
 8048285:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048288:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804828b:	8b 55 0c             	mov    0xc(%ebp),%edx
 804828e:	01 c2                	add    %eax,%edx
 8048290:	8b 45 14             	mov    0x14(%ebp),%eax
 8048293:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048297:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804829b:	89 14 24             	mov    %edx,(%esp)
 804829e:	e8 64 0b 00 00       	call   8048e07 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 80482a3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80482a7:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 80482ab:	7e b4                	jle    8048261 <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 80482ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80482b1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 80482b5:	7e a1                	jle    8048258 <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 80482b7:	c9                   	leave  
 80482b8:	c3                   	ret    

080482b9 <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 80482b9:	55                   	push   %ebp
 80482ba:	89 e5                	mov    %esp,%ebp
 80482bc:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 80482bf:	eb 4a                	jmp    804830b <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 80482c1:	8b 45 08             	mov    0x8(%ebp),%eax
 80482c4:	8d 50 01             	lea    0x1(%eax),%edx
 80482c7:	89 55 08             	mov    %edx,0x8(%ebp)
 80482ca:	0f b6 00             	movzbl (%eax),%eax
 80482cd:	0f be c0             	movsbl %al,%eax
 80482d0:	8b 55 14             	mov    0x14(%ebp),%edx
 80482d3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80482d7:	8b 55 10             	mov    0x10(%ebp),%edx
 80482da:	89 54 24 08          	mov    %edx,0x8(%esp)
 80482de:	8b 55 0c             	mov    0xc(%ebp),%edx
 80482e1:	89 54 24 04          	mov    %edx,0x4(%esp)
 80482e5:	89 04 24             	mov    %eax,(%esp)
 80482e8:	e8 1d ff ff ff       	call   804820a <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 80482ed:	8b 45 10             	mov    0x10(%ebp),%eax
 80482f0:	83 c0 08             	add    $0x8,%eax
 80482f3:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 80482f8:	7e 0d                	jle    8048307 <draw_string+0x4e>
			x += 8; y = 0;
 80482fa:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 80482fe:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8048305:	eb 04                	jmp    804830b <draw_string+0x52>
		} else {
			y += 8;
 8048307:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 804830b:	8b 45 08             	mov    0x8(%ebp),%eax
 804830e:	0f b6 00             	movzbl (%eax),%eax
 8048311:	84 c0                	test   %al,%al
 8048313:	75 ac                	jne    80482c1 <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 8048315:	c9                   	leave  
 8048316:	c3                   	ret    

08048317 <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 8048317:	55                   	push   %ebp
 8048318:	89 e5                	mov    %esp,%ebp
 804831a:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 804831d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048324:	eb 3d                	jmp    8048363 <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 8048326:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804832d:	eb 28                	jmp    8048357 <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 804832f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048332:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048335:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048338:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804833b:	8b 55 08             	mov    0x8(%ebp),%edx
 804833e:	01 c2                	add    %eax,%edx
 8048340:	8b 45 14             	mov    0x14(%ebp),%eax
 8048343:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048347:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804834b:	89 14 24             	mov    %edx,(%esp)
 804834e:	e8 b4 0a 00 00       	call   8048e07 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 8048353:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048357:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804835a:	3b 45 10             	cmp    0x10(%ebp),%eax
 804835d:	7c d0                	jl     804832f <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 804835f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048363:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048366:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048369:	7c bb                	jl     8048326 <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 804836b:	c9                   	leave  
 804836c:	c3                   	ret    

0804836d <redraw_screen>:

void
redraw_screen() {
 804836d:	55                   	push   %ebp
 804836e:	89 e5                	mov    %esp,%ebp
 8048370:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 8048373:	e8 f7 0a 00 00       	call   8048e6f <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 8048378:	e8 ab 06 00 00       	call   8048a28 <get_st_head>
 804837d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048380:	eb 37                	jmp    80483b9 <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 8048382:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048385:	8b 48 08             	mov    0x8(%eax),%ecx
 8048388:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804838b:	8b 50 04             	mov    0x4(%eax),%edx
 804838e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048391:	8b 00                	mov    (%eax),%eax
 8048393:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 804839a:	00 
 804839b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804839f:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483a3:	89 04 24             	mov    %eax,(%esp)
 80483a6:	e8 6c ff ff ff       	call   8048317 <draw_bomb>
		it=st_next(it);
 80483ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483ae:	89 04 24             	mov    %eax,(%esp)
 80483b1:	e8 38 04 00 00       	call   80487ee <st_next>
 80483b6:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 80483b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80483bd:	75 c3                	jne    8048382 <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 80483bf:	8b 0d 14 5c 09 08    	mov    0x8095c14,%ecx
 80483c5:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80483cb:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 80483d0:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 80483d7:	00 
 80483d8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483dc:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483e0:	89 04 24             	mov    %eax,(%esp)
 80483e3:	e8 2f ff ff ff       	call   8048317 <draw_bomb>
	const char *score=itoa(get_score());
 80483e8:	e8 27 06 00 00       	call   8048a14 <get_score>
 80483ed:	89 04 24             	mov    %eax,(%esp)
 80483f0:	e8 d2 0b 00 00       	call   8048fc7 <itoa>
 80483f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 80483f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80483fb:	89 04 24             	mov    %eax,(%esp)
 80483fe:	e8 60 0c 00 00       	call   8049063 <strlen>
 8048403:	89 c2                	mov    %eax,%edx
 8048405:	b8 00 00 00 00       	mov    $0x0,%eax
 804840a:	29 d0                	sub    %edx,%eax
 804840c:	c1 e0 03             	shl    $0x3,%eax
 804840f:	05 10 01 00 00       	add    $0x110,%eax
 8048414:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804841b:	00 
 804841c:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048420:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048427:	00 
 8048428:	c7 04 24 db 9e 04 08 	movl   $0x8049edb,(%esp)
 804842f:	e8 85 fe ff ff       	call   80482b9 <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 8048434:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048437:	89 04 24             	mov    %eax,(%esp)
 804843a:	e8 24 0c 00 00       	call   8049063 <strlen>
 804843f:	89 c2                	mov    %eax,%edx
 8048441:	b8 00 00 00 00       	mov    $0x0,%eax
 8048446:	29 d0                	sub    %edx,%eax
 8048448:	c1 e0 03             	shl    $0x3,%eax
 804844b:	05 40 01 00 00       	add    $0x140,%eax
 8048450:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048457:	00 
 8048458:	89 44 24 08          	mov    %eax,0x8(%esp)
 804845c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048463:	00 
 8048464:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048467:	89 04 24             	mov    %eax,(%esp)
 804846a:	e8 4a fe ff ff       	call   80482b9 <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 804846f:	e8 aa 05 00 00       	call   8048a1e <get_miss>
 8048474:	89 04 24             	mov    %eax,(%esp)
 8048477:	e8 4b 0b 00 00       	call   8048fc7 <itoa>
 804847c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 804847f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048482:	89 04 24             	mov    %eax,(%esp)
 8048485:	e8 d9 0b 00 00       	call   8049063 <strlen>
 804848a:	89 c2                	mov    %eax,%edx
 804848c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048491:	29 d0                	sub    %edx,%eax
 8048493:	c1 e0 03             	shl    $0x3,%eax
 8048496:	05 18 01 00 00       	add    $0x118,%eax
 804849b:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484a2:	00 
 80484a3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484a7:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484ae:	00 
 80484af:	c7 04 24 e2 9e 04 08 	movl   $0x8049ee2,(%esp)
 80484b6:	e8 fe fd ff ff       	call   80482b9 <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80484bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484be:	89 04 24             	mov    %eax,(%esp)
 80484c1:	e8 9d 0b 00 00       	call   8049063 <strlen>
 80484c6:	89 c2                	mov    %eax,%edx
 80484c8:	b8 00 00 00 00       	mov    $0x0,%eax
 80484cd:	29 d0                	sub    %edx,%eax
 80484cf:	c1 e0 03             	shl    $0x3,%eax
 80484d2:	05 40 01 00 00       	add    $0x140,%eax
 80484d7:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484de:	00 
 80484df:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484e3:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484ea:	00 
 80484eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484ee:	89 04 24             	mov    %eax,(%esp)
 80484f1:	e8 c3 fd ff ff       	call   80482b9 <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 80484f6:	e8 74 00 00 00       	call   804856f <get_fps>
 80484fb:	89 04 24             	mov    %eax,(%esp)
 80484fe:	e8 c4 0a 00 00       	call   8048fc7 <itoa>
 8048503:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 804850a:	00 
 804850b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8048512:	00 
 8048513:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804851a:	00 
 804851b:	89 04 24             	mov    %eax,(%esp)
 804851e:	e8 96 fd ff ff       	call   80482b9 <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 8048523:	e8 47 00 00 00       	call   804856f <get_fps>
 8048528:	89 04 24             	mov    %eax,(%esp)
 804852b:	e8 97 0a 00 00       	call   8048fc7 <itoa>
 8048530:	89 04 24             	mov    %eax,(%esp)
 8048533:	e8 2b 0b 00 00       	call   8049063 <strlen>
 8048538:	c1 e0 03             	shl    $0x3,%eax
 804853b:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048542:	00 
 8048543:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048547:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804854e:	00 
 804854f:	c7 04 24 e8 9e 04 08 	movl   $0x8049ee8,(%esp)
 8048556:	e8 5e fd ff ff       	call   80482b9 <draw_string>
	syspr();
 804855b:	e8 33 09 00 00       	call   8048e93 <syspr>
}
 8048560:	c9                   	leave  
 8048561:	c3                   	ret    

08048562 <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 8048562:	55                   	push   %ebp
 8048563:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 8048565:	8b 45 08             	mov    0x8(%ebp),%eax
 8048568:	a3 34 b4 04 08       	mov    %eax,0x804b434
}
 804856d:	5d                   	pop    %ebp
 804856e:	c3                   	ret    

0804856f <get_fps>:
int get_fps() {
 804856f:	55                   	push   %ebp
 8048570:	89 e5                	mov    %esp,%ebp
	return real_fps;
 8048572:	a1 34 b4 04 08       	mov    0x804b434,%eax
}
 8048577:	5d                   	pop    %ebp
 8048578:	c3                   	ret    

08048579 <main_loop>:


extern void key_operation();
void main_loop(void) {
 8048579:	55                   	push   %ebp
 804857a:	89 e5                	mov    %esp,%ebp
 804857c:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 804857f:	e8 2b 09 00 00       	call   8048eaf <systime>
 8048584:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 8048587:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 804858e:	c7 05 0c 5c 09 08 64 	movl   $0x64,0x8095c0c
 8048595:	00 00 00 
	pl.y=150;
 8048598:	c7 05 10 5c 09 08 96 	movl   $0x96,0x8095c10
 804859f:	00 00 00 
	pl.w=10;
 80485a2:	c7 05 14 5c 09 08 0a 	movl   $0xa,0x8095c14
 80485a9:	00 00 00 
	pl.v=10;
 80485ac:	c7 05 18 5c 09 08 0a 	movl   $0xa,0x8095c18
 80485b3:	00 00 00 
	
	while (TRUE) {
	
		key_operation();
 80485b6:	e8 6e fb ff ff       	call   8048129 <key_operation>
		target = systime(); 
 80485bb:	e8 ef 08 00 00       	call   8048eaf <systime>
 80485c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		redraw = FALSE;
 80485c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 80485ca:	e9 06 01 00 00       	jmp    80486d5 <main_loop+0x15c>
			int code=sysreadkey();
 80485cf:	e8 ef 08 00 00       	call   8048ec3 <sysreadkey>
 80485d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
			if(code!=-1){
 80485d7:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
 80485db:	74 0b                	je     80485e8 <main_loop+0x6f>
				press_key(code);
 80485dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80485e0:	89 04 24             	mov    %eax,(%esp)
 80485e3:	e8 81 fa ff ff       	call   8048069 <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 80485e8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80485eb:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80485f0:	89 c8                	mov    %ecx,%eax
 80485f2:	f7 ea                	imul   %edx
 80485f4:	c1 fa 05             	sar    $0x5,%edx
 80485f7:	89 c8                	mov    %ecx,%eax
 80485f9:	c1 f8 1f             	sar    $0x1f,%eax
 80485fc:	29 c2                	sub    %eax,%edx
 80485fe:	89 d0                	mov    %edx,%eax
 8048600:	6b c0 64             	imul   $0x64,%eax,%eax
 8048603:	29 c1                	sub    %eax,%ecx
 8048605:	89 c8                	mov    %ecx,%eax
 8048607:	85 c0                	test   %eax,%eax
 8048609:	75 05                	jne    8048610 <main_loop+0x97>
				create_new_stone();
 804860b:	e8 22 04 00 00       	call   8048a32 <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 8048610:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048613:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048618:	89 c8                	mov    %ecx,%eax
 804861a:	f7 ea                	imul   %edx
 804861c:	89 c8                	mov    %ecx,%eax
 804861e:	c1 f8 1f             	sar    $0x1f,%eax
 8048621:	29 c2                	sub    %eax,%edx
 8048623:	89 d0                	mov    %edx,%eax
 8048625:	01 c0                	add    %eax,%eax
 8048627:	01 d0                	add    %edx,%eax
 8048629:	29 c1                	sub    %eax,%ecx
 804862b:	89 ca                	mov    %ecx,%edx
 804862d:	85 d2                	test   %edx,%edx
 804862f:	75 05                	jne    8048636 <main_loop+0xbd>
				update_stone_pos();
 8048631:	e8 9f 04 00 00       	call   8048ad5 <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 8048636:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048639:	ba 56 55 55 55       	mov    $0x55555556,%edx
 804863e:	89 c8                	mov    %ecx,%eax
 8048640:	f7 ea                	imul   %edx
 8048642:	89 c8                	mov    %ecx,%eax
 8048644:	c1 f8 1f             	sar    $0x1f,%eax
 8048647:	29 c2                	sub    %eax,%edx
 8048649:	89 d0                	mov    %edx,%eax
 804864b:	01 c0                	add    %eax,%eax
 804864d:	01 d0                	add    %edx,%eax
 804864f:	29 c1                	sub    %eax,%ecx
 8048651:	89 ca                	mov    %ecx,%edx
 8048653:	85 d2                	test   %edx,%edx
 8048655:	75 05                	jne    804865c <main_loop+0xe3>
				update_bang();
 8048657:	e8 13 07 00 00       	call   8048d6f <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 804865c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804865f:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048664:	89 c8                	mov    %ecx,%eax
 8048666:	f7 ea                	imul   %edx
 8048668:	89 c8                	mov    %ecx,%eax
 804866a:	c1 f8 1f             	sar    $0x1f,%eax
 804866d:	29 c2                	sub    %eax,%edx
 804866f:	89 d0                	mov    %edx,%eax
 8048671:	01 c0                	add    %eax,%eax
 8048673:	01 d0                	add    %edx,%eax
 8048675:	29 c1                	sub    %eax,%ecx
 8048677:	89 ca                	mov    %ecx,%edx
 8048679:	85 d2                	test   %edx,%edx
 804867b:	75 07                	jne    8048684 <main_loop+0x10b>
				redraw = TRUE;
 804867d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 8048684:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048687:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804868c:	89 c8                	mov    %ecx,%eax
 804868e:	f7 ea                	imul   %edx
 8048690:	c1 fa 04             	sar    $0x4,%edx
 8048693:	89 c8                	mov    %ecx,%eax
 8048695:	c1 f8 1f             	sar    $0x1f,%eax
 8048698:	29 c2                	sub    %eax,%edx
 804869a:	89 d0                	mov    %edx,%eax
 804869c:	6b c0 32             	imul   $0x32,%eax,%eax
 804869f:	29 c1                	sub    %eax,%ecx
 80486a1:	89 c8                	mov    %ecx,%eax
 80486a3:	85 c0                	test   %eax,%eax
 80486a5:	75 2a                	jne    80486d1 <main_loop+0x158>
				int now_fps = num_draw * 2 + 1;
 80486a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80486aa:	01 c0                	add    %eax,%eax
 80486ac:	83 c0 01             	add    $0x1,%eax
 80486af:	89 45 e8             	mov    %eax,-0x18(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 80486b2:	83 7d e8 1e          	cmpl   $0x1e,-0x18(%ebp)
 80486b6:	7e 07                	jle    80486bf <main_loop+0x146>
 80486b8:	c7 45 e8 1e 00 00 00 	movl   $0x1e,-0x18(%ebp)
				set_fps(now_fps);
 80486bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486c2:	89 04 24             	mov    %eax,(%esp)
 80486c5:	e8 98 fe ff ff       	call   8048562 <set_fps>
				num_draw = 0;
 80486ca:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 80486d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 80486d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80486d8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 80486db:	0f 8c ee fe ff ff    	jl     80485cf <main_loop+0x56>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 80486e1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 80486e5:	74 0e                	je     80486f5 <main_loop+0x17c>
			num_draw ++;
 80486e7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 80486eb:	e8 7d fc ff ff       	call   804836d <redraw_screen>
		}
	}
 80486f0:	e9 c1 fe ff ff       	jmp    80485b6 <main_loop+0x3d>
 80486f5:	e9 bc fe ff ff       	jmp    80485b6 <main_loop+0x3d>

080486fa <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 80486fa:	55                   	push   %ebp
 80486fb:	89 e5                	mov    %esp,%ebp
 80486fd:	83 ec 28             	sub    $0x28,%esp
 8048700:	a1 d8 5d 08 08       	mov    0x8085dd8,%eax
 8048705:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048708:	c7 45 ec 40 b4 04 08 	movl   $0x804b440,-0x14(%ebp)
 804870f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048713:	75 47                	jne    804875c <st_new+0x62>
 8048715:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804871c:	eb 2f                	jmp    804874d <st_new+0x53>
 804871e:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048721:	89 d0                	mov    %edx,%eax
 8048723:	01 c0                	add    %eax,%eax
 8048725:	01 d0                	add    %edx,%eax
 8048727:	c1 e0 03             	shl    $0x3,%eax
 804872a:	8d 50 e8             	lea    -0x18(%eax),%edx
 804872d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048730:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048733:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048736:	89 d0                	mov    %edx,%eax
 8048738:	01 c0                	add    %eax,%eax
 804873a:	01 d0                	add    %edx,%eax
 804873c:	c1 e0 03             	shl    $0x3,%eax
 804873f:	89 c2                	mov    %eax,%edx
 8048741:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048744:	01 d0                	add    %edx,%eax
 8048746:	89 41 14             	mov    %eax,0x14(%ecx)
 8048749:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804874d:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 8048754:	7e c8                	jle    804871e <st_new+0x24>
 8048756:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048759:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804875c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804875f:	8b 40 14             	mov    0x14(%eax),%eax
 8048762:	85 c0                	test   %eax,%eax
 8048764:	75 24                	jne    804878a <st_new+0x90>
 8048766:	c7 44 24 0c ec 9e 04 	movl   $0x8049eec,0xc(%esp)
 804876d:	08 
 804876e:	c7 44 24 08 05 9f 04 	movl   $0x8049f05,0x8(%esp)
 8048775:	08 
 8048776:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804877d:	00 
 804877e:	c7 04 24 1a 9f 04 08 	movl   $0x8049f1a,(%esp)
 8048785:	e8 e0 f9 ff ff       	call   804816a <_panic>
 804878a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804878d:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048790:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048793:	8b 40 14             	mov    0x14(%eax),%eax
 8048796:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 804879b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804879e:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 80487a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487a8:	8b 50 14             	mov    0x14(%eax),%edx
 80487ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487ae:	89 50 10             	mov    %edx,0x10(%eax)
 80487b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487b4:	c9                   	leave  
 80487b5:	c3                   	ret    

080487b6 <st_prev>:
 80487b6:	55                   	push   %ebp
 80487b7:	89 e5                	mov    %esp,%ebp
 80487b9:	83 ec 18             	sub    $0x18,%esp
 80487bc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80487c0:	75 24                	jne    80487e6 <st_prev+0x30>
 80487c2:	c7 44 24 0c 28 9f 04 	movl   $0x8049f28,0xc(%esp)
 80487c9:	08 
 80487ca:	c7 44 24 08 05 9f 04 	movl   $0x8049f05,0x8(%esp)
 80487d1:	08 
 80487d2:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80487d9:	00 
 80487da:	c7 04 24 1a 9f 04 08 	movl   $0x8049f1a,(%esp)
 80487e1:	e8 84 f9 ff ff       	call   804816a <_panic>
 80487e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80487e9:	8b 40 10             	mov    0x10(%eax),%eax
 80487ec:	c9                   	leave  
 80487ed:	c3                   	ret    

080487ee <st_next>:
 80487ee:	55                   	push   %ebp
 80487ef:	89 e5                	mov    %esp,%ebp
 80487f1:	83 ec 18             	sub    $0x18,%esp
 80487f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80487f8:	75 24                	jne    804881e <st_next+0x30>
 80487fa:	c7 44 24 0c 28 9f 04 	movl   $0x8049f28,0xc(%esp)
 8048801:	08 
 8048802:	c7 44 24 08 05 9f 04 	movl   $0x8049f05,0x8(%esp)
 8048809:	08 
 804880a:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048811:	00 
 8048812:	c7 04 24 1a 9f 04 08 	movl   $0x8049f1a,(%esp)
 8048819:	e8 4c f9 ff ff       	call   804816a <_panic>
 804881e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048821:	8b 40 14             	mov    0x14(%eax),%eax
 8048824:	c9                   	leave  
 8048825:	c3                   	ret    

08048826 <st_insert>:
 8048826:	55                   	push   %ebp
 8048827:	89 e5                	mov    %esp,%ebp
 8048829:	83 ec 18             	sub    $0x18,%esp
 804882c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048830:	75 2a                	jne    804885c <st_insert+0x36>
 8048832:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048836:	75 24                	jne    804885c <st_insert+0x36>
 8048838:	c7 44 24 0c 35 9f 04 	movl   $0x8049f35,0xc(%esp)
 804883f:	08 
 8048840:	c7 44 24 08 05 9f 04 	movl   $0x8049f05,0x8(%esp)
 8048847:	08 
 8048848:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804884f:	00 
 8048850:	c7 04 24 1a 9f 04 08 	movl   $0x8049f1a,(%esp)
 8048857:	e8 0e f9 ff ff       	call   804816a <_panic>
 804885c:	8b 45 10             	mov    0x10(%ebp),%eax
 804885f:	8b 55 08             	mov    0x8(%ebp),%edx
 8048862:	89 50 10             	mov    %edx,0x10(%eax)
 8048865:	8b 45 10             	mov    0x10(%ebp),%eax
 8048868:	8b 55 0c             	mov    0xc(%ebp),%edx
 804886b:	89 50 14             	mov    %edx,0x14(%eax)
 804886e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048872:	74 09                	je     804887d <st_insert+0x57>
 8048874:	8b 45 08             	mov    0x8(%ebp),%eax
 8048877:	8b 55 10             	mov    0x10(%ebp),%edx
 804887a:	89 50 14             	mov    %edx,0x14(%eax)
 804887d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048881:	74 09                	je     804888c <st_insert+0x66>
 8048883:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048886:	8b 55 10             	mov    0x10(%ebp),%edx
 8048889:	89 50 10             	mov    %edx,0x10(%eax)
 804888c:	c9                   	leave  
 804888d:	c3                   	ret    

0804888e <st_remove>:
 804888e:	55                   	push   %ebp
 804888f:	89 e5                	mov    %esp,%ebp
 8048891:	83 ec 28             	sub    $0x28,%esp
 8048894:	8b 45 08             	mov    0x8(%ebp),%eax
 8048897:	8b 40 10             	mov    0x10(%eax),%eax
 804889a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804889d:	8b 45 08             	mov    0x8(%ebp),%eax
 80488a0:	8b 40 14             	mov    0x14(%eax),%eax
 80488a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80488a6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80488aa:	75 24                	jne    80488d0 <st_remove+0x42>
 80488ac:	c7 44 24 0c 28 9f 04 	movl   $0x8049f28,0xc(%esp)
 80488b3:	08 
 80488b4:	c7 44 24 08 05 9f 04 	movl   $0x8049f05,0x8(%esp)
 80488bb:	08 
 80488bc:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488c3:	00 
 80488c4:	c7 04 24 1a 9f 04 08 	movl   $0x8049f1a,(%esp)
 80488cb:	e8 9a f8 ff ff       	call   804816a <_panic>
 80488d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80488d4:	74 09                	je     80488df <st_remove+0x51>
 80488d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488dc:	89 50 14             	mov    %edx,0x14(%eax)
 80488df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80488e3:	74 09                	je     80488ee <st_remove+0x60>
 80488e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80488eb:	89 50 10             	mov    %edx,0x10(%eax)
 80488ee:	c9                   	leave  
 80488ef:	c3                   	ret    

080488f0 <st_free>:
 80488f0:	55                   	push   %ebp
 80488f1:	89 e5                	mov    %esp,%ebp
 80488f3:	8b 15 d8 5d 08 08    	mov    0x8085dd8,%edx
 80488f9:	8b 45 08             	mov    0x8(%ebp),%eax
 80488fc:	89 50 14             	mov    %edx,0x14(%eax)
 80488ff:	8b 45 08             	mov    0x8(%ebp),%eax
 8048902:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048907:	5d                   	pop    %ebp
 8048908:	c3                   	ret    

08048909 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 8048909:	55                   	push   %ebp
 804890a:	89 e5                	mov    %esp,%ebp
 804890c:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 804890f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048912:	83 f8 01             	cmp    $0x1,%eax
 8048915:	74 4e                	je     8048965 <control_plane+0x5c>
 8048917:	83 f8 01             	cmp    $0x1,%eax
 804891a:	7f 09                	jg     8048925 <control_plane+0x1c>
 804891c:	85 c0                	test   %eax,%eax
 804891e:	74 18                	je     8048938 <control_plane+0x2f>
 8048920:	e9 c9 00 00 00       	jmp    80489ee <control_plane+0xe5>
 8048925:	83 f8 02             	cmp    $0x2,%eax
 8048928:	74 6c                	je     8048996 <control_plane+0x8d>
 804892a:	83 f8 03             	cmp    $0x3,%eax
 804892d:	0f 84 8a 00 00 00    	je     80489bd <control_plane+0xb4>
 8048933:	e9 b6 00 00 00       	jmp    80489ee <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 8048938:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 804893e:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048943:	39 c2                	cmp    %eax,%edx
 8048945:	7c 19                	jl     8048960 <control_plane+0x57>
 8048947:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 804894d:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048952:	29 c2                	sub    %eax,%edx
 8048954:	89 d0                	mov    %edx,%eax
 8048956:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 804895b:	e9 b2 00 00 00       	jmp    8048a12 <control_plane+0x109>
 8048960:	e9 ad 00 00 00       	jmp    8048a12 <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048965:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 804896b:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048970:	01 c2                	add    %eax,%edx
 8048972:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048977:	01 d0                	add    %edx,%eax
 8048979:	3d c8 00 00 00       	cmp    $0xc8,%eax
 804897e:	7f 14                	jg     8048994 <control_plane+0x8b>
 8048980:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048986:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 804898b:	01 d0                	add    %edx,%eax
 804898d:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 8048992:	eb 7e                	jmp    8048a12 <control_plane+0x109>
 8048994:	eb 7c                	jmp    8048a12 <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 8048996:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 804899c:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489a1:	39 c2                	cmp    %eax,%edx
 80489a3:	7c 16                	jl     80489bb <control_plane+0xb2>
 80489a5:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489ab:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489b0:	29 c2                	sub    %eax,%edx
 80489b2:	89 d0                	mov    %edx,%eax
 80489b4:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 80489b9:	eb 57                	jmp    8048a12 <control_plane+0x109>
 80489bb:	eb 55                	jmp    8048a12 <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 80489bd:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489c3:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489c8:	01 c2                	add    %eax,%edx
 80489ca:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 80489cf:	01 d0                	add    %edx,%eax
 80489d1:	3d 40 01 00 00       	cmp    $0x140,%eax
 80489d6:	7f 14                	jg     80489ec <control_plane+0xe3>
 80489d8:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489de:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489e3:	01 d0                	add    %edx,%eax
 80489e5:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 80489ea:	eb 26                	jmp    8048a12 <control_plane+0x109>
 80489ec:	eb 24                	jmp    8048a12 <control_plane+0x109>
		default:assert(0);
 80489ee:	c7 44 24 0c 52 9f 04 	movl   $0x8049f52,0xc(%esp)
 80489f5:	08 
 80489f6:	c7 44 24 08 05 9f 04 	movl   $0x8049f05,0x8(%esp)
 80489fd:	08 
 80489fe:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048a05:	00 
 8048a06:	c7 04 24 1a 9f 04 08 	movl   $0x8049f1a,(%esp)
 8048a0d:	e8 58 f7 ff ff       	call   804816a <_panic>
	}
}
 8048a12:	c9                   	leave  
 8048a13:	c3                   	ret    

08048a14 <get_score>:


int get_score(void) {
 8048a14:	55                   	push   %ebp
 8048a15:	89 e5                	mov    %esp,%ebp
	return score;
 8048a17:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
}
 8048a1c:	5d                   	pop    %ebp
 8048a1d:	c3                   	ret    

08048a1e <get_miss>:

int get_miss(void) {
 8048a1e:	55                   	push   %ebp
 8048a1f:	89 e5                	mov    %esp,%ebp
	return miss;
 8048a21:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
}
 8048a26:	5d                   	pop    %ebp
 8048a27:	c3                   	ret    

08048a28 <get_st_head>:

st_t get_st_head(void){
 8048a28:	55                   	push   %ebp
 8048a29:	89 e5                	mov    %esp,%ebp
	return head;
 8048a2b:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
}
 8048a30:	5d                   	pop    %ebp
 8048a31:	c3                   	ret    

08048a32 <create_new_stone>:

void create_new_stone(void) {
 8048a32:	55                   	push   %ebp
 8048a33:	89 e5                	mov    %esp,%ebp
 8048a35:	53                   	push   %ebx
 8048a36:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048a39:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a3e:	85 c0                	test   %eax,%eax
 8048a40:	75 0c                	jne    8048a4e <create_new_stone+0x1c>
		head = st_new(); 
 8048a42:	e8 b3 fc ff ff       	call   80486fa <st_new>
 8048a47:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
 8048a4c:	eb 2c                	jmp    8048a7a <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048a4e:	e8 a7 fc ff ff       	call   80486fa <st_new>
 8048a53:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048a56:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a5b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048a5e:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048a62:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a66:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a6d:	e8 b4 fd ff ff       	call   8048826 <st_insert>
		head = now;
 8048a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a75:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
	}
	head->x = 0;
 8048a7a:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a7f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048a85:	8b 1d dc 5d 08 08    	mov    0x8085ddc,%ebx
 8048a8b:	e8 c9 10 00 00       	call   8049b59 <rand>
 8048a90:	89 c1                	mov    %eax,%ecx
 8048a92:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048a97:	89 c8                	mov    %ecx,%eax
 8048a99:	f7 ea                	imul   %edx
 8048a9b:	c1 fa 04             	sar    $0x4,%edx
 8048a9e:	89 c8                	mov    %ecx,%eax
 8048aa0:	c1 f8 1f             	sar    $0x1f,%eax
 8048aa3:	29 c2                	sub    %eax,%edx
 8048aa5:	89 d0                	mov    %edx,%eax
 8048aa7:	6b c0 26             	imul   $0x26,%eax,%eax
 8048aaa:	29 c1                	sub    %eax,%ecx
 8048aac:	89 c8                	mov    %ecx,%eax
 8048aae:	83 c0 01             	add    $0x1,%eax
 8048ab1:	c1 e0 03             	shl    $0x3,%eax
 8048ab4:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048ab7:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048abc:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048ac3:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ac8:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048acf:	83 c4 24             	add    $0x24,%esp
 8048ad2:	5b                   	pop    %ebx
 8048ad3:	5d                   	pop    %ebp
 8048ad4:	c3                   	ret    

08048ad5 <update_stone_pos>:

void update_stone_pos(void) {
 8048ad5:	55                   	push   %ebp
 8048ad6:	89 e5                	mov    %esp,%ebp
 8048ad8:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048adb:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ae0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048ae3:	eb 6f                	jmp    8048b54 <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ae8:	89 04 24             	mov    %eax,(%esp)
 8048aeb:	e8 fe fc ff ff       	call   80487ee <st_next>
 8048af0:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048af6:	8b 10                	mov    (%eax),%edx
 8048af8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048afb:	8b 40 0c             	mov    0xc(%eax),%eax
 8048afe:	01 c2                	add    %eax,%edx
 8048b00:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b03:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048b05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b08:	8b 10                	mov    (%eax),%edx
 8048b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b0d:	8b 40 08             	mov    0x8(%eax),%eax
 8048b10:	01 d0                	add    %edx,%eax
 8048b12:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048b17:	7e 35                	jle    8048b4e <update_stone_pos+0x79>
			miss++; 
 8048b19:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
 8048b1e:	83 c0 01             	add    $0x1,%eax
 8048b21:	a3 e4 5d 08 08       	mov    %eax,0x8085de4
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b29:	89 04 24             	mov    %eax,(%esp)
 8048b2c:	e8 5d fd ff ff       	call   804888e <st_remove>
			if (it == head) head = next; 
 8048b31:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b36:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048b39:	75 08                	jne    8048b43 <update_stone_pos+0x6e>
 8048b3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b3e:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b46:	89 04 24             	mov    %eax,(%esp)
 8048b49:	e8 a2 fd ff ff       	call   80488f0 <st_free>
		}
		it = next;
 8048b4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b51:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048b54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048b58:	75 8b                	jne    8048ae5 <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048b5a:	c9                   	leave  
 8048b5b:	c3                   	ret    

08048b5c <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048b5c:	55                   	push   %ebp
 8048b5d:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048b5f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048b62:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048b65:	7f 29                	jg     8048b90 <inplane+0x34>
 8048b67:	8b 55 10             	mov    0x10(%ebp),%edx
 8048b6a:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b6d:	01 d0                	add    %edx,%eax
 8048b6f:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048b72:	7c 1c                	jl     8048b90 <inplane+0x34>
 8048b74:	8b 45 14             	mov    0x14(%ebp),%eax
 8048b77:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048b7a:	7f 14                	jg     8048b90 <inplane+0x34>
 8048b7c:	8b 55 14             	mov    0x14(%ebp),%edx
 8048b7f:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b82:	01 d0                	add    %edx,%eax
 8048b84:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048b87:	7c 07                	jl     8048b90 <inplane+0x34>
 8048b89:	b8 01 00 00 00       	mov    $0x1,%eax
 8048b8e:	eb 05                	jmp    8048b95 <inplane+0x39>
 8048b90:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048b95:	5d                   	pop    %ebp
 8048b96:	c3                   	ret    

08048b97 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048b97:	55                   	push   %ebp
 8048b98:	89 e5                	mov    %esp,%ebp
 8048b9a:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048b9d:	8b 45 18             	mov    0x18(%ebp),%eax
 8048ba0:	8b 00                	mov    (%eax),%eax
 8048ba2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048ba5:	8b 45 18             	mov    0x18(%ebp),%eax
 8048ba8:	8b 40 04             	mov    0x4(%eax),%eax
 8048bab:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048bae:	8b 45 18             	mov    0x18(%ebp),%eax
 8048bb1:	8b 40 08             	mov    0x8(%eax),%eax
 8048bb4:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048bb7:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bba:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048bbd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bc0:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048bc3:	8b 45 10             	mov    0x10(%ebp),%eax
 8048bc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048bc9:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048bcc:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bcf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048bd2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048bd6:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048bd9:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048bdd:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048be0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048be4:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048be8:	89 04 24             	mov    %eax,(%esp)
 8048beb:	e8 6c ff ff ff       	call   8048b5c <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048bf0:	85 c0                	test   %eax,%eax
 8048bf2:	0f 85 69 01 00 00    	jne    8048d61 <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048bf8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bfb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048bfe:	8b 55 10             	mov    0x10(%ebp),%edx
 8048c01:	01 d1                	add    %edx,%ecx
 8048c03:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c06:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c0a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c0d:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c11:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c14:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048c18:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c1c:	89 0c 24             	mov    %ecx,(%esp)
 8048c1f:	e8 38 ff ff ff       	call   8048b5c <inplane>
 8048c24:	85 c0                	test   %eax,%eax
 8048c26:	0f 85 35 01 00 00    	jne    8048d61 <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048c2c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c2f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c32:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048c35:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c38:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c3b:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c3f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c42:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c46:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c49:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048c4d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048c51:	89 04 24             	mov    %eax,(%esp)
 8048c54:	e8 03 ff ff ff       	call   8048b5c <inplane>
 8048c59:	85 c0                	test   %eax,%eax
 8048c5b:	0f 85 00 01 00 00    	jne    8048d61 <bang_or_not+0x1ca>
 8048c61:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c64:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c67:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048c6a:	8b 55 08             	mov    0x8(%ebp),%edx
 8048c6d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c70:	01 c2                	add    %eax,%edx
 8048c72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c75:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c79:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048c7c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c80:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048c83:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048c87:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048c8b:	89 14 24             	mov    %edx,(%esp)
 8048c8e:	e8 c9 fe ff ff       	call   8048b5c <inplane>
 8048c93:	85 c0                	test   %eax,%eax
 8048c95:	0f 85 c6 00 00 00    	jne    8048d61 <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048c9b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ca1:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048ca4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048ca8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048cab:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048caf:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048cb2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048cb6:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048cba:	89 04 24             	mov    %eax,(%esp)
 8048cbd:	e8 9a fe ff ff       	call   8048b5c <inplane>
 8048cc2:	85 c0                	test   %eax,%eax
 8048cc4:	0f 85 97 00 00 00    	jne    8048d61 <bang_or_not+0x1ca>
 8048cca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ccd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048cd0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048cd3:	01 d1                	add    %edx,%ecx
 8048cd5:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048cd8:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048cdc:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048cdf:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048ce3:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048ce6:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048cea:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cee:	89 0c 24             	mov    %ecx,(%esp)
 8048cf1:	e8 66 fe ff ff       	call   8048b5c <inplane>
 8048cf6:	85 c0                	test   %eax,%eax
 8048cf8:	75 67                	jne    8048d61 <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048cfa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048cfd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d00:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d06:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048d09:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048d0d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048d10:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048d14:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048d17:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048d1b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d1f:	89 04 24             	mov    %eax,(%esp)
 8048d22:	e8 35 fe ff ff       	call   8048b5c <inplane>
 8048d27:	85 c0                	test   %eax,%eax
 8048d29:	75 36                	jne    8048d61 <bang_or_not+0x1ca>
 8048d2b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d31:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d34:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048d37:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d3a:	01 c2                	add    %eax,%edx
 8048d3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d3f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d43:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048d46:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048d4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d4d:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048d51:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d55:	89 14 24             	mov    %edx,(%esp)
 8048d58:	e8 ff fd ff ff       	call   8048b5c <inplane>
 8048d5d:	85 c0                	test   %eax,%eax
 8048d5f:	74 07                	je     8048d68 <bang_or_not+0x1d1>
 8048d61:	b8 01 00 00 00       	mov    $0x1,%eax
 8048d66:	eb 05                	jmp    8048d6d <bang_or_not+0x1d6>
 8048d68:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048d6d:	c9                   	leave  
 8048d6e:	c3                   	ret    

08048d6f <update_bang>:

void update_bang(void) {
 8048d6f:	55                   	push   %ebp
 8048d70:	89 e5                	mov    %esp,%ebp
 8048d72:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048d75:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048d7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d7d:	eb 7c                	jmp    8048dfb <update_bang+0x8c>
		st_t next=st_next(it);
 8048d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d82:	89 04 24             	mov    %eax,(%esp)
 8048d85:	e8 64 fa ff ff       	call   80487ee <st_next>
 8048d8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d90:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048d94:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 8048d99:	89 04 24             	mov    %eax,(%esp)
 8048d9c:	a1 10 5c 09 08       	mov    0x8095c10,%eax
 8048da1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048da5:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048daa:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048dae:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048db3:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048db7:	e8 db fd ff ff       	call   8048b97 <bang_or_not>
 8048dbc:	85 c0                	test   %eax,%eax
 8048dbe:	74 35                	je     8048df5 <update_bang+0x86>
			score++;
 8048dc0:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
 8048dc5:	83 c0 01             	add    $0x1,%eax
 8048dc8:	a3 e0 5d 08 08       	mov    %eax,0x8085de0
			st_remove(it);
 8048dcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048dd0:	89 04 24             	mov    %eax,(%esp)
 8048dd3:	e8 b6 fa ff ff       	call   804888e <st_remove>
			if(it==head)
 8048dd8:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ddd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048de0:	75 08                	jne    8048dea <update_bang+0x7b>
				head=next;
 8048de2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048de5:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048dea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ded:	89 04 24             	mov    %eax,(%esp)
 8048df0:	e8 fb fa ff ff       	call   80488f0 <st_free>
		}
		it=next;
 8048df5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048df8:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048dfb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048dff:	0f 85 7a ff ff ff    	jne    8048d7f <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8048e05:	c9                   	leave  
 8048e06:	c3                   	ret    

08048e07 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8048e07:	55                   	push   %ebp
 8048e08:	89 e5                	mov    %esp,%ebp
 8048e0a:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8048e0d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048e11:	78 18                	js     8048e2b <draw_pixel+0x24>
 8048e13:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048e17:	78 12                	js     8048e2b <draw_pixel+0x24>
 8048e19:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 8048e20:	7f 09                	jg     8048e2b <draw_pixel+0x24>
 8048e22:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8048e29:	7e 24                	jle    8048e4f <draw_pixel+0x48>
 8048e2b:	c7 44 24 0c 54 9f 04 	movl   $0x8049f54,0xc(%esp)
 8048e32:	08 
 8048e33:	c7 44 24 08 88 9f 04 	movl   $0x8049f88,0x8(%esp)
 8048e3a:	08 
 8048e3b:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048e42:	00 
 8048e43:	c7 04 24 9d 9f 04 08 	movl   $0x8049f9d,(%esp)
 8048e4a:	e8 1b f3 ff ff       	call   804816a <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 8048e4f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e52:	c1 e0 08             	shl    $0x8,%eax
 8048e55:	89 c2                	mov    %eax,%edx
 8048e57:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e5a:	c1 e0 06             	shl    $0x6,%eax
 8048e5d:	01 c2                	add    %eax,%edx
 8048e5f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048e62:	01 c2                	add    %eax,%edx
 8048e64:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e67:	88 82 00 5e 08 08    	mov    %al,0x8085e00(%edx)
}
 8048e6d:	c9                   	leave  
 8048e6e:	c3                   	ret    

08048e6f <sysclean>:


void sysclean(void)
{
 8048e6f:	55                   	push   %ebp
 8048e70:	89 e5                	mov    %esp,%ebp
 8048e72:	83 ec 18             	sub    $0x18,%esp
	memset(buff, 0, sizeof(buff));
 8048e75:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 8048e7c:	00 
 8048e7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048e84:	00 
 8048e85:	c7 04 24 00 5e 08 08 	movl   $0x8085e00,(%esp)
 8048e8c:	e8 b9 01 00 00       	call   804904a <memset>
}
 8048e91:	c9                   	leave  
 8048e92:	c3                   	ret    

08048e93 <syspr>:
int syspr()
{
 8048e93:	55                   	push   %ebp
 8048e94:	89 e5                	mov    %esp,%ebp
 8048e96:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_pr, buff);
 8048e99:	c7 44 24 04 00 5e 08 	movl   $0x8085e00,0x4(%esp)
 8048ea0:	08 
 8048ea1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048ea8:	e8 53 00 00 00       	call   8048f00 <syscall>
}
 8048ead:	c9                   	leave  
 8048eae:	c3                   	ret    

08048eaf <systime>:

int systime(void)
{
 8048eaf:	55                   	push   %ebp
 8048eb0:	89 e5                	mov    %esp,%ebp
 8048eb2:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_time);
 8048eb5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048ebc:	e8 3f 00 00 00       	call   8048f00 <syscall>
}
 8048ec1:	c9                   	leave  
 8048ec2:	c3                   	ret    

08048ec3 <sysreadkey>:

int sysreadkey(void)
{
 8048ec3:	55                   	push   %ebp
 8048ec4:	89 e5                	mov    %esp,%ebp
 8048ec6:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_readkey);
 8048ec9:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048ed0:	e8 2b 00 00 00       	call   8048f00 <syscall>
}
 8048ed5:	c9                   	leave  
 8048ed6:	c3                   	ret    

08048ed7 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8048ed7:	55                   	push   %ebp
 8048ed8:	89 e5                	mov    %esp,%ebp
 8048eda:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_write, fd, buf1, n);
 8048edd:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ee0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048ee4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ee7:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048eeb:	8b 45 08             	mov    0x8(%ebp),%eax
 8048eee:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ef2:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048ef9:	e8 02 00 00 00       	call   8048f00 <syscall>
 8048efe:	c9                   	leave  
 8048eff:	c3                   	ret    

08048f00 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 8048f00:	55                   	push   %ebp
 8048f01:	89 e5                	mov    %esp,%ebp
 8048f03:	53                   	push   %ebx
 8048f04:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 8048f07:	8d 45 08             	lea    0x8(%ebp),%eax
 8048f0a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 8048f0d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f10:	8b 00                	mov    (%eax),%eax
 8048f12:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f15:	83 c2 04             	add    $0x4,%edx
 8048f18:	8b 1a                	mov    (%edx),%ebx
 8048f1a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f1d:	83 c2 08             	add    $0x8,%edx
 8048f20:	8b 0a                	mov    (%edx),%ecx
 8048f22:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f25:	83 c2 0c             	add    $0xc,%edx
 8048f28:	8b 12                	mov    (%edx),%edx
 8048f2a:	cd 80                	int    $0x80
 8048f2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 8048f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048f32:	83 c4 10             	add    $0x10,%esp
 8048f35:	5b                   	pop    %ebx
 8048f36:	5d                   	pop    %ebp
 8048f37:	c3                   	ret    

08048f38 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 8048f38:	55                   	push   %ebp
 8048f39:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 8048f3b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f3e:	8b 00                	mov    (%eax),%eax
 8048f40:	8d 48 01             	lea    0x1(%eax),%ecx
 8048f43:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048f46:	89 0a                	mov    %ecx,(%edx)
 8048f48:	8b 55 08             	mov    0x8(%ebp),%edx
 8048f4b:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 8048f51:	5d                   	pop    %ebp
 8048f52:	c3                   	ret    

08048f53 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 8048f53:	55                   	push   %ebp
 8048f54:	89 e5                	mov    %esp,%ebp
 8048f56:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 8048f59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 8048f60:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f63:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f67:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f6a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f6e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048f71:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f75:	c7 04 24 38 8f 04 08 	movl   $0x8048f38,(%esp)
 8048f7c:	e8 d1 06 00 00       	call   8049652 <vprintfmt>
	return cnt;
 8048f81:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048f84:	c9                   	leave  
 8048f85:	c3                   	ret    

08048f86 <printf>:
int printf(const char *fmt, ...)
{
 8048f86:	55                   	push   %ebp
 8048f87:	89 e5                	mov    %esp,%ebp
 8048f89:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8048f8c:	8d 45 0c             	lea    0xc(%ebp),%eax
 8048f8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 8048f92:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f95:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f99:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f9c:	89 04 24             	mov    %eax,(%esp)
 8048f9f:	e8 af ff ff ff       	call   8048f53 <vprintf>
 8048fa4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 8048fa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048faa:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048fae:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 8048fb5:	08 
 8048fb6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048fbd:	e8 15 ff ff ff       	call   8048ed7 <syswrite>
	return cnt;
 8048fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fc5:	c9                   	leave  
 8048fc6:	c3                   	ret    

08048fc7 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 8048fc7:	55                   	push   %ebp
 8048fc8:	89 e5                	mov    %esp,%ebp
 8048fca:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 8048fcd:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 8048fd4:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8048fd8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048fdb:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8048fe0:	89 c8                	mov    %ecx,%eax
 8048fe2:	f7 ea                	imul   %edx
 8048fe4:	c1 fa 02             	sar    $0x2,%edx
 8048fe7:	89 c8                	mov    %ecx,%eax
 8048fe9:	c1 f8 1f             	sar    $0x1f,%eax
 8048fec:	29 c2                	sub    %eax,%edx
 8048fee:	89 d0                	mov    %edx,%eax
 8048ff0:	c1 e0 02             	shl    $0x2,%eax
 8048ff3:	01 d0                	add    %edx,%eax
 8048ff5:	01 c0                	add    %eax,%eax
 8048ff7:	29 c1                	sub    %eax,%ecx
 8048ff9:	89 ca                	mov    %ecx,%edx
 8048ffb:	89 d0                	mov    %edx,%eax
 8048ffd:	83 c0 30             	add    $0x30,%eax
 8049000:	89 c2                	mov    %eax,%edx
 8049002:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049005:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 8049007:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804900a:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804900f:	89 c8                	mov    %ecx,%eax
 8049011:	f7 ea                	imul   %edx
 8049013:	c1 fa 02             	sar    $0x2,%edx
 8049016:	89 c8                	mov    %ecx,%eax
 8049018:	c1 f8 1f             	sar    $0x1f,%eax
 804901b:	29 c2                	sub    %eax,%edx
 804901d:	89 d0                	mov    %edx,%eax
 804901f:	89 45 08             	mov    %eax,0x8(%ebp)
 8049022:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049026:	75 ac                	jne    8048fd4 <itoa+0xd>
	return p;
 8049028:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 804902b:	c9                   	leave  
 804902c:	c3                   	ret    

0804902d <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 804902d:	55                   	push   %ebp
 804902e:	89 e5                	mov    %esp,%ebp
 8049030:	57                   	push   %edi
 8049031:	56                   	push   %esi
 8049032:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 8049033:	8b 45 10             	mov    0x10(%ebp),%eax
 8049036:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049039:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804903c:	89 c1                	mov    %eax,%ecx
 804903e:	89 d6                	mov    %edx,%esi
 8049040:	89 df                	mov    %ebx,%edi
 8049042:	fc                   	cld    
 8049043:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 8049045:	5b                   	pop    %ebx
 8049046:	5e                   	pop    %esi
 8049047:	5f                   	pop    %edi
 8049048:	5d                   	pop    %ebp
 8049049:	c3                   	ret    

0804904a <memset>:

void memset(void *dest, int data, size_t size) {
 804904a:	55                   	push   %ebp
 804904b:	89 e5                	mov    %esp,%ebp
 804904d:	57                   	push   %edi
 804904e:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 804904f:	8b 55 10             	mov    0x10(%ebp),%edx
 8049052:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049055:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049058:	89 d1                	mov    %edx,%ecx
 804905a:	89 df                	mov    %ebx,%edi
 804905c:	fc                   	cld    
 804905d:	f3 aa                	rep stos %al,%es:(%edi)
}
 804905f:	5b                   	pop    %ebx
 8049060:	5f                   	pop    %edi
 8049061:	5d                   	pop    %ebp
 8049062:	c3                   	ret    

08049063 <strlen>:

size_t strlen(const char *str) {
 8049063:	55                   	push   %ebp
 8049064:	89 e5                	mov    %esp,%ebp
 8049066:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 8049069:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 8049070:	eb 04                	jmp    8049076 <strlen+0x13>
 8049072:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049076:	8b 45 08             	mov    0x8(%ebp),%eax
 8049079:	8d 50 01             	lea    0x1(%eax),%edx
 804907c:	89 55 08             	mov    %edx,0x8(%ebp)
 804907f:	0f b6 00             	movzbl (%eax),%eax
 8049082:	84 c0                	test   %al,%al
 8049084:	75 ec                	jne    8049072 <strlen+0xf>
	return len;
 8049086:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049089:	c9                   	leave  
 804908a:	c3                   	ret    

0804908b <strcpy>:

void strcpy(char *d, const char *s) {
 804908b:	55                   	push   %ebp
 804908c:	89 e5                	mov    %esp,%ebp
 804908e:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 8049091:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049094:	89 04 24             	mov    %eax,(%esp)
 8049097:	e8 c7 ff ff ff       	call   8049063 <strlen>
 804909c:	83 c0 01             	add    $0x1,%eax
 804909f:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490aa:	8b 45 08             	mov    0x8(%ebp),%eax
 80490ad:	89 04 24             	mov    %eax,(%esp)
 80490b0:	e8 78 ff ff ff       	call   804902d <memcpy>
}
 80490b5:	c9                   	leave  
 80490b6:	c3                   	ret    

080490b7 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 80490b7:	55                   	push   %ebp
 80490b8:	89 e5                	mov    %esp,%ebp
 80490ba:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 80490bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80490c4:	eb 0c                	jmp    80490d2 <strnlen+0x1b>
		n++;
 80490c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 80490ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80490ce:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 80490d2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80490d6:	74 0a                	je     80490e2 <strnlen+0x2b>
 80490d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80490db:	0f b6 00             	movzbl (%eax),%eax
 80490de:	84 c0                	test   %al,%al
 80490e0:	75 e4                	jne    80490c6 <strnlen+0xf>
		n++;
	return n;
 80490e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80490e5:	c9                   	leave  
 80490e6:	c3                   	ret    

080490e7 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 80490e7:	55                   	push   %ebp
 80490e8:	89 e5                	mov    %esp,%ebp
 80490ea:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 80490ed:	8b 45 08             	mov    0x8(%ebp),%eax
 80490f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 80490f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80490fa:	eb 23                	jmp    804911f <strncpy+0x38>
		*dst++ = *src;
 80490fc:	8b 45 08             	mov    0x8(%ebp),%eax
 80490ff:	8d 50 01             	lea    0x1(%eax),%edx
 8049102:	89 55 08             	mov    %edx,0x8(%ebp)
 8049105:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049108:	0f b6 12             	movzbl (%edx),%edx
 804910b:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 804910d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049110:	0f b6 00             	movzbl (%eax),%eax
 8049113:	84 c0                	test   %al,%al
 8049115:	74 04                	je     804911b <strncpy+0x34>
			src++;
 8049117:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 804911b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804911f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049122:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049125:	72 d5                	jb     80490fc <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 8049127:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 804912a:	c9                   	leave  
 804912b:	c3                   	ret    

0804912c <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 804912c:	55                   	push   %ebp
 804912d:	89 e5                	mov    %esp,%ebp
 804912f:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 8049132:	8b 45 08             	mov    0x8(%ebp),%eax
 8049135:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 8049138:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804913c:	74 33                	je     8049171 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 804913e:	eb 17                	jmp    8049157 <strlcpy+0x2b>
			*dst++ = *src++;
 8049140:	8b 45 08             	mov    0x8(%ebp),%eax
 8049143:	8d 50 01             	lea    0x1(%eax),%edx
 8049146:	89 55 08             	mov    %edx,0x8(%ebp)
 8049149:	8b 55 0c             	mov    0xc(%ebp),%edx
 804914c:	8d 4a 01             	lea    0x1(%edx),%ecx
 804914f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 8049152:	0f b6 12             	movzbl (%edx),%edx
 8049155:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 8049157:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 804915b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804915f:	74 0a                	je     804916b <strlcpy+0x3f>
 8049161:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049164:	0f b6 00             	movzbl (%eax),%eax
 8049167:	84 c0                	test   %al,%al
 8049169:	75 d5                	jne    8049140 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 804916b:	8b 45 08             	mov    0x8(%ebp),%eax
 804916e:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 8049171:	8b 55 08             	mov    0x8(%ebp),%edx
 8049174:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049177:	29 c2                	sub    %eax,%edx
 8049179:	89 d0                	mov    %edx,%eax
}
 804917b:	c9                   	leave  
 804917c:	c3                   	ret    

0804917d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 804917d:	55                   	push   %ebp
 804917e:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 8049180:	eb 08                	jmp    804918a <strcmp+0xd>
		p++, q++;
 8049182:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049186:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 804918a:	8b 45 08             	mov    0x8(%ebp),%eax
 804918d:	0f b6 00             	movzbl (%eax),%eax
 8049190:	84 c0                	test   %al,%al
 8049192:	74 10                	je     80491a4 <strcmp+0x27>
 8049194:	8b 45 08             	mov    0x8(%ebp),%eax
 8049197:	0f b6 10             	movzbl (%eax),%edx
 804919a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804919d:	0f b6 00             	movzbl (%eax),%eax
 80491a0:	38 c2                	cmp    %al,%dl
 80491a2:	74 de                	je     8049182 <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 80491a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80491a7:	0f b6 00             	movzbl (%eax),%eax
 80491aa:	0f b6 d0             	movzbl %al,%edx
 80491ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491b0:	0f b6 00             	movzbl (%eax),%eax
 80491b3:	0f b6 c0             	movzbl %al,%eax
 80491b6:	29 c2                	sub    %eax,%edx
 80491b8:	89 d0                	mov    %edx,%eax
}
 80491ba:	5d                   	pop    %ebp
 80491bb:	c3                   	ret    

080491bc <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 80491bc:	55                   	push   %ebp
 80491bd:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 80491bf:	eb 0c                	jmp    80491cd <strncmp+0x11>
		n--, p++, q++;
 80491c1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 80491c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80491c9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 80491cd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491d1:	74 1a                	je     80491ed <strncmp+0x31>
 80491d3:	8b 45 08             	mov    0x8(%ebp),%eax
 80491d6:	0f b6 00             	movzbl (%eax),%eax
 80491d9:	84 c0                	test   %al,%al
 80491db:	74 10                	je     80491ed <strncmp+0x31>
 80491dd:	8b 45 08             	mov    0x8(%ebp),%eax
 80491e0:	0f b6 10             	movzbl (%eax),%edx
 80491e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491e6:	0f b6 00             	movzbl (%eax),%eax
 80491e9:	38 c2                	cmp    %al,%dl
 80491eb:	74 d4                	je     80491c1 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 80491ed:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491f1:	75 07                	jne    80491fa <strncmp+0x3e>
		return 0;
 80491f3:	b8 00 00 00 00       	mov    $0x0,%eax
 80491f8:	eb 16                	jmp    8049210 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 80491fa:	8b 45 08             	mov    0x8(%ebp),%eax
 80491fd:	0f b6 00             	movzbl (%eax),%eax
 8049200:	0f b6 d0             	movzbl %al,%edx
 8049203:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049206:	0f b6 00             	movzbl (%eax),%eax
 8049209:	0f b6 c0             	movzbl %al,%eax
 804920c:	29 c2                	sub    %eax,%edx
 804920e:	89 d0                	mov    %edx,%eax
}
 8049210:	5d                   	pop    %ebp
 8049211:	c3                   	ret    

08049212 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 8049212:	55                   	push   %ebp
 8049213:	89 e5                	mov    %esp,%ebp
 8049215:	83 ec 04             	sub    $0x4,%esp
 8049218:	8b 45 0c             	mov    0xc(%ebp),%eax
 804921b:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 804921e:	eb 14                	jmp    8049234 <strchr+0x22>
		if (*s == c)
 8049220:	8b 45 08             	mov    0x8(%ebp),%eax
 8049223:	0f b6 00             	movzbl (%eax),%eax
 8049226:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049229:	75 05                	jne    8049230 <strchr+0x1e>
			return (char *) s;
 804922b:	8b 45 08             	mov    0x8(%ebp),%eax
 804922e:	eb 13                	jmp    8049243 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 8049230:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049234:	8b 45 08             	mov    0x8(%ebp),%eax
 8049237:	0f b6 00             	movzbl (%eax),%eax
 804923a:	84 c0                	test   %al,%al
 804923c:	75 e2                	jne    8049220 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 804923e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8049243:	c9                   	leave  
 8049244:	c3                   	ret    

08049245 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 8049245:	55                   	push   %ebp
 8049246:	89 e5                	mov    %esp,%ebp
 8049248:	83 ec 04             	sub    $0x4,%esp
 804924b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804924e:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 8049251:	eb 11                	jmp    8049264 <strfind+0x1f>
		if (*s == c)
 8049253:	8b 45 08             	mov    0x8(%ebp),%eax
 8049256:	0f b6 00             	movzbl (%eax),%eax
 8049259:	3a 45 fc             	cmp    -0x4(%ebp),%al
 804925c:	75 02                	jne    8049260 <strfind+0x1b>
			break;
 804925e:	eb 0e                	jmp    804926e <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 8049260:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049264:	8b 45 08             	mov    0x8(%ebp),%eax
 8049267:	0f b6 00             	movzbl (%eax),%eax
 804926a:	84 c0                	test   %al,%al
 804926c:	75 e5                	jne    8049253 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 804926e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049271:	c9                   	leave  
 8049272:	c3                   	ret    

08049273 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 8049273:	55                   	push   %ebp
 8049274:	89 e5                	mov    %esp,%ebp
 8049276:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 8049279:	8b 45 0c             	mov    0xc(%ebp),%eax
 804927c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 804927f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049282:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 8049285:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049288:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 804928b:	73 3d                	jae    80492ca <memmove+0x57>
 804928d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049290:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049293:	01 d0                	add    %edx,%eax
 8049295:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049298:	76 30                	jbe    80492ca <memmove+0x57>
		s += n;
 804929a:	8b 45 10             	mov    0x10(%ebp),%eax
 804929d:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 80492a0:	8b 45 10             	mov    0x10(%ebp),%eax
 80492a3:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 80492a6:	eb 13                	jmp    80492bb <memmove+0x48>
			*--d = *--s;
 80492a8:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 80492ac:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 80492b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492b3:	0f b6 10             	movzbl (%eax),%edx
 80492b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80492b9:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 80492bb:	8b 45 10             	mov    0x10(%ebp),%eax
 80492be:	8d 50 ff             	lea    -0x1(%eax),%edx
 80492c1:	89 55 10             	mov    %edx,0x10(%ebp)
 80492c4:	85 c0                	test   %eax,%eax
 80492c6:	75 e0                	jne    80492a8 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 80492c8:	eb 26                	jmp    80492f0 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 80492ca:	eb 17                	jmp    80492e3 <memmove+0x70>
			*d++ = *s++;
 80492cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80492cf:	8d 50 01             	lea    0x1(%eax),%edx
 80492d2:	89 55 f8             	mov    %edx,-0x8(%ebp)
 80492d5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80492d8:	8d 4a 01             	lea    0x1(%edx),%ecx
 80492db:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 80492de:	0f b6 12             	movzbl (%edx),%edx
 80492e1:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 80492e3:	8b 45 10             	mov    0x10(%ebp),%eax
 80492e6:	8d 50 ff             	lea    -0x1(%eax),%edx
 80492e9:	89 55 10             	mov    %edx,0x10(%ebp)
 80492ec:	85 c0                	test   %eax,%eax
 80492ee:	75 dc                	jne    80492cc <memmove+0x59>
			*d++ = *s++;

	return dst;
 80492f0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80492f3:	c9                   	leave  
 80492f4:	c3                   	ret    

080492f5 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 80492f5:	55                   	push   %ebp
 80492f6:	89 e5                	mov    %esp,%ebp
 80492f8:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 80492fb:	8b 45 08             	mov    0x8(%ebp),%eax
 80492fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 8049301:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049304:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 8049307:	eb 30                	jmp    8049339 <memcmp+0x44>
		if (*s1 != *s2)
 8049309:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804930c:	0f b6 10             	movzbl (%eax),%edx
 804930f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049312:	0f b6 00             	movzbl (%eax),%eax
 8049315:	38 c2                	cmp    %al,%dl
 8049317:	74 18                	je     8049331 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 8049319:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804931c:	0f b6 00             	movzbl (%eax),%eax
 804931f:	0f b6 d0             	movzbl %al,%edx
 8049322:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049325:	0f b6 00             	movzbl (%eax),%eax
 8049328:	0f b6 c0             	movzbl %al,%eax
 804932b:	29 c2                	sub    %eax,%edx
 804932d:	89 d0                	mov    %edx,%eax
 804932f:	eb 1a                	jmp    804934b <memcmp+0x56>
		s1++, s2++;
 8049331:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049335:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 8049339:	8b 45 10             	mov    0x10(%ebp),%eax
 804933c:	8d 50 ff             	lea    -0x1(%eax),%edx
 804933f:	89 55 10             	mov    %edx,0x10(%ebp)
 8049342:	85 c0                	test   %eax,%eax
 8049344:	75 c3                	jne    8049309 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 8049346:	b8 00 00 00 00       	mov    $0x0,%eax
}
 804934b:	c9                   	leave  
 804934c:	c3                   	ret    

0804934d <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 804934d:	55                   	push   %ebp
 804934e:	89 e5                	mov    %esp,%ebp
 8049350:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 8049353:	8b 45 10             	mov    0x10(%ebp),%eax
 8049356:	8b 55 08             	mov    0x8(%ebp),%edx
 8049359:	01 d0                	add    %edx,%eax
 804935b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 804935e:	eb 13                	jmp    8049373 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 8049360:	8b 45 08             	mov    0x8(%ebp),%eax
 8049363:	0f b6 10             	movzbl (%eax),%edx
 8049366:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049369:	38 c2                	cmp    %al,%dl
 804936b:	75 02                	jne    804936f <memfind+0x22>
			break;
 804936d:	eb 0c                	jmp    804937b <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 804936f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049373:	8b 45 08             	mov    0x8(%ebp),%eax
 8049376:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8049379:	72 e5                	jb     8049360 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 804937b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804937e:	c9                   	leave  
 804937f:	c3                   	ret    

08049380 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 8049380:	55                   	push   %ebp
 8049381:	89 e5                	mov    %esp,%ebp
 8049383:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 8049386:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 804938d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049394:	eb 04                	jmp    804939a <strtol+0x1a>
		s++;
 8049396:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 804939a:	8b 45 08             	mov    0x8(%ebp),%eax
 804939d:	0f b6 00             	movzbl (%eax),%eax
 80493a0:	3c 20                	cmp    $0x20,%al
 80493a2:	74 f2                	je     8049396 <strtol+0x16>
 80493a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80493a7:	0f b6 00             	movzbl (%eax),%eax
 80493aa:	3c 09                	cmp    $0x9,%al
 80493ac:	74 e8                	je     8049396 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 80493ae:	8b 45 08             	mov    0x8(%ebp),%eax
 80493b1:	0f b6 00             	movzbl (%eax),%eax
 80493b4:	3c 2b                	cmp    $0x2b,%al
 80493b6:	75 06                	jne    80493be <strtol+0x3e>
		s++;
 80493b8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80493bc:	eb 15                	jmp    80493d3 <strtol+0x53>
	else if (*s == '-')
 80493be:	8b 45 08             	mov    0x8(%ebp),%eax
 80493c1:	0f b6 00             	movzbl (%eax),%eax
 80493c4:	3c 2d                	cmp    $0x2d,%al
 80493c6:	75 0b                	jne    80493d3 <strtol+0x53>
		s++, neg = 1;
 80493c8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80493cc:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 80493d3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80493d7:	74 06                	je     80493df <strtol+0x5f>
 80493d9:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 80493dd:	75 24                	jne    8049403 <strtol+0x83>
 80493df:	8b 45 08             	mov    0x8(%ebp),%eax
 80493e2:	0f b6 00             	movzbl (%eax),%eax
 80493e5:	3c 30                	cmp    $0x30,%al
 80493e7:	75 1a                	jne    8049403 <strtol+0x83>
 80493e9:	8b 45 08             	mov    0x8(%ebp),%eax
 80493ec:	83 c0 01             	add    $0x1,%eax
 80493ef:	0f b6 00             	movzbl (%eax),%eax
 80493f2:	3c 78                	cmp    $0x78,%al
 80493f4:	75 0d                	jne    8049403 <strtol+0x83>
		s += 2, base = 16;
 80493f6:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 80493fa:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 8049401:	eb 2a                	jmp    804942d <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 8049403:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049407:	75 17                	jne    8049420 <strtol+0xa0>
 8049409:	8b 45 08             	mov    0x8(%ebp),%eax
 804940c:	0f b6 00             	movzbl (%eax),%eax
 804940f:	3c 30                	cmp    $0x30,%al
 8049411:	75 0d                	jne    8049420 <strtol+0xa0>
		s++, base = 8;
 8049413:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049417:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 804941e:	eb 0d                	jmp    804942d <strtol+0xad>
	else if (base == 0)
 8049420:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049424:	75 07                	jne    804942d <strtol+0xad>
		base = 10;
 8049426:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 804942d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049430:	0f b6 00             	movzbl (%eax),%eax
 8049433:	3c 2f                	cmp    $0x2f,%al
 8049435:	7e 1b                	jle    8049452 <strtol+0xd2>
 8049437:	8b 45 08             	mov    0x8(%ebp),%eax
 804943a:	0f b6 00             	movzbl (%eax),%eax
 804943d:	3c 39                	cmp    $0x39,%al
 804943f:	7f 11                	jg     8049452 <strtol+0xd2>
			dig = *s - '0';
 8049441:	8b 45 08             	mov    0x8(%ebp),%eax
 8049444:	0f b6 00             	movzbl (%eax),%eax
 8049447:	0f be c0             	movsbl %al,%eax
 804944a:	83 e8 30             	sub    $0x30,%eax
 804944d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049450:	eb 48                	jmp    804949a <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 8049452:	8b 45 08             	mov    0x8(%ebp),%eax
 8049455:	0f b6 00             	movzbl (%eax),%eax
 8049458:	3c 60                	cmp    $0x60,%al
 804945a:	7e 1b                	jle    8049477 <strtol+0xf7>
 804945c:	8b 45 08             	mov    0x8(%ebp),%eax
 804945f:	0f b6 00             	movzbl (%eax),%eax
 8049462:	3c 7a                	cmp    $0x7a,%al
 8049464:	7f 11                	jg     8049477 <strtol+0xf7>
			dig = *s - 'a' + 10;
 8049466:	8b 45 08             	mov    0x8(%ebp),%eax
 8049469:	0f b6 00             	movzbl (%eax),%eax
 804946c:	0f be c0             	movsbl %al,%eax
 804946f:	83 e8 57             	sub    $0x57,%eax
 8049472:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049475:	eb 23                	jmp    804949a <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 8049477:	8b 45 08             	mov    0x8(%ebp),%eax
 804947a:	0f b6 00             	movzbl (%eax),%eax
 804947d:	3c 40                	cmp    $0x40,%al
 804947f:	7e 3d                	jle    80494be <strtol+0x13e>
 8049481:	8b 45 08             	mov    0x8(%ebp),%eax
 8049484:	0f b6 00             	movzbl (%eax),%eax
 8049487:	3c 5a                	cmp    $0x5a,%al
 8049489:	7f 33                	jg     80494be <strtol+0x13e>
			dig = *s - 'A' + 10;
 804948b:	8b 45 08             	mov    0x8(%ebp),%eax
 804948e:	0f b6 00             	movzbl (%eax),%eax
 8049491:	0f be c0             	movsbl %al,%eax
 8049494:	83 e8 37             	sub    $0x37,%eax
 8049497:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 804949a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804949d:	3b 45 10             	cmp    0x10(%ebp),%eax
 80494a0:	7c 02                	jl     80494a4 <strtol+0x124>
			break;
 80494a2:	eb 1a                	jmp    80494be <strtol+0x13e>
		s++, val = (val * base) + dig;
 80494a4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80494a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80494ab:	0f af 45 10          	imul   0x10(%ebp),%eax
 80494af:	89 c2                	mov    %eax,%edx
 80494b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80494b4:	01 d0                	add    %edx,%eax
 80494b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 80494b9:	e9 6f ff ff ff       	jmp    804942d <strtol+0xad>

	if (endptr)
 80494be:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80494c2:	74 08                	je     80494cc <strtol+0x14c>
		*endptr = (char *) s;
 80494c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494c7:	8b 55 08             	mov    0x8(%ebp),%edx
 80494ca:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 80494cc:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 80494d0:	74 07                	je     80494d9 <strtol+0x159>
 80494d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80494d5:	f7 d8                	neg    %eax
 80494d7:	eb 03                	jmp    80494dc <strtol+0x15c>
 80494d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80494dc:	c9                   	leave  
 80494dd:	c3                   	ret    

080494de <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 80494de:	55                   	push   %ebp
 80494df:	89 e5                	mov    %esp,%ebp
 80494e1:	53                   	push   %ebx
 80494e2:	83 ec 34             	sub    $0x34,%esp
 80494e5:	8b 45 10             	mov    0x10(%ebp),%eax
 80494e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80494eb:	8b 45 14             	mov    0x14(%ebp),%eax
 80494ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 80494f1:	8b 45 18             	mov    0x18(%ebp),%eax
 80494f4:	ba 00 00 00 00       	mov    $0x0,%edx
 80494f9:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80494fc:	77 72                	ja     8049570 <printnum+0x92>
 80494fe:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 8049501:	72 05                	jb     8049508 <printnum+0x2a>
 8049503:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049506:	77 68                	ja     8049570 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 8049508:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804950b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 804950e:	8b 45 18             	mov    0x18(%ebp),%eax
 8049511:	ba 00 00 00 00       	mov    $0x0,%edx
 8049516:	89 44 24 08          	mov    %eax,0x8(%esp)
 804951a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804951e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049521:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049524:	89 04 24             	mov    %eax,(%esp)
 8049527:	89 54 24 04          	mov    %edx,0x4(%esp)
 804952b:	e8 50 06 00 00       	call   8049b80 <__udivdi3>
 8049530:	8b 4d 20             	mov    0x20(%ebp),%ecx
 8049533:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 8049537:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 804953b:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804953e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049542:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049546:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804954a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804954d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049551:	8b 45 08             	mov    0x8(%ebp),%eax
 8049554:	89 04 24             	mov    %eax,(%esp)
 8049557:	e8 82 ff ff ff       	call   80494de <printnum>
 804955c:	eb 1c                	jmp    804957a <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 804955e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049561:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049565:	8b 45 20             	mov    0x20(%ebp),%eax
 8049568:	89 04 24             	mov    %eax,(%esp)
 804956b:	8b 45 08             	mov    0x8(%ebp),%eax
 804956e:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 8049570:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 8049574:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 8049578:	7f e4                	jg     804955e <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 804957a:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804957d:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049582:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049585:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049588:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804958c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049590:	89 04 24             	mov    %eax,(%esp)
 8049593:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049597:	e8 14 07 00 00       	call   8049cb0 <__umoddi3>
 804959c:	05 38 a0 04 08       	add    $0x804a038,%eax
 80495a1:	0f b6 00             	movzbl (%eax),%eax
 80495a4:	0f be c0             	movsbl %al,%eax
 80495a7:	8b 55 0c             	mov    0xc(%ebp),%edx
 80495aa:	89 54 24 04          	mov    %edx,0x4(%esp)
 80495ae:	89 04 24             	mov    %eax,(%esp)
 80495b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80495b4:	ff d0                	call   *%eax
}
 80495b6:	83 c4 34             	add    $0x34,%esp
 80495b9:	5b                   	pop    %ebx
 80495ba:	5d                   	pop    %ebp
 80495bb:	c3                   	ret    

080495bc <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 80495bc:	55                   	push   %ebp
 80495bd:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 80495bf:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 80495c3:	7e 14                	jle    80495d9 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 80495c5:	8b 45 08             	mov    0x8(%ebp),%eax
 80495c8:	8b 00                	mov    (%eax),%eax
 80495ca:	8d 48 08             	lea    0x8(%eax),%ecx
 80495cd:	8b 55 08             	mov    0x8(%ebp),%edx
 80495d0:	89 0a                	mov    %ecx,(%edx)
 80495d2:	8b 50 04             	mov    0x4(%eax),%edx
 80495d5:	8b 00                	mov    (%eax),%eax
 80495d7:	eb 30                	jmp    8049609 <getuint+0x4d>
	else if (lflag)
 80495d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80495dd:	74 16                	je     80495f5 <getuint+0x39>
		return va_arg(*ap, unsigned long);
 80495df:	8b 45 08             	mov    0x8(%ebp),%eax
 80495e2:	8b 00                	mov    (%eax),%eax
 80495e4:	8d 48 04             	lea    0x4(%eax),%ecx
 80495e7:	8b 55 08             	mov    0x8(%ebp),%edx
 80495ea:	89 0a                	mov    %ecx,(%edx)
 80495ec:	8b 00                	mov    (%eax),%eax
 80495ee:	ba 00 00 00 00       	mov    $0x0,%edx
 80495f3:	eb 14                	jmp    8049609 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 80495f5:	8b 45 08             	mov    0x8(%ebp),%eax
 80495f8:	8b 00                	mov    (%eax),%eax
 80495fa:	8d 48 04             	lea    0x4(%eax),%ecx
 80495fd:	8b 55 08             	mov    0x8(%ebp),%edx
 8049600:	89 0a                	mov    %ecx,(%edx)
 8049602:	8b 00                	mov    (%eax),%eax
 8049604:	ba 00 00 00 00       	mov    $0x0,%edx
}
 8049609:	5d                   	pop    %ebp
 804960a:	c3                   	ret    

0804960b <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 804960b:	55                   	push   %ebp
 804960c:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 804960e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 8049612:	7e 14                	jle    8049628 <getint+0x1d>
		return va_arg(*ap, long long);
 8049614:	8b 45 08             	mov    0x8(%ebp),%eax
 8049617:	8b 00                	mov    (%eax),%eax
 8049619:	8d 48 08             	lea    0x8(%eax),%ecx
 804961c:	8b 55 08             	mov    0x8(%ebp),%edx
 804961f:	89 0a                	mov    %ecx,(%edx)
 8049621:	8b 50 04             	mov    0x4(%eax),%edx
 8049624:	8b 00                	mov    (%eax),%eax
 8049626:	eb 28                	jmp    8049650 <getint+0x45>
	else if (lflag)
 8049628:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804962c:	74 12                	je     8049640 <getint+0x35>
		return va_arg(*ap, long);
 804962e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049631:	8b 00                	mov    (%eax),%eax
 8049633:	8d 48 04             	lea    0x4(%eax),%ecx
 8049636:	8b 55 08             	mov    0x8(%ebp),%edx
 8049639:	89 0a                	mov    %ecx,(%edx)
 804963b:	8b 00                	mov    (%eax),%eax
 804963d:	99                   	cltd   
 804963e:	eb 10                	jmp    8049650 <getint+0x45>
	else
		return va_arg(*ap, int);
 8049640:	8b 45 08             	mov    0x8(%ebp),%eax
 8049643:	8b 00                	mov    (%eax),%eax
 8049645:	8d 48 04             	lea    0x4(%eax),%ecx
 8049648:	8b 55 08             	mov    0x8(%ebp),%edx
 804964b:	89 0a                	mov    %ecx,(%edx)
 804964d:	8b 00                	mov    (%eax),%eax
 804964f:	99                   	cltd   
}
 8049650:	5d                   	pop    %ebp
 8049651:	c3                   	ret    

08049652 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 8049652:	55                   	push   %ebp
 8049653:	89 e5                	mov    %esp,%ebp
 8049655:	56                   	push   %esi
 8049656:	53                   	push   %ebx
 8049657:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 804965a:	eb 18                	jmp    8049674 <vprintfmt+0x22>
			if (ch == '\0')
 804965c:	85 db                	test   %ebx,%ebx
 804965e:	75 05                	jne    8049665 <vprintfmt+0x13>
				return;
 8049660:	e9 e9 03 00 00       	jmp    8049a4e <vprintfmt+0x3fc>
			putch(ch, putdat);
 8049665:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049668:	89 44 24 04          	mov    %eax,0x4(%esp)
 804966c:	89 1c 24             	mov    %ebx,(%esp)
 804966f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049672:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049674:	8b 45 10             	mov    0x10(%ebp),%eax
 8049677:	8d 50 01             	lea    0x1(%eax),%edx
 804967a:	89 55 10             	mov    %edx,0x10(%ebp)
 804967d:	0f b6 00             	movzbl (%eax),%eax
 8049680:	0f b6 d8             	movzbl %al,%ebx
 8049683:	83 fb 25             	cmp    $0x25,%ebx
 8049686:	75 d4                	jne    804965c <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 8049688:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 804968c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 8049693:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 804969a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 80496a1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 80496a8:	8b 45 10             	mov    0x10(%ebp),%eax
 80496ab:	8d 50 01             	lea    0x1(%eax),%edx
 80496ae:	89 55 10             	mov    %edx,0x10(%ebp)
 80496b1:	0f b6 00             	movzbl (%eax),%eax
 80496b4:	0f b6 d8             	movzbl %al,%ebx
 80496b7:	8d 43 dd             	lea    -0x23(%ebx),%eax
 80496ba:	83 f8 55             	cmp    $0x55,%eax
 80496bd:	0f 87 5a 03 00 00    	ja     8049a1d <vprintfmt+0x3cb>
 80496c3:	8b 04 85 5c a0 04 08 	mov    0x804a05c(,%eax,4),%eax
 80496ca:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 80496cc:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 80496d0:	eb d6                	jmp    80496a8 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 80496d2:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 80496d6:	eb d0                	jmp    80496a8 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 80496d8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 80496df:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80496e2:	89 d0                	mov    %edx,%eax
 80496e4:	c1 e0 02             	shl    $0x2,%eax
 80496e7:	01 d0                	add    %edx,%eax
 80496e9:	01 c0                	add    %eax,%eax
 80496eb:	01 d8                	add    %ebx,%eax
 80496ed:	83 e8 30             	sub    $0x30,%eax
 80496f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 80496f3:	8b 45 10             	mov    0x10(%ebp),%eax
 80496f6:	0f b6 00             	movzbl (%eax),%eax
 80496f9:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 80496fc:	83 fb 2f             	cmp    $0x2f,%ebx
 80496ff:	7e 0b                	jle    804970c <vprintfmt+0xba>
 8049701:	83 fb 39             	cmp    $0x39,%ebx
 8049704:	7f 06                	jg     804970c <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049706:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 804970a:	eb d3                	jmp    80496df <vprintfmt+0x8d>
			goto process_precision;
 804970c:	eb 33                	jmp    8049741 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 804970e:	8b 45 14             	mov    0x14(%ebp),%eax
 8049711:	8d 50 04             	lea    0x4(%eax),%edx
 8049714:	89 55 14             	mov    %edx,0x14(%ebp)
 8049717:	8b 00                	mov    (%eax),%eax
 8049719:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 804971c:	eb 23                	jmp    8049741 <vprintfmt+0xef>

		case '.':
			if (width < 0)
 804971e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049722:	79 0c                	jns    8049730 <vprintfmt+0xde>
				width = 0;
 8049724:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 804972b:	e9 78 ff ff ff       	jmp    80496a8 <vprintfmt+0x56>
 8049730:	e9 73 ff ff ff       	jmp    80496a8 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 8049735:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 804973c:	e9 67 ff ff ff       	jmp    80496a8 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 8049741:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049745:	79 12                	jns    8049759 <vprintfmt+0x107>
				width = precision, precision = -1;
 8049747:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804974a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804974d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 8049754:	e9 4f ff ff ff       	jmp    80496a8 <vprintfmt+0x56>
 8049759:	e9 4a ff ff ff       	jmp    80496a8 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 804975e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 8049762:	e9 41 ff ff ff       	jmp    80496a8 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 8049767:	8b 45 14             	mov    0x14(%ebp),%eax
 804976a:	8d 50 04             	lea    0x4(%eax),%edx
 804976d:	89 55 14             	mov    %edx,0x14(%ebp)
 8049770:	8b 00                	mov    (%eax),%eax
 8049772:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049775:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049779:	89 04 24             	mov    %eax,(%esp)
 804977c:	8b 45 08             	mov    0x8(%ebp),%eax
 804977f:	ff d0                	call   *%eax
			break;
 8049781:	e9 c2 02 00 00       	jmp    8049a48 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 8049786:	8b 45 14             	mov    0x14(%ebp),%eax
 8049789:	8d 50 04             	lea    0x4(%eax),%edx
 804978c:	89 55 14             	mov    %edx,0x14(%ebp)
 804978f:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 8049791:	85 db                	test   %ebx,%ebx
 8049793:	79 02                	jns    8049797 <vprintfmt+0x145>
				err = -err;
 8049795:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049797:	83 fb 06             	cmp    $0x6,%ebx
 804979a:	7f 0b                	jg     80497a7 <vprintfmt+0x155>
 804979c:	8b 34 9d 1c a0 04 08 	mov    0x804a01c(,%ebx,4),%esi
 80497a3:	85 f6                	test   %esi,%esi
 80497a5:	75 23                	jne    80497ca <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 80497a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 80497ab:	c7 44 24 08 49 a0 04 	movl   $0x804a049,0x8(%esp)
 80497b2:	08 
 80497b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80497b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80497ba:	8b 45 08             	mov    0x8(%ebp),%eax
 80497bd:	89 04 24             	mov    %eax,(%esp)
 80497c0:	e8 90 02 00 00       	call   8049a55 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 80497c5:	e9 7e 02 00 00       	jmp    8049a48 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 80497ca:	89 74 24 0c          	mov    %esi,0xc(%esp)
 80497ce:	c7 44 24 08 52 a0 04 	movl   $0x804a052,0x8(%esp)
 80497d5:	08 
 80497d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80497d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80497dd:	8b 45 08             	mov    0x8(%ebp),%eax
 80497e0:	89 04 24             	mov    %eax,(%esp)
 80497e3:	e8 6d 02 00 00       	call   8049a55 <printfmt>
			break;
 80497e8:	e9 5b 02 00 00       	jmp    8049a48 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 80497ed:	8b 45 14             	mov    0x14(%ebp),%eax
 80497f0:	8d 50 04             	lea    0x4(%eax),%edx
 80497f3:	89 55 14             	mov    %edx,0x14(%ebp)
 80497f6:	8b 30                	mov    (%eax),%esi
 80497f8:	85 f6                	test   %esi,%esi
 80497fa:	75 05                	jne    8049801 <vprintfmt+0x1af>
				p = "(null)";
 80497fc:	be 55 a0 04 08       	mov    $0x804a055,%esi
			if (width > 0 && padc != '-')
 8049801:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049805:	7e 37                	jle    804983e <vprintfmt+0x1ec>
 8049807:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 804980b:	74 31                	je     804983e <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 804980d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049810:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049814:	89 34 24             	mov    %esi,(%esp)
 8049817:	e8 9b f8 ff ff       	call   80490b7 <strnlen>
 804981c:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 804981f:	eb 17                	jmp    8049838 <vprintfmt+0x1e6>
					putch(padc, putdat);
 8049821:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 8049825:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049828:	89 54 24 04          	mov    %edx,0x4(%esp)
 804982c:	89 04 24             	mov    %eax,(%esp)
 804982f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049832:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 8049834:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049838:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804983c:	7f e3                	jg     8049821 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 804983e:	eb 38                	jmp    8049878 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 8049840:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049844:	74 1f                	je     8049865 <vprintfmt+0x213>
 8049846:	83 fb 1f             	cmp    $0x1f,%ebx
 8049849:	7e 05                	jle    8049850 <vprintfmt+0x1fe>
 804984b:	83 fb 7e             	cmp    $0x7e,%ebx
 804984e:	7e 15                	jle    8049865 <vprintfmt+0x213>
					putch('?', putdat);
 8049850:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049853:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049857:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 804985e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049861:	ff d0                	call   *%eax
 8049863:	eb 0f                	jmp    8049874 <vprintfmt+0x222>
				else
					putch(ch, putdat);
 8049865:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049868:	89 44 24 04          	mov    %eax,0x4(%esp)
 804986c:	89 1c 24             	mov    %ebx,(%esp)
 804986f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049872:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049874:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049878:	89 f0                	mov    %esi,%eax
 804987a:	8d 70 01             	lea    0x1(%eax),%esi
 804987d:	0f b6 00             	movzbl (%eax),%eax
 8049880:	0f be d8             	movsbl %al,%ebx
 8049883:	85 db                	test   %ebx,%ebx
 8049885:	74 10                	je     8049897 <vprintfmt+0x245>
 8049887:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 804988b:	78 b3                	js     8049840 <vprintfmt+0x1ee>
 804988d:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 8049891:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049895:	79 a9                	jns    8049840 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049897:	eb 17                	jmp    80498b0 <vprintfmt+0x25e>
				putch(' ', putdat);
 8049899:	8b 45 0c             	mov    0xc(%ebp),%eax
 804989c:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498a0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 80498a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80498aa:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 80498ac:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80498b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80498b4:	7f e3                	jg     8049899 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 80498b6:	e9 8d 01 00 00       	jmp    8049a48 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 80498bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80498be:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498c2:	8d 45 14             	lea    0x14(%ebp),%eax
 80498c5:	89 04 24             	mov    %eax,(%esp)
 80498c8:	e8 3e fd ff ff       	call   804960b <getint>
 80498cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80498d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 80498d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80498d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80498d9:	85 d2                	test   %edx,%edx
 80498db:	79 26                	jns    8049903 <vprintfmt+0x2b1>
				putch('-', putdat);
 80498dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498e4:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 80498eb:	8b 45 08             	mov    0x8(%ebp),%eax
 80498ee:	ff d0                	call   *%eax
				num = -(long long) num;
 80498f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80498f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80498f6:	f7 d8                	neg    %eax
 80498f8:	83 d2 00             	adc    $0x0,%edx
 80498fb:	f7 da                	neg    %edx
 80498fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049900:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049903:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 804990a:	e9 c5 00 00 00       	jmp    80499d4 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 804990f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049912:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049916:	8d 45 14             	lea    0x14(%ebp),%eax
 8049919:	89 04 24             	mov    %eax,(%esp)
 804991c:	e8 9b fc ff ff       	call   80495bc <getuint>
 8049921:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049924:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049927:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 804992e:	e9 a1 00 00 00       	jmp    80499d4 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 8049933:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049936:	89 44 24 04          	mov    %eax,0x4(%esp)
 804993a:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049941:	8b 45 08             	mov    0x8(%ebp),%eax
 8049944:	ff d0                	call   *%eax
			putch('X', putdat);
 8049946:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049949:	89 44 24 04          	mov    %eax,0x4(%esp)
 804994d:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049954:	8b 45 08             	mov    0x8(%ebp),%eax
 8049957:	ff d0                	call   *%eax
			putch('X', putdat);
 8049959:	8b 45 0c             	mov    0xc(%ebp),%eax
 804995c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049960:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049967:	8b 45 08             	mov    0x8(%ebp),%eax
 804996a:	ff d0                	call   *%eax
			break;
 804996c:	e9 d7 00 00 00       	jmp    8049a48 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 8049971:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049974:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049978:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 804997f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049982:	ff d0                	call   *%eax
			putch('x', putdat);
 8049984:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049987:	89 44 24 04          	mov    %eax,0x4(%esp)
 804998b:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049992:	8b 45 08             	mov    0x8(%ebp),%eax
 8049995:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049997:	8b 45 14             	mov    0x14(%ebp),%eax
 804999a:	8d 50 04             	lea    0x4(%eax),%edx
 804999d:	89 55 14             	mov    %edx,0x14(%ebp)
 80499a0:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 80499a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80499a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 80499ac:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 80499b3:	eb 1f                	jmp    80499d4 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 80499b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80499b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499bc:	8d 45 14             	lea    0x14(%ebp),%eax
 80499bf:	89 04 24             	mov    %eax,(%esp)
 80499c2:	e8 f5 fb ff ff       	call   80495bc <getuint>
 80499c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80499ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 80499cd:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 80499d4:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 80499d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80499db:	89 54 24 18          	mov    %edx,0x18(%esp)
 80499df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 80499e2:	89 54 24 14          	mov    %edx,0x14(%esp)
 80499e6:	89 44 24 10          	mov    %eax,0x10(%esp)
 80499ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80499ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80499f0:	89 44 24 08          	mov    %eax,0x8(%esp)
 80499f4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80499f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499ff:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a02:	89 04 24             	mov    %eax,(%esp)
 8049a05:	e8 d4 fa ff ff       	call   80494de <printnum>
			break;
 8049a0a:	eb 3c                	jmp    8049a48 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a13:	89 1c 24             	mov    %ebx,(%esp)
 8049a16:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a19:	ff d0                	call   *%eax
			break;
 8049a1b:	eb 2b                	jmp    8049a48 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049a1d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a20:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a24:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049a2b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a2e:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049a30:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049a34:	eb 04                	jmp    8049a3a <vprintfmt+0x3e8>
 8049a36:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049a3a:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a3d:	83 e8 01             	sub    $0x1,%eax
 8049a40:	0f b6 00             	movzbl (%eax),%eax
 8049a43:	3c 25                	cmp    $0x25,%al
 8049a45:	75 ef                	jne    8049a36 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049a47:	90                   	nop
		}
	}
 8049a48:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049a49:	e9 26 fc ff ff       	jmp    8049674 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049a4e:	83 c4 40             	add    $0x40,%esp
 8049a51:	5b                   	pop    %ebx
 8049a52:	5e                   	pop    %esi
 8049a53:	5d                   	pop    %ebp
 8049a54:	c3                   	ret    

08049a55 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049a55:	55                   	push   %ebp
 8049a56:	89 e5                	mov    %esp,%ebp
 8049a58:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049a5b:	8d 45 14             	lea    0x14(%ebp),%eax
 8049a5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a64:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049a68:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a6b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049a6f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a72:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a76:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a79:	89 04 24             	mov    %eax,(%esp)
 8049a7c:	e8 d1 fb ff ff       	call   8049652 <vprintfmt>
	va_end(ap);
}
 8049a81:	c9                   	leave  
 8049a82:	c3                   	ret    

08049a83 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049a83:	55                   	push   %ebp
 8049a84:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049a86:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a89:	8b 40 08             	mov    0x8(%eax),%eax
 8049a8c:	8d 50 01             	lea    0x1(%eax),%edx
 8049a8f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a92:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049a95:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a98:	8b 10                	mov    (%eax),%edx
 8049a9a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a9d:	8b 40 04             	mov    0x4(%eax),%eax
 8049aa0:	39 c2                	cmp    %eax,%edx
 8049aa2:	73 12                	jae    8049ab6 <sprintputch+0x33>
		*b->buf++ = ch;
 8049aa4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049aa7:	8b 00                	mov    (%eax),%eax
 8049aa9:	8d 48 01             	lea    0x1(%eax),%ecx
 8049aac:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049aaf:	89 0a                	mov    %ecx,(%edx)
 8049ab1:	8b 55 08             	mov    0x8(%ebp),%edx
 8049ab4:	88 10                	mov    %dl,(%eax)
}
 8049ab6:	5d                   	pop    %ebp
 8049ab7:	c3                   	ret    

08049ab8 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049ab8:	55                   	push   %ebp
 8049ab9:	89 e5                	mov    %esp,%ebp
 8049abb:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049abe:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ac1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049ac4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ac7:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049aca:	8b 45 08             	mov    0x8(%ebp),%eax
 8049acd:	01 d0                	add    %edx,%eax
 8049acf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049ad2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049ad9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049add:	74 06                	je     8049ae5 <vsnprintf+0x2d>
 8049adf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049ae3:	7f 07                	jg     8049aec <vsnprintf+0x34>
		return -E_INVAL;
 8049ae5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049aea:	eb 2a                	jmp    8049b16 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049aec:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aef:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049af3:	8b 45 10             	mov    0x10(%ebp),%eax
 8049af6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049afa:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049afd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b01:	c7 04 24 83 9a 04 08 	movl   $0x8049a83,(%esp)
 8049b08:	e8 45 fb ff ff       	call   8049652 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049b0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b10:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049b16:	c9                   	leave  
 8049b17:	c3                   	ret    

08049b18 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049b18:	55                   	push   %ebp
 8049b19:	89 e5                	mov    %esp,%ebp
 8049b1b:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049b1e:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b21:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b27:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b2b:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b2e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b32:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b35:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b39:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b3c:	89 04 24             	mov    %eax,(%esp)
 8049b3f:	e8 74 ff ff ff       	call   8049ab8 <vsnprintf>
 8049b44:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049b4a:	c9                   	leave  
 8049b4b:	c3                   	ret    

08049b4c <srand>:
static int seed = 0;

void
srand(int s) {
 8049b4c:	55                   	push   %ebp
 8049b4d:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049b4f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b52:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049b57:	5d                   	pop    %ebp
 8049b58:	c3                   	ret    

08049b59 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049b59:	55                   	push   %ebp
 8049b5a:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049b5c:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049b61:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049b67:	83 c0 01             	add    $0x1,%eax
 8049b6a:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049b6f:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049b74:	c1 f8 10             	sar    $0x10,%eax
 8049b77:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049b7c:	5d                   	pop    %ebp
 8049b7d:	c3                   	ret    
 8049b7e:	66 90                	xchg   %ax,%ax

08049b80 <__udivdi3>:
 8049b80:	55                   	push   %ebp
 8049b81:	57                   	push   %edi
 8049b82:	56                   	push   %esi
 8049b83:	83 ec 0c             	sub    $0xc,%esp
 8049b86:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049b8a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049b8e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049b92:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049b96:	85 c0                	test   %eax,%eax
 8049b98:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049b9c:	89 ea                	mov    %ebp,%edx
 8049b9e:	89 0c 24             	mov    %ecx,(%esp)
 8049ba1:	75 2d                	jne    8049bd0 <__udivdi3+0x50>
 8049ba3:	39 e9                	cmp    %ebp,%ecx
 8049ba5:	77 61                	ja     8049c08 <__udivdi3+0x88>
 8049ba7:	85 c9                	test   %ecx,%ecx
 8049ba9:	89 ce                	mov    %ecx,%esi
 8049bab:	75 0b                	jne    8049bb8 <__udivdi3+0x38>
 8049bad:	b8 01 00 00 00       	mov    $0x1,%eax
 8049bb2:	31 d2                	xor    %edx,%edx
 8049bb4:	f7 f1                	div    %ecx
 8049bb6:	89 c6                	mov    %eax,%esi
 8049bb8:	31 d2                	xor    %edx,%edx
 8049bba:	89 e8                	mov    %ebp,%eax
 8049bbc:	f7 f6                	div    %esi
 8049bbe:	89 c5                	mov    %eax,%ebp
 8049bc0:	89 f8                	mov    %edi,%eax
 8049bc2:	f7 f6                	div    %esi
 8049bc4:	89 ea                	mov    %ebp,%edx
 8049bc6:	83 c4 0c             	add    $0xc,%esp
 8049bc9:	5e                   	pop    %esi
 8049bca:	5f                   	pop    %edi
 8049bcb:	5d                   	pop    %ebp
 8049bcc:	c3                   	ret    
 8049bcd:	8d 76 00             	lea    0x0(%esi),%esi
 8049bd0:	39 e8                	cmp    %ebp,%eax
 8049bd2:	77 24                	ja     8049bf8 <__udivdi3+0x78>
 8049bd4:	0f bd e8             	bsr    %eax,%ebp
 8049bd7:	83 f5 1f             	xor    $0x1f,%ebp
 8049bda:	75 3c                	jne    8049c18 <__udivdi3+0x98>
 8049bdc:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049be0:	39 34 24             	cmp    %esi,(%esp)
 8049be3:	0f 86 9f 00 00 00    	jbe    8049c88 <__udivdi3+0x108>
 8049be9:	39 d0                	cmp    %edx,%eax
 8049beb:	0f 82 97 00 00 00    	jb     8049c88 <__udivdi3+0x108>
 8049bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049bf8:	31 d2                	xor    %edx,%edx
 8049bfa:	31 c0                	xor    %eax,%eax
 8049bfc:	83 c4 0c             	add    $0xc,%esp
 8049bff:	5e                   	pop    %esi
 8049c00:	5f                   	pop    %edi
 8049c01:	5d                   	pop    %ebp
 8049c02:	c3                   	ret    
 8049c03:	90                   	nop
 8049c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049c08:	89 f8                	mov    %edi,%eax
 8049c0a:	f7 f1                	div    %ecx
 8049c0c:	31 d2                	xor    %edx,%edx
 8049c0e:	83 c4 0c             	add    $0xc,%esp
 8049c11:	5e                   	pop    %esi
 8049c12:	5f                   	pop    %edi
 8049c13:	5d                   	pop    %ebp
 8049c14:	c3                   	ret    
 8049c15:	8d 76 00             	lea    0x0(%esi),%esi
 8049c18:	89 e9                	mov    %ebp,%ecx
 8049c1a:	8b 3c 24             	mov    (%esp),%edi
 8049c1d:	d3 e0                	shl    %cl,%eax
 8049c1f:	89 c6                	mov    %eax,%esi
 8049c21:	b8 20 00 00 00       	mov    $0x20,%eax
 8049c26:	29 e8                	sub    %ebp,%eax
 8049c28:	89 c1                	mov    %eax,%ecx
 8049c2a:	d3 ef                	shr    %cl,%edi
 8049c2c:	89 e9                	mov    %ebp,%ecx
 8049c2e:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049c32:	8b 3c 24             	mov    (%esp),%edi
 8049c35:	09 74 24 08          	or     %esi,0x8(%esp)
 8049c39:	89 d6                	mov    %edx,%esi
 8049c3b:	d3 e7                	shl    %cl,%edi
 8049c3d:	89 c1                	mov    %eax,%ecx
 8049c3f:	89 3c 24             	mov    %edi,(%esp)
 8049c42:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049c46:	d3 ee                	shr    %cl,%esi
 8049c48:	89 e9                	mov    %ebp,%ecx
 8049c4a:	d3 e2                	shl    %cl,%edx
 8049c4c:	89 c1                	mov    %eax,%ecx
 8049c4e:	d3 ef                	shr    %cl,%edi
 8049c50:	09 d7                	or     %edx,%edi
 8049c52:	89 f2                	mov    %esi,%edx
 8049c54:	89 f8                	mov    %edi,%eax
 8049c56:	f7 74 24 08          	divl   0x8(%esp)
 8049c5a:	89 d6                	mov    %edx,%esi
 8049c5c:	89 c7                	mov    %eax,%edi
 8049c5e:	f7 24 24             	mull   (%esp)
 8049c61:	39 d6                	cmp    %edx,%esi
 8049c63:	89 14 24             	mov    %edx,(%esp)
 8049c66:	72 30                	jb     8049c98 <__udivdi3+0x118>
 8049c68:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049c6c:	89 e9                	mov    %ebp,%ecx
 8049c6e:	d3 e2                	shl    %cl,%edx
 8049c70:	39 c2                	cmp    %eax,%edx
 8049c72:	73 05                	jae    8049c79 <__udivdi3+0xf9>
 8049c74:	3b 34 24             	cmp    (%esp),%esi
 8049c77:	74 1f                	je     8049c98 <__udivdi3+0x118>
 8049c79:	89 f8                	mov    %edi,%eax
 8049c7b:	31 d2                	xor    %edx,%edx
 8049c7d:	e9 7a ff ff ff       	jmp    8049bfc <__udivdi3+0x7c>
 8049c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049c88:	31 d2                	xor    %edx,%edx
 8049c8a:	b8 01 00 00 00       	mov    $0x1,%eax
 8049c8f:	e9 68 ff ff ff       	jmp    8049bfc <__udivdi3+0x7c>
 8049c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049c98:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049c9b:	31 d2                	xor    %edx,%edx
 8049c9d:	83 c4 0c             	add    $0xc,%esp
 8049ca0:	5e                   	pop    %esi
 8049ca1:	5f                   	pop    %edi
 8049ca2:	5d                   	pop    %ebp
 8049ca3:	c3                   	ret    
 8049ca4:	66 90                	xchg   %ax,%ax
 8049ca6:	66 90                	xchg   %ax,%ax
 8049ca8:	66 90                	xchg   %ax,%ax
 8049caa:	66 90                	xchg   %ax,%ax
 8049cac:	66 90                	xchg   %ax,%ax
 8049cae:	66 90                	xchg   %ax,%ax

08049cb0 <__umoddi3>:
 8049cb0:	55                   	push   %ebp
 8049cb1:	57                   	push   %edi
 8049cb2:	56                   	push   %esi
 8049cb3:	83 ec 14             	sub    $0x14,%esp
 8049cb6:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049cba:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049cbe:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049cc2:	89 c7                	mov    %eax,%edi
 8049cc4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cc8:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049ccc:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049cd0:	89 34 24             	mov    %esi,(%esp)
 8049cd3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049cd7:	85 c0                	test   %eax,%eax
 8049cd9:	89 c2                	mov    %eax,%edx
 8049cdb:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049cdf:	75 17                	jne    8049cf8 <__umoddi3+0x48>
 8049ce1:	39 fe                	cmp    %edi,%esi
 8049ce3:	76 4b                	jbe    8049d30 <__umoddi3+0x80>
 8049ce5:	89 c8                	mov    %ecx,%eax
 8049ce7:	89 fa                	mov    %edi,%edx
 8049ce9:	f7 f6                	div    %esi
 8049ceb:	89 d0                	mov    %edx,%eax
 8049ced:	31 d2                	xor    %edx,%edx
 8049cef:	83 c4 14             	add    $0x14,%esp
 8049cf2:	5e                   	pop    %esi
 8049cf3:	5f                   	pop    %edi
 8049cf4:	5d                   	pop    %ebp
 8049cf5:	c3                   	ret    
 8049cf6:	66 90                	xchg   %ax,%ax
 8049cf8:	39 f8                	cmp    %edi,%eax
 8049cfa:	77 54                	ja     8049d50 <__umoddi3+0xa0>
 8049cfc:	0f bd e8             	bsr    %eax,%ebp
 8049cff:	83 f5 1f             	xor    $0x1f,%ebp
 8049d02:	75 5c                	jne    8049d60 <__umoddi3+0xb0>
 8049d04:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049d08:	39 3c 24             	cmp    %edi,(%esp)
 8049d0b:	0f 87 e7 00 00 00    	ja     8049df8 <__umoddi3+0x148>
 8049d11:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049d15:	29 f1                	sub    %esi,%ecx
 8049d17:	19 c7                	sbb    %eax,%edi
 8049d19:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049d1d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049d21:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049d25:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049d29:	83 c4 14             	add    $0x14,%esp
 8049d2c:	5e                   	pop    %esi
 8049d2d:	5f                   	pop    %edi
 8049d2e:	5d                   	pop    %ebp
 8049d2f:	c3                   	ret    
 8049d30:	85 f6                	test   %esi,%esi
 8049d32:	89 f5                	mov    %esi,%ebp
 8049d34:	75 0b                	jne    8049d41 <__umoddi3+0x91>
 8049d36:	b8 01 00 00 00       	mov    $0x1,%eax
 8049d3b:	31 d2                	xor    %edx,%edx
 8049d3d:	f7 f6                	div    %esi
 8049d3f:	89 c5                	mov    %eax,%ebp
 8049d41:	8b 44 24 04          	mov    0x4(%esp),%eax
 8049d45:	31 d2                	xor    %edx,%edx
 8049d47:	f7 f5                	div    %ebp
 8049d49:	89 c8                	mov    %ecx,%eax
 8049d4b:	f7 f5                	div    %ebp
 8049d4d:	eb 9c                	jmp    8049ceb <__umoddi3+0x3b>
 8049d4f:	90                   	nop
 8049d50:	89 c8                	mov    %ecx,%eax
 8049d52:	89 fa                	mov    %edi,%edx
 8049d54:	83 c4 14             	add    $0x14,%esp
 8049d57:	5e                   	pop    %esi
 8049d58:	5f                   	pop    %edi
 8049d59:	5d                   	pop    %ebp
 8049d5a:	c3                   	ret    
 8049d5b:	90                   	nop
 8049d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049d60:	8b 04 24             	mov    (%esp),%eax
 8049d63:	be 20 00 00 00       	mov    $0x20,%esi
 8049d68:	89 e9                	mov    %ebp,%ecx
 8049d6a:	29 ee                	sub    %ebp,%esi
 8049d6c:	d3 e2                	shl    %cl,%edx
 8049d6e:	89 f1                	mov    %esi,%ecx
 8049d70:	d3 e8                	shr    %cl,%eax
 8049d72:	89 e9                	mov    %ebp,%ecx
 8049d74:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d78:	8b 04 24             	mov    (%esp),%eax
 8049d7b:	09 54 24 04          	or     %edx,0x4(%esp)
 8049d7f:	89 fa                	mov    %edi,%edx
 8049d81:	d3 e0                	shl    %cl,%eax
 8049d83:	89 f1                	mov    %esi,%ecx
 8049d85:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049d89:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049d8d:	d3 ea                	shr    %cl,%edx
 8049d8f:	89 e9                	mov    %ebp,%ecx
 8049d91:	d3 e7                	shl    %cl,%edi
 8049d93:	89 f1                	mov    %esi,%ecx
 8049d95:	d3 e8                	shr    %cl,%eax
 8049d97:	89 e9                	mov    %ebp,%ecx
 8049d99:	09 f8                	or     %edi,%eax
 8049d9b:	8b 7c 24 10          	mov    0x10(%esp),%edi
 8049d9f:	f7 74 24 04          	divl   0x4(%esp)
 8049da3:	d3 e7                	shl    %cl,%edi
 8049da5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049da9:	89 d7                	mov    %edx,%edi
 8049dab:	f7 64 24 08          	mull   0x8(%esp)
 8049daf:	39 d7                	cmp    %edx,%edi
 8049db1:	89 c1                	mov    %eax,%ecx
 8049db3:	89 14 24             	mov    %edx,(%esp)
 8049db6:	72 2c                	jb     8049de4 <__umoddi3+0x134>
 8049db8:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 8049dbc:	72 22                	jb     8049de0 <__umoddi3+0x130>
 8049dbe:	8b 44 24 0c          	mov    0xc(%esp),%eax
 8049dc2:	29 c8                	sub    %ecx,%eax
 8049dc4:	19 d7                	sbb    %edx,%edi
 8049dc6:	89 e9                	mov    %ebp,%ecx
 8049dc8:	89 fa                	mov    %edi,%edx
 8049dca:	d3 e8                	shr    %cl,%eax
 8049dcc:	89 f1                	mov    %esi,%ecx
 8049dce:	d3 e2                	shl    %cl,%edx
 8049dd0:	89 e9                	mov    %ebp,%ecx
 8049dd2:	d3 ef                	shr    %cl,%edi
 8049dd4:	09 d0                	or     %edx,%eax
 8049dd6:	89 fa                	mov    %edi,%edx
 8049dd8:	83 c4 14             	add    $0x14,%esp
 8049ddb:	5e                   	pop    %esi
 8049ddc:	5f                   	pop    %edi
 8049ddd:	5d                   	pop    %ebp
 8049dde:	c3                   	ret    
 8049ddf:	90                   	nop
 8049de0:	39 d7                	cmp    %edx,%edi
 8049de2:	75 da                	jne    8049dbe <__umoddi3+0x10e>
 8049de4:	8b 14 24             	mov    (%esp),%edx
 8049de7:	89 c1                	mov    %eax,%ecx
 8049de9:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 8049ded:	1b 54 24 04          	sbb    0x4(%esp),%edx
 8049df1:	eb cb                	jmp    8049dbe <__umoddi3+0x10e>
 8049df3:	90                   	nop
 8049df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049df8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 8049dfc:	0f 82 0f ff ff ff    	jb     8049d11 <__umoddi3+0x61>
 8049e02:	e9 1a ff ff ff       	jmp    8049d21 <__umoddi3+0x71>
