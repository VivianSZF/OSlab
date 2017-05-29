
game.bin:     file format elf32-i386


Disassembly of section .text:

08048000 <producer>:

Sema empty,full,mutex;
int buf[10];

void producer()
{
 8048000:	55                   	push   %ebp
 8048001:	89 e5                	mov    %esp,%ebp
 8048003:	83 ec 28             	sub    $0x28,%esp
	printf("I am the producer\n");
 8048006:	c7 04 24 d8 a0 04 08 	movl   $0x804a0d8,(%esp)
 804800d:	e8 3a 12 00 00       	call   804924c <printf>
	int i;
	for(i=0;i<10;i++)
 8048012:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048019:	eb 54                	jmp    804806f <producer+0x6f>
	{
		sem_wait(&empty);
 804801b:	c7 04 24 88 5c 09 08 	movl   $0x8095c88,(%esp)
 8048022:	e8 4e 11 00 00       	call   8049175 <sem_wait>
		sem_wait(&mutex);
 8048027:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 804802e:	e8 42 11 00 00       	call   8049175 <sem_wait>
		printf("produce No.%d\n",i);
 8048033:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048036:	89 44 24 04          	mov    %eax,0x4(%esp)
 804803a:	c7 04 24 eb a0 04 08 	movl   $0x804a0eb,(%esp)
 8048041:	e8 06 12 00 00       	call   804924c <printf>
		buf[i]=i;
 8048046:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048049:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804804c:	89 14 85 60 5c 09 08 	mov    %edx,0x8095c60(,%eax,4)
		sem_post(&mutex);
 8048053:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 804805a:	e8 4c 11 00 00       	call   80491ab <sem_post>
		sem_post(&full);	
 804805f:	c7 04 24 20 5c 09 08 	movl   $0x8095c20,(%esp)
 8048066:	e8 40 11 00 00       	call   80491ab <sem_post>

void producer()
{
	printf("I am the producer\n");
	int i;
	for(i=0;i<10;i++)
 804806b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804806f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 8048073:	7e a6                	jle    804801b <producer+0x1b>
		printf("produce No.%d\n",i);
		buf[i]=i;
		sem_post(&mutex);
		sem_post(&full);	
	}	
	exit(0);
 8048075:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804807c:	e8 66 10 00 00       	call   80490e7 <exit>
}
 8048081:	c9                   	leave  
 8048082:	c3                   	ret    

08048083 <consumer>:

void consumer()
{
 8048083:	55                   	push   %ebp
 8048084:	89 e5                	mov    %esp,%ebp
 8048086:	83 ec 28             	sub    $0x28,%esp
	printf("I am the consumer\n");
 8048089:	c7 04 24 fa a0 04 08 	movl   $0x804a0fa,(%esp)
 8048090:	e8 b7 11 00 00       	call   804924c <printf>
	int i;
	for(i=0;i<10;i++)
 8048095:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804809c:	eb 47                	jmp    80480e5 <consumer+0x62>
	{
		sem_wait(&full);
 804809e:	c7 04 24 20 5c 09 08 	movl   $0x8095c20,(%esp)
 80480a5:	e8 cb 10 00 00       	call   8049175 <sem_wait>
		sem_wait(&mutex);
 80480aa:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 80480b1:	e8 bf 10 00 00       	call   8049175 <sem_wait>
		printf("consume No.%d\n",i);
 80480b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80480b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80480bd:	c7 04 24 0d a1 04 08 	movl   $0x804a10d,(%esp)
 80480c4:	e8 83 11 00 00       	call   804924c <printf>
		sem_post(&mutex);
 80480c9:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 80480d0:	e8 d6 10 00 00       	call   80491ab <sem_post>
		sem_post(&empty);
 80480d5:	c7 04 24 88 5c 09 08 	movl   $0x8095c88,(%esp)
 80480dc:	e8 ca 10 00 00       	call   80491ab <sem_post>

void consumer()
{
	printf("I am the consumer\n");
	int i;
	for(i=0;i<10;i++)
 80480e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80480e5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 80480e9:	7e b3                	jle    804809e <consumer+0x1b>
		sem_wait(&mutex);
		printf("consume No.%d\n",i);
		sem_post(&mutex);
		sem_post(&empty);
	}
	exit(0);
 80480eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80480f2:	e8 f0 0f 00 00       	call   80490e7 <exit>
}
 80480f7:	c9                   	leave  
 80480f8:	c3                   	ret    

080480f9 <game_init>:


void
game_init(void) {
 80480f9:	55                   	push   %ebp
 80480fa:	89 e5                	mov    %esp,%ebp
 80480fc:	83 ec 18             	sub    $0x18,%esp

	printf("Welcome to our game~~~ready ~~~go~~~\n");
 80480ff:	c7 04 24 1c a1 04 08 	movl   $0x804a11c,(%esp)
 8048106:	e8 41 11 00 00       	call   804924c <printf>
		}
	}
	*/
	
	//here is the producer and consumer test
	sem_init(&empty,5);
 804810b:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
 8048112:	00 
 8048113:	c7 04 24 88 5c 09 08 	movl   $0x8095c88,(%esp)
 804811a:	e8 19 10 00 00       	call   8049138 <sem_init>
	//printf("dead here");
	sem_init(&full,0);
 804811f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048126:	00 
 8048127:	c7 04 24 20 5c 09 08 	movl   $0x8095c20,(%esp)
 804812e:	e8 05 10 00 00       	call   8049138 <sem_init>
	sem_init(&mutex,1);
 8048133:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804813a:	00 
 804813b:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 8048142:	e8 f1 0f 00 00       	call   8049138 <sem_init>
	
	thread(producer);	
 8048147:	c7 04 24 00 80 04 08 	movl   $0x8048000,(%esp)
 804814e:	e8 ca 0f 00 00       	call   804911d <thread>
	thread(consumer);
 8048153:	c7 04 24 83 80 04 08 	movl   $0x8048083,(%esp)
 804815a:	e8 be 0f 00 00       	call   804911d <thread>

	//sem_destroy(empty);
	//sem_destroy(full);
	//sem_destroy(mutex);
	while(1);
 804815f:	eb fe                	jmp    804815f <game_init+0x66>

08048161 <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 8048161:	55                   	push   %ebp
 8048162:	89 e5                	mov    %esp,%ebp
 8048164:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 8048167:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804816e:	eb 12                	jmp    8048182 <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 8048170:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048173:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 804817a:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 804817e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048182:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048186:	7e e8                	jle    8048170 <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 8048188:	c9                   	leave  
 8048189:	c3                   	ret    

0804818a <press_key>:

void press_key(int scan_code) {
 804818a:	55                   	push   %ebp
 804818b:	89 e5                	mov    %esp,%ebp
 804818d:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 8048190:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048197:	eb 21                	jmp    80481ba <press_key+0x30>
		if (key_code[i] == scan_code) {
 8048199:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804819c:	8b 04 85 00 b0 04 08 	mov    0x804b000(,%eax,4),%eax
 80481a3:	3b 45 08             	cmp    0x8(%ebp),%eax
 80481a6:	75 0e                	jne    80481b6 <press_key+0x2c>
			key_pressed[i] = TRUE;
 80481a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80481ab:	c7 04 85 20 b4 04 08 	movl   $0x1,0x804b420(,%eax,4)
 80481b2:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 80481b6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80481ba:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 80481be:	7e d9                	jle    8048199 <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 80481c0:	c9                   	leave  
 80481c1:	c3                   	ret    

080481c2 <release_key>:

void release_key(int index) {
 80481c2:	55                   	push   %ebp
 80481c3:	89 e5                	mov    %esp,%ebp
 80481c5:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80481c8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80481cc:	78 06                	js     80481d4 <release_key+0x12>
 80481ce:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80481d2:	7e 24                	jle    80481f8 <release_key+0x36>
 80481d4:	c7 44 24 0c 42 a1 04 	movl   $0x804a142,0xc(%esp)
 80481db:	08 
 80481dc:	c7 44 24 08 5a a1 04 	movl   $0x804a15a,0x8(%esp)
 80481e3:	08 
 80481e4:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80481eb:	00 
 80481ec:	c7 04 24 6f a1 04 08 	movl   $0x804a16f,(%esp)
 80481f3:	e8 93 00 00 00       	call   804828b <_panic>
	key_pressed[index] = FALSE;
 80481f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80481fb:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 8048202:	00 00 00 00 
}
 8048206:	c9                   	leave  
 8048207:	c3                   	ret    

08048208 <query_key>:

bool query_key(int index) {
 8048208:	55                   	push   %ebp
 8048209:	89 e5                	mov    %esp,%ebp
 804820b:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 804820e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048212:	78 06                	js     804821a <query_key+0x12>
 8048214:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 8048218:	7e 24                	jle    804823e <query_key+0x36>
 804821a:	c7 44 24 0c 42 a1 04 	movl   $0x804a142,0xc(%esp)
 8048221:	08 
 8048222:	c7 44 24 08 5a a1 04 	movl   $0x804a15a,0x8(%esp)
 8048229:	08 
 804822a:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 8048231:	00 
 8048232:	c7 04 24 6f a1 04 08 	movl   $0x804a16f,(%esp)
 8048239:	e8 4d 00 00 00       	call   804828b <_panic>
	return key_pressed[index];
 804823e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048241:	8b 04 85 20 b4 04 08 	mov    0x804b420(,%eax,4),%eax
}
 8048248:	c9                   	leave  
 8048249:	c3                   	ret    

0804824a <key_operation>:

extern void control_plane(int);
void key_operation(void){
 804824a:	55                   	push   %ebp
 804824b:	89 e5                	mov    %esp,%ebp
 804824d:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 8048250:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048257:	eb 2a                	jmp    8048283 <key_operation+0x39>
		if(query_key(i)==TRUE){
 8048259:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804825c:	89 04 24             	mov    %eax,(%esp)
 804825f:	e8 a4 ff ff ff       	call   8048208 <query_key>
 8048264:	83 f8 01             	cmp    $0x1,%eax
 8048267:	75 16                	jne    804827f <key_operation+0x35>
			control_plane(i);
 8048269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804826c:	89 04 24             	mov    %eax,(%esp)
 804826f:	e8 54 08 00 00       	call   8048ac8 <control_plane>
			release_key(i);
 8048274:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048277:	89 04 24             	mov    %eax,(%esp)
 804827a:	e8 43 ff ff ff       	call   80481c2 <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 804827f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048283:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 8048287:	7e d0                	jle    8048259 <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 8048289:	c9                   	leave  
 804828a:	c3                   	ret    

0804828b <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 804828b:	55                   	push   %ebp
 804828c:	89 e5                	mov    %esp,%ebp
 804828e:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 8048291:	a1 30 b4 04 08       	mov    0x804b430,%eax
 8048296:	85 c0                	test   %eax,%eax
 8048298:	74 01                	je     804829b <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 804829a:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 804829b:	8b 45 10             	mov    0x10(%ebp),%eax
 804829e:	a3 30 b4 04 08       	mov    %eax,0x804b430

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 80482a3:	fa                   	cli    
 80482a4:	fc                   	cld    

	va_start(ap, fmt);
 80482a5:	8d 45 14             	lea    0x14(%ebp),%eax
 80482a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 80482ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482ae:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482b2:	8b 45 08             	mov    0x8(%ebp),%eax
 80482b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482b9:	c7 04 24 7f a1 04 08 	movl   $0x804a17f,(%esp)
 80482c0:	e8 87 0f 00 00       	call   804924c <printf>
	vprintf(fmt, ap);
 80482c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482cc:	8b 45 10             	mov    0x10(%ebp),%eax
 80482cf:	89 04 24             	mov    %eax,(%esp)
 80482d2:	e8 42 0f 00 00       	call   8049219 <vprintf>
	printf("\n");
 80482d7:	c7 04 24 97 a1 04 08 	movl   $0x804a197,(%esp)
 80482de:	e8 69 0f 00 00       	call   804924c <printf>
	va_end(ap);

}
 80482e3:	c9                   	leave  
 80482e4:	c3                   	ret    

080482e5 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 80482e5:	55                   	push   %ebp
 80482e6:	89 e5                	mov    %esp,%ebp
 80482e8:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 80482eb:	8d 45 14             	lea    0x14(%ebp),%eax
 80482ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 80482f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482f4:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80482fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482ff:	c7 04 24 99 a1 04 08 	movl   $0x804a199,(%esp)
 8048306:	e8 41 0f 00 00       	call   804924c <printf>
	vprintf(fmt, ap);
 804830b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804830e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048312:	8b 45 10             	mov    0x10(%ebp),%eax
 8048315:	89 04 24             	mov    %eax,(%esp)
 8048318:	e8 fc 0e 00 00       	call   8049219 <vprintf>
	printf("\n");
 804831d:	c7 04 24 97 a1 04 08 	movl   $0x804a197,(%esp)
 8048324:	e8 23 0f 00 00       	call   804924c <printf>
	va_end(ap);
}
 8048329:	c9                   	leave  
 804832a:	c3                   	ret    

0804832b <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 804832b:	55                   	push   %ebp
 804832c:	89 e5                	mov    %esp,%ebp
 804832e:	83 ec 38             	sub    $0x38,%esp
 8048331:	8b 45 08             	mov    0x8(%ebp),%eax
 8048334:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 8048337:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 804833b:	79 24                	jns    8048361 <draw_character+0x36>
 804833d:	c7 44 24 0c b3 a1 04 	movl   $0x804a1b3,0xc(%esp)
 8048344:	08 
 8048345:	c7 44 24 08 c4 a1 04 	movl   $0x804a1c4,0x8(%esp)
 804834c:	08 
 804834d:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048354:	00 
 8048355:	c7 04 24 d9 a1 04 08 	movl   $0x804a1d9,(%esp)
 804835c:	e8 2a ff ff ff       	call   804828b <_panic>
	char *p = font8x8_basic[(int)ch];
 8048361:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 8048365:	c1 e0 03             	shl    $0x3,%eax
 8048368:	05 20 b0 04 08       	add    $0x804b020,%eax
 804836d:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 8048370:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048377:	eb 59                	jmp    80483d2 <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 8048379:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048380:	eb 46                	jmp    80483c8 <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 8048382:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048385:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048388:	01 d0                	add    %edx,%eax
 804838a:	0f b6 00             	movzbl (%eax),%eax
 804838d:	0f be d0             	movsbl %al,%edx
 8048390:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048393:	89 c1                	mov    %eax,%ecx
 8048395:	d3 fa                	sar    %cl,%edx
 8048397:	89 d0                	mov    %edx,%eax
 8048399:	83 e0 01             	and    $0x1,%eax
 804839c:	85 c0                	test   %eax,%eax
 804839e:	74 24                	je     80483c4 <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 80483a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80483a3:	8b 55 10             	mov    0x10(%ebp),%edx
 80483a6:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80483a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483ac:	8b 55 0c             	mov    0xc(%ebp),%edx
 80483af:	01 c2                	add    %eax,%edx
 80483b1:	8b 45 14             	mov    0x14(%ebp),%eax
 80483b4:	89 44 24 08          	mov    %eax,0x8(%esp)
 80483b8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80483bc:	89 14 24             	mov    %edx,(%esp)
 80483bf:	e8 02 0c 00 00       	call   8048fc6 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 80483c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80483c8:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 80483cc:	7e b4                	jle    8048382 <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 80483ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80483d2:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 80483d6:	7e a1                	jle    8048379 <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 80483d8:	c9                   	leave  
 80483d9:	c3                   	ret    

080483da <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 80483da:	55                   	push   %ebp
 80483db:	89 e5                	mov    %esp,%ebp
 80483dd:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 80483e0:	eb 4a                	jmp    804842c <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 80483e2:	8b 45 08             	mov    0x8(%ebp),%eax
 80483e5:	8d 50 01             	lea    0x1(%eax),%edx
 80483e8:	89 55 08             	mov    %edx,0x8(%ebp)
 80483eb:	0f b6 00             	movzbl (%eax),%eax
 80483ee:	0f be c0             	movsbl %al,%eax
 80483f1:	8b 55 14             	mov    0x14(%ebp),%edx
 80483f4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80483f8:	8b 55 10             	mov    0x10(%ebp),%edx
 80483fb:	89 54 24 08          	mov    %edx,0x8(%esp)
 80483ff:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048402:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048406:	89 04 24             	mov    %eax,(%esp)
 8048409:	e8 1d ff ff ff       	call   804832b <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 804840e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048411:	83 c0 08             	add    $0x8,%eax
 8048414:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 8048419:	7e 0d                	jle    8048428 <draw_string+0x4e>
			x += 8; y = 0;
 804841b:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 804841f:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8048426:	eb 04                	jmp    804842c <draw_string+0x52>
		} else {
			y += 8;
 8048428:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 804842c:	8b 45 08             	mov    0x8(%ebp),%eax
 804842f:	0f b6 00             	movzbl (%eax),%eax
 8048432:	84 c0                	test   %al,%al
 8048434:	75 ac                	jne    80483e2 <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 8048436:	c9                   	leave  
 8048437:	c3                   	ret    

08048438 <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 8048438:	55                   	push   %ebp
 8048439:	89 e5                	mov    %esp,%ebp
 804843b:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 804843e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048445:	eb 3d                	jmp    8048484 <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 8048447:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804844e:	eb 28                	jmp    8048478 <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 8048450:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048453:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048456:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048459:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804845c:	8b 55 08             	mov    0x8(%ebp),%edx
 804845f:	01 c2                	add    %eax,%edx
 8048461:	8b 45 14             	mov    0x14(%ebp),%eax
 8048464:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048468:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804846c:	89 14 24             	mov    %edx,(%esp)
 804846f:	e8 52 0b 00 00       	call   8048fc6 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 8048474:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048478:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804847b:	3b 45 10             	cmp    0x10(%ebp),%eax
 804847e:	7c d0                	jl     8048450 <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 8048480:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048484:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048487:	3b 45 10             	cmp    0x10(%ebp),%eax
 804848a:	7c bb                	jl     8048447 <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 804848c:	c9                   	leave  
 804848d:	c3                   	ret    

0804848e <redraw_screen>:

void
redraw_screen() {
 804848e:	55                   	push   %ebp
 804848f:	89 e5                	mov    %esp,%ebp
 8048491:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 8048494:	e8 95 0b 00 00       	call   804902e <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 8048499:	e8 49 07 00 00       	call   8048be7 <get_st_head>
 804849e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80484a1:	eb 37                	jmp    80484da <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 80484a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484a6:	8b 48 08             	mov    0x8(%eax),%ecx
 80484a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484ac:	8b 50 04             	mov    0x4(%eax),%edx
 80484af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484b2:	8b 00                	mov    (%eax),%eax
 80484b4:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 80484bb:	00 
 80484bc:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80484c0:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484c4:	89 04 24             	mov    %eax,(%esp)
 80484c7:	e8 6c ff ff ff       	call   8048438 <draw_bomb>
		it=st_next(it);
 80484cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484cf:	89 04 24             	mov    %eax,(%esp)
 80484d2:	e8 d6 04 00 00       	call   80489ad <st_next>
 80484d7:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 80484da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80484de:	75 c3                	jne    80484a3 <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 80484e0:	8b 0d 48 5c 09 08    	mov    0x8095c48,%ecx
 80484e6:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 80484ec:	a1 40 5c 09 08       	mov    0x8095c40,%eax
 80484f1:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 80484f8:	00 
 80484f9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80484fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048501:	89 04 24             	mov    %eax,(%esp)
 8048504:	e8 2f ff ff ff       	call   8048438 <draw_bomb>
	const char *score=itoa(get_score());
 8048509:	e8 c5 06 00 00       	call   8048bd3 <get_score>
 804850e:	89 04 24             	mov    %eax,(%esp)
 8048511:	e8 77 0d 00 00       	call   804928d <itoa>
 8048516:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 8048519:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804851c:	89 04 24             	mov    %eax,(%esp)
 804851f:	e8 05 0e 00 00       	call   8049329 <strlen>
 8048524:	89 c2                	mov    %eax,%edx
 8048526:	b8 00 00 00 00       	mov    $0x0,%eax
 804852b:	29 d0                	sub    %edx,%eax
 804852d:	c1 e0 03             	shl    $0x3,%eax
 8048530:	05 10 01 00 00       	add    $0x110,%eax
 8048535:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804853c:	00 
 804853d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048541:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048548:	00 
 8048549:	c7 04 24 e5 a1 04 08 	movl   $0x804a1e5,(%esp)
 8048550:	e8 85 fe ff ff       	call   80483da <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 8048555:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048558:	89 04 24             	mov    %eax,(%esp)
 804855b:	e8 c9 0d 00 00       	call   8049329 <strlen>
 8048560:	89 c2                	mov    %eax,%edx
 8048562:	b8 00 00 00 00       	mov    $0x0,%eax
 8048567:	29 d0                	sub    %edx,%eax
 8048569:	c1 e0 03             	shl    $0x3,%eax
 804856c:	05 40 01 00 00       	add    $0x140,%eax
 8048571:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048578:	00 
 8048579:	89 44 24 08          	mov    %eax,0x8(%esp)
 804857d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048584:	00 
 8048585:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048588:	89 04 24             	mov    %eax,(%esp)
 804858b:	e8 4a fe ff ff       	call   80483da <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 8048590:	e8 48 06 00 00       	call   8048bdd <get_miss>
 8048595:	89 04 24             	mov    %eax,(%esp)
 8048598:	e8 f0 0c 00 00       	call   804928d <itoa>
 804859d:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 80485a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80485a3:	89 04 24             	mov    %eax,(%esp)
 80485a6:	e8 7e 0d 00 00       	call   8049329 <strlen>
 80485ab:	89 c2                	mov    %eax,%edx
 80485ad:	b8 00 00 00 00       	mov    $0x0,%eax
 80485b2:	29 d0                	sub    %edx,%eax
 80485b4:	c1 e0 03             	shl    $0x3,%eax
 80485b7:	05 18 01 00 00       	add    $0x118,%eax
 80485bc:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80485c3:	00 
 80485c4:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485c8:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80485cf:	00 
 80485d0:	c7 04 24 ec a1 04 08 	movl   $0x804a1ec,(%esp)
 80485d7:	e8 fe fd ff ff       	call   80483da <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80485dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80485df:	89 04 24             	mov    %eax,(%esp)
 80485e2:	e8 42 0d 00 00       	call   8049329 <strlen>
 80485e7:	89 c2                	mov    %eax,%edx
 80485e9:	b8 00 00 00 00       	mov    $0x0,%eax
 80485ee:	29 d0                	sub    %edx,%eax
 80485f0:	c1 e0 03             	shl    $0x3,%eax
 80485f3:	05 40 01 00 00       	add    $0x140,%eax
 80485f8:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80485ff:	00 
 8048600:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048604:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 804860b:	00 
 804860c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804860f:	89 04 24             	mov    %eax,(%esp)
 8048612:	e8 c3 fd ff ff       	call   80483da <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 8048617:	e8 74 00 00 00       	call   8048690 <get_fps>
 804861c:	89 04 24             	mov    %eax,(%esp)
 804861f:	e8 69 0c 00 00       	call   804928d <itoa>
 8048624:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 804862b:	00 
 804862c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8048633:	00 
 8048634:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804863b:	00 
 804863c:	89 04 24             	mov    %eax,(%esp)
 804863f:	e8 96 fd ff ff       	call   80483da <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 8048644:	e8 47 00 00 00       	call   8048690 <get_fps>
 8048649:	89 04 24             	mov    %eax,(%esp)
 804864c:	e8 3c 0c 00 00       	call   804928d <itoa>
 8048651:	89 04 24             	mov    %eax,(%esp)
 8048654:	e8 d0 0c 00 00       	call   8049329 <strlen>
 8048659:	c1 e0 03             	shl    $0x3,%eax
 804865c:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048663:	00 
 8048664:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048668:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804866f:	00 
 8048670:	c7 04 24 f2 a1 04 08 	movl   $0x804a1f2,(%esp)
 8048677:	e8 5e fd ff ff       	call   80483da <draw_string>
	syspr();
 804867c:	e8 d1 09 00 00       	call   8049052 <syspr>
}
 8048681:	c9                   	leave  
 8048682:	c3                   	ret    

08048683 <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 8048683:	55                   	push   %ebp
 8048684:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 8048686:	8b 45 08             	mov    0x8(%ebp),%eax
 8048689:	a3 34 b4 04 08       	mov    %eax,0x804b434
}
 804868e:	5d                   	pop    %ebp
 804868f:	c3                   	ret    

08048690 <get_fps>:
int get_fps() {
 8048690:	55                   	push   %ebp
 8048691:	89 e5                	mov    %esp,%ebp
	return real_fps;
 8048693:	a1 34 b4 04 08       	mov    0x804b434,%eax
}
 8048698:	5d                   	pop    %ebp
 8048699:	c3                   	ret    

0804869a <main_loop>:


extern void key_operation();
void main_loop(void) {
 804869a:	55                   	push   %ebp
 804869b:	89 e5                	mov    %esp,%ebp
 804869d:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 80486a0:	e8 c9 09 00 00       	call   804906e <systime>
 80486a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 80486a8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 80486af:	c7 05 40 5c 09 08 64 	movl   $0x64,0x8095c40
 80486b6:	00 00 00 
	pl.y=150;
 80486b9:	c7 05 44 5c 09 08 96 	movl   $0x96,0x8095c44
 80486c0:	00 00 00 
	pl.w=10;
 80486c3:	c7 05 48 5c 09 08 0a 	movl   $0xa,0x8095c48
 80486ca:	00 00 00 
	pl.v=10;
 80486cd:	c7 05 4c 5c 09 08 0a 	movl   $0xa,0x8095c4c
 80486d4:	00 00 00 
	int k=0;
 80486d7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	while (TRUE) {
	
		key_operation();
 80486de:	e8 67 fb ff ff       	call   804824a <key_operation>
		target = systime(); 
 80486e3:	e8 86 09 00 00       	call   804906e <systime>
 80486e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
		redraw = FALSE;
 80486eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 80486f2:	e9 06 01 00 00       	jmp    80487fd <main_loop+0x163>
			int code=sysreadkey();
 80486f7:	e8 86 09 00 00       	call   8049082 <sysreadkey>
 80486fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
			if(code!=-1){
 80486ff:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
 8048703:	74 0b                	je     8048710 <main_loop+0x76>
				press_key(code);
 8048705:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048708:	89 04 24             	mov    %eax,(%esp)
 804870b:	e8 7a fa ff ff       	call   804818a <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 8048710:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048713:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 8048718:	89 c8                	mov    %ecx,%eax
 804871a:	f7 ea                	imul   %edx
 804871c:	c1 fa 05             	sar    $0x5,%edx
 804871f:	89 c8                	mov    %ecx,%eax
 8048721:	c1 f8 1f             	sar    $0x1f,%eax
 8048724:	29 c2                	sub    %eax,%edx
 8048726:	89 d0                	mov    %edx,%eax
 8048728:	6b c0 64             	imul   $0x64,%eax,%eax
 804872b:	29 c1                	sub    %eax,%ecx
 804872d:	89 c8                	mov    %ecx,%eax
 804872f:	85 c0                	test   %eax,%eax
 8048731:	75 05                	jne    8048738 <main_loop+0x9e>
				create_new_stone();
 8048733:	e8 b9 04 00 00       	call   8048bf1 <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 8048738:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804873b:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048740:	89 c8                	mov    %ecx,%eax
 8048742:	f7 ea                	imul   %edx
 8048744:	89 c8                	mov    %ecx,%eax
 8048746:	c1 f8 1f             	sar    $0x1f,%eax
 8048749:	29 c2                	sub    %eax,%edx
 804874b:	89 d0                	mov    %edx,%eax
 804874d:	01 c0                	add    %eax,%eax
 804874f:	01 d0                	add    %edx,%eax
 8048751:	29 c1                	sub    %eax,%ecx
 8048753:	89 ca                	mov    %ecx,%edx
 8048755:	85 d2                	test   %edx,%edx
 8048757:	75 05                	jne    804875e <main_loop+0xc4>
				update_stone_pos();
 8048759:	e8 36 05 00 00       	call   8048c94 <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 804875e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048761:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048766:	89 c8                	mov    %ecx,%eax
 8048768:	f7 ea                	imul   %edx
 804876a:	89 c8                	mov    %ecx,%eax
 804876c:	c1 f8 1f             	sar    $0x1f,%eax
 804876f:	29 c2                	sub    %eax,%edx
 8048771:	89 d0                	mov    %edx,%eax
 8048773:	01 c0                	add    %eax,%eax
 8048775:	01 d0                	add    %edx,%eax
 8048777:	29 c1                	sub    %eax,%ecx
 8048779:	89 ca                	mov    %ecx,%edx
 804877b:	85 d2                	test   %edx,%edx
 804877d:	75 05                	jne    8048784 <main_loop+0xea>
				update_bang();
 804877f:	e8 aa 07 00 00       	call   8048f2e <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 8048784:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048787:	ba 56 55 55 55       	mov    $0x55555556,%edx
 804878c:	89 c8                	mov    %ecx,%eax
 804878e:	f7 ea                	imul   %edx
 8048790:	89 c8                	mov    %ecx,%eax
 8048792:	c1 f8 1f             	sar    $0x1f,%eax
 8048795:	29 c2                	sub    %eax,%edx
 8048797:	89 d0                	mov    %edx,%eax
 8048799:	01 c0                	add    %eax,%eax
 804879b:	01 d0                	add    %edx,%eax
 804879d:	29 c1                	sub    %eax,%ecx
 804879f:	89 ca                	mov    %ecx,%edx
 80487a1:	85 d2                	test   %edx,%edx
 80487a3:	75 07                	jne    80487ac <main_loop+0x112>
				redraw = TRUE;
 80487a5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 80487ac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80487af:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80487b4:	89 c8                	mov    %ecx,%eax
 80487b6:	f7 ea                	imul   %edx
 80487b8:	c1 fa 04             	sar    $0x4,%edx
 80487bb:	89 c8                	mov    %ecx,%eax
 80487bd:	c1 f8 1f             	sar    $0x1f,%eax
 80487c0:	29 c2                	sub    %eax,%edx
 80487c2:	89 d0                	mov    %edx,%eax
 80487c4:	6b c0 32             	imul   $0x32,%eax,%eax
 80487c7:	29 c1                	sub    %eax,%ecx
 80487c9:	89 c8                	mov    %ecx,%eax
 80487cb:	85 c0                	test   %eax,%eax
 80487cd:	75 2a                	jne    80487f9 <main_loop+0x15f>
				int now_fps = num_draw * 2 + 1;
 80487cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80487d2:	01 c0                	add    %eax,%eax
 80487d4:	83 c0 01             	add    $0x1,%eax
 80487d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 80487da:	83 7d e4 1e          	cmpl   $0x1e,-0x1c(%ebp)
 80487de:	7e 07                	jle    80487e7 <main_loop+0x14d>
 80487e0:	c7 45 e4 1e 00 00 00 	movl   $0x1e,-0x1c(%ebp)
				set_fps(now_fps);
 80487e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80487ea:	89 04 24             	mov    %eax,(%esp)
 80487ed:	e8 91 fe ff ff       	call   8048683 <set_fps>
				num_draw = 0;
 80487f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 80487f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 80487fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048800:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 8048803:	0f 8c ee fe ff ff    	jl     80486f7 <main_loop+0x5d>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 8048809:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 804880d:	74 09                	je     8048818 <main_loop+0x17e>
			num_draw ++;
 804880f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 8048813:	e8 76 fc ff ff       	call   804848e <redraw_screen>
		}

		if(k==0){        //for test
 8048818:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 804881c:	75 23                	jne    8048841 <main_loop+0x1a7>
			fork();
 804881e:	e8 9c 08 00 00       	call   80490bf <fork>
			k=1;
 8048823:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
			printf("%d\n",getpid());
 804882a:	e8 a4 08 00 00       	call   80490d3 <getpid>
 804882f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048833:	c7 04 24 f6 a1 04 08 	movl   $0x804a1f6,(%esp)
 804883a:	e8 0d 0a 00 00       	call   804924c <printf>
 804883f:	eb 73                	jmp    80488b4 <main_loop+0x21a>
		}
		else if(k%10==0)
 8048841:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048844:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8048849:	89 c8                	mov    %ecx,%eax
 804884b:	f7 ea                	imul   %edx
 804884d:	c1 fa 02             	sar    $0x2,%edx
 8048850:	89 c8                	mov    %ecx,%eax
 8048852:	c1 f8 1f             	sar    $0x1f,%eax
 8048855:	29 c2                	sub    %eax,%edx
 8048857:	89 d0                	mov    %edx,%eax
 8048859:	c1 e0 02             	shl    $0x2,%eax
 804885c:	01 d0                	add    %edx,%eax
 804885e:	01 c0                	add    %eax,%eax
 8048860:	29 c1                	sub    %eax,%ecx
 8048862:	89 ca                	mov    %ecx,%edx
 8048864:	85 d2                	test   %edx,%edx
 8048866:	75 12                	jne    804887a <main_loop+0x1e0>
		{
			sleep(1);
 8048868:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804886f:	e8 8e 08 00 00       	call   8049102 <sleep>
			k++;
 8048874:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 8048878:	eb 3a                	jmp    80488b4 <main_loop+0x21a>
		}
		else if(k%100==0)
 804887a:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 804887d:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 8048882:	89 c8                	mov    %ecx,%eax
 8048884:	f7 ea                	imul   %edx
 8048886:	c1 fa 05             	sar    $0x5,%edx
 8048889:	89 c8                	mov    %ecx,%eax
 804888b:	c1 f8 1f             	sar    $0x1f,%eax
 804888e:	29 c2                	sub    %eax,%edx
 8048890:	89 d0                	mov    %edx,%eax
 8048892:	6b c0 64             	imul   $0x64,%eax,%eax
 8048895:	29 c1                	sub    %eax,%ecx
 8048897:	89 c8                	mov    %ecx,%eax
 8048899:	85 c0                	test   %eax,%eax
 804889b:	75 0e                	jne    80488ab <main_loop+0x211>
		{
			exit(0);
 804889d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80488a4:	e8 3e 08 00 00       	call   80490e7 <exit>
 80488a9:	eb 09                	jmp    80488b4 <main_loop+0x21a>
		}
		else
			k++;
 80488ab:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
	}
 80488af:	e9 2a fe ff ff       	jmp    80486de <main_loop+0x44>
 80488b4:	e9 25 fe ff ff       	jmp    80486de <main_loop+0x44>

080488b9 <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 80488b9:	55                   	push   %ebp
 80488ba:	89 e5                	mov    %esp,%ebp
 80488bc:	83 ec 28             	sub    $0x28,%esp
 80488bf:	a1 d8 5d 08 08       	mov    0x8085dd8,%eax
 80488c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488c7:	c7 45 ec 40 b4 04 08 	movl   $0x804b440,-0x14(%ebp)
 80488ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80488d2:	75 47                	jne    804891b <st_new+0x62>
 80488d4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 80488db:	eb 2f                	jmp    804890c <st_new+0x53>
 80488dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488e0:	89 d0                	mov    %edx,%eax
 80488e2:	01 c0                	add    %eax,%eax
 80488e4:	01 d0                	add    %edx,%eax
 80488e6:	c1 e0 03             	shl    $0x3,%eax
 80488e9:	8d 50 e8             	lea    -0x18(%eax),%edx
 80488ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488ef:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80488f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488f5:	89 d0                	mov    %edx,%eax
 80488f7:	01 c0                	add    %eax,%eax
 80488f9:	01 d0                	add    %edx,%eax
 80488fb:	c1 e0 03             	shl    $0x3,%eax
 80488fe:	89 c2                	mov    %eax,%edx
 8048900:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048903:	01 d0                	add    %edx,%eax
 8048905:	89 41 14             	mov    %eax,0x14(%ecx)
 8048908:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804890c:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 8048913:	7e c8                	jle    80488dd <st_new+0x24>
 8048915:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048918:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804891b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804891e:	8b 40 14             	mov    0x14(%eax),%eax
 8048921:	85 c0                	test   %eax,%eax
 8048923:	75 24                	jne    8048949 <st_new+0x90>
 8048925:	c7 44 24 0c fa a1 04 	movl   $0x804a1fa,0xc(%esp)
 804892c:	08 
 804892d:	c7 44 24 08 13 a2 04 	movl   $0x804a213,0x8(%esp)
 8048934:	08 
 8048935:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 804893c:	00 
 804893d:	c7 04 24 28 a2 04 08 	movl   $0x804a228,(%esp)
 8048944:	e8 42 f9 ff ff       	call   804828b <_panic>
 8048949:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804894c:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804894f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048952:	8b 40 14             	mov    0x14(%eax),%eax
 8048955:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 804895a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804895d:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 8048964:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048967:	8b 50 14             	mov    0x14(%eax),%edx
 804896a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804896d:	89 50 10             	mov    %edx,0x10(%eax)
 8048970:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048973:	c9                   	leave  
 8048974:	c3                   	ret    

08048975 <st_prev>:
 8048975:	55                   	push   %ebp
 8048976:	89 e5                	mov    %esp,%ebp
 8048978:	83 ec 18             	sub    $0x18,%esp
 804897b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804897f:	75 24                	jne    80489a5 <st_prev+0x30>
 8048981:	c7 44 24 0c 36 a2 04 	movl   $0x804a236,0xc(%esp)
 8048988:	08 
 8048989:	c7 44 24 08 13 a2 04 	movl   $0x804a213,0x8(%esp)
 8048990:	08 
 8048991:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048998:	00 
 8048999:	c7 04 24 28 a2 04 08 	movl   $0x804a228,(%esp)
 80489a0:	e8 e6 f8 ff ff       	call   804828b <_panic>
 80489a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80489a8:	8b 40 10             	mov    0x10(%eax),%eax
 80489ab:	c9                   	leave  
 80489ac:	c3                   	ret    

080489ad <st_next>:
 80489ad:	55                   	push   %ebp
 80489ae:	89 e5                	mov    %esp,%ebp
 80489b0:	83 ec 18             	sub    $0x18,%esp
 80489b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80489b7:	75 24                	jne    80489dd <st_next+0x30>
 80489b9:	c7 44 24 0c 36 a2 04 	movl   $0x804a236,0xc(%esp)
 80489c0:	08 
 80489c1:	c7 44 24 08 13 a2 04 	movl   $0x804a213,0x8(%esp)
 80489c8:	08 
 80489c9:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80489d0:	00 
 80489d1:	c7 04 24 28 a2 04 08 	movl   $0x804a228,(%esp)
 80489d8:	e8 ae f8 ff ff       	call   804828b <_panic>
 80489dd:	8b 45 08             	mov    0x8(%ebp),%eax
 80489e0:	8b 40 14             	mov    0x14(%eax),%eax
 80489e3:	c9                   	leave  
 80489e4:	c3                   	ret    

080489e5 <st_insert>:
 80489e5:	55                   	push   %ebp
 80489e6:	89 e5                	mov    %esp,%ebp
 80489e8:	83 ec 18             	sub    $0x18,%esp
 80489eb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80489ef:	75 2a                	jne    8048a1b <st_insert+0x36>
 80489f1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80489f5:	75 24                	jne    8048a1b <st_insert+0x36>
 80489f7:	c7 44 24 0c 43 a2 04 	movl   $0x804a243,0xc(%esp)
 80489fe:	08 
 80489ff:	c7 44 24 08 13 a2 04 	movl   $0x804a213,0x8(%esp)
 8048a06:	08 
 8048a07:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048a0e:	00 
 8048a0f:	c7 04 24 28 a2 04 08 	movl   $0x804a228,(%esp)
 8048a16:	e8 70 f8 ff ff       	call   804828b <_panic>
 8048a1b:	8b 45 10             	mov    0x10(%ebp),%eax
 8048a1e:	8b 55 08             	mov    0x8(%ebp),%edx
 8048a21:	89 50 10             	mov    %edx,0x10(%eax)
 8048a24:	8b 45 10             	mov    0x10(%ebp),%eax
 8048a27:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048a2a:	89 50 14             	mov    %edx,0x14(%eax)
 8048a2d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048a31:	74 09                	je     8048a3c <st_insert+0x57>
 8048a33:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a36:	8b 55 10             	mov    0x10(%ebp),%edx
 8048a39:	89 50 14             	mov    %edx,0x14(%eax)
 8048a3c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048a40:	74 09                	je     8048a4b <st_insert+0x66>
 8048a42:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048a45:	8b 55 10             	mov    0x10(%ebp),%edx
 8048a48:	89 50 10             	mov    %edx,0x10(%eax)
 8048a4b:	c9                   	leave  
 8048a4c:	c3                   	ret    

08048a4d <st_remove>:
 8048a4d:	55                   	push   %ebp
 8048a4e:	89 e5                	mov    %esp,%ebp
 8048a50:	83 ec 28             	sub    $0x28,%esp
 8048a53:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a56:	8b 40 10             	mov    0x10(%eax),%eax
 8048a59:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a5c:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a5f:	8b 40 14             	mov    0x14(%eax),%eax
 8048a62:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048a65:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048a69:	75 24                	jne    8048a8f <st_remove+0x42>
 8048a6b:	c7 44 24 0c 36 a2 04 	movl   $0x804a236,0xc(%esp)
 8048a72:	08 
 8048a73:	c7 44 24 08 13 a2 04 	movl   $0x804a213,0x8(%esp)
 8048a7a:	08 
 8048a7b:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048a82:	00 
 8048a83:	c7 04 24 28 a2 04 08 	movl   $0x804a228,(%esp)
 8048a8a:	e8 fc f7 ff ff       	call   804828b <_panic>
 8048a8f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048a93:	74 09                	je     8048a9e <st_remove+0x51>
 8048a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a98:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048a9b:	89 50 14             	mov    %edx,0x14(%eax)
 8048a9e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048aa2:	74 09                	je     8048aad <st_remove+0x60>
 8048aa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048aa7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048aaa:	89 50 10             	mov    %edx,0x10(%eax)
 8048aad:	c9                   	leave  
 8048aae:	c3                   	ret    

08048aaf <st_free>:
 8048aaf:	55                   	push   %ebp
 8048ab0:	89 e5                	mov    %esp,%ebp
 8048ab2:	8b 15 d8 5d 08 08    	mov    0x8085dd8,%edx
 8048ab8:	8b 45 08             	mov    0x8(%ebp),%eax
 8048abb:	89 50 14             	mov    %edx,0x14(%eax)
 8048abe:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ac1:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048ac6:	5d                   	pop    %ebp
 8048ac7:	c3                   	ret    

08048ac8 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 8048ac8:	55                   	push   %ebp
 8048ac9:	89 e5                	mov    %esp,%ebp
 8048acb:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 8048ace:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ad1:	83 f8 01             	cmp    $0x1,%eax
 8048ad4:	74 4e                	je     8048b24 <control_plane+0x5c>
 8048ad6:	83 f8 01             	cmp    $0x1,%eax
 8048ad9:	7f 09                	jg     8048ae4 <control_plane+0x1c>
 8048adb:	85 c0                	test   %eax,%eax
 8048add:	74 18                	je     8048af7 <control_plane+0x2f>
 8048adf:	e9 c9 00 00 00       	jmp    8048bad <control_plane+0xe5>
 8048ae4:	83 f8 02             	cmp    $0x2,%eax
 8048ae7:	74 6c                	je     8048b55 <control_plane+0x8d>
 8048ae9:	83 f8 03             	cmp    $0x3,%eax
 8048aec:	0f 84 8a 00 00 00    	je     8048b7c <control_plane+0xb4>
 8048af2:	e9 b6 00 00 00       	jmp    8048bad <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 8048af7:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048afd:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b02:	39 c2                	cmp    %eax,%edx
 8048b04:	7c 19                	jl     8048b1f <control_plane+0x57>
 8048b06:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048b0c:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b11:	29 c2                	sub    %eax,%edx
 8048b13:	89 d0                	mov    %edx,%eax
 8048b15:	a3 40 5c 09 08       	mov    %eax,0x8095c40
 8048b1a:	e9 b2 00 00 00       	jmp    8048bd1 <control_plane+0x109>
 8048b1f:	e9 ad 00 00 00       	jmp    8048bd1 <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048b24:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048b2a:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b2f:	01 c2                	add    %eax,%edx
 8048b31:	a1 48 5c 09 08       	mov    0x8095c48,%eax
 8048b36:	01 d0                	add    %edx,%eax
 8048b38:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048b3d:	7f 14                	jg     8048b53 <control_plane+0x8b>
 8048b3f:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048b45:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b4a:	01 d0                	add    %edx,%eax
 8048b4c:	a3 40 5c 09 08       	mov    %eax,0x8095c40
 8048b51:	eb 7e                	jmp    8048bd1 <control_plane+0x109>
 8048b53:	eb 7c                	jmp    8048bd1 <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 8048b55:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b5b:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b60:	39 c2                	cmp    %eax,%edx
 8048b62:	7c 16                	jl     8048b7a <control_plane+0xb2>
 8048b64:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b6a:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b6f:	29 c2                	sub    %eax,%edx
 8048b71:	89 d0                	mov    %edx,%eax
 8048b73:	a3 44 5c 09 08       	mov    %eax,0x8095c44
 8048b78:	eb 57                	jmp    8048bd1 <control_plane+0x109>
 8048b7a:	eb 55                	jmp    8048bd1 <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 8048b7c:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b82:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b87:	01 c2                	add    %eax,%edx
 8048b89:	a1 48 5c 09 08       	mov    0x8095c48,%eax
 8048b8e:	01 d0                	add    %edx,%eax
 8048b90:	3d 40 01 00 00       	cmp    $0x140,%eax
 8048b95:	7f 14                	jg     8048bab <control_plane+0xe3>
 8048b97:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b9d:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048ba2:	01 d0                	add    %edx,%eax
 8048ba4:	a3 44 5c 09 08       	mov    %eax,0x8095c44
 8048ba9:	eb 26                	jmp    8048bd1 <control_plane+0x109>
 8048bab:	eb 24                	jmp    8048bd1 <control_plane+0x109>
		default:assert(0);
 8048bad:	c7 44 24 0c 60 a2 04 	movl   $0x804a260,0xc(%esp)
 8048bb4:	08 
 8048bb5:	c7 44 24 08 13 a2 04 	movl   $0x804a213,0x8(%esp)
 8048bbc:	08 
 8048bbd:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048bc4:	00 
 8048bc5:	c7 04 24 28 a2 04 08 	movl   $0x804a228,(%esp)
 8048bcc:	e8 ba f6 ff ff       	call   804828b <_panic>
	}
}
 8048bd1:	c9                   	leave  
 8048bd2:	c3                   	ret    

08048bd3 <get_score>:


int get_score(void) {
 8048bd3:	55                   	push   %ebp
 8048bd4:	89 e5                	mov    %esp,%ebp
	return score;
 8048bd6:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
}
 8048bdb:	5d                   	pop    %ebp
 8048bdc:	c3                   	ret    

08048bdd <get_miss>:

int get_miss(void) {
 8048bdd:	55                   	push   %ebp
 8048bde:	89 e5                	mov    %esp,%ebp
	return miss;
 8048be0:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
}
 8048be5:	5d                   	pop    %ebp
 8048be6:	c3                   	ret    

08048be7 <get_st_head>:

st_t get_st_head(void){
 8048be7:	55                   	push   %ebp
 8048be8:	89 e5                	mov    %esp,%ebp
	return head;
 8048bea:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
}
 8048bef:	5d                   	pop    %ebp
 8048bf0:	c3                   	ret    

08048bf1 <create_new_stone>:

void create_new_stone(void) {
 8048bf1:	55                   	push   %ebp
 8048bf2:	89 e5                	mov    %esp,%ebp
 8048bf4:	53                   	push   %ebx
 8048bf5:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048bf8:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048bfd:	85 c0                	test   %eax,%eax
 8048bff:	75 0c                	jne    8048c0d <create_new_stone+0x1c>
		head = st_new(); 
 8048c01:	e8 b3 fc ff ff       	call   80488b9 <st_new>
 8048c06:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
 8048c0b:	eb 2c                	jmp    8048c39 <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048c0d:	e8 a7 fc ff ff       	call   80488b9 <st_new>
 8048c12:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048c15:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c1a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c1d:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c21:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048c2c:	e8 b4 fd ff ff       	call   80489e5 <st_insert>
		head = now;
 8048c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c34:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
	}
	head->x = 0;
 8048c39:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c3e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048c44:	8b 1d dc 5d 08 08    	mov    0x8085ddc,%ebx
 8048c4a:	e8 d0 11 00 00       	call   8049e1f <rand>
 8048c4f:	89 c1                	mov    %eax,%ecx
 8048c51:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048c56:	89 c8                	mov    %ecx,%eax
 8048c58:	f7 ea                	imul   %edx
 8048c5a:	c1 fa 04             	sar    $0x4,%edx
 8048c5d:	89 c8                	mov    %ecx,%eax
 8048c5f:	c1 f8 1f             	sar    $0x1f,%eax
 8048c62:	29 c2                	sub    %eax,%edx
 8048c64:	89 d0                	mov    %edx,%eax
 8048c66:	6b c0 26             	imul   $0x26,%eax,%eax
 8048c69:	29 c1                	sub    %eax,%ecx
 8048c6b:	89 c8                	mov    %ecx,%eax
 8048c6d:	83 c0 01             	add    $0x1,%eax
 8048c70:	c1 e0 03             	shl    $0x3,%eax
 8048c73:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048c76:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c7b:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048c82:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c87:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048c8e:	83 c4 24             	add    $0x24,%esp
 8048c91:	5b                   	pop    %ebx
 8048c92:	5d                   	pop    %ebp
 8048c93:	c3                   	ret    

08048c94 <update_stone_pos>:

void update_stone_pos(void) {
 8048c94:	55                   	push   %ebp
 8048c95:	89 e5                	mov    %esp,%ebp
 8048c97:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048c9a:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048ca2:	eb 6f                	jmp    8048d13 <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048ca4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ca7:	89 04 24             	mov    %eax,(%esp)
 8048caa:	e8 fe fc ff ff       	call   80489ad <st_next>
 8048caf:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cb5:	8b 10                	mov    (%eax),%edx
 8048cb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cba:	8b 40 0c             	mov    0xc(%eax),%eax
 8048cbd:	01 c2                	add    %eax,%edx
 8048cbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cc2:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cc7:	8b 10                	mov    (%eax),%edx
 8048cc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ccc:	8b 40 08             	mov    0x8(%eax),%eax
 8048ccf:	01 d0                	add    %edx,%eax
 8048cd1:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048cd6:	7e 35                	jle    8048d0d <update_stone_pos+0x79>
			miss++; 
 8048cd8:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
 8048cdd:	83 c0 01             	add    $0x1,%eax
 8048ce0:	a3 e4 5d 08 08       	mov    %eax,0x8085de4
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ce8:	89 04 24             	mov    %eax,(%esp)
 8048ceb:	e8 5d fd ff ff       	call   8048a4d <st_remove>
			if (it == head) head = next; 
 8048cf0:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048cf5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048cf8:	75 08                	jne    8048d02 <update_stone_pos+0x6e>
 8048cfa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048cfd:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048d02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d05:	89 04 24             	mov    %eax,(%esp)
 8048d08:	e8 a2 fd ff ff       	call   8048aaf <st_free>
		}
		it = next;
 8048d0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d10:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048d13:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048d17:	75 8b                	jne    8048ca4 <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048d19:	c9                   	leave  
 8048d1a:	c3                   	ret    

08048d1b <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048d1b:	55                   	push   %ebp
 8048d1c:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048d1e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d21:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048d24:	7f 29                	jg     8048d4f <inplane+0x34>
 8048d26:	8b 55 10             	mov    0x10(%ebp),%edx
 8048d29:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d2c:	01 d0                	add    %edx,%eax
 8048d2e:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048d31:	7c 1c                	jl     8048d4f <inplane+0x34>
 8048d33:	8b 45 14             	mov    0x14(%ebp),%eax
 8048d36:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048d39:	7f 14                	jg     8048d4f <inplane+0x34>
 8048d3b:	8b 55 14             	mov    0x14(%ebp),%edx
 8048d3e:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d41:	01 d0                	add    %edx,%eax
 8048d43:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048d46:	7c 07                	jl     8048d4f <inplane+0x34>
 8048d48:	b8 01 00 00 00       	mov    $0x1,%eax
 8048d4d:	eb 05                	jmp    8048d54 <inplane+0x39>
 8048d4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048d54:	5d                   	pop    %ebp
 8048d55:	c3                   	ret    

08048d56 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048d56:	55                   	push   %ebp
 8048d57:	89 e5                	mov    %esp,%ebp
 8048d59:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048d5c:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d5f:	8b 00                	mov    (%eax),%eax
 8048d61:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048d64:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d67:	8b 40 04             	mov    0x4(%eax),%eax
 8048d6a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048d6d:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d70:	8b 40 08             	mov    0x8(%eax),%eax
 8048d73:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048d76:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d79:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048d7c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d7f:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048d82:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d85:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048d88:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048d8b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d8e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048d91:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048d95:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048d98:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048d9c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048d9f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048da3:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048da7:	89 04 24             	mov    %eax,(%esp)
 8048daa:	e8 6c ff ff ff       	call   8048d1b <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048daf:	85 c0                	test   %eax,%eax
 8048db1:	0f 85 69 01 00 00    	jne    8048f20 <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048db7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048dba:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048dbd:	8b 55 10             	mov    0x10(%ebp),%edx
 8048dc0:	01 d1                	add    %edx,%ecx
 8048dc2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048dc5:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048dc9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048dcc:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048dd0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048dd3:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048dd7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ddb:	89 0c 24             	mov    %ecx,(%esp)
 8048dde:	e8 38 ff ff ff       	call   8048d1b <inplane>
 8048de3:	85 c0                	test   %eax,%eax
 8048de5:	0f 85 35 01 00 00    	jne    8048f20 <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048deb:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048dee:	8b 45 10             	mov    0x10(%ebp),%eax
 8048df1:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048df4:	8b 45 08             	mov    0x8(%ebp),%eax
 8048df7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048dfa:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048dfe:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e01:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048e05:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048e08:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048e0c:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048e10:	89 04 24             	mov    %eax,(%esp)
 8048e13:	e8 03 ff ff ff       	call   8048d1b <inplane>
 8048e18:	85 c0                	test   %eax,%eax
 8048e1a:	0f 85 00 01 00 00    	jne    8048f20 <bang_or_not+0x1ca>
 8048e20:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e23:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e26:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048e29:	8b 55 08             	mov    0x8(%ebp),%edx
 8048e2c:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e2f:	01 c2                	add    %eax,%edx
 8048e31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e34:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048e38:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e3b:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048e3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e42:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048e46:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048e4a:	89 14 24             	mov    %edx,(%esp)
 8048e4d:	e8 c9 fe ff ff       	call   8048d1b <inplane>
 8048e52:	85 c0                	test   %eax,%eax
 8048e54:	0f 85 c6 00 00 00    	jne    8048f20 <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048e5a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e60:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048e63:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048e67:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048e6a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048e6e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048e71:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048e75:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048e79:	89 04 24             	mov    %eax,(%esp)
 8048e7c:	e8 9a fe ff ff       	call   8048d1b <inplane>
 8048e81:	85 c0                	test   %eax,%eax
 8048e83:	0f 85 97 00 00 00    	jne    8048f20 <bang_or_not+0x1ca>
 8048e89:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e8c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048e8f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048e92:	01 d1                	add    %edx,%ecx
 8048e94:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048e97:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048e9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048e9e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048ea2:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048ea5:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048ea9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ead:	89 0c 24             	mov    %ecx,(%esp)
 8048eb0:	e8 66 fe ff ff       	call   8048d1b <inplane>
 8048eb5:	85 c0                	test   %eax,%eax
 8048eb7:	75 67                	jne    8048f20 <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048eb9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048ebc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ebf:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048ec2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ec5:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048ec8:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048ecc:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048ecf:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048ed3:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048ed6:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048eda:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048ede:	89 04 24             	mov    %eax,(%esp)
 8048ee1:	e8 35 fe ff ff       	call   8048d1b <inplane>
 8048ee6:	85 c0                	test   %eax,%eax
 8048ee8:	75 36                	jne    8048f20 <bang_or_not+0x1ca>
 8048eea:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048eed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ef0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048ef3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048ef6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ef9:	01 c2                	add    %eax,%edx
 8048efb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048efe:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f02:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048f05:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f09:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f0c:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048f10:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048f14:	89 14 24             	mov    %edx,(%esp)
 8048f17:	e8 ff fd ff ff       	call   8048d1b <inplane>
 8048f1c:	85 c0                	test   %eax,%eax
 8048f1e:	74 07                	je     8048f27 <bang_or_not+0x1d1>
 8048f20:	b8 01 00 00 00       	mov    $0x1,%eax
 8048f25:	eb 05                	jmp    8048f2c <bang_or_not+0x1d6>
 8048f27:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048f2c:	c9                   	leave  
 8048f2d:	c3                   	ret    

08048f2e <update_bang>:

void update_bang(void) {
 8048f2e:	55                   	push   %ebp
 8048f2f:	89 e5                	mov    %esp,%ebp
 8048f31:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048f34:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048f39:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048f3c:	eb 7c                	jmp    8048fba <update_bang+0x8c>
		st_t next=st_next(it);
 8048f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f41:	89 04 24             	mov    %eax,(%esp)
 8048f44:	e8 64 fa ff ff       	call   80489ad <st_next>
 8048f49:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048f4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f4f:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048f53:	a1 40 5c 09 08       	mov    0x8095c40,%eax
 8048f58:	89 04 24             	mov    %eax,(%esp)
 8048f5b:	a1 44 5c 09 08       	mov    0x8095c44,%eax
 8048f60:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f64:	a1 48 5c 09 08       	mov    0x8095c48,%eax
 8048f69:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f6d:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048f72:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f76:	e8 db fd ff ff       	call   8048d56 <bang_or_not>
 8048f7b:	85 c0                	test   %eax,%eax
 8048f7d:	74 35                	je     8048fb4 <update_bang+0x86>
			score++;
 8048f7f:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
 8048f84:	83 c0 01             	add    $0x1,%eax
 8048f87:	a3 e0 5d 08 08       	mov    %eax,0x8085de0
			st_remove(it);
 8048f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f8f:	89 04 24             	mov    %eax,(%esp)
 8048f92:	e8 b6 fa ff ff       	call   8048a4d <st_remove>
			if(it==head)
 8048f97:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048f9c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048f9f:	75 08                	jne    8048fa9 <update_bang+0x7b>
				head=next;
 8048fa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048fa4:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048fa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fac:	89 04 24             	mov    %eax,(%esp)
 8048faf:	e8 fb fa ff ff       	call   8048aaf <st_free>
		}
		it=next;
 8048fb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048fb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048fba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048fbe:	0f 85 7a ff ff ff    	jne    8048f3e <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8048fc4:	c9                   	leave  
 8048fc5:	c3                   	ret    

08048fc6 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8048fc6:	55                   	push   %ebp
 8048fc7:	89 e5                	mov    %esp,%ebp
 8048fc9:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8048fcc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048fd0:	78 18                	js     8048fea <draw_pixel+0x24>
 8048fd2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048fd6:	78 12                	js     8048fea <draw_pixel+0x24>
 8048fd8:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 8048fdf:	7f 09                	jg     8048fea <draw_pixel+0x24>
 8048fe1:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8048fe8:	7e 24                	jle    804900e <draw_pixel+0x48>
 8048fea:	c7 44 24 0c 64 a2 04 	movl   $0x804a264,0xc(%esp)
 8048ff1:	08 
 8048ff2:	c7 44 24 08 98 a2 04 	movl   $0x804a298,0x8(%esp)
 8048ff9:	08 
 8048ffa:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
 8049001:	00 
 8049002:	c7 04 24 ad a2 04 08 	movl   $0x804a2ad,(%esp)
 8049009:	e8 7d f2 ff ff       	call   804828b <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 804900e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049011:	c1 e0 08             	shl    $0x8,%eax
 8049014:	89 c2                	mov    %eax,%edx
 8049016:	8b 45 08             	mov    0x8(%ebp),%eax
 8049019:	c1 e0 06             	shl    $0x6,%eax
 804901c:	01 c2                	add    %eax,%edx
 804901e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049021:	01 c2                	add    %eax,%edx
 8049023:	8b 45 10             	mov    0x10(%ebp),%eax
 8049026:	88 82 00 5e 08 08    	mov    %al,0x8085e00(%edx)
}
 804902c:	c9                   	leave  
 804902d:	c3                   	ret    

0804902e <sysclean>:


void sysclean(void)
{
 804902e:	55                   	push   %ebp
 804902f:	89 e5                	mov    %esp,%ebp
 8049031:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
 8049034:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 804903b:	00 
 804903c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8049043:	00 
 8049044:	c7 04 24 00 5e 08 08 	movl   $0x8085e00,(%esp)
 804904b:	e8 c0 02 00 00       	call   8049310 <memset>
}
 8049050:	c9                   	leave  
 8049051:	c3                   	ret    

08049052 <syspr>:
int syspr()
{
 8049052:	55                   	push   %ebp
 8049053:	89 e5                	mov    %esp,%ebp
 8049055:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
 8049058:	c7 44 24 04 00 5e 08 	movl   $0x8085e00,0x4(%esp)
 804905f:	08 
 8049060:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049067:	e8 5a 01 00 00       	call   80491c6 <syscall>
}
 804906c:	c9                   	leave  
 804906d:	c3                   	ret    

0804906e <systime>:

int systime(void)
{
 804906e:	55                   	push   %ebp
 804906f:	89 e5                	mov    %esp,%ebp
 8049071:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
 8049074:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804907b:	e8 46 01 00 00       	call   80491c6 <syscall>
}
 8049080:	c9                   	leave  
 8049081:	c3                   	ret    

08049082 <sysreadkey>:

int sysreadkey(void)
{
 8049082:	55                   	push   %ebp
 8049083:	89 e5                	mov    %esp,%ebp
 8049085:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
 8049088:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 804908f:	e8 32 01 00 00       	call   80491c6 <syscall>
}
 8049094:	c9                   	leave  
 8049095:	c3                   	ret    

08049096 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8049096:	55                   	push   %ebp
 8049097:	89 e5                	mov    %esp,%ebp
 8049099:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
 804909c:	8b 45 10             	mov    0x10(%ebp),%eax
 804909f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80490a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490a6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490aa:	8b 45 08             	mov    0x8(%ebp),%eax
 80490ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490b1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 80490b8:	e8 09 01 00 00       	call   80491c6 <syscall>
}
 80490bd:	c9                   	leave  
 80490be:	c3                   	ret    

080490bf <fork>:

int fork(void)
{
 80490bf:	55                   	push   %ebp
 80490c0:	89 e5                	mov    %esp,%ebp
 80490c2:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
 80490c5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 80490cc:	e8 f5 00 00 00       	call   80491c6 <syscall>
}
 80490d1:	c9                   	leave  
 80490d2:	c3                   	ret    

080490d3 <getpid>:

int getpid(void)
{
 80490d3:	55                   	push   %ebp
 80490d4:	89 e5                	mov    %esp,%ebp
 80490d6:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
 80490d9:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
 80490e0:	e8 e1 00 00 00       	call   80491c6 <syscall>
}
 80490e5:	c9                   	leave  
 80490e6:	c3                   	ret    

080490e7 <exit>:

void exit(int suc)
{
 80490e7:	55                   	push   %ebp
 80490e8:	89 e5                	mov    %esp,%ebp
 80490ea:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
 80490ed:	8b 45 08             	mov    0x8(%ebp),%eax
 80490f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490f4:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 80490fb:	e8 c6 00 00 00       	call   80491c6 <syscall>
}
 8049100:	c9                   	leave  
 8049101:	c3                   	ret    

08049102 <sleep>:

void sleep(int sec)
{
 8049102:	55                   	push   %ebp
 8049103:	89 e5                	mov    %esp,%ebp
 8049105:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
 8049108:	8b 45 08             	mov    0x8(%ebp),%eax
 804910b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804910f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049116:	e8 ab 00 00 00       	call   80491c6 <syscall>
	//printf("qweqwe");
}
 804911b:	c9                   	leave  
 804911c:	c3                   	ret    

0804911d <thread>:

int thread(void *addr)
{
 804911d:	55                   	push   %ebp
 804911e:	89 e5                	mov    %esp,%ebp
 8049120:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
 8049123:	8b 45 08             	mov    0x8(%ebp),%eax
 8049126:	89 44 24 04          	mov    %eax,0x4(%esp)
 804912a:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 8049131:	e8 90 00 00 00       	call   80491c6 <syscall>
}
 8049136:	c9                   	leave  
 8049137:	c3                   	ret    

08049138 <sem_init>:

int sem_init(Sema *sema,int value)
{
 8049138:	55                   	push   %ebp
 8049139:	89 e5                	mov    %esp,%ebp
 804913b:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema,value);
 804913e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049141:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049145:	8b 45 08             	mov    0x8(%ebp),%eax
 8049148:	89 44 24 04          	mov    %eax,0x4(%esp)
 804914c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 8049153:	e8 6e 00 00 00       	call   80491c6 <syscall>
}
 8049158:	c9                   	leave  
 8049159:	c3                   	ret    

0804915a <sem_destroy>:

int sem_destroy(Sema *sema)
{
 804915a:	55                   	push   %ebp
 804915b:	89 e5                	mov    %esp,%ebp
 804915d:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
 8049160:	8b 45 08             	mov    0x8(%ebp),%eax
 8049163:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049167:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 804916e:	e8 53 00 00 00       	call   80491c6 <syscall>
}
 8049173:	c9                   	leave  
 8049174:	c3                   	ret    

08049175 <sem_wait>:

int sem_wait(Sema *sema)
{
 8049175:	55                   	push   %ebp
 8049176:	89 e5                	mov    %esp,%ebp
 8049178:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
 804917b:	8b 45 08             	mov    0x8(%ebp),%eax
 804917e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049182:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 8049189:	e8 38 00 00 00       	call   80491c6 <syscall>
}
 804918e:	c9                   	leave  
 804918f:	c3                   	ret    

08049190 <sem_trywait>:

int sem_trywait(Sema *sema)
{
 8049190:	55                   	push   %ebp
 8049191:	89 e5                	mov    %esp,%ebp
 8049193:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
 8049196:	8b 45 08             	mov    0x8(%ebp),%eax
 8049199:	89 44 24 04          	mov    %eax,0x4(%esp)
 804919d:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 80491a4:	e8 1d 00 00 00       	call   80491c6 <syscall>
}
 80491a9:	c9                   	leave  
 80491aa:	c3                   	ret    

080491ab <sem_post>:

int sem_post(Sema *sema)
{
 80491ab:	55                   	push   %ebp
 80491ac:	89 e5                	mov    %esp,%ebp
 80491ae:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
 80491b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80491b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491b8:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 80491bf:	e8 02 00 00 00       	call   80491c6 <syscall>
}
 80491c4:	c9                   	leave  
 80491c5:	c3                   	ret    

080491c6 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 80491c6:	55                   	push   %ebp
 80491c7:	89 e5                	mov    %esp,%ebp
 80491c9:	53                   	push   %ebx
 80491ca:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 80491cd:	8d 45 08             	lea    0x8(%ebp),%eax
 80491d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 80491d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80491d6:	8b 00                	mov    (%eax),%eax
 80491d8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80491db:	83 c2 04             	add    $0x4,%edx
 80491de:	8b 1a                	mov    (%edx),%ebx
 80491e0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80491e3:	83 c2 08             	add    $0x8,%edx
 80491e6:	8b 0a                	mov    (%edx),%ecx
 80491e8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80491eb:	83 c2 0c             	add    $0xc,%edx
 80491ee:	8b 12                	mov    (%edx),%edx
 80491f0:	cd 80                	int    $0x80
 80491f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 80491f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80491f8:	83 c4 10             	add    $0x10,%esp
 80491fb:	5b                   	pop    %ebx
 80491fc:	5d                   	pop    %ebp
 80491fd:	c3                   	ret    

080491fe <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 80491fe:	55                   	push   %ebp
 80491ff:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 8049201:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049204:	8b 00                	mov    (%eax),%eax
 8049206:	8d 48 01             	lea    0x1(%eax),%ecx
 8049209:	8b 55 0c             	mov    0xc(%ebp),%edx
 804920c:	89 0a                	mov    %ecx,(%edx)
 804920e:	8b 55 08             	mov    0x8(%ebp),%edx
 8049211:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 8049217:	5d                   	pop    %ebp
 8049218:	c3                   	ret    

08049219 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 8049219:	55                   	push   %ebp
 804921a:	89 e5                	mov    %esp,%ebp
 804921c:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 804921f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 8049226:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049229:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804922d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049230:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049234:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8049237:	89 44 24 04          	mov    %eax,0x4(%esp)
 804923b:	c7 04 24 fe 91 04 08 	movl   $0x80491fe,(%esp)
 8049242:	e8 d1 06 00 00       	call   8049918 <vprintfmt>
	return cnt;
 8049247:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804924a:	c9                   	leave  
 804924b:	c3                   	ret    

0804924c <printf>:
int printf(const char *fmt, ...)
{
 804924c:	55                   	push   %ebp
 804924d:	89 e5                	mov    %esp,%ebp
 804924f:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8049252:	8d 45 0c             	lea    0xc(%ebp),%eax
 8049255:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 8049258:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804925b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804925f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049262:	89 04 24             	mov    %eax,(%esp)
 8049265:	e8 af ff ff ff       	call   8049219 <vprintf>
 804926a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 804926d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049270:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049274:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 804927b:	08 
 804927c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049283:	e8 0e fe ff ff       	call   8049096 <syswrite>
	return cnt;
 8049288:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804928b:	c9                   	leave  
 804928c:	c3                   	ret    

0804928d <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 804928d:	55                   	push   %ebp
 804928e:	89 e5                	mov    %esp,%ebp
 8049290:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 8049293:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 804929a:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 804929e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80492a1:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80492a6:	89 c8                	mov    %ecx,%eax
 80492a8:	f7 ea                	imul   %edx
 80492aa:	c1 fa 02             	sar    $0x2,%edx
 80492ad:	89 c8                	mov    %ecx,%eax
 80492af:	c1 f8 1f             	sar    $0x1f,%eax
 80492b2:	29 c2                	sub    %eax,%edx
 80492b4:	89 d0                	mov    %edx,%eax
 80492b6:	c1 e0 02             	shl    $0x2,%eax
 80492b9:	01 d0                	add    %edx,%eax
 80492bb:	01 c0                	add    %eax,%eax
 80492bd:	29 c1                	sub    %eax,%ecx
 80492bf:	89 ca                	mov    %ecx,%edx
 80492c1:	89 d0                	mov    %edx,%eax
 80492c3:	83 c0 30             	add    $0x30,%eax
 80492c6:	89 c2                	mov    %eax,%edx
 80492c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492cb:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 80492cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80492d0:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80492d5:	89 c8                	mov    %ecx,%eax
 80492d7:	f7 ea                	imul   %edx
 80492d9:	c1 fa 02             	sar    $0x2,%edx
 80492dc:	89 c8                	mov    %ecx,%eax
 80492de:	c1 f8 1f             	sar    $0x1f,%eax
 80492e1:	29 c2                	sub    %eax,%edx
 80492e3:	89 d0                	mov    %edx,%eax
 80492e5:	89 45 08             	mov    %eax,0x8(%ebp)
 80492e8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80492ec:	75 ac                	jne    804929a <itoa+0xd>
	return p;
 80492ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80492f1:	c9                   	leave  
 80492f2:	c3                   	ret    

080492f3 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 80492f3:	55                   	push   %ebp
 80492f4:	89 e5                	mov    %esp,%ebp
 80492f6:	57                   	push   %edi
 80492f7:	56                   	push   %esi
 80492f8:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 80492f9:	8b 45 10             	mov    0x10(%ebp),%eax
 80492fc:	8b 55 0c             	mov    0xc(%ebp),%edx
 80492ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049302:	89 c1                	mov    %eax,%ecx
 8049304:	89 d6                	mov    %edx,%esi
 8049306:	89 df                	mov    %ebx,%edi
 8049308:	fc                   	cld    
 8049309:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 804930b:	5b                   	pop    %ebx
 804930c:	5e                   	pop    %esi
 804930d:	5f                   	pop    %edi
 804930e:	5d                   	pop    %ebp
 804930f:	c3                   	ret    

08049310 <memset>:

void memset(void *dest, int data, size_t size) {
 8049310:	55                   	push   %ebp
 8049311:	89 e5                	mov    %esp,%ebp
 8049313:	57                   	push   %edi
 8049314:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 8049315:	8b 55 10             	mov    0x10(%ebp),%edx
 8049318:	8b 45 0c             	mov    0xc(%ebp),%eax
 804931b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804931e:	89 d1                	mov    %edx,%ecx
 8049320:	89 df                	mov    %ebx,%edi
 8049322:	fc                   	cld    
 8049323:	f3 aa                	rep stos %al,%es:(%edi)
}
 8049325:	5b                   	pop    %ebx
 8049326:	5f                   	pop    %edi
 8049327:	5d                   	pop    %ebp
 8049328:	c3                   	ret    

08049329 <strlen>:

size_t strlen(const char *str) {
 8049329:	55                   	push   %ebp
 804932a:	89 e5                	mov    %esp,%ebp
 804932c:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 804932f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 8049336:	eb 04                	jmp    804933c <strlen+0x13>
 8049338:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804933c:	8b 45 08             	mov    0x8(%ebp),%eax
 804933f:	8d 50 01             	lea    0x1(%eax),%edx
 8049342:	89 55 08             	mov    %edx,0x8(%ebp)
 8049345:	0f b6 00             	movzbl (%eax),%eax
 8049348:	84 c0                	test   %al,%al
 804934a:	75 ec                	jne    8049338 <strlen+0xf>
	return len;
 804934c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 804934f:	c9                   	leave  
 8049350:	c3                   	ret    

08049351 <strcpy>:

void strcpy(char *d, const char *s) {
 8049351:	55                   	push   %ebp
 8049352:	89 e5                	mov    %esp,%ebp
 8049354:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 8049357:	8b 45 0c             	mov    0xc(%ebp),%eax
 804935a:	89 04 24             	mov    %eax,(%esp)
 804935d:	e8 c7 ff ff ff       	call   8049329 <strlen>
 8049362:	83 c0 01             	add    $0x1,%eax
 8049365:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049369:	8b 45 0c             	mov    0xc(%ebp),%eax
 804936c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049370:	8b 45 08             	mov    0x8(%ebp),%eax
 8049373:	89 04 24             	mov    %eax,(%esp)
 8049376:	e8 78 ff ff ff       	call   80492f3 <memcpy>
}
 804937b:	c9                   	leave  
 804937c:	c3                   	ret    

0804937d <strnlen>:

int
strnlen(const char *s, size_t size)
{
 804937d:	55                   	push   %ebp
 804937e:	89 e5                	mov    %esp,%ebp
 8049380:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049383:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804938a:	eb 0c                	jmp    8049398 <strnlen+0x1b>
		n++;
 804938c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049390:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049394:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 8049398:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804939c:	74 0a                	je     80493a8 <strnlen+0x2b>
 804939e:	8b 45 08             	mov    0x8(%ebp),%eax
 80493a1:	0f b6 00             	movzbl (%eax),%eax
 80493a4:	84 c0                	test   %al,%al
 80493a6:	75 e4                	jne    804938c <strnlen+0xf>
		n++;
	return n;
 80493a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80493ab:	c9                   	leave  
 80493ac:	c3                   	ret    

080493ad <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 80493ad:	55                   	push   %ebp
 80493ae:	89 e5                	mov    %esp,%ebp
 80493b0:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 80493b3:	8b 45 08             	mov    0x8(%ebp),%eax
 80493b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 80493b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80493c0:	eb 23                	jmp    80493e5 <strncpy+0x38>
		*dst++ = *src;
 80493c2:	8b 45 08             	mov    0x8(%ebp),%eax
 80493c5:	8d 50 01             	lea    0x1(%eax),%edx
 80493c8:	89 55 08             	mov    %edx,0x8(%ebp)
 80493cb:	8b 55 0c             	mov    0xc(%ebp),%edx
 80493ce:	0f b6 12             	movzbl (%edx),%edx
 80493d1:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 80493d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493d6:	0f b6 00             	movzbl (%eax),%eax
 80493d9:	84 c0                	test   %al,%al
 80493db:	74 04                	je     80493e1 <strncpy+0x34>
			src++;
 80493dd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 80493e1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80493e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80493e8:	3b 45 10             	cmp    0x10(%ebp),%eax
 80493eb:	72 d5                	jb     80493c2 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 80493ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80493f0:	c9                   	leave  
 80493f1:	c3                   	ret    

080493f2 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 80493f2:	55                   	push   %ebp
 80493f3:	89 e5                	mov    %esp,%ebp
 80493f5:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 80493f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80493fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 80493fe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049402:	74 33                	je     8049437 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 8049404:	eb 17                	jmp    804941d <strlcpy+0x2b>
			*dst++ = *src++;
 8049406:	8b 45 08             	mov    0x8(%ebp),%eax
 8049409:	8d 50 01             	lea    0x1(%eax),%edx
 804940c:	89 55 08             	mov    %edx,0x8(%ebp)
 804940f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049412:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049415:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 8049418:	0f b6 12             	movzbl (%edx),%edx
 804941b:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 804941d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049421:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049425:	74 0a                	je     8049431 <strlcpy+0x3f>
 8049427:	8b 45 0c             	mov    0xc(%ebp),%eax
 804942a:	0f b6 00             	movzbl (%eax),%eax
 804942d:	84 c0                	test   %al,%al
 804942f:	75 d5                	jne    8049406 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 8049431:	8b 45 08             	mov    0x8(%ebp),%eax
 8049434:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 8049437:	8b 55 08             	mov    0x8(%ebp),%edx
 804943a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804943d:	29 c2                	sub    %eax,%edx
 804943f:	89 d0                	mov    %edx,%eax
}
 8049441:	c9                   	leave  
 8049442:	c3                   	ret    

08049443 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 8049443:	55                   	push   %ebp
 8049444:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 8049446:	eb 08                	jmp    8049450 <strcmp+0xd>
		p++, q++;
 8049448:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804944c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 8049450:	8b 45 08             	mov    0x8(%ebp),%eax
 8049453:	0f b6 00             	movzbl (%eax),%eax
 8049456:	84 c0                	test   %al,%al
 8049458:	74 10                	je     804946a <strcmp+0x27>
 804945a:	8b 45 08             	mov    0x8(%ebp),%eax
 804945d:	0f b6 10             	movzbl (%eax),%edx
 8049460:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049463:	0f b6 00             	movzbl (%eax),%eax
 8049466:	38 c2                	cmp    %al,%dl
 8049468:	74 de                	je     8049448 <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 804946a:	8b 45 08             	mov    0x8(%ebp),%eax
 804946d:	0f b6 00             	movzbl (%eax),%eax
 8049470:	0f b6 d0             	movzbl %al,%edx
 8049473:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049476:	0f b6 00             	movzbl (%eax),%eax
 8049479:	0f b6 c0             	movzbl %al,%eax
 804947c:	29 c2                	sub    %eax,%edx
 804947e:	89 d0                	mov    %edx,%eax
}
 8049480:	5d                   	pop    %ebp
 8049481:	c3                   	ret    

08049482 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 8049482:	55                   	push   %ebp
 8049483:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 8049485:	eb 0c                	jmp    8049493 <strncmp+0x11>
		n--, p++, q++;
 8049487:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 804948b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804948f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 8049493:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049497:	74 1a                	je     80494b3 <strncmp+0x31>
 8049499:	8b 45 08             	mov    0x8(%ebp),%eax
 804949c:	0f b6 00             	movzbl (%eax),%eax
 804949f:	84 c0                	test   %al,%al
 80494a1:	74 10                	je     80494b3 <strncmp+0x31>
 80494a3:	8b 45 08             	mov    0x8(%ebp),%eax
 80494a6:	0f b6 10             	movzbl (%eax),%edx
 80494a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494ac:	0f b6 00             	movzbl (%eax),%eax
 80494af:	38 c2                	cmp    %al,%dl
 80494b1:	74 d4                	je     8049487 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 80494b3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80494b7:	75 07                	jne    80494c0 <strncmp+0x3e>
		return 0;
 80494b9:	b8 00 00 00 00       	mov    $0x0,%eax
 80494be:	eb 16                	jmp    80494d6 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 80494c0:	8b 45 08             	mov    0x8(%ebp),%eax
 80494c3:	0f b6 00             	movzbl (%eax),%eax
 80494c6:	0f b6 d0             	movzbl %al,%edx
 80494c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494cc:	0f b6 00             	movzbl (%eax),%eax
 80494cf:	0f b6 c0             	movzbl %al,%eax
 80494d2:	29 c2                	sub    %eax,%edx
 80494d4:	89 d0                	mov    %edx,%eax
}
 80494d6:	5d                   	pop    %ebp
 80494d7:	c3                   	ret    

080494d8 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 80494d8:	55                   	push   %ebp
 80494d9:	89 e5                	mov    %esp,%ebp
 80494db:	83 ec 04             	sub    $0x4,%esp
 80494de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494e1:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80494e4:	eb 14                	jmp    80494fa <strchr+0x22>
		if (*s == c)
 80494e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80494e9:	0f b6 00             	movzbl (%eax),%eax
 80494ec:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80494ef:	75 05                	jne    80494f6 <strchr+0x1e>
			return (char *) s;
 80494f1:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f4:	eb 13                	jmp    8049509 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 80494f6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80494fa:	8b 45 08             	mov    0x8(%ebp),%eax
 80494fd:	0f b6 00             	movzbl (%eax),%eax
 8049500:	84 c0                	test   %al,%al
 8049502:	75 e2                	jne    80494e6 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 8049504:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8049509:	c9                   	leave  
 804950a:	c3                   	ret    

0804950b <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 804950b:	55                   	push   %ebp
 804950c:	89 e5                	mov    %esp,%ebp
 804950e:	83 ec 04             	sub    $0x4,%esp
 8049511:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049514:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 8049517:	eb 11                	jmp    804952a <strfind+0x1f>
		if (*s == c)
 8049519:	8b 45 08             	mov    0x8(%ebp),%eax
 804951c:	0f b6 00             	movzbl (%eax),%eax
 804951f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049522:	75 02                	jne    8049526 <strfind+0x1b>
			break;
 8049524:	eb 0e                	jmp    8049534 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 8049526:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804952a:	8b 45 08             	mov    0x8(%ebp),%eax
 804952d:	0f b6 00             	movzbl (%eax),%eax
 8049530:	84 c0                	test   %al,%al
 8049532:	75 e5                	jne    8049519 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 8049534:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049537:	c9                   	leave  
 8049538:	c3                   	ret    

08049539 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 8049539:	55                   	push   %ebp
 804953a:	89 e5                	mov    %esp,%ebp
 804953c:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 804953f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049542:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 8049545:	8b 45 08             	mov    0x8(%ebp),%eax
 8049548:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 804954b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804954e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049551:	73 3d                	jae    8049590 <memmove+0x57>
 8049553:	8b 45 10             	mov    0x10(%ebp),%eax
 8049556:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049559:	01 d0                	add    %edx,%eax
 804955b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 804955e:	76 30                	jbe    8049590 <memmove+0x57>
		s += n;
 8049560:	8b 45 10             	mov    0x10(%ebp),%eax
 8049563:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 8049566:	8b 45 10             	mov    0x10(%ebp),%eax
 8049569:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 804956c:	eb 13                	jmp    8049581 <memmove+0x48>
			*--d = *--s;
 804956e:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 8049572:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049576:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049579:	0f b6 10             	movzbl (%eax),%edx
 804957c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804957f:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 8049581:	8b 45 10             	mov    0x10(%ebp),%eax
 8049584:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049587:	89 55 10             	mov    %edx,0x10(%ebp)
 804958a:	85 c0                	test   %eax,%eax
 804958c:	75 e0                	jne    804956e <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 804958e:	eb 26                	jmp    80495b6 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049590:	eb 17                	jmp    80495a9 <memmove+0x70>
			*d++ = *s++;
 8049592:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049595:	8d 50 01             	lea    0x1(%eax),%edx
 8049598:	89 55 f8             	mov    %edx,-0x8(%ebp)
 804959b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804959e:	8d 4a 01             	lea    0x1(%edx),%ecx
 80495a1:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 80495a4:	0f b6 12             	movzbl (%edx),%edx
 80495a7:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 80495a9:	8b 45 10             	mov    0x10(%ebp),%eax
 80495ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 80495af:	89 55 10             	mov    %edx,0x10(%ebp)
 80495b2:	85 c0                	test   %eax,%eax
 80495b4:	75 dc                	jne    8049592 <memmove+0x59>
			*d++ = *s++;

	return dst;
 80495b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80495b9:	c9                   	leave  
 80495ba:	c3                   	ret    

080495bb <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 80495bb:	55                   	push   %ebp
 80495bc:	89 e5                	mov    %esp,%ebp
 80495be:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 80495c1:	8b 45 08             	mov    0x8(%ebp),%eax
 80495c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 80495c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495ca:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 80495cd:	eb 30                	jmp    80495ff <memcmp+0x44>
		if (*s1 != *s2)
 80495cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80495d2:	0f b6 10             	movzbl (%eax),%edx
 80495d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80495d8:	0f b6 00             	movzbl (%eax),%eax
 80495db:	38 c2                	cmp    %al,%dl
 80495dd:	74 18                	je     80495f7 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 80495df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80495e2:	0f b6 00             	movzbl (%eax),%eax
 80495e5:	0f b6 d0             	movzbl %al,%edx
 80495e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80495eb:	0f b6 00             	movzbl (%eax),%eax
 80495ee:	0f b6 c0             	movzbl %al,%eax
 80495f1:	29 c2                	sub    %eax,%edx
 80495f3:	89 d0                	mov    %edx,%eax
 80495f5:	eb 1a                	jmp    8049611 <memcmp+0x56>
		s1++, s2++;
 80495f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80495fb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 80495ff:	8b 45 10             	mov    0x10(%ebp),%eax
 8049602:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049605:	89 55 10             	mov    %edx,0x10(%ebp)
 8049608:	85 c0                	test   %eax,%eax
 804960a:	75 c3                	jne    80495cf <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 804960c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8049611:	c9                   	leave  
 8049612:	c3                   	ret    

08049613 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 8049613:	55                   	push   %ebp
 8049614:	89 e5                	mov    %esp,%ebp
 8049616:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 8049619:	8b 45 10             	mov    0x10(%ebp),%eax
 804961c:	8b 55 08             	mov    0x8(%ebp),%edx
 804961f:	01 d0                	add    %edx,%eax
 8049621:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 8049624:	eb 13                	jmp    8049639 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 8049626:	8b 45 08             	mov    0x8(%ebp),%eax
 8049629:	0f b6 10             	movzbl (%eax),%edx
 804962c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804962f:	38 c2                	cmp    %al,%dl
 8049631:	75 02                	jne    8049635 <memfind+0x22>
			break;
 8049633:	eb 0c                	jmp    8049641 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 8049635:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049639:	8b 45 08             	mov    0x8(%ebp),%eax
 804963c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 804963f:	72 e5                	jb     8049626 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 8049641:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049644:	c9                   	leave  
 8049645:	c3                   	ret    

08049646 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 8049646:	55                   	push   %ebp
 8049647:	89 e5                	mov    %esp,%ebp
 8049649:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 804964c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 8049653:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 804965a:	eb 04                	jmp    8049660 <strtol+0x1a>
		s++;
 804965c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049660:	8b 45 08             	mov    0x8(%ebp),%eax
 8049663:	0f b6 00             	movzbl (%eax),%eax
 8049666:	3c 20                	cmp    $0x20,%al
 8049668:	74 f2                	je     804965c <strtol+0x16>
 804966a:	8b 45 08             	mov    0x8(%ebp),%eax
 804966d:	0f b6 00             	movzbl (%eax),%eax
 8049670:	3c 09                	cmp    $0x9,%al
 8049672:	74 e8                	je     804965c <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 8049674:	8b 45 08             	mov    0x8(%ebp),%eax
 8049677:	0f b6 00             	movzbl (%eax),%eax
 804967a:	3c 2b                	cmp    $0x2b,%al
 804967c:	75 06                	jne    8049684 <strtol+0x3e>
		s++;
 804967e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049682:	eb 15                	jmp    8049699 <strtol+0x53>
	else if (*s == '-')
 8049684:	8b 45 08             	mov    0x8(%ebp),%eax
 8049687:	0f b6 00             	movzbl (%eax),%eax
 804968a:	3c 2d                	cmp    $0x2d,%al
 804968c:	75 0b                	jne    8049699 <strtol+0x53>
		s++, neg = 1;
 804968e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049692:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 8049699:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804969d:	74 06                	je     80496a5 <strtol+0x5f>
 804969f:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 80496a3:	75 24                	jne    80496c9 <strtol+0x83>
 80496a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80496a8:	0f b6 00             	movzbl (%eax),%eax
 80496ab:	3c 30                	cmp    $0x30,%al
 80496ad:	75 1a                	jne    80496c9 <strtol+0x83>
 80496af:	8b 45 08             	mov    0x8(%ebp),%eax
 80496b2:	83 c0 01             	add    $0x1,%eax
 80496b5:	0f b6 00             	movzbl (%eax),%eax
 80496b8:	3c 78                	cmp    $0x78,%al
 80496ba:	75 0d                	jne    80496c9 <strtol+0x83>
		s += 2, base = 16;
 80496bc:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 80496c0:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 80496c7:	eb 2a                	jmp    80496f3 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 80496c9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80496cd:	75 17                	jne    80496e6 <strtol+0xa0>
 80496cf:	8b 45 08             	mov    0x8(%ebp),%eax
 80496d2:	0f b6 00             	movzbl (%eax),%eax
 80496d5:	3c 30                	cmp    $0x30,%al
 80496d7:	75 0d                	jne    80496e6 <strtol+0xa0>
		s++, base = 8;
 80496d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80496dd:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 80496e4:	eb 0d                	jmp    80496f3 <strtol+0xad>
	else if (base == 0)
 80496e6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80496ea:	75 07                	jne    80496f3 <strtol+0xad>
		base = 10;
 80496ec:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 80496f3:	8b 45 08             	mov    0x8(%ebp),%eax
 80496f6:	0f b6 00             	movzbl (%eax),%eax
 80496f9:	3c 2f                	cmp    $0x2f,%al
 80496fb:	7e 1b                	jle    8049718 <strtol+0xd2>
 80496fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049700:	0f b6 00             	movzbl (%eax),%eax
 8049703:	3c 39                	cmp    $0x39,%al
 8049705:	7f 11                	jg     8049718 <strtol+0xd2>
			dig = *s - '0';
 8049707:	8b 45 08             	mov    0x8(%ebp),%eax
 804970a:	0f b6 00             	movzbl (%eax),%eax
 804970d:	0f be c0             	movsbl %al,%eax
 8049710:	83 e8 30             	sub    $0x30,%eax
 8049713:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049716:	eb 48                	jmp    8049760 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 8049718:	8b 45 08             	mov    0x8(%ebp),%eax
 804971b:	0f b6 00             	movzbl (%eax),%eax
 804971e:	3c 60                	cmp    $0x60,%al
 8049720:	7e 1b                	jle    804973d <strtol+0xf7>
 8049722:	8b 45 08             	mov    0x8(%ebp),%eax
 8049725:	0f b6 00             	movzbl (%eax),%eax
 8049728:	3c 7a                	cmp    $0x7a,%al
 804972a:	7f 11                	jg     804973d <strtol+0xf7>
			dig = *s - 'a' + 10;
 804972c:	8b 45 08             	mov    0x8(%ebp),%eax
 804972f:	0f b6 00             	movzbl (%eax),%eax
 8049732:	0f be c0             	movsbl %al,%eax
 8049735:	83 e8 57             	sub    $0x57,%eax
 8049738:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804973b:	eb 23                	jmp    8049760 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 804973d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049740:	0f b6 00             	movzbl (%eax),%eax
 8049743:	3c 40                	cmp    $0x40,%al
 8049745:	7e 3d                	jle    8049784 <strtol+0x13e>
 8049747:	8b 45 08             	mov    0x8(%ebp),%eax
 804974a:	0f b6 00             	movzbl (%eax),%eax
 804974d:	3c 5a                	cmp    $0x5a,%al
 804974f:	7f 33                	jg     8049784 <strtol+0x13e>
			dig = *s - 'A' + 10;
 8049751:	8b 45 08             	mov    0x8(%ebp),%eax
 8049754:	0f b6 00             	movzbl (%eax),%eax
 8049757:	0f be c0             	movsbl %al,%eax
 804975a:	83 e8 37             	sub    $0x37,%eax
 804975d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 8049760:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049763:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049766:	7c 02                	jl     804976a <strtol+0x124>
			break;
 8049768:	eb 1a                	jmp    8049784 <strtol+0x13e>
		s++, val = (val * base) + dig;
 804976a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804976e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049771:	0f af 45 10          	imul   0x10(%ebp),%eax
 8049775:	89 c2                	mov    %eax,%edx
 8049777:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804977a:	01 d0                	add    %edx,%eax
 804977c:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 804977f:	e9 6f ff ff ff       	jmp    80496f3 <strtol+0xad>

	if (endptr)
 8049784:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049788:	74 08                	je     8049792 <strtol+0x14c>
		*endptr = (char *) s;
 804978a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804978d:	8b 55 08             	mov    0x8(%ebp),%edx
 8049790:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 8049792:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8049796:	74 07                	je     804979f <strtol+0x159>
 8049798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804979b:	f7 d8                	neg    %eax
 804979d:	eb 03                	jmp    80497a2 <strtol+0x15c>
 804979f:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80497a2:	c9                   	leave  
 80497a3:	c3                   	ret    

080497a4 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 80497a4:	55                   	push   %ebp
 80497a5:	89 e5                	mov    %esp,%ebp
 80497a7:	53                   	push   %ebx
 80497a8:	83 ec 34             	sub    $0x34,%esp
 80497ab:	8b 45 10             	mov    0x10(%ebp),%eax
 80497ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80497b1:	8b 45 14             	mov    0x14(%ebp),%eax
 80497b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 80497b7:	8b 45 18             	mov    0x18(%ebp),%eax
 80497ba:	ba 00 00 00 00       	mov    $0x0,%edx
 80497bf:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80497c2:	77 72                	ja     8049836 <printnum+0x92>
 80497c4:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80497c7:	72 05                	jb     80497ce <printnum+0x2a>
 80497c9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 80497cc:	77 68                	ja     8049836 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 80497ce:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80497d1:	8d 58 ff             	lea    -0x1(%eax),%ebx
 80497d4:	8b 45 18             	mov    0x18(%ebp),%eax
 80497d7:	ba 00 00 00 00       	mov    $0x0,%edx
 80497dc:	89 44 24 08          	mov    %eax,0x8(%esp)
 80497e0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80497e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80497e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80497ea:	89 04 24             	mov    %eax,(%esp)
 80497ed:	89 54 24 04          	mov    %edx,0x4(%esp)
 80497f1:	e8 5a 06 00 00       	call   8049e50 <__udivdi3>
 80497f6:	8b 4d 20             	mov    0x20(%ebp),%ecx
 80497f9:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 80497fd:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 8049801:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049804:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049808:	89 44 24 08          	mov    %eax,0x8(%esp)
 804980c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049810:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049813:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049817:	8b 45 08             	mov    0x8(%ebp),%eax
 804981a:	89 04 24             	mov    %eax,(%esp)
 804981d:	e8 82 ff ff ff       	call   80497a4 <printnum>
 8049822:	eb 1c                	jmp    8049840 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 8049824:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049827:	89 44 24 04          	mov    %eax,0x4(%esp)
 804982b:	8b 45 20             	mov    0x20(%ebp),%eax
 804982e:	89 04 24             	mov    %eax,(%esp)
 8049831:	8b 45 08             	mov    0x8(%ebp),%eax
 8049834:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 8049836:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 804983a:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 804983e:	7f e4                	jg     8049824 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 8049840:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049843:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049848:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804984b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804984e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049852:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049856:	89 04 24             	mov    %eax,(%esp)
 8049859:	89 54 24 04          	mov    %edx,0x4(%esp)
 804985d:	e8 1e 07 00 00       	call   8049f80 <__umoddi3>
 8049862:	05 48 a3 04 08       	add    $0x804a348,%eax
 8049867:	0f b6 00             	movzbl (%eax),%eax
 804986a:	0f be c0             	movsbl %al,%eax
 804986d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049870:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049874:	89 04 24             	mov    %eax,(%esp)
 8049877:	8b 45 08             	mov    0x8(%ebp),%eax
 804987a:	ff d0                	call   *%eax
}
 804987c:	83 c4 34             	add    $0x34,%esp
 804987f:	5b                   	pop    %ebx
 8049880:	5d                   	pop    %ebp
 8049881:	c3                   	ret    

08049882 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 8049882:	55                   	push   %ebp
 8049883:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 8049885:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 8049889:	7e 14                	jle    804989f <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 804988b:	8b 45 08             	mov    0x8(%ebp),%eax
 804988e:	8b 00                	mov    (%eax),%eax
 8049890:	8d 48 08             	lea    0x8(%eax),%ecx
 8049893:	8b 55 08             	mov    0x8(%ebp),%edx
 8049896:	89 0a                	mov    %ecx,(%edx)
 8049898:	8b 50 04             	mov    0x4(%eax),%edx
 804989b:	8b 00                	mov    (%eax),%eax
 804989d:	eb 30                	jmp    80498cf <getuint+0x4d>
	else if (lflag)
 804989f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80498a3:	74 16                	je     80498bb <getuint+0x39>
		return va_arg(*ap, unsigned long);
 80498a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80498a8:	8b 00                	mov    (%eax),%eax
 80498aa:	8d 48 04             	lea    0x4(%eax),%ecx
 80498ad:	8b 55 08             	mov    0x8(%ebp),%edx
 80498b0:	89 0a                	mov    %ecx,(%edx)
 80498b2:	8b 00                	mov    (%eax),%eax
 80498b4:	ba 00 00 00 00       	mov    $0x0,%edx
 80498b9:	eb 14                	jmp    80498cf <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 80498bb:	8b 45 08             	mov    0x8(%ebp),%eax
 80498be:	8b 00                	mov    (%eax),%eax
 80498c0:	8d 48 04             	lea    0x4(%eax),%ecx
 80498c3:	8b 55 08             	mov    0x8(%ebp),%edx
 80498c6:	89 0a                	mov    %ecx,(%edx)
 80498c8:	8b 00                	mov    (%eax),%eax
 80498ca:	ba 00 00 00 00       	mov    $0x0,%edx
}
 80498cf:	5d                   	pop    %ebp
 80498d0:	c3                   	ret    

080498d1 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 80498d1:	55                   	push   %ebp
 80498d2:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 80498d4:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 80498d8:	7e 14                	jle    80498ee <getint+0x1d>
		return va_arg(*ap, long long);
 80498da:	8b 45 08             	mov    0x8(%ebp),%eax
 80498dd:	8b 00                	mov    (%eax),%eax
 80498df:	8d 48 08             	lea    0x8(%eax),%ecx
 80498e2:	8b 55 08             	mov    0x8(%ebp),%edx
 80498e5:	89 0a                	mov    %ecx,(%edx)
 80498e7:	8b 50 04             	mov    0x4(%eax),%edx
 80498ea:	8b 00                	mov    (%eax),%eax
 80498ec:	eb 28                	jmp    8049916 <getint+0x45>
	else if (lflag)
 80498ee:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80498f2:	74 12                	je     8049906 <getint+0x35>
		return va_arg(*ap, long);
 80498f4:	8b 45 08             	mov    0x8(%ebp),%eax
 80498f7:	8b 00                	mov    (%eax),%eax
 80498f9:	8d 48 04             	lea    0x4(%eax),%ecx
 80498fc:	8b 55 08             	mov    0x8(%ebp),%edx
 80498ff:	89 0a                	mov    %ecx,(%edx)
 8049901:	8b 00                	mov    (%eax),%eax
 8049903:	99                   	cltd   
 8049904:	eb 10                	jmp    8049916 <getint+0x45>
	else
		return va_arg(*ap, int);
 8049906:	8b 45 08             	mov    0x8(%ebp),%eax
 8049909:	8b 00                	mov    (%eax),%eax
 804990b:	8d 48 04             	lea    0x4(%eax),%ecx
 804990e:	8b 55 08             	mov    0x8(%ebp),%edx
 8049911:	89 0a                	mov    %ecx,(%edx)
 8049913:	8b 00                	mov    (%eax),%eax
 8049915:	99                   	cltd   
}
 8049916:	5d                   	pop    %ebp
 8049917:	c3                   	ret    

08049918 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 8049918:	55                   	push   %ebp
 8049919:	89 e5                	mov    %esp,%ebp
 804991b:	56                   	push   %esi
 804991c:	53                   	push   %ebx
 804991d:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049920:	eb 18                	jmp    804993a <vprintfmt+0x22>
			if (ch == '\0')
 8049922:	85 db                	test   %ebx,%ebx
 8049924:	75 05                	jne    804992b <vprintfmt+0x13>
				return;
 8049926:	e9 e9 03 00 00       	jmp    8049d14 <vprintfmt+0x3fc>
			putch(ch, putdat);
 804992b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804992e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049932:	89 1c 24             	mov    %ebx,(%esp)
 8049935:	8b 45 08             	mov    0x8(%ebp),%eax
 8049938:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 804993a:	8b 45 10             	mov    0x10(%ebp),%eax
 804993d:	8d 50 01             	lea    0x1(%eax),%edx
 8049940:	89 55 10             	mov    %edx,0x10(%ebp)
 8049943:	0f b6 00             	movzbl (%eax),%eax
 8049946:	0f b6 d8             	movzbl %al,%ebx
 8049949:	83 fb 25             	cmp    $0x25,%ebx
 804994c:	75 d4                	jne    8049922 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 804994e:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 8049952:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 8049959:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 8049960:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 8049967:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 804996e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049971:	8d 50 01             	lea    0x1(%eax),%edx
 8049974:	89 55 10             	mov    %edx,0x10(%ebp)
 8049977:	0f b6 00             	movzbl (%eax),%eax
 804997a:	0f b6 d8             	movzbl %al,%ebx
 804997d:	8d 43 dd             	lea    -0x23(%ebx),%eax
 8049980:	83 f8 55             	cmp    $0x55,%eax
 8049983:	0f 87 5a 03 00 00    	ja     8049ce3 <vprintfmt+0x3cb>
 8049989:	8b 04 85 6c a3 04 08 	mov    0x804a36c(,%eax,4),%eax
 8049990:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 8049992:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 8049996:	eb d6                	jmp    804996e <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 8049998:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 804999c:	eb d0                	jmp    804996e <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 804999e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 80499a5:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80499a8:	89 d0                	mov    %edx,%eax
 80499aa:	c1 e0 02             	shl    $0x2,%eax
 80499ad:	01 d0                	add    %edx,%eax
 80499af:	01 c0                	add    %eax,%eax
 80499b1:	01 d8                	add    %ebx,%eax
 80499b3:	83 e8 30             	sub    $0x30,%eax
 80499b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 80499b9:	8b 45 10             	mov    0x10(%ebp),%eax
 80499bc:	0f b6 00             	movzbl (%eax),%eax
 80499bf:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 80499c2:	83 fb 2f             	cmp    $0x2f,%ebx
 80499c5:	7e 0b                	jle    80499d2 <vprintfmt+0xba>
 80499c7:	83 fb 39             	cmp    $0x39,%ebx
 80499ca:	7f 06                	jg     80499d2 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 80499cc:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 80499d0:	eb d3                	jmp    80499a5 <vprintfmt+0x8d>
			goto process_precision;
 80499d2:	eb 33                	jmp    8049a07 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 80499d4:	8b 45 14             	mov    0x14(%ebp),%eax
 80499d7:	8d 50 04             	lea    0x4(%eax),%edx
 80499da:	89 55 14             	mov    %edx,0x14(%ebp)
 80499dd:	8b 00                	mov    (%eax),%eax
 80499df:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 80499e2:	eb 23                	jmp    8049a07 <vprintfmt+0xef>

		case '.':
			if (width < 0)
 80499e4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80499e8:	79 0c                	jns    80499f6 <vprintfmt+0xde>
				width = 0;
 80499ea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 80499f1:	e9 78 ff ff ff       	jmp    804996e <vprintfmt+0x56>
 80499f6:	e9 73 ff ff ff       	jmp    804996e <vprintfmt+0x56>

		case '#':
			altflag = 1;
 80499fb:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 8049a02:	e9 67 ff ff ff       	jmp    804996e <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 8049a07:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049a0b:	79 12                	jns    8049a1f <vprintfmt+0x107>
				width = precision, precision = -1;
 8049a0d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049a10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8049a13:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 8049a1a:	e9 4f ff ff ff       	jmp    804996e <vprintfmt+0x56>
 8049a1f:	e9 4a ff ff ff       	jmp    804996e <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 8049a24:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 8049a28:	e9 41 ff ff ff       	jmp    804996e <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 8049a2d:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a30:	8d 50 04             	lea    0x4(%eax),%edx
 8049a33:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a36:	8b 00                	mov    (%eax),%eax
 8049a38:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049a3b:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049a3f:	89 04 24             	mov    %eax,(%esp)
 8049a42:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a45:	ff d0                	call   *%eax
			break;
 8049a47:	e9 c2 02 00 00       	jmp    8049d0e <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 8049a4c:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a4f:	8d 50 04             	lea    0x4(%eax),%edx
 8049a52:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a55:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 8049a57:	85 db                	test   %ebx,%ebx
 8049a59:	79 02                	jns    8049a5d <vprintfmt+0x145>
				err = -err;
 8049a5b:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049a5d:	83 fb 06             	cmp    $0x6,%ebx
 8049a60:	7f 0b                	jg     8049a6d <vprintfmt+0x155>
 8049a62:	8b 34 9d 2c a3 04 08 	mov    0x804a32c(,%ebx,4),%esi
 8049a69:	85 f6                	test   %esi,%esi
 8049a6b:	75 23                	jne    8049a90 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 8049a6d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049a71:	c7 44 24 08 59 a3 04 	movl   $0x804a359,0x8(%esp)
 8049a78:	08 
 8049a79:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a7c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a80:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a83:	89 04 24             	mov    %eax,(%esp)
 8049a86:	e8 90 02 00 00       	call   8049d1b <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 8049a8b:	e9 7e 02 00 00       	jmp    8049d0e <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 8049a90:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049a94:	c7 44 24 08 62 a3 04 	movl   $0x804a362,0x8(%esp)
 8049a9b:	08 
 8049a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a9f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049aa3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049aa6:	89 04 24             	mov    %eax,(%esp)
 8049aa9:	e8 6d 02 00 00       	call   8049d1b <printfmt>
			break;
 8049aae:	e9 5b 02 00 00       	jmp    8049d0e <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 8049ab3:	8b 45 14             	mov    0x14(%ebp),%eax
 8049ab6:	8d 50 04             	lea    0x4(%eax),%edx
 8049ab9:	89 55 14             	mov    %edx,0x14(%ebp)
 8049abc:	8b 30                	mov    (%eax),%esi
 8049abe:	85 f6                	test   %esi,%esi
 8049ac0:	75 05                	jne    8049ac7 <vprintfmt+0x1af>
				p = "(null)";
 8049ac2:	be 65 a3 04 08       	mov    $0x804a365,%esi
			if (width > 0 && padc != '-')
 8049ac7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049acb:	7e 37                	jle    8049b04 <vprintfmt+0x1ec>
 8049acd:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 8049ad1:	74 31                	je     8049b04 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 8049ad3:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049ad6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ada:	89 34 24             	mov    %esi,(%esp)
 8049add:	e8 9b f8 ff ff       	call   804937d <strnlen>
 8049ae2:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 8049ae5:	eb 17                	jmp    8049afe <vprintfmt+0x1e6>
					putch(padc, putdat);
 8049ae7:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 8049aeb:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049aee:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049af2:	89 04 24             	mov    %eax,(%esp)
 8049af5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049af8:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 8049afa:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049afe:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049b02:	7f e3                	jg     8049ae7 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049b04:	eb 38                	jmp    8049b3e <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 8049b06:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049b0a:	74 1f                	je     8049b2b <vprintfmt+0x213>
 8049b0c:	83 fb 1f             	cmp    $0x1f,%ebx
 8049b0f:	7e 05                	jle    8049b16 <vprintfmt+0x1fe>
 8049b11:	83 fb 7e             	cmp    $0x7e,%ebx
 8049b14:	7e 15                	jle    8049b2b <vprintfmt+0x213>
					putch('?', putdat);
 8049b16:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b19:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b1d:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 8049b24:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b27:	ff d0                	call   *%eax
 8049b29:	eb 0f                	jmp    8049b3a <vprintfmt+0x222>
				else
					putch(ch, putdat);
 8049b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b32:	89 1c 24             	mov    %ebx,(%esp)
 8049b35:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b38:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049b3a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049b3e:	89 f0                	mov    %esi,%eax
 8049b40:	8d 70 01             	lea    0x1(%eax),%esi
 8049b43:	0f b6 00             	movzbl (%eax),%eax
 8049b46:	0f be d8             	movsbl %al,%ebx
 8049b49:	85 db                	test   %ebx,%ebx
 8049b4b:	74 10                	je     8049b5d <vprintfmt+0x245>
 8049b4d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049b51:	78 b3                	js     8049b06 <vprintfmt+0x1ee>
 8049b53:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 8049b57:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049b5b:	79 a9                	jns    8049b06 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049b5d:	eb 17                	jmp    8049b76 <vprintfmt+0x25e>
				putch(' ', putdat);
 8049b5f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b62:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b66:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049b6d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b70:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049b72:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049b76:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049b7a:	7f e3                	jg     8049b5f <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 8049b7c:	e9 8d 01 00 00       	jmp    8049d0e <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 8049b81:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b84:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b88:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b8b:	89 04 24             	mov    %eax,(%esp)
 8049b8e:	e8 3e fd ff ff       	call   80498d1 <getint>
 8049b93:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b96:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 8049b99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049b9f:	85 d2                	test   %edx,%edx
 8049ba1:	79 26                	jns    8049bc9 <vprintfmt+0x2b1>
				putch('-', putdat);
 8049ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049baa:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 8049bb1:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bb4:	ff d0                	call   *%eax
				num = -(long long) num;
 8049bb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049bb9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049bbc:	f7 d8                	neg    %eax
 8049bbe:	83 d2 00             	adc    $0x0,%edx
 8049bc1:	f7 da                	neg    %edx
 8049bc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bc6:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049bc9:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049bd0:	e9 c5 00 00 00       	jmp    8049c9a <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 8049bd5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049bd8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bdc:	8d 45 14             	lea    0x14(%ebp),%eax
 8049bdf:	89 04 24             	mov    %eax,(%esp)
 8049be2:	e8 9b fc ff ff       	call   8049882 <getuint>
 8049be7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bea:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049bed:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049bf4:	e9 a1 00 00 00       	jmp    8049c9a <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 8049bf9:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c00:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049c07:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c0a:	ff d0                	call   *%eax
			putch('X', putdat);
 8049c0c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c0f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c13:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049c1a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c1d:	ff d0                	call   *%eax
			putch('X', putdat);
 8049c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c22:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c26:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049c2d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c30:	ff d0                	call   *%eax
			break;
 8049c32:	e9 d7 00 00 00       	jmp    8049d0e <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 8049c37:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c3a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c3e:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 8049c45:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c48:	ff d0                	call   *%eax
			putch('x', putdat);
 8049c4a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c4d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c51:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049c58:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c5b:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049c5d:	8b 45 14             	mov    0x14(%ebp),%eax
 8049c60:	8d 50 04             	lea    0x4(%eax),%edx
 8049c63:	89 55 14             	mov    %edx,0x14(%ebp)
 8049c66:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049c68:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049c72:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049c79:	eb 1f                	jmp    8049c9a <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049c7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049c7e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c82:	8d 45 14             	lea    0x14(%ebp),%eax
 8049c85:	89 04 24             	mov    %eax,(%esp)
 8049c88:	e8 f5 fb ff ff       	call   8049882 <getuint>
 8049c8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c90:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049c93:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049c9a:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049c9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049ca1:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049ca5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049ca8:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049cac:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049cb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049cb3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049cb6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049cba:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049cbe:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cc1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cc5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cc8:	89 04 24             	mov    %eax,(%esp)
 8049ccb:	e8 d4 fa ff ff       	call   80497a4 <printnum>
			break;
 8049cd0:	eb 3c                	jmp    8049d0e <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049cd2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cd5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cd9:	89 1c 24             	mov    %ebx,(%esp)
 8049cdc:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cdf:	ff d0                	call   *%eax
			break;
 8049ce1:	eb 2b                	jmp    8049d0e <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049ce3:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ce6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cea:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049cf1:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cf4:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049cf6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049cfa:	eb 04                	jmp    8049d00 <vprintfmt+0x3e8>
 8049cfc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049d00:	8b 45 10             	mov    0x10(%ebp),%eax
 8049d03:	83 e8 01             	sub    $0x1,%eax
 8049d06:	0f b6 00             	movzbl (%eax),%eax
 8049d09:	3c 25                	cmp    $0x25,%al
 8049d0b:	75 ef                	jne    8049cfc <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049d0d:	90                   	nop
		}
	}
 8049d0e:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049d0f:	e9 26 fc ff ff       	jmp    804993a <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049d14:	83 c4 40             	add    $0x40,%esp
 8049d17:	5b                   	pop    %ebx
 8049d18:	5e                   	pop    %esi
 8049d19:	5d                   	pop    %ebp
 8049d1a:	c3                   	ret    

08049d1b <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049d1b:	55                   	push   %ebp
 8049d1c:	89 e5                	mov    %esp,%ebp
 8049d1e:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049d21:	8d 45 14             	lea    0x14(%ebp),%eax
 8049d24:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049d2a:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049d2e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049d31:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049d35:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d38:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d3c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d3f:	89 04 24             	mov    %eax,(%esp)
 8049d42:	e8 d1 fb ff ff       	call   8049918 <vprintfmt>
	va_end(ap);
}
 8049d47:	c9                   	leave  
 8049d48:	c3                   	ret    

08049d49 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049d49:	55                   	push   %ebp
 8049d4a:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049d4c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d4f:	8b 40 08             	mov    0x8(%eax),%eax
 8049d52:	8d 50 01             	lea    0x1(%eax),%edx
 8049d55:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d58:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049d5b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d5e:	8b 10                	mov    (%eax),%edx
 8049d60:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d63:	8b 40 04             	mov    0x4(%eax),%eax
 8049d66:	39 c2                	cmp    %eax,%edx
 8049d68:	73 12                	jae    8049d7c <sprintputch+0x33>
		*b->buf++ = ch;
 8049d6a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d6d:	8b 00                	mov    (%eax),%eax
 8049d6f:	8d 48 01             	lea    0x1(%eax),%ecx
 8049d72:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d75:	89 0a                	mov    %ecx,(%edx)
 8049d77:	8b 55 08             	mov    0x8(%ebp),%edx
 8049d7a:	88 10                	mov    %dl,(%eax)
}
 8049d7c:	5d                   	pop    %ebp
 8049d7d:	c3                   	ret    

08049d7e <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049d7e:	55                   	push   %ebp
 8049d7f:	89 e5                	mov    %esp,%ebp
 8049d81:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049d84:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d87:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d8d:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049d90:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d93:	01 d0                	add    %edx,%eax
 8049d95:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049d98:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049d9f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049da3:	74 06                	je     8049dab <vsnprintf+0x2d>
 8049da5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049da9:	7f 07                	jg     8049db2 <vsnprintf+0x34>
		return -E_INVAL;
 8049dab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049db0:	eb 2a                	jmp    8049ddc <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049db2:	8b 45 14             	mov    0x14(%ebp),%eax
 8049db5:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049db9:	8b 45 10             	mov    0x10(%ebp),%eax
 8049dbc:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049dc0:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049dc3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dc7:	c7 04 24 49 9d 04 08 	movl   $0x8049d49,(%esp)
 8049dce:	e8 45 fb ff ff       	call   8049918 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049dd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049dd6:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049dd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049ddc:	c9                   	leave  
 8049ddd:	c3                   	ret    

08049dde <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049dde:	55                   	push   %ebp
 8049ddf:	89 e5                	mov    %esp,%ebp
 8049de1:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049de4:	8d 45 14             	lea    0x14(%ebp),%eax
 8049de7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049dea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049ded:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049df1:	8b 45 10             	mov    0x10(%ebp),%eax
 8049df4:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049df8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049dfb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dff:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e02:	89 04 24             	mov    %eax,(%esp)
 8049e05:	e8 74 ff ff ff       	call   8049d7e <vsnprintf>
 8049e0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049e10:	c9                   	leave  
 8049e11:	c3                   	ret    

08049e12 <srand>:
static int seed = 0;

void
srand(int s) {
 8049e12:	55                   	push   %ebp
 8049e13:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049e15:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e18:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049e1d:	5d                   	pop    %ebp
 8049e1e:	c3                   	ret    

08049e1f <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049e1f:	55                   	push   %ebp
 8049e20:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049e22:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049e27:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049e2d:	83 c0 01             	add    $0x1,%eax
 8049e30:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049e35:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049e3a:	c1 f8 10             	sar    $0x10,%eax
 8049e3d:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049e42:	5d                   	pop    %ebp
 8049e43:	c3                   	ret    
 8049e44:	66 90                	xchg   %ax,%ax
 8049e46:	66 90                	xchg   %ax,%ax
 8049e48:	66 90                	xchg   %ax,%ax
 8049e4a:	66 90                	xchg   %ax,%ax
 8049e4c:	66 90                	xchg   %ax,%ax
 8049e4e:	66 90                	xchg   %ax,%ax

08049e50 <__udivdi3>:
 8049e50:	55                   	push   %ebp
 8049e51:	57                   	push   %edi
 8049e52:	56                   	push   %esi
 8049e53:	83 ec 0c             	sub    $0xc,%esp
 8049e56:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049e5a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049e5e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049e62:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049e66:	85 c0                	test   %eax,%eax
 8049e68:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049e6c:	89 ea                	mov    %ebp,%edx
 8049e6e:	89 0c 24             	mov    %ecx,(%esp)
 8049e71:	75 2d                	jne    8049ea0 <__udivdi3+0x50>
 8049e73:	39 e9                	cmp    %ebp,%ecx
 8049e75:	77 61                	ja     8049ed8 <__udivdi3+0x88>
 8049e77:	85 c9                	test   %ecx,%ecx
 8049e79:	89 ce                	mov    %ecx,%esi
 8049e7b:	75 0b                	jne    8049e88 <__udivdi3+0x38>
 8049e7d:	b8 01 00 00 00       	mov    $0x1,%eax
 8049e82:	31 d2                	xor    %edx,%edx
 8049e84:	f7 f1                	div    %ecx
 8049e86:	89 c6                	mov    %eax,%esi
 8049e88:	31 d2                	xor    %edx,%edx
 8049e8a:	89 e8                	mov    %ebp,%eax
 8049e8c:	f7 f6                	div    %esi
 8049e8e:	89 c5                	mov    %eax,%ebp
 8049e90:	89 f8                	mov    %edi,%eax
 8049e92:	f7 f6                	div    %esi
 8049e94:	89 ea                	mov    %ebp,%edx
 8049e96:	83 c4 0c             	add    $0xc,%esp
 8049e99:	5e                   	pop    %esi
 8049e9a:	5f                   	pop    %edi
 8049e9b:	5d                   	pop    %ebp
 8049e9c:	c3                   	ret    
 8049e9d:	8d 76 00             	lea    0x0(%esi),%esi
 8049ea0:	39 e8                	cmp    %ebp,%eax
 8049ea2:	77 24                	ja     8049ec8 <__udivdi3+0x78>
 8049ea4:	0f bd e8             	bsr    %eax,%ebp
 8049ea7:	83 f5 1f             	xor    $0x1f,%ebp
 8049eaa:	75 3c                	jne    8049ee8 <__udivdi3+0x98>
 8049eac:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049eb0:	39 34 24             	cmp    %esi,(%esp)
 8049eb3:	0f 86 9f 00 00 00    	jbe    8049f58 <__udivdi3+0x108>
 8049eb9:	39 d0                	cmp    %edx,%eax
 8049ebb:	0f 82 97 00 00 00    	jb     8049f58 <__udivdi3+0x108>
 8049ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049ec8:	31 d2                	xor    %edx,%edx
 8049eca:	31 c0                	xor    %eax,%eax
 8049ecc:	83 c4 0c             	add    $0xc,%esp
 8049ecf:	5e                   	pop    %esi
 8049ed0:	5f                   	pop    %edi
 8049ed1:	5d                   	pop    %ebp
 8049ed2:	c3                   	ret    
 8049ed3:	90                   	nop
 8049ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049ed8:	89 f8                	mov    %edi,%eax
 8049eda:	f7 f1                	div    %ecx
 8049edc:	31 d2                	xor    %edx,%edx
 8049ede:	83 c4 0c             	add    $0xc,%esp
 8049ee1:	5e                   	pop    %esi
 8049ee2:	5f                   	pop    %edi
 8049ee3:	5d                   	pop    %ebp
 8049ee4:	c3                   	ret    
 8049ee5:	8d 76 00             	lea    0x0(%esi),%esi
 8049ee8:	89 e9                	mov    %ebp,%ecx
 8049eea:	8b 3c 24             	mov    (%esp),%edi
 8049eed:	d3 e0                	shl    %cl,%eax
 8049eef:	89 c6                	mov    %eax,%esi
 8049ef1:	b8 20 00 00 00       	mov    $0x20,%eax
 8049ef6:	29 e8                	sub    %ebp,%eax
 8049ef8:	89 c1                	mov    %eax,%ecx
 8049efa:	d3 ef                	shr    %cl,%edi
 8049efc:	89 e9                	mov    %ebp,%ecx
 8049efe:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049f02:	8b 3c 24             	mov    (%esp),%edi
 8049f05:	09 74 24 08          	or     %esi,0x8(%esp)
 8049f09:	89 d6                	mov    %edx,%esi
 8049f0b:	d3 e7                	shl    %cl,%edi
 8049f0d:	89 c1                	mov    %eax,%ecx
 8049f0f:	89 3c 24             	mov    %edi,(%esp)
 8049f12:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049f16:	d3 ee                	shr    %cl,%esi
 8049f18:	89 e9                	mov    %ebp,%ecx
 8049f1a:	d3 e2                	shl    %cl,%edx
 8049f1c:	89 c1                	mov    %eax,%ecx
 8049f1e:	d3 ef                	shr    %cl,%edi
 8049f20:	09 d7                	or     %edx,%edi
 8049f22:	89 f2                	mov    %esi,%edx
 8049f24:	89 f8                	mov    %edi,%eax
 8049f26:	f7 74 24 08          	divl   0x8(%esp)
 8049f2a:	89 d6                	mov    %edx,%esi
 8049f2c:	89 c7                	mov    %eax,%edi
 8049f2e:	f7 24 24             	mull   (%esp)
 8049f31:	39 d6                	cmp    %edx,%esi
 8049f33:	89 14 24             	mov    %edx,(%esp)
 8049f36:	72 30                	jb     8049f68 <__udivdi3+0x118>
 8049f38:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049f3c:	89 e9                	mov    %ebp,%ecx
 8049f3e:	d3 e2                	shl    %cl,%edx
 8049f40:	39 c2                	cmp    %eax,%edx
 8049f42:	73 05                	jae    8049f49 <__udivdi3+0xf9>
 8049f44:	3b 34 24             	cmp    (%esp),%esi
 8049f47:	74 1f                	je     8049f68 <__udivdi3+0x118>
 8049f49:	89 f8                	mov    %edi,%eax
 8049f4b:	31 d2                	xor    %edx,%edx
 8049f4d:	e9 7a ff ff ff       	jmp    8049ecc <__udivdi3+0x7c>
 8049f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049f58:	31 d2                	xor    %edx,%edx
 8049f5a:	b8 01 00 00 00       	mov    $0x1,%eax
 8049f5f:	e9 68 ff ff ff       	jmp    8049ecc <__udivdi3+0x7c>
 8049f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f68:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049f6b:	31 d2                	xor    %edx,%edx
 8049f6d:	83 c4 0c             	add    $0xc,%esp
 8049f70:	5e                   	pop    %esi
 8049f71:	5f                   	pop    %edi
 8049f72:	5d                   	pop    %ebp
 8049f73:	c3                   	ret    
 8049f74:	66 90                	xchg   %ax,%ax
 8049f76:	66 90                	xchg   %ax,%ax
 8049f78:	66 90                	xchg   %ax,%ax
 8049f7a:	66 90                	xchg   %ax,%ax
 8049f7c:	66 90                	xchg   %ax,%ax
 8049f7e:	66 90                	xchg   %ax,%ax

08049f80 <__umoddi3>:
 8049f80:	55                   	push   %ebp
 8049f81:	57                   	push   %edi
 8049f82:	56                   	push   %esi
 8049f83:	83 ec 14             	sub    $0x14,%esp
 8049f86:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049f8a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049f8e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049f92:	89 c7                	mov    %eax,%edi
 8049f94:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049f98:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049f9c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049fa0:	89 34 24             	mov    %esi,(%esp)
 8049fa3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049fa7:	85 c0                	test   %eax,%eax
 8049fa9:	89 c2                	mov    %eax,%edx
 8049fab:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049faf:	75 17                	jne    8049fc8 <__umoddi3+0x48>
 8049fb1:	39 fe                	cmp    %edi,%esi
 8049fb3:	76 4b                	jbe    804a000 <__umoddi3+0x80>
 8049fb5:	89 c8                	mov    %ecx,%eax
 8049fb7:	89 fa                	mov    %edi,%edx
 8049fb9:	f7 f6                	div    %esi
 8049fbb:	89 d0                	mov    %edx,%eax
 8049fbd:	31 d2                	xor    %edx,%edx
 8049fbf:	83 c4 14             	add    $0x14,%esp
 8049fc2:	5e                   	pop    %esi
 8049fc3:	5f                   	pop    %edi
 8049fc4:	5d                   	pop    %ebp
 8049fc5:	c3                   	ret    
 8049fc6:	66 90                	xchg   %ax,%ax
 8049fc8:	39 f8                	cmp    %edi,%eax
 8049fca:	77 54                	ja     804a020 <__umoddi3+0xa0>
 8049fcc:	0f bd e8             	bsr    %eax,%ebp
 8049fcf:	83 f5 1f             	xor    $0x1f,%ebp
 8049fd2:	75 5c                	jne    804a030 <__umoddi3+0xb0>
 8049fd4:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049fd8:	39 3c 24             	cmp    %edi,(%esp)
 8049fdb:	0f 87 e7 00 00 00    	ja     804a0c8 <__umoddi3+0x148>
 8049fe1:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049fe5:	29 f1                	sub    %esi,%ecx
 8049fe7:	19 c7                	sbb    %eax,%edi
 8049fe9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049fed:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049ff1:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049ff5:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049ff9:	83 c4 14             	add    $0x14,%esp
 8049ffc:	5e                   	pop    %esi
 8049ffd:	5f                   	pop    %edi
 8049ffe:	5d                   	pop    %ebp
 8049fff:	c3                   	ret    
 804a000:	85 f6                	test   %esi,%esi
 804a002:	89 f5                	mov    %esi,%ebp
 804a004:	75 0b                	jne    804a011 <__umoddi3+0x91>
 804a006:	b8 01 00 00 00       	mov    $0x1,%eax
 804a00b:	31 d2                	xor    %edx,%edx
 804a00d:	f7 f6                	div    %esi
 804a00f:	89 c5                	mov    %eax,%ebp
 804a011:	8b 44 24 04          	mov    0x4(%esp),%eax
 804a015:	31 d2                	xor    %edx,%edx
 804a017:	f7 f5                	div    %ebp
 804a019:	89 c8                	mov    %ecx,%eax
 804a01b:	f7 f5                	div    %ebp
 804a01d:	eb 9c                	jmp    8049fbb <__umoddi3+0x3b>
 804a01f:	90                   	nop
 804a020:	89 c8                	mov    %ecx,%eax
 804a022:	89 fa                	mov    %edi,%edx
 804a024:	83 c4 14             	add    $0x14,%esp
 804a027:	5e                   	pop    %esi
 804a028:	5f                   	pop    %edi
 804a029:	5d                   	pop    %ebp
 804a02a:	c3                   	ret    
 804a02b:	90                   	nop
 804a02c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a030:	8b 04 24             	mov    (%esp),%eax
 804a033:	be 20 00 00 00       	mov    $0x20,%esi
 804a038:	89 e9                	mov    %ebp,%ecx
 804a03a:	29 ee                	sub    %ebp,%esi
 804a03c:	d3 e2                	shl    %cl,%edx
 804a03e:	89 f1                	mov    %esi,%ecx
 804a040:	d3 e8                	shr    %cl,%eax
 804a042:	89 e9                	mov    %ebp,%ecx
 804a044:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a048:	8b 04 24             	mov    (%esp),%eax
 804a04b:	09 54 24 04          	or     %edx,0x4(%esp)
 804a04f:	89 fa                	mov    %edi,%edx
 804a051:	d3 e0                	shl    %cl,%eax
 804a053:	89 f1                	mov    %esi,%ecx
 804a055:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a059:	8b 44 24 10          	mov    0x10(%esp),%eax
 804a05d:	d3 ea                	shr    %cl,%edx
 804a05f:	89 e9                	mov    %ebp,%ecx
 804a061:	d3 e7                	shl    %cl,%edi
 804a063:	89 f1                	mov    %esi,%ecx
 804a065:	d3 e8                	shr    %cl,%eax
 804a067:	89 e9                	mov    %ebp,%ecx
 804a069:	09 f8                	or     %edi,%eax
 804a06b:	8b 7c 24 10          	mov    0x10(%esp),%edi
 804a06f:	f7 74 24 04          	divl   0x4(%esp)
 804a073:	d3 e7                	shl    %cl,%edi
 804a075:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 804a079:	89 d7                	mov    %edx,%edi
 804a07b:	f7 64 24 08          	mull   0x8(%esp)
 804a07f:	39 d7                	cmp    %edx,%edi
 804a081:	89 c1                	mov    %eax,%ecx
 804a083:	89 14 24             	mov    %edx,(%esp)
 804a086:	72 2c                	jb     804a0b4 <__umoddi3+0x134>
 804a088:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 804a08c:	72 22                	jb     804a0b0 <__umoddi3+0x130>
 804a08e:	8b 44 24 0c          	mov    0xc(%esp),%eax
 804a092:	29 c8                	sub    %ecx,%eax
 804a094:	19 d7                	sbb    %edx,%edi
 804a096:	89 e9                	mov    %ebp,%ecx
 804a098:	89 fa                	mov    %edi,%edx
 804a09a:	d3 e8                	shr    %cl,%eax
 804a09c:	89 f1                	mov    %esi,%ecx
 804a09e:	d3 e2                	shl    %cl,%edx
 804a0a0:	89 e9                	mov    %ebp,%ecx
 804a0a2:	d3 ef                	shr    %cl,%edi
 804a0a4:	09 d0                	or     %edx,%eax
 804a0a6:	89 fa                	mov    %edi,%edx
 804a0a8:	83 c4 14             	add    $0x14,%esp
 804a0ab:	5e                   	pop    %esi
 804a0ac:	5f                   	pop    %edi
 804a0ad:	5d                   	pop    %ebp
 804a0ae:	c3                   	ret    
 804a0af:	90                   	nop
 804a0b0:	39 d7                	cmp    %edx,%edi
 804a0b2:	75 da                	jne    804a08e <__umoddi3+0x10e>
 804a0b4:	8b 14 24             	mov    (%esp),%edx
 804a0b7:	89 c1                	mov    %eax,%ecx
 804a0b9:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 804a0bd:	1b 54 24 04          	sbb    0x4(%esp),%edx
 804a0c1:	eb cb                	jmp    804a08e <__umoddi3+0x10e>
 804a0c3:	90                   	nop
 804a0c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a0c8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 804a0cc:	0f 82 0f ff ff ff    	jb     8049fe1 <__umoddi3+0x61>
 804a0d2:	e9 1a ff ff ff       	jmp    8049ff1 <__umoddi3+0x71>
