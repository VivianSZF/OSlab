
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
 8048006:	c7 04 24 58 a1 04 08 	movl   $0x804a158,(%esp)
 804800d:	e8 c4 12 00 00       	call   80492d6 <printf>
	int i;
	for(i=0;i<100;i++)
 8048012:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048019:	eb 74                	jmp    804808f <producer+0x8f>
	{
		sem_wait(&empty);
 804801b:	c7 04 24 c8 6c 09 08 	movl   $0x8096cc8,(%esp)
 8048022:	e8 c4 11 00 00       	call   80491eb <sem_wait>
		sem_wait(&mutex);
 8048027:	c7 04 24 70 6c 09 08 	movl   $0x8096c70,(%esp)
 804802e:	e8 b8 11 00 00       	call   80491eb <sem_wait>
		printf("produce No.%d\n",i);
 8048033:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048036:	89 44 24 04          	mov    %eax,0x4(%esp)
 804803a:	c7 04 24 6b a1 04 08 	movl   $0x804a16b,(%esp)
 8048041:	e8 90 12 00 00       	call   80492d6 <printf>
		buf[i%10]=i;
 8048046:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048049:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804804e:	89 c8                	mov    %ecx,%eax
 8048050:	f7 ea                	imul   %edx
 8048052:	c1 fa 02             	sar    $0x2,%edx
 8048055:	89 c8                	mov    %ecx,%eax
 8048057:	c1 f8 1f             	sar    $0x1f,%eax
 804805a:	29 c2                	sub    %eax,%edx
 804805c:	89 d0                	mov    %edx,%eax
 804805e:	c1 e0 02             	shl    $0x2,%eax
 8048061:	01 d0                	add    %edx,%eax
 8048063:	01 c0                	add    %eax,%eax
 8048065:	29 c1                	sub    %eax,%ecx
 8048067:	89 ca                	mov    %ecx,%edx
 8048069:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804806c:	89 04 95 a0 6c 09 08 	mov    %eax,0x8096ca0(,%edx,4)
		sem_post(&mutex);
 8048073:	c7 04 24 70 6c 09 08 	movl   $0x8096c70,(%esp)
 804807a:	e8 a2 11 00 00       	call   8049221 <sem_post>
		sem_post(&full);	
 804807f:	c7 04 24 60 6c 09 08 	movl   $0x8096c60,(%esp)
 8048086:	e8 96 11 00 00       	call   8049221 <sem_post>

void producer()
{
	printf("I am the producer\n");
	int i;
	for(i=0;i<100;i++)
 804808b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804808f:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 8048093:	7e 86                	jle    804801b <producer+0x1b>
		printf("produce No.%d\n",i);
		buf[i%10]=i;
		sem_post(&mutex);
		sem_post(&full);	
	}	
	exit();
 8048095:	e8 ca 10 00 00       	call   8049164 <exit>
}
 804809a:	c9                   	leave  
 804809b:	c3                   	ret    

0804809c <consumer>:

void consumer()
{
 804809c:	55                   	push   %ebp
 804809d:	89 e5                	mov    %esp,%ebp
 804809f:	83 ec 28             	sub    $0x28,%esp
	printf("I am the consumer\n");
 80480a2:	c7 04 24 7a a1 04 08 	movl   $0x804a17a,(%esp)
 80480a9:	e8 28 12 00 00       	call   80492d6 <printf>
	int i;
	for(i=0;i<100;i++)
 80480ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80480b5:	eb 75                	jmp    804812c <consumer+0x90>
	{
		sem_wait(&full);
 80480b7:	c7 04 24 60 6c 09 08 	movl   $0x8096c60,(%esp)
 80480be:	e8 28 11 00 00       	call   80491eb <sem_wait>
		sem_wait(&mutex);
 80480c3:	c7 04 24 70 6c 09 08 	movl   $0x8096c70,(%esp)
 80480ca:	e8 1c 11 00 00       	call   80491eb <sem_wait>
		printf("consume No.%d\n",i);
 80480cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80480d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 80480d6:	c7 04 24 8d a1 04 08 	movl   $0x804a18d,(%esp)
 80480dd:	e8 f4 11 00 00       	call   80492d6 <printf>
		buf[i%10]=0;
 80480e2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80480e5:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80480ea:	89 c8                	mov    %ecx,%eax
 80480ec:	f7 ea                	imul   %edx
 80480ee:	c1 fa 02             	sar    $0x2,%edx
 80480f1:	89 c8                	mov    %ecx,%eax
 80480f3:	c1 f8 1f             	sar    $0x1f,%eax
 80480f6:	29 c2                	sub    %eax,%edx
 80480f8:	89 d0                	mov    %edx,%eax
 80480fa:	c1 e0 02             	shl    $0x2,%eax
 80480fd:	01 d0                	add    %edx,%eax
 80480ff:	01 c0                	add    %eax,%eax
 8048101:	29 c1                	sub    %eax,%ecx
 8048103:	89 ca                	mov    %ecx,%edx
 8048105:	c7 04 95 a0 6c 09 08 	movl   $0x0,0x8096ca0(,%edx,4)
 804810c:	00 00 00 00 
		sem_post(&mutex);
 8048110:	c7 04 24 70 6c 09 08 	movl   $0x8096c70,(%esp)
 8048117:	e8 05 11 00 00       	call   8049221 <sem_post>
		sem_post(&empty);
 804811c:	c7 04 24 c8 6c 09 08 	movl   $0x8096cc8,(%esp)
 8048123:	e8 f9 10 00 00       	call   8049221 <sem_post>

void consumer()
{
	printf("I am the consumer\n");
	int i;
	for(i=0;i<100;i++)
 8048128:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804812c:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 8048130:	7e 85                	jle    80480b7 <consumer+0x1b>
		printf("consume No.%d\n",i);
		buf[i%10]=0;
		sem_post(&mutex);
		sem_post(&empty);
	}
	exit();
 8048132:	e8 2d 10 00 00       	call   8049164 <exit>
}
 8048137:	c9                   	leave  
 8048138:	c3                   	ret    

08048139 <game_init>:


void
game_init(void) {
 8048139:	55                   	push   %ebp
 804813a:	89 e5                	mov    %esp,%ebp
 804813c:	83 ec 28             	sub    $0x28,%esp

	printf("Welcome to our game~~~ready ~~~go~~~\n");
 804813f:	c7 04 24 9c a1 04 08 	movl   $0x804a19c,(%esp)
 8048146:	e8 8b 11 00 00       	call   80492d6 <printf>
	//sleep(1);
	//printf("skskkssks");
	//while(1);
	
	//here is the producer and consumer test
	sem_init(&empty,10);
 804814b:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 8048152:	00 
 8048153:	c7 04 24 c8 6c 09 08 	movl   $0x8096cc8,(%esp)
 804815a:	e8 4f 10 00 00       	call   80491ae <sem_init>
	//printf("dead here");
	sem_init(&full,0);
 804815f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048166:	00 
 8048167:	c7 04 24 60 6c 09 08 	movl   $0x8096c60,(%esp)
 804816e:	e8 3b 10 00 00       	call   80491ae <sem_init>
	sem_init(&mutex,1);
 8048173:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804817a:	00 
 804817b:	c7 04 24 70 6c 09 08 	movl   $0x8096c70,(%esp)
 8048182:	e8 27 10 00 00       	call   80491ae <sem_init>

	int k1,k2;
	k1=thread(producer);	
 8048187:	c7 04 24 00 80 04 08 	movl   $0x8048000,(%esp)
 804818e:	e8 00 10 00 00       	call   8049193 <thread>
 8048193:	89 45 f4             	mov    %eax,-0xc(%ebp)
	k2=thread(consumer);
 8048196:	c7 04 24 9c 80 04 08 	movl   $0x804809c,(%esp)
 804819d:	e8 f1 0f 00 00       	call   8049193 <thread>
 80481a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	
	int t=0;
 80481a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while(1){
		t=thread_join();
 80481ac:	e8 8b 10 00 00       	call   804923c <thread_join>
 80481b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if(t==1)
 80481b4:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
 80481b8:	75 27                	jne    80481e1 <game_init+0xa8>
			break;
 80481ba:	90                   	nop
	}

	sem_destroy(&empty);
 80481bb:	c7 04 24 c8 6c 09 08 	movl   $0x8096cc8,(%esp)
 80481c2:	e8 09 10 00 00       	call   80491d0 <sem_destroy>
	sem_destroy(&full);
 80481c7:	c7 04 24 60 6c 09 08 	movl   $0x8096c60,(%esp)
 80481ce:	e8 fd 0f 00 00       	call   80491d0 <sem_destroy>
	sem_destroy(&mutex);
 80481d3:	c7 04 24 70 6c 09 08 	movl   $0x8096c70,(%esp)
 80481da:	e8 f1 0f 00 00       	call   80491d0 <sem_destroy>
 80481df:	eb 02                	jmp    80481e3 <game_init+0xaa>
	int t=0;
	while(1){
		t=thread_join();
		if(t==1)
			break;
	}
 80481e1:	eb c9                	jmp    80481ac <game_init+0x73>

	sem_destroy(&empty);
	sem_destroy(&full);
	sem_destroy(&mutex);
		
	while(1);
 80481e3:	eb fe                	jmp    80481e3 <game_init+0xaa>

080481e5 <init_keyboard>:
	0x48,0x50,0x4b,0x4d
};

static bool key_pressed[4];

void init_keyboard(void){
 80481e5:	55                   	push   %ebp
 80481e6:	89 e5                	mov    %esp,%ebp
 80481e8:	83 ec 10             	sub    $0x10,%esp
	int i;
	for(i=0;i<4;i++){
 80481eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80481f2:	eb 12                	jmp    8048206 <init_keyboard+0x21>
		key_pressed[i]=FALSE;
 80481f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80481f7:	c7 04 85 60 c4 04 08 	movl   $0x0,0x804c460(,%eax,4)
 80481fe:	00 00 00 00 

static bool key_pressed[4];

void init_keyboard(void){
	int i;
	for(i=0;i<4;i++){
 8048202:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048206:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 804820a:	7e e8                	jle    80481f4 <init_keyboard+0xf>
		key_pressed[i]=FALSE;
	}
}
 804820c:	c9                   	leave  
 804820d:	c3                   	ret    

0804820e <press_key>:

void press_key(int scan_code) {
 804820e:	55                   	push   %ebp
 804820f:	89 e5                	mov    %esp,%ebp
 8048211:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < 4; i ++) {
 8048214:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804821b:	eb 21                	jmp    804823e <press_key+0x30>
		if (key_code[i] == scan_code) {
 804821d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048220:	8b 04 85 40 c0 04 08 	mov    0x804c040(,%eax,4),%eax
 8048227:	3b 45 08             	cmp    0x8(%ebp),%eax
 804822a:	75 0e                	jne    804823a <press_key+0x2c>
			key_pressed[i] = TRUE;
 804822c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804822f:	c7 04 85 60 c4 04 08 	movl   $0x1,0x804c460(,%eax,4)
 8048236:	01 00 00 00 
	}
}

void press_key(int scan_code) {
	int i;
	for (i = 0; i < 4; i ++) {
 804823a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804823e:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
 8048242:	7e d9                	jle    804821d <press_key+0xf>
		if (key_code[i] == scan_code) {
			key_pressed[i] = TRUE;
			
		}
	}
}
 8048244:	c9                   	leave  
 8048245:	c3                   	ret    

08048246 <release_key>:

void release_key(int index) {
 8048246:	55                   	push   %ebp
 8048247:	89 e5                	mov    %esp,%ebp
 8048249:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 804824c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048250:	78 06                	js     8048258 <release_key+0x12>
 8048252:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 8048256:	7e 24                	jle    804827c <release_key+0x36>
 8048258:	c7 44 24 0c c2 a1 04 	movl   $0x804a1c2,0xc(%esp)
 804825f:	08 
 8048260:	c7 44 24 08 da a1 04 	movl   $0x804a1da,0x8(%esp)
 8048267:	08 
 8048268:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
 804826f:	00 
 8048270:	c7 04 24 ef a1 04 08 	movl   $0x804a1ef,(%esp)
 8048277:	e8 93 00 00 00       	call   804830f <_panic>
	key_pressed[index] = FALSE;
 804827c:	8b 45 08             	mov    0x8(%ebp),%eax
 804827f:	c7 04 85 60 c4 04 08 	movl   $0x0,0x804c460(,%eax,4)
 8048286:	00 00 00 00 
}
 804828a:	c9                   	leave  
 804828b:	c3                   	ret    

0804828c <query_key>:

bool query_key(int index) {
 804828c:	55                   	push   %ebp
 804828d:	89 e5                	mov    %esp,%ebp
 804828f:	83 ec 18             	sub    $0x18,%esp
	assert(0 <= index && index < 4);
 8048292:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048296:	78 06                	js     804829e <query_key+0x12>
 8048298:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 804829c:	7e 24                	jle    80482c2 <query_key+0x36>
 804829e:	c7 44 24 0c c2 a1 04 	movl   $0x804a1c2,0xc(%esp)
 80482a5:	08 
 80482a6:	c7 44 24 08 da a1 04 	movl   $0x804a1da,0x8(%esp)
 80482ad:	08 
 80482ae:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 80482b5:	00 
 80482b6:	c7 04 24 ef a1 04 08 	movl   $0x804a1ef,(%esp)
 80482bd:	e8 4d 00 00 00       	call   804830f <_panic>
	return key_pressed[index];
 80482c2:	8b 45 08             	mov    0x8(%ebp),%eax
 80482c5:	8b 04 85 60 c4 04 08 	mov    0x804c460(,%eax,4),%eax
}
 80482cc:	c9                   	leave  
 80482cd:	c3                   	ret    

080482ce <key_operation>:

extern void control_plane(int);
void key_operation(void){
 80482ce:	55                   	push   %ebp
 80482cf:	89 e5                	mov    %esp,%ebp
 80482d1:	83 ec 28             	sub    $0x28,%esp
	int i;
	for(i=0;i<4;i++){
 80482d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80482db:	eb 2a                	jmp    8048307 <key_operation+0x39>
		if(query_key(i)==TRUE){
 80482dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482e0:	89 04 24             	mov    %eax,(%esp)
 80482e3:	e8 a4 ff ff ff       	call   804828c <query_key>
 80482e8:	83 f8 01             	cmp    $0x1,%eax
 80482eb:	75 16                	jne    8048303 <key_operation+0x35>
			control_plane(i);
 80482ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482f0:	89 04 24             	mov    %eax,(%esp)
 80482f3:	e8 4d 08 00 00       	call   8048b45 <control_plane>
			release_key(i);
 80482f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482fb:	89 04 24             	mov    %eax,(%esp)
 80482fe:	e8 43 ff ff ff       	call   8048246 <release_key>
}

extern void control_plane(int);
void key_operation(void){
	int i;
	for(i=0;i<4;i++){
 8048303:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048307:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
 804830b:	7e d0                	jle    80482dd <key_operation+0xf>
		if(query_key(i)==TRUE){
			control_plane(i);
			release_key(i);
		}
	}
}
 804830d:	c9                   	leave  
 804830e:	c3                   	ret    

0804830f <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
 804830f:	55                   	push   %ebp
 8048310:	89 e5                	mov    %esp,%ebp
 8048312:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
 8048315:	a1 70 c4 04 08       	mov    0x804c470,%eax
 804831a:	85 c0                	test   %eax,%eax
 804831c:	74 01                	je     804831f <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 804831e:	f4                   	hlt    
		hlt();
	panicstr = fmt;
 804831f:	8b 45 10             	mov    0x10(%ebp),%eax
 8048322:	a3 70 c4 04 08       	mov    %eax,0x804c470

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
 8048327:	fa                   	cli    
 8048328:	fc                   	cld    

	va_start(ap, fmt);
 8048329:	8d 45 14             	lea    0x14(%ebp),%eax
 804832c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel panic at %s:%d: ", file, line);
 804832f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048332:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048336:	8b 45 08             	mov    0x8(%ebp),%eax
 8048339:	89 44 24 04          	mov    %eax,0x4(%esp)
 804833d:	c7 04 24 ff a1 04 08 	movl   $0x804a1ff,(%esp)
 8048344:	e8 8d 0f 00 00       	call   80492d6 <printf>
	vprintf(fmt, ap);
 8048349:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804834c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048350:	8b 45 10             	mov    0x10(%ebp),%eax
 8048353:	89 04 24             	mov    %eax,(%esp)
 8048356:	e8 48 0f 00 00       	call   80492a3 <vprintf>
	printf("\n");
 804835b:	c7 04 24 17 a2 04 08 	movl   $0x804a217,(%esp)
 8048362:	e8 6f 0f 00 00       	call   80492d6 <printf>
	va_end(ap);

}
 8048367:	c9                   	leave  
 8048368:	c3                   	ret    

08048369 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
 8048369:	55                   	push   %ebp
 804836a:	89 e5                	mov    %esp,%ebp
 804836c:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 804836f:	8d 45 14             	lea    0x14(%ebp),%eax
 8048372:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf("kernel warning at %s:%d: ", file, line);
 8048375:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048378:	89 44 24 08          	mov    %eax,0x8(%esp)
 804837c:	8b 45 08             	mov    0x8(%ebp),%eax
 804837f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048383:	c7 04 24 19 a2 04 08 	movl   $0x804a219,(%esp)
 804838a:	e8 47 0f 00 00       	call   80492d6 <printf>
	vprintf(fmt, ap);
 804838f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048392:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048396:	8b 45 10             	mov    0x10(%ebp),%eax
 8048399:	89 04 24             	mov    %eax,(%esp)
 804839c:	e8 02 0f 00 00       	call   80492a3 <vprintf>
	printf("\n");
 80483a1:	c7 04 24 17 a2 04 08 	movl   $0x804a217,(%esp)
 80483a8:	e8 29 0f 00 00       	call   80492d6 <printf>
	va_end(ap);
}
 80483ad:	c9                   	leave  
 80483ae:	c3                   	ret    

080483af <draw_character>:
#include "stdio.h"
#include "font.h"
#include "assert.h"


static inline void draw_character(char ch, int x, int y, int color) {
 80483af:	55                   	push   %ebp
 80483b0:	89 e5                	mov    %esp,%ebp
 80483b2:	83 ec 38             	sub    $0x38,%esp
 80483b5:	8b 45 08             	mov    0x8(%ebp),%eax
 80483b8:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i, j;
	assert((ch & 0x80) == 0);
 80483bb:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
 80483bf:	79 24                	jns    80483e5 <draw_character+0x36>
 80483c1:	c7 44 24 0c 33 a2 04 	movl   $0x804a233,0xc(%esp)
 80483c8:	08 
 80483c9:	c7 44 24 08 44 a2 04 	movl   $0x804a244,0x8(%esp)
 80483d0:	08 
 80483d1:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
 80483d8:	00 
 80483d9:	c7 04 24 59 a2 04 08 	movl   $0x804a259,(%esp)
 80483e0:	e8 2a ff ff ff       	call   804830f <_panic>
	char *p = font8x8_basic[(int)ch];
 80483e5:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
 80483e9:	c1 e0 03             	shl    $0x3,%eax
 80483ec:	05 60 c0 04 08       	add    $0x804c060,%eax
 80483f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (i = 0; i < 8; i ++) 
 80483f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80483fb:	eb 59                	jmp    8048456 <draw_character+0xa7>
		for (j = 0; j < 8; j ++) 
 80483fd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048404:	eb 46                	jmp    804844c <draw_character+0x9d>
			if ((p[i] >> j) & 1)
 8048406:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048409:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804840c:	01 d0                	add    %edx,%eax
 804840e:	0f b6 00             	movzbl (%eax),%eax
 8048411:	0f be d0             	movsbl %al,%edx
 8048414:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048417:	89 c1                	mov    %eax,%ecx
 8048419:	d3 fa                	sar    %cl,%edx
 804841b:	89 d0                	mov    %edx,%eax
 804841d:	83 e0 01             	and    $0x1,%eax
 8048420:	85 c0                	test   %eax,%eax
 8048422:	74 24                	je     8048448 <draw_character+0x99>
				draw_pixel(x + i, y + j, color);
 8048424:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048427:	8b 55 10             	mov    0x10(%ebp),%edx
 804842a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804842d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048430:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048433:	01 c2                	add    %eax,%edx
 8048435:	8b 45 14             	mov    0x14(%ebp),%eax
 8048438:	89 44 24 08          	mov    %eax,0x8(%esp)
 804843c:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048440:	89 14 24             	mov    %edx,(%esp)
 8048443:	e8 fb 0b 00 00       	call   8049043 <draw_pixel>
static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
		for (j = 0; j < 8; j ++) 
 8048448:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804844c:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 8048450:	7e b4                	jle    8048406 <draw_character+0x57>

static inline void draw_character(char ch, int x, int y, int color) {
	int i, j;
	assert((ch & 0x80) == 0);
	char *p = font8x8_basic[(int)ch];
	for (i = 0; i < 8; i ++) 
 8048452:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048456:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 804845a:	7e a1                	jle    80483fd <draw_character+0x4e>
		for (j = 0; j < 8; j ++) 
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}
 804845c:	c9                   	leave  
 804845d:	c3                   	ret    

0804845e <draw_string>:

void draw_string(const char *str, int x, int y, int color) {
 804845e:	55                   	push   %ebp
 804845f:	89 e5                	mov    %esp,%ebp
 8048461:	83 ec 18             	sub    $0x18,%esp
	while (*str) {
 8048464:	eb 4a                	jmp    80484b0 <draw_string+0x52>
		draw_character(*str ++, x, y, color);
 8048466:	8b 45 08             	mov    0x8(%ebp),%eax
 8048469:	8d 50 01             	lea    0x1(%eax),%edx
 804846c:	89 55 08             	mov    %edx,0x8(%ebp)
 804846f:	0f b6 00             	movzbl (%eax),%eax
 8048472:	0f be c0             	movsbl %al,%eax
 8048475:	8b 55 14             	mov    0x14(%ebp),%edx
 8048478:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804847c:	8b 55 10             	mov    0x10(%ebp),%edx
 804847f:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048483:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048486:	89 54 24 04          	mov    %edx,0x4(%esp)
 804848a:	89 04 24             	mov    %eax,(%esp)
 804848d:	e8 1d ff ff ff       	call   80483af <draw_character>
		if (y + 8 >= SCR_WIDTH) {
 8048492:	8b 45 10             	mov    0x10(%ebp),%eax
 8048495:	83 c0 08             	add    $0x8,%eax
 8048498:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 804849d:	7e 0d                	jle    80484ac <draw_string+0x4e>
			x += 8; y = 0;
 804849f:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
 80484a3:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 80484aa:	eb 04                	jmp    80484b0 <draw_string+0x52>
		} else {
			y += 8;
 80484ac:	83 45 10 08          	addl   $0x8,0x10(%ebp)
			if ((p[i] >> j) & 1)
				draw_pixel(x + i, y + j, color);
}

void draw_string(const char *str, int x, int y, int color) {
	while (*str) {
 80484b0:	8b 45 08             	mov    0x8(%ebp),%eax
 80484b3:	0f b6 00             	movzbl (%eax),%eax
 80484b6:	84 c0                	test   %al,%al
 80484b8:	75 ac                	jne    8048466 <draw_string+0x8>
			x += 8; y = 0;
		} else {
			y += 8;
		}
	}
}
 80484ba:	c9                   	leave  
 80484bb:	c3                   	ret    

080484bc <draw_bomb>:

void draw_bomb(int x,int y,int w,int color){
 80484bc:	55                   	push   %ebp
 80484bd:	89 e5                	mov    %esp,%ebp
 80484bf:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for(i=0;i<w;i++){
 80484c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80484c9:	eb 3d                	jmp    8048508 <draw_bomb+0x4c>
		for(j=0;j<w;j++){
 80484cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 80484d2:	eb 28                	jmp    80484fc <draw_bomb+0x40>
			draw_pixel(x+i,y+j,color);
 80484d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80484d7:	8b 55 0c             	mov    0xc(%ebp),%edx
 80484da:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80484dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484e0:	8b 55 08             	mov    0x8(%ebp),%edx
 80484e3:	01 c2                	add    %eax,%edx
 80484e5:	8b 45 14             	mov    0x14(%ebp),%eax
 80484e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484ec:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80484f0:	89 14 24             	mov    %edx,(%esp)
 80484f3:	e8 4b 0b 00 00       	call   8049043 <draw_pixel>
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
		for(j=0;j<w;j++){
 80484f8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 80484fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80484ff:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048502:	7c d0                	jl     80484d4 <draw_bomb+0x18>
	}
}

void draw_bomb(int x,int y,int w,int color){
	int i,j;
	for(i=0;i<w;i++){
 8048504:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048508:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804850b:	3b 45 10             	cmp    0x10(%ebp),%eax
 804850e:	7c bb                	jl     80484cb <draw_bomb+0xf>
		for(j=0;j<w;j++){
			draw_pixel(x+i,y+j,color);
		}
	}
}
 8048510:	c9                   	leave  
 8048511:	c3                   	ret    

08048512 <redraw_screen>:

void
redraw_screen() {
 8048512:	55                   	push   %ebp
 8048513:	89 e5                	mov    %esp,%ebp
 8048515:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	sysclean(); 
 8048518:	e8 8e 0b 00 00       	call   80490ab <sysclean>
	for (it = get_st_head(); it != NULL; ) {
 804851d:	e8 42 07 00 00       	call   8048c64 <get_st_head>
 8048522:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048525:	eb 37                	jmp    804855e <redraw_screen+0x4c>
		draw_bomb(it->x, it->y, it->w, 6);
 8048527:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804852a:	8b 48 08             	mov    0x8(%eax),%ecx
 804852d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048530:	8b 50 04             	mov    0x4(%eax),%edx
 8048533:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048536:	8b 00                	mov    (%eax),%eax
 8048538:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 804853f:	00 
 8048540:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048544:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048548:	89 04 24             	mov    %eax,(%esp)
 804854b:	e8 6c ff ff ff       	call   80484bc <draw_bomb>
		it=st_next(it);
 8048550:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048553:	89 04 24             	mov    %eax,(%esp)
 8048556:	e8 cf 04 00 00       	call   8048a2a <st_next>
 804855b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void
redraw_screen() {
	st_t it;
	sysclean(); 
	for (it = get_st_head(); it != NULL; ) {
 804855e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048562:	75 c3                	jne    8048527 <redraw_screen+0x15>
		draw_bomb(it->x, it->y, it->w, 6);
		it=st_next(it);
	}
	
	draw_bomb(pl.x,pl.y,pl.w,9);
 8048564:	8b 0d 88 6c 09 08    	mov    0x8096c88,%ecx
 804856a:	8b 15 84 6c 09 08    	mov    0x8096c84,%edx
 8048570:	a1 80 6c 09 08       	mov    0x8096c80,%eax
 8048575:	c7 44 24 0c 09 00 00 	movl   $0x9,0xc(%esp)
 804857c:	00 
 804857d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048581:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048585:	89 04 24             	mov    %eax,(%esp)
 8048588:	e8 2f ff ff ff       	call   80484bc <draw_bomb>
	const char *score=itoa(get_score());
 804858d:	e8 be 06 00 00       	call   8048c50 <get_score>
 8048592:	89 04 24             	mov    %eax,(%esp)
 8048595:	e8 7d 0d 00 00       	call   8049317 <itoa>
 804859a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	draw_string("SCORE:",0,SCR_WIDTH - (strlen(score) + 6) * 8,1);
 804859d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80485a0:	89 04 24             	mov    %eax,(%esp)
 80485a3:	e8 0b 0e 00 00       	call   80493b3 <strlen>
 80485a8:	89 c2                	mov    %eax,%edx
 80485aa:	b8 00 00 00 00       	mov    $0x0,%eax
 80485af:	29 d0                	sub    %edx,%eax
 80485b1:	c1 e0 03             	shl    $0x3,%eax
 80485b4:	05 10 01 00 00       	add    $0x110,%eax
 80485b9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 80485c0:	00 
 80485c1:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80485cc:	00 
 80485cd:	c7 04 24 65 a2 04 08 	movl   $0x804a265,(%esp)
 80485d4:	e8 85 fe ff ff       	call   804845e <draw_string>
	draw_string(score, 0, SCR_WIDTH - strlen(score) * 8, 1);
 80485d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80485dc:	89 04 24             	mov    %eax,(%esp)
 80485df:	e8 cf 0d 00 00       	call   80493b3 <strlen>
 80485e4:	89 c2                	mov    %eax,%edx
 80485e6:	b8 00 00 00 00       	mov    $0x0,%eax
 80485eb:	29 d0                	sub    %edx,%eax
 80485ed:	c1 e0 03             	shl    $0x3,%eax
 80485f0:	05 40 01 00 00       	add    $0x140,%eax
 80485f5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 80485fc:	00 
 80485fd:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048601:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048608:	00 
 8048609:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804860c:	89 04 24             	mov    %eax,(%esp)
 804860f:	e8 4a fe ff ff       	call   804845e <draw_string>
	//printk("score:%s\n",score);
	const char *miss = itoa(get_miss());
 8048614:	e8 41 06 00 00       	call   8048c5a <get_miss>
 8048619:	89 04 24             	mov    %eax,(%esp)
 804861c:	e8 f6 0c 00 00       	call   8049317 <itoa>
 8048621:	89 45 ec             	mov    %eax,-0x14(%ebp)
	draw_string("MISS:",SCR_HEIGHT-8,SCR_WIDTH - (strlen(miss)+5)*8,2);
 8048624:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048627:	89 04 24             	mov    %eax,(%esp)
 804862a:	e8 84 0d 00 00       	call   80493b3 <strlen>
 804862f:	89 c2                	mov    %eax,%edx
 8048631:	b8 00 00 00 00       	mov    $0x0,%eax
 8048636:	29 d0                	sub    %edx,%eax
 8048638:	c1 e0 03             	shl    $0x3,%eax
 804863b:	05 18 01 00 00       	add    $0x118,%eax
 8048640:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8048647:	00 
 8048648:	89 44 24 08          	mov    %eax,0x8(%esp)
 804864c:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 8048653:	00 
 8048654:	c7 04 24 6c a2 04 08 	movl   $0x804a26c,(%esp)
 804865b:	e8 fe fd ff ff       	call   804845e <draw_string>
	draw_string(miss, SCR_HEIGHT - 8, SCR_WIDTH - strlen(miss) * 8, 2);
 8048660:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048663:	89 04 24             	mov    %eax,(%esp)
 8048666:	e8 48 0d 00 00       	call   80493b3 <strlen>
 804866b:	89 c2                	mov    %eax,%edx
 804866d:	b8 00 00 00 00       	mov    $0x0,%eax
 8048672:	29 d0                	sub    %edx,%eax
 8048674:	c1 e0 03             	shl    $0x3,%eax
 8048677:	05 40 01 00 00       	add    $0x140,%eax
 804867c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8048683:	00 
 8048684:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048688:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 804868f:	00 
 8048690:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048693:	89 04 24             	mov    %eax,(%esp)
 8048696:	e8 c3 fd ff ff       	call   804845e <draw_string>
	//printk("miss:%s\n",miss);
	draw_string(itoa(get_fps()), 0, 0, 14);
 804869b:	e8 74 00 00 00       	call   8048714 <get_fps>
 80486a0:	89 04 24             	mov    %eax,(%esp)
 80486a3:	e8 6f 0c 00 00       	call   8049317 <itoa>
 80486a8:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 80486af:	00 
 80486b0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80486b7:	00 
 80486b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80486bf:	00 
 80486c0:	89 04 24             	mov    %eax,(%esp)
 80486c3:	e8 96 fd ff ff       	call   804845e <draw_string>
	draw_string("FPS", 0, strlen(itoa(get_fps())) * 8, 14);
 80486c8:	e8 47 00 00 00       	call   8048714 <get_fps>
 80486cd:	89 04 24             	mov    %eax,(%esp)
 80486d0:	e8 42 0c 00 00       	call   8049317 <itoa>
 80486d5:	89 04 24             	mov    %eax,(%esp)
 80486d8:	e8 d6 0c 00 00       	call   80493b3 <strlen>
 80486dd:	c1 e0 03             	shl    $0x3,%eax
 80486e0:	c7 44 24 0c 0e 00 00 	movl   $0xe,0xc(%esp)
 80486e7:	00 
 80486e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80486ec:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80486f3:	00 
 80486f4:	c7 04 24 72 a2 04 08 	movl   $0x804a272,(%esp)
 80486fb:	e8 5e fd ff ff       	call   804845e <draw_string>
	syspr();
 8048700:	e8 ca 09 00 00       	call   80490cf <syspr>
}
 8048705:	c9                   	leave  
 8048706:	c3                   	ret    

08048707 <set_fps>:
#define UPDATE_STONE_POS 30
#define UPDATE_BANG 30


static int real_fps;
void set_fps(int value) {
 8048707:	55                   	push   %ebp
 8048708:	89 e5                	mov    %esp,%ebp
	real_fps = value;
 804870a:	8b 45 08             	mov    0x8(%ebp),%eax
 804870d:	a3 74 c4 04 08       	mov    %eax,0x804c474
}
 8048712:	5d                   	pop    %ebp
 8048713:	c3                   	ret    

08048714 <get_fps>:
int get_fps() {
 8048714:	55                   	push   %ebp
 8048715:	89 e5                	mov    %esp,%ebp
	return real_fps;
 8048717:	a1 74 c4 04 08       	mov    0x804c474,%eax
}
 804871c:	5d                   	pop    %ebp
 804871d:	c3                   	ret    

0804871e <main_loop>:


extern void key_operation();
void main_loop(void) {
 804871e:	55                   	push   %ebp
 804871f:	89 e5                	mov    %esp,%ebp
 8048721:	83 ec 38             	sub    $0x38,%esp
	int now = systime();
 8048724:	e8 c2 09 00 00       	call   80490eb <systime>
 8048729:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int target;
	int num_draw = 0;
 804872c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	bool redraw;

	pl.x=100;
 8048733:	c7 05 80 6c 09 08 64 	movl   $0x64,0x8096c80
 804873a:	00 00 00 
	pl.y=150;
 804873d:	c7 05 84 6c 09 08 96 	movl   $0x96,0x8096c84
 8048744:	00 00 00 
	pl.w=10;
 8048747:	c7 05 88 6c 09 08 0a 	movl   $0xa,0x8096c88
 804874e:	00 00 00 
	pl.v=10;
 8048751:	c7 05 8c 6c 09 08 0a 	movl   $0xa,0x8096c8c
 8048758:	00 00 00 
	int k=0;
 804875b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	while (TRUE) {
	
		key_operation();
 8048762:	e8 67 fb ff ff       	call   80482ce <key_operation>
		target = systime(); 
 8048767:	e8 7f 09 00 00       	call   80490eb <systime>
 804876c:	89 45 e0             	mov    %eax,-0x20(%ebp)
		redraw = FALSE;
 804876f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		while (now < target) { 
 8048776:	e9 06 01 00 00       	jmp    8048881 <main_loop+0x163>
			int code=sysreadkey();
 804877b:	e8 7f 09 00 00       	call   80490ff <sysreadkey>
 8048780:	89 45 dc             	mov    %eax,-0x24(%ebp)
			if(code!=-1){
 8048783:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
 8048787:	74 0b                	je     8048794 <main_loop+0x76>
				press_key(code);
 8048789:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804878c:	89 04 24             	mov    %eax,(%esp)
 804878f:	e8 7a fa ff ff       	call   804820e <press_key>
			}
			if (now % (HZ / CREATE_NEW_STONE) == 0) {
 8048794:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048797:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 804879c:	89 c8                	mov    %ecx,%eax
 804879e:	f7 ea                	imul   %edx
 80487a0:	c1 fa 05             	sar    $0x5,%edx
 80487a3:	89 c8                	mov    %ecx,%eax
 80487a5:	c1 f8 1f             	sar    $0x1f,%eax
 80487a8:	29 c2                	sub    %eax,%edx
 80487aa:	89 d0                	mov    %edx,%eax
 80487ac:	6b c0 64             	imul   $0x64,%eax,%eax
 80487af:	29 c1                	sub    %eax,%ecx
 80487b1:	89 c8                	mov    %ecx,%eax
 80487b3:	85 c0                	test   %eax,%eax
 80487b5:	75 05                	jne    80487bc <main_loop+0x9e>
				create_new_stone();
 80487b7:	e8 b2 04 00 00       	call   8048c6e <create_new_stone>
			} 
		
			if (now % (HZ / UPDATE_STONE_POS) == 0) {
 80487bc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80487bf:	ba 56 55 55 55       	mov    $0x55555556,%edx
 80487c4:	89 c8                	mov    %ecx,%eax
 80487c6:	f7 ea                	imul   %edx
 80487c8:	89 c8                	mov    %ecx,%eax
 80487ca:	c1 f8 1f             	sar    $0x1f,%eax
 80487cd:	29 c2                	sub    %eax,%edx
 80487cf:	89 d0                	mov    %edx,%eax
 80487d1:	01 c0                	add    %eax,%eax
 80487d3:	01 d0                	add    %edx,%eax
 80487d5:	29 c1                	sub    %eax,%ecx
 80487d7:	89 ca                	mov    %ecx,%edx
 80487d9:	85 d2                	test   %edx,%edx
 80487db:	75 05                	jne    80487e2 <main_loop+0xc4>
				update_stone_pos();
 80487dd:	e8 2f 05 00 00       	call   8048d11 <update_stone_pos>
			}
			
			if (now % (HZ / UPDATE_BANG) == 0) {
 80487e2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80487e5:	ba 56 55 55 55       	mov    $0x55555556,%edx
 80487ea:	89 c8                	mov    %ecx,%eax
 80487ec:	f7 ea                	imul   %edx
 80487ee:	89 c8                	mov    %ecx,%eax
 80487f0:	c1 f8 1f             	sar    $0x1f,%eax
 80487f3:	29 c2                	sub    %eax,%edx
 80487f5:	89 d0                	mov    %edx,%eax
 80487f7:	01 c0                	add    %eax,%eax
 80487f9:	01 d0                	add    %edx,%eax
 80487fb:	29 c1                	sub    %eax,%ecx
 80487fd:	89 ca                	mov    %ecx,%edx
 80487ff:	85 d2                	test   %edx,%edx
 8048801:	75 05                	jne    8048808 <main_loop+0xea>
				update_bang();
 8048803:	e8 a3 07 00 00       	call   8048fab <update_bang>
			}
			
			if (now % (HZ / FPS) == 0) {
 8048808:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 804880b:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048810:	89 c8                	mov    %ecx,%eax
 8048812:	f7 ea                	imul   %edx
 8048814:	89 c8                	mov    %ecx,%eax
 8048816:	c1 f8 1f             	sar    $0x1f,%eax
 8048819:	29 c2                	sub    %eax,%edx
 804881b:	89 d0                	mov    %edx,%eax
 804881d:	01 c0                	add    %eax,%eax
 804881f:	01 d0                	add    %edx,%eax
 8048821:	29 c1                	sub    %eax,%ecx
 8048823:	89 ca                	mov    %ecx,%edx
 8048825:	85 d2                	test   %edx,%edx
 8048827:	75 07                	jne    8048830 <main_loop+0x112>
				redraw = TRUE;
 8048829:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
			}
		
			if (now % (HZ/2) == 0) {
 8048830:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048833:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 8048838:	89 c8                	mov    %ecx,%eax
 804883a:	f7 ea                	imul   %edx
 804883c:	c1 fa 04             	sar    $0x4,%edx
 804883f:	89 c8                	mov    %ecx,%eax
 8048841:	c1 f8 1f             	sar    $0x1f,%eax
 8048844:	29 c2                	sub    %eax,%edx
 8048846:	89 d0                	mov    %edx,%eax
 8048848:	6b c0 32             	imul   $0x32,%eax,%eax
 804884b:	29 c1                	sub    %eax,%ecx
 804884d:	89 c8                	mov    %ecx,%eax
 804884f:	85 c0                	test   %eax,%eax
 8048851:	75 2a                	jne    804887d <main_loop+0x15f>
				int now_fps = num_draw * 2 + 1;
 8048853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048856:	01 c0                	add    %eax,%eax
 8048858:	83 c0 01             	add    $0x1,%eax
 804885b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				if (now_fps > FPS) now_fps = FPS;
 804885e:	83 7d e4 1e          	cmpl   $0x1e,-0x1c(%ebp)
 8048862:	7e 07                	jle    804886b <main_loop+0x14d>
 8048864:	c7 45 e4 1e 00 00 00 	movl   $0x1e,-0x1c(%ebp)
				set_fps(now_fps);
 804886b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804886e:	89 04 24             	mov    %eax,(%esp)
 8048871:	e8 91 fe ff ff       	call   8048707 <set_fps>
				num_draw = 0;
 8048876:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
			}
			now ++;
 804887d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	while (TRUE) {
	
		key_operation();
		target = systime(); 
		redraw = FALSE;
		while (now < target) { 
 8048881:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048884:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 8048887:	0f 8c ee fe ff ff    	jl     804877b <main_loop+0x5d>
				num_draw = 0;
			}
			now ++;
		}

		if (redraw) { 
 804888d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8048891:	74 09                	je     804889c <main_loop+0x17e>
			num_draw ++;
 8048893:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			redraw_screen();
 8048897:	e8 76 fc ff ff       	call   8048512 <redraw_screen>
		}

		if(k==0){        //for test
 804889c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 80488a0:	75 23                	jne    80488c5 <main_loop+0x1a7>
			fork();
 80488a2:	e8 95 08 00 00       	call   804913c <fork>
			k=1;
 80488a7:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
			printf("%d\n",getpid());
 80488ae:	e8 9d 08 00 00       	call   8049150 <getpid>
 80488b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80488b7:	c7 04 24 76 a2 04 08 	movl   $0x804a276,(%esp)
 80488be:	e8 13 0a 00 00       	call   80492d6 <printf>
 80488c3:	eb 6c                	jmp    8048931 <main_loop+0x213>
		}
		else if(k%10==0)
 80488c5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 80488c8:	ba 67 66 66 66       	mov    $0x66666667,%edx
 80488cd:	89 c8                	mov    %ecx,%eax
 80488cf:	f7 ea                	imul   %edx
 80488d1:	c1 fa 02             	sar    $0x2,%edx
 80488d4:	89 c8                	mov    %ecx,%eax
 80488d6:	c1 f8 1f             	sar    $0x1f,%eax
 80488d9:	29 c2                	sub    %eax,%edx
 80488db:	89 d0                	mov    %edx,%eax
 80488dd:	c1 e0 02             	shl    $0x2,%eax
 80488e0:	01 d0                	add    %edx,%eax
 80488e2:	01 c0                	add    %eax,%eax
 80488e4:	29 c1                	sub    %eax,%ecx
 80488e6:	89 ca                	mov    %ecx,%edx
 80488e8:	85 d2                	test   %edx,%edx
 80488ea:	75 12                	jne    80488fe <main_loop+0x1e0>
		{
			sleep(1);
 80488ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80488f3:	e8 80 08 00 00       	call   8049178 <sleep>
			k++;
 80488f8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 80488fc:	eb 33                	jmp    8048931 <main_loop+0x213>
		}
		else if(k%100==0)
 80488fe:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048901:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 8048906:	89 c8                	mov    %ecx,%eax
 8048908:	f7 ea                	imul   %edx
 804890a:	c1 fa 05             	sar    $0x5,%edx
 804890d:	89 c8                	mov    %ecx,%eax
 804890f:	c1 f8 1f             	sar    $0x1f,%eax
 8048912:	29 c2                	sub    %eax,%edx
 8048914:	89 d0                	mov    %edx,%eax
 8048916:	6b c0 64             	imul   $0x64,%eax,%eax
 8048919:	29 c1                	sub    %eax,%ecx
 804891b:	89 c8                	mov    %ecx,%eax
 804891d:	85 c0                	test   %eax,%eax
 804891f:	75 07                	jne    8048928 <main_loop+0x20a>
		{
			exit();
 8048921:	e8 3e 08 00 00       	call   8049164 <exit>
 8048926:	eb 09                	jmp    8048931 <main_loop+0x213>
		}
		else
			k++;
 8048928:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
	}
 804892c:	e9 31 fe ff ff       	jmp    8048762 <main_loop+0x44>
 8048931:	e9 2c fe ff ff       	jmp    8048762 <main_loop+0x44>

08048936 <st_new>:
#include "video.h"
#include "x86.h"
#include "types.h"
#include "assert.h"

LINKLIST_IMPL(st, 10000)
 8048936:	55                   	push   %ebp
 8048937:	89 e5                	mov    %esp,%ebp
 8048939:	83 ec 28             	sub    $0x28,%esp
 804893c:	a1 18 6e 08 08       	mov    0x8086e18,%eax
 8048941:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048944:	c7 45 ec 80 c4 04 08 	movl   $0x804c480,-0x14(%ebp)
 804894b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804894f:	75 47                	jne    8048998 <st_new+0x62>
 8048951:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 8048958:	eb 2f                	jmp    8048989 <st_new+0x53>
 804895a:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804895d:	89 d0                	mov    %edx,%eax
 804895f:	01 c0                	add    %eax,%eax
 8048961:	01 d0                	add    %edx,%eax
 8048963:	c1 e0 03             	shl    $0x3,%eax
 8048966:	8d 50 e8             	lea    -0x18(%eax),%edx
 8048969:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804896c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804896f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048972:	89 d0                	mov    %edx,%eax
 8048974:	01 c0                	add    %eax,%eax
 8048976:	01 d0                	add    %edx,%eax
 8048978:	c1 e0 03             	shl    $0x3,%eax
 804897b:	89 c2                	mov    %eax,%edx
 804897d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048980:	01 d0                	add    %edx,%eax
 8048982:	89 41 14             	mov    %eax,0x14(%ecx)
 8048985:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048989:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
 8048990:	7e c8                	jle    804895a <st_new+0x24>
 8048992:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048995:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048998:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804899b:	8b 40 14             	mov    0x14(%eax),%eax
 804899e:	85 c0                	test   %eax,%eax
 80489a0:	75 24                	jne    80489c6 <st_new+0x90>
 80489a2:	c7 44 24 0c 7a a2 04 	movl   $0x804a27a,0xc(%esp)
 80489a9:	08 
 80489aa:	c7 44 24 08 93 a2 04 	movl   $0x804a293,0x8(%esp)
 80489b1:	08 
 80489b2:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 80489b9:	00 
 80489ba:	c7 04 24 a8 a2 04 08 	movl   $0x804a2a8,(%esp)
 80489c1:	e8 49 f9 ff ff       	call   804830f <_panic>
 80489c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80489cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489cf:	8b 40 14             	mov    0x14(%eax),%eax
 80489d2:	a3 18 6e 08 08       	mov    %eax,0x8086e18
 80489d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80489da:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 80489e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80489e4:	8b 50 14             	mov    0x14(%eax),%edx
 80489e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80489ea:	89 50 10             	mov    %edx,0x10(%eax)
 80489ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80489f0:	c9                   	leave  
 80489f1:	c3                   	ret    

080489f2 <st_prev>:
 80489f2:	55                   	push   %ebp
 80489f3:	89 e5                	mov    %esp,%ebp
 80489f5:	83 ec 18             	sub    $0x18,%esp
 80489f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80489fc:	75 24                	jne    8048a22 <st_prev+0x30>
 80489fe:	c7 44 24 0c b6 a2 04 	movl   $0x804a2b6,0xc(%esp)
 8048a05:	08 
 8048a06:	c7 44 24 08 93 a2 04 	movl   $0x804a293,0x8(%esp)
 8048a0d:	08 
 8048a0e:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048a15:	00 
 8048a16:	c7 04 24 a8 a2 04 08 	movl   $0x804a2a8,(%esp)
 8048a1d:	e8 ed f8 ff ff       	call   804830f <_panic>
 8048a22:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a25:	8b 40 10             	mov    0x10(%eax),%eax
 8048a28:	c9                   	leave  
 8048a29:	c3                   	ret    

08048a2a <st_next>:
 8048a2a:	55                   	push   %ebp
 8048a2b:	89 e5                	mov    %esp,%ebp
 8048a2d:	83 ec 18             	sub    $0x18,%esp
 8048a30:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048a34:	75 24                	jne    8048a5a <st_next+0x30>
 8048a36:	c7 44 24 0c b6 a2 04 	movl   $0x804a2b6,0xc(%esp)
 8048a3d:	08 
 8048a3e:	c7 44 24 08 93 a2 04 	movl   $0x804a293,0x8(%esp)
 8048a45:	08 
 8048a46:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048a4d:	00 
 8048a4e:	c7 04 24 a8 a2 04 08 	movl   $0x804a2a8,(%esp)
 8048a55:	e8 b5 f8 ff ff       	call   804830f <_panic>
 8048a5a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a5d:	8b 40 14             	mov    0x14(%eax),%eax
 8048a60:	c9                   	leave  
 8048a61:	c3                   	ret    

08048a62 <st_insert>:
 8048a62:	55                   	push   %ebp
 8048a63:	89 e5                	mov    %esp,%ebp
 8048a65:	83 ec 18             	sub    $0x18,%esp
 8048a68:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048a6c:	75 2a                	jne    8048a98 <st_insert+0x36>
 8048a6e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048a72:	75 24                	jne    8048a98 <st_insert+0x36>
 8048a74:	c7 44 24 0c c3 a2 04 	movl   $0x804a2c3,0xc(%esp)
 8048a7b:	08 
 8048a7c:	c7 44 24 08 93 a2 04 	movl   $0x804a293,0x8(%esp)
 8048a83:	08 
 8048a84:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048a8b:	00 
 8048a8c:	c7 04 24 a8 a2 04 08 	movl   $0x804a2a8,(%esp)
 8048a93:	e8 77 f8 ff ff       	call   804830f <_panic>
 8048a98:	8b 45 10             	mov    0x10(%ebp),%eax
 8048a9b:	8b 55 08             	mov    0x8(%ebp),%edx
 8048a9e:	89 50 10             	mov    %edx,0x10(%eax)
 8048aa1:	8b 45 10             	mov    0x10(%ebp),%eax
 8048aa4:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048aa7:	89 50 14             	mov    %edx,0x14(%eax)
 8048aaa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048aae:	74 09                	je     8048ab9 <st_insert+0x57>
 8048ab0:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ab3:	8b 55 10             	mov    0x10(%ebp),%edx
 8048ab6:	89 50 14             	mov    %edx,0x14(%eax)
 8048ab9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048abd:	74 09                	je     8048ac8 <st_insert+0x66>
 8048abf:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ac2:	8b 55 10             	mov    0x10(%ebp),%edx
 8048ac5:	89 50 10             	mov    %edx,0x10(%eax)
 8048ac8:	c9                   	leave  
 8048ac9:	c3                   	ret    

08048aca <st_remove>:
 8048aca:	55                   	push   %ebp
 8048acb:	89 e5                	mov    %esp,%ebp
 8048acd:	83 ec 28             	sub    $0x28,%esp
 8048ad0:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ad3:	8b 40 10             	mov    0x10(%eax),%eax
 8048ad6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048ad9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048adc:	8b 40 14             	mov    0x14(%eax),%eax
 8048adf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048ae2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048ae6:	75 24                	jne    8048b0c <st_remove+0x42>
 8048ae8:	c7 44 24 0c b6 a2 04 	movl   $0x804a2b6,0xc(%esp)
 8048aef:	08 
 8048af0:	c7 44 24 08 93 a2 04 	movl   $0x804a293,0x8(%esp)
 8048af7:	08 
 8048af8:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048aff:	00 
 8048b00:	c7 04 24 a8 a2 04 08 	movl   $0x804a2a8,(%esp)
 8048b07:	e8 03 f8 ff ff       	call   804830f <_panic>
 8048b0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048b10:	74 09                	je     8048b1b <st_remove+0x51>
 8048b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b15:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048b18:	89 50 14             	mov    %edx,0x14(%eax)
 8048b1b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048b1f:	74 09                	je     8048b2a <st_remove+0x60>
 8048b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b24:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048b27:	89 50 10             	mov    %edx,0x10(%eax)
 8048b2a:	c9                   	leave  
 8048b2b:	c3                   	ret    

08048b2c <st_free>:
 8048b2c:	55                   	push   %ebp
 8048b2d:	89 e5                	mov    %esp,%ebp
 8048b2f:	8b 15 18 6e 08 08    	mov    0x8086e18,%edx
 8048b35:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b38:	89 50 14             	mov    %edx,0x14(%eax)
 8048b3b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b3e:	a3 18 6e 08 08       	mov    %eax,0x8086e18
 8048b43:	5d                   	pop    %ebp
 8048b44:	c3                   	ret    

08048b45 <control_plane>:
static st_t head = NULL;
static int score = 0, miss = 0;

enum{UP,DOWN,LEFT,RIGHT};

void control_plane(int op){
 8048b45:	55                   	push   %ebp
 8048b46:	89 e5                	mov    %esp,%ebp
 8048b48:	83 ec 18             	sub    $0x18,%esp
	switch(op){
 8048b4b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b4e:	83 f8 01             	cmp    $0x1,%eax
 8048b51:	74 4e                	je     8048ba1 <control_plane+0x5c>
 8048b53:	83 f8 01             	cmp    $0x1,%eax
 8048b56:	7f 09                	jg     8048b61 <control_plane+0x1c>
 8048b58:	85 c0                	test   %eax,%eax
 8048b5a:	74 18                	je     8048b74 <control_plane+0x2f>
 8048b5c:	e9 c9 00 00 00       	jmp    8048c2a <control_plane+0xe5>
 8048b61:	83 f8 02             	cmp    $0x2,%eax
 8048b64:	74 6c                	je     8048bd2 <control_plane+0x8d>
 8048b66:	83 f8 03             	cmp    $0x3,%eax
 8048b69:	0f 84 8a 00 00 00    	je     8048bf9 <control_plane+0xb4>
 8048b6f:	e9 b6 00 00 00       	jmp    8048c2a <control_plane+0xe5>
		case UP   :if(pl.x>=pl.v) pl.x-=pl.v;break;
 8048b74:	8b 15 80 6c 09 08    	mov    0x8096c80,%edx
 8048b7a:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048b7f:	39 c2                	cmp    %eax,%edx
 8048b81:	7c 19                	jl     8048b9c <control_plane+0x57>
 8048b83:	8b 15 80 6c 09 08    	mov    0x8096c80,%edx
 8048b89:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048b8e:	29 c2                	sub    %eax,%edx
 8048b90:	89 d0                	mov    %edx,%eax
 8048b92:	a3 80 6c 09 08       	mov    %eax,0x8096c80
 8048b97:	e9 b2 00 00 00       	jmp    8048c4e <control_plane+0x109>
 8048b9c:	e9 ad 00 00 00       	jmp    8048c4e <control_plane+0x109>
		case DOWN :if(pl.x+pl.v+pl.w<=SCR_HEIGHT) pl.x+=pl.v;break;
 8048ba1:	8b 15 80 6c 09 08    	mov    0x8096c80,%edx
 8048ba7:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048bac:	01 c2                	add    %eax,%edx
 8048bae:	a1 88 6c 09 08       	mov    0x8096c88,%eax
 8048bb3:	01 d0                	add    %edx,%eax
 8048bb5:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048bba:	7f 14                	jg     8048bd0 <control_plane+0x8b>
 8048bbc:	8b 15 80 6c 09 08    	mov    0x8096c80,%edx
 8048bc2:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048bc7:	01 d0                	add    %edx,%eax
 8048bc9:	a3 80 6c 09 08       	mov    %eax,0x8096c80
 8048bce:	eb 7e                	jmp    8048c4e <control_plane+0x109>
 8048bd0:	eb 7c                	jmp    8048c4e <control_plane+0x109>
		case LEFT :if(pl.y>=pl.v) pl.y-=pl.v;break;
 8048bd2:	8b 15 84 6c 09 08    	mov    0x8096c84,%edx
 8048bd8:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048bdd:	39 c2                	cmp    %eax,%edx
 8048bdf:	7c 16                	jl     8048bf7 <control_plane+0xb2>
 8048be1:	8b 15 84 6c 09 08    	mov    0x8096c84,%edx
 8048be7:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048bec:	29 c2                	sub    %eax,%edx
 8048bee:	89 d0                	mov    %edx,%eax
 8048bf0:	a3 84 6c 09 08       	mov    %eax,0x8096c84
 8048bf5:	eb 57                	jmp    8048c4e <control_plane+0x109>
 8048bf7:	eb 55                	jmp    8048c4e <control_plane+0x109>
		case RIGHT:if(pl.y+pl.v+pl.w<=SCR_WIDTH) pl.y+=pl.v;break;
 8048bf9:	8b 15 84 6c 09 08    	mov    0x8096c84,%edx
 8048bff:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048c04:	01 c2                	add    %eax,%edx
 8048c06:	a1 88 6c 09 08       	mov    0x8096c88,%eax
 8048c0b:	01 d0                	add    %edx,%eax
 8048c0d:	3d 40 01 00 00       	cmp    $0x140,%eax
 8048c12:	7f 14                	jg     8048c28 <control_plane+0xe3>
 8048c14:	8b 15 84 6c 09 08    	mov    0x8096c84,%edx
 8048c1a:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048c1f:	01 d0                	add    %edx,%eax
 8048c21:	a3 84 6c 09 08       	mov    %eax,0x8096c84
 8048c26:	eb 26                	jmp    8048c4e <control_plane+0x109>
 8048c28:	eb 24                	jmp    8048c4e <control_plane+0x109>
		default:assert(0);
 8048c2a:	c7 44 24 0c e0 a2 04 	movl   $0x804a2e0,0xc(%esp)
 8048c31:	08 
 8048c32:	c7 44 24 08 93 a2 04 	movl   $0x804a293,0x8(%esp)
 8048c39:	08 
 8048c3a:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
 8048c41:	00 
 8048c42:	c7 04 24 a8 a2 04 08 	movl   $0x804a2a8,(%esp)
 8048c49:	e8 c1 f6 ff ff       	call   804830f <_panic>
	}
}
 8048c4e:	c9                   	leave  
 8048c4f:	c3                   	ret    

08048c50 <get_score>:


int get_score(void) {
 8048c50:	55                   	push   %ebp
 8048c51:	89 e5                	mov    %esp,%ebp
	return score;
 8048c53:	a1 20 6e 08 08       	mov    0x8086e20,%eax
}
 8048c58:	5d                   	pop    %ebp
 8048c59:	c3                   	ret    

08048c5a <get_miss>:

int get_miss(void) {
 8048c5a:	55                   	push   %ebp
 8048c5b:	89 e5                	mov    %esp,%ebp
	return miss;
 8048c5d:	a1 24 6e 08 08       	mov    0x8086e24,%eax
}
 8048c62:	5d                   	pop    %ebp
 8048c63:	c3                   	ret    

08048c64 <get_st_head>:

st_t get_st_head(void){
 8048c64:	55                   	push   %ebp
 8048c65:	89 e5                	mov    %esp,%ebp
	return head;
 8048c67:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
}
 8048c6c:	5d                   	pop    %ebp
 8048c6d:	c3                   	ret    

08048c6e <create_new_stone>:

void create_new_stone(void) {
 8048c6e:	55                   	push   %ebp
 8048c6f:	89 e5                	mov    %esp,%ebp
 8048c71:	53                   	push   %ebx
 8048c72:	83 ec 24             	sub    $0x24,%esp
	if (head == NULL) {
 8048c75:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048c7a:	85 c0                	test   %eax,%eax
 8048c7c:	75 0c                	jne    8048c8a <create_new_stone+0x1c>
		head = st_new(); 
 8048c7e:	e8 b3 fc ff ff       	call   8048936 <st_new>
 8048c83:	a3 1c 6e 08 08       	mov    %eax,0x8086e1c
 8048c88:	eb 2c                	jmp    8048cb6 <create_new_stone+0x48>
	} 
	else {
		st_t now = st_new();
 8048c8a:	e8 a7 fc ff ff       	call   8048936 <st_new>
 8048c8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		st_insert(NULL, head, now); 
 8048c92:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048c97:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c9a:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048c9e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ca2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048ca9:	e8 b4 fd ff ff       	call   8048a62 <st_insert>
		head = now;
 8048cae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cb1:	a3 1c 6e 08 08       	mov    %eax,0x8086e1c
	}
	head->x = 0;
 8048cb6:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048cbb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	head->y = rand() % (SCR_WIDTH / 8 - 2) * 8 + 8;
 8048cc1:	8b 1d 1c 6e 08 08    	mov    0x8086e1c,%ebx
 8048cc7:	e8 dd 11 00 00       	call   8049ea9 <rand>
 8048ccc:	89 c1                	mov    %eax,%ecx
 8048cce:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 8048cd3:	89 c8                	mov    %ecx,%eax
 8048cd5:	f7 ea                	imul   %edx
 8048cd7:	c1 fa 04             	sar    $0x4,%edx
 8048cda:	89 c8                	mov    %ecx,%eax
 8048cdc:	c1 f8 1f             	sar    $0x1f,%eax
 8048cdf:	29 c2                	sub    %eax,%edx
 8048ce1:	89 d0                	mov    %edx,%eax
 8048ce3:	6b c0 26             	imul   $0x26,%eax,%eax
 8048ce6:	29 c1                	sub    %eax,%ecx
 8048ce8:	89 c8                	mov    %ecx,%eax
 8048cea:	83 c0 01             	add    $0x1,%eax
 8048ced:	c1 e0 03             	shl    $0x3,%eax
 8048cf0:	89 43 04             	mov    %eax,0x4(%ebx)
	head->v = 2;//(rand() % 1000 / 1000.0 + 1) / 2.0;
 8048cf3:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048cf8:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	head->w = 4;
 8048cff:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048d04:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
}
 8048d0b:	83 c4 24             	add    $0x24,%esp
 8048d0e:	5b                   	pop    %ebx
 8048d0f:	5d                   	pop    %ebp
 8048d10:	c3                   	ret    

08048d11 <update_stone_pos>:

void update_stone_pos(void) {
 8048d11:	55                   	push   %ebp
 8048d12:	89 e5                	mov    %esp,%ebp
 8048d14:	83 ec 28             	sub    $0x28,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048d17:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048d1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d1f:	eb 6f                	jmp    8048d90 <update_stone_pos+0x7f>
		st_t next = st_next(it);
 8048d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d24:	89 04 24             	mov    %eax,(%esp)
 8048d27:	e8 fe fc ff ff       	call   8048a2a <st_next>
 8048d2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		it->x += it->v; 
 8048d2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d32:	8b 10                	mov    (%eax),%edx
 8048d34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d37:	8b 40 0c             	mov    0xc(%eax),%eax
 8048d3a:	01 c2                	add    %eax,%edx
 8048d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d3f:	89 10                	mov    %edx,(%eax)
		if (it->x + it->w > SCR_HEIGHT) {
 8048d41:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d44:	8b 10                	mov    (%eax),%edx
 8048d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d49:	8b 40 08             	mov    0x8(%eax),%eax
 8048d4c:	01 d0                	add    %edx,%eax
 8048d4e:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8048d53:	7e 35                	jle    8048d8a <update_stone_pos+0x79>
			miss++; 
 8048d55:	a1 24 6e 08 08       	mov    0x8086e24,%eax
 8048d5a:	83 c0 01             	add    $0x1,%eax
 8048d5d:	a3 24 6e 08 08       	mov    %eax,0x8086e24
			//printk("miss/////:%d\n",miss);
			st_remove(it);
 8048d62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d65:	89 04 24             	mov    %eax,(%esp)
 8048d68:	e8 5d fd ff ff       	call   8048aca <st_remove>
			if (it == head) head = next; 
 8048d6d:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048d72:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8048d75:	75 08                	jne    8048d7f <update_stone_pos+0x6e>
 8048d77:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d7a:	a3 1c 6e 08 08       	mov    %eax,0x8086e1c
			st_free(it);
 8048d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d82:	89 04 24             	mov    %eax,(%esp)
 8048d85:	e8 a2 fd ff ff       	call   8048b2c <st_free>
		}
		it = next;
 8048d8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	head->w = 4;
}

void update_stone_pos(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8048d90:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048d94:	75 8b                	jne    8048d21 <update_stone_pos+0x10>
			if (it == head) head = next; 
			st_free(it);
		}
		it = next;
	}
}
 8048d96:	c9                   	leave  
 8048d97:	c3                   	ret    

08048d98 <inplane>:

typedef struct {
	int x,y,w;
}Stone;

bool inplane(int x,int y,Stone s){
 8048d98:	55                   	push   %ebp
 8048d99:	89 e5                	mov    %esp,%ebp
	return (s.x<=x&&x<=s.x+s.w)&&(s.y<=y&&y<=s.y+s.w);
 8048d9b:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d9e:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048da1:	7f 29                	jg     8048dcc <inplane+0x34>
 8048da3:	8b 55 10             	mov    0x10(%ebp),%edx
 8048da6:	8b 45 18             	mov    0x18(%ebp),%eax
 8048da9:	01 d0                	add    %edx,%eax
 8048dab:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048dae:	7c 1c                	jl     8048dcc <inplane+0x34>
 8048db0:	8b 45 14             	mov    0x14(%ebp),%eax
 8048db3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048db6:	7f 14                	jg     8048dcc <inplane+0x34>
 8048db8:	8b 55 14             	mov    0x14(%ebp),%edx
 8048dbb:	8b 45 18             	mov    0x18(%ebp),%eax
 8048dbe:	01 d0                	add    %edx,%eax
 8048dc0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048dc3:	7c 07                	jl     8048dcc <inplane+0x34>
 8048dc5:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dca:	eb 05                	jmp    8048dd1 <inplane+0x39>
 8048dcc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048dd1:	5d                   	pop    %ebp
 8048dd2:	c3                   	ret    

08048dd3 <bang_or_not>:


bool bang_or_not(Plane pl,st_t it){
 8048dd3:	55                   	push   %ebp
 8048dd4:	89 e5                	mov    %esp,%ebp
 8048dd6:	83 ec 34             	sub    $0x34,%esp
	Stone i,j;
	i.x=it->x;
 8048dd9:	8b 45 18             	mov    0x18(%ebp),%eax
 8048ddc:	8b 00                	mov    (%eax),%eax
 8048dde:	89 45 f4             	mov    %eax,-0xc(%ebp)
	i.y=it->y;
 8048de1:	8b 45 18             	mov    0x18(%ebp),%eax
 8048de4:	8b 40 04             	mov    0x4(%eax),%eax
 8048de7:	89 45 f8             	mov    %eax,-0x8(%ebp)
	i.w=it->w;
 8048dea:	8b 45 18             	mov    0x18(%ebp),%eax
 8048ded:	8b 40 08             	mov    0x8(%eax),%eax
 8048df0:	89 45 fc             	mov    %eax,-0x4(%ebp)
	j.x=pl.x;
 8048df3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048df6:	89 45 e8             	mov    %eax,-0x18(%ebp)
	j.y=pl.y;
 8048df9:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048dfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
	j.w=pl.w;
 8048dff:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e02:	89 45 f0             	mov    %eax,-0x10(%ebp)
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048e05:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e08:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e0b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048e0e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048e12:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 8048e15:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048e19:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048e1c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048e20:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048e24:	89 04 24             	mov    %eax,(%esp)
 8048e27:	e8 6c ff ff ff       	call   8048d98 <inplane>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048e2c:	85 c0                	test   %eax,%eax
 8048e2e:	0f 85 69 01 00 00    	jne    8048f9d <bang_or_not+0x1ca>
	i.y=it->y;
	i.w=it->w;
	j.x=pl.x;
	j.y=pl.y;
	j.w=pl.w;
	return inplane(pl.x,pl.y,i)||inplane(pl.x+pl.w,pl.y,i)
 8048e34:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048e37:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048e3a:	8b 55 10             	mov    0x10(%ebp),%edx
 8048e3d:	01 d1                	add    %edx,%ecx
 8048e3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e42:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048e46:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e49:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048e4d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048e50:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048e54:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048e58:	89 0c 24             	mov    %ecx,(%esp)
 8048e5b:	e8 38 ff ff ff       	call   8048d98 <inplane>
 8048e60:	85 c0                	test   %eax,%eax
 8048e62:	0f 85 35 01 00 00    	jne    8048f9d <bang_or_not+0x1ca>
			||inplane(pl.x,pl.y+pl.w,i)||inplane(pl.x+pl.w,pl.y+pl.w,i)
 8048e68:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e6b:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e6e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048e71:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e74:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e77:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048e7b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e7e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048e82:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048e85:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048e89:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048e8d:	89 04 24             	mov    %eax,(%esp)
 8048e90:	e8 03 ff ff ff       	call   8048d98 <inplane>
 8048e95:	85 c0                	test   %eax,%eax
 8048e97:	0f 85 00 01 00 00    	jne    8048f9d <bang_or_not+0x1ca>
 8048e9d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048ea0:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ea3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048ea6:	8b 55 08             	mov    0x8(%ebp),%edx
 8048ea9:	8b 45 10             	mov    0x10(%ebp),%eax
 8048eac:	01 c2                	add    %eax,%edx
 8048eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048eb1:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048eb5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048eb8:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048ebc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ebf:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048ec3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048ec7:	89 14 24             	mov    %edx,(%esp)
 8048eca:	e8 c9 fe ff ff       	call   8048d98 <inplane>
 8048ecf:	85 c0                	test   %eax,%eax
 8048ed1:	0f 85 c6 00 00 00    	jne    8048f9d <bang_or_not+0x1ca>
			||inplane(i.x,i.y,j)||inplane(i.x+i.w,i.y,j)
 8048ed7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048eda:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048edd:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048ee0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048ee4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 8048ee7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8048eeb:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048eee:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8048ef2:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048ef6:	89 04 24             	mov    %eax,(%esp)
 8048ef9:	e8 9a fe ff ff       	call   8048d98 <inplane>
 8048efe:	85 c0                	test   %eax,%eax
 8048f00:	0f 85 97 00 00 00    	jne    8048f9d <bang_or_not+0x1ca>
 8048f06:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f09:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8048f0c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048f0f:	01 d1                	add    %edx,%ecx
 8048f11:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048f14:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048f18:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048f1b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048f1f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048f22:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048f26:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f2a:	89 0c 24             	mov    %ecx,(%esp)
 8048f2d:	e8 66 fe ff ff       	call   8048d98 <inplane>
 8048f32:	85 c0                	test   %eax,%eax
 8048f34:	75 67                	jne    8048f9d <bang_or_not+0x1ca>
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
 8048f36:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f39:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f3c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f42:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048f45:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048f49:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048f4c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048f50:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048f53:	89 54 24 10          	mov    %edx,0x10(%esp)
 8048f57:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048f5b:	89 04 24             	mov    %eax,(%esp)
 8048f5e:	e8 35 fe ff ff       	call   8048d98 <inplane>
 8048f63:	85 c0                	test   %eax,%eax
 8048f65:	75 36                	jne    8048f9d <bang_or_not+0x1ca>
 8048f67:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f6d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048f70:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048f73:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f76:	01 c2                	add    %eax,%edx
 8048f78:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048f7b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048f82:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f86:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f89:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048f8d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048f91:	89 14 24             	mov    %edx,(%esp)
 8048f94:	e8 ff fd ff ff       	call   8048d98 <inplane>
 8048f99:	85 c0                	test   %eax,%eax
 8048f9b:	74 07                	je     8048fa4 <bang_or_not+0x1d1>
 8048f9d:	b8 01 00 00 00       	mov    $0x1,%eax
 8048fa2:	eb 05                	jmp    8048fa9 <bang_or_not+0x1d6>
 8048fa4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048fa9:	c9                   	leave  
 8048faa:	c3                   	ret    

08048fab <update_bang>:

void update_bang(void) {
 8048fab:	55                   	push   %ebp
 8048fac:	89 e5                	mov    %esp,%ebp
 8048fae:	83 ec 38             	sub    $0x38,%esp
	st_t it;
	for (it = head; it != NULL; ) {
 8048fb1:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8048fb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048fb9:	eb 7c                	jmp    8049037 <update_bang+0x8c>
		st_t next=st_next(it);
 8048fbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fbe:	89 04 24             	mov    %eax,(%esp)
 8048fc1:	e8 64 fa ff ff       	call   8048a2a <st_next>
 8048fc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(bang_or_not(pl,it)){
 8048fc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fcc:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048fd0:	a1 80 6c 09 08       	mov    0x8096c80,%eax
 8048fd5:	89 04 24             	mov    %eax,(%esp)
 8048fd8:	a1 84 6c 09 08       	mov    0x8096c84,%eax
 8048fdd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fe1:	a1 88 6c 09 08       	mov    0x8096c88,%eax
 8048fe6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048fea:	a1 8c 6c 09 08       	mov    0x8096c8c,%eax
 8048fef:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048ff3:	e8 db fd ff ff       	call   8048dd3 <bang_or_not>
 8048ff8:	85 c0                	test   %eax,%eax
 8048ffa:	74 35                	je     8049031 <update_bang+0x86>
			score++;
 8048ffc:	a1 20 6e 08 08       	mov    0x8086e20,%eax
 8049001:	83 c0 01             	add    $0x1,%eax
 8049004:	a3 20 6e 08 08       	mov    %eax,0x8086e20
			st_remove(it);
 8049009:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804900c:	89 04 24             	mov    %eax,(%esp)
 804900f:	e8 b6 fa ff ff       	call   8048aca <st_remove>
			if(it==head)
 8049014:	a1 1c 6e 08 08       	mov    0x8086e1c,%eax
 8049019:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804901c:	75 08                	jne    8049026 <update_bang+0x7b>
				head=next;
 804901e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049021:	a3 1c 6e 08 08       	mov    %eax,0x8086e1c
			st_free(it);
 8049026:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049029:	89 04 24             	mov    %eax,(%esp)
 804902c:	e8 fb fa ff ff       	call   8048b2c <st_free>
		}
		it=next;
 8049031:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049034:	89 45 f4             	mov    %eax,-0xc(%ebp)
			||inplane(i.x,i.y+i.w,j)||inplane(i.x+i.w,i.y+i.w,j);
}

void update_bang(void) {
	st_t it;
	for (it = head; it != NULL; ) {
 8049037:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804903b:	0f 85 7a ff ff ff    	jne    8048fbb <update_bang+0x10>
			st_free(it);
		}
		it=next;
	}

}
 8049041:	c9                   	leave  
 8049042:	c3                   	ret    

08049043 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
 8049043:	55                   	push   %ebp
 8049044:	89 e5                	mov    %esp,%ebp
 8049046:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
 8049049:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804904d:	78 18                	js     8049067 <draw_pixel+0x24>
 804904f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049053:	78 12                	js     8049067 <draw_pixel+0x24>
 8049055:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
 804905c:	7f 09                	jg     8049067 <draw_pixel+0x24>
 804905e:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
 8049065:	7e 24                	jle    804908b <draw_pixel+0x48>
 8049067:	c7 44 24 0c e4 a2 04 	movl   $0x804a2e4,0xc(%esp)
 804906e:	08 
 804906f:	c7 44 24 08 18 a3 04 	movl   $0x804a318,0x8(%esp)
 8049076:	08 
 8049077:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
 804907e:	00 
 804907f:	c7 04 24 2d a3 04 08 	movl   $0x804a32d,(%esp)
 8049086:	e8 84 f2 ff ff       	call   804830f <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
 804908b:	8b 45 08             	mov    0x8(%ebp),%eax
 804908e:	c1 e0 08             	shl    $0x8,%eax
 8049091:	89 c2                	mov    %eax,%edx
 8049093:	8b 45 08             	mov    0x8(%ebp),%eax
 8049096:	c1 e0 06             	shl    $0x6,%eax
 8049099:	01 c2                	add    %eax,%edx
 804909b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804909e:	01 c2                	add    %eax,%edx
 80490a0:	8b 45 10             	mov    0x10(%ebp),%eax
 80490a3:	88 82 40 6e 08 08    	mov    %al,0x8086e40(%edx)
}
 80490a9:	c9                   	leave  
 80490aa:	c3                   	ret    

080490ab <sysclean>:


void sysclean(void)
{
 80490ab:	55                   	push   %ebp
 80490ac:	89 e5                	mov    %esp,%ebp
 80490ae:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
 80490b1:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
 80490b8:	00 
 80490b9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80490c0:	00 
 80490c1:	c7 04 24 40 6e 08 08 	movl   $0x8086e40,(%esp)
 80490c8:	e8 cd 02 00 00       	call   804939a <memset>
}
 80490cd:	c9                   	leave  
 80490ce:	c3                   	ret    

080490cf <syspr>:
int syspr()
{
 80490cf:	55                   	push   %ebp
 80490d0:	89 e5                	mov    %esp,%ebp
 80490d2:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
 80490d5:	c7 44 24 04 40 6e 08 	movl   $0x8086e40,0x4(%esp)
 80490dc:	08 
 80490dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80490e4:	e8 67 01 00 00       	call   8049250 <syscall>
}
 80490e9:	c9                   	leave  
 80490ea:	c3                   	ret    

080490eb <systime>:

int systime(void)
{
 80490eb:	55                   	push   %ebp
 80490ec:	89 e5                	mov    %esp,%ebp
 80490ee:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
 80490f1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80490f8:	e8 53 01 00 00       	call   8049250 <syscall>
}
 80490fd:	c9                   	leave  
 80490fe:	c3                   	ret    

080490ff <sysreadkey>:

int sysreadkey(void)
{
 80490ff:	55                   	push   %ebp
 8049100:	89 e5                	mov    %esp,%ebp
 8049102:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
 8049105:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 804910c:	e8 3f 01 00 00       	call   8049250 <syscall>
}
 8049111:	c9                   	leave  
 8049112:	c3                   	ret    

08049113 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
 8049113:	55                   	push   %ebp
 8049114:	89 e5                	mov    %esp,%ebp
 8049116:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
 8049119:	8b 45 10             	mov    0x10(%ebp),%eax
 804911c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049120:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049123:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049127:	8b 45 08             	mov    0x8(%ebp),%eax
 804912a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804912e:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8049135:	e8 16 01 00 00       	call   8049250 <syscall>
}
 804913a:	c9                   	leave  
 804913b:	c3                   	ret    

0804913c <fork>:

int fork(void)
{
 804913c:	55                   	push   %ebp
 804913d:	89 e5                	mov    %esp,%ebp
 804913f:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
 8049142:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 8049149:	e8 02 01 00 00       	call   8049250 <syscall>
}
 804914e:	c9                   	leave  
 804914f:	c3                   	ret    

08049150 <getpid>:

int getpid(void)
{
 8049150:	55                   	push   %ebp
 8049151:	89 e5                	mov    %esp,%ebp
 8049153:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
 8049156:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
 804915d:	e8 ee 00 00 00       	call   8049250 <syscall>
}
 8049162:	c9                   	leave  
 8049163:	c3                   	ret    

08049164 <exit>:

void exit(void)
{
 8049164:	55                   	push   %ebp
 8049165:	89 e5                	mov    %esp,%ebp
 8049167:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit);
 804916a:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 8049171:	e8 da 00 00 00       	call   8049250 <syscall>
}
 8049176:	c9                   	leave  
 8049177:	c3                   	ret    

08049178 <sleep>:

void sleep(int sec)
{
 8049178:	55                   	push   %ebp
 8049179:	89 e5                	mov    %esp,%ebp
 804917b:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
 804917e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049181:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049185:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804918c:	e8 bf 00 00 00       	call   8049250 <syscall>
	//printf("qweqwe");
}
 8049191:	c9                   	leave  
 8049192:	c3                   	ret    

08049193 <thread>:

int thread(void *addr)
{
 8049193:	55                   	push   %ebp
 8049194:	89 e5                	mov    %esp,%ebp
 8049196:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
 8049199:	8b 45 08             	mov    0x8(%ebp),%eax
 804919c:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491a0:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 80491a7:	e8 a4 00 00 00       	call   8049250 <syscall>
}
 80491ac:	c9                   	leave  
 80491ad:	c3                   	ret    

080491ae <sem_init>:

int sem_init(Sema *sema,int value)
{
 80491ae:	55                   	push   %ebp
 80491af:	89 e5                	mov    %esp,%ebp
 80491b1:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema,value);
 80491b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 80491bb:	8b 45 08             	mov    0x8(%ebp),%eax
 80491be:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491c2:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 80491c9:	e8 82 00 00 00       	call   8049250 <syscall>
}
 80491ce:	c9                   	leave  
 80491cf:	c3                   	ret    

080491d0 <sem_destroy>:

int sem_destroy(Sema *sema)
{
 80491d0:	55                   	push   %ebp
 80491d1:	89 e5                	mov    %esp,%ebp
 80491d3:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
 80491d6:	8b 45 08             	mov    0x8(%ebp),%eax
 80491d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491dd:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 80491e4:	e8 67 00 00 00       	call   8049250 <syscall>
}
 80491e9:	c9                   	leave  
 80491ea:	c3                   	ret    

080491eb <sem_wait>:

int sem_wait(Sema *sema)
{
 80491eb:	55                   	push   %ebp
 80491ec:	89 e5                	mov    %esp,%ebp
 80491ee:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
 80491f1:	8b 45 08             	mov    0x8(%ebp),%eax
 80491f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491f8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 80491ff:	e8 4c 00 00 00       	call   8049250 <syscall>
}
 8049204:	c9                   	leave  
 8049205:	c3                   	ret    

08049206 <sem_trywait>:

int sem_trywait(Sema *sema)
{
 8049206:	55                   	push   %ebp
 8049207:	89 e5                	mov    %esp,%ebp
 8049209:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
 804920c:	8b 45 08             	mov    0x8(%ebp),%eax
 804920f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049213:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 804921a:	e8 31 00 00 00       	call   8049250 <syscall>
}
 804921f:	c9                   	leave  
 8049220:	c3                   	ret    

08049221 <sem_post>:

int sem_post(Sema *sema)
{
 8049221:	55                   	push   %ebp
 8049222:	89 e5                	mov    %esp,%ebp
 8049224:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
 8049227:	8b 45 08             	mov    0x8(%ebp),%eax
 804922a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804922e:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049235:	e8 16 00 00 00       	call   8049250 <syscall>
}
 804923a:	c9                   	leave  
 804923b:	c3                   	ret    

0804923c <thread_join>:

int thread_join(void)
{
 804923c:	55                   	push   %ebp
 804923d:	89 e5                	mov    %esp,%ebp
 804923f:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread_join);
 8049242:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
 8049249:	e8 02 00 00 00       	call   8049250 <syscall>
 804924e:	c9                   	leave  
 804924f:	c3                   	ret    

08049250 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
 8049250:	55                   	push   %ebp
 8049251:	89 e5                	mov    %esp,%ebp
 8049253:	53                   	push   %ebx
 8049254:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
 8049257:	8d 45 08             	lea    0x8(%ebp),%eax
 804925a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 804925d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049260:	8b 00                	mov    (%eax),%eax
 8049262:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8049265:	83 c2 04             	add    $0x4,%edx
 8049268:	8b 1a                	mov    (%edx),%ebx
 804926a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804926d:	83 c2 08             	add    $0x8,%edx
 8049270:	8b 0a                	mov    (%edx),%ecx
 8049272:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8049275:	83 c2 0c             	add    $0xc,%edx
 8049278:	8b 12                	mov    (%edx),%edx
 804927a:	cd 80                	int    $0x80
 804927c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 804927f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049282:	83 c4 10             	add    $0x10,%esp
 8049285:	5b                   	pop    %ebx
 8049286:	5d                   	pop    %ebp
 8049287:	c3                   	ret    

08049288 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
 8049288:	55                   	push   %ebp
 8049289:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
 804928b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804928e:	8b 00                	mov    (%eax),%eax
 8049290:	8d 48 01             	lea    0x1(%eax),%ecx
 8049293:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049296:	89 0a                	mov    %ecx,(%edx)
 8049298:	8b 55 08             	mov    0x8(%ebp),%edx
 804929b:	88 90 40 68 09 08    	mov    %dl,0x8096840(%eax)
}
 80492a1:	5d                   	pop    %ebp
 80492a2:	c3                   	ret    

080492a3 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
 80492a3:	55                   	push   %ebp
 80492a4:	89 e5                	mov    %esp,%ebp
 80492a6:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
 80492a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
 80492b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492b3:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80492b7:	8b 45 08             	mov    0x8(%ebp),%eax
 80492ba:	89 44 24 08          	mov    %eax,0x8(%esp)
 80492be:	8d 45 f4             	lea    -0xc(%ebp),%eax
 80492c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80492c5:	c7 04 24 88 92 04 08 	movl   $0x8049288,(%esp)
 80492cc:	e8 d1 06 00 00       	call   80499a2 <vprintfmt>
	return cnt;
 80492d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80492d4:	c9                   	leave  
 80492d5:	c3                   	ret    

080492d6 <printf>:
int printf(const char *fmt, ...)
{
 80492d6:	55                   	push   %ebp
 80492d7:	89 e5                	mov    %esp,%ebp
 80492d9:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
 80492dc:	8d 45 0c             	lea    0xc(%ebp),%eax
 80492df:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
 80492e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80492e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80492e9:	8b 45 08             	mov    0x8(%ebp),%eax
 80492ec:	89 04 24             	mov    %eax,(%esp)
 80492ef:	e8 af ff ff ff       	call   80492a3 <vprintf>
 80492f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
 80492f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80492fa:	89 44 24 08          	mov    %eax,0x8(%esp)
 80492fe:	c7 44 24 04 40 68 09 	movl   $0x8096840,0x4(%esp)
 8049305:	08 
 8049306:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804930d:	e8 01 fe ff ff       	call   8049113 <syswrite>
	return cnt;
 8049312:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049315:	c9                   	leave  
 8049316:	c3                   	ret    

08049317 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
 8049317:	55                   	push   %ebp
 8049318:	89 e5                	mov    %esp,%ebp
 804931a:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
 804931d:	c7 45 fc 45 6c 09 08 	movl   $0x8096c45,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
 8049324:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049328:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804932b:	ba 67 66 66 66       	mov    $0x66666667,%edx
 8049330:	89 c8                	mov    %ecx,%eax
 8049332:	f7 ea                	imul   %edx
 8049334:	c1 fa 02             	sar    $0x2,%edx
 8049337:	89 c8                	mov    %ecx,%eax
 8049339:	c1 f8 1f             	sar    $0x1f,%eax
 804933c:	29 c2                	sub    %eax,%edx
 804933e:	89 d0                	mov    %edx,%eax
 8049340:	c1 e0 02             	shl    $0x2,%eax
 8049343:	01 d0                	add    %edx,%eax
 8049345:	01 c0                	add    %eax,%eax
 8049347:	29 c1                	sub    %eax,%ecx
 8049349:	89 ca                	mov    %ecx,%edx
 804934b:	89 d0                	mov    %edx,%eax
 804934d:	83 c0 30             	add    $0x30,%eax
 8049350:	89 c2                	mov    %eax,%edx
 8049352:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049355:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
 8049357:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804935a:	ba 67 66 66 66       	mov    $0x66666667,%edx
 804935f:	89 c8                	mov    %ecx,%eax
 8049361:	f7 ea                	imul   %edx
 8049363:	c1 fa 02             	sar    $0x2,%edx
 8049366:	89 c8                	mov    %ecx,%eax
 8049368:	c1 f8 1f             	sar    $0x1f,%eax
 804936b:	29 c2                	sub    %eax,%edx
 804936d:	89 d0                	mov    %edx,%eax
 804936f:	89 45 08             	mov    %eax,0x8(%ebp)
 8049372:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049376:	75 ac                	jne    8049324 <itoa+0xd>
	return p;
 8049378:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 804937b:	c9                   	leave  
 804937c:	c3                   	ret    

0804937d <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
 804937d:	55                   	push   %ebp
 804937e:	89 e5                	mov    %esp,%ebp
 8049380:	57                   	push   %edi
 8049381:	56                   	push   %esi
 8049382:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
 8049383:	8b 45 10             	mov    0x10(%ebp),%eax
 8049386:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049389:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804938c:	89 c1                	mov    %eax,%ecx
 804938e:	89 d6                	mov    %edx,%esi
 8049390:	89 df                	mov    %ebx,%edi
 8049392:	fc                   	cld    
 8049393:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
 8049395:	5b                   	pop    %ebx
 8049396:	5e                   	pop    %esi
 8049397:	5f                   	pop    %edi
 8049398:	5d                   	pop    %ebp
 8049399:	c3                   	ret    

0804939a <memset>:

void memset(void *dest, int data, size_t size) {
 804939a:	55                   	push   %ebp
 804939b:	89 e5                	mov    %esp,%ebp
 804939d:	57                   	push   %edi
 804939e:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
 804939f:	8b 55 10             	mov    0x10(%ebp),%edx
 80493a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80493a8:	89 d1                	mov    %edx,%ecx
 80493aa:	89 df                	mov    %ebx,%edi
 80493ac:	fc                   	cld    
 80493ad:	f3 aa                	rep stos %al,%es:(%edi)
}
 80493af:	5b                   	pop    %ebx
 80493b0:	5f                   	pop    %edi
 80493b1:	5d                   	pop    %ebp
 80493b2:	c3                   	ret    

080493b3 <strlen>:

size_t strlen(const char *str) {
 80493b3:	55                   	push   %ebp
 80493b4:	89 e5                	mov    %esp,%ebp
 80493b6:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
 80493b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
 80493c0:	eb 04                	jmp    80493c6 <strlen+0x13>
 80493c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80493c6:	8b 45 08             	mov    0x8(%ebp),%eax
 80493c9:	8d 50 01             	lea    0x1(%eax),%edx
 80493cc:	89 55 08             	mov    %edx,0x8(%ebp)
 80493cf:	0f b6 00             	movzbl (%eax),%eax
 80493d2:	84 c0                	test   %al,%al
 80493d4:	75 ec                	jne    80493c2 <strlen+0xf>
	return len;
 80493d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80493d9:	c9                   	leave  
 80493da:	c3                   	ret    

080493db <strcpy>:

void strcpy(char *d, const char *s) {
 80493db:	55                   	push   %ebp
 80493dc:	89 e5                	mov    %esp,%ebp
 80493de:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
 80493e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493e4:	89 04 24             	mov    %eax,(%esp)
 80493e7:	e8 c7 ff ff ff       	call   80493b3 <strlen>
 80493ec:	83 c0 01             	add    $0x1,%eax
 80493ef:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493fa:	8b 45 08             	mov    0x8(%ebp),%eax
 80493fd:	89 04 24             	mov    %eax,(%esp)
 8049400:	e8 78 ff ff ff       	call   804937d <memcpy>
}
 8049405:	c9                   	leave  
 8049406:	c3                   	ret    

08049407 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 8049407:	55                   	push   %ebp
 8049408:	89 e5                	mov    %esp,%ebp
 804940a:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 804940d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049414:	eb 0c                	jmp    8049422 <strnlen+0x1b>
		n++;
 8049416:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 804941a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804941e:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 8049422:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049426:	74 0a                	je     8049432 <strnlen+0x2b>
 8049428:	8b 45 08             	mov    0x8(%ebp),%eax
 804942b:	0f b6 00             	movzbl (%eax),%eax
 804942e:	84 c0                	test   %al,%al
 8049430:	75 e4                	jne    8049416 <strnlen+0xf>
		n++;
	return n;
 8049432:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049435:	c9                   	leave  
 8049436:	c3                   	ret    

08049437 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
 8049437:	55                   	push   %ebp
 8049438:	89 e5                	mov    %esp,%ebp
 804943a:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 804943d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049440:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 8049443:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804944a:	eb 23                	jmp    804946f <strncpy+0x38>
		*dst++ = *src;
 804944c:	8b 45 08             	mov    0x8(%ebp),%eax
 804944f:	8d 50 01             	lea    0x1(%eax),%edx
 8049452:	89 55 08             	mov    %edx,0x8(%ebp)
 8049455:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049458:	0f b6 12             	movzbl (%edx),%edx
 804945b:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 804945d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049460:	0f b6 00             	movzbl (%eax),%eax
 8049463:	84 c0                	test   %al,%al
 8049465:	74 04                	je     804946b <strncpy+0x34>
			src++;
 8049467:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 804946b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 804946f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049472:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049475:	72 d5                	jb     804944c <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 8049477:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 804947a:	c9                   	leave  
 804947b:	c3                   	ret    

0804947c <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 804947c:	55                   	push   %ebp
 804947d:	89 e5                	mov    %esp,%ebp
 804947f:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 8049482:	8b 45 08             	mov    0x8(%ebp),%eax
 8049485:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 8049488:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804948c:	74 33                	je     80494c1 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 804948e:	eb 17                	jmp    80494a7 <strlcpy+0x2b>
			*dst++ = *src++;
 8049490:	8b 45 08             	mov    0x8(%ebp),%eax
 8049493:	8d 50 01             	lea    0x1(%eax),%edx
 8049496:	89 55 08             	mov    %edx,0x8(%ebp)
 8049499:	8b 55 0c             	mov    0xc(%ebp),%edx
 804949c:	8d 4a 01             	lea    0x1(%edx),%ecx
 804949f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80494a2:	0f b6 12             	movzbl (%edx),%edx
 80494a5:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 80494a7:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 80494ab:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80494af:	74 0a                	je     80494bb <strlcpy+0x3f>
 80494b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494b4:	0f b6 00             	movzbl (%eax),%eax
 80494b7:	84 c0                	test   %al,%al
 80494b9:	75 d5                	jne    8049490 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 80494bb:	8b 45 08             	mov    0x8(%ebp),%eax
 80494be:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 80494c1:	8b 55 08             	mov    0x8(%ebp),%edx
 80494c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80494c7:	29 c2                	sub    %eax,%edx
 80494c9:	89 d0                	mov    %edx,%eax
}
 80494cb:	c9                   	leave  
 80494cc:	c3                   	ret    

080494cd <strcmp>:

int
strcmp(const char *p, const char *q)
{
 80494cd:	55                   	push   %ebp
 80494ce:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 80494d0:	eb 08                	jmp    80494da <strcmp+0xd>
		p++, q++;
 80494d2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80494d6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 80494da:	8b 45 08             	mov    0x8(%ebp),%eax
 80494dd:	0f b6 00             	movzbl (%eax),%eax
 80494e0:	84 c0                	test   %al,%al
 80494e2:	74 10                	je     80494f4 <strcmp+0x27>
 80494e4:	8b 45 08             	mov    0x8(%ebp),%eax
 80494e7:	0f b6 10             	movzbl (%eax),%edx
 80494ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494ed:	0f b6 00             	movzbl (%eax),%eax
 80494f0:	38 c2                	cmp    %al,%dl
 80494f2:	74 de                	je     80494d2 <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 80494f4:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f7:	0f b6 00             	movzbl (%eax),%eax
 80494fa:	0f b6 d0             	movzbl %al,%edx
 80494fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049500:	0f b6 00             	movzbl (%eax),%eax
 8049503:	0f b6 c0             	movzbl %al,%eax
 8049506:	29 c2                	sub    %eax,%edx
 8049508:	89 d0                	mov    %edx,%eax
}
 804950a:	5d                   	pop    %ebp
 804950b:	c3                   	ret    

0804950c <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 804950c:	55                   	push   %ebp
 804950d:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 804950f:	eb 0c                	jmp    804951d <strncmp+0x11>
		n--, p++, q++;
 8049511:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049515:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049519:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 804951d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049521:	74 1a                	je     804953d <strncmp+0x31>
 8049523:	8b 45 08             	mov    0x8(%ebp),%eax
 8049526:	0f b6 00             	movzbl (%eax),%eax
 8049529:	84 c0                	test   %al,%al
 804952b:	74 10                	je     804953d <strncmp+0x31>
 804952d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049530:	0f b6 10             	movzbl (%eax),%edx
 8049533:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049536:	0f b6 00             	movzbl (%eax),%eax
 8049539:	38 c2                	cmp    %al,%dl
 804953b:	74 d4                	je     8049511 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 804953d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049541:	75 07                	jne    804954a <strncmp+0x3e>
		return 0;
 8049543:	b8 00 00 00 00       	mov    $0x0,%eax
 8049548:	eb 16                	jmp    8049560 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 804954a:	8b 45 08             	mov    0x8(%ebp),%eax
 804954d:	0f b6 00             	movzbl (%eax),%eax
 8049550:	0f b6 d0             	movzbl %al,%edx
 8049553:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049556:	0f b6 00             	movzbl (%eax),%eax
 8049559:	0f b6 c0             	movzbl %al,%eax
 804955c:	29 c2                	sub    %eax,%edx
 804955e:	89 d0                	mov    %edx,%eax
}
 8049560:	5d                   	pop    %ebp
 8049561:	c3                   	ret    

08049562 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 8049562:	55                   	push   %ebp
 8049563:	89 e5                	mov    %esp,%ebp
 8049565:	83 ec 04             	sub    $0x4,%esp
 8049568:	8b 45 0c             	mov    0xc(%ebp),%eax
 804956b:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 804956e:	eb 14                	jmp    8049584 <strchr+0x22>
		if (*s == c)
 8049570:	8b 45 08             	mov    0x8(%ebp),%eax
 8049573:	0f b6 00             	movzbl (%eax),%eax
 8049576:	3a 45 fc             	cmp    -0x4(%ebp),%al
 8049579:	75 05                	jne    8049580 <strchr+0x1e>
			return (char *) s;
 804957b:	8b 45 08             	mov    0x8(%ebp),%eax
 804957e:	eb 13                	jmp    8049593 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 8049580:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049584:	8b 45 08             	mov    0x8(%ebp),%eax
 8049587:	0f b6 00             	movzbl (%eax),%eax
 804958a:	84 c0                	test   %al,%al
 804958c:	75 e2                	jne    8049570 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 804958e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8049593:	c9                   	leave  
 8049594:	c3                   	ret    

08049595 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 8049595:	55                   	push   %ebp
 8049596:	89 e5                	mov    %esp,%ebp
 8049598:	83 ec 04             	sub    $0x4,%esp
 804959b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804959e:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 80495a1:	eb 11                	jmp    80495b4 <strfind+0x1f>
		if (*s == c)
 80495a3:	8b 45 08             	mov    0x8(%ebp),%eax
 80495a6:	0f b6 00             	movzbl (%eax),%eax
 80495a9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 80495ac:	75 02                	jne    80495b0 <strfind+0x1b>
			break;
 80495ae:	eb 0e                	jmp    80495be <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 80495b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80495b4:	8b 45 08             	mov    0x8(%ebp),%eax
 80495b7:	0f b6 00             	movzbl (%eax),%eax
 80495ba:	84 c0                	test   %al,%al
 80495bc:	75 e5                	jne    80495a3 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
 80495be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80495c1:	c9                   	leave  
 80495c2:	c3                   	ret    

080495c3 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
 80495c3:	55                   	push   %ebp
 80495c4:	89 e5                	mov    %esp,%ebp
 80495c6:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
 80495c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495cc:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
 80495cf:	8b 45 08             	mov    0x8(%ebp),%eax
 80495d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
 80495d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80495d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80495db:	73 3d                	jae    804961a <memmove+0x57>
 80495dd:	8b 45 10             	mov    0x10(%ebp),%eax
 80495e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80495e3:	01 d0                	add    %edx,%eax
 80495e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80495e8:	76 30                	jbe    804961a <memmove+0x57>
		s += n;
 80495ea:	8b 45 10             	mov    0x10(%ebp),%eax
 80495ed:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
 80495f0:	8b 45 10             	mov    0x10(%ebp),%eax
 80495f3:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
 80495f6:	eb 13                	jmp    804960b <memmove+0x48>
			*--d = *--s;
 80495f8:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
 80495fc:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
 8049600:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049603:	0f b6 10             	movzbl (%eax),%edx
 8049606:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049609:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
 804960b:	8b 45 10             	mov    0x10(%ebp),%eax
 804960e:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049611:	89 55 10             	mov    %edx,0x10(%ebp)
 8049614:	85 c0                	test   %eax,%eax
 8049616:	75 e0                	jne    80495f8 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
 8049618:	eb 26                	jmp    8049640 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 804961a:	eb 17                	jmp    8049633 <memmove+0x70>
			*d++ = *s++;
 804961c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804961f:	8d 50 01             	lea    0x1(%eax),%edx
 8049622:	89 55 f8             	mov    %edx,-0x8(%ebp)
 8049625:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049628:	8d 4a 01             	lea    0x1(%edx),%ecx
 804962b:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 804962e:	0f b6 12             	movzbl (%edx),%edx
 8049631:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
 8049633:	8b 45 10             	mov    0x10(%ebp),%eax
 8049636:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049639:	89 55 10             	mov    %edx,0x10(%ebp)
 804963c:	85 c0                	test   %eax,%eax
 804963e:	75 dc                	jne    804961c <memmove+0x59>
			*d++ = *s++;

	return dst;
 8049640:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049643:	c9                   	leave  
 8049644:	c3                   	ret    

08049645 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
 8049645:	55                   	push   %ebp
 8049646:	89 e5                	mov    %esp,%ebp
 8049648:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 804964b:	8b 45 08             	mov    0x8(%ebp),%eax
 804964e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 8049651:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049654:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 8049657:	eb 30                	jmp    8049689 <memcmp+0x44>
		if (*s1 != *s2)
 8049659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804965c:	0f b6 10             	movzbl (%eax),%edx
 804965f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049662:	0f b6 00             	movzbl (%eax),%eax
 8049665:	38 c2                	cmp    %al,%dl
 8049667:	74 18                	je     8049681 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 8049669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804966c:	0f b6 00             	movzbl (%eax),%eax
 804966f:	0f b6 d0             	movzbl %al,%edx
 8049672:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049675:	0f b6 00             	movzbl (%eax),%eax
 8049678:	0f b6 c0             	movzbl %al,%eax
 804967b:	29 c2                	sub    %eax,%edx
 804967d:	89 d0                	mov    %edx,%eax
 804967f:	eb 1a                	jmp    804969b <memcmp+0x56>
		s1++, s2++;
 8049681:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8049685:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 8049689:	8b 45 10             	mov    0x10(%ebp),%eax
 804968c:	8d 50 ff             	lea    -0x1(%eax),%edx
 804968f:	89 55 10             	mov    %edx,0x10(%ebp)
 8049692:	85 c0                	test   %eax,%eax
 8049694:	75 c3                	jne    8049659 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 8049696:	b8 00 00 00 00       	mov    $0x0,%eax
}
 804969b:	c9                   	leave  
 804969c:	c3                   	ret    

0804969d <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 804969d:	55                   	push   %ebp
 804969e:	89 e5                	mov    %esp,%ebp
 80496a0:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 80496a3:	8b 45 10             	mov    0x10(%ebp),%eax
 80496a6:	8b 55 08             	mov    0x8(%ebp),%edx
 80496a9:	01 d0                	add    %edx,%eax
 80496ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 80496ae:	eb 13                	jmp    80496c3 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
 80496b0:	8b 45 08             	mov    0x8(%ebp),%eax
 80496b3:	0f b6 10             	movzbl (%eax),%edx
 80496b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496b9:	38 c2                	cmp    %al,%dl
 80496bb:	75 02                	jne    80496bf <memfind+0x22>
			break;
 80496bd:	eb 0c                	jmp    80496cb <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 80496bf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80496c3:	8b 45 08             	mov    0x8(%ebp),%eax
 80496c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80496c9:	72 e5                	jb     80496b0 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
 80496cb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 80496ce:	c9                   	leave  
 80496cf:	c3                   	ret    

080496d0 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 80496d0:	55                   	push   %ebp
 80496d1:	89 e5                	mov    %esp,%ebp
 80496d3:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 80496d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 80496dd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 80496e4:	eb 04                	jmp    80496ea <strtol+0x1a>
		s++;
 80496e6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 80496ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80496ed:	0f b6 00             	movzbl (%eax),%eax
 80496f0:	3c 20                	cmp    $0x20,%al
 80496f2:	74 f2                	je     80496e6 <strtol+0x16>
 80496f4:	8b 45 08             	mov    0x8(%ebp),%eax
 80496f7:	0f b6 00             	movzbl (%eax),%eax
 80496fa:	3c 09                	cmp    $0x9,%al
 80496fc:	74 e8                	je     80496e6 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 80496fe:	8b 45 08             	mov    0x8(%ebp),%eax
 8049701:	0f b6 00             	movzbl (%eax),%eax
 8049704:	3c 2b                	cmp    $0x2b,%al
 8049706:	75 06                	jne    804970e <strtol+0x3e>
		s++;
 8049708:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804970c:	eb 15                	jmp    8049723 <strtol+0x53>
	else if (*s == '-')
 804970e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049711:	0f b6 00             	movzbl (%eax),%eax
 8049714:	3c 2d                	cmp    $0x2d,%al
 8049716:	75 0b                	jne    8049723 <strtol+0x53>
		s++, neg = 1;
 8049718:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 804971c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 8049723:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049727:	74 06                	je     804972f <strtol+0x5f>
 8049729:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 804972d:	75 24                	jne    8049753 <strtol+0x83>
 804972f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049732:	0f b6 00             	movzbl (%eax),%eax
 8049735:	3c 30                	cmp    $0x30,%al
 8049737:	75 1a                	jne    8049753 <strtol+0x83>
 8049739:	8b 45 08             	mov    0x8(%ebp),%eax
 804973c:	83 c0 01             	add    $0x1,%eax
 804973f:	0f b6 00             	movzbl (%eax),%eax
 8049742:	3c 78                	cmp    $0x78,%al
 8049744:	75 0d                	jne    8049753 <strtol+0x83>
		s += 2, base = 16;
 8049746:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 804974a:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 8049751:	eb 2a                	jmp    804977d <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 8049753:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049757:	75 17                	jne    8049770 <strtol+0xa0>
 8049759:	8b 45 08             	mov    0x8(%ebp),%eax
 804975c:	0f b6 00             	movzbl (%eax),%eax
 804975f:	3c 30                	cmp    $0x30,%al
 8049761:	75 0d                	jne    8049770 <strtol+0xa0>
		s++, base = 8;
 8049763:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 8049767:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 804976e:	eb 0d                	jmp    804977d <strtol+0xad>
	else if (base == 0)
 8049770:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049774:	75 07                	jne    804977d <strtol+0xad>
		base = 10;
 8049776:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 804977d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049780:	0f b6 00             	movzbl (%eax),%eax
 8049783:	3c 2f                	cmp    $0x2f,%al
 8049785:	7e 1b                	jle    80497a2 <strtol+0xd2>
 8049787:	8b 45 08             	mov    0x8(%ebp),%eax
 804978a:	0f b6 00             	movzbl (%eax),%eax
 804978d:	3c 39                	cmp    $0x39,%al
 804978f:	7f 11                	jg     80497a2 <strtol+0xd2>
			dig = *s - '0';
 8049791:	8b 45 08             	mov    0x8(%ebp),%eax
 8049794:	0f b6 00             	movzbl (%eax),%eax
 8049797:	0f be c0             	movsbl %al,%eax
 804979a:	83 e8 30             	sub    $0x30,%eax
 804979d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80497a0:	eb 48                	jmp    80497ea <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 80497a2:	8b 45 08             	mov    0x8(%ebp),%eax
 80497a5:	0f b6 00             	movzbl (%eax),%eax
 80497a8:	3c 60                	cmp    $0x60,%al
 80497aa:	7e 1b                	jle    80497c7 <strtol+0xf7>
 80497ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80497af:	0f b6 00             	movzbl (%eax),%eax
 80497b2:	3c 7a                	cmp    $0x7a,%al
 80497b4:	7f 11                	jg     80497c7 <strtol+0xf7>
			dig = *s - 'a' + 10;
 80497b6:	8b 45 08             	mov    0x8(%ebp),%eax
 80497b9:	0f b6 00             	movzbl (%eax),%eax
 80497bc:	0f be c0             	movsbl %al,%eax
 80497bf:	83 e8 57             	sub    $0x57,%eax
 80497c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80497c5:	eb 23                	jmp    80497ea <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 80497c7:	8b 45 08             	mov    0x8(%ebp),%eax
 80497ca:	0f b6 00             	movzbl (%eax),%eax
 80497cd:	3c 40                	cmp    $0x40,%al
 80497cf:	7e 3d                	jle    804980e <strtol+0x13e>
 80497d1:	8b 45 08             	mov    0x8(%ebp),%eax
 80497d4:	0f b6 00             	movzbl (%eax),%eax
 80497d7:	3c 5a                	cmp    $0x5a,%al
 80497d9:	7f 33                	jg     804980e <strtol+0x13e>
			dig = *s - 'A' + 10;
 80497db:	8b 45 08             	mov    0x8(%ebp),%eax
 80497de:	0f b6 00             	movzbl (%eax),%eax
 80497e1:	0f be c0             	movsbl %al,%eax
 80497e4:	83 e8 37             	sub    $0x37,%eax
 80497e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 80497ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80497ed:	3b 45 10             	cmp    0x10(%ebp),%eax
 80497f0:	7c 02                	jl     80497f4 <strtol+0x124>
			break;
 80497f2:	eb 1a                	jmp    804980e <strtol+0x13e>
		s++, val = (val * base) + dig;
 80497f4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80497f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80497fb:	0f af 45 10          	imul   0x10(%ebp),%eax
 80497ff:	89 c2                	mov    %eax,%edx
 8049801:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049804:	01 d0                	add    %edx,%eax
 8049806:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 8049809:	e9 6f ff ff ff       	jmp    804977d <strtol+0xad>

	if (endptr)
 804980e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049812:	74 08                	je     804981c <strtol+0x14c>
		*endptr = (char *) s;
 8049814:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049817:	8b 55 08             	mov    0x8(%ebp),%edx
 804981a:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 804981c:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8049820:	74 07                	je     8049829 <strtol+0x159>
 8049822:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049825:	f7 d8                	neg    %eax
 8049827:	eb 03                	jmp    804982c <strtol+0x15c>
 8049829:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 804982c:	c9                   	leave  
 804982d:	c3                   	ret    

0804982e <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
 804982e:	55                   	push   %ebp
 804982f:	89 e5                	mov    %esp,%ebp
 8049831:	53                   	push   %ebx
 8049832:	83 ec 34             	sub    $0x34,%esp
 8049835:	8b 45 10             	mov    0x10(%ebp),%eax
 8049838:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804983b:	8b 45 14             	mov    0x14(%ebp),%eax
 804983e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
 8049841:	8b 45 18             	mov    0x18(%ebp),%eax
 8049844:	ba 00 00 00 00       	mov    $0x0,%edx
 8049849:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 804984c:	77 72                	ja     80498c0 <printnum+0x92>
 804984e:	3b 55 f4             	cmp    -0xc(%ebp),%edx
 8049851:	72 05                	jb     8049858 <printnum+0x2a>
 8049853:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049856:	77 68                	ja     80498c0 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
 8049858:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804985b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 804985e:	8b 45 18             	mov    0x18(%ebp),%eax
 8049861:	ba 00 00 00 00       	mov    $0x0,%edx
 8049866:	89 44 24 08          	mov    %eax,0x8(%esp)
 804986a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804986e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049871:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049874:	89 04 24             	mov    %eax,(%esp)
 8049877:	89 54 24 04          	mov    %edx,0x4(%esp)
 804987b:	e8 50 06 00 00       	call   8049ed0 <__udivdi3>
 8049880:	8b 4d 20             	mov    0x20(%ebp),%ecx
 8049883:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 8049887:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 804988b:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804988e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 8049892:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049896:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804989a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804989d:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498a1:	8b 45 08             	mov    0x8(%ebp),%eax
 80498a4:	89 04 24             	mov    %eax,(%esp)
 80498a7:	e8 82 ff ff ff       	call   804982e <printnum>
 80498ac:	eb 1c                	jmp    80498ca <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
 80498ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498b5:	8b 45 20             	mov    0x20(%ebp),%eax
 80498b8:	89 04 24             	mov    %eax,(%esp)
 80498bb:	8b 45 08             	mov    0x8(%ebp),%eax
 80498be:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
 80498c0:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
 80498c4:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 80498c8:	7f e4                	jg     80498ae <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
 80498ca:	8b 4d 18             	mov    0x18(%ebp),%ecx
 80498cd:	bb 00 00 00 00       	mov    $0x0,%ebx
 80498d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80498d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80498d8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80498dc:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 80498e0:	89 04 24             	mov    %eax,(%esp)
 80498e3:	89 54 24 04          	mov    %edx,0x4(%esp)
 80498e7:	e8 14 07 00 00       	call   804a000 <__umoddi3>
 80498ec:	05 c8 a3 04 08       	add    $0x804a3c8,%eax
 80498f1:	0f b6 00             	movzbl (%eax),%eax
 80498f4:	0f be c0             	movsbl %al,%eax
 80498f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 80498fa:	89 54 24 04          	mov    %edx,0x4(%esp)
 80498fe:	89 04 24             	mov    %eax,(%esp)
 8049901:	8b 45 08             	mov    0x8(%ebp),%eax
 8049904:	ff d0                	call   *%eax
}
 8049906:	83 c4 34             	add    $0x34,%esp
 8049909:	5b                   	pop    %ebx
 804990a:	5d                   	pop    %ebp
 804990b:	c3                   	ret    

0804990c <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
 804990c:	55                   	push   %ebp
 804990d:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 804990f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 8049913:	7e 14                	jle    8049929 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
 8049915:	8b 45 08             	mov    0x8(%ebp),%eax
 8049918:	8b 00                	mov    (%eax),%eax
 804991a:	8d 48 08             	lea    0x8(%eax),%ecx
 804991d:	8b 55 08             	mov    0x8(%ebp),%edx
 8049920:	89 0a                	mov    %ecx,(%edx)
 8049922:	8b 50 04             	mov    0x4(%eax),%edx
 8049925:	8b 00                	mov    (%eax),%eax
 8049927:	eb 30                	jmp    8049959 <getuint+0x4d>
	else if (lflag)
 8049929:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804992d:	74 16                	je     8049945 <getuint+0x39>
		return va_arg(*ap, unsigned long);
 804992f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049932:	8b 00                	mov    (%eax),%eax
 8049934:	8d 48 04             	lea    0x4(%eax),%ecx
 8049937:	8b 55 08             	mov    0x8(%ebp),%edx
 804993a:	89 0a                	mov    %ecx,(%edx)
 804993c:	8b 00                	mov    (%eax),%eax
 804993e:	ba 00 00 00 00       	mov    $0x0,%edx
 8049943:	eb 14                	jmp    8049959 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
 8049945:	8b 45 08             	mov    0x8(%ebp),%eax
 8049948:	8b 00                	mov    (%eax),%eax
 804994a:	8d 48 04             	lea    0x4(%eax),%ecx
 804994d:	8b 55 08             	mov    0x8(%ebp),%edx
 8049950:	89 0a                	mov    %ecx,(%edx)
 8049952:	8b 00                	mov    (%eax),%eax
 8049954:	ba 00 00 00 00       	mov    $0x0,%edx
}
 8049959:	5d                   	pop    %ebp
 804995a:	c3                   	ret    

0804995b <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
 804995b:	55                   	push   %ebp
 804995c:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
 804995e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 8049962:	7e 14                	jle    8049978 <getint+0x1d>
		return va_arg(*ap, long long);
 8049964:	8b 45 08             	mov    0x8(%ebp),%eax
 8049967:	8b 00                	mov    (%eax),%eax
 8049969:	8d 48 08             	lea    0x8(%eax),%ecx
 804996c:	8b 55 08             	mov    0x8(%ebp),%edx
 804996f:	89 0a                	mov    %ecx,(%edx)
 8049971:	8b 50 04             	mov    0x4(%eax),%edx
 8049974:	8b 00                	mov    (%eax),%eax
 8049976:	eb 28                	jmp    80499a0 <getint+0x45>
	else if (lflag)
 8049978:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804997c:	74 12                	je     8049990 <getint+0x35>
		return va_arg(*ap, long);
 804997e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049981:	8b 00                	mov    (%eax),%eax
 8049983:	8d 48 04             	lea    0x4(%eax),%ecx
 8049986:	8b 55 08             	mov    0x8(%ebp),%edx
 8049989:	89 0a                	mov    %ecx,(%edx)
 804998b:	8b 00                	mov    (%eax),%eax
 804998d:	99                   	cltd   
 804998e:	eb 10                	jmp    80499a0 <getint+0x45>
	else
		return va_arg(*ap, int);
 8049990:	8b 45 08             	mov    0x8(%ebp),%eax
 8049993:	8b 00                	mov    (%eax),%eax
 8049995:	8d 48 04             	lea    0x4(%eax),%ecx
 8049998:	8b 55 08             	mov    0x8(%ebp),%edx
 804999b:	89 0a                	mov    %ecx,(%edx)
 804999d:	8b 00                	mov    (%eax),%eax
 804999f:	99                   	cltd   
}
 80499a0:	5d                   	pop    %ebp
 80499a1:	c3                   	ret    

080499a2 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
 80499a2:	55                   	push   %ebp
 80499a3:	89 e5                	mov    %esp,%ebp
 80499a5:	56                   	push   %esi
 80499a6:	53                   	push   %ebx
 80499a7:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 80499aa:	eb 18                	jmp    80499c4 <vprintfmt+0x22>
			if (ch == '\0')
 80499ac:	85 db                	test   %ebx,%ebx
 80499ae:	75 05                	jne    80499b5 <vprintfmt+0x13>
				return;
 80499b0:	e9 e9 03 00 00       	jmp    8049d9e <vprintfmt+0x3fc>
			putch(ch, putdat);
 80499b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80499b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499bc:	89 1c 24             	mov    %ebx,(%esp)
 80499bf:	8b 45 08             	mov    0x8(%ebp),%eax
 80499c2:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 80499c4:	8b 45 10             	mov    0x10(%ebp),%eax
 80499c7:	8d 50 01             	lea    0x1(%eax),%edx
 80499ca:	89 55 10             	mov    %edx,0x10(%ebp)
 80499cd:	0f b6 00             	movzbl (%eax),%eax
 80499d0:	0f b6 d8             	movzbl %al,%ebx
 80499d3:	83 fb 25             	cmp    $0x25,%ebx
 80499d6:	75 d4                	jne    80499ac <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
 80499d8:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
 80499dc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
 80499e3:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
 80499ea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
 80499f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
 80499f8:	8b 45 10             	mov    0x10(%ebp),%eax
 80499fb:	8d 50 01             	lea    0x1(%eax),%edx
 80499fe:	89 55 10             	mov    %edx,0x10(%ebp)
 8049a01:	0f b6 00             	movzbl (%eax),%eax
 8049a04:	0f b6 d8             	movzbl %al,%ebx
 8049a07:	8d 43 dd             	lea    -0x23(%ebx),%eax
 8049a0a:	83 f8 55             	cmp    $0x55,%eax
 8049a0d:	0f 87 5a 03 00 00    	ja     8049d6d <vprintfmt+0x3cb>
 8049a13:	8b 04 85 ec a3 04 08 	mov    0x804a3ec(,%eax,4),%eax
 8049a1a:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
 8049a1c:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
 8049a20:	eb d6                	jmp    80499f8 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
 8049a22:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
 8049a26:	eb d0                	jmp    80499f8 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049a28:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
 8049a2f:	8b 55 e0             	mov    -0x20(%ebp),%edx
 8049a32:	89 d0                	mov    %edx,%eax
 8049a34:	c1 e0 02             	shl    $0x2,%eax
 8049a37:	01 d0                	add    %edx,%eax
 8049a39:	01 c0                	add    %eax,%eax
 8049a3b:	01 d8                	add    %ebx,%eax
 8049a3d:	83 e8 30             	sub    $0x30,%eax
 8049a40:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
 8049a43:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a46:	0f b6 00             	movzbl (%eax),%eax
 8049a49:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
 8049a4c:	83 fb 2f             	cmp    $0x2f,%ebx
 8049a4f:	7e 0b                	jle    8049a5c <vprintfmt+0xba>
 8049a51:	83 fb 39             	cmp    $0x39,%ebx
 8049a54:	7f 06                	jg     8049a5c <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
 8049a56:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
 8049a5a:	eb d3                	jmp    8049a2f <vprintfmt+0x8d>
			goto process_precision;
 8049a5c:	eb 33                	jmp    8049a91 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
 8049a5e:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a61:	8d 50 04             	lea    0x4(%eax),%edx
 8049a64:	89 55 14             	mov    %edx,0x14(%ebp)
 8049a67:	8b 00                	mov    (%eax),%eax
 8049a69:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
 8049a6c:	eb 23                	jmp    8049a91 <vprintfmt+0xef>

		case '.':
			if (width < 0)
 8049a6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049a72:	79 0c                	jns    8049a80 <vprintfmt+0xde>
				width = 0;
 8049a74:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
 8049a7b:	e9 78 ff ff ff       	jmp    80499f8 <vprintfmt+0x56>
 8049a80:	e9 73 ff ff ff       	jmp    80499f8 <vprintfmt+0x56>

		case '#':
			altflag = 1;
 8049a85:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
 8049a8c:	e9 67 ff ff ff       	jmp    80499f8 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
 8049a91:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049a95:	79 12                	jns    8049aa9 <vprintfmt+0x107>
				width = precision, precision = -1;
 8049a97:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049a9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8049a9d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
 8049aa4:	e9 4f ff ff ff       	jmp    80499f8 <vprintfmt+0x56>
 8049aa9:	e9 4a ff ff ff       	jmp    80499f8 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
 8049aae:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
 8049ab2:	e9 41 ff ff ff       	jmp    80499f8 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
 8049ab7:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aba:	8d 50 04             	lea    0x4(%eax),%edx
 8049abd:	89 55 14             	mov    %edx,0x14(%ebp)
 8049ac0:	8b 00                	mov    (%eax),%eax
 8049ac2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049ac5:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049ac9:	89 04 24             	mov    %eax,(%esp)
 8049acc:	8b 45 08             	mov    0x8(%ebp),%eax
 8049acf:	ff d0                	call   *%eax
			break;
 8049ad1:	e9 c2 02 00 00       	jmp    8049d98 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
 8049ad6:	8b 45 14             	mov    0x14(%ebp),%eax
 8049ad9:	8d 50 04             	lea    0x4(%eax),%edx
 8049adc:	89 55 14             	mov    %edx,0x14(%ebp)
 8049adf:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
 8049ae1:	85 db                	test   %ebx,%ebx
 8049ae3:	79 02                	jns    8049ae7 <vprintfmt+0x145>
				err = -err;
 8049ae5:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
 8049ae7:	83 fb 06             	cmp    $0x6,%ebx
 8049aea:	7f 0b                	jg     8049af7 <vprintfmt+0x155>
 8049aec:	8b 34 9d ac a3 04 08 	mov    0x804a3ac(,%ebx,4),%esi
 8049af3:	85 f6                	test   %esi,%esi
 8049af5:	75 23                	jne    8049b1a <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
 8049af7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049afb:	c7 44 24 08 d9 a3 04 	movl   $0x804a3d9,0x8(%esp)
 8049b02:	08 
 8049b03:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b06:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b0a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b0d:	89 04 24             	mov    %eax,(%esp)
 8049b10:	e8 90 02 00 00       	call   8049da5 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
 8049b15:	e9 7e 02 00 00       	jmp    8049d98 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
 8049b1a:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049b1e:	c7 44 24 08 e2 a3 04 	movl   $0x804a3e2,0x8(%esp)
 8049b25:	08 
 8049b26:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b29:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b2d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b30:	89 04 24             	mov    %eax,(%esp)
 8049b33:	e8 6d 02 00 00       	call   8049da5 <printfmt>
			break;
 8049b38:	e9 5b 02 00 00       	jmp    8049d98 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
 8049b3d:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b40:	8d 50 04             	lea    0x4(%eax),%edx
 8049b43:	89 55 14             	mov    %edx,0x14(%ebp)
 8049b46:	8b 30                	mov    (%eax),%esi
 8049b48:	85 f6                	test   %esi,%esi
 8049b4a:	75 05                	jne    8049b51 <vprintfmt+0x1af>
				p = "(null)";
 8049b4c:	be e5 a3 04 08       	mov    $0x804a3e5,%esi
			if (width > 0 && padc != '-')
 8049b51:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049b55:	7e 37                	jle    8049b8e <vprintfmt+0x1ec>
 8049b57:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
 8049b5b:	74 31                	je     8049b8e <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
 8049b5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049b60:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b64:	89 34 24             	mov    %esi,(%esp)
 8049b67:	e8 9b f8 ff ff       	call   8049407 <strnlen>
 8049b6c:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 8049b6f:	eb 17                	jmp    8049b88 <vprintfmt+0x1e6>
					putch(padc, putdat);
 8049b71:	0f be 45 db          	movsbl -0x25(%ebp),%eax
 8049b75:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049b78:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049b7c:	89 04 24             	mov    %eax,(%esp)
 8049b7f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b82:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
 8049b84:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049b88:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049b8c:	7f e3                	jg     8049b71 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049b8e:	eb 38                	jmp    8049bc8 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
 8049b90:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049b94:	74 1f                	je     8049bb5 <vprintfmt+0x213>
 8049b96:	83 fb 1f             	cmp    $0x1f,%ebx
 8049b99:	7e 05                	jle    8049ba0 <vprintfmt+0x1fe>
 8049b9b:	83 fb 7e             	cmp    $0x7e,%ebx
 8049b9e:	7e 15                	jle    8049bb5 <vprintfmt+0x213>
					putch('?', putdat);
 8049ba0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ba7:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 8049bae:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bb1:	ff d0                	call   *%eax
 8049bb3:	eb 0f                	jmp    8049bc4 <vprintfmt+0x222>
				else
					putch(ch, putdat);
 8049bb5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bb8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bbc:	89 1c 24             	mov    %ebx,(%esp)
 8049bbf:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bc2:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
 8049bc4:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049bc8:	89 f0                	mov    %esi,%eax
 8049bca:	8d 70 01             	lea    0x1(%eax),%esi
 8049bcd:	0f b6 00             	movzbl (%eax),%eax
 8049bd0:	0f be d8             	movsbl %al,%ebx
 8049bd3:	85 db                	test   %ebx,%ebx
 8049bd5:	74 10                	je     8049be7 <vprintfmt+0x245>
 8049bd7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049bdb:	78 b3                	js     8049b90 <vprintfmt+0x1ee>
 8049bdd:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
 8049be1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049be5:	79 a9                	jns    8049b90 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049be7:	eb 17                	jmp    8049c00 <vprintfmt+0x25e>
				putch(' ', putdat);
 8049be9:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bec:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bf0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049bf7:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bfa:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
 8049bfc:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 8049c00:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8049c04:	7f e3                	jg     8049be9 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
 8049c06:	e9 8d 01 00 00       	jmp    8049d98 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
 8049c0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049c0e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c12:	8d 45 14             	lea    0x14(%ebp),%eax
 8049c15:	89 04 24             	mov    %eax,(%esp)
 8049c18:	e8 3e fd ff ff       	call   804995b <getint>
 8049c1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c20:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
 8049c23:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049c26:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049c29:	85 d2                	test   %edx,%edx
 8049c2b:	79 26                	jns    8049c53 <vprintfmt+0x2b1>
				putch('-', putdat);
 8049c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c30:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c34:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
 8049c3b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c3e:	ff d0                	call   *%eax
				num = -(long long) num;
 8049c40:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049c43:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049c46:	f7 d8                	neg    %eax
 8049c48:	83 d2 00             	adc    $0x0,%edx
 8049c4b:	f7 da                	neg    %edx
 8049c4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c50:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
 8049c53:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049c5a:	e9 c5 00 00 00       	jmp    8049d24 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
 8049c5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049c62:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c66:	8d 45 14             	lea    0x14(%ebp),%eax
 8049c69:	89 04 24             	mov    %eax,(%esp)
 8049c6c:	e8 9b fc ff ff       	call   804990c <getuint>
 8049c71:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c74:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
 8049c77:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
 8049c7e:	e9 a1 00 00 00       	jmp    8049d24 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
 8049c83:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c86:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c8a:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049c91:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c94:	ff d0                	call   *%eax
			putch('X', putdat);
 8049c96:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c99:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c9d:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049ca4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ca7:	ff d0                	call   *%eax
			putch('X', putdat);
 8049ca9:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cac:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cb0:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
 8049cb7:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cba:	ff d0                	call   *%eax
			break;
 8049cbc:	e9 d7 00 00 00       	jmp    8049d98 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
 8049cc1:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cc4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cc8:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 8049ccf:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cd2:	ff d0                	call   *%eax
			putch('x', putdat);
 8049cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049cd7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cdb:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 8049ce2:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ce5:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
 8049ce7:	8b 45 14             	mov    0x14(%ebp),%eax
 8049cea:	8d 50 04             	lea    0x4(%eax),%edx
 8049ced:	89 55 14             	mov    %edx,0x14(%ebp)
 8049cf0:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
 8049cf2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049cf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
 8049cfc:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
 8049d03:	eb 1f                	jmp    8049d24 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
 8049d05:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049d08:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d0c:	8d 45 14             	lea    0x14(%ebp),%eax
 8049d0f:	89 04 24             	mov    %eax,(%esp)
 8049d12:	e8 f5 fb ff ff       	call   804990c <getuint>
 8049d17:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049d1a:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
 8049d1d:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
 8049d24:	0f be 55 db          	movsbl -0x25(%ebp),%edx
 8049d28:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049d2b:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049d2f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049d32:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049d36:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049d3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049d3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049d40:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049d44:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049d48:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d4b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d4f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d52:	89 04 24             	mov    %eax,(%esp)
 8049d55:	e8 d4 fa ff ff       	call   804982e <printnum>
			break;
 8049d5a:	eb 3c                	jmp    8049d98 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
 8049d5c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d5f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d63:	89 1c 24             	mov    %ebx,(%esp)
 8049d66:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d69:	ff d0                	call   *%eax
			break;
 8049d6b:	eb 2b                	jmp    8049d98 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
 8049d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d70:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d74:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8049d7b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d7e:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
 8049d80:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049d84:	eb 04                	jmp    8049d8a <vprintfmt+0x3e8>
 8049d86:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8049d8a:	8b 45 10             	mov    0x10(%ebp),%eax
 8049d8d:	83 e8 01             	sub    $0x1,%eax
 8049d90:	0f b6 00             	movzbl (%eax),%eax
 8049d93:	3c 25                	cmp    $0x25,%al
 8049d95:	75 ef                	jne    8049d86 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
 8049d97:	90                   	nop
		}
	}
 8049d98:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
 8049d99:	e9 26 fc ff ff       	jmp    80499c4 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
 8049d9e:	83 c4 40             	add    $0x40,%esp
 8049da1:	5b                   	pop    %ebx
 8049da2:	5e                   	pop    %esi
 8049da3:	5d                   	pop    %ebp
 8049da4:	c3                   	ret    

08049da5 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
 8049da5:	55                   	push   %ebp
 8049da6:	89 e5                	mov    %esp,%ebp
 8049da8:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
 8049dab:	8d 45 14             	lea    0x14(%ebp),%eax
 8049dae:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
 8049db1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049db4:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049db8:	8b 45 10             	mov    0x10(%ebp),%eax
 8049dbb:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049dbf:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049dc2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dc6:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dc9:	89 04 24             	mov    %eax,(%esp)
 8049dcc:	e8 d1 fb ff ff       	call   80499a2 <vprintfmt>
	va_end(ap);
}
 8049dd1:	c9                   	leave  
 8049dd2:	c3                   	ret    

08049dd3 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
 8049dd3:	55                   	push   %ebp
 8049dd4:	89 e5                	mov    %esp,%ebp
	b->cnt++;
 8049dd6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049dd9:	8b 40 08             	mov    0x8(%eax),%eax
 8049ddc:	8d 50 01             	lea    0x1(%eax),%edx
 8049ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049de2:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
 8049de5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049de8:	8b 10                	mov    (%eax),%edx
 8049dea:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ded:	8b 40 04             	mov    0x4(%eax),%eax
 8049df0:	39 c2                	cmp    %eax,%edx
 8049df2:	73 12                	jae    8049e06 <sprintputch+0x33>
		*b->buf++ = ch;
 8049df4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049df7:	8b 00                	mov    (%eax),%eax
 8049df9:	8d 48 01             	lea    0x1(%eax),%ecx
 8049dfc:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049dff:	89 0a                	mov    %ecx,(%edx)
 8049e01:	8b 55 08             	mov    0x8(%ebp),%edx
 8049e04:	88 10                	mov    %dl,(%eax)
}
 8049e06:	5d                   	pop    %ebp
 8049e07:	c3                   	ret    

08049e08 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
 8049e08:	55                   	push   %ebp
 8049e09:	89 e5                	mov    %esp,%ebp
 8049e0b:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
 8049e0e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e11:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049e14:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049e17:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049e1a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e1d:	01 d0                	add    %edx,%eax
 8049e1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049e22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
 8049e29:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049e2d:	74 06                	je     8049e35 <vsnprintf+0x2d>
 8049e2f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049e33:	7f 07                	jg     8049e3c <vsnprintf+0x34>
		return -E_INVAL;
 8049e35:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
 8049e3a:	eb 2a                	jmp    8049e66 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
 8049e3c:	8b 45 14             	mov    0x14(%ebp),%eax
 8049e3f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049e43:	8b 45 10             	mov    0x10(%ebp),%eax
 8049e46:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049e4a:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8049e4d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e51:	c7 04 24 d3 9d 04 08 	movl   $0x8049dd3,(%esp)
 8049e58:	e8 45 fb ff ff       	call   80499a2 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
 8049e5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049e60:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
 8049e63:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049e66:	c9                   	leave  
 8049e67:	c3                   	ret    

08049e68 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
 8049e68:	55                   	push   %ebp
 8049e69:	89 e5                	mov    %esp,%ebp
 8049e6b:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
 8049e6e:	8d 45 14             	lea    0x14(%ebp),%eax
 8049e71:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
 8049e74:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049e77:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049e7b:	8b 45 10             	mov    0x10(%ebp),%eax
 8049e7e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049e82:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049e85:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e89:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e8c:	89 04 24             	mov    %eax,(%esp)
 8049e8f:	e8 74 ff ff ff       	call   8049e08 <vsnprintf>
 8049e94:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
 8049e97:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049e9a:	c9                   	leave  
 8049e9b:	c3                   	ret    

08049e9c <srand>:
static int seed = 0;

void
srand(int s) {
 8049e9c:	55                   	push   %ebp
 8049e9d:	89 e5                	mov    %esp,%ebp
	seed = s;
 8049e9f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ea2:	a3 48 6c 09 08       	mov    %eax,0x8096c48
}
 8049ea7:	5d                   	pop    %ebp
 8049ea8:	c3                   	ret    

08049ea9 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
 8049ea9:	55                   	push   %ebp
 8049eaa:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
 8049eac:	a1 48 6c 09 08       	mov    0x8096c48,%eax
 8049eb1:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 8049eb7:	83 c0 01             	add    $0x1,%eax
 8049eba:	a3 48 6c 09 08       	mov    %eax,0x8096c48
	return (seed >> 16) & 0x7FFF;
 8049ebf:	a1 48 6c 09 08       	mov    0x8096c48,%eax
 8049ec4:	c1 f8 10             	sar    $0x10,%eax
 8049ec7:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 8049ecc:	5d                   	pop    %ebp
 8049ecd:	c3                   	ret    
 8049ece:	66 90                	xchg   %ax,%ax

08049ed0 <__udivdi3>:
 8049ed0:	55                   	push   %ebp
 8049ed1:	57                   	push   %edi
 8049ed2:	56                   	push   %esi
 8049ed3:	83 ec 0c             	sub    $0xc,%esp
 8049ed6:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049eda:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 8049ede:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8049ee2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8049ee6:	85 c0                	test   %eax,%eax
 8049ee8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049eec:	89 ea                	mov    %ebp,%edx
 8049eee:	89 0c 24             	mov    %ecx,(%esp)
 8049ef1:	75 2d                	jne    8049f20 <__udivdi3+0x50>
 8049ef3:	39 e9                	cmp    %ebp,%ecx
 8049ef5:	77 61                	ja     8049f58 <__udivdi3+0x88>
 8049ef7:	85 c9                	test   %ecx,%ecx
 8049ef9:	89 ce                	mov    %ecx,%esi
 8049efb:	75 0b                	jne    8049f08 <__udivdi3+0x38>
 8049efd:	b8 01 00 00 00       	mov    $0x1,%eax
 8049f02:	31 d2                	xor    %edx,%edx
 8049f04:	f7 f1                	div    %ecx
 8049f06:	89 c6                	mov    %eax,%esi
 8049f08:	31 d2                	xor    %edx,%edx
 8049f0a:	89 e8                	mov    %ebp,%eax
 8049f0c:	f7 f6                	div    %esi
 8049f0e:	89 c5                	mov    %eax,%ebp
 8049f10:	89 f8                	mov    %edi,%eax
 8049f12:	f7 f6                	div    %esi
 8049f14:	89 ea                	mov    %ebp,%edx
 8049f16:	83 c4 0c             	add    $0xc,%esp
 8049f19:	5e                   	pop    %esi
 8049f1a:	5f                   	pop    %edi
 8049f1b:	5d                   	pop    %ebp
 8049f1c:	c3                   	ret    
 8049f1d:	8d 76 00             	lea    0x0(%esi),%esi
 8049f20:	39 e8                	cmp    %ebp,%eax
 8049f22:	77 24                	ja     8049f48 <__udivdi3+0x78>
 8049f24:	0f bd e8             	bsr    %eax,%ebp
 8049f27:	83 f5 1f             	xor    $0x1f,%ebp
 8049f2a:	75 3c                	jne    8049f68 <__udivdi3+0x98>
 8049f2c:	8b 74 24 04          	mov    0x4(%esp),%esi
 8049f30:	39 34 24             	cmp    %esi,(%esp)
 8049f33:	0f 86 9f 00 00 00    	jbe    8049fd8 <__udivdi3+0x108>
 8049f39:	39 d0                	cmp    %edx,%eax
 8049f3b:	0f 82 97 00 00 00    	jb     8049fd8 <__udivdi3+0x108>
 8049f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049f48:	31 d2                	xor    %edx,%edx
 8049f4a:	31 c0                	xor    %eax,%eax
 8049f4c:	83 c4 0c             	add    $0xc,%esp
 8049f4f:	5e                   	pop    %esi
 8049f50:	5f                   	pop    %edi
 8049f51:	5d                   	pop    %ebp
 8049f52:	c3                   	ret    
 8049f53:	90                   	nop
 8049f54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f58:	89 f8                	mov    %edi,%eax
 8049f5a:	f7 f1                	div    %ecx
 8049f5c:	31 d2                	xor    %edx,%edx
 8049f5e:	83 c4 0c             	add    $0xc,%esp
 8049f61:	5e                   	pop    %esi
 8049f62:	5f                   	pop    %edi
 8049f63:	5d                   	pop    %ebp
 8049f64:	c3                   	ret    
 8049f65:	8d 76 00             	lea    0x0(%esi),%esi
 8049f68:	89 e9                	mov    %ebp,%ecx
 8049f6a:	8b 3c 24             	mov    (%esp),%edi
 8049f6d:	d3 e0                	shl    %cl,%eax
 8049f6f:	89 c6                	mov    %eax,%esi
 8049f71:	b8 20 00 00 00       	mov    $0x20,%eax
 8049f76:	29 e8                	sub    %ebp,%eax
 8049f78:	89 c1                	mov    %eax,%ecx
 8049f7a:	d3 ef                	shr    %cl,%edi
 8049f7c:	89 e9                	mov    %ebp,%ecx
 8049f7e:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8049f82:	8b 3c 24             	mov    (%esp),%edi
 8049f85:	09 74 24 08          	or     %esi,0x8(%esp)
 8049f89:	89 d6                	mov    %edx,%esi
 8049f8b:	d3 e7                	shl    %cl,%edi
 8049f8d:	89 c1                	mov    %eax,%ecx
 8049f8f:	89 3c 24             	mov    %edi,(%esp)
 8049f92:	8b 7c 24 04          	mov    0x4(%esp),%edi
 8049f96:	d3 ee                	shr    %cl,%esi
 8049f98:	89 e9                	mov    %ebp,%ecx
 8049f9a:	d3 e2                	shl    %cl,%edx
 8049f9c:	89 c1                	mov    %eax,%ecx
 8049f9e:	d3 ef                	shr    %cl,%edi
 8049fa0:	09 d7                	or     %edx,%edi
 8049fa2:	89 f2                	mov    %esi,%edx
 8049fa4:	89 f8                	mov    %edi,%eax
 8049fa6:	f7 74 24 08          	divl   0x8(%esp)
 8049faa:	89 d6                	mov    %edx,%esi
 8049fac:	89 c7                	mov    %eax,%edi
 8049fae:	f7 24 24             	mull   (%esp)
 8049fb1:	39 d6                	cmp    %edx,%esi
 8049fb3:	89 14 24             	mov    %edx,(%esp)
 8049fb6:	72 30                	jb     8049fe8 <__udivdi3+0x118>
 8049fb8:	8b 54 24 04          	mov    0x4(%esp),%edx
 8049fbc:	89 e9                	mov    %ebp,%ecx
 8049fbe:	d3 e2                	shl    %cl,%edx
 8049fc0:	39 c2                	cmp    %eax,%edx
 8049fc2:	73 05                	jae    8049fc9 <__udivdi3+0xf9>
 8049fc4:	3b 34 24             	cmp    (%esp),%esi
 8049fc7:	74 1f                	je     8049fe8 <__udivdi3+0x118>
 8049fc9:	89 f8                	mov    %edi,%eax
 8049fcb:	31 d2                	xor    %edx,%edx
 8049fcd:	e9 7a ff ff ff       	jmp    8049f4c <__udivdi3+0x7c>
 8049fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049fd8:	31 d2                	xor    %edx,%edx
 8049fda:	b8 01 00 00 00       	mov    $0x1,%eax
 8049fdf:	e9 68 ff ff ff       	jmp    8049f4c <__udivdi3+0x7c>
 8049fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049fe8:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049feb:	31 d2                	xor    %edx,%edx
 8049fed:	83 c4 0c             	add    $0xc,%esp
 8049ff0:	5e                   	pop    %esi
 8049ff1:	5f                   	pop    %edi
 8049ff2:	5d                   	pop    %ebp
 8049ff3:	c3                   	ret    
 8049ff4:	66 90                	xchg   %ax,%ax
 8049ff6:	66 90                	xchg   %ax,%ax
 8049ff8:	66 90                	xchg   %ax,%ax
 8049ffa:	66 90                	xchg   %ax,%ax
 8049ffc:	66 90                	xchg   %ax,%ax
 8049ffe:	66 90                	xchg   %ax,%ax

0804a000 <__umoddi3>:
 804a000:	55                   	push   %ebp
 804a001:	57                   	push   %edi
 804a002:	56                   	push   %esi
 804a003:	83 ec 14             	sub    $0x14,%esp
 804a006:	8b 44 24 28          	mov    0x28(%esp),%eax
 804a00a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 804a00e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
 804a012:	89 c7                	mov    %eax,%edi
 804a014:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a018:	8b 44 24 30          	mov    0x30(%esp),%eax
 804a01c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 804a020:	89 34 24             	mov    %esi,(%esp)
 804a023:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804a027:	85 c0                	test   %eax,%eax
 804a029:	89 c2                	mov    %eax,%edx
 804a02b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 804a02f:	75 17                	jne    804a048 <__umoddi3+0x48>
 804a031:	39 fe                	cmp    %edi,%esi
 804a033:	76 4b                	jbe    804a080 <__umoddi3+0x80>
 804a035:	89 c8                	mov    %ecx,%eax
 804a037:	89 fa                	mov    %edi,%edx
 804a039:	f7 f6                	div    %esi
 804a03b:	89 d0                	mov    %edx,%eax
 804a03d:	31 d2                	xor    %edx,%edx
 804a03f:	83 c4 14             	add    $0x14,%esp
 804a042:	5e                   	pop    %esi
 804a043:	5f                   	pop    %edi
 804a044:	5d                   	pop    %ebp
 804a045:	c3                   	ret    
 804a046:	66 90                	xchg   %ax,%ax
 804a048:	39 f8                	cmp    %edi,%eax
 804a04a:	77 54                	ja     804a0a0 <__umoddi3+0xa0>
 804a04c:	0f bd e8             	bsr    %eax,%ebp
 804a04f:	83 f5 1f             	xor    $0x1f,%ebp
 804a052:	75 5c                	jne    804a0b0 <__umoddi3+0xb0>
 804a054:	8b 7c 24 08          	mov    0x8(%esp),%edi
 804a058:	39 3c 24             	cmp    %edi,(%esp)
 804a05b:	0f 87 e7 00 00 00    	ja     804a148 <__umoddi3+0x148>
 804a061:	8b 7c 24 04          	mov    0x4(%esp),%edi
 804a065:	29 f1                	sub    %esi,%ecx
 804a067:	19 c7                	sbb    %eax,%edi
 804a069:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804a06d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 804a071:	8b 44 24 08          	mov    0x8(%esp),%eax
 804a075:	8b 54 24 0c          	mov    0xc(%esp),%edx
 804a079:	83 c4 14             	add    $0x14,%esp
 804a07c:	5e                   	pop    %esi
 804a07d:	5f                   	pop    %edi
 804a07e:	5d                   	pop    %ebp
 804a07f:	c3                   	ret    
 804a080:	85 f6                	test   %esi,%esi
 804a082:	89 f5                	mov    %esi,%ebp
 804a084:	75 0b                	jne    804a091 <__umoddi3+0x91>
 804a086:	b8 01 00 00 00       	mov    $0x1,%eax
 804a08b:	31 d2                	xor    %edx,%edx
 804a08d:	f7 f6                	div    %esi
 804a08f:	89 c5                	mov    %eax,%ebp
 804a091:	8b 44 24 04          	mov    0x4(%esp),%eax
 804a095:	31 d2                	xor    %edx,%edx
 804a097:	f7 f5                	div    %ebp
 804a099:	89 c8                	mov    %ecx,%eax
 804a09b:	f7 f5                	div    %ebp
 804a09d:	eb 9c                	jmp    804a03b <__umoddi3+0x3b>
 804a09f:	90                   	nop
 804a0a0:	89 c8                	mov    %ecx,%eax
 804a0a2:	89 fa                	mov    %edi,%edx
 804a0a4:	83 c4 14             	add    $0x14,%esp
 804a0a7:	5e                   	pop    %esi
 804a0a8:	5f                   	pop    %edi
 804a0a9:	5d                   	pop    %ebp
 804a0aa:	c3                   	ret    
 804a0ab:	90                   	nop
 804a0ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a0b0:	8b 04 24             	mov    (%esp),%eax
 804a0b3:	be 20 00 00 00       	mov    $0x20,%esi
 804a0b8:	89 e9                	mov    %ebp,%ecx
 804a0ba:	29 ee                	sub    %ebp,%esi
 804a0bc:	d3 e2                	shl    %cl,%edx
 804a0be:	89 f1                	mov    %esi,%ecx
 804a0c0:	d3 e8                	shr    %cl,%eax
 804a0c2:	89 e9                	mov    %ebp,%ecx
 804a0c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a0c8:	8b 04 24             	mov    (%esp),%eax
 804a0cb:	09 54 24 04          	or     %edx,0x4(%esp)
 804a0cf:	89 fa                	mov    %edi,%edx
 804a0d1:	d3 e0                	shl    %cl,%eax
 804a0d3:	89 f1                	mov    %esi,%ecx
 804a0d5:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a0d9:	8b 44 24 10          	mov    0x10(%esp),%eax
 804a0dd:	d3 ea                	shr    %cl,%edx
 804a0df:	89 e9                	mov    %ebp,%ecx
 804a0e1:	d3 e7                	shl    %cl,%edi
 804a0e3:	89 f1                	mov    %esi,%ecx
 804a0e5:	d3 e8                	shr    %cl,%eax
 804a0e7:	89 e9                	mov    %ebp,%ecx
 804a0e9:	09 f8                	or     %edi,%eax
 804a0eb:	8b 7c 24 10          	mov    0x10(%esp),%edi
 804a0ef:	f7 74 24 04          	divl   0x4(%esp)
 804a0f3:	d3 e7                	shl    %cl,%edi
 804a0f5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 804a0f9:	89 d7                	mov    %edx,%edi
 804a0fb:	f7 64 24 08          	mull   0x8(%esp)
 804a0ff:	39 d7                	cmp    %edx,%edi
 804a101:	89 c1                	mov    %eax,%ecx
 804a103:	89 14 24             	mov    %edx,(%esp)
 804a106:	72 2c                	jb     804a134 <__umoddi3+0x134>
 804a108:	39 44 24 0c          	cmp    %eax,0xc(%esp)
 804a10c:	72 22                	jb     804a130 <__umoddi3+0x130>
 804a10e:	8b 44 24 0c          	mov    0xc(%esp),%eax
 804a112:	29 c8                	sub    %ecx,%eax
 804a114:	19 d7                	sbb    %edx,%edi
 804a116:	89 e9                	mov    %ebp,%ecx
 804a118:	89 fa                	mov    %edi,%edx
 804a11a:	d3 e8                	shr    %cl,%eax
 804a11c:	89 f1                	mov    %esi,%ecx
 804a11e:	d3 e2                	shl    %cl,%edx
 804a120:	89 e9                	mov    %ebp,%ecx
 804a122:	d3 ef                	shr    %cl,%edi
 804a124:	09 d0                	or     %edx,%eax
 804a126:	89 fa                	mov    %edi,%edx
 804a128:	83 c4 14             	add    $0x14,%esp
 804a12b:	5e                   	pop    %esi
 804a12c:	5f                   	pop    %edi
 804a12d:	5d                   	pop    %ebp
 804a12e:	c3                   	ret    
 804a12f:	90                   	nop
 804a130:	39 d7                	cmp    %edx,%edi
 804a132:	75 da                	jne    804a10e <__umoddi3+0x10e>
 804a134:	8b 14 24             	mov    (%esp),%edx
 804a137:	89 c1                	mov    %eax,%ecx
 804a139:	2b 4c 24 08          	sub    0x8(%esp),%ecx
 804a13d:	1b 54 24 04          	sbb    0x4(%esp),%edx
 804a141:	eb cb                	jmp    804a10e <__umoddi3+0x10e>
 804a143:	90                   	nop
 804a144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a148:	3b 44 24 0c          	cmp    0xc(%esp),%eax
 804a14c:	0f 82 0f ff ff ff    	jb     804a061 <__umoddi3+0x61>
 804a152:	e9 1a ff ff ff       	jmp    804a071 <__umoddi3+0x71>
