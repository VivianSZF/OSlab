
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
c010000f:	0f 87 5d 01 00 00    	ja     c0100172 <do_syscall+0x172>
c0100015:	8b 04 85 24 41 10 c0 	mov    -0x3fefbedc(,%eax,4),%eax
c010001c:	ff e0                	jmp    *%eax
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c010001e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100021:	8b 40 10             	mov    0x10(%eax),%eax
c0100024:	89 04 24             	mov    %eax,(%esp)
c0100027:	e8 59 0a 00 00       	call   c0100a85 <sys_pr>
c010002c:	89 c2                	mov    %eax,%edx
c010002e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100031:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100034:	e9 69 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_time:
			tf->eax=sys_time();
c0100039:	e8 8b 01 00 00       	call   c01001c9 <sys_time>
c010003e:	89 c2                	mov    %eax,%edx
c0100040:	8b 45 08             	mov    0x8(%ebp),%eax
c0100043:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100046:	e9 57 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
c010004b:	e8 83 01 00 00       	call   c01001d3 <sys_readkey>
c0100050:	89 c2                	mov    %eax,%edx
c0100052:	8b 45 08             	mov    0x8(%ebp),%eax
c0100055:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100058:	e9 45 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
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
c010007e:	e8 72 2d 00 00       	call   c0102df5 <sys_write>
c0100083:	89 c2                	mov    %eax,%edx
c0100085:	8b 45 08             	mov    0x8(%ebp),%eax
c0100088:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008b:	e9 12 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_fork:
			sys_fork();
c0100090:	e8 92 16 00 00       	call   c0101727 <sys_fork>
			break;
c0100095:	e9 08 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_getpid:
			tf->eax=sys_getpid();
c010009a:	e8 d8 16 00 00       	call   c0101777 <sys_getpid>
c010009f:	8b 55 08             	mov    0x8(%ebp),%edx
c01000a2:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c01000a5:	e9 f8 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_exit:
			sys_exit(tf->ebx);
c01000aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ad:	8b 40 10             	mov    0x10(%eax),%eax
c01000b0:	89 04 24             	mov    %eax,(%esp)
c01000b3:	e8 cc 16 00 00       	call   c0101784 <sys_exit>
			break;
c01000b8:	e9 e5 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01000c0:	8b 40 10             	mov    0x10(%eax),%eax
c01000c3:	89 04 24             	mov    %eax,(%esp)
c01000c6:	e8 10 18 00 00       	call   c01018db <sys_sleep>
			break;
c01000cb:	e9 d2 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_thread:
			tf->eax=kthread((void*)tf->ebx);
c01000d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01000d3:	8b 40 10             	mov    0x10(%eax),%eax
c01000d6:	89 04 24             	mov    %eax,(%esp)
c01000d9:	e8 8c 14 00 00       	call   c010156a <kthread>
c01000de:	89 c2                	mov    %eax,%edx
c01000e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01000e3:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c01000e6:	e9 b7 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_init:
			tf->eax=ksem_init((void*)tf->ebx,tf->ecx);
c01000eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ee:	8b 40 18             	mov    0x18(%eax),%eax
c01000f1:	89 c2                	mov    %eax,%edx
c01000f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01000f6:	8b 40 10             	mov    0x10(%eax),%eax
c01000f9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01000fd:	89 04 24             	mov    %eax,(%esp)
c0100100:	e8 7a 1a 00 00       	call   c0101b7f <ksem_init>
c0100105:	89 c2                	mov    %eax,%edx
c0100107:	8b 45 08             	mov    0x8(%ebp),%eax
c010010a:	89 50 1c             	mov    %edx,0x1c(%eax)
			//printk("131231412\n");
			break;
c010010d:	e9 90 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_destroy:
			tf->eax=ksem_destroy((Sema*)tf->ebx);
c0100112:	8b 45 08             	mov    0x8(%ebp),%eax
c0100115:	8b 40 10             	mov    0x10(%eax),%eax
c0100118:	89 04 24             	mov    %eax,(%esp)
c010011b:	e8 8c 1a 00 00       	call   c0101bac <ksem_destroy>
c0100120:	89 c2                	mov    %eax,%edx
c0100122:	8b 45 08             	mov    0x8(%ebp),%eax
c0100125:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100128:	eb 78                	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_wait:
			tf->eax=ksem_wait((Sema*)tf->ebx);
c010012a:	8b 45 08             	mov    0x8(%ebp),%eax
c010012d:	8b 40 10             	mov    0x10(%eax),%eax
c0100130:	89 04 24             	mov    %eax,(%esp)
c0100133:	e8 df 1a 00 00       	call   c0101c17 <ksem_wait>
c0100138:	89 c2                	mov    %eax,%edx
c010013a:	8b 45 08             	mov    0x8(%ebp),%eax
c010013d:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100140:	eb 60                	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_trywait:
			tf->eax=ksem_trywait((Sema*)tf->ebx);
c0100142:	8b 45 08             	mov    0x8(%ebp),%eax
c0100145:	8b 40 10             	mov    0x10(%eax),%eax
c0100148:	89 04 24             	mov    %eax,(%esp)
c010014b:	e8 32 1b 00 00       	call   c0101c82 <ksem_trywait>
c0100150:	89 c2                	mov    %eax,%edx
c0100152:	8b 45 08             	mov    0x8(%ebp),%eax
c0100155:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100158:	eb 48                	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_post:
			tf->eax=ksem_post((Sema*)tf->ebx);
c010015a:	8b 45 08             	mov    0x8(%ebp),%eax
c010015d:	8b 40 10             	mov    0x10(%eax),%eax
c0100160:	89 04 24             	mov    %eax,(%esp)
c0100163:	e8 41 1b 00 00       	call   c0101ca9 <ksem_post>
c0100168:	89 c2                	mov    %eax,%edx
c010016a:	8b 45 08             	mov    0x8(%ebp),%eax
c010016d:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100170:	eb 30                	jmp    c01001a2 <do_syscall+0x1a2>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c0100172:	8b 45 08             	mov    0x8(%ebp),%eax
c0100175:	8b 50 38             	mov    0x38(%eax),%edx
c0100178:	8b 45 08             	mov    0x8(%ebp),%eax
c010017b:	8b 40 1c             	mov    0x1c(%eax),%eax
c010017e:	89 54 24 10          	mov    %edx,0x10(%esp)
c0100182:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100186:	c7 44 24 08 d8 40 10 	movl   $0xc01040d8,0x8(%esp)
c010018d:	c0 
c010018e:	c7 44 24 04 43 00 00 	movl   $0x43,0x4(%esp)
c0100195:	00 
c0100196:	c7 04 24 05 41 10 c0 	movl   $0xc0104105,(%esp)
c010019d:	e8 b3 2b 00 00       	call   c0102d55 <_panic>
 	}
} 
c01001a2:	c9                   	leave  
c01001a3:	c3                   	ret    

c01001a4 <enable_interrupt>:
	asm volatile("lidt (%0)" : : "r"(data));
}

/* 打开外部中断 */
static inline void
enable_interrupt(void) {
c01001a4:	55                   	push   %ebp
c01001a5:	89 e5                	mov    %esp,%ebp
	asm volatile("sti");
c01001a7:	fb                   	sti    
}
c01001a8:	5d                   	pop    %ebp
c01001a9:	c3                   	ret    

c01001aa <timer_event>:
void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
c01001aa:	55                   	push   %ebp
c01001ab:	89 e5                	mov    %esp,%ebp
	tick++;
c01001ad:	a1 00 10 11 c0       	mov    0xc0111000,%eax
c01001b2:	83 c0 01             	add    $0x1,%eax
c01001b5:	a3 00 10 11 c0       	mov    %eax,0xc0111000
}
c01001ba:	5d                   	pop    %ebp
c01001bb:	c3                   	ret    

c01001bc <keyboard_event>:
static int last_code = -1;
void keyboard_event(int code)
{
c01001bc:	55                   	push   %ebp
c01001bd:	89 e5                	mov    %esp,%ebp
	last_code = code;
c01001bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01001c2:	a3 00 60 10 c0       	mov    %eax,0xc0106000
}
c01001c7:	5d                   	pop    %ebp
c01001c8:	c3                   	ret    

c01001c9 <sys_time>:
int sys_time(void)
{
c01001c9:	55                   	push   %ebp
c01001ca:	89 e5                	mov    %esp,%ebp
	return tick;
c01001cc:	a1 00 10 11 c0       	mov    0xc0111000,%eax
}
c01001d1:	5d                   	pop    %ebp
c01001d2:	c3                   	ret    

c01001d3 <sys_readkey>:
int sys_readkey(void)
{
c01001d3:	55                   	push   %ebp
c01001d4:	89 e5                	mov    %esp,%ebp
c01001d6:	83 ec 10             	sub    $0x10,%esp
	int code = last_code;
c01001d9:	a1 00 60 10 c0       	mov    0xc0106000,%eax
c01001de:	89 45 fc             	mov    %eax,-0x4(%ebp)
	last_code = -1;
c01001e1:	c7 05 00 60 10 c0 ff 	movl   $0xffffffff,0xc0106000
c01001e8:	ff ff ff 
	return code;
c01001eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01001ee:	c9                   	leave  
c01001ef:	c3                   	ret    

c01001f0 <main>:

int main()
{
c01001f0:	55                   	push   %ebp
c01001f1:	89 e5                	mov    %esp,%ebp
c01001f3:	83 e4 f0             	and    $0xfffffff0,%esp
c01001f6:	83 ec 10             	sub    $0x10,%esp
	page_init();
c01001f9:	e8 0e 1c 00 00       	call   c0101e0c <page_init>
	//printk("here");
	init_segment();
c01001fe:	e8 92 2a 00 00       	call   c0102c95 <init_segment>
	pcb_init();
c0100203:	e8 34 0c 00 00       	call   c0100e3c <pcb_init>
	//printk("here");
	init_serial();
c0100208:	e8 9a 08 00 00       	call   c0100aa7 <init_serial>
	init_video();
c010020d:	e8 63 07 00 00       	call   c0100975 <init_video>
	init_timer();
c0100212:	e8 84 09 00 00       	call   c0100b9b <init_timer>
	init_idt();
c0100217:	e8 73 02 00 00       	call   c010048f <init_idt>
	init_intr();
c010021c:	e8 31 00 00 00       	call   c0100252 <init_intr>
	
	//printk("here");

	set_timer_intr_handler(timer_event);
c0100221:	c7 04 24 aa 01 10 c0 	movl   $0xc01001aa,(%esp)
c0100228:	e8 80 05 00 00       	call   c01007ad <set_timer_intr_handler>
	set_keyboard_intr_handler(keyboard_event);
c010022d:	c7 04 24 bc 01 10 c0 	movl   $0xc01001bc,(%esp)
c0100234:	e8 81 05 00 00       	call   c01007ba <set_keyboard_intr_handler>
	//printk("here");
	pcb_new();
c0100239:	e8 40 10 00 00       	call   c010127e <pcb_new>
	//PCB* p=pcb_new();
	enable_interrupt();
c010023e:	e8 61 ff ff ff       	call   c01001a4 <enable_interrupt>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0100243:	f4                   	hlt    
	hlt();
	printk("we are here");
c0100244:	c7 04 24 60 41 10 c0 	movl   $0xc0104160,(%esp)
c010024b:	e8 34 2c 00 00       	call   c0102e84 <printk>
	//to_user(p);
	//printk("here");
	while(1);
c0100250:	eb fe                	jmp    c0100250 <main+0x60>

c0100252 <init_intr>:
#define IRQ_SLAVE	2

/* 初始�?259中断控制器：
 * 硬件中断IRQ�?2号开始，自动发送EOI */
void
init_intr(void) {
c0100252:	55                   	push   %ebp
c0100253:	89 e5                	mov    %esp,%ebp
c0100255:	83 ec 70             	sub    $0x70,%esp
c0100258:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
c010025f:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100263:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100267:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010026a:	ee                   	out    %al,(%dx)
c010026b:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
c0100272:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
c0100276:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c010027a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010027d:	ee                   	out    %al,(%dx)
c010027e:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0100285:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
c0100289:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c010028d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100290:	ee                   	out    %al,(%dx)
c0100291:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
c0100298:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
c010029c:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01002a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01002a3:	ee                   	out    %al,(%dx)
c01002a4:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
c01002ab:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
c01002af:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01002b3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01002b6:	ee                   	out    %al,(%dx)
c01002b7:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
c01002be:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
c01002c2:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01002c6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01002c9:	ee                   	out    %al,(%dx)
c01002ca:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
c01002d1:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
c01002d5:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c01002d9:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01002dc:	ee                   	out    %al,(%dx)
c01002dd:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
c01002e4:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
c01002e8:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c01002ec:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c01002ef:	ee                   	out    %al,(%dx)
c01002f0:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
c01002f7:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
c01002fb:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c01002ff:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0100302:	ee                   	out    %al,(%dx)
c0100303:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
c010030a:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
c010030e:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
c0100312:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0100315:	ee                   	out    %al,(%dx)
c0100316:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
c010031d:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
c0100321:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
c0100325:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100328:	ee                   	out    %al,(%dx)
c0100329:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
c0100330:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
c0100334:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
c0100338:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010033b:	ee                   	out    %al,(%dx)
c010033c:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
c0100343:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
c0100347:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
c010034b:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010034e:	ee                   	out    %al,(%dx)
c010034f:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
c0100356:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
c010035a:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
c010035e:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0100361:	ee                   	out    %al,(%dx)
	outb(IO_PIC1, 0x68);             /* clear specific mask */
	outb(IO_PIC1, 0x0a);             /* read IRR by default */

	outb(IO_PIC2, 0x68);             /* OCW3 */
	outb(IO_PIC2, 0x0a);             /* OCW3 */
}
c0100362:	c9                   	leave  
c0100363:	c3                   	ret    

c0100364 <save_idt>:
	asm volatile("hlt");
}

/* 修改IDRT */
static inline void
save_idt(void *addr, uint32_t size) {
c0100364:	55                   	push   %ebp
c0100365:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0100367:	8b 45 0c             	mov    0xc(%ebp),%eax
c010036a:	83 e8 01             	sub    $0x1,%eax
c010036d:	66 a3 04 10 11 c0    	mov    %ax,0xc0111004
	data[1] = (uint32_t)addr;
c0100373:	8b 45 08             	mov    0x8(%ebp),%eax
c0100376:	66 a3 06 10 11 c0    	mov    %ax,0xc0111006
	data[2] = ((uint32_t)addr) >> 16;
c010037c:	8b 45 08             	mov    0x8(%ebp),%eax
c010037f:	c1 e8 10             	shr    $0x10,%eax
c0100382:	66 a3 08 10 11 c0    	mov    %ax,0xc0111008
	asm volatile("lidt (%0)" : : "r"(data));
c0100388:	b8 04 10 11 c0       	mov    $0xc0111004,%eax
c010038d:	0f 01 18             	lidtl  (%eax)
}
c0100390:	5d                   	pop    %ebp
c0100391:	c3                   	ret    

c0100392 <set_intr>:
/* IDT表的内容 */
struct Gatedesc idt[NR_IRQ];

/* 初始化一个中断门(interrupt gate) */
static void
set_intr(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100392:	55                   	push   %ebp
c0100393:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c0100395:	8b 45 10             	mov    0x10(%ebp),%eax
c0100398:	89 c2                	mov    %eax,%edx
c010039a:	8b 45 08             	mov    0x8(%ebp),%eax
c010039d:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c01003a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01003a3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01003aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01003ad:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c01003b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01003b4:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = INTERRUPT_GATE_32;
c01003b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01003bb:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003bf:	83 e2 f0             	and    $0xfffffff0,%edx
c01003c2:	83 ca 0e             	or     $0xe,%edx
c01003c5:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c01003c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01003cb:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003cf:	83 e2 ef             	and    $0xffffffef,%edx
c01003d2:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c01003d5:	8b 45 14             	mov    0x14(%ebp),%eax
c01003d8:	83 e0 03             	and    $0x3,%eax
c01003db:	89 c2                	mov    %eax,%edx
c01003dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01003e0:	83 e2 03             	and    $0x3,%edx
c01003e3:	89 d1                	mov    %edx,%ecx
c01003e5:	c1 e1 05             	shl    $0x5,%ecx
c01003e8:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003ec:	83 e2 9f             	and    $0xffffff9f,%edx
c01003ef:	09 ca                	or     %ecx,%edx
c01003f1:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c01003f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01003f7:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003fb:	83 ca 80             	or     $0xffffff80,%edx
c01003fe:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100401:	8b 45 10             	mov    0x10(%ebp),%eax
c0100404:	c1 e8 10             	shr    $0x10,%eax
c0100407:	89 c2                	mov    %eax,%edx
c0100409:	8b 45 08             	mov    0x8(%ebp),%eax
c010040c:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100410:	5d                   	pop    %ebp
c0100411:	c3                   	ret    

c0100412 <set_trap>:

/* 初始化一个陷阱门(trap gate) */
static void
set_trap(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100412:	55                   	push   %ebp
c0100413:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c0100415:	8b 45 10             	mov    0x10(%ebp),%eax
c0100418:	89 c2                	mov    %eax,%edx
c010041a:	8b 45 08             	mov    0x8(%ebp),%eax
c010041d:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100420:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100423:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010042a:	8b 45 08             	mov    0x8(%ebp),%eax
c010042d:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100431:	8b 45 08             	mov    0x8(%ebp),%eax
c0100434:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = TRAP_GATE_32;
c0100438:	8b 45 08             	mov    0x8(%ebp),%eax
c010043b:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010043f:	83 ca 0f             	or     $0xf,%edx
c0100442:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c0100445:	8b 45 08             	mov    0x8(%ebp),%eax
c0100448:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010044c:	83 e2 ef             	and    $0xffffffef,%edx
c010044f:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c0100452:	8b 45 14             	mov    0x14(%ebp),%eax
c0100455:	83 e0 03             	and    $0x3,%eax
c0100458:	89 c2                	mov    %eax,%edx
c010045a:	8b 45 08             	mov    0x8(%ebp),%eax
c010045d:	83 e2 03             	and    $0x3,%edx
c0100460:	89 d1                	mov    %edx,%ecx
c0100462:	c1 e1 05             	shl    $0x5,%ecx
c0100465:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100469:	83 e2 9f             	and    $0xffffff9f,%edx
c010046c:	09 ca                	or     %ecx,%edx
c010046e:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c0100471:	8b 45 08             	mov    0x8(%ebp),%eax
c0100474:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100478:	83 ca 80             	or     $0xffffff80,%edx
c010047b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c010047e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100481:	c1 e8 10             	shr    $0x10,%eax
c0100484:	89 c2                	mov    %eax,%edx
c0100486:	8b 45 08             	mov    0x8(%ebp),%eax
c0100489:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c010048d:	5d                   	pop    %ebp
c010048e:	c3                   	ret    

c010048f <init_idt>:
void vec13();
void vec14();
void vecsys();
void irq_empty();

void init_idt() {
c010048f:	55                   	push   %ebp
c0100490:	89 e5                	mov    %esp,%ebp
c0100492:	83 ec 20             	sub    $0x20,%esp
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c0100495:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010049c:	eb 31                	jmp    c01004cf <init_idt+0x40>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
c010049e:	b8 55 2f 10 c0       	mov    $0xc0102f55,%eax
c01004a3:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01004a6:	c1 e2 03             	shl    $0x3,%edx
c01004a9:	81 c2 20 4f 16 c0    	add    $0xc0164f20,%edx
c01004af:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004b6:	00 
c01004b7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004bb:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004c2:	00 
c01004c3:	89 14 24             	mov    %edx,(%esp)
c01004c6:	e8 47 ff ff ff       	call   c0100412 <set_trap>
void irq_empty();

void init_idt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01004cb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01004cf:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
c01004d6:	7e c6                	jle    c010049e <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
	}

	/* 设置异常的中断处�?*/
	set_trap(idt + 0, SEG_KERNEL_CODE, (uint32_t)vec0, DPL_KERNEL);
c01004d8:	b8 aa 2e 10 c0       	mov    $0xc0102eaa,%eax
c01004dd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004e4:	00 
c01004e5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004e9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004f0:	00 
c01004f1:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c01004f8:	e8 15 ff ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c01004fd:	b8 b3 2e 10 c0       	mov    $0xc0102eb3,%eax
c0100502:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100509:	00 
c010050a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010050e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100515:	00 
c0100516:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c010051d:	e8 f0 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100522:	b8 bc 2e 10 c0       	mov    $0xc0102ebc,%eax
c0100527:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010052e:	00 
c010052f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100533:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010053a:	00 
c010053b:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c0100542:	e8 cb fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c0100547:	b8 c5 2e 10 c0       	mov    $0xc0102ec5,%eax
c010054c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100553:	00 
c0100554:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100558:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010055f:	00 
c0100560:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c0100567:	e8 a6 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c010056c:	b8 ce 2e 10 c0       	mov    $0xc0102ece,%eax
c0100571:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100578:	00 
c0100579:	89 44 24 08          	mov    %eax,0x8(%esp)
c010057d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100584:	00 
c0100585:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c010058c:	e8 81 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c0100591:	b8 d7 2e 10 c0       	mov    $0xc0102ed7,%eax
c0100596:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010059d:	00 
c010059e:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005a2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005a9:	00 
c01005aa:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c01005b1:	e8 5c fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c01005b6:	b8 e0 2e 10 c0       	mov    $0xc0102ee0,%eax
c01005bb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005c2:	00 
c01005c3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005c7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005ce:	00 
c01005cf:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c01005d6:	e8 37 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c01005db:	b8 e9 2e 10 c0       	mov    $0xc0102ee9,%eax
c01005e0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005e7:	00 
c01005e8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005ec:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005f3:	00 
c01005f4:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c01005fb:	e8 12 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c0100600:	b8 f2 2e 10 c0       	mov    $0xc0102ef2,%eax
c0100605:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010060c:	00 
c010060d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100611:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100618:	00 
c0100619:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c0100620:	e8 ed fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c0100625:	b8 f9 2e 10 c0       	mov    $0xc0102ef9,%eax
c010062a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100631:	00 
c0100632:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100636:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010063d:	00 
c010063e:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c0100645:	e8 c8 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c010064a:	b8 02 2f 10 c0       	mov    $0xc0102f02,%eax
c010064f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100656:	00 
c0100657:	89 44 24 08          	mov    %eax,0x8(%esp)
c010065b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100662:	00 
c0100663:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c010066a:	e8 a3 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c010066f:	b8 09 2f 10 c0       	mov    $0xc0102f09,%eax
c0100674:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010067b:	00 
c010067c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100680:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100687:	00 
c0100688:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c010068f:	e8 7e fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c0100694:	b8 10 2f 10 c0       	mov    $0xc0102f10,%eax
c0100699:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006a0:	00 
c01006a1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006a5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006ac:	00 
c01006ad:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c01006b4:	e8 59 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c01006b9:	b8 17 2f 10 c0       	mov    $0xc0102f17,%eax
c01006be:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006c5:	00 
c01006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ca:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006d1:	00 
c01006d2:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c01006d9:	e8 34 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c01006de:	b8 1e 2f 10 c0       	mov    $0xc0102f1e,%eax
c01006e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006ea:	00 
c01006eb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ef:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006f6:	00 
c01006f7:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c01006fe:	e8 0f fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100703:	b8 25 2f 10 c0       	mov    $0xc0102f25,%eax
c0100708:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c010070f:	00 
c0100710:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100714:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010071b:	00 
c010071c:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c0100723:	e8 ea fc ff ff       	call   c0100412 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c0100728:	b8 31 2f 10 c0       	mov    $0xc0102f31,%eax
c010072d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100734:	00 
c0100735:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100739:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100740:	00 
c0100741:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c0100748:	e8 45 fc ff ff       	call   c0100392 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c010074d:	b8 3d 2f 10 c0       	mov    $0xc0102f3d,%eax
c0100752:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100759:	00 
c010075a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010075e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100765:	00 
c0100766:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c010076d:	e8 20 fc ff ff       	call   c0100392 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c0100772:	b8 49 2f 10 c0       	mov    $0xc0102f49,%eax
c0100777:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010077e:	00 
c010077f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100783:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010078a:	00 
c010078b:	c7 04 24 90 50 16 c0 	movl   $0xc0165090,(%esp)
c0100792:	e8 fb fb ff ff       	call   c0100392 <set_intr>
	 * x86.h提供了相关内联汇编的支持
	 * 然后将hlt()删除
	 * 
	 * */
	
	save_idt(idt, sizeof(idt));
c0100797:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
c010079e:	00 
c010079f:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c01007a6:	e8 b9 fb ff ff       	call   c0100364 <save_idt>
}
c01007ab:	c9                   	leave  
c01007ac:	c3                   	ret    

c01007ad <set_timer_intr_handler>:

static void (*do_timer)(void);
static void (*do_keyboard)(int);

void
set_timer_intr_handler( void (*ptr)(void) ) {
c01007ad:	55                   	push   %ebp
c01007ae:	89 e5                	mov    %esp,%ebp
	do_timer = ptr;
c01007b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01007b3:	a3 0c 10 11 c0       	mov    %eax,0xc011100c
}
c01007b8:	5d                   	pop    %ebp
c01007b9:	c3                   	ret    

c01007ba <set_keyboard_intr_handler>:
void
set_keyboard_intr_handler( void (*ptr)(int) ) {
c01007ba:	55                   	push   %ebp
c01007bb:	89 e5                	mov    %esp,%ebp
	do_keyboard = ptr;
c01007bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01007c0:	a3 10 10 11 c0       	mov    %eax,0xc0111010
}
c01007c5:	5d                   	pop    %ebp
c01007c6:	c3                   	ret    

c01007c7 <irq_handle>:

/* TrapFrame的定义在include/memory.h
 * 请仔细理解这段程序的含义，这些内容将在后续的实验中被反复使用�?*/
void
irq_handle(struct TrapFrame *tf) {
c01007c7:	55                   	push   %ebp
c01007c8:	89 e5                	mov    %esp,%ebp
c01007ca:	83 ec 48             	sub    $0x48,%esp
	pcbnow->tf=tf;
c01007cd:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01007d2:	8b 55 08             	mov    0x8(%ebp),%edx
c01007d5:	89 10                	mov    %edx,(%eax)
	if (tf->irq == 0x80) {
c01007d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01007da:	8b 40 30             	mov    0x30(%eax),%eax
c01007dd:	3d 80 00 00 00       	cmp    $0x80,%eax
c01007e2:	75 10                	jne    c01007f4 <irq_handle+0x2d>
		do_syscall(tf);
c01007e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01007e7:	89 04 24             	mov    %eax,(%esp)
c01007ea:	e8 11 f8 ff ff       	call   c0100000 <do_syscall>
c01007ef:	e9 7f 01 00 00       	jmp    c0100973 <irq_handle+0x1ac>
	}
	else if(tf->irq < 1000) {
c01007f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01007f7:	8b 40 30             	mov    0x30(%eax),%eax
c01007fa:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c01007ff:	7f 73                	jg     c0100874 <irq_handle+0xad>
		if(tf->irq == -1) {
c0100801:	8b 45 08             	mov    0x8(%ebp),%eax
c0100804:	8b 40 30             	mov    0x30(%eax),%eax
c0100807:	83 f8 ff             	cmp    $0xffffffff,%eax
c010080a:	75 1e                	jne    c010082a <irq_handle+0x63>
			printk("%s, %d: Unhandled exception!\n", __FUNCTION__, __LINE__);
c010080c:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
c0100813:	00 
c0100814:	c7 44 24 04 de 41 10 	movl   $0xc01041de,0x4(%esp)
c010081b:	c0 
c010081c:	c7 04 24 6c 41 10 c0 	movl   $0xc010416c,(%esp)
c0100823:	e8 5c 26 00 00       	call   c0102e84 <printk>
c0100828:	eb 26                	jmp    c0100850 <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c010082a:	8b 45 08             	mov    0x8(%ebp),%eax
c010082d:	8b 40 30             	mov    0x30(%eax),%eax
c0100830:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100834:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c010083b:	00 
c010083c:	c7 44 24 04 de 41 10 	movl   $0xc01041de,0x4(%esp)
c0100843:	c0 
c0100844:	c7 04 24 8c 41 10 c0 	movl   $0xc010418c,(%esp)
c010084b:	e8 34 26 00 00       	call   c0102e84 <printk>
		}
		assert(0);
c0100850:	c7 44 24 0c af 41 10 	movl   $0xc01041af,0xc(%esp)
c0100857:	c0 
c0100858:	c7 44 24 08 b1 41 10 	movl   $0xc01041b1,0x8(%esp)
c010085f:	c0 
c0100860:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c0100867:	00 
c0100868:	c7 04 24 c6 41 10 c0 	movl   $0xc01041c6,(%esp)
c010086f:	e8 e1 24 00 00       	call   c0102d55 <_panic>
	}

	else if (tf->irq == 1000) {
c0100874:	8b 45 08             	mov    0x8(%ebp),%eax
c0100877:	8b 40 30             	mov    0x30(%eax),%eax
c010087a:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c010087f:	75 18                	jne    c0100899 <irq_handle+0xd2>
		do_timer();
c0100881:	a1 0c 10 11 c0       	mov    0xc011100c,%eax
c0100886:	ff d0                	call   *%eax
		schedule(1);
c0100888:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010088f:	e8 d1 20 00 00       	call   c0102965 <schedule>
c0100894:	e9 da 00 00 00       	jmp    c0100973 <irq_handle+0x1ac>
	} else if (tf->irq == 1001) {
c0100899:	8b 45 08             	mov    0x8(%ebp),%eax
c010089c:	8b 40 30             	mov    0x30(%eax),%eax
c010089f:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c01008a4:	75 76                	jne    c010091c <irq_handle+0x155>
c01008a6:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008b0:	89 c2                	mov    %eax,%edx
c01008b2:	ec                   	in     (%dx),%al
c01008b3:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c01008b6:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c01008ba:	0f b6 c0             	movzbl %al,%eax
c01008bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01008c0:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01008ca:	89 c2                	mov    %eax,%edx
c01008cc:	ec                   	in     (%dx),%al
c01008cd:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c01008d0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c01008d4:	0f b6 c0             	movzbl %al,%eax
c01008d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c01008da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008dd:	83 c8 80             	or     $0xffffff80,%eax
c01008e0:	0f b6 c0             	movzbl %al,%eax
c01008e3:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c01008ea:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01008ed:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01008f1:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01008f4:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c01008f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008f8:	0f b6 c0             	movzbl %al,%eax
c01008fb:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c0100902:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0100905:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100909:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010090c:	ee                   	out    %al,(%dx)
		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c010090d:	a1 10 10 11 c0       	mov    0xc0111010,%eax
c0100912:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100915:	89 14 24             	mov    %edx,(%esp)
c0100918:	ff d0                	call   *%eax
c010091a:	eb 57                	jmp    c0100973 <irq_handle+0x1ac>
	}else if(tf->irq==1014){
c010091c:	8b 45 08             	mov    0x8(%ebp),%eax
c010091f:	8b 40 30             	mov    0x30(%eax),%eax
c0100922:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c0100927:	74 4a                	je     c0100973 <irq_handle+0x1ac>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100929:	8b 45 08             	mov    0x8(%ebp),%eax
c010092c:	8b 40 30             	mov    0x30(%eax),%eax
c010092f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100933:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
c010093a:	00 
c010093b:	c7 44 24 04 de 41 10 	movl   $0xc01041de,0x4(%esp)
c0100942:	c0 
c0100943:	c7 04 24 8c 41 10 c0 	movl   $0xc010418c,(%esp)
c010094a:	e8 35 25 00 00       	call   c0102e84 <printk>
		assert(0);
c010094f:	c7 44 24 0c af 41 10 	movl   $0xc01041af,0xc(%esp)
c0100956:	c0 
c0100957:	c7 44 24 08 b1 41 10 	movl   $0xc01041b1,0x8(%esp)
c010095e:	c0 
c010095f:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0100966:	00 
c0100967:	c7 04 24 c6 41 10 c0 	movl   $0xc01041c6,(%esp)
c010096e:	e8 e2 23 00 00       	call   c0102d55 <_panic>
	}
}
c0100973:	c9                   	leave  
c0100974:	c3                   	ret    

c0100975 <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c0100975:	55                   	push   %ebp
c0100976:	89 e5                	mov    %esp,%ebp
c0100978:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c010097b:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100982:	00 
c0100983:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010098a:	00 
c010098b:	c7 04 24 20 10 11 c0 	movl   $0xc0111020,(%esp)
c0100992:	e8 7b 29 00 00       	call   c0103312 <memset>
	memset(vref, 0, SCR_SIZE);
c0100997:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010099e:	00 
c010099f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01009a6:	00 
c01009a7:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009ae:	e8 5f 29 00 00       	call   c0103312 <memset>
}
c01009b3:	c9                   	leave  
c01009b4:	c3                   	ret    

c01009b5 <prepare_buffer>:

void prepare_buffer(void) {
c01009b5:	55                   	push   %ebp
c01009b6:	89 e5                	mov    %esp,%ebp
c01009b8:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c01009bb:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009c2:	00 
c01009c3:	c7 44 24 04 20 10 11 	movl   $0xc0111020,0x4(%esp)
c01009ca:	c0 
c01009cb:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009d2:	e8 1e 29 00 00       	call   c01032f5 <memcpy>
#endif
	vmem = vbuf;
c01009d7:	c7 05 04 60 10 c0 20 	movl   $0xc0111020,0xc0106004
c01009de:	10 11 c0 
	memset(vmem, 0, SCR_SIZE);
c01009e1:	a1 04 60 10 c0       	mov    0xc0106004,%eax
c01009e6:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009ed:	00 
c01009ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01009f5:	00 
c01009f6:	89 04 24             	mov    %eax,(%esp)
c01009f9:	e8 14 29 00 00       	call   c0103312 <memset>
}
c01009fe:	c9                   	leave  
c01009ff:	c3                   	ret    

c0100a00 <display_buffer>:

void display_buffer(void) {
c0100a00:	55                   	push   %ebp
c0100a01:	89 e5                	mov    %esp,%ebp
c0100a03:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c0100a06:	c7 45 f8 20 10 11 c0 	movl   $0xc0111020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c0100a0d:	c7 45 f4 20 0a 12 c0 	movl   $0xc0120a20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c0100a14:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c0100a1b:	c7 05 04 60 10 c0 00 	movl   $0xa0000,0xc0106004
c0100a22:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a25:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100a2c:	eb 4c                	jmp    c0100a7a <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c0100a2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a31:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a38:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a3b:	01 d0                	add    %edx,%eax
c0100a3d:	8b 10                	mov    (%eax),%edx
c0100a3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a42:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a4c:	01 c8                	add    %ecx,%eax
c0100a4e:	8b 00                	mov    (%eax),%eax
c0100a50:	39 c2                	cmp    %eax,%edx
c0100a52:	74 22                	je     c0100a76 <display_buffer+0x76>
			mem[i] = buf[i];
c0100a54:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a57:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100a61:	01 c2                	add    %eax,%edx
c0100a63:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a66:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a70:	01 c8                	add    %ecx,%eax
c0100a72:	8b 00                	mov    (%eax),%eax
c0100a74:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a76:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100a7a:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c0100a81:	7e ab                	jle    c0100a2e <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c0100a83:	c9                   	leave  
c0100a84:	c3                   	ret    

c0100a85 <sys_pr>:

void sys_pr(void *src)
{
c0100a85:	55                   	push   %ebp
c0100a86:	89 e5                	mov    %esp,%ebp
c0100a88:	57                   	push   %edi
c0100a89:	56                   	push   %esi
c0100a8a:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c0100a8b:	8b 1d 04 60 10 c0    	mov    0xc0106004,%ebx
c0100a91:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c0100a96:	8b 55 08             	mov    0x8(%ebp),%edx
c0100a99:	89 c1                	mov    %eax,%ecx
c0100a9b:	89 d6                	mov    %edx,%esi
c0100a9d:	89 df                	mov    %ebx,%edi
c0100a9f:	fc                   	cld    
c0100aa0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c0100aa2:	5b                   	pop    %ebx
c0100aa3:	5e                   	pop    %esi
c0100aa4:	5f                   	pop    %edi
c0100aa5:	5d                   	pop    %ebp
c0100aa6:	c3                   	ret    

c0100aa7 <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c0100aa7:	55                   	push   %ebp
c0100aa8:	89 e5                	mov    %esp,%ebp
c0100aaa:	83 ec 40             	sub    $0x40,%esp
c0100aad:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c0100ab4:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c0100ab8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100abc:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100abf:	ee                   	out    %al,(%dx)
c0100ac0:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c0100ac7:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c0100acb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100acf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ad2:	ee                   	out    %al,(%dx)
c0100ad3:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c0100ada:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0100ade:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100ae2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100ae5:	ee                   	out    %al,(%dx)
c0100ae6:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c0100aed:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c0100af1:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100af5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100af8:	ee                   	out    %al,(%dx)
c0100af9:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c0100b00:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100b04:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100b08:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100b0b:	ee                   	out    %al,(%dx)
c0100b0c:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100b13:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100b17:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100b1b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100b1e:	ee                   	out    %al,(%dx)
c0100b1f:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100b26:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100b2a:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100b2e:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100b31:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100b32:	c9                   	leave  
c0100b33:	c3                   	ret    

c0100b34 <serial_idle>:

static inline int serial_idle(void) {
c0100b34:	55                   	push   %ebp
c0100b35:	89 e5                	mov    %esp,%ebp
c0100b37:	83 ec 10             	sub    $0x10,%esp
c0100b3a:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100b41:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100b44:	89 c2                	mov    %eax,%edx
c0100b46:	ec                   	in     (%dx),%al
c0100b47:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100b4a:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100b4e:	0f b6 c0             	movzbl %al,%eax
c0100b51:	83 e0 20             	and    $0x20,%eax
c0100b54:	85 c0                	test   %eax,%eax
c0100b56:	0f 95 c0             	setne  %al
c0100b59:	0f b6 c0             	movzbl %al,%eax
}
c0100b5c:	c9                   	leave  
c0100b5d:	c3                   	ret    

c0100b5e <serial_printc>:

void serial_printc(int ch) {
c0100b5e:	55                   	push   %ebp
c0100b5f:	89 e5                	mov    %esp,%ebp
c0100b61:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100b64:	90                   	nop
c0100b65:	e8 ca ff ff ff       	call   c0100b34 <serial_idle>
c0100b6a:	85 c0                	test   %eax,%eax
c0100b6c:	74 f7                	je     c0100b65 <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100b6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b71:	0f b6 c0             	movzbl %al,%eax
c0100b74:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100b7b:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100b7e:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100b82:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100b85:	ee                   	out    %al,(%dx)
}
c0100b86:	c9                   	leave  
c0100b87:	c3                   	ret    

c0100b88 <putchar>:

void putchar(int ch){
c0100b88:	55                   	push   %ebp
c0100b89:	89 e5                	mov    %esp,%ebp
c0100b8b:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b91:	89 04 24             	mov    %eax,(%esp)
c0100b94:	e8 c5 ff ff ff       	call   c0100b5e <serial_printc>
c0100b99:	c9                   	leave  
c0100b9a:	c3                   	ret    

c0100b9b <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100b9b:	55                   	push   %ebp
c0100b9c:	89 e5                	mov    %esp,%ebp
c0100b9e:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100ba1:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100ba8:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100baf:	7e 24                	jle    c0100bd5 <init_timer+0x3a>
c0100bb1:	c7 44 24 0c e9 41 10 	movl   $0xc01041e9,0xc(%esp)
c0100bb8:	c0 
c0100bb9:	c7 44 24 08 f9 41 10 	movl   $0xc01041f9,0x8(%esp)
c0100bc0:	c0 
c0100bc1:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100bc8:	00 
c0100bc9:	c7 04 24 0e 42 10 c0 	movl   $0xc010420e,(%esp)
c0100bd0:	e8 80 21 00 00       	call   c0102d55 <_panic>
c0100bd5:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100bdc:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100be0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100be4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100be7:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100be8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100beb:	99                   	cltd   
c0100bec:	c1 ea 18             	shr    $0x18,%edx
c0100bef:	01 d0                	add    %edx,%eax
c0100bf1:	0f b6 c0             	movzbl %al,%eax
c0100bf4:	29 d0                	sub    %edx,%eax
c0100bf6:	0f b6 c0             	movzbl %al,%eax
c0100bf9:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100c00:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100c03:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100c07:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100c0a:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c0e:	99                   	cltd   
c0100c0f:	c1 ea 18             	shr    $0x18,%edx
c0100c12:	01 d0                	add    %edx,%eax
c0100c14:	c1 f8 08             	sar    $0x8,%eax
c0100c17:	0f b6 c0             	movzbl %al,%eax
c0100c1a:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100c21:	88 45 df             	mov    %al,-0x21(%ebp)
c0100c24:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100c28:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100c2b:	ee                   	out    %al,(%dx)
}
c0100c2c:	c9                   	leave  
c0100c2d:	c3                   	ret    

c0100c2e <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0100c2e:	55                   	push   %ebp
c0100c2f:	89 e5                	mov    %esp,%ebp
c0100c31:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0100c34:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0100c38:	75 24                	jne    c0100c5e <list_add+0x30>
c0100c3a:	c7 44 24 0c 24 42 10 	movl   $0xc0104224,0xc(%esp)
c0100c41:	c0 
c0100c42:	c7 44 24 08 31 42 10 	movl   $0xc0104231,0x8(%esp)
c0100c49:	c0 
c0100c4a:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0100c51:	00 
c0100c52:	c7 04 24 46 42 10 c0 	movl   $0xc0104246,(%esp)
c0100c59:	e8 f7 20 00 00       	call   c0102d55 <_panic>
	data->prev = prev;
c0100c5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c61:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c64:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0100c66:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c69:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c6c:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0100c6f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c73:	74 09                	je     c0100c7e <list_add+0x50>
c0100c75:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c78:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c7b:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0100c7e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100c82:	74 08                	je     c0100c8c <list_add+0x5e>
c0100c84:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c87:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c8a:	89 10                	mov    %edx,(%eax)
}
c0100c8c:	c9                   	leave  
c0100c8d:	c3                   	ret    

c0100c8e <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0100c8e:	55                   	push   %ebp
c0100c8f:	89 e5                	mov    %esp,%ebp
c0100c91:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100c94:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c98:	75 24                	jne    c0100cbe <list_add_before+0x30>
c0100c9a:	c7 44 24 0c 5c 42 10 	movl   $0xc010425c,0xc(%esp)
c0100ca1:	c0 
c0100ca2:	c7 44 24 08 31 42 10 	movl   $0xc0104231,0x8(%esp)
c0100ca9:	c0 
c0100caa:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0100cb1:	00 
c0100cb2:	c7 04 24 46 42 10 c0 	movl   $0xc0104246,(%esp)
c0100cb9:	e8 97 20 00 00       	call   c0102d55 <_panic>
	list_add(one->prev, one, data);
c0100cbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cc1:	8b 00                	mov    (%eax),%eax
c0100cc3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100cc6:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100cca:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ccd:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100cd1:	89 04 24             	mov    %eax,(%esp)
c0100cd4:	e8 55 ff ff ff       	call   c0100c2e <list_add>
}
c0100cd9:	c9                   	leave  
c0100cda:	c3                   	ret    

c0100cdb <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0100cdb:	55                   	push   %ebp
c0100cdc:	89 e5                	mov    %esp,%ebp
c0100cde:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0100ce1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100ce5:	75 24                	jne    c0100d0b <list_del+0x30>
c0100ce7:	c7 44 24 0c 24 42 10 	movl   $0xc0104224,0xc(%esp)
c0100cee:	c0 
c0100cef:	c7 44 24 08 31 42 10 	movl   $0xc0104231,0x8(%esp)
c0100cf6:	c0 
c0100cf7:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0100cfe:	00 
c0100cff:	c7 04 24 46 42 10 c0 	movl   $0xc0104246,(%esp)
c0100d06:	e8 4a 20 00 00       	call   c0102d55 <_panic>
	list *prev = data->prev;
c0100d0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d0e:	8b 00                	mov    (%eax),%eax
c0100d10:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0100d13:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d16:	8b 40 04             	mov    0x4(%eax),%eax
c0100d19:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0100d1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100d20:	74 09                	je     c0100d2b <list_del+0x50>
c0100d22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d25:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100d28:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0100d2b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100d2f:	74 08                	je     c0100d39 <list_del+0x5e>
c0100d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100d34:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100d37:	89 10                	mov    %edx,(%eax)
}
c0100d39:	c9                   	leave  
c0100d3a:	c3                   	ret    

c0100d3b <list_init>:

static inline void
list_init(list *one) {
c0100d3b:	55                   	push   %ebp
c0100d3c:	89 e5                	mov    %esp,%ebp
c0100d3e:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100d41:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100d45:	75 24                	jne    c0100d6b <list_init+0x30>
c0100d47:	c7 44 24 0c 5c 42 10 	movl   $0xc010425c,0xc(%esp)
c0100d4e:	c0 
c0100d4f:	c7 44 24 08 31 42 10 	movl   $0xc0104231,0x8(%esp)
c0100d56:	c0 
c0100d57:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0100d5e:	00 
c0100d5f:	c7 04 24 46 42 10 c0 	movl   $0xc0104246,(%esp)
c0100d66:	e8 ea 1f 00 00       	call   c0102d55 <_panic>
	one->prev = one->next = one;
c0100d6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d6e:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d71:	89 50 04             	mov    %edx,0x4(%eax)
c0100d74:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d77:	8b 50 04             	mov    0x4(%eax),%edx
c0100d7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d7d:	89 10                	mov    %edx,(%eax)
}
c0100d7f:	c9                   	leave  
c0100d80:	c3                   	ret    

c0100d81 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100d81:	55                   	push   %ebp
c0100d82:	89 e5                	mov    %esp,%ebp
c0100d84:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100d87:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d8a:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100d8f:	77 21                	ja     c0100db2 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100d91:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d94:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100d98:	c7 44 24 08 68 42 10 	movl   $0xc0104268,0x8(%esp)
c0100d9f:	c0 
c0100da0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100da3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100da7:	8b 45 08             	mov    0x8(%ebp),%eax
c0100daa:	89 04 24             	mov    %eax,(%esp)
c0100dad:	e8 a3 1f 00 00       	call   c0102d55 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100db2:	8b 45 10             	mov    0x10(%ebp),%eax
c0100db5:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100dba:	c9                   	leave  
c0100dbb:	c3                   	ret    

c0100dbc <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100dbc:	55                   	push   %ebp
c0100dbd:	89 e5                	mov    %esp,%ebp
c0100dbf:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100dc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dc5:	c1 e8 0c             	shr    $0xc,%eax
c0100dc8:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100dcd:	76 21                	jbe    c0100df0 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100dcf:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dd2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100dd6:	c7 44 24 08 8c 42 10 	movl   $0xc010428c,0x8(%esp)
c0100ddd:	c0 
c0100dde:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100de1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100de5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100de8:	89 04 24             	mov    %eax,(%esp)
c0100deb:	e8 65 1f 00 00       	call   c0102d55 <_panic>
	return (void *)(pa + KERNBASE);
c0100df0:	8b 45 10             	mov    0x10(%ebp),%eax
c0100df3:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100df8:	c9                   	leave  
c0100df9:	c3                   	ret    

c0100dfa <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100dfa:	55                   	push   %ebp
c0100dfb:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100dfd:	8b 55 08             	mov    0x8(%ebp),%edx
c0100e00:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0100e05:	29 c2                	sub    %eax,%edx
c0100e07:	89 d0                	mov    %edx,%eax
c0100e09:	c1 f8 03             	sar    $0x3,%eax
c0100e0c:	c1 e0 0c             	shl    $0xc,%eax
}
c0100e0f:	5d                   	pop    %ebp
c0100e10:	c3                   	ret    

c0100e11 <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100e11:	55                   	push   %ebp
c0100e12:	89 e5                	mov    %esp,%ebp
c0100e14:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100e17:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e1a:	89 04 24             	mov    %eax,(%esp)
c0100e1d:	e8 d8 ff ff ff       	call   c0100dfa <page2pa>
c0100e22:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100e26:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100e2d:	00 
c0100e2e:	c7 04 24 af 42 10 c0 	movl   $0xc01042af,(%esp)
c0100e35:	e8 82 ff ff ff       	call   c0100dbc <_kaddr>
}
c0100e3a:	c9                   	leave  
c0100e3b:	c3                   	ret    

c0100e3c <pcb_init>:
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];


void pcb_init()
{
c0100e3c:	55                   	push   %ebp
c0100e3d:	89 e5                	mov    %esp,%ebp
c0100e3f:	83 ec 28             	sub    $0x28,%esp
	/*int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}*/
	list_init(&ready);
c0100e42:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100e49:	e8 ed fe ff ff       	call   c0100d3b <list_init>
	list_init(&block);
c0100e4e:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0100e55:	e8 e1 fe ff ff       	call   c0100d3b <list_init>
	list_init(&free);
c0100e5a:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e61:	e8 d5 fe ff ff       	call   c0100d3b <list_init>
	now=&ready;
c0100e66:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0100e6d:	4f 16 c0 
	pcbnow=&init;
c0100e70:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100e77:	3f 16 c0 
	init.pgdir=kern_pgdir;
c0100e7a:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100e7f:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100e84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e8b:	eb 48                	jmp    c0100ed5 <pcb_init+0x99>
		list_add_before(&free,&pcb[i].plist);
c0100e8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e90:	c1 e0 0c             	shl    $0xc,%eax
c0100e93:	05 40 57 16 c0       	add    $0xc0165740,%eax
c0100e98:	83 c0 08             	add    $0x8,%eax
c0100e9b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100e9f:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100ea6:	e8 e3 fd ff ff       	call   c0100c8e <list_add_before>
		pcb[i].pid=i+1;
c0100eab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eae:	83 c0 01             	add    $0x1,%eax
c0100eb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100eb4:	c1 e2 0c             	shl    $0xc,%edx
c0100eb7:	81 c2 50 57 16 c0    	add    $0xc0165750,%edx
c0100ebd:	89 02                	mov    %eax,(%edx)
		pcb[i].ppid=0;
c0100ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ec2:	c1 e0 0c             	shl    $0xc,%eax
c0100ec5:	05 50 57 16 c0       	add    $0xc0165750,%eax
c0100eca:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&free);
	now=&ready;
	pcbnow=&init;
	init.pgdir=kern_pgdir;
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100ed1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ed5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0100ed9:	7e b2                	jle    c0100e8d <pcb_init+0x51>
		list_add_before(&free,&pcb[i].plist);
		pcb[i].pid=i+1;
		pcb[i].ppid=0;
	}
			
}
c0100edb:	c9                   	leave  
c0100edc:	c3                   	ret    

c0100edd <pcb_alloc>:

static uint32_t cntpid=0;
PCB* pcb_alloc()
{
c0100edd:	55                   	push   %ebp
c0100ede:	89 e5                	mov    %esp,%ebp
c0100ee0:	83 ec 38             	sub    $0x38,%esp
	list *lnext=&free;
c0100ee3:	c7 45 f4 08 4f 16 c0 	movl   $0xc0164f08,-0xc(%ebp)
	list *freenext;
	if(lnext->next==lnext)
c0100eea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eed:	8b 40 04             	mov    0x4(%eax),%eax
c0100ef0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100ef3:	75 11                	jne    c0100f06 <pcb_alloc+0x29>
	{
		freenext=NULL;
c0100ef5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		return NULL;
c0100efc:	b8 00 00 00 00       	mov    $0x0,%eax
c0100f01:	e9 0f 01 00 00       	jmp    c0101015 <pcb_alloc+0x138>
	}
	else
	{
		freenext=lnext->next;
c0100f06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f09:	8b 40 04             	mov    0x4(%eax),%eax
c0100f0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	PCB* p=list_entry(freenext,PCB,plist);
c0100f0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f12:	83 e8 08             	sub    $0x8,%eax
c0100f15:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100f18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100f1f:	e8 62 10 00 00       	call   c0101f86 <page_alloc>
c0100f24:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (pp == NULL) return NULL;
c0100f27:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0100f2b:	75 0a                	jne    c0100f37 <pcb_alloc+0x5a>
c0100f2d:	b8 00 00 00 00       	mov    $0x0,%eax
c0100f32:	e9 de 00 00 00       	jmp    c0101015 <pcb_alloc+0x138>
	p->pgdir = page2kva(pp);
c0100f37:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f3a:	89 04 24             	mov    %eax,(%esp)
c0100f3d:	e8 cf fe ff ff       	call   c0100e11 <page2kva>
c0100f42:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f45:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100f48:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f4b:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100f4f:	8d 50 01             	lea    0x1(%eax),%edx
c0100f52:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f55:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100f59:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f5c:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100f63:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100f68:	8d 50 01             	lea    0x1(%eax),%edx
c0100f6b:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100f71:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f74:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100f77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f7a:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100f81:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f84:	83 c0 08             	add    $0x8,%eax
c0100f87:	89 04 24             	mov    %eax,(%esp)
c0100f8a:	e8 4c fd ff ff       	call   c0100cdb <list_del>
	list_add_before(&ready,&p->plist);
c0100f8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f92:	83 c0 08             	add    $0x8,%eax
c0100f95:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100f99:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100fa0:	e8 e9 fc ff ff       	call   c0100c8e <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100fa5:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100fab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fae:	8b 40 04             	mov    0x4(%eax),%eax
c0100fb1:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100fb8:	00 
c0100fb9:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100fbd:	89 04 24             	mov    %eax,(%esp)
c0100fc0:	e8 30 23 00 00       	call   c01032f5 <memcpy>
	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	
c0100fc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fc8:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100fcd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100fd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fd3:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100fda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fdd:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100fe4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fe7:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100fed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ff0:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ff9:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0101000:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101003:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c010100a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010100d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101010:	89 10                	mov    %edx,(%eax)
	return p;
c0101012:	8b 45 ec             	mov    -0x14(%ebp),%eax

}
c0101015:	c9                   	leave  
c0101016:	c3                   	ret    

c0101017 <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0101017:	55                   	push   %ebp
c0101018:	89 e5                	mov    %esp,%ebp
c010101a:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c010101d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101020:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101023:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101026:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010102b:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c010102e:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c0101035:	8b 45 10             	mov    0x10(%ebp),%eax
c0101038:	8b 55 0c             	mov    0xc(%ebp),%edx
c010103b:	01 c2                	add    %eax,%edx
c010103d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101040:	01 d0                	add    %edx,%eax
c0101042:	83 e8 01             	sub    $0x1,%eax
c0101045:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101048:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010104b:	ba 00 00 00 00       	mov    $0x0,%edx
c0101050:	f7 75 e8             	divl   -0x18(%ebp)
c0101053:	89 d0                	mov    %edx,%eax
c0101055:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101058:	29 c2                	sub    %eax,%edx
c010105a:	89 d0                	mov    %edx,%eax
c010105c:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c010105f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101062:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101065:	eb 61                	jmp    c01010c8 <mm_malloc+0xb1>
		p = page_alloc(0);
c0101067:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010106e:	e8 13 0f 00 00       	call   c0101f86 <page_alloc>
c0101073:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c0101076:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c010107a:	75 24                	jne    c01010a0 <mm_malloc+0x89>
c010107c:	c7 44 24 0c c5 42 10 	movl   $0xc01042c5,0xc(%esp)
c0101083:	c0 
c0101084:	c7 44 24 08 31 42 10 	movl   $0xc0104231,0x8(%esp)
c010108b:	c0 
c010108c:	c7 44 24 04 56 00 00 	movl   $0x56,0x4(%esp)
c0101093:	00 
c0101094:	c7 04 24 cf 42 10 c0 	movl   $0xc01042cf,(%esp)
c010109b:	e8 b5 1c 00 00       	call   c0102d55 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c01010a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010a3:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c01010aa:	00 
c01010ab:	89 44 24 08          	mov    %eax,0x8(%esp)
c01010af:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01010b2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01010b9:	89 04 24             	mov    %eax,(%esp)
c01010bc:	e8 9f 15 00 00       	call   c0102660 <page_insert>
{
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c01010c1:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01010c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010cb:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01010ce:	72 97                	jb     c0101067 <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c01010d0:	c9                   	leave  
c01010d1:	c3                   	ret    

c01010d2 <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c01010d2:	55                   	push   %ebp
c01010d3:	89 e5                	mov    %esp,%ebp
c01010d5:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c01010d8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010db:	8b 55 08             	mov    0x8(%ebp),%edx
c01010de:	01 d0                	add    %edx,%eax
c01010e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c01010e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01010e6:	c1 e8 09             	shr    $0x9,%eax
c01010e9:	83 c0 01             	add    $0x1,%eax
c01010ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c01010ef:	eb 6e                	jmp    c010115f <readseg+0x8d>
		readsect(disks, sect);
c01010f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010f4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010f8:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c01010ff:	e8 65 00 00 00       	call   c0101169 <readsect>
		uint32_t rem = offset & 0x1ff;
c0101104:	8b 45 10             	mov    0x10(%ebp),%eax
c0101107:	25 ff 01 00 00       	and    $0x1ff,%eax
c010110c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c010110f:	b8 00 02 00 00       	mov    $0x200,%eax
c0101114:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0101117:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010111a:	8b 45 08             	mov    0x8(%ebp),%eax
c010111d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101120:	29 c2                	sub    %eax,%edx
c0101122:	89 d0                	mov    %edx,%eax
c0101124:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101127:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010112a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010112d:	39 d0                	cmp    %edx,%eax
c010112f:	76 02                	jbe    c0101133 <readseg+0x61>
c0101131:	89 d0                	mov    %edx,%eax
c0101133:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c0101136:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101139:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c010113f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101142:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101145:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101149:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010114d:	89 04 24             	mov    %eax,(%esp)
c0101150:	e8 a0 21 00 00       	call   c01032f5 <memcpy>
		va += size;
c0101155:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101158:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c010115b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c010115f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101162:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101165:	72 8a                	jb     c01010f1 <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c0101167:	c9                   	leave  
c0101168:	c3                   	ret    

c0101169 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c0101169:	55                   	push   %ebp
c010116a:	89 e5                	mov    %esp,%ebp
c010116c:	57                   	push   %edi
c010116d:	53                   	push   %ebx
c010116e:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0101171:	90                   	nop
c0101172:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101179:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010117c:	89 c2                	mov    %eax,%edx
c010117e:	ec                   	in     (%dx),%al
c010117f:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c0101182:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101186:	0f b6 c0             	movzbl %al,%eax
c0101189:	25 c0 00 00 00       	and    $0xc0,%eax
c010118e:	83 f8 40             	cmp    $0x40,%eax
c0101191:	75 df                	jne    c0101172 <readsect+0x9>
c0101193:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c010119a:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c010119e:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01011a2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01011a5:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c01011a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011a9:	0f b6 c0             	movzbl %al,%eax
c01011ac:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c01011b3:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01011b6:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01011ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01011bd:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c01011be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011c1:	c1 e8 08             	shr    $0x8,%eax
c01011c4:	0f b6 c0             	movzbl %al,%eax
c01011c7:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c01011ce:	88 45 db             	mov    %al,-0x25(%ebp)
c01011d1:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01011d5:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011d8:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c01011d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011dc:	c1 e8 10             	shr    $0x10,%eax
c01011df:	0f b6 c0             	movzbl %al,%eax
c01011e2:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c01011e9:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01011ec:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01011f0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01011f3:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c01011f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011f7:	c1 e8 18             	shr    $0x18,%eax
c01011fa:	83 c8 e0             	or     $0xffffffe0,%eax
c01011fd:	0f b6 c0             	movzbl %al,%eax
c0101200:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c0101207:	88 45 cb             	mov    %al,-0x35(%ebp)
c010120a:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c010120e:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0101211:	ee                   	out    %al,(%dx)
c0101212:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101219:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c010121d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101221:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0101224:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0101225:	90                   	nop
c0101226:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c010122d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0101230:	89 c2                	mov    %eax,%edx
c0101232:	ec                   	in     (%dx),%al
c0101233:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c0101236:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c010123a:	0f b6 c0             	movzbl %al,%eax
c010123d:	25 c0 00 00 00       	and    $0xc0,%eax
c0101242:	83 f8 40             	cmp    $0x40,%eax
c0101245:	75 df                	jne    c0101226 <readsect+0xbd>
c0101247:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c010124e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101251:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0101254:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c010125b:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010125e:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0101261:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0101264:	89 cb                	mov    %ecx,%ebx
c0101266:	89 df                	mov    %ebx,%edi
c0101268:	89 c1                	mov    %eax,%ecx
c010126a:	fc                   	cld    
c010126b:	f2 6d                	repnz insl (%dx),%es:(%edi)
c010126d:	89 c8                	mov    %ecx,%eax
c010126f:	89 fb                	mov    %edi,%ebx
c0101271:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c0101274:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c0101277:	83 c4 50             	add    $0x50,%esp
c010127a:	5b                   	pop    %ebx
c010127b:	5f                   	pop    %edi
c010127c:	5d                   	pop    %ebp
c010127d:	c3                   	ret    

c010127e <pcb_new>:

void pcb_new()
{
c010127e:	55                   	push   %ebp
c010127f:	89 e5                	mov    %esp,%ebp
c0101281:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c0101284:	e8 54 fc ff ff       	call   c0100edd <pcb_alloc>
c0101289:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c010128c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101290:	75 05                	jne    c0101297 <pcb_new+0x19>
c0101292:	e9 8b 01 00 00       	jmp    c0101422 <pcb_new+0x1a4>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c0101297:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c010129e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012a1:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c01012a8:	00 
c01012a9:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01012b0:	00 
c01012b1:	89 04 24             	mov    %eax,(%esp)
c01012b4:	e8 19 fe ff ff       	call   c01010d2 <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c01012b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012bc:	8b 00                	mov    (%eax),%eax
c01012be:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c01012c3:	74 24                	je     c01012e9 <pcb_new+0x6b>
c01012c5:	c7 44 24 0c e2 42 10 	movl   $0xc01042e2,0xc(%esp)
c01012cc:	c0 
c01012cd:	c7 44 24 08 31 42 10 	movl   $0xc0104231,0x8(%esp)
c01012d4:	c0 
c01012d5:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
c01012dc:	00 
c01012dd:	c7 04 24 cf 42 10 c0 	movl   $0xc01042cf,(%esp)
c01012e4:	e8 6c 1a 00 00       	call   c0102d55 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c01012e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012ec:	8b 50 1c             	mov    0x1c(%eax),%edx
c01012ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012f2:	01 d0                	add    %edx,%eax
c01012f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c01012f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012fa:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01012fe:	0f b7 c0             	movzwl %ax,%eax
c0101301:	c1 e0 05             	shl    $0x5,%eax
c0101304:	89 c2                	mov    %eax,%edx
c0101306:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101309:	01 d0                	add    %edx,%eax
c010130b:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c010130e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101311:	8b 40 04             	mov    0x4(%eax),%eax
c0101314:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101318:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c010131f:	00 
c0101320:	c7 04 24 cf 42 10 c0 	movl   $0xc01042cf,(%esp)
c0101327:	e8 55 fa ff ff       	call   c0100d81 <_paddr>
c010132c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c010132f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101332:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) 
c0101335:	e9 8a 00 00 00       	jmp    c01013c4 <pcb_new+0x146>
	{
		if (ph -> p_type != ELF_PROG_LOAD) 
c010133a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010133d:	8b 00                	mov    (%eax),%eax
c010133f:	83 f8 01             	cmp    $0x1,%eax
c0101342:	74 02                	je     c0101346 <pcb_new+0xc8>
			continue;
c0101344:	eb 7a                	jmp    c01013c0 <pcb_new+0x142>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c0101346:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101349:	8b 48 14             	mov    0x14(%eax),%ecx
c010134c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010134f:	8b 50 08             	mov    0x8(%eax),%edx
c0101352:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101355:	8b 40 04             	mov    0x4(%eax),%eax
c0101358:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010135c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101360:	89 04 24             	mov    %eax,(%esp)
c0101363:	e8 af fc ff ff       	call   c0101017 <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c0101368:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010136b:	8b 40 04             	mov    0x4(%eax),%eax
c010136e:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c0101374:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101377:	8b 50 10             	mov    0x10(%eax),%edx
c010137a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010137d:	8b 40 08             	mov    0x8(%eax),%eax
c0101380:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0101384:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101388:	89 04 24             	mov    %eax,(%esp)
c010138b:	e8 42 fd ff ff       	call   c01010d2 <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c0101390:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101393:	8b 50 14             	mov    0x14(%eax),%edx
c0101396:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101399:	8b 40 10             	mov    0x10(%eax),%eax
c010139c:	29 c2                	sub    %eax,%edx
c010139e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013a1:	8b 48 08             	mov    0x8(%eax),%ecx
c01013a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013a7:	8b 40 10             	mov    0x10(%eax),%eax
c01013aa:	01 c8                	add    %ecx,%eax
c01013ac:	89 54 24 08          	mov    %edx,0x8(%esp)
c01013b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01013b7:	00 
c01013b8:	89 04 24             	mov    %eax,(%esp)
c01013bb:	e8 52 1f 00 00       	call   c0103312 <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) 
c01013c0:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01013c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013c7:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01013ca:	0f 82 6a ff ff ff    	jb     c010133a <pcb_new+0xbc>
			continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf->e_entry;
c01013d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013d3:	8b 00                	mov    (%eax),%eax
c01013d5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01013d8:	8b 52 18             	mov    0x18(%edx),%edx
c01013db:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP-USTACKSIZE, USTACKSIZE);
c01013de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013e1:	8b 40 04             	mov    0x4(%eax),%eax
c01013e4:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c01013eb:	00 
c01013ec:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c01013f3:	be 
c01013f4:	89 04 24             	mov    %eax,(%esp)
c01013f7:	e8 1b fc ff ff       	call   c0101017 <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c01013fc:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101401:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101405:	c7 44 24 04 8e 00 00 	movl   $0x8e,0x4(%esp)
c010140c:	00 
c010140d:	c7 04 24 cf 42 10 c0 	movl   $0xc01042cf,(%esp)
c0101414:	e8 68 f9 ff ff       	call   c0100d81 <_paddr>
c0101419:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010141c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010141f:	0f 22 d8             	mov    %eax,%cr3
}
c0101422:	c9                   	leave  
c0101423:	c3                   	ret    

c0101424 <pcb_deepcopy>:

void pcb_deepcopy(PCB *fa,PCB *tb)
{
c0101424:	55                   	push   %ebp
c0101425:	89 e5                	mov    %esp,%ebp
c0101427:	53                   	push   %ebx
c0101428:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);//get the addr for the information of process
c010142b:	c7 45 f4 2c 00 00 00 	movl   $0x2c,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c0101432:	b8 00 10 00 00       	mov    $0x1000,%eax
c0101437:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010143a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c010143d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101440:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0101443:	8b 55 08             	mov    0x8(%ebp),%edx
c0101446:	01 d1                	add    %edx,%ecx
c0101448:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c010144b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010144e:	01 da                	add    %ebx,%edx
c0101450:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101454:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101458:	89 14 24             	mov    %edx,(%esp)
c010145b:	e8 95 1e 00 00       	call   c01032f5 <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c0101460:	8b 45 08             	mov    0x8(%ebp),%eax
c0101463:	8b 00                	mov    (%eax),%eax
c0101465:	89 c2                	mov    %eax,%edx
c0101467:	8b 45 08             	mov    0x8(%ebp),%eax
c010146a:	29 c2                	sub    %eax,%edx
c010146c:	89 d0                	mov    %edx,%eax
c010146e:	89 c2                	mov    %eax,%edx
c0101470:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101473:	01 c2                	add    %eax,%edx
c0101475:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101478:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c010147a:	8b 45 08             	mov    0x8(%ebp),%eax
c010147d:	8b 50 18             	mov    0x18(%eax),%edx
c0101480:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101483:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c0101486:	8b 45 08             	mov    0x8(%ebp),%eax
c0101489:	8b 50 1c             	mov    0x1c(%eax),%edx
c010148c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010148f:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c0101492:	8b 45 08             	mov    0x8(%ebp),%eax
c0101495:	8b 50 20             	mov    0x20(%eax),%edx
c0101498:	8b 45 0c             	mov    0xc(%ebp),%eax
c010149b:	89 50 20             	mov    %edx,0x20(%eax)
	pg_copy(fa->pgdir,tb->pgdir);//written in pmap.c
c010149e:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014a1:	8b 50 04             	mov    0x4(%eax),%edx
c01014a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01014a7:	8b 40 04             	mov    0x4(%eax),%eax
c01014aa:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014ae:	89 04 24             	mov    %eax,(%esp)
c01014b1:	e8 61 0c 00 00       	call   c0102117 <pg_copy>
}
c01014b6:	83 c4 24             	add    $0x24,%esp
c01014b9:	5b                   	pop    %ebx
c01014ba:	5d                   	pop    %ebp
c01014bb:	c3                   	ret    

c01014bc <pcb_shallowcopy>:

void pcb_shallowcopy(PCB *fa,PCB *tb)
{
c01014bc:	55                   	push   %ebp
c01014bd:	89 e5                	mov    %esp,%ebp
c01014bf:	53                   	push   %ebx
c01014c0:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);
c01014c3:	c7 45 f4 2c 00 00 00 	movl   $0x2c,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c01014ca:	b8 00 10 00 00       	mov    $0x1000,%eax
c01014cf:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01014d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c01014d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014d8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c01014db:	8b 55 08             	mov    0x8(%ebp),%edx
c01014de:	01 d1                	add    %edx,%ecx
c01014e0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c01014e3:	8b 55 0c             	mov    0xc(%ebp),%edx
c01014e6:	01 da                	add    %ebx,%edx
c01014e8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01014ec:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01014f0:	89 14 24             	mov    %edx,(%esp)
c01014f3:	e8 fd 1d 00 00       	call   c01032f5 <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c01014f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01014fb:	8b 00                	mov    (%eax),%eax
c01014fd:	89 c2                	mov    %eax,%edx
c01014ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0101502:	29 c2                	sub    %eax,%edx
c0101504:	89 d0                	mov    %edx,%eax
c0101506:	89 c2                	mov    %eax,%edx
c0101508:	8b 45 0c             	mov    0xc(%ebp),%eax
c010150b:	01 c2                	add    %eax,%edx
c010150d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101510:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c0101512:	8b 45 08             	mov    0x8(%ebp),%eax
c0101515:	8b 50 18             	mov    0x18(%eax),%edx
c0101518:	8b 45 0c             	mov    0xc(%ebp),%eax
c010151b:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c010151e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101521:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101524:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101527:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c010152a:	8b 45 08             	mov    0x8(%ebp),%eax
c010152d:	8b 50 20             	mov    0x20(%eax),%edx
c0101530:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101533:	89 50 20             	mov    %edx,0x20(%eax)
	pg_scopy(fa->pgdir,tb->pgdir);	
c0101536:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101539:	8b 50 04             	mov    0x4(%eax),%edx
c010153c:	8b 45 08             	mov    0x8(%ebp),%eax
c010153f:	8b 40 04             	mov    0x4(%eax),%eax
c0101542:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101546:	89 04 24             	mov    %eax,(%esp)
c0101549:	e8 c2 0d 00 00       	call   c0102310 <pg_scopy>
}
c010154e:	83 c4 24             	add    $0x24,%esp
c0101551:	5b                   	pop    %ebx
c0101552:	5d                   	pop    %ebp
c0101553:	c3                   	ret    

c0101554 <pcb_remove>:

void pcb_remove(PCB *p)
{
c0101554:	55                   	push   %ebp
c0101555:	89 e5                	mov    %esp,%ebp
c0101557:	83 ec 18             	sub    $0x18,%esp
	pg_remove(p->pgdir);
c010155a:	8b 45 08             	mov    0x8(%ebp),%eax
c010155d:	8b 40 04             	mov    0x4(%eax),%eax
c0101560:	89 04 24             	mov    %eax,(%esp)
c0101563:	e8 45 0f 00 00       	call   c01024ad <pg_remove>
}
c0101568:	c9                   	leave  
c0101569:	c3                   	ret    

c010156a <kthread>:

int kthread(void *addr)
{
c010156a:	55                   	push   %ebp
c010156b:	89 e5                	mov    %esp,%ebp
c010156d:	83 ec 28             	sub    $0x28,%esp
	PCB *p=pcb_alloc();
c0101570:	e8 68 f9 ff ff       	call   c0100edd <pcb_alloc>
c0101575:	89 45 f4             	mov    %eax,-0xc(%ebp)
	pcb_shallowcopy(pcbnow,p);
c0101578:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010157d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101580:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101584:	89 04 24             	mov    %eax,(%esp)
c0101587:	e8 30 ff ff ff       	call   c01014bc <pcb_shallowcopy>
	mm_malloc(p->pgdir,USTACKTOP-USTACKSIZE,USTACKSIZE);
c010158c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010158f:	8b 40 04             	mov    0x4(%eax),%eax
c0101592:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101599:	00 
c010159a:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c01015a1:	be 
c01015a2:	89 04 24             	mov    %eax,(%esp)
c01015a5:	e8 6d fa ff ff       	call   c0101017 <mm_malloc>
	int *temp=(int*)(USTACKTOP-8);
c01015aa:	c7 45 f0 f8 df ff be 	movl   $0xbeffdff8,-0x10(%ebp)
	*temp=0x0;
c01015b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015b4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	TrapFrame *tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);
c01015ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015bd:	05 ac 0f 00 00       	add    $0xfac,%eax
c01015c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
	tf->eip=(uint32_t)addr;
c01015c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01015c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01015cb:	89 50 38             	mov    %edx,0x38(%eax)
	tf->esp=USTACKTOP-12;
c01015ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01015d1:	c7 40 44 f4 df ff be 	movl   $0xbeffdff4,0x44(%eax)
	return 0;
c01015d8:	b8 00 00 00 00       	mov    $0x0,%eax
}
c01015dd:	c9                   	leave  
c01015de:	c3                   	ret    

c01015df <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01015df:	55                   	push   %ebp
c01015e0:	89 e5                	mov    %esp,%ebp
c01015e2:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01015e5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01015e9:	75 24                	jne    c010160f <list_add+0x30>
c01015eb:	c7 44 24 0c fc 42 10 	movl   $0xc01042fc,0xc(%esp)
c01015f2:	c0 
c01015f3:	c7 44 24 08 09 43 10 	movl   $0xc0104309,0x8(%esp)
c01015fa:	c0 
c01015fb:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0101602:	00 
c0101603:	c7 04 24 1e 43 10 c0 	movl   $0xc010431e,(%esp)
c010160a:	e8 46 17 00 00       	call   c0102d55 <_panic>
	data->prev = prev;
c010160f:	8b 45 10             	mov    0x10(%ebp),%eax
c0101612:	8b 55 08             	mov    0x8(%ebp),%edx
c0101615:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101617:	8b 45 10             	mov    0x10(%ebp),%eax
c010161a:	8b 55 0c             	mov    0xc(%ebp),%edx
c010161d:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101620:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101624:	74 09                	je     c010162f <list_add+0x50>
c0101626:	8b 45 08             	mov    0x8(%ebp),%eax
c0101629:	8b 55 10             	mov    0x10(%ebp),%edx
c010162c:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c010162f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101633:	74 08                	je     c010163d <list_add+0x5e>
c0101635:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101638:	8b 55 10             	mov    0x10(%ebp),%edx
c010163b:	89 10                	mov    %edx,(%eax)
}
c010163d:	c9                   	leave  
c010163e:	c3                   	ret    

c010163f <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c010163f:	55                   	push   %ebp
c0101640:	89 e5                	mov    %esp,%ebp
c0101642:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101645:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101649:	75 24                	jne    c010166f <list_add_before+0x30>
c010164b:	c7 44 24 0c 34 43 10 	movl   $0xc0104334,0xc(%esp)
c0101652:	c0 
c0101653:	c7 44 24 08 09 43 10 	movl   $0xc0104309,0x8(%esp)
c010165a:	c0 
c010165b:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0101662:	00 
c0101663:	c7 04 24 1e 43 10 c0 	movl   $0xc010431e,(%esp)
c010166a:	e8 e6 16 00 00       	call   c0102d55 <_panic>
	list_add(one->prev, one, data);
c010166f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101672:	8b 00                	mov    (%eax),%eax
c0101674:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101677:	89 54 24 08          	mov    %edx,0x8(%esp)
c010167b:	8b 55 08             	mov    0x8(%ebp),%edx
c010167e:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101682:	89 04 24             	mov    %eax,(%esp)
c0101685:	e8 55 ff ff ff       	call   c01015df <list_add>
}
c010168a:	c9                   	leave  
c010168b:	c3                   	ret    

c010168c <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c010168c:	55                   	push   %ebp
c010168d:	89 e5                	mov    %esp,%ebp
c010168f:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0101692:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101696:	75 24                	jne    c01016bc <list_del+0x30>
c0101698:	c7 44 24 0c fc 42 10 	movl   $0xc01042fc,0xc(%esp)
c010169f:	c0 
c01016a0:	c7 44 24 08 09 43 10 	movl   $0xc0104309,0x8(%esp)
c01016a7:	c0 
c01016a8:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c01016af:	00 
c01016b0:	c7 04 24 1e 43 10 c0 	movl   $0xc010431e,(%esp)
c01016b7:	e8 99 16 00 00       	call   c0102d55 <_panic>
	list *prev = data->prev;
c01016bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01016bf:	8b 00                	mov    (%eax),%eax
c01016c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01016c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01016c7:	8b 40 04             	mov    0x4(%eax),%eax
c01016ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01016cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01016d1:	74 09                	je     c01016dc <list_del+0x50>
c01016d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016d6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01016d9:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01016dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01016e0:	74 08                	je     c01016ea <list_del+0x5e>
c01016e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01016e8:	89 10                	mov    %edx,(%eax)
}
c01016ea:	c9                   	leave  
c01016eb:	c3                   	ret    

c01016ec <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01016ec:	55                   	push   %ebp
c01016ed:	89 e5                	mov    %esp,%ebp
c01016ef:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01016f2:	8b 45 10             	mov    0x10(%ebp),%eax
c01016f5:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01016fa:	77 21                	ja     c010171d <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01016fc:	8b 45 10             	mov    0x10(%ebp),%eax
c01016ff:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101703:	c7 44 24 08 40 43 10 	movl   $0xc0104340,0x8(%esp)
c010170a:	c0 
c010170b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010170e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101712:	8b 45 08             	mov    0x8(%ebp),%eax
c0101715:	89 04 24             	mov    %eax,(%esp)
c0101718:	e8 38 16 00 00       	call   c0102d55 <_panic>
	return (physaddr_t)kva - KERNBASE;
c010171d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101720:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101725:	c9                   	leave  
c0101726:	c3                   	ret    

c0101727 <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
c0101727:	55                   	push   %ebp
c0101728:	89 e5                	mov    %esp,%ebp
c010172a:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c010172d:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101732:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c0101735:	e8 a3 f7 ff ff       	call   c0100edd <pcb_alloc>
c010173a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_deepcopy(fa,ch);//written in pcb.c
c010173d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101740:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101744:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101747:	89 04 24             	mov    %eax,(%esp)
c010174a:	e8 d5 fc ff ff       	call   c0101424 <pcb_deepcopy>
	ch->ppid=fa->pid;
c010174f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101752:	8b 50 10             	mov    0x10(%eax),%edx
c0101755:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101758:	89 50 14             	mov    %edx,0x14(%eax)
	(fa->tf)->eax=ch->pid;
c010175b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010175e:	8b 00                	mov    (%eax),%eax
c0101760:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101763:	8b 52 10             	mov    0x10(%edx),%edx
c0101766:	89 50 1c             	mov    %edx,0x1c(%eax)
	(ch->tf)->eax=0;
c0101769:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010176c:	8b 00                	mov    (%eax),%eax
c010176e:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c0101775:	c9                   	leave  
c0101776:	c3                   	ret    

c0101777 <sys_getpid>:

uint32_t sys_getpid(){
c0101777:	55                   	push   %ebp
c0101778:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c010177a:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010177f:	8b 40 10             	mov    0x10(%eax),%eax
}
c0101782:	5d                   	pop    %ebp
c0101783:	c3                   	ret    

c0101784 <sys_exit>:

void sys_exit(int suc){
c0101784:	55                   	push   %ebp
c0101785:	89 e5                	mov    %esp,%ebp
c0101787:	83 ec 28             	sub    $0x28,%esp
	if(suc==0)
c010178a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010178e:	75 1a                	jne    c01017aa <sys_exit+0x26>
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
c0101790:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101795:	8b 40 10             	mov    0x10(%eax),%eax
c0101798:	89 44 24 04          	mov    %eax,0x4(%esp)
c010179c:	c7 04 24 64 43 10 c0 	movl   $0xc0104364,(%esp)
c01017a3:	e8 dc 16 00 00       	call   c0102e84 <printk>
c01017a8:	eb 18                	jmp    c01017c2 <sys_exit+0x3e>
	else
		printk("Not teminate the process of pid %d!!!\n",pcbnow->pid);
c01017aa:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017af:	8b 40 10             	mov    0x10(%eax),%eax
c01017b2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017b6:	c7 04 24 94 43 10 c0 	movl   $0xc0104394,(%esp)
c01017bd:	e8 c2 16 00 00       	call   c0102e84 <printk>
	list *lnext;
	list *t=&ready;
c01017c2:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01017c9:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017ce:	8b 40 04             	mov    0x4(%eax),%eax
c01017d1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01017d4:	75 22                	jne    c01017f8 <sys_exit+0x74>
 	{
		if(t->next==now)
c01017d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017d9:	8b 50 04             	mov    0x4(%eax),%edx
c01017dc:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017e1:	39 c2                	cmp    %eax,%edx
c01017e3:	75 08                	jne    c01017ed <sys_exit+0x69>
			lnext=t;
c01017e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01017eb:	eb 2f                	jmp    c010181c <sys_exit+0x98>
		else
			lnext=t->next;
c01017ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017f0:	8b 40 04             	mov    0x4(%eax),%eax
c01017f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01017f6:	eb 24                	jmp    c010181c <sys_exit+0x98>
	}
	else
	{
		if(now->next==now)
c01017f8:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017fd:	8b 50 04             	mov    0x4(%eax),%edx
c0101800:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101805:	39 c2                	cmp    %eax,%edx
c0101807:	75 08                	jne    c0101811 <sys_exit+0x8d>
			lnext=t;
c0101809:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010180c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010180f:	eb 0b                	jmp    c010181c <sys_exit+0x98>
		else
			lnext=now->next;
c0101811:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101816:	8b 40 04             	mov    0x4(%eax),%eax
c0101819:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c010181c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101821:	89 04 24             	mov    %eax,(%esp)
c0101824:	e8 63 fe ff ff       	call   c010168c <list_del>
	list_add_before(&free,now);
c0101829:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010182e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101832:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0101839:	e8 01 fe ff ff       	call   c010163f <list_add_before>
	lcr3(PADDR(kern_pgdir));
c010183e:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101843:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101847:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
c010184e:	00 
c010184f:	c7 04 24 bb 43 10 c0 	movl   $0xc01043bb,(%esp)
c0101856:	e8 91 fe ff ff       	call   c01016ec <_paddr>
c010185b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010185e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101861:	0f 22 d8             	mov    %eax,%cr3
	pcb_remove(pcbnow);
c0101864:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101869:	89 04 24             	mov    %eax,(%esp)
c010186c:	e8 e3 fc ff ff       	call   c0101554 <pcb_remove>
	now=lnext;
c0101871:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101874:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c0101879:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010187e:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c0101883:	75 0c                	jne    c0101891 <sys_exit+0x10d>
		pcbnow=&init;
c0101885:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c010188c:	3f 16 c0 
c010188f:	eb 0d                	jmp    c010189e <sys_exit+0x11a>
	else
		pcbnow=list_entry(now,PCB,plist);
c0101891:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101896:	83 e8 08             	sub    $0x8,%eax
c0101899:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c010189e:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01018a3:	05 f8 0f 00 00       	add    $0xff8,%eax
c01018a8:	89 04 24             	mov    %eax,(%esp)
c01018ab:	e8 94 13 00 00       	call   c0102c44 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01018b0:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01018b5:	8b 40 04             	mov    0x4(%eax),%eax
c01018b8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01018bc:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01018c3:	00 
c01018c4:	c7 04 24 bb 43 10 c0 	movl   $0xc01043bb,(%esp)
c01018cb:	e8 1c fe ff ff       	call   c01016ec <_paddr>
c01018d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01018d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01018d6:	0f 22 d8             	mov    %eax,%cr3
}
c01018d9:	c9                   	leave  
c01018da:	c3                   	ret    

c01018db <sys_sleep>:

void sys_sleep(int time){
c01018db:	55                   	push   %ebp
c01018dc:	89 e5                	mov    %esp,%ebp
c01018de:	83 ec 28             	sub    $0x28,%esp
	list *lnext;
	list *t=&ready;
c01018e1:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01018e8:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018ed:	8b 40 04             	mov    0x4(%eax),%eax
c01018f0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01018f3:	75 22                	jne    c0101917 <sys_sleep+0x3c>
	{
		if(t->next==now)
c01018f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01018f8:	8b 50 04             	mov    0x4(%eax),%edx
c01018fb:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101900:	39 c2                	cmp    %eax,%edx
c0101902:	75 08                	jne    c010190c <sys_sleep+0x31>
			lnext=t;
c0101904:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101907:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010190a:	eb 2f                	jmp    c010193b <sys_sleep+0x60>
		else
			lnext=t->next;
c010190c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010190f:	8b 40 04             	mov    0x4(%eax),%eax
c0101912:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101915:	eb 24                	jmp    c010193b <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c0101917:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010191c:	8b 50 04             	mov    0x4(%eax),%edx
c010191f:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101924:	39 c2                	cmp    %eax,%edx
c0101926:	75 08                	jne    c0101930 <sys_sleep+0x55>
			lnext=t;
c0101928:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010192b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010192e:	eb 0b                	jmp    c010193b <sys_sleep+0x60>
		else
			lnext=now->next;
c0101930:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101935:	8b 40 04             	mov    0x4(%eax),%eax
c0101938:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c010193b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101940:	89 04 24             	mov    %eax,(%esp)
c0101943:	e8 44 fd ff ff       	call   c010168c <list_del>
	list_add_before(&block,now);
c0101948:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010194d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101951:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0101958:	e8 e2 fc ff ff       	call   c010163f <list_add_before>
	pcbnow->state=BLOCKED;
c010195d:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101962:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c0101969:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c010196f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101972:	c1 e0 02             	shl    $0x2,%eax
c0101975:	89 c1                	mov    %eax,%ecx
c0101977:	c1 e1 04             	shl    $0x4,%ecx
c010197a:	29 c1                	sub    %eax,%ecx
c010197c:	89 c8                	mov    %ecx,%eax
c010197e:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=lnext;
c0101981:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101984:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c0101989:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010198e:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c0101993:	75 0c                	jne    c01019a1 <sys_sleep+0xc6>
		pcbnow=&init;
c0101995:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c010199c:	3f 16 c0 
c010199f:	eb 0d                	jmp    c01019ae <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c01019a1:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01019a6:	83 e8 08             	sub    $0x8,%eax
c01019a9:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01019ae:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01019b3:	05 f8 0f 00 00       	add    $0xff8,%eax
c01019b8:	89 04 24             	mov    %eax,(%esp)
c01019bb:	e8 84 12 00 00       	call   c0102c44 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01019c0:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01019c5:	8b 40 04             	mov    0x4(%eax),%eax
c01019c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01019cc:	c7 44 24 04 53 00 00 	movl   $0x53,0x4(%esp)
c01019d3:	00 
c01019d4:	c7 04 24 bb 43 10 c0 	movl   $0xc01043bb,(%esp)
c01019db:	e8 0c fd ff ff       	call   c01016ec <_paddr>
c01019e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01019e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01019e6:	0f 22 d8             	mov    %eax,%cr3
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
c01019e9:	c9                   	leave  
c01019ea:	c3                   	ret    

c01019eb <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01019eb:	55                   	push   %ebp
c01019ec:	89 e5                	mov    %esp,%ebp
c01019ee:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01019f1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01019f5:	75 24                	jne    c0101a1b <list_add+0x30>
c01019f7:	c7 44 24 0c d4 43 10 	movl   $0xc01043d4,0xc(%esp)
c01019fe:	c0 
c01019ff:	c7 44 24 08 e1 43 10 	movl   $0xc01043e1,0x8(%esp)
c0101a06:	c0 
c0101a07:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0101a0e:	00 
c0101a0f:	c7 04 24 f6 43 10 c0 	movl   $0xc01043f6,(%esp)
c0101a16:	e8 3a 13 00 00       	call   c0102d55 <_panic>
	data->prev = prev;
c0101a1b:	8b 45 10             	mov    0x10(%ebp),%eax
c0101a1e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a21:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101a23:	8b 45 10             	mov    0x10(%ebp),%eax
c0101a26:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a29:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101a2c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a30:	74 09                	je     c0101a3b <list_add+0x50>
c0101a32:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a35:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a38:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101a3b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101a3f:	74 08                	je     c0101a49 <list_add+0x5e>
c0101a41:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a44:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a47:	89 10                	mov    %edx,(%eax)
}
c0101a49:	c9                   	leave  
c0101a4a:	c3                   	ret    

c0101a4b <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101a4b:	55                   	push   %ebp
c0101a4c:	89 e5                	mov    %esp,%ebp
c0101a4e:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101a51:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a55:	75 24                	jne    c0101a7b <list_add_before+0x30>
c0101a57:	c7 44 24 0c 0c 44 10 	movl   $0xc010440c,0xc(%esp)
c0101a5e:	c0 
c0101a5f:	c7 44 24 08 e1 43 10 	movl   $0xc01043e1,0x8(%esp)
c0101a66:	c0 
c0101a67:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0101a6e:	00 
c0101a6f:	c7 04 24 f6 43 10 c0 	movl   $0xc01043f6,(%esp)
c0101a76:	e8 da 12 00 00       	call   c0102d55 <_panic>
	list_add(one->prev, one, data);
c0101a7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a7e:	8b 00                	mov    (%eax),%eax
c0101a80:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a83:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a87:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a8a:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101a8e:	89 04 24             	mov    %eax,(%esp)
c0101a91:	e8 55 ff ff ff       	call   c01019eb <list_add>
}
c0101a96:	c9                   	leave  
c0101a97:	c3                   	ret    

c0101a98 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0101a98:	55                   	push   %ebp
c0101a99:	89 e5                	mov    %esp,%ebp
c0101a9b:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0101a9e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101aa2:	75 24                	jne    c0101ac8 <list_del+0x30>
c0101aa4:	c7 44 24 0c d4 43 10 	movl   $0xc01043d4,0xc(%esp)
c0101aab:	c0 
c0101aac:	c7 44 24 08 e1 43 10 	movl   $0xc01043e1,0x8(%esp)
c0101ab3:	c0 
c0101ab4:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0101abb:	00 
c0101abc:	c7 04 24 f6 43 10 c0 	movl   $0xc01043f6,(%esp)
c0101ac3:	e8 8d 12 00 00       	call   c0102d55 <_panic>
	list *prev = data->prev;
c0101ac8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101acb:	8b 00                	mov    (%eax),%eax
c0101acd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0101ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ad3:	8b 40 04             	mov    0x4(%eax),%eax
c0101ad6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0101ad9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101add:	74 09                	je     c0101ae8 <list_del+0x50>
c0101adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ae2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ae5:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0101ae8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101aec:	74 08                	je     c0101af6 <list_del+0x5e>
c0101aee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101af1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101af4:	89 10                	mov    %edx,(%eax)
}
c0101af6:	c9                   	leave  
c0101af7:	c3                   	ret    

c0101af8 <list_init>:

static inline void
list_init(list *one) {
c0101af8:	55                   	push   %ebp
c0101af9:	89 e5                	mov    %esp,%ebp
c0101afb:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101afe:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101b02:	75 24                	jne    c0101b28 <list_init+0x30>
c0101b04:	c7 44 24 0c 0c 44 10 	movl   $0xc010440c,0xc(%esp)
c0101b0b:	c0 
c0101b0c:	c7 44 24 08 e1 43 10 	movl   $0xc01043e1,0x8(%esp)
c0101b13:	c0 
c0101b14:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0101b1b:	00 
c0101b1c:	c7 04 24 f6 43 10 c0 	movl   $0xc01043f6,(%esp)
c0101b23:	e8 2d 12 00 00       	call   c0102d55 <_panic>
	one->prev = one->next = one;
c0101b28:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b2b:	8b 55 08             	mov    0x8(%ebp),%edx
c0101b2e:	89 50 04             	mov    %edx,0x4(%eax)
c0101b31:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b34:	8b 50 04             	mov    0x4(%eax),%edx
c0101b37:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b3a:	89 10                	mov    %edx,(%eax)
}
c0101b3c:	c9                   	leave  
c0101b3d:	c3                   	ret    

c0101b3e <list_empty>:

static inline bool
list_empty(list *one) {
c0101b3e:	55                   	push   %ebp
c0101b3f:	89 e5                	mov    %esp,%ebp
c0101b41:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101b44:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101b48:	75 24                	jne    c0101b6e <list_empty+0x30>
c0101b4a:	c7 44 24 0c 0c 44 10 	movl   $0xc010440c,0xc(%esp)
c0101b51:	c0 
c0101b52:	c7 44 24 08 e1 43 10 	movl   $0xc01043e1,0x8(%esp)
c0101b59:	c0 
c0101b5a:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0101b61:	00 
c0101b62:	c7 04 24 f6 43 10 c0 	movl   $0xc01043f6,(%esp)
c0101b69:	e8 e7 11 00 00       	call   c0102d55 <_panic>
	return one == one->next;
c0101b6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b71:	8b 40 04             	mov    0x4(%eax),%eax
c0101b74:	3b 45 08             	cmp    0x8(%ebp),%eax
c0101b77:	0f 94 c0             	sete   %al
c0101b7a:	0f b6 c0             	movzbl %al,%eax
}
c0101b7d:	c9                   	leave  
c0101b7e:	c3                   	ret    

c0101b7f <ksem_init>:
#include "common.h"
#include "list.h"
#include "pcb.h"

int ksem_init(Sema *sema,int value)
{
c0101b7f:	55                   	push   %ebp
c0101b80:	89 e5                	mov    %esp,%ebp
c0101b82:	83 ec 18             	sub    $0x18,%esp
	//printk("%d\n",value);
	sema->value=value;
c0101b85:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b88:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101b8b:	89 10                	mov    %edx,(%eax)
	sema->link=0;
c0101b8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b90:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&sema->wait);
c0101b97:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b9a:	83 c0 08             	add    $0x8,%eax
c0101b9d:	89 04 24             	mov    %eax,(%esp)
c0101ba0:	e8 53 ff ff ff       	call   c0101af8 <list_init>
	return 0;
c0101ba5:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101baa:	c9                   	leave  
c0101bab:	c3                   	ret    

c0101bac <ksem_destroy>:

int ksem_destroy(Sema *sema)
{
c0101bac:	55                   	push   %ebp
c0101bad:	89 e5                	mov    %esp,%ebp
c0101baf:	83 ec 28             	sub    $0x28,%esp
	sema->value=-1;
c0101bb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bb5:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
	sema->link=0;
c0101bbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bbe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list *one;
	list_foreach(one,&sema->wait)
c0101bc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bc8:	8b 40 0c             	mov    0xc(%eax),%eax
c0101bcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bce:	eb 27                	jmp    c0101bf7 <ksem_destroy+0x4b>
	{
		list_del(one);
c0101bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bd3:	89 04 24             	mov    %eax,(%esp)
c0101bd6:	e8 bd fe ff ff       	call   c0101a98 <list_del>
		list_add_before(&ready,one);	
c0101bdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bde:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101be2:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101be9:	e8 5d fe ff ff       	call   c0101a4b <list_add_before>
int ksem_destroy(Sema *sema)
{
	sema->value=-1;
	sema->link=0;
	list *one;
	list_foreach(one,&sema->wait)
c0101bee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bf1:	8b 40 04             	mov    0x4(%eax),%eax
c0101bf4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bfa:	83 c0 08             	add    $0x8,%eax
c0101bfd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0101c00:	75 ce                	jne    c0101bd0 <ksem_destroy+0x24>
	{
		list_del(one);
		list_add_before(&ready,one);	
	}
	list_del(&sema->wait);
c0101c02:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c05:	83 c0 08             	add    $0x8,%eax
c0101c08:	89 04 24             	mov    %eax,(%esp)
c0101c0b:	e8 88 fe ff ff       	call   c0101a98 <list_del>
	return 0;
c0101c10:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101c15:	c9                   	leave  
c0101c16:	c3                   	ret    

c0101c17 <ksem_wait>:

int ksem_wait(Sema *sema)
{
c0101c17:	55                   	push   %ebp
c0101c18:	89 e5                	mov    %esp,%ebp
c0101c1a:	83 ec 28             	sub    $0x28,%esp
	if(sema->value>0)
c0101c1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c20:	8b 00                	mov    (%eax),%eax
c0101c22:	85 c0                	test   %eax,%eax
c0101c24:	7e 14                	jle    c0101c3a <ksem_wait+0x23>
	{
		sema->value--;
c0101c26:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c29:	8b 00                	mov    (%eax),%eax
c0101c2b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c31:	89 10                	mov    %edx,(%eax)
		return 0;
c0101c33:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c38:	eb 46                	jmp    c0101c80 <ksem_wait+0x69>
	}
	else{
		sema->value--;
c0101c3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c3d:	8b 00                	mov    (%eax),%eax
c0101c3f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c42:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c45:	89 10                	mov    %edx,(%eax)
		list *it = now;
c0101c47:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101c4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(it);
c0101c4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c52:	89 04 24             	mov    %eax,(%esp)
c0101c55:	e8 3e fe ff ff       	call   c0101a98 <list_del>
		schedule(0);
c0101c5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101c61:	e8 ff 0c 00 00       	call   c0102965 <schedule>
		list_add_before(&sema->wait,it);
c0101c66:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c69:	8d 50 08             	lea    0x8(%eax),%edx
c0101c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c6f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c73:	89 14 24             	mov    %edx,(%esp)
c0101c76:	e8 d0 fd ff ff       	call   c0101a4b <list_add_before>
	}
	return -1;
c0101c7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
c0101c80:	c9                   	leave  
c0101c81:	c3                   	ret    

c0101c82 <ksem_trywait>:

int ksem_trywait(Sema *sema)
{
c0101c82:	55                   	push   %ebp
c0101c83:	89 e5                	mov    %esp,%ebp
	if(sema->value>0)
c0101c85:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c88:	8b 00                	mov    (%eax),%eax
c0101c8a:	85 c0                	test   %eax,%eax
c0101c8c:	7e 14                	jle    c0101ca2 <ksem_trywait+0x20>
	{
		sema->value--;
c0101c8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c91:	8b 00                	mov    (%eax),%eax
c0101c93:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c96:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c99:	89 10                	mov    %edx,(%eax)
		return 0;
c0101c9b:	b8 00 00 00 00       	mov    $0x0,%eax
c0101ca0:	eb 05                	jmp    c0101ca7 <ksem_trywait+0x25>
	}
	else{
		return -1;
c0101ca2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
}
c0101ca7:	5d                   	pop    %ebp
c0101ca8:	c3                   	ret    

c0101ca9 <ksem_post>:

int ksem_post(Sema *sema)
{
c0101ca9:	55                   	push   %ebp
c0101caa:	89 e5                	mov    %esp,%ebp
c0101cac:	83 ec 28             	sub    $0x28,%esp
	if(list_empty(&sema->wait)){
c0101caf:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cb2:	83 c0 08             	add    $0x8,%eax
c0101cb5:	89 04 24             	mov    %eax,(%esp)
c0101cb8:	e8 81 fe ff ff       	call   c0101b3e <list_empty>
c0101cbd:	85 c0                	test   %eax,%eax
c0101cbf:	74 0f                	je     c0101cd0 <ksem_post+0x27>
		sema->value++;
c0101cc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cc4:	8b 00                	mov    (%eax),%eax
c0101cc6:	8d 50 01             	lea    0x1(%eax),%edx
c0101cc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ccc:	89 10                	mov    %edx,(%eax)
c0101cce:	eb 40                	jmp    c0101d10 <ksem_post+0x67>
	}
	else{
		sema->value++;
c0101cd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cd3:	8b 00                	mov    (%eax),%eax
c0101cd5:	8d 50 01             	lea    0x1(%eax),%edx
c0101cd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cdb:	89 10                	mov    %edx,(%eax)
		list *one=sema->wait.next;
c0101cdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ce0:	8b 40 0c             	mov    0xc(%eax),%eax
c0101ce3:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(one);
c0101ce6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ce9:	89 04 24             	mov    %eax,(%esp)
c0101cec:	e8 a7 fd ff ff       	call   c0101a98 <list_del>
		list_add_before(&ready,one);
c0101cf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101cf4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101cf8:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101cff:	e8 47 fd ff ff       	call   c0101a4b <list_add_before>
		schedule(0);
c0101d04:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101d0b:	e8 55 0c 00 00       	call   c0102965 <schedule>
	}
}
c0101d10:	c9                   	leave  
c0101d11:	c3                   	ret    

c0101d12 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101d12:	55                   	push   %ebp
c0101d13:	89 e5                	mov    %esp,%ebp
c0101d15:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101d18:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d1b:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101d20:	77 21                	ja     c0101d43 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101d22:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d25:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101d29:	c7 44 24 08 18 44 10 	movl   $0xc0104418,0x8(%esp)
c0101d30:	c0 
c0101d31:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d34:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d38:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d3b:	89 04 24             	mov    %eax,(%esp)
c0101d3e:	e8 12 10 00 00       	call   c0102d55 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101d43:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d46:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101d4b:	c9                   	leave  
c0101d4c:	c3                   	ret    

c0101d4d <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0101d4d:	55                   	push   %ebp
c0101d4e:	89 e5                	mov    %esp,%ebp
c0101d50:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101d53:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d56:	c1 e8 0c             	shr    $0xc,%eax
c0101d59:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101d5e:	76 21                	jbe    c0101d81 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0101d60:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d63:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101d67:	c7 44 24 08 3c 44 10 	movl   $0xc010443c,0x8(%esp)
c0101d6e:	c0 
c0101d6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d72:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d76:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d79:	89 04 24             	mov    %eax,(%esp)
c0101d7c:	e8 d4 0f 00 00       	call   c0102d55 <_panic>
	return (void *)(pa + KERNBASE);
c0101d81:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d84:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0101d89:	c9                   	leave  
c0101d8a:	c3                   	ret    

c0101d8b <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0101d8b:	55                   	push   %ebp
c0101d8c:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0101d8e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d91:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0101d96:	29 c2                	sub    %eax,%edx
c0101d98:	89 d0                	mov    %edx,%eax
c0101d9a:	c1 f8 03             	sar    $0x3,%eax
c0101d9d:	c1 e0 0c             	shl    $0xc,%eax
}
c0101da0:	5d                   	pop    %ebp
c0101da1:	c3                   	ret    

c0101da2 <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c0101da2:	55                   	push   %ebp
c0101da3:	89 e5                	mov    %esp,%ebp
c0101da5:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101da8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dab:	c1 e8 0c             	shr    $0xc,%eax
c0101dae:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101db3:	76 1c                	jbe    c0101dd1 <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c0101db5:	c7 44 24 08 60 44 10 	movl   $0xc0104460,0x8(%esp)
c0101dbc:	c0 
c0101dbd:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c0101dc4:	00 
c0101dc5:	c7 04 24 7f 44 10 c0 	movl   $0xc010447f,(%esp)
c0101dcc:	e8 84 0f 00 00       	call   c0102d55 <_panic>
	return &pages[PGNUM(pa)];
c0101dd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dd4:	c1 e8 0c             	shr    $0xc,%eax
c0101dd7:	c1 e0 03             	shl    $0x3,%eax
c0101dda:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c0101ddf:	c9                   	leave  
c0101de0:	c3                   	ret    

c0101de1 <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c0101de1:	55                   	push   %ebp
c0101de2:	89 e5                	mov    %esp,%ebp
c0101de4:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dea:	89 04 24             	mov    %eax,(%esp)
c0101ded:	e8 99 ff ff ff       	call   c0101d8b <page2pa>
c0101df2:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101df6:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0101dfd:	00 
c0101dfe:	c7 04 24 7f 44 10 c0 	movl   $0xc010447f,(%esp)
c0101e05:	e8 43 ff ff ff       	call   c0101d4d <_kaddr>
}
c0101e0a:	c9                   	leave  
c0101e0b:	c3                   	ret    

c0101e0c <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c0101e0c:	55                   	push   %ebp
c0101e0d:	89 e5                	mov    %esp,%ebp
c0101e0f:	53                   	push   %ebx
c0101e10:	83 ec 44             	sub    $0x44,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
c0101e13:	c7 45 e8 00 30 13 c0 	movl   $0xc0133000,-0x18(%ebp)
	pte_t *pgta=kpgtable;
c0101e1a:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101e21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e28:	eb 40                	jmp    c0101e6a <page_init+0x5e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
c0101e2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e2d:	05 00 03 00 00       	add    $0x300,%eax
c0101e32:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e39:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e3c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101e3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e42:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e46:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101e4d:	00 
c0101e4e:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c0101e55:	e8 b8 fe ff ff       	call   c0101d12 <_paddr>
c0101e5a:	83 c8 03             	or     $0x3,%eax
c0101e5d:	89 03                	mov    %eax,(%ebx)
		pgta+=NPTENTRIES;
c0101e5f:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
	pte_t *pgta=kpgtable;
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101e66:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e6a:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101e6e:	7e ba                	jle    c0101e2a <page_init+0x1e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
c0101e70:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgta--;
c0101e77:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (;pframe>=0; pframe-=PGSIZE){
c0101e7b:	eb 18                	jmp    c0101e95 <page_init+0x89>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
c0101e7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e80:	83 c8 07             	or     $0x7,%eax
c0101e83:	89 c2                	mov    %eax,%edx
c0101e85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e88:	89 10                	mov    %edx,(%eax)
		pgta--;
c0101e8a:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
	pgta--;
	for (;pframe>=0; pframe-=PGSIZE){
c0101e8e:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c0101e95:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101e99:	79 e2                	jns    c0101e7d <page_init+0x71>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
c0101e9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e9e:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c0101ea3:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101ea8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101eac:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c0101eb3:	00 
c0101eb4:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c0101ebb:	e8 52 fe ff ff       	call   c0101d12 <_paddr>
c0101ec0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101ec3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ec6:	0f 22 d8             	mov    %eax,%cr3
	for (i=0;i<0x400;i++) {
c0101ec9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101ed0:	eb 11                	jmp    c0101ee3 <page_init+0xd7>
		pages[i].pp_ref = 1;
c0101ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ed5:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c0101edc:	c0 01 00 
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
c0101edf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101ee3:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101eea:	7e e6                	jle    c0101ed2 <page_init+0xc6>
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101eec:	c7 45 f4 ff 7f 00 00 	movl   $0x7fff,-0xc(%ebp)
c0101ef3:	eb 31                	jmp    c0101f26 <page_init+0x11a>
		pages[i].pp_ref = 0;
c0101ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ef8:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101eff:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101f02:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101f08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f0b:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101f12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f15:	c1 e0 03             	shl    $0x3,%eax
c0101f18:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101f1d:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101f22:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0101f26:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101f2d:	7f c6                	jg     c0101ef5 <page_init+0xe9>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101f2f:	c7 45 e4 00 10 00 00 	movl   $0x1000,-0x1c(%ebp)
c0101f36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f39:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101f3e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101f41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f44:	ba 00 00 00 00       	mov    $0x0,%edx
c0101f49:	f7 75 e4             	divl   -0x1c(%ebp)
c0101f4c:	89 d0                	mov    %edx,%eax
c0101f4e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101f51:	29 c2                	sub    %eax,%edx
c0101f53:	89 d0                	mov    %edx,%eax
c0101f55:	89 c2                	mov    %eax,%edx
c0101f57:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101f5c:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101f63:	00 
c0101f64:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101f6b:	00 
c0101f6c:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101f70:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101f77:	00 
c0101f78:	89 04 24             	mov    %eax,(%esp)
c0101f7b:	e8 7b 06 00 00       	call   c01025fb <boot_map_region>
}
c0101f80:	83 c4 44             	add    $0x44,%esp
c0101f83:	5b                   	pop    %ebx
c0101f84:	5d                   	pop    %ebp
c0101f85:	c3                   	ret    

c0101f86 <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101f86:	55                   	push   %ebp
c0101f87:	89 e5                	mov    %esp,%ebp
c0101f89:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101f8c:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101f91:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101f94:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101f98:	75 07                	jne    c0101fa1 <page_alloc+0x1b>
c0101f9a:	b8 00 00 00 00       	mov    $0x0,%eax
c0101f9f:	eb 45                	jmp    c0101fe6 <page_alloc+0x60>
	page_free_list = page_free_list -> pp_link;
c0101fa1:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101fa6:	8b 00                	mov    (%eax),%eax
c0101fa8:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	if (alloc_flags & ALLOC_ZERO) {
c0101fad:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fb0:	83 e0 01             	and    $0x1,%eax
c0101fb3:	85 c0                	test   %eax,%eax
c0101fb5:	74 23                	je     c0101fda <page_alloc+0x54>
		memset(page2kva(p), 0, PGSIZE);
c0101fb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101fba:	89 04 24             	mov    %eax,(%esp)
c0101fbd:	e8 1f fe ff ff       	call   c0101de1 <page2kva>
c0101fc2:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101fc9:	00 
c0101fca:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101fd1:	00 
c0101fd2:	89 04 24             	mov    %eax,(%esp)
c0101fd5:	e8 38 13 00 00       	call   c0103312 <memset>
	}
	p -> pp_link = NULL;
c0101fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101fdd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101fe3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101fe6:	c9                   	leave  
c0101fe7:	c3                   	ret    

c0101fe8 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101fe8:	55                   	push   %ebp
c0101fe9:	89 e5                	mov    %esp,%ebp
	pp->pp_link = page_free_list;
c0101feb:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101ff1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ff4:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101ff6:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ff9:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101ffe:	5d                   	pop    %ebp
c0101fff:	c3                   	ret    

c0102000 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0102000:	55                   	push   %ebp
c0102001:	89 e5                	mov    %esp,%ebp
c0102003:	83 ec 04             	sub    $0x4,%esp
	if (--pp->pp_ref == 0)
c0102006:	8b 45 08             	mov    0x8(%ebp),%eax
c0102009:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010200d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102010:	8b 45 08             	mov    0x8(%ebp),%eax
c0102013:	66 89 50 04          	mov    %dx,0x4(%eax)
c0102017:	8b 45 08             	mov    0x8(%ebp),%eax
c010201a:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010201e:	66 85 c0             	test   %ax,%ax
c0102021:	75 0b                	jne    c010202e <page_decref+0x2e>
		page_free(pp);
c0102023:	8b 45 08             	mov    0x8(%ebp),%eax
c0102026:	89 04 24             	mov    %eax,(%esp)
c0102029:	e8 ba ff ff ff       	call   c0101fe8 <page_free>
}
c010202e:	c9                   	leave  
c010202f:	c3                   	ret    

c0102030 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0102030:	55                   	push   %ebp
c0102031:	89 e5                	mov    %esp,%ebp
c0102033:	53                   	push   %ebx
c0102034:	83 ec 24             	sub    $0x24,%esp
	pte_t *t=NULL;
c0102037:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (pgdir[PDX(va)] & PTE_P) {
c010203e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102041:	c1 e8 16             	shr    $0x16,%eax
c0102044:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010204b:	8b 45 08             	mov    0x8(%ebp),%eax
c010204e:	01 d0                	add    %edx,%eax
c0102050:	8b 00                	mov    (%eax),%eax
c0102052:	83 e0 01             	and    $0x1,%eax
c0102055:	85 c0                	test   %eax,%eax
c0102057:	74 36                	je     c010208f <pgdir_walk+0x5f>
		t = KADDR(PTE_ADDR(pgdir[PDX(va)]));
c0102059:	8b 45 0c             	mov    0xc(%ebp),%eax
c010205c:	c1 e8 16             	shr    $0x16,%eax
c010205f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102066:	8b 45 08             	mov    0x8(%ebp),%eax
c0102069:	01 d0                	add    %edx,%eax
c010206b:	8b 00                	mov    (%eax),%eax
c010206d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102072:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102076:	c7 44 24 04 a3 00 00 	movl   $0xa3,0x4(%esp)
c010207d:	00 
c010207e:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c0102085:	e8 c3 fc ff ff       	call   c0101d4d <_kaddr>
c010208a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010208d:	eb 6b                	jmp    c01020fa <pgdir_walk+0xca>
	}
	else {
		if (create == false) 
c010208f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102093:	75 07                	jne    c010209c <pgdir_walk+0x6c>
			return NULL;
c0102095:	b8 00 00 00 00       	mov    $0x0,%eax
c010209a:	eb 75                	jmp    c0102111 <pgdir_walk+0xe1>
		struct Page *p = page_alloc(ALLOC_ZERO);
c010209c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01020a3:	e8 de fe ff ff       	call   c0101f86 <page_alloc>
c01020a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (p == NULL) 
c01020ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01020af:	75 07                	jne    c01020b8 <pgdir_walk+0x88>
			return NULL;
c01020b1:	b8 00 00 00 00       	mov    $0x0,%eax
c01020b6:	eb 59                	jmp    c0102111 <pgdir_walk+0xe1>
		p -> pp_ref ++;
c01020b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020bb:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01020bf:	8d 50 01             	lea    0x1(%eax),%edx
c01020c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020c5:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[PDX(va)] = page2pa(p) | PTE_P | PTE_W | PTE_U;
c01020c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020cc:	c1 e8 16             	shr    $0x16,%eax
c01020cf:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01020d9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01020dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020df:	89 04 24             	mov    %eax,(%esp)
c01020e2:	e8 a4 fc ff ff       	call   c0101d8b <page2pa>
c01020e7:	83 c8 07             	or     $0x7,%eax
c01020ea:	89 03                	mov    %eax,(%ebx)
		t=page2kva(p);
c01020ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020ef:	89 04 24             	mov    %eax,(%esp)
c01020f2:	e8 ea fc ff ff       	call   c0101de1 <page2kva>
c01020f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	return &t[PTX(va)];
c01020fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020fd:	c1 e8 0c             	shr    $0xc,%eax
c0102100:	25 ff 03 00 00       	and    $0x3ff,%eax
c0102105:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010210c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010210f:	01 d0                	add    %edx,%eax
}
c0102111:	83 c4 24             	add    $0x24,%esp
c0102114:	5b                   	pop    %ebx
c0102115:	5d                   	pop    %ebp
c0102116:	c3                   	ret    

c0102117 <pg_copy>:


void 
pg_copy(pde_t *fa, pde_t *tb)
{
c0102117:	55                   	push   %ebp
c0102118:	89 e5                	mov    %esp,%ebp
c010211a:	53                   	push   %ebx
c010211b:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c010211e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102125:	e9 d3 01 00 00       	jmp    c01022fd <pg_copy+0x1e6>
		if (fa[i]&PTE_P){	
c010212a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010212d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102134:	8b 45 08             	mov    0x8(%ebp),%eax
c0102137:	01 d0                	add    %edx,%eax
c0102139:	8b 00                	mov    (%eax),%eax
c010213b:	83 e0 01             	and    $0x1,%eax
c010213e:	85 c0                	test   %eax,%eax
c0102140:	0f 84 b3 01 00 00    	je     c01022f9 <pg_copy+0x1e2>
			if (tb[i]&PTE_P) 
c0102146:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102149:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102150:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102153:	01 d0                	add    %edx,%eax
c0102155:	8b 00                	mov    (%eax),%eax
c0102157:	83 e0 01             	and    $0x1,%eax
c010215a:	85 c0                	test   %eax,%eax
c010215c:	74 05                	je     c0102163 <pg_copy+0x4c>
				continue;
c010215e:	e9 96 01 00 00       	jmp    c01022f9 <pg_copy+0x1e2>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c0102163:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102166:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010216d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102170:	01 d0                	add    %edx,%eax
c0102172:	8b 00                	mov    (%eax),%eax
c0102174:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102179:	89 44 24 08          	mov    %eax,0x8(%esp)
c010217d:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
c0102184:	00 
c0102185:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c010218c:	e8 bc fb ff ff       	call   c0101d4d <_kaddr>
c0102191:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c0102194:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010219b:	e8 e6 fd ff ff       	call   c0101f86 <page_alloc>
c01021a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c01021a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021a6:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01021aa:	8d 50 01             	lea    0x1(%eax),%edx
c01021ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021b0:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c01021b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021b7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01021be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021c1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01021c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021c7:	89 04 24             	mov    %eax,(%esp)
c01021ca:	e8 bc fb ff ff       	call   c0101d8b <page2pa>
c01021cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01021d2:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c01021d9:	8b 55 08             	mov    0x8(%ebp),%edx
c01021dc:	01 ca                	add    %ecx,%edx
c01021de:	8b 12                	mov    (%edx),%edx
c01021e0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c01021e6:	09 d0                	or     %edx,%eax
c01021e8:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c01021ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021ed:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01021f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021f7:	01 d0                	add    %edx,%eax
c01021f9:	8b 00                	mov    (%eax),%eax
c01021fb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102200:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102204:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c010220b:	00 
c010220c:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c0102213:	e8 35 fb ff ff       	call   c0101d4d <_kaddr>
c0102218:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c010221b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102222:	e9 c5 00 00 00       	jmp    c01022ec <pg_copy+0x1d5>
				if (fat[j]&PTE_P){ 
c0102227:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010222a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102231:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102234:	01 d0                	add    %edx,%eax
c0102236:	8b 00                	mov    (%eax),%eax
c0102238:	83 e0 01             	and    $0x1,%eax
c010223b:	85 c0                	test   %eax,%eax
c010223d:	0f 84 a5 00 00 00    	je     c01022e8 <pg_copy+0x1d1>
					p = page_alloc(0);
c0102243:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010224a:	e8 37 fd ff ff       	call   c0101f86 <page_alloc>
c010224f:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c0102252:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102255:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102259:	8d 50 01             	lea    0x1(%eax),%edx
c010225c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010225f:	66 89 50 04          	mov    %dx,0x4(%eax)
					tbt[j] = page2pa(p)|(fat[j]&0xFFF);
c0102263:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102266:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010226d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102270:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0102273:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102276:	89 04 24             	mov    %eax,(%esp)
c0102279:	e8 0d fb ff ff       	call   c0101d8b <page2pa>
c010227e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102281:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0102288:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010228b:	01 ca                	add    %ecx,%edx
c010228d:	8b 12                	mov    (%edx),%edx
c010228f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0102295:	09 d0                	or     %edx,%eax
c0102297:	89 03                	mov    %eax,(%ebx)
					memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
c0102299:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010229c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01022a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022a6:	01 d0                	add    %edx,%eax
c01022a8:	8b 00                	mov    (%eax),%eax
c01022aa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01022af:	89 44 24 08          	mov    %eax,0x8(%esp)
c01022b3:	c7 44 24 04 c5 00 00 	movl   $0xc5,0x4(%esp)
c01022ba:	00 
c01022bb:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c01022c2:	e8 86 fa ff ff       	call   c0101d4d <_kaddr>
c01022c7:	89 c3                	mov    %eax,%ebx
c01022c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022cc:	89 04 24             	mov    %eax,(%esp)
c01022cf:	e8 0d fb ff ff       	call   c0101de1 <page2kva>
c01022d4:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c01022db:	00 
c01022dc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c01022e0:	89 04 24             	mov    %eax,(%esp)
c01022e3:	e8 0d 10 00 00       	call   c01032f5 <memcpy>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c01022e8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01022ec:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c01022f3:	0f 8e 2e ff ff ff    	jle    c0102227 <pg_copy+0x110>

void 
pg_copy(pde_t *fa, pde_t *tb)
{
	int i, j;
	for (i=0;i<1024;i++){
c01022f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01022fd:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0102304:	0f 8e 20 fe ff ff    	jle    c010212a <pg_copy+0x13>
					memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
				}
			}
		}
	}
}
c010230a:	83 c4 34             	add    $0x34,%esp
c010230d:	5b                   	pop    %ebx
c010230e:	5d                   	pop    %ebp
c010230f:	c3                   	ret    

c0102310 <pg_scopy>:

void 
pg_scopy(pde_t *fa, pde_t *tb)
{
c0102310:	55                   	push   %ebp
c0102311:	89 e5                	mov    %esp,%ebp
c0102313:	53                   	push   %ebx
c0102314:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c0102317:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010231e:	e9 77 01 00 00       	jmp    c010249a <pg_scopy+0x18a>
		if (fa[i]&PTE_P){	
c0102323:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102326:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010232d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102330:	01 d0                	add    %edx,%eax
c0102332:	8b 00                	mov    (%eax),%eax
c0102334:	83 e0 01             	and    $0x1,%eax
c0102337:	85 c0                	test   %eax,%eax
c0102339:	0f 84 57 01 00 00    	je     c0102496 <pg_scopy+0x186>
			if (tb[i]&PTE_P) 
c010233f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102342:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102349:	8b 45 0c             	mov    0xc(%ebp),%eax
c010234c:	01 d0                	add    %edx,%eax
c010234e:	8b 00                	mov    (%eax),%eax
c0102350:	83 e0 01             	and    $0x1,%eax
c0102353:	85 c0                	test   %eax,%eax
c0102355:	74 05                	je     c010235c <pg_scopy+0x4c>
				continue;
c0102357:	e9 3a 01 00 00       	jmp    c0102496 <pg_scopy+0x186>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c010235c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010235f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102366:	8b 45 08             	mov    0x8(%ebp),%eax
c0102369:	01 d0                	add    %edx,%eax
c010236b:	8b 00                	mov    (%eax),%eax
c010236d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102372:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102376:	c7 44 24 04 d4 00 00 	movl   $0xd4,0x4(%esp)
c010237d:	00 
c010237e:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c0102385:	e8 c3 f9 ff ff       	call   c0101d4d <_kaddr>
c010238a:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c010238d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102394:	e8 ed fb ff ff       	call   c0101f86 <page_alloc>
c0102399:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c010239c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010239f:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01023a3:	8d 50 01             	lea    0x1(%eax),%edx
c01023a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01023a9:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c01023ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023b0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023ba:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01023bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01023c0:	89 04 24             	mov    %eax,(%esp)
c01023c3:	e8 c3 f9 ff ff       	call   c0101d8b <page2pa>
c01023c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01023cb:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c01023d2:	8b 55 08             	mov    0x8(%ebp),%edx
c01023d5:	01 ca                	add    %ecx,%edx
c01023d7:	8b 12                	mov    (%edx),%edx
c01023d9:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c01023df:	09 d0                	or     %edx,%eax
c01023e1:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c01023e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023e6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023f0:	01 d0                	add    %edx,%eax
c01023f2:	8b 00                	mov    (%eax),%eax
c01023f4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01023f9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01023fd:	c7 44 24 04 d8 00 00 	movl   $0xd8,0x4(%esp)
c0102404:	00 
c0102405:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c010240c:	e8 3c f9 ff ff       	call   c0101d4d <_kaddr>
c0102411:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c0102414:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010241b:	eb 70                	jmp    c010248d <pg_scopy+0x17d>
				if (fat[j]&PTE_P){ 
c010241d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102420:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102427:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010242a:	01 d0                	add    %edx,%eax
c010242c:	8b 00                	mov    (%eax),%eax
c010242e:	83 e0 01             	and    $0x1,%eax
c0102431:	85 c0                	test   %eax,%eax
c0102433:	74 54                	je     c0102489 <pg_scopy+0x179>
					p=pa2page(PTE_ADDR(fat[j]));
c0102435:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102438:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010243f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102442:	01 d0                	add    %edx,%eax
c0102444:	8b 00                	mov    (%eax),%eax
c0102446:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010244b:	89 04 24             	mov    %eax,(%esp)
c010244e:	e8 4f f9 ff ff       	call   c0101da2 <pa2page>
c0102453:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c0102456:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102459:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010245d:	8d 50 01             	lea    0x1(%eax),%edx
c0102460:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102463:	66 89 50 04          	mov    %dx,0x4(%eax)
					tbt[j] = fat[j];
c0102467:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010246a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102471:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102474:	01 c2                	add    %eax,%edx
c0102476:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102479:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0102480:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102483:	01 c8                	add    %ecx,%eax
c0102485:	8b 00                	mov    (%eax),%eax
c0102487:	89 02                	mov    %eax,(%edx)
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c0102489:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010248d:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0102494:	7e 87                	jle    c010241d <pg_scopy+0x10d>

void 
pg_scopy(pde_t *fa, pde_t *tb)
{
	int i, j;
	for (i=0;i<1024;i++){
c0102496:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010249a:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c01024a1:	0f 8e 7c fe ff ff    	jle    c0102323 <pg_scopy+0x13>
					tbt[j] = fat[j];
				}
			}
		}
	}
}
c01024a7:	83 c4 34             	add    $0x34,%esp
c01024aa:	5b                   	pop    %ebx
c01024ab:	5d                   	pop    %ebp
c01024ac:	c3                   	ret    

c01024ad <pg_remove>:

void 
pg_remove(pde_t *pgdir)
{
c01024ad:	55                   	push   %ebp
c01024ae:	89 e5                	mov    %esp,%ebp
c01024b0:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for (i=0; i<1024;i++) {
c01024b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01024ba:	e9 fb 00 00 00       	jmp    c01025ba <pg_remove+0x10d>
		if (pgdir[i]&PTE_P) {
c01024bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024c2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01024c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01024cc:	01 d0                	add    %edx,%eax
c01024ce:	8b 00                	mov    (%eax),%eax
c01024d0:	83 e0 01             	and    $0x1,%eax
c01024d3:	85 c0                	test   %eax,%eax
c01024d5:	0f 84 db 00 00 00    	je     c01025b6 <pg_remove+0x109>
			if (kern_pgdir[i]&PTE_P) 
c01024db:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01024e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01024e3:	c1 e2 02             	shl    $0x2,%edx
c01024e6:	01 d0                	add    %edx,%eax
c01024e8:	8b 00                	mov    (%eax),%eax
c01024ea:	83 e0 01             	and    $0x1,%eax
c01024ed:	85 c0                	test   %eax,%eax
c01024ef:	74 05                	je     c01024f6 <pg_remove+0x49>
				continue;
c01024f1:	e9 c0 00 00 00       	jmp    c01025b6 <pg_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
c01024f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024f9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102500:	8b 45 08             	mov    0x8(%ebp),%eax
c0102503:	01 d0                	add    %edx,%eax
c0102505:	8b 00                	mov    (%eax),%eax
c0102507:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010250c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102510:	c7 44 24 04 ec 00 00 	movl   $0xec,0x4(%esp)
c0102517:	00 
c0102518:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c010251f:	e8 29 f8 ff ff       	call   c0101d4d <_kaddr>
c0102524:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (j=0; j<NPTENTRIES;j++){
c0102527:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010252e:	eb 42                	jmp    c0102572 <pg_remove+0xc5>
				if (pgtable[j]&PTE_P){
c0102530:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102533:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010253a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010253d:	01 d0                	add    %edx,%eax
c010253f:	8b 00                	mov    (%eax),%eax
c0102541:	83 e0 01             	and    $0x1,%eax
c0102544:	85 c0                	test   %eax,%eax
c0102546:	74 26                	je     c010256e <pg_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
c0102548:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010254b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102552:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102555:	01 d0                	add    %edx,%eax
c0102557:	8b 00                	mov    (%eax),%eax
c0102559:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010255e:	89 04 24             	mov    %eax,(%esp)
c0102561:	e8 3c f8 ff ff       	call   c0101da2 <pa2page>
c0102566:	89 04 24             	mov    %eax,(%esp)
c0102569:	e8 92 fa ff ff       	call   c0102000 <page_decref>
	for (i=0; i<1024;i++) {
		if (pgdir[i]&PTE_P) {
			if (kern_pgdir[i]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
			for (j=0; j<NPTENTRIES;j++){
c010256e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102572:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0102579:	7e b5                	jle    c0102530 <pg_remove+0x83>
				if (pgtable[j]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
c010257b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010257e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102585:	8b 45 08             	mov    0x8(%ebp),%eax
c0102588:	01 d0                	add    %edx,%eax
c010258a:	8b 00                	mov    (%eax),%eax
c010258c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102591:	89 04 24             	mov    %eax,(%esp)
c0102594:	e8 09 f8 ff ff       	call   c0101da2 <pa2page>
c0102599:	89 04 24             	mov    %eax,(%esp)
c010259c:	e8 5f fa ff ff       	call   c0102000 <page_decref>
			pgdir[i]=NULL;
c01025a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025a4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01025ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ae:	01 d0                	add    %edx,%eax
c01025b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

void 
pg_remove(pde_t *pgdir)
{
	int i,j;
	for (i=0; i<1024;i++) {
c01025b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01025ba:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c01025c1:	0f 8e f8 fe ff ff    	jle    c01024bf <pg_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
			pgdir[i]=NULL;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c01025c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ca:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025ce:	c7 44 24 04 f6 00 00 	movl   $0xf6,0x4(%esp)
c01025d5:	00 
c01025d6:	c7 04 24 95 44 10 c0 	movl   $0xc0104495,(%esp)
c01025dd:	e8 30 f7 ff ff       	call   c0101d12 <_paddr>
c01025e2:	89 04 24             	mov    %eax,(%esp)
c01025e5:	e8 b8 f7 ff ff       	call   c0101da2 <pa2page>
c01025ea:	89 04 24             	mov    %eax,(%esp)
c01025ed:	e8 0e fa ff ff       	call   c0102000 <page_decref>
	pgdir=NULL;
c01025f2:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c01025f9:	c9                   	leave  
c01025fa:	c3                   	ret    

c01025fb <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c01025fb:	55                   	push   %ebp
c01025fc:	89 e5                	mov    %esp,%ebp
c01025fe:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c0102601:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102608:	eb 47                	jmp    c0102651 <boot_map_region+0x56>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c010260a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010260d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0102614:	00 
c0102615:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102619:	8b 45 08             	mov    0x8(%ebp),%eax
c010261c:	89 04 24             	mov    %eax,(%esp)
c010261f:	e8 0c fa ff ff       	call   c0102030 <pgdir_walk>
c0102624:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (pte == NULL) 
c0102627:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010262b:	75 02                	jne    c010262f <boot_map_region+0x34>
			return;
c010262d:	eb 2f                	jmp    c010265e <boot_map_region+0x63>
		pte[0]=pa|perm|PTE_P;
c010262f:	8b 45 18             	mov    0x18(%ebp),%eax
c0102632:	0b 45 14             	or     0x14(%ebp),%eax
c0102635:	83 c8 01             	or     $0x1,%eax
c0102638:	89 c2                	mov    %eax,%edx
c010263a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010263d:	89 10                	mov    %edx,(%eax)
		va+=PGSIZE;
c010263f:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa+=PGSIZE;
c0102646:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c010264d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102651:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102654:	8b 55 10             	mov    0x10(%ebp),%edx
c0102657:	c1 ea 0c             	shr    $0xc,%edx
c010265a:	39 d0                	cmp    %edx,%eax
c010265c:	72 ac                	jb     c010260a <boot_map_region+0xf>
			return;
		pte[0]=pa|perm|PTE_P;
		va+=PGSIZE;
		pa+=PGSIZE;
	}
}
c010265e:	c9                   	leave  
c010265f:	c3                   	ret    

c0102660 <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c0102660:	55                   	push   %ebp
c0102661:	89 e5                	mov    %esp,%ebp
c0102663:	53                   	push   %ebx
c0102664:	83 ec 24             	sub    $0x24,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 1);
c0102667:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010266e:	00 
c010266f:	8b 45 10             	mov    0x10(%ebp),%eax
c0102672:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102676:	8b 45 08             	mov    0x8(%ebp),%eax
c0102679:	89 04 24             	mov    %eax,(%esp)
c010267c:	e8 af f9 ff ff       	call   c0102030 <pgdir_walk>
c0102681:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c0102684:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102688:	75 0a                	jne    c0102694 <page_insert+0x34>
		return -1;
c010268a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010268f:	e9 85 00 00 00       	jmp    c0102719 <page_insert+0xb9>
	}
	else if (pte[0] & PTE_P) {
c0102694:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102697:	8b 00                	mov    (%eax),%eax
c0102699:	83 e0 01             	and    $0x1,%eax
c010269c:	85 c0                	test   %eax,%eax
c010269e:	74 49                	je     c01026e9 <page_insert+0x89>
		if (PTE_ADDR(pte[0]) == page2pa(pp)) {
c01026a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026a3:	8b 00                	mov    (%eax),%eax
c01026a5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01026aa:	89 c3                	mov    %eax,%ebx
c01026ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026af:	89 04 24             	mov    %eax,(%esp)
c01026b2:	e8 d4 f6 ff ff       	call   c0101d8b <page2pa>
c01026b7:	39 c3                	cmp    %eax,%ebx
c01026b9:	75 1c                	jne    c01026d7 <page_insert+0x77>
			pte[0] = page2pa(pp)|perm|PTE_P;
c01026bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026be:	89 04 24             	mov    %eax,(%esp)
c01026c1:	e8 c5 f6 ff ff       	call   c0101d8b <page2pa>
c01026c6:	8b 55 14             	mov    0x14(%ebp),%edx
c01026c9:	09 d0                	or     %edx,%eax
c01026cb:	83 c8 01             	or     $0x1,%eax
c01026ce:	89 c2                	mov    %eax,%edx
c01026d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026d3:	89 10                	mov    %edx,(%eax)
c01026d5:	eb 12                	jmp    c01026e9 <page_insert+0x89>
		}
		else {
			page_remove(pgdir, va);
c01026d7:	8b 45 10             	mov    0x10(%ebp),%eax
c01026da:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026de:	8b 45 08             	mov    0x8(%ebp),%eax
c01026e1:	89 04 24             	mov    %eax,(%esp)
c01026e4:	e8 88 00 00 00       	call   c0102771 <page_remove>
		}
	}
	pte[0] = page2pa(pp)|perm|PTE_P;
c01026e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026ec:	89 04 24             	mov    %eax,(%esp)
c01026ef:	e8 97 f6 ff ff       	call   c0101d8b <page2pa>
c01026f4:	8b 55 14             	mov    0x14(%ebp),%edx
c01026f7:	09 d0                	or     %edx,%eax
c01026f9:	83 c8 01             	or     $0x1,%eax
c01026fc:	89 c2                	mov    %eax,%edx
c01026fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102701:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c0102703:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102706:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010270a:	8d 50 01             	lea    0x1(%eax),%edx
c010270d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102710:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c0102714:	b8 00 00 00 00       	mov    $0x0,%eax

}
c0102719:	83 c4 24             	add    $0x24,%esp
c010271c:	5b                   	pop    %ebx
c010271d:	5d                   	pop    %ebp
c010271e:	c3                   	ret    

c010271f <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c010271f:	55                   	push   %ebp
c0102720:	89 e5                	mov    %esp,%ebp
c0102722:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 0);
c0102725:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010272c:	00 
c010272d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102730:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102734:	8b 45 08             	mov    0x8(%ebp),%eax
c0102737:	89 04 24             	mov    %eax,(%esp)
c010273a:	e8 f1 f8 ff ff       	call   c0102030 <pgdir_walk>
c010273f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) 
c0102742:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102746:	75 07                	jne    c010274f <page_lookup+0x30>
		return NULL;
c0102748:	b8 00 00 00 00       	mov    $0x0,%eax
c010274d:	eb 20                	jmp    c010276f <page_lookup+0x50>
	if (pte_store != NULL) 
c010274f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102753:	74 08                	je     c010275d <page_lookup+0x3e>
		*pte_store = pte;
c0102755:	8b 45 10             	mov    0x10(%ebp),%eax
c0102758:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010275b:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(pte[0]));
c010275d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102760:	8b 00                	mov    (%eax),%eax
c0102762:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102767:	89 04 24             	mov    %eax,(%esp)
c010276a:	e8 33 f6 ff ff       	call   c0101da2 <pa2page>
}
c010276f:	c9                   	leave  
c0102770:	c3                   	ret    

c0102771 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c0102771:	55                   	push   %ebp
c0102772:	89 e5                	mov    %esp,%ebp
c0102774:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte=NULL;
c0102777:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	struct Page *p = page_lookup(pgdir, va, &pte);
c010277e:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0102781:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102785:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102788:	89 44 24 04          	mov    %eax,0x4(%esp)
c010278c:	8b 45 08             	mov    0x8(%ebp),%eax
c010278f:	89 04 24             	mov    %eax,(%esp)
c0102792:	e8 88 ff ff ff       	call   c010271f <page_lookup>
c0102797:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p != NULL) {
c010279a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010279e:	74 14                	je     c01027b4 <page_remove+0x43>
		pte[0] = 0;
c01027a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027a3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c01027a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027ac:	89 04 24             	mov    %eax,(%esp)
c01027af:	e8 4c f8 ff ff       	call   c0102000 <page_decref>
	}
	tlb_invalidate(pgdir, va);
c01027b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027b7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01027be:	89 04 24             	mov    %eax,(%esp)
c01027c1:	e8 02 00 00 00       	call   c01027c8 <tlb_invalidate>
}
c01027c6:	c9                   	leave  
c01027c7:	c3                   	ret    

c01027c8 <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c01027c8:	55                   	push   %ebp
c01027c9:	89 e5                	mov    %esp,%ebp
c01027cb:	83 ec 10             	sub    $0x10,%esp
c01027ce:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c01027d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01027d7:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c01027da:	c9                   	leave  
c01027db:	c3                   	ret    

c01027dc <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01027dc:	55                   	push   %ebp
c01027dd:	89 e5                	mov    %esp,%ebp
c01027df:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01027e2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01027e6:	75 24                	jne    c010280c <list_add+0x30>
c01027e8:	c7 44 24 0c ac 44 10 	movl   $0xc01044ac,0xc(%esp)
c01027ef:	c0 
c01027f0:	c7 44 24 08 b9 44 10 	movl   $0xc01044b9,0x8(%esp)
c01027f7:	c0 
c01027f8:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c01027ff:	00 
c0102800:	c7 04 24 ce 44 10 c0 	movl   $0xc01044ce,(%esp)
c0102807:	e8 49 05 00 00       	call   c0102d55 <_panic>
	data->prev = prev;
c010280c:	8b 45 10             	mov    0x10(%ebp),%eax
c010280f:	8b 55 08             	mov    0x8(%ebp),%edx
c0102812:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0102814:	8b 45 10             	mov    0x10(%ebp),%eax
c0102817:	8b 55 0c             	mov    0xc(%ebp),%edx
c010281a:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010281d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102821:	74 09                	je     c010282c <list_add+0x50>
c0102823:	8b 45 08             	mov    0x8(%ebp),%eax
c0102826:	8b 55 10             	mov    0x10(%ebp),%edx
c0102829:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c010282c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102830:	74 08                	je     c010283a <list_add+0x5e>
c0102832:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102835:	8b 55 10             	mov    0x10(%ebp),%edx
c0102838:	89 10                	mov    %edx,(%eax)
}
c010283a:	c9                   	leave  
c010283b:	c3                   	ret    

c010283c <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c010283c:	55                   	push   %ebp
c010283d:	89 e5                	mov    %esp,%ebp
c010283f:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0102842:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102846:	75 24                	jne    c010286c <list_add_before+0x30>
c0102848:	c7 44 24 0c e4 44 10 	movl   $0xc01044e4,0xc(%esp)
c010284f:	c0 
c0102850:	c7 44 24 08 b9 44 10 	movl   $0xc01044b9,0x8(%esp)
c0102857:	c0 
c0102858:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c010285f:	00 
c0102860:	c7 04 24 ce 44 10 c0 	movl   $0xc01044ce,(%esp)
c0102867:	e8 e9 04 00 00       	call   c0102d55 <_panic>
	list_add(one->prev, one, data);
c010286c:	8b 45 08             	mov    0x8(%ebp),%eax
c010286f:	8b 00                	mov    (%eax),%eax
c0102871:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102874:	89 54 24 08          	mov    %edx,0x8(%esp)
c0102878:	8b 55 08             	mov    0x8(%ebp),%edx
c010287b:	89 54 24 04          	mov    %edx,0x4(%esp)
c010287f:	89 04 24             	mov    %eax,(%esp)
c0102882:	e8 55 ff ff ff       	call   c01027dc <list_add>
}
c0102887:	c9                   	leave  
c0102888:	c3                   	ret    

c0102889 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0102889:	55                   	push   %ebp
c010288a:	89 e5                	mov    %esp,%ebp
c010288c:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c010288f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102893:	75 24                	jne    c01028b9 <list_del+0x30>
c0102895:	c7 44 24 0c ac 44 10 	movl   $0xc01044ac,0xc(%esp)
c010289c:	c0 
c010289d:	c7 44 24 08 b9 44 10 	movl   $0xc01044b9,0x8(%esp)
c01028a4:	c0 
c01028a5:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c01028ac:	00 
c01028ad:	c7 04 24 ce 44 10 c0 	movl   $0xc01044ce,(%esp)
c01028b4:	e8 9c 04 00 00       	call   c0102d55 <_panic>
	list *prev = data->prev;
c01028b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01028bc:	8b 00                	mov    (%eax),%eax
c01028be:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01028c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01028c4:	8b 40 04             	mov    0x4(%eax),%eax
c01028c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01028ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01028ce:	74 09                	je     c01028d9 <list_del+0x50>
c01028d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028d3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01028d6:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01028d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01028dd:	74 08                	je     c01028e7 <list_del+0x5e>
c01028df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01028e5:	89 10                	mov    %edx,(%eax)
}
c01028e7:	c9                   	leave  
c01028e8:	c3                   	ret    

c01028e9 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c01028e9:	55                   	push   %ebp
c01028ea:	89 e5                	mov    %esp,%ebp
c01028ec:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01028ef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01028f3:	75 24                	jne    c0102919 <list_empty+0x30>
c01028f5:	c7 44 24 0c e4 44 10 	movl   $0xc01044e4,0xc(%esp)
c01028fc:	c0 
c01028fd:	c7 44 24 08 b9 44 10 	movl   $0xc01044b9,0x8(%esp)
c0102904:	c0 
c0102905:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c010290c:	00 
c010290d:	c7 04 24 ce 44 10 c0 	movl   $0xc01044ce,(%esp)
c0102914:	e8 3c 04 00 00       	call   c0102d55 <_panic>
	return one == one->next;
c0102919:	8b 45 08             	mov    0x8(%ebp),%eax
c010291c:	8b 40 04             	mov    0x4(%eax),%eax
c010291f:	3b 45 08             	cmp    0x8(%ebp),%eax
c0102922:	0f 94 c0             	sete   %al
c0102925:	0f b6 c0             	movzbl %al,%eax
}
c0102928:	c9                   	leave  
c0102929:	c3                   	ret    

c010292a <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c010292a:	55                   	push   %ebp
c010292b:	89 e5                	mov    %esp,%ebp
c010292d:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0102930:	8b 45 10             	mov    0x10(%ebp),%eax
c0102933:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0102938:	77 21                	ja     c010295b <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c010293a:	8b 45 10             	mov    0x10(%ebp),%eax
c010293d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102941:	c7 44 24 08 f0 44 10 	movl   $0xc01044f0,0x8(%esp)
c0102948:	c0 
c0102949:	8b 45 0c             	mov    0xc(%ebp),%eax
c010294c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102950:	8b 45 08             	mov    0x8(%ebp),%eax
c0102953:	89 04 24             	mov    %eax,(%esp)
c0102956:	e8 fa 03 00 00       	call   c0102d55 <_panic>
	return (physaddr_t)kva - KERNBASE;
c010295b:	8b 45 10             	mov    0x10(%ebp),%eax
c010295e:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0102963:	c9                   	leave  
c0102964:	c3                   	ret    

c0102965 <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(int pan){
c0102965:	55                   	push   %ebp
c0102966:	89 e5                	mov    %esp,%ebp
c0102968:	83 ec 38             	sub    $0x38,%esp
	if(pan==1){
c010296b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010296f:	75 72                	jne    c01029e3 <schedule+0x7e>
		list *one,*ne;
		list *bl=&block;
c0102971:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
		//printk("Oh,Shit!!!");
		for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c0102978:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010297b:	8b 40 04             	mov    0x4(%eax),%eax
c010297e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102981:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102984:	8b 40 04             	mov    0x4(%eax),%eax
c0102987:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010298a:	eb 4f                	jmp    c01029db <schedule+0x76>
			PCB *p=list_entry(one,PCB,plist);
c010298c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010298f:	83 e8 08             	sub    $0x8,%eax
c0102992:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->timecount--;
c0102995:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102998:	8b 40 1c             	mov    0x1c(%eax),%eax
c010299b:	8d 50 ff             	lea    -0x1(%eax),%edx
c010299e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029a1:	89 50 1c             	mov    %edx,0x1c(%eax)
			if(p->timecount==0){
c01029a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029a7:	8b 40 1c             	mov    0x1c(%eax),%eax
c01029aa:	85 c0                	test   %eax,%eax
c01029ac:	75 1e                	jne    c01029cc <schedule+0x67>
				list_del(one);
c01029ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029b1:	89 04 24             	mov    %eax,(%esp)
c01029b4:	e8 d0 fe ff ff       	call   c0102889 <list_del>
				list_add_before(&ready,one);
c01029b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029bc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029c0:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c01029c7:	e8 70 fe ff ff       	call   c010283c <list_add_before>
void schedule(int pan){
	if(pan==1){
		list *one,*ne;
		list *bl=&block;
		//printk("Oh,Shit!!!");
		for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c01029cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01029d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029d5:	8b 40 04             	mov    0x4(%eax),%eax
c01029d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01029db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029de:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c01029e1:	75 a9                	jne    c010298c <schedule+0x27>
				list_del(one);
				list_add_before(&ready,one);
			}
		}
	}
	if(!list_empty(&ready)){
c01029e3:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c01029ea:	e8 fa fe ff ff       	call   c01028e9 <list_empty>
c01029ef:	85 c0                	test   %eax,%eax
c01029f1:	75 7e                	jne    c0102a71 <schedule+0x10c>
		list *re=&ready;
c01029f3:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c01029fa:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01029ff:	8b 40 04             	mov    0x4(%eax),%eax
c0102a02:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c0102a05:	75 0d                	jne    c0102a14 <schedule+0xaf>
			now=re->next;
c0102a07:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102a0a:	8b 40 04             	mov    0x4(%eax),%eax
c0102a0d:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c0102a12:	eb 0d                	jmp    c0102a21 <schedule+0xbc>
		else
			now=now->next;
c0102a14:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102a19:	8b 40 04             	mov    0x4(%eax),%eax
c0102a1c:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c0102a21:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102a26:	83 e8 08             	sub    $0x8,%eax
c0102a29:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c0102a2e:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0102a33:	05 f8 0f 00 00       	add    $0xff8,%eax
c0102a38:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c0102a3b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102a3e:	89 04 24             	mov    %eax,(%esp)
c0102a41:	e8 fe 01 00 00       	call   c0102c44 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c0102a46:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0102a4b:	8b 40 04             	mov    0x4(%eax),%eax
c0102a4e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a52:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c0102a59:	00 
c0102a5a:	c7 04 24 14 45 10 c0 	movl   $0xc0104514,(%esp)
c0102a61:	e8 c4 fe ff ff       	call   c010292a <_paddr>
c0102a66:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0102a69:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102a6c:	0f 22 d8             	mov    %eax,%cr3
c0102a6f:	eb 3a                	jmp    c0102aab <schedule+0x146>
	}
	else{
		pcbnow=&init;
c0102a71:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0102a78:	3f 16 c0 
		now=&ready;
c0102a7b:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0102a82:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c0102a85:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0102a8a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a8e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0102a95:	00 
c0102a96:	c7 04 24 14 45 10 c0 	movl   $0xc0104514,(%esp)
c0102a9d:	e8 88 fe ff ff       	call   c010292a <_paddr>
c0102aa2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102aa5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102aa8:	0f 22 d8             	mov    %eax,%cr3
	}
}
c0102aab:	c9                   	leave  
c0102aac:	c3                   	ret    

c0102aad <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c0102aad:	55                   	push   %ebp
c0102aae:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c0102ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ab3:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0102ab8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102abb:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c0102ac1:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac4:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0102ac8:	8b 45 10             	mov    0x10(%ebp),%eax
c0102acb:	83 e0 0f             	and    $0xf,%eax
c0102ace:	89 c2                	mov    %eax,%edx
c0102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ad3:	89 d1                	mov    %edx,%ecx
c0102ad5:	83 e1 0f             	and    $0xf,%ecx
c0102ad8:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102adc:	83 e2 f0             	and    $0xfffffff0,%edx
c0102adf:	09 ca                	or     %ecx,%edx
c0102ae1:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c0102ae4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ae7:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102aeb:	83 ca 10             	or     $0x10,%edx
c0102aee:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c0102af1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102af4:	83 e0 03             	and    $0x3,%eax
c0102af7:	89 c2                	mov    %eax,%edx
c0102af9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102afc:	83 e2 03             	and    $0x3,%edx
c0102aff:	89 d1                	mov    %edx,%ecx
c0102b01:	c1 e1 05             	shl    $0x5,%ecx
c0102b04:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102b08:	83 e2 9f             	and    $0xffffff9f,%edx
c0102b0b:	09 ca                	or     %ecx,%edx
c0102b0d:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102b10:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b13:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102b17:	83 ca 80             	or     $0xffffff80,%edx
c0102b1a:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c0102b1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b20:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b24:	83 ca 0f             	or     $0xf,%edx
c0102b27:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102b2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b2d:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b31:	83 e2 ef             	and    $0xffffffef,%edx
c0102b34:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102b37:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b3a:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b3e:	83 e2 df             	and    $0xffffffdf,%edx
c0102b41:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102b44:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b47:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b4b:	83 ca 40             	or     $0x40,%edx
c0102b4e:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c0102b51:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b54:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b58:	83 ca 80             	or     $0xffffff80,%edx
c0102b5b:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c0102b5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b61:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c0102b65:	5d                   	pop    %ebp
c0102b66:	c3                   	ret    

c0102b67 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c0102b67:	55                   	push   %ebp
c0102b68:	89 e5                	mov    %esp,%ebp
c0102b6a:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c0102b6d:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c0102b74:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c0102b77:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c0102b7e:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c0102b85:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102b88:	89 c2                	mov    %eax,%edx
c0102b8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b8d:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c0102b90:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102b93:	89 c2                	mov    %eax,%edx
c0102b95:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b98:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c0102b9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102b9f:	c1 e8 10             	shr    $0x10,%eax
c0102ba2:	89 c2                	mov    %eax,%edx
c0102ba4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ba7:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c0102baa:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bad:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102bb1:	83 e2 f0             	and    $0xfffffff0,%edx
c0102bb4:	83 ca 09             	or     $0x9,%edx
c0102bb7:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c0102bba:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bbd:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102bc1:	83 e2 ef             	and    $0xffffffef,%edx
c0102bc4:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c0102bc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bca:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102bce:	83 ca 60             	or     $0x60,%edx
c0102bd1:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102bd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bd7:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102bdb:	83 ca 80             	or     $0xffffff80,%edx
c0102bde:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102be1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102be4:	c1 e8 10             	shr    $0x10,%eax
c0102be7:	83 e0 0f             	and    $0xf,%eax
c0102bea:	89 c2                	mov    %eax,%edx
c0102bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bef:	89 d1                	mov    %edx,%ecx
c0102bf1:	83 e1 0f             	and    $0xf,%ecx
c0102bf4:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102bf8:	83 e2 f0             	and    $0xfffffff0,%edx
c0102bfb:	09 ca                	or     %ecx,%edx
c0102bfd:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102c00:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c03:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102c07:	83 e2 ef             	and    $0xffffffef,%edx
c0102c0a:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102c0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c10:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102c14:	83 e2 df             	and    $0xffffffdf,%edx
c0102c17:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102c1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c1d:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102c21:	83 ca 40             	or     $0x40,%edx
c0102c24:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c0102c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c2a:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102c2e:	83 e2 7f             	and    $0x7f,%edx
c0102c31:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c0102c34:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102c37:	c1 e8 18             	shr    $0x18,%eax
c0102c3a:	89 c2                	mov    %eax,%edx
c0102c3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c3f:	88 50 07             	mov    %dl,0x7(%eax)
}
c0102c42:	c9                   	leave  
c0102c43:	c3                   	ret    

c0102c44 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c0102c44:	55                   	push   %ebp
c0102c45:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c0102c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c4a:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c0102c4f:	5d                   	pop    %ebp
c0102c50:	c3                   	ret    

c0102c51 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0102c51:	55                   	push   %ebp
c0102c52:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0102c54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c57:	83 e8 01             	sub    $0x1,%eax
c0102c5a:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c0102c60:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c63:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c6c:	c1 e8 10             	shr    $0x10,%eax
c0102c6f:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c0102c75:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c0102c7a:	0f 01 10             	lgdtl  (%eax)
}
c0102c7d:	5d                   	pop    %ebp
c0102c7e:	c3                   	ret    

c0102c7f <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c0102c7f:	55                   	push   %ebp
c0102c80:	89 e5                	mov    %esp,%ebp
c0102c82:	83 ec 04             	sub    $0x4,%esp
c0102c85:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c88:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c0102c8c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102c90:	0f 00 d8             	ltr    %ax
}
c0102c93:	c9                   	leave  
c0102c94:	c3                   	ret    

c0102c95 <init_segment>:

void
init_segment(void) {
c0102c95:	55                   	push   %ebp
c0102c96:	89 e5                	mov    %esp,%ebp
c0102c98:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c0102c9b:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c0102ca2:	00 
c0102ca3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102caa:	00 
c0102cab:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102cb2:	e8 5b 06 00 00       	call   c0103312 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c0102cb7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102cbe:	00 
c0102cbf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102cc6:	00 
c0102cc7:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c0102cce:	e8 da fd ff ff       	call   c0102aad <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0102cd3:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102cda:	00 
c0102cdb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102ce2:	00 
c0102ce3:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c0102cea:	e8 be fd ff ff       	call   c0102aad <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0102cef:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102cf6:	00 
c0102cf7:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102cfe:	00 
c0102cff:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c0102d06:	e8 a2 fd ff ff       	call   c0102aad <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c0102d0b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102d12:	00 
c0102d13:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102d1a:	00 
c0102d1b:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c0102d22:	e8 86 fd ff ff       	call   c0102aad <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0102d27:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c0102d2e:	00 
c0102d2f:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102d36:	e8 16 ff ff ff       	call   c0102c51 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c0102d3b:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c0102d42:	e8 20 fe ff ff       	call   c0102b67 <set_tss>
	load_tr(USEL(SEG_TSS));
c0102d47:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c0102d4e:	e8 2c ff ff ff       	call   c0102c7f <load_tr>
}
c0102d53:	c9                   	leave  
c0102d54:	c3                   	ret    

c0102d55 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c0102d55:	55                   	push   %ebp
c0102d56:	89 e5                	mov    %esp,%ebp
c0102d58:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c0102d5b:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c0102d60:	85 c0                	test   %eax,%eax
c0102d62:	74 01                	je     c0102d65 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0102d64:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c0102d65:	8b 45 10             	mov    0x10(%ebp),%eax
c0102d68:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c0102d6d:	fa                   	cli    
c0102d6e:	fc                   	cld    

	va_start(ap, fmt);
c0102d6f:	8d 45 14             	lea    0x14(%ebp),%eax
c0102d72:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0102d75:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d78:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d7f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d83:	c7 04 24 2c 45 10 c0 	movl   $0xc010452c,(%esp)
c0102d8a:	e8 f5 00 00 00       	call   c0102e84 <printk>
	vprintk(fmt, ap);
c0102d8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d92:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d96:	8b 45 10             	mov    0x10(%ebp),%eax
c0102d99:	89 04 24             	mov    %eax,(%esp)
c0102d9c:	e8 b0 00 00 00       	call   c0102e51 <vprintk>
	printk("\n");
c0102da1:	c7 04 24 44 45 10 c0 	movl   $0xc0104544,(%esp)
c0102da8:	e8 d7 00 00 00       	call   c0102e84 <printk>
	va_end(ap);

}
c0102dad:	c9                   	leave  
c0102dae:	c3                   	ret    

c0102daf <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c0102daf:	55                   	push   %ebp
c0102db0:	89 e5                	mov    %esp,%ebp
c0102db2:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102db5:	8d 45 14             	lea    0x14(%ebp),%eax
c0102db8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c0102dbb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dbe:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102dc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dc5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102dc9:	c7 04 24 46 45 10 c0 	movl   $0xc0104546,(%esp)
c0102dd0:	e8 af 00 00 00       	call   c0102e84 <printk>
	vprintk(fmt, ap);
c0102dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102dd8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ddc:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ddf:	89 04 24             	mov    %eax,(%esp)
c0102de2:	e8 6a 00 00 00       	call   c0102e51 <vprintk>
	printk("\n");
c0102de7:	c7 04 24 44 45 10 c0 	movl   $0xc0104544,(%esp)
c0102dee:	e8 91 00 00 00       	call   c0102e84 <printk>
	va_end(ap);
}
c0102df3:	c9                   	leave  
c0102df4:	c3                   	ret    

c0102df5 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0102df5:	55                   	push   %ebp
c0102df6:	89 e5                	mov    %esp,%ebp
c0102df8:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0102dfb:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102dff:	75 2b                	jne    c0102e2c <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0102e01:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102e08:	eb 1a                	jmp    c0102e24 <sys_write+0x2f>
			serial_printc(buf[i]);
c0102e0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102e0d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e10:	01 d0                	add    %edx,%eax
c0102e12:	0f b6 00             	movzbl (%eax),%eax
c0102e15:	0f be c0             	movsbl %al,%eax
c0102e18:	89 04 24             	mov    %eax,(%esp)
c0102e1b:	e8 3e dd ff ff       	call   c0100b5e <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0102e20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102e24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e27:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102e2a:	7c de                	jl     c0102e0a <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c0102e2c:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e2f:	c9                   	leave  
c0102e30:	c3                   	ret    

c0102e31 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c0102e31:	55                   	push   %ebp
c0102e32:	89 e5                	mov    %esp,%ebp
c0102e34:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c0102e37:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e3a:	89 04 24             	mov    %eax,(%esp)
c0102e3d:	e8 46 dd ff ff       	call   c0100b88 <putchar>
	++*cnt;
c0102e42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e45:	8b 00                	mov    (%eax),%eax
c0102e47:	8d 50 01             	lea    0x1(%eax),%edx
c0102e4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e4d:	89 10                	mov    %edx,(%eax)
}
c0102e4f:	c9                   	leave  
c0102e50:	c3                   	ret    

c0102e51 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0102e51:	55                   	push   %ebp
c0102e52:	89 e5                	mov    %esp,%ebp
c0102e54:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102e57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c0102e5e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e61:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102e65:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e68:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102e6c:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102e6f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e73:	c7 04 24 31 2e 10 c0 	movl   $0xc0102e31,(%esp)
c0102e7a:	e8 9b 0a 00 00       	call   c010391a <vprintfmt>
	return cnt;
c0102e7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102e82:	c9                   	leave  
c0102e83:	c3                   	ret    

c0102e84 <printk>:

int printk(const char *fmt, ...)
{
c0102e84:	55                   	push   %ebp
c0102e85:	89 e5                	mov    %esp,%ebp
c0102e87:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0102e8a:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102e8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c0102e90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e93:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e9a:	89 04 24             	mov    %eax,(%esp)
c0102e9d:	e8 af ff ff ff       	call   c0102e51 <vprintk>
c0102ea2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102ea5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102ea8:	c9                   	leave  
c0102ea9:	c3                   	ret    

c0102eaa <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0102eaa:	6a 00                	push   $0x0
c0102eac:	6a 00                	push   $0x0
c0102eae:	e9 a9 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102eb3 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102eb3:	6a 00                	push   $0x0
c0102eb5:	6a 01                	push   $0x1
c0102eb7:	e9 a0 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ebc <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c0102ebc:	6a 00                	push   $0x0
c0102ebe:	6a 02                	push   $0x2
c0102ec0:	e9 97 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ec5 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102ec5:	6a 00                	push   $0x0
c0102ec7:	6a 03                	push   $0x3
c0102ec9:	e9 8e 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ece <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c0102ece:	6a 00                	push   $0x0
c0102ed0:	6a 04                	push   $0x4
c0102ed2:	e9 85 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ed7 <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102ed7:	6a 00                	push   $0x0
c0102ed9:	6a 05                	push   $0x5
c0102edb:	e9 7c 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ee0 <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0102ee0:	6a 00                	push   $0x0
c0102ee2:	6a 06                	push   $0x6
c0102ee4:	e9 73 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ee9 <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0102ee9:	6a 00                	push   $0x0
c0102eeb:	6a 07                	push   $0x7
c0102eed:	e9 6a 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ef2 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0102ef2:	6a 08                	push   $0x8
c0102ef4:	e9 63 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102ef9 <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c0102ef9:	6a 00                	push   $0x0
c0102efb:	6a 09                	push   $0x9
c0102efd:	e9 5a 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f02 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0102f02:	6a 0a                	push   $0xa
c0102f04:	e9 53 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f09 <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c0102f09:	6a 0b                	push   $0xb
c0102f0b:	e9 4c 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f10 <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0102f10:	6a 0c                	push   $0xc
c0102f12:	e9 45 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f17 <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c0102f17:	6a 0d                	push   $0xd
c0102f19:	e9 3e 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f1e <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c0102f1e:	6a 0e                	push   $0xe
c0102f20:	e9 37 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f25 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c0102f25:	6a 00                	push   $0x0
c0102f27:	68 80 00 00 00       	push   $0x80
c0102f2c:	e9 2b 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f31 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c0102f31:	6a 00                	push   $0x0
c0102f33:	68 e8 03 00 00       	push   $0x3e8
c0102f38:	e9 1f 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f3d <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c0102f3d:	6a 00                	push   $0x0
c0102f3f:	68 e9 03 00 00       	push   $0x3e9
c0102f44:	e9 13 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f49 <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c0102f49:	6a 00                	push   $0x0
c0102f4b:	68 f6 03 00 00       	push   $0x3f6
c0102f50:	e9 07 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f55 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c0102f55:	6a ff                	push   $0xffffffff
c0102f57:	e9 00 00 00 00       	jmp    c0102f5c <asm_do_irq>

c0102f5c <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c0102f5c:	fa                   	cli    
	pushl %ds
c0102f5d:	1e                   	push   %ds
  	pushl %es
c0102f5e:	06                   	push   %es
  	pushl %fs
c0102f5f:	0f a0                	push   %fs
  	pushl %gs
c0102f61:	0f a8                	push   %gs
	pushal
c0102f63:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0102f64:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c0102f68:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c0102f6a:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c0102f6c:	54                   	push   %esp
	call irq_handle
c0102f6d:	e8 55 d8 ff ff       	call   c01007c7 <irq_handle>
	movl pcbnow,%eax
c0102f72:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c0102f77:	8b 20                	mov    (%eax),%esp
	popal
c0102f79:	61                   	popa   
	popl %gs
c0102f7a:	0f a9                	pop    %gs
  	popl %fs
c0102f7c:	0f a1                	pop    %fs
  	popl %es
c0102f7e:	07                   	pop    %es
  	popl %ds
c0102f7f:	1f                   	pop    %ds
	addl $8, %esp
c0102f80:	83 c4 08             	add    $0x8,%esp
	sti
c0102f83:	fb                   	sti    
	iret
c0102f84:	cf                   	iret   
c0102f85:	66 90                	xchg   %ax,%ax
c0102f87:	90                   	nop
c0102f88:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c0102f8e:	00 00                	add    %al,(%eax)
c0102f90:	fe 4f 52             	decb   0x52(%edi)
c0102f93:	e4 66                	in     $0x66,%al

c0102f94 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102f94:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0102f9b:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0102f9d:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c0102fa2:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102fa5:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102fa8:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0102fad:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0102fb0:	b8 b7 2f 10 c0       	mov    $0xc0102fb7,%eax
	jmp	*%eax
c0102fb5:	ff e0                	jmp    *%eax

c0102fb7 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102fb7:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0102fbc:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c0102fc1:	e8 2a d2 ff ff       	call   c01001f0 <main>

c0102fc6 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102fc6:	eb fe                	jmp    c0102fc6 <spin>

c0102fc8 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102fc8:	55                   	push   %ebp
c0102fc9:	89 e5                	mov    %esp,%ebp
c0102fcb:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0102fce:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102fd2:	78 18                	js     c0102fec <draw_pixel+0x24>
c0102fd4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102fd8:	78 12                	js     c0102fec <draw_pixel+0x24>
c0102fda:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102fe1:	7f 09                	jg     c0102fec <draw_pixel+0x24>
c0102fe3:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102fea:	7e 24                	jle    c0103010 <draw_pixel+0x48>
c0102fec:	c7 44 24 0c 60 45 10 	movl   $0xc0104560,0xc(%esp)
c0102ff3:	c0 
c0102ff4:	c7 44 24 08 94 45 10 	movl   $0xc0104594,0x8(%esp)
c0102ffb:	c0 
c0102ffc:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
c0103003:	00 
c0103004:	c7 04 24 a9 45 10 c0 	movl   $0xc01045a9,(%esp)
c010300b:	e8 45 fd ff ff       	call   c0102d55 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0103010:	8b 45 08             	mov    0x8(%ebp),%eax
c0103013:	c1 e0 08             	shl    $0x8,%eax
c0103016:	89 c2                	mov    %eax,%edx
c0103018:	8b 45 08             	mov    0x8(%ebp),%eax
c010301b:	c1 e0 06             	shl    $0x6,%eax
c010301e:	01 c2                	add    %eax,%edx
c0103020:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103023:	01 c2                	add    %eax,%edx
c0103025:	8b 45 10             	mov    0x10(%ebp),%eax
c0103028:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c010302e:	c9                   	leave  
c010302f:	c3                   	ret    

c0103030 <sysclean>:


void sysclean(void)
{
c0103030:	55                   	push   %ebp
c0103031:	89 e5                	mov    %esp,%ebp
c0103033:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c0103036:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010303d:	00 
c010303e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0103045:	00 
c0103046:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c010304d:	e8 c0 02 00 00       	call   c0103312 <memset>
}
c0103052:	c9                   	leave  
c0103053:	c3                   	ret    

c0103054 <syspr>:
int syspr()
{
c0103054:	55                   	push   %ebp
c0103055:	89 e5                	mov    %esp,%ebp
c0103057:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c010305a:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0103061:	c0 
c0103062:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0103069:	e8 5a 01 00 00       	call   c01031c8 <syscall>
}
c010306e:	c9                   	leave  
c010306f:	c3                   	ret    

c0103070 <systime>:

int systime(void)
{
c0103070:	55                   	push   %ebp
c0103071:	89 e5                	mov    %esp,%ebp
c0103073:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c0103076:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c010307d:	e8 46 01 00 00       	call   c01031c8 <syscall>
}
c0103082:	c9                   	leave  
c0103083:	c3                   	ret    

c0103084 <sysreadkey>:

int sysreadkey(void)
{
c0103084:	55                   	push   %ebp
c0103085:	89 e5                	mov    %esp,%ebp
c0103087:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c010308a:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0103091:	e8 32 01 00 00       	call   c01031c8 <syscall>
}
c0103096:	c9                   	leave  
c0103097:	c3                   	ret    

c0103098 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0103098:	55                   	push   %ebp
c0103099:	89 e5                	mov    %esp,%ebp
c010309b:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c010309e:	8b 45 10             	mov    0x10(%ebp),%eax
c01030a1:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01030a5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030a8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01030af:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030b3:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c01030ba:	e8 09 01 00 00       	call   c01031c8 <syscall>
}
c01030bf:	c9                   	leave  
c01030c0:	c3                   	ret    

c01030c1 <fork>:

int fork(void)
{
c01030c1:	55                   	push   %ebp
c01030c2:	89 e5                	mov    %esp,%ebp
c01030c4:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c01030c7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c01030ce:	e8 f5 00 00 00       	call   c01031c8 <syscall>
}
c01030d3:	c9                   	leave  
c01030d4:	c3                   	ret    

c01030d5 <getpid>:

int getpid(void)
{
c01030d5:	55                   	push   %ebp
c01030d6:	89 e5                	mov    %esp,%ebp
c01030d8:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c01030db:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c01030e2:	e8 e1 00 00 00       	call   c01031c8 <syscall>
}
c01030e7:	c9                   	leave  
c01030e8:	c3                   	ret    

c01030e9 <exit>:

void exit(int suc)
{
c01030e9:	55                   	push   %ebp
c01030ea:	89 e5                	mov    %esp,%ebp
c01030ec:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
c01030ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01030f2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030f6:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c01030fd:	e8 c6 00 00 00       	call   c01031c8 <syscall>
}
c0103102:	c9                   	leave  
c0103103:	c3                   	ret    

c0103104 <sleep>:

void sleep(int sec)
{
c0103104:	55                   	push   %ebp
c0103105:	89 e5                	mov    %esp,%ebp
c0103107:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c010310a:	8b 45 08             	mov    0x8(%ebp),%eax
c010310d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103111:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0103118:	e8 ab 00 00 00       	call   c01031c8 <syscall>
	//printf("qweqwe");
}
c010311d:	c9                   	leave  
c010311e:	c3                   	ret    

c010311f <thread>:

int thread(void *addr)
{
c010311f:	55                   	push   %ebp
c0103120:	89 e5                	mov    %esp,%ebp
c0103122:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
c0103125:	8b 45 08             	mov    0x8(%ebp),%eax
c0103128:	89 44 24 04          	mov    %eax,0x4(%esp)
c010312c:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
c0103133:	e8 90 00 00 00       	call   c01031c8 <syscall>
}
c0103138:	c9                   	leave  
c0103139:	c3                   	ret    

c010313a <sem_init>:

int sem_init(Sema *sema,int value)
{
c010313a:	55                   	push   %ebp
c010313b:	89 e5                	mov    %esp,%ebp
c010313d:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema,value);
c0103140:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103143:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103147:	8b 45 08             	mov    0x8(%ebp),%eax
c010314a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010314e:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
c0103155:	e8 6e 00 00 00       	call   c01031c8 <syscall>
}
c010315a:	c9                   	leave  
c010315b:	c3                   	ret    

c010315c <sem_destroy>:

int sem_destroy(Sema *sema)
{
c010315c:	55                   	push   %ebp
c010315d:	89 e5                	mov    %esp,%ebp
c010315f:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
c0103162:	8b 45 08             	mov    0x8(%ebp),%eax
c0103165:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103169:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
c0103170:	e8 53 00 00 00       	call   c01031c8 <syscall>
}
c0103175:	c9                   	leave  
c0103176:	c3                   	ret    

c0103177 <sem_wait>:

int sem_wait(Sema *sema)
{
c0103177:	55                   	push   %ebp
c0103178:	89 e5                	mov    %esp,%ebp
c010317a:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
c010317d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103180:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103184:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
c010318b:	e8 38 00 00 00       	call   c01031c8 <syscall>
}
c0103190:	c9                   	leave  
c0103191:	c3                   	ret    

c0103192 <sem_trywait>:

int sem_trywait(Sema *sema)
{
c0103192:	55                   	push   %ebp
c0103193:	89 e5                	mov    %esp,%ebp
c0103195:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
c0103198:	8b 45 08             	mov    0x8(%ebp),%eax
c010319b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010319f:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
c01031a6:	e8 1d 00 00 00       	call   c01031c8 <syscall>
}
c01031ab:	c9                   	leave  
c01031ac:	c3                   	ret    

c01031ad <sem_post>:

int sem_post(Sema *sema)
{
c01031ad:	55                   	push   %ebp
c01031ae:	89 e5                	mov    %esp,%ebp
c01031b0:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
c01031b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01031b6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031ba:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
c01031c1:	e8 02 00 00 00       	call   c01031c8 <syscall>
}
c01031c6:	c9                   	leave  
c01031c7:	c3                   	ret    

c01031c8 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c01031c8:	55                   	push   %ebp
c01031c9:	89 e5                	mov    %esp,%ebp
c01031cb:	53                   	push   %ebx
c01031cc:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c01031cf:	8d 45 08             	lea    0x8(%ebp),%eax
c01031d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c01031d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01031d8:	8b 00                	mov    (%eax),%eax
c01031da:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01031dd:	83 c2 04             	add    $0x4,%edx
c01031e0:	8b 1a                	mov    (%edx),%ebx
c01031e2:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01031e5:	83 c2 08             	add    $0x8,%edx
c01031e8:	8b 0a                	mov    (%edx),%ecx
c01031ea:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01031ed:	83 c2 0c             	add    $0xc,%edx
c01031f0:	8b 12                	mov    (%edx),%edx
c01031f2:	cd 80                	int    $0x80
c01031f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c01031f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01031fa:	83 c4 10             	add    $0x10,%esp
c01031fd:	5b                   	pop    %ebx
c01031fe:	5d                   	pop    %ebp
c01031ff:	c3                   	ret    

c0103200 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0103200:	55                   	push   %ebp
c0103201:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0103203:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103206:	8b 00                	mov    (%eax),%eax
c0103208:	8d 48 01             	lea    0x1(%eax),%ecx
c010320b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010320e:	89 0a                	mov    %ecx,(%edx)
c0103210:	8b 55 08             	mov    0x8(%ebp),%edx
c0103213:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c0103219:	5d                   	pop    %ebp
c010321a:	c3                   	ret    

c010321b <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c010321b:	55                   	push   %ebp
c010321c:	89 e5                	mov    %esp,%ebp
c010321e:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0103221:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0103228:	8b 45 0c             	mov    0xc(%ebp),%eax
c010322b:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010322f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103232:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103236:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0103239:	89 44 24 04          	mov    %eax,0x4(%esp)
c010323d:	c7 04 24 00 32 10 c0 	movl   $0xc0103200,(%esp)
c0103244:	e8 d1 06 00 00       	call   c010391a <vprintfmt>
	return cnt;
c0103249:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c010324c:	c9                   	leave  
c010324d:	c3                   	ret    

c010324e <printf>:
int printf(const char *fmt, ...)
{
c010324e:	55                   	push   %ebp
c010324f:	89 e5                	mov    %esp,%ebp
c0103251:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0103254:	8d 45 0c             	lea    0xc(%ebp),%eax
c0103257:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c010325a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010325d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103261:	8b 45 08             	mov    0x8(%ebp),%eax
c0103264:	89 04 24             	mov    %eax,(%esp)
c0103267:	e8 af ff ff ff       	call   c010321b <vprintf>
c010326c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c010326f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103272:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103276:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c010327d:	c0 
c010327e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0103285:	e8 0e fe ff ff       	call   c0103098 <syswrite>
	return cnt;
c010328a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010328d:	c9                   	leave  
c010328e:	c3                   	ret    

c010328f <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c010328f:	55                   	push   %ebp
c0103290:	89 e5                	mov    %esp,%ebp
c0103292:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0103295:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c010329c:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c01032a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01032a3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01032a8:	89 c8                	mov    %ecx,%eax
c01032aa:	f7 ea                	imul   %edx
c01032ac:	c1 fa 02             	sar    $0x2,%edx
c01032af:	89 c8                	mov    %ecx,%eax
c01032b1:	c1 f8 1f             	sar    $0x1f,%eax
c01032b4:	29 c2                	sub    %eax,%edx
c01032b6:	89 d0                	mov    %edx,%eax
c01032b8:	c1 e0 02             	shl    $0x2,%eax
c01032bb:	01 d0                	add    %edx,%eax
c01032bd:	01 c0                	add    %eax,%eax
c01032bf:	29 c1                	sub    %eax,%ecx
c01032c1:	89 ca                	mov    %ecx,%edx
c01032c3:	89 d0                	mov    %edx,%eax
c01032c5:	83 c0 30             	add    $0x30,%eax
c01032c8:	89 c2                	mov    %eax,%edx
c01032ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01032cd:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c01032cf:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01032d2:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01032d7:	89 c8                	mov    %ecx,%eax
c01032d9:	f7 ea                	imul   %edx
c01032db:	c1 fa 02             	sar    $0x2,%edx
c01032de:	89 c8                	mov    %ecx,%eax
c01032e0:	c1 f8 1f             	sar    $0x1f,%eax
c01032e3:	29 c2                	sub    %eax,%edx
c01032e5:	89 d0                	mov    %edx,%eax
c01032e7:	89 45 08             	mov    %eax,0x8(%ebp)
c01032ea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01032ee:	75 ac                	jne    c010329c <itoa+0xd>
	return p;
c01032f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01032f3:	c9                   	leave  
c01032f4:	c3                   	ret    

c01032f5 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c01032f5:	55                   	push   %ebp
c01032f6:	89 e5                	mov    %esp,%ebp
c01032f8:	57                   	push   %edi
c01032f9:	56                   	push   %esi
c01032fa:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c01032fb:	8b 45 10             	mov    0x10(%ebp),%eax
c01032fe:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103301:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0103304:	89 c1                	mov    %eax,%ecx
c0103306:	89 d6                	mov    %edx,%esi
c0103308:	89 df                	mov    %ebx,%edi
c010330a:	fc                   	cld    
c010330b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c010330d:	5b                   	pop    %ebx
c010330e:	5e                   	pop    %esi
c010330f:	5f                   	pop    %edi
c0103310:	5d                   	pop    %ebp
c0103311:	c3                   	ret    

c0103312 <memset>:

void memset(void *dest, int data, size_t size) {
c0103312:	55                   	push   %ebp
c0103313:	89 e5                	mov    %esp,%ebp
c0103315:	57                   	push   %edi
c0103316:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0103317:	8b 55 10             	mov    0x10(%ebp),%edx
c010331a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010331d:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0103320:	89 d1                	mov    %edx,%ecx
c0103322:	89 df                	mov    %ebx,%edi
c0103324:	fc                   	cld    
c0103325:	f3 aa                	rep stos %al,%es:(%edi)
}
c0103327:	5b                   	pop    %ebx
c0103328:	5f                   	pop    %edi
c0103329:	5d                   	pop    %ebp
c010332a:	c3                   	ret    

c010332b <strlen>:

size_t strlen(const char *str) {
c010332b:	55                   	push   %ebp
c010332c:	89 e5                	mov    %esp,%ebp
c010332e:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0103331:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0103338:	eb 04                	jmp    c010333e <strlen+0x13>
c010333a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010333e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103341:	8d 50 01             	lea    0x1(%eax),%edx
c0103344:	89 55 08             	mov    %edx,0x8(%ebp)
c0103347:	0f b6 00             	movzbl (%eax),%eax
c010334a:	84 c0                	test   %al,%al
c010334c:	75 ec                	jne    c010333a <strlen+0xf>
	return len;
c010334e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0103351:	c9                   	leave  
c0103352:	c3                   	ret    

c0103353 <strcpy>:

void strcpy(char *d, const char *s) {
c0103353:	55                   	push   %ebp
c0103354:	89 e5                	mov    %esp,%ebp
c0103356:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c0103359:	8b 45 0c             	mov    0xc(%ebp),%eax
c010335c:	89 04 24             	mov    %eax,(%esp)
c010335f:	e8 c7 ff ff ff       	call   c010332b <strlen>
c0103364:	83 c0 01             	add    $0x1,%eax
c0103367:	89 44 24 08          	mov    %eax,0x8(%esp)
c010336b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010336e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103372:	8b 45 08             	mov    0x8(%ebp),%eax
c0103375:	89 04 24             	mov    %eax,(%esp)
c0103378:	e8 78 ff ff ff       	call   c01032f5 <memcpy>
}
c010337d:	c9                   	leave  
c010337e:	c3                   	ret    

c010337f <strnlen>:

int
strnlen(const char *s, size_t size)
{
c010337f:	55                   	push   %ebp
c0103380:	89 e5                	mov    %esp,%ebp
c0103382:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0103385:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010338c:	eb 0c                	jmp    c010339a <strnlen+0x1b>
		n++;
c010338e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0103392:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103396:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c010339a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010339e:	74 0a                	je     c01033aa <strnlen+0x2b>
c01033a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01033a3:	0f b6 00             	movzbl (%eax),%eax
c01033a6:	84 c0                	test   %al,%al
c01033a8:	75 e4                	jne    c010338e <strnlen+0xf>
		n++;
	return n;
c01033aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01033ad:	c9                   	leave  
c01033ae:	c3                   	ret    

c01033af <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c01033af:	55                   	push   %ebp
c01033b0:	89 e5                	mov    %esp,%ebp
c01033b2:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c01033b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01033b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c01033bb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01033c2:	eb 23                	jmp    c01033e7 <strncpy+0x38>
		*dst++ = *src;
c01033c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01033c7:	8d 50 01             	lea    0x1(%eax),%edx
c01033ca:	89 55 08             	mov    %edx,0x8(%ebp)
c01033cd:	8b 55 0c             	mov    0xc(%ebp),%edx
c01033d0:	0f b6 12             	movzbl (%edx),%edx
c01033d3:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c01033d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033d8:	0f b6 00             	movzbl (%eax),%eax
c01033db:	84 c0                	test   %al,%al
c01033dd:	74 04                	je     c01033e3 <strncpy+0x34>
			src++;
c01033df:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c01033e3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01033e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01033ea:	3b 45 10             	cmp    0x10(%ebp),%eax
c01033ed:	72 d5                	jb     c01033c4 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c01033ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c01033f2:	c9                   	leave  
c01033f3:	c3                   	ret    

c01033f4 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c01033f4:	55                   	push   %ebp
c01033f5:	89 e5                	mov    %esp,%ebp
c01033f7:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c01033fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01033fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0103400:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103404:	74 33                	je     c0103439 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c0103406:	eb 17                	jmp    c010341f <strlcpy+0x2b>
			*dst++ = *src++;
c0103408:	8b 45 08             	mov    0x8(%ebp),%eax
c010340b:	8d 50 01             	lea    0x1(%eax),%edx
c010340e:	89 55 08             	mov    %edx,0x8(%ebp)
c0103411:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103414:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103417:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c010341a:	0f b6 12             	movzbl (%edx),%edx
c010341d:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c010341f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103423:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103427:	74 0a                	je     c0103433 <strlcpy+0x3f>
c0103429:	8b 45 0c             	mov    0xc(%ebp),%eax
c010342c:	0f b6 00             	movzbl (%eax),%eax
c010342f:	84 c0                	test   %al,%al
c0103431:	75 d5                	jne    c0103408 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0103433:	8b 45 08             	mov    0x8(%ebp),%eax
c0103436:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c0103439:	8b 55 08             	mov    0x8(%ebp),%edx
c010343c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010343f:	29 c2                	sub    %eax,%edx
c0103441:	89 d0                	mov    %edx,%eax
}
c0103443:	c9                   	leave  
c0103444:	c3                   	ret    

c0103445 <strcmp>:

int
strcmp(const char *p, const char *q)
{
c0103445:	55                   	push   %ebp
c0103446:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c0103448:	eb 08                	jmp    c0103452 <strcmp+0xd>
		p++, q++;
c010344a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010344e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0103452:	8b 45 08             	mov    0x8(%ebp),%eax
c0103455:	0f b6 00             	movzbl (%eax),%eax
c0103458:	84 c0                	test   %al,%al
c010345a:	74 10                	je     c010346c <strcmp+0x27>
c010345c:	8b 45 08             	mov    0x8(%ebp),%eax
c010345f:	0f b6 10             	movzbl (%eax),%edx
c0103462:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103465:	0f b6 00             	movzbl (%eax),%eax
c0103468:	38 c2                	cmp    %al,%dl
c010346a:	74 de                	je     c010344a <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c010346c:	8b 45 08             	mov    0x8(%ebp),%eax
c010346f:	0f b6 00             	movzbl (%eax),%eax
c0103472:	0f b6 d0             	movzbl %al,%edx
c0103475:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103478:	0f b6 00             	movzbl (%eax),%eax
c010347b:	0f b6 c0             	movzbl %al,%eax
c010347e:	29 c2                	sub    %eax,%edx
c0103480:	89 d0                	mov    %edx,%eax
}
c0103482:	5d                   	pop    %ebp
c0103483:	c3                   	ret    

c0103484 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0103484:	55                   	push   %ebp
c0103485:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c0103487:	eb 0c                	jmp    c0103495 <strncmp+0x11>
		n--, p++, q++;
c0103489:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c010348d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103491:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c0103495:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103499:	74 1a                	je     c01034b5 <strncmp+0x31>
c010349b:	8b 45 08             	mov    0x8(%ebp),%eax
c010349e:	0f b6 00             	movzbl (%eax),%eax
c01034a1:	84 c0                	test   %al,%al
c01034a3:	74 10                	je     c01034b5 <strncmp+0x31>
c01034a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01034a8:	0f b6 10             	movzbl (%eax),%edx
c01034ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034ae:	0f b6 00             	movzbl (%eax),%eax
c01034b1:	38 c2                	cmp    %al,%dl
c01034b3:	74 d4                	je     c0103489 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c01034b5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01034b9:	75 07                	jne    c01034c2 <strncmp+0x3e>
		return 0;
c01034bb:	b8 00 00 00 00       	mov    $0x0,%eax
c01034c0:	eb 16                	jmp    c01034d8 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c01034c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c5:	0f b6 00             	movzbl (%eax),%eax
c01034c8:	0f b6 d0             	movzbl %al,%edx
c01034cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034ce:	0f b6 00             	movzbl (%eax),%eax
c01034d1:	0f b6 c0             	movzbl %al,%eax
c01034d4:	29 c2                	sub    %eax,%edx
c01034d6:	89 d0                	mov    %edx,%eax
}
c01034d8:	5d                   	pop    %ebp
c01034d9:	c3                   	ret    

c01034da <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c01034da:	55                   	push   %ebp
c01034db:	89 e5                	mov    %esp,%ebp
c01034dd:	83 ec 04             	sub    $0x4,%esp
c01034e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034e3:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c01034e6:	eb 14                	jmp    c01034fc <strchr+0x22>
		if (*s == c)
c01034e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01034eb:	0f b6 00             	movzbl (%eax),%eax
c01034ee:	3a 45 fc             	cmp    -0x4(%ebp),%al
c01034f1:	75 05                	jne    c01034f8 <strchr+0x1e>
			return (char *) s;
c01034f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01034f6:	eb 13                	jmp    c010350b <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c01034f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01034fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01034ff:	0f b6 00             	movzbl (%eax),%eax
c0103502:	84 c0                	test   %al,%al
c0103504:	75 e2                	jne    c01034e8 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c0103506:	b8 00 00 00 00       	mov    $0x0,%eax
}
c010350b:	c9                   	leave  
c010350c:	c3                   	ret    

c010350d <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c010350d:	55                   	push   %ebp
c010350e:	89 e5                	mov    %esp,%ebp
c0103510:	83 ec 04             	sub    $0x4,%esp
c0103513:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103516:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0103519:	eb 11                	jmp    c010352c <strfind+0x1f>
		if (*s == c)
c010351b:	8b 45 08             	mov    0x8(%ebp),%eax
c010351e:	0f b6 00             	movzbl (%eax),%eax
c0103521:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0103524:	75 02                	jne    c0103528 <strfind+0x1b>
			break;
c0103526:	eb 0e                	jmp    c0103536 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0103528:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010352c:	8b 45 08             	mov    0x8(%ebp),%eax
c010352f:	0f b6 00             	movzbl (%eax),%eax
c0103532:	84 c0                	test   %al,%al
c0103534:	75 e5                	jne    c010351b <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c0103536:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0103539:	c9                   	leave  
c010353a:	c3                   	ret    

c010353b <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c010353b:	55                   	push   %ebp
c010353c:	89 e5                	mov    %esp,%ebp
c010353e:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0103541:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103544:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c0103547:	8b 45 08             	mov    0x8(%ebp),%eax
c010354a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c010354d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103550:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0103553:	73 3d                	jae    c0103592 <memmove+0x57>
c0103555:	8b 45 10             	mov    0x10(%ebp),%eax
c0103558:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010355b:	01 d0                	add    %edx,%eax
c010355d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0103560:	76 30                	jbe    c0103592 <memmove+0x57>
		s += n;
c0103562:	8b 45 10             	mov    0x10(%ebp),%eax
c0103565:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c0103568:	8b 45 10             	mov    0x10(%ebp),%eax
c010356b:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c010356e:	eb 13                	jmp    c0103583 <memmove+0x48>
			*--d = *--s;
c0103570:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0103574:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0103578:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010357b:	0f b6 10             	movzbl (%eax),%edx
c010357e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103581:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0103583:	8b 45 10             	mov    0x10(%ebp),%eax
c0103586:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103589:	89 55 10             	mov    %edx,0x10(%ebp)
c010358c:	85 c0                	test   %eax,%eax
c010358e:	75 e0                	jne    c0103570 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0103590:	eb 26                	jmp    c01035b8 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0103592:	eb 17                	jmp    c01035ab <memmove+0x70>
			*d++ = *s++;
c0103594:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103597:	8d 50 01             	lea    0x1(%eax),%edx
c010359a:	89 55 f8             	mov    %edx,-0x8(%ebp)
c010359d:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01035a0:	8d 4a 01             	lea    0x1(%edx),%ecx
c01035a3:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c01035a6:	0f b6 12             	movzbl (%edx),%edx
c01035a9:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c01035ab:	8b 45 10             	mov    0x10(%ebp),%eax
c01035ae:	8d 50 ff             	lea    -0x1(%eax),%edx
c01035b1:	89 55 10             	mov    %edx,0x10(%ebp)
c01035b4:	85 c0                	test   %eax,%eax
c01035b6:	75 dc                	jne    c0103594 <memmove+0x59>
			*d++ = *s++;

	return dst;
c01035b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
c01035bb:	c9                   	leave  
c01035bc:	c3                   	ret    

c01035bd <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c01035bd:	55                   	push   %ebp
c01035be:	89 e5                	mov    %esp,%ebp
c01035c0:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c01035c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01035c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c01035c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035cc:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c01035cf:	eb 30                	jmp    c0103601 <memcmp+0x44>
		if (*s1 != *s2)
c01035d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01035d4:	0f b6 10             	movzbl (%eax),%edx
c01035d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01035da:	0f b6 00             	movzbl (%eax),%eax
c01035dd:	38 c2                	cmp    %al,%dl
c01035df:	74 18                	je     c01035f9 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c01035e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01035e4:	0f b6 00             	movzbl (%eax),%eax
c01035e7:	0f b6 d0             	movzbl %al,%edx
c01035ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01035ed:	0f b6 00             	movzbl (%eax),%eax
c01035f0:	0f b6 c0             	movzbl %al,%eax
c01035f3:	29 c2                	sub    %eax,%edx
c01035f5:	89 d0                	mov    %edx,%eax
c01035f7:	eb 1a                	jmp    c0103613 <memcmp+0x56>
		s1++, s2++;
c01035f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01035fd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c0103601:	8b 45 10             	mov    0x10(%ebp),%eax
c0103604:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103607:	89 55 10             	mov    %edx,0x10(%ebp)
c010360a:	85 c0                	test   %eax,%eax
c010360c:	75 c3                	jne    c01035d1 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c010360e:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0103613:	c9                   	leave  
c0103614:	c3                   	ret    

c0103615 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c0103615:	55                   	push   %ebp
c0103616:	89 e5                	mov    %esp,%ebp
c0103618:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c010361b:	8b 45 10             	mov    0x10(%ebp),%eax
c010361e:	8b 55 08             	mov    0x8(%ebp),%edx
c0103621:	01 d0                	add    %edx,%eax
c0103623:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c0103626:	eb 13                	jmp    c010363b <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c0103628:	8b 45 08             	mov    0x8(%ebp),%eax
c010362b:	0f b6 10             	movzbl (%eax),%edx
c010362e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103631:	38 c2                	cmp    %al,%dl
c0103633:	75 02                	jne    c0103637 <memfind+0x22>
			break;
c0103635:	eb 0c                	jmp    c0103643 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c0103637:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010363b:	8b 45 08             	mov    0x8(%ebp),%eax
c010363e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0103641:	72 e5                	jb     c0103628 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0103643:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0103646:	c9                   	leave  
c0103647:	c3                   	ret    

c0103648 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c0103648:	55                   	push   %ebp
c0103649:	89 e5                	mov    %esp,%ebp
c010364b:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c010364e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c0103655:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c010365c:	eb 04                	jmp    c0103662 <strtol+0x1a>
		s++;
c010365e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0103662:	8b 45 08             	mov    0x8(%ebp),%eax
c0103665:	0f b6 00             	movzbl (%eax),%eax
c0103668:	3c 20                	cmp    $0x20,%al
c010366a:	74 f2                	je     c010365e <strtol+0x16>
c010366c:	8b 45 08             	mov    0x8(%ebp),%eax
c010366f:	0f b6 00             	movzbl (%eax),%eax
c0103672:	3c 09                	cmp    $0x9,%al
c0103674:	74 e8                	je     c010365e <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c0103676:	8b 45 08             	mov    0x8(%ebp),%eax
c0103679:	0f b6 00             	movzbl (%eax),%eax
c010367c:	3c 2b                	cmp    $0x2b,%al
c010367e:	75 06                	jne    c0103686 <strtol+0x3e>
		s++;
c0103680:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103684:	eb 15                	jmp    c010369b <strtol+0x53>
	else if (*s == '-')
c0103686:	8b 45 08             	mov    0x8(%ebp),%eax
c0103689:	0f b6 00             	movzbl (%eax),%eax
c010368c:	3c 2d                	cmp    $0x2d,%al
c010368e:	75 0b                	jne    c010369b <strtol+0x53>
		s++, neg = 1;
c0103690:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103694:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c010369b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010369f:	74 06                	je     c01036a7 <strtol+0x5f>
c01036a1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c01036a5:	75 24                	jne    c01036cb <strtol+0x83>
c01036a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01036aa:	0f b6 00             	movzbl (%eax),%eax
c01036ad:	3c 30                	cmp    $0x30,%al
c01036af:	75 1a                	jne    c01036cb <strtol+0x83>
c01036b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01036b4:	83 c0 01             	add    $0x1,%eax
c01036b7:	0f b6 00             	movzbl (%eax),%eax
c01036ba:	3c 78                	cmp    $0x78,%al
c01036bc:	75 0d                	jne    c01036cb <strtol+0x83>
		s += 2, base = 16;
c01036be:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c01036c2:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c01036c9:	eb 2a                	jmp    c01036f5 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c01036cb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01036cf:	75 17                	jne    c01036e8 <strtol+0xa0>
c01036d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01036d4:	0f b6 00             	movzbl (%eax),%eax
c01036d7:	3c 30                	cmp    $0x30,%al
c01036d9:	75 0d                	jne    c01036e8 <strtol+0xa0>
		s++, base = 8;
c01036db:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01036df:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c01036e6:	eb 0d                	jmp    c01036f5 <strtol+0xad>
	else if (base == 0)
c01036e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01036ec:	75 07                	jne    c01036f5 <strtol+0xad>
		base = 10;
c01036ee:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c01036f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01036f8:	0f b6 00             	movzbl (%eax),%eax
c01036fb:	3c 2f                	cmp    $0x2f,%al
c01036fd:	7e 1b                	jle    c010371a <strtol+0xd2>
c01036ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0103702:	0f b6 00             	movzbl (%eax),%eax
c0103705:	3c 39                	cmp    $0x39,%al
c0103707:	7f 11                	jg     c010371a <strtol+0xd2>
			dig = *s - '0';
c0103709:	8b 45 08             	mov    0x8(%ebp),%eax
c010370c:	0f b6 00             	movzbl (%eax),%eax
c010370f:	0f be c0             	movsbl %al,%eax
c0103712:	83 e8 30             	sub    $0x30,%eax
c0103715:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103718:	eb 48                	jmp    c0103762 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c010371a:	8b 45 08             	mov    0x8(%ebp),%eax
c010371d:	0f b6 00             	movzbl (%eax),%eax
c0103720:	3c 60                	cmp    $0x60,%al
c0103722:	7e 1b                	jle    c010373f <strtol+0xf7>
c0103724:	8b 45 08             	mov    0x8(%ebp),%eax
c0103727:	0f b6 00             	movzbl (%eax),%eax
c010372a:	3c 7a                	cmp    $0x7a,%al
c010372c:	7f 11                	jg     c010373f <strtol+0xf7>
			dig = *s - 'a' + 10;
c010372e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103731:	0f b6 00             	movzbl (%eax),%eax
c0103734:	0f be c0             	movsbl %al,%eax
c0103737:	83 e8 57             	sub    $0x57,%eax
c010373a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010373d:	eb 23                	jmp    c0103762 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c010373f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103742:	0f b6 00             	movzbl (%eax),%eax
c0103745:	3c 40                	cmp    $0x40,%al
c0103747:	7e 3d                	jle    c0103786 <strtol+0x13e>
c0103749:	8b 45 08             	mov    0x8(%ebp),%eax
c010374c:	0f b6 00             	movzbl (%eax),%eax
c010374f:	3c 5a                	cmp    $0x5a,%al
c0103751:	7f 33                	jg     c0103786 <strtol+0x13e>
			dig = *s - 'A' + 10;
c0103753:	8b 45 08             	mov    0x8(%ebp),%eax
c0103756:	0f b6 00             	movzbl (%eax),%eax
c0103759:	0f be c0             	movsbl %al,%eax
c010375c:	83 e8 37             	sub    $0x37,%eax
c010375f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c0103762:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103765:	3b 45 10             	cmp    0x10(%ebp),%eax
c0103768:	7c 02                	jl     c010376c <strtol+0x124>
			break;
c010376a:	eb 1a                	jmp    c0103786 <strtol+0x13e>
		s++, val = (val * base) + dig;
c010376c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103770:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103773:	0f af 45 10          	imul   0x10(%ebp),%eax
c0103777:	89 c2                	mov    %eax,%edx
c0103779:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010377c:	01 d0                	add    %edx,%eax
c010377e:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c0103781:	e9 6f ff ff ff       	jmp    c01036f5 <strtol+0xad>

	if (endptr)
c0103786:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010378a:	74 08                	je     c0103794 <strtol+0x14c>
		*endptr = (char *) s;
c010378c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010378f:	8b 55 08             	mov    0x8(%ebp),%edx
c0103792:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c0103794:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0103798:	74 07                	je     c01037a1 <strtol+0x159>
c010379a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010379d:	f7 d8                	neg    %eax
c010379f:	eb 03                	jmp    c01037a4 <strtol+0x15c>
c01037a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c01037a4:	c9                   	leave  
c01037a5:	c3                   	ret    

c01037a6 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c01037a6:	55                   	push   %ebp
c01037a7:	89 e5                	mov    %esp,%ebp
c01037a9:	53                   	push   %ebx
c01037aa:	83 ec 34             	sub    $0x34,%esp
c01037ad:	8b 45 10             	mov    0x10(%ebp),%eax
c01037b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01037b3:	8b 45 14             	mov    0x14(%ebp),%eax
c01037b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c01037b9:	8b 45 18             	mov    0x18(%ebp),%eax
c01037bc:	ba 00 00 00 00       	mov    $0x0,%edx
c01037c1:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01037c4:	77 72                	ja     c0103838 <printnum+0x92>
c01037c6:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01037c9:	72 05                	jb     c01037d0 <printnum+0x2a>
c01037cb:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01037ce:	77 68                	ja     c0103838 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c01037d0:	8b 45 1c             	mov    0x1c(%ebp),%eax
c01037d3:	8d 58 ff             	lea    -0x1(%eax),%ebx
c01037d6:	8b 45 18             	mov    0x18(%ebp),%eax
c01037d9:	ba 00 00 00 00       	mov    $0x0,%edx
c01037de:	89 44 24 08          	mov    %eax,0x8(%esp)
c01037e2:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01037e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01037ec:	89 04 24             	mov    %eax,(%esp)
c01037ef:	89 54 24 04          	mov    %edx,0x4(%esp)
c01037f3:	e8 58 06 00 00       	call   c0103e50 <__udivdi3>
c01037f8:	8b 4d 20             	mov    0x20(%ebp),%ecx
c01037fb:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c01037ff:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c0103803:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103806:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c010380a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010380e:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103812:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103815:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103819:	8b 45 08             	mov    0x8(%ebp),%eax
c010381c:	89 04 24             	mov    %eax,(%esp)
c010381f:	e8 82 ff ff ff       	call   c01037a6 <printnum>
c0103824:	eb 1c                	jmp    c0103842 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c0103826:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103829:	89 44 24 04          	mov    %eax,0x4(%esp)
c010382d:	8b 45 20             	mov    0x20(%ebp),%eax
c0103830:	89 04 24             	mov    %eax,(%esp)
c0103833:	8b 45 08             	mov    0x8(%ebp),%eax
c0103836:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c0103838:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c010383c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0103840:	7f e4                	jg     c0103826 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c0103842:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103845:	bb 00 00 00 00       	mov    $0x0,%ebx
c010384a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010384d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103850:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103854:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0103858:	89 04 24             	mov    %eax,(%esp)
c010385b:	89 54 24 04          	mov    %edx,0x4(%esp)
c010385f:	e8 1c 07 00 00       	call   c0103f80 <__umoddi3>
c0103864:	05 44 46 10 c0       	add    $0xc0104644,%eax
c0103869:	0f b6 00             	movzbl (%eax),%eax
c010386c:	0f be c0             	movsbl %al,%eax
c010386f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103872:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103876:	89 04 24             	mov    %eax,(%esp)
c0103879:	8b 45 08             	mov    0x8(%ebp),%eax
c010387c:	ff d0                	call   *%eax
}
c010387e:	83 c4 34             	add    $0x34,%esp
c0103881:	5b                   	pop    %ebx
c0103882:	5d                   	pop    %ebp
c0103883:	c3                   	ret    

c0103884 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c0103884:	55                   	push   %ebp
c0103885:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c0103887:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010388b:	7e 14                	jle    c01038a1 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c010388d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103890:	8b 00                	mov    (%eax),%eax
c0103892:	8d 48 08             	lea    0x8(%eax),%ecx
c0103895:	8b 55 08             	mov    0x8(%ebp),%edx
c0103898:	89 0a                	mov    %ecx,(%edx)
c010389a:	8b 50 04             	mov    0x4(%eax),%edx
c010389d:	8b 00                	mov    (%eax),%eax
c010389f:	eb 30                	jmp    c01038d1 <getuint+0x4d>
	else if (lflag)
c01038a1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01038a5:	74 16                	je     c01038bd <getuint+0x39>
		return va_arg(*ap, unsigned long);
c01038a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038aa:	8b 00                	mov    (%eax),%eax
c01038ac:	8d 48 04             	lea    0x4(%eax),%ecx
c01038af:	8b 55 08             	mov    0x8(%ebp),%edx
c01038b2:	89 0a                	mov    %ecx,(%edx)
c01038b4:	8b 00                	mov    (%eax),%eax
c01038b6:	ba 00 00 00 00       	mov    $0x0,%edx
c01038bb:	eb 14                	jmp    c01038d1 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c01038bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01038c0:	8b 00                	mov    (%eax),%eax
c01038c2:	8d 48 04             	lea    0x4(%eax),%ecx
c01038c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01038c8:	89 0a                	mov    %ecx,(%edx)
c01038ca:	8b 00                	mov    (%eax),%eax
c01038cc:	ba 00 00 00 00       	mov    $0x0,%edx
}
c01038d1:	5d                   	pop    %ebp
c01038d2:	c3                   	ret    

c01038d3 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c01038d3:	55                   	push   %ebp
c01038d4:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c01038d6:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01038da:	7e 14                	jle    c01038f0 <getint+0x1d>
		return va_arg(*ap, long long);
c01038dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01038df:	8b 00                	mov    (%eax),%eax
c01038e1:	8d 48 08             	lea    0x8(%eax),%ecx
c01038e4:	8b 55 08             	mov    0x8(%ebp),%edx
c01038e7:	89 0a                	mov    %ecx,(%edx)
c01038e9:	8b 50 04             	mov    0x4(%eax),%edx
c01038ec:	8b 00                	mov    (%eax),%eax
c01038ee:	eb 28                	jmp    c0103918 <getint+0x45>
	else if (lflag)
c01038f0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01038f4:	74 12                	je     c0103908 <getint+0x35>
		return va_arg(*ap, long);
c01038f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01038f9:	8b 00                	mov    (%eax),%eax
c01038fb:	8d 48 04             	lea    0x4(%eax),%ecx
c01038fe:	8b 55 08             	mov    0x8(%ebp),%edx
c0103901:	89 0a                	mov    %ecx,(%edx)
c0103903:	8b 00                	mov    (%eax),%eax
c0103905:	99                   	cltd   
c0103906:	eb 10                	jmp    c0103918 <getint+0x45>
	else
		return va_arg(*ap, int);
c0103908:	8b 45 08             	mov    0x8(%ebp),%eax
c010390b:	8b 00                	mov    (%eax),%eax
c010390d:	8d 48 04             	lea    0x4(%eax),%ecx
c0103910:	8b 55 08             	mov    0x8(%ebp),%edx
c0103913:	89 0a                	mov    %ecx,(%edx)
c0103915:	8b 00                	mov    (%eax),%eax
c0103917:	99                   	cltd   
}
c0103918:	5d                   	pop    %ebp
c0103919:	c3                   	ret    

c010391a <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c010391a:	55                   	push   %ebp
c010391b:	89 e5                	mov    %esp,%ebp
c010391d:	56                   	push   %esi
c010391e:	53                   	push   %ebx
c010391f:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103922:	eb 18                	jmp    c010393c <vprintfmt+0x22>
			if (ch == '\0')
c0103924:	85 db                	test   %ebx,%ebx
c0103926:	75 05                	jne    c010392d <vprintfmt+0x13>
				return;
c0103928:	e9 e9 03 00 00       	jmp    c0103d16 <vprintfmt+0x3fc>
			putch(ch, putdat);
c010392d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103930:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103934:	89 1c 24             	mov    %ebx,(%esp)
c0103937:	8b 45 08             	mov    0x8(%ebp),%eax
c010393a:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c010393c:	8b 45 10             	mov    0x10(%ebp),%eax
c010393f:	8d 50 01             	lea    0x1(%eax),%edx
c0103942:	89 55 10             	mov    %edx,0x10(%ebp)
c0103945:	0f b6 00             	movzbl (%eax),%eax
c0103948:	0f b6 d8             	movzbl %al,%ebx
c010394b:	83 fb 25             	cmp    $0x25,%ebx
c010394e:	75 d4                	jne    c0103924 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c0103950:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c0103954:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c010395b:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c0103962:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c0103969:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c0103970:	8b 45 10             	mov    0x10(%ebp),%eax
c0103973:	8d 50 01             	lea    0x1(%eax),%edx
c0103976:	89 55 10             	mov    %edx,0x10(%ebp)
c0103979:	0f b6 00             	movzbl (%eax),%eax
c010397c:	0f b6 d8             	movzbl %al,%ebx
c010397f:	8d 43 dd             	lea    -0x23(%ebx),%eax
c0103982:	83 f8 55             	cmp    $0x55,%eax
c0103985:	0f 87 5a 03 00 00    	ja     c0103ce5 <vprintfmt+0x3cb>
c010398b:	8b 04 85 68 46 10 c0 	mov    -0x3fefb998(,%eax,4),%eax
c0103992:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c0103994:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c0103998:	eb d6                	jmp    c0103970 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c010399a:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c010399e:	eb d0                	jmp    c0103970 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01039a0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c01039a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01039aa:	89 d0                	mov    %edx,%eax
c01039ac:	c1 e0 02             	shl    $0x2,%eax
c01039af:	01 d0                	add    %edx,%eax
c01039b1:	01 c0                	add    %eax,%eax
c01039b3:	01 d8                	add    %ebx,%eax
c01039b5:	83 e8 30             	sub    $0x30,%eax
c01039b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c01039bb:	8b 45 10             	mov    0x10(%ebp),%eax
c01039be:	0f b6 00             	movzbl (%eax),%eax
c01039c1:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c01039c4:	83 fb 2f             	cmp    $0x2f,%ebx
c01039c7:	7e 0b                	jle    c01039d4 <vprintfmt+0xba>
c01039c9:	83 fb 39             	cmp    $0x39,%ebx
c01039cc:	7f 06                	jg     c01039d4 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01039ce:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c01039d2:	eb d3                	jmp    c01039a7 <vprintfmt+0x8d>
			goto process_precision;
c01039d4:	eb 33                	jmp    c0103a09 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c01039d6:	8b 45 14             	mov    0x14(%ebp),%eax
c01039d9:	8d 50 04             	lea    0x4(%eax),%edx
c01039dc:	89 55 14             	mov    %edx,0x14(%ebp)
c01039df:	8b 00                	mov    (%eax),%eax
c01039e1:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c01039e4:	eb 23                	jmp    c0103a09 <vprintfmt+0xef>

		case '.':
			if (width < 0)
c01039e6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01039ea:	79 0c                	jns    c01039f8 <vprintfmt+0xde>
				width = 0;
c01039ec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c01039f3:	e9 78 ff ff ff       	jmp    c0103970 <vprintfmt+0x56>
c01039f8:	e9 73 ff ff ff       	jmp    c0103970 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c01039fd:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c0103a04:	e9 67 ff ff ff       	jmp    c0103970 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c0103a09:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103a0d:	79 12                	jns    c0103a21 <vprintfmt+0x107>
				width = precision, precision = -1;
c0103a0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103a12:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103a15:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c0103a1c:	e9 4f ff ff ff       	jmp    c0103970 <vprintfmt+0x56>
c0103a21:	e9 4a ff ff ff       	jmp    c0103970 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c0103a26:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c0103a2a:	e9 41 ff ff ff       	jmp    c0103970 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c0103a2f:	8b 45 14             	mov    0x14(%ebp),%eax
c0103a32:	8d 50 04             	lea    0x4(%eax),%edx
c0103a35:	89 55 14             	mov    %edx,0x14(%ebp)
c0103a38:	8b 00                	mov    (%eax),%eax
c0103a3a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103a3d:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103a41:	89 04 24             	mov    %eax,(%esp)
c0103a44:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a47:	ff d0                	call   *%eax
			break;
c0103a49:	e9 c2 02 00 00       	jmp    c0103d10 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c0103a4e:	8b 45 14             	mov    0x14(%ebp),%eax
c0103a51:	8d 50 04             	lea    0x4(%eax),%edx
c0103a54:	89 55 14             	mov    %edx,0x14(%ebp)
c0103a57:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c0103a59:	85 db                	test   %ebx,%ebx
c0103a5b:	79 02                	jns    c0103a5f <vprintfmt+0x145>
				err = -err;
c0103a5d:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c0103a5f:	83 fb 06             	cmp    $0x6,%ebx
c0103a62:	7f 0b                	jg     c0103a6f <vprintfmt+0x155>
c0103a64:	8b 34 9d 28 46 10 c0 	mov    -0x3fefb9d8(,%ebx,4),%esi
c0103a6b:	85 f6                	test   %esi,%esi
c0103a6d:	75 23                	jne    c0103a92 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c0103a6f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0103a73:	c7 44 24 08 55 46 10 	movl   $0xc0104655,0x8(%esp)
c0103a7a:	c0 
c0103a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a82:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a85:	89 04 24             	mov    %eax,(%esp)
c0103a88:	e8 90 02 00 00       	call   c0103d1d <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c0103a8d:	e9 7e 02 00 00       	jmp    c0103d10 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c0103a92:	89 74 24 0c          	mov    %esi,0xc(%esp)
c0103a96:	c7 44 24 08 5e 46 10 	movl   $0xc010465e,0x8(%esp)
c0103a9d:	c0 
c0103a9e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103aa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103aa8:	89 04 24             	mov    %eax,(%esp)
c0103aab:	e8 6d 02 00 00       	call   c0103d1d <printfmt>
			break;
c0103ab0:	e9 5b 02 00 00       	jmp    c0103d10 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c0103ab5:	8b 45 14             	mov    0x14(%ebp),%eax
c0103ab8:	8d 50 04             	lea    0x4(%eax),%edx
c0103abb:	89 55 14             	mov    %edx,0x14(%ebp)
c0103abe:	8b 30                	mov    (%eax),%esi
c0103ac0:	85 f6                	test   %esi,%esi
c0103ac2:	75 05                	jne    c0103ac9 <vprintfmt+0x1af>
				p = "(null)";
c0103ac4:	be 61 46 10 c0       	mov    $0xc0104661,%esi
			if (width > 0 && padc != '-')
c0103ac9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103acd:	7e 37                	jle    c0103b06 <vprintfmt+0x1ec>
c0103acf:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c0103ad3:	74 31                	je     c0103b06 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c0103ad5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103ad8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103adc:	89 34 24             	mov    %esi,(%esp)
c0103adf:	e8 9b f8 ff ff       	call   c010337f <strnlen>
c0103ae4:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0103ae7:	eb 17                	jmp    c0103b00 <vprintfmt+0x1e6>
					putch(padc, putdat);
c0103ae9:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c0103aed:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103af0:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103af4:	89 04 24             	mov    %eax,(%esp)
c0103af7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103afa:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c0103afc:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103b00:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103b04:	7f e3                	jg     c0103ae9 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103b06:	eb 38                	jmp    c0103b40 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c0103b08:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0103b0c:	74 1f                	je     c0103b2d <vprintfmt+0x213>
c0103b0e:	83 fb 1f             	cmp    $0x1f,%ebx
c0103b11:	7e 05                	jle    c0103b18 <vprintfmt+0x1fe>
c0103b13:	83 fb 7e             	cmp    $0x7e,%ebx
c0103b16:	7e 15                	jle    c0103b2d <vprintfmt+0x213>
					putch('?', putdat);
c0103b18:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b1b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b1f:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c0103b26:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b29:	ff d0                	call   *%eax
c0103b2b:	eb 0f                	jmp    c0103b3c <vprintfmt+0x222>
				else
					putch(ch, putdat);
c0103b2d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b30:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b34:	89 1c 24             	mov    %ebx,(%esp)
c0103b37:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b3a:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103b3c:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103b40:	89 f0                	mov    %esi,%eax
c0103b42:	8d 70 01             	lea    0x1(%eax),%esi
c0103b45:	0f b6 00             	movzbl (%eax),%eax
c0103b48:	0f be d8             	movsbl %al,%ebx
c0103b4b:	85 db                	test   %ebx,%ebx
c0103b4d:	74 10                	je     c0103b5f <vprintfmt+0x245>
c0103b4f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103b53:	78 b3                	js     c0103b08 <vprintfmt+0x1ee>
c0103b55:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c0103b59:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103b5d:	79 a9                	jns    c0103b08 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103b5f:	eb 17                	jmp    c0103b78 <vprintfmt+0x25e>
				putch(' ', putdat);
c0103b61:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b64:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b68:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103b6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b72:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103b74:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103b78:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103b7c:	7f e3                	jg     c0103b61 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103b7e:	e9 8d 01 00 00       	jmp    c0103d10 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c0103b83:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b86:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b8a:	8d 45 14             	lea    0x14(%ebp),%eax
c0103b8d:	89 04 24             	mov    %eax,(%esp)
c0103b90:	e8 3e fd ff ff       	call   c01038d3 <getint>
c0103b95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b98:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c0103b9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103ba1:	85 d2                	test   %edx,%edx
c0103ba3:	79 26                	jns    c0103bcb <vprintfmt+0x2b1>
				putch('-', putdat);
c0103ba5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ba8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bac:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0103bb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb6:	ff d0                	call   *%eax
				num = -(long long) num;
c0103bb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103bbb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103bbe:	f7 d8                	neg    %eax
c0103bc0:	83 d2 00             	adc    $0x0,%edx
c0103bc3:	f7 da                	neg    %edx
c0103bc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103bc8:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0103bcb:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103bd2:	e9 c5 00 00 00       	jmp    c0103c9c <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c0103bd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103bda:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bde:	8d 45 14             	lea    0x14(%ebp),%eax
c0103be1:	89 04 24             	mov    %eax,(%esp)
c0103be4:	e8 9b fc ff ff       	call   c0103884 <getuint>
c0103be9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103bec:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c0103bef:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103bf6:	e9 a1 00 00 00       	jmp    c0103c9c <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c0103bfb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bfe:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c02:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103c09:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c0c:	ff d0                	call   *%eax
			putch('X', putdat);
c0103c0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c11:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c15:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103c1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c1f:	ff d0                	call   *%eax
			putch('X', putdat);
c0103c21:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c24:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c28:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103c2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c32:	ff d0                	call   *%eax
			break;
c0103c34:	e9 d7 00 00 00       	jmp    c0103d10 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c0103c39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c3c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c40:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c0103c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c4a:	ff d0                	call   *%eax
			putch('x', putdat);
c0103c4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c53:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c0103c5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c5d:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103c5f:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c62:	8d 50 04             	lea    0x4(%eax),%edx
c0103c65:	89 55 14             	mov    %edx,0x14(%ebp)
c0103c68:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c0103c6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103c6d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0103c74:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0103c7b:	eb 1f                	jmp    c0103c9c <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103c7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c80:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c84:	8d 45 14             	lea    0x14(%ebp),%eax
c0103c87:	89 04 24             	mov    %eax,(%esp)
c0103c8a:	e8 f5 fb ff ff       	call   c0103884 <getuint>
c0103c8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103c92:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103c95:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0103c9c:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0103ca0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103ca3:	89 54 24 18          	mov    %edx,0x18(%esp)
c0103ca7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103caa:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103cae:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103cb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103cb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103cb8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103cbc:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103cc0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cc3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cca:	89 04 24             	mov    %eax,(%esp)
c0103ccd:	e8 d4 fa ff ff       	call   c01037a6 <printnum>
			break;
c0103cd2:	eb 3c                	jmp    c0103d10 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c0103cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cd7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cdb:	89 1c 24             	mov    %ebx,(%esp)
c0103cde:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce1:	ff d0                	call   *%eax
			break;
c0103ce3:	eb 2b                	jmp    c0103d10 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c0103ce5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ce8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cec:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c0103cf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf6:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c0103cf8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103cfc:	eb 04                	jmp    c0103d02 <vprintfmt+0x3e8>
c0103cfe:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103d02:	8b 45 10             	mov    0x10(%ebp),%eax
c0103d05:	83 e8 01             	sub    $0x1,%eax
c0103d08:	0f b6 00             	movzbl (%eax),%eax
c0103d0b:	3c 25                	cmp    $0x25,%al
c0103d0d:	75 ef                	jne    c0103cfe <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c0103d0f:	90                   	nop
		}
	}
c0103d10:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103d11:	e9 26 fc ff ff       	jmp    c010393c <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c0103d16:	83 c4 40             	add    $0x40,%esp
c0103d19:	5b                   	pop    %ebx
c0103d1a:	5e                   	pop    %esi
c0103d1b:	5d                   	pop    %ebp
c0103d1c:	c3                   	ret    

c0103d1d <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c0103d1d:	55                   	push   %ebp
c0103d1e:	89 e5                	mov    %esp,%ebp
c0103d20:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0103d23:	8d 45 14             	lea    0x14(%ebp),%eax
c0103d26:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c0103d29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103d2c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103d30:	8b 45 10             	mov    0x10(%ebp),%eax
c0103d33:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103d37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d3a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103d3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d41:	89 04 24             	mov    %eax,(%esp)
c0103d44:	e8 d1 fb ff ff       	call   c010391a <vprintfmt>
	va_end(ap);
}
c0103d49:	c9                   	leave  
c0103d4a:	c3                   	ret    

c0103d4b <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c0103d4b:	55                   	push   %ebp
c0103d4c:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103d4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d51:	8b 40 08             	mov    0x8(%eax),%eax
c0103d54:	8d 50 01             	lea    0x1(%eax),%edx
c0103d57:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d5a:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103d5d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d60:	8b 10                	mov    (%eax),%edx
c0103d62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d65:	8b 40 04             	mov    0x4(%eax),%eax
c0103d68:	39 c2                	cmp    %eax,%edx
c0103d6a:	73 12                	jae    c0103d7e <sprintputch+0x33>
		*b->buf++ = ch;
c0103d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d6f:	8b 00                	mov    (%eax),%eax
c0103d71:	8d 48 01             	lea    0x1(%eax),%ecx
c0103d74:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103d77:	89 0a                	mov    %ecx,(%edx)
c0103d79:	8b 55 08             	mov    0x8(%ebp),%edx
c0103d7c:	88 10                	mov    %dl,(%eax)
}
c0103d7e:	5d                   	pop    %ebp
c0103d7f:	c3                   	ret    

c0103d80 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103d80:	55                   	push   %ebp
c0103d81:	89 e5                	mov    %esp,%ebp
c0103d83:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103d86:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d89:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103d8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d8f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103d92:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d95:	01 d0                	add    %edx,%eax
c0103d97:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103d9a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0103da1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103da5:	74 06                	je     c0103dad <vsnprintf+0x2d>
c0103da7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103dab:	7f 07                	jg     c0103db4 <vsnprintf+0x34>
		return -E_INVAL;
c0103dad:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0103db2:	eb 2a                	jmp    c0103dde <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c0103db4:	8b 45 14             	mov    0x14(%ebp),%eax
c0103db7:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103dbb:	8b 45 10             	mov    0x10(%ebp),%eax
c0103dbe:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103dc2:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0103dc5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103dc9:	c7 04 24 4b 3d 10 c0 	movl   $0xc0103d4b,(%esp)
c0103dd0:	e8 45 fb ff ff       	call   c010391a <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c0103dd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103dd8:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c0103ddb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103dde:	c9                   	leave  
c0103ddf:	c3                   	ret    

c0103de0 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c0103de0:	55                   	push   %ebp
c0103de1:	89 e5                	mov    %esp,%ebp
c0103de3:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c0103de6:	8d 45 14             	lea    0x14(%ebp),%eax
c0103de9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c0103dec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103def:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103df3:	8b 45 10             	mov    0x10(%ebp),%eax
c0103df6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103dfa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103dfd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e01:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e04:	89 04 24             	mov    %eax,(%esp)
c0103e07:	e8 74 ff ff ff       	call   c0103d80 <vsnprintf>
c0103e0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c0103e0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103e12:	c9                   	leave  
c0103e13:	c3                   	ret    

c0103e14 <srand>:
static int seed = 0;

void
srand(int s) {
c0103e14:	55                   	push   %ebp
c0103e15:	89 e5                	mov    %esp,%ebp
	seed = s;
c0103e17:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e1a:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c0103e1f:	5d                   	pop    %ebp
c0103e20:	c3                   	ret    

c0103e21 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0103e21:	55                   	push   %ebp
c0103e22:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0103e24:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103e29:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0103e2f:	83 c0 01             	add    $0x1,%eax
c0103e32:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c0103e37:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103e3c:	c1 f8 10             	sar    $0x10,%eax
c0103e3f:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0103e44:	5d                   	pop    %ebp
c0103e45:	c3                   	ret    
c0103e46:	66 90                	xchg   %ax,%ax
c0103e48:	66 90                	xchg   %ax,%ax
c0103e4a:	66 90                	xchg   %ax,%ax
c0103e4c:	66 90                	xchg   %ax,%ax
c0103e4e:	66 90                	xchg   %ax,%ax

c0103e50 <__udivdi3>:
c0103e50:	55                   	push   %ebp
c0103e51:	57                   	push   %edi
c0103e52:	56                   	push   %esi
c0103e53:	83 ec 0c             	sub    $0xc,%esp
c0103e56:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103e5a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c0103e5e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103e62:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103e66:	85 c0                	test   %eax,%eax
c0103e68:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0103e6c:	89 ea                	mov    %ebp,%edx
c0103e6e:	89 0c 24             	mov    %ecx,(%esp)
c0103e71:	75 2d                	jne    c0103ea0 <__udivdi3+0x50>
c0103e73:	39 e9                	cmp    %ebp,%ecx
c0103e75:	77 61                	ja     c0103ed8 <__udivdi3+0x88>
c0103e77:	85 c9                	test   %ecx,%ecx
c0103e79:	89 ce                	mov    %ecx,%esi
c0103e7b:	75 0b                	jne    c0103e88 <__udivdi3+0x38>
c0103e7d:	b8 01 00 00 00       	mov    $0x1,%eax
c0103e82:	31 d2                	xor    %edx,%edx
c0103e84:	f7 f1                	div    %ecx
c0103e86:	89 c6                	mov    %eax,%esi
c0103e88:	31 d2                	xor    %edx,%edx
c0103e8a:	89 e8                	mov    %ebp,%eax
c0103e8c:	f7 f6                	div    %esi
c0103e8e:	89 c5                	mov    %eax,%ebp
c0103e90:	89 f8                	mov    %edi,%eax
c0103e92:	f7 f6                	div    %esi
c0103e94:	89 ea                	mov    %ebp,%edx
c0103e96:	83 c4 0c             	add    $0xc,%esp
c0103e99:	5e                   	pop    %esi
c0103e9a:	5f                   	pop    %edi
c0103e9b:	5d                   	pop    %ebp
c0103e9c:	c3                   	ret    
c0103e9d:	8d 76 00             	lea    0x0(%esi),%esi
c0103ea0:	39 e8                	cmp    %ebp,%eax
c0103ea2:	77 24                	ja     c0103ec8 <__udivdi3+0x78>
c0103ea4:	0f bd e8             	bsr    %eax,%ebp
c0103ea7:	83 f5 1f             	xor    $0x1f,%ebp
c0103eaa:	75 3c                	jne    c0103ee8 <__udivdi3+0x98>
c0103eac:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103eb0:	39 34 24             	cmp    %esi,(%esp)
c0103eb3:	0f 86 9f 00 00 00    	jbe    c0103f58 <__udivdi3+0x108>
c0103eb9:	39 d0                	cmp    %edx,%eax
c0103ebb:	0f 82 97 00 00 00    	jb     c0103f58 <__udivdi3+0x108>
c0103ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103ec8:	31 d2                	xor    %edx,%edx
c0103eca:	31 c0                	xor    %eax,%eax
c0103ecc:	83 c4 0c             	add    $0xc,%esp
c0103ecf:	5e                   	pop    %esi
c0103ed0:	5f                   	pop    %edi
c0103ed1:	5d                   	pop    %ebp
c0103ed2:	c3                   	ret    
c0103ed3:	90                   	nop
c0103ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103ed8:	89 f8                	mov    %edi,%eax
c0103eda:	f7 f1                	div    %ecx
c0103edc:	31 d2                	xor    %edx,%edx
c0103ede:	83 c4 0c             	add    $0xc,%esp
c0103ee1:	5e                   	pop    %esi
c0103ee2:	5f                   	pop    %edi
c0103ee3:	5d                   	pop    %ebp
c0103ee4:	c3                   	ret    
c0103ee5:	8d 76 00             	lea    0x0(%esi),%esi
c0103ee8:	89 e9                	mov    %ebp,%ecx
c0103eea:	8b 3c 24             	mov    (%esp),%edi
c0103eed:	d3 e0                	shl    %cl,%eax
c0103eef:	89 c6                	mov    %eax,%esi
c0103ef1:	b8 20 00 00 00       	mov    $0x20,%eax
c0103ef6:	29 e8                	sub    %ebp,%eax
c0103ef8:	89 c1                	mov    %eax,%ecx
c0103efa:	d3 ef                	shr    %cl,%edi
c0103efc:	89 e9                	mov    %ebp,%ecx
c0103efe:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0103f02:	8b 3c 24             	mov    (%esp),%edi
c0103f05:	09 74 24 08          	or     %esi,0x8(%esp)
c0103f09:	89 d6                	mov    %edx,%esi
c0103f0b:	d3 e7                	shl    %cl,%edi
c0103f0d:	89 c1                	mov    %eax,%ecx
c0103f0f:	89 3c 24             	mov    %edi,(%esp)
c0103f12:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103f16:	d3 ee                	shr    %cl,%esi
c0103f18:	89 e9                	mov    %ebp,%ecx
c0103f1a:	d3 e2                	shl    %cl,%edx
c0103f1c:	89 c1                	mov    %eax,%ecx
c0103f1e:	d3 ef                	shr    %cl,%edi
c0103f20:	09 d7                	or     %edx,%edi
c0103f22:	89 f2                	mov    %esi,%edx
c0103f24:	89 f8                	mov    %edi,%eax
c0103f26:	f7 74 24 08          	divl   0x8(%esp)
c0103f2a:	89 d6                	mov    %edx,%esi
c0103f2c:	89 c7                	mov    %eax,%edi
c0103f2e:	f7 24 24             	mull   (%esp)
c0103f31:	39 d6                	cmp    %edx,%esi
c0103f33:	89 14 24             	mov    %edx,(%esp)
c0103f36:	72 30                	jb     c0103f68 <__udivdi3+0x118>
c0103f38:	8b 54 24 04          	mov    0x4(%esp),%edx
c0103f3c:	89 e9                	mov    %ebp,%ecx
c0103f3e:	d3 e2                	shl    %cl,%edx
c0103f40:	39 c2                	cmp    %eax,%edx
c0103f42:	73 05                	jae    c0103f49 <__udivdi3+0xf9>
c0103f44:	3b 34 24             	cmp    (%esp),%esi
c0103f47:	74 1f                	je     c0103f68 <__udivdi3+0x118>
c0103f49:	89 f8                	mov    %edi,%eax
c0103f4b:	31 d2                	xor    %edx,%edx
c0103f4d:	e9 7a ff ff ff       	jmp    c0103ecc <__udivdi3+0x7c>
c0103f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103f58:	31 d2                	xor    %edx,%edx
c0103f5a:	b8 01 00 00 00       	mov    $0x1,%eax
c0103f5f:	e9 68 ff ff ff       	jmp    c0103ecc <__udivdi3+0x7c>
c0103f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103f68:	8d 47 ff             	lea    -0x1(%edi),%eax
c0103f6b:	31 d2                	xor    %edx,%edx
c0103f6d:	83 c4 0c             	add    $0xc,%esp
c0103f70:	5e                   	pop    %esi
c0103f71:	5f                   	pop    %edi
c0103f72:	5d                   	pop    %ebp
c0103f73:	c3                   	ret    
c0103f74:	66 90                	xchg   %ax,%ax
c0103f76:	66 90                	xchg   %ax,%ax
c0103f78:	66 90                	xchg   %ax,%ax
c0103f7a:	66 90                	xchg   %ax,%ax
c0103f7c:	66 90                	xchg   %ax,%ax
c0103f7e:	66 90                	xchg   %ax,%ax

c0103f80 <__umoddi3>:
c0103f80:	55                   	push   %ebp
c0103f81:	57                   	push   %edi
c0103f82:	56                   	push   %esi
c0103f83:	83 ec 14             	sub    $0x14,%esp
c0103f86:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103f8a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103f8e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103f92:	89 c7                	mov    %eax,%edi
c0103f94:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f98:	8b 44 24 30          	mov    0x30(%esp),%eax
c0103f9c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103fa0:	89 34 24             	mov    %esi,(%esp)
c0103fa3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103fa7:	85 c0                	test   %eax,%eax
c0103fa9:	89 c2                	mov    %eax,%edx
c0103fab:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103faf:	75 17                	jne    c0103fc8 <__umoddi3+0x48>
c0103fb1:	39 fe                	cmp    %edi,%esi
c0103fb3:	76 4b                	jbe    c0104000 <__umoddi3+0x80>
c0103fb5:	89 c8                	mov    %ecx,%eax
c0103fb7:	89 fa                	mov    %edi,%edx
c0103fb9:	f7 f6                	div    %esi
c0103fbb:	89 d0                	mov    %edx,%eax
c0103fbd:	31 d2                	xor    %edx,%edx
c0103fbf:	83 c4 14             	add    $0x14,%esp
c0103fc2:	5e                   	pop    %esi
c0103fc3:	5f                   	pop    %edi
c0103fc4:	5d                   	pop    %ebp
c0103fc5:	c3                   	ret    
c0103fc6:	66 90                	xchg   %ax,%ax
c0103fc8:	39 f8                	cmp    %edi,%eax
c0103fca:	77 54                	ja     c0104020 <__umoddi3+0xa0>
c0103fcc:	0f bd e8             	bsr    %eax,%ebp
c0103fcf:	83 f5 1f             	xor    $0x1f,%ebp
c0103fd2:	75 5c                	jne    c0104030 <__umoddi3+0xb0>
c0103fd4:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0103fd8:	39 3c 24             	cmp    %edi,(%esp)
c0103fdb:	0f 87 e7 00 00 00    	ja     c01040c8 <__umoddi3+0x148>
c0103fe1:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103fe5:	29 f1                	sub    %esi,%ecx
c0103fe7:	19 c7                	sbb    %eax,%edi
c0103fe9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103fed:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103ff1:	8b 44 24 08          	mov    0x8(%esp),%eax
c0103ff5:	8b 54 24 0c          	mov    0xc(%esp),%edx
c0103ff9:	83 c4 14             	add    $0x14,%esp
c0103ffc:	5e                   	pop    %esi
c0103ffd:	5f                   	pop    %edi
c0103ffe:	5d                   	pop    %ebp
c0103fff:	c3                   	ret    
c0104000:	85 f6                	test   %esi,%esi
c0104002:	89 f5                	mov    %esi,%ebp
c0104004:	75 0b                	jne    c0104011 <__umoddi3+0x91>
c0104006:	b8 01 00 00 00       	mov    $0x1,%eax
c010400b:	31 d2                	xor    %edx,%edx
c010400d:	f7 f6                	div    %esi
c010400f:	89 c5                	mov    %eax,%ebp
c0104011:	8b 44 24 04          	mov    0x4(%esp),%eax
c0104015:	31 d2                	xor    %edx,%edx
c0104017:	f7 f5                	div    %ebp
c0104019:	89 c8                	mov    %ecx,%eax
c010401b:	f7 f5                	div    %ebp
c010401d:	eb 9c                	jmp    c0103fbb <__umoddi3+0x3b>
c010401f:	90                   	nop
c0104020:	89 c8                	mov    %ecx,%eax
c0104022:	89 fa                	mov    %edi,%edx
c0104024:	83 c4 14             	add    $0x14,%esp
c0104027:	5e                   	pop    %esi
c0104028:	5f                   	pop    %edi
c0104029:	5d                   	pop    %ebp
c010402a:	c3                   	ret    
c010402b:	90                   	nop
c010402c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104030:	8b 04 24             	mov    (%esp),%eax
c0104033:	be 20 00 00 00       	mov    $0x20,%esi
c0104038:	89 e9                	mov    %ebp,%ecx
c010403a:	29 ee                	sub    %ebp,%esi
c010403c:	d3 e2                	shl    %cl,%edx
c010403e:	89 f1                	mov    %esi,%ecx
c0104040:	d3 e8                	shr    %cl,%eax
c0104042:	89 e9                	mov    %ebp,%ecx
c0104044:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104048:	8b 04 24             	mov    (%esp),%eax
c010404b:	09 54 24 04          	or     %edx,0x4(%esp)
c010404f:	89 fa                	mov    %edi,%edx
c0104051:	d3 e0                	shl    %cl,%eax
c0104053:	89 f1                	mov    %esi,%ecx
c0104055:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104059:	8b 44 24 10          	mov    0x10(%esp),%eax
c010405d:	d3 ea                	shr    %cl,%edx
c010405f:	89 e9                	mov    %ebp,%ecx
c0104061:	d3 e7                	shl    %cl,%edi
c0104063:	89 f1                	mov    %esi,%ecx
c0104065:	d3 e8                	shr    %cl,%eax
c0104067:	89 e9                	mov    %ebp,%ecx
c0104069:	09 f8                	or     %edi,%eax
c010406b:	8b 7c 24 10          	mov    0x10(%esp),%edi
c010406f:	f7 74 24 04          	divl   0x4(%esp)
c0104073:	d3 e7                	shl    %cl,%edi
c0104075:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0104079:	89 d7                	mov    %edx,%edi
c010407b:	f7 64 24 08          	mull   0x8(%esp)
c010407f:	39 d7                	cmp    %edx,%edi
c0104081:	89 c1                	mov    %eax,%ecx
c0104083:	89 14 24             	mov    %edx,(%esp)
c0104086:	72 2c                	jb     c01040b4 <__umoddi3+0x134>
c0104088:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c010408c:	72 22                	jb     c01040b0 <__umoddi3+0x130>
c010408e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0104092:	29 c8                	sub    %ecx,%eax
c0104094:	19 d7                	sbb    %edx,%edi
c0104096:	89 e9                	mov    %ebp,%ecx
c0104098:	89 fa                	mov    %edi,%edx
c010409a:	d3 e8                	shr    %cl,%eax
c010409c:	89 f1                	mov    %esi,%ecx
c010409e:	d3 e2                	shl    %cl,%edx
c01040a0:	89 e9                	mov    %ebp,%ecx
c01040a2:	d3 ef                	shr    %cl,%edi
c01040a4:	09 d0                	or     %edx,%eax
c01040a6:	89 fa                	mov    %edi,%edx
c01040a8:	83 c4 14             	add    $0x14,%esp
c01040ab:	5e                   	pop    %esi
c01040ac:	5f                   	pop    %edi
c01040ad:	5d                   	pop    %ebp
c01040ae:	c3                   	ret    
c01040af:	90                   	nop
c01040b0:	39 d7                	cmp    %edx,%edi
c01040b2:	75 da                	jne    c010408e <__umoddi3+0x10e>
c01040b4:	8b 14 24             	mov    (%esp),%edx
c01040b7:	89 c1                	mov    %eax,%ecx
c01040b9:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c01040bd:	1b 54 24 04          	sbb    0x4(%esp),%edx
c01040c1:	eb cb                	jmp    c010408e <__umoddi3+0x10e>
c01040c3:	90                   	nop
c01040c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01040c8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c01040cc:	0f 82 0f ff ff ff    	jb     c0103fe1 <__umoddi3+0x61>
c01040d2:	e9 1a ff ff ff       	jmp    c0103ff1 <__umoddi3+0x71>
