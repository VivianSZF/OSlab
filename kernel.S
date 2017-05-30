
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0100000 <do_syscall>:
int ksem_wait(Sema *sema);
int ksem_trywait(Sema *sema);
int ksem_post(Sema *sema);


void do_syscall(struct TrapFrame *tf) {
c0100000:	55                   	push   %ebp
c0100001:	89 e5                	mov    %esp,%ebp
c0100003:	83 ec 28             	sub    $0x28,%esp
	//printk("%d\n",tf->eax);
	switch(tf->eax) {
c0100006:	8b 45 08             	mov    0x8(%ebp),%eax
c0100009:	8b 40 1c             	mov    0x1c(%eax),%eax
c010000c:	83 f8 0e             	cmp    $0xe,%eax
c010000f:	0f 87 54 01 00 00    	ja     c0100169 <do_syscall+0x169>
c0100015:	8b 04 85 74 3f 10 c0 	mov    -0x3fefc08c(,%eax,4),%eax
c010001c:	ff e0                	jmp    *%eax
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c010001e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100021:	8b 40 10             	mov    0x10(%eax),%eax
c0100024:	89 04 24             	mov    %eax,(%esp)
c0100027:	e8 50 0a 00 00       	call   c0100a7c <sys_pr>
c010002c:	89 c2                	mov    %eax,%edx
c010002e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100031:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100034:	e9 60 01 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_time:
			tf->eax=sys_time();
c0100039:	e8 82 01 00 00       	call   c01001c0 <sys_time>
c010003e:	89 c2                	mov    %eax,%edx
c0100040:	8b 45 08             	mov    0x8(%ebp),%eax
c0100043:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100046:	e9 4e 01 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
c010004b:	e8 7a 01 00 00       	call   c01001ca <sys_readkey>
c0100050:	89 c2                	mov    %eax,%edx
c0100052:	8b 45 08             	mov    0x8(%ebp),%eax
c0100055:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100058:	e9 3c 01 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_write: 
			tf->eax=sys_write(tf->ebx,(void*)tf->ecx,tf->edx); 
c010005d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100060:	8b 40 14             	mov    0x14(%eax),%eax
c0100063:	89 c1                	mov    %eax,%ecx
c0100065:	8b 45 08             	mov    0x8(%ebp),%eax
c0100068:	8b 40 18             	mov    0x18(%eax),%eax
c010006b:	89 c2                	mov    %eax,%edx
c010006d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100070:	8b 40 10             	mov    0x10(%eax),%eax
c0100073:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0100077:	89 54 24 04          	mov    %edx,0x4(%esp)
c010007b:	89 04 24             	mov    %eax,(%esp)
c010007e:	e8 cf 2b 00 00       	call   c0102c52 <sys_write>
c0100083:	89 c2                	mov    %eax,%edx
c0100085:	8b 45 08             	mov    0x8(%ebp),%eax
c0100088:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008b:	e9 09 01 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_fork:
			sys_fork();
c0100090:	e8 ac 15 00 00       	call   c0101641 <sys_fork>
			break;
c0100095:	e9 ff 00 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_getpid:
			tf->eax=sys_getpid();
c010009a:	e8 fa 15 00 00       	call   c0101699 <sys_getpid>
c010009f:	8b 55 08             	mov    0x8(%ebp),%edx
c01000a2:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c01000a5:	e9 ef 00 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_exit:
			sys_exit();
c01000aa:	e8 f7 15 00 00       	call   c01016a6 <sys_exit>
			break;
c01000af:	e9 e5 00 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01000b7:	8b 40 10             	mov    0x10(%eax),%eax
c01000ba:	89 04 24             	mov    %eax,(%esp)
c01000bd:	e8 1b 17 00 00       	call   c01017dd <sys_sleep>
			break;
c01000c2:	e9 d2 00 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_thread:
			tf->eax=kthread((void*)tf->ebx);
c01000c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ca:	8b 40 10             	mov    0x10(%eax),%eax
c01000cd:	89 04 24             	mov    %eax,(%esp)
c01000d0:	e8 18 18 00 00       	call   c01018ed <kthread>
c01000d5:	89 c2                	mov    %eax,%edx
c01000d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000da:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c01000dd:	e9 b7 00 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_sem_init:
			tf->eax=ksem_init((void*)tf->ebx,tf->ecx);
c01000e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01000e5:	8b 40 18             	mov    0x18(%eax),%eax
c01000e8:	89 c2                	mov    %eax,%edx
c01000ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ed:	8b 40 10             	mov    0x10(%eax),%eax
c01000f0:	89 54 24 04          	mov    %edx,0x4(%esp)
c01000f4:	89 04 24             	mov    %eax,(%esp)
c01000f7:	e8 f2 19 00 00       	call   c0101aee <ksem_init>
c01000fc:	89 c2                	mov    %eax,%edx
c01000fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0100101:	89 50 1c             	mov    %edx,0x1c(%eax)
			//printk("131231412\n");
			break;
c0100104:	e9 90 00 00 00       	jmp    c0100199 <do_syscall+0x199>
		case SYS_sem_destroy:
			tf->eax=ksem_destroy((Sema*)tf->ebx);
c0100109:	8b 45 08             	mov    0x8(%ebp),%eax
c010010c:	8b 40 10             	mov    0x10(%eax),%eax
c010010f:	89 04 24             	mov    %eax,(%esp)
c0100112:	e8 04 1a 00 00       	call   c0101b1b <ksem_destroy>
c0100117:	89 c2                	mov    %eax,%edx
c0100119:	8b 45 08             	mov    0x8(%ebp),%eax
c010011c:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010011f:	eb 78                	jmp    c0100199 <do_syscall+0x199>
		case SYS_sem_wait:
			tf->eax=ksem_wait((Sema*)tf->ebx);
c0100121:	8b 45 08             	mov    0x8(%ebp),%eax
c0100124:	8b 40 10             	mov    0x10(%eax),%eax
c0100127:	89 04 24             	mov    %eax,(%esp)
c010012a:	e8 55 1a 00 00       	call   c0101b84 <ksem_wait>
c010012f:	89 c2                	mov    %eax,%edx
c0100131:	8b 45 08             	mov    0x8(%ebp),%eax
c0100134:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100137:	eb 60                	jmp    c0100199 <do_syscall+0x199>
		case SYS_sem_trywait:
			tf->eax=ksem_trywait((Sema*)tf->ebx);
c0100139:	8b 45 08             	mov    0x8(%ebp),%eax
c010013c:	8b 40 10             	mov    0x10(%eax),%eax
c010013f:	89 04 24             	mov    %eax,(%esp)
c0100142:	e8 b7 1a 00 00       	call   c0101bfe <ksem_trywait>
c0100147:	89 c2                	mov    %eax,%edx
c0100149:	8b 45 08             	mov    0x8(%ebp),%eax
c010014c:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010014f:	eb 48                	jmp    c0100199 <do_syscall+0x199>
		case SYS_sem_post:
			tf->eax=ksem_post((Sema*)tf->ebx);
c0100151:	8b 45 08             	mov    0x8(%ebp),%eax
c0100154:	8b 40 10             	mov    0x10(%eax),%eax
c0100157:	89 04 24             	mov    %eax,(%esp)
c010015a:	e8 d5 1a 00 00       	call   c0101c34 <ksem_post>
c010015f:	89 c2                	mov    %eax,%edx
c0100161:	8b 45 08             	mov    0x8(%ebp),%eax
c0100164:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100167:	eb 30                	jmp    c0100199 <do_syscall+0x199>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c0100169:	8b 45 08             	mov    0x8(%ebp),%eax
c010016c:	8b 50 38             	mov    0x38(%eax),%edx
c010016f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100172:	8b 40 1c             	mov    0x1c(%eax),%eax
c0100175:	89 54 24 10          	mov    %edx,0x10(%esp)
c0100179:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010017d:	c7 44 24 08 28 3f 10 	movl   $0xc0103f28,0x8(%esp)
c0100184:	c0 
c0100185:	c7 44 24 04 43 00 00 	movl   $0x43,0x4(%esp)
c010018c:	00 
c010018d:	c7 04 24 55 3f 10 c0 	movl   $0xc0103f55,(%esp)
c0100194:	e8 19 2a 00 00       	call   c0102bb2 <_panic>
 	}
} 
c0100199:	c9                   	leave  
c010019a:	c3                   	ret    

c010019b <enable_interrupt>:
	asm volatile("lidt (%0)" : : "r"(data));
}

/* 打开外部中断 */
static inline void
enable_interrupt(void) {
c010019b:	55                   	push   %ebp
c010019c:	89 e5                	mov    %esp,%ebp
	asm volatile("sti");
c010019e:	fb                   	sti    
}
c010019f:	5d                   	pop    %ebp
c01001a0:	c3                   	ret    

c01001a1 <timer_event>:
void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
c01001a1:	55                   	push   %ebp
c01001a2:	89 e5                	mov    %esp,%ebp
	tick++;
c01001a4:	a1 00 10 11 c0       	mov    0xc0111000,%eax
c01001a9:	83 c0 01             	add    $0x1,%eax
c01001ac:	a3 00 10 11 c0       	mov    %eax,0xc0111000
}
c01001b1:	5d                   	pop    %ebp
c01001b2:	c3                   	ret    

c01001b3 <keyboard_event>:
static int last_code = -1;
void keyboard_event(int code)
{
c01001b3:	55                   	push   %ebp
c01001b4:	89 e5                	mov    %esp,%ebp
	last_code = code;
c01001b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01001b9:	a3 00 60 10 c0       	mov    %eax,0xc0106000
}
c01001be:	5d                   	pop    %ebp
c01001bf:	c3                   	ret    

c01001c0 <sys_time>:
int sys_time(void)
{
c01001c0:	55                   	push   %ebp
c01001c1:	89 e5                	mov    %esp,%ebp
	return tick;
c01001c3:	a1 00 10 11 c0       	mov    0xc0111000,%eax
}
c01001c8:	5d                   	pop    %ebp
c01001c9:	c3                   	ret    

c01001ca <sys_readkey>:
int sys_readkey(void)
{
c01001ca:	55                   	push   %ebp
c01001cb:	89 e5                	mov    %esp,%ebp
c01001cd:	83 ec 10             	sub    $0x10,%esp
	int code = last_code;
c01001d0:	a1 00 60 10 c0       	mov    0xc0106000,%eax
c01001d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
	last_code = -1;
c01001d8:	c7 05 00 60 10 c0 ff 	movl   $0xffffffff,0xc0106000
c01001df:	ff ff ff 
	return code;
c01001e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01001e5:	c9                   	leave  
c01001e6:	c3                   	ret    

c01001e7 <main>:

int main()
{
c01001e7:	55                   	push   %ebp
c01001e8:	89 e5                	mov    %esp,%ebp
c01001ea:	83 e4 f0             	and    $0xfffffff0,%esp
c01001ed:	83 ec 10             	sub    $0x10,%esp
	page_init();
c01001f0:	e8 b1 1b 00 00       	call   c0101da6 <page_init>
	//printk("here");
	init_segment();
c01001f5:	e8 f8 28 00 00       	call   c0102af2 <init_segment>
	pcb_init();
c01001fa:	e8 34 0c 00 00       	call   c0100e33 <pcb_init>
	//printk("here");
	init_serial();
c01001ff:	e8 9a 08 00 00       	call   c0100a9e <init_serial>
	init_video();
c0100204:	e8 63 07 00 00       	call   c010096c <init_video>
	init_timer();
c0100209:	e8 84 09 00 00       	call   c0100b92 <init_timer>
	init_idt();
c010020e:	e8 73 02 00 00       	call   c0100486 <init_idt>
	init_intr();
c0100213:	e8 31 00 00 00       	call   c0100249 <init_intr>
	
	//printk("here");

	set_timer_intr_handler(timer_event);
c0100218:	c7 04 24 a1 01 10 c0 	movl   $0xc01001a1,(%esp)
c010021f:	e8 80 05 00 00       	call   c01007a4 <set_timer_intr_handler>
	set_keyboard_intr_handler(keyboard_event);
c0100224:	c7 04 24 b3 01 10 c0 	movl   $0xc01001b3,(%esp)
c010022b:	e8 81 05 00 00       	call   c01007b1 <set_keyboard_intr_handler>
	//printk("here");
	pcb_new();
c0100230:	e8 40 10 00 00       	call   c0101275 <pcb_new>
	//PCB* p=pcb_new();
	enable_interrupt();
c0100235:	e8 61 ff ff ff       	call   c010019b <enable_interrupt>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c010023a:	f4                   	hlt    
	hlt();
	printk("we are here");
c010023b:	c7 04 24 b0 3f 10 c0 	movl   $0xc0103fb0,(%esp)
c0100242:	e8 9a 2a 00 00       	call   c0102ce1 <printk>
	//to_user(p);
	//printk("here");
	while(1);
c0100247:	eb fe                	jmp    c0100247 <main+0x60>

c0100249 <init_intr>:
#define IRQ_SLAVE	2

/* 初始�?259中断控制器：
 * 硬件中断IRQ�?2号开始，自动发送EOI */
void
init_intr(void) {
c0100249:	55                   	push   %ebp
c010024a:	89 e5                	mov    %esp,%ebp
c010024c:	83 ec 70             	sub    $0x70,%esp
c010024f:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
c0100256:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c010025a:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010025e:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100261:	ee                   	out    %al,(%dx)
c0100262:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
c0100269:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
c010026d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100271:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100274:	ee                   	out    %al,(%dx)
c0100275:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010027c:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
c0100280:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100284:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100287:	ee                   	out    %al,(%dx)
c0100288:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
c010028f:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
c0100293:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100297:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010029a:	ee                   	out    %al,(%dx)
c010029b:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
c01002a2:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
c01002a6:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01002aa:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01002ad:	ee                   	out    %al,(%dx)
c01002ae:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
c01002b5:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
c01002b9:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01002bd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01002c0:	ee                   	out    %al,(%dx)
c01002c1:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
c01002c8:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
c01002cc:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c01002d0:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01002d3:	ee                   	out    %al,(%dx)
c01002d4:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
c01002db:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
c01002df:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c01002e3:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c01002e6:	ee                   	out    %al,(%dx)
c01002e7:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
c01002ee:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
c01002f2:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c01002f6:	8b 55 bc             	mov    -0x44(%ebp),%edx
c01002f9:	ee                   	out    %al,(%dx)
c01002fa:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
c0100301:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
c0100305:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
c0100309:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010030c:	ee                   	out    %al,(%dx)
c010030d:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
c0100314:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
c0100318:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
c010031c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010031f:	ee                   	out    %al,(%dx)
c0100320:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
c0100327:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
c010032b:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
c010032f:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0100332:	ee                   	out    %al,(%dx)
c0100333:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
c010033a:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
c010033e:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
c0100342:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100345:	ee                   	out    %al,(%dx)
c0100346:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
c010034d:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
c0100351:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
c0100355:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0100358:	ee                   	out    %al,(%dx)
	outb(IO_PIC1, 0x68);             /* clear specific mask */
	outb(IO_PIC1, 0x0a);             /* read IRR by default */

	outb(IO_PIC2, 0x68);             /* OCW3 */
	outb(IO_PIC2, 0x0a);             /* OCW3 */
}
c0100359:	c9                   	leave  
c010035a:	c3                   	ret    

c010035b <save_idt>:
	asm volatile("hlt");
}

/* 修改IDRT */
static inline void
save_idt(void *addr, uint32_t size) {
c010035b:	55                   	push   %ebp
c010035c:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c010035e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100361:	83 e8 01             	sub    $0x1,%eax
c0100364:	66 a3 04 10 11 c0    	mov    %ax,0xc0111004
	data[1] = (uint32_t)addr;
c010036a:	8b 45 08             	mov    0x8(%ebp),%eax
c010036d:	66 a3 06 10 11 c0    	mov    %ax,0xc0111006
	data[2] = ((uint32_t)addr) >> 16;
c0100373:	8b 45 08             	mov    0x8(%ebp),%eax
c0100376:	c1 e8 10             	shr    $0x10,%eax
c0100379:	66 a3 08 10 11 c0    	mov    %ax,0xc0111008
	asm volatile("lidt (%0)" : : "r"(data));
c010037f:	b8 04 10 11 c0       	mov    $0xc0111004,%eax
c0100384:	0f 01 18             	lidtl  (%eax)
}
c0100387:	5d                   	pop    %ebp
c0100388:	c3                   	ret    

c0100389 <set_intr>:
/* IDT表的内容 */
struct Gatedesc idt[NR_IRQ];

/* 初始化一个中断门(interrupt gate) */
static void
set_intr(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100389:	55                   	push   %ebp
c010038a:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c010038c:	8b 45 10             	mov    0x10(%ebp),%eax
c010038f:	89 c2                	mov    %eax,%edx
c0100391:	8b 45 08             	mov    0x8(%ebp),%eax
c0100394:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100397:	8b 45 0c             	mov    0xc(%ebp),%eax
c010039a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01003a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01003a4:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c01003a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01003ab:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = INTERRUPT_GATE_32;
c01003af:	8b 45 08             	mov    0x8(%ebp),%eax
c01003b2:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003b6:	83 e2 f0             	and    $0xfffffff0,%edx
c01003b9:	83 ca 0e             	or     $0xe,%edx
c01003bc:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c01003bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01003c2:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003c6:	83 e2 ef             	and    $0xffffffef,%edx
c01003c9:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c01003cc:	8b 45 14             	mov    0x14(%ebp),%eax
c01003cf:	83 e0 03             	and    $0x3,%eax
c01003d2:	89 c2                	mov    %eax,%edx
c01003d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d7:	83 e2 03             	and    $0x3,%edx
c01003da:	89 d1                	mov    %edx,%ecx
c01003dc:	c1 e1 05             	shl    $0x5,%ecx
c01003df:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003e3:	83 e2 9f             	and    $0xffffff9f,%edx
c01003e6:	09 ca                	or     %ecx,%edx
c01003e8:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c01003eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01003ee:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003f2:	83 ca 80             	or     $0xffffff80,%edx
c01003f5:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c01003f8:	8b 45 10             	mov    0x10(%ebp),%eax
c01003fb:	c1 e8 10             	shr    $0x10,%eax
c01003fe:	89 c2                	mov    %eax,%edx
c0100400:	8b 45 08             	mov    0x8(%ebp),%eax
c0100403:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100407:	5d                   	pop    %ebp
c0100408:	c3                   	ret    

c0100409 <set_trap>:

/* 初始化一个陷阱门(trap gate) */
static void
set_trap(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100409:	55                   	push   %ebp
c010040a:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c010040c:	8b 45 10             	mov    0x10(%ebp),%eax
c010040f:	89 c2                	mov    %eax,%edx
c0100411:	8b 45 08             	mov    0x8(%ebp),%eax
c0100414:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100417:	8b 45 0c             	mov    0xc(%ebp),%eax
c010041a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100421:	8b 45 08             	mov    0x8(%ebp),%eax
c0100424:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100428:	8b 45 08             	mov    0x8(%ebp),%eax
c010042b:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = TRAP_GATE_32;
c010042f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100432:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100436:	83 ca 0f             	or     $0xf,%edx
c0100439:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c010043c:	8b 45 08             	mov    0x8(%ebp),%eax
c010043f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100443:	83 e2 ef             	and    $0xffffffef,%edx
c0100446:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c0100449:	8b 45 14             	mov    0x14(%ebp),%eax
c010044c:	83 e0 03             	and    $0x3,%eax
c010044f:	89 c2                	mov    %eax,%edx
c0100451:	8b 45 08             	mov    0x8(%ebp),%eax
c0100454:	83 e2 03             	and    $0x3,%edx
c0100457:	89 d1                	mov    %edx,%ecx
c0100459:	c1 e1 05             	shl    $0x5,%ecx
c010045c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100460:	83 e2 9f             	and    $0xffffff9f,%edx
c0100463:	09 ca                	or     %ecx,%edx
c0100465:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c0100468:	8b 45 08             	mov    0x8(%ebp),%eax
c010046b:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010046f:	83 ca 80             	or     $0xffffff80,%edx
c0100472:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100475:	8b 45 10             	mov    0x10(%ebp),%eax
c0100478:	c1 e8 10             	shr    $0x10,%eax
c010047b:	89 c2                	mov    %eax,%edx
c010047d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100480:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100484:	5d                   	pop    %ebp
c0100485:	c3                   	ret    

c0100486 <init_idt>:
void vec13();
void vec14();
void vecsys();
void irq_empty();

void init_idt() {
c0100486:	55                   	push   %ebp
c0100487:	89 e5                	mov    %esp,%ebp
c0100489:	83 ec 20             	sub    $0x20,%esp
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c010048c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100493:	eb 31                	jmp    c01004c6 <init_idt+0x40>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
c0100495:	b8 b2 2d 10 c0       	mov    $0xc0102db2,%eax
c010049a:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010049d:	c1 e2 03             	shl    $0x3,%edx
c01004a0:	81 c2 20 4f 16 c0    	add    $0xc0164f20,%edx
c01004a6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004ad:	00 
c01004ae:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004b2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004b9:	00 
c01004ba:	89 14 24             	mov    %edx,(%esp)
c01004bd:	e8 47 ff ff ff       	call   c0100409 <set_trap>
void irq_empty();

void init_idt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01004c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01004c6:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
c01004cd:	7e c6                	jle    c0100495 <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
	}

	/* 设置异常的中断处�?*/
	set_trap(idt + 0, SEG_KERNEL_CODE, (uint32_t)vec0, DPL_KERNEL);
c01004cf:	b8 07 2d 10 c0       	mov    $0xc0102d07,%eax
c01004d4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004db:	00 
c01004dc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004e0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004e7:	00 
c01004e8:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c01004ef:	e8 15 ff ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c01004f4:	b8 10 2d 10 c0       	mov    $0xc0102d10,%eax
c01004f9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100500:	00 
c0100501:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100505:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010050c:	00 
c010050d:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c0100514:	e8 f0 fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100519:	b8 19 2d 10 c0       	mov    $0xc0102d19,%eax
c010051e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100525:	00 
c0100526:	89 44 24 08          	mov    %eax,0x8(%esp)
c010052a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100531:	00 
c0100532:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c0100539:	e8 cb fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c010053e:	b8 22 2d 10 c0       	mov    $0xc0102d22,%eax
c0100543:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010054a:	00 
c010054b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010054f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100556:	00 
c0100557:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c010055e:	e8 a6 fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c0100563:	b8 2b 2d 10 c0       	mov    $0xc0102d2b,%eax
c0100568:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010056f:	00 
c0100570:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100574:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010057b:	00 
c010057c:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c0100583:	e8 81 fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c0100588:	b8 34 2d 10 c0       	mov    $0xc0102d34,%eax
c010058d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100594:	00 
c0100595:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100599:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005a0:	00 
c01005a1:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c01005a8:	e8 5c fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c01005ad:	b8 3d 2d 10 c0       	mov    $0xc0102d3d,%eax
c01005b2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005b9:	00 
c01005ba:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005be:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005c5:	00 
c01005c6:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c01005cd:	e8 37 fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c01005d2:	b8 46 2d 10 c0       	mov    $0xc0102d46,%eax
c01005d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005de:	00 
c01005df:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005e3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005ea:	00 
c01005eb:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c01005f2:	e8 12 fe ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c01005f7:	b8 4f 2d 10 c0       	mov    $0xc0102d4f,%eax
c01005fc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100603:	00 
c0100604:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100608:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010060f:	00 
c0100610:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c0100617:	e8 ed fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c010061c:	b8 56 2d 10 c0       	mov    $0xc0102d56,%eax
c0100621:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100628:	00 
c0100629:	89 44 24 08          	mov    %eax,0x8(%esp)
c010062d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100634:	00 
c0100635:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c010063c:	e8 c8 fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c0100641:	b8 5f 2d 10 c0       	mov    $0xc0102d5f,%eax
c0100646:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010064d:	00 
c010064e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100652:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100659:	00 
c010065a:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c0100661:	e8 a3 fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c0100666:	b8 66 2d 10 c0       	mov    $0xc0102d66,%eax
c010066b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100672:	00 
c0100673:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100677:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010067e:	00 
c010067f:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c0100686:	e8 7e fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c010068b:	b8 6d 2d 10 c0       	mov    $0xc0102d6d,%eax
c0100690:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100697:	00 
c0100698:	89 44 24 08          	mov    %eax,0x8(%esp)
c010069c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006a3:	00 
c01006a4:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c01006ab:	e8 59 fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c01006b0:	b8 74 2d 10 c0       	mov    $0xc0102d74,%eax
c01006b5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006bc:	00 
c01006bd:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006c1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006c8:	00 
c01006c9:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c01006d0:	e8 34 fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c01006d5:	b8 7b 2d 10 c0       	mov    $0xc0102d7b,%eax
c01006da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006e1:	00 
c01006e2:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006e6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006ed:	00 
c01006ee:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c01006f5:	e8 0f fd ff ff       	call   c0100409 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c01006fa:	b8 82 2d 10 c0       	mov    $0xc0102d82,%eax
c01006ff:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c0100706:	00 
c0100707:	89 44 24 08          	mov    %eax,0x8(%esp)
c010070b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100712:	00 
c0100713:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c010071a:	e8 ea fc ff ff       	call   c0100409 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c010071f:	b8 8e 2d 10 c0       	mov    $0xc0102d8e,%eax
c0100724:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010072b:	00 
c010072c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100730:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100737:	00 
c0100738:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c010073f:	e8 45 fc ff ff       	call   c0100389 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c0100744:	b8 9a 2d 10 c0       	mov    $0xc0102d9a,%eax
c0100749:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100750:	00 
c0100751:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100755:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010075c:	00 
c010075d:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c0100764:	e8 20 fc ff ff       	call   c0100389 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c0100769:	b8 a6 2d 10 c0       	mov    $0xc0102da6,%eax
c010076e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100775:	00 
c0100776:	89 44 24 08          	mov    %eax,0x8(%esp)
c010077a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100781:	00 
c0100782:	c7 04 24 90 50 16 c0 	movl   $0xc0165090,(%esp)
c0100789:	e8 fb fb ff ff       	call   c0100389 <set_intr>
	 * x86.h提供了相关内联汇编的支持
	 * 然后将hlt()删除
	 * 
	 * */
	
	save_idt(idt, sizeof(idt));
c010078e:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
c0100795:	00 
c0100796:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c010079d:	e8 b9 fb ff ff       	call   c010035b <save_idt>
}
c01007a2:	c9                   	leave  
c01007a3:	c3                   	ret    

c01007a4 <set_timer_intr_handler>:

static void (*do_timer)(void);
static void (*do_keyboard)(int);

void
set_timer_intr_handler( void (*ptr)(void) ) {
c01007a4:	55                   	push   %ebp
c01007a5:	89 e5                	mov    %esp,%ebp
	do_timer = ptr;
c01007a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01007aa:	a3 0c 10 11 c0       	mov    %eax,0xc011100c
}
c01007af:	5d                   	pop    %ebp
c01007b0:	c3                   	ret    

c01007b1 <set_keyboard_intr_handler>:
void
set_keyboard_intr_handler( void (*ptr)(int) ) {
c01007b1:	55                   	push   %ebp
c01007b2:	89 e5                	mov    %esp,%ebp
	do_keyboard = ptr;
c01007b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01007b7:	a3 10 10 11 c0       	mov    %eax,0xc0111010
}
c01007bc:	5d                   	pop    %ebp
c01007bd:	c3                   	ret    

c01007be <irq_handle>:

/* TrapFrame的定义在include/memory.h
 * 请仔细理解这段程序的含义，这些内容将在后续的实验中被反复使用�?*/
void
irq_handle(struct TrapFrame *tf) {
c01007be:	55                   	push   %ebp
c01007bf:	89 e5                	mov    %esp,%ebp
c01007c1:	83 ec 48             	sub    $0x48,%esp
	pcbnow->tf=tf;
c01007c4:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01007c9:	8b 55 08             	mov    0x8(%ebp),%edx
c01007cc:	89 10                	mov    %edx,(%eax)
	if (tf->irq == 0x80) {
c01007ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01007d1:	8b 40 30             	mov    0x30(%eax),%eax
c01007d4:	3d 80 00 00 00       	cmp    $0x80,%eax
c01007d9:	75 10                	jne    c01007eb <irq_handle+0x2d>
		do_syscall(tf);
c01007db:	8b 45 08             	mov    0x8(%ebp),%eax
c01007de:	89 04 24             	mov    %eax,(%esp)
c01007e1:	e8 1a f8 ff ff       	call   c0100000 <do_syscall>
c01007e6:	e9 7f 01 00 00       	jmp    c010096a <irq_handle+0x1ac>
	}
	else if(tf->irq < 1000) {
c01007eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01007ee:	8b 40 30             	mov    0x30(%eax),%eax
c01007f1:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c01007f6:	7f 73                	jg     c010086b <irq_handle+0xad>
		if(tf->irq == -1) {
c01007f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01007fb:	8b 40 30             	mov    0x30(%eax),%eax
c01007fe:	83 f8 ff             	cmp    $0xffffffff,%eax
c0100801:	75 1e                	jne    c0100821 <irq_handle+0x63>
			printk("%s, %d: Unhandled exception!\n", __FUNCTION__, __LINE__);
c0100803:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
c010080a:	00 
c010080b:	c7 44 24 04 2e 40 10 	movl   $0xc010402e,0x4(%esp)
c0100812:	c0 
c0100813:	c7 04 24 bc 3f 10 c0 	movl   $0xc0103fbc,(%esp)
c010081a:	e8 c2 24 00 00       	call   c0102ce1 <printk>
c010081f:	eb 26                	jmp    c0100847 <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100821:	8b 45 08             	mov    0x8(%ebp),%eax
c0100824:	8b 40 30             	mov    0x30(%eax),%eax
c0100827:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010082b:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0100832:	00 
c0100833:	c7 44 24 04 2e 40 10 	movl   $0xc010402e,0x4(%esp)
c010083a:	c0 
c010083b:	c7 04 24 dc 3f 10 c0 	movl   $0xc0103fdc,(%esp)
c0100842:	e8 9a 24 00 00       	call   c0102ce1 <printk>
		}
		assert(0);
c0100847:	c7 44 24 0c ff 3f 10 	movl   $0xc0103fff,0xc(%esp)
c010084e:	c0 
c010084f:	c7 44 24 08 01 40 10 	movl   $0xc0104001,0x8(%esp)
c0100856:	c0 
c0100857:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c010085e:	00 
c010085f:	c7 04 24 16 40 10 c0 	movl   $0xc0104016,(%esp)
c0100866:	e8 47 23 00 00       	call   c0102bb2 <_panic>
	}

	else if (tf->irq == 1000) {
c010086b:	8b 45 08             	mov    0x8(%ebp),%eax
c010086e:	8b 40 30             	mov    0x30(%eax),%eax
c0100871:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c0100876:	75 18                	jne    c0100890 <irq_handle+0xd2>
		do_timer();
c0100878:	a1 0c 10 11 c0       	mov    0xc011100c,%eax
c010087d:	ff d0                	call   *%eax
		schedule(1);
c010087f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100886:	e8 37 1f 00 00       	call   c01027c2 <schedule>
c010088b:	e9 da 00 00 00       	jmp    c010096a <irq_handle+0x1ac>
	} else if (tf->irq == 1001) {
c0100890:	8b 45 08             	mov    0x8(%ebp),%eax
c0100893:	8b 40 30             	mov    0x30(%eax),%eax
c0100896:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c010089b:	75 76                	jne    c0100913 <irq_handle+0x155>
c010089d:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008a7:	89 c2                	mov    %eax,%edx
c01008a9:	ec                   	in     (%dx),%al
c01008aa:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c01008ad:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c01008b1:	0f b6 c0             	movzbl %al,%eax
c01008b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01008b7:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01008c1:	89 c2                	mov    %eax,%edx
c01008c3:	ec                   	in     (%dx),%al
c01008c4:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c01008c7:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c01008cb:	0f b6 c0             	movzbl %al,%eax
c01008ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c01008d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008d4:	83 c8 80             	or     $0xffffff80,%eax
c01008d7:	0f b6 c0             	movzbl %al,%eax
c01008da:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c01008e1:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01008e4:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01008e8:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01008eb:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c01008ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008ef:	0f b6 c0             	movzbl %al,%eax
c01008f2:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c01008f9:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01008fc:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100900:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100903:	ee                   	out    %al,(%dx)
		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c0100904:	a1 10 10 11 c0       	mov    0xc0111010,%eax
c0100909:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010090c:	89 14 24             	mov    %edx,(%esp)
c010090f:	ff d0                	call   *%eax
c0100911:	eb 57                	jmp    c010096a <irq_handle+0x1ac>
	}else if(tf->irq==1014){
c0100913:	8b 45 08             	mov    0x8(%ebp),%eax
c0100916:	8b 40 30             	mov    0x30(%eax),%eax
c0100919:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c010091e:	74 4a                	je     c010096a <irq_handle+0x1ac>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100920:	8b 45 08             	mov    0x8(%ebp),%eax
c0100923:	8b 40 30             	mov    0x30(%eax),%eax
c0100926:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010092a:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
c0100931:	00 
c0100932:	c7 44 24 04 2e 40 10 	movl   $0xc010402e,0x4(%esp)
c0100939:	c0 
c010093a:	c7 04 24 dc 3f 10 c0 	movl   $0xc0103fdc,(%esp)
c0100941:	e8 9b 23 00 00       	call   c0102ce1 <printk>
		assert(0);
c0100946:	c7 44 24 0c ff 3f 10 	movl   $0xc0103fff,0xc(%esp)
c010094d:	c0 
c010094e:	c7 44 24 08 01 40 10 	movl   $0xc0104001,0x8(%esp)
c0100955:	c0 
c0100956:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c010095d:	00 
c010095e:	c7 04 24 16 40 10 c0 	movl   $0xc0104016,(%esp)
c0100965:	e8 48 22 00 00       	call   c0102bb2 <_panic>
	}
}
c010096a:	c9                   	leave  
c010096b:	c3                   	ret    

c010096c <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c010096c:	55                   	push   %ebp
c010096d:	89 e5                	mov    %esp,%ebp
c010096f:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c0100972:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100979:	00 
c010097a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100981:	00 
c0100982:	c7 04 24 20 10 11 c0 	movl   $0xc0111020,(%esp)
c0100989:	e8 d9 27 00 00       	call   c0103167 <memset>
	memset(vref, 0, SCR_SIZE);
c010098e:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100995:	00 
c0100996:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010099d:	00 
c010099e:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009a5:	e8 bd 27 00 00       	call   c0103167 <memset>
}
c01009aa:	c9                   	leave  
c01009ab:	c3                   	ret    

c01009ac <prepare_buffer>:

void prepare_buffer(void) {
c01009ac:	55                   	push   %ebp
c01009ad:	89 e5                	mov    %esp,%ebp
c01009af:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c01009b2:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009b9:	00 
c01009ba:	c7 44 24 04 20 10 11 	movl   $0xc0111020,0x4(%esp)
c01009c1:	c0 
c01009c2:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009c9:	e8 7c 27 00 00       	call   c010314a <memcpy>
#endif
	vmem = vbuf;
c01009ce:	c7 05 04 60 10 c0 20 	movl   $0xc0111020,0xc0106004
c01009d5:	10 11 c0 
	memset(vmem, 0, SCR_SIZE);
c01009d8:	a1 04 60 10 c0       	mov    0xc0106004,%eax
c01009dd:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009e4:	00 
c01009e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01009ec:	00 
c01009ed:	89 04 24             	mov    %eax,(%esp)
c01009f0:	e8 72 27 00 00       	call   c0103167 <memset>
}
c01009f5:	c9                   	leave  
c01009f6:	c3                   	ret    

c01009f7 <display_buffer>:

void display_buffer(void) {
c01009f7:	55                   	push   %ebp
c01009f8:	89 e5                	mov    %esp,%ebp
c01009fa:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c01009fd:	c7 45 f8 20 10 11 c0 	movl   $0xc0111020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c0100a04:	c7 45 f4 20 0a 12 c0 	movl   $0xc0120a20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c0100a0b:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c0100a12:	c7 05 04 60 10 c0 00 	movl   $0xa0000,0xc0106004
c0100a19:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a1c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100a23:	eb 4c                	jmp    c0100a71 <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c0100a25:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a28:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a32:	01 d0                	add    %edx,%eax
c0100a34:	8b 10                	mov    (%eax),%edx
c0100a36:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a39:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a43:	01 c8                	add    %ecx,%eax
c0100a45:	8b 00                	mov    (%eax),%eax
c0100a47:	39 c2                	cmp    %eax,%edx
c0100a49:	74 22                	je     c0100a6d <display_buffer+0x76>
			mem[i] = buf[i];
c0100a4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a4e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100a58:	01 c2                	add    %eax,%edx
c0100a5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a5d:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a64:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a67:	01 c8                	add    %ecx,%eax
c0100a69:	8b 00                	mov    (%eax),%eax
c0100a6b:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a6d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100a71:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c0100a78:	7e ab                	jle    c0100a25 <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c0100a7a:	c9                   	leave  
c0100a7b:	c3                   	ret    

c0100a7c <sys_pr>:

void sys_pr(void *src)
{
c0100a7c:	55                   	push   %ebp
c0100a7d:	89 e5                	mov    %esp,%ebp
c0100a7f:	57                   	push   %edi
c0100a80:	56                   	push   %esi
c0100a81:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c0100a82:	8b 1d 04 60 10 c0    	mov    0xc0106004,%ebx
c0100a88:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c0100a8d:	8b 55 08             	mov    0x8(%ebp),%edx
c0100a90:	89 c1                	mov    %eax,%ecx
c0100a92:	89 d6                	mov    %edx,%esi
c0100a94:	89 df                	mov    %ebx,%edi
c0100a96:	fc                   	cld    
c0100a97:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c0100a99:	5b                   	pop    %ebx
c0100a9a:	5e                   	pop    %esi
c0100a9b:	5f                   	pop    %edi
c0100a9c:	5d                   	pop    %ebp
c0100a9d:	c3                   	ret    

c0100a9e <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c0100a9e:	55                   	push   %ebp
c0100a9f:	89 e5                	mov    %esp,%ebp
c0100aa1:	83 ec 40             	sub    $0x40,%esp
c0100aa4:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c0100aab:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c0100aaf:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100ab3:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100ab6:	ee                   	out    %al,(%dx)
c0100ab7:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c0100abe:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c0100ac2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100ac6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ac9:	ee                   	out    %al,(%dx)
c0100aca:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c0100ad1:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0100ad5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100ad9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100adc:	ee                   	out    %al,(%dx)
c0100add:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c0100ae4:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c0100ae8:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100aec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100aef:	ee                   	out    %al,(%dx)
c0100af0:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c0100af7:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100afb:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100aff:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100b02:	ee                   	out    %al,(%dx)
c0100b03:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100b0a:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100b0e:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100b12:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100b15:	ee                   	out    %al,(%dx)
c0100b16:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100b1d:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100b21:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100b25:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100b28:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100b29:	c9                   	leave  
c0100b2a:	c3                   	ret    

c0100b2b <serial_idle>:

static inline int serial_idle(void) {
c0100b2b:	55                   	push   %ebp
c0100b2c:	89 e5                	mov    %esp,%ebp
c0100b2e:	83 ec 10             	sub    $0x10,%esp
c0100b31:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100b38:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100b3b:	89 c2                	mov    %eax,%edx
c0100b3d:	ec                   	in     (%dx),%al
c0100b3e:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100b41:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100b45:	0f b6 c0             	movzbl %al,%eax
c0100b48:	83 e0 20             	and    $0x20,%eax
c0100b4b:	85 c0                	test   %eax,%eax
c0100b4d:	0f 95 c0             	setne  %al
c0100b50:	0f b6 c0             	movzbl %al,%eax
}
c0100b53:	c9                   	leave  
c0100b54:	c3                   	ret    

c0100b55 <serial_printc>:

void serial_printc(int ch) {
c0100b55:	55                   	push   %ebp
c0100b56:	89 e5                	mov    %esp,%ebp
c0100b58:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100b5b:	90                   	nop
c0100b5c:	e8 ca ff ff ff       	call   c0100b2b <serial_idle>
c0100b61:	85 c0                	test   %eax,%eax
c0100b63:	74 f7                	je     c0100b5c <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b68:	0f b6 c0             	movzbl %al,%eax
c0100b6b:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100b72:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100b75:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100b79:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100b7c:	ee                   	out    %al,(%dx)
}
c0100b7d:	c9                   	leave  
c0100b7e:	c3                   	ret    

c0100b7f <putchar>:

void putchar(int ch){
c0100b7f:	55                   	push   %ebp
c0100b80:	89 e5                	mov    %esp,%ebp
c0100b82:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100b85:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b88:	89 04 24             	mov    %eax,(%esp)
c0100b8b:	e8 c5 ff ff ff       	call   c0100b55 <serial_printc>
c0100b90:	c9                   	leave  
c0100b91:	c3                   	ret    

c0100b92 <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100b92:	55                   	push   %ebp
c0100b93:	89 e5                	mov    %esp,%ebp
c0100b95:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100b98:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100b9f:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100ba6:	7e 24                	jle    c0100bcc <init_timer+0x3a>
c0100ba8:	c7 44 24 0c 39 40 10 	movl   $0xc0104039,0xc(%esp)
c0100baf:	c0 
c0100bb0:	c7 44 24 08 49 40 10 	movl   $0xc0104049,0x8(%esp)
c0100bb7:	c0 
c0100bb8:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100bbf:	00 
c0100bc0:	c7 04 24 5e 40 10 c0 	movl   $0xc010405e,(%esp)
c0100bc7:	e8 e6 1f 00 00       	call   c0102bb2 <_panic>
c0100bcc:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100bd3:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100bd7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100bdb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bde:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100be2:	99                   	cltd   
c0100be3:	c1 ea 18             	shr    $0x18,%edx
c0100be6:	01 d0                	add    %edx,%eax
c0100be8:	0f b6 c0             	movzbl %al,%eax
c0100beb:	29 d0                	sub    %edx,%eax
c0100bed:	0f b6 c0             	movzbl %al,%eax
c0100bf0:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100bf7:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100bfa:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100bfe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100c01:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c05:	99                   	cltd   
c0100c06:	c1 ea 18             	shr    $0x18,%edx
c0100c09:	01 d0                	add    %edx,%eax
c0100c0b:	c1 f8 08             	sar    $0x8,%eax
c0100c0e:	0f b6 c0             	movzbl %al,%eax
c0100c11:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100c18:	88 45 df             	mov    %al,-0x21(%ebp)
c0100c1b:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100c1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100c22:	ee                   	out    %al,(%dx)
}
c0100c23:	c9                   	leave  
c0100c24:	c3                   	ret    

c0100c25 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0100c25:	55                   	push   %ebp
c0100c26:	89 e5                	mov    %esp,%ebp
c0100c28:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0100c2b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0100c2f:	75 24                	jne    c0100c55 <list_add+0x30>
c0100c31:	c7 44 24 0c 74 40 10 	movl   $0xc0104074,0xc(%esp)
c0100c38:	c0 
c0100c39:	c7 44 24 08 81 40 10 	movl   $0xc0104081,0x8(%esp)
c0100c40:	c0 
c0100c41:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0100c48:	00 
c0100c49:	c7 04 24 96 40 10 c0 	movl   $0xc0104096,(%esp)
c0100c50:	e8 5d 1f 00 00       	call   c0102bb2 <_panic>
	data->prev = prev;
c0100c55:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c58:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c5b:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0100c5d:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c60:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c63:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0100c66:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c6a:	74 09                	je     c0100c75 <list_add+0x50>
c0100c6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c6f:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c72:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0100c75:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100c79:	74 08                	je     c0100c83 <list_add+0x5e>
c0100c7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c7e:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c81:	89 10                	mov    %edx,(%eax)
}
c0100c83:	c9                   	leave  
c0100c84:	c3                   	ret    

c0100c85 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0100c85:	55                   	push   %ebp
c0100c86:	89 e5                	mov    %esp,%ebp
c0100c88:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100c8b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c8f:	75 24                	jne    c0100cb5 <list_add_before+0x30>
c0100c91:	c7 44 24 0c ac 40 10 	movl   $0xc01040ac,0xc(%esp)
c0100c98:	c0 
c0100c99:	c7 44 24 08 81 40 10 	movl   $0xc0104081,0x8(%esp)
c0100ca0:	c0 
c0100ca1:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0100ca8:	00 
c0100ca9:	c7 04 24 96 40 10 c0 	movl   $0xc0104096,(%esp)
c0100cb0:	e8 fd 1e 00 00       	call   c0102bb2 <_panic>
	list_add(one->prev, one, data);
c0100cb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cb8:	8b 00                	mov    (%eax),%eax
c0100cba:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100cbd:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100cc1:	8b 55 08             	mov    0x8(%ebp),%edx
c0100cc4:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100cc8:	89 04 24             	mov    %eax,(%esp)
c0100ccb:	e8 55 ff ff ff       	call   c0100c25 <list_add>
}
c0100cd0:	c9                   	leave  
c0100cd1:	c3                   	ret    

c0100cd2 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0100cd2:	55                   	push   %ebp
c0100cd3:	89 e5                	mov    %esp,%ebp
c0100cd5:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0100cd8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100cdc:	75 24                	jne    c0100d02 <list_del+0x30>
c0100cde:	c7 44 24 0c 74 40 10 	movl   $0xc0104074,0xc(%esp)
c0100ce5:	c0 
c0100ce6:	c7 44 24 08 81 40 10 	movl   $0xc0104081,0x8(%esp)
c0100ced:	c0 
c0100cee:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0100cf5:	00 
c0100cf6:	c7 04 24 96 40 10 c0 	movl   $0xc0104096,(%esp)
c0100cfd:	e8 b0 1e 00 00       	call   c0102bb2 <_panic>
	list *prev = data->prev;
c0100d02:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d05:	8b 00                	mov    (%eax),%eax
c0100d07:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0100d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d0d:	8b 40 04             	mov    0x4(%eax),%eax
c0100d10:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0100d13:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100d17:	74 09                	je     c0100d22 <list_del+0x50>
c0100d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100d1f:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0100d22:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100d26:	74 08                	je     c0100d30 <list_del+0x5e>
c0100d28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100d2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100d2e:	89 10                	mov    %edx,(%eax)
}
c0100d30:	c9                   	leave  
c0100d31:	c3                   	ret    

c0100d32 <list_init>:

static inline void
list_init(list *one) {
c0100d32:	55                   	push   %ebp
c0100d33:	89 e5                	mov    %esp,%ebp
c0100d35:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100d38:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100d3c:	75 24                	jne    c0100d62 <list_init+0x30>
c0100d3e:	c7 44 24 0c ac 40 10 	movl   $0xc01040ac,0xc(%esp)
c0100d45:	c0 
c0100d46:	c7 44 24 08 81 40 10 	movl   $0xc0104081,0x8(%esp)
c0100d4d:	c0 
c0100d4e:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0100d55:	00 
c0100d56:	c7 04 24 96 40 10 c0 	movl   $0xc0104096,(%esp)
c0100d5d:	e8 50 1e 00 00       	call   c0102bb2 <_panic>
	one->prev = one->next = one;
c0100d62:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d65:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d68:	89 50 04             	mov    %edx,0x4(%eax)
c0100d6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d6e:	8b 50 04             	mov    0x4(%eax),%edx
c0100d71:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d74:	89 10                	mov    %edx,(%eax)
}
c0100d76:	c9                   	leave  
c0100d77:	c3                   	ret    

c0100d78 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100d78:	55                   	push   %ebp
c0100d79:	89 e5                	mov    %esp,%ebp
c0100d7b:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100d7e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d81:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100d86:	77 21                	ja     c0100da9 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100d88:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d8b:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100d8f:	c7 44 24 08 b8 40 10 	movl   $0xc01040b8,0x8(%esp)
c0100d96:	c0 
c0100d97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d9a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100da1:	89 04 24             	mov    %eax,(%esp)
c0100da4:	e8 09 1e 00 00       	call   c0102bb2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100da9:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dac:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100db1:	c9                   	leave  
c0100db2:	c3                   	ret    

c0100db3 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100db3:	55                   	push   %ebp
c0100db4:	89 e5                	mov    %esp,%ebp
c0100db6:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100db9:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dbc:	c1 e8 0c             	shr    $0xc,%eax
c0100dbf:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100dc4:	76 21                	jbe    c0100de7 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100dc6:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dc9:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100dcd:	c7 44 24 08 dc 40 10 	movl   $0xc01040dc,0x8(%esp)
c0100dd4:	c0 
c0100dd5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100dd8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ddc:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ddf:	89 04 24             	mov    %eax,(%esp)
c0100de2:	e8 cb 1d 00 00       	call   c0102bb2 <_panic>
	return (void *)(pa + KERNBASE);
c0100de7:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dea:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100def:	c9                   	leave  
c0100df0:	c3                   	ret    

c0100df1 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100df1:	55                   	push   %ebp
c0100df2:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100df4:	8b 55 08             	mov    0x8(%ebp),%edx
c0100df7:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0100dfc:	29 c2                	sub    %eax,%edx
c0100dfe:	89 d0                	mov    %edx,%eax
c0100e00:	c1 f8 03             	sar    $0x3,%eax
c0100e03:	c1 e0 0c             	shl    $0xc,%eax
}
c0100e06:	5d                   	pop    %ebp
c0100e07:	c3                   	ret    

c0100e08 <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100e08:	55                   	push   %ebp
c0100e09:	89 e5                	mov    %esp,%ebp
c0100e0b:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100e0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e11:	89 04 24             	mov    %eax,(%esp)
c0100e14:	e8 d8 ff ff ff       	call   c0100df1 <page2pa>
c0100e19:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100e1d:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100e24:	00 
c0100e25:	c7 04 24 ff 40 10 c0 	movl   $0xc01040ff,(%esp)
c0100e2c:	e8 82 ff ff ff       	call   c0100db3 <_kaddr>
}
c0100e31:	c9                   	leave  
c0100e32:	c3                   	ret    

c0100e33 <pcb_init>:
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];


void pcb_init()
{
c0100e33:	55                   	push   %ebp
c0100e34:	89 e5                	mov    %esp,%ebp
c0100e36:	83 ec 28             	sub    $0x28,%esp
	/*int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}*/
	list_init(&ready);
c0100e39:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100e40:	e8 ed fe ff ff       	call   c0100d32 <list_init>
	list_init(&block);
c0100e45:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0100e4c:	e8 e1 fe ff ff       	call   c0100d32 <list_init>
	list_init(&free);
c0100e51:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e58:	e8 d5 fe ff ff       	call   c0100d32 <list_init>
	now=&ready;
c0100e5d:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0100e64:	4f 16 c0 
	pcbnow=&init;
c0100e67:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100e6e:	3f 16 c0 
	init.pgdir=kern_pgdir;
c0100e71:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100e76:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100e7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e82:	eb 48                	jmp    c0100ecc <pcb_init+0x99>
		list_add_before(&free,&pcb[i].plist);
c0100e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e87:	c1 e0 0c             	shl    $0xc,%eax
c0100e8a:	05 40 57 16 c0       	add    $0xc0165740,%eax
c0100e8f:	83 c0 08             	add    $0x8,%eax
c0100e92:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100e96:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e9d:	e8 e3 fd ff ff       	call   c0100c85 <list_add_before>
		pcb[i].pid=i+1;
c0100ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ea5:	83 c0 01             	add    $0x1,%eax
c0100ea8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100eab:	c1 e2 0c             	shl    $0xc,%edx
c0100eae:	81 c2 50 57 16 c0    	add    $0xc0165750,%edx
c0100eb4:	89 02                	mov    %eax,(%edx)
		pcb[i].ppid=0;
c0100eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eb9:	c1 e0 0c             	shl    $0xc,%eax
c0100ebc:	05 50 57 16 c0       	add    $0xc0165750,%eax
c0100ec1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&free);
	now=&ready;
	pcbnow=&init;
	init.pgdir=kern_pgdir;
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100ec8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ecc:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0100ed0:	7e b2                	jle    c0100e84 <pcb_init+0x51>
		list_add_before(&free,&pcb[i].plist);
		pcb[i].pid=i+1;
		pcb[i].ppid=0;
	}
			
}
c0100ed2:	c9                   	leave  
c0100ed3:	c3                   	ret    

c0100ed4 <pcb_alloc>:

static uint32_t cntpid=0;
PCB* pcb_alloc()
{
c0100ed4:	55                   	push   %ebp
c0100ed5:	89 e5                	mov    %esp,%ebp
c0100ed7:	83 ec 38             	sub    $0x38,%esp
	list *lnext=&free;
c0100eda:	c7 45 f4 08 4f 16 c0 	movl   $0xc0164f08,-0xc(%ebp)
	list *freenext;
	if(lnext->next==lnext)
c0100ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ee4:	8b 40 04             	mov    0x4(%eax),%eax
c0100ee7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100eea:	75 11                	jne    c0100efd <pcb_alloc+0x29>
	{
		freenext=NULL;
c0100eec:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		return NULL;
c0100ef3:	b8 00 00 00 00       	mov    $0x0,%eax
c0100ef8:	e9 0f 01 00 00       	jmp    c010100c <pcb_alloc+0x138>
	}
	else
	{
		freenext=lnext->next;
c0100efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f00:	8b 40 04             	mov    0x4(%eax),%eax
c0100f03:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	PCB* p=list_entry(freenext,PCB,plist);
c0100f06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f09:	83 e8 08             	sub    $0x8,%eax
c0100f0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100f0f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100f16:	e8 05 10 00 00       	call   c0101f20 <page_alloc>
c0100f1b:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (pp == NULL) return NULL;
c0100f1e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0100f22:	75 0a                	jne    c0100f2e <pcb_alloc+0x5a>
c0100f24:	b8 00 00 00 00       	mov    $0x0,%eax
c0100f29:	e9 de 00 00 00       	jmp    c010100c <pcb_alloc+0x138>
	p->pgdir = page2kva(pp);
c0100f2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f31:	89 04 24             	mov    %eax,(%esp)
c0100f34:	e8 cf fe ff ff       	call   c0100e08 <page2kva>
c0100f39:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f3c:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100f3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f42:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100f46:	8d 50 01             	lea    0x1(%eax),%edx
c0100f49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f4c:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100f50:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f53:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100f5a:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100f5f:	8d 50 01             	lea    0x1(%eax),%edx
c0100f62:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100f68:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f6b:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100f6e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f71:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100f78:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f7b:	83 c0 08             	add    $0x8,%eax
c0100f7e:	89 04 24             	mov    %eax,(%esp)
c0100f81:	e8 4c fd ff ff       	call   c0100cd2 <list_del>
	list_add_before(&ready,&p->plist);
c0100f86:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f89:	83 c0 08             	add    $0x8,%eax
c0100f8c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100f90:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100f97:	e8 e9 fc ff ff       	call   c0100c85 <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100f9c:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100fa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fa5:	8b 40 04             	mov    0x4(%eax),%eax
c0100fa8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100faf:	00 
c0100fb0:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100fb4:	89 04 24             	mov    %eax,(%esp)
c0100fb7:	e8 8e 21 00 00       	call   c010314a <memcpy>
	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	
c0100fbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fbf:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100fc4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100fc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fca:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100fd1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fd4:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100fdb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fde:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100fe4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fe7:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100fed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ff0:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0100ff7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ffa:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c0101001:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101004:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101007:	89 10                	mov    %edx,(%eax)
	return p;
c0101009:	8b 45 ec             	mov    -0x14(%ebp),%eax

}
c010100c:	c9                   	leave  
c010100d:	c3                   	ret    

c010100e <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c010100e:	55                   	push   %ebp
c010100f:	89 e5                	mov    %esp,%ebp
c0101011:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0101014:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101017:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010101a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010101d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101022:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0101025:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c010102c:	8b 45 10             	mov    0x10(%ebp),%eax
c010102f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101032:	01 c2                	add    %eax,%edx
c0101034:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101037:	01 d0                	add    %edx,%eax
c0101039:	83 e8 01             	sub    $0x1,%eax
c010103c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010103f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101042:	ba 00 00 00 00       	mov    $0x0,%edx
c0101047:	f7 75 e8             	divl   -0x18(%ebp)
c010104a:	89 d0                	mov    %edx,%eax
c010104c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010104f:	29 c2                	sub    %eax,%edx
c0101051:	89 d0                	mov    %edx,%eax
c0101053:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c0101056:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101059:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010105c:	eb 61                	jmp    c01010bf <mm_malloc+0xb1>
		p = page_alloc(0);
c010105e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101065:	e8 b6 0e 00 00       	call   c0101f20 <page_alloc>
c010106a:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c010106d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0101071:	75 24                	jne    c0101097 <mm_malloc+0x89>
c0101073:	c7 44 24 0c 15 41 10 	movl   $0xc0104115,0xc(%esp)
c010107a:	c0 
c010107b:	c7 44 24 08 81 40 10 	movl   $0xc0104081,0x8(%esp)
c0101082:	c0 
c0101083:	c7 44 24 04 56 00 00 	movl   $0x56,0x4(%esp)
c010108a:	00 
c010108b:	c7 04 24 1f 41 10 c0 	movl   $0xc010411f,(%esp)
c0101092:	e8 1b 1b 00 00       	call   c0102bb2 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0101097:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010109a:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c01010a1:	00 
c01010a2:	89 44 24 08          	mov    %eax,0x8(%esp)
c01010a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01010a9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01010b0:	89 04 24             	mov    %eax,(%esp)
c01010b3:	e8 05 14 00 00       	call   c01024bd <page_insert>
{
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c01010b8:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01010bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010c2:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01010c5:	72 97                	jb     c010105e <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c01010c7:	c9                   	leave  
c01010c8:	c3                   	ret    

c01010c9 <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c01010c9:	55                   	push   %ebp
c01010ca:	89 e5                	mov    %esp,%ebp
c01010cc:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c01010cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010d2:	8b 55 08             	mov    0x8(%ebp),%edx
c01010d5:	01 d0                	add    %edx,%eax
c01010d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c01010da:	8b 45 10             	mov    0x10(%ebp),%eax
c01010dd:	c1 e8 09             	shr    $0x9,%eax
c01010e0:	83 c0 01             	add    $0x1,%eax
c01010e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c01010e6:	eb 6e                	jmp    c0101156 <readseg+0x8d>
		readsect(disks, sect);
c01010e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010eb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010ef:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c01010f6:	e8 65 00 00 00       	call   c0101160 <readsect>
		uint32_t rem = offset & 0x1ff;
c01010fb:	8b 45 10             	mov    0x10(%ebp),%eax
c01010fe:	25 ff 01 00 00       	and    $0x1ff,%eax
c0101103:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c0101106:	b8 00 02 00 00       	mov    $0x200,%eax
c010110b:	2b 45 ec             	sub    -0x14(%ebp),%eax
c010110e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101111:	8b 45 08             	mov    0x8(%ebp),%eax
c0101114:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101117:	29 c2                	sub    %eax,%edx
c0101119:	89 d0                	mov    %edx,%eax
c010111b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010111e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101121:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101124:	39 d0                	cmp    %edx,%eax
c0101126:	76 02                	jbe    c010112a <readseg+0x61>
c0101128:	89 d0                	mov    %edx,%eax
c010112a:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c010112d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101130:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c0101136:	8b 45 08             	mov    0x8(%ebp),%eax
c0101139:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010113c:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101140:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101144:	89 04 24             	mov    %eax,(%esp)
c0101147:	e8 fe 1f 00 00       	call   c010314a <memcpy>
		va += size;
c010114c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010114f:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c0101152:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c0101156:	8b 45 08             	mov    0x8(%ebp),%eax
c0101159:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010115c:	72 8a                	jb     c01010e8 <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c010115e:	c9                   	leave  
c010115f:	c3                   	ret    

c0101160 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c0101160:	55                   	push   %ebp
c0101161:	89 e5                	mov    %esp,%ebp
c0101163:	57                   	push   %edi
c0101164:	53                   	push   %ebx
c0101165:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0101168:	90                   	nop
c0101169:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101170:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101173:	89 c2                	mov    %eax,%edx
c0101175:	ec                   	in     (%dx),%al
c0101176:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c0101179:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c010117d:	0f b6 c0             	movzbl %al,%eax
c0101180:	25 c0 00 00 00       	and    $0xc0,%eax
c0101185:	83 f8 40             	cmp    $0x40,%eax
c0101188:	75 df                	jne    c0101169 <readsect+0x9>
c010118a:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c0101191:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0101195:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0101199:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010119c:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c010119d:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011a0:	0f b6 c0             	movzbl %al,%eax
c01011a3:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c01011aa:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01011ad:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01011b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01011b4:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c01011b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011b8:	c1 e8 08             	shr    $0x8,%eax
c01011bb:	0f b6 c0             	movzbl %al,%eax
c01011be:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c01011c5:	88 45 db             	mov    %al,-0x25(%ebp)
c01011c8:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01011cc:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011cf:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c01011d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011d3:	c1 e8 10             	shr    $0x10,%eax
c01011d6:	0f b6 c0             	movzbl %al,%eax
c01011d9:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c01011e0:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01011e3:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01011e7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01011ea:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c01011eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011ee:	c1 e8 18             	shr    $0x18,%eax
c01011f1:	83 c8 e0             	or     $0xffffffe0,%eax
c01011f4:	0f b6 c0             	movzbl %al,%eax
c01011f7:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c01011fe:	88 45 cb             	mov    %al,-0x35(%ebp)
c0101201:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0101205:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0101208:	ee                   	out    %al,(%dx)
c0101209:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101210:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c0101214:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101218:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c010121b:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010121c:	90                   	nop
c010121d:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101224:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0101227:	89 c2                	mov    %eax,%edx
c0101229:	ec                   	in     (%dx),%al
c010122a:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c010122d:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0101231:	0f b6 c0             	movzbl %al,%eax
c0101234:	25 c0 00 00 00       	and    $0xc0,%eax
c0101239:	83 f8 40             	cmp    $0x40,%eax
c010123c:	75 df                	jne    c010121d <readsect+0xbd>
c010123e:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c0101245:	8b 45 08             	mov    0x8(%ebp),%eax
c0101248:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010124b:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c0101252:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0101255:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0101258:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010125b:	89 cb                	mov    %ecx,%ebx
c010125d:	89 df                	mov    %ebx,%edi
c010125f:	89 c1                	mov    %eax,%ecx
c0101261:	fc                   	cld    
c0101262:	f2 6d                	repnz insl (%dx),%es:(%edi)
c0101264:	89 c8                	mov    %ecx,%eax
c0101266:	89 fb                	mov    %edi,%ebx
c0101268:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c010126b:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c010126e:	83 c4 50             	add    $0x50,%esp
c0101271:	5b                   	pop    %ebx
c0101272:	5f                   	pop    %edi
c0101273:	5d                   	pop    %ebp
c0101274:	c3                   	ret    

c0101275 <pcb_new>:

void pcb_new()
{
c0101275:	55                   	push   %ebp
c0101276:	89 e5                	mov    %esp,%ebp
c0101278:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c010127b:	e8 54 fc ff ff       	call   c0100ed4 <pcb_alloc>
c0101280:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c0101283:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101287:	75 05                	jne    c010128e <pcb_new+0x19>
c0101289:	e9 8b 01 00 00       	jmp    c0101419 <pcb_new+0x1a4>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c010128e:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c0101295:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101298:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c010129f:	00 
c01012a0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01012a7:	00 
c01012a8:	89 04 24             	mov    %eax,(%esp)
c01012ab:	e8 19 fe ff ff       	call   c01010c9 <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c01012b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012b3:	8b 00                	mov    (%eax),%eax
c01012b5:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c01012ba:	74 24                	je     c01012e0 <pcb_new+0x6b>
c01012bc:	c7 44 24 0c 32 41 10 	movl   $0xc0104132,0xc(%esp)
c01012c3:	c0 
c01012c4:	c7 44 24 08 81 40 10 	movl   $0xc0104081,0x8(%esp)
c01012cb:	c0 
c01012cc:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
c01012d3:	00 
c01012d4:	c7 04 24 1f 41 10 c0 	movl   $0xc010411f,(%esp)
c01012db:	e8 d2 18 00 00       	call   c0102bb2 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c01012e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012e3:	8b 50 1c             	mov    0x1c(%eax),%edx
c01012e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012e9:	01 d0                	add    %edx,%eax
c01012eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c01012ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012f1:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01012f5:	0f b7 c0             	movzwl %ax,%eax
c01012f8:	c1 e0 05             	shl    $0x5,%eax
c01012fb:	89 c2                	mov    %eax,%edx
c01012fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101300:	01 d0                	add    %edx,%eax
c0101302:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c0101305:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101308:	8b 40 04             	mov    0x4(%eax),%eax
c010130b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010130f:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c0101316:	00 
c0101317:	c7 04 24 1f 41 10 c0 	movl   $0xc010411f,(%esp)
c010131e:	e8 55 fa ff ff       	call   c0100d78 <_paddr>
c0101323:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0101326:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101329:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) 
c010132c:	e9 8a 00 00 00       	jmp    c01013bb <pcb_new+0x146>
	{
		if (ph -> p_type != ELF_PROG_LOAD) 
c0101331:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101334:	8b 00                	mov    (%eax),%eax
c0101336:	83 f8 01             	cmp    $0x1,%eax
c0101339:	74 02                	je     c010133d <pcb_new+0xc8>
			continue;
c010133b:	eb 7a                	jmp    c01013b7 <pcb_new+0x142>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c010133d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101340:	8b 48 14             	mov    0x14(%eax),%ecx
c0101343:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101346:	8b 50 08             	mov    0x8(%eax),%edx
c0101349:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010134c:	8b 40 04             	mov    0x4(%eax),%eax
c010134f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0101353:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101357:	89 04 24             	mov    %eax,(%esp)
c010135a:	e8 af fc ff ff       	call   c010100e <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c010135f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101362:	8b 40 04             	mov    0x4(%eax),%eax
c0101365:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c010136b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010136e:	8b 50 10             	mov    0x10(%eax),%edx
c0101371:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101374:	8b 40 08             	mov    0x8(%eax),%eax
c0101377:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010137b:	89 54 24 04          	mov    %edx,0x4(%esp)
c010137f:	89 04 24             	mov    %eax,(%esp)
c0101382:	e8 42 fd ff ff       	call   c01010c9 <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c0101387:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010138a:	8b 50 14             	mov    0x14(%eax),%edx
c010138d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101390:	8b 40 10             	mov    0x10(%eax),%eax
c0101393:	29 c2                	sub    %eax,%edx
c0101395:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101398:	8b 48 08             	mov    0x8(%eax),%ecx
c010139b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010139e:	8b 40 10             	mov    0x10(%eax),%eax
c01013a1:	01 c8                	add    %ecx,%eax
c01013a3:	89 54 24 08          	mov    %edx,0x8(%esp)
c01013a7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01013ae:	00 
c01013af:	89 04 24             	mov    %eax,(%esp)
c01013b2:	e8 b0 1d 00 00       	call   c0103167 <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) 
c01013b7:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01013bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013be:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01013c1:	0f 82 6a ff ff ff    	jb     c0101331 <pcb_new+0xbc>
			continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf->e_entry;
c01013c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013ca:	8b 00                	mov    (%eax),%eax
c01013cc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01013cf:	8b 52 18             	mov    0x18(%edx),%edx
c01013d2:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP-USTACKSIZE, USTACKSIZE);
c01013d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013d8:	8b 40 04             	mov    0x4(%eax),%eax
c01013db:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c01013e2:	00 
c01013e3:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c01013ea:	be 
c01013eb:	89 04 24             	mov    %eax,(%esp)
c01013ee:	e8 1b fc ff ff       	call   c010100e <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c01013f3:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01013f8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01013fc:	c7 44 24 04 8e 00 00 	movl   $0x8e,0x4(%esp)
c0101403:	00 
c0101404:	c7 04 24 1f 41 10 c0 	movl   $0xc010411f,(%esp)
c010140b:	e8 68 f9 ff ff       	call   c0100d78 <_paddr>
c0101410:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101413:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101416:	0f 22 d8             	mov    %eax,%cr3
}
c0101419:	c9                   	leave  
c010141a:	c3                   	ret    

c010141b <pcb_copy>:

void pcb_copy(PCB *fa,PCB *tb,int pan)
{
c010141b:	55                   	push   %ebp
c010141c:	89 e5                	mov    %esp,%ebp
c010141e:	53                   	push   %ebx
c010141f:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);//get the addr for the information of process
c0101422:	c7 45 f4 2c 00 00 00 	movl   $0x2c,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c0101429:	b8 00 10 00 00       	mov    $0x1000,%eax
c010142e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0101431:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c0101434:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101437:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c010143a:	8b 55 08             	mov    0x8(%ebp),%edx
c010143d:	01 d1                	add    %edx,%ecx
c010143f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c0101442:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101445:	01 da                	add    %ebx,%edx
c0101447:	89 44 24 08          	mov    %eax,0x8(%esp)
c010144b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010144f:	89 14 24             	mov    %edx,(%esp)
c0101452:	e8 f3 1c 00 00       	call   c010314a <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c0101457:	8b 45 08             	mov    0x8(%ebp),%eax
c010145a:	8b 00                	mov    (%eax),%eax
c010145c:	89 c2                	mov    %eax,%edx
c010145e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101461:	29 c2                	sub    %eax,%edx
c0101463:	89 d0                	mov    %edx,%eax
c0101465:	89 c2                	mov    %eax,%edx
c0101467:	8b 45 0c             	mov    0xc(%ebp),%eax
c010146a:	01 c2                	add    %eax,%edx
c010146c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010146f:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c0101471:	8b 45 08             	mov    0x8(%ebp),%eax
c0101474:	8b 50 18             	mov    0x18(%eax),%edx
c0101477:	8b 45 0c             	mov    0xc(%ebp),%eax
c010147a:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c010147d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101480:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101483:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101486:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c0101489:	8b 45 08             	mov    0x8(%ebp),%eax
c010148c:	8b 50 20             	mov    0x20(%eax),%edx
c010148f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101492:	89 50 20             	mov    %edx,0x20(%eax)
	if(pan==DEEP){
c0101495:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101499:	75 22                	jne    c01014bd <pcb_copy+0xa2>
		pg_copy(fa->pgdir,tb->pgdir,DEEP);
c010149b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010149e:	8b 50 04             	mov    0x4(%eax),%edx
c01014a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01014a4:	8b 40 04             	mov    0x4(%eax),%eax
c01014a7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01014ae:	00 
c01014af:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014b3:	89 04 24             	mov    %eax,(%esp)
c01014b6:	e8 f6 0b 00 00       	call   c01020b1 <pg_copy>
c01014bb:	eb 20                	jmp    c01014dd <pcb_copy+0xc2>
	}
	else{
		pg_copy(fa->pgdir,tb->pgdir,SHALLOW);
c01014bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014c0:	8b 50 04             	mov    0x4(%eax),%edx
c01014c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01014c6:	8b 40 04             	mov    0x4(%eax),%eax
c01014c9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01014d0:	00 
c01014d1:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014d5:	89 04 24             	mov    %eax,(%esp)
c01014d8:	e8 d4 0b 00 00       	call   c01020b1 <pg_copy>
	}
}
c01014dd:	83 c4 24             	add    $0x24,%esp
c01014e0:	5b                   	pop    %ebx
c01014e1:	5d                   	pop    %ebp
c01014e2:	c3                   	ret    

c01014e3 <pcb_remove>:

void pcb_remove(PCB *p)
{
c01014e3:	55                   	push   %ebp
c01014e4:	89 e5                	mov    %esp,%ebp
c01014e6:	83 ec 18             	sub    $0x18,%esp
	pg_remove(p->pgdir);
c01014e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01014ec:	8b 40 04             	mov    0x4(%eax),%eax
c01014ef:	89 04 24             	mov    %eax,(%esp)
c01014f2:	e8 13 0e 00 00       	call   c010230a <pg_remove>
}
c01014f7:	c9                   	leave  
c01014f8:	c3                   	ret    

c01014f9 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01014f9:	55                   	push   %ebp
c01014fa:	89 e5                	mov    %esp,%ebp
c01014fc:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01014ff:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101503:	75 24                	jne    c0101529 <list_add+0x30>
c0101505:	c7 44 24 0c 4c 41 10 	movl   $0xc010414c,0xc(%esp)
c010150c:	c0 
c010150d:	c7 44 24 08 59 41 10 	movl   $0xc0104159,0x8(%esp)
c0101514:	c0 
c0101515:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c010151c:	00 
c010151d:	c7 04 24 6e 41 10 c0 	movl   $0xc010416e,(%esp)
c0101524:	e8 89 16 00 00       	call   c0102bb2 <_panic>
	data->prev = prev;
c0101529:	8b 45 10             	mov    0x10(%ebp),%eax
c010152c:	8b 55 08             	mov    0x8(%ebp),%edx
c010152f:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101531:	8b 45 10             	mov    0x10(%ebp),%eax
c0101534:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101537:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010153a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010153e:	74 09                	je     c0101549 <list_add+0x50>
c0101540:	8b 45 08             	mov    0x8(%ebp),%eax
c0101543:	8b 55 10             	mov    0x10(%ebp),%edx
c0101546:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101549:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010154d:	74 08                	je     c0101557 <list_add+0x5e>
c010154f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101552:	8b 55 10             	mov    0x10(%ebp),%edx
c0101555:	89 10                	mov    %edx,(%eax)
}
c0101557:	c9                   	leave  
c0101558:	c3                   	ret    

c0101559 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101559:	55                   	push   %ebp
c010155a:	89 e5                	mov    %esp,%ebp
c010155c:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c010155f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101563:	75 24                	jne    c0101589 <list_add_before+0x30>
c0101565:	c7 44 24 0c 84 41 10 	movl   $0xc0104184,0xc(%esp)
c010156c:	c0 
c010156d:	c7 44 24 08 59 41 10 	movl   $0xc0104159,0x8(%esp)
c0101574:	c0 
c0101575:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c010157c:	00 
c010157d:	c7 04 24 6e 41 10 c0 	movl   $0xc010416e,(%esp)
c0101584:	e8 29 16 00 00       	call   c0102bb2 <_panic>
	list_add(one->prev, one, data);
c0101589:	8b 45 08             	mov    0x8(%ebp),%eax
c010158c:	8b 00                	mov    (%eax),%eax
c010158e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101591:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101595:	8b 55 08             	mov    0x8(%ebp),%edx
c0101598:	89 54 24 04          	mov    %edx,0x4(%esp)
c010159c:	89 04 24             	mov    %eax,(%esp)
c010159f:	e8 55 ff ff ff       	call   c01014f9 <list_add>
}
c01015a4:	c9                   	leave  
c01015a5:	c3                   	ret    

c01015a6 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c01015a6:	55                   	push   %ebp
c01015a7:	89 e5                	mov    %esp,%ebp
c01015a9:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c01015ac:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01015b0:	75 24                	jne    c01015d6 <list_del+0x30>
c01015b2:	c7 44 24 0c 4c 41 10 	movl   $0xc010414c,0xc(%esp)
c01015b9:	c0 
c01015ba:	c7 44 24 08 59 41 10 	movl   $0xc0104159,0x8(%esp)
c01015c1:	c0 
c01015c2:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c01015c9:	00 
c01015ca:	c7 04 24 6e 41 10 c0 	movl   $0xc010416e,(%esp)
c01015d1:	e8 dc 15 00 00       	call   c0102bb2 <_panic>
	list *prev = data->prev;
c01015d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01015d9:	8b 00                	mov    (%eax),%eax
c01015db:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01015de:	8b 45 08             	mov    0x8(%ebp),%eax
c01015e1:	8b 40 04             	mov    0x4(%eax),%eax
c01015e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01015e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01015eb:	74 09                	je     c01015f6 <list_del+0x50>
c01015ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01015f3:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01015f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01015fa:	74 08                	je     c0101604 <list_del+0x5e>
c01015fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101602:	89 10                	mov    %edx,(%eax)
}
c0101604:	c9                   	leave  
c0101605:	c3                   	ret    

c0101606 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101606:	55                   	push   %ebp
c0101607:	89 e5                	mov    %esp,%ebp
c0101609:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c010160c:	8b 45 10             	mov    0x10(%ebp),%eax
c010160f:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101614:	77 21                	ja     c0101637 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101616:	8b 45 10             	mov    0x10(%ebp),%eax
c0101619:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010161d:	c7 44 24 08 90 41 10 	movl   $0xc0104190,0x8(%esp)
c0101624:	c0 
c0101625:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101628:	89 44 24 04          	mov    %eax,0x4(%esp)
c010162c:	8b 45 08             	mov    0x8(%ebp),%eax
c010162f:	89 04 24             	mov    %eax,(%esp)
c0101632:	e8 7b 15 00 00       	call   c0102bb2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101637:	8b 45 10             	mov    0x10(%ebp),%eax
c010163a:	05 00 00 00 40       	add    $0x40000000,%eax
}
c010163f:	c9                   	leave  
c0101640:	c3                   	ret    

c0101641 <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_copy(PCB*,PCB*,int);
void sys_fork(){
c0101641:	55                   	push   %ebp
c0101642:	89 e5                	mov    %esp,%ebp
c0101644:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c0101647:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010164c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c010164f:	e8 80 f8 ff ff       	call   c0100ed4 <pcb_alloc>
c0101654:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_copy(fa,ch,DEEP);//written in pcb.c
c0101657:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010165e:	00 
c010165f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101662:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101666:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101669:	89 04 24             	mov    %eax,(%esp)
c010166c:	e8 aa fd ff ff       	call   c010141b <pcb_copy>
	ch->ppid=fa->pid;
c0101671:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101674:	8b 50 10             	mov    0x10(%eax),%edx
c0101677:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010167a:	89 50 14             	mov    %edx,0x14(%eax)
	(fa->tf)->eax=ch->pid;
c010167d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101680:	8b 00                	mov    (%eax),%eax
c0101682:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101685:	8b 52 10             	mov    0x10(%edx),%edx
c0101688:	89 50 1c             	mov    %edx,0x1c(%eax)
	(ch->tf)->eax=0;
c010168b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010168e:	8b 00                	mov    (%eax),%eax
c0101690:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c0101697:	c9                   	leave  
c0101698:	c3                   	ret    

c0101699 <sys_getpid>:

uint32_t sys_getpid(){
c0101699:	55                   	push   %ebp
c010169a:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c010169c:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016a1:	8b 40 10             	mov    0x10(%eax),%eax
}
c01016a4:	5d                   	pop    %ebp
c01016a5:	c3                   	ret    

c01016a6 <sys_exit>:

void sys_exit(){
c01016a6:	55                   	push   %ebp
c01016a7:	89 e5                	mov    %esp,%ebp
c01016a9:	83 ec 28             	sub    $0x28,%esp
	printk("teminate the thread %d successfully!\n",pcbnow->pid);
c01016ac:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016b1:	8b 40 10             	mov    0x10(%eax),%eax
c01016b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01016b8:	c7 04 24 b4 41 10 c0 	movl   $0xc01041b4,(%esp)
c01016bf:	e8 1d 16 00 00       	call   c0102ce1 <printk>
	list *lnext;
	list *t=&ready;
c01016c4:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01016cb:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016d0:	8b 40 04             	mov    0x4(%eax),%eax
c01016d3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01016d6:	75 22                	jne    c01016fa <sys_exit+0x54>
 	{
		if(t->next==now)
c01016d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016db:	8b 50 04             	mov    0x4(%eax),%edx
c01016de:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016e3:	39 c2                	cmp    %eax,%edx
c01016e5:	75 08                	jne    c01016ef <sys_exit+0x49>
			lnext=t;
c01016e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016ed:	eb 2f                	jmp    c010171e <sys_exit+0x78>
		else
			lnext=t->next;
c01016ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016f2:	8b 40 04             	mov    0x4(%eax),%eax
c01016f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016f8:	eb 24                	jmp    c010171e <sys_exit+0x78>
	}
	else
	{
		if(now->next==now)
c01016fa:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016ff:	8b 50 04             	mov    0x4(%eax),%edx
c0101702:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101707:	39 c2                	cmp    %eax,%edx
c0101709:	75 08                	jne    c0101713 <sys_exit+0x6d>
			lnext=t;
c010170b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010170e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101711:	eb 0b                	jmp    c010171e <sys_exit+0x78>
		else
			lnext=now->next;
c0101713:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101718:	8b 40 04             	mov    0x4(%eax),%eax
c010171b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c010171e:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101723:	89 04 24             	mov    %eax,(%esp)
c0101726:	e8 7b fe ff ff       	call   c01015a6 <list_del>
	list_add_before(&free,now);
c010172b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101730:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101734:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c010173b:	e8 19 fe ff ff       	call   c0101559 <list_add_before>
	lcr3(PADDR(kern_pgdir));
c0101740:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101745:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101749:	c7 44 24 04 2a 00 00 	movl   $0x2a,0x4(%esp)
c0101750:	00 
c0101751:	c7 04 24 da 41 10 c0 	movl   $0xc01041da,(%esp)
c0101758:	e8 a9 fe ff ff       	call   c0101606 <_paddr>
c010175d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101760:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101763:	0f 22 d8             	mov    %eax,%cr3
	pcb_remove(pcbnow);
c0101766:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010176b:	89 04 24             	mov    %eax,(%esp)
c010176e:	e8 70 fd ff ff       	call   c01014e3 <pcb_remove>
	now=lnext;
c0101773:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101776:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c010177b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101780:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c0101785:	75 0c                	jne    c0101793 <sys_exit+0xed>
		pcbnow=&init;
c0101787:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c010178e:	3f 16 c0 
c0101791:	eb 0d                	jmp    c01017a0 <sys_exit+0xfa>
	else
		pcbnow=list_entry(now,PCB,plist);
c0101793:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101798:	83 e8 08             	sub    $0x8,%eax
c010179b:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01017a0:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017a5:	05 f8 0f 00 00       	add    $0xff8,%eax
c01017aa:	89 04 24             	mov    %eax,(%esp)
c01017ad:	e8 ef 12 00 00       	call   c0102aa1 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01017b2:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017b7:	8b 40 04             	mov    0x4(%eax),%eax
c01017ba:	89 44 24 08          	mov    %eax,0x8(%esp)
c01017be:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
c01017c5:	00 
c01017c6:	c7 04 24 da 41 10 c0 	movl   $0xc01041da,(%esp)
c01017cd:	e8 34 fe ff ff       	call   c0101606 <_paddr>
c01017d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01017d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01017d8:	0f 22 d8             	mov    %eax,%cr3
}
c01017db:	c9                   	leave  
c01017dc:	c3                   	ret    

c01017dd <sys_sleep>:

void sys_sleep(int time){
c01017dd:	55                   	push   %ebp
c01017de:	89 e5                	mov    %esp,%ebp
c01017e0:	83 ec 28             	sub    $0x28,%esp
	list *lnext;
	list *t=&ready;
c01017e3:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01017ea:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017ef:	8b 40 04             	mov    0x4(%eax),%eax
c01017f2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01017f5:	75 22                	jne    c0101819 <sys_sleep+0x3c>
	{
		if(t->next==now)
c01017f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017fa:	8b 50 04             	mov    0x4(%eax),%edx
c01017fd:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101802:	39 c2                	cmp    %eax,%edx
c0101804:	75 08                	jne    c010180e <sys_sleep+0x31>
			lnext=t;
c0101806:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101809:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010180c:	eb 2f                	jmp    c010183d <sys_sleep+0x60>
		else
			lnext=t->next;
c010180e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101811:	8b 40 04             	mov    0x4(%eax),%eax
c0101814:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101817:	eb 24                	jmp    c010183d <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c0101819:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010181e:	8b 50 04             	mov    0x4(%eax),%edx
c0101821:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101826:	39 c2                	cmp    %eax,%edx
c0101828:	75 08                	jne    c0101832 <sys_sleep+0x55>
			lnext=t;
c010182a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010182d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101830:	eb 0b                	jmp    c010183d <sys_sleep+0x60>
		else
			lnext=now->next;
c0101832:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101837:	8b 40 04             	mov    0x4(%eax),%eax
c010183a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c010183d:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101842:	89 04 24             	mov    %eax,(%esp)
c0101845:	e8 5c fd ff ff       	call   c01015a6 <list_del>
	list_add_before(&block,now);
c010184a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010184f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101853:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c010185a:	e8 fa fc ff ff       	call   c0101559 <list_add_before>
	pcbnow->state=BLOCKED;
c010185f:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101864:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c010186b:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c0101871:	8b 45 08             	mov    0x8(%ebp),%eax
c0101874:	c1 e0 02             	shl    $0x2,%eax
c0101877:	89 c1                	mov    %eax,%ecx
c0101879:	c1 e1 04             	shl    $0x4,%ecx
c010187c:	29 c1                	sub    %eax,%ecx
c010187e:	89 c8                	mov    %ecx,%eax
c0101880:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=lnext;
c0101883:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101886:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c010188b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101890:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c0101895:	75 0c                	jne    c01018a3 <sys_sleep+0xc6>
		pcbnow=&init;
c0101897:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c010189e:	3f 16 c0 
c01018a1:	eb 0d                	jmp    c01018b0 <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c01018a3:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018a8:	83 e8 08             	sub    $0x8,%eax
c01018ab:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01018b0:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01018b5:	05 f8 0f 00 00       	add    $0xff8,%eax
c01018ba:	89 04 24             	mov    %eax,(%esp)
c01018bd:	e8 df 11 00 00       	call   c0102aa1 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01018c2:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01018c7:	8b 40 04             	mov    0x4(%eax),%eax
c01018ca:	89 44 24 08          	mov    %eax,0x8(%esp)
c01018ce:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c01018d5:	00 
c01018d6:	c7 04 24 da 41 10 c0 	movl   $0xc01041da,(%esp)
c01018dd:	e8 24 fd ff ff       	call   c0101606 <_paddr>
c01018e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01018e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01018e8:	0f 22 d8             	mov    %eax,%cr3
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
c01018eb:	c9                   	leave  
c01018ec:	c3                   	ret    

c01018ed <kthread>:

int kthread(void *addr)
{
c01018ed:	55                   	push   %ebp
c01018ee:	89 e5                	mov    %esp,%ebp
c01018f0:	83 ec 28             	sub    $0x28,%esp
	PCB *p=pcb_alloc();
c01018f3:	e8 dc f5 ff ff       	call   c0100ed4 <pcb_alloc>
c01018f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	pcb_copy(pcbnow,p,SHALLOW);
c01018fb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101900:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101907:	00 
c0101908:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010190b:	89 54 24 04          	mov    %edx,0x4(%esp)
c010190f:	89 04 24             	mov    %eax,(%esp)
c0101912:	e8 04 fb ff ff       	call   c010141b <pcb_copy>
	mm_malloc(p->pgdir,USTACKTOP-USTACKSIZE,USTACKSIZE);
c0101917:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010191a:	8b 40 04             	mov    0x4(%eax),%eax
c010191d:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101924:	00 
c0101925:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c010192c:	be 
c010192d:	89 04 24             	mov    %eax,(%esp)
c0101930:	e8 d9 f6 ff ff       	call   c010100e <mm_malloc>
	TrapFrame *tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);
c0101935:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101938:	05 ac 0f 00 00       	add    $0xfac,%eax
c010193d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	tf->eip=(uint32_t)addr;
c0101940:	8b 55 08             	mov    0x8(%ebp),%edx
c0101943:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101946:	89 50 38             	mov    %edx,0x38(%eax)
	tf->esp=USTACKTOP-12;
c0101949:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010194c:	c7 40 44 f4 df ff be 	movl   $0xbeffdff4,0x44(%eax)
	return 0;
c0101953:	b8 00 00 00 00       	mov    $0x0,%eax
c0101958:	c9                   	leave  
c0101959:	c3                   	ret    

c010195a <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c010195a:	55                   	push   %ebp
c010195b:	89 e5                	mov    %esp,%ebp
c010195d:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0101960:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101964:	75 24                	jne    c010198a <list_add+0x30>
c0101966:	c7 44 24 0c f3 41 10 	movl   $0xc01041f3,0xc(%esp)
c010196d:	c0 
c010196e:	c7 44 24 08 00 42 10 	movl   $0xc0104200,0x8(%esp)
c0101975:	c0 
c0101976:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c010197d:	00 
c010197e:	c7 04 24 15 42 10 c0 	movl   $0xc0104215,(%esp)
c0101985:	e8 28 12 00 00       	call   c0102bb2 <_panic>
	data->prev = prev;
c010198a:	8b 45 10             	mov    0x10(%ebp),%eax
c010198d:	8b 55 08             	mov    0x8(%ebp),%edx
c0101990:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101992:	8b 45 10             	mov    0x10(%ebp),%eax
c0101995:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101998:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010199b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010199f:	74 09                	je     c01019aa <list_add+0x50>
c01019a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01019a4:	8b 55 10             	mov    0x10(%ebp),%edx
c01019a7:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c01019aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01019ae:	74 08                	je     c01019b8 <list_add+0x5e>
c01019b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01019b3:	8b 55 10             	mov    0x10(%ebp),%edx
c01019b6:	89 10                	mov    %edx,(%eax)
}
c01019b8:	c9                   	leave  
c01019b9:	c3                   	ret    

c01019ba <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c01019ba:	55                   	push   %ebp
c01019bb:	89 e5                	mov    %esp,%ebp
c01019bd:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01019c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01019c4:	75 24                	jne    c01019ea <list_add_before+0x30>
c01019c6:	c7 44 24 0c 2b 42 10 	movl   $0xc010422b,0xc(%esp)
c01019cd:	c0 
c01019ce:	c7 44 24 08 00 42 10 	movl   $0xc0104200,0x8(%esp)
c01019d5:	c0 
c01019d6:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c01019dd:	00 
c01019de:	c7 04 24 15 42 10 c0 	movl   $0xc0104215,(%esp)
c01019e5:	e8 c8 11 00 00       	call   c0102bb2 <_panic>
	list_add(one->prev, one, data);
c01019ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01019ed:	8b 00                	mov    (%eax),%eax
c01019ef:	8b 55 0c             	mov    0xc(%ebp),%edx
c01019f2:	89 54 24 08          	mov    %edx,0x8(%esp)
c01019f6:	8b 55 08             	mov    0x8(%ebp),%edx
c01019f9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01019fd:	89 04 24             	mov    %eax,(%esp)
c0101a00:	e8 55 ff ff ff       	call   c010195a <list_add>
}
c0101a05:	c9                   	leave  
c0101a06:	c3                   	ret    

c0101a07 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0101a07:	55                   	push   %ebp
c0101a08:	89 e5                	mov    %esp,%ebp
c0101a0a:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0101a0d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a11:	75 24                	jne    c0101a37 <list_del+0x30>
c0101a13:	c7 44 24 0c f3 41 10 	movl   $0xc01041f3,0xc(%esp)
c0101a1a:	c0 
c0101a1b:	c7 44 24 08 00 42 10 	movl   $0xc0104200,0x8(%esp)
c0101a22:	c0 
c0101a23:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0101a2a:	00 
c0101a2b:	c7 04 24 15 42 10 c0 	movl   $0xc0104215,(%esp)
c0101a32:	e8 7b 11 00 00       	call   c0102bb2 <_panic>
	list *prev = data->prev;
c0101a37:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a3a:	8b 00                	mov    (%eax),%eax
c0101a3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0101a3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a42:	8b 40 04             	mov    0x4(%eax),%eax
c0101a45:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0101a48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101a4c:	74 09                	je     c0101a57 <list_del+0x50>
c0101a4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a51:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101a54:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0101a57:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101a5b:	74 08                	je     c0101a65 <list_del+0x5e>
c0101a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101a60:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101a63:	89 10                	mov    %edx,(%eax)
}
c0101a65:	c9                   	leave  
c0101a66:	c3                   	ret    

c0101a67 <list_init>:

static inline void
list_init(list *one) {
c0101a67:	55                   	push   %ebp
c0101a68:	89 e5                	mov    %esp,%ebp
c0101a6a:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101a6d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a71:	75 24                	jne    c0101a97 <list_init+0x30>
c0101a73:	c7 44 24 0c 2b 42 10 	movl   $0xc010422b,0xc(%esp)
c0101a7a:	c0 
c0101a7b:	c7 44 24 08 00 42 10 	movl   $0xc0104200,0x8(%esp)
c0101a82:	c0 
c0101a83:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0101a8a:	00 
c0101a8b:	c7 04 24 15 42 10 c0 	movl   $0xc0104215,(%esp)
c0101a92:	e8 1b 11 00 00       	call   c0102bb2 <_panic>
	one->prev = one->next = one;
c0101a97:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a9a:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a9d:	89 50 04             	mov    %edx,0x4(%eax)
c0101aa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aa3:	8b 50 04             	mov    0x4(%eax),%edx
c0101aa6:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aa9:	89 10                	mov    %edx,(%eax)
}
c0101aab:	c9                   	leave  
c0101aac:	c3                   	ret    

c0101aad <list_empty>:

static inline bool
list_empty(list *one) {
c0101aad:	55                   	push   %ebp
c0101aae:	89 e5                	mov    %esp,%ebp
c0101ab0:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101ab3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101ab7:	75 24                	jne    c0101add <list_empty+0x30>
c0101ab9:	c7 44 24 0c 2b 42 10 	movl   $0xc010422b,0xc(%esp)
c0101ac0:	c0 
c0101ac1:	c7 44 24 08 00 42 10 	movl   $0xc0104200,0x8(%esp)
c0101ac8:	c0 
c0101ac9:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0101ad0:	00 
c0101ad1:	c7 04 24 15 42 10 c0 	movl   $0xc0104215,(%esp)
c0101ad8:	e8 d5 10 00 00       	call   c0102bb2 <_panic>
	return one == one->next;
c0101add:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ae0:	8b 40 04             	mov    0x4(%eax),%eax
c0101ae3:	3b 45 08             	cmp    0x8(%ebp),%eax
c0101ae6:	0f 94 c0             	sete   %al
c0101ae9:	0f b6 c0             	movzbl %al,%eax
}
c0101aec:	c9                   	leave  
c0101aed:	c3                   	ret    

c0101aee <ksem_init>:
#include "common.h"
#include "list.h"
#include "pcb.h"

int ksem_init(Sema *sema,int value)
{
c0101aee:	55                   	push   %ebp
c0101aef:	89 e5                	mov    %esp,%ebp
c0101af1:	83 ec 18             	sub    $0x18,%esp
	//printk("%d\n",value);
	sema->value=value;
c0101af4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101af7:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101afa:	89 10                	mov    %edx,(%eax)
	sema->link=0;
c0101afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aff:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&sema->wait);
c0101b06:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b09:	83 c0 08             	add    $0x8,%eax
c0101b0c:	89 04 24             	mov    %eax,(%esp)
c0101b0f:	e8 53 ff ff ff       	call   c0101a67 <list_init>
	return 0;
c0101b14:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101b19:	c9                   	leave  
c0101b1a:	c3                   	ret    

c0101b1b <ksem_destroy>:

int ksem_destroy(Sema *sema)
{
c0101b1b:	55                   	push   %ebp
c0101b1c:	89 e5                	mov    %esp,%ebp
c0101b1e:	83 ec 28             	sub    $0x28,%esp
	sema->value=0;
c0101b21:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b24:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	sema->link=0;
c0101b2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b2d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list *one;
	list_foreach(one,&sema->wait)
c0101b34:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b37:	8b 40 0c             	mov    0xc(%eax),%eax
c0101b3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101b3d:	eb 27                	jmp    c0101b66 <ksem_destroy+0x4b>
	{
		list_del(one);
c0101b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b42:	89 04 24             	mov    %eax,(%esp)
c0101b45:	e8 bd fe ff ff       	call   c0101a07 <list_del>
		list_add_before(&ready,one);	
c0101b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b4d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101b51:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101b58:	e8 5d fe ff ff       	call   c01019ba <list_add_before>
int ksem_destroy(Sema *sema)
{
	sema->value=0;
	sema->link=0;
	list *one;
	list_foreach(one,&sema->wait)
c0101b5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b60:	8b 40 04             	mov    0x4(%eax),%eax
c0101b63:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101b66:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b69:	83 c0 08             	add    $0x8,%eax
c0101b6c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0101b6f:	75 ce                	jne    c0101b3f <ksem_destroy+0x24>
	{
		list_del(one);
		list_add_before(&ready,one);	
	}
	printk("destroy the semaphore\n");
c0101b71:	c7 04 24 37 42 10 c0 	movl   $0xc0104237,(%esp)
c0101b78:	e8 64 11 00 00       	call   c0102ce1 <printk>
	return 0;
c0101b7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101b82:	c9                   	leave  
c0101b83:	c3                   	ret    

c0101b84 <ksem_wait>:

int ksem_wait(Sema *sema)
{
c0101b84:	55                   	push   %ebp
c0101b85:	89 e5                	mov    %esp,%ebp
c0101b87:	83 ec 28             	sub    $0x28,%esp
	sema->link++;
c0101b8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b8d:	8b 40 04             	mov    0x4(%eax),%eax
c0101b90:	8d 50 01             	lea    0x1(%eax),%edx
c0101b93:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b96:	89 50 04             	mov    %edx,0x4(%eax)
	if(sema->value>0)
c0101b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b9c:	8b 00                	mov    (%eax),%eax
c0101b9e:	85 c0                	test   %eax,%eax
c0101ba0:	7e 14                	jle    c0101bb6 <ksem_wait+0x32>
	{
		sema->value--;
c0101ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ba5:	8b 00                	mov    (%eax),%eax
c0101ba7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101baa:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bad:	89 10                	mov    %edx,(%eax)
		return 0;
c0101baf:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bb4:	eb 46                	jmp    c0101bfc <ksem_wait+0x78>
	}
	else{
		sema->value--;
c0101bb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bb9:	8b 00                	mov    (%eax),%eax
c0101bbb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101bbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bc1:	89 10                	mov    %edx,(%eax)
		list *it = now;
c0101bc3:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101bc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(it);
c0101bcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bce:	89 04 24             	mov    %eax,(%esp)
c0101bd1:	e8 31 fe ff ff       	call   c0101a07 <list_del>
		schedule(0);
c0101bd6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101bdd:	e8 e0 0b 00 00       	call   c01027c2 <schedule>
		list_add_before(&sema->wait,it);
c0101be2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101be5:	8d 50 08             	lea    0x8(%eax),%edx
c0101be8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101beb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101bef:	89 14 24             	mov    %edx,(%esp)
c0101bf2:	e8 c3 fd ff ff       	call   c01019ba <list_add_before>
	}
	return -1;
c0101bf7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
c0101bfc:	c9                   	leave  
c0101bfd:	c3                   	ret    

c0101bfe <ksem_trywait>:

int ksem_trywait(Sema *sema)
{
c0101bfe:	55                   	push   %ebp
c0101bff:	89 e5                	mov    %esp,%ebp
	sema->link++;
c0101c01:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c04:	8b 40 04             	mov    0x4(%eax),%eax
c0101c07:	8d 50 01             	lea    0x1(%eax),%edx
c0101c0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c0d:	89 50 04             	mov    %edx,0x4(%eax)
	if(sema->value>0)
c0101c10:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c13:	8b 00                	mov    (%eax),%eax
c0101c15:	85 c0                	test   %eax,%eax
c0101c17:	7e 14                	jle    c0101c2d <ksem_trywait+0x2f>
	{
		sema->value--;
c0101c19:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c1c:	8b 00                	mov    (%eax),%eax
c0101c1e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c21:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c24:	89 10                	mov    %edx,(%eax)
		return 0;
c0101c26:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c2b:	eb 05                	jmp    c0101c32 <ksem_trywait+0x34>
	}
	else{
		return -1;
c0101c2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
}
c0101c32:	5d                   	pop    %ebp
c0101c33:	c3                   	ret    

c0101c34 <ksem_post>:

int ksem_post(Sema *sema)
{
c0101c34:	55                   	push   %ebp
c0101c35:	89 e5                	mov    %esp,%ebp
c0101c37:	83 ec 28             	sub    $0x28,%esp
	sema->link--;
c0101c3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c3d:	8b 40 04             	mov    0x4(%eax),%eax
c0101c40:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c43:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c46:	89 50 04             	mov    %edx,0x4(%eax)
	if(list_empty(&sema->wait)){
c0101c49:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c4c:	83 c0 08             	add    $0x8,%eax
c0101c4f:	89 04 24             	mov    %eax,(%esp)
c0101c52:	e8 56 fe ff ff       	call   c0101aad <list_empty>
c0101c57:	85 c0                	test   %eax,%eax
c0101c59:	74 0f                	je     c0101c6a <ksem_post+0x36>
		sema->value++;
c0101c5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c5e:	8b 00                	mov    (%eax),%eax
c0101c60:	8d 50 01             	lea    0x1(%eax),%edx
c0101c63:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c66:	89 10                	mov    %edx,(%eax)
c0101c68:	eb 40                	jmp    c0101caa <ksem_post+0x76>
	}
	else{
		sema->value++;
c0101c6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c6d:	8b 00                	mov    (%eax),%eax
c0101c6f:	8d 50 01             	lea    0x1(%eax),%edx
c0101c72:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c75:	89 10                	mov    %edx,(%eax)
		list *one=sema->wait.next;
c0101c77:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c7a:	8b 40 0c             	mov    0xc(%eax),%eax
c0101c7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(one);
c0101c80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c83:	89 04 24             	mov    %eax,(%esp)
c0101c86:	e8 7c fd ff ff       	call   c0101a07 <list_del>
		list_add_before(&ready,one);
c0101c8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c8e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c92:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101c99:	e8 1c fd ff ff       	call   c01019ba <list_add_before>
		schedule(0);
c0101c9e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101ca5:	e8 18 0b 00 00       	call   c01027c2 <schedule>
	}
}
c0101caa:	c9                   	leave  
c0101cab:	c3                   	ret    

c0101cac <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101cac:	55                   	push   %ebp
c0101cad:	89 e5                	mov    %esp,%ebp
c0101caf:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101cb2:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cb5:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101cba:	77 21                	ja     c0101cdd <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101cbc:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cbf:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101cc3:	c7 44 24 08 50 42 10 	movl   $0xc0104250,0x8(%esp)
c0101cca:	c0 
c0101ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cce:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cd5:	89 04 24             	mov    %eax,(%esp)
c0101cd8:	e8 d5 0e 00 00       	call   c0102bb2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101cdd:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ce0:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101ce5:	c9                   	leave  
c0101ce6:	c3                   	ret    

c0101ce7 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0101ce7:	55                   	push   %ebp
c0101ce8:	89 e5                	mov    %esp,%ebp
c0101cea:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101ced:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cf0:	c1 e8 0c             	shr    $0xc,%eax
c0101cf3:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101cf8:	76 21                	jbe    c0101d1b <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0101cfa:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cfd:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101d01:	c7 44 24 08 74 42 10 	movl   $0xc0104274,0x8(%esp)
c0101d08:	c0 
c0101d09:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d0c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d10:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d13:	89 04 24             	mov    %eax,(%esp)
c0101d16:	e8 97 0e 00 00       	call   c0102bb2 <_panic>
	return (void *)(pa + KERNBASE);
c0101d1b:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d1e:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0101d23:	c9                   	leave  
c0101d24:	c3                   	ret    

c0101d25 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0101d25:	55                   	push   %ebp
c0101d26:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0101d28:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d2b:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0101d30:	29 c2                	sub    %eax,%edx
c0101d32:	89 d0                	mov    %edx,%eax
c0101d34:	c1 f8 03             	sar    $0x3,%eax
c0101d37:	c1 e0 0c             	shl    $0xc,%eax
}
c0101d3a:	5d                   	pop    %ebp
c0101d3b:	c3                   	ret    

c0101d3c <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c0101d3c:	55                   	push   %ebp
c0101d3d:	89 e5                	mov    %esp,%ebp
c0101d3f:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101d42:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d45:	c1 e8 0c             	shr    $0xc,%eax
c0101d48:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101d4d:	76 1c                	jbe    c0101d6b <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c0101d4f:	c7 44 24 08 98 42 10 	movl   $0xc0104298,0x8(%esp)
c0101d56:	c0 
c0101d57:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c0101d5e:	00 
c0101d5f:	c7 04 24 b7 42 10 c0 	movl   $0xc01042b7,(%esp)
c0101d66:	e8 47 0e 00 00       	call   c0102bb2 <_panic>
	return &pages[PGNUM(pa)];
c0101d6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d6e:	c1 e8 0c             	shr    $0xc,%eax
c0101d71:	c1 e0 03             	shl    $0x3,%eax
c0101d74:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c0101d79:	c9                   	leave  
c0101d7a:	c3                   	ret    

c0101d7b <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c0101d7b:	55                   	push   %ebp
c0101d7c:	89 e5                	mov    %esp,%ebp
c0101d7e:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101d81:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d84:	89 04 24             	mov    %eax,(%esp)
c0101d87:	e8 99 ff ff ff       	call   c0101d25 <page2pa>
c0101d8c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d90:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0101d97:	00 
c0101d98:	c7 04 24 b7 42 10 c0 	movl   $0xc01042b7,(%esp)
c0101d9f:	e8 43 ff ff ff       	call   c0101ce7 <_kaddr>
}
c0101da4:	c9                   	leave  
c0101da5:	c3                   	ret    

c0101da6 <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c0101da6:	55                   	push   %ebp
c0101da7:	89 e5                	mov    %esp,%ebp
c0101da9:	53                   	push   %ebx
c0101daa:	83 ec 44             	sub    $0x44,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
c0101dad:	c7 45 e8 00 30 13 c0 	movl   $0xc0133000,-0x18(%ebp)
	pte_t *pgta=kpgtable;
c0101db4:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101dbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101dc2:	eb 40                	jmp    c0101e04 <page_init+0x5e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
c0101dc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101dc7:	05 00 03 00 00       	add    $0x300,%eax
c0101dcc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101dd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dd6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101dd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ddc:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101de0:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101de7:	00 
c0101de8:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c0101def:	e8 b8 fe ff ff       	call   c0101cac <_paddr>
c0101df4:	83 c8 03             	or     $0x3,%eax
c0101df7:	89 03                	mov    %eax,(%ebx)
		pgta+=NPTENTRIES;
c0101df9:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
	pte_t *pgta=kpgtable;
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101e00:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e04:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101e08:	7e ba                	jle    c0101dc4 <page_init+0x1e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
c0101e0a:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgta--;
c0101e11:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (;pframe>=0; pframe-=PGSIZE){
c0101e15:	eb 18                	jmp    c0101e2f <page_init+0x89>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
c0101e17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e1a:	83 c8 07             	or     $0x7,%eax
c0101e1d:	89 c2                	mov    %eax,%edx
c0101e1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e22:	89 10                	mov    %edx,(%eax)
		pgta--;
c0101e24:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
	pgta--;
	for (;pframe>=0; pframe-=PGSIZE){
c0101e28:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c0101e2f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101e33:	79 e2                	jns    c0101e17 <page_init+0x71>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
c0101e35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e38:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c0101e3d:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101e42:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e46:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c0101e4d:	00 
c0101e4e:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c0101e55:	e8 52 fe ff ff       	call   c0101cac <_paddr>
c0101e5a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101e5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101e60:	0f 22 d8             	mov    %eax,%cr3
	for (i=0;i<0x400;i++) {
c0101e63:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e6a:	eb 11                	jmp    c0101e7d <page_init+0xd7>
		pages[i].pp_ref = 1;
c0101e6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e6f:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c0101e76:	c0 01 00 
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
c0101e79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e7d:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101e84:	7e e6                	jle    c0101e6c <page_init+0xc6>
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101e86:	c7 45 f4 ff 7f 00 00 	movl   $0x7fff,-0xc(%ebp)
c0101e8d:	eb 31                	jmp    c0101ec0 <page_init+0x11a>
		pages[i].pp_ref = 0;
c0101e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e92:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101e99:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101e9c:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ea5:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101eac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101eaf:	c1 e0 03             	shl    $0x3,%eax
c0101eb2:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101eb7:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101ebc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0101ec0:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101ec7:	7f c6                	jg     c0101e8f <page_init+0xe9>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101ec9:	c7 45 e4 00 10 00 00 	movl   $0x1000,-0x1c(%ebp)
c0101ed0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ed3:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101ed8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101edb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ede:	ba 00 00 00 00       	mov    $0x0,%edx
c0101ee3:	f7 75 e4             	divl   -0x1c(%ebp)
c0101ee6:	89 d0                	mov    %edx,%eax
c0101ee8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101eeb:	29 c2                	sub    %eax,%edx
c0101eed:	89 d0                	mov    %edx,%eax
c0101eef:	89 c2                	mov    %eax,%edx
c0101ef1:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101ef6:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101efd:	00 
c0101efe:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101f05:	00 
c0101f06:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101f0a:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101f11:	00 
c0101f12:	89 04 24             	mov    %eax,(%esp)
c0101f15:	e8 3e 05 00 00       	call   c0102458 <boot_map_region>
}
c0101f1a:	83 c4 44             	add    $0x44,%esp
c0101f1d:	5b                   	pop    %ebx
c0101f1e:	5d                   	pop    %ebp
c0101f1f:	c3                   	ret    

c0101f20 <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101f20:	55                   	push   %ebp
c0101f21:	89 e5                	mov    %esp,%ebp
c0101f23:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101f26:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101f2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101f2e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101f32:	75 07                	jne    c0101f3b <page_alloc+0x1b>
c0101f34:	b8 00 00 00 00       	mov    $0x0,%eax
c0101f39:	eb 45                	jmp    c0101f80 <page_alloc+0x60>
	page_free_list = page_free_list -> pp_link;
c0101f3b:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101f40:	8b 00                	mov    (%eax),%eax
c0101f42:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	if (alloc_flags & ALLOC_ZERO) {
c0101f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f4a:	83 e0 01             	and    $0x1,%eax
c0101f4d:	85 c0                	test   %eax,%eax
c0101f4f:	74 23                	je     c0101f74 <page_alloc+0x54>
		memset(page2kva(p), 0, PGSIZE);
c0101f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f54:	89 04 24             	mov    %eax,(%esp)
c0101f57:	e8 1f fe ff ff       	call   c0101d7b <page2kva>
c0101f5c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101f63:	00 
c0101f64:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101f6b:	00 
c0101f6c:	89 04 24             	mov    %eax,(%esp)
c0101f6f:	e8 f3 11 00 00       	call   c0103167 <memset>
	}
	p -> pp_link = NULL;
c0101f74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f77:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101f80:	c9                   	leave  
c0101f81:	c3                   	ret    

c0101f82 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101f82:	55                   	push   %ebp
c0101f83:	89 e5                	mov    %esp,%ebp
	pp->pp_link = page_free_list;
c0101f85:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101f8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f8e:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f93:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101f98:	5d                   	pop    %ebp
c0101f99:	c3                   	ret    

c0101f9a <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0101f9a:	55                   	push   %ebp
c0101f9b:	89 e5                	mov    %esp,%ebp
c0101f9d:	83 ec 04             	sub    $0x4,%esp
	if (--pp->pp_ref == 0)
c0101fa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fa3:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101fa7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fad:	66 89 50 04          	mov    %dx,0x4(%eax)
c0101fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fb4:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101fb8:	66 85 c0             	test   %ax,%ax
c0101fbb:	75 0b                	jne    c0101fc8 <page_decref+0x2e>
		page_free(pp);
c0101fbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fc0:	89 04 24             	mov    %eax,(%esp)
c0101fc3:	e8 ba ff ff ff       	call   c0101f82 <page_free>
}
c0101fc8:	c9                   	leave  
c0101fc9:	c3                   	ret    

c0101fca <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0101fca:	55                   	push   %ebp
c0101fcb:	89 e5                	mov    %esp,%ebp
c0101fcd:	53                   	push   %ebx
c0101fce:	83 ec 24             	sub    $0x24,%esp
	pte_t *t=NULL;
c0101fd1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (pgdir[PDX(va)] & PTE_P) {
c0101fd8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fdb:	c1 e8 16             	shr    $0x16,%eax
c0101fde:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101fe5:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fe8:	01 d0                	add    %edx,%eax
c0101fea:	8b 00                	mov    (%eax),%eax
c0101fec:	83 e0 01             	and    $0x1,%eax
c0101fef:	85 c0                	test   %eax,%eax
c0101ff1:	74 36                	je     c0102029 <pgdir_walk+0x5f>
		t = KADDR(PTE_ADDR(pgdir[PDX(va)]));
c0101ff3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ff6:	c1 e8 16             	shr    $0x16,%eax
c0101ff9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102000:	8b 45 08             	mov    0x8(%ebp),%eax
c0102003:	01 d0                	add    %edx,%eax
c0102005:	8b 00                	mov    (%eax),%eax
c0102007:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010200c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102010:	c7 44 24 04 a3 00 00 	movl   $0xa3,0x4(%esp)
c0102017:	00 
c0102018:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c010201f:	e8 c3 fc ff ff       	call   c0101ce7 <_kaddr>
c0102024:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102027:	eb 6b                	jmp    c0102094 <pgdir_walk+0xca>
	}
	else {
		if (create == false) 
c0102029:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010202d:	75 07                	jne    c0102036 <pgdir_walk+0x6c>
			return NULL;
c010202f:	b8 00 00 00 00       	mov    $0x0,%eax
c0102034:	eb 75                	jmp    c01020ab <pgdir_walk+0xe1>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0102036:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010203d:	e8 de fe ff ff       	call   c0101f20 <page_alloc>
c0102042:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (p == NULL) 
c0102045:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102049:	75 07                	jne    c0102052 <pgdir_walk+0x88>
			return NULL;
c010204b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102050:	eb 59                	jmp    c01020ab <pgdir_walk+0xe1>
		p -> pp_ref ++;
c0102052:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102055:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102059:	8d 50 01             	lea    0x1(%eax),%edx
c010205c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010205f:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[PDX(va)] = page2pa(p) | PTE_P | PTE_W | PTE_U;
c0102063:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102066:	c1 e8 16             	shr    $0x16,%eax
c0102069:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102070:	8b 45 08             	mov    0x8(%ebp),%eax
c0102073:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0102076:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102079:	89 04 24             	mov    %eax,(%esp)
c010207c:	e8 a4 fc ff ff       	call   c0101d25 <page2pa>
c0102081:	83 c8 07             	or     $0x7,%eax
c0102084:	89 03                	mov    %eax,(%ebx)
		t=page2kva(p);
c0102086:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102089:	89 04 24             	mov    %eax,(%esp)
c010208c:	e8 ea fc ff ff       	call   c0101d7b <page2kva>
c0102091:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	return &t[PTX(va)];
c0102094:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102097:	c1 e8 0c             	shr    $0xc,%eax
c010209a:	25 ff 03 00 00       	and    $0x3ff,%eax
c010209f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020a9:	01 d0                	add    %edx,%eax
}
c01020ab:	83 c4 24             	add    $0x24,%esp
c01020ae:	5b                   	pop    %ebx
c01020af:	5d                   	pop    %ebp
c01020b0:	c3                   	ret    

c01020b1 <pg_copy>:


void 
pg_copy(pde_t *fa, pde_t *tb, int pan)
{
c01020b1:	55                   	push   %ebp
c01020b2:	89 e5                	mov    %esp,%ebp
c01020b4:	53                   	push   %ebx
c01020b5:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c01020b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01020bf:	e9 33 02 00 00       	jmp    c01022f7 <pg_copy+0x246>
		if (fa[i]&PTE_P){	
c01020c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020c7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01020d1:	01 d0                	add    %edx,%eax
c01020d3:	8b 00                	mov    (%eax),%eax
c01020d5:	83 e0 01             	and    $0x1,%eax
c01020d8:	85 c0                	test   %eax,%eax
c01020da:	0f 84 13 02 00 00    	je     c01022f3 <pg_copy+0x242>
			if (tb[i]&PTE_P) 
c01020e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020e3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020ed:	01 d0                	add    %edx,%eax
c01020ef:	8b 00                	mov    (%eax),%eax
c01020f1:	83 e0 01             	and    $0x1,%eax
c01020f4:	85 c0                	test   %eax,%eax
c01020f6:	74 05                	je     c01020fd <pg_copy+0x4c>
				continue;
c01020f8:	e9 f6 01 00 00       	jmp    c01022f3 <pg_copy+0x242>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c01020fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102100:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102107:	8b 45 08             	mov    0x8(%ebp),%eax
c010210a:	01 d0                	add    %edx,%eax
c010210c:	8b 00                	mov    (%eax),%eax
c010210e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102113:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102117:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
c010211e:	00 
c010211f:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c0102126:	e8 bc fb ff ff       	call   c0101ce7 <_kaddr>
c010212b:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c010212e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102135:	e8 e6 fd ff ff       	call   c0101f20 <page_alloc>
c010213a:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c010213d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102140:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102144:	8d 50 01             	lea    0x1(%eax),%edx
c0102147:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010214a:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c010214e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102151:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102158:	8b 45 0c             	mov    0xc(%ebp),%eax
c010215b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010215e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102161:	89 04 24             	mov    %eax,(%esp)
c0102164:	e8 bc fb ff ff       	call   c0101d25 <page2pa>
c0102169:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010216c:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0102173:	8b 55 08             	mov    0x8(%ebp),%edx
c0102176:	01 ca                	add    %ecx,%edx
c0102178:	8b 12                	mov    (%edx),%edx
c010217a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0102180:	09 d0                	or     %edx,%eax
c0102182:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c0102184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102187:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010218e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102191:	01 d0                	add    %edx,%eax
c0102193:	8b 00                	mov    (%eax),%eax
c0102195:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010219a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010219e:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c01021a5:	00 
c01021a6:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c01021ad:	e8 35 fb ff ff       	call   c0101ce7 <_kaddr>
c01021b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c01021b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01021bc:	e9 25 01 00 00       	jmp    c01022e6 <pg_copy+0x235>
				if (fat[j]&PTE_P){ 
c01021c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021c4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01021cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021ce:	01 d0                	add    %edx,%eax
c01021d0:	8b 00                	mov    (%eax),%eax
c01021d2:	83 e0 01             	and    $0x1,%eax
c01021d5:	85 c0                	test   %eax,%eax
c01021d7:	0f 84 05 01 00 00    	je     c01022e2 <pg_copy+0x231>
					if(pan==0){
c01021dd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01021e1:	0f 85 a7 00 00 00    	jne    c010228e <pg_copy+0x1dd>
						p = page_alloc(0);
c01021e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01021ee:	e8 2d fd ff ff       	call   c0101f20 <page_alloc>
c01021f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
						p->pp_ref++;
c01021f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021f9:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01021fd:	8d 50 01             	lea    0x1(%eax),%edx
c0102200:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102203:	66 89 50 04          	mov    %dx,0x4(%eax)
						tbt[j] = page2pa(p)|(fat[j]&0xFFF);
c0102207:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010220a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102211:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102214:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0102217:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010221a:	89 04 24             	mov    %eax,(%esp)
c010221d:	e8 03 fb ff ff       	call   c0101d25 <page2pa>
c0102222:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102225:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c010222c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010222f:	01 ca                	add    %ecx,%edx
c0102231:	8b 12                	mov    (%edx),%edx
c0102233:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0102239:	09 d0                	or     %edx,%eax
c010223b:	89 03                	mov    %eax,(%ebx)
						memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
c010223d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102240:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102247:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010224a:	01 d0                	add    %edx,%eax
c010224c:	8b 00                	mov    (%eax),%eax
c010224e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102253:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102257:	c7 44 24 04 c6 00 00 	movl   $0xc6,0x4(%esp)
c010225e:	00 
c010225f:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c0102266:	e8 7c fa ff ff       	call   c0101ce7 <_kaddr>
c010226b:	89 c3                	mov    %eax,%ebx
c010226d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102270:	89 04 24             	mov    %eax,(%esp)
c0102273:	e8 03 fb ff ff       	call   c0101d7b <page2kva>
c0102278:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c010227f:	00 
c0102280:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0102284:	89 04 24             	mov    %eax,(%esp)
c0102287:	e8 be 0e 00 00       	call   c010314a <memcpy>
c010228c:	eb 54                	jmp    c01022e2 <pg_copy+0x231>
					}
					else{
						p=pa2page(PTE_ADDR(fat[j]));
c010228e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102291:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102298:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010229b:	01 d0                	add    %edx,%eax
c010229d:	8b 00                	mov    (%eax),%eax
c010229f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01022a4:	89 04 24             	mov    %eax,(%esp)
c01022a7:	e8 90 fa ff ff       	call   c0101d3c <pa2page>
c01022ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
						p->pp_ref++;
c01022af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022b2:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01022b6:	8d 50 01             	lea    0x1(%eax),%edx
c01022b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022bc:	66 89 50 04          	mov    %dx,0x4(%eax)
						tbt[j] = fat[j];
c01022c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022c3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01022ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01022cd:	01 c2                	add    %eax,%edx
c01022cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022d2:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c01022d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022dc:	01 c8                	add    %ecx,%eax
c01022de:	8b 00                	mov    (%eax),%eax
c01022e0:	89 02                	mov    %eax,(%edx)
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c01022e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01022e6:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c01022ed:	0f 8e ce fe ff ff    	jle    c01021c1 <pg_copy+0x110>

void 
pg_copy(pde_t *fa, pde_t *tb, int pan)
{
	int i, j;
	for (i=0;i<1024;i++){
c01022f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01022f7:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c01022fe:	0f 8e c0 fd ff ff    	jle    c01020c4 <pg_copy+0x13>
					}
				}
			}
		}
	}
}
c0102304:	83 c4 34             	add    $0x34,%esp
c0102307:	5b                   	pop    %ebx
c0102308:	5d                   	pop    %ebp
c0102309:	c3                   	ret    

c010230a <pg_remove>:

void 
pg_remove(pde_t *pgdir)
{
c010230a:	55                   	push   %ebp
c010230b:	89 e5                	mov    %esp,%ebp
c010230d:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for (i=0; i<1024;i++) {
c0102310:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102317:	e9 fb 00 00 00       	jmp    c0102417 <pg_remove+0x10d>
		if (pgdir[i]&PTE_P) {
c010231c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010231f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102326:	8b 45 08             	mov    0x8(%ebp),%eax
c0102329:	01 d0                	add    %edx,%eax
c010232b:	8b 00                	mov    (%eax),%eax
c010232d:	83 e0 01             	and    $0x1,%eax
c0102330:	85 c0                	test   %eax,%eax
c0102332:	0f 84 db 00 00 00    	je     c0102413 <pg_remove+0x109>
			if (kern_pgdir[i]&PTE_P) 
c0102338:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010233d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102340:	c1 e2 02             	shl    $0x2,%edx
c0102343:	01 d0                	add    %edx,%eax
c0102345:	8b 00                	mov    (%eax),%eax
c0102347:	83 e0 01             	and    $0x1,%eax
c010234a:	85 c0                	test   %eax,%eax
c010234c:	74 05                	je     c0102353 <pg_remove+0x49>
				continue;
c010234e:	e9 c0 00 00 00       	jmp    c0102413 <pg_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
c0102353:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102356:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010235d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102360:	01 d0                	add    %edx,%eax
c0102362:	8b 00                	mov    (%eax),%eax
c0102364:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102369:	89 44 24 08          	mov    %eax,0x8(%esp)
c010236d:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
c0102374:	00 
c0102375:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c010237c:	e8 66 f9 ff ff       	call   c0101ce7 <_kaddr>
c0102381:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (j=0; j<NPTENTRIES;j++){
c0102384:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010238b:	eb 42                	jmp    c01023cf <pg_remove+0xc5>
				if (pgtable[j]&PTE_P){
c010238d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102390:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102397:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010239a:	01 d0                	add    %edx,%eax
c010239c:	8b 00                	mov    (%eax),%eax
c010239e:	83 e0 01             	and    $0x1,%eax
c01023a1:	85 c0                	test   %eax,%eax
c01023a3:	74 26                	je     c01023cb <pg_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
c01023a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023a8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023b2:	01 d0                	add    %edx,%eax
c01023b4:	8b 00                	mov    (%eax),%eax
c01023b6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01023bb:	89 04 24             	mov    %eax,(%esp)
c01023be:	e8 79 f9 ff ff       	call   c0101d3c <pa2page>
c01023c3:	89 04 24             	mov    %eax,(%esp)
c01023c6:	e8 cf fb ff ff       	call   c0101f9a <page_decref>
	for (i=0; i<1024;i++) {
		if (pgdir[i]&PTE_P) {
			if (kern_pgdir[i]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
			for (j=0; j<NPTENTRIES;j++){
c01023cb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01023cf:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c01023d6:	7e b5                	jle    c010238d <pg_remove+0x83>
				if (pgtable[j]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
c01023d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023db:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01023e5:	01 d0                	add    %edx,%eax
c01023e7:	8b 00                	mov    (%eax),%eax
c01023e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01023ee:	89 04 24             	mov    %eax,(%esp)
c01023f1:	e8 46 f9 ff ff       	call   c0101d3c <pa2page>
c01023f6:	89 04 24             	mov    %eax,(%esp)
c01023f9:	e8 9c fb ff ff       	call   c0101f9a <page_decref>
			pgdir[i]=NULL;
c01023fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102401:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102408:	8b 45 08             	mov    0x8(%ebp),%eax
c010240b:	01 d0                	add    %edx,%eax
c010240d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

void 
pg_remove(pde_t *pgdir)
{
	int i,j;
	for (i=0; i<1024;i++) {
c0102413:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102417:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c010241e:	0f 8e f8 fe ff ff    	jle    c010231c <pg_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
			pgdir[i]=NULL;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c0102424:	8b 45 08             	mov    0x8(%ebp),%eax
c0102427:	89 44 24 08          	mov    %eax,0x8(%esp)
c010242b:	c7 44 24 04 e5 00 00 	movl   $0xe5,0x4(%esp)
c0102432:	00 
c0102433:	c7 04 24 cd 42 10 c0 	movl   $0xc01042cd,(%esp)
c010243a:	e8 6d f8 ff ff       	call   c0101cac <_paddr>
c010243f:	89 04 24             	mov    %eax,(%esp)
c0102442:	e8 f5 f8 ff ff       	call   c0101d3c <pa2page>
c0102447:	89 04 24             	mov    %eax,(%esp)
c010244a:	e8 4b fb ff ff       	call   c0101f9a <page_decref>
	pgdir=NULL;
c010244f:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c0102456:	c9                   	leave  
c0102457:	c3                   	ret    

c0102458 <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c0102458:	55                   	push   %ebp
c0102459:	89 e5                	mov    %esp,%ebp
c010245b:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c010245e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102465:	eb 47                	jmp    c01024ae <boot_map_region+0x56>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0102467:	8b 45 0c             	mov    0xc(%ebp),%eax
c010246a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0102471:	00 
c0102472:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102476:	8b 45 08             	mov    0x8(%ebp),%eax
c0102479:	89 04 24             	mov    %eax,(%esp)
c010247c:	e8 49 fb ff ff       	call   c0101fca <pgdir_walk>
c0102481:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (pte == NULL) 
c0102484:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102488:	75 02                	jne    c010248c <boot_map_region+0x34>
			return;
c010248a:	eb 2f                	jmp    c01024bb <boot_map_region+0x63>
		pte[0]=pa|perm|PTE_P;
c010248c:	8b 45 18             	mov    0x18(%ebp),%eax
c010248f:	0b 45 14             	or     0x14(%ebp),%eax
c0102492:	83 c8 01             	or     $0x1,%eax
c0102495:	89 c2                	mov    %eax,%edx
c0102497:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010249a:	89 10                	mov    %edx,(%eax)
		va+=PGSIZE;
c010249c:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa+=PGSIZE;
c01024a3:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c01024aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01024ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024b1:	8b 55 10             	mov    0x10(%ebp),%edx
c01024b4:	c1 ea 0c             	shr    $0xc,%edx
c01024b7:	39 d0                	cmp    %edx,%eax
c01024b9:	72 ac                	jb     c0102467 <boot_map_region+0xf>
			return;
		pte[0]=pa|perm|PTE_P;
		va+=PGSIZE;
		pa+=PGSIZE;
	}
}
c01024bb:	c9                   	leave  
c01024bc:	c3                   	ret    

c01024bd <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c01024bd:	55                   	push   %ebp
c01024be:	89 e5                	mov    %esp,%ebp
c01024c0:	53                   	push   %ebx
c01024c1:	83 ec 24             	sub    $0x24,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 1);
c01024c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01024cb:	00 
c01024cc:	8b 45 10             	mov    0x10(%ebp),%eax
c01024cf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01024d6:	89 04 24             	mov    %eax,(%esp)
c01024d9:	e8 ec fa ff ff       	call   c0101fca <pgdir_walk>
c01024de:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c01024e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01024e5:	75 0a                	jne    c01024f1 <page_insert+0x34>
		return -1;
c01024e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01024ec:	e9 85 00 00 00       	jmp    c0102576 <page_insert+0xb9>
	}
	else if (pte[0] & PTE_P) {
c01024f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024f4:	8b 00                	mov    (%eax),%eax
c01024f6:	83 e0 01             	and    $0x1,%eax
c01024f9:	85 c0                	test   %eax,%eax
c01024fb:	74 49                	je     c0102546 <page_insert+0x89>
		if (PTE_ADDR(pte[0]) == page2pa(pp)) {
c01024fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102500:	8b 00                	mov    (%eax),%eax
c0102502:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102507:	89 c3                	mov    %eax,%ebx
c0102509:	8b 45 0c             	mov    0xc(%ebp),%eax
c010250c:	89 04 24             	mov    %eax,(%esp)
c010250f:	e8 11 f8 ff ff       	call   c0101d25 <page2pa>
c0102514:	39 c3                	cmp    %eax,%ebx
c0102516:	75 1c                	jne    c0102534 <page_insert+0x77>
			pte[0] = page2pa(pp)|perm|PTE_P;
c0102518:	8b 45 0c             	mov    0xc(%ebp),%eax
c010251b:	89 04 24             	mov    %eax,(%esp)
c010251e:	e8 02 f8 ff ff       	call   c0101d25 <page2pa>
c0102523:	8b 55 14             	mov    0x14(%ebp),%edx
c0102526:	09 d0                	or     %edx,%eax
c0102528:	83 c8 01             	or     $0x1,%eax
c010252b:	89 c2                	mov    %eax,%edx
c010252d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102530:	89 10                	mov    %edx,(%eax)
c0102532:	eb 12                	jmp    c0102546 <page_insert+0x89>
		}
		else {
			page_remove(pgdir, va);
c0102534:	8b 45 10             	mov    0x10(%ebp),%eax
c0102537:	89 44 24 04          	mov    %eax,0x4(%esp)
c010253b:	8b 45 08             	mov    0x8(%ebp),%eax
c010253e:	89 04 24             	mov    %eax,(%esp)
c0102541:	e8 88 00 00 00       	call   c01025ce <page_remove>
		}
	}
	pte[0] = page2pa(pp)|perm|PTE_P;
c0102546:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102549:	89 04 24             	mov    %eax,(%esp)
c010254c:	e8 d4 f7 ff ff       	call   c0101d25 <page2pa>
c0102551:	8b 55 14             	mov    0x14(%ebp),%edx
c0102554:	09 d0                	or     %edx,%eax
c0102556:	83 c8 01             	or     $0x1,%eax
c0102559:	89 c2                	mov    %eax,%edx
c010255b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010255e:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c0102560:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102563:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102567:	8d 50 01             	lea    0x1(%eax),%edx
c010256a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010256d:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c0102571:	b8 00 00 00 00       	mov    $0x0,%eax

}
c0102576:	83 c4 24             	add    $0x24,%esp
c0102579:	5b                   	pop    %ebx
c010257a:	5d                   	pop    %ebp
c010257b:	c3                   	ret    

c010257c <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c010257c:	55                   	push   %ebp
c010257d:	89 e5                	mov    %esp,%ebp
c010257f:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 0);
c0102582:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0102589:	00 
c010258a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010258d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102591:	8b 45 08             	mov    0x8(%ebp),%eax
c0102594:	89 04 24             	mov    %eax,(%esp)
c0102597:	e8 2e fa ff ff       	call   c0101fca <pgdir_walk>
c010259c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) 
c010259f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01025a3:	75 07                	jne    c01025ac <page_lookup+0x30>
		return NULL;
c01025a5:	b8 00 00 00 00       	mov    $0x0,%eax
c01025aa:	eb 20                	jmp    c01025cc <page_lookup+0x50>
	if (pte_store != NULL) 
c01025ac:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01025b0:	74 08                	je     c01025ba <page_lookup+0x3e>
		*pte_store = pte;
c01025b2:	8b 45 10             	mov    0x10(%ebp),%eax
c01025b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01025b8:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(pte[0]));
c01025ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025bd:	8b 00                	mov    (%eax),%eax
c01025bf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01025c4:	89 04 24             	mov    %eax,(%esp)
c01025c7:	e8 70 f7 ff ff       	call   c0101d3c <pa2page>
}
c01025cc:	c9                   	leave  
c01025cd:	c3                   	ret    

c01025ce <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c01025ce:	55                   	push   %ebp
c01025cf:	89 e5                	mov    %esp,%ebp
c01025d1:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte=NULL;
c01025d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	struct Page *p = page_lookup(pgdir, va, &pte);
c01025db:	8d 45 f0             	lea    -0x10(%ebp),%eax
c01025de:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025e5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ec:	89 04 24             	mov    %eax,(%esp)
c01025ef:	e8 88 ff ff ff       	call   c010257c <page_lookup>
c01025f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p != NULL) {
c01025f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01025fb:	74 14                	je     c0102611 <page_remove+0x43>
		pte[0] = 0;
c01025fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102600:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c0102606:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102609:	89 04 24             	mov    %eax,(%esp)
c010260c:	e8 89 f9 ff ff       	call   c0101f9a <page_decref>
	}
	tlb_invalidate(pgdir, va);
c0102611:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102614:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102618:	8b 45 08             	mov    0x8(%ebp),%eax
c010261b:	89 04 24             	mov    %eax,(%esp)
c010261e:	e8 02 00 00 00       	call   c0102625 <tlb_invalidate>
}
c0102623:	c9                   	leave  
c0102624:	c3                   	ret    

c0102625 <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c0102625:	55                   	push   %ebp
c0102626:	89 e5                	mov    %esp,%ebp
c0102628:	83 ec 10             	sub    $0x10,%esp
c010262b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010262e:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c0102631:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102634:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c0102637:	c9                   	leave  
c0102638:	c3                   	ret    

c0102639 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0102639:	55                   	push   %ebp
c010263a:	89 e5                	mov    %esp,%ebp
c010263c:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c010263f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102643:	75 24                	jne    c0102669 <list_add+0x30>
c0102645:	c7 44 24 0c e4 42 10 	movl   $0xc01042e4,0xc(%esp)
c010264c:	c0 
c010264d:	c7 44 24 08 f1 42 10 	movl   $0xc01042f1,0x8(%esp)
c0102654:	c0 
c0102655:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c010265c:	00 
c010265d:	c7 04 24 06 43 10 c0 	movl   $0xc0104306,(%esp)
c0102664:	e8 49 05 00 00       	call   c0102bb2 <_panic>
	data->prev = prev;
c0102669:	8b 45 10             	mov    0x10(%ebp),%eax
c010266c:	8b 55 08             	mov    0x8(%ebp),%edx
c010266f:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0102671:	8b 45 10             	mov    0x10(%ebp),%eax
c0102674:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102677:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010267a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010267e:	74 09                	je     c0102689 <list_add+0x50>
c0102680:	8b 45 08             	mov    0x8(%ebp),%eax
c0102683:	8b 55 10             	mov    0x10(%ebp),%edx
c0102686:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0102689:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010268d:	74 08                	je     c0102697 <list_add+0x5e>
c010268f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102692:	8b 55 10             	mov    0x10(%ebp),%edx
c0102695:	89 10                	mov    %edx,(%eax)
}
c0102697:	c9                   	leave  
c0102698:	c3                   	ret    

c0102699 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0102699:	55                   	push   %ebp
c010269a:	89 e5                	mov    %esp,%ebp
c010269c:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c010269f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01026a3:	75 24                	jne    c01026c9 <list_add_before+0x30>
c01026a5:	c7 44 24 0c 1c 43 10 	movl   $0xc010431c,0xc(%esp)
c01026ac:	c0 
c01026ad:	c7 44 24 08 f1 42 10 	movl   $0xc01042f1,0x8(%esp)
c01026b4:	c0 
c01026b5:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c01026bc:	00 
c01026bd:	c7 04 24 06 43 10 c0 	movl   $0xc0104306,(%esp)
c01026c4:	e8 e9 04 00 00       	call   c0102bb2 <_panic>
	list_add(one->prev, one, data);
c01026c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01026cc:	8b 00                	mov    (%eax),%eax
c01026ce:	8b 55 0c             	mov    0xc(%ebp),%edx
c01026d1:	89 54 24 08          	mov    %edx,0x8(%esp)
c01026d5:	8b 55 08             	mov    0x8(%ebp),%edx
c01026d8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01026dc:	89 04 24             	mov    %eax,(%esp)
c01026df:	e8 55 ff ff ff       	call   c0102639 <list_add>
}
c01026e4:	c9                   	leave  
c01026e5:	c3                   	ret    

c01026e6 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c01026e6:	55                   	push   %ebp
c01026e7:	89 e5                	mov    %esp,%ebp
c01026e9:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c01026ec:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01026f0:	75 24                	jne    c0102716 <list_del+0x30>
c01026f2:	c7 44 24 0c e4 42 10 	movl   $0xc01042e4,0xc(%esp)
c01026f9:	c0 
c01026fa:	c7 44 24 08 f1 42 10 	movl   $0xc01042f1,0x8(%esp)
c0102701:	c0 
c0102702:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0102709:	00 
c010270a:	c7 04 24 06 43 10 c0 	movl   $0xc0104306,(%esp)
c0102711:	e8 9c 04 00 00       	call   c0102bb2 <_panic>
	list *prev = data->prev;
c0102716:	8b 45 08             	mov    0x8(%ebp),%eax
c0102719:	8b 00                	mov    (%eax),%eax
c010271b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c010271e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102721:	8b 40 04             	mov    0x4(%eax),%eax
c0102724:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0102727:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010272b:	74 09                	je     c0102736 <list_del+0x50>
c010272d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102730:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102733:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0102736:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010273a:	74 08                	je     c0102744 <list_del+0x5e>
c010273c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010273f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102742:	89 10                	mov    %edx,(%eax)
}
c0102744:	c9                   	leave  
c0102745:	c3                   	ret    

c0102746 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c0102746:	55                   	push   %ebp
c0102747:	89 e5                	mov    %esp,%ebp
c0102749:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c010274c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102750:	75 24                	jne    c0102776 <list_empty+0x30>
c0102752:	c7 44 24 0c 1c 43 10 	movl   $0xc010431c,0xc(%esp)
c0102759:	c0 
c010275a:	c7 44 24 08 f1 42 10 	movl   $0xc01042f1,0x8(%esp)
c0102761:	c0 
c0102762:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0102769:	00 
c010276a:	c7 04 24 06 43 10 c0 	movl   $0xc0104306,(%esp)
c0102771:	e8 3c 04 00 00       	call   c0102bb2 <_panic>
	return one == one->next;
c0102776:	8b 45 08             	mov    0x8(%ebp),%eax
c0102779:	8b 40 04             	mov    0x4(%eax),%eax
c010277c:	3b 45 08             	cmp    0x8(%ebp),%eax
c010277f:	0f 94 c0             	sete   %al
c0102782:	0f b6 c0             	movzbl %al,%eax
}
c0102785:	c9                   	leave  
c0102786:	c3                   	ret    

c0102787 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0102787:	55                   	push   %ebp
c0102788:	89 e5                	mov    %esp,%ebp
c010278a:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c010278d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102790:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0102795:	77 21                	ja     c01027b8 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0102797:	8b 45 10             	mov    0x10(%ebp),%eax
c010279a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010279e:	c7 44 24 08 28 43 10 	movl   $0xc0104328,0x8(%esp)
c01027a5:	c0 
c01027a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027a9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01027b0:	89 04 24             	mov    %eax,(%esp)
c01027b3:	e8 fa 03 00 00       	call   c0102bb2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c01027b8:	8b 45 10             	mov    0x10(%ebp),%eax
c01027bb:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01027c0:	c9                   	leave  
c01027c1:	c3                   	ret    

c01027c2 <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(int pan){
c01027c2:	55                   	push   %ebp
c01027c3:	89 e5                	mov    %esp,%ebp
c01027c5:	83 ec 38             	sub    $0x38,%esp
	if(pan==1){
c01027c8:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01027cc:	75 72                	jne    c0102840 <schedule+0x7e>
		list *one,*ne;
		list *bl=&block;
c01027ce:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
		//printk("Oh,Shit!!!");
		for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c01027d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027d8:	8b 40 04             	mov    0x4(%eax),%eax
c01027db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01027de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027e1:	8b 40 04             	mov    0x4(%eax),%eax
c01027e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01027e7:	eb 4f                	jmp    c0102838 <schedule+0x76>
			PCB *p=list_entry(one,PCB,plist);
c01027e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027ec:	83 e8 08             	sub    $0x8,%eax
c01027ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->timecount--;
c01027f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027f5:	8b 40 1c             	mov    0x1c(%eax),%eax
c01027f8:	8d 50 ff             	lea    -0x1(%eax),%edx
c01027fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027fe:	89 50 1c             	mov    %edx,0x1c(%eax)
			if(p->timecount==0){
c0102801:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102804:	8b 40 1c             	mov    0x1c(%eax),%eax
c0102807:	85 c0                	test   %eax,%eax
c0102809:	75 1e                	jne    c0102829 <schedule+0x67>
				list_del(one);
c010280b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010280e:	89 04 24             	mov    %eax,(%esp)
c0102811:	e8 d0 fe ff ff       	call   c01026e6 <list_del>
				list_add_before(&ready,one);
c0102816:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102819:	89 44 24 04          	mov    %eax,0x4(%esp)
c010281d:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102824:	e8 70 fe ff ff       	call   c0102699 <list_add_before>
void schedule(int pan){
	if(pan==1){
		list *one,*ne;
		list *bl=&block;
		//printk("Oh,Shit!!!");
		for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c0102829:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010282c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010282f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102832:	8b 40 04             	mov    0x4(%eax),%eax
c0102835:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010283b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c010283e:	75 a9                	jne    c01027e9 <schedule+0x27>
				list_del(one);
				list_add_before(&ready,one);
			}
		}
	}
	if(!list_empty(&ready)){
c0102840:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102847:	e8 fa fe ff ff       	call   c0102746 <list_empty>
c010284c:	85 c0                	test   %eax,%eax
c010284e:	75 7e                	jne    c01028ce <schedule+0x10c>
		list *re=&ready;
c0102850:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c0102857:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010285c:	8b 40 04             	mov    0x4(%eax),%eax
c010285f:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c0102862:	75 0d                	jne    c0102871 <schedule+0xaf>
			now=re->next;
c0102864:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102867:	8b 40 04             	mov    0x4(%eax),%eax
c010286a:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c010286f:	eb 0d                	jmp    c010287e <schedule+0xbc>
		else
			now=now->next;
c0102871:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102876:	8b 40 04             	mov    0x4(%eax),%eax
c0102879:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c010287e:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102883:	83 e8 08             	sub    $0x8,%eax
c0102886:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c010288b:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0102890:	05 f8 0f 00 00       	add    $0xff8,%eax
c0102895:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c0102898:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010289b:	89 04 24             	mov    %eax,(%esp)
c010289e:	e8 fe 01 00 00       	call   c0102aa1 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c01028a3:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01028a8:	8b 40 04             	mov    0x4(%eax),%eax
c01028ab:	89 44 24 08          	mov    %eax,0x8(%esp)
c01028af:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c01028b6:	00 
c01028b7:	c7 04 24 4c 43 10 c0 	movl   $0xc010434c,(%esp)
c01028be:	e8 c4 fe ff ff       	call   c0102787 <_paddr>
c01028c3:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c01028c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01028c9:	0f 22 d8             	mov    %eax,%cr3
c01028cc:	eb 3a                	jmp    c0102908 <schedule+0x146>
	}
	else{
		pcbnow=&init;
c01028ce:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01028d5:	3f 16 c0 
		now=&ready;
c01028d8:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c01028df:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c01028e2:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01028e7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01028eb:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c01028f2:	00 
c01028f3:	c7 04 24 4c 43 10 c0 	movl   $0xc010434c,(%esp)
c01028fa:	e8 88 fe ff ff       	call   c0102787 <_paddr>
c01028ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102902:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102905:	0f 22 d8             	mov    %eax,%cr3
	}
}
c0102908:	c9                   	leave  
c0102909:	c3                   	ret    

c010290a <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c010290a:	55                   	push   %ebp
c010290b:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c010290d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102910:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0102915:	8b 45 08             	mov    0x8(%ebp),%eax
c0102918:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c010291e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102921:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0102925:	8b 45 10             	mov    0x10(%ebp),%eax
c0102928:	83 e0 0f             	and    $0xf,%eax
c010292b:	89 c2                	mov    %eax,%edx
c010292d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102930:	89 d1                	mov    %edx,%ecx
c0102932:	83 e1 0f             	and    $0xf,%ecx
c0102935:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102939:	83 e2 f0             	and    $0xfffffff0,%edx
c010293c:	09 ca                	or     %ecx,%edx
c010293e:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c0102941:	8b 45 08             	mov    0x8(%ebp),%eax
c0102944:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102948:	83 ca 10             	or     $0x10,%edx
c010294b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c010294e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102951:	83 e0 03             	and    $0x3,%eax
c0102954:	89 c2                	mov    %eax,%edx
c0102956:	8b 45 08             	mov    0x8(%ebp),%eax
c0102959:	83 e2 03             	and    $0x3,%edx
c010295c:	89 d1                	mov    %edx,%ecx
c010295e:	c1 e1 05             	shl    $0x5,%ecx
c0102961:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102965:	83 e2 9f             	and    $0xffffff9f,%edx
c0102968:	09 ca                	or     %ecx,%edx
c010296a:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c010296d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102970:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102974:	83 ca 80             	or     $0xffffff80,%edx
c0102977:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c010297a:	8b 45 08             	mov    0x8(%ebp),%eax
c010297d:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102981:	83 ca 0f             	or     $0xf,%edx
c0102984:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102987:	8b 45 08             	mov    0x8(%ebp),%eax
c010298a:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010298e:	83 e2 ef             	and    $0xffffffef,%edx
c0102991:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102994:	8b 45 08             	mov    0x8(%ebp),%eax
c0102997:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010299b:	83 e2 df             	and    $0xffffffdf,%edx
c010299e:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c01029a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01029a4:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01029a8:	83 ca 40             	or     $0x40,%edx
c01029ab:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c01029ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01029b1:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01029b5:	83 ca 80             	or     $0xffffff80,%edx
c01029b8:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c01029bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01029be:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c01029c2:	5d                   	pop    %ebp
c01029c3:	c3                   	ret    

c01029c4 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c01029c4:	55                   	push   %ebp
c01029c5:	89 e5                	mov    %esp,%ebp
c01029c7:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c01029ca:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c01029d1:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c01029d4:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c01029db:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c01029e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01029e5:	89 c2                	mov    %eax,%edx
c01029e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01029ea:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c01029ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01029f0:	89 c2                	mov    %eax,%edx
c01029f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01029f5:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c01029f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01029fc:	c1 e8 10             	shr    $0x10,%eax
c01029ff:	89 c2                	mov    %eax,%edx
c0102a01:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a04:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c0102a07:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a0a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a0e:	83 e2 f0             	and    $0xfffffff0,%edx
c0102a11:	83 ca 09             	or     $0x9,%edx
c0102a14:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c0102a17:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a1a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a1e:	83 e2 ef             	and    $0xffffffef,%edx
c0102a21:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c0102a24:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a27:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a2b:	83 ca 60             	or     $0x60,%edx
c0102a2e:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102a31:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a34:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a38:	83 ca 80             	or     $0xffffff80,%edx
c0102a3b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102a3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102a41:	c1 e8 10             	shr    $0x10,%eax
c0102a44:	83 e0 0f             	and    $0xf,%eax
c0102a47:	89 c2                	mov    %eax,%edx
c0102a49:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a4c:	89 d1                	mov    %edx,%ecx
c0102a4e:	83 e1 0f             	and    $0xf,%ecx
c0102a51:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a55:	83 e2 f0             	and    $0xfffffff0,%edx
c0102a58:	09 ca                	or     %ecx,%edx
c0102a5a:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102a5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a60:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a64:	83 e2 ef             	and    $0xffffffef,%edx
c0102a67:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102a6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a6d:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a71:	83 e2 df             	and    $0xffffffdf,%edx
c0102a74:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102a77:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a7a:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a7e:	83 ca 40             	or     $0x40,%edx
c0102a81:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c0102a84:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a87:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a8b:	83 e2 7f             	and    $0x7f,%edx
c0102a8e:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c0102a91:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102a94:	c1 e8 18             	shr    $0x18,%eax
c0102a97:	89 c2                	mov    %eax,%edx
c0102a99:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a9c:	88 50 07             	mov    %dl,0x7(%eax)
}
c0102a9f:	c9                   	leave  
c0102aa0:	c3                   	ret    

c0102aa1 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c0102aa1:	55                   	push   %ebp
c0102aa2:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c0102aa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aa7:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c0102aac:	5d                   	pop    %ebp
c0102aad:	c3                   	ret    

c0102aae <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0102aae:	55                   	push   %ebp
c0102aaf:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0102ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ab4:	83 e8 01             	sub    $0x1,%eax
c0102ab7:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c0102abd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac0:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102ac6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac9:	c1 e8 10             	shr    $0x10,%eax
c0102acc:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c0102ad2:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c0102ad7:	0f 01 10             	lgdtl  (%eax)
}
c0102ada:	5d                   	pop    %ebp
c0102adb:	c3                   	ret    

c0102adc <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c0102adc:	55                   	push   %ebp
c0102add:	89 e5                	mov    %esp,%ebp
c0102adf:	83 ec 04             	sub    $0x4,%esp
c0102ae2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ae5:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c0102ae9:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102aed:	0f 00 d8             	ltr    %ax
}
c0102af0:	c9                   	leave  
c0102af1:	c3                   	ret    

c0102af2 <init_segment>:

void
init_segment(void) {
c0102af2:	55                   	push   %ebp
c0102af3:	89 e5                	mov    %esp,%ebp
c0102af5:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c0102af8:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c0102aff:	00 
c0102b00:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102b07:	00 
c0102b08:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102b0f:	e8 53 06 00 00       	call   c0103167 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c0102b14:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102b1b:	00 
c0102b1c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102b23:	00 
c0102b24:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c0102b2b:	e8 da fd ff ff       	call   c010290a <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0102b30:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102b37:	00 
c0102b38:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102b3f:	00 
c0102b40:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c0102b47:	e8 be fd ff ff       	call   c010290a <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0102b4c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102b53:	00 
c0102b54:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102b5b:	00 
c0102b5c:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c0102b63:	e8 a2 fd ff ff       	call   c010290a <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c0102b68:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102b6f:	00 
c0102b70:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102b77:	00 
c0102b78:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c0102b7f:	e8 86 fd ff ff       	call   c010290a <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0102b84:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c0102b8b:	00 
c0102b8c:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102b93:	e8 16 ff ff ff       	call   c0102aae <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c0102b98:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c0102b9f:	e8 20 fe ff ff       	call   c01029c4 <set_tss>
	load_tr(USEL(SEG_TSS));
c0102ba4:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c0102bab:	e8 2c ff ff ff       	call   c0102adc <load_tr>
}
c0102bb0:	c9                   	leave  
c0102bb1:	c3                   	ret    

c0102bb2 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c0102bb2:	55                   	push   %ebp
c0102bb3:	89 e5                	mov    %esp,%ebp
c0102bb5:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c0102bb8:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c0102bbd:	85 c0                	test   %eax,%eax
c0102bbf:	74 01                	je     c0102bc2 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0102bc1:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c0102bc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0102bc5:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c0102bca:	fa                   	cli    
c0102bcb:	fc                   	cld    

	va_start(ap, fmt);
c0102bcc:	8d 45 14             	lea    0x14(%ebp),%eax
c0102bcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0102bd2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bd5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102bd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bdc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102be0:	c7 04 24 64 43 10 c0 	movl   $0xc0104364,(%esp)
c0102be7:	e8 f5 00 00 00       	call   c0102ce1 <printk>
	vprintk(fmt, ap);
c0102bec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102bef:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102bf3:	8b 45 10             	mov    0x10(%ebp),%eax
c0102bf6:	89 04 24             	mov    %eax,(%esp)
c0102bf9:	e8 b0 00 00 00       	call   c0102cae <vprintk>
	printk("\n");
c0102bfe:	c7 04 24 7c 43 10 c0 	movl   $0xc010437c,(%esp)
c0102c05:	e8 d7 00 00 00       	call   c0102ce1 <printk>
	va_end(ap);

}
c0102c0a:	c9                   	leave  
c0102c0b:	c3                   	ret    

c0102c0c <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c0102c0c:	55                   	push   %ebp
c0102c0d:	89 e5                	mov    %esp,%ebp
c0102c0f:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102c12:	8d 45 14             	lea    0x14(%ebp),%eax
c0102c15:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c0102c18:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c1b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c22:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c26:	c7 04 24 7e 43 10 c0 	movl   $0xc010437e,(%esp)
c0102c2d:	e8 af 00 00 00       	call   c0102ce1 <printk>
	vprintk(fmt, ap);
c0102c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c35:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c39:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c3c:	89 04 24             	mov    %eax,(%esp)
c0102c3f:	e8 6a 00 00 00       	call   c0102cae <vprintk>
	printk("\n");
c0102c44:	c7 04 24 7c 43 10 c0 	movl   $0xc010437c,(%esp)
c0102c4b:	e8 91 00 00 00       	call   c0102ce1 <printk>
	va_end(ap);
}
c0102c50:	c9                   	leave  
c0102c51:	c3                   	ret    

c0102c52 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0102c52:	55                   	push   %ebp
c0102c53:	89 e5                	mov    %esp,%ebp
c0102c55:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0102c58:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102c5c:	75 2b                	jne    c0102c89 <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0102c5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102c65:	eb 1a                	jmp    c0102c81 <sys_write+0x2f>
			serial_printc(buf[i]);
c0102c67:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c6d:	01 d0                	add    %edx,%eax
c0102c6f:	0f b6 00             	movzbl (%eax),%eax
c0102c72:	0f be c0             	movsbl %al,%eax
c0102c75:	89 04 24             	mov    %eax,(%esp)
c0102c78:	e8 d8 de ff ff       	call   c0100b55 <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0102c7d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c84:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102c87:	7c de                	jl     c0102c67 <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c0102c89:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c8c:	c9                   	leave  
c0102c8d:	c3                   	ret    

c0102c8e <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c0102c8e:	55                   	push   %ebp
c0102c8f:	89 e5                	mov    %esp,%ebp
c0102c91:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c0102c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c97:	89 04 24             	mov    %eax,(%esp)
c0102c9a:	e8 e0 de ff ff       	call   c0100b7f <putchar>
	++*cnt;
c0102c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ca2:	8b 00                	mov    (%eax),%eax
c0102ca4:	8d 50 01             	lea    0x1(%eax),%edx
c0102ca7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102caa:	89 10                	mov    %edx,(%eax)
}
c0102cac:	c9                   	leave  
c0102cad:	c3                   	ret    

c0102cae <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0102cae:	55                   	push   %ebp
c0102caf:	89 e5                	mov    %esp,%ebp
c0102cb1:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102cb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c0102cbb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cbe:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102cc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cc5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102cc9:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102ccc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cd0:	c7 04 24 8e 2c 10 c0 	movl   $0xc0102c8e,(%esp)
c0102cd7:	e8 93 0a 00 00       	call   c010376f <vprintfmt>
	return cnt;
c0102cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102cdf:	c9                   	leave  
c0102ce0:	c3                   	ret    

c0102ce1 <printk>:

int printk(const char *fmt, ...)
{
c0102ce1:	55                   	push   %ebp
c0102ce2:	89 e5                	mov    %esp,%ebp
c0102ce4:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0102ce7:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102cea:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c0102ced:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102cf0:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cf4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cf7:	89 04 24             	mov    %eax,(%esp)
c0102cfa:	e8 af ff ff ff       	call   c0102cae <vprintk>
c0102cff:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102d02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d05:	c9                   	leave  
c0102d06:	c3                   	ret    

c0102d07 <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0102d07:	6a 00                	push   $0x0
c0102d09:	6a 00                	push   $0x0
c0102d0b:	e9 a9 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d10 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102d10:	6a 00                	push   $0x0
c0102d12:	6a 01                	push   $0x1
c0102d14:	e9 a0 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d19 <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c0102d19:	6a 00                	push   $0x0
c0102d1b:	6a 02                	push   $0x2
c0102d1d:	e9 97 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d22 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102d22:	6a 00                	push   $0x0
c0102d24:	6a 03                	push   $0x3
c0102d26:	e9 8e 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d2b <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c0102d2b:	6a 00                	push   $0x0
c0102d2d:	6a 04                	push   $0x4
c0102d2f:	e9 85 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d34 <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102d34:	6a 00                	push   $0x0
c0102d36:	6a 05                	push   $0x5
c0102d38:	e9 7c 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d3d <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0102d3d:	6a 00                	push   $0x0
c0102d3f:	6a 06                	push   $0x6
c0102d41:	e9 73 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d46 <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0102d46:	6a 00                	push   $0x0
c0102d48:	6a 07                	push   $0x7
c0102d4a:	e9 6a 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d4f <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0102d4f:	6a 08                	push   $0x8
c0102d51:	e9 63 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d56 <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c0102d56:	6a 00                	push   $0x0
c0102d58:	6a 09                	push   $0x9
c0102d5a:	e9 5a 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d5f <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0102d5f:	6a 0a                	push   $0xa
c0102d61:	e9 53 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d66 <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c0102d66:	6a 0b                	push   $0xb
c0102d68:	e9 4c 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d6d <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0102d6d:	6a 0c                	push   $0xc
c0102d6f:	e9 45 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d74 <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c0102d74:	6a 0d                	push   $0xd
c0102d76:	e9 3e 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d7b <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c0102d7b:	6a 0e                	push   $0xe
c0102d7d:	e9 37 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d82 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c0102d82:	6a 00                	push   $0x0
c0102d84:	68 80 00 00 00       	push   $0x80
c0102d89:	e9 2b 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d8e <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c0102d8e:	6a 00                	push   $0x0
c0102d90:	68 e8 03 00 00       	push   $0x3e8
c0102d95:	e9 1f 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102d9a <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c0102d9a:	6a 00                	push   $0x0
c0102d9c:	68 e9 03 00 00       	push   $0x3e9
c0102da1:	e9 13 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102da6 <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c0102da6:	6a 00                	push   $0x0
c0102da8:	68 f6 03 00 00       	push   $0x3f6
c0102dad:	e9 07 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102db2 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c0102db2:	6a ff                	push   $0xffffffff
c0102db4:	e9 00 00 00 00       	jmp    c0102db9 <asm_do_irq>

c0102db9 <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c0102db9:	fa                   	cli    
	pushl %ds
c0102dba:	1e                   	push   %ds
  	pushl %es
c0102dbb:	06                   	push   %es
  	pushl %fs
c0102dbc:	0f a0                	push   %fs
  	pushl %gs
c0102dbe:	0f a8                	push   %gs
	pushal
c0102dc0:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0102dc1:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c0102dc5:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c0102dc7:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c0102dc9:	54                   	push   %esp
	call irq_handle
c0102dca:	e8 ef d9 ff ff       	call   c01007be <irq_handle>
	movl pcbnow,%eax
c0102dcf:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c0102dd4:	8b 20                	mov    (%eax),%esp
	popal
c0102dd6:	61                   	popa   
	popl %gs
c0102dd7:	0f a9                	pop    %gs
  	popl %fs
c0102dd9:	0f a1                	pop    %fs
  	popl %es
c0102ddb:	07                   	pop    %es
  	popl %ds
c0102ddc:	1f                   	pop    %ds
	addl $8, %esp
c0102ddd:	83 c4 08             	add    $0x8,%esp
	sti
c0102de0:	fb                   	sti    
	iret
c0102de1:	cf                   	iret   
c0102de2:	66 90                	xchg   %ax,%ax
c0102de4:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c0102dea:	00 00                	add    %al,(%eax)
c0102dec:	fe 4f 52             	decb   0x52(%edi)
c0102def:	e4 66                	in     $0x66,%al

c0102df0 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102df0:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0102df7:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0102df9:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c0102dfe:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102e01:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102e04:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0102e09:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0102e0c:	b8 13 2e 10 c0       	mov    $0xc0102e13,%eax
	jmp	*%eax
c0102e11:	ff e0                	jmp    *%eax

c0102e13 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102e13:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0102e18:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c0102e1d:	e8 c5 d3 ff ff       	call   c01001e7 <main>

c0102e22 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102e22:	eb fe                	jmp    c0102e22 <spin>

c0102e24 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102e24:	55                   	push   %ebp
c0102e25:	89 e5                	mov    %esp,%ebp
c0102e27:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0102e2a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102e2e:	78 18                	js     c0102e48 <draw_pixel+0x24>
c0102e30:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102e34:	78 12                	js     c0102e48 <draw_pixel+0x24>
c0102e36:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102e3d:	7f 09                	jg     c0102e48 <draw_pixel+0x24>
c0102e3f:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102e46:	7e 24                	jle    c0102e6c <draw_pixel+0x48>
c0102e48:	c7 44 24 0c 98 43 10 	movl   $0xc0104398,0xc(%esp)
c0102e4f:	c0 
c0102e50:	c7 44 24 08 cc 43 10 	movl   $0xc01043cc,0x8(%esp)
c0102e57:	c0 
c0102e58:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
c0102e5f:	00 
c0102e60:	c7 04 24 e1 43 10 c0 	movl   $0xc01043e1,(%esp)
c0102e67:	e8 46 fd ff ff       	call   c0102bb2 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0102e6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e6f:	c1 e0 08             	shl    $0x8,%eax
c0102e72:	89 c2                	mov    %eax,%edx
c0102e74:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e77:	c1 e0 06             	shl    $0x6,%eax
c0102e7a:	01 c2                	add    %eax,%edx
c0102e7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e7f:	01 c2                	add    %eax,%edx
c0102e81:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e84:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c0102e8a:	c9                   	leave  
c0102e8b:	c3                   	ret    

c0102e8c <sysclean>:


void sysclean(void)
{
c0102e8c:	55                   	push   %ebp
c0102e8d:	89 e5                	mov    %esp,%ebp
c0102e8f:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c0102e92:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0102e99:	00 
c0102e9a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102ea1:	00 
c0102ea2:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c0102ea9:	e8 b9 02 00 00       	call   c0103167 <memset>
}
c0102eae:	c9                   	leave  
c0102eaf:	c3                   	ret    

c0102eb0 <syspr>:
int syspr()
{
c0102eb0:	55                   	push   %ebp
c0102eb1:	89 e5                	mov    %esp,%ebp
c0102eb3:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c0102eb6:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0102ebd:	c0 
c0102ebe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102ec5:	e8 53 01 00 00       	call   c010301d <syscall>
}
c0102eca:	c9                   	leave  
c0102ecb:	c3                   	ret    

c0102ecc <systime>:

int systime(void)
{
c0102ecc:	55                   	push   %ebp
c0102ecd:	89 e5                	mov    %esp,%ebp
c0102ecf:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c0102ed2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102ed9:	e8 3f 01 00 00       	call   c010301d <syscall>
}
c0102ede:	c9                   	leave  
c0102edf:	c3                   	ret    

c0102ee0 <sysreadkey>:

int sysreadkey(void)
{
c0102ee0:	55                   	push   %ebp
c0102ee1:	89 e5                	mov    %esp,%ebp
c0102ee3:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c0102ee6:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0102eed:	e8 2b 01 00 00       	call   c010301d <syscall>
}
c0102ef2:	c9                   	leave  
c0102ef3:	c3                   	ret    

c0102ef4 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0102ef4:	55                   	push   %ebp
c0102ef5:	89 e5                	mov    %esp,%ebp
c0102ef7:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c0102efa:	8b 45 10             	mov    0x10(%ebp),%eax
c0102efd:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102f01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f04:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f08:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f0b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f0f:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0102f16:	e8 02 01 00 00       	call   c010301d <syscall>
}
c0102f1b:	c9                   	leave  
c0102f1c:	c3                   	ret    

c0102f1d <fork>:

int fork(void)
{
c0102f1d:	55                   	push   %ebp
c0102f1e:	89 e5                	mov    %esp,%ebp
c0102f20:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c0102f23:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0102f2a:	e8 ee 00 00 00       	call   c010301d <syscall>
}
c0102f2f:	c9                   	leave  
c0102f30:	c3                   	ret    

c0102f31 <getpid>:

int getpid(void)
{
c0102f31:	55                   	push   %ebp
c0102f32:	89 e5                	mov    %esp,%ebp
c0102f34:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c0102f37:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0102f3e:	e8 da 00 00 00       	call   c010301d <syscall>
}
c0102f43:	c9                   	leave  
c0102f44:	c3                   	ret    

c0102f45 <exit>:

void exit(void)
{
c0102f45:	55                   	push   %ebp
c0102f46:	89 e5                	mov    %esp,%ebp
c0102f48:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit);
c0102f4b:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c0102f52:	e8 c6 00 00 00       	call   c010301d <syscall>
}
c0102f57:	c9                   	leave  
c0102f58:	c3                   	ret    

c0102f59 <sleep>:

void sleep(int sec)
{
c0102f59:	55                   	push   %ebp
c0102f5a:	89 e5                	mov    %esp,%ebp
c0102f5c:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c0102f5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f62:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f66:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0102f6d:	e8 ab 00 00 00       	call   c010301d <syscall>
	//printf("qweqwe");
}
c0102f72:	c9                   	leave  
c0102f73:	c3                   	ret    

c0102f74 <thread>:

int thread(void *addr)
{
c0102f74:	55                   	push   %ebp
c0102f75:	89 e5                	mov    %esp,%ebp
c0102f77:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
c0102f7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f7d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f81:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
c0102f88:	e8 90 00 00 00       	call   c010301d <syscall>
}
c0102f8d:	c9                   	leave  
c0102f8e:	c3                   	ret    

c0102f8f <sem_init>:

int sem_init(Sema *sema,int value)
{
c0102f8f:	55                   	push   %ebp
c0102f90:	89 e5                	mov    %esp,%ebp
c0102f92:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema,value);
c0102f95:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f98:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f9f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fa3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
c0102faa:	e8 6e 00 00 00       	call   c010301d <syscall>
}
c0102faf:	c9                   	leave  
c0102fb0:	c3                   	ret    

c0102fb1 <sem_destroy>:

int sem_destroy(Sema *sema)
{
c0102fb1:	55                   	push   %ebp
c0102fb2:	89 e5                	mov    %esp,%ebp
c0102fb4:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
c0102fb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fba:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fbe:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
c0102fc5:	e8 53 00 00 00       	call   c010301d <syscall>
}
c0102fca:	c9                   	leave  
c0102fcb:	c3                   	ret    

c0102fcc <sem_wait>:

int sem_wait(Sema *sema)
{
c0102fcc:	55                   	push   %ebp
c0102fcd:	89 e5                	mov    %esp,%ebp
c0102fcf:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
c0102fd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fd5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fd9:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
c0102fe0:	e8 38 00 00 00       	call   c010301d <syscall>
}
c0102fe5:	c9                   	leave  
c0102fe6:	c3                   	ret    

c0102fe7 <sem_trywait>:

int sem_trywait(Sema *sema)
{
c0102fe7:	55                   	push   %ebp
c0102fe8:	89 e5                	mov    %esp,%ebp
c0102fea:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
c0102fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ff0:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ff4:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
c0102ffb:	e8 1d 00 00 00       	call   c010301d <syscall>
}
c0103000:	c9                   	leave  
c0103001:	c3                   	ret    

c0103002 <sem_post>:

int sem_post(Sema *sema)
{
c0103002:	55                   	push   %ebp
c0103003:	89 e5                	mov    %esp,%ebp
c0103005:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
c0103008:	8b 45 08             	mov    0x8(%ebp),%eax
c010300b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010300f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
c0103016:	e8 02 00 00 00       	call   c010301d <syscall>
}
c010301b:	c9                   	leave  
c010301c:	c3                   	ret    

c010301d <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c010301d:	55                   	push   %ebp
c010301e:	89 e5                	mov    %esp,%ebp
c0103020:	53                   	push   %ebx
c0103021:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0103024:	8d 45 08             	lea    0x8(%ebp),%eax
c0103027:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c010302a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010302d:	8b 00                	mov    (%eax),%eax
c010302f:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0103032:	83 c2 04             	add    $0x4,%edx
c0103035:	8b 1a                	mov    (%edx),%ebx
c0103037:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010303a:	83 c2 08             	add    $0x8,%edx
c010303d:	8b 0a                	mov    (%edx),%ecx
c010303f:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0103042:	83 c2 0c             	add    $0xc,%edx
c0103045:	8b 12                	mov    (%edx),%edx
c0103047:	cd 80                	int    $0x80
c0103049:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c010304c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c010304f:	83 c4 10             	add    $0x10,%esp
c0103052:	5b                   	pop    %ebx
c0103053:	5d                   	pop    %ebp
c0103054:	c3                   	ret    

c0103055 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0103055:	55                   	push   %ebp
c0103056:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0103058:	8b 45 0c             	mov    0xc(%ebp),%eax
c010305b:	8b 00                	mov    (%eax),%eax
c010305d:	8d 48 01             	lea    0x1(%eax),%ecx
c0103060:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103063:	89 0a                	mov    %ecx,(%edx)
c0103065:	8b 55 08             	mov    0x8(%ebp),%edx
c0103068:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c010306e:	5d                   	pop    %ebp
c010306f:	c3                   	ret    

c0103070 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0103070:	55                   	push   %ebp
c0103071:	89 e5                	mov    %esp,%ebp
c0103073:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0103076:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c010307d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103080:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103084:	8b 45 08             	mov    0x8(%ebp),%eax
c0103087:	89 44 24 08          	mov    %eax,0x8(%esp)
c010308b:	8d 45 f4             	lea    -0xc(%ebp),%eax
c010308e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103092:	c7 04 24 55 30 10 c0 	movl   $0xc0103055,(%esp)
c0103099:	e8 d1 06 00 00       	call   c010376f <vprintfmt>
	return cnt;
c010309e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01030a1:	c9                   	leave  
c01030a2:	c3                   	ret    

c01030a3 <printf>:
int printf(const char *fmt, ...)
{
c01030a3:	55                   	push   %ebp
c01030a4:	89 e5                	mov    %esp,%ebp
c01030a6:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c01030a9:	8d 45 0c             	lea    0xc(%ebp),%eax
c01030ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c01030af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030b2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01030b9:	89 04 24             	mov    %eax,(%esp)
c01030bc:	e8 af ff ff ff       	call   c0103070 <vprintf>
c01030c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c01030c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01030c7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030cb:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c01030d2:	c0 
c01030d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01030da:	e8 15 fe ff ff       	call   c0102ef4 <syswrite>
	return cnt;
c01030df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01030e2:	c9                   	leave  
c01030e3:	c3                   	ret    

c01030e4 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c01030e4:	55                   	push   %ebp
c01030e5:	89 e5                	mov    %esp,%ebp
c01030e7:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c01030ea:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c01030f1:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c01030f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01030f8:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01030fd:	89 c8                	mov    %ecx,%eax
c01030ff:	f7 ea                	imul   %edx
c0103101:	c1 fa 02             	sar    $0x2,%edx
c0103104:	89 c8                	mov    %ecx,%eax
c0103106:	c1 f8 1f             	sar    $0x1f,%eax
c0103109:	29 c2                	sub    %eax,%edx
c010310b:	89 d0                	mov    %edx,%eax
c010310d:	c1 e0 02             	shl    $0x2,%eax
c0103110:	01 d0                	add    %edx,%eax
c0103112:	01 c0                	add    %eax,%eax
c0103114:	29 c1                	sub    %eax,%ecx
c0103116:	89 ca                	mov    %ecx,%edx
c0103118:	89 d0                	mov    %edx,%eax
c010311a:	83 c0 30             	add    $0x30,%eax
c010311d:	89 c2                	mov    %eax,%edx
c010311f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103122:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0103124:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103127:	ba 67 66 66 66       	mov    $0x66666667,%edx
c010312c:	89 c8                	mov    %ecx,%eax
c010312e:	f7 ea                	imul   %edx
c0103130:	c1 fa 02             	sar    $0x2,%edx
c0103133:	89 c8                	mov    %ecx,%eax
c0103135:	c1 f8 1f             	sar    $0x1f,%eax
c0103138:	29 c2                	sub    %eax,%edx
c010313a:	89 d0                	mov    %edx,%eax
c010313c:	89 45 08             	mov    %eax,0x8(%ebp)
c010313f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103143:	75 ac                	jne    c01030f1 <itoa+0xd>
	return p;
c0103145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0103148:	c9                   	leave  
c0103149:	c3                   	ret    

c010314a <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c010314a:	55                   	push   %ebp
c010314b:	89 e5                	mov    %esp,%ebp
c010314d:	57                   	push   %edi
c010314e:	56                   	push   %esi
c010314f:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0103150:	8b 45 10             	mov    0x10(%ebp),%eax
c0103153:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103156:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0103159:	89 c1                	mov    %eax,%ecx
c010315b:	89 d6                	mov    %edx,%esi
c010315d:	89 df                	mov    %ebx,%edi
c010315f:	fc                   	cld    
c0103160:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0103162:	5b                   	pop    %ebx
c0103163:	5e                   	pop    %esi
c0103164:	5f                   	pop    %edi
c0103165:	5d                   	pop    %ebp
c0103166:	c3                   	ret    

c0103167 <memset>:

void memset(void *dest, int data, size_t size) {
c0103167:	55                   	push   %ebp
c0103168:	89 e5                	mov    %esp,%ebp
c010316a:	57                   	push   %edi
c010316b:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c010316c:	8b 55 10             	mov    0x10(%ebp),%edx
c010316f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103172:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0103175:	89 d1                	mov    %edx,%ecx
c0103177:	89 df                	mov    %ebx,%edi
c0103179:	fc                   	cld    
c010317a:	f3 aa                	rep stos %al,%es:(%edi)
}
c010317c:	5b                   	pop    %ebx
c010317d:	5f                   	pop    %edi
c010317e:	5d                   	pop    %ebp
c010317f:	c3                   	ret    

c0103180 <strlen>:

size_t strlen(const char *str) {
c0103180:	55                   	push   %ebp
c0103181:	89 e5                	mov    %esp,%ebp
c0103183:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0103186:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c010318d:	eb 04                	jmp    c0103193 <strlen+0x13>
c010318f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0103193:	8b 45 08             	mov    0x8(%ebp),%eax
c0103196:	8d 50 01             	lea    0x1(%eax),%edx
c0103199:	89 55 08             	mov    %edx,0x8(%ebp)
c010319c:	0f b6 00             	movzbl (%eax),%eax
c010319f:	84 c0                	test   %al,%al
c01031a1:	75 ec                	jne    c010318f <strlen+0xf>
	return len;
c01031a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01031a6:	c9                   	leave  
c01031a7:	c3                   	ret    

c01031a8 <strcpy>:

void strcpy(char *d, const char *s) {
c01031a8:	55                   	push   %ebp
c01031a9:	89 e5                	mov    %esp,%ebp
c01031ab:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c01031ae:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031b1:	89 04 24             	mov    %eax,(%esp)
c01031b4:	e8 c7 ff ff ff       	call   c0103180 <strlen>
c01031b9:	83 c0 01             	add    $0x1,%eax
c01031bc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031c3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ca:	89 04 24             	mov    %eax,(%esp)
c01031cd:	e8 78 ff ff ff       	call   c010314a <memcpy>
}
c01031d2:	c9                   	leave  
c01031d3:	c3                   	ret    

c01031d4 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c01031d4:	55                   	push   %ebp
c01031d5:	89 e5                	mov    %esp,%ebp
c01031d7:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c01031da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01031e1:	eb 0c                	jmp    c01031ef <strnlen+0x1b>
		n++;
c01031e3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c01031e7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01031eb:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01031ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01031f3:	74 0a                	je     c01031ff <strnlen+0x2b>
c01031f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01031f8:	0f b6 00             	movzbl (%eax),%eax
c01031fb:	84 c0                	test   %al,%al
c01031fd:	75 e4                	jne    c01031e3 <strnlen+0xf>
		n++;
	return n;
c01031ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0103202:	c9                   	leave  
c0103203:	c3                   	ret    

c0103204 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0103204:	55                   	push   %ebp
c0103205:	89 e5                	mov    %esp,%ebp
c0103207:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c010320a:	8b 45 08             	mov    0x8(%ebp),%eax
c010320d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0103210:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0103217:	eb 23                	jmp    c010323c <strncpy+0x38>
		*dst++ = *src;
c0103219:	8b 45 08             	mov    0x8(%ebp),%eax
c010321c:	8d 50 01             	lea    0x1(%eax),%edx
c010321f:	89 55 08             	mov    %edx,0x8(%ebp)
c0103222:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103225:	0f b6 12             	movzbl (%edx),%edx
c0103228:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c010322a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010322d:	0f b6 00             	movzbl (%eax),%eax
c0103230:	84 c0                	test   %al,%al
c0103232:	74 04                	je     c0103238 <strncpy+0x34>
			src++;
c0103234:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c0103238:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010323c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010323f:	3b 45 10             	cmp    0x10(%ebp),%eax
c0103242:	72 d5                	jb     c0103219 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c0103244:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0103247:	c9                   	leave  
c0103248:	c3                   	ret    

c0103249 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c0103249:	55                   	push   %ebp
c010324a:	89 e5                	mov    %esp,%ebp
c010324c:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c010324f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103252:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0103255:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103259:	74 33                	je     c010328e <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c010325b:	eb 17                	jmp    c0103274 <strlcpy+0x2b>
			*dst++ = *src++;
c010325d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103260:	8d 50 01             	lea    0x1(%eax),%edx
c0103263:	89 55 08             	mov    %edx,0x8(%ebp)
c0103266:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103269:	8d 4a 01             	lea    0x1(%edx),%ecx
c010326c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c010326f:	0f b6 12             	movzbl (%edx),%edx
c0103272:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0103274:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103278:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010327c:	74 0a                	je     c0103288 <strlcpy+0x3f>
c010327e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103281:	0f b6 00             	movzbl (%eax),%eax
c0103284:	84 c0                	test   %al,%al
c0103286:	75 d5                	jne    c010325d <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0103288:	8b 45 08             	mov    0x8(%ebp),%eax
c010328b:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c010328e:	8b 55 08             	mov    0x8(%ebp),%edx
c0103291:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103294:	29 c2                	sub    %eax,%edx
c0103296:	89 d0                	mov    %edx,%eax
}
c0103298:	c9                   	leave  
c0103299:	c3                   	ret    

c010329a <strcmp>:

int
strcmp(const char *p, const char *q)
{
c010329a:	55                   	push   %ebp
c010329b:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c010329d:	eb 08                	jmp    c01032a7 <strcmp+0xd>
		p++, q++;
c010329f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01032a3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c01032a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01032aa:	0f b6 00             	movzbl (%eax),%eax
c01032ad:	84 c0                	test   %al,%al
c01032af:	74 10                	je     c01032c1 <strcmp+0x27>
c01032b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01032b4:	0f b6 10             	movzbl (%eax),%edx
c01032b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032ba:	0f b6 00             	movzbl (%eax),%eax
c01032bd:	38 c2                	cmp    %al,%dl
c01032bf:	74 de                	je     c010329f <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c01032c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01032c4:	0f b6 00             	movzbl (%eax),%eax
c01032c7:	0f b6 d0             	movzbl %al,%edx
c01032ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032cd:	0f b6 00             	movzbl (%eax),%eax
c01032d0:	0f b6 c0             	movzbl %al,%eax
c01032d3:	29 c2                	sub    %eax,%edx
c01032d5:	89 d0                	mov    %edx,%eax
}
c01032d7:	5d                   	pop    %ebp
c01032d8:	c3                   	ret    

c01032d9 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c01032d9:	55                   	push   %ebp
c01032da:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c01032dc:	eb 0c                	jmp    c01032ea <strncmp+0x11>
		n--, p++, q++;
c01032de:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01032e2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01032e6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c01032ea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01032ee:	74 1a                	je     c010330a <strncmp+0x31>
c01032f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01032f3:	0f b6 00             	movzbl (%eax),%eax
c01032f6:	84 c0                	test   %al,%al
c01032f8:	74 10                	je     c010330a <strncmp+0x31>
c01032fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01032fd:	0f b6 10             	movzbl (%eax),%edx
c0103300:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103303:	0f b6 00             	movzbl (%eax),%eax
c0103306:	38 c2                	cmp    %al,%dl
c0103308:	74 d4                	je     c01032de <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c010330a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010330e:	75 07                	jne    c0103317 <strncmp+0x3e>
		return 0;
c0103310:	b8 00 00 00 00       	mov    $0x0,%eax
c0103315:	eb 16                	jmp    c010332d <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c0103317:	8b 45 08             	mov    0x8(%ebp),%eax
c010331a:	0f b6 00             	movzbl (%eax),%eax
c010331d:	0f b6 d0             	movzbl %al,%edx
c0103320:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103323:	0f b6 00             	movzbl (%eax),%eax
c0103326:	0f b6 c0             	movzbl %al,%eax
c0103329:	29 c2                	sub    %eax,%edx
c010332b:	89 d0                	mov    %edx,%eax
}
c010332d:	5d                   	pop    %ebp
c010332e:	c3                   	ret    

c010332f <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c010332f:	55                   	push   %ebp
c0103330:	89 e5                	mov    %esp,%ebp
c0103332:	83 ec 04             	sub    $0x4,%esp
c0103335:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103338:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c010333b:	eb 14                	jmp    c0103351 <strchr+0x22>
		if (*s == c)
c010333d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103340:	0f b6 00             	movzbl (%eax),%eax
c0103343:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0103346:	75 05                	jne    c010334d <strchr+0x1e>
			return (char *) s;
c0103348:	8b 45 08             	mov    0x8(%ebp),%eax
c010334b:	eb 13                	jmp    c0103360 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c010334d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103351:	8b 45 08             	mov    0x8(%ebp),%eax
c0103354:	0f b6 00             	movzbl (%eax),%eax
c0103357:	84 c0                	test   %al,%al
c0103359:	75 e2                	jne    c010333d <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c010335b:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0103360:	c9                   	leave  
c0103361:	c3                   	ret    

c0103362 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c0103362:	55                   	push   %ebp
c0103363:	89 e5                	mov    %esp,%ebp
c0103365:	83 ec 04             	sub    $0x4,%esp
c0103368:	8b 45 0c             	mov    0xc(%ebp),%eax
c010336b:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c010336e:	eb 11                	jmp    c0103381 <strfind+0x1f>
		if (*s == c)
c0103370:	8b 45 08             	mov    0x8(%ebp),%eax
c0103373:	0f b6 00             	movzbl (%eax),%eax
c0103376:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0103379:	75 02                	jne    c010337d <strfind+0x1b>
			break;
c010337b:	eb 0e                	jmp    c010338b <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c010337d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103381:	8b 45 08             	mov    0x8(%ebp),%eax
c0103384:	0f b6 00             	movzbl (%eax),%eax
c0103387:	84 c0                	test   %al,%al
c0103389:	75 e5                	jne    c0103370 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c010338b:	8b 45 08             	mov    0x8(%ebp),%eax
}
c010338e:	c9                   	leave  
c010338f:	c3                   	ret    

c0103390 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c0103390:	55                   	push   %ebp
c0103391:	89 e5                	mov    %esp,%ebp
c0103393:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0103396:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103399:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c010339c:	8b 45 08             	mov    0x8(%ebp),%eax
c010339f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c01033a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01033a5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01033a8:	73 3d                	jae    c01033e7 <memmove+0x57>
c01033aa:	8b 45 10             	mov    0x10(%ebp),%eax
c01033ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01033b0:	01 d0                	add    %edx,%eax
c01033b2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01033b5:	76 30                	jbe    c01033e7 <memmove+0x57>
		s += n;
c01033b7:	8b 45 10             	mov    0x10(%ebp),%eax
c01033ba:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c01033bd:	8b 45 10             	mov    0x10(%ebp),%eax
c01033c0:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c01033c3:	eb 13                	jmp    c01033d8 <memmove+0x48>
			*--d = *--s;
c01033c5:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c01033c9:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c01033cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01033d0:	0f b6 10             	movzbl (%eax),%edx
c01033d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01033d6:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c01033d8:	8b 45 10             	mov    0x10(%ebp),%eax
c01033db:	8d 50 ff             	lea    -0x1(%eax),%edx
c01033de:	89 55 10             	mov    %edx,0x10(%ebp)
c01033e1:	85 c0                	test   %eax,%eax
c01033e3:	75 e0                	jne    c01033c5 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c01033e5:	eb 26                	jmp    c010340d <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c01033e7:	eb 17                	jmp    c0103400 <memmove+0x70>
			*d++ = *s++;
c01033e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01033ec:	8d 50 01             	lea    0x1(%eax),%edx
c01033ef:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01033f2:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01033f5:	8d 4a 01             	lea    0x1(%edx),%ecx
c01033f8:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c01033fb:	0f b6 12             	movzbl (%edx),%edx
c01033fe:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0103400:	8b 45 10             	mov    0x10(%ebp),%eax
c0103403:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103406:	89 55 10             	mov    %edx,0x10(%ebp)
c0103409:	85 c0                	test   %eax,%eax
c010340b:	75 dc                	jne    c01033e9 <memmove+0x59>
			*d++ = *s++;

	return dst;
c010340d:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0103410:	c9                   	leave  
c0103411:	c3                   	ret    

c0103412 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0103412:	55                   	push   %ebp
c0103413:	89 e5                	mov    %esp,%ebp
c0103415:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c0103418:	8b 45 08             	mov    0x8(%ebp),%eax
c010341b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c010341e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103421:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0103424:	eb 30                	jmp    c0103456 <memcmp+0x44>
		if (*s1 != *s2)
c0103426:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103429:	0f b6 10             	movzbl (%eax),%edx
c010342c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010342f:	0f b6 00             	movzbl (%eax),%eax
c0103432:	38 c2                	cmp    %al,%dl
c0103434:	74 18                	je     c010344e <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c0103436:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103439:	0f b6 00             	movzbl (%eax),%eax
c010343c:	0f b6 d0             	movzbl %al,%edx
c010343f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103442:	0f b6 00             	movzbl (%eax),%eax
c0103445:	0f b6 c0             	movzbl %al,%eax
c0103448:	29 c2                	sub    %eax,%edx
c010344a:	89 d0                	mov    %edx,%eax
c010344c:	eb 1a                	jmp    c0103468 <memcmp+0x56>
		s1++, s2++;
c010344e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0103452:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c0103456:	8b 45 10             	mov    0x10(%ebp),%eax
c0103459:	8d 50 ff             	lea    -0x1(%eax),%edx
c010345c:	89 55 10             	mov    %edx,0x10(%ebp)
c010345f:	85 c0                	test   %eax,%eax
c0103461:	75 c3                	jne    c0103426 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c0103463:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0103468:	c9                   	leave  
c0103469:	c3                   	ret    

c010346a <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c010346a:	55                   	push   %ebp
c010346b:	89 e5                	mov    %esp,%ebp
c010346d:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c0103470:	8b 45 10             	mov    0x10(%ebp),%eax
c0103473:	8b 55 08             	mov    0x8(%ebp),%edx
c0103476:	01 d0                	add    %edx,%eax
c0103478:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c010347b:	eb 13                	jmp    c0103490 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c010347d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103480:	0f b6 10             	movzbl (%eax),%edx
c0103483:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103486:	38 c2                	cmp    %al,%dl
c0103488:	75 02                	jne    c010348c <memfind+0x22>
			break;
c010348a:	eb 0c                	jmp    c0103498 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c010348c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103490:	8b 45 08             	mov    0x8(%ebp),%eax
c0103493:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0103496:	72 e5                	jb     c010347d <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0103498:	8b 45 08             	mov    0x8(%ebp),%eax
}
c010349b:	c9                   	leave  
c010349c:	c3                   	ret    

c010349d <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c010349d:	55                   	push   %ebp
c010349e:	89 e5                	mov    %esp,%ebp
c01034a0:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c01034a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c01034aa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c01034b1:	eb 04                	jmp    c01034b7 <strtol+0x1a>
		s++;
c01034b3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c01034b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01034ba:	0f b6 00             	movzbl (%eax),%eax
c01034bd:	3c 20                	cmp    $0x20,%al
c01034bf:	74 f2                	je     c01034b3 <strtol+0x16>
c01034c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c4:	0f b6 00             	movzbl (%eax),%eax
c01034c7:	3c 09                	cmp    $0x9,%al
c01034c9:	74 e8                	je     c01034b3 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c01034cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01034ce:	0f b6 00             	movzbl (%eax),%eax
c01034d1:	3c 2b                	cmp    $0x2b,%al
c01034d3:	75 06                	jne    c01034db <strtol+0x3e>
		s++;
c01034d5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01034d9:	eb 15                	jmp    c01034f0 <strtol+0x53>
	else if (*s == '-')
c01034db:	8b 45 08             	mov    0x8(%ebp),%eax
c01034de:	0f b6 00             	movzbl (%eax),%eax
c01034e1:	3c 2d                	cmp    $0x2d,%al
c01034e3:	75 0b                	jne    c01034f0 <strtol+0x53>
		s++, neg = 1;
c01034e5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01034e9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c01034f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01034f4:	74 06                	je     c01034fc <strtol+0x5f>
c01034f6:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c01034fa:	75 24                	jne    c0103520 <strtol+0x83>
c01034fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01034ff:	0f b6 00             	movzbl (%eax),%eax
c0103502:	3c 30                	cmp    $0x30,%al
c0103504:	75 1a                	jne    c0103520 <strtol+0x83>
c0103506:	8b 45 08             	mov    0x8(%ebp),%eax
c0103509:	83 c0 01             	add    $0x1,%eax
c010350c:	0f b6 00             	movzbl (%eax),%eax
c010350f:	3c 78                	cmp    $0x78,%al
c0103511:	75 0d                	jne    c0103520 <strtol+0x83>
		s += 2, base = 16;
c0103513:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c0103517:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c010351e:	eb 2a                	jmp    c010354a <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c0103520:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103524:	75 17                	jne    c010353d <strtol+0xa0>
c0103526:	8b 45 08             	mov    0x8(%ebp),%eax
c0103529:	0f b6 00             	movzbl (%eax),%eax
c010352c:	3c 30                	cmp    $0x30,%al
c010352e:	75 0d                	jne    c010353d <strtol+0xa0>
		s++, base = 8;
c0103530:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103534:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c010353b:	eb 0d                	jmp    c010354a <strtol+0xad>
	else if (base == 0)
c010353d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103541:	75 07                	jne    c010354a <strtol+0xad>
		base = 10;
c0103543:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c010354a:	8b 45 08             	mov    0x8(%ebp),%eax
c010354d:	0f b6 00             	movzbl (%eax),%eax
c0103550:	3c 2f                	cmp    $0x2f,%al
c0103552:	7e 1b                	jle    c010356f <strtol+0xd2>
c0103554:	8b 45 08             	mov    0x8(%ebp),%eax
c0103557:	0f b6 00             	movzbl (%eax),%eax
c010355a:	3c 39                	cmp    $0x39,%al
c010355c:	7f 11                	jg     c010356f <strtol+0xd2>
			dig = *s - '0';
c010355e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103561:	0f b6 00             	movzbl (%eax),%eax
c0103564:	0f be c0             	movsbl %al,%eax
c0103567:	83 e8 30             	sub    $0x30,%eax
c010356a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010356d:	eb 48                	jmp    c01035b7 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c010356f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103572:	0f b6 00             	movzbl (%eax),%eax
c0103575:	3c 60                	cmp    $0x60,%al
c0103577:	7e 1b                	jle    c0103594 <strtol+0xf7>
c0103579:	8b 45 08             	mov    0x8(%ebp),%eax
c010357c:	0f b6 00             	movzbl (%eax),%eax
c010357f:	3c 7a                	cmp    $0x7a,%al
c0103581:	7f 11                	jg     c0103594 <strtol+0xf7>
			dig = *s - 'a' + 10;
c0103583:	8b 45 08             	mov    0x8(%ebp),%eax
c0103586:	0f b6 00             	movzbl (%eax),%eax
c0103589:	0f be c0             	movsbl %al,%eax
c010358c:	83 e8 57             	sub    $0x57,%eax
c010358f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103592:	eb 23                	jmp    c01035b7 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c0103594:	8b 45 08             	mov    0x8(%ebp),%eax
c0103597:	0f b6 00             	movzbl (%eax),%eax
c010359a:	3c 40                	cmp    $0x40,%al
c010359c:	7e 3d                	jle    c01035db <strtol+0x13e>
c010359e:	8b 45 08             	mov    0x8(%ebp),%eax
c01035a1:	0f b6 00             	movzbl (%eax),%eax
c01035a4:	3c 5a                	cmp    $0x5a,%al
c01035a6:	7f 33                	jg     c01035db <strtol+0x13e>
			dig = *s - 'A' + 10;
c01035a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01035ab:	0f b6 00             	movzbl (%eax),%eax
c01035ae:	0f be c0             	movsbl %al,%eax
c01035b1:	83 e8 37             	sub    $0x37,%eax
c01035b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c01035b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01035ba:	3b 45 10             	cmp    0x10(%ebp),%eax
c01035bd:	7c 02                	jl     c01035c1 <strtol+0x124>
			break;
c01035bf:	eb 1a                	jmp    c01035db <strtol+0x13e>
		s++, val = (val * base) + dig;
c01035c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01035c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01035c8:	0f af 45 10          	imul   0x10(%ebp),%eax
c01035cc:	89 c2                	mov    %eax,%edx
c01035ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01035d1:	01 d0                	add    %edx,%eax
c01035d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c01035d6:	e9 6f ff ff ff       	jmp    c010354a <strtol+0xad>

	if (endptr)
c01035db:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01035df:	74 08                	je     c01035e9 <strtol+0x14c>
		*endptr = (char *) s;
c01035e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035e4:	8b 55 08             	mov    0x8(%ebp),%edx
c01035e7:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c01035e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c01035ed:	74 07                	je     c01035f6 <strtol+0x159>
c01035ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01035f2:	f7 d8                	neg    %eax
c01035f4:	eb 03                	jmp    c01035f9 <strtol+0x15c>
c01035f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c01035f9:	c9                   	leave  
c01035fa:	c3                   	ret    

c01035fb <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c01035fb:	55                   	push   %ebp
c01035fc:	89 e5                	mov    %esp,%ebp
c01035fe:	53                   	push   %ebx
c01035ff:	83 ec 34             	sub    $0x34,%esp
c0103602:	8b 45 10             	mov    0x10(%ebp),%eax
c0103605:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103608:	8b 45 14             	mov    0x14(%ebp),%eax
c010360b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c010360e:	8b 45 18             	mov    0x18(%ebp),%eax
c0103611:	ba 00 00 00 00       	mov    $0x0,%edx
c0103616:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c0103619:	77 72                	ja     c010368d <printnum+0x92>
c010361b:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c010361e:	72 05                	jb     c0103625 <printnum+0x2a>
c0103620:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0103623:	77 68                	ja     c010368d <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c0103625:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0103628:	8d 58 ff             	lea    -0x1(%eax),%ebx
c010362b:	8b 45 18             	mov    0x18(%ebp),%eax
c010362e:	ba 00 00 00 00       	mov    $0x0,%edx
c0103633:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103637:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010363b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010363e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103641:	89 04 24             	mov    %eax,(%esp)
c0103644:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103648:	e8 53 06 00 00       	call   c0103ca0 <__udivdi3>
c010364d:	8b 4d 20             	mov    0x20(%ebp),%ecx
c0103650:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c0103654:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c0103658:	8b 4d 18             	mov    0x18(%ebp),%ecx
c010365b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c010365f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103663:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103667:	8b 45 0c             	mov    0xc(%ebp),%eax
c010366a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010366e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103671:	89 04 24             	mov    %eax,(%esp)
c0103674:	e8 82 ff ff ff       	call   c01035fb <printnum>
c0103679:	eb 1c                	jmp    c0103697 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c010367b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010367e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103682:	8b 45 20             	mov    0x20(%ebp),%eax
c0103685:	89 04 24             	mov    %eax,(%esp)
c0103688:	8b 45 08             	mov    0x8(%ebp),%eax
c010368b:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c010368d:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c0103691:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0103695:	7f e4                	jg     c010367b <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c0103697:	8b 4d 18             	mov    0x18(%ebp),%ecx
c010369a:	bb 00 00 00 00       	mov    $0x0,%ebx
c010369f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036a5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01036a9:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01036ad:	89 04 24             	mov    %eax,(%esp)
c01036b0:	89 54 24 04          	mov    %edx,0x4(%esp)
c01036b4:	e8 17 07 00 00       	call   c0103dd0 <__umoddi3>
c01036b9:	05 7c 44 10 c0       	add    $0xc010447c,%eax
c01036be:	0f b6 00             	movzbl (%eax),%eax
c01036c1:	0f be c0             	movsbl %al,%eax
c01036c4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01036c7:	89 54 24 04          	mov    %edx,0x4(%esp)
c01036cb:	89 04 24             	mov    %eax,(%esp)
c01036ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01036d1:	ff d0                	call   *%eax
}
c01036d3:	83 c4 34             	add    $0x34,%esp
c01036d6:	5b                   	pop    %ebx
c01036d7:	5d                   	pop    %ebp
c01036d8:	c3                   	ret    

c01036d9 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c01036d9:	55                   	push   %ebp
c01036da:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c01036dc:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01036e0:	7e 14                	jle    c01036f6 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c01036e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01036e5:	8b 00                	mov    (%eax),%eax
c01036e7:	8d 48 08             	lea    0x8(%eax),%ecx
c01036ea:	8b 55 08             	mov    0x8(%ebp),%edx
c01036ed:	89 0a                	mov    %ecx,(%edx)
c01036ef:	8b 50 04             	mov    0x4(%eax),%edx
c01036f2:	8b 00                	mov    (%eax),%eax
c01036f4:	eb 30                	jmp    c0103726 <getuint+0x4d>
	else if (lflag)
c01036f6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01036fa:	74 16                	je     c0103712 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c01036fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01036ff:	8b 00                	mov    (%eax),%eax
c0103701:	8d 48 04             	lea    0x4(%eax),%ecx
c0103704:	8b 55 08             	mov    0x8(%ebp),%edx
c0103707:	89 0a                	mov    %ecx,(%edx)
c0103709:	8b 00                	mov    (%eax),%eax
c010370b:	ba 00 00 00 00       	mov    $0x0,%edx
c0103710:	eb 14                	jmp    c0103726 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c0103712:	8b 45 08             	mov    0x8(%ebp),%eax
c0103715:	8b 00                	mov    (%eax),%eax
c0103717:	8d 48 04             	lea    0x4(%eax),%ecx
c010371a:	8b 55 08             	mov    0x8(%ebp),%edx
c010371d:	89 0a                	mov    %ecx,(%edx)
c010371f:	8b 00                	mov    (%eax),%eax
c0103721:	ba 00 00 00 00       	mov    $0x0,%edx
}
c0103726:	5d                   	pop    %ebp
c0103727:	c3                   	ret    

c0103728 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c0103728:	55                   	push   %ebp
c0103729:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010372b:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010372f:	7e 14                	jle    c0103745 <getint+0x1d>
		return va_arg(*ap, long long);
c0103731:	8b 45 08             	mov    0x8(%ebp),%eax
c0103734:	8b 00                	mov    (%eax),%eax
c0103736:	8d 48 08             	lea    0x8(%eax),%ecx
c0103739:	8b 55 08             	mov    0x8(%ebp),%edx
c010373c:	89 0a                	mov    %ecx,(%edx)
c010373e:	8b 50 04             	mov    0x4(%eax),%edx
c0103741:	8b 00                	mov    (%eax),%eax
c0103743:	eb 28                	jmp    c010376d <getint+0x45>
	else if (lflag)
c0103745:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103749:	74 12                	je     c010375d <getint+0x35>
		return va_arg(*ap, long);
c010374b:	8b 45 08             	mov    0x8(%ebp),%eax
c010374e:	8b 00                	mov    (%eax),%eax
c0103750:	8d 48 04             	lea    0x4(%eax),%ecx
c0103753:	8b 55 08             	mov    0x8(%ebp),%edx
c0103756:	89 0a                	mov    %ecx,(%edx)
c0103758:	8b 00                	mov    (%eax),%eax
c010375a:	99                   	cltd   
c010375b:	eb 10                	jmp    c010376d <getint+0x45>
	else
		return va_arg(*ap, int);
c010375d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103760:	8b 00                	mov    (%eax),%eax
c0103762:	8d 48 04             	lea    0x4(%eax),%ecx
c0103765:	8b 55 08             	mov    0x8(%ebp),%edx
c0103768:	89 0a                	mov    %ecx,(%edx)
c010376a:	8b 00                	mov    (%eax),%eax
c010376c:	99                   	cltd   
}
c010376d:	5d                   	pop    %ebp
c010376e:	c3                   	ret    

c010376f <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c010376f:	55                   	push   %ebp
c0103770:	89 e5                	mov    %esp,%ebp
c0103772:	56                   	push   %esi
c0103773:	53                   	push   %ebx
c0103774:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103777:	eb 18                	jmp    c0103791 <vprintfmt+0x22>
			if (ch == '\0')
c0103779:	85 db                	test   %ebx,%ebx
c010377b:	75 05                	jne    c0103782 <vprintfmt+0x13>
				return;
c010377d:	e9 e9 03 00 00       	jmp    c0103b6b <vprintfmt+0x3fc>
			putch(ch, putdat);
c0103782:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103785:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103789:	89 1c 24             	mov    %ebx,(%esp)
c010378c:	8b 45 08             	mov    0x8(%ebp),%eax
c010378f:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103791:	8b 45 10             	mov    0x10(%ebp),%eax
c0103794:	8d 50 01             	lea    0x1(%eax),%edx
c0103797:	89 55 10             	mov    %edx,0x10(%ebp)
c010379a:	0f b6 00             	movzbl (%eax),%eax
c010379d:	0f b6 d8             	movzbl %al,%ebx
c01037a0:	83 fb 25             	cmp    $0x25,%ebx
c01037a3:	75 d4                	jne    c0103779 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c01037a5:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c01037a9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c01037b0:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c01037b7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c01037be:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c01037c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01037c8:	8d 50 01             	lea    0x1(%eax),%edx
c01037cb:	89 55 10             	mov    %edx,0x10(%ebp)
c01037ce:	0f b6 00             	movzbl (%eax),%eax
c01037d1:	0f b6 d8             	movzbl %al,%ebx
c01037d4:	8d 43 dd             	lea    -0x23(%ebx),%eax
c01037d7:	83 f8 55             	cmp    $0x55,%eax
c01037da:	0f 87 5a 03 00 00    	ja     c0103b3a <vprintfmt+0x3cb>
c01037e0:	8b 04 85 a0 44 10 c0 	mov    -0x3fefbb60(,%eax,4),%eax
c01037e7:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c01037e9:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c01037ed:	eb d6                	jmp    c01037c5 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c01037ef:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c01037f3:	eb d0                	jmp    c01037c5 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01037f5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c01037fc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01037ff:	89 d0                	mov    %edx,%eax
c0103801:	c1 e0 02             	shl    $0x2,%eax
c0103804:	01 d0                	add    %edx,%eax
c0103806:	01 c0                	add    %eax,%eax
c0103808:	01 d8                	add    %ebx,%eax
c010380a:	83 e8 30             	sub    $0x30,%eax
c010380d:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c0103810:	8b 45 10             	mov    0x10(%ebp),%eax
c0103813:	0f b6 00             	movzbl (%eax),%eax
c0103816:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c0103819:	83 fb 2f             	cmp    $0x2f,%ebx
c010381c:	7e 0b                	jle    c0103829 <vprintfmt+0xba>
c010381e:	83 fb 39             	cmp    $0x39,%ebx
c0103821:	7f 06                	jg     c0103829 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103823:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c0103827:	eb d3                	jmp    c01037fc <vprintfmt+0x8d>
			goto process_precision;
c0103829:	eb 33                	jmp    c010385e <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c010382b:	8b 45 14             	mov    0x14(%ebp),%eax
c010382e:	8d 50 04             	lea    0x4(%eax),%edx
c0103831:	89 55 14             	mov    %edx,0x14(%ebp)
c0103834:	8b 00                	mov    (%eax),%eax
c0103836:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c0103839:	eb 23                	jmp    c010385e <vprintfmt+0xef>

		case '.':
			if (width < 0)
c010383b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c010383f:	79 0c                	jns    c010384d <vprintfmt+0xde>
				width = 0;
c0103841:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c0103848:	e9 78 ff ff ff       	jmp    c01037c5 <vprintfmt+0x56>
c010384d:	e9 73 ff ff ff       	jmp    c01037c5 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c0103852:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c0103859:	e9 67 ff ff ff       	jmp    c01037c5 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c010385e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103862:	79 12                	jns    c0103876 <vprintfmt+0x107>
				width = precision, precision = -1;
c0103864:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103867:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010386a:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c0103871:	e9 4f ff ff ff       	jmp    c01037c5 <vprintfmt+0x56>
c0103876:	e9 4a ff ff ff       	jmp    c01037c5 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c010387b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c010387f:	e9 41 ff ff ff       	jmp    c01037c5 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c0103884:	8b 45 14             	mov    0x14(%ebp),%eax
c0103887:	8d 50 04             	lea    0x4(%eax),%edx
c010388a:	89 55 14             	mov    %edx,0x14(%ebp)
c010388d:	8b 00                	mov    (%eax),%eax
c010388f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103892:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103896:	89 04 24             	mov    %eax,(%esp)
c0103899:	8b 45 08             	mov    0x8(%ebp),%eax
c010389c:	ff d0                	call   *%eax
			break;
c010389e:	e9 c2 02 00 00       	jmp    c0103b65 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c01038a3:	8b 45 14             	mov    0x14(%ebp),%eax
c01038a6:	8d 50 04             	lea    0x4(%eax),%edx
c01038a9:	89 55 14             	mov    %edx,0x14(%ebp)
c01038ac:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c01038ae:	85 db                	test   %ebx,%ebx
c01038b0:	79 02                	jns    c01038b4 <vprintfmt+0x145>
				err = -err;
c01038b2:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c01038b4:	83 fb 06             	cmp    $0x6,%ebx
c01038b7:	7f 0b                	jg     c01038c4 <vprintfmt+0x155>
c01038b9:	8b 34 9d 60 44 10 c0 	mov    -0x3fefbba0(,%ebx,4),%esi
c01038c0:	85 f6                	test   %esi,%esi
c01038c2:	75 23                	jne    c01038e7 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c01038c4:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01038c8:	c7 44 24 08 8d 44 10 	movl   $0xc010448d,0x8(%esp)
c01038cf:	c0 
c01038d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038d3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01038d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038da:	89 04 24             	mov    %eax,(%esp)
c01038dd:	e8 90 02 00 00       	call   c0103b72 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c01038e2:	e9 7e 02 00 00       	jmp    c0103b65 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c01038e7:	89 74 24 0c          	mov    %esi,0xc(%esp)
c01038eb:	c7 44 24 08 96 44 10 	movl   $0xc0104496,0x8(%esp)
c01038f2:	c0 
c01038f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01038fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01038fd:	89 04 24             	mov    %eax,(%esp)
c0103900:	e8 6d 02 00 00       	call   c0103b72 <printfmt>
			break;
c0103905:	e9 5b 02 00 00       	jmp    c0103b65 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c010390a:	8b 45 14             	mov    0x14(%ebp),%eax
c010390d:	8d 50 04             	lea    0x4(%eax),%edx
c0103910:	89 55 14             	mov    %edx,0x14(%ebp)
c0103913:	8b 30                	mov    (%eax),%esi
c0103915:	85 f6                	test   %esi,%esi
c0103917:	75 05                	jne    c010391e <vprintfmt+0x1af>
				p = "(null)";
c0103919:	be 99 44 10 c0       	mov    $0xc0104499,%esi
			if (width > 0 && padc != '-')
c010391e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103922:	7e 37                	jle    c010395b <vprintfmt+0x1ec>
c0103924:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c0103928:	74 31                	je     c010395b <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c010392a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010392d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103931:	89 34 24             	mov    %esi,(%esp)
c0103934:	e8 9b f8 ff ff       	call   c01031d4 <strnlen>
c0103939:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c010393c:	eb 17                	jmp    c0103955 <vprintfmt+0x1e6>
					putch(padc, putdat);
c010393e:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c0103942:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103945:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103949:	89 04 24             	mov    %eax,(%esp)
c010394c:	8b 45 08             	mov    0x8(%ebp),%eax
c010394f:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c0103951:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103955:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103959:	7f e3                	jg     c010393e <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c010395b:	eb 38                	jmp    c0103995 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c010395d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0103961:	74 1f                	je     c0103982 <vprintfmt+0x213>
c0103963:	83 fb 1f             	cmp    $0x1f,%ebx
c0103966:	7e 05                	jle    c010396d <vprintfmt+0x1fe>
c0103968:	83 fb 7e             	cmp    $0x7e,%ebx
c010396b:	7e 15                	jle    c0103982 <vprintfmt+0x213>
					putch('?', putdat);
c010396d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103970:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103974:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c010397b:	8b 45 08             	mov    0x8(%ebp),%eax
c010397e:	ff d0                	call   *%eax
c0103980:	eb 0f                	jmp    c0103991 <vprintfmt+0x222>
				else
					putch(ch, putdat);
c0103982:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103985:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103989:	89 1c 24             	mov    %ebx,(%esp)
c010398c:	8b 45 08             	mov    0x8(%ebp),%eax
c010398f:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103991:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103995:	89 f0                	mov    %esi,%eax
c0103997:	8d 70 01             	lea    0x1(%eax),%esi
c010399a:	0f b6 00             	movzbl (%eax),%eax
c010399d:	0f be d8             	movsbl %al,%ebx
c01039a0:	85 db                	test   %ebx,%ebx
c01039a2:	74 10                	je     c01039b4 <vprintfmt+0x245>
c01039a4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01039a8:	78 b3                	js     c010395d <vprintfmt+0x1ee>
c01039aa:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c01039ae:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01039b2:	79 a9                	jns    c010395d <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c01039b4:	eb 17                	jmp    c01039cd <vprintfmt+0x25e>
				putch(' ', putdat);
c01039b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039b9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039bd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c01039c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01039c7:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c01039c9:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01039cd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01039d1:	7f e3                	jg     c01039b6 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c01039d3:	e9 8d 01 00 00       	jmp    c0103b65 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c01039d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039db:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039df:	8d 45 14             	lea    0x14(%ebp),%eax
c01039e2:	89 04 24             	mov    %eax,(%esp)
c01039e5:	e8 3e fd ff ff       	call   c0103728 <getint>
c01039ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01039ed:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c01039f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01039f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01039f6:	85 d2                	test   %edx,%edx
c01039f8:	79 26                	jns    c0103a20 <vprintfmt+0x2b1>
				putch('-', putdat);
c01039fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039fd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a01:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0103a08:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a0b:	ff d0                	call   *%eax
				num = -(long long) num;
c0103a0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a10:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103a13:	f7 d8                	neg    %eax
c0103a15:	83 d2 00             	adc    $0x0,%edx
c0103a18:	f7 da                	neg    %edx
c0103a1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103a1d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0103a20:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103a27:	e9 c5 00 00 00       	jmp    c0103af1 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c0103a2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a2f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a33:	8d 45 14             	lea    0x14(%ebp),%eax
c0103a36:	89 04 24             	mov    %eax,(%esp)
c0103a39:	e8 9b fc ff ff       	call   c01036d9 <getuint>
c0103a3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103a41:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c0103a44:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103a4b:	e9 a1 00 00 00       	jmp    c0103af1 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c0103a50:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a53:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a57:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103a5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a61:	ff d0                	call   *%eax
			putch('X', putdat);
c0103a63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a66:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a6a:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103a71:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a74:	ff d0                	call   *%eax
			putch('X', putdat);
c0103a76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a79:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a7d:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103a84:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a87:	ff d0                	call   *%eax
			break;
c0103a89:	e9 d7 00 00 00       	jmp    c0103b65 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c0103a8e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a91:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a95:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c0103a9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a9f:	ff d0                	call   *%eax
			putch('x', putdat);
c0103aa1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103aa4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103aa8:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c0103aaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ab2:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103ab4:	8b 45 14             	mov    0x14(%ebp),%eax
c0103ab7:	8d 50 04             	lea    0x4(%eax),%edx
c0103aba:	89 55 14             	mov    %edx,0x14(%ebp)
c0103abd:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c0103abf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103ac2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0103ac9:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0103ad0:	eb 1f                	jmp    c0103af1 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103ad2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103ad5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ad9:	8d 45 14             	lea    0x14(%ebp),%eax
c0103adc:	89 04 24             	mov    %eax,(%esp)
c0103adf:	e8 f5 fb ff ff       	call   c01036d9 <getuint>
c0103ae4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103ae7:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103aea:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0103af1:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0103af5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103af8:	89 54 24 18          	mov    %edx,0x18(%esp)
c0103afc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103aff:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103b03:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103b07:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103b0d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103b11:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103b15:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b18:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b1f:	89 04 24             	mov    %eax,(%esp)
c0103b22:	e8 d4 fa ff ff       	call   c01035fb <printnum>
			break;
c0103b27:	eb 3c                	jmp    c0103b65 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c0103b29:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b30:	89 1c 24             	mov    %ebx,(%esp)
c0103b33:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b36:	ff d0                	call   *%eax
			break;
c0103b38:	eb 2b                	jmp    c0103b65 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c0103b3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b3d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b41:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c0103b48:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b4b:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c0103b4d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103b51:	eb 04                	jmp    c0103b57 <vprintfmt+0x3e8>
c0103b53:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103b57:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b5a:	83 e8 01             	sub    $0x1,%eax
c0103b5d:	0f b6 00             	movzbl (%eax),%eax
c0103b60:	3c 25                	cmp    $0x25,%al
c0103b62:	75 ef                	jne    c0103b53 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c0103b64:	90                   	nop
		}
	}
c0103b65:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103b66:	e9 26 fc ff ff       	jmp    c0103791 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c0103b6b:	83 c4 40             	add    $0x40,%esp
c0103b6e:	5b                   	pop    %ebx
c0103b6f:	5e                   	pop    %esi
c0103b70:	5d                   	pop    %ebp
c0103b71:	c3                   	ret    

c0103b72 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c0103b72:	55                   	push   %ebp
c0103b73:	89 e5                	mov    %esp,%ebp
c0103b75:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0103b78:	8d 45 14             	lea    0x14(%ebp),%eax
c0103b7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c0103b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b81:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103b85:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b88:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103b8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b93:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b96:	89 04 24             	mov    %eax,(%esp)
c0103b99:	e8 d1 fb ff ff       	call   c010376f <vprintfmt>
	va_end(ap);
}
c0103b9e:	c9                   	leave  
c0103b9f:	c3                   	ret    

c0103ba0 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c0103ba0:	55                   	push   %ebp
c0103ba1:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ba6:	8b 40 08             	mov    0x8(%eax),%eax
c0103ba9:	8d 50 01             	lea    0x1(%eax),%edx
c0103bac:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103baf:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bb5:	8b 10                	mov    (%eax),%edx
c0103bb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bba:	8b 40 04             	mov    0x4(%eax),%eax
c0103bbd:	39 c2                	cmp    %eax,%edx
c0103bbf:	73 12                	jae    c0103bd3 <sprintputch+0x33>
		*b->buf++ = ch;
c0103bc1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bc4:	8b 00                	mov    (%eax),%eax
c0103bc6:	8d 48 01             	lea    0x1(%eax),%ecx
c0103bc9:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103bcc:	89 0a                	mov    %ecx,(%edx)
c0103bce:	8b 55 08             	mov    0x8(%ebp),%edx
c0103bd1:	88 10                	mov    %dl,(%eax)
}
c0103bd3:	5d                   	pop    %ebp
c0103bd4:	c3                   	ret    

c0103bd5 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103bd5:	55                   	push   %ebp
c0103bd6:	89 e5                	mov    %esp,%ebp
c0103bd8:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103bdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bde:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103be1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103be4:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103be7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bea:	01 d0                	add    %edx,%eax
c0103bec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103bef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0103bf6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103bfa:	74 06                	je     c0103c02 <vsnprintf+0x2d>
c0103bfc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103c00:	7f 07                	jg     c0103c09 <vsnprintf+0x34>
		return -E_INVAL;
c0103c02:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0103c07:	eb 2a                	jmp    c0103c33 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c0103c09:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c0c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103c10:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c13:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103c17:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0103c1a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c1e:	c7 04 24 a0 3b 10 c0 	movl   $0xc0103ba0,(%esp)
c0103c25:	e8 45 fb ff ff       	call   c010376f <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c0103c2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c2d:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c0103c30:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103c33:	c9                   	leave  
c0103c34:	c3                   	ret    

c0103c35 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c0103c35:	55                   	push   %ebp
c0103c36:	89 e5                	mov    %esp,%ebp
c0103c38:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c0103c3b:	8d 45 14             	lea    0x14(%ebp),%eax
c0103c3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c0103c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c44:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103c48:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c4b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103c4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c52:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c56:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c59:	89 04 24             	mov    %eax,(%esp)
c0103c5c:	e8 74 ff ff ff       	call   c0103bd5 <vsnprintf>
c0103c61:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c0103c64:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103c67:	c9                   	leave  
c0103c68:	c3                   	ret    

c0103c69 <srand>:
static int seed = 0;

void
srand(int s) {
c0103c69:	55                   	push   %ebp
c0103c6a:	89 e5                	mov    %esp,%ebp
	seed = s;
c0103c6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c6f:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c0103c74:	5d                   	pop    %ebp
c0103c75:	c3                   	ret    

c0103c76 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0103c76:	55                   	push   %ebp
c0103c77:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0103c79:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103c7e:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0103c84:	83 c0 01             	add    $0x1,%eax
c0103c87:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c0103c8c:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103c91:	c1 f8 10             	sar    $0x10,%eax
c0103c94:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0103c99:	5d                   	pop    %ebp
c0103c9a:	c3                   	ret    
c0103c9b:	66 90                	xchg   %ax,%ax
c0103c9d:	66 90                	xchg   %ax,%ax
c0103c9f:	90                   	nop

c0103ca0 <__udivdi3>:
c0103ca0:	55                   	push   %ebp
c0103ca1:	57                   	push   %edi
c0103ca2:	56                   	push   %esi
c0103ca3:	83 ec 0c             	sub    $0xc,%esp
c0103ca6:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103caa:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c0103cae:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103cb2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103cb6:	85 c0                	test   %eax,%eax
c0103cb8:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0103cbc:	89 ea                	mov    %ebp,%edx
c0103cbe:	89 0c 24             	mov    %ecx,(%esp)
c0103cc1:	75 2d                	jne    c0103cf0 <__udivdi3+0x50>
c0103cc3:	39 e9                	cmp    %ebp,%ecx
c0103cc5:	77 61                	ja     c0103d28 <__udivdi3+0x88>
c0103cc7:	85 c9                	test   %ecx,%ecx
c0103cc9:	89 ce                	mov    %ecx,%esi
c0103ccb:	75 0b                	jne    c0103cd8 <__udivdi3+0x38>
c0103ccd:	b8 01 00 00 00       	mov    $0x1,%eax
c0103cd2:	31 d2                	xor    %edx,%edx
c0103cd4:	f7 f1                	div    %ecx
c0103cd6:	89 c6                	mov    %eax,%esi
c0103cd8:	31 d2                	xor    %edx,%edx
c0103cda:	89 e8                	mov    %ebp,%eax
c0103cdc:	f7 f6                	div    %esi
c0103cde:	89 c5                	mov    %eax,%ebp
c0103ce0:	89 f8                	mov    %edi,%eax
c0103ce2:	f7 f6                	div    %esi
c0103ce4:	89 ea                	mov    %ebp,%edx
c0103ce6:	83 c4 0c             	add    $0xc,%esp
c0103ce9:	5e                   	pop    %esi
c0103cea:	5f                   	pop    %edi
c0103ceb:	5d                   	pop    %ebp
c0103cec:	c3                   	ret    
c0103ced:	8d 76 00             	lea    0x0(%esi),%esi
c0103cf0:	39 e8                	cmp    %ebp,%eax
c0103cf2:	77 24                	ja     c0103d18 <__udivdi3+0x78>
c0103cf4:	0f bd e8             	bsr    %eax,%ebp
c0103cf7:	83 f5 1f             	xor    $0x1f,%ebp
c0103cfa:	75 3c                	jne    c0103d38 <__udivdi3+0x98>
c0103cfc:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103d00:	39 34 24             	cmp    %esi,(%esp)
c0103d03:	0f 86 9f 00 00 00    	jbe    c0103da8 <__udivdi3+0x108>
c0103d09:	39 d0                	cmp    %edx,%eax
c0103d0b:	0f 82 97 00 00 00    	jb     c0103da8 <__udivdi3+0x108>
c0103d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103d18:	31 d2                	xor    %edx,%edx
c0103d1a:	31 c0                	xor    %eax,%eax
c0103d1c:	83 c4 0c             	add    $0xc,%esp
c0103d1f:	5e                   	pop    %esi
c0103d20:	5f                   	pop    %edi
c0103d21:	5d                   	pop    %ebp
c0103d22:	c3                   	ret    
c0103d23:	90                   	nop
c0103d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103d28:	89 f8                	mov    %edi,%eax
c0103d2a:	f7 f1                	div    %ecx
c0103d2c:	31 d2                	xor    %edx,%edx
c0103d2e:	83 c4 0c             	add    $0xc,%esp
c0103d31:	5e                   	pop    %esi
c0103d32:	5f                   	pop    %edi
c0103d33:	5d                   	pop    %ebp
c0103d34:	c3                   	ret    
c0103d35:	8d 76 00             	lea    0x0(%esi),%esi
c0103d38:	89 e9                	mov    %ebp,%ecx
c0103d3a:	8b 3c 24             	mov    (%esp),%edi
c0103d3d:	d3 e0                	shl    %cl,%eax
c0103d3f:	89 c6                	mov    %eax,%esi
c0103d41:	b8 20 00 00 00       	mov    $0x20,%eax
c0103d46:	29 e8                	sub    %ebp,%eax
c0103d48:	89 c1                	mov    %eax,%ecx
c0103d4a:	d3 ef                	shr    %cl,%edi
c0103d4c:	89 e9                	mov    %ebp,%ecx
c0103d4e:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0103d52:	8b 3c 24             	mov    (%esp),%edi
c0103d55:	09 74 24 08          	or     %esi,0x8(%esp)
c0103d59:	89 d6                	mov    %edx,%esi
c0103d5b:	d3 e7                	shl    %cl,%edi
c0103d5d:	89 c1                	mov    %eax,%ecx
c0103d5f:	89 3c 24             	mov    %edi,(%esp)
c0103d62:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103d66:	d3 ee                	shr    %cl,%esi
c0103d68:	89 e9                	mov    %ebp,%ecx
c0103d6a:	d3 e2                	shl    %cl,%edx
c0103d6c:	89 c1                	mov    %eax,%ecx
c0103d6e:	d3 ef                	shr    %cl,%edi
c0103d70:	09 d7                	or     %edx,%edi
c0103d72:	89 f2                	mov    %esi,%edx
c0103d74:	89 f8                	mov    %edi,%eax
c0103d76:	f7 74 24 08          	divl   0x8(%esp)
c0103d7a:	89 d6                	mov    %edx,%esi
c0103d7c:	89 c7                	mov    %eax,%edi
c0103d7e:	f7 24 24             	mull   (%esp)
c0103d81:	39 d6                	cmp    %edx,%esi
c0103d83:	89 14 24             	mov    %edx,(%esp)
c0103d86:	72 30                	jb     c0103db8 <__udivdi3+0x118>
c0103d88:	8b 54 24 04          	mov    0x4(%esp),%edx
c0103d8c:	89 e9                	mov    %ebp,%ecx
c0103d8e:	d3 e2                	shl    %cl,%edx
c0103d90:	39 c2                	cmp    %eax,%edx
c0103d92:	73 05                	jae    c0103d99 <__udivdi3+0xf9>
c0103d94:	3b 34 24             	cmp    (%esp),%esi
c0103d97:	74 1f                	je     c0103db8 <__udivdi3+0x118>
c0103d99:	89 f8                	mov    %edi,%eax
c0103d9b:	31 d2                	xor    %edx,%edx
c0103d9d:	e9 7a ff ff ff       	jmp    c0103d1c <__udivdi3+0x7c>
c0103da2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103da8:	31 d2                	xor    %edx,%edx
c0103daa:	b8 01 00 00 00       	mov    $0x1,%eax
c0103daf:	e9 68 ff ff ff       	jmp    c0103d1c <__udivdi3+0x7c>
c0103db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103db8:	8d 47 ff             	lea    -0x1(%edi),%eax
c0103dbb:	31 d2                	xor    %edx,%edx
c0103dbd:	83 c4 0c             	add    $0xc,%esp
c0103dc0:	5e                   	pop    %esi
c0103dc1:	5f                   	pop    %edi
c0103dc2:	5d                   	pop    %ebp
c0103dc3:	c3                   	ret    
c0103dc4:	66 90                	xchg   %ax,%ax
c0103dc6:	66 90                	xchg   %ax,%ax
c0103dc8:	66 90                	xchg   %ax,%ax
c0103dca:	66 90                	xchg   %ax,%ax
c0103dcc:	66 90                	xchg   %ax,%ax
c0103dce:	66 90                	xchg   %ax,%ax

c0103dd0 <__umoddi3>:
c0103dd0:	55                   	push   %ebp
c0103dd1:	57                   	push   %edi
c0103dd2:	56                   	push   %esi
c0103dd3:	83 ec 14             	sub    $0x14,%esp
c0103dd6:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103dda:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103dde:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103de2:	89 c7                	mov    %eax,%edi
c0103de4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103de8:	8b 44 24 30          	mov    0x30(%esp),%eax
c0103dec:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103df0:	89 34 24             	mov    %esi,(%esp)
c0103df3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103df7:	85 c0                	test   %eax,%eax
c0103df9:	89 c2                	mov    %eax,%edx
c0103dfb:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103dff:	75 17                	jne    c0103e18 <__umoddi3+0x48>
c0103e01:	39 fe                	cmp    %edi,%esi
c0103e03:	76 4b                	jbe    c0103e50 <__umoddi3+0x80>
c0103e05:	89 c8                	mov    %ecx,%eax
c0103e07:	89 fa                	mov    %edi,%edx
c0103e09:	f7 f6                	div    %esi
c0103e0b:	89 d0                	mov    %edx,%eax
c0103e0d:	31 d2                	xor    %edx,%edx
c0103e0f:	83 c4 14             	add    $0x14,%esp
c0103e12:	5e                   	pop    %esi
c0103e13:	5f                   	pop    %edi
c0103e14:	5d                   	pop    %ebp
c0103e15:	c3                   	ret    
c0103e16:	66 90                	xchg   %ax,%ax
c0103e18:	39 f8                	cmp    %edi,%eax
c0103e1a:	77 54                	ja     c0103e70 <__umoddi3+0xa0>
c0103e1c:	0f bd e8             	bsr    %eax,%ebp
c0103e1f:	83 f5 1f             	xor    $0x1f,%ebp
c0103e22:	75 5c                	jne    c0103e80 <__umoddi3+0xb0>
c0103e24:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0103e28:	39 3c 24             	cmp    %edi,(%esp)
c0103e2b:	0f 87 e7 00 00 00    	ja     c0103f18 <__umoddi3+0x148>
c0103e31:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103e35:	29 f1                	sub    %esi,%ecx
c0103e37:	19 c7                	sbb    %eax,%edi
c0103e39:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103e3d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103e41:	8b 44 24 08          	mov    0x8(%esp),%eax
c0103e45:	8b 54 24 0c          	mov    0xc(%esp),%edx
c0103e49:	83 c4 14             	add    $0x14,%esp
c0103e4c:	5e                   	pop    %esi
c0103e4d:	5f                   	pop    %edi
c0103e4e:	5d                   	pop    %ebp
c0103e4f:	c3                   	ret    
c0103e50:	85 f6                	test   %esi,%esi
c0103e52:	89 f5                	mov    %esi,%ebp
c0103e54:	75 0b                	jne    c0103e61 <__umoddi3+0x91>
c0103e56:	b8 01 00 00 00       	mov    $0x1,%eax
c0103e5b:	31 d2                	xor    %edx,%edx
c0103e5d:	f7 f6                	div    %esi
c0103e5f:	89 c5                	mov    %eax,%ebp
c0103e61:	8b 44 24 04          	mov    0x4(%esp),%eax
c0103e65:	31 d2                	xor    %edx,%edx
c0103e67:	f7 f5                	div    %ebp
c0103e69:	89 c8                	mov    %ecx,%eax
c0103e6b:	f7 f5                	div    %ebp
c0103e6d:	eb 9c                	jmp    c0103e0b <__umoddi3+0x3b>
c0103e6f:	90                   	nop
c0103e70:	89 c8                	mov    %ecx,%eax
c0103e72:	89 fa                	mov    %edi,%edx
c0103e74:	83 c4 14             	add    $0x14,%esp
c0103e77:	5e                   	pop    %esi
c0103e78:	5f                   	pop    %edi
c0103e79:	5d                   	pop    %ebp
c0103e7a:	c3                   	ret    
c0103e7b:	90                   	nop
c0103e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103e80:	8b 04 24             	mov    (%esp),%eax
c0103e83:	be 20 00 00 00       	mov    $0x20,%esi
c0103e88:	89 e9                	mov    %ebp,%ecx
c0103e8a:	29 ee                	sub    %ebp,%esi
c0103e8c:	d3 e2                	shl    %cl,%edx
c0103e8e:	89 f1                	mov    %esi,%ecx
c0103e90:	d3 e8                	shr    %cl,%eax
c0103e92:	89 e9                	mov    %ebp,%ecx
c0103e94:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e98:	8b 04 24             	mov    (%esp),%eax
c0103e9b:	09 54 24 04          	or     %edx,0x4(%esp)
c0103e9f:	89 fa                	mov    %edi,%edx
c0103ea1:	d3 e0                	shl    %cl,%eax
c0103ea3:	89 f1                	mov    %esi,%ecx
c0103ea5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103ea9:	8b 44 24 10          	mov    0x10(%esp),%eax
c0103ead:	d3 ea                	shr    %cl,%edx
c0103eaf:	89 e9                	mov    %ebp,%ecx
c0103eb1:	d3 e7                	shl    %cl,%edi
c0103eb3:	89 f1                	mov    %esi,%ecx
c0103eb5:	d3 e8                	shr    %cl,%eax
c0103eb7:	89 e9                	mov    %ebp,%ecx
c0103eb9:	09 f8                	or     %edi,%eax
c0103ebb:	8b 7c 24 10          	mov    0x10(%esp),%edi
c0103ebf:	f7 74 24 04          	divl   0x4(%esp)
c0103ec3:	d3 e7                	shl    %cl,%edi
c0103ec5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103ec9:	89 d7                	mov    %edx,%edi
c0103ecb:	f7 64 24 08          	mull   0x8(%esp)
c0103ecf:	39 d7                	cmp    %edx,%edi
c0103ed1:	89 c1                	mov    %eax,%ecx
c0103ed3:	89 14 24             	mov    %edx,(%esp)
c0103ed6:	72 2c                	jb     c0103f04 <__umoddi3+0x134>
c0103ed8:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c0103edc:	72 22                	jb     c0103f00 <__umoddi3+0x130>
c0103ede:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103ee2:	29 c8                	sub    %ecx,%eax
c0103ee4:	19 d7                	sbb    %edx,%edi
c0103ee6:	89 e9                	mov    %ebp,%ecx
c0103ee8:	89 fa                	mov    %edi,%edx
c0103eea:	d3 e8                	shr    %cl,%eax
c0103eec:	89 f1                	mov    %esi,%ecx
c0103eee:	d3 e2                	shl    %cl,%edx
c0103ef0:	89 e9                	mov    %ebp,%ecx
c0103ef2:	d3 ef                	shr    %cl,%edi
c0103ef4:	09 d0                	or     %edx,%eax
c0103ef6:	89 fa                	mov    %edi,%edx
c0103ef8:	83 c4 14             	add    $0x14,%esp
c0103efb:	5e                   	pop    %esi
c0103efc:	5f                   	pop    %edi
c0103efd:	5d                   	pop    %ebp
c0103efe:	c3                   	ret    
c0103eff:	90                   	nop
c0103f00:	39 d7                	cmp    %edx,%edi
c0103f02:	75 da                	jne    c0103ede <__umoddi3+0x10e>
c0103f04:	8b 14 24             	mov    (%esp),%edx
c0103f07:	89 c1                	mov    %eax,%ecx
c0103f09:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c0103f0d:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0103f11:	eb cb                	jmp    c0103ede <__umoddi3+0x10e>
c0103f13:	90                   	nop
c0103f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103f18:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c0103f1c:	0f 82 0f ff ff ff    	jb     c0103e31 <__umoddi3+0x61>
c0103f22:	e9 1a ff ff ff       	jmp    c0103e41 <__umoddi3+0x71>
