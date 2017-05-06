
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

	printf("game start!\n");
 8048006:	c7 04 24 78 9e 04 08 	movl   $0x8049e78,(%esp)
 804800d:	e8 e1 0f 00 00       	call   8048ff3 <printf>
	//init_keyboard();
	//main_loop();
	if(fork()==0){
 8048012:	e8 f8 0e 00 00       	call   8048f0f <fork>
 8048017:	85 c0                	test   %eax,%eax
 8048019:	75 1a                	jne    8048035 <game_init+0x35>
		while(1){
			printf("ping.\n");
 804801b:	c7 04 24 85 9e 04 08 	movl   $0x8049e85,(%esp)
 8048022:	e8 cc 0f 00 00       	call   8048ff3 <printf>
			sleep(1);
 8048027:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804802e:	e8 1f 0f 00 00       	call   8048f52 <sleep>
		}
 8048033:	eb e6                	jmp    804801b <game_init+0x1b>
	}
	else{
		while(1){
			printf("pong.\n");
 8048035:	c7 04 24 8c 9e 04 08 	movl   $0x8049e8c,(%esp)
 804803c:	e8 b2 0f 00 00       	call   8048ff3 <printf>
			sleep(2);
 8048041:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048048:	e8 05 0f 00 00       	call   8048f52 <sleep>
		}
 804804d:	eb e6                	jmp    8048035 <game_init+0x35>

0804804f <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 804804f:	55                   	push   %ebp
 8048050:	89 e5                	mov    %esp,%ebp
 8048052:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 8048055:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804805c:	eb 12                	jmp    8048070 <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 804805e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048061:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 8048068:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 804806c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048070:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048074:	7e e8                	jle    804805e <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 8048076:	c9                   	leave  
 8048077:	c3                   	ret    

08048078 <press_key>:

void press_key(int scan_code) {
 8048078:	55                   	push   %ebp
 8048079:	89 e5                	mov    %esp,%ebp
 804807b:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 804807e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048085:	eb 21                	jmp    80480a8 <press_key+0x30>
		if (key_code[i] == scan_code) {
 8048087:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804808a:	8b 04 85 00 b0 04 08 	mov    0x804b000(,%eax,4),%eax
 8048091:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048094:	75 0e                	jne    80480a4 <press_key+0x2c>
			key_pressed[i] = TRUE;
 8048096:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048099:	c7 04 85 20 b4 04 08 	movl   $0x1,0x804b420(,%eax,4)
 80480a0:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 80480a4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80480a8:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 80480ac:	7e d9                	jle    8048087 <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 80480ae:	c9                   	leave  
 80480af:	c3                   	ret    

080480b0 <release_key>:

void release_key(int index) {
 80480b0:	55                   	push   %ebp
 80480b1:	89 e5                	mov    %esp,%ebp
 80480b3:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480b6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80480ba:	78 06                	js     80480c2 <release_key+0x12>
 80480bc:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80480c0:	7e 24                	jle    80480e6 <release_key+0x36>
 80480c2:	c7 44 24 0c 93 9e 04 	movl   $0x8049e93,0xc(%esp)
 80480c9:	08 
 80480ca:	c7 44 24 08 ab 9e 04 	movl   $0x8049eab,0x8(%esp)
 80480d1:	08 
 80480d2:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80480d9:	00 
 80480da:	c7 04 24 c0 9e 04 08 	movl   $0x8049ec0,(%esp)
 80480e1:	e8 93 00 00 00       	call   8048179 <_panic>
	key_pressed[index] = FALSE;
 80480e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80480e9:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 80480f0:	00 00 00 00 
}
 80480f4:	c9                   	leave  
 80480f5:	c3                   	ret    

080480f6 <query_key>:

bool query_key(int index) {
 80480f6:	55                   	push   %ebp
 80480f7:	89 e5                	mov    %esp,%ebp
 80480f9:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480fc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048100:	78 06                	js     8048108 <query_key+0x12>
 8048102:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 8048106:	7e 24                	jle    804812c <query_key+0x36>
 8048108:	c7 44 24 0c 93 9e 04 	movl   $0x8049e93,0xc(%esp)
 804810f:	08 
 8048110:	c7 44 24 08 ab 9e 04 	movl   $0x8049eab,0x8(%esp)
 8048117:	08 
 8048118:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 804811f:	00 
 8048120:	c7 04 24 c0 9e 04 08 	movl   $0x8049ec0,(%esp)
 8048127:	e8 4d 00 00 00       	call   8048179 <_panic>
	return key_pressed[index];
 804812c:	8b 45 08             	mov    0x8(%ebp),%eax
 804812f:	8b 04 85 20 b4 04 08 	mov    0x804b420(,%eax,4),%eax
}
 8048136:	c9                   	leave  
 8048137:	c3                   	ret    

08048138 <key_operation>:

extern void control_plane(int);
void key_operation(void){
 8048138:	55                   	push   %ebp
 8048139:	89 e5                	mov    %esp,%ebp
 804813b:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 804813e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048145:	eb 2a                	jmp    8048171 <key_operation+0x39>
		if(query_key(i)==TRUE){
 8048147:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804814a:	89 04 24             	mov    %eax,(%esp)
 804814d:	e8 a4 ff ff ff       	call   80480f6 <query_key>
 8048152:	83 f8 01             	cmp    $0x1,%eax
 8048155:	75 16                	jne    804816d <key_operation+0x35>
			control_plane(i);
 8048157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804815a:	89 04 24             	mov    %eax,(%esp)
 804815d:	e8 b6 07 00 00       	call   8048918 <control_plane>
			release_key(i);
 8048162:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048165:	89 04 24             	mov    %eax,(%esp)
 8048168:	e8 43 ff ff ff       	call   80480b0 <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 804816d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048171:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 8048175:	7e d0                	jle    8048147 <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 8048177:	c9                   	leave  
 8048178:	c3                   	ret    

08048179 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 8048179:	55                   	push   %ebp
 804817a:	89 e5                	mov    %esp,%ebp
 804817c:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 804817f:	a1 30 b4 04 08       	mov    0x804b430,%eax
 8048184:	85 c0                	test   %eax,%eax
 8048186:	74 01                	je     8048189 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 8048188:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 8048189:	8b 45 10             	mov    0x10(%ebp),%eax
 804818c:	a3 30 b4 04 08       	mov    %eax,0x804b430

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 8048191:	fa                   	cli    
 8048192:	fc                   	cld    

	va_start(ap, fmt);
 8048193:	8d 45 14             	lea    0x14(%ebp),%eax
 8048196:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 8048199:	8b 45 0c             	mov    0xc(%ebp),%eax
 804819c:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481a0:	8b 45 08             	mov    0x8(%ebp),%eax
 80481a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481a7:	c7 04 24 d0 9e 04 08 	movl   $0x8049ed0,(%esp)
 80481ae:	e8 40 0e 00 00       	call   8048ff3 <printf>
	vprintf(fmt, ap);
 80481b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481ba:	8b 45 10             	mov    0x10(%ebp),%eax
 80481bd:	89 04 24             	mov    %eax,(%esp)
 80481c0:	e8 fb 0d 00 00       	call   8048fc0 <vprintf>
	printf("\n");
 80481c5:	c7 04 24 e8 9e 04 08 	movl   $0x8049ee8,(%esp)
 80481cc:	e8 22 0e 00 00       	call   8048ff3 <printf>
	va_end(ap);

}
 80481d1:	c9                   	leave  
 80481d2:	c3                   	ret    

080481d3 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 80481d3:	55                   	push   %ebp
 80481d4:	89 e5                	mov    %esp,%ebp
 80481d6:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 80481d9:	8d 45 14             	lea    0x14(%ebp),%eax
 80481dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 80481df:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481e2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80481e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481ed:	c7 04 24 ea 9e 04 08 	movl   $0x8049eea,(%esp)
 80481f4:	e8 fa 0d 00 00       	call   8048ff3 <printf>
	vprintf(fmt, ap);
 80481f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048200:	8b 45 10             	mov    0x10(%ebp),%eax
 8048203:	89 04 24             	mov    %eax,(%esp)
 8048206:	e8 b5 0d 00 00       	call   8048fc0 <vprintf>
	printf("\n");
 804820b:	c7 04 24 e8 9e 04 08 	movl   $0x8049ee8,(%esp)
 8048212:	e8 dc 0d 00 00       	call   8048ff3 <printf>
	va_end(ap);
}
 8048217:	c9                   	leave  
 8048218:	c3                   	ret    

08048219 <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 8048219:	55                   	push   %ebp
 804821a:	89 e5                	mov    %esp,%ebp
 804821c:	83 ec 38             	sub    $0x38,%esp
 804821f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048222:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 8048225:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 8048229:	79 24                	jns    804824f <draw_character+0x36>
 804822b:	c7 44 24 0c 04 9f 04 	movl   $0x8049f04,0xc(%esp)
 8048232:	08 
 8048233:	c7 44 24 08 15 9f 04 	movl   $0x8049f15,0x8(%esp)
 804823a:	08 
 804823b:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048242:	00 
 8048243:	c7 04 24 2a 9f 04 08 	movl   $0x8049f2a,(%esp)
 804824a:	e8 2a ff ff ff       	call   8048179 <_panic>
	char *p = font8x8_basic[(int)ch];
 804824f:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 8048253:	c1 e0 03             	shl    $0x3,%eax
 8048256:	05 20 b0 04 08       	add    $0x804b020,%eax
 804825b:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 804825e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048265:	eb 59                	jmp    80482c0 <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 8048267:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804826e:	eb 46                	jmp    80482b6 <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 8048270:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048273:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048276:	01 d0                	add    %edx,%eax
 8048278:	0f b6 00             	movzbl (%eax),%eax
 804827b:	0f be d0             	movsbl %al,%edx
 804827e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048281:	89 c1                	mov    %eax,%ecx
 8048283:	d3 fa                	sar    %cl,%edx
 8048285:	89 d0                	mov    %edx,%eax
 8048287:	83 e0 01             	and    $0x1,%eax
 804828a:	85 c0                	test   %eax,%eax
 804828c:	74 24                	je     80482b2 <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 804828e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048291:	8b 55 10             	mov    0x10(%ebp),%edx
 8048294:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048297:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804829a:	8b 55 0c             	mov    0xc(%ebp),%edx
 804829d:	01 c2                	add    %eax,%edx
 804829f:	8b 45 14             	mov    0x14(%ebp),%eax
 80482a2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482a6:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80482aa:	89 14 24             	mov    %edx,(%esp)
 80482ad:	e8 64 0b 00 00       	call   8048e16 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 80482b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80482b6:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 80482ba:	7e b4                	jle    8048270 <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 80482bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80482c0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 80482c4:	7e a1                	jle    8048267 <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 80482c6:	c9                   	leave  
 80482c7:	c3                   	ret    

080482c8 <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 80482c8:	55                   	push   %ebp
 80482c9:	89 e5                	mov    %esp,%ebp
 80482cb:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 80482ce:	eb 4a                	jmp    804831a <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 80482d0:	8b 45 08             	mov    0x8(%ebp),%eax
 80482d3:	8d 50 01             	lea    0x1(%eax),%edx
 80482d6:	89 55 08             	mov    %edx,0x8(%ebp)
 80482d9:	0f b6 00             	movzbl (%eax),%eax
 80482dc:	0f be c0             	movsbl %al,%eax
 80482df:	8b 55 14             	mov    0x14(%ebp),%edx
 80482e2:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80482e6:	8b 55 10             	mov    0x10(%ebp),%edx
 80482e9:	89 54 24 08          	mov    %edx,0x8(%esp)
 80482ed:	8b 55 0c             	mov    0xc(%ebp),%edx
 80482f0:	89 54 24 04          	mov    %edx,0x4(%esp)
 80482f4:	89 04 24             	mov    %eax,(%esp)
 80482f7:	e8 1d ff ff ff       	call   8048219 <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 80482fc:	8b 45 10             	mov    0x10(%ebp),%eax
 80482ff:	83 c0 08             	add    $0x8,%eax
 8048302:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 8048307:	7e 0d                	jle    8048316 <draw_string+0x4e>
			x += 8; y = 0;
 8048309:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 804830d:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8048314:	eb 04                	jmp    804831a <draw_string+0x52>
		} else {
			y += 8;
 8048316:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 804831a:	8b 45 08             	mov    0x8(%ebp),%eax
 804831d:	0f b6 00             	movzbl (%eax),%eax
 8048320:	84 c0                	test   %al,%al
 8048322:	75 ac                	jne    80482d0 <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 8048324:	c9                   	leave  
 8048325:	c3                   	ret    

08048326 <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 8048326:	55                   	push   %ebp
 8048327:	89 e5                	mov    %esp,%ebp
 8048329:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 804832c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048333:	eb 3d                	jmp    8048372 <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 8048335:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804833c:	eb 28                	jmp    8048366 <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 804833e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048341:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048344:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048347:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804834a:	8b 55 08             	mov    0x8(%ebp),%edx
 804834d:	01 c2                	add    %eax,%edx
 804834f:	8b 45 14             	mov    0x14(%ebp),%eax
 8048352:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048356:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804835a:	89 14 24             	mov    %edx,(%esp)
 804835d:	e8 b4 0a 00 00       	call   8048e16 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 8048362:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048366:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048369:	3b 45 10             	cmp    0x10(%ebp),%eax
 804836c:	7c d0                	jl     804833e <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 804836e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048372:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048375:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048378:	7c bb                	jl     8048335 <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 804837a:	c9                   	leave  
 804837b:	c3                   	ret    

0804837c <redraw_screen>:

void
redraw_screen() {
 804837c:	55                   	push   %ebp
 804837d:	89 e5                	mov    %esp,%ebp
 804837f:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 8048382:	e8 f7 0a 00 00       	call   8048e7e <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 8048387:	e8 ab 06 00 00       	call   8048a37 <get_st_head>
 804838c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804838f:	eb 37                	jmp    80483c8 <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 8048391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048394:	8b 48 08             	mov    0x8(%eax),%ecx
 8048397:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804839a:	8b 50 04             	mov    0x4(%eax),%edx
 804839d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483a0:	8b 00                	mov    (%eax),%eax
 80483a2:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 80483a9:	00 
 80483aa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483ae:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483b2:	89 04 24             	mov    %eax,(%esp)
 80483b5:	e8 6c ff ff ff       	call   8048326 <draw_bomb>
		it=st_next(it);
 80483ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483bd:	89 04 24             	mov    %eax,(%esp)
 80483c0:	e8 38 04 00 00       	call   80487fd <st_next>
 80483c5:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 80483c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80483cc:	75 c3                	jne    8048391 <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 80483ce:	8b 0d 14 5c 09 08    	mov    0x8095c14,%ecx
 80483d4:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80483da:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 80483df:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 80483e6:	00 
 80483e7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483eb:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483ef:	89 04 24             	mov    %eax,(%esp)
 80483f2:	e8 2f ff ff ff       	call   8048326 <draw_bomb>
	const char *score=itoa(get_score());
 80483f7:	e8 27 06 00 00       	call   8048a23 <get_score>
 80483fc:	89 04 24             	mov    %eax,(%esp)
 80483ff:	e8 30 0c 00 00       	call   8049034 <itoa>
 8048404:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 8048407:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804840a:	89 04 24             	mov    %eax,(%esp)
 804840d:	e8 be 0c 00 00       	call   80490d0 <strlen>
 8048412:	89 c2                	mov    %eax,%edx
 8048414:	b8 00 00 00 00       	mov    $0x0,%eax
 8048419:	29 d0                	sub    %edx,%eax
 804841b:	c1 e0 03             	shl    $0x3,%eax
 804841e:	05 10 01 00 00       	add    $0x110,%eax
 8048423:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804842a:	00 
 804842b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804842f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048436:	00 
 8048437:	c7 04 24 36 9f 04 08 	movl   $0x8049f36,(%esp)
 804843e:	e8 85 fe ff ff       	call   80482c8 <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 8048443:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048446:	89 04 24             	mov    %eax,(%esp)
 8048449:	e8 82 0c 00 00       	call   80490d0 <strlen>
 804844e:	89 c2                	mov    %eax,%edx
 8048450:	b8 00 00 00 00       	mov    $0x0,%eax
 8048455:	29 d0                	sub    %edx,%eax
 8048457:	c1 e0 03             	shl    $0x3,%eax
 804845a:	05 40 01 00 00       	add    $0x140,%eax
 804845f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048466:	00 
 8048467:	89 44 24 08          	mov    %eax,0x8(%esp)
 804846b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048472:	00 
 8048473:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048476:	89 04 24             	mov    %eax,(%esp)
 8048479:	e8 4a fe ff ff       	call   80482c8 <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 804847e:	e8 aa 05 00 00       	call   8048a2d <get_miss>
 8048483:	89 04 24             	mov    %eax,(%esp)
 8048486:	e8 a9 0b 00 00       	call   8049034 <itoa>
 804848b:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 804848e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048491:	89 04 24             	mov    %eax,(%esp)
 8048494:	e8 37 0c 00 00       	call   80490d0 <strlen>
 8048499:	89 c2                	mov    %eax,%edx
 804849b:	b8 00 00 00 00       	mov    $0x0,%eax
 80484a0:	29 d0                	sub    %edx,%eax
 80484a2:	c1 e0 03             	shl    $0x3,%eax
 80484a5:	05 18 01 00 00       	add    $0x118,%eax
 80484aa:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484b1:	00 
 80484b2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484b6:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484bd:	00 
 80484be:	c7 04 24 3d 9f 04 08 	movl   $0x8049f3d,(%esp)
 80484c5:	e8 fe fd ff ff       	call   80482c8 <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80484ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484cd:	89 04 24             	mov    %eax,(%esp)
 80484d0:	e8 fb 0b 00 00       	call   80490d0 <strlen>
 80484d5:	89 c2                	mov    %eax,%edx
 80484d7:	b8 00 00 00 00       	mov    $0x0,%eax
 80484dc:	29 d0                	sub    %edx,%eax
 80484de:	c1 e0 03             	shl    $0x3,%eax
 80484e1:	05 40 01 00 00       	add    $0x140,%eax
 80484e6:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484ed:	00 
 80484ee:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484f2:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484f9:	00 
 80484fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484fd:	89 04 24             	mov    %eax,(%esp)
 8048500:	e8 c3 fd ff ff       	call   80482c8 <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 8048505:	e8 74 00 00 00       	call   804857e <get_fps>
 804850a:	89 04 24             	mov    %eax,(%esp)
 804850d:	e8 22 0b 00 00       	call   8049034 <itoa>
 8048512:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048519:	00 
 804851a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8048521:	00 
 8048522:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048529:	00 
 804852a:	89 04 24             	mov    %eax,(%esp)
 804852d:	e8 96 fd ff ff       	call   80482c8 <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 8048532:	e8 47 00 00 00       	call   804857e <get_fps>
 8048537:	89 04 24             	mov    %eax,(%esp)
 804853a:	e8 f5 0a 00 00       	call   8049034 <itoa>
 804853f:	89 04 24             	mov    %eax,(%esp)
 8048542:	e8 89 0b 00 00       	call   80490d0 <strlen>
 8048547:	c1 e0 03             	shl    $0x3,%eax
 804854a:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048551:	00 
 8048552:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048556:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804855d:	00 
 804855e:	c7 04 24 43 9f 04 08 	movl   $0x8049f43,(%esp)
 8048565:	e8 5e fd ff ff       	call   80482c8 <draw_string>
	syspr();
 804856a:	e8 33 09 00 00       	call   8048ea2 <syspr>
}
 804856f:	c9                   	leave  
 8048570:	c3                   	ret    

08048571 <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 8048571:	55                   	push   %ebp
 8048572:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 8048574:	8b 45 08             	mov    0x8(%ebp),%eax
 8048577:	a3 34 b4 04 08       	mov    %eax,0x804b434
}
 804857c:	5d                   	pop    %ebp
 804857d:	c3                   	ret    

0804857e <get_fps>:
int get_fps() {
 804857e:	55                   	push   %ebp
 804857f:	89 e5                	mov    %esp,%ebp
	return real_fps;
 8048581:	a1 34 b4 04 08       	mov    0x804b434,%eax
}
 8048586:	5d                   	pop    %ebp
 8048587:	c3                   	ret    

08048588 <main_loop>:


extern void key_operation();
void main_loop(void) {
 8048588:	55                   	push   %ebp
 8048589:	89 e5                	mov    %esp,%ebp
 804858b:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 804858e:	e8 2b 09 00 00       	call   8048ebe <systime>
 8048593:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 8048596:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 804859d:	c7 05 0c 5c 09 08 64 	movl   $0x64,0x8095c0c
 80485a4:	00 00 00 
	pl.y=150;
 80485a7:	c7 05 10 5c 09 08 96 	movl   $0x96,0x8095c10
 80485ae:	00 00 00 
	pl.w=10;
 80485b1:	c7 05 14 5c 09 08 0a 	movl   $0xa,0x8095c14
 80485b8:	00 00 00 
	pl.v=10;
 80485bb:	c7 05 18 5c 09 08 0a 	movl   $0xa,0x8095c18
 80485c2:	00 00 00 
	
	while (TRUE) {
	
		key_operation();
 80485c5:	e8 6e fb ff ff       	call   8048138 <key_operation>
		target = systime(); 
 80485ca:	e8 ef 08 00 00       	call   8048ebe <systime>
 80485cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		redraw = FALSE;
 80485d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 80485d9:	e9 06 01 00 00       	jmp    80486e4 <main_loop+0x15c>
			int code=sysreadkey();
 80485de:	e8 ef 08 00 00       	call   8048ed2 <sysreadkey>
 80485e3:	89 45 e0             	mov    %eax,-0x20(%ebp)
			if(code!=-1){
 80485e6:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
 80485ea:	74 0b                	je     80485f7 <main_loop+0x6f>
				press_key(code);
 80485ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80485ef:	89 04 24             	mov    %eax,(%esp)
 80485f2:	e8 81 fa ff ff       	call   8048078 <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 80485f7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80485fa:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80485ff:	89 c8                	mov    %ecx,%eax
 8048601:	f7 ea                	imul   %edx
 8048603:	c1 fa 05             	sar    $0x5,%edx
 8048606:	89 c8                	mov    %ecx,%eax
 8048608:	c1 f8 1f             	sar    $0x1f,%eax
 804860b:	29 c2                	sub    %eax,%edx
 804860d:	89 d0                	mov    %edx,%eax
 804860f:	6b c0 64             	imul   $0x64,%eax,%eax
 8048612:	29 c1                	sub    %eax,%ecx
 8048614:	89 c8                	mov    %ecx,%eax
 8048616:	85 c0                	test   %eax,%eax
 8048618:	75 05                	jne    804861f <main_loop+0x97>
				create_new_stone();
 804861a:	e8 22 04 00 00       	call   8048a41 <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 804861f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048622:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048627:	89 c8                	mov    %ecx,%eax
 8048629:	f7 ea                	imul   %edx
 804862b:	89 c8                	mov    %ecx,%eax
 804862d:	c1 f8 1f             	sar    $0x1f,%eax
 8048630:	29 c2                	sub    %eax,%edx
 8048632:	89 d0                	mov    %edx,%eax
 8048634:	01 c0                	add    %eax,%eax
 8048636:	01 d0                	add    %edx,%eax
 8048638:	29 c1                	sub    %eax,%ecx
 804863a:	89 ca                	mov    %ecx,%edx
 804863c:	85 d2                	test   %edx,%edx
 804863e:	75 05                	jne    8048645 <main_loop+0xbd>
				update_stone_pos();
 8048640:	e8 9f 04 00 00       	call   8048ae4 <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 8048645:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048648:	ba 56 55 55 55       	mov    $0x55555556,%edx
 804864d:	89 c8                	mov    %ecx,%eax
 804864f:	f7 ea                	imul   %edx
 8048651:	89 c8                	mov    %ecx,%eax
 8048653:	c1 f8 1f             	sar    $0x1f,%eax
 8048656:	29 c2                	sub    %eax,%edx
 8048658:	89 d0                	mov    %edx,%eax
 804865a:	01 c0                	add    %eax,%eax
 804865c:	01 d0                	add    %edx,%eax
 804865e:	29 c1                	sub    %eax,%ecx
 8048660:	89 ca                	mov    %ecx,%edx
 8048662:	85 d2                	test   %edx,%edx
 8048664:	75 05                	jne    804866b <main_loop+0xe3>
				update_bang();
 8048666:	e8 13 07 00 00       	call   8048d7e <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 804866b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804866e:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048673:	89 c8                	mov    %ecx,%eax
 8048675:	f7 ea                	imul   %edx
 8048677:	89 c8                	mov    %ecx,%eax
 8048679:	c1 f8 1f             	sar    $0x1f,%eax
 804867c:	29 c2                	sub    %eax,%edx
 804867e:	89 d0                	mov    %edx,%eax
 8048680:	01 c0                	add    %eax,%eax
 8048682:	01 d0                	add    %edx,%eax
 8048684:	29 c1                	sub    %eax,%ecx
 8048686:	89 ca                	mov    %ecx,%edx
 8048688:	85 d2                	test   %edx,%edx
 804868a:	75 07                	jne    8048693 <main_loop+0x10b>
				redraw = TRUE;
 804868c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 8048693:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048696:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804869b:	89 c8                	mov    %ecx,%eax
 804869d:	f7 ea                	imul   %edx
 804869f:	c1 fa 04             	sar    $0x4,%edx
 80486a2:	89 c8                	mov    %ecx,%eax
 80486a4:	c1 f8 1f             	sar    $0x1f,%eax
 80486a7:	29 c2                	sub    %eax,%edx
 80486a9:	89 d0                	mov    %edx,%eax
 80486ab:	6b c0 32             	imul   $0x32,%eax,%eax
 80486ae:	29 c1                	sub    %eax,%ecx
 80486b0:	89 c8                	mov    %ecx,%eax
 80486b2:	85 c0                	test   %eax,%eax
 80486b4:	75 2a                	jne    80486e0 <main_loop+0x158>
				int now_fps = num_draw * 2 + 1;
 80486b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80486b9:	01 c0                	add    %eax,%eax
 80486bb:	83 c0 01             	add    $0x1,%eax
 80486be:	89 45 e8             	mov    %eax,-0x18(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 80486c1:	83 7d e8 1e          	cmpl   $0x1e,-0x18(%ebp)
 80486c5:	7e 07                	jle    80486ce <main_loop+0x146>
 80486c7:	c7 45 e8 1e 00 00 00 	movl   $0x1e,-0x18(%ebp)
				set_fps(now_fps);
 80486ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486d1:	89 04 24             	mov    %eax,(%esp)
 80486d4:	e8 98 fe ff ff       	call   8048571 <set_fps>
				num_draw = 0;
 80486d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 80486e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 80486e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80486e7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 80486ea:	0f 8c ee fe ff ff    	jl     80485de <main_loop+0x56>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 80486f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 80486f4:	74 0e                	je     8048704 <main_loop+0x17c>
			num_draw ++;
 80486f6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 80486fa:	e8 7d fc ff ff       	call   804837c <redraw_screen>
		}
	}
 80486ff:	e9 c1 fe ff ff       	jmp    80485c5 <main_loop+0x3d>
 8048704:	e9 bc fe ff ff       	jmp    80485c5 <main_loop+0x3d>

08048709 <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 8048709:	55                   	push   %ebp
 804870a:	89 e5                	mov    %esp,%ebp
 804870c:	83 ec 28             	sub    $0x28,%esp
 804870f:	a1 d8 5d 08 08       	mov    0x8085dd8,%eax
 8048714:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048717:	c7 45 ec 40 b4 04 08 	movl   $0x804b440,-0x14(%ebp)
 804871e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048722:	75 47                	jne    804876b <st_new+0x62>
 8048724:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804872b:	eb 2f                	jmp    804875c <st_new+0x53>
 804872d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048730:	89 d0                	mov    %edx,%eax
 8048732:	01 c0                	add    %eax,%eax
 8048734:	01 d0                	add    %edx,%eax
 8048736:	c1 e0 03             	shl    $0x3,%eax
 8048739:	8d 50 e8             	lea    -0x18(%eax),%edx
 804873c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804873f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048742:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048745:	89 d0                	mov    %edx,%eax
 8048747:	01 c0                	add    %eax,%eax
 8048749:	01 d0                	add    %edx,%eax
 804874b:	c1 e0 03             	shl    $0x3,%eax
 804874e:	89 c2                	mov    %eax,%edx
 8048750:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048753:	01 d0                	add    %edx,%eax
 8048755:	89 41 14             	mov    %eax,0x14(%ecx)
 8048758:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804875c:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 8048763:	7e c8                	jle    804872d <st_new+0x24>
 8048765:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048768:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804876b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804876e:	8b 40 14             	mov    0x14(%eax),%eax
 8048771:	85 c0                	test   %eax,%eax
 8048773:	75 24                	jne    8048799 <st_new+0x90>
 8048775:	c7 44 24 0c 47 9f 04 	movl   $0x8049f47,0xc(%esp)
 804877c:	08 
 804877d:	c7 44 24 08 60 9f 04 	movl   $0x8049f60,0x8(%esp)
 8048784:	08 
 8048785:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804878c:	00 
 804878d:	c7 04 24 75 9f 04 08 	movl   $0x8049f75,(%esp)
 8048794:	e8 e0 f9 ff ff       	call   8048179 <_panic>
 8048799:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804879c:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804879f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80487a2:	8b 40 14             	mov    0x14(%eax),%eax
 80487a5:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 80487aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487ad:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 80487b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487b7:	8b 50 14             	mov    0x14(%eax),%edx
 80487ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487bd:	89 50 10             	mov    %edx,0x10(%eax)
 80487c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487c3:	c9                   	leave  
 80487c4:	c3                   	ret    

080487c5 <st_prev>:
 80487c5:	55                   	push   %ebp
 80487c6:	89 e5                	mov    %esp,%ebp
 80487c8:	83 ec 18             	sub    $0x18,%esp
 80487cb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80487cf:	75 24                	jne    80487f5 <st_prev+0x30>
 80487d1:	c7 44 24 0c 83 9f 04 	movl   $0x8049f83,0xc(%esp)
 80487d8:	08 
 80487d9:	c7 44 24 08 60 9f 04 	movl   $0x8049f60,0x8(%esp)
 80487e0:	08 
 80487e1:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80487e8:	00 
 80487e9:	c7 04 24 75 9f 04 08 	movl   $0x8049f75,(%esp)
 80487f0:	e8 84 f9 ff ff       	call   8048179 <_panic>
 80487f5:	8b 45 08             	mov    0x8(%ebp),%eax
 80487f8:	8b 40 10             	mov    0x10(%eax),%eax
 80487fb:	c9                   	leave  
 80487fc:	c3                   	ret    

080487fd <st_next>:
 80487fd:	55                   	push   %ebp
 80487fe:	89 e5                	mov    %esp,%ebp
 8048800:	83 ec 18             	sub    $0x18,%esp
 8048803:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048807:	75 24                	jne    804882d <st_next+0x30>
 8048809:	c7 44 24 0c 83 9f 04 	movl   $0x8049f83,0xc(%esp)
 8048810:	08 
 8048811:	c7 44 24 08 60 9f 04 	movl   $0x8049f60,0x8(%esp)
 8048818:	08 
 8048819:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048820:	00 
 8048821:	c7 04 24 75 9f 04 08 	movl   $0x8049f75,(%esp)
 8048828:	e8 4c f9 ff ff       	call   8048179 <_panic>
 804882d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048830:	8b 40 14             	mov    0x14(%eax),%eax
 8048833:	c9                   	leave  
 8048834:	c3                   	ret    

08048835 <st_insert>:
 8048835:	55                   	push   %ebp
 8048836:	89 e5                	mov    %esp,%ebp
 8048838:	83 ec 18             	sub    $0x18,%esp
 804883b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804883f:	75 2a                	jne    804886b <st_insert+0x36>
 8048841:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048845:	75 24                	jne    804886b <st_insert+0x36>
 8048847:	c7 44 24 0c 90 9f 04 	movl   $0x8049f90,0xc(%esp)
 804884e:	08 
 804884f:	c7 44 24 08 60 9f 04 	movl   $0x8049f60,0x8(%esp)
 8048856:	08 
 8048857:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804885e:	00 
 804885f:	c7 04 24 75 9f 04 08 	movl   $0x8049f75,(%esp)
 8048866:	e8 0e f9 ff ff       	call   8048179 <_panic>
 804886b:	8b 45 10             	mov    0x10(%ebp),%eax
 804886e:	8b 55 08             	mov    0x8(%ebp),%edx
 8048871:	89 50 10             	mov    %edx,0x10(%eax)
 8048874:	8b 45 10             	mov    0x10(%ebp),%eax
 8048877:	8b 55 0c             	mov    0xc(%ebp),%edx
 804887a:	89 50 14             	mov    %edx,0x14(%eax)
 804887d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048881:	74 09                	je     804888c <st_insert+0x57>
 8048883:	8b 45 08             	mov    0x8(%ebp),%eax
 8048886:	8b 55 10             	mov    0x10(%ebp),%edx
 8048889:	89 50 14             	mov    %edx,0x14(%eax)
 804888c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048890:	74 09                	je     804889b <st_insert+0x66>
 8048892:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048895:	8b 55 10             	mov    0x10(%ebp),%edx
 8048898:	89 50 10             	mov    %edx,0x10(%eax)
 804889b:	c9                   	leave  
 804889c:	c3                   	ret    

0804889d <st_remove>:
 804889d:	55                   	push   %ebp
 804889e:	89 e5                	mov    %esp,%ebp
 80488a0:	83 ec 28             	sub    $0x28,%esp
 80488a3:	8b 45 08             	mov    0x8(%ebp),%eax
 80488a6:	8b 40 10             	mov    0x10(%eax),%eax
 80488a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80488af:	8b 40 14             	mov    0x14(%eax),%eax
 80488b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80488b5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80488b9:	75 24                	jne    80488df <st_remove+0x42>
 80488bb:	c7 44 24 0c 83 9f 04 	movl   $0x8049f83,0xc(%esp)
 80488c2:	08 
 80488c3:	c7 44 24 08 60 9f 04 	movl   $0x8049f60,0x8(%esp)
 80488ca:	08 
 80488cb:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488d2:	00 
 80488d3:	c7 04 24 75 9f 04 08 	movl   $0x8049f75,(%esp)
 80488da:	e8 9a f8 ff ff       	call   8048179 <_panic>
 80488df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80488e3:	74 09                	je     80488ee <st_remove+0x51>
 80488e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488e8:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488eb:	89 50 14             	mov    %edx,0x14(%eax)
 80488ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80488f2:	74 09                	je     80488fd <st_remove+0x60>
 80488f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80488fa:	89 50 10             	mov    %edx,0x10(%eax)
 80488fd:	c9                   	leave  
 80488fe:	c3                   	ret    

080488ff <st_free>:
 80488ff:	55                   	push   %ebp
 8048900:	89 e5                	mov    %esp,%ebp
 8048902:	8b 15 d8 5d 08 08    	mov    0x8085dd8,%edx
 8048908:	8b 45 08             	mov    0x8(%ebp),%eax
 804890b:	89 50 14             	mov    %edx,0x14(%eax)
 804890e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048911:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048916:	5d                   	pop    %ebp
 8048917:	c3                   	ret    

08048918 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 8048918:	55                   	push   %ebp
 8048919:	89 e5                	mov    %esp,%ebp
 804891b:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 804891e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048921:	83 f8 01             	cmp    $0x1,%eax
 8048924:	74 4e                	je     8048974 <control_plane+0x5c>
 8048926:	83 f8 01             	cmp    $0x1,%eax
 8048929:	7f 09                	jg     8048934 <control_plane+0x1c>
 804892b:	85 c0                	test   %eax,%eax
 804892d:	74 18                	je     8048947 <control_plane+0x2f>
 804892f:	e9 c9 00 00 00       	jmp    80489fd <control_plane+0xe5>
 8048934:	83 f8 02             	cmp    $0x2,%eax
 8048937:	74 6c                	je     80489a5 <control_plane+0x8d>
 8048939:	83 f8 03             	cmp    $0x3,%eax
 804893c:	0f 84 8a 00 00 00    	je     80489cc <control_plane+0xb4>
 8048942:	e9 b6 00 00 00       	jmp    80489fd <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 8048947:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 804894d:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048952:	39 c2                	cmp    %eax,%edx
 8048954:	7c 19                	jl     804896f <control_plane+0x57>
 8048956:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 804895c:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048961:	29 c2                	sub    %eax,%edx
 8048963:	89 d0                	mov    %edx,%eax
 8048965:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 804896a:	e9 b2 00 00 00       	jmp    8048a21 <control_plane+0x109>
 804896f:	e9 ad 00 00 00       	jmp    8048a21 <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048974:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 804897a:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 804897f:	01 c2                	add    %eax,%edx
 8048981:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048986:	01 d0                	add    %edx,%eax
 8048988:	3d c8 00 00 00       	cmp    $0xc8,%eax
 804898d:	7f 14                	jg     80489a3 <control_plane+0x8b>
 804898f:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048995:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 804899a:	01 d0                	add    %edx,%eax
 804899c:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 80489a1:	eb 7e                	jmp    8048a21 <control_plane+0x109>
 80489a3:	eb 7c                	jmp    8048a21 <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 80489a5:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489ab:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489b0:	39 c2                	cmp    %eax,%edx
 80489b2:	7c 16                	jl     80489ca <control_plane+0xb2>
 80489b4:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489ba:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489bf:	29 c2                	sub    %eax,%edx
 80489c1:	89 d0                	mov    %edx,%eax
 80489c3:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 80489c8:	eb 57                	jmp    8048a21 <control_plane+0x109>
 80489ca:	eb 55                	jmp    8048a21 <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 80489cc:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489d2:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489d7:	01 c2                	add    %eax,%edx
 80489d9:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 80489de:	01 d0                	add    %edx,%eax
 80489e0:	3d 40 01 00 00       	cmp    $0x140,%eax
 80489e5:	7f 14                	jg     80489fb <control_plane+0xe3>
 80489e7:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489ed:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489f2:	01 d0                	add    %edx,%eax
 80489f4:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 80489f9:	eb 26                	jmp    8048a21 <control_plane+0x109>
 80489fb:	eb 24                	jmp    8048a21 <control_plane+0x109>
		default:assert(0);
 80489fd:	c7 44 24 0c ad 9f 04 	movl   $0x8049fad,0xc(%esp)
 8048a04:	08 
 8048a05:	c7 44 24 08 60 9f 04 	movl   $0x8049f60,0x8(%esp)
 8048a0c:	08 
 8048a0d:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048a14:	00 
 8048a15:	c7 04 24 75 9f 04 08 	movl   $0x8049f75,(%esp)
 8048a1c:	e8 58 f7 ff ff       	call   8048179 <_panic>
	}
}
 8048a21:	c9                   	leave  
 8048a22:	c3                   	ret    

08048a23 <get_score>:


int get_score(void) {
 8048a23:	55                   	push   %ebp
 8048a24:	89 e5                	mov    %esp,%ebp
	return score;
 8048a26:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
}
 8048a2b:	5d                   	pop    %ebp
 8048a2c:	c3                   	ret    

08048a2d <get_miss>:

int get_miss(void) {
 8048a2d:	55                   	push   %ebp
 8048a2e:	89 e5                	mov    %esp,%ebp
	return miss;
 8048a30:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
}
 8048a35:	5d                   	pop    %ebp
 8048a36:	c3                   	ret    

08048a37 <get_st_head>:

st_t get_st_head(void){
 8048a37:	55                   	push   %ebp
 8048a38:	89 e5                	mov    %esp,%ebp
	return head;
 8048a3a:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
}
 8048a3f:	5d                   	pop    %ebp
 8048a40:	c3                   	ret    

08048a41 <create_new_stone>:

void create_new_stone(void) {
 8048a41:	55                   	push   %ebp
 8048a42:	89 e5                	mov    %esp,%ebp
 8048a44:	53                   	push   %ebx
 8048a45:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048a48:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a4d:	85 c0                	test   %eax,%eax
 8048a4f:	75 0c                	jne    8048a5d <create_new_stone+0x1c>
		head = st_new(); 
 8048a51:	e8 b3 fc ff ff       	call   8048709 <st_new>
 8048a56:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
 8048a5b:	eb 2c                	jmp    8048a89 <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048a5d:	e8 a7 fc ff ff       	call   8048709 <st_new>
 8048a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048a65:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a6a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048a71:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a7c:	e8 b4 fd ff ff       	call   8048835 <st_insert>
		head = now;
 8048a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a84:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
	}
	head->x = 0;
 8048a89:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a8e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048a94:	8b 1d dc 5d 08 08    	mov    0x8085ddc,%ebx
 8048a9a:	e8 27 11 00 00       	call   8049bc6 <rand>
 8048a9f:	89 c1                	mov    %eax,%ecx
 8048aa1:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048aa6:	89 c8                	mov    %ecx,%eax
 8048aa8:	f7 ea                	imul   %edx
 8048aaa:	c1 fa 04             	sar    $0x4,%edx
 8048aad:	89 c8                	mov    %ecx,%eax
 8048aaf:	c1 f8 1f             	sar    $0x1f,%eax
 8048ab2:	29 c2                	sub    %eax,%edx
 8048ab4:	89 d0                	mov    %edx,%eax
 8048ab6:	6b c0 26             	imul   $0x26,%eax,%eax
 8048ab9:	29 c1                	sub    %eax,%ecx
 8048abb:	89 c8                	mov    %ecx,%eax
 8048abd:	83 c0 01             	add    $0x1,%eax
 8048ac0:	c1 e0 03             	shl    $0x3,%eax
 8048ac3:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048ac6:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048acb:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048ad2:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ad7:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048ade:	83 c4 24             	add    $0x24,%esp
 8048ae1:	5b                   	pop    %ebx
 8048ae2:	5d                   	pop    %ebp
 8048ae3:	c3                   	ret    

08048ae4 <update_stone_pos>:

void update_stone_pos(void) {
 8048ae4:	55                   	push   %ebp
 8048ae5:	89 e5                	mov    %esp,%ebp
 8048ae7:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048aea:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048aef:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048af2:	eb 6f                	jmp    8048b63 <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048af7:	89 04 24             	mov    %eax,(%esp)
 8048afa:	e8 fe fc ff ff       	call   80487fd <st_next>
 8048aff:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b05:	8b 10                	mov    (%eax),%edx
 8048b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b0a:	8b 40 0c             	mov    0xc(%eax),%eax
 8048b0d:	01 c2                	add    %eax,%edx
 8048b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b12:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b17:	8b 10                	mov    (%eax),%edx
 8048b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b1c:	8b 40 08             	mov    0x8(%eax),%eax
 8048b1f:	01 d0                	add    %edx,%eax
 8048b21:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048b26:	7e 35                	jle    8048b5d <update_stone_pos+0x79>
			miss++; 
 8048b28:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
 8048b2d:	83 c0 01             	add    $0x1,%eax
 8048b30:	a3 e4 5d 08 08       	mov    %eax,0x8085de4
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b38:	89 04 24             	mov    %eax,(%esp)
 8048b3b:	e8 5d fd ff ff       	call   804889d <st_remove>
			if (it == head) head = next; 
 8048b40:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b45:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048b48:	75 08                	jne    8048b52 <update_stone_pos+0x6e>
 8048b4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b4d:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b55:	89 04 24             	mov    %eax,(%esp)
 8048b58:	e8 a2 fd ff ff       	call   80488ff <st_free>
		}
		it = next;
 8048b5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b60:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048b63:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048b67:	75 8b                	jne    8048af4 <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048b69:	c9                   	leave  
 8048b6a:	c3                   	ret    

08048b6b <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048b6b:	55                   	push   %ebp
 8048b6c:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048b6e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048b71:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048b74:	7f 29                	jg     8048b9f <inplane+0x34>
 8048b76:	8b 55 10             	mov    0x10(%ebp),%edx
 8048b79:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b7c:	01 d0                	add    %edx,%eax
 8048b7e:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048b81:	7c 1c                	jl     8048b9f <inplane+0x34>
 8048b83:	8b 45 14             	mov    0x14(%ebp),%eax
 8048b86:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048b89:	7f 14                	jg     8048b9f <inplane+0x34>
 8048b8b:	8b 55 14             	mov    0x14(%ebp),%edx
 8048b8e:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b91:	01 d0                	add    %edx,%eax
 8048b93:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048b96:	7c 07                	jl     8048b9f <inplane+0x34>
 8048b98:	b8 01 00 00 00       	mov    $0x1,%eax
 8048b9d:	eb 05                	jmp    8048ba4 <inplane+0x39>
 8048b9f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048ba4:	5d                   	pop    %ebp
 8048ba5:	c3                   	ret    

08048ba6 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048ba6:	55                   	push   %ebp
 8048ba7:	89 e5                	mov    %esp,%ebp
 8048ba9:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048bac:	8b 45 18             	mov    0x18(%ebp),%eax
 8048baf:	8b 00                	mov    (%eax),%eax
 8048bb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048bb4:	8b 45 18             	mov    0x18(%ebp),%eax
 8048bb7:	8b 40 04             	mov    0x4(%eax),%eax
 8048bba:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048bbd:	8b 45 18             	mov    0x18(%ebp),%eax
 8048bc0:	8b 40 08             	mov    0x8(%eax),%eax
 8048bc3:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048bc6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bc9:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048bcc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bcf:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048bd2:	8b 45 10             	mov    0x10(%ebp),%eax
 8048bd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048bd8:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048bdb:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bde:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048be1:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048be5:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048be8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048bec:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048bef:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048bf3:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048bf7:	89 04 24             	mov    %eax,(%esp)
 8048bfa:	e8 6c ff ff ff       	call   8048b6b <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048bff:	85 c0                	test   %eax,%eax
 8048c01:	0f 85 69 01 00 00    	jne    8048d70 <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048c07:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c0a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048c0d:	8b 55 10             	mov    0x10(%ebp),%edx
 8048c10:	01 d1                	add    %edx,%ecx
 8048c12:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c15:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c19:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c1c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c20:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c23:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048c27:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c2b:	89 0c 24             	mov    %ecx,(%esp)
 8048c2e:	e8 38 ff ff ff       	call   8048b6b <inplane>
 8048c33:	85 c0                	test   %eax,%eax
 8048c35:	0f 85 35 01 00 00    	jne    8048d70 <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048c3b:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c3e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c41:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048c44:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c47:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c4a:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c4e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c51:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c55:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c58:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048c5c:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048c60:	89 04 24             	mov    %eax,(%esp)
 8048c63:	e8 03 ff ff ff       	call   8048b6b <inplane>
 8048c68:	85 c0                	test   %eax,%eax
 8048c6a:	0f 85 00 01 00 00    	jne    8048d70 <bang_or_not+0x1ca>
 8048c70:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c73:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c76:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048c79:	8b 55 08             	mov    0x8(%ebp),%edx
 8048c7c:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c7f:	01 c2                	add    %eax,%edx
 8048c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c84:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c88:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048c8b:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048c92:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048c96:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048c9a:	89 14 24             	mov    %edx,(%esp)
 8048c9d:	e8 c9 fe ff ff       	call   8048b6b <inplane>
 8048ca2:	85 c0                	test   %eax,%eax
 8048ca4:	0f 85 c6 00 00 00    	jne    8048d70 <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048caa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048cad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cb0:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048cb3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048cb7:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048cba:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048cbe:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048cc1:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048cc5:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048cc9:	89 04 24             	mov    %eax,(%esp)
 8048ccc:	e8 9a fe ff ff       	call   8048b6b <inplane>
 8048cd1:	85 c0                	test   %eax,%eax
 8048cd3:	0f 85 97 00 00 00    	jne    8048d70 <bang_or_not+0x1ca>
 8048cd9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048cdc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048cdf:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048ce2:	01 d1                	add    %edx,%ecx
 8048ce4:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048ce7:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048ceb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048cee:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048cf2:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048cf5:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cfd:	89 0c 24             	mov    %ecx,(%esp)
 8048d00:	e8 66 fe ff ff       	call   8048b6b <inplane>
 8048d05:	85 c0                	test   %eax,%eax
 8048d07:	75 67                	jne    8048d70 <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048d09:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d0f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d15:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048d18:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048d1c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048d1f:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048d23:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048d26:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048d2a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d2e:	89 04 24             	mov    %eax,(%esp)
 8048d31:	e8 35 fe ff ff       	call   8048b6b <inplane>
 8048d36:	85 c0                	test   %eax,%eax
 8048d38:	75 36                	jne    8048d70 <bang_or_not+0x1ca>
 8048d3a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d40:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d43:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048d46:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d49:	01 c2                	add    %eax,%edx
 8048d4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d4e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d52:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048d55:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d5c:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048d60:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d64:	89 14 24             	mov    %edx,(%esp)
 8048d67:	e8 ff fd ff ff       	call   8048b6b <inplane>
 8048d6c:	85 c0                	test   %eax,%eax
 8048d6e:	74 07                	je     8048d77 <bang_or_not+0x1d1>
 8048d70:	b8 01 00 00 00       	mov    $0x1,%eax
 8048d75:	eb 05                	jmp    8048d7c <bang_or_not+0x1d6>
 8048d77:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048d7c:	c9                   	leave  
 8048d7d:	c3                   	ret    

08048d7e <update_bang>:

void update_bang(void) {
 8048d7e:	55                   	push   %ebp
 8048d7f:	89 e5                	mov    %esp,%ebp
 8048d81:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048d84:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048d89:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d8c:	eb 7c                	jmp    8048e0a <update_bang+0x8c>
		st_t next=st_next(it);
 8048d8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d91:	89 04 24             	mov    %eax,(%esp)
 8048d94:	e8 64 fa ff ff       	call   80487fd <st_next>
 8048d99:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d9f:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048da3:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 8048da8:	89 04 24             	mov    %eax,(%esp)
 8048dab:	a1 10 5c 09 08       	mov    0x8095c10,%eax
 8048db0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048db4:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048db9:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048dbd:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048dc2:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048dc6:	e8 db fd ff ff       	call   8048ba6 <bang_or_not>
 8048dcb:	85 c0                	test   %eax,%eax
 8048dcd:	74 35                	je     8048e04 <update_bang+0x86>
			score++;
 8048dcf:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
 8048dd4:	83 c0 01             	add    $0x1,%eax
 8048dd7:	a3 e0 5d 08 08       	mov    %eax,0x8085de0
			st_remove(it);
 8048ddc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ddf:	89 04 24             	mov    %eax,(%esp)
 8048de2:	e8 b6 fa ff ff       	call   804889d <st_remove>
			if(it==head)
 8048de7:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048dec:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048def:	75 08                	jne    8048df9 <update_bang+0x7b>
				head=next;
 8048df1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048df4:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048df9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048dfc:	89 04 24             	mov    %eax,(%esp)
 8048dff:	e8 fb fa ff ff       	call   80488ff <st_free>
		}
		it=next;
 8048e04:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048e0a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048e0e:	0f 85 7a ff ff ff    	jne    8048d8e <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8048e14:	c9                   	leave  
 8048e15:	c3                   	ret    

08048e16 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8048e16:	55                   	push   %ebp
 8048e17:	89 e5                	mov    %esp,%ebp
 8048e19:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8048e1c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048e20:	78 18                	js     8048e3a <draw_pixel+0x24>
 8048e22:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048e26:	78 12                	js     8048e3a <draw_pixel+0x24>
 8048e28:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 8048e2f:	7f 09                	jg     8048e3a <draw_pixel+0x24>
 8048e31:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8048e38:	7e 24                	jle    8048e5e <draw_pixel+0x48>
 8048e3a:	c7 44 24 0c b0 9f 04 	movl   $0x8049fb0,0xc(%esp)
 8048e41:	08 
 8048e42:	c7 44 24 08 e4 9f 04 	movl   $0x8049fe4,0x8(%esp)
 8048e49:	08 
 8048e4a:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048e51:	00 
 8048e52:	c7 04 24 f9 9f 04 08 	movl   $0x8049ff9,(%esp)
 8048e59:	e8 1b f3 ff ff       	call   8048179 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 8048e5e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e61:	c1 e0 08             	shl    $0x8,%eax
 8048e64:	89 c2                	mov    %eax,%edx
 8048e66:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e69:	c1 e0 06             	shl    $0x6,%eax
 8048e6c:	01 c2                	add    %eax,%edx
 8048e6e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048e71:	01 c2                	add    %eax,%edx
 8048e73:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e76:	88 82 00 5e 08 08    	mov    %al,0x8085e00(%edx)
}
 8048e7c:	c9                   	leave  
 8048e7d:	c3                   	ret    

08048e7e <sysclean>:


void sysclean(void)
{
 8048e7e:	55                   	push   %ebp
 8048e7f:	89 e5                	mov    %esp,%ebp
 8048e81:	83 ec 18             	sub    $0x18,%esp
	memset(buff, 0, sizeof(buff));
 8048e84:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 8048e8b:	00 
 8048e8c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048e93:	00 
 8048e94:	c7 04 24 00 5e 08 08 	movl   $0x8085e00,(%esp)
 8048e9b:	e8 17 02 00 00       	call   80490b7 <memset>
}
 8048ea0:	c9                   	leave  
 8048ea1:	c3                   	ret    

08048ea2 <syspr>:
int syspr()
{
 8048ea2:	55                   	push   %ebp
 8048ea3:	89 e5                	mov    %esp,%ebp
 8048ea5:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_pr, buff);
 8048ea8:	c7 44 24 04 00 5e 08 	movl   $0x8085e00,0x4(%esp)
 8048eaf:	08 
 8048eb0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048eb7:	e8 b1 00 00 00       	call   8048f6d <syscall>
}
 8048ebc:	c9                   	leave  
 8048ebd:	c3                   	ret    

08048ebe <systime>:

int systime(void)
{
 8048ebe:	55                   	push   %ebp
 8048ebf:	89 e5                	mov    %esp,%ebp
 8048ec1:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_time);
 8048ec4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048ecb:	e8 9d 00 00 00       	call   8048f6d <syscall>
}
 8048ed0:	c9                   	leave  
 8048ed1:	c3                   	ret    

08048ed2 <sysreadkey>:

int sysreadkey(void)
{
 8048ed2:	55                   	push   %ebp
 8048ed3:	89 e5                	mov    %esp,%ebp
 8048ed5:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_readkey);
 8048ed8:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048edf:	e8 89 00 00 00       	call   8048f6d <syscall>
}
 8048ee4:	c9                   	leave  
 8048ee5:	c3                   	ret    

08048ee6 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8048ee6:	55                   	push   %ebp
 8048ee7:	89 e5                	mov    %esp,%ebp
 8048ee9:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_write, fd, buf1, n);
 8048eec:	8b 45 10             	mov    0x10(%ebp),%eax
 8048eef:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048ef3:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ef6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048efa:	8b 45 08             	mov    0x8(%ebp),%eax
 8048efd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f01:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048f08:	e8 60 00 00 00       	call   8048f6d <syscall>
}
 8048f0d:	c9                   	leave  
 8048f0e:	c3                   	ret    

08048f0f <fork>:

int fork(void)
{
 8048f0f:	55                   	push   %ebp
 8048f10:	89 e5                	mov    %esp,%ebp
 8048f12:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_fork);
 8048f15:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 8048f1c:	e8 4c 00 00 00       	call   8048f6d <syscall>
}
 8048f21:	c9                   	leave  
 8048f22:	c3                   	ret    

08048f23 <getpid>:

int getpid(void)
{
 8048f23:	55                   	push   %ebp
 8048f24:	89 e5                	mov    %esp,%ebp
 8048f26:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_getpid);
 8048f29:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
 8048f30:	e8 38 00 00 00       	call   8048f6d <syscall>
}
 8048f35:	c9                   	leave  
 8048f36:	c3                   	ret    

08048f37 <exit>:

void exit(int suc)
{
 8048f37:	55                   	push   %ebp
 8048f38:	89 e5                	mov    %esp,%ebp
 8048f3a:	83 ec 18             	sub    $0x18,%esp
	syscall(SYS_exit,suc);
 8048f3d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f40:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f44:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 8048f4b:	e8 1d 00 00 00       	call   8048f6d <syscall>
}
 8048f50:	c9                   	leave  
 8048f51:	c3                   	ret    

08048f52 <sleep>:

void sleep(int sec)
{
 8048f52:	55                   	push   %ebp
 8048f53:	89 e5                	mov    %esp,%ebp
 8048f55:	83 ec 18             	sub    $0x18,%esp
	syscall(SYS_sleep,sec);
 8048f58:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f5b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f5f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048f66:	e8 02 00 00 00       	call   8048f6d <syscall>
}
 8048f6b:	c9                   	leave  
 8048f6c:	c3                   	ret    

08048f6d <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 8048f6d:	55                   	push   %ebp
 8048f6e:	89 e5                	mov    %esp,%ebp
 8048f70:	53                   	push   %ebx
 8048f71:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 8048f74:	8d 45 08             	lea    0x8(%ebp),%eax
 8048f77:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 8048f7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f7d:	8b 00                	mov    (%eax),%eax
 8048f7f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f82:	83 c2 04             	add    $0x4,%edx
 8048f85:	8b 1a                	mov    (%edx),%ebx
 8048f87:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f8a:	83 c2 08             	add    $0x8,%edx
 8048f8d:	8b 0a                	mov    (%edx),%ecx
 8048f8f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f92:	83 c2 0c             	add    $0xc,%edx
 8048f95:	8b 12                	mov    (%edx),%edx
 8048f97:	cd 80                	int    $0x80
 8048f99:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 8048f9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048f9f:	83 c4 10             	add    $0x10,%esp
 8048fa2:	5b                   	pop    %ebx
 8048fa3:	5d                   	pop    %ebp
 8048fa4:	c3                   	ret    

08048fa5 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 8048fa5:	55                   	push   %ebp
 8048fa6:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 8048fa8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fab:	8b 00                	mov    (%eax),%eax
 8048fad:	8d 48 01             	lea    0x1(%eax),%ecx
 8048fb0:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fb3:	89 0a                	mov    %ecx,(%edx)
 8048fb5:	8b 55 08             	mov    0x8(%ebp),%edx
 8048fb8:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 8048fbe:	5d                   	pop    %ebp
 8048fbf:	c3                   	ret    

08048fc0 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 8048fc0:	55                   	push   %ebp
 8048fc1:	89 e5                	mov    %esp,%ebp
 8048fc3:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 8048fc6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 8048fcd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fd0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048fd4:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fd7:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048fdb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048fde:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fe2:	c7 04 24 a5 8f 04 08 	movl   $0x8048fa5,(%esp)
 8048fe9:	e8 d1 06 00 00       	call   80496bf <vprintfmt>
	return cnt;
 8048fee:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048ff1:	c9                   	leave  
 8048ff2:	c3                   	ret    

08048ff3 <printf>:
int printf(const char *fmt, ...)
{
 8048ff3:	55                   	push   %ebp
 8048ff4:	89 e5                	mov    %esp,%ebp
 8048ff6:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8048ff9:	8d 45 0c             	lea    0xc(%ebp),%eax
 8048ffc:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 8048fff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049002:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049006:	8b 45 08             	mov    0x8(%ebp),%eax
 8049009:	89 04 24             	mov    %eax,(%esp)
 804900c:	e8 af ff ff ff       	call   8048fc0 <vprintf>
 8049011:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 8049014:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049017:	89 44 24 08          	mov    %eax,0x8(%esp)
 804901b:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 8049022:	08 
 8049023:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804902a:	e8 b7 fe ff ff       	call   8048ee6 <syswrite>
	return cnt;
 804902f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049032:	c9                   	leave  
 8049033:	c3                   	ret    

08049034 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 8049034:	55                   	push   %ebp
 8049035:	89 e5                	mov    %esp,%ebp
 8049037:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 804903a:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 8049041:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049045:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049048:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804904d:	89 c8                	mov    %ecx,%eax
 804904f:	f7 ea                	imul   %edx
 8049051:	c1 fa 02             	sar    $0x2,%edx
 8049054:	89 c8                	mov    %ecx,%eax
 8049056:	c1 f8 1f             	sar    $0x1f,%eax
 8049059:	29 c2                	sub    %eax,%edx
 804905b:	89 d0                	mov    %edx,%eax
 804905d:	c1 e0 02             	shl    $0x2,%eax
 8049060:	01 d0                	add    %edx,%eax
 8049062:	01 c0                	add    %eax,%eax
 8049064:	29 c1                	sub    %eax,%ecx
 8049066:	89 ca                	mov    %ecx,%edx
 8049068:	89 d0                	mov    %edx,%eax
 804906a:	83 c0 30             	add    $0x30,%eax
 804906d:	89 c2                	mov    %eax,%edx
 804906f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049072:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 8049074:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049077:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804907c:	89 c8                	mov    %ecx,%eax
 804907e:	f7 ea                	imul   %edx
 8049080:	c1 fa 02             	sar    $0x2,%edx
 8049083:	89 c8                	mov    %ecx,%eax
 8049085:	c1 f8 1f             	sar    $0x1f,%eax
 8049088:	29 c2                	sub    %eax,%edx
 804908a:	89 d0                	mov    %edx,%eax
 804908c:	89 45 08             	mov    %eax,0x8(%ebp)
 804908f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049093:	75 ac                	jne    8049041 <itoa+0xd>
	return p;
 8049095:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049098:	c9                   	leave  
 8049099:	c3                   	ret    

0804909a <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 804909a:	55                   	push   %ebp
 804909b:	89 e5                	mov    %esp,%ebp
 804909d:	57                   	push   %edi
 804909e:	56                   	push   %esi
 804909f:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 80490a0:	8b 45 10             	mov    0x10(%ebp),%eax
 80490a3:	8b 55 0c             	mov    0xc(%ebp),%edx
 80490a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80490a9:	89 c1                	mov    %eax,%ecx
 80490ab:	89 d6                	mov    %edx,%esi
 80490ad:	89 df                	mov    %ebx,%edi
 80490af:	fc                   	cld    
 80490b0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 80490b2:	5b                   	pop    %ebx
 80490b3:	5e                   	pop    %esi
 80490b4:	5f                   	pop    %edi
 80490b5:	5d                   	pop    %ebp
 80490b6:	c3                   	ret    

080490b7 <memset>:

void memset(void *dest, int data, size_t size) {
 80490b7:	55                   	push   %ebp
 80490b8:	89 e5                	mov    %esp,%ebp
 80490ba:	57                   	push   %edi
 80490bb:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 80490bc:	8b 55 10             	mov    0x10(%ebp),%edx
 80490bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490c2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80490c5:	89 d1                	mov    %edx,%ecx
 80490c7:	89 df                	mov    %ebx,%edi
 80490c9:	fc                   	cld    
 80490ca:	f3 aa                	rep stos %al,%es:(%edi)
}
 80490cc:	5b                   	pop    %ebx
 80490cd:	5f                   	pop    %edi
 80490ce:	5d                   	pop    %ebp
 80490cf:	c3                   	ret    

080490d0 <strlen>:

size_t strlen(const char *str) {
 80490d0:	55                   	push   %ebp
 80490d1:	89 e5                	mov    %esp,%ebp
 80490d3:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 80490d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 80490dd:	eb 04                	jmp    80490e3 <strlen+0x13>
 80490df:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80490e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80490e6:	8d 50 01             	lea    0x1(%eax),%edx
 80490e9:	89 55 08             	mov    %edx,0x8(%ebp)
 80490ec:	0f b6 00             	movzbl (%eax),%eax
 80490ef:	84 c0                	test   %al,%al
 80490f1:	75 ec                	jne    80490df <strlen+0xf>
	return len;
 80490f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80490f6:	c9                   	leave  
 80490f7:	c3                   	ret    

080490f8 <strcpy>:

void strcpy(char *d, const char *s) {
 80490f8:	55                   	push   %ebp
 80490f9:	89 e5                	mov    %esp,%ebp
 80490fb:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 80490fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049101:	89 04 24             	mov    %eax,(%esp)
 8049104:	e8 c7 ff ff ff       	call   80490d0 <strlen>
 8049109:	83 c0 01             	add    $0x1,%eax
 804910c:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049110:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049113:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049117:	8b 45 08             	mov    0x8(%ebp),%eax
 804911a:	89 04 24             	mov    %eax,(%esp)
 804911d:	e8 78 ff ff ff       	call   804909a <memcpy>
}
 8049122:	c9                   	leave  
 8049123:	c3                   	ret    

08049124 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 8049124:	55                   	push   %ebp
 8049125:	89 e5                	mov    %esp,%ebp
 8049127:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 804912a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049131:	eb 0c                	jmp    804913f <strnlen+0x1b>
		n++;
 8049133:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049137:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804913b:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 804913f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049143:	74 0a                	je     804914f <strnlen+0x2b>
 8049145:	8b 45 08             	mov    0x8(%ebp),%eax
 8049148:	0f b6 00             	movzbl (%eax),%eax
 804914b:	84 c0                	test   %al,%al
 804914d:	75 e4                	jne    8049133 <strnlen+0xf>
		n++;
	return n;
 804914f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049152:	c9                   	leave  
 8049153:	c3                   	ret    

08049154 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 8049154:	55                   	push   %ebp
 8049155:	89 e5                	mov    %esp,%ebp
 8049157:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 804915a:	8b 45 08             	mov    0x8(%ebp),%eax
 804915d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 8049160:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049167:	eb 23                	jmp    804918c <strncpy+0x38>
		*dst++ = *src;
 8049169:	8b 45 08             	mov    0x8(%ebp),%eax
 804916c:	8d 50 01             	lea    0x1(%eax),%edx
 804916f:	89 55 08             	mov    %edx,0x8(%ebp)
 8049172:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049175:	0f b6 12             	movzbl (%edx),%edx
 8049178:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 804917a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804917d:	0f b6 00             	movzbl (%eax),%eax
 8049180:	84 c0                	test   %al,%al
 8049182:	74 04                	je     8049188 <strncpy+0x34>
			src++;
 8049184:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 8049188:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804918c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804918f:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049192:	72 d5                	jb     8049169 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 8049194:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 8049197:	c9                   	leave  
 8049198:	c3                   	ret    

08049199 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 8049199:	55                   	push   %ebp
 804919a:	89 e5                	mov    %esp,%ebp
 804919c:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 804919f:	8b 45 08             	mov    0x8(%ebp),%eax
 80491a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 80491a5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491a9:	74 33                	je     80491de <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 80491ab:	eb 17                	jmp    80491c4 <strlcpy+0x2b>
			*dst++ = *src++;
 80491ad:	8b 45 08             	mov    0x8(%ebp),%eax
 80491b0:	8d 50 01             	lea    0x1(%eax),%edx
 80491b3:	89 55 08             	mov    %edx,0x8(%ebp)
 80491b6:	8b 55 0c             	mov    0xc(%ebp),%edx
 80491b9:	8d 4a 01             	lea    0x1(%edx),%ecx
 80491bc:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80491bf:	0f b6 12             	movzbl (%edx),%edx
 80491c2:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 80491c4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 80491c8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491cc:	74 0a                	je     80491d8 <strlcpy+0x3f>
 80491ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491d1:	0f b6 00             	movzbl (%eax),%eax
 80491d4:	84 c0                	test   %al,%al
 80491d6:	75 d5                	jne    80491ad <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 80491d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80491db:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 80491de:	8b 55 08             	mov    0x8(%ebp),%edx
 80491e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80491e4:	29 c2                	sub    %eax,%edx
 80491e6:	89 d0                	mov    %edx,%eax
}
 80491e8:	c9                   	leave  
 80491e9:	c3                   	ret    

080491ea <strcmp>:

int
strcmp(const char *p, const char *q)
{
 80491ea:	55                   	push   %ebp
 80491eb:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 80491ed:	eb 08                	jmp    80491f7 <strcmp+0xd>
		p++, q++;
 80491ef:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80491f3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 80491f7:	8b 45 08             	mov    0x8(%ebp),%eax
 80491fa:	0f b6 00             	movzbl (%eax),%eax
 80491fd:	84 c0                	test   %al,%al
 80491ff:	74 10                	je     8049211 <strcmp+0x27>
 8049201:	8b 45 08             	mov    0x8(%ebp),%eax
 8049204:	0f b6 10             	movzbl (%eax),%edx
 8049207:	8b 45 0c             	mov    0xc(%ebp),%eax
 804920a:	0f b6 00             	movzbl (%eax),%eax
 804920d:	38 c2                	cmp    %al,%dl
 804920f:	74 de                	je     80491ef <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 8049211:	8b 45 08             	mov    0x8(%ebp),%eax
 8049214:	0f b6 00             	movzbl (%eax),%eax
 8049217:	0f b6 d0             	movzbl %al,%edx
 804921a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804921d:	0f b6 00             	movzbl (%eax),%eax
 8049220:	0f b6 c0             	movzbl %al,%eax
 8049223:	29 c2                	sub    %eax,%edx
 8049225:	89 d0                	mov    %edx,%eax
}
 8049227:	5d                   	pop    %ebp
 8049228:	c3                   	ret    

08049229 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 8049229:	55                   	push   %ebp
 804922a:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 804922c:	eb 0c                	jmp    804923a <strncmp+0x11>
		n--, p++, q++;
 804922e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049232:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049236:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 804923a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804923e:	74 1a                	je     804925a <strncmp+0x31>
 8049240:	8b 45 08             	mov    0x8(%ebp),%eax
 8049243:	0f b6 00             	movzbl (%eax),%eax
 8049246:	84 c0                	test   %al,%al
 8049248:	74 10                	je     804925a <strncmp+0x31>
 804924a:	8b 45 08             	mov    0x8(%ebp),%eax
 804924d:	0f b6 10             	movzbl (%eax),%edx
 8049250:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049253:	0f b6 00             	movzbl (%eax),%eax
 8049256:	38 c2                	cmp    %al,%dl
 8049258:	74 d4                	je     804922e <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 804925a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804925e:	75 07                	jne    8049267 <strncmp+0x3e>
		return 0;
 8049260:	b8 00 00 00 00       	mov    $0x0,%eax
 8049265:	eb 16                	jmp    804927d <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 8049267:	8b 45 08             	mov    0x8(%ebp),%eax
 804926a:	0f b6 00             	movzbl (%eax),%eax
 804926d:	0f b6 d0             	movzbl %al,%edx
 8049270:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049273:	0f b6 00             	movzbl (%eax),%eax
 8049276:	0f b6 c0             	movzbl %al,%eax
 8049279:	29 c2                	sub    %eax,%edx
 804927b:	89 d0                	mov    %edx,%eax
}
 804927d:	5d                   	pop    %ebp
 804927e:	c3                   	ret    

0804927f <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 804927f:	55                   	push   %ebp
 8049280:	89 e5                	mov    %esp,%ebp
 8049282:	83 ec 04             	sub    $0x4,%esp
 8049285:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049288:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 804928b:	eb 14                	jmp    80492a1 <strchr+0x22>
		if (*s == c)
 804928d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049290:	0f b6 00             	movzbl (%eax),%eax
 8049293:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049296:	75 05                	jne    804929d <strchr+0x1e>
			return (char *) s;
 8049298:	8b 45 08             	mov    0x8(%ebp),%eax
 804929b:	eb 13                	jmp    80492b0 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 804929d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80492a1:	8b 45 08             	mov    0x8(%ebp),%eax
 80492a4:	0f b6 00             	movzbl (%eax),%eax
 80492a7:	84 c0                	test   %al,%al
 80492a9:	75 e2                	jne    804928d <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 80492ab:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80492b0:	c9                   	leave  
 80492b1:	c3                   	ret    

080492b2 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 80492b2:	55                   	push   %ebp
 80492b3:	89 e5                	mov    %esp,%ebp
 80492b5:	83 ec 04             	sub    $0x4,%esp
 80492b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492bb:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80492be:	eb 11                	jmp    80492d1 <strfind+0x1f>
		if (*s == c)
 80492c0:	8b 45 08             	mov    0x8(%ebp),%eax
 80492c3:	0f b6 00             	movzbl (%eax),%eax
 80492c6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80492c9:	75 02                	jne    80492cd <strfind+0x1b>
			break;
 80492cb:	eb 0e                	jmp    80492db <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 80492cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80492d1:	8b 45 08             	mov    0x8(%ebp),%eax
 80492d4:	0f b6 00             	movzbl (%eax),%eax
 80492d7:	84 c0                	test   %al,%al
 80492d9:	75 e5                	jne    80492c0 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 80492db:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80492de:	c9                   	leave  
 80492df:	c3                   	ret    

080492e0 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 80492e0:	55                   	push   %ebp
 80492e1:	89 e5                	mov    %esp,%ebp
 80492e3:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 80492e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 80492ec:	8b 45 08             	mov    0x8(%ebp),%eax
 80492ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 80492f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492f5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80492f8:	73 3d                	jae    8049337 <memmove+0x57>
 80492fa:	8b 45 10             	mov    0x10(%ebp),%eax
 80492fd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049300:	01 d0                	add    %edx,%eax
 8049302:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049305:	76 30                	jbe    8049337 <memmove+0x57>
		s += n;
 8049307:	8b 45 10             	mov    0x10(%ebp),%eax
 804930a:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 804930d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049310:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 8049313:	eb 13                	jmp    8049328 <memmove+0x48>
			*--d = *--s;
 8049315:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 8049319:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 804931d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049320:	0f b6 10             	movzbl (%eax),%edx
 8049323:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049326:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 8049328:	8b 45 10             	mov    0x10(%ebp),%eax
 804932b:	8d 50 ff             	lea    -0x1(%eax),%edx
 804932e:	89 55 10             	mov    %edx,0x10(%ebp)
 8049331:	85 c0                	test   %eax,%eax
 8049333:	75 e0                	jne    8049315 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 8049335:	eb 26                	jmp    804935d <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049337:	eb 17                	jmp    8049350 <memmove+0x70>
			*d++ = *s++;
 8049339:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804933c:	8d 50 01             	lea    0x1(%eax),%edx
 804933f:	89 55 f8             	mov    %edx,-0x8(%ebp)
 8049342:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049345:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049348:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 804934b:	0f b6 12             	movzbl (%edx),%edx
 804934e:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049350:	8b 45 10             	mov    0x10(%ebp),%eax
 8049353:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049356:	89 55 10             	mov    %edx,0x10(%ebp)
 8049359:	85 c0                	test   %eax,%eax
 804935b:	75 dc                	jne    8049339 <memmove+0x59>
			*d++ = *s++;

	return dst;
 804935d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049360:	c9                   	leave  
 8049361:	c3                   	ret    

08049362 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 8049362:	55                   	push   %ebp
 8049363:	89 e5                	mov    %esp,%ebp
 8049365:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 8049368:	8b 45 08             	mov    0x8(%ebp),%eax
 804936b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 804936e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049371:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 8049374:	eb 30                	jmp    80493a6 <memcmp+0x44>
		if (*s1 != *s2)
 8049376:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049379:	0f b6 10             	movzbl (%eax),%edx
 804937c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804937f:	0f b6 00             	movzbl (%eax),%eax
 8049382:	38 c2                	cmp    %al,%dl
 8049384:	74 18                	je     804939e <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 8049386:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049389:	0f b6 00             	movzbl (%eax),%eax
 804938c:	0f b6 d0             	movzbl %al,%edx
 804938f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049392:	0f b6 00             	movzbl (%eax),%eax
 8049395:	0f b6 c0             	movzbl %al,%eax
 8049398:	29 c2                	sub    %eax,%edx
 804939a:	89 d0                	mov    %edx,%eax
 804939c:	eb 1a                	jmp    80493b8 <memcmp+0x56>
		s1++, s2++;
 804939e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80493a2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 80493a6:	8b 45 10             	mov    0x10(%ebp),%eax
 80493a9:	8d 50 ff             	lea    -0x1(%eax),%edx
 80493ac:	89 55 10             	mov    %edx,0x10(%ebp)
 80493af:	85 c0                	test   %eax,%eax
 80493b1:	75 c3                	jne    8049376 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 80493b3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80493b8:	c9                   	leave  
 80493b9:	c3                   	ret    

080493ba <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 80493ba:	55                   	push   %ebp
 80493bb:	89 e5                	mov    %esp,%ebp
 80493bd:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 80493c0:	8b 45 10             	mov    0x10(%ebp),%eax
 80493c3:	8b 55 08             	mov    0x8(%ebp),%edx
 80493c6:	01 d0                	add    %edx,%eax
 80493c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 80493cb:	eb 13                	jmp    80493e0 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 80493cd:	8b 45 08             	mov    0x8(%ebp),%eax
 80493d0:	0f b6 10             	movzbl (%eax),%edx
 80493d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493d6:	38 c2                	cmp    %al,%dl
 80493d8:	75 02                	jne    80493dc <memfind+0x22>
			break;
 80493da:	eb 0c                	jmp    80493e8 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 80493dc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80493e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80493e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80493e6:	72 e5                	jb     80493cd <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 80493e8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80493eb:	c9                   	leave  
 80493ec:	c3                   	ret    

080493ed <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 80493ed:	55                   	push   %ebp
 80493ee:	89 e5                	mov    %esp,%ebp
 80493f0:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 80493f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 80493fa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049401:	eb 04                	jmp    8049407 <strtol+0x1a>
		s++;
 8049403:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049407:	8b 45 08             	mov    0x8(%ebp),%eax
 804940a:	0f b6 00             	movzbl (%eax),%eax
 804940d:	3c 20                	cmp    $0x20,%al
 804940f:	74 f2                	je     8049403 <strtol+0x16>
 8049411:	8b 45 08             	mov    0x8(%ebp),%eax
 8049414:	0f b6 00             	movzbl (%eax),%eax
 8049417:	3c 09                	cmp    $0x9,%al
 8049419:	74 e8                	je     8049403 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 804941b:	8b 45 08             	mov    0x8(%ebp),%eax
 804941e:	0f b6 00             	movzbl (%eax),%eax
 8049421:	3c 2b                	cmp    $0x2b,%al
 8049423:	75 06                	jne    804942b <strtol+0x3e>
		s++;
 8049425:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049429:	eb 15                	jmp    8049440 <strtol+0x53>
	else if (*s == '-')
 804942b:	8b 45 08             	mov    0x8(%ebp),%eax
 804942e:	0f b6 00             	movzbl (%eax),%eax
 8049431:	3c 2d                	cmp    $0x2d,%al
 8049433:	75 0b                	jne    8049440 <strtol+0x53>
		s++, neg = 1;
 8049435:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049439:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 8049440:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049444:	74 06                	je     804944c <strtol+0x5f>
 8049446:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 804944a:	75 24                	jne    8049470 <strtol+0x83>
 804944c:	8b 45 08             	mov    0x8(%ebp),%eax
 804944f:	0f b6 00             	movzbl (%eax),%eax
 8049452:	3c 30                	cmp    $0x30,%al
 8049454:	75 1a                	jne    8049470 <strtol+0x83>
 8049456:	8b 45 08             	mov    0x8(%ebp),%eax
 8049459:	83 c0 01             	add    $0x1,%eax
 804945c:	0f b6 00             	movzbl (%eax),%eax
 804945f:	3c 78                	cmp    $0x78,%al
 8049461:	75 0d                	jne    8049470 <strtol+0x83>
		s += 2, base = 16;
 8049463:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 8049467:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 804946e:	eb 2a                	jmp    804949a <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 8049470:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049474:	75 17                	jne    804948d <strtol+0xa0>
 8049476:	8b 45 08             	mov    0x8(%ebp),%eax
 8049479:	0f b6 00             	movzbl (%eax),%eax
 804947c:	3c 30                	cmp    $0x30,%al
 804947e:	75 0d                	jne    804948d <strtol+0xa0>
		s++, base = 8;
 8049480:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049484:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 804948b:	eb 0d                	jmp    804949a <strtol+0xad>
	else if (base == 0)
 804948d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049491:	75 07                	jne    804949a <strtol+0xad>
		base = 10;
 8049493:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 804949a:	8b 45 08             	mov    0x8(%ebp),%eax
 804949d:	0f b6 00             	movzbl (%eax),%eax
 80494a0:	3c 2f                	cmp    $0x2f,%al
 80494a2:	7e 1b                	jle    80494bf <strtol+0xd2>
 80494a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80494a7:	0f b6 00             	movzbl (%eax),%eax
 80494aa:	3c 39                	cmp    $0x39,%al
 80494ac:	7f 11                	jg     80494bf <strtol+0xd2>
			dig = *s - '0';
 80494ae:	8b 45 08             	mov    0x8(%ebp),%eax
 80494b1:	0f b6 00             	movzbl (%eax),%eax
 80494b4:	0f be c0             	movsbl %al,%eax
 80494b7:	83 e8 30             	sub    $0x30,%eax
 80494ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80494bd:	eb 48                	jmp    8049507 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 80494bf:	8b 45 08             	mov    0x8(%ebp),%eax
 80494c2:	0f b6 00             	movzbl (%eax),%eax
 80494c5:	3c 60                	cmp    $0x60,%al
 80494c7:	7e 1b                	jle    80494e4 <strtol+0xf7>
 80494c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80494cc:	0f b6 00             	movzbl (%eax),%eax
 80494cf:	3c 7a                	cmp    $0x7a,%al
 80494d1:	7f 11                	jg     80494e4 <strtol+0xf7>
			dig = *s - 'a' + 10;
 80494d3:	8b 45 08             	mov    0x8(%ebp),%eax
 80494d6:	0f b6 00             	movzbl (%eax),%eax
 80494d9:	0f be c0             	movsbl %al,%eax
 80494dc:	83 e8 57             	sub    $0x57,%eax
 80494df:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80494e2:	eb 23                	jmp    8049507 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 80494e4:	8b 45 08             	mov    0x8(%ebp),%eax
 80494e7:	0f b6 00             	movzbl (%eax),%eax
 80494ea:	3c 40                	cmp    $0x40,%al
 80494ec:	7e 3d                	jle    804952b <strtol+0x13e>
 80494ee:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f1:	0f b6 00             	movzbl (%eax),%eax
 80494f4:	3c 5a                	cmp    $0x5a,%al
 80494f6:	7f 33                	jg     804952b <strtol+0x13e>
			dig = *s - 'A' + 10;
 80494f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80494fb:	0f b6 00             	movzbl (%eax),%eax
 80494fe:	0f be c0             	movsbl %al,%eax
 8049501:	83 e8 37             	sub    $0x37,%eax
 8049504:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 8049507:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804950a:	3b 45 10             	cmp    0x10(%ebp),%eax
 804950d:	7c 02                	jl     8049511 <strtol+0x124>
			break;
 804950f:	eb 1a                	jmp    804952b <strtol+0x13e>
		s++, val = (val * base) + dig;
 8049511:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049515:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049518:	0f af 45 10          	imul   0x10(%ebp),%eax
 804951c:	89 c2                	mov    %eax,%edx
 804951e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049521:	01 d0                	add    %edx,%eax
 8049523:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 8049526:	e9 6f ff ff ff       	jmp    804949a <strtol+0xad>

	if (endptr)
 804952b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804952f:	74 08                	je     8049539 <strtol+0x14c>
		*endptr = (char *) s;
 8049531:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049534:	8b 55 08             	mov    0x8(%ebp),%edx
 8049537:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 8049539:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 804953d:	74 07                	je     8049546 <strtol+0x159>
 804953f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049542:	f7 d8                	neg    %eax
 8049544:	eb 03                	jmp    8049549 <strtol+0x15c>
 8049546:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 8049549:	c9                   	leave  
 804954a:	c3                   	ret    

0804954b <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 804954b:	55                   	push   %ebp
 804954c:	89 e5                	mov    %esp,%ebp
 804954e:	53                   	push   %ebx
 804954f:	83 ec 34             	sub    $0x34,%esp
 8049552:	8b 45 10             	mov    0x10(%ebp),%eax
 8049555:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049558:	8b 45 14             	mov    0x14(%ebp),%eax
 804955b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 804955e:	8b 45 18             	mov    0x18(%ebp),%eax
 8049561:	ba 00 00 00 00       	mov    $0x0,%edx
 8049566:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 8049569:	77 72                	ja     80495dd <printnum+0x92>
 804956b:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 804956e:	72 05                	jb     8049575 <printnum+0x2a>
 8049570:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049573:	77 68                	ja     80495dd <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 8049575:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049578:	8d 58 ff             	lea    -0x1(%eax),%ebx
 804957b:	8b 45 18             	mov    0x18(%ebp),%eax
 804957e:	ba 00 00 00 00       	mov    $0x0,%edx
 8049583:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049587:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804958b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804958e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049591:	89 04 24             	mov    %eax,(%esp)
 8049594:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049598:	e8 53 06 00 00       	call   8049bf0 <__udivdi3>
 804959d:	8b 4d 20             	mov    0x20(%ebp),%ecx
 80495a0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 80495a4:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 80495a8:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80495ab:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 80495af:	89 44 24 08          	mov    %eax,0x8(%esp)
 80495b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80495b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495be:	8b 45 08             	mov    0x8(%ebp),%eax
 80495c1:	89 04 24             	mov    %eax,(%esp)
 80495c4:	e8 82 ff ff ff       	call   804954b <printnum>
 80495c9:	eb 1c                	jmp    80495e7 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 80495cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495d2:	8b 45 20             	mov    0x20(%ebp),%eax
 80495d5:	89 04 24             	mov    %eax,(%esp)
 80495d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80495db:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 80495dd:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 80495e1:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 80495e5:	7f e4                	jg     80495cb <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 80495e7:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80495ea:	bb 00 00 00 00       	mov    $0x0,%ebx
 80495ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80495f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80495f5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80495f9:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 80495fd:	89 04 24             	mov    %eax,(%esp)
 8049600:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049604:	e8 17 07 00 00       	call   8049d20 <__umoddi3>
 8049609:	05 94 a0 04 08       	add    $0x804a094,%eax
 804960e:	0f b6 00             	movzbl (%eax),%eax
 8049611:	0f be c0             	movsbl %al,%eax
 8049614:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049617:	89 54 24 04          	mov    %edx,0x4(%esp)
 804961b:	89 04 24             	mov    %eax,(%esp)
 804961e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049621:	ff d0                	call   *%eax
}
 8049623:	83 c4 34             	add    $0x34,%esp
 8049626:	5b                   	pop    %ebx
 8049627:	5d                   	pop    %ebp
 8049628:	c3                   	ret    

08049629 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 8049629:	55                   	push   %ebp
 804962a:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 804962c:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 8049630:	7e 14                	jle    8049646 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 8049632:	8b 45 08             	mov    0x8(%ebp),%eax
 8049635:	8b 00                	mov    (%eax),%eax
 8049637:	8d 48 08             	lea    0x8(%eax),%ecx
 804963a:	8b 55 08             	mov    0x8(%ebp),%edx
 804963d:	89 0a                	mov    %ecx,(%edx)
 804963f:	8b 50 04             	mov    0x4(%eax),%edx
 8049642:	8b 00                	mov    (%eax),%eax
 8049644:	eb 30                	jmp    8049676 <getuint+0x4d>
	else if (lflag)
 8049646:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804964a:	74 16                	je     8049662 <getuint+0x39>
		return va_arg(*ap, unsigned long);
 804964c:	8b 45 08             	mov    0x8(%ebp),%eax
 804964f:	8b 00                	mov    (%eax),%eax
 8049651:	8d 48 04             	lea    0x4(%eax),%ecx
 8049654:	8b 55 08             	mov    0x8(%ebp),%edx
 8049657:	89 0a                	mov    %ecx,(%edx)
 8049659:	8b 00                	mov    (%eax),%eax
 804965b:	ba 00 00 00 00       	mov    $0x0,%edx
 8049660:	eb 14                	jmp    8049676 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 8049662:	8b 45 08             	mov    0x8(%ebp),%eax
 8049665:	8b 00                	mov    (%eax),%eax
 8049667:	8d 48 04             	lea    0x4(%eax),%ecx
 804966a:	8b 55 08             	mov    0x8(%ebp),%edx
 804966d:	89 0a                	mov    %ecx,(%edx)
 804966f:	8b 00                	mov    (%eax),%eax
 8049671:	ba 00 00 00 00       	mov    $0x0,%edx
}
 8049676:	5d                   	pop    %ebp
 8049677:	c3                   	ret    

08049678 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 8049678:	55                   	push   %ebp
 8049679:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 804967b:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 804967f:	7e 14                	jle    8049695 <getint+0x1d>
		return va_arg(*ap, long long);
 8049681:	8b 45 08             	mov    0x8(%ebp),%eax
 8049684:	8b 00                	mov    (%eax),%eax
 8049686:	8d 48 08             	lea    0x8(%eax),%ecx
 8049689:	8b 55 08             	mov    0x8(%ebp),%edx
 804968c:	89 0a                	mov    %ecx,(%edx)
 804968e:	8b 50 04             	mov    0x4(%eax),%edx
 8049691:	8b 00                	mov    (%eax),%eax
 8049693:	eb 28                	jmp    80496bd <getint+0x45>
	else if (lflag)
 8049695:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049699:	74 12                	je     80496ad <getint+0x35>
		return va_arg(*ap, long);
 804969b:	8b 45 08             	mov    0x8(%ebp),%eax
 804969e:	8b 00                	mov    (%eax),%eax
 80496a0:	8d 48 04             	lea    0x4(%eax),%ecx
 80496a3:	8b 55 08             	mov    0x8(%ebp),%edx
 80496a6:	89 0a                	mov    %ecx,(%edx)
 80496a8:	8b 00                	mov    (%eax),%eax
 80496aa:	99                   	cltd   
 80496ab:	eb 10                	jmp    80496bd <getint+0x45>
	else
		return va_arg(*ap, int);
 80496ad:	8b 45 08             	mov    0x8(%ebp),%eax
 80496b0:	8b 00                	mov    (%eax),%eax
 80496b2:	8d 48 04             	lea    0x4(%eax),%ecx
 80496b5:	8b 55 08             	mov    0x8(%ebp),%edx
 80496b8:	89 0a                	mov    %ecx,(%edx)
 80496ba:	8b 00                	mov    (%eax),%eax
 80496bc:	99                   	cltd   
}
 80496bd:	5d                   	pop    %ebp
 80496be:	c3                   	ret    

080496bf <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 80496bf:	55                   	push   %ebp
 80496c0:	89 e5                	mov    %esp,%ebp
 80496c2:	56                   	push   %esi
 80496c3:	53                   	push   %ebx
 80496c4:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 80496c7:	eb 18                	jmp    80496e1 <vprintfmt+0x22>
			if (ch == '\0')
 80496c9:	85 db                	test   %ebx,%ebx
 80496cb:	75 05                	jne    80496d2 <vprintfmt+0x13>
				return;
 80496cd:	e9 e9 03 00 00       	jmp    8049abb <vprintfmt+0x3fc>
			putch(ch, putdat);
 80496d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80496d9:	89 1c 24             	mov    %ebx,(%esp)
 80496dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80496df:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 80496e1:	8b 45 10             	mov    0x10(%ebp),%eax
 80496e4:	8d 50 01             	lea    0x1(%eax),%edx
 80496e7:	89 55 10             	mov    %edx,0x10(%ebp)
 80496ea:	0f b6 00             	movzbl (%eax),%eax
 80496ed:	0f b6 d8             	movzbl %al,%ebx
 80496f0:	83 fb 25             	cmp    $0x25,%ebx
 80496f3:	75 d4                	jne    80496c9 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 80496f5:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 80496f9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 8049700:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 8049707:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 804970e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 8049715:	8b 45 10             	mov    0x10(%ebp),%eax
 8049718:	8d 50 01             	lea    0x1(%eax),%edx
 804971b:	89 55 10             	mov    %edx,0x10(%ebp)
 804971e:	0f b6 00             	movzbl (%eax),%eax
 8049721:	0f b6 d8             	movzbl %al,%ebx
 8049724:	8d 43 dd             	lea    -0x23(%ebx),%eax
 8049727:	83 f8 55             	cmp    $0x55,%eax
 804972a:	0f 87 5a 03 00 00    	ja     8049a8a <vprintfmt+0x3cb>
 8049730:	8b 04 85 b8 a0 04 08 	mov    0x804a0b8(,%eax,4),%eax
 8049737:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 8049739:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 804973d:	eb d6                	jmp    8049715 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 804973f:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 8049743:	eb d0                	jmp    8049715 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049745:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 804974c:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804974f:	89 d0                	mov    %edx,%eax
 8049751:	c1 e0 02             	shl    $0x2,%eax
 8049754:	01 d0                	add    %edx,%eax
 8049756:	01 c0                	add    %eax,%eax
 8049758:	01 d8                	add    %ebx,%eax
 804975a:	83 e8 30             	sub    $0x30,%eax
 804975d:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 8049760:	8b 45 10             	mov    0x10(%ebp),%eax
 8049763:	0f b6 00             	movzbl (%eax),%eax
 8049766:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 8049769:	83 fb 2f             	cmp    $0x2f,%ebx
 804976c:	7e 0b                	jle    8049779 <vprintfmt+0xba>
 804976e:	83 fb 39             	cmp    $0x39,%ebx
 8049771:	7f 06                	jg     8049779 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049773:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 8049777:	eb d3                	jmp    804974c <vprintfmt+0x8d>
			goto process_precision;
 8049779:	eb 33                	jmp    80497ae <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 804977b:	8b 45 14             	mov    0x14(%ebp),%eax
 804977e:	8d 50 04             	lea    0x4(%eax),%edx
 8049781:	89 55 14             	mov    %edx,0x14(%ebp)
 8049784:	8b 00                	mov    (%eax),%eax
 8049786:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 8049789:	eb 23                	jmp    80497ae <vprintfmt+0xef>

		case '.':
			if (width < 0)
 804978b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804978f:	79 0c                	jns    804979d <vprintfmt+0xde>
				width = 0;
 8049791:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 8049798:	e9 78 ff ff ff       	jmp    8049715 <vprintfmt+0x56>
 804979d:	e9 73 ff ff ff       	jmp    8049715 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 80497a2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 80497a9:	e9 67 ff ff ff       	jmp    8049715 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 80497ae:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80497b2:	79 12                	jns    80497c6 <vprintfmt+0x107>
				width = precision, precision = -1;
 80497b4:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80497b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80497ba:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 80497c1:	e9 4f ff ff ff       	jmp    8049715 <vprintfmt+0x56>
 80497c6:	e9 4a ff ff ff       	jmp    8049715 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 80497cb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 80497cf:	e9 41 ff ff ff       	jmp    8049715 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 80497d4:	8b 45 14             	mov    0x14(%ebp),%eax
 80497d7:	8d 50 04             	lea    0x4(%eax),%edx
 80497da:	89 55 14             	mov    %edx,0x14(%ebp)
 80497dd:	8b 00                	mov    (%eax),%eax
 80497df:	8b 55 0c             	mov    0xc(%ebp),%edx
 80497e2:	89 54 24 04          	mov    %edx,0x4(%esp)
 80497e6:	89 04 24             	mov    %eax,(%esp)
 80497e9:	8b 45 08             	mov    0x8(%ebp),%eax
 80497ec:	ff d0                	call   *%eax
			break;
 80497ee:	e9 c2 02 00 00       	jmp    8049ab5 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 80497f3:	8b 45 14             	mov    0x14(%ebp),%eax
 80497f6:	8d 50 04             	lea    0x4(%eax),%edx
 80497f9:	89 55 14             	mov    %edx,0x14(%ebp)
 80497fc:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 80497fe:	85 db                	test   %ebx,%ebx
 8049800:	79 02                	jns    8049804 <vprintfmt+0x145>
				err = -err;
 8049802:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049804:	83 fb 06             	cmp    $0x6,%ebx
 8049807:	7f 0b                	jg     8049814 <vprintfmt+0x155>
 8049809:	8b 34 9d 78 a0 04 08 	mov    0x804a078(,%ebx,4),%esi
 8049810:	85 f6                	test   %esi,%esi
 8049812:	75 23                	jne    8049837 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 8049814:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049818:	c7 44 24 08 a5 a0 04 	movl   $0x804a0a5,0x8(%esp)
 804981f:	08 
 8049820:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049823:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049827:	8b 45 08             	mov    0x8(%ebp),%eax
 804982a:	89 04 24             	mov    %eax,(%esp)
 804982d:	e8 90 02 00 00       	call   8049ac2 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 8049832:	e9 7e 02 00 00       	jmp    8049ab5 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 8049837:	89 74 24 0c          	mov    %esi,0xc(%esp)
 804983b:	c7 44 24 08 ae a0 04 	movl   $0x804a0ae,0x8(%esp)
 8049842:	08 
 8049843:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049846:	89 44 24 04          	mov    %eax,0x4(%esp)
 804984a:	8b 45 08             	mov    0x8(%ebp),%eax
 804984d:	89 04 24             	mov    %eax,(%esp)
 8049850:	e8 6d 02 00 00       	call   8049ac2 <printfmt>
			break;
 8049855:	e9 5b 02 00 00       	jmp    8049ab5 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 804985a:	8b 45 14             	mov    0x14(%ebp),%eax
 804985d:	8d 50 04             	lea    0x4(%eax),%edx
 8049860:	89 55 14             	mov    %edx,0x14(%ebp)
 8049863:	8b 30                	mov    (%eax),%esi
 8049865:	85 f6                	test   %esi,%esi
 8049867:	75 05                	jne    804986e <vprintfmt+0x1af>
				p = "(null)";
 8049869:	be b1 a0 04 08       	mov    $0x804a0b1,%esi
			if (width > 0 && padc != '-')
 804986e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049872:	7e 37                	jle    80498ab <vprintfmt+0x1ec>
 8049874:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 8049878:	74 31                	je     80498ab <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 804987a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804987d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049881:	89 34 24             	mov    %esi,(%esp)
 8049884:	e8 9b f8 ff ff       	call   8049124 <strnlen>
 8049889:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 804988c:	eb 17                	jmp    80498a5 <vprintfmt+0x1e6>
					putch(padc, putdat);
 804988e:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 8049892:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049895:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049899:	89 04 24             	mov    %eax,(%esp)
 804989c:	8b 45 08             	mov    0x8(%ebp),%eax
 804989f:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 80498a1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80498a5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80498a9:	7f e3                	jg     804988e <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 80498ab:	eb 38                	jmp    80498e5 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 80498ad:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 80498b1:	74 1f                	je     80498d2 <vprintfmt+0x213>
 80498b3:	83 fb 1f             	cmp    $0x1f,%ebx
 80498b6:	7e 05                	jle    80498bd <vprintfmt+0x1fe>
 80498b8:	83 fb 7e             	cmp    $0x7e,%ebx
 80498bb:	7e 15                	jle    80498d2 <vprintfmt+0x213>
					putch('?', putdat);
 80498bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498c4:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 80498cb:	8b 45 08             	mov    0x8(%ebp),%eax
 80498ce:	ff d0                	call   *%eax
 80498d0:	eb 0f                	jmp    80498e1 <vprintfmt+0x222>
				else
					putch(ch, putdat);
 80498d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498d9:	89 1c 24             	mov    %ebx,(%esp)
 80498dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80498df:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 80498e1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80498e5:	89 f0                	mov    %esi,%eax
 80498e7:	8d 70 01             	lea    0x1(%eax),%esi
 80498ea:	0f b6 00             	movzbl (%eax),%eax
 80498ed:	0f be d8             	movsbl %al,%ebx
 80498f0:	85 db                	test   %ebx,%ebx
 80498f2:	74 10                	je     8049904 <vprintfmt+0x245>
 80498f4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 80498f8:	78 b3                	js     80498ad <vprintfmt+0x1ee>
 80498fa:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 80498fe:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049902:	79 a9                	jns    80498ad <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049904:	eb 17                	jmp    804991d <vprintfmt+0x25e>
				putch(' ', putdat);
 8049906:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049909:	89 44 24 04          	mov    %eax,0x4(%esp)
 804990d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049914:	8b 45 08             	mov    0x8(%ebp),%eax
 8049917:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049919:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 804991d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049921:	7f e3                	jg     8049906 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 8049923:	e9 8d 01 00 00       	jmp    8049ab5 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 8049928:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804992b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804992f:	8d 45 14             	lea    0x14(%ebp),%eax
 8049932:	89 04 24             	mov    %eax,(%esp)
 8049935:	e8 3e fd ff ff       	call   8049678 <getint>
 804993a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804993d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 8049940:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049943:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049946:	85 d2                	test   %edx,%edx
 8049948:	79 26                	jns    8049970 <vprintfmt+0x2b1>
				putch('-', putdat);
 804994a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804994d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049951:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 8049958:	8b 45 08             	mov    0x8(%ebp),%eax
 804995b:	ff d0                	call   *%eax
				num = -(long long) num;
 804995d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049960:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049963:	f7 d8                	neg    %eax
 8049965:	83 d2 00             	adc    $0x0,%edx
 8049968:	f7 da                	neg    %edx
 804996a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804996d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049970:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049977:	e9 c5 00 00 00       	jmp    8049a41 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 804997c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804997f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049983:	8d 45 14             	lea    0x14(%ebp),%eax
 8049986:	89 04 24             	mov    %eax,(%esp)
 8049989:	e8 9b fc ff ff       	call   8049629 <getuint>
 804998e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049991:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049994:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 804999b:	e9 a1 00 00 00       	jmp    8049a41 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 80499a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499a7:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 80499ae:	8b 45 08             	mov    0x8(%ebp),%eax
 80499b1:	ff d0                	call   *%eax
			putch('X', putdat);
 80499b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499ba:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 80499c1:	8b 45 08             	mov    0x8(%ebp),%eax
 80499c4:	ff d0                	call   *%eax
			putch('X', putdat);
 80499c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499cd:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 80499d4:	8b 45 08             	mov    0x8(%ebp),%eax
 80499d7:	ff d0                	call   *%eax
			break;
 80499d9:	e9 d7 00 00 00       	jmp    8049ab5 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 80499de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499e5:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 80499ec:	8b 45 08             	mov    0x8(%ebp),%eax
 80499ef:	ff d0                	call   *%eax
			putch('x', putdat);
 80499f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499f8:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 80499ff:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a02:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049a04:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a07:	8d 50 04             	lea    0x4(%eax),%edx
 8049a0a:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a0d:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049a0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049a19:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049a20:	eb 1f                	jmp    8049a41 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049a22:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049a25:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a29:	8d 45 14             	lea    0x14(%ebp),%eax
 8049a2c:	89 04 24             	mov    %eax,(%esp)
 8049a2f:	e8 f5 fb ff ff       	call   8049629 <getuint>
 8049a34:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a37:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049a3a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049a41:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049a45:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049a48:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049a4c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049a4f:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049a53:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049a57:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049a5a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049a5d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049a61:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049a65:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a68:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a6c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a6f:	89 04 24             	mov    %eax,(%esp)
 8049a72:	e8 d4 fa ff ff       	call   804954b <printnum>
			break;
 8049a77:	eb 3c                	jmp    8049ab5 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049a79:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a7c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a80:	89 1c 24             	mov    %ebx,(%esp)
 8049a83:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a86:	ff d0                	call   *%eax
			break;
 8049a88:	eb 2b                	jmp    8049ab5 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049a8a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a8d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a91:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049a98:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a9b:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049a9d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049aa1:	eb 04                	jmp    8049aa7 <vprintfmt+0x3e8>
 8049aa3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049aa7:	8b 45 10             	mov    0x10(%ebp),%eax
 8049aaa:	83 e8 01             	sub    $0x1,%eax
 8049aad:	0f b6 00             	movzbl (%eax),%eax
 8049ab0:	3c 25                	cmp    $0x25,%al
 8049ab2:	75 ef                	jne    8049aa3 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049ab4:	90                   	nop
		}
	}
 8049ab5:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049ab6:	e9 26 fc ff ff       	jmp    80496e1 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049abb:	83 c4 40             	add    $0x40,%esp
 8049abe:	5b                   	pop    %ebx
 8049abf:	5e                   	pop    %esi
 8049ac0:	5d                   	pop    %ebp
 8049ac1:	c3                   	ret    

08049ac2 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049ac2:	55                   	push   %ebp
 8049ac3:	89 e5                	mov    %esp,%ebp
 8049ac5:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049ac8:	8d 45 14             	lea    0x14(%ebp),%eax
 8049acb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ad1:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049ad5:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ad8:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049adc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049adf:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ae3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ae6:	89 04 24             	mov    %eax,(%esp)
 8049ae9:	e8 d1 fb ff ff       	call   80496bf <vprintfmt>
	va_end(ap);
}
 8049aee:	c9                   	leave  
 8049aef:	c3                   	ret    

08049af0 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049af0:	55                   	push   %ebp
 8049af1:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049af3:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049af6:	8b 40 08             	mov    0x8(%eax),%eax
 8049af9:	8d 50 01             	lea    0x1(%eax),%edx
 8049afc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049aff:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049b02:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b05:	8b 10                	mov    (%eax),%edx
 8049b07:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b0a:	8b 40 04             	mov    0x4(%eax),%eax
 8049b0d:	39 c2                	cmp    %eax,%edx
 8049b0f:	73 12                	jae    8049b23 <sprintputch+0x33>
		*b->buf++ = ch;
 8049b11:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b14:	8b 00                	mov    (%eax),%eax
 8049b16:	8d 48 01             	lea    0x1(%eax),%ecx
 8049b19:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049b1c:	89 0a                	mov    %ecx,(%edx)
 8049b1e:	8b 55 08             	mov    0x8(%ebp),%edx
 8049b21:	88 10                	mov    %dl,(%eax)
}
 8049b23:	5d                   	pop    %ebp
 8049b24:	c3                   	ret    

08049b25 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049b25:	55                   	push   %ebp
 8049b26:	89 e5                	mov    %esp,%ebp
 8049b28:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049b2b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049b31:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b34:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049b37:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b3a:	01 d0                	add    %edx,%eax
 8049b3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049b46:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049b4a:	74 06                	je     8049b52 <vsnprintf+0x2d>
 8049b4c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049b50:	7f 07                	jg     8049b59 <vsnprintf+0x34>
		return -E_INVAL;
 8049b52:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049b57:	eb 2a                	jmp    8049b83 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049b59:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b5c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b60:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b63:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b67:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b6e:	c7 04 24 f0 9a 04 08 	movl   $0x8049af0,(%esp)
 8049b75:	e8 45 fb ff ff       	call   80496bf <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049b7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b7d:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049b80:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049b83:	c9                   	leave  
 8049b84:	c3                   	ret    

08049b85 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049b85:	55                   	push   %ebp
 8049b86:	89 e5                	mov    %esp,%ebp
 8049b88:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049b8b:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b94:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b98:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b9b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b9f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ba9:	89 04 24             	mov    %eax,(%esp)
 8049bac:	e8 74 ff ff ff       	call   8049b25 <vsnprintf>
 8049bb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049bb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049bb7:	c9                   	leave  
 8049bb8:	c3                   	ret    

08049bb9 <srand>:
static int seed = 0;

void
srand(int s) {
 8049bb9:	55                   	push   %ebp
 8049bba:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049bbc:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bbf:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049bc4:	5d                   	pop    %ebp
 8049bc5:	c3                   	ret    

08049bc6 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049bc6:	55                   	push   %ebp
 8049bc7:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049bc9:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049bce:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049bd4:	83 c0 01             	add    $0x1,%eax
 8049bd7:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049bdc:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049be1:	c1 f8 10             	sar    $0x10,%eax
 8049be4:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049be9:	5d                   	pop    %ebp
 8049bea:	c3                   	ret    
 8049beb:	66 90                	xchg   %ax,%ax
 8049bed:	66 90                	xchg   %ax,%ax
 8049bef:	90                   	nop

08049bf0 <__udivdi3>:
 8049bf0:	55                   	push   %ebp
 8049bf1:	57                   	push   %edi
 8049bf2:	56                   	push   %esi
 8049bf3:	83 ec 0c             	sub    $0xc,%esp
 8049bf6:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049bfa:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049bfe:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049c02:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049c06:	85 c0                	test   %eax,%eax
 8049c08:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049c0c:	89 ea                	mov    %ebp,%edx
 8049c0e:	89 0c 24             	mov    %ecx,(%esp)
 8049c11:	75 2d                	jne    8049c40 <__udivdi3+0x50>
 8049c13:	39 e9                	cmp    %ebp,%ecx
 8049c15:	77 61                	ja     8049c78 <__udivdi3+0x88>
 8049c17:	85 c9                	test   %ecx,%ecx
 8049c19:	89 ce                	mov    %ecx,%esi
 8049c1b:	75 0b                	jne    8049c28 <__udivdi3+0x38>
 8049c1d:	b8 01 00 00 00       	mov    $0x1,%eax
 8049c22:	31 d2                	xor    %edx,%edx
 8049c24:	f7 f1                	div    %ecx
 8049c26:	89 c6                	mov    %eax,%esi
 8049c28:	31 d2                	xor    %edx,%edx
 8049c2a:	89 e8                	mov    %ebp,%eax
 8049c2c:	f7 f6                	div    %esi
 8049c2e:	89 c5                	mov    %eax,%ebp
 8049c30:	89 f8                	mov    %edi,%eax
 8049c32:	f7 f6                	div    %esi
 8049c34:	89 ea                	mov    %ebp,%edx
 8049c36:	83 c4 0c             	add    $0xc,%esp
 8049c39:	5e                   	pop    %esi
 8049c3a:	5f                   	pop    %edi
 8049c3b:	5d                   	pop    %ebp
 8049c3c:	c3                   	ret    
 8049c3d:	8d 76 00             	lea    0x0(%esi),%esi
 8049c40:	39 e8                	cmp    %ebp,%eax
 8049c42:	77 24                	ja     8049c68 <__udivdi3+0x78>
 8049c44:	0f bd e8             	bsr    %eax,%ebp
 8049c47:	83 f5 1f             	xor    $0x1f,%ebp
 8049c4a:	75 3c                	jne    8049c88 <__udivdi3+0x98>
 8049c4c:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049c50:	39 34 24             	cmp    %esi,(%esp)
 8049c53:	0f 86 9f 00 00 00    	jbe    8049cf8 <__udivdi3+0x108>
 8049c59:	39 d0                	cmp    %edx,%eax
 8049c5b:	0f 82 97 00 00 00    	jb     8049cf8 <__udivdi3+0x108>
 8049c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049c68:	31 d2                	xor    %edx,%edx
 8049c6a:	31 c0                	xor    %eax,%eax
 8049c6c:	83 c4 0c             	add    $0xc,%esp
 8049c6f:	5e                   	pop    %esi
 8049c70:	5f                   	pop    %edi
 8049c71:	5d                   	pop    %ebp
 8049c72:	c3                   	ret    
 8049c73:	90                   	nop
 8049c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049c78:	89 f8                	mov    %edi,%eax
 8049c7a:	f7 f1                	div    %ecx
 8049c7c:	31 d2                	xor    %edx,%edx
 8049c7e:	83 c4 0c             	add    $0xc,%esp
 8049c81:	5e                   	pop    %esi
 8049c82:	5f                   	pop    %edi
 8049c83:	5d                   	pop    %ebp
 8049c84:	c3                   	ret    
 8049c85:	8d 76 00             	lea    0x0(%esi),%esi
 8049c88:	89 e9                	mov    %ebp,%ecx
 8049c8a:	8b 3c 24             	mov    (%esp),%edi
 8049c8d:	d3 e0                	shl    %cl,%eax
 8049c8f:	89 c6                	mov    %eax,%esi
 8049c91:	b8 20 00 00 00       	mov    $0x20,%eax
 8049c96:	29 e8                	sub    %ebp,%eax
 8049c98:	89 c1                	mov    %eax,%ecx
 8049c9a:	d3 ef                	shr    %cl,%edi
 8049c9c:	89 e9                	mov    %ebp,%ecx
 8049c9e:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049ca2:	8b 3c 24             	mov    (%esp),%edi
 8049ca5:	09 74 24 08          	or     %esi,0x8(%esp)
 8049ca9:	89 d6                	mov    %edx,%esi
 8049cab:	d3 e7                	shl    %cl,%edi
 8049cad:	89 c1                	mov    %eax,%ecx
 8049caf:	89 3c 24             	mov    %edi,(%esp)
 8049cb2:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049cb6:	d3 ee                	shr    %cl,%esi
 8049cb8:	89 e9                	mov    %ebp,%ecx
 8049cba:	d3 e2                	shl    %cl,%edx
 8049cbc:	89 c1                	mov    %eax,%ecx
 8049cbe:	d3 ef                	shr    %cl,%edi
 8049cc0:	09 d7                	or     %edx,%edi
 8049cc2:	89 f2                	mov    %esi,%edx
 8049cc4:	89 f8                	mov    %edi,%eax
 8049cc6:	f7 74 24 08          	divl   0x8(%esp)
 8049cca:	89 d6                	mov    %edx,%esi
 8049ccc:	89 c7                	mov    %eax,%edi
 8049cce:	f7 24 24             	mull   (%esp)
 8049cd1:	39 d6                	cmp    %edx,%esi
 8049cd3:	89 14 24             	mov    %edx,(%esp)
 8049cd6:	72 30                	jb     8049d08 <__udivdi3+0x118>
 8049cd8:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049cdc:	89 e9                	mov    %ebp,%ecx
 8049cde:	d3 e2                	shl    %cl,%edx
 8049ce0:	39 c2                	cmp    %eax,%edx
 8049ce2:	73 05                	jae    8049ce9 <__udivdi3+0xf9>
 8049ce4:	3b 34 24             	cmp    (%esp),%esi
 8049ce7:	74 1f                	je     8049d08 <__udivdi3+0x118>
 8049ce9:	89 f8                	mov    %edi,%eax
 8049ceb:	31 d2                	xor    %edx,%edx
 8049ced:	e9 7a ff ff ff       	jmp    8049c6c <__udivdi3+0x7c>
 8049cf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049cf8:	31 d2                	xor    %edx,%edx
 8049cfa:	b8 01 00 00 00       	mov    $0x1,%eax
 8049cff:	e9 68 ff ff ff       	jmp    8049c6c <__udivdi3+0x7c>
 8049d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049d08:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049d0b:	31 d2                	xor    %edx,%edx
 8049d0d:	83 c4 0c             	add    $0xc,%esp
 8049d10:	5e                   	pop    %esi
 8049d11:	5f                   	pop    %edi
 8049d12:	5d                   	pop    %ebp
 8049d13:	c3                   	ret    
 8049d14:	66 90                	xchg   %ax,%ax
 8049d16:	66 90                	xchg   %ax,%ax
 8049d18:	66 90                	xchg   %ax,%ax
 8049d1a:	66 90                	xchg   %ax,%ax
 8049d1c:	66 90                	xchg   %ax,%ax
 8049d1e:	66 90                	xchg   %ax,%ax

08049d20 <__umoddi3>:
 8049d20:	55                   	push   %ebp
 8049d21:	57                   	push   %edi
 8049d22:	56                   	push   %esi
 8049d23:	83 ec 14             	sub    $0x14,%esp
 8049d26:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049d2a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049d2e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049d32:	89 c7                	mov    %eax,%edi
 8049d34:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d38:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049d3c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049d40:	89 34 24             	mov    %esi,(%esp)
 8049d43:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049d47:	85 c0                	test   %eax,%eax
 8049d49:	89 c2                	mov    %eax,%edx
 8049d4b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049d4f:	75 17                	jne    8049d68 <__umoddi3+0x48>
 8049d51:	39 fe                	cmp    %edi,%esi
 8049d53:	76 4b                	jbe    8049da0 <__umoddi3+0x80>
 8049d55:	89 c8                	mov    %ecx,%eax
 8049d57:	89 fa                	mov    %edi,%edx
 8049d59:	f7 f6                	div    %esi
 8049d5b:	89 d0                	mov    %edx,%eax
 8049d5d:	31 d2                	xor    %edx,%edx
 8049d5f:	83 c4 14             	add    $0x14,%esp
 8049d62:	5e                   	pop    %esi
 8049d63:	5f                   	pop    %edi
 8049d64:	5d                   	pop    %ebp
 8049d65:	c3                   	ret    
 8049d66:	66 90                	xchg   %ax,%ax
 8049d68:	39 f8                	cmp    %edi,%eax
 8049d6a:	77 54                	ja     8049dc0 <__umoddi3+0xa0>
 8049d6c:	0f bd e8             	bsr    %eax,%ebp
 8049d6f:	83 f5 1f             	xor    $0x1f,%ebp
 8049d72:	75 5c                	jne    8049dd0 <__umoddi3+0xb0>
 8049d74:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049d78:	39 3c 24             	cmp    %edi,(%esp)
 8049d7b:	0f 87 e7 00 00 00    	ja     8049e68 <__umoddi3+0x148>
 8049d81:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049d85:	29 f1                	sub    %esi,%ecx
 8049d87:	19 c7                	sbb    %eax,%edi
 8049d89:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049d8d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049d91:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049d95:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049d99:	83 c4 14             	add    $0x14,%esp
 8049d9c:	5e                   	pop    %esi
 8049d9d:	5f                   	pop    %edi
 8049d9e:	5d                   	pop    %ebp
 8049d9f:	c3                   	ret    
 8049da0:	85 f6                	test   %esi,%esi
 8049da2:	89 f5                	mov    %esi,%ebp
 8049da4:	75 0b                	jne    8049db1 <__umoddi3+0x91>
 8049da6:	b8 01 00 00 00       	mov    $0x1,%eax
 8049dab:	31 d2                	xor    %edx,%edx
 8049dad:	f7 f6                	div    %esi
 8049daf:	89 c5                	mov    %eax,%ebp
 8049db1:	8b 44 24 04          	mov    0x4(%esp),%eax
 8049db5:	31 d2                	xor    %edx,%edx
 8049db7:	f7 f5                	div    %ebp
 8049db9:	89 c8                	mov    %ecx,%eax
 8049dbb:	f7 f5                	div    %ebp
 8049dbd:	eb 9c                	jmp    8049d5b <__umoddi3+0x3b>
 8049dbf:	90                   	nop
 8049dc0:	89 c8                	mov    %ecx,%eax
 8049dc2:	89 fa                	mov    %edi,%edx
 8049dc4:	83 c4 14             	add    $0x14,%esp
 8049dc7:	5e                   	pop    %esi
 8049dc8:	5f                   	pop    %edi
 8049dc9:	5d                   	pop    %ebp
 8049dca:	c3                   	ret    
 8049dcb:	90                   	nop
 8049dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049dd0:	8b 04 24             	mov    (%esp),%eax
 8049dd3:	be 20 00 00 00       	mov    $0x20,%esi
 8049dd8:	89 e9                	mov    %ebp,%ecx
 8049dda:	29 ee                	sub    %ebp,%esi
 8049ddc:	d3 e2                	shl    %cl,%edx
 8049dde:	89 f1                	mov    %esi,%ecx
 8049de0:	d3 e8                	shr    %cl,%eax
 8049de2:	89 e9                	mov    %ebp,%ecx
 8049de4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049de8:	8b 04 24             	mov    (%esp),%eax
 8049deb:	09 54 24 04          	or     %edx,0x4(%esp)
 8049def:	89 fa                	mov    %edi,%edx
 8049df1:	d3 e0                	shl    %cl,%eax
 8049df3:	89 f1                	mov    %esi,%ecx
 8049df5:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049df9:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049dfd:	d3 ea                	shr    %cl,%edx
 8049dff:	89 e9                	mov    %ebp,%ecx
 8049e01:	d3 e7                	shl    %cl,%edi
 8049e03:	89 f1                	mov    %esi,%ecx
 8049e05:	d3 e8                	shr    %cl,%eax
 8049e07:	89 e9                	mov    %ebp,%ecx
 8049e09:	09 f8                	or     %edi,%eax
 8049e0b:	8b 7c 24 10          	mov    0x10(%esp),%edi
 8049e0f:	f7 74 24 04          	divl   0x4(%esp)
 8049e13:	d3 e7                	shl    %cl,%edi
 8049e15:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049e19:	89 d7                	mov    %edx,%edi
 8049e1b:	f7 64 24 08          	mull   0x8(%esp)
 8049e1f:	39 d7                	cmp    %edx,%edi
 8049e21:	89 c1                	mov    %eax,%ecx
 8049e23:	89 14 24             	mov    %edx,(%esp)
 8049e26:	72 2c                	jb     8049e54 <__umoddi3+0x134>
 8049e28:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 8049e2c:	72 22                	jb     8049e50 <__umoddi3+0x130>
 8049e2e:	8b 44 24 0c          	mov    0xc(%esp),%eax
 8049e32:	29 c8                	sub    %ecx,%eax
 8049e34:	19 d7                	sbb    %edx,%edi
 8049e36:	89 e9                	mov    %ebp,%ecx
 8049e38:	89 fa                	mov    %edi,%edx
 8049e3a:	d3 e8                	shr    %cl,%eax
 8049e3c:	89 f1                	mov    %esi,%ecx
 8049e3e:	d3 e2                	shl    %cl,%edx
 8049e40:	89 e9                	mov    %ebp,%ecx
 8049e42:	d3 ef                	shr    %cl,%edi
 8049e44:	09 d0                	or     %edx,%eax
 8049e46:	89 fa                	mov    %edi,%edx
 8049e48:	83 c4 14             	add    $0x14,%esp
 8049e4b:	5e                   	pop    %esi
 8049e4c:	5f                   	pop    %edi
 8049e4d:	5d                   	pop    %ebp
 8049e4e:	c3                   	ret    
 8049e4f:	90                   	nop
 8049e50:	39 d7                	cmp    %edx,%edi
 8049e52:	75 da                	jne    8049e2e <__umoddi3+0x10e>
 8049e54:	8b 14 24             	mov    (%esp),%edx
 8049e57:	89 c1                	mov    %eax,%ecx
 8049e59:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 8049e5d:	1b 54 24 04          	sbb    0x4(%esp),%edx
 8049e61:	eb cb                	jmp    8049e2e <__umoddi3+0x10e>
 8049e63:	90                   	nop
 8049e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049e68:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 8049e6c:	0f 82 0f ff ff ff    	jb     8049d81 <__umoddi3+0x61>
 8049e72:	e9 1a ff ff ff       	jmp    8049d91 <__umoddi3+0x71>
