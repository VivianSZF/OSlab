
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
 8048006:	c7 04 24 88 9e 04 08 	movl   $0x8049e88,(%esp)
 804800d:	e8 ed 0f 00 00       	call   8048fff <printf>
        //fork();
	//exit(0);
	//sleep(1);
	//printf("skskkssks");
	//while(1);
	if(fork()==0){
 8048012:	e8 04 0f 00 00       	call   8048f1b <fork>
 8048017:	85 c0                	test   %eax,%eax
 8048019:	75 1a                	jne    8048035 <game_init+0x35>
		while(1){
			printf("ping.\n");
 804801b:	c7 04 24 95 9e 04 08 	movl   $0x8049e95,(%esp)
 8048022:	e8 d8 0f 00 00       	call   8048fff <printf>
			sleep(1);
 8048027:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804802e:	e8 2b 0f 00 00       	call   8048f5e <sleep>
			
		}
 8048033:	eb e6                	jmp    804801b <game_init+0x1b>
	}
	else{
		while(1){
			printf("pong.\n");
 8048035:	c7 04 24 9c 9e 04 08 	movl   $0x8049e9c,(%esp)
 804803c:	e8 be 0f 00 00       	call   8048fff <printf>
			sleep(2);
 8048041:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048048:	e8 11 0f 00 00       	call   8048f5e <sleep>
			printf("qweqwe");
 804804d:	c7 04 24 a3 9e 04 08 	movl   $0x8049ea3,(%esp)
 8048054:	e8 a6 0f 00 00       	call   8048fff <printf>
		}
 8048059:	eb da                	jmp    8048035 <game_init+0x35>

0804805b <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 804805b:	55                   	push   %ebp
 804805c:	89 e5                	mov    %esp,%ebp
 804805e:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 8048061:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048068:	eb 12                	jmp    804807c <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 804806a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804806d:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 8048074:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 8048078:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804807c:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048080:	7e e8                	jle    804806a <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 8048082:	c9                   	leave  
 8048083:	c3                   	ret    

08048084 <press_key>:

void press_key(int scan_code) {
 8048084:	55                   	push   %ebp
 8048085:	89 e5                	mov    %esp,%ebp
 8048087:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 804808a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048091:	eb 21                	jmp    80480b4 <press_key+0x30>
		if (key_code[i] == scan_code) {
 8048093:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048096:	8b 04 85 00 b0 04 08 	mov    0x804b000(,%eax,4),%eax
 804809d:	3b 45 08             	cmp    0x8(%ebp),%eax
 80480a0:	75 0e                	jne    80480b0 <press_key+0x2c>
			key_pressed[i] = TRUE;
 80480a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80480a5:	c7 04 85 20 b4 04 08 	movl   $0x1,0x804b420(,%eax,4)
 80480ac:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 80480b0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80480b4:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 80480b8:	7e d9                	jle    8048093 <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 80480ba:	c9                   	leave  
 80480bb:	c3                   	ret    

080480bc <release_key>:

void release_key(int index) {
 80480bc:	55                   	push   %ebp
 80480bd:	89 e5                	mov    %esp,%ebp
 80480bf:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80480c2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80480c6:	78 06                	js     80480ce <release_key+0x12>
 80480c8:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80480cc:	7e 24                	jle    80480f2 <release_key+0x36>
 80480ce:	c7 44 24 0c aa 9e 04 	movl   $0x8049eaa,0xc(%esp)
 80480d5:	08 
 80480d6:	c7 44 24 08 c2 9e 04 	movl   $0x8049ec2,0x8(%esp)
 80480dd:	08 
 80480de:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80480e5:	00 
 80480e6:	c7 04 24 d7 9e 04 08 	movl   $0x8049ed7,(%esp)
 80480ed:	e8 93 00 00 00       	call   8048185 <_panic>
	key_pressed[index] = FALSE;
 80480f2:	8b 45 08             	mov    0x8(%ebp),%eax
 80480f5:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 80480fc:	00 00 00 00 
}
 8048100:	c9                   	leave  
 8048101:	c3                   	ret    

08048102 <query_key>:

bool query_key(int index) {
 8048102:	55                   	push   %ebp
 8048103:	89 e5                	mov    %esp,%ebp
 8048105:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 8048108:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804810c:	78 06                	js     8048114 <query_key+0x12>
 804810e:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 8048112:	7e 24                	jle    8048138 <query_key+0x36>
 8048114:	c7 44 24 0c aa 9e 04 	movl   $0x8049eaa,0xc(%esp)
 804811b:	08 
 804811c:	c7 44 24 08 c2 9e 04 	movl   $0x8049ec2,0x8(%esp)
 8048123:	08 
 8048124:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 804812b:	00 
 804812c:	c7 04 24 d7 9e 04 08 	movl   $0x8049ed7,(%esp)
 8048133:	e8 4d 00 00 00       	call   8048185 <_panic>
	return key_pressed[index];
 8048138:	8b 45 08             	mov    0x8(%ebp),%eax
 804813b:	8b 04 85 20 b4 04 08 	mov    0x804b420(,%eax,4),%eax
}
 8048142:	c9                   	leave  
 8048143:	c3                   	ret    

08048144 <key_operation>:

extern void control_plane(int);
void key_operation(void){
 8048144:	55                   	push   %ebp
 8048145:	89 e5                	mov    %esp,%ebp
 8048147:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 804814a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048151:	eb 2a                	jmp    804817d <key_operation+0x39>
		if(query_key(i)==TRUE){
 8048153:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048156:	89 04 24             	mov    %eax,(%esp)
 8048159:	e8 a4 ff ff ff       	call   8048102 <query_key>
 804815e:	83 f8 01             	cmp    $0x1,%eax
 8048161:	75 16                	jne    8048179 <key_operation+0x35>
			control_plane(i);
 8048163:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048166:	89 04 24             	mov    %eax,(%esp)
 8048169:	e8 b6 07 00 00       	call   8048924 <control_plane>
			release_key(i);
 804816e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048171:	89 04 24             	mov    %eax,(%esp)
 8048174:	e8 43 ff ff ff       	call   80480bc <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 8048179:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804817d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 8048181:	7e d0                	jle    8048153 <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 8048183:	c9                   	leave  
 8048184:	c3                   	ret    

08048185 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 8048185:	55                   	push   %ebp
 8048186:	89 e5                	mov    %esp,%ebp
 8048188:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 804818b:	a1 30 b4 04 08       	mov    0x804b430,%eax
 8048190:	85 c0                	test   %eax,%eax
 8048192:	74 01                	je     8048195 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 8048194:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 8048195:	8b 45 10             	mov    0x10(%ebp),%eax
 8048198:	a3 30 b4 04 08       	mov    %eax,0x804b430

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 804819d:	fa                   	cli    
 804819e:	fc                   	cld    

	va_start(ap, fmt);
 804819f:	8d 45 14             	lea    0x14(%ebp),%eax
 80481a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 80481a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481a8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80481af:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481b3:	c7 04 24 e7 9e 04 08 	movl   $0x8049ee7,(%esp)
 80481ba:	e8 40 0e 00 00       	call   8048fff <printf>
	vprintf(fmt, ap);
 80481bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481c6:	8b 45 10             	mov    0x10(%ebp),%eax
 80481c9:	89 04 24             	mov    %eax,(%esp)
 80481cc:	e8 fb 0d 00 00       	call   8048fcc <vprintf>
	printf("\n");
 80481d1:	c7 04 24 ff 9e 04 08 	movl   $0x8049eff,(%esp)
 80481d8:	e8 22 0e 00 00       	call   8048fff <printf>
	va_end(ap);

}
 80481dd:	c9                   	leave  
 80481de:	c3                   	ret    

080481df <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 80481df:	55                   	push   %ebp
 80481e0:	89 e5                	mov    %esp,%ebp
 80481e2:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 80481e5:	8d 45 14             	lea    0x14(%ebp),%eax
 80481e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 80481eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481ee:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481f2:	8b 45 08             	mov    0x8(%ebp),%eax
 80481f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80481f9:	c7 04 24 01 9f 04 08 	movl   $0x8049f01,(%esp)
 8048200:	e8 fa 0d 00 00       	call   8048fff <printf>
	vprintf(fmt, ap);
 8048205:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048208:	89 44 24 04          	mov    %eax,0x4(%esp)
 804820c:	8b 45 10             	mov    0x10(%ebp),%eax
 804820f:	89 04 24             	mov    %eax,(%esp)
 8048212:	e8 b5 0d 00 00       	call   8048fcc <vprintf>
	printf("\n");
 8048217:	c7 04 24 ff 9e 04 08 	movl   $0x8049eff,(%esp)
 804821e:	e8 dc 0d 00 00       	call   8048fff <printf>
	va_end(ap);
}
 8048223:	c9                   	leave  
 8048224:	c3                   	ret    

08048225 <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 8048225:	55                   	push   %ebp
 8048226:	89 e5                	mov    %esp,%ebp
 8048228:	83 ec 38             	sub    $0x38,%esp
 804822b:	8b 45 08             	mov    0x8(%ebp),%eax
 804822e:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 8048231:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 8048235:	79 24                	jns    804825b <draw_character+0x36>
 8048237:	c7 44 24 0c 1b 9f 04 	movl   $0x8049f1b,0xc(%esp)
 804823e:	08 
 804823f:	c7 44 24 08 2c 9f 04 	movl   $0x8049f2c,0x8(%esp)
 8048246:	08 
 8048247:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 804824e:	00 
 804824f:	c7 04 24 41 9f 04 08 	movl   $0x8049f41,(%esp)
 8048256:	e8 2a ff ff ff       	call   8048185 <_panic>
	char *p = font8x8_basic[(int)ch];
 804825b:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 804825f:	c1 e0 03             	shl    $0x3,%eax
 8048262:	05 20 b0 04 08       	add    $0x804b020,%eax
 8048267:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 804826a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048271:	eb 59                	jmp    80482cc <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 8048273:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804827a:	eb 46                	jmp    80482c2 <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 804827c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804827f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048282:	01 d0                	add    %edx,%eax
 8048284:	0f b6 00             	movzbl (%eax),%eax
 8048287:	0f be d0             	movsbl %al,%edx
 804828a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804828d:	89 c1                	mov    %eax,%ecx
 804828f:	d3 fa                	sar    %cl,%edx
 8048291:	89 d0                	mov    %edx,%eax
 8048293:	83 e0 01             	and    $0x1,%eax
 8048296:	85 c0                	test   %eax,%eax
 8048298:	74 24                	je     80482be <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 804829a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804829d:	8b 55 10             	mov    0x10(%ebp),%edx
 80482a0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80482a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482a6:	8b 55 0c             	mov    0xc(%ebp),%edx
 80482a9:	01 c2                	add    %eax,%edx
 80482ab:	8b 45 14             	mov    0x14(%ebp),%eax
 80482ae:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482b2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80482b6:	89 14 24             	mov    %edx,(%esp)
 80482b9:	e8 64 0b 00 00       	call   8048e22 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 80482be:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80482c2:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 80482c6:	7e b4                	jle    804827c <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 80482c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80482cc:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 80482d0:	7e a1                	jle    8048273 <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 80482d2:	c9                   	leave  
 80482d3:	c3                   	ret    

080482d4 <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 80482d4:	55                   	push   %ebp
 80482d5:	89 e5                	mov    %esp,%ebp
 80482d7:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 80482da:	eb 4a                	jmp    8048326 <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 80482dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80482df:	8d 50 01             	lea    0x1(%eax),%edx
 80482e2:	89 55 08             	mov    %edx,0x8(%ebp)
 80482e5:	0f b6 00             	movzbl (%eax),%eax
 80482e8:	0f be c0             	movsbl %al,%eax
 80482eb:	8b 55 14             	mov    0x14(%ebp),%edx
 80482ee:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80482f2:	8b 55 10             	mov    0x10(%ebp),%edx
 80482f5:	89 54 24 08          	mov    %edx,0x8(%esp)
 80482f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 80482fc:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048300:	89 04 24             	mov    %eax,(%esp)
 8048303:	e8 1d ff ff ff       	call   8048225 <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 8048308:	8b 45 10             	mov    0x10(%ebp),%eax
 804830b:	83 c0 08             	add    $0x8,%eax
 804830e:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 8048313:	7e 0d                	jle    8048322 <draw_string+0x4e>
			x += 8; y = 0;
 8048315:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 8048319:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8048320:	eb 04                	jmp    8048326 <draw_string+0x52>
		} else {
			y += 8;
 8048322:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 8048326:	8b 45 08             	mov    0x8(%ebp),%eax
 8048329:	0f b6 00             	movzbl (%eax),%eax
 804832c:	84 c0                	test   %al,%al
 804832e:	75 ac                	jne    80482dc <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 8048330:	c9                   	leave  
 8048331:	c3                   	ret    

08048332 <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 8048332:	55                   	push   %ebp
 8048333:	89 e5                	mov    %esp,%ebp
 8048335:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 8048338:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804833f:	eb 3d                	jmp    804837e <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 8048341:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048348:	eb 28                	jmp    8048372 <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 804834a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804834d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048350:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048353:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048356:	8b 55 08             	mov    0x8(%ebp),%edx
 8048359:	01 c2                	add    %eax,%edx
 804835b:	8b 45 14             	mov    0x14(%ebp),%eax
 804835e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048362:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048366:	89 14 24             	mov    %edx,(%esp)
 8048369:	e8 b4 0a 00 00       	call   8048e22 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 804836e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048372:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048375:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048378:	7c d0                	jl     804834a <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 804837a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804837e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048381:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048384:	7c bb                	jl     8048341 <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 8048386:	c9                   	leave  
 8048387:	c3                   	ret    

08048388 <redraw_screen>:

void
redraw_screen() {
 8048388:	55                   	push   %ebp
 8048389:	89 e5                	mov    %esp,%ebp
 804838b:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 804838e:	e8 f7 0a 00 00       	call   8048e8a <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 8048393:	e8 ab 06 00 00       	call   8048a43 <get_st_head>
 8048398:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804839b:	eb 37                	jmp    80483d4 <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 804839d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483a0:	8b 48 08             	mov    0x8(%eax),%ecx
 80483a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483a6:	8b 50 04             	mov    0x4(%eax),%edx
 80483a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483ac:	8b 00                	mov    (%eax),%eax
 80483ae:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 80483b5:	00 
 80483b6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483ba:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483be:	89 04 24             	mov    %eax,(%esp)
 80483c1:	e8 6c ff ff ff       	call   8048332 <draw_bomb>
		it=st_next(it);
 80483c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483c9:	89 04 24             	mov    %eax,(%esp)
 80483cc:	e8 38 04 00 00       	call   8048809 <st_next>
 80483d1:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 80483d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80483d8:	75 c3                	jne    804839d <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 80483da:	8b 0d 14 5c 09 08    	mov    0x8095c14,%ecx
 80483e0:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80483e6:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 80483eb:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 80483f2:	00 
 80483f3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80483f7:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483fb:	89 04 24             	mov    %eax,(%esp)
 80483fe:	e8 2f ff ff ff       	call   8048332 <draw_bomb>
	const char *score=itoa(get_score());
 8048403:	e8 27 06 00 00       	call   8048a2f <get_score>
 8048408:	89 04 24             	mov    %eax,(%esp)
 804840b:	e8 30 0c 00 00       	call   8049040 <itoa>
 8048410:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 8048413:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048416:	89 04 24             	mov    %eax,(%esp)
 8048419:	e8 be 0c 00 00       	call   80490dc <strlen>
 804841e:	89 c2                	mov    %eax,%edx
 8048420:	b8 00 00 00 00       	mov    $0x0,%eax
 8048425:	29 d0                	sub    %edx,%eax
 8048427:	c1 e0 03             	shl    $0x3,%eax
 804842a:	05 10 01 00 00       	add    $0x110,%eax
 804842f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048436:	00 
 8048437:	89 44 24 08          	mov    %eax,0x8(%esp)
 804843b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048442:	00 
 8048443:	c7 04 24 4d 9f 04 08 	movl   $0x8049f4d,(%esp)
 804844a:	e8 85 fe ff ff       	call   80482d4 <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 804844f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048452:	89 04 24             	mov    %eax,(%esp)
 8048455:	e8 82 0c 00 00       	call   80490dc <strlen>
 804845a:	89 c2                	mov    %eax,%edx
 804845c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048461:	29 d0                	sub    %edx,%eax
 8048463:	c1 e0 03             	shl    $0x3,%eax
 8048466:	05 40 01 00 00       	add    $0x140,%eax
 804846b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048472:	00 
 8048473:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048477:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804847e:	00 
 804847f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048482:	89 04 24             	mov    %eax,(%esp)
 8048485:	e8 4a fe ff ff       	call   80482d4 <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 804848a:	e8 aa 05 00 00       	call   8048a39 <get_miss>
 804848f:	89 04 24             	mov    %eax,(%esp)
 8048492:	e8 a9 0b 00 00       	call   8049040 <itoa>
 8048497:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 804849a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804849d:	89 04 24             	mov    %eax,(%esp)
 80484a0:	e8 37 0c 00 00       	call   80490dc <strlen>
 80484a5:	89 c2                	mov    %eax,%edx
 80484a7:	b8 00 00 00 00       	mov    $0x0,%eax
 80484ac:	29 d0                	sub    %edx,%eax
 80484ae:	c1 e0 03             	shl    $0x3,%eax
 80484b1:	05 18 01 00 00       	add    $0x118,%eax
 80484b6:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484bd:	00 
 80484be:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484c2:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80484c9:	00 
 80484ca:	c7 04 24 54 9f 04 08 	movl   $0x8049f54,(%esp)
 80484d1:	e8 fe fd ff ff       	call   80482d4 <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80484d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484d9:	89 04 24             	mov    %eax,(%esp)
 80484dc:	e8 fb 0b 00 00       	call   80490dc <strlen>
 80484e1:	89 c2                	mov    %eax,%edx
 80484e3:	b8 00 00 00 00       	mov    $0x0,%eax
 80484e8:	29 d0                	sub    %edx,%eax
 80484ea:	c1 e0 03             	shl    $0x3,%eax
 80484ed:	05 40 01 00 00       	add    $0x140,%eax
 80484f2:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80484f9:	00 
 80484fa:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484fe:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 8048505:	00 
 8048506:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048509:	89 04 24             	mov    %eax,(%esp)
 804850c:	e8 c3 fd ff ff       	call   80482d4 <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 8048511:	e8 74 00 00 00       	call   804858a <get_fps>
 8048516:	89 04 24             	mov    %eax,(%esp)
 8048519:	e8 22 0b 00 00       	call   8049040 <itoa>
 804851e:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048525:	00 
 8048526:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804852d:	00 
 804852e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048535:	00 
 8048536:	89 04 24             	mov    %eax,(%esp)
 8048539:	e8 96 fd ff ff       	call   80482d4 <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 804853e:	e8 47 00 00 00       	call   804858a <get_fps>
 8048543:	89 04 24             	mov    %eax,(%esp)
 8048546:	e8 f5 0a 00 00       	call   8049040 <itoa>
 804854b:	89 04 24             	mov    %eax,(%esp)
 804854e:	e8 89 0b 00 00       	call   80490dc <strlen>
 8048553:	c1 e0 03             	shl    $0x3,%eax
 8048556:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 804855d:	00 
 804855e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048562:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048569:	00 
 804856a:	c7 04 24 5a 9f 04 08 	movl   $0x8049f5a,(%esp)
 8048571:	e8 5e fd ff ff       	call   80482d4 <draw_string>
	syspr();
 8048576:	e8 33 09 00 00       	call   8048eae <syspr>
}
 804857b:	c9                   	leave  
 804857c:	c3                   	ret    

0804857d <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 804857d:	55                   	push   %ebp
 804857e:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 8048580:	8b 45 08             	mov    0x8(%ebp),%eax
 8048583:	a3 34 b4 04 08       	mov    %eax,0x804b434
}
 8048588:	5d                   	pop    %ebp
 8048589:	c3                   	ret    

0804858a <get_fps>:
int get_fps() {
 804858a:	55                   	push   %ebp
 804858b:	89 e5                	mov    %esp,%ebp
	return real_fps;
 804858d:	a1 34 b4 04 08       	mov    0x804b434,%eax
}
 8048592:	5d                   	pop    %ebp
 8048593:	c3                   	ret    

08048594 <main_loop>:


extern void key_operation();
void main_loop(void) {
 8048594:	55                   	push   %ebp
 8048595:	89 e5                	mov    %esp,%ebp
 8048597:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 804859a:	e8 2b 09 00 00       	call   8048eca <systime>
 804859f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 80485a2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 80485a9:	c7 05 0c 5c 09 08 64 	movl   $0x64,0x8095c0c
 80485b0:	00 00 00 
	pl.y=150;
 80485b3:	c7 05 10 5c 09 08 96 	movl   $0x96,0x8095c10
 80485ba:	00 00 00 
	pl.w=10;
 80485bd:	c7 05 14 5c 09 08 0a 	movl   $0xa,0x8095c14
 80485c4:	00 00 00 
	pl.v=10;
 80485c7:	c7 05 18 5c 09 08 0a 	movl   $0xa,0x8095c18
 80485ce:	00 00 00 
	
	while (TRUE) {
	
		key_operation();
 80485d1:	e8 6e fb ff ff       	call   8048144 <key_operation>
		target = systime(); 
 80485d6:	e8 ef 08 00 00       	call   8048eca <systime>
 80485db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		redraw = FALSE;
 80485de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 80485e5:	e9 06 01 00 00       	jmp    80486f0 <main_loop+0x15c>
			int code=sysreadkey();
 80485ea:	e8 ef 08 00 00       	call   8048ede <sysreadkey>
 80485ef:	89 45 e0             	mov    %eax,-0x20(%ebp)
			if(code!=-1){
 80485f2:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
 80485f6:	74 0b                	je     8048603 <main_loop+0x6f>
				press_key(code);
 80485f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80485fb:	89 04 24             	mov    %eax,(%esp)
 80485fe:	e8 81 fa ff ff       	call   8048084 <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 8048603:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048606:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804860b:	89 c8                	mov    %ecx,%eax
 804860d:	f7 ea                	imul   %edx
 804860f:	c1 fa 05             	sar    $0x5,%edx
 8048612:	89 c8                	mov    %ecx,%eax
 8048614:	c1 f8 1f             	sar    $0x1f,%eax
 8048617:	29 c2                	sub    %eax,%edx
 8048619:	89 d0                	mov    %edx,%eax
 804861b:	6b c0 64             	imul   $0x64,%eax,%eax
 804861e:	29 c1                	sub    %eax,%ecx
 8048620:	89 c8                	mov    %ecx,%eax
 8048622:	85 c0                	test   %eax,%eax
 8048624:	75 05                	jne    804862b <main_loop+0x97>
				create_new_stone();
 8048626:	e8 22 04 00 00       	call   8048a4d <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 804862b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804862e:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048633:	89 c8                	mov    %ecx,%eax
 8048635:	f7 ea                	imul   %edx
 8048637:	89 c8                	mov    %ecx,%eax
 8048639:	c1 f8 1f             	sar    $0x1f,%eax
 804863c:	29 c2                	sub    %eax,%edx
 804863e:	89 d0                	mov    %edx,%eax
 8048640:	01 c0                	add    %eax,%eax
 8048642:	01 d0                	add    %edx,%eax
 8048644:	29 c1                	sub    %eax,%ecx
 8048646:	89 ca                	mov    %ecx,%edx
 8048648:	85 d2                	test   %edx,%edx
 804864a:	75 05                	jne    8048651 <main_loop+0xbd>
				update_stone_pos();
 804864c:	e8 9f 04 00 00       	call   8048af0 <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 8048651:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048654:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048659:	89 c8                	mov    %ecx,%eax
 804865b:	f7 ea                	imul   %edx
 804865d:	89 c8                	mov    %ecx,%eax
 804865f:	c1 f8 1f             	sar    $0x1f,%eax
 8048662:	29 c2                	sub    %eax,%edx
 8048664:	89 d0                	mov    %edx,%eax
 8048666:	01 c0                	add    %eax,%eax
 8048668:	01 d0                	add    %edx,%eax
 804866a:	29 c1                	sub    %eax,%ecx
 804866c:	89 ca                	mov    %ecx,%edx
 804866e:	85 d2                	test   %edx,%edx
 8048670:	75 05                	jne    8048677 <main_loop+0xe3>
				update_bang();
 8048672:	e8 13 07 00 00       	call   8048d8a <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 8048677:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804867a:	ba 56 55 55 55       	mov    $0x55555556,%edx
 804867f:	89 c8                	mov    %ecx,%eax
 8048681:	f7 ea                	imul   %edx
 8048683:	89 c8                	mov    %ecx,%eax
 8048685:	c1 f8 1f             	sar    $0x1f,%eax
 8048688:	29 c2                	sub    %eax,%edx
 804868a:	89 d0                	mov    %edx,%eax
 804868c:	01 c0                	add    %eax,%eax
 804868e:	01 d0                	add    %edx,%eax
 8048690:	29 c1                	sub    %eax,%ecx
 8048692:	89 ca                	mov    %ecx,%edx
 8048694:	85 d2                	test   %edx,%edx
 8048696:	75 07                	jne    804869f <main_loop+0x10b>
				redraw = TRUE;
 8048698:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 804869f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80486a2:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80486a7:	89 c8                	mov    %ecx,%eax
 80486a9:	f7 ea                	imul   %edx
 80486ab:	c1 fa 04             	sar    $0x4,%edx
 80486ae:	89 c8                	mov    %ecx,%eax
 80486b0:	c1 f8 1f             	sar    $0x1f,%eax
 80486b3:	29 c2                	sub    %eax,%edx
 80486b5:	89 d0                	mov    %edx,%eax
 80486b7:	6b c0 32             	imul   $0x32,%eax,%eax
 80486ba:	29 c1                	sub    %eax,%ecx
 80486bc:	89 c8                	mov    %ecx,%eax
 80486be:	85 c0                	test   %eax,%eax
 80486c0:	75 2a                	jne    80486ec <main_loop+0x158>
				int now_fps = num_draw * 2 + 1;
 80486c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80486c5:	01 c0                	add    %eax,%eax
 80486c7:	83 c0 01             	add    $0x1,%eax
 80486ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 80486cd:	83 7d e8 1e          	cmpl   $0x1e,-0x18(%ebp)
 80486d1:	7e 07                	jle    80486da <main_loop+0x146>
 80486d3:	c7 45 e8 1e 00 00 00 	movl   $0x1e,-0x18(%ebp)
				set_fps(now_fps);
 80486da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486dd:	89 04 24             	mov    %eax,(%esp)
 80486e0:	e8 98 fe ff ff       	call   804857d <set_fps>
				num_draw = 0;
 80486e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 80486ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 80486f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80486f3:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 80486f6:	0f 8c ee fe ff ff    	jl     80485ea <main_loop+0x56>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 80486fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8048700:	74 0e                	je     8048710 <main_loop+0x17c>
			num_draw ++;
 8048702:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 8048706:	e8 7d fc ff ff       	call   8048388 <redraw_screen>
		}
	}
 804870b:	e9 c1 fe ff ff       	jmp    80485d1 <main_loop+0x3d>
 8048710:	e9 bc fe ff ff       	jmp    80485d1 <main_loop+0x3d>

08048715 <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 8048715:	55                   	push   %ebp
 8048716:	89 e5                	mov    %esp,%ebp
 8048718:	83 ec 28             	sub    $0x28,%esp
 804871b:	a1 d8 5d 08 08       	mov    0x8085dd8,%eax
 8048720:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048723:	c7 45 ec 40 b4 04 08 	movl   $0x804b440,-0x14(%ebp)
 804872a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804872e:	75 47                	jne    8048777 <st_new+0x62>
 8048730:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 8048737:	eb 2f                	jmp    8048768 <st_new+0x53>
 8048739:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804873c:	89 d0                	mov    %edx,%eax
 804873e:	01 c0                	add    %eax,%eax
 8048740:	01 d0                	add    %edx,%eax
 8048742:	c1 e0 03             	shl    $0x3,%eax
 8048745:	8d 50 e8             	lea    -0x18(%eax),%edx
 8048748:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804874b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804874e:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048751:	89 d0                	mov    %edx,%eax
 8048753:	01 c0                	add    %eax,%eax
 8048755:	01 d0                	add    %edx,%eax
 8048757:	c1 e0 03             	shl    $0x3,%eax
 804875a:	89 c2                	mov    %eax,%edx
 804875c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804875f:	01 d0                	add    %edx,%eax
 8048761:	89 41 14             	mov    %eax,0x14(%ecx)
 8048764:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048768:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 804876f:	7e c8                	jle    8048739 <st_new+0x24>
 8048771:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048774:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048777:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804877a:	8b 40 14             	mov    0x14(%eax),%eax
 804877d:	85 c0                	test   %eax,%eax
 804877f:	75 24                	jne    80487a5 <st_new+0x90>
 8048781:	c7 44 24 0c 5e 9f 04 	movl   $0x8049f5e,0xc(%esp)
 8048788:	08 
 8048789:	c7 44 24 08 77 9f 04 	movl   $0x8049f77,0x8(%esp)
 8048790:	08 
 8048791:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048798:	00 
 8048799:	c7 04 24 8c 9f 04 08 	movl   $0x8049f8c,(%esp)
 80487a0:	e8 e0 f9 ff ff       	call   8048185 <_panic>
 80487a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80487a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80487ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80487ae:	8b 40 14             	mov    0x14(%eax),%eax
 80487b1:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 80487b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487b9:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 80487c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487c3:	8b 50 14             	mov    0x14(%eax),%edx
 80487c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487c9:	89 50 10             	mov    %edx,0x10(%eax)
 80487cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80487cf:	c9                   	leave  
 80487d0:	c3                   	ret    

080487d1 <st_prev>:
 80487d1:	55                   	push   %ebp
 80487d2:	89 e5                	mov    %esp,%ebp
 80487d4:	83 ec 18             	sub    $0x18,%esp
 80487d7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80487db:	75 24                	jne    8048801 <st_prev+0x30>
 80487dd:	c7 44 24 0c 9a 9f 04 	movl   $0x8049f9a,0xc(%esp)
 80487e4:	08 
 80487e5:	c7 44 24 08 77 9f 04 	movl   $0x8049f77,0x8(%esp)
 80487ec:	08 
 80487ed:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80487f4:	00 
 80487f5:	c7 04 24 8c 9f 04 08 	movl   $0x8049f8c,(%esp)
 80487fc:	e8 84 f9 ff ff       	call   8048185 <_panic>
 8048801:	8b 45 08             	mov    0x8(%ebp),%eax
 8048804:	8b 40 10             	mov    0x10(%eax),%eax
 8048807:	c9                   	leave  
 8048808:	c3                   	ret    

08048809 <st_next>:
 8048809:	55                   	push   %ebp
 804880a:	89 e5                	mov    %esp,%ebp
 804880c:	83 ec 18             	sub    $0x18,%esp
 804880f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048813:	75 24                	jne    8048839 <st_next+0x30>
 8048815:	c7 44 24 0c 9a 9f 04 	movl   $0x8049f9a,0xc(%esp)
 804881c:	08 
 804881d:	c7 44 24 08 77 9f 04 	movl   $0x8049f77,0x8(%esp)
 8048824:	08 
 8048825:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804882c:	00 
 804882d:	c7 04 24 8c 9f 04 08 	movl   $0x8049f8c,(%esp)
 8048834:	e8 4c f9 ff ff       	call   8048185 <_panic>
 8048839:	8b 45 08             	mov    0x8(%ebp),%eax
 804883c:	8b 40 14             	mov    0x14(%eax),%eax
 804883f:	c9                   	leave  
 8048840:	c3                   	ret    

08048841 <st_insert>:
 8048841:	55                   	push   %ebp
 8048842:	89 e5                	mov    %esp,%ebp
 8048844:	83 ec 18             	sub    $0x18,%esp
 8048847:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804884b:	75 2a                	jne    8048877 <st_insert+0x36>
 804884d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048851:	75 24                	jne    8048877 <st_insert+0x36>
 8048853:	c7 44 24 0c a7 9f 04 	movl   $0x8049fa7,0xc(%esp)
 804885a:	08 
 804885b:	c7 44 24 08 77 9f 04 	movl   $0x8049f77,0x8(%esp)
 8048862:	08 
 8048863:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804886a:	00 
 804886b:	c7 04 24 8c 9f 04 08 	movl   $0x8049f8c,(%esp)
 8048872:	e8 0e f9 ff ff       	call   8048185 <_panic>
 8048877:	8b 45 10             	mov    0x10(%ebp),%eax
 804887a:	8b 55 08             	mov    0x8(%ebp),%edx
 804887d:	89 50 10             	mov    %edx,0x10(%eax)
 8048880:	8b 45 10             	mov    0x10(%ebp),%eax
 8048883:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048886:	89 50 14             	mov    %edx,0x14(%eax)
 8048889:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804888d:	74 09                	je     8048898 <st_insert+0x57>
 804888f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048892:	8b 55 10             	mov    0x10(%ebp),%edx
 8048895:	89 50 14             	mov    %edx,0x14(%eax)
 8048898:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804889c:	74 09                	je     80488a7 <st_insert+0x66>
 804889e:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488a1:	8b 55 10             	mov    0x10(%ebp),%edx
 80488a4:	89 50 10             	mov    %edx,0x10(%eax)
 80488a7:	c9                   	leave  
 80488a8:	c3                   	ret    

080488a9 <st_remove>:
 80488a9:	55                   	push   %ebp
 80488aa:	89 e5                	mov    %esp,%ebp
 80488ac:	83 ec 28             	sub    $0x28,%esp
 80488af:	8b 45 08             	mov    0x8(%ebp),%eax
 80488b2:	8b 40 10             	mov    0x10(%eax),%eax
 80488b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488b8:	8b 45 08             	mov    0x8(%ebp),%eax
 80488bb:	8b 40 14             	mov    0x14(%eax),%eax
 80488be:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80488c1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80488c5:	75 24                	jne    80488eb <st_remove+0x42>
 80488c7:	c7 44 24 0c 9a 9f 04 	movl   $0x8049f9a,0xc(%esp)
 80488ce:	08 
 80488cf:	c7 44 24 08 77 9f 04 	movl   $0x8049f77,0x8(%esp)
 80488d6:	08 
 80488d7:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80488de:	00 
 80488df:	c7 04 24 8c 9f 04 08 	movl   $0x8049f8c,(%esp)
 80488e6:	e8 9a f8 ff ff       	call   8048185 <_panic>
 80488eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80488ef:	74 09                	je     80488fa <st_remove+0x51>
 80488f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488f7:	89 50 14             	mov    %edx,0x14(%eax)
 80488fa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80488fe:	74 09                	je     8048909 <st_remove+0x60>
 8048900:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048903:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048906:	89 50 10             	mov    %edx,0x10(%eax)
 8048909:	c9                   	leave  
 804890a:	c3                   	ret    

0804890b <st_free>:
 804890b:	55                   	push   %ebp
 804890c:	89 e5                	mov    %esp,%ebp
 804890e:	8b 15 d8 5d 08 08    	mov    0x8085dd8,%edx
 8048914:	8b 45 08             	mov    0x8(%ebp),%eax
 8048917:	89 50 14             	mov    %edx,0x14(%eax)
 804891a:	8b 45 08             	mov    0x8(%ebp),%eax
 804891d:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048922:	5d                   	pop    %ebp
 8048923:	c3                   	ret    

08048924 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 8048924:	55                   	push   %ebp
 8048925:	89 e5                	mov    %esp,%ebp
 8048927:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 804892a:	8b 45 08             	mov    0x8(%ebp),%eax
 804892d:	83 f8 01             	cmp    $0x1,%eax
 8048930:	74 4e                	je     8048980 <control_plane+0x5c>
 8048932:	83 f8 01             	cmp    $0x1,%eax
 8048935:	7f 09                	jg     8048940 <control_plane+0x1c>
 8048937:	85 c0                	test   %eax,%eax
 8048939:	74 18                	je     8048953 <control_plane+0x2f>
 804893b:	e9 c9 00 00 00       	jmp    8048a09 <control_plane+0xe5>
 8048940:	83 f8 02             	cmp    $0x2,%eax
 8048943:	74 6c                	je     80489b1 <control_plane+0x8d>
 8048945:	83 f8 03             	cmp    $0x3,%eax
 8048948:	0f 84 8a 00 00 00    	je     80489d8 <control_plane+0xb4>
 804894e:	e9 b6 00 00 00       	jmp    8048a09 <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 8048953:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048959:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 804895e:	39 c2                	cmp    %eax,%edx
 8048960:	7c 19                	jl     804897b <control_plane+0x57>
 8048962:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048968:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 804896d:	29 c2                	sub    %eax,%edx
 804896f:	89 d0                	mov    %edx,%eax
 8048971:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 8048976:	e9 b2 00 00 00       	jmp    8048a2d <control_plane+0x109>
 804897b:	e9 ad 00 00 00       	jmp    8048a2d <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048980:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 8048986:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 804898b:	01 c2                	add    %eax,%edx
 804898d:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048992:	01 d0                	add    %edx,%eax
 8048994:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048999:	7f 14                	jg     80489af <control_plane+0x8b>
 804899b:	8b 15 0c 5c 09 08    	mov    0x8095c0c,%edx
 80489a1:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489a6:	01 d0                	add    %edx,%eax
 80489a8:	a3 0c 5c 09 08       	mov    %eax,0x8095c0c
 80489ad:	eb 7e                	jmp    8048a2d <control_plane+0x109>
 80489af:	eb 7c                	jmp    8048a2d <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 80489b1:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489b7:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489bc:	39 c2                	cmp    %eax,%edx
 80489be:	7c 16                	jl     80489d6 <control_plane+0xb2>
 80489c0:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489c6:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489cb:	29 c2                	sub    %eax,%edx
 80489cd:	89 d0                	mov    %edx,%eax
 80489cf:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 80489d4:	eb 57                	jmp    8048a2d <control_plane+0x109>
 80489d6:	eb 55                	jmp    8048a2d <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 80489d8:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489de:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489e3:	01 c2                	add    %eax,%edx
 80489e5:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 80489ea:	01 d0                	add    %edx,%eax
 80489ec:	3d 40 01 00 00       	cmp    $0x140,%eax
 80489f1:	7f 14                	jg     8048a07 <control_plane+0xe3>
 80489f3:	8b 15 10 5c 09 08    	mov    0x8095c10,%edx
 80489f9:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 80489fe:	01 d0                	add    %edx,%eax
 8048a00:	a3 10 5c 09 08       	mov    %eax,0x8095c10
 8048a05:	eb 26                	jmp    8048a2d <control_plane+0x109>
 8048a07:	eb 24                	jmp    8048a2d <control_plane+0x109>
		default:assert(0);
 8048a09:	c7 44 24 0c c4 9f 04 	movl   $0x8049fc4,0xc(%esp)
 8048a10:	08 
 8048a11:	c7 44 24 08 77 9f 04 	movl   $0x8049f77,0x8(%esp)
 8048a18:	08 
 8048a19:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048a20:	00 
 8048a21:	c7 04 24 8c 9f 04 08 	movl   $0x8049f8c,(%esp)
 8048a28:	e8 58 f7 ff ff       	call   8048185 <_panic>
	}
}
 8048a2d:	c9                   	leave  
 8048a2e:	c3                   	ret    

08048a2f <get_score>:


int get_score(void) {
 8048a2f:	55                   	push   %ebp
 8048a30:	89 e5                	mov    %esp,%ebp
	return score;
 8048a32:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
}
 8048a37:	5d                   	pop    %ebp
 8048a38:	c3                   	ret    

08048a39 <get_miss>:

int get_miss(void) {
 8048a39:	55                   	push   %ebp
 8048a3a:	89 e5                	mov    %esp,%ebp
	return miss;
 8048a3c:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
}
 8048a41:	5d                   	pop    %ebp
 8048a42:	c3                   	ret    

08048a43 <get_st_head>:

st_t get_st_head(void){
 8048a43:	55                   	push   %ebp
 8048a44:	89 e5                	mov    %esp,%ebp
	return head;
 8048a46:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
}
 8048a4b:	5d                   	pop    %ebp
 8048a4c:	c3                   	ret    

08048a4d <create_new_stone>:

void create_new_stone(void) {
 8048a4d:	55                   	push   %ebp
 8048a4e:	89 e5                	mov    %esp,%ebp
 8048a50:	53                   	push   %ebx
 8048a51:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048a54:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a59:	85 c0                	test   %eax,%eax
 8048a5b:	75 0c                	jne    8048a69 <create_new_stone+0x1c>
		head = st_new(); 
 8048a5d:	e8 b3 fc ff ff       	call   8048715 <st_new>
 8048a62:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
 8048a67:	eb 2c                	jmp    8048a95 <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048a69:	e8 a7 fc ff ff       	call   8048715 <st_new>
 8048a6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048a71:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a76:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048a79:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048a7d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a81:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a88:	e8 b4 fd ff ff       	call   8048841 <st_insert>
		head = now;
 8048a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a90:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
	}
	head->x = 0;
 8048a95:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048a9a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048aa0:	8b 1d dc 5d 08 08    	mov    0x8085ddc,%ebx
 8048aa6:	e8 27 11 00 00       	call   8049bd2 <rand>
 8048aab:	89 c1                	mov    %eax,%ecx
 8048aad:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048ab2:	89 c8                	mov    %ecx,%eax
 8048ab4:	f7 ea                	imul   %edx
 8048ab6:	c1 fa 04             	sar    $0x4,%edx
 8048ab9:	89 c8                	mov    %ecx,%eax
 8048abb:	c1 f8 1f             	sar    $0x1f,%eax
 8048abe:	29 c2                	sub    %eax,%edx
 8048ac0:	89 d0                	mov    %edx,%eax
 8048ac2:	6b c0 26             	imul   $0x26,%eax,%eax
 8048ac5:	29 c1                	sub    %eax,%ecx
 8048ac7:	89 c8                	mov    %ecx,%eax
 8048ac9:	83 c0 01             	add    $0x1,%eax
 8048acc:	c1 e0 03             	shl    $0x3,%eax
 8048acf:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048ad2:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ad7:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048ade:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ae3:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048aea:	83 c4 24             	add    $0x24,%esp
 8048aed:	5b                   	pop    %ebx
 8048aee:	5d                   	pop    %ebp
 8048aef:	c3                   	ret    

08048af0 <update_stone_pos>:

void update_stone_pos(void) {
 8048af0:	55                   	push   %ebp
 8048af1:	89 e5                	mov    %esp,%ebp
 8048af3:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048af6:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048afb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048afe:	eb 6f                	jmp    8048b6f <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048b00:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b03:	89 04 24             	mov    %eax,(%esp)
 8048b06:	e8 fe fc ff ff       	call   8048809 <st_next>
 8048b0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048b0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b11:	8b 10                	mov    (%eax),%edx
 8048b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b16:	8b 40 0c             	mov    0xc(%eax),%eax
 8048b19:	01 c2                	add    %eax,%edx
 8048b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b1e:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048b20:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b23:	8b 10                	mov    (%eax),%edx
 8048b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b28:	8b 40 08             	mov    0x8(%eax),%eax
 8048b2b:	01 d0                	add    %edx,%eax
 8048b2d:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048b32:	7e 35                	jle    8048b69 <update_stone_pos+0x79>
			miss++; 
 8048b34:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
 8048b39:	83 c0 01             	add    $0x1,%eax
 8048b3c:	a3 e4 5d 08 08       	mov    %eax,0x8085de4
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048b41:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b44:	89 04 24             	mov    %eax,(%esp)
 8048b47:	e8 5d fd ff ff       	call   80488a9 <st_remove>
			if (it == head) head = next; 
 8048b4c:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048b51:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048b54:	75 08                	jne    8048b5e <update_stone_pos+0x6e>
 8048b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b59:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048b5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b61:	89 04 24             	mov    %eax,(%esp)
 8048b64:	e8 a2 fd ff ff       	call   804890b <st_free>
		}
		it = next;
 8048b69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048b6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048b73:	75 8b                	jne    8048b00 <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048b75:	c9                   	leave  
 8048b76:	c3                   	ret    

08048b77 <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048b77:	55                   	push   %ebp
 8048b78:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048b7a:	8b 45 10             	mov    0x10(%ebp),%eax
 8048b7d:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048b80:	7f 29                	jg     8048bab <inplane+0x34>
 8048b82:	8b 55 10             	mov    0x10(%ebp),%edx
 8048b85:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b88:	01 d0                	add    %edx,%eax
 8048b8a:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048b8d:	7c 1c                	jl     8048bab <inplane+0x34>
 8048b8f:	8b 45 14             	mov    0x14(%ebp),%eax
 8048b92:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048b95:	7f 14                	jg     8048bab <inplane+0x34>
 8048b97:	8b 55 14             	mov    0x14(%ebp),%edx
 8048b9a:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b9d:	01 d0                	add    %edx,%eax
 8048b9f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048ba2:	7c 07                	jl     8048bab <inplane+0x34>
 8048ba4:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ba9:	eb 05                	jmp    8048bb0 <inplane+0x39>
 8048bab:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048bb0:	5d                   	pop    %ebp
 8048bb1:	c3                   	ret    

08048bb2 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048bb2:	55                   	push   %ebp
 8048bb3:	89 e5                	mov    %esp,%ebp
 8048bb5:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048bb8:	8b 45 18             	mov    0x18(%ebp),%eax
 8048bbb:	8b 00                	mov    (%eax),%eax
 8048bbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048bc0:	8b 45 18             	mov    0x18(%ebp),%eax
 8048bc3:	8b 40 04             	mov    0x4(%eax),%eax
 8048bc6:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048bc9:	8b 45 18             	mov    0x18(%ebp),%eax
 8048bcc:	8b 40 08             	mov    0x8(%eax),%eax
 8048bcf:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048bd2:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bd5:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048bd8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bdb:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048bde:	8b 45 10             	mov    0x10(%ebp),%eax
 8048be1:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048be4:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048be7:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bea:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048bed:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048bf1:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048bf4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048bf8:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048bfb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048bff:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048c03:	89 04 24             	mov    %eax,(%esp)
 8048c06:	e8 6c ff ff ff       	call   8048b77 <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048c0b:	85 c0                	test   %eax,%eax
 8048c0d:	0f 85 69 01 00 00    	jne    8048d7c <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048c13:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c16:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048c19:	8b 55 10             	mov    0x10(%ebp),%edx
 8048c1c:	01 d1                	add    %edx,%ecx
 8048c1e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c21:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c25:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c28:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c2c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c2f:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048c33:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c37:	89 0c 24             	mov    %ecx,(%esp)
 8048c3a:	e8 38 ff ff ff       	call   8048b77 <inplane>
 8048c3f:	85 c0                	test   %eax,%eax
 8048c41:	0f 85 35 01 00 00    	jne    8048d7c <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048c47:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c4a:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c4d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048c50:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c53:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c56:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c5a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048c5d:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c61:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c64:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048c68:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048c6c:	89 04 24             	mov    %eax,(%esp)
 8048c6f:	e8 03 ff ff ff       	call   8048b77 <inplane>
 8048c74:	85 c0                	test   %eax,%eax
 8048c76:	0f 85 00 01 00 00    	jne    8048d7c <bang_or_not+0x1ca>
 8048c7c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c7f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c82:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048c85:	8b 55 08             	mov    0x8(%ebp),%edx
 8048c88:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c8b:	01 c2                	add    %eax,%edx
 8048c8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c90:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c94:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048c97:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048c9e:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048ca2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048ca6:	89 14 24             	mov    %edx,(%esp)
 8048ca9:	e8 c9 fe ff ff       	call   8048b77 <inplane>
 8048cae:	85 c0                	test   %eax,%eax
 8048cb0:	0f 85 c6 00 00 00    	jne    8048d7c <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048cb6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cbc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048cbf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048cc3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048cc6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048cca:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048ccd:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048cd1:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048cd5:	89 04 24             	mov    %eax,(%esp)
 8048cd8:	e8 9a fe ff ff       	call   8048b77 <inplane>
 8048cdd:	85 c0                	test   %eax,%eax
 8048cdf:	0f 85 97 00 00 00    	jne    8048d7c <bang_or_not+0x1ca>
 8048ce5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ce8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048ceb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048cee:	01 d1                	add    %edx,%ecx
 8048cf0:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048cf3:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048cf7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048cfa:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048cfe:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048d01:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048d05:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048d09:	89 0c 24             	mov    %ecx,(%esp)
 8048d0c:	e8 66 fe ff ff       	call   8048b77 <inplane>
 8048d11:	85 c0                	test   %eax,%eax
 8048d13:	75 67                	jne    8048d7c <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048d15:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d18:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d1b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d21:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048d24:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048d28:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048d2b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048d2f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048d32:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048d36:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d3a:	89 04 24             	mov    %eax,(%esp)
 8048d3d:	e8 35 fe ff ff       	call   8048b77 <inplane>
 8048d42:	85 c0                	test   %eax,%eax
 8048d44:	75 36                	jne    8048d7c <bang_or_not+0x1ca>
 8048d46:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d49:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d4c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048d4f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048d52:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d55:	01 c2                	add    %eax,%edx
 8048d57:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d5a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048d61:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048d65:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d68:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048d6c:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048d70:	89 14 24             	mov    %edx,(%esp)
 8048d73:	e8 ff fd ff ff       	call   8048b77 <inplane>
 8048d78:	85 c0                	test   %eax,%eax
 8048d7a:	74 07                	je     8048d83 <bang_or_not+0x1d1>
 8048d7c:	b8 01 00 00 00       	mov    $0x1,%eax
 8048d81:	eb 05                	jmp    8048d88 <bang_or_not+0x1d6>
 8048d83:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048d88:	c9                   	leave  
 8048d89:	c3                   	ret    

08048d8a <update_bang>:

void update_bang(void) {
 8048d8a:	55                   	push   %ebp
 8048d8b:	89 e5                	mov    %esp,%ebp
 8048d8d:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048d90:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048d95:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d98:	eb 7c                	jmp    8048e16 <update_bang+0x8c>
		st_t next=st_next(it);
 8048d9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d9d:	89 04 24             	mov    %eax,(%esp)
 8048da0:	e8 64 fa ff ff       	call   8048809 <st_next>
 8048da5:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048da8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048dab:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048daf:	a1 0c 5c 09 08       	mov    0x8095c0c,%eax
 8048db4:	89 04 24             	mov    %eax,(%esp)
 8048db7:	a1 10 5c 09 08       	mov    0x8095c10,%eax
 8048dbc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048dc0:	a1 14 5c 09 08       	mov    0x8095c14,%eax
 8048dc5:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048dc9:	a1 18 5c 09 08       	mov    0x8095c18,%eax
 8048dce:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048dd2:	e8 db fd ff ff       	call   8048bb2 <bang_or_not>
 8048dd7:	85 c0                	test   %eax,%eax
 8048dd9:	74 35                	je     8048e10 <update_bang+0x86>
			score++;
 8048ddb:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
 8048de0:	83 c0 01             	add    $0x1,%eax
 8048de3:	a3 e0 5d 08 08       	mov    %eax,0x8085de0
			st_remove(it);
 8048de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048deb:	89 04 24             	mov    %eax,(%esp)
 8048dee:	e8 b6 fa ff ff       	call   80488a9 <st_remove>
			if(it==head)
 8048df3:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048df8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048dfb:	75 08                	jne    8048e05 <update_bang+0x7b>
				head=next;
 8048dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e00:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e08:	89 04 24             	mov    %eax,(%esp)
 8048e0b:	e8 fb fa ff ff       	call   804890b <st_free>
		}
		it=next;
 8048e10:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e13:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048e16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048e1a:	0f 85 7a ff ff ff    	jne    8048d9a <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8048e20:	c9                   	leave  
 8048e21:	c3                   	ret    

08048e22 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8048e22:	55                   	push   %ebp
 8048e23:	89 e5                	mov    %esp,%ebp
 8048e25:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8048e28:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048e2c:	78 18                	js     8048e46 <draw_pixel+0x24>
 8048e2e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048e32:	78 12                	js     8048e46 <draw_pixel+0x24>
 8048e34:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 8048e3b:	7f 09                	jg     8048e46 <draw_pixel+0x24>
 8048e3d:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8048e44:	7e 24                	jle    8048e6a <draw_pixel+0x48>
 8048e46:	c7 44 24 0c c8 9f 04 	movl   $0x8049fc8,0xc(%esp)
 8048e4d:	08 
 8048e4e:	c7 44 24 08 fc 9f 04 	movl   $0x8049ffc,0x8(%esp)
 8048e55:	08 
 8048e56:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048e5d:	00 
 8048e5e:	c7 04 24 11 a0 04 08 	movl   $0x804a011,(%esp)
 8048e65:	e8 1b f3 ff ff       	call   8048185 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 8048e6a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e6d:	c1 e0 08             	shl    $0x8,%eax
 8048e70:	89 c2                	mov    %eax,%edx
 8048e72:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e75:	c1 e0 06             	shl    $0x6,%eax
 8048e78:	01 c2                	add    %eax,%edx
 8048e7a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048e7d:	01 c2                	add    %eax,%edx
 8048e7f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e82:	88 82 00 5e 08 08    	mov    %al,0x8085e00(%edx)
}
 8048e88:	c9                   	leave  
 8048e89:	c3                   	ret    

08048e8a <sysclean>:


void sysclean(void)
{
 8048e8a:	55                   	push   %ebp
 8048e8b:	89 e5                	mov    %esp,%ebp
 8048e8d:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
 8048e90:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 8048e97:	00 
 8048e98:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048e9f:	00 
 8048ea0:	c7 04 24 00 5e 08 08 	movl   $0x8085e00,(%esp)
 8048ea7:	e8 17 02 00 00       	call   80490c3 <memset>
}
 8048eac:	c9                   	leave  
 8048ead:	c3                   	ret    

08048eae <syspr>:
int syspr()
{
 8048eae:	55                   	push   %ebp
 8048eaf:	89 e5                	mov    %esp,%ebp
 8048eb1:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
 8048eb4:	c7 44 24 04 00 5e 08 	movl   $0x8085e00,0x4(%esp)
 8048ebb:	08 
 8048ebc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048ec3:	e8 b1 00 00 00       	call   8048f79 <syscall>
}
 8048ec8:	c9                   	leave  
 8048ec9:	c3                   	ret    

08048eca <systime>:

int systime(void)
{
 8048eca:	55                   	push   %ebp
 8048ecb:	89 e5                	mov    %esp,%ebp
 8048ecd:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
 8048ed0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048ed7:	e8 9d 00 00 00       	call   8048f79 <syscall>
}
 8048edc:	c9                   	leave  
 8048edd:	c3                   	ret    

08048ede <sysreadkey>:

int sysreadkey(void)
{
 8048ede:	55                   	push   %ebp
 8048edf:	89 e5                	mov    %esp,%ebp
 8048ee1:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
 8048ee4:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048eeb:	e8 89 00 00 00       	call   8048f79 <syscall>
}
 8048ef0:	c9                   	leave  
 8048ef1:	c3                   	ret    

08048ef2 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8048ef2:	55                   	push   %ebp
 8048ef3:	89 e5                	mov    %esp,%ebp
 8048ef5:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
 8048ef8:	8b 45 10             	mov    0x10(%ebp),%eax
 8048efb:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048eff:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f02:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f06:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f09:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f0d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048f14:	e8 60 00 00 00       	call   8048f79 <syscall>
}
 8048f19:	c9                   	leave  
 8048f1a:	c3                   	ret    

08048f1b <fork>:

int fork(void)
{
 8048f1b:	55                   	push   %ebp
 8048f1c:	89 e5                	mov    %esp,%ebp
 8048f1e:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
 8048f21:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 8048f28:	e8 4c 00 00 00       	call   8048f79 <syscall>
}
 8048f2d:	c9                   	leave  
 8048f2e:	c3                   	ret    

08048f2f <getpid>:

int getpid(void)
{
 8048f2f:	55                   	push   %ebp
 8048f30:	89 e5                	mov    %esp,%ebp
 8048f32:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
 8048f35:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
 8048f3c:	e8 38 00 00 00       	call   8048f79 <syscall>
}
 8048f41:	c9                   	leave  
 8048f42:	c3                   	ret    

08048f43 <exit>:

void exit(int suc)
{
 8048f43:	55                   	push   %ebp
 8048f44:	89 e5                	mov    %esp,%ebp
 8048f46:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
 8048f49:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f4c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f50:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 8048f57:	e8 1d 00 00 00       	call   8048f79 <syscall>
}
 8048f5c:	c9                   	leave  
 8048f5d:	c3                   	ret    

08048f5e <sleep>:

void sleep(int sec)
{
 8048f5e:	55                   	push   %ebp
 8048f5f:	89 e5                	mov    %esp,%ebp
 8048f61:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
 8048f64:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f67:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f6b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048f72:	e8 02 00 00 00       	call   8048f79 <syscall>
	//printf("qweqwe");
}
 8048f77:	c9                   	leave  
 8048f78:	c3                   	ret    

08048f79 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 8048f79:	55                   	push   %ebp
 8048f7a:	89 e5                	mov    %esp,%ebp
 8048f7c:	53                   	push   %ebx
 8048f7d:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 8048f80:	8d 45 08             	lea    0x8(%ebp),%eax
 8048f83:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 8048f86:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f89:	8b 00                	mov    (%eax),%eax
 8048f8b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f8e:	83 c2 04             	add    $0x4,%edx
 8048f91:	8b 1a                	mov    (%edx),%ebx
 8048f93:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f96:	83 c2 08             	add    $0x8,%edx
 8048f99:	8b 0a                	mov    (%edx),%ecx
 8048f9b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f9e:	83 c2 0c             	add    $0xc,%edx
 8048fa1:	8b 12                	mov    (%edx),%edx
 8048fa3:	cd 80                	int    $0x80
 8048fa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 8048fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048fab:	83 c4 10             	add    $0x10,%esp
 8048fae:	5b                   	pop    %ebx
 8048faf:	5d                   	pop    %ebp
 8048fb0:	c3                   	ret    

08048fb1 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 8048fb1:	55                   	push   %ebp
 8048fb2:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 8048fb4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fb7:	8b 00                	mov    (%eax),%eax
 8048fb9:	8d 48 01             	lea    0x1(%eax),%ecx
 8048fbc:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fbf:	89 0a                	mov    %ecx,(%edx)
 8048fc1:	8b 55 08             	mov    0x8(%ebp),%edx
 8048fc4:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 8048fca:	5d                   	pop    %ebp
 8048fcb:	c3                   	ret    

08048fcc <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 8048fcc:	55                   	push   %ebp
 8048fcd:	89 e5                	mov    %esp,%ebp
 8048fcf:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 8048fd2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 8048fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fdc:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048fe0:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fe3:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048fe7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048fea:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fee:	c7 04 24 b1 8f 04 08 	movl   $0x8048fb1,(%esp)
 8048ff5:	e8 d1 06 00 00       	call   80496cb <vprintfmt>
	return cnt;
 8048ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048ffd:	c9                   	leave  
 8048ffe:	c3                   	ret    

08048fff <printf>:
int printf(const char *fmt, ...)
{
 8048fff:	55                   	push   %ebp
 8049000:	89 e5                	mov    %esp,%ebp
 8049002:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8049005:	8d 45 0c             	lea    0xc(%ebp),%eax
 8049008:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 804900b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804900e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049012:	8b 45 08             	mov    0x8(%ebp),%eax
 8049015:	89 04 24             	mov    %eax,(%esp)
 8049018:	e8 af ff ff ff       	call   8048fcc <vprintf>
 804901d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 8049020:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049023:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049027:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 804902e:	08 
 804902f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049036:	e8 b7 fe ff ff       	call   8048ef2 <syswrite>
	return cnt;
 804903b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804903e:	c9                   	leave  
 804903f:	c3                   	ret    

08049040 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 8049040:	55                   	push   %ebp
 8049041:	89 e5                	mov    %esp,%ebp
 8049043:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 8049046:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 804904d:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049051:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049054:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8049059:	89 c8                	mov    %ecx,%eax
 804905b:	f7 ea                	imul   %edx
 804905d:	c1 fa 02             	sar    $0x2,%edx
 8049060:	89 c8                	mov    %ecx,%eax
 8049062:	c1 f8 1f             	sar    $0x1f,%eax
 8049065:	29 c2                	sub    %eax,%edx
 8049067:	89 d0                	mov    %edx,%eax
 8049069:	c1 e0 02             	shl    $0x2,%eax
 804906c:	01 d0                	add    %edx,%eax
 804906e:	01 c0                	add    %eax,%eax
 8049070:	29 c1                	sub    %eax,%ecx
 8049072:	89 ca                	mov    %ecx,%edx
 8049074:	89 d0                	mov    %edx,%eax
 8049076:	83 c0 30             	add    $0x30,%eax
 8049079:	89 c2                	mov    %eax,%edx
 804907b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804907e:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 8049080:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049083:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8049088:	89 c8                	mov    %ecx,%eax
 804908a:	f7 ea                	imul   %edx
 804908c:	c1 fa 02             	sar    $0x2,%edx
 804908f:	89 c8                	mov    %ecx,%eax
 8049091:	c1 f8 1f             	sar    $0x1f,%eax
 8049094:	29 c2                	sub    %eax,%edx
 8049096:	89 d0                	mov    %edx,%eax
 8049098:	89 45 08             	mov    %eax,0x8(%ebp)
 804909b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804909f:	75 ac                	jne    804904d <itoa+0xd>
	return p;
 80490a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80490a4:	c9                   	leave  
 80490a5:	c3                   	ret    

080490a6 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 80490a6:	55                   	push   %ebp
 80490a7:	89 e5                	mov    %esp,%ebp
 80490a9:	57                   	push   %edi
 80490aa:	56                   	push   %esi
 80490ab:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 80490ac:	8b 45 10             	mov    0x10(%ebp),%eax
 80490af:	8b 55 0c             	mov    0xc(%ebp),%edx
 80490b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80490b5:	89 c1                	mov    %eax,%ecx
 80490b7:	89 d6                	mov    %edx,%esi
 80490b9:	89 df                	mov    %ebx,%edi
 80490bb:	fc                   	cld    
 80490bc:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 80490be:	5b                   	pop    %ebx
 80490bf:	5e                   	pop    %esi
 80490c0:	5f                   	pop    %edi
 80490c1:	5d                   	pop    %ebp
 80490c2:	c3                   	ret    

080490c3 <memset>:

void memset(void *dest, int data, size_t size) {
 80490c3:	55                   	push   %ebp
 80490c4:	89 e5                	mov    %esp,%ebp
 80490c6:	57                   	push   %edi
 80490c7:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 80490c8:	8b 55 10             	mov    0x10(%ebp),%edx
 80490cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80490d1:	89 d1                	mov    %edx,%ecx
 80490d3:	89 df                	mov    %ebx,%edi
 80490d5:	fc                   	cld    
 80490d6:	f3 aa                	rep stos %al,%es:(%edi)
}
 80490d8:	5b                   	pop    %ebx
 80490d9:	5f                   	pop    %edi
 80490da:	5d                   	pop    %ebp
 80490db:	c3                   	ret    

080490dc <strlen>:

size_t strlen(const char *str) {
 80490dc:	55                   	push   %ebp
 80490dd:	89 e5                	mov    %esp,%ebp
 80490df:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 80490e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 80490e9:	eb 04                	jmp    80490ef <strlen+0x13>
 80490eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80490ef:	8b 45 08             	mov    0x8(%ebp),%eax
 80490f2:	8d 50 01             	lea    0x1(%eax),%edx
 80490f5:	89 55 08             	mov    %edx,0x8(%ebp)
 80490f8:	0f b6 00             	movzbl (%eax),%eax
 80490fb:	84 c0                	test   %al,%al
 80490fd:	75 ec                	jne    80490eb <strlen+0xf>
	return len;
 80490ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049102:	c9                   	leave  
 8049103:	c3                   	ret    

08049104 <strcpy>:

void strcpy(char *d, const char *s) {
 8049104:	55                   	push   %ebp
 8049105:	89 e5                	mov    %esp,%ebp
 8049107:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 804910a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804910d:	89 04 24             	mov    %eax,(%esp)
 8049110:	e8 c7 ff ff ff       	call   80490dc <strlen>
 8049115:	83 c0 01             	add    $0x1,%eax
 8049118:	89 44 24 08          	mov    %eax,0x8(%esp)
 804911c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804911f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049123:	8b 45 08             	mov    0x8(%ebp),%eax
 8049126:	89 04 24             	mov    %eax,(%esp)
 8049129:	e8 78 ff ff ff       	call   80490a6 <memcpy>
}
 804912e:	c9                   	leave  
 804912f:	c3                   	ret    

08049130 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 8049130:	55                   	push   %ebp
 8049131:	89 e5                	mov    %esp,%ebp
 8049133:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049136:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804913d:	eb 0c                	jmp    804914b <strnlen+0x1b>
		n++;
 804913f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049143:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049147:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 804914b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804914f:	74 0a                	je     804915b <strnlen+0x2b>
 8049151:	8b 45 08             	mov    0x8(%ebp),%eax
 8049154:	0f b6 00             	movzbl (%eax),%eax
 8049157:	84 c0                	test   %al,%al
 8049159:	75 e4                	jne    804913f <strnlen+0xf>
		n++;
	return n;
 804915b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 804915e:	c9                   	leave  
 804915f:	c3                   	ret    

08049160 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 8049160:	55                   	push   %ebp
 8049161:	89 e5                	mov    %esp,%ebp
 8049163:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 8049166:	8b 45 08             	mov    0x8(%ebp),%eax
 8049169:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 804916c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049173:	eb 23                	jmp    8049198 <strncpy+0x38>
		*dst++ = *src;
 8049175:	8b 45 08             	mov    0x8(%ebp),%eax
 8049178:	8d 50 01             	lea    0x1(%eax),%edx
 804917b:	89 55 08             	mov    %edx,0x8(%ebp)
 804917e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049181:	0f b6 12             	movzbl (%edx),%edx
 8049184:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 8049186:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049189:	0f b6 00             	movzbl (%eax),%eax
 804918c:	84 c0                	test   %al,%al
 804918e:	74 04                	je     8049194 <strncpy+0x34>
			src++;
 8049190:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 8049194:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049198:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804919b:	3b 45 10             	cmp    0x10(%ebp),%eax
 804919e:	72 d5                	jb     8049175 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 80491a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80491a3:	c9                   	leave  
 80491a4:	c3                   	ret    

080491a5 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 80491a5:	55                   	push   %ebp
 80491a6:	89 e5                	mov    %esp,%ebp
 80491a8:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 80491ab:	8b 45 08             	mov    0x8(%ebp),%eax
 80491ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 80491b1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491b5:	74 33                	je     80491ea <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 80491b7:	eb 17                	jmp    80491d0 <strlcpy+0x2b>
			*dst++ = *src++;
 80491b9:	8b 45 08             	mov    0x8(%ebp),%eax
 80491bc:	8d 50 01             	lea    0x1(%eax),%edx
 80491bf:	89 55 08             	mov    %edx,0x8(%ebp)
 80491c2:	8b 55 0c             	mov    0xc(%ebp),%edx
 80491c5:	8d 4a 01             	lea    0x1(%edx),%ecx
 80491c8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80491cb:	0f b6 12             	movzbl (%edx),%edx
 80491ce:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 80491d0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 80491d4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491d8:	74 0a                	je     80491e4 <strlcpy+0x3f>
 80491da:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491dd:	0f b6 00             	movzbl (%eax),%eax
 80491e0:	84 c0                	test   %al,%al
 80491e2:	75 d5                	jne    80491b9 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 80491e4:	8b 45 08             	mov    0x8(%ebp),%eax
 80491e7:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 80491ea:	8b 55 08             	mov    0x8(%ebp),%edx
 80491ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80491f0:	29 c2                	sub    %eax,%edx
 80491f2:	89 d0                	mov    %edx,%eax
}
 80491f4:	c9                   	leave  
 80491f5:	c3                   	ret    

080491f6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 80491f6:	55                   	push   %ebp
 80491f7:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 80491f9:	eb 08                	jmp    8049203 <strcmp+0xd>
		p++, q++;
 80491fb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80491ff:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 8049203:	8b 45 08             	mov    0x8(%ebp),%eax
 8049206:	0f b6 00             	movzbl (%eax),%eax
 8049209:	84 c0                	test   %al,%al
 804920b:	74 10                	je     804921d <strcmp+0x27>
 804920d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049210:	0f b6 10             	movzbl (%eax),%edx
 8049213:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049216:	0f b6 00             	movzbl (%eax),%eax
 8049219:	38 c2                	cmp    %al,%dl
 804921b:	74 de                	je     80491fb <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 804921d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049220:	0f b6 00             	movzbl (%eax),%eax
 8049223:	0f b6 d0             	movzbl %al,%edx
 8049226:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049229:	0f b6 00             	movzbl (%eax),%eax
 804922c:	0f b6 c0             	movzbl %al,%eax
 804922f:	29 c2                	sub    %eax,%edx
 8049231:	89 d0                	mov    %edx,%eax
}
 8049233:	5d                   	pop    %ebp
 8049234:	c3                   	ret    

08049235 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 8049235:	55                   	push   %ebp
 8049236:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 8049238:	eb 0c                	jmp    8049246 <strncmp+0x11>
		n--, p++, q++;
 804923a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 804923e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049242:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 8049246:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804924a:	74 1a                	je     8049266 <strncmp+0x31>
 804924c:	8b 45 08             	mov    0x8(%ebp),%eax
 804924f:	0f b6 00             	movzbl (%eax),%eax
 8049252:	84 c0                	test   %al,%al
 8049254:	74 10                	je     8049266 <strncmp+0x31>
 8049256:	8b 45 08             	mov    0x8(%ebp),%eax
 8049259:	0f b6 10             	movzbl (%eax),%edx
 804925c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804925f:	0f b6 00             	movzbl (%eax),%eax
 8049262:	38 c2                	cmp    %al,%dl
 8049264:	74 d4                	je     804923a <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 8049266:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804926a:	75 07                	jne    8049273 <strncmp+0x3e>
		return 0;
 804926c:	b8 00 00 00 00       	mov    $0x0,%eax
 8049271:	eb 16                	jmp    8049289 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 8049273:	8b 45 08             	mov    0x8(%ebp),%eax
 8049276:	0f b6 00             	movzbl (%eax),%eax
 8049279:	0f b6 d0             	movzbl %al,%edx
 804927c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804927f:	0f b6 00             	movzbl (%eax),%eax
 8049282:	0f b6 c0             	movzbl %al,%eax
 8049285:	29 c2                	sub    %eax,%edx
 8049287:	89 d0                	mov    %edx,%eax
}
 8049289:	5d                   	pop    %ebp
 804928a:	c3                   	ret    

0804928b <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 804928b:	55                   	push   %ebp
 804928c:	89 e5                	mov    %esp,%ebp
 804928e:	83 ec 04             	sub    $0x4,%esp
 8049291:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049294:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 8049297:	eb 14                	jmp    80492ad <strchr+0x22>
		if (*s == c)
 8049299:	8b 45 08             	mov    0x8(%ebp),%eax
 804929c:	0f b6 00             	movzbl (%eax),%eax
 804929f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80492a2:	75 05                	jne    80492a9 <strchr+0x1e>
			return (char *) s;
 80492a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80492a7:	eb 13                	jmp    80492bc <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 80492a9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80492ad:	8b 45 08             	mov    0x8(%ebp),%eax
 80492b0:	0f b6 00             	movzbl (%eax),%eax
 80492b3:	84 c0                	test   %al,%al
 80492b5:	75 e2                	jne    8049299 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 80492b7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80492bc:	c9                   	leave  
 80492bd:	c3                   	ret    

080492be <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 80492be:	55                   	push   %ebp
 80492bf:	89 e5                	mov    %esp,%ebp
 80492c1:	83 ec 04             	sub    $0x4,%esp
 80492c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492c7:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80492ca:	eb 11                	jmp    80492dd <strfind+0x1f>
		if (*s == c)
 80492cc:	8b 45 08             	mov    0x8(%ebp),%eax
 80492cf:	0f b6 00             	movzbl (%eax),%eax
 80492d2:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80492d5:	75 02                	jne    80492d9 <strfind+0x1b>
			break;
 80492d7:	eb 0e                	jmp    80492e7 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 80492d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80492dd:	8b 45 08             	mov    0x8(%ebp),%eax
 80492e0:	0f b6 00             	movzbl (%eax),%eax
 80492e3:	84 c0                	test   %al,%al
 80492e5:	75 e5                	jne    80492cc <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 80492e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80492ea:	c9                   	leave  
 80492eb:	c3                   	ret    

080492ec <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 80492ec:	55                   	push   %ebp
 80492ed:	89 e5                	mov    %esp,%ebp
 80492ef:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 80492f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 80492f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80492fb:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 80492fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049301:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049304:	73 3d                	jae    8049343 <memmove+0x57>
 8049306:	8b 45 10             	mov    0x10(%ebp),%eax
 8049309:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804930c:	01 d0                	add    %edx,%eax
 804930e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049311:	76 30                	jbe    8049343 <memmove+0x57>
		s += n;
 8049313:	8b 45 10             	mov    0x10(%ebp),%eax
 8049316:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 8049319:	8b 45 10             	mov    0x10(%ebp),%eax
 804931c:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 804931f:	eb 13                	jmp    8049334 <memmove+0x48>
			*--d = *--s;
 8049321:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 8049325:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049329:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804932c:	0f b6 10             	movzbl (%eax),%edx
 804932f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049332:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 8049334:	8b 45 10             	mov    0x10(%ebp),%eax
 8049337:	8d 50 ff             	lea    -0x1(%eax),%edx
 804933a:	89 55 10             	mov    %edx,0x10(%ebp)
 804933d:	85 c0                	test   %eax,%eax
 804933f:	75 e0                	jne    8049321 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 8049341:	eb 26                	jmp    8049369 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049343:	eb 17                	jmp    804935c <memmove+0x70>
			*d++ = *s++;
 8049345:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049348:	8d 50 01             	lea    0x1(%eax),%edx
 804934b:	89 55 f8             	mov    %edx,-0x8(%ebp)
 804934e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049351:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049354:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 8049357:	0f b6 12             	movzbl (%edx),%edx
 804935a:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 804935c:	8b 45 10             	mov    0x10(%ebp),%eax
 804935f:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049362:	89 55 10             	mov    %edx,0x10(%ebp)
 8049365:	85 c0                	test   %eax,%eax
 8049367:	75 dc                	jne    8049345 <memmove+0x59>
			*d++ = *s++;

	return dst;
 8049369:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804936c:	c9                   	leave  
 804936d:	c3                   	ret    

0804936e <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 804936e:	55                   	push   %ebp
 804936f:	89 e5                	mov    %esp,%ebp
 8049371:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 8049374:	8b 45 08             	mov    0x8(%ebp),%eax
 8049377:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 804937a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804937d:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 8049380:	eb 30                	jmp    80493b2 <memcmp+0x44>
		if (*s1 != *s2)
 8049382:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049385:	0f b6 10             	movzbl (%eax),%edx
 8049388:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804938b:	0f b6 00             	movzbl (%eax),%eax
 804938e:	38 c2                	cmp    %al,%dl
 8049390:	74 18                	je     80493aa <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 8049392:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049395:	0f b6 00             	movzbl (%eax),%eax
 8049398:	0f b6 d0             	movzbl %al,%edx
 804939b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804939e:	0f b6 00             	movzbl (%eax),%eax
 80493a1:	0f b6 c0             	movzbl %al,%eax
 80493a4:	29 c2                	sub    %eax,%edx
 80493a6:	89 d0                	mov    %edx,%eax
 80493a8:	eb 1a                	jmp    80493c4 <memcmp+0x56>
		s1++, s2++;
 80493aa:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80493ae:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 80493b2:	8b 45 10             	mov    0x10(%ebp),%eax
 80493b5:	8d 50 ff             	lea    -0x1(%eax),%edx
 80493b8:	89 55 10             	mov    %edx,0x10(%ebp)
 80493bb:	85 c0                	test   %eax,%eax
 80493bd:	75 c3                	jne    8049382 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 80493bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80493c4:	c9                   	leave  
 80493c5:	c3                   	ret    

080493c6 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 80493c6:	55                   	push   %ebp
 80493c7:	89 e5                	mov    %esp,%ebp
 80493c9:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 80493cc:	8b 45 10             	mov    0x10(%ebp),%eax
 80493cf:	8b 55 08             	mov    0x8(%ebp),%edx
 80493d2:	01 d0                	add    %edx,%eax
 80493d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 80493d7:	eb 13                	jmp    80493ec <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 80493d9:	8b 45 08             	mov    0x8(%ebp),%eax
 80493dc:	0f b6 10             	movzbl (%eax),%edx
 80493df:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493e2:	38 c2                	cmp    %al,%dl
 80493e4:	75 02                	jne    80493e8 <memfind+0x22>
			break;
 80493e6:	eb 0c                	jmp    80493f4 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 80493e8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80493ec:	8b 45 08             	mov    0x8(%ebp),%eax
 80493ef:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80493f2:	72 e5                	jb     80493d9 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 80493f4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80493f7:	c9                   	leave  
 80493f8:	c3                   	ret    

080493f9 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 80493f9:	55                   	push   %ebp
 80493fa:	89 e5                	mov    %esp,%ebp
 80493fc:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 80493ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 8049406:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 804940d:	eb 04                	jmp    8049413 <strtol+0x1a>
		s++;
 804940f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049413:	8b 45 08             	mov    0x8(%ebp),%eax
 8049416:	0f b6 00             	movzbl (%eax),%eax
 8049419:	3c 20                	cmp    $0x20,%al
 804941b:	74 f2                	je     804940f <strtol+0x16>
 804941d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049420:	0f b6 00             	movzbl (%eax),%eax
 8049423:	3c 09                	cmp    $0x9,%al
 8049425:	74 e8                	je     804940f <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 8049427:	8b 45 08             	mov    0x8(%ebp),%eax
 804942a:	0f b6 00             	movzbl (%eax),%eax
 804942d:	3c 2b                	cmp    $0x2b,%al
 804942f:	75 06                	jne    8049437 <strtol+0x3e>
		s++;
 8049431:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049435:	eb 15                	jmp    804944c <strtol+0x53>
	else if (*s == '-')
 8049437:	8b 45 08             	mov    0x8(%ebp),%eax
 804943a:	0f b6 00             	movzbl (%eax),%eax
 804943d:	3c 2d                	cmp    $0x2d,%al
 804943f:	75 0b                	jne    804944c <strtol+0x53>
		s++, neg = 1;
 8049441:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049445:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 804944c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049450:	74 06                	je     8049458 <strtol+0x5f>
 8049452:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 8049456:	75 24                	jne    804947c <strtol+0x83>
 8049458:	8b 45 08             	mov    0x8(%ebp),%eax
 804945b:	0f b6 00             	movzbl (%eax),%eax
 804945e:	3c 30                	cmp    $0x30,%al
 8049460:	75 1a                	jne    804947c <strtol+0x83>
 8049462:	8b 45 08             	mov    0x8(%ebp),%eax
 8049465:	83 c0 01             	add    $0x1,%eax
 8049468:	0f b6 00             	movzbl (%eax),%eax
 804946b:	3c 78                	cmp    $0x78,%al
 804946d:	75 0d                	jne    804947c <strtol+0x83>
		s += 2, base = 16;
 804946f:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 8049473:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 804947a:	eb 2a                	jmp    80494a6 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 804947c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049480:	75 17                	jne    8049499 <strtol+0xa0>
 8049482:	8b 45 08             	mov    0x8(%ebp),%eax
 8049485:	0f b6 00             	movzbl (%eax),%eax
 8049488:	3c 30                	cmp    $0x30,%al
 804948a:	75 0d                	jne    8049499 <strtol+0xa0>
		s++, base = 8;
 804948c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049490:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 8049497:	eb 0d                	jmp    80494a6 <strtol+0xad>
	else if (base == 0)
 8049499:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804949d:	75 07                	jne    80494a6 <strtol+0xad>
		base = 10;
 804949f:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 80494a6:	8b 45 08             	mov    0x8(%ebp),%eax
 80494a9:	0f b6 00             	movzbl (%eax),%eax
 80494ac:	3c 2f                	cmp    $0x2f,%al
 80494ae:	7e 1b                	jle    80494cb <strtol+0xd2>
 80494b0:	8b 45 08             	mov    0x8(%ebp),%eax
 80494b3:	0f b6 00             	movzbl (%eax),%eax
 80494b6:	3c 39                	cmp    $0x39,%al
 80494b8:	7f 11                	jg     80494cb <strtol+0xd2>
			dig = *s - '0';
 80494ba:	8b 45 08             	mov    0x8(%ebp),%eax
 80494bd:	0f b6 00             	movzbl (%eax),%eax
 80494c0:	0f be c0             	movsbl %al,%eax
 80494c3:	83 e8 30             	sub    $0x30,%eax
 80494c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80494c9:	eb 48                	jmp    8049513 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 80494cb:	8b 45 08             	mov    0x8(%ebp),%eax
 80494ce:	0f b6 00             	movzbl (%eax),%eax
 80494d1:	3c 60                	cmp    $0x60,%al
 80494d3:	7e 1b                	jle    80494f0 <strtol+0xf7>
 80494d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80494d8:	0f b6 00             	movzbl (%eax),%eax
 80494db:	3c 7a                	cmp    $0x7a,%al
 80494dd:	7f 11                	jg     80494f0 <strtol+0xf7>
			dig = *s - 'a' + 10;
 80494df:	8b 45 08             	mov    0x8(%ebp),%eax
 80494e2:	0f b6 00             	movzbl (%eax),%eax
 80494e5:	0f be c0             	movsbl %al,%eax
 80494e8:	83 e8 57             	sub    $0x57,%eax
 80494eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80494ee:	eb 23                	jmp    8049513 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 80494f0:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f3:	0f b6 00             	movzbl (%eax),%eax
 80494f6:	3c 40                	cmp    $0x40,%al
 80494f8:	7e 3d                	jle    8049537 <strtol+0x13e>
 80494fa:	8b 45 08             	mov    0x8(%ebp),%eax
 80494fd:	0f b6 00             	movzbl (%eax),%eax
 8049500:	3c 5a                	cmp    $0x5a,%al
 8049502:	7f 33                	jg     8049537 <strtol+0x13e>
			dig = *s - 'A' + 10;
 8049504:	8b 45 08             	mov    0x8(%ebp),%eax
 8049507:	0f b6 00             	movzbl (%eax),%eax
 804950a:	0f be c0             	movsbl %al,%eax
 804950d:	83 e8 37             	sub    $0x37,%eax
 8049510:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 8049513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049516:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049519:	7c 02                	jl     804951d <strtol+0x124>
			break;
 804951b:	eb 1a                	jmp    8049537 <strtol+0x13e>
		s++, val = (val * base) + dig;
 804951d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049521:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049524:	0f af 45 10          	imul   0x10(%ebp),%eax
 8049528:	89 c2                	mov    %eax,%edx
 804952a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804952d:	01 d0                	add    %edx,%eax
 804952f:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 8049532:	e9 6f ff ff ff       	jmp    80494a6 <strtol+0xad>

	if (endptr)
 8049537:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804953b:	74 08                	je     8049545 <strtol+0x14c>
		*endptr = (char *) s;
 804953d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049540:	8b 55 08             	mov    0x8(%ebp),%edx
 8049543:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 8049545:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8049549:	74 07                	je     8049552 <strtol+0x159>
 804954b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804954e:	f7 d8                	neg    %eax
 8049550:	eb 03                	jmp    8049555 <strtol+0x15c>
 8049552:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 8049555:	c9                   	leave  
 8049556:	c3                   	ret    

08049557 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 8049557:	55                   	push   %ebp
 8049558:	89 e5                	mov    %esp,%ebp
 804955a:	53                   	push   %ebx
 804955b:	83 ec 34             	sub    $0x34,%esp
 804955e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049561:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049564:	8b 45 14             	mov    0x14(%ebp),%eax
 8049567:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 804956a:	8b 45 18             	mov    0x18(%ebp),%eax
 804956d:	ba 00 00 00 00       	mov    $0x0,%edx
 8049572:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 8049575:	77 72                	ja     80495e9 <printnum+0x92>
 8049577:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 804957a:	72 05                	jb     8049581 <printnum+0x2a>
 804957c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 804957f:	77 68                	ja     80495e9 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 8049581:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049584:	8d 58 ff             	lea    -0x1(%eax),%ebx
 8049587:	8b 45 18             	mov    0x18(%ebp),%eax
 804958a:	ba 00 00 00 00       	mov    $0x0,%edx
 804958f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049593:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049597:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804959a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804959d:	89 04 24             	mov    %eax,(%esp)
 80495a0:	89 54 24 04          	mov    %edx,0x4(%esp)
 80495a4:	e8 57 06 00 00       	call   8049c00 <__udivdi3>
 80495a9:	8b 4d 20             	mov    0x20(%ebp),%ecx
 80495ac:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 80495b0:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 80495b4:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80495b7:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 80495bb:	89 44 24 08          	mov    %eax,0x8(%esp)
 80495bf:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80495c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495ca:	8b 45 08             	mov    0x8(%ebp),%eax
 80495cd:	89 04 24             	mov    %eax,(%esp)
 80495d0:	e8 82 ff ff ff       	call   8049557 <printnum>
 80495d5:	eb 1c                	jmp    80495f3 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 80495d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495da:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495de:	8b 45 20             	mov    0x20(%ebp),%eax
 80495e1:	89 04 24             	mov    %eax,(%esp)
 80495e4:	8b 45 08             	mov    0x8(%ebp),%eax
 80495e7:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 80495e9:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 80495ed:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 80495f1:	7f e4                	jg     80495d7 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 80495f3:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80495f6:	bb 00 00 00 00       	mov    $0x0,%ebx
 80495fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80495fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049601:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049605:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049609:	89 04 24             	mov    %eax,(%esp)
 804960c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049610:	e8 1b 07 00 00       	call   8049d30 <__umoddi3>
 8049615:	05 ac a0 04 08       	add    $0x804a0ac,%eax
 804961a:	0f b6 00             	movzbl (%eax),%eax
 804961d:	0f be c0             	movsbl %al,%eax
 8049620:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049623:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049627:	89 04 24             	mov    %eax,(%esp)
 804962a:	8b 45 08             	mov    0x8(%ebp),%eax
 804962d:	ff d0                	call   *%eax
}
 804962f:	83 c4 34             	add    $0x34,%esp
 8049632:	5b                   	pop    %ebx
 8049633:	5d                   	pop    %ebp
 8049634:	c3                   	ret    

08049635 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 8049635:	55                   	push   %ebp
 8049636:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 8049638:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 804963c:	7e 14                	jle    8049652 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 804963e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049641:	8b 00                	mov    (%eax),%eax
 8049643:	8d 48 08             	lea    0x8(%eax),%ecx
 8049646:	8b 55 08             	mov    0x8(%ebp),%edx
 8049649:	89 0a                	mov    %ecx,(%edx)
 804964b:	8b 50 04             	mov    0x4(%eax),%edx
 804964e:	8b 00                	mov    (%eax),%eax
 8049650:	eb 30                	jmp    8049682 <getuint+0x4d>
	else if (lflag)
 8049652:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049656:	74 16                	je     804966e <getuint+0x39>
		return va_arg(*ap, unsigned long);
 8049658:	8b 45 08             	mov    0x8(%ebp),%eax
 804965b:	8b 00                	mov    (%eax),%eax
 804965d:	8d 48 04             	lea    0x4(%eax),%ecx
 8049660:	8b 55 08             	mov    0x8(%ebp),%edx
 8049663:	89 0a                	mov    %ecx,(%edx)
 8049665:	8b 00                	mov    (%eax),%eax
 8049667:	ba 00 00 00 00       	mov    $0x0,%edx
 804966c:	eb 14                	jmp    8049682 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 804966e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049671:	8b 00                	mov    (%eax),%eax
 8049673:	8d 48 04             	lea    0x4(%eax),%ecx
 8049676:	8b 55 08             	mov    0x8(%ebp),%edx
 8049679:	89 0a                	mov    %ecx,(%edx)
 804967b:	8b 00                	mov    (%eax),%eax
 804967d:	ba 00 00 00 00       	mov    $0x0,%edx
}
 8049682:	5d                   	pop    %ebp
 8049683:	c3                   	ret    

08049684 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 8049684:	55                   	push   %ebp
 8049685:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 8049687:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 804968b:	7e 14                	jle    80496a1 <getint+0x1d>
		return va_arg(*ap, long long);
 804968d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049690:	8b 00                	mov    (%eax),%eax
 8049692:	8d 48 08             	lea    0x8(%eax),%ecx
 8049695:	8b 55 08             	mov    0x8(%ebp),%edx
 8049698:	89 0a                	mov    %ecx,(%edx)
 804969a:	8b 50 04             	mov    0x4(%eax),%edx
 804969d:	8b 00                	mov    (%eax),%eax
 804969f:	eb 28                	jmp    80496c9 <getint+0x45>
	else if (lflag)
 80496a1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80496a5:	74 12                	je     80496b9 <getint+0x35>
		return va_arg(*ap, long);
 80496a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80496aa:	8b 00                	mov    (%eax),%eax
 80496ac:	8d 48 04             	lea    0x4(%eax),%ecx
 80496af:	8b 55 08             	mov    0x8(%ebp),%edx
 80496b2:	89 0a                	mov    %ecx,(%edx)
 80496b4:	8b 00                	mov    (%eax),%eax
 80496b6:	99                   	cltd   
 80496b7:	eb 10                	jmp    80496c9 <getint+0x45>
	else
		return va_arg(*ap, int);
 80496b9:	8b 45 08             	mov    0x8(%ebp),%eax
 80496bc:	8b 00                	mov    (%eax),%eax
 80496be:	8d 48 04             	lea    0x4(%eax),%ecx
 80496c1:	8b 55 08             	mov    0x8(%ebp),%edx
 80496c4:	89 0a                	mov    %ecx,(%edx)
 80496c6:	8b 00                	mov    (%eax),%eax
 80496c8:	99                   	cltd   
}
 80496c9:	5d                   	pop    %ebp
 80496ca:	c3                   	ret    

080496cb <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 80496cb:	55                   	push   %ebp
 80496cc:	89 e5                	mov    %esp,%ebp
 80496ce:	56                   	push   %esi
 80496cf:	53                   	push   %ebx
 80496d0:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 80496d3:	eb 18                	jmp    80496ed <vprintfmt+0x22>
			if (ch == '\0')
 80496d5:	85 db                	test   %ebx,%ebx
 80496d7:	75 05                	jne    80496de <vprintfmt+0x13>
				return;
 80496d9:	e9 e9 03 00 00       	jmp    8049ac7 <vprintfmt+0x3fc>
			putch(ch, putdat);
 80496de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80496e5:	89 1c 24             	mov    %ebx,(%esp)
 80496e8:	8b 45 08             	mov    0x8(%ebp),%eax
 80496eb:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 80496ed:	8b 45 10             	mov    0x10(%ebp),%eax
 80496f0:	8d 50 01             	lea    0x1(%eax),%edx
 80496f3:	89 55 10             	mov    %edx,0x10(%ebp)
 80496f6:	0f b6 00             	movzbl (%eax),%eax
 80496f9:	0f b6 d8             	movzbl %al,%ebx
 80496fc:	83 fb 25             	cmp    $0x25,%ebx
 80496ff:	75 d4                	jne    80496d5 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 8049701:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 8049705:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 804970c:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 8049713:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 804971a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 8049721:	8b 45 10             	mov    0x10(%ebp),%eax
 8049724:	8d 50 01             	lea    0x1(%eax),%edx
 8049727:	89 55 10             	mov    %edx,0x10(%ebp)
 804972a:	0f b6 00             	movzbl (%eax),%eax
 804972d:	0f b6 d8             	movzbl %al,%ebx
 8049730:	8d 43 dd             	lea    -0x23(%ebx),%eax
 8049733:	83 f8 55             	cmp    $0x55,%eax
 8049736:	0f 87 5a 03 00 00    	ja     8049a96 <vprintfmt+0x3cb>
 804973c:	8b 04 85 d0 a0 04 08 	mov    0x804a0d0(,%eax,4),%eax
 8049743:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 8049745:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 8049749:	eb d6                	jmp    8049721 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 804974b:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 804974f:	eb d0                	jmp    8049721 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049751:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 8049758:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804975b:	89 d0                	mov    %edx,%eax
 804975d:	c1 e0 02             	shl    $0x2,%eax
 8049760:	01 d0                	add    %edx,%eax
 8049762:	01 c0                	add    %eax,%eax
 8049764:	01 d8                	add    %ebx,%eax
 8049766:	83 e8 30             	sub    $0x30,%eax
 8049769:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 804976c:	8b 45 10             	mov    0x10(%ebp),%eax
 804976f:	0f b6 00             	movzbl (%eax),%eax
 8049772:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 8049775:	83 fb 2f             	cmp    $0x2f,%ebx
 8049778:	7e 0b                	jle    8049785 <vprintfmt+0xba>
 804977a:	83 fb 39             	cmp    $0x39,%ebx
 804977d:	7f 06                	jg     8049785 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 804977f:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 8049783:	eb d3                	jmp    8049758 <vprintfmt+0x8d>
			goto process_precision;
 8049785:	eb 33                	jmp    80497ba <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 8049787:	8b 45 14             	mov    0x14(%ebp),%eax
 804978a:	8d 50 04             	lea    0x4(%eax),%edx
 804978d:	89 55 14             	mov    %edx,0x14(%ebp)
 8049790:	8b 00                	mov    (%eax),%eax
 8049792:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 8049795:	eb 23                	jmp    80497ba <vprintfmt+0xef>

		case '.':
			if (width < 0)
 8049797:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804979b:	79 0c                	jns    80497a9 <vprintfmt+0xde>
				width = 0;
 804979d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 80497a4:	e9 78 ff ff ff       	jmp    8049721 <vprintfmt+0x56>
 80497a9:	e9 73 ff ff ff       	jmp    8049721 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 80497ae:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 80497b5:	e9 67 ff ff ff       	jmp    8049721 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 80497ba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80497be:	79 12                	jns    80497d2 <vprintfmt+0x107>
				width = precision, precision = -1;
 80497c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80497c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80497c6:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 80497cd:	e9 4f ff ff ff       	jmp    8049721 <vprintfmt+0x56>
 80497d2:	e9 4a ff ff ff       	jmp    8049721 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 80497d7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 80497db:	e9 41 ff ff ff       	jmp    8049721 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 80497e0:	8b 45 14             	mov    0x14(%ebp),%eax
 80497e3:	8d 50 04             	lea    0x4(%eax),%edx
 80497e6:	89 55 14             	mov    %edx,0x14(%ebp)
 80497e9:	8b 00                	mov    (%eax),%eax
 80497eb:	8b 55 0c             	mov    0xc(%ebp),%edx
 80497ee:	89 54 24 04          	mov    %edx,0x4(%esp)
 80497f2:	89 04 24             	mov    %eax,(%esp)
 80497f5:	8b 45 08             	mov    0x8(%ebp),%eax
 80497f8:	ff d0                	call   *%eax
			break;
 80497fa:	e9 c2 02 00 00       	jmp    8049ac1 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 80497ff:	8b 45 14             	mov    0x14(%ebp),%eax
 8049802:	8d 50 04             	lea    0x4(%eax),%edx
 8049805:	89 55 14             	mov    %edx,0x14(%ebp)
 8049808:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 804980a:	85 db                	test   %ebx,%ebx
 804980c:	79 02                	jns    8049810 <vprintfmt+0x145>
				err = -err;
 804980e:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049810:	83 fb 06             	cmp    $0x6,%ebx
 8049813:	7f 0b                	jg     8049820 <vprintfmt+0x155>
 8049815:	8b 34 9d 90 a0 04 08 	mov    0x804a090(,%ebx,4),%esi
 804981c:	85 f6                	test   %esi,%esi
 804981e:	75 23                	jne    8049843 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 8049820:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049824:	c7 44 24 08 bd a0 04 	movl   $0x804a0bd,0x8(%esp)
 804982b:	08 
 804982c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804982f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049833:	8b 45 08             	mov    0x8(%ebp),%eax
 8049836:	89 04 24             	mov    %eax,(%esp)
 8049839:	e8 90 02 00 00       	call   8049ace <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 804983e:	e9 7e 02 00 00       	jmp    8049ac1 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 8049843:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049847:	c7 44 24 08 c6 a0 04 	movl   $0x804a0c6,0x8(%esp)
 804984e:	08 
 804984f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049852:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049856:	8b 45 08             	mov    0x8(%ebp),%eax
 8049859:	89 04 24             	mov    %eax,(%esp)
 804985c:	e8 6d 02 00 00       	call   8049ace <printfmt>
			break;
 8049861:	e9 5b 02 00 00       	jmp    8049ac1 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 8049866:	8b 45 14             	mov    0x14(%ebp),%eax
 8049869:	8d 50 04             	lea    0x4(%eax),%edx
 804986c:	89 55 14             	mov    %edx,0x14(%ebp)
 804986f:	8b 30                	mov    (%eax),%esi
 8049871:	85 f6                	test   %esi,%esi
 8049873:	75 05                	jne    804987a <vprintfmt+0x1af>
				p = "(null)";
 8049875:	be c9 a0 04 08       	mov    $0x804a0c9,%esi
			if (width > 0 && padc != '-')
 804987a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804987e:	7e 37                	jle    80498b7 <vprintfmt+0x1ec>
 8049880:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 8049884:	74 31                	je     80498b7 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 8049886:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049889:	89 44 24 04          	mov    %eax,0x4(%esp)
 804988d:	89 34 24             	mov    %esi,(%esp)
 8049890:	e8 9b f8 ff ff       	call   8049130 <strnlen>
 8049895:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 8049898:	eb 17                	jmp    80498b1 <vprintfmt+0x1e6>
					putch(padc, putdat);
 804989a:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 804989e:	8b 55 0c             	mov    0xc(%ebp),%edx
 80498a1:	89 54 24 04          	mov    %edx,0x4(%esp)
 80498a5:	89 04 24             	mov    %eax,(%esp)
 80498a8:	8b 45 08             	mov    0x8(%ebp),%eax
 80498ab:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 80498ad:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80498b1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80498b5:	7f e3                	jg     804989a <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 80498b7:	eb 38                	jmp    80498f1 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 80498b9:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 80498bd:	74 1f                	je     80498de <vprintfmt+0x213>
 80498bf:	83 fb 1f             	cmp    $0x1f,%ebx
 80498c2:	7e 05                	jle    80498c9 <vprintfmt+0x1fe>
 80498c4:	83 fb 7e             	cmp    $0x7e,%ebx
 80498c7:	7e 15                	jle    80498de <vprintfmt+0x213>
					putch('?', putdat);
 80498c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498d0:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 80498d7:	8b 45 08             	mov    0x8(%ebp),%eax
 80498da:	ff d0                	call   *%eax
 80498dc:	eb 0f                	jmp    80498ed <vprintfmt+0x222>
				else
					putch(ch, putdat);
 80498de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498e5:	89 1c 24             	mov    %ebx,(%esp)
 80498e8:	8b 45 08             	mov    0x8(%ebp),%eax
 80498eb:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 80498ed:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 80498f1:	89 f0                	mov    %esi,%eax
 80498f3:	8d 70 01             	lea    0x1(%eax),%esi
 80498f6:	0f b6 00             	movzbl (%eax),%eax
 80498f9:	0f be d8             	movsbl %al,%ebx
 80498fc:	85 db                	test   %ebx,%ebx
 80498fe:	74 10                	je     8049910 <vprintfmt+0x245>
 8049900:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049904:	78 b3                	js     80498b9 <vprintfmt+0x1ee>
 8049906:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 804990a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 804990e:	79 a9                	jns    80498b9 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049910:	eb 17                	jmp    8049929 <vprintfmt+0x25e>
				putch(' ', putdat);
 8049912:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049915:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049919:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049920:	8b 45 08             	mov    0x8(%ebp),%eax
 8049923:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049925:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049929:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804992d:	7f e3                	jg     8049912 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 804992f:	e9 8d 01 00 00       	jmp    8049ac1 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 8049934:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049937:	89 44 24 04          	mov    %eax,0x4(%esp)
 804993b:	8d 45 14             	lea    0x14(%ebp),%eax
 804993e:	89 04 24             	mov    %eax,(%esp)
 8049941:	e8 3e fd ff ff       	call   8049684 <getint>
 8049946:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049949:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 804994c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804994f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049952:	85 d2                	test   %edx,%edx
 8049954:	79 26                	jns    804997c <vprintfmt+0x2b1>
				putch('-', putdat);
 8049956:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049959:	89 44 24 04          	mov    %eax,0x4(%esp)
 804995d:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 8049964:	8b 45 08             	mov    0x8(%ebp),%eax
 8049967:	ff d0                	call   *%eax
				num = -(long long) num;
 8049969:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804996c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804996f:	f7 d8                	neg    %eax
 8049971:	83 d2 00             	adc    $0x0,%edx
 8049974:	f7 da                	neg    %edx
 8049976:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049979:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 804997c:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049983:	e9 c5 00 00 00       	jmp    8049a4d <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 8049988:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804998b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804998f:	8d 45 14             	lea    0x14(%ebp),%eax
 8049992:	89 04 24             	mov    %eax,(%esp)
 8049995:	e8 9b fc ff ff       	call   8049635 <getuint>
 804999a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804999d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 80499a0:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 80499a7:	e9 a1 00 00 00       	jmp    8049a4d <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 80499ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499af:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499b3:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 80499ba:	8b 45 08             	mov    0x8(%ebp),%eax
 80499bd:	ff d0                	call   *%eax
			putch('X', putdat);
 80499bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499c6:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 80499cd:	8b 45 08             	mov    0x8(%ebp),%eax
 80499d0:	ff d0                	call   *%eax
			putch('X', putdat);
 80499d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499d9:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 80499e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80499e3:	ff d0                	call   *%eax
			break;
 80499e5:	e9 d7 00 00 00       	jmp    8049ac1 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 80499ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499f1:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 80499f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80499fb:	ff d0                	call   *%eax
			putch('x', putdat);
 80499fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a00:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a04:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049a0b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a0e:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049a10:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a13:	8d 50 04             	lea    0x4(%eax),%edx
 8049a16:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a19:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049a1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049a25:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049a2c:	eb 1f                	jmp    8049a4d <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049a2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049a31:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a35:	8d 45 14             	lea    0x14(%ebp),%eax
 8049a38:	89 04 24             	mov    %eax,(%esp)
 8049a3b:	e8 f5 fb ff ff       	call   8049635 <getuint>
 8049a40:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a43:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049a46:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049a4d:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049a51:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049a54:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049a58:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049a5b:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049a5f:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049a63:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049a66:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049a69:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049a6d:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049a71:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a74:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a78:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a7b:	89 04 24             	mov    %eax,(%esp)
 8049a7e:	e8 d4 fa ff ff       	call   8049557 <printnum>
			break;
 8049a83:	eb 3c                	jmp    8049ac1 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049a85:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a88:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a8c:	89 1c 24             	mov    %ebx,(%esp)
 8049a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a92:	ff d0                	call   *%eax
			break;
 8049a94:	eb 2b                	jmp    8049ac1 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049a96:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a99:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a9d:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049aa4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049aa7:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049aa9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049aad:	eb 04                	jmp    8049ab3 <vprintfmt+0x3e8>
 8049aaf:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049ab3:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ab6:	83 e8 01             	sub    $0x1,%eax
 8049ab9:	0f b6 00             	movzbl (%eax),%eax
 8049abc:	3c 25                	cmp    $0x25,%al
 8049abe:	75 ef                	jne    8049aaf <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049ac0:	90                   	nop
		}
	}
 8049ac1:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049ac2:	e9 26 fc ff ff       	jmp    80496ed <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049ac7:	83 c4 40             	add    $0x40,%esp
 8049aca:	5b                   	pop    %ebx
 8049acb:	5e                   	pop    %esi
 8049acc:	5d                   	pop    %ebp
 8049acd:	c3                   	ret    

08049ace <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049ace:	55                   	push   %ebp
 8049acf:	89 e5                	mov    %esp,%ebp
 8049ad1:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049ad4:	8d 45 14             	lea    0x14(%ebp),%eax
 8049ad7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049add:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049ae1:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ae4:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ae8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049aeb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049aef:	8b 45 08             	mov    0x8(%ebp),%eax
 8049af2:	89 04 24             	mov    %eax,(%esp)
 8049af5:	e8 d1 fb ff ff       	call   80496cb <vprintfmt>
	va_end(ap);
}
 8049afa:	c9                   	leave  
 8049afb:	c3                   	ret    

08049afc <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049afc:	55                   	push   %ebp
 8049afd:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049aff:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b02:	8b 40 08             	mov    0x8(%eax),%eax
 8049b05:	8d 50 01             	lea    0x1(%eax),%edx
 8049b08:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b0b:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049b0e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b11:	8b 10                	mov    (%eax),%edx
 8049b13:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b16:	8b 40 04             	mov    0x4(%eax),%eax
 8049b19:	39 c2                	cmp    %eax,%edx
 8049b1b:	73 12                	jae    8049b2f <sprintputch+0x33>
		*b->buf++ = ch;
 8049b1d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b20:	8b 00                	mov    (%eax),%eax
 8049b22:	8d 48 01             	lea    0x1(%eax),%ecx
 8049b25:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049b28:	89 0a                	mov    %ecx,(%edx)
 8049b2a:	8b 55 08             	mov    0x8(%ebp),%edx
 8049b2d:	88 10                	mov    %dl,(%eax)
}
 8049b2f:	5d                   	pop    %ebp
 8049b30:	c3                   	ret    

08049b31 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049b31:	55                   	push   %ebp
 8049b32:	89 e5                	mov    %esp,%ebp
 8049b34:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049b37:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b40:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049b43:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b46:	01 d0                	add    %edx,%eax
 8049b48:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049b52:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049b56:	74 06                	je     8049b5e <vsnprintf+0x2d>
 8049b58:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049b5c:	7f 07                	jg     8049b65 <vsnprintf+0x34>
		return -E_INVAL;
 8049b5e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049b63:	eb 2a                	jmp    8049b8f <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049b65:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b68:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b6c:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b6f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b73:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049b76:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b7a:	c7 04 24 fc 9a 04 08 	movl   $0x8049afc,(%esp)
 8049b81:	e8 45 fb ff ff       	call   80496cb <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049b86:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b89:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049b8f:	c9                   	leave  
 8049b90:	c3                   	ret    

08049b91 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049b91:	55                   	push   %ebp
 8049b92:	89 e5                	mov    %esp,%ebp
 8049b94:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049b97:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049b9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049ba0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049ba4:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ba7:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049bab:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bae:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bb2:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bb5:	89 04 24             	mov    %eax,(%esp)
 8049bb8:	e8 74 ff ff ff       	call   8049b31 <vsnprintf>
 8049bbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049bc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049bc3:	c9                   	leave  
 8049bc4:	c3                   	ret    

08049bc5 <srand>:
static int seed = 0;

void
srand(int s) {
 8049bc5:	55                   	push   %ebp
 8049bc6:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049bc8:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bcb:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049bd0:	5d                   	pop    %ebp
 8049bd1:	c3                   	ret    

08049bd2 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049bd2:	55                   	push   %ebp
 8049bd3:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049bd5:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049bda:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049be0:	83 c0 01             	add    $0x1,%eax
 8049be3:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049be8:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049bed:	c1 f8 10             	sar    $0x10,%eax
 8049bf0:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049bf5:	5d                   	pop    %ebp
 8049bf6:	c3                   	ret    
 8049bf7:	66 90                	xchg   %ax,%ax
 8049bf9:	66 90                	xchg   %ax,%ax
 8049bfb:	66 90                	xchg   %ax,%ax
 8049bfd:	66 90                	xchg   %ax,%ax
 8049bff:	90                   	nop

08049c00 <__udivdi3>:
 8049c00:	55                   	push   %ebp
 8049c01:	57                   	push   %edi
 8049c02:	56                   	push   %esi
 8049c03:	83 ec 0c             	sub    $0xc,%esp
 8049c06:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049c0a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049c0e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049c12:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049c16:	85 c0                	test   %eax,%eax
 8049c18:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049c1c:	89 ea                	mov    %ebp,%edx
 8049c1e:	89 0c 24             	mov    %ecx,(%esp)
 8049c21:	75 2d                	jne    8049c50 <__udivdi3+0x50>
 8049c23:	39 e9                	cmp    %ebp,%ecx
 8049c25:	77 61                	ja     8049c88 <__udivdi3+0x88>
 8049c27:	85 c9                	test   %ecx,%ecx
 8049c29:	89 ce                	mov    %ecx,%esi
 8049c2b:	75 0b                	jne    8049c38 <__udivdi3+0x38>
 8049c2d:	b8 01 00 00 00       	mov    $0x1,%eax
 8049c32:	31 d2                	xor    %edx,%edx
 8049c34:	f7 f1                	div    %ecx
 8049c36:	89 c6                	mov    %eax,%esi
 8049c38:	31 d2                	xor    %edx,%edx
 8049c3a:	89 e8                	mov    %ebp,%eax
 8049c3c:	f7 f6                	div    %esi
 8049c3e:	89 c5                	mov    %eax,%ebp
 8049c40:	89 f8                	mov    %edi,%eax
 8049c42:	f7 f6                	div    %esi
 8049c44:	89 ea                	mov    %ebp,%edx
 8049c46:	83 c4 0c             	add    $0xc,%esp
 8049c49:	5e                   	pop    %esi
 8049c4a:	5f                   	pop    %edi
 8049c4b:	5d                   	pop    %ebp
 8049c4c:	c3                   	ret    
 8049c4d:	8d 76 00             	lea    0x0(%esi),%esi
 8049c50:	39 e8                	cmp    %ebp,%eax
 8049c52:	77 24                	ja     8049c78 <__udivdi3+0x78>
 8049c54:	0f bd e8             	bsr    %eax,%ebp
 8049c57:	83 f5 1f             	xor    $0x1f,%ebp
 8049c5a:	75 3c                	jne    8049c98 <__udivdi3+0x98>
 8049c5c:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049c60:	39 34 24             	cmp    %esi,(%esp)
 8049c63:	0f 86 9f 00 00 00    	jbe    8049d08 <__udivdi3+0x108>
 8049c69:	39 d0                	cmp    %edx,%eax
 8049c6b:	0f 82 97 00 00 00    	jb     8049d08 <__udivdi3+0x108>
 8049c71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049c78:	31 d2                	xor    %edx,%edx
 8049c7a:	31 c0                	xor    %eax,%eax
 8049c7c:	83 c4 0c             	add    $0xc,%esp
 8049c7f:	5e                   	pop    %esi
 8049c80:	5f                   	pop    %edi
 8049c81:	5d                   	pop    %ebp
 8049c82:	c3                   	ret    
 8049c83:	90                   	nop
 8049c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049c88:	89 f8                	mov    %edi,%eax
 8049c8a:	f7 f1                	div    %ecx
 8049c8c:	31 d2                	xor    %edx,%edx
 8049c8e:	83 c4 0c             	add    $0xc,%esp
 8049c91:	5e                   	pop    %esi
 8049c92:	5f                   	pop    %edi
 8049c93:	5d                   	pop    %ebp
 8049c94:	c3                   	ret    
 8049c95:	8d 76 00             	lea    0x0(%esi),%esi
 8049c98:	89 e9                	mov    %ebp,%ecx
 8049c9a:	8b 3c 24             	mov    (%esp),%edi
 8049c9d:	d3 e0                	shl    %cl,%eax
 8049c9f:	89 c6                	mov    %eax,%esi
 8049ca1:	b8 20 00 00 00       	mov    $0x20,%eax
 8049ca6:	29 e8                	sub    %ebp,%eax
 8049ca8:	89 c1                	mov    %eax,%ecx
 8049caa:	d3 ef                	shr    %cl,%edi
 8049cac:	89 e9                	mov    %ebp,%ecx
 8049cae:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049cb2:	8b 3c 24             	mov    (%esp),%edi
 8049cb5:	09 74 24 08          	or     %esi,0x8(%esp)
 8049cb9:	89 d6                	mov    %edx,%esi
 8049cbb:	d3 e7                	shl    %cl,%edi
 8049cbd:	89 c1                	mov    %eax,%ecx
 8049cbf:	89 3c 24             	mov    %edi,(%esp)
 8049cc2:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049cc6:	d3 ee                	shr    %cl,%esi
 8049cc8:	89 e9                	mov    %ebp,%ecx
 8049cca:	d3 e2                	shl    %cl,%edx
 8049ccc:	89 c1                	mov    %eax,%ecx
 8049cce:	d3 ef                	shr    %cl,%edi
 8049cd0:	09 d7                	or     %edx,%edi
 8049cd2:	89 f2                	mov    %esi,%edx
 8049cd4:	89 f8                	mov    %edi,%eax
 8049cd6:	f7 74 24 08          	divl   0x8(%esp)
 8049cda:	89 d6                	mov    %edx,%esi
 8049cdc:	89 c7                	mov    %eax,%edi
 8049cde:	f7 24 24             	mull   (%esp)
 8049ce1:	39 d6                	cmp    %edx,%esi
 8049ce3:	89 14 24             	mov    %edx,(%esp)
 8049ce6:	72 30                	jb     8049d18 <__udivdi3+0x118>
 8049ce8:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049cec:	89 e9                	mov    %ebp,%ecx
 8049cee:	d3 e2                	shl    %cl,%edx
 8049cf0:	39 c2                	cmp    %eax,%edx
 8049cf2:	73 05                	jae    8049cf9 <__udivdi3+0xf9>
 8049cf4:	3b 34 24             	cmp    (%esp),%esi
 8049cf7:	74 1f                	je     8049d18 <__udivdi3+0x118>
 8049cf9:	89 f8                	mov    %edi,%eax
 8049cfb:	31 d2                	xor    %edx,%edx
 8049cfd:	e9 7a ff ff ff       	jmp    8049c7c <__udivdi3+0x7c>
 8049d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049d08:	31 d2                	xor    %edx,%edx
 8049d0a:	b8 01 00 00 00       	mov    $0x1,%eax
 8049d0f:	e9 68 ff ff ff       	jmp    8049c7c <__udivdi3+0x7c>
 8049d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049d18:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049d1b:	31 d2                	xor    %edx,%edx
 8049d1d:	83 c4 0c             	add    $0xc,%esp
 8049d20:	5e                   	pop    %esi
 8049d21:	5f                   	pop    %edi
 8049d22:	5d                   	pop    %ebp
 8049d23:	c3                   	ret    
 8049d24:	66 90                	xchg   %ax,%ax
 8049d26:	66 90                	xchg   %ax,%ax
 8049d28:	66 90                	xchg   %ax,%ax
 8049d2a:	66 90                	xchg   %ax,%ax
 8049d2c:	66 90                	xchg   %ax,%ax
 8049d2e:	66 90                	xchg   %ax,%ax

08049d30 <__umoddi3>:
 8049d30:	55                   	push   %ebp
 8049d31:	57                   	push   %edi
 8049d32:	56                   	push   %esi
 8049d33:	83 ec 14             	sub    $0x14,%esp
 8049d36:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049d3a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049d3e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049d42:	89 c7                	mov    %eax,%edi
 8049d44:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d48:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049d4c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049d50:	89 34 24             	mov    %esi,(%esp)
 8049d53:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049d57:	85 c0                	test   %eax,%eax
 8049d59:	89 c2                	mov    %eax,%edx
 8049d5b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049d5f:	75 17                	jne    8049d78 <__umoddi3+0x48>
 8049d61:	39 fe                	cmp    %edi,%esi
 8049d63:	76 4b                	jbe    8049db0 <__umoddi3+0x80>
 8049d65:	89 c8                	mov    %ecx,%eax
 8049d67:	89 fa                	mov    %edi,%edx
 8049d69:	f7 f6                	div    %esi
 8049d6b:	89 d0                	mov    %edx,%eax
 8049d6d:	31 d2                	xor    %edx,%edx
 8049d6f:	83 c4 14             	add    $0x14,%esp
 8049d72:	5e                   	pop    %esi
 8049d73:	5f                   	pop    %edi
 8049d74:	5d                   	pop    %ebp
 8049d75:	c3                   	ret    
 8049d76:	66 90                	xchg   %ax,%ax
 8049d78:	39 f8                	cmp    %edi,%eax
 8049d7a:	77 54                	ja     8049dd0 <__umoddi3+0xa0>
 8049d7c:	0f bd e8             	bsr    %eax,%ebp
 8049d7f:	83 f5 1f             	xor    $0x1f,%ebp
 8049d82:	75 5c                	jne    8049de0 <__umoddi3+0xb0>
 8049d84:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049d88:	39 3c 24             	cmp    %edi,(%esp)
 8049d8b:	0f 87 e7 00 00 00    	ja     8049e78 <__umoddi3+0x148>
 8049d91:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049d95:	29 f1                	sub    %esi,%ecx
 8049d97:	19 c7                	sbb    %eax,%edi
 8049d99:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049d9d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049da1:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049da5:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049da9:	83 c4 14             	add    $0x14,%esp
 8049dac:	5e                   	pop    %esi
 8049dad:	5f                   	pop    %edi
 8049dae:	5d                   	pop    %ebp
 8049daf:	c3                   	ret    
 8049db0:	85 f6                	test   %esi,%esi
 8049db2:	89 f5                	mov    %esi,%ebp
 8049db4:	75 0b                	jne    8049dc1 <__umoddi3+0x91>
 8049db6:	b8 01 00 00 00       	mov    $0x1,%eax
 8049dbb:	31 d2                	xor    %edx,%edx
 8049dbd:	f7 f6                	div    %esi
 8049dbf:	89 c5                	mov    %eax,%ebp
 8049dc1:	8b 44 24 04          	mov    0x4(%esp),%eax
 8049dc5:	31 d2                	xor    %edx,%edx
 8049dc7:	f7 f5                	div    %ebp
 8049dc9:	89 c8                	mov    %ecx,%eax
 8049dcb:	f7 f5                	div    %ebp
 8049dcd:	eb 9c                	jmp    8049d6b <__umoddi3+0x3b>
 8049dcf:	90                   	nop
 8049dd0:	89 c8                	mov    %ecx,%eax
 8049dd2:	89 fa                	mov    %edi,%edx
 8049dd4:	83 c4 14             	add    $0x14,%esp
 8049dd7:	5e                   	pop    %esi
 8049dd8:	5f                   	pop    %edi
 8049dd9:	5d                   	pop    %ebp
 8049dda:	c3                   	ret    
 8049ddb:	90                   	nop
 8049ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049de0:	8b 04 24             	mov    (%esp),%eax
 8049de3:	be 20 00 00 00       	mov    $0x20,%esi
 8049de8:	89 e9                	mov    %ebp,%ecx
 8049dea:	29 ee                	sub    %ebp,%esi
 8049dec:	d3 e2                	shl    %cl,%edx
 8049dee:	89 f1                	mov    %esi,%ecx
 8049df0:	d3 e8                	shr    %cl,%eax
 8049df2:	89 e9                	mov    %ebp,%ecx
 8049df4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049df8:	8b 04 24             	mov    (%esp),%eax
 8049dfb:	09 54 24 04          	or     %edx,0x4(%esp)
 8049dff:	89 fa                	mov    %edi,%edx
 8049e01:	d3 e0                	shl    %cl,%eax
 8049e03:	89 f1                	mov    %esi,%ecx
 8049e05:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049e09:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049e0d:	d3 ea                	shr    %cl,%edx
 8049e0f:	89 e9                	mov    %ebp,%ecx
 8049e11:	d3 e7                	shl    %cl,%edi
 8049e13:	89 f1                	mov    %esi,%ecx
 8049e15:	d3 e8                	shr    %cl,%eax
 8049e17:	89 e9                	mov    %ebp,%ecx
 8049e19:	09 f8                	or     %edi,%eax
 8049e1b:	8b 7c 24 10          	mov    0x10(%esp),%edi
 8049e1f:	f7 74 24 04          	divl   0x4(%esp)
 8049e23:	d3 e7                	shl    %cl,%edi
 8049e25:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049e29:	89 d7                	mov    %edx,%edi
 8049e2b:	f7 64 24 08          	mull   0x8(%esp)
 8049e2f:	39 d7                	cmp    %edx,%edi
 8049e31:	89 c1                	mov    %eax,%ecx
 8049e33:	89 14 24             	mov    %edx,(%esp)
 8049e36:	72 2c                	jb     8049e64 <__umoddi3+0x134>
 8049e38:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 8049e3c:	72 22                	jb     8049e60 <__umoddi3+0x130>
 8049e3e:	8b 44 24 0c          	mov    0xc(%esp),%eax
 8049e42:	29 c8                	sub    %ecx,%eax
 8049e44:	19 d7                	sbb    %edx,%edi
 8049e46:	89 e9                	mov    %ebp,%ecx
 8049e48:	89 fa                	mov    %edi,%edx
 8049e4a:	d3 e8                	shr    %cl,%eax
 8049e4c:	89 f1                	mov    %esi,%ecx
 8049e4e:	d3 e2                	shl    %cl,%edx
 8049e50:	89 e9                	mov    %ebp,%ecx
 8049e52:	d3 ef                	shr    %cl,%edi
 8049e54:	09 d0                	or     %edx,%eax
 8049e56:	89 fa                	mov    %edi,%edx
 8049e58:	83 c4 14             	add    $0x14,%esp
 8049e5b:	5e                   	pop    %esi
 8049e5c:	5f                   	pop    %edi
 8049e5d:	5d                   	pop    %ebp
 8049e5e:	c3                   	ret    
 8049e5f:	90                   	nop
 8049e60:	39 d7                	cmp    %edx,%edi
 8049e62:	75 da                	jne    8049e3e <__umoddi3+0x10e>
 8049e64:	8b 14 24             	mov    (%esp),%edx
 8049e67:	89 c1                	mov    %eax,%ecx
 8049e69:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 8049e6d:	1b 54 24 04          	sbb    0x4(%esp),%edx
 8049e71:	eb cb                	jmp    8049e3e <__umoddi3+0x10e>
 8049e73:	90                   	nop
 8049e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049e78:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 8049e7c:	0f 82 0f ff ff ff    	jb     8049d91 <__umoddi3+0x61>
 8049e82:	e9 1a ff ff ff       	jmp    8049da1 <__umoddi3+0x71>
