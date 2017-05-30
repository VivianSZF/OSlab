
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
 8048006:	c7 04 24 b8 a0 04 08 	movl   $0x804a0b8,(%esp)
 804800d:	e8 1e 12 00 00       	call   8049230 <printf>
	int i;
	for(i=0;i<10;i++)
 8048012:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048019:	eb 54                	jmp    804806f <producer+0x6f>
	{
		sem_wait(&empty);
 804801b:	c7 04 24 88 5c 09 08 	movl   $0x8095c88,(%esp)
 8048022:	e8 32 11 00 00       	call   8049159 <sem_wait>
		sem_wait(&mutex);
 8048027:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 804802e:	e8 26 11 00 00       	call   8049159 <sem_wait>
		printf("produce No.%d\n",i);
 8048033:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048036:	89 44 24 04          	mov    %eax,0x4(%esp)
 804803a:	c7 04 24 cb a0 04 08 	movl   $0x804a0cb,(%esp)
 8048041:	e8 ea 11 00 00       	call   8049230 <printf>
		buf[i]=i;
 8048046:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048049:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804804c:	89 14 85 60 5c 09 08 	mov    %edx,0x8095c60(,%eax,4)
		sem_post(&mutex);
 8048053:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 804805a:	e8 30 11 00 00       	call   804918f <sem_post>
		sem_post(&full);	
 804805f:	c7 04 24 20 5c 09 08 	movl   $0x8095c20,(%esp)
 8048066:	e8 24 11 00 00       	call   804918f <sem_post>

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
	exit();
 8048075:	e8 58 10 00 00       	call   80490d2 <exit>
}
 804807a:	c9                   	leave  
 804807b:	c3                   	ret    

0804807c <consumer>:

void consumer()
{
 804807c:	55                   	push   %ebp
 804807d:	89 e5                	mov    %esp,%ebp
 804807f:	83 ec 28             	sub    $0x28,%esp
	printf("I am the consumer\n");
 8048082:	c7 04 24 da a0 04 08 	movl   $0x804a0da,(%esp)
 8048089:	e8 a2 11 00 00       	call   8049230 <printf>
	int i;
	for(i=0;i<10;i++)
 804808e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048095:	eb 47                	jmp    80480de <consumer+0x62>
	{
		sem_wait(&full);
 8048097:	c7 04 24 20 5c 09 08 	movl   $0x8095c20,(%esp)
 804809e:	e8 b6 10 00 00       	call   8049159 <sem_wait>
		sem_wait(&mutex);
 80480a3:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 80480aa:	e8 aa 10 00 00       	call   8049159 <sem_wait>
		printf("consume No.%d\n",i);
 80480af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80480b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 80480b6:	c7 04 24 ed a0 04 08 	movl   $0x804a0ed,(%esp)
 80480bd:	e8 6e 11 00 00       	call   8049230 <printf>
		sem_post(&mutex);
 80480c2:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 80480c9:	e8 c1 10 00 00       	call   804918f <sem_post>
		sem_post(&empty);
 80480ce:	c7 04 24 88 5c 09 08 	movl   $0x8095c88,(%esp)
 80480d5:	e8 b5 10 00 00       	call   804918f <sem_post>

void consumer()
{
	printf("I am the consumer\n");
	int i;
	for(i=0;i<10;i++)
 80480da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80480de:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 80480e2:	7e b3                	jle    8048097 <consumer+0x1b>
		sem_wait(&mutex);
		printf("consume No.%d\n",i);
		sem_post(&mutex);
		sem_post(&empty);
	}
	exit();
 80480e4:	e8 e9 0f 00 00       	call   80490d2 <exit>
}
 80480e9:	c9                   	leave  
 80480ea:	c3                   	ret    

080480eb <game_init>:


void
game_init(void) {
 80480eb:	55                   	push   %ebp
 80480ec:	89 e5                	mov    %esp,%ebp
 80480ee:	83 ec 18             	sub    $0x18,%esp

	printf("Welcome to our game~~~ready ~~~go~~~\n");
 80480f1:	c7 04 24 fc a0 04 08 	movl   $0x804a0fc,(%esp)
 80480f8:	e8 33 11 00 00       	call   8049230 <printf>
	//sleep(1);
	//printf("skskkssks");
	//while(1);
	
	//here is the producer and consumer test
	sem_init(&empty,5);
 80480fd:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
 8048104:	00 
 8048105:	c7 04 24 88 5c 09 08 	movl   $0x8095c88,(%esp)
 804810c:	e8 0b 10 00 00       	call   804911c <sem_init>
	//printf("dead here");
	sem_init(&full,0);
 8048111:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048118:	00 
 8048119:	c7 04 24 20 5c 09 08 	movl   $0x8095c20,(%esp)
 8048120:	e8 f7 0f 00 00       	call   804911c <sem_init>
	sem_init(&mutex,1);
 8048125:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804812c:	00 
 804812d:	c7 04 24 30 5c 09 08 	movl   $0x8095c30,(%esp)
 8048134:	e8 e3 0f 00 00       	call   804911c <sem_init>
	
	thread(producer);	
 8048139:	c7 04 24 00 80 04 08 	movl   $0x8048000,(%esp)
 8048140:	e8 bc 0f 00 00       	call   8049101 <thread>
	thread(consumer);
 8048145:	c7 04 24 7c 80 04 08 	movl   $0x804807c,(%esp)
 804814c:	e8 b0 0f 00 00       	call   8049101 <thread>

	//sem_destroy(&empty);
	//sem_destroy(&full);
	//sem_destroy(&mutex);
	while(1);
 8048151:	eb fe                	jmp    8048151 <game_init+0x66>

08048153 <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 8048153:	55                   	push   %ebp
 8048154:	89 e5                	mov    %esp,%ebp
 8048156:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 8048159:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048160:	eb 12                	jmp    8048174 <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 8048162:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048165:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 804816c:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 8048170:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048174:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048178:	7e e8                	jle    8048162 <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 804817a:	c9                   	leave  
 804817b:	c3                   	ret    

0804817c <press_key>:

void press_key(int scan_code) {
 804817c:	55                   	push   %ebp
 804817d:	89 e5                	mov    %esp,%ebp
 804817f:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 8048182:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048189:	eb 21                	jmp    80481ac <press_key+0x30>
		if (key_code[i] == scan_code) {
 804818b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804818e:	8b 04 85 00 b0 04 08 	mov    0x804b000(,%eax,4),%eax
 8048195:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048198:	75 0e                	jne    80481a8 <press_key+0x2c>
			key_pressed[i] = TRUE;
 804819a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804819d:	c7 04 85 20 b4 04 08 	movl   $0x1,0x804b420(,%eax,4)
 80481a4:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 80481a8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80481ac:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 80481b0:	7e d9                	jle    804818b <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 80481b2:	c9                   	leave  
 80481b3:	c3                   	ret    

080481b4 <release_key>:

void release_key(int index) {
 80481b4:	55                   	push   %ebp
 80481b5:	89 e5                	mov    %esp,%ebp
 80481b7:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 80481ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80481be:	78 06                	js     80481c6 <release_key+0x12>
 80481c0:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 80481c4:	7e 24                	jle    80481ea <release_key+0x36>
 80481c6:	c7 44 24 0c 22 a1 04 	movl   $0x804a122,0xc(%esp)
 80481cd:	08 
 80481ce:	c7 44 24 08 3a a1 04 	movl   $0x804a13a,0x8(%esp)
 80481d5:	08 
 80481d6:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 80481dd:	00 
 80481de:	c7 04 24 4f a1 04 08 	movl   $0x804a14f,(%esp)
 80481e5:	e8 93 00 00 00       	call   804827d <_panic>
	key_pressed[index] = FALSE;
 80481ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80481ed:	c7 04 85 20 b4 04 08 	movl   $0x0,0x804b420(,%eax,4)
 80481f4:	00 00 00 00 
}
 80481f8:	c9                   	leave  
 80481f9:	c3                   	ret    

080481fa <query_key>:

bool query_key(int index) {
 80481fa:	55                   	push   %ebp
 80481fb:	89 e5                	mov    %esp,%ebp
 80481fd:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 8048200:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048204:	78 06                	js     804820c <query_key+0x12>
 8048206:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 804820a:	7e 24                	jle    8048230 <query_key+0x36>
 804820c:	c7 44 24 0c 22 a1 04 	movl   $0x804a122,0xc(%esp)
 8048213:	08 
 8048214:	c7 44 24 08 3a a1 04 	movl   $0x804a13a,0x8(%esp)
 804821b:	08 
 804821c:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 8048223:	00 
 8048224:	c7 04 24 4f a1 04 08 	movl   $0x804a14f,(%esp)
 804822b:	e8 4d 00 00 00       	call   804827d <_panic>
	return key_pressed[index];
 8048230:	8b 45 08             	mov    0x8(%ebp),%eax
 8048233:	8b 04 85 20 b4 04 08 	mov    0x804b420(,%eax,4),%eax
}
 804823a:	c9                   	leave  
 804823b:	c3                   	ret    

0804823c <key_operation>:

extern void control_plane(int);
void key_operation(void){
 804823c:	55                   	push   %ebp
 804823d:	89 e5                	mov    %esp,%ebp
 804823f:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 8048242:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048249:	eb 2a                	jmp    8048275 <key_operation+0x39>
		if(query_key(i)==TRUE){
 804824b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804824e:	89 04 24             	mov    %eax,(%esp)
 8048251:	e8 a4 ff ff ff       	call   80481fa <query_key>
 8048256:	83 f8 01             	cmp    $0x1,%eax
 8048259:	75 16                	jne    8048271 <key_operation+0x35>
			control_plane(i);
 804825b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804825e:	89 04 24             	mov    %eax,(%esp)
 8048261:	e8 4d 08 00 00       	call   8048ab3 <control_plane>
			release_key(i);
 8048266:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048269:	89 04 24             	mov    %eax,(%esp)
 804826c:	e8 43 ff ff ff       	call   80481b4 <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 8048271:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048275:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 8048279:	7e d0                	jle    804824b <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 804827b:	c9                   	leave  
 804827c:	c3                   	ret    

0804827d <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 804827d:	55                   	push   %ebp
 804827e:	89 e5                	mov    %esp,%ebp
 8048280:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 8048283:	a1 30 b4 04 08       	mov    0x804b430,%eax
 8048288:	85 c0                	test   %eax,%eax
 804828a:	74 01                	je     804828d <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 804828c:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 804828d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048290:	a3 30 b4 04 08       	mov    %eax,0x804b430

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 8048295:	fa                   	cli    
 8048296:	fc                   	cld    

	va_start(ap, fmt);
 8048297:	8d 45 14             	lea    0x14(%ebp),%eax
 804829a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 804829d:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482a0:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80482a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482ab:	c7 04 24 5f a1 04 08 	movl   $0x804a15f,(%esp)
 80482b2:	e8 79 0f 00 00       	call   8049230 <printf>
	vprintf(fmt, ap);
 80482b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482be:	8b 45 10             	mov    0x10(%ebp),%eax
 80482c1:	89 04 24             	mov    %eax,(%esp)
 80482c4:	e8 34 0f 00 00       	call   80491fd <vprintf>
	printf("\n");
 80482c9:	c7 04 24 77 a1 04 08 	movl   $0x804a177,(%esp)
 80482d0:	e8 5b 0f 00 00       	call   8049230 <printf>
	va_end(ap);

}
 80482d5:	c9                   	leave  
 80482d6:	c3                   	ret    

080482d7 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 80482d7:	55                   	push   %ebp
 80482d8:	89 e5                	mov    %esp,%ebp
 80482da:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 80482dd:	8d 45 14             	lea    0x14(%ebp),%eax
 80482e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 80482e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482e6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80482ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80482ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482f1:	c7 04 24 79 a1 04 08 	movl   $0x804a179,(%esp)
 80482f8:	e8 33 0f 00 00       	call   8049230 <printf>
	vprintf(fmt, ap);
 80482fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048300:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048304:	8b 45 10             	mov    0x10(%ebp),%eax
 8048307:	89 04 24             	mov    %eax,(%esp)
 804830a:	e8 ee 0e 00 00       	call   80491fd <vprintf>
	printf("\n");
 804830f:	c7 04 24 77 a1 04 08 	movl   $0x804a177,(%esp)
 8048316:	e8 15 0f 00 00       	call   8049230 <printf>
	va_end(ap);
}
 804831b:	c9                   	leave  
 804831c:	c3                   	ret    

0804831d <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 804831d:	55                   	push   %ebp
 804831e:	89 e5                	mov    %esp,%ebp
 8048320:	83 ec 38             	sub    $0x38,%esp
 8048323:	8b 45 08             	mov    0x8(%ebp),%eax
 8048326:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 8048329:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 804832d:	79 24                	jns    8048353 <draw_character+0x36>
 804832f:	c7 44 24 0c 93 a1 04 	movl   $0x804a193,0xc(%esp)
 8048336:	08 
 8048337:	c7 44 24 08 a4 a1 04 	movl   $0x804a1a4,0x8(%esp)
 804833e:	08 
 804833f:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 8048346:	00 
 8048347:	c7 04 24 b9 a1 04 08 	movl   $0x804a1b9,(%esp)
 804834e:	e8 2a ff ff ff       	call   804827d <_panic>
	char *p = font8x8_basic[(int)ch];
 8048353:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 8048357:	c1 e0 03             	shl    $0x3,%eax
 804835a:	05 20 b0 04 08       	add    $0x804b020,%eax
 804835f:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 8048362:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048369:	eb 59                	jmp    80483c4 <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 804836b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048372:	eb 46                	jmp    80483ba <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 8048374:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048377:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804837a:	01 d0                	add    %edx,%eax
 804837c:	0f b6 00             	movzbl (%eax),%eax
 804837f:	0f be d0             	movsbl %al,%edx
 8048382:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048385:	89 c1                	mov    %eax,%ecx
 8048387:	d3 fa                	sar    %cl,%edx
 8048389:	89 d0                	mov    %edx,%eax
 804838b:	83 e0 01             	and    $0x1,%eax
 804838e:	85 c0                	test   %eax,%eax
 8048390:	74 24                	je     80483b6 <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 8048392:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048395:	8b 55 10             	mov    0x10(%ebp),%edx
 8048398:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804839b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804839e:	8b 55 0c             	mov    0xc(%ebp),%edx
 80483a1:	01 c2                	add    %eax,%edx
 80483a3:	8b 45 14             	mov    0x14(%ebp),%eax
 80483a6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80483aa:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80483ae:	89 14 24             	mov    %edx,(%esp)
 80483b1:	e8 fb 0b 00 00       	call   8048fb1 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 80483b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80483ba:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 80483be:	7e b4                	jle    8048374 <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 80483c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80483c4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 80483c8:	7e a1                	jle    804836b <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 80483ca:	c9                   	leave  
 80483cb:	c3                   	ret    

080483cc <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 80483cc:	55                   	push   %ebp
 80483cd:	89 e5                	mov    %esp,%ebp
 80483cf:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 80483d2:	eb 4a                	jmp    804841e <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 80483d4:	8b 45 08             	mov    0x8(%ebp),%eax
 80483d7:	8d 50 01             	lea    0x1(%eax),%edx
 80483da:	89 55 08             	mov    %edx,0x8(%ebp)
 80483dd:	0f b6 00             	movzbl (%eax),%eax
 80483e0:	0f be c0             	movsbl %al,%eax
 80483e3:	8b 55 14             	mov    0x14(%ebp),%edx
 80483e6:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80483ea:	8b 55 10             	mov    0x10(%ebp),%edx
 80483ed:	89 54 24 08          	mov    %edx,0x8(%esp)
 80483f1:	8b 55 0c             	mov    0xc(%ebp),%edx
 80483f4:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483f8:	89 04 24             	mov    %eax,(%esp)
 80483fb:	e8 1d ff ff ff       	call   804831d <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 8048400:	8b 45 10             	mov    0x10(%ebp),%eax
 8048403:	83 c0 08             	add    $0x8,%eax
 8048406:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 804840b:	7e 0d                	jle    804841a <draw_string+0x4e>
			x += 8; y = 0;
 804840d:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 8048411:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8048418:	eb 04                	jmp    804841e <draw_string+0x52>
		} else {
			y += 8;
 804841a:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 804841e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048421:	0f b6 00             	movzbl (%eax),%eax
 8048424:	84 c0                	test   %al,%al
 8048426:	75 ac                	jne    80483d4 <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 8048428:	c9                   	leave  
 8048429:	c3                   	ret    

0804842a <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 804842a:	55                   	push   %ebp
 804842b:	89 e5                	mov    %esp,%ebp
 804842d:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 8048430:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048437:	eb 3d                	jmp    8048476 <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 8048439:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048440:	eb 28                	jmp    804846a <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 8048442:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048445:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048448:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804844b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804844e:	8b 55 08             	mov    0x8(%ebp),%edx
 8048451:	01 c2                	add    %eax,%edx
 8048453:	8b 45 14             	mov    0x14(%ebp),%eax
 8048456:	89 44 24 08          	mov    %eax,0x8(%esp)
 804845a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804845e:	89 14 24             	mov    %edx,(%esp)
 8048461:	e8 4b 0b 00 00       	call   8048fb1 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 8048466:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804846a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804846d:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048470:	7c d0                	jl     8048442 <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 8048472:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048476:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048479:	3b 45 10             	cmp    0x10(%ebp),%eax
 804847c:	7c bb                	jl     8048439 <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 804847e:	c9                   	leave  
 804847f:	c3                   	ret    

08048480 <redraw_screen>:

void
redraw_screen() {
 8048480:	55                   	push   %ebp
 8048481:	89 e5                	mov    %esp,%ebp
 8048483:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 8048486:	e8 8e 0b 00 00       	call   8049019 <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 804848b:	e8 42 07 00 00       	call   8048bd2 <get_st_head>
 8048490:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048493:	eb 37                	jmp    80484cc <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 8048495:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048498:	8b 48 08             	mov    0x8(%eax),%ecx
 804849b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804849e:	8b 50 04             	mov    0x4(%eax),%edx
 80484a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484a4:	8b 00                	mov    (%eax),%eax
 80484a6:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 80484ad:	00 
 80484ae:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80484b2:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484b6:	89 04 24             	mov    %eax,(%esp)
 80484b9:	e8 6c ff ff ff       	call   804842a <draw_bomb>
		it=st_next(it);
 80484be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484c1:	89 04 24             	mov    %eax,(%esp)
 80484c4:	e8 cf 04 00 00       	call   8048998 <st_next>
 80484c9:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 80484cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80484d0:	75 c3                	jne    8048495 <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 80484d2:	8b 0d 48 5c 09 08    	mov    0x8095c48,%ecx
 80484d8:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 80484de:	a1 40 5c 09 08       	mov    0x8095c40,%eax
 80484e3:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 80484ea:	00 
 80484eb:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80484ef:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484f3:	89 04 24             	mov    %eax,(%esp)
 80484f6:	e8 2f ff ff ff       	call   804842a <draw_bomb>
	const char *score=itoa(get_score());
 80484fb:	e8 be 06 00 00       	call   8048bbe <get_score>
 8048500:	89 04 24             	mov    %eax,(%esp)
 8048503:	e8 69 0d 00 00       	call   8049271 <itoa>
 8048508:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 804850b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804850e:	89 04 24             	mov    %eax,(%esp)
 8048511:	e8 f7 0d 00 00       	call   804930d <strlen>
 8048516:	89 c2                	mov    %eax,%edx
 8048518:	b8 00 00 00 00       	mov    $0x0,%eax
 804851d:	29 d0                	sub    %edx,%eax
 804851f:	c1 e0 03             	shl    $0x3,%eax
 8048522:	05 10 01 00 00       	add    $0x110,%eax
 8048527:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804852e:	00 
 804852f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048533:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804853a:	00 
 804853b:	c7 04 24 c5 a1 04 08 	movl   $0x804a1c5,(%esp)
 8048542:	e8 85 fe ff ff       	call   80483cc <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 8048547:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804854a:	89 04 24             	mov    %eax,(%esp)
 804854d:	e8 bb 0d 00 00       	call   804930d <strlen>
 8048552:	89 c2                	mov    %eax,%edx
 8048554:	b8 00 00 00 00       	mov    $0x0,%eax
 8048559:	29 d0                	sub    %edx,%eax
 804855b:	c1 e0 03             	shl    $0x3,%eax
 804855e:	05 40 01 00 00       	add    $0x140,%eax
 8048563:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804856a:	00 
 804856b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804856f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048576:	00 
 8048577:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804857a:	89 04 24             	mov    %eax,(%esp)
 804857d:	e8 4a fe ff ff       	call   80483cc <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 8048582:	e8 41 06 00 00       	call   8048bc8 <get_miss>
 8048587:	89 04 24             	mov    %eax,(%esp)
 804858a:	e8 e2 0c 00 00       	call   8049271 <itoa>
 804858f:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 8048592:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048595:	89 04 24             	mov    %eax,(%esp)
 8048598:	e8 70 0d 00 00       	call   804930d <strlen>
 804859d:	89 c2                	mov    %eax,%edx
 804859f:	b8 00 00 00 00       	mov    $0x0,%eax
 80485a4:	29 d0                	sub    %edx,%eax
 80485a6:	c1 e0 03             	shl    $0x3,%eax
 80485a9:	05 18 01 00 00       	add    $0x118,%eax
 80485ae:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80485b5:	00 
 80485b6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485ba:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80485c1:	00 
 80485c2:	c7 04 24 cc a1 04 08 	movl   $0x804a1cc,(%esp)
 80485c9:	e8 fe fd ff ff       	call   80483cc <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 80485ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80485d1:	89 04 24             	mov    %eax,(%esp)
 80485d4:	e8 34 0d 00 00       	call   804930d <strlen>
 80485d9:	89 c2                	mov    %eax,%edx
 80485db:	b8 00 00 00 00       	mov    $0x0,%eax
 80485e0:	29 d0                	sub    %edx,%eax
 80485e2:	c1 e0 03             	shl    $0x3,%eax
 80485e5:	05 40 01 00 00       	add    $0x140,%eax
 80485ea:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 80485f1:	00 
 80485f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485f6:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 80485fd:	00 
 80485fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048601:	89 04 24             	mov    %eax,(%esp)
 8048604:	e8 c3 fd ff ff       	call   80483cc <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 8048609:	e8 74 00 00 00       	call   8048682 <get_fps>
 804860e:	89 04 24             	mov    %eax,(%esp)
 8048611:	e8 5b 0c 00 00       	call   8049271 <itoa>
 8048616:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 804861d:	00 
 804861e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8048625:	00 
 8048626:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804862d:	00 
 804862e:	89 04 24             	mov    %eax,(%esp)
 8048631:	e8 96 fd ff ff       	call   80483cc <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 8048636:	e8 47 00 00 00       	call   8048682 <get_fps>
 804863b:	89 04 24             	mov    %eax,(%esp)
 804863e:	e8 2e 0c 00 00       	call   8049271 <itoa>
 8048643:	89 04 24             	mov    %eax,(%esp)
 8048646:	e8 c2 0c 00 00       	call   804930d <strlen>
 804864b:	c1 e0 03             	shl    $0x3,%eax
 804864e:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 8048655:	00 
 8048656:	89 44 24 08          	mov    %eax,0x8(%esp)
 804865a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048661:	00 
 8048662:	c7 04 24 d2 a1 04 08 	movl   $0x804a1d2,(%esp)
 8048669:	e8 5e fd ff ff       	call   80483cc <draw_string>
	syspr();
 804866e:	e8 ca 09 00 00       	call   804903d <syspr>
}
 8048673:	c9                   	leave  
 8048674:	c3                   	ret    

08048675 <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 8048675:	55                   	push   %ebp
 8048676:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 8048678:	8b 45 08             	mov    0x8(%ebp),%eax
 804867b:	a3 34 b4 04 08       	mov    %eax,0x804b434
}
 8048680:	5d                   	pop    %ebp
 8048681:	c3                   	ret    

08048682 <get_fps>:
int get_fps() {
 8048682:	55                   	push   %ebp
 8048683:	89 e5                	mov    %esp,%ebp
	return real_fps;
 8048685:	a1 34 b4 04 08       	mov    0x804b434,%eax
}
 804868a:	5d                   	pop    %ebp
 804868b:	c3                   	ret    

0804868c <main_loop>:


extern void key_operation();
void main_loop(void) {
 804868c:	55                   	push   %ebp
 804868d:	89 e5                	mov    %esp,%ebp
 804868f:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 8048692:	e8 c2 09 00 00       	call   8049059 <systime>
 8048697:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 804869a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 80486a1:	c7 05 40 5c 09 08 64 	movl   $0x64,0x8095c40
 80486a8:	00 00 00 
	pl.y=150;
 80486ab:	c7 05 44 5c 09 08 96 	movl   $0x96,0x8095c44
 80486b2:	00 00 00 
	pl.w=10;
 80486b5:	c7 05 48 5c 09 08 0a 	movl   $0xa,0x8095c48
 80486bc:	00 00 00 
	pl.v=10;
 80486bf:	c7 05 4c 5c 09 08 0a 	movl   $0xa,0x8095c4c
 80486c6:	00 00 00 
	int k=0;
 80486c9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	while (TRUE) {
	
		key_operation();
 80486d0:	e8 67 fb ff ff       	call   804823c <key_operation>
		target = systime(); 
 80486d5:	e8 7f 09 00 00       	call   8049059 <systime>
 80486da:	89 45 e0             	mov    %eax,-0x20(%ebp)
		redraw = FALSE;
 80486dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 80486e4:	e9 06 01 00 00       	jmp    80487ef <main_loop+0x163>
			int code=sysreadkey();
 80486e9:	e8 7f 09 00 00       	call   804906d <sysreadkey>
 80486ee:	89 45 dc             	mov    %eax,-0x24(%ebp)
			if(code!=-1){
 80486f1:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
 80486f5:	74 0b                	je     8048702 <main_loop+0x76>
				press_key(code);
 80486f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
 80486fa:	89 04 24             	mov    %eax,(%esp)
 80486fd:	e8 7a fa ff ff       	call   804817c <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 8048702:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048705:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804870a:	89 c8                	mov    %ecx,%eax
 804870c:	f7 ea                	imul   %edx
 804870e:	c1 fa 05             	sar    $0x5,%edx
 8048711:	89 c8                	mov    %ecx,%eax
 8048713:	c1 f8 1f             	sar    $0x1f,%eax
 8048716:	29 c2                	sub    %eax,%edx
 8048718:	89 d0                	mov    %edx,%eax
 804871a:	6b c0 64             	imul   $0x64,%eax,%eax
 804871d:	29 c1                	sub    %eax,%ecx
 804871f:	89 c8                	mov    %ecx,%eax
 8048721:	85 c0                	test   %eax,%eax
 8048723:	75 05                	jne    804872a <main_loop+0x9e>
				create_new_stone();
 8048725:	e8 b2 04 00 00       	call   8048bdc <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 804872a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804872d:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048732:	89 c8                	mov    %ecx,%eax
 8048734:	f7 ea                	imul   %edx
 8048736:	89 c8                	mov    %ecx,%eax
 8048738:	c1 f8 1f             	sar    $0x1f,%eax
 804873b:	29 c2                	sub    %eax,%edx
 804873d:	89 d0                	mov    %edx,%eax
 804873f:	01 c0                	add    %eax,%eax
 8048741:	01 d0                	add    %edx,%eax
 8048743:	29 c1                	sub    %eax,%ecx
 8048745:	89 ca                	mov    %ecx,%edx
 8048747:	85 d2                	test   %edx,%edx
 8048749:	75 05                	jne    8048750 <main_loop+0xc4>
				update_stone_pos();
 804874b:	e8 2f 05 00 00       	call   8048c7f <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 8048750:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048753:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048758:	89 c8                	mov    %ecx,%eax
 804875a:	f7 ea                	imul   %edx
 804875c:	89 c8                	mov    %ecx,%eax
 804875e:	c1 f8 1f             	sar    $0x1f,%eax
 8048761:	29 c2                	sub    %eax,%edx
 8048763:	89 d0                	mov    %edx,%eax
 8048765:	01 c0                	add    %eax,%eax
 8048767:	01 d0                	add    %edx,%eax
 8048769:	29 c1                	sub    %eax,%ecx
 804876b:	89 ca                	mov    %ecx,%edx
 804876d:	85 d2                	test   %edx,%edx
 804876f:	75 05                	jne    8048776 <main_loop+0xea>
				update_bang();
 8048771:	e8 a3 07 00 00       	call   8048f19 <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 8048776:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048779:	ba 56 55 55 55       	mov    $0x55555556,%edx
 804877e:	89 c8                	mov    %ecx,%eax
 8048780:	f7 ea                	imul   %edx
 8048782:	89 c8                	mov    %ecx,%eax
 8048784:	c1 f8 1f             	sar    $0x1f,%eax
 8048787:	29 c2                	sub    %eax,%edx
 8048789:	89 d0                	mov    %edx,%eax
 804878b:	01 c0                	add    %eax,%eax
 804878d:	01 d0                	add    %edx,%eax
 804878f:	29 c1                	sub    %eax,%ecx
 8048791:	89 ca                	mov    %ecx,%edx
 8048793:	85 d2                	test   %edx,%edx
 8048795:	75 07                	jne    804879e <main_loop+0x112>
				redraw = TRUE;
 8048797:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 804879e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80487a1:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80487a6:	89 c8                	mov    %ecx,%eax
 80487a8:	f7 ea                	imul   %edx
 80487aa:	c1 fa 04             	sar    $0x4,%edx
 80487ad:	89 c8                	mov    %ecx,%eax
 80487af:	c1 f8 1f             	sar    $0x1f,%eax
 80487b2:	29 c2                	sub    %eax,%edx
 80487b4:	89 d0                	mov    %edx,%eax
 80487b6:	6b c0 32             	imul   $0x32,%eax,%eax
 80487b9:	29 c1                	sub    %eax,%ecx
 80487bb:	89 c8                	mov    %ecx,%eax
 80487bd:	85 c0                	test   %eax,%eax
 80487bf:	75 2a                	jne    80487eb <main_loop+0x15f>
				int now_fps = num_draw * 2 + 1;
 80487c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80487c4:	01 c0                	add    %eax,%eax
 80487c6:	83 c0 01             	add    $0x1,%eax
 80487c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 80487cc:	83 7d e4 1e          	cmpl   $0x1e,-0x1c(%ebp)
 80487d0:	7e 07                	jle    80487d9 <main_loop+0x14d>
 80487d2:	c7 45 e4 1e 00 00 00 	movl   $0x1e,-0x1c(%ebp)
				set_fps(now_fps);
 80487d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80487dc:	89 04 24             	mov    %eax,(%esp)
 80487df:	e8 91 fe ff ff       	call   8048675 <set_fps>
				num_draw = 0;
 80487e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 80487eb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 80487ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80487f2:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 80487f5:	0f 8c ee fe ff ff    	jl     80486e9 <main_loop+0x5d>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 80487fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 80487ff:	74 09                	je     804880a <main_loop+0x17e>
			num_draw ++;
 8048801:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 8048805:	e8 76 fc ff ff       	call   8048480 <redraw_screen>
		}

		if(k==0){        //for test
 804880a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 804880e:	75 23                	jne    8048833 <main_loop+0x1a7>
			fork();
 8048810:	e8 95 08 00 00       	call   80490aa <fork>
			k=1;
 8048815:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
			printf("%d\n",getpid());
 804881c:	e8 9d 08 00 00       	call   80490be <getpid>
 8048821:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048825:	c7 04 24 d6 a1 04 08 	movl   $0x804a1d6,(%esp)
 804882c:	e8 ff 09 00 00       	call   8049230 <printf>
 8048831:	eb 6c                	jmp    804889f <main_loop+0x213>
		}
		else if(k%10==0)
 8048833:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048836:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804883b:	89 c8                	mov    %ecx,%eax
 804883d:	f7 ea                	imul   %edx
 804883f:	c1 fa 02             	sar    $0x2,%edx
 8048842:	89 c8                	mov    %ecx,%eax
 8048844:	c1 f8 1f             	sar    $0x1f,%eax
 8048847:	29 c2                	sub    %eax,%edx
 8048849:	89 d0                	mov    %edx,%eax
 804884b:	c1 e0 02             	shl    $0x2,%eax
 804884e:	01 d0                	add    %edx,%eax
 8048850:	01 c0                	add    %eax,%eax
 8048852:	29 c1                	sub    %eax,%ecx
 8048854:	89 ca                	mov    %ecx,%edx
 8048856:	85 d2                	test   %edx,%edx
 8048858:	75 12                	jne    804886c <main_loop+0x1e0>
		{
			sleep(1);
 804885a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048861:	e8 80 08 00 00       	call   80490e6 <sleep>
			k++;
 8048866:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804886a:	eb 33                	jmp    804889f <main_loop+0x213>
		}
		else if(k%100==0)
 804886c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 804886f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 8048874:	89 c8                	mov    %ecx,%eax
 8048876:	f7 ea                	imul   %edx
 8048878:	c1 fa 05             	sar    $0x5,%edx
 804887b:	89 c8                	mov    %ecx,%eax
 804887d:	c1 f8 1f             	sar    $0x1f,%eax
 8048880:	29 c2                	sub    %eax,%edx
 8048882:	89 d0                	mov    %edx,%eax
 8048884:	6b c0 64             	imul   $0x64,%eax,%eax
 8048887:	29 c1                	sub    %eax,%ecx
 8048889:	89 c8                	mov    %ecx,%eax
 804888b:	85 c0                	test   %eax,%eax
 804888d:	75 07                	jne    8048896 <main_loop+0x20a>
		{
			exit();
 804888f:	e8 3e 08 00 00       	call   80490d2 <exit>
 8048894:	eb 09                	jmp    804889f <main_loop+0x213>
		}
		else
			k++;
 8048896:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
	}
 804889a:	e9 31 fe ff ff       	jmp    80486d0 <main_loop+0x44>
 804889f:	e9 2c fe ff ff       	jmp    80486d0 <main_loop+0x44>

080488a4 <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 80488a4:	55                   	push   %ebp
 80488a5:	89 e5                	mov    %esp,%ebp
 80488a7:	83 ec 28             	sub    $0x28,%esp
 80488aa:	a1 d8 5d 08 08       	mov    0x8085dd8,%eax
 80488af:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488b2:	c7 45 ec 40 b4 04 08 	movl   $0x804b440,-0x14(%ebp)
 80488b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80488bd:	75 47                	jne    8048906 <st_new+0x62>
 80488bf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 80488c6:	eb 2f                	jmp    80488f7 <st_new+0x53>
 80488c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488cb:	89 d0                	mov    %edx,%eax
 80488cd:	01 c0                	add    %eax,%eax
 80488cf:	01 d0                	add    %edx,%eax
 80488d1:	c1 e0 03             	shl    $0x3,%eax
 80488d4:	8d 50 e8             	lea    -0x18(%eax),%edx
 80488d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488da:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80488dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488e0:	89 d0                	mov    %edx,%eax
 80488e2:	01 c0                	add    %eax,%eax
 80488e4:	01 d0                	add    %edx,%eax
 80488e6:	c1 e0 03             	shl    $0x3,%eax
 80488e9:	89 c2                	mov    %eax,%edx
 80488eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488ee:	01 d0                	add    %edx,%eax
 80488f0:	89 41 14             	mov    %eax,0x14(%ecx)
 80488f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80488f7:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 80488fe:	7e c8                	jle    80488c8 <st_new+0x24>
 8048900:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048903:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048906:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048909:	8b 40 14             	mov    0x14(%eax),%eax
 804890c:	85 c0                	test   %eax,%eax
 804890e:	75 24                	jne    8048934 <st_new+0x90>
 8048910:	c7 44 24 0c da a1 04 	movl   $0x804a1da,0xc(%esp)
 8048917:	08 
 8048918:	c7 44 24 08 f3 a1 04 	movl   $0x804a1f3,0x8(%esp)
 804891f:	08 
 8048920:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048927:	00 
 8048928:	c7 04 24 08 a2 04 08 	movl   $0x804a208,(%esp)
 804892f:	e8 49 f9 ff ff       	call   804827d <_panic>
 8048934:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048937:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804893a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804893d:	8b 40 14             	mov    0x14(%eax),%eax
 8048940:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048945:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048948:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 804894f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048952:	8b 50 14             	mov    0x14(%eax),%edx
 8048955:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048958:	89 50 10             	mov    %edx,0x10(%eax)
 804895b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804895e:	c9                   	leave  
 804895f:	c3                   	ret    

08048960 <st_prev>:
 8048960:	55                   	push   %ebp
 8048961:	89 e5                	mov    %esp,%ebp
 8048963:	83 ec 18             	sub    $0x18,%esp
 8048966:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804896a:	75 24                	jne    8048990 <st_prev+0x30>
 804896c:	c7 44 24 0c 16 a2 04 	movl   $0x804a216,0xc(%esp)
 8048973:	08 
 8048974:	c7 44 24 08 f3 a1 04 	movl   $0x804a1f3,0x8(%esp)
 804897b:	08 
 804897c:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048983:	00 
 8048984:	c7 04 24 08 a2 04 08 	movl   $0x804a208,(%esp)
 804898b:	e8 ed f8 ff ff       	call   804827d <_panic>
 8048990:	8b 45 08             	mov    0x8(%ebp),%eax
 8048993:	8b 40 10             	mov    0x10(%eax),%eax
 8048996:	c9                   	leave  
 8048997:	c3                   	ret    

08048998 <st_next>:
 8048998:	55                   	push   %ebp
 8048999:	89 e5                	mov    %esp,%ebp
 804899b:	83 ec 18             	sub    $0x18,%esp
 804899e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80489a2:	75 24                	jne    80489c8 <st_next+0x30>
 80489a4:	c7 44 24 0c 16 a2 04 	movl   $0x804a216,0xc(%esp)
 80489ab:	08 
 80489ac:	c7 44 24 08 f3 a1 04 	movl   $0x804a1f3,0x8(%esp)
 80489b3:	08 
 80489b4:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80489bb:	00 
 80489bc:	c7 04 24 08 a2 04 08 	movl   $0x804a208,(%esp)
 80489c3:	e8 b5 f8 ff ff       	call   804827d <_panic>
 80489c8:	8b 45 08             	mov    0x8(%ebp),%eax
 80489cb:	8b 40 14             	mov    0x14(%eax),%eax
 80489ce:	c9                   	leave  
 80489cf:	c3                   	ret    

080489d0 <st_insert>:
 80489d0:	55                   	push   %ebp
 80489d1:	89 e5                	mov    %esp,%ebp
 80489d3:	83 ec 18             	sub    $0x18,%esp
 80489d6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80489da:	75 2a                	jne    8048a06 <st_insert+0x36>
 80489dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80489e0:	75 24                	jne    8048a06 <st_insert+0x36>
 80489e2:	c7 44 24 0c 23 a2 04 	movl   $0x804a223,0xc(%esp)
 80489e9:	08 
 80489ea:	c7 44 24 08 f3 a1 04 	movl   $0x804a1f3,0x8(%esp)
 80489f1:	08 
 80489f2:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80489f9:	00 
 80489fa:	c7 04 24 08 a2 04 08 	movl   $0x804a208,(%esp)
 8048a01:	e8 77 f8 ff ff       	call   804827d <_panic>
 8048a06:	8b 45 10             	mov    0x10(%ebp),%eax
 8048a09:	8b 55 08             	mov    0x8(%ebp),%edx
 8048a0c:	89 50 10             	mov    %edx,0x10(%eax)
 8048a0f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048a12:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048a15:	89 50 14             	mov    %edx,0x14(%eax)
 8048a18:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048a1c:	74 09                	je     8048a27 <st_insert+0x57>
 8048a1e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a21:	8b 55 10             	mov    0x10(%ebp),%edx
 8048a24:	89 50 14             	mov    %edx,0x14(%eax)
 8048a27:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048a2b:	74 09                	je     8048a36 <st_insert+0x66>
 8048a2d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048a30:	8b 55 10             	mov    0x10(%ebp),%edx
 8048a33:	89 50 10             	mov    %edx,0x10(%eax)
 8048a36:	c9                   	leave  
 8048a37:	c3                   	ret    

08048a38 <st_remove>:
 8048a38:	55                   	push   %ebp
 8048a39:	89 e5                	mov    %esp,%ebp
 8048a3b:	83 ec 28             	sub    $0x28,%esp
 8048a3e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a41:	8b 40 10             	mov    0x10(%eax),%eax
 8048a44:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a47:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a4a:	8b 40 14             	mov    0x14(%eax),%eax
 8048a4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048a50:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048a54:	75 24                	jne    8048a7a <st_remove+0x42>
 8048a56:	c7 44 24 0c 16 a2 04 	movl   $0x804a216,0xc(%esp)
 8048a5d:	08 
 8048a5e:	c7 44 24 08 f3 a1 04 	movl   $0x804a1f3,0x8(%esp)
 8048a65:	08 
 8048a66:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048a6d:	00 
 8048a6e:	c7 04 24 08 a2 04 08 	movl   $0x804a208,(%esp)
 8048a75:	e8 03 f8 ff ff       	call   804827d <_panic>
 8048a7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048a7e:	74 09                	je     8048a89 <st_remove+0x51>
 8048a80:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a83:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048a86:	89 50 14             	mov    %edx,0x14(%eax)
 8048a89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048a8d:	74 09                	je     8048a98 <st_remove+0x60>
 8048a8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048a92:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048a95:	89 50 10             	mov    %edx,0x10(%eax)
 8048a98:	c9                   	leave  
 8048a99:	c3                   	ret    

08048a9a <st_free>:
 8048a9a:	55                   	push   %ebp
 8048a9b:	89 e5                	mov    %esp,%ebp
 8048a9d:	8b 15 d8 5d 08 08    	mov    0x8085dd8,%edx
 8048aa3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048aa6:	89 50 14             	mov    %edx,0x14(%eax)
 8048aa9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048aac:	a3 d8 5d 08 08       	mov    %eax,0x8085dd8
 8048ab1:	5d                   	pop    %ebp
 8048ab2:	c3                   	ret    

08048ab3 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 8048ab3:	55                   	push   %ebp
 8048ab4:	89 e5                	mov    %esp,%ebp
 8048ab6:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 8048ab9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048abc:	83 f8 01             	cmp    $0x1,%eax
 8048abf:	74 4e                	je     8048b0f <control_plane+0x5c>
 8048ac1:	83 f8 01             	cmp    $0x1,%eax
 8048ac4:	7f 09                	jg     8048acf <control_plane+0x1c>
 8048ac6:	85 c0                	test   %eax,%eax
 8048ac8:	74 18                	je     8048ae2 <control_plane+0x2f>
 8048aca:	e9 c9 00 00 00       	jmp    8048b98 <control_plane+0xe5>
 8048acf:	83 f8 02             	cmp    $0x2,%eax
 8048ad2:	74 6c                	je     8048b40 <control_plane+0x8d>
 8048ad4:	83 f8 03             	cmp    $0x3,%eax
 8048ad7:	0f 84 8a 00 00 00    	je     8048b67 <control_plane+0xb4>
 8048add:	e9 b6 00 00 00       	jmp    8048b98 <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 8048ae2:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048ae8:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048aed:	39 c2                	cmp    %eax,%edx
 8048aef:	7c 19                	jl     8048b0a <control_plane+0x57>
 8048af1:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048af7:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048afc:	29 c2                	sub    %eax,%edx
 8048afe:	89 d0                	mov    %edx,%eax
 8048b00:	a3 40 5c 09 08       	mov    %eax,0x8095c40
 8048b05:	e9 b2 00 00 00       	jmp    8048bbc <control_plane+0x109>
 8048b0a:	e9 ad 00 00 00       	jmp    8048bbc <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048b0f:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048b15:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b1a:	01 c2                	add    %eax,%edx
 8048b1c:	a1 48 5c 09 08       	mov    0x8095c48,%eax
 8048b21:	01 d0                	add    %edx,%eax
 8048b23:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048b28:	7f 14                	jg     8048b3e <control_plane+0x8b>
 8048b2a:	8b 15 40 5c 09 08    	mov    0x8095c40,%edx
 8048b30:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b35:	01 d0                	add    %edx,%eax
 8048b37:	a3 40 5c 09 08       	mov    %eax,0x8095c40
 8048b3c:	eb 7e                	jmp    8048bbc <control_plane+0x109>
 8048b3e:	eb 7c                	jmp    8048bbc <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 8048b40:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b46:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b4b:	39 c2                	cmp    %eax,%edx
 8048b4d:	7c 16                	jl     8048b65 <control_plane+0xb2>
 8048b4f:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b55:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b5a:	29 c2                	sub    %eax,%edx
 8048b5c:	89 d0                	mov    %edx,%eax
 8048b5e:	a3 44 5c 09 08       	mov    %eax,0x8095c44
 8048b63:	eb 57                	jmp    8048bbc <control_plane+0x109>
 8048b65:	eb 55                	jmp    8048bbc <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 8048b67:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b6d:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b72:	01 c2                	add    %eax,%edx
 8048b74:	a1 48 5c 09 08       	mov    0x8095c48,%eax
 8048b79:	01 d0                	add    %edx,%eax
 8048b7b:	3d 40 01 00 00       	cmp    $0x140,%eax
 8048b80:	7f 14                	jg     8048b96 <control_plane+0xe3>
 8048b82:	8b 15 44 5c 09 08    	mov    0x8095c44,%edx
 8048b88:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048b8d:	01 d0                	add    %edx,%eax
 8048b8f:	a3 44 5c 09 08       	mov    %eax,0x8095c44
 8048b94:	eb 26                	jmp    8048bbc <control_plane+0x109>
 8048b96:	eb 24                	jmp    8048bbc <control_plane+0x109>
		default:assert(0);
 8048b98:	c7 44 24 0c 40 a2 04 	movl   $0x804a240,0xc(%esp)
 8048b9f:	08 
 8048ba0:	c7 44 24 08 f3 a1 04 	movl   $0x804a1f3,0x8(%esp)
 8048ba7:	08 
 8048ba8:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048baf:	00 
 8048bb0:	c7 04 24 08 a2 04 08 	movl   $0x804a208,(%esp)
 8048bb7:	e8 c1 f6 ff ff       	call   804827d <_panic>
	}
}
 8048bbc:	c9                   	leave  
 8048bbd:	c3                   	ret    

08048bbe <get_score>:


int get_score(void) {
 8048bbe:	55                   	push   %ebp
 8048bbf:	89 e5                	mov    %esp,%ebp
	return score;
 8048bc1:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
}
 8048bc6:	5d                   	pop    %ebp
 8048bc7:	c3                   	ret    

08048bc8 <get_miss>:

int get_miss(void) {
 8048bc8:	55                   	push   %ebp
 8048bc9:	89 e5                	mov    %esp,%ebp
	return miss;
 8048bcb:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
}
 8048bd0:	5d                   	pop    %ebp
 8048bd1:	c3                   	ret    

08048bd2 <get_st_head>:

st_t get_st_head(void){
 8048bd2:	55                   	push   %ebp
 8048bd3:	89 e5                	mov    %esp,%ebp
	return head;
 8048bd5:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
}
 8048bda:	5d                   	pop    %ebp
 8048bdb:	c3                   	ret    

08048bdc <create_new_stone>:

void create_new_stone(void) {
 8048bdc:	55                   	push   %ebp
 8048bdd:	89 e5                	mov    %esp,%ebp
 8048bdf:	53                   	push   %ebx
 8048be0:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048be3:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048be8:	85 c0                	test   %eax,%eax
 8048bea:	75 0c                	jne    8048bf8 <create_new_stone+0x1c>
		head = st_new(); 
 8048bec:	e8 b3 fc ff ff       	call   80488a4 <st_new>
 8048bf1:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
 8048bf6:	eb 2c                	jmp    8048c24 <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048bf8:	e8 a7 fc ff ff       	call   80488a4 <st_new>
 8048bfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048c00:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c05:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c08:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c0c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048c17:	e8 b4 fd ff ff       	call   80489d0 <st_insert>
		head = now;
 8048c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c1f:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
	}
	head->x = 0;
 8048c24:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c29:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048c2f:	8b 1d dc 5d 08 08    	mov    0x8085ddc,%ebx
 8048c35:	e8 c9 11 00 00       	call   8049e03 <rand>
 8048c3a:	89 c1                	mov    %eax,%ecx
 8048c3c:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048c41:	89 c8                	mov    %ecx,%eax
 8048c43:	f7 ea                	imul   %edx
 8048c45:	c1 fa 04             	sar    $0x4,%edx
 8048c48:	89 c8                	mov    %ecx,%eax
 8048c4a:	c1 f8 1f             	sar    $0x1f,%eax
 8048c4d:	29 c2                	sub    %eax,%edx
 8048c4f:	89 d0                	mov    %edx,%eax
 8048c51:	6b c0 26             	imul   $0x26,%eax,%eax
 8048c54:	29 c1                	sub    %eax,%ecx
 8048c56:	89 c8                	mov    %ecx,%eax
 8048c58:	83 c0 01             	add    $0x1,%eax
 8048c5b:	c1 e0 03             	shl    $0x3,%eax
 8048c5e:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048c61:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c66:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048c6d:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c72:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048c79:	83 c4 24             	add    $0x24,%esp
 8048c7c:	5b                   	pop    %ebx
 8048c7d:	5d                   	pop    %ebp
 8048c7e:	c3                   	ret    

08048c7f <update_stone_pos>:

void update_stone_pos(void) {
 8048c7f:	55                   	push   %ebp
 8048c80:	89 e5                	mov    %esp,%ebp
 8048c82:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048c85:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048c8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048c8d:	eb 6f                	jmp    8048cfe <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048c8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c92:	89 04 24             	mov    %eax,(%esp)
 8048c95:	e8 fe fc ff ff       	call   8048998 <st_next>
 8048c9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048c9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ca0:	8b 10                	mov    (%eax),%edx
 8048ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ca5:	8b 40 0c             	mov    0xc(%eax),%eax
 8048ca8:	01 c2                	add    %eax,%edx
 8048caa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cad:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048caf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cb2:	8b 10                	mov    (%eax),%edx
 8048cb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cb7:	8b 40 08             	mov    0x8(%eax),%eax
 8048cba:	01 d0                	add    %edx,%eax
 8048cbc:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048cc1:	7e 35                	jle    8048cf8 <update_stone_pos+0x79>
			miss++; 
 8048cc3:	a1 e4 5d 08 08       	mov    0x8085de4,%eax
 8048cc8:	83 c0 01             	add    $0x1,%eax
 8048ccb:	a3 e4 5d 08 08       	mov    %eax,0x8085de4
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cd3:	89 04 24             	mov    %eax,(%esp)
 8048cd6:	e8 5d fd ff ff       	call   8048a38 <st_remove>
			if (it == head) head = next; 
 8048cdb:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048ce0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048ce3:	75 08                	jne    8048ced <update_stone_pos+0x6e>
 8048ce5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ce8:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048ced:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cf0:	89 04 24             	mov    %eax,(%esp)
 8048cf3:	e8 a2 fd ff ff       	call   8048a9a <st_free>
		}
		it = next;
 8048cf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048cfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048cfe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048d02:	75 8b                	jne    8048c8f <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048d04:	c9                   	leave  
 8048d05:	c3                   	ret    

08048d06 <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048d06:	55                   	push   %ebp
 8048d07:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048d09:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d0c:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048d0f:	7f 29                	jg     8048d3a <inplane+0x34>
 8048d11:	8b 55 10             	mov    0x10(%ebp),%edx
 8048d14:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d17:	01 d0                	add    %edx,%eax
 8048d19:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048d1c:	7c 1c                	jl     8048d3a <inplane+0x34>
 8048d1e:	8b 45 14             	mov    0x14(%ebp),%eax
 8048d21:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048d24:	7f 14                	jg     8048d3a <inplane+0x34>
 8048d26:	8b 55 14             	mov    0x14(%ebp),%edx
 8048d29:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d2c:	01 d0                	add    %edx,%eax
 8048d2e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048d31:	7c 07                	jl     8048d3a <inplane+0x34>
 8048d33:	b8 01 00 00 00       	mov    $0x1,%eax
 8048d38:	eb 05                	jmp    8048d3f <inplane+0x39>
 8048d3a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048d3f:	5d                   	pop    %ebp
 8048d40:	c3                   	ret    

08048d41 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048d41:	55                   	push   %ebp
 8048d42:	89 e5                	mov    %esp,%ebp
 8048d44:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048d47:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d4a:	8b 00                	mov    (%eax),%eax
 8048d4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048d4f:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d52:	8b 40 04             	mov    0x4(%eax),%eax
 8048d55:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048d58:	8b 45 18             	mov    0x18(%ebp),%eax
 8048d5b:	8b 40 08             	mov    0x8(%eax),%eax
 8048d5e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048d61:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d64:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048d67:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048d6d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d70:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048d73:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048d76:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d79:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048d7c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048d80:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048d83:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048d87:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048d8a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048d8e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048d92:	89 04 24             	mov    %eax,(%esp)
 8048d95:	e8 6c ff ff ff       	call   8048d06 <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048d9a:	85 c0                	test   %eax,%eax
 8048d9c:	0f 85 69 01 00 00    	jne    8048f0b <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048da2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048da5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048da8:	8b 55 10             	mov    0x10(%ebp),%edx
 8048dab:	01 d1                	add    %edx,%ecx
 8048dad:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048db0:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048db4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048db7:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048dbb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048dbe:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048dc2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048dc6:	89 0c 24             	mov    %ecx,(%esp)
 8048dc9:	e8 38 ff ff ff       	call   8048d06 <inplane>
 8048dce:	85 c0                	test   %eax,%eax
 8048dd0:	0f 85 35 01 00 00    	jne    8048f0b <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048dd6:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048dd9:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ddc:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048ddf:	8b 45 08             	mov    0x8(%ebp),%eax
 8048de2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048de5:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048de9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048dec:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048df0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048df3:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048df7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048dfb:	89 04 24             	mov    %eax,(%esp)
 8048dfe:	e8 03 ff ff ff       	call   8048d06 <inplane>
 8048e03:	85 c0                	test   %eax,%eax
 8048e05:	0f 85 00 01 00 00    	jne    8048f0b <bang_or_not+0x1ca>
 8048e0b:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e0e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e11:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048e14:	8b 55 08             	mov    0x8(%ebp),%edx
 8048e17:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e1a:	01 c2                	add    %eax,%edx
 8048e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e1f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048e23:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e26:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e2d:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048e31:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048e35:	89 14 24             	mov    %edx,(%esp)
 8048e38:	e8 c9 fe ff ff       	call   8048d06 <inplane>
 8048e3d:	85 c0                	test   %eax,%eax
 8048e3f:	0f 85 c6 00 00 00    	jne    8048f0b <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048e45:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e4b:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048e4e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048e52:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048e55:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048e59:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048e5c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048e60:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048e64:	89 04 24             	mov    %eax,(%esp)
 8048e67:	e8 9a fe ff ff       	call   8048d06 <inplane>
 8048e6c:	85 c0                	test   %eax,%eax
 8048e6e:	0f 85 97 00 00 00    	jne    8048f0b <bang_or_not+0x1ca>
 8048e74:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e77:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048e7a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048e7d:	01 d1                	add    %edx,%ecx
 8048e7f:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048e82:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048e86:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048e89:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048e8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048e90:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048e94:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048e98:	89 0c 24             	mov    %ecx,(%esp)
 8048e9b:	e8 66 fe ff ff       	call   8048d06 <inplane>
 8048ea0:	85 c0                	test   %eax,%eax
 8048ea2:	75 67                	jne    8048f0b <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048ea4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048ea7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048eaa:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048ead:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048eb0:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048eb3:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048eb7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048eba:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048ebe:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048ec1:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048ec5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048ec9:	89 04 24             	mov    %eax,(%esp)
 8048ecc:	e8 35 fe ff ff       	call   8048d06 <inplane>
 8048ed1:	85 c0                	test   %eax,%eax
 8048ed3:	75 36                	jne    8048f0b <bang_or_not+0x1ca>
 8048ed5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048ed8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048edb:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048ede:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048ee1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ee4:	01 c2                	add    %eax,%edx
 8048ee6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048ee9:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048eed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048ef0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048ef4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ef7:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048efb:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048eff:	89 14 24             	mov    %edx,(%esp)
 8048f02:	e8 ff fd ff ff       	call   8048d06 <inplane>
 8048f07:	85 c0                	test   %eax,%eax
 8048f09:	74 07                	je     8048f12 <bang_or_not+0x1d1>
 8048f0b:	b8 01 00 00 00       	mov    $0x1,%eax
 8048f10:	eb 05                	jmp    8048f17 <bang_or_not+0x1d6>
 8048f12:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048f17:	c9                   	leave  
 8048f18:	c3                   	ret    

08048f19 <update_bang>:

void update_bang(void) {
 8048f19:	55                   	push   %ebp
 8048f1a:	89 e5                	mov    %esp,%ebp
 8048f1c:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048f1f:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048f24:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048f27:	eb 7c                	jmp    8048fa5 <update_bang+0x8c>
		st_t next=st_next(it);
 8048f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f2c:	89 04 24             	mov    %eax,(%esp)
 8048f2f:	e8 64 fa ff ff       	call   8048998 <st_next>
 8048f34:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048f37:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f3a:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048f3e:	a1 40 5c 09 08       	mov    0x8095c40,%eax
 8048f43:	89 04 24             	mov    %eax,(%esp)
 8048f46:	a1 44 5c 09 08       	mov    0x8095c44,%eax
 8048f4b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f4f:	a1 48 5c 09 08       	mov    0x8095c48,%eax
 8048f54:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f58:	a1 4c 5c 09 08       	mov    0x8095c4c,%eax
 8048f5d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f61:	e8 db fd ff ff       	call   8048d41 <bang_or_not>
 8048f66:	85 c0                	test   %eax,%eax
 8048f68:	74 35                	je     8048f9f <update_bang+0x86>
			score++;
 8048f6a:	a1 e0 5d 08 08       	mov    0x8085de0,%eax
 8048f6f:	83 c0 01             	add    $0x1,%eax
 8048f72:	a3 e0 5d 08 08       	mov    %eax,0x8085de0
			st_remove(it);
 8048f77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f7a:	89 04 24             	mov    %eax,(%esp)
 8048f7d:	e8 b6 fa ff ff       	call   8048a38 <st_remove>
			if(it==head)
 8048f82:	a1 dc 5d 08 08       	mov    0x8085ddc,%eax
 8048f87:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048f8a:	75 08                	jne    8048f94 <update_bang+0x7b>
				head=next;
 8048f8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f8f:	a3 dc 5d 08 08       	mov    %eax,0x8085ddc
			st_free(it);
 8048f94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f97:	89 04 24             	mov    %eax,(%esp)
 8048f9a:	e8 fb fa ff ff       	call   8048a9a <st_free>
		}
		it=next;
 8048f9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048fa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048fa5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048fa9:	0f 85 7a ff ff ff    	jne    8048f29 <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8048faf:	c9                   	leave  
 8048fb0:	c3                   	ret    

08048fb1 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8048fb1:	55                   	push   %ebp
 8048fb2:	89 e5                	mov    %esp,%ebp
 8048fb4:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8048fb7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048fbb:	78 18                	js     8048fd5 <draw_pixel+0x24>
 8048fbd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048fc1:	78 12                	js     8048fd5 <draw_pixel+0x24>
 8048fc3:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 8048fca:	7f 09                	jg     8048fd5 <draw_pixel+0x24>
 8048fcc:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8048fd3:	7e 24                	jle    8048ff9 <draw_pixel+0x48>
 8048fd5:	c7 44 24 0c 44 a2 04 	movl   $0x804a244,0xc(%esp)
 8048fdc:	08 
 8048fdd:	c7 44 24 08 78 a2 04 	movl   $0x804a278,0x8(%esp)
 8048fe4:	08 
 8048fe5:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
 8048fec:	00 
 8048fed:	c7 04 24 8d a2 04 08 	movl   $0x804a28d,(%esp)
 8048ff4:	e8 84 f2 ff ff       	call   804827d <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 8048ff9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ffc:	c1 e0 08             	shl    $0x8,%eax
 8048fff:	89 c2                	mov    %eax,%edx
 8049001:	8b 45 08             	mov    0x8(%ebp),%eax
 8049004:	c1 e0 06             	shl    $0x6,%eax
 8049007:	01 c2                	add    %eax,%edx
 8049009:	8b 45 0c             	mov    0xc(%ebp),%eax
 804900c:	01 c2                	add    %eax,%edx
 804900e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049011:	88 82 00 5e 08 08    	mov    %al,0x8085e00(%edx)
}
 8049017:	c9                   	leave  
 8049018:	c3                   	ret    

08049019 <sysclean>:


void sysclean(void)
{
 8049019:	55                   	push   %ebp
 804901a:	89 e5                	mov    %esp,%ebp
 804901c:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
 804901f:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 8049026:	00 
 8049027:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804902e:	00 
 804902f:	c7 04 24 00 5e 08 08 	movl   $0x8085e00,(%esp)
 8049036:	e8 b9 02 00 00       	call   80492f4 <memset>
}
 804903b:	c9                   	leave  
 804903c:	c3                   	ret    

0804903d <syspr>:
int syspr()
{
 804903d:	55                   	push   %ebp
 804903e:	89 e5                	mov    %esp,%ebp
 8049040:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
 8049043:	c7 44 24 04 00 5e 08 	movl   $0x8085e00,0x4(%esp)
 804904a:	08 
 804904b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049052:	e8 53 01 00 00       	call   80491aa <syscall>
}
 8049057:	c9                   	leave  
 8049058:	c3                   	ret    

08049059 <systime>:

int systime(void)
{
 8049059:	55                   	push   %ebp
 804905a:	89 e5                	mov    %esp,%ebp
 804905c:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
 804905f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049066:	e8 3f 01 00 00       	call   80491aa <syscall>
}
 804906b:	c9                   	leave  
 804906c:	c3                   	ret    

0804906d <sysreadkey>:

int sysreadkey(void)
{
 804906d:	55                   	push   %ebp
 804906e:	89 e5                	mov    %esp,%ebp
 8049070:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
 8049073:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 804907a:	e8 2b 01 00 00       	call   80491aa <syscall>
}
 804907f:	c9                   	leave  
 8049080:	c3                   	ret    

08049081 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8049081:	55                   	push   %ebp
 8049082:	89 e5                	mov    %esp,%ebp
 8049084:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
 8049087:	8b 45 10             	mov    0x10(%ebp),%eax
 804908a:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804908e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049091:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049095:	8b 45 08             	mov    0x8(%ebp),%eax
 8049098:	89 44 24 04          	mov    %eax,0x4(%esp)
 804909c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 80490a3:	e8 02 01 00 00       	call   80491aa <syscall>
}
 80490a8:	c9                   	leave  
 80490a9:	c3                   	ret    

080490aa <fork>:

int fork(void)
{
 80490aa:	55                   	push   %ebp
 80490ab:	89 e5                	mov    %esp,%ebp
 80490ad:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
 80490b0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 80490b7:	e8 ee 00 00 00       	call   80491aa <syscall>
}
 80490bc:	c9                   	leave  
 80490bd:	c3                   	ret    

080490be <getpid>:

int getpid(void)
{
 80490be:	55                   	push   %ebp
 80490bf:	89 e5                	mov    %esp,%ebp
 80490c1:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
 80490c4:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
 80490cb:	e8 da 00 00 00       	call   80491aa <syscall>
}
 80490d0:	c9                   	leave  
 80490d1:	c3                   	ret    

080490d2 <exit>:

void exit(void)
{
 80490d2:	55                   	push   %ebp
 80490d3:	89 e5                	mov    %esp,%ebp
 80490d5:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit);
 80490d8:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 80490df:	e8 c6 00 00 00       	call   80491aa <syscall>
}
 80490e4:	c9                   	leave  
 80490e5:	c3                   	ret    

080490e6 <sleep>:

void sleep(int sec)
{
 80490e6:	55                   	push   %ebp
 80490e7:	89 e5                	mov    %esp,%ebp
 80490e9:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
 80490ec:	8b 45 08             	mov    0x8(%ebp),%eax
 80490ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490f3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80490fa:	e8 ab 00 00 00       	call   80491aa <syscall>
	//printf("qweqwe");
}
 80490ff:	c9                   	leave  
 8049100:	c3                   	ret    

08049101 <thread>:

int thread(void *addr)
{
 8049101:	55                   	push   %ebp
 8049102:	89 e5                	mov    %esp,%ebp
 8049104:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
 8049107:	8b 45 08             	mov    0x8(%ebp),%eax
 804910a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804910e:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 8049115:	e8 90 00 00 00       	call   80491aa <syscall>
}
 804911a:	c9                   	leave  
 804911b:	c3                   	ret    

0804911c <sem_init>:

int sem_init(Sema *sema,int value)
{
 804911c:	55                   	push   %ebp
 804911d:	89 e5                	mov    %esp,%ebp
 804911f:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema,value);
 8049122:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049125:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049129:	8b 45 08             	mov    0x8(%ebp),%eax
 804912c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049130:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 8049137:	e8 6e 00 00 00       	call   80491aa <syscall>
}
 804913c:	c9                   	leave  
 804913d:	c3                   	ret    

0804913e <sem_destroy>:

int sem_destroy(Sema *sema)
{
 804913e:	55                   	push   %ebp
 804913f:	89 e5                	mov    %esp,%ebp
 8049141:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
 8049144:	8b 45 08             	mov    0x8(%ebp),%eax
 8049147:	89 44 24 04          	mov    %eax,0x4(%esp)
 804914b:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 8049152:	e8 53 00 00 00       	call   80491aa <syscall>
}
 8049157:	c9                   	leave  
 8049158:	c3                   	ret    

08049159 <sem_wait>:

int sem_wait(Sema *sema)
{
 8049159:	55                   	push   %ebp
 804915a:	89 e5                	mov    %esp,%ebp
 804915c:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
 804915f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049162:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049166:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 804916d:	e8 38 00 00 00       	call   80491aa <syscall>
}
 8049172:	c9                   	leave  
 8049173:	c3                   	ret    

08049174 <sem_trywait>:

int sem_trywait(Sema *sema)
{
 8049174:	55                   	push   %ebp
 8049175:	89 e5                	mov    %esp,%ebp
 8049177:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
 804917a:	8b 45 08             	mov    0x8(%ebp),%eax
 804917d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049181:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 8049188:	e8 1d 00 00 00       	call   80491aa <syscall>
}
 804918d:	c9                   	leave  
 804918e:	c3                   	ret    

0804918f <sem_post>:

int sem_post(Sema *sema)
{
 804918f:	55                   	push   %ebp
 8049190:	89 e5                	mov    %esp,%ebp
 8049192:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
 8049195:	8b 45 08             	mov    0x8(%ebp),%eax
 8049198:	89 44 24 04          	mov    %eax,0x4(%esp)
 804919c:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 80491a3:	e8 02 00 00 00       	call   80491aa <syscall>
}
 80491a8:	c9                   	leave  
 80491a9:	c3                   	ret    

080491aa <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 80491aa:	55                   	push   %ebp
 80491ab:	89 e5                	mov    %esp,%ebp
 80491ad:	53                   	push   %ebx
 80491ae:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 80491b1:	8d 45 08             	lea    0x8(%ebp),%eax
 80491b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 80491b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80491ba:	8b 00                	mov    (%eax),%eax
 80491bc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80491bf:	83 c2 04             	add    $0x4,%edx
 80491c2:	8b 1a                	mov    (%edx),%ebx
 80491c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80491c7:	83 c2 08             	add    $0x8,%edx
 80491ca:	8b 0a                	mov    (%edx),%ecx
 80491cc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80491cf:	83 c2 0c             	add    $0xc,%edx
 80491d2:	8b 12                	mov    (%edx),%edx
 80491d4:	cd 80                	int    $0x80
 80491d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 80491d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80491dc:	83 c4 10             	add    $0x10,%esp
 80491df:	5b                   	pop    %ebx
 80491e0:	5d                   	pop    %ebp
 80491e1:	c3                   	ret    

080491e2 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 80491e2:	55                   	push   %ebp
 80491e3:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 80491e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491e8:	8b 00                	mov    (%eax),%eax
 80491ea:	8d 48 01             	lea    0x1(%eax),%ecx
 80491ed:	8b 55 0c             	mov    0xc(%ebp),%edx
 80491f0:	89 0a                	mov    %ecx,(%edx)
 80491f2:	8b 55 08             	mov    0x8(%ebp),%edx
 80491f5:	88 90 00 58 09 08    	mov    %dl,0x8095800(%eax)
}
 80491fb:	5d                   	pop    %ebp
 80491fc:	c3                   	ret    

080491fd <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 80491fd:	55                   	push   %ebp
 80491fe:	89 e5                	mov    %esp,%ebp
 8049200:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 8049203:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 804920a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804920d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049211:	8b 45 08             	mov    0x8(%ebp),%eax
 8049214:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049218:	8d 45 f4             	lea    -0xc(%ebp),%eax
 804921b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804921f:	c7 04 24 e2 91 04 08 	movl   $0x80491e2,(%esp)
 8049226:	e8 d1 06 00 00       	call   80498fc <vprintfmt>
	return cnt;
 804922b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804922e:	c9                   	leave  
 804922f:	c3                   	ret    

08049230 <printf>:
int printf(const char *fmt, ...)
{
 8049230:	55                   	push   %ebp
 8049231:	89 e5                	mov    %esp,%ebp
 8049233:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 8049236:	8d 45 0c             	lea    0xc(%ebp),%eax
 8049239:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 804923c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804923f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049243:	8b 45 08             	mov    0x8(%ebp),%eax
 8049246:	89 04 24             	mov    %eax,(%esp)
 8049249:	e8 af ff ff ff       	call   80491fd <vprintf>
 804924e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 8049251:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049254:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049258:	c7 44 24 04 00 58 09 	movl   $0x8095800,0x4(%esp)
 804925f:	08 
 8049260:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049267:	e8 15 fe ff ff       	call   8049081 <syswrite>
	return cnt;
 804926c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804926f:	c9                   	leave  
 8049270:	c3                   	ret    

08049271 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 8049271:	55                   	push   %ebp
 8049272:	89 e5                	mov    %esp,%ebp
 8049274:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 8049277:	c7 45 fc 05 5c 09 08 	movl   $0x8095c05,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 804927e:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049282:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049285:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804928a:	89 c8                	mov    %ecx,%eax
 804928c:	f7 ea                	imul   %edx
 804928e:	c1 fa 02             	sar    $0x2,%edx
 8049291:	89 c8                	mov    %ecx,%eax
 8049293:	c1 f8 1f             	sar    $0x1f,%eax
 8049296:	29 c2                	sub    %eax,%edx
 8049298:	89 d0                	mov    %edx,%eax
 804929a:	c1 e0 02             	shl    $0x2,%eax
 804929d:	01 d0                	add    %edx,%eax
 804929f:	01 c0                	add    %eax,%eax
 80492a1:	29 c1                	sub    %eax,%ecx
 80492a3:	89 ca                	mov    %ecx,%edx
 80492a5:	89 d0                	mov    %edx,%eax
 80492a7:	83 c0 30             	add    $0x30,%eax
 80492aa:	89 c2                	mov    %eax,%edx
 80492ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492af:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 80492b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80492b4:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80492b9:	89 c8                	mov    %ecx,%eax
 80492bb:	f7 ea                	imul   %edx
 80492bd:	c1 fa 02             	sar    $0x2,%edx
 80492c0:	89 c8                	mov    %ecx,%eax
 80492c2:	c1 f8 1f             	sar    $0x1f,%eax
 80492c5:	29 c2                	sub    %eax,%edx
 80492c7:	89 d0                	mov    %edx,%eax
 80492c9:	89 45 08             	mov    %eax,0x8(%ebp)
 80492cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80492d0:	75 ac                	jne    804927e <itoa+0xd>
	return p;
 80492d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80492d5:	c9                   	leave  
 80492d6:	c3                   	ret    

080492d7 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 80492d7:	55                   	push   %ebp
 80492d8:	89 e5                	mov    %esp,%ebp
 80492da:	57                   	push   %edi
 80492db:	56                   	push   %esi
 80492dc:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 80492dd:	8b 45 10             	mov    0x10(%ebp),%eax
 80492e0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80492e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80492e6:	89 c1                	mov    %eax,%ecx
 80492e8:	89 d6                	mov    %edx,%esi
 80492ea:	89 df                	mov    %ebx,%edi
 80492ec:	fc                   	cld    
 80492ed:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 80492ef:	5b                   	pop    %ebx
 80492f0:	5e                   	pop    %esi
 80492f1:	5f                   	pop    %edi
 80492f2:	5d                   	pop    %ebp
 80492f3:	c3                   	ret    

080492f4 <memset>:

void memset(void *dest, int data, size_t size) {
 80492f4:	55                   	push   %ebp
 80492f5:	89 e5                	mov    %esp,%ebp
 80492f7:	57                   	push   %edi
 80492f8:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 80492f9:	8b 55 10             	mov    0x10(%ebp),%edx
 80492fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049302:	89 d1                	mov    %edx,%ecx
 8049304:	89 df                	mov    %ebx,%edi
 8049306:	fc                   	cld    
 8049307:	f3 aa                	rep stos %al,%es:(%edi)
}
 8049309:	5b                   	pop    %ebx
 804930a:	5f                   	pop    %edi
 804930b:	5d                   	pop    %ebp
 804930c:	c3                   	ret    

0804930d <strlen>:

size_t strlen(const char *str) {
 804930d:	55                   	push   %ebp
 804930e:	89 e5                	mov    %esp,%ebp
 8049310:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 8049313:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 804931a:	eb 04                	jmp    8049320 <strlen+0x13>
 804931c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049320:	8b 45 08             	mov    0x8(%ebp),%eax
 8049323:	8d 50 01             	lea    0x1(%eax),%edx
 8049326:	89 55 08             	mov    %edx,0x8(%ebp)
 8049329:	0f b6 00             	movzbl (%eax),%eax
 804932c:	84 c0                	test   %al,%al
 804932e:	75 ec                	jne    804931c <strlen+0xf>
	return len;
 8049330:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049333:	c9                   	leave  
 8049334:	c3                   	ret    

08049335 <strcpy>:

void strcpy(char *d, const char *s) {
 8049335:	55                   	push   %ebp
 8049336:	89 e5                	mov    %esp,%ebp
 8049338:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 804933b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804933e:	89 04 24             	mov    %eax,(%esp)
 8049341:	e8 c7 ff ff ff       	call   804930d <strlen>
 8049346:	83 c0 01             	add    $0x1,%eax
 8049349:	89 44 24 08          	mov    %eax,0x8(%esp)
 804934d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049350:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049354:	8b 45 08             	mov    0x8(%ebp),%eax
 8049357:	89 04 24             	mov    %eax,(%esp)
 804935a:	e8 78 ff ff ff       	call   80492d7 <memcpy>
}
 804935f:	c9                   	leave  
 8049360:	c3                   	ret    

08049361 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 8049361:	55                   	push   %ebp
 8049362:	89 e5                	mov    %esp,%ebp
 8049364:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049367:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804936e:	eb 0c                	jmp    804937c <strnlen+0x1b>
		n++;
 8049370:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 8049374:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049378:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 804937c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049380:	74 0a                	je     804938c <strnlen+0x2b>
 8049382:	8b 45 08             	mov    0x8(%ebp),%eax
 8049385:	0f b6 00             	movzbl (%eax),%eax
 8049388:	84 c0                	test   %al,%al
 804938a:	75 e4                	jne    8049370 <strnlen+0xf>
		n++;
	return n;
 804938c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 804938f:	c9                   	leave  
 8049390:	c3                   	ret    

08049391 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 8049391:	55                   	push   %ebp
 8049392:	89 e5                	mov    %esp,%ebp
 8049394:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 8049397:	8b 45 08             	mov    0x8(%ebp),%eax
 804939a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 804939d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80493a4:	eb 23                	jmp    80493c9 <strncpy+0x38>
		*dst++ = *src;
 80493a6:	8b 45 08             	mov    0x8(%ebp),%eax
 80493a9:	8d 50 01             	lea    0x1(%eax),%edx
 80493ac:	89 55 08             	mov    %edx,0x8(%ebp)
 80493af:	8b 55 0c             	mov    0xc(%ebp),%edx
 80493b2:	0f b6 12             	movzbl (%edx),%edx
 80493b5:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 80493b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493ba:	0f b6 00             	movzbl (%eax),%eax
 80493bd:	84 c0                	test   %al,%al
 80493bf:	74 04                	je     80493c5 <strncpy+0x34>
			src++;
 80493c1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 80493c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80493c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80493cc:	3b 45 10             	cmp    0x10(%ebp),%eax
 80493cf:	72 d5                	jb     80493a6 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 80493d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 80493d4:	c9                   	leave  
 80493d5:	c3                   	ret    

080493d6 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 80493d6:	55                   	push   %ebp
 80493d7:	89 e5                	mov    %esp,%ebp
 80493d9:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 80493dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80493df:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 80493e2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80493e6:	74 33                	je     804941b <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 80493e8:	eb 17                	jmp    8049401 <strlcpy+0x2b>
			*dst++ = *src++;
 80493ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80493ed:	8d 50 01             	lea    0x1(%eax),%edx
 80493f0:	89 55 08             	mov    %edx,0x8(%ebp)
 80493f3:	8b 55 0c             	mov    0xc(%ebp),%edx
 80493f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 80493f9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80493fc:	0f b6 12             	movzbl (%edx),%edx
 80493ff:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 8049401:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049405:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049409:	74 0a                	je     8049415 <strlcpy+0x3f>
 804940b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804940e:	0f b6 00             	movzbl (%eax),%eax
 8049411:	84 c0                	test   %al,%al
 8049413:	75 d5                	jne    80493ea <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 8049415:	8b 45 08             	mov    0x8(%ebp),%eax
 8049418:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 804941b:	8b 55 08             	mov    0x8(%ebp),%edx
 804941e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049421:	29 c2                	sub    %eax,%edx
 8049423:	89 d0                	mov    %edx,%eax
}
 8049425:	c9                   	leave  
 8049426:	c3                   	ret    

08049427 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 8049427:	55                   	push   %ebp
 8049428:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 804942a:	eb 08                	jmp    8049434 <strcmp+0xd>
		p++, q++;
 804942c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049430:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 8049434:	8b 45 08             	mov    0x8(%ebp),%eax
 8049437:	0f b6 00             	movzbl (%eax),%eax
 804943a:	84 c0                	test   %al,%al
 804943c:	74 10                	je     804944e <strcmp+0x27>
 804943e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049441:	0f b6 10             	movzbl (%eax),%edx
 8049444:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049447:	0f b6 00             	movzbl (%eax),%eax
 804944a:	38 c2                	cmp    %al,%dl
 804944c:	74 de                	je     804942c <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 804944e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049451:	0f b6 00             	movzbl (%eax),%eax
 8049454:	0f b6 d0             	movzbl %al,%edx
 8049457:	8b 45 0c             	mov    0xc(%ebp),%eax
 804945a:	0f b6 00             	movzbl (%eax),%eax
 804945d:	0f b6 c0             	movzbl %al,%eax
 8049460:	29 c2                	sub    %eax,%edx
 8049462:	89 d0                	mov    %edx,%eax
}
 8049464:	5d                   	pop    %ebp
 8049465:	c3                   	ret    

08049466 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 8049466:	55                   	push   %ebp
 8049467:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 8049469:	eb 0c                	jmp    8049477 <strncmp+0x11>
		n--, p++, q++;
 804946b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 804946f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049473:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 8049477:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804947b:	74 1a                	je     8049497 <strncmp+0x31>
 804947d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049480:	0f b6 00             	movzbl (%eax),%eax
 8049483:	84 c0                	test   %al,%al
 8049485:	74 10                	je     8049497 <strncmp+0x31>
 8049487:	8b 45 08             	mov    0x8(%ebp),%eax
 804948a:	0f b6 10             	movzbl (%eax),%edx
 804948d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049490:	0f b6 00             	movzbl (%eax),%eax
 8049493:	38 c2                	cmp    %al,%dl
 8049495:	74 d4                	je     804946b <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 8049497:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804949b:	75 07                	jne    80494a4 <strncmp+0x3e>
		return 0;
 804949d:	b8 00 00 00 00       	mov    $0x0,%eax
 80494a2:	eb 16                	jmp    80494ba <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 80494a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80494a7:	0f b6 00             	movzbl (%eax),%eax
 80494aa:	0f b6 d0             	movzbl %al,%edx
 80494ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494b0:	0f b6 00             	movzbl (%eax),%eax
 80494b3:	0f b6 c0             	movzbl %al,%eax
 80494b6:	29 c2                	sub    %eax,%edx
 80494b8:	89 d0                	mov    %edx,%eax
}
 80494ba:	5d                   	pop    %ebp
 80494bb:	c3                   	ret    

080494bc <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 80494bc:	55                   	push   %ebp
 80494bd:	89 e5                	mov    %esp,%ebp
 80494bf:	83 ec 04             	sub    $0x4,%esp
 80494c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494c5:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80494c8:	eb 14                	jmp    80494de <strchr+0x22>
		if (*s == c)
 80494ca:	8b 45 08             	mov    0x8(%ebp),%eax
 80494cd:	0f b6 00             	movzbl (%eax),%eax
 80494d0:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80494d3:	75 05                	jne    80494da <strchr+0x1e>
			return (char *) s;
 80494d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80494d8:	eb 13                	jmp    80494ed <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 80494da:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80494de:	8b 45 08             	mov    0x8(%ebp),%eax
 80494e1:	0f b6 00             	movzbl (%eax),%eax
 80494e4:	84 c0                	test   %al,%al
 80494e6:	75 e2                	jne    80494ca <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 80494e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80494ed:	c9                   	leave  
 80494ee:	c3                   	ret    

080494ef <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 80494ef:	55                   	push   %ebp
 80494f0:	89 e5                	mov    %esp,%ebp
 80494f2:	83 ec 04             	sub    $0x4,%esp
 80494f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494f8:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80494fb:	eb 11                	jmp    804950e <strfind+0x1f>
		if (*s == c)
 80494fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049500:	0f b6 00             	movzbl (%eax),%eax
 8049503:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049506:	75 02                	jne    804950a <strfind+0x1b>
			break;
 8049508:	eb 0e                	jmp    8049518 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 804950a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804950e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049511:	0f b6 00             	movzbl (%eax),%eax
 8049514:	84 c0                	test   %al,%al
 8049516:	75 e5                	jne    80494fd <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 8049518:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804951b:	c9                   	leave  
 804951c:	c3                   	ret    

0804951d <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 804951d:	55                   	push   %ebp
 804951e:	89 e5                	mov    %esp,%ebp
 8049520:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 8049523:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049526:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 8049529:	8b 45 08             	mov    0x8(%ebp),%eax
 804952c:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 804952f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049532:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049535:	73 3d                	jae    8049574 <memmove+0x57>
 8049537:	8b 45 10             	mov    0x10(%ebp),%eax
 804953a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804953d:	01 d0                	add    %edx,%eax
 804953f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8049542:	76 30                	jbe    8049574 <memmove+0x57>
		s += n;
 8049544:	8b 45 10             	mov    0x10(%ebp),%eax
 8049547:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 804954a:	8b 45 10             	mov    0x10(%ebp),%eax
 804954d:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 8049550:	eb 13                	jmp    8049565 <memmove+0x48>
			*--d = *--s;
 8049552:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 8049556:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 804955a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804955d:	0f b6 10             	movzbl (%eax),%edx
 8049560:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049563:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 8049565:	8b 45 10             	mov    0x10(%ebp),%eax
 8049568:	8d 50 ff             	lea    -0x1(%eax),%edx
 804956b:	89 55 10             	mov    %edx,0x10(%ebp)
 804956e:	85 c0                	test   %eax,%eax
 8049570:	75 e0                	jne    8049552 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 8049572:	eb 26                	jmp    804959a <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049574:	eb 17                	jmp    804958d <memmove+0x70>
			*d++ = *s++;
 8049576:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049579:	8d 50 01             	lea    0x1(%eax),%edx
 804957c:	89 55 f8             	mov    %edx,-0x8(%ebp)
 804957f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049582:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049585:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 8049588:	0f b6 12             	movzbl (%edx),%edx
 804958b:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 804958d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049590:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049593:	89 55 10             	mov    %edx,0x10(%ebp)
 8049596:	85 c0                	test   %eax,%eax
 8049598:	75 dc                	jne    8049576 <memmove+0x59>
			*d++ = *s++;

	return dst;
 804959a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804959d:	c9                   	leave  
 804959e:	c3                   	ret    

0804959f <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 804959f:	55                   	push   %ebp
 80495a0:	89 e5                	mov    %esp,%ebp
 80495a2:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 80495a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80495a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 80495ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495ae:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 80495b1:	eb 30                	jmp    80495e3 <memcmp+0x44>
		if (*s1 != *s2)
 80495b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80495b6:	0f b6 10             	movzbl (%eax),%edx
 80495b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80495bc:	0f b6 00             	movzbl (%eax),%eax
 80495bf:	38 c2                	cmp    %al,%dl
 80495c1:	74 18                	je     80495db <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 80495c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80495c6:	0f b6 00             	movzbl (%eax),%eax
 80495c9:	0f b6 d0             	movzbl %al,%edx
 80495cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80495cf:	0f b6 00             	movzbl (%eax),%eax
 80495d2:	0f b6 c0             	movzbl %al,%eax
 80495d5:	29 c2                	sub    %eax,%edx
 80495d7:	89 d0                	mov    %edx,%eax
 80495d9:	eb 1a                	jmp    80495f5 <memcmp+0x56>
		s1++, s2++;
 80495db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80495df:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 80495e3:	8b 45 10             	mov    0x10(%ebp),%eax
 80495e6:	8d 50 ff             	lea    -0x1(%eax),%edx
 80495e9:	89 55 10             	mov    %edx,0x10(%ebp)
 80495ec:	85 c0                	test   %eax,%eax
 80495ee:	75 c3                	jne    80495b3 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 80495f0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80495f5:	c9                   	leave  
 80495f6:	c3                   	ret    

080495f7 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 80495f7:	55                   	push   %ebp
 80495f8:	89 e5                	mov    %esp,%ebp
 80495fa:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 80495fd:	8b 45 10             	mov    0x10(%ebp),%eax
 8049600:	8b 55 08             	mov    0x8(%ebp),%edx
 8049603:	01 d0                	add    %edx,%eax
 8049605:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 8049608:	eb 13                	jmp    804961d <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 804960a:	8b 45 08             	mov    0x8(%ebp),%eax
 804960d:	0f b6 10             	movzbl (%eax),%edx
 8049610:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049613:	38 c2                	cmp    %al,%dl
 8049615:	75 02                	jne    8049619 <memfind+0x22>
			break;
 8049617:	eb 0c                	jmp    8049625 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 8049619:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804961d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049620:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8049623:	72 e5                	jb     804960a <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 8049625:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049628:	c9                   	leave  
 8049629:	c3                   	ret    

0804962a <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 804962a:	55                   	push   %ebp
 804962b:	89 e5                	mov    %esp,%ebp
 804962d:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 8049630:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 8049637:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 804963e:	eb 04                	jmp    8049644 <strtol+0x1a>
		s++;
 8049640:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 8049644:	8b 45 08             	mov    0x8(%ebp),%eax
 8049647:	0f b6 00             	movzbl (%eax),%eax
 804964a:	3c 20                	cmp    $0x20,%al
 804964c:	74 f2                	je     8049640 <strtol+0x16>
 804964e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049651:	0f b6 00             	movzbl (%eax),%eax
 8049654:	3c 09                	cmp    $0x9,%al
 8049656:	74 e8                	je     8049640 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 8049658:	8b 45 08             	mov    0x8(%ebp),%eax
 804965b:	0f b6 00             	movzbl (%eax),%eax
 804965e:	3c 2b                	cmp    $0x2b,%al
 8049660:	75 06                	jne    8049668 <strtol+0x3e>
		s++;
 8049662:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049666:	eb 15                	jmp    804967d <strtol+0x53>
	else if (*s == '-')
 8049668:	8b 45 08             	mov    0x8(%ebp),%eax
 804966b:	0f b6 00             	movzbl (%eax),%eax
 804966e:	3c 2d                	cmp    $0x2d,%al
 8049670:	75 0b                	jne    804967d <strtol+0x53>
		s++, neg = 1;
 8049672:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049676:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 804967d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049681:	74 06                	je     8049689 <strtol+0x5f>
 8049683:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 8049687:	75 24                	jne    80496ad <strtol+0x83>
 8049689:	8b 45 08             	mov    0x8(%ebp),%eax
 804968c:	0f b6 00             	movzbl (%eax),%eax
 804968f:	3c 30                	cmp    $0x30,%al
 8049691:	75 1a                	jne    80496ad <strtol+0x83>
 8049693:	8b 45 08             	mov    0x8(%ebp),%eax
 8049696:	83 c0 01             	add    $0x1,%eax
 8049699:	0f b6 00             	movzbl (%eax),%eax
 804969c:	3c 78                	cmp    $0x78,%al
 804969e:	75 0d                	jne    80496ad <strtol+0x83>
		s += 2, base = 16;
 80496a0:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 80496a4:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 80496ab:	eb 2a                	jmp    80496d7 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 80496ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80496b1:	75 17                	jne    80496ca <strtol+0xa0>
 80496b3:	8b 45 08             	mov    0x8(%ebp),%eax
 80496b6:	0f b6 00             	movzbl (%eax),%eax
 80496b9:	3c 30                	cmp    $0x30,%al
 80496bb:	75 0d                	jne    80496ca <strtol+0xa0>
		s++, base = 8;
 80496bd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80496c1:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 80496c8:	eb 0d                	jmp    80496d7 <strtol+0xad>
	else if (base == 0)
 80496ca:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80496ce:	75 07                	jne    80496d7 <strtol+0xad>
		base = 10;
 80496d0:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 80496d7:	8b 45 08             	mov    0x8(%ebp),%eax
 80496da:	0f b6 00             	movzbl (%eax),%eax
 80496dd:	3c 2f                	cmp    $0x2f,%al
 80496df:	7e 1b                	jle    80496fc <strtol+0xd2>
 80496e1:	8b 45 08             	mov    0x8(%ebp),%eax
 80496e4:	0f b6 00             	movzbl (%eax),%eax
 80496e7:	3c 39                	cmp    $0x39,%al
 80496e9:	7f 11                	jg     80496fc <strtol+0xd2>
			dig = *s - '0';
 80496eb:	8b 45 08             	mov    0x8(%ebp),%eax
 80496ee:	0f b6 00             	movzbl (%eax),%eax
 80496f1:	0f be c0             	movsbl %al,%eax
 80496f4:	83 e8 30             	sub    $0x30,%eax
 80496f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80496fa:	eb 48                	jmp    8049744 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 80496fc:	8b 45 08             	mov    0x8(%ebp),%eax
 80496ff:	0f b6 00             	movzbl (%eax),%eax
 8049702:	3c 60                	cmp    $0x60,%al
 8049704:	7e 1b                	jle    8049721 <strtol+0xf7>
 8049706:	8b 45 08             	mov    0x8(%ebp),%eax
 8049709:	0f b6 00             	movzbl (%eax),%eax
 804970c:	3c 7a                	cmp    $0x7a,%al
 804970e:	7f 11                	jg     8049721 <strtol+0xf7>
			dig = *s - 'a' + 10;
 8049710:	8b 45 08             	mov    0x8(%ebp),%eax
 8049713:	0f b6 00             	movzbl (%eax),%eax
 8049716:	0f be c0             	movsbl %al,%eax
 8049719:	83 e8 57             	sub    $0x57,%eax
 804971c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804971f:	eb 23                	jmp    8049744 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 8049721:	8b 45 08             	mov    0x8(%ebp),%eax
 8049724:	0f b6 00             	movzbl (%eax),%eax
 8049727:	3c 40                	cmp    $0x40,%al
 8049729:	7e 3d                	jle    8049768 <strtol+0x13e>
 804972b:	8b 45 08             	mov    0x8(%ebp),%eax
 804972e:	0f b6 00             	movzbl (%eax),%eax
 8049731:	3c 5a                	cmp    $0x5a,%al
 8049733:	7f 33                	jg     8049768 <strtol+0x13e>
			dig = *s - 'A' + 10;
 8049735:	8b 45 08             	mov    0x8(%ebp),%eax
 8049738:	0f b6 00             	movzbl (%eax),%eax
 804973b:	0f be c0             	movsbl %al,%eax
 804973e:	83 e8 37             	sub    $0x37,%eax
 8049741:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 8049744:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049747:	3b 45 10             	cmp    0x10(%ebp),%eax
 804974a:	7c 02                	jl     804974e <strtol+0x124>
			break;
 804974c:	eb 1a                	jmp    8049768 <strtol+0x13e>
		s++, val = (val * base) + dig;
 804974e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049752:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049755:	0f af 45 10          	imul   0x10(%ebp),%eax
 8049759:	89 c2                	mov    %eax,%edx
 804975b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804975e:	01 d0                	add    %edx,%eax
 8049760:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 8049763:	e9 6f ff ff ff       	jmp    80496d7 <strtol+0xad>

	if (endptr)
 8049768:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804976c:	74 08                	je     8049776 <strtol+0x14c>
		*endptr = (char *) s;
 804976e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049771:	8b 55 08             	mov    0x8(%ebp),%edx
 8049774:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 8049776:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 804977a:	74 07                	je     8049783 <strtol+0x159>
 804977c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804977f:	f7 d8                	neg    %eax
 8049781:	eb 03                	jmp    8049786 <strtol+0x15c>
 8049783:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 8049786:	c9                   	leave  
 8049787:	c3                   	ret    

08049788 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 8049788:	55                   	push   %ebp
 8049789:	89 e5                	mov    %esp,%ebp
 804978b:	53                   	push   %ebx
 804978c:	83 ec 34             	sub    $0x34,%esp
 804978f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049792:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049795:	8b 45 14             	mov    0x14(%ebp),%eax
 8049798:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 804979b:	8b 45 18             	mov    0x18(%ebp),%eax
 804979e:	ba 00 00 00 00       	mov    $0x0,%edx
 80497a3:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80497a6:	77 72                	ja     804981a <printnum+0x92>
 80497a8:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 80497ab:	72 05                	jb     80497b2 <printnum+0x2a>
 80497ad:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 80497b0:	77 68                	ja     804981a <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 80497b2:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80497b5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 80497b8:	8b 45 18             	mov    0x18(%ebp),%eax
 80497bb:	ba 00 00 00 00       	mov    $0x0,%edx
 80497c0:	89 44 24 08          	mov    %eax,0x8(%esp)
 80497c4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80497c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80497cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80497ce:	89 04 24             	mov    %eax,(%esp)
 80497d1:	89 54 24 04          	mov    %edx,0x4(%esp)
 80497d5:	e8 56 06 00 00       	call   8049e30 <__udivdi3>
 80497da:	8b 4d 20             	mov    0x20(%ebp),%ecx
 80497dd:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 80497e1:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 80497e5:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80497e8:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 80497ec:	89 44 24 08          	mov    %eax,0x8(%esp)
 80497f0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80497f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80497f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80497fb:	8b 45 08             	mov    0x8(%ebp),%eax
 80497fe:	89 04 24             	mov    %eax,(%esp)
 8049801:	e8 82 ff ff ff       	call   8049788 <printnum>
 8049806:	eb 1c                	jmp    8049824 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 8049808:	8b 45 0c             	mov    0xc(%ebp),%eax
 804980b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804980f:	8b 45 20             	mov    0x20(%ebp),%eax
 8049812:	89 04 24             	mov    %eax,(%esp)
 8049815:	8b 45 08             	mov    0x8(%ebp),%eax
 8049818:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 804981a:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 804981e:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 8049822:	7f e4                	jg     8049808 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 8049824:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8049827:	bb 00 00 00 00       	mov    $0x0,%ebx
 804982c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804982f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049832:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049836:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804983a:	89 04 24             	mov    %eax,(%esp)
 804983d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049841:	e8 1a 07 00 00       	call   8049f60 <__umoddi3>
 8049846:	05 28 a3 04 08       	add    $0x804a328,%eax
 804984b:	0f b6 00             	movzbl (%eax),%eax
 804984e:	0f be c0             	movsbl %al,%eax
 8049851:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049854:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049858:	89 04 24             	mov    %eax,(%esp)
 804985b:	8b 45 08             	mov    0x8(%ebp),%eax
 804985e:	ff d0                	call   *%eax
}
 8049860:	83 c4 34             	add    $0x34,%esp
 8049863:	5b                   	pop    %ebx
 8049864:	5d                   	pop    %ebp
 8049865:	c3                   	ret    

08049866 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 8049866:	55                   	push   %ebp
 8049867:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 8049869:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 804986d:	7e 14                	jle    8049883 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 804986f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049872:	8b 00                	mov    (%eax),%eax
 8049874:	8d 48 08             	lea    0x8(%eax),%ecx
 8049877:	8b 55 08             	mov    0x8(%ebp),%edx
 804987a:	89 0a                	mov    %ecx,(%edx)
 804987c:	8b 50 04             	mov    0x4(%eax),%edx
 804987f:	8b 00                	mov    (%eax),%eax
 8049881:	eb 30                	jmp    80498b3 <getuint+0x4d>
	else if (lflag)
 8049883:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049887:	74 16                	je     804989f <getuint+0x39>
		return va_arg(*ap, unsigned long);
 8049889:	8b 45 08             	mov    0x8(%ebp),%eax
 804988c:	8b 00                	mov    (%eax),%eax
 804988e:	8d 48 04             	lea    0x4(%eax),%ecx
 8049891:	8b 55 08             	mov    0x8(%ebp),%edx
 8049894:	89 0a                	mov    %ecx,(%edx)
 8049896:	8b 00                	mov    (%eax),%eax
 8049898:	ba 00 00 00 00       	mov    $0x0,%edx
 804989d:	eb 14                	jmp    80498b3 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 804989f:	8b 45 08             	mov    0x8(%ebp),%eax
 80498a2:	8b 00                	mov    (%eax),%eax
 80498a4:	8d 48 04             	lea    0x4(%eax),%ecx
 80498a7:	8b 55 08             	mov    0x8(%ebp),%edx
 80498aa:	89 0a                	mov    %ecx,(%edx)
 80498ac:	8b 00                	mov    (%eax),%eax
 80498ae:	ba 00 00 00 00       	mov    $0x0,%edx
}
 80498b3:	5d                   	pop    %ebp
 80498b4:	c3                   	ret    

080498b5 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 80498b5:	55                   	push   %ebp
 80498b6:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 80498b8:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 80498bc:	7e 14                	jle    80498d2 <getint+0x1d>
		return va_arg(*ap, long long);
 80498be:	8b 45 08             	mov    0x8(%ebp),%eax
 80498c1:	8b 00                	mov    (%eax),%eax
 80498c3:	8d 48 08             	lea    0x8(%eax),%ecx
 80498c6:	8b 55 08             	mov    0x8(%ebp),%edx
 80498c9:	89 0a                	mov    %ecx,(%edx)
 80498cb:	8b 50 04             	mov    0x4(%eax),%edx
 80498ce:	8b 00                	mov    (%eax),%eax
 80498d0:	eb 28                	jmp    80498fa <getint+0x45>
	else if (lflag)
 80498d2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80498d6:	74 12                	je     80498ea <getint+0x35>
		return va_arg(*ap, long);
 80498d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80498db:	8b 00                	mov    (%eax),%eax
 80498dd:	8d 48 04             	lea    0x4(%eax),%ecx
 80498e0:	8b 55 08             	mov    0x8(%ebp),%edx
 80498e3:	89 0a                	mov    %ecx,(%edx)
 80498e5:	8b 00                	mov    (%eax),%eax
 80498e7:	99                   	cltd   
 80498e8:	eb 10                	jmp    80498fa <getint+0x45>
	else
		return va_arg(*ap, int);
 80498ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80498ed:	8b 00                	mov    (%eax),%eax
 80498ef:	8d 48 04             	lea    0x4(%eax),%ecx
 80498f2:	8b 55 08             	mov    0x8(%ebp),%edx
 80498f5:	89 0a                	mov    %ecx,(%edx)
 80498f7:	8b 00                	mov    (%eax),%eax
 80498f9:	99                   	cltd   
}
 80498fa:	5d                   	pop    %ebp
 80498fb:	c3                   	ret    

080498fc <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 80498fc:	55                   	push   %ebp
 80498fd:	89 e5                	mov    %esp,%ebp
 80498ff:	56                   	push   %esi
 8049900:	53                   	push   %ebx
 8049901:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049904:	eb 18                	jmp    804991e <vprintfmt+0x22>
			if (ch == '\0')
 8049906:	85 db                	test   %ebx,%ebx
 8049908:	75 05                	jne    804990f <vprintfmt+0x13>
				return;
 804990a:	e9 e9 03 00 00       	jmp    8049cf8 <vprintfmt+0x3fc>
			putch(ch, putdat);
 804990f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049912:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049916:	89 1c 24             	mov    %ebx,(%esp)
 8049919:	8b 45 08             	mov    0x8(%ebp),%eax
 804991c:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 804991e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049921:	8d 50 01             	lea    0x1(%eax),%edx
 8049924:	89 55 10             	mov    %edx,0x10(%ebp)
 8049927:	0f b6 00             	movzbl (%eax),%eax
 804992a:	0f b6 d8             	movzbl %al,%ebx
 804992d:	83 fb 25             	cmp    $0x25,%ebx
 8049930:	75 d4                	jne    8049906 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 8049932:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 8049936:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 804993d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 8049944:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 804994b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 8049952:	8b 45 10             	mov    0x10(%ebp),%eax
 8049955:	8d 50 01             	lea    0x1(%eax),%edx
 8049958:	89 55 10             	mov    %edx,0x10(%ebp)
 804995b:	0f b6 00             	movzbl (%eax),%eax
 804995e:	0f b6 d8             	movzbl %al,%ebx
 8049961:	8d 43 dd             	lea    -0x23(%ebx),%eax
 8049964:	83 f8 55             	cmp    $0x55,%eax
 8049967:	0f 87 5a 03 00 00    	ja     8049cc7 <vprintfmt+0x3cb>
 804996d:	8b 04 85 4c a3 04 08 	mov    0x804a34c(,%eax,4),%eax
 8049974:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 8049976:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 804997a:	eb d6                	jmp    8049952 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 804997c:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 8049980:	eb d0                	jmp    8049952 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049982:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 8049989:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804998c:	89 d0                	mov    %edx,%eax
 804998e:	c1 e0 02             	shl    $0x2,%eax
 8049991:	01 d0                	add    %edx,%eax
 8049993:	01 c0                	add    %eax,%eax
 8049995:	01 d8                	add    %ebx,%eax
 8049997:	83 e8 30             	sub    $0x30,%eax
 804999a:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 804999d:	8b 45 10             	mov    0x10(%ebp),%eax
 80499a0:	0f b6 00             	movzbl (%eax),%eax
 80499a3:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 80499a6:	83 fb 2f             	cmp    $0x2f,%ebx
 80499a9:	7e 0b                	jle    80499b6 <vprintfmt+0xba>
 80499ab:	83 fb 39             	cmp    $0x39,%ebx
 80499ae:	7f 06                	jg     80499b6 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 80499b0:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 80499b4:	eb d3                	jmp    8049989 <vprintfmt+0x8d>
			goto process_precision;
 80499b6:	eb 33                	jmp    80499eb <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 80499b8:	8b 45 14             	mov    0x14(%ebp),%eax
 80499bb:	8d 50 04             	lea    0x4(%eax),%edx
 80499be:	89 55 14             	mov    %edx,0x14(%ebp)
 80499c1:	8b 00                	mov    (%eax),%eax
 80499c3:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 80499c6:	eb 23                	jmp    80499eb <vprintfmt+0xef>

		case '.':
			if (width < 0)
 80499c8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80499cc:	79 0c                	jns    80499da <vprintfmt+0xde>
				width = 0;
 80499ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 80499d5:	e9 78 ff ff ff       	jmp    8049952 <vprintfmt+0x56>
 80499da:	e9 73 ff ff ff       	jmp    8049952 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 80499df:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 80499e6:	e9 67 ff ff ff       	jmp    8049952 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 80499eb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 80499ef:	79 12                	jns    8049a03 <vprintfmt+0x107>
				width = precision, precision = -1;
 80499f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80499f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80499f7:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 80499fe:	e9 4f ff ff ff       	jmp    8049952 <vprintfmt+0x56>
 8049a03:	e9 4a ff ff ff       	jmp    8049952 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 8049a08:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 8049a0c:	e9 41 ff ff ff       	jmp    8049952 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 8049a11:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a14:	8d 50 04             	lea    0x4(%eax),%edx
 8049a17:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a1a:	8b 00                	mov    (%eax),%eax
 8049a1c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049a1f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049a23:	89 04 24             	mov    %eax,(%esp)
 8049a26:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a29:	ff d0                	call   *%eax
			break;
 8049a2b:	e9 c2 02 00 00       	jmp    8049cf2 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 8049a30:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a33:	8d 50 04             	lea    0x4(%eax),%edx
 8049a36:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a39:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 8049a3b:	85 db                	test   %ebx,%ebx
 8049a3d:	79 02                	jns    8049a41 <vprintfmt+0x145>
				err = -err;
 8049a3f:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049a41:	83 fb 06             	cmp    $0x6,%ebx
 8049a44:	7f 0b                	jg     8049a51 <vprintfmt+0x155>
 8049a46:	8b 34 9d 0c a3 04 08 	mov    0x804a30c(,%ebx,4),%esi
 8049a4d:	85 f6                	test   %esi,%esi
 8049a4f:	75 23                	jne    8049a74 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 8049a51:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049a55:	c7 44 24 08 39 a3 04 	movl   $0x804a339,0x8(%esp)
 8049a5c:	08 
 8049a5d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a60:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a64:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a67:	89 04 24             	mov    %eax,(%esp)
 8049a6a:	e8 90 02 00 00       	call   8049cff <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 8049a6f:	e9 7e 02 00 00       	jmp    8049cf2 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 8049a74:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049a78:	c7 44 24 08 42 a3 04 	movl   $0x804a342,0x8(%esp)
 8049a7f:	08 
 8049a80:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a83:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a87:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a8a:	89 04 24             	mov    %eax,(%esp)
 8049a8d:	e8 6d 02 00 00       	call   8049cff <printfmt>
			break;
 8049a92:	e9 5b 02 00 00       	jmp    8049cf2 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 8049a97:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a9a:	8d 50 04             	lea    0x4(%eax),%edx
 8049a9d:	89 55 14             	mov    %edx,0x14(%ebp)
 8049aa0:	8b 30                	mov    (%eax),%esi
 8049aa2:	85 f6                	test   %esi,%esi
 8049aa4:	75 05                	jne    8049aab <vprintfmt+0x1af>
				p = "(null)";
 8049aa6:	be 45 a3 04 08       	mov    $0x804a345,%esi
			if (width > 0 && padc != '-')
 8049aab:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049aaf:	7e 37                	jle    8049ae8 <vprintfmt+0x1ec>
 8049ab1:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 8049ab5:	74 31                	je     8049ae8 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 8049ab7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049aba:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049abe:	89 34 24             	mov    %esi,(%esp)
 8049ac1:	e8 9b f8 ff ff       	call   8049361 <strnlen>
 8049ac6:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 8049ac9:	eb 17                	jmp    8049ae2 <vprintfmt+0x1e6>
					putch(padc, putdat);
 8049acb:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 8049acf:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049ad2:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049ad6:	89 04 24             	mov    %eax,(%esp)
 8049ad9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049adc:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 8049ade:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049ae2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049ae6:	7f e3                	jg     8049acb <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049ae8:	eb 38                	jmp    8049b22 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 8049aea:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049aee:	74 1f                	je     8049b0f <vprintfmt+0x213>
 8049af0:	83 fb 1f             	cmp    $0x1f,%ebx
 8049af3:	7e 05                	jle    8049afa <vprintfmt+0x1fe>
 8049af5:	83 fb 7e             	cmp    $0x7e,%ebx
 8049af8:	7e 15                	jle    8049b0f <vprintfmt+0x213>
					putch('?', putdat);
 8049afa:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049afd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b01:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 8049b08:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b0b:	ff d0                	call   *%eax
 8049b0d:	eb 0f                	jmp    8049b1e <vprintfmt+0x222>
				else
					putch(ch, putdat);
 8049b0f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b12:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b16:	89 1c 24             	mov    %ebx,(%esp)
 8049b19:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b1c:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049b1e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049b22:	89 f0                	mov    %esi,%eax
 8049b24:	8d 70 01             	lea    0x1(%eax),%esi
 8049b27:	0f b6 00             	movzbl (%eax),%eax
 8049b2a:	0f be d8             	movsbl %al,%ebx
 8049b2d:	85 db                	test   %ebx,%ebx
 8049b2f:	74 10                	je     8049b41 <vprintfmt+0x245>
 8049b31:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049b35:	78 b3                	js     8049aea <vprintfmt+0x1ee>
 8049b37:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 8049b3b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049b3f:	79 a9                	jns    8049aea <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049b41:	eb 17                	jmp    8049b5a <vprintfmt+0x25e>
				putch(' ', putdat);
 8049b43:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b46:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b4a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049b51:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b54:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049b56:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049b5a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049b5e:	7f e3                	jg     8049b43 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 8049b60:	e9 8d 01 00 00       	jmp    8049cf2 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 8049b65:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b68:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b6c:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b6f:	89 04 24             	mov    %eax,(%esp)
 8049b72:	e8 3e fd ff ff       	call   80498b5 <getint>
 8049b77:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b7a:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 8049b7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b80:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049b83:	85 d2                	test   %edx,%edx
 8049b85:	79 26                	jns    8049bad <vprintfmt+0x2b1>
				putch('-', putdat);
 8049b87:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b8a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b8e:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 8049b95:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b98:	ff d0                	call   *%eax
				num = -(long long) num;
 8049b9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b9d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049ba0:	f7 d8                	neg    %eax
 8049ba2:	83 d2 00             	adc    $0x0,%edx
 8049ba5:	f7 da                	neg    %edx
 8049ba7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049baa:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049bad:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049bb4:	e9 c5 00 00 00       	jmp    8049c7e <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 8049bb9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049bbc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bc0:	8d 45 14             	lea    0x14(%ebp),%eax
 8049bc3:	89 04 24             	mov    %eax,(%esp)
 8049bc6:	e8 9b fc ff ff       	call   8049866 <getuint>
 8049bcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bce:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049bd1:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049bd8:	e9 a1 00 00 00       	jmp    8049c7e <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 8049bdd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049be0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049be4:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049beb:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bee:	ff d0                	call   *%eax
			putch('X', putdat);
 8049bf0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bf3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bf7:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049bfe:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c01:	ff d0                	call   *%eax
			putch('X', putdat);
 8049c03:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c06:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c0a:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049c11:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c14:	ff d0                	call   *%eax
			break;
 8049c16:	e9 d7 00 00 00       	jmp    8049cf2 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 8049c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c1e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c22:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 8049c29:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c2c:	ff d0                	call   *%eax
			putch('x', putdat);
 8049c2e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c31:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c35:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049c3c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c3f:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049c41:	8b 45 14             	mov    0x14(%ebp),%eax
 8049c44:	8d 50 04             	lea    0x4(%eax),%edx
 8049c47:	89 55 14             	mov    %edx,0x14(%ebp)
 8049c4a:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049c4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049c56:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049c5d:	eb 1f                	jmp    8049c7e <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049c5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049c62:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c66:	8d 45 14             	lea    0x14(%ebp),%eax
 8049c69:	89 04 24             	mov    %eax,(%esp)
 8049c6c:	e8 f5 fb ff ff       	call   8049866 <getuint>
 8049c71:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c74:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049c77:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049c7e:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049c82:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c85:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049c89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049c8c:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049c90:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049c94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049c97:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049c9a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049c9e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049ca2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ca5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ca9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cac:	89 04 24             	mov    %eax,(%esp)
 8049caf:	e8 d4 fa ff ff       	call   8049788 <printnum>
			break;
 8049cb4:	eb 3c                	jmp    8049cf2 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049cb6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cb9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cbd:	89 1c 24             	mov    %ebx,(%esp)
 8049cc0:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cc3:	ff d0                	call   *%eax
			break;
 8049cc5:	eb 2b                	jmp    8049cf2 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cca:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cce:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049cd5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cd8:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049cda:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049cde:	eb 04                	jmp    8049ce4 <vprintfmt+0x3e8>
 8049ce0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049ce4:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ce7:	83 e8 01             	sub    $0x1,%eax
 8049cea:	0f b6 00             	movzbl (%eax),%eax
 8049ced:	3c 25                	cmp    $0x25,%al
 8049cef:	75 ef                	jne    8049ce0 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049cf1:	90                   	nop
		}
	}
 8049cf2:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049cf3:	e9 26 fc ff ff       	jmp    804991e <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049cf8:	83 c4 40             	add    $0x40,%esp
 8049cfb:	5b                   	pop    %ebx
 8049cfc:	5e                   	pop    %esi
 8049cfd:	5d                   	pop    %ebp
 8049cfe:	c3                   	ret    

08049cff <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049cff:	55                   	push   %ebp
 8049d00:	89 e5                	mov    %esp,%ebp
 8049d02:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049d05:	8d 45 14             	lea    0x14(%ebp),%eax
 8049d08:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049d0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049d0e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049d12:	8b 45 10             	mov    0x10(%ebp),%eax
 8049d15:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049d19:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d1c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d20:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d23:	89 04 24             	mov    %eax,(%esp)
 8049d26:	e8 d1 fb ff ff       	call   80498fc <vprintfmt>
	va_end(ap);
}
 8049d2b:	c9                   	leave  
 8049d2c:	c3                   	ret    

08049d2d <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049d2d:	55                   	push   %ebp
 8049d2e:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049d30:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d33:	8b 40 08             	mov    0x8(%eax),%eax
 8049d36:	8d 50 01             	lea    0x1(%eax),%edx
 8049d39:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d3c:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d42:	8b 10                	mov    (%eax),%edx
 8049d44:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d47:	8b 40 04             	mov    0x4(%eax),%eax
 8049d4a:	39 c2                	cmp    %eax,%edx
 8049d4c:	73 12                	jae    8049d60 <sprintputch+0x33>
		*b->buf++ = ch;
 8049d4e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d51:	8b 00                	mov    (%eax),%eax
 8049d53:	8d 48 01             	lea    0x1(%eax),%ecx
 8049d56:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d59:	89 0a                	mov    %ecx,(%edx)
 8049d5b:	8b 55 08             	mov    0x8(%ebp),%edx
 8049d5e:	88 10                	mov    %dl,(%eax)
}
 8049d60:	5d                   	pop    %ebp
 8049d61:	c3                   	ret    

08049d62 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049d62:	55                   	push   %ebp
 8049d63:	89 e5                	mov    %esp,%ebp
 8049d65:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049d68:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d6b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049d6e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d71:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049d74:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d77:	01 d0                	add    %edx,%eax
 8049d79:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049d7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049d83:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049d87:	74 06                	je     8049d8f <vsnprintf+0x2d>
 8049d89:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049d8d:	7f 07                	jg     8049d96 <vsnprintf+0x34>
		return -E_INVAL;
 8049d8f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049d94:	eb 2a                	jmp    8049dc0 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049d96:	8b 45 14             	mov    0x14(%ebp),%eax
 8049d99:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049d9d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049da0:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049da4:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049da7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dab:	c7 04 24 2d 9d 04 08 	movl   $0x8049d2d,(%esp)
 8049db2:	e8 45 fb ff ff       	call   80498fc <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049dba:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049dc0:	c9                   	leave  
 8049dc1:	c3                   	ret    

08049dc2 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049dc2:	55                   	push   %ebp
 8049dc3:	89 e5                	mov    %esp,%ebp
 8049dc5:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049dc8:	8d 45 14             	lea    0x14(%ebp),%eax
 8049dcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049dce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049dd1:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049dd5:	8b 45 10             	mov    0x10(%ebp),%eax
 8049dd8:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ddc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ddf:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049de3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049de6:	89 04 24             	mov    %eax,(%esp)
 8049de9:	e8 74 ff ff ff       	call   8049d62 <vsnprintf>
 8049dee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049df4:	c9                   	leave  
 8049df5:	c3                   	ret    

08049df6 <srand>:
static int seed = 0;

void
srand(int s) {
 8049df6:	55                   	push   %ebp
 8049df7:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049df9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dfc:	a3 08 5c 09 08       	mov    %eax,0x8095c08
}
 8049e01:	5d                   	pop    %ebp
 8049e02:	c3                   	ret    

08049e03 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049e03:	55                   	push   %ebp
 8049e04:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049e06:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049e0b:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049e11:	83 c0 01             	add    $0x1,%eax
 8049e14:	a3 08 5c 09 08       	mov    %eax,0x8095c08
	return (seed >> 16) & 0x7FFF;
 8049e19:	a1 08 5c 09 08       	mov    0x8095c08,%eax
 8049e1e:	c1 f8 10             	sar    $0x10,%eax
 8049e21:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049e26:	5d                   	pop    %ebp
 8049e27:	c3                   	ret    
 8049e28:	66 90                	xchg   %ax,%ax
 8049e2a:	66 90                	xchg   %ax,%ax
 8049e2c:	66 90                	xchg   %ax,%ax
 8049e2e:	66 90                	xchg   %ax,%ax

08049e30 <__udivdi3>:
 8049e30:	55                   	push   %ebp
 8049e31:	57                   	push   %edi
 8049e32:	56                   	push   %esi
 8049e33:	83 ec 0c             	sub    $0xc,%esp
 8049e36:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049e3a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049e3e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049e42:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049e46:	85 c0                	test   %eax,%eax
 8049e48:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049e4c:	89 ea                	mov    %ebp,%edx
 8049e4e:	89 0c 24             	mov    %ecx,(%esp)
 8049e51:	75 2d                	jne    8049e80 <__udivdi3+0x50>
 8049e53:	39 e9                	cmp    %ebp,%ecx
 8049e55:	77 61                	ja     8049eb8 <__udivdi3+0x88>
 8049e57:	85 c9                	test   %ecx,%ecx
 8049e59:	89 ce                	mov    %ecx,%esi
 8049e5b:	75 0b                	jne    8049e68 <__udivdi3+0x38>
 8049e5d:	b8 01 00 00 00       	mov    $0x1,%eax
 8049e62:	31 d2                	xor    %edx,%edx
 8049e64:	f7 f1                	div    %ecx
 8049e66:	89 c6                	mov    %eax,%esi
 8049e68:	31 d2                	xor    %edx,%edx
 8049e6a:	89 e8                	mov    %ebp,%eax
 8049e6c:	f7 f6                	div    %esi
 8049e6e:	89 c5                	mov    %eax,%ebp
 8049e70:	89 f8                	mov    %edi,%eax
 8049e72:	f7 f6                	div    %esi
 8049e74:	89 ea                	mov    %ebp,%edx
 8049e76:	83 c4 0c             	add    $0xc,%esp
 8049e79:	5e                   	pop    %esi
 8049e7a:	5f                   	pop    %edi
 8049e7b:	5d                   	pop    %ebp
 8049e7c:	c3                   	ret    
 8049e7d:	8d 76 00             	lea    0x0(%esi),%esi
 8049e80:	39 e8                	cmp    %ebp,%eax
 8049e82:	77 24                	ja     8049ea8 <__udivdi3+0x78>
 8049e84:	0f bd e8             	bsr    %eax,%ebp
 8049e87:	83 f5 1f             	xor    $0x1f,%ebp
 8049e8a:	75 3c                	jne    8049ec8 <__udivdi3+0x98>
 8049e8c:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049e90:	39 34 24             	cmp    %esi,(%esp)
 8049e93:	0f 86 9f 00 00 00    	jbe    8049f38 <__udivdi3+0x108>
 8049e99:	39 d0                	cmp    %edx,%eax
 8049e9b:	0f 82 97 00 00 00    	jb     8049f38 <__udivdi3+0x108>
 8049ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049ea8:	31 d2                	xor    %edx,%edx
 8049eaa:	31 c0                	xor    %eax,%eax
 8049eac:	83 c4 0c             	add    $0xc,%esp
 8049eaf:	5e                   	pop    %esi
 8049eb0:	5f                   	pop    %edi
 8049eb1:	5d                   	pop    %ebp
 8049eb2:	c3                   	ret    
 8049eb3:	90                   	nop
 8049eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049eb8:	89 f8                	mov    %edi,%eax
 8049eba:	f7 f1                	div    %ecx
 8049ebc:	31 d2                	xor    %edx,%edx
 8049ebe:	83 c4 0c             	add    $0xc,%esp
 8049ec1:	5e                   	pop    %esi
 8049ec2:	5f                   	pop    %edi
 8049ec3:	5d                   	pop    %ebp
 8049ec4:	c3                   	ret    
 8049ec5:	8d 76 00             	lea    0x0(%esi),%esi
 8049ec8:	89 e9                	mov    %ebp,%ecx
 8049eca:	8b 3c 24             	mov    (%esp),%edi
 8049ecd:	d3 e0                	shl    %cl,%eax
 8049ecf:	89 c6                	mov    %eax,%esi
 8049ed1:	b8 20 00 00 00       	mov    $0x20,%eax
 8049ed6:	29 e8                	sub    %ebp,%eax
 8049ed8:	89 c1                	mov    %eax,%ecx
 8049eda:	d3 ef                	shr    %cl,%edi
 8049edc:	89 e9                	mov    %ebp,%ecx
 8049ede:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049ee2:	8b 3c 24             	mov    (%esp),%edi
 8049ee5:	09 74 24 08          	or     %esi,0x8(%esp)
 8049ee9:	89 d6                	mov    %edx,%esi
 8049eeb:	d3 e7                	shl    %cl,%edi
 8049eed:	89 c1                	mov    %eax,%ecx
 8049eef:	89 3c 24             	mov    %edi,(%esp)
 8049ef2:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049ef6:	d3 ee                	shr    %cl,%esi
 8049ef8:	89 e9                	mov    %ebp,%ecx
 8049efa:	d3 e2                	shl    %cl,%edx
 8049efc:	89 c1                	mov    %eax,%ecx
 8049efe:	d3 ef                	shr    %cl,%edi
 8049f00:	09 d7                	or     %edx,%edi
 8049f02:	89 f2                	mov    %esi,%edx
 8049f04:	89 f8                	mov    %edi,%eax
 8049f06:	f7 74 24 08          	divl   0x8(%esp)
 8049f0a:	89 d6                	mov    %edx,%esi
 8049f0c:	89 c7                	mov    %eax,%edi
 8049f0e:	f7 24 24             	mull   (%esp)
 8049f11:	39 d6                	cmp    %edx,%esi
 8049f13:	89 14 24             	mov    %edx,(%esp)
 8049f16:	72 30                	jb     8049f48 <__udivdi3+0x118>
 8049f18:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049f1c:	89 e9                	mov    %ebp,%ecx
 8049f1e:	d3 e2                	shl    %cl,%edx
 8049f20:	39 c2                	cmp    %eax,%edx
 8049f22:	73 05                	jae    8049f29 <__udivdi3+0xf9>
 8049f24:	3b 34 24             	cmp    (%esp),%esi
 8049f27:	74 1f                	je     8049f48 <__udivdi3+0x118>
 8049f29:	89 f8                	mov    %edi,%eax
 8049f2b:	31 d2                	xor    %edx,%edx
 8049f2d:	e9 7a ff ff ff       	jmp    8049eac <__udivdi3+0x7c>
 8049f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049f38:	31 d2                	xor    %edx,%edx
 8049f3a:	b8 01 00 00 00       	mov    $0x1,%eax
 8049f3f:	e9 68 ff ff ff       	jmp    8049eac <__udivdi3+0x7c>
 8049f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f48:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049f4b:	31 d2                	xor    %edx,%edx
 8049f4d:	83 c4 0c             	add    $0xc,%esp
 8049f50:	5e                   	pop    %esi
 8049f51:	5f                   	pop    %edi
 8049f52:	5d                   	pop    %ebp
 8049f53:	c3                   	ret    
 8049f54:	66 90                	xchg   %ax,%ax
 8049f56:	66 90                	xchg   %ax,%ax
 8049f58:	66 90                	xchg   %ax,%ax
 8049f5a:	66 90                	xchg   %ax,%ax
 8049f5c:	66 90                	xchg   %ax,%ax
 8049f5e:	66 90                	xchg   %ax,%ax

08049f60 <__umoddi3>:
 8049f60:	55                   	push   %ebp
 8049f61:	57                   	push   %edi
 8049f62:	56                   	push   %esi
 8049f63:	83 ec 14             	sub    $0x14,%esp
 8049f66:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049f6a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049f6e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 8049f72:	89 c7                	mov    %eax,%edi
 8049f74:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049f78:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049f7c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049f80:	89 34 24             	mov    %esi,(%esp)
 8049f83:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049f87:	85 c0                	test   %eax,%eax
 8049f89:	89 c2                	mov    %eax,%edx
 8049f8b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049f8f:	75 17                	jne    8049fa8 <__umoddi3+0x48>
 8049f91:	39 fe                	cmp    %edi,%esi
 8049f93:	76 4b                	jbe    8049fe0 <__umoddi3+0x80>
 8049f95:	89 c8                	mov    %ecx,%eax
 8049f97:	89 fa                	mov    %edi,%edx
 8049f99:	f7 f6                	div    %esi
 8049f9b:	89 d0                	mov    %edx,%eax
 8049f9d:	31 d2                	xor    %edx,%edx
 8049f9f:	83 c4 14             	add    $0x14,%esp
 8049fa2:	5e                   	pop    %esi
 8049fa3:	5f                   	pop    %edi
 8049fa4:	5d                   	pop    %ebp
 8049fa5:	c3                   	ret    
 8049fa6:	66 90                	xchg   %ax,%ax
 8049fa8:	39 f8                	cmp    %edi,%eax
 8049faa:	77 54                	ja     804a000 <__umoddi3+0xa0>
 8049fac:	0f bd e8             	bsr    %eax,%ebp
 8049faf:	83 f5 1f             	xor    $0x1f,%ebp
 8049fb2:	75 5c                	jne    804a010 <__umoddi3+0xb0>
 8049fb4:	8b 7c 24 08          	mov    0x8(%esp),%edi
 8049fb8:	39 3c 24             	cmp    %edi,(%esp)
 8049fbb:	0f 87 e7 00 00 00    	ja     804a0a8 <__umoddi3+0x148>
 8049fc1:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049fc5:	29 f1                	sub    %esi,%ecx
 8049fc7:	19 c7                	sbb    %eax,%edi
 8049fc9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049fcd:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 8049fd1:	8b 44 24 08          	mov    0x8(%esp),%eax
 8049fd5:	8b 54 24 0c          	mov    0xc(%esp),%edx
 8049fd9:	83 c4 14             	add    $0x14,%esp
 8049fdc:	5e                   	pop    %esi
 8049fdd:	5f                   	pop    %edi
 8049fde:	5d                   	pop    %ebp
 8049fdf:	c3                   	ret    
 8049fe0:	85 f6                	test   %esi,%esi
 8049fe2:	89 f5                	mov    %esi,%ebp
 8049fe4:	75 0b                	jne    8049ff1 <__umoddi3+0x91>
 8049fe6:	b8 01 00 00 00       	mov    $0x1,%eax
 8049feb:	31 d2                	xor    %edx,%edx
 8049fed:	f7 f6                	div    %esi
 8049fef:	89 c5                	mov    %eax,%ebp
 8049ff1:	8b 44 24 04          	mov    0x4(%esp),%eax
 8049ff5:	31 d2                	xor    %edx,%edx
 8049ff7:	f7 f5                	div    %ebp
 8049ff9:	89 c8                	mov    %ecx,%eax
 8049ffb:	f7 f5                	div    %ebp
 8049ffd:	eb 9c                	jmp    8049f9b <__umoddi3+0x3b>
 8049fff:	90                   	nop
 804a000:	89 c8                	mov    %ecx,%eax
 804a002:	89 fa                	mov    %edi,%edx
 804a004:	83 c4 14             	add    $0x14,%esp
 804a007:	5e                   	pop    %esi
 804a008:	5f                   	pop    %edi
 804a009:	5d                   	pop    %ebp
 804a00a:	c3                   	ret    
 804a00b:	90                   	nop
 804a00c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a010:	8b 04 24             	mov    (%esp),%eax
 804a013:	be 20 00 00 00       	mov    $0x20,%esi
 804a018:	89 e9                	mov    %ebp,%ecx
 804a01a:	29 ee                	sub    %ebp,%esi
 804a01c:	d3 e2                	shl    %cl,%edx
 804a01e:	89 f1                	mov    %esi,%ecx
 804a020:	d3 e8                	shr    %cl,%eax
 804a022:	89 e9                	mov    %ebp,%ecx
 804a024:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a028:	8b 04 24             	mov    (%esp),%eax
 804a02b:	09 54 24 04          	or     %edx,0x4(%esp)
 804a02f:	89 fa                	mov    %edi,%edx
 804a031:	d3 e0                	shl    %cl,%eax
 804a033:	89 f1                	mov    %esi,%ecx
 804a035:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a039:	8b 44 24 10          	mov    0x10(%esp),%eax
 804a03d:	d3 ea                	shr    %cl,%edx
 804a03f:	89 e9                	mov    %ebp,%ecx
 804a041:	d3 e7                	shl    %cl,%edi
 804a043:	89 f1                	mov    %esi,%ecx
 804a045:	d3 e8                	shr    %cl,%eax
 804a047:	89 e9                	mov    %ebp,%ecx
 804a049:	09 f8                	or     %edi,%eax
 804a04b:	8b 7c 24 10          	mov    0x10(%esp),%edi
 804a04f:	f7 74 24 04          	divl   0x4(%esp)
 804a053:	d3 e7                	shl    %cl,%edi
 804a055:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 804a059:	89 d7                	mov    %edx,%edi
 804a05b:	f7 64 24 08          	mull   0x8(%esp)
 804a05f:	39 d7                	cmp    %edx,%edi
 804a061:	89 c1                	mov    %eax,%ecx
 804a063:	89 14 24             	mov    %edx,(%esp)
 804a066:	72 2c                	jb     804a094 <__umoddi3+0x134>
 804a068:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 804a06c:	72 22                	jb     804a090 <__umoddi3+0x130>
 804a06e:	8b 44 24 0c          	mov    0xc(%esp),%eax
 804a072:	29 c8                	sub    %ecx,%eax
 804a074:	19 d7                	sbb    %edx,%edi
 804a076:	89 e9                	mov    %ebp,%ecx
 804a078:	89 fa                	mov    %edi,%edx
 804a07a:	d3 e8                	shr    %cl,%eax
 804a07c:	89 f1                	mov    %esi,%ecx
 804a07e:	d3 e2                	shl    %cl,%edx
 804a080:	89 e9                	mov    %ebp,%ecx
 804a082:	d3 ef                	shr    %cl,%edi
 804a084:	09 d0                	or     %edx,%eax
 804a086:	89 fa                	mov    %edi,%edx
 804a088:	83 c4 14             	add    $0x14,%esp
 804a08b:	5e                   	pop    %esi
 804a08c:	5f                   	pop    %edi
 804a08d:	5d                   	pop    %ebp
 804a08e:	c3                   	ret    
 804a08f:	90                   	nop
 804a090:	39 d7                	cmp    %edx,%edi
 804a092:	75 da                	jne    804a06e <__umoddi3+0x10e>
 804a094:	8b 14 24             	mov    (%esp),%edx
 804a097:	89 c1                	mov    %eax,%ecx
 804a099:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 804a09d:	1b 54 24 04          	sbb    0x4(%esp),%edx
 804a0a1:	eb cb                	jmp    804a06e <__umoddi3+0x10e>
 804a0a3:	90                   	nop
 804a0a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a0a8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 804a0ac:	0f 82 0f ff ff ff    	jb     8049fc1 <__umoddi3+0x61>
 804a0b2:	e9 1a ff ff ff       	jmp    8049fd1 <__umoddi3+0x71>
