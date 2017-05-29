
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
c0100015:	8b 04 85 84 40 10 c0 	mov    -0x3fefbf7c(,%eax,4),%eax
c010001c:	ff e0                	jmp    *%eax
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c010001e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100021:	8b 40 10             	mov    0x10(%eax),%eax
c0100024:	89 04 24             	mov    %eax,(%esp)
c0100027:	e8 52 0a 00 00       	call   c0100a7e <sys_pr>
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
c010007e:	e8 e4 2c 00 00       	call   c0102d67 <sys_write>
c0100083:	89 c2                	mov    %eax,%edx
c0100085:	8b 45 08             	mov    0x8(%ebp),%eax
c0100088:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008b:	e9 12 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_fork:
			sys_fork();
c0100090:	e8 8b 16 00 00       	call   c0101720 <sys_fork>
			break;
c0100095:	e9 08 01 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_getpid:
			tf->eax=sys_getpid();
c010009a:	e8 d1 16 00 00       	call   c0101770 <sys_getpid>
c010009f:	8b 55 08             	mov    0x8(%ebp),%edx
c01000a2:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c01000a5:	e9 f8 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_exit:
			sys_exit(tf->ebx);
c01000aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ad:	8b 40 10             	mov    0x10(%eax),%eax
c01000b0:	89 04 24             	mov    %eax,(%esp)
c01000b3:	e8 c5 16 00 00       	call   c010177d <sys_exit>
			break;
c01000b8:	e9 e5 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01000c0:	8b 40 10             	mov    0x10(%eax),%eax
c01000c3:	89 04 24             	mov    %eax,(%esp)
c01000c6:	e8 09 18 00 00       	call   c01018d4 <sys_sleep>
			break;
c01000cb:	e9 d2 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_thread:
			tf->eax=kthread((void*)tf->ebx);
c01000d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01000d3:	8b 40 10             	mov    0x10(%eax),%eax
c01000d6:	89 04 24             	mov    %eax,(%esp)
c01000d9:	e8 85 14 00 00       	call   c0101563 <kthread>
c01000de:	89 c2                	mov    %eax,%edx
c01000e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01000e3:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c01000e6:	e9 b7 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_init:
			tf->eax=ksem_init((Sema*)tf->ebx,tf->ecx);
c01000eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ee:	8b 40 18             	mov    0x18(%eax),%eax
c01000f1:	89 c2                	mov    %eax,%edx
c01000f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01000f6:	8b 40 10             	mov    0x10(%eax),%eax
c01000f9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01000fd:	89 04 24             	mov    %eax,(%esp)
c0100100:	e8 2d 1a 00 00       	call   c0101b32 <ksem_init>
c0100105:	89 c2                	mov    %eax,%edx
c0100107:	8b 45 08             	mov    0x8(%ebp),%eax
c010010a:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010010d:	e9 90 00 00 00       	jmp    c01001a2 <do_syscall+0x1a2>
		case SYS_sem_destroy:
			tf->eax=ksem_destroy((Sema*)tf->ebx);
c0100112:	8b 45 08             	mov    0x8(%ebp),%eax
c0100115:	8b 40 10             	mov    0x10(%eax),%eax
c0100118:	89 04 24             	mov    %eax,(%esp)
c010011b:	e8 2e 1a 00 00       	call   c0101b4e <ksem_destroy>
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
c0100133:	e8 81 1a 00 00       	call   c0101bb9 <ksem_wait>
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
c010014b:	e8 be 1a 00 00       	call   c0101c0e <ksem_trywait>
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
c0100163:	e8 cd 1a 00 00       	call   c0101c35 <ksem_post>
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
c0100186:	c7 44 24 08 38 40 10 	movl   $0xc0104038,0x8(%esp)
c010018d:	c0 
c010018e:	c7 44 24 04 42 00 00 	movl   $0x42,0x4(%esp)
c0100195:	00 
c0100196:	c7 04 24 65 40 10 c0 	movl   $0xc0104065,(%esp)
c010019d:	e8 25 2b 00 00       	call   c0102cc7 <_panic>
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
c01001f9:	e8 86 1b 00 00       	call   c0101d84 <page_init>
	//printk("here");
	init_segment();
c01001fe:	e8 04 2a 00 00       	call   c0102c07 <init_segment>
	pcb_init();
c0100203:	e8 2d 0c 00 00       	call   c0100e35 <pcb_init>
	//printk("here");
	init_serial();
c0100208:	e8 93 08 00 00       	call   c0100aa0 <init_serial>
	init_video();
c010020d:	e8 5c 07 00 00       	call   c010096e <init_video>
	init_timer();
c0100212:	e8 7d 09 00 00       	call   c0100b94 <init_timer>
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
c0100239:	e8 39 10 00 00       	call   c0101277 <pcb_new>
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
c0100244:	c7 04 24 c0 40 10 c0 	movl   $0xc01040c0,(%esp)
c010024b:	e8 a6 2b 00 00       	call   c0102df6 <printk>
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
c010049e:	b8 c7 2e 10 c0       	mov    $0xc0102ec7,%eax
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
c01004d8:	b8 1c 2e 10 c0       	mov    $0xc0102e1c,%eax
c01004dd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004e4:	00 
c01004e5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004e9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004f0:	00 
c01004f1:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c01004f8:	e8 15 ff ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c01004fd:	b8 25 2e 10 c0       	mov    $0xc0102e25,%eax
c0100502:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100509:	00 
c010050a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010050e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100515:	00 
c0100516:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c010051d:	e8 f0 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100522:	b8 2e 2e 10 c0       	mov    $0xc0102e2e,%eax
c0100527:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010052e:	00 
c010052f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100533:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010053a:	00 
c010053b:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c0100542:	e8 cb fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c0100547:	b8 37 2e 10 c0       	mov    $0xc0102e37,%eax
c010054c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100553:	00 
c0100554:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100558:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010055f:	00 
c0100560:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c0100567:	e8 a6 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c010056c:	b8 40 2e 10 c0       	mov    $0xc0102e40,%eax
c0100571:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100578:	00 
c0100579:	89 44 24 08          	mov    %eax,0x8(%esp)
c010057d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100584:	00 
c0100585:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c010058c:	e8 81 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c0100591:	b8 49 2e 10 c0       	mov    $0xc0102e49,%eax
c0100596:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010059d:	00 
c010059e:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005a2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005a9:	00 
c01005aa:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c01005b1:	e8 5c fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c01005b6:	b8 52 2e 10 c0       	mov    $0xc0102e52,%eax
c01005bb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005c2:	00 
c01005c3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005c7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005ce:	00 
c01005cf:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c01005d6:	e8 37 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c01005db:	b8 5b 2e 10 c0       	mov    $0xc0102e5b,%eax
c01005e0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005e7:	00 
c01005e8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005ec:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005f3:	00 
c01005f4:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c01005fb:	e8 12 fe ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c0100600:	b8 64 2e 10 c0       	mov    $0xc0102e64,%eax
c0100605:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010060c:	00 
c010060d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100611:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100618:	00 
c0100619:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c0100620:	e8 ed fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c0100625:	b8 6b 2e 10 c0       	mov    $0xc0102e6b,%eax
c010062a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100631:	00 
c0100632:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100636:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010063d:	00 
c010063e:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c0100645:	e8 c8 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c010064a:	b8 74 2e 10 c0       	mov    $0xc0102e74,%eax
c010064f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100656:	00 
c0100657:	89 44 24 08          	mov    %eax,0x8(%esp)
c010065b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100662:	00 
c0100663:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c010066a:	e8 a3 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c010066f:	b8 7b 2e 10 c0       	mov    $0xc0102e7b,%eax
c0100674:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010067b:	00 
c010067c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100680:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100687:	00 
c0100688:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c010068f:	e8 7e fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c0100694:	b8 82 2e 10 c0       	mov    $0xc0102e82,%eax
c0100699:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006a0:	00 
c01006a1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006a5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006ac:	00 
c01006ad:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c01006b4:	e8 59 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c01006b9:	b8 89 2e 10 c0       	mov    $0xc0102e89,%eax
c01006be:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006c5:	00 
c01006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ca:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006d1:	00 
c01006d2:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c01006d9:	e8 34 fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c01006de:	b8 90 2e 10 c0       	mov    $0xc0102e90,%eax
c01006e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006ea:	00 
c01006eb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ef:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006f6:	00 
c01006f7:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c01006fe:	e8 0f fd ff ff       	call   c0100412 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100703:	b8 97 2e 10 c0       	mov    $0xc0102e97,%eax
c0100708:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c010070f:	00 
c0100710:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100714:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010071b:	00 
c010071c:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c0100723:	e8 ea fc ff ff       	call   c0100412 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c0100728:	b8 a3 2e 10 c0       	mov    $0xc0102ea3,%eax
c010072d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100734:	00 
c0100735:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100739:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100740:	00 
c0100741:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c0100748:	e8 45 fc ff ff       	call   c0100392 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c010074d:	b8 af 2e 10 c0       	mov    $0xc0102eaf,%eax
c0100752:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100759:	00 
c010075a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010075e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100765:	00 
c0100766:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c010076d:	e8 20 fc ff ff       	call   c0100392 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c0100772:	b8 bb 2e 10 c0       	mov    $0xc0102ebb,%eax
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
c01007ef:	e9 78 01 00 00       	jmp    c010096c <irq_handle+0x1a5>
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
c0100814:	c7 44 24 04 3e 41 10 	movl   $0xc010413e,0x4(%esp)
c010081b:	c0 
c010081c:	c7 04 24 cc 40 10 c0 	movl   $0xc01040cc,(%esp)
c0100823:	e8 ce 25 00 00       	call   c0102df6 <printk>
c0100828:	eb 26                	jmp    c0100850 <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c010082a:	8b 45 08             	mov    0x8(%ebp),%eax
c010082d:	8b 40 30             	mov    0x30(%eax),%eax
c0100830:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100834:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c010083b:	00 
c010083c:	c7 44 24 04 3e 41 10 	movl   $0xc010413e,0x4(%esp)
c0100843:	c0 
c0100844:	c7 04 24 ec 40 10 c0 	movl   $0xc01040ec,(%esp)
c010084b:	e8 a6 25 00 00       	call   c0102df6 <printk>
		}
		assert(0);
c0100850:	c7 44 24 0c 0f 41 10 	movl   $0xc010410f,0xc(%esp)
c0100857:	c0 
c0100858:	c7 44 24 08 11 41 10 	movl   $0xc0104111,0x8(%esp)
c010085f:	c0 
c0100860:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c0100867:	00 
c0100868:	c7 04 24 26 41 10 c0 	movl   $0xc0104126,(%esp)
c010086f:	e8 53 24 00 00       	call   c0102cc7 <_panic>
	}

	else if (tf->irq == 1000) {
c0100874:	8b 45 08             	mov    0x8(%ebp),%eax
c0100877:	8b 40 30             	mov    0x30(%eax),%eax
c010087a:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c010087f:	75 11                	jne    c0100892 <irq_handle+0xcb>
		do_timer();
c0100881:	a1 0c 10 11 c0       	mov    0xc011100c,%eax
c0100886:	ff d0                	call   *%eax
		schedule();
c0100888:	e8 50 20 00 00       	call   c01028dd <schedule>
c010088d:	e9 da 00 00 00       	jmp    c010096c <irq_handle+0x1a5>
	} else if (tf->irq == 1001) {
c0100892:	8b 45 08             	mov    0x8(%ebp),%eax
c0100895:	8b 40 30             	mov    0x30(%eax),%eax
c0100898:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c010089d:	75 76                	jne    c0100915 <irq_handle+0x14e>
c010089f:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008a9:	89 c2                	mov    %eax,%edx
c01008ab:	ec                   	in     (%dx),%al
c01008ac:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c01008af:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c01008b3:	0f b6 c0             	movzbl %al,%eax
c01008b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01008b9:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01008c3:	89 c2                	mov    %eax,%edx
c01008c5:	ec                   	in     (%dx),%al
c01008c6:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c01008c9:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c01008cd:	0f b6 c0             	movzbl %al,%eax
c01008d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c01008d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008d6:	83 c8 80             	or     $0xffffff80,%eax
c01008d9:	0f b6 c0             	movzbl %al,%eax
c01008dc:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c01008e3:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01008e6:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01008ea:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01008ed:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c01008ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008f1:	0f b6 c0             	movzbl %al,%eax
c01008f4:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c01008fb:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01008fe:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100902:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100905:	ee                   	out    %al,(%dx)
		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c0100906:	a1 10 10 11 c0       	mov    0xc0111010,%eax
c010090b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010090e:	89 14 24             	mov    %edx,(%esp)
c0100911:	ff d0                	call   *%eax
c0100913:	eb 57                	jmp    c010096c <irq_handle+0x1a5>
	}else if(tf->irq==1014){
c0100915:	8b 45 08             	mov    0x8(%ebp),%eax
c0100918:	8b 40 30             	mov    0x30(%eax),%eax
c010091b:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c0100920:	74 4a                	je     c010096c <irq_handle+0x1a5>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100922:	8b 45 08             	mov    0x8(%ebp),%eax
c0100925:	8b 40 30             	mov    0x30(%eax),%eax
c0100928:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010092c:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
c0100933:	00 
c0100934:	c7 44 24 04 3e 41 10 	movl   $0xc010413e,0x4(%esp)
c010093b:	c0 
c010093c:	c7 04 24 ec 40 10 c0 	movl   $0xc01040ec,(%esp)
c0100943:	e8 ae 24 00 00       	call   c0102df6 <printk>
		assert(0);
c0100948:	c7 44 24 0c 0f 41 10 	movl   $0xc010410f,0xc(%esp)
c010094f:	c0 
c0100950:	c7 44 24 08 11 41 10 	movl   $0xc0104111,0x8(%esp)
c0100957:	c0 
c0100958:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c010095f:	00 
c0100960:	c7 04 24 26 41 10 c0 	movl   $0xc0104126,(%esp)
c0100967:	e8 5b 23 00 00       	call   c0102cc7 <_panic>
	}
}
c010096c:	c9                   	leave  
c010096d:	c3                   	ret    

c010096e <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c010096e:	55                   	push   %ebp
c010096f:	89 e5                	mov    %esp,%ebp
c0100971:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c0100974:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010097b:	00 
c010097c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100983:	00 
c0100984:	c7 04 24 20 10 11 c0 	movl   $0xc0111020,(%esp)
c010098b:	e8 eb 28 00 00       	call   c010327b <memset>
	memset(vref, 0, SCR_SIZE);
c0100990:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100997:	00 
c0100998:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010099f:	00 
c01009a0:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009a7:	e8 cf 28 00 00       	call   c010327b <memset>
}
c01009ac:	c9                   	leave  
c01009ad:	c3                   	ret    

c01009ae <prepare_buffer>:

void prepare_buffer(void) {
c01009ae:	55                   	push   %ebp
c01009af:	89 e5                	mov    %esp,%ebp
c01009b1:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c01009b4:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009bb:	00 
c01009bc:	c7 44 24 04 20 10 11 	movl   $0xc0111020,0x4(%esp)
c01009c3:	c0 
c01009c4:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009cb:	e8 8e 28 00 00       	call   c010325e <memcpy>
#endif
	vmem = vbuf;
c01009d0:	c7 05 04 60 10 c0 20 	movl   $0xc0111020,0xc0106004
c01009d7:	10 11 c0 
	memset(vmem, 0, SCR_SIZE);
c01009da:	a1 04 60 10 c0       	mov    0xc0106004,%eax
c01009df:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009e6:	00 
c01009e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01009ee:	00 
c01009ef:	89 04 24             	mov    %eax,(%esp)
c01009f2:	e8 84 28 00 00       	call   c010327b <memset>
}
c01009f7:	c9                   	leave  
c01009f8:	c3                   	ret    

c01009f9 <display_buffer>:

void display_buffer(void) {
c01009f9:	55                   	push   %ebp
c01009fa:	89 e5                	mov    %esp,%ebp
c01009fc:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c01009ff:	c7 45 f8 20 10 11 c0 	movl   $0xc0111020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c0100a06:	c7 45 f4 20 0a 12 c0 	movl   $0xc0120a20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c0100a0d:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c0100a14:	c7 05 04 60 10 c0 00 	movl   $0xa0000,0xc0106004
c0100a1b:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a1e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100a25:	eb 4c                	jmp    c0100a73 <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c0100a27:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a2a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a31:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a34:	01 d0                	add    %edx,%eax
c0100a36:	8b 10                	mov    (%eax),%edx
c0100a38:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a3b:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a45:	01 c8                	add    %ecx,%eax
c0100a47:	8b 00                	mov    (%eax),%eax
c0100a49:	39 c2                	cmp    %eax,%edx
c0100a4b:	74 22                	je     c0100a6f <display_buffer+0x76>
			mem[i] = buf[i];
c0100a4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a50:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a57:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100a5a:	01 c2                	add    %eax,%edx
c0100a5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a5f:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a66:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a69:	01 c8                	add    %ecx,%eax
c0100a6b:	8b 00                	mov    (%eax),%eax
c0100a6d:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a6f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100a73:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c0100a7a:	7e ab                	jle    c0100a27 <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c0100a7c:	c9                   	leave  
c0100a7d:	c3                   	ret    

c0100a7e <sys_pr>:

void sys_pr(void *src)
{
c0100a7e:	55                   	push   %ebp
c0100a7f:	89 e5                	mov    %esp,%ebp
c0100a81:	57                   	push   %edi
c0100a82:	56                   	push   %esi
c0100a83:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c0100a84:	8b 1d 04 60 10 c0    	mov    0xc0106004,%ebx
c0100a8a:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c0100a8f:	8b 55 08             	mov    0x8(%ebp),%edx
c0100a92:	89 c1                	mov    %eax,%ecx
c0100a94:	89 d6                	mov    %edx,%esi
c0100a96:	89 df                	mov    %ebx,%edi
c0100a98:	fc                   	cld    
c0100a99:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c0100a9b:	5b                   	pop    %ebx
c0100a9c:	5e                   	pop    %esi
c0100a9d:	5f                   	pop    %edi
c0100a9e:	5d                   	pop    %ebp
c0100a9f:	c3                   	ret    

c0100aa0 <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c0100aa0:	55                   	push   %ebp
c0100aa1:	89 e5                	mov    %esp,%ebp
c0100aa3:	83 ec 40             	sub    $0x40,%esp
c0100aa6:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c0100aad:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c0100ab1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100ab5:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100ab8:	ee                   	out    %al,(%dx)
c0100ab9:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c0100ac0:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c0100ac4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100ac8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100acb:	ee                   	out    %al,(%dx)
c0100acc:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c0100ad3:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0100ad7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100adb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100ade:	ee                   	out    %al,(%dx)
c0100adf:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c0100ae6:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c0100aea:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100aee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100af1:	ee                   	out    %al,(%dx)
c0100af2:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c0100af9:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100afd:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100b01:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100b04:	ee                   	out    %al,(%dx)
c0100b05:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100b0c:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100b10:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100b14:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100b17:	ee                   	out    %al,(%dx)
c0100b18:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100b1f:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100b23:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100b27:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100b2a:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100b2b:	c9                   	leave  
c0100b2c:	c3                   	ret    

c0100b2d <serial_idle>:

static inline int serial_idle(void) {
c0100b2d:	55                   	push   %ebp
c0100b2e:	89 e5                	mov    %esp,%ebp
c0100b30:	83 ec 10             	sub    $0x10,%esp
c0100b33:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100b3a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100b3d:	89 c2                	mov    %eax,%edx
c0100b3f:	ec                   	in     (%dx),%al
c0100b40:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100b43:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100b47:	0f b6 c0             	movzbl %al,%eax
c0100b4a:	83 e0 20             	and    $0x20,%eax
c0100b4d:	85 c0                	test   %eax,%eax
c0100b4f:	0f 95 c0             	setne  %al
c0100b52:	0f b6 c0             	movzbl %al,%eax
}
c0100b55:	c9                   	leave  
c0100b56:	c3                   	ret    

c0100b57 <serial_printc>:

void serial_printc(int ch) {
c0100b57:	55                   	push   %ebp
c0100b58:	89 e5                	mov    %esp,%ebp
c0100b5a:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100b5d:	90                   	nop
c0100b5e:	e8 ca ff ff ff       	call   c0100b2d <serial_idle>
c0100b63:	85 c0                	test   %eax,%eax
c0100b65:	74 f7                	je     c0100b5e <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100b67:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b6a:	0f b6 c0             	movzbl %al,%eax
c0100b6d:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100b74:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100b77:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100b7b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100b7e:	ee                   	out    %al,(%dx)
}
c0100b7f:	c9                   	leave  
c0100b80:	c3                   	ret    

c0100b81 <putchar>:

void putchar(int ch){
c0100b81:	55                   	push   %ebp
c0100b82:	89 e5                	mov    %esp,%ebp
c0100b84:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100b87:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b8a:	89 04 24             	mov    %eax,(%esp)
c0100b8d:	e8 c5 ff ff ff       	call   c0100b57 <serial_printc>
c0100b92:	c9                   	leave  
c0100b93:	c3                   	ret    

c0100b94 <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100b94:	55                   	push   %ebp
c0100b95:	89 e5                	mov    %esp,%ebp
c0100b97:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100b9a:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100ba1:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100ba8:	7e 24                	jle    c0100bce <init_timer+0x3a>
c0100baa:	c7 44 24 0c 49 41 10 	movl   $0xc0104149,0xc(%esp)
c0100bb1:	c0 
c0100bb2:	c7 44 24 08 59 41 10 	movl   $0xc0104159,0x8(%esp)
c0100bb9:	c0 
c0100bba:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100bc1:	00 
c0100bc2:	c7 04 24 6e 41 10 c0 	movl   $0xc010416e,(%esp)
c0100bc9:	e8 f9 20 00 00       	call   c0102cc7 <_panic>
c0100bce:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100bd5:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100bd9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100bdd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100be0:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100be1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100be4:	99                   	cltd   
c0100be5:	c1 ea 18             	shr    $0x18,%edx
c0100be8:	01 d0                	add    %edx,%eax
c0100bea:	0f b6 c0             	movzbl %al,%eax
c0100bed:	29 d0                	sub    %edx,%eax
c0100bef:	0f b6 c0             	movzbl %al,%eax
c0100bf2:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100bf9:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100bfc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100c00:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100c03:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c07:	99                   	cltd   
c0100c08:	c1 ea 18             	shr    $0x18,%edx
c0100c0b:	01 d0                	add    %edx,%eax
c0100c0d:	c1 f8 08             	sar    $0x8,%eax
c0100c10:	0f b6 c0             	movzbl %al,%eax
c0100c13:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100c1a:	88 45 df             	mov    %al,-0x21(%ebp)
c0100c1d:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100c21:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100c24:	ee                   	out    %al,(%dx)
}
c0100c25:	c9                   	leave  
c0100c26:	c3                   	ret    

c0100c27 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0100c27:	55                   	push   %ebp
c0100c28:	89 e5                	mov    %esp,%ebp
c0100c2a:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0100c2d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0100c31:	75 24                	jne    c0100c57 <list_add+0x30>
c0100c33:	c7 44 24 0c 84 41 10 	movl   $0xc0104184,0xc(%esp)
c0100c3a:	c0 
c0100c3b:	c7 44 24 08 91 41 10 	movl   $0xc0104191,0x8(%esp)
c0100c42:	c0 
c0100c43:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0100c4a:	00 
c0100c4b:	c7 04 24 a6 41 10 c0 	movl   $0xc01041a6,(%esp)
c0100c52:	e8 70 20 00 00       	call   c0102cc7 <_panic>
	data->prev = prev;
c0100c57:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c5a:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c5d:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0100c5f:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c62:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c65:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0100c68:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c6c:	74 09                	je     c0100c77 <list_add+0x50>
c0100c6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c71:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c74:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0100c77:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100c7b:	74 08                	je     c0100c85 <list_add+0x5e>
c0100c7d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c80:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c83:	89 10                	mov    %edx,(%eax)
}
c0100c85:	c9                   	leave  
c0100c86:	c3                   	ret    

c0100c87 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0100c87:	55                   	push   %ebp
c0100c88:	89 e5                	mov    %esp,%ebp
c0100c8a:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100c8d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c91:	75 24                	jne    c0100cb7 <list_add_before+0x30>
c0100c93:	c7 44 24 0c bc 41 10 	movl   $0xc01041bc,0xc(%esp)
c0100c9a:	c0 
c0100c9b:	c7 44 24 08 91 41 10 	movl   $0xc0104191,0x8(%esp)
c0100ca2:	c0 
c0100ca3:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0100caa:	00 
c0100cab:	c7 04 24 a6 41 10 c0 	movl   $0xc01041a6,(%esp)
c0100cb2:	e8 10 20 00 00       	call   c0102cc7 <_panic>
	list_add(one->prev, one, data);
c0100cb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cba:	8b 00                	mov    (%eax),%eax
c0100cbc:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100cbf:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100cc3:	8b 55 08             	mov    0x8(%ebp),%edx
c0100cc6:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100cca:	89 04 24             	mov    %eax,(%esp)
c0100ccd:	e8 55 ff ff ff       	call   c0100c27 <list_add>
}
c0100cd2:	c9                   	leave  
c0100cd3:	c3                   	ret    

c0100cd4 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0100cd4:	55                   	push   %ebp
c0100cd5:	89 e5                	mov    %esp,%ebp
c0100cd7:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0100cda:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100cde:	75 24                	jne    c0100d04 <list_del+0x30>
c0100ce0:	c7 44 24 0c 84 41 10 	movl   $0xc0104184,0xc(%esp)
c0100ce7:	c0 
c0100ce8:	c7 44 24 08 91 41 10 	movl   $0xc0104191,0x8(%esp)
c0100cef:	c0 
c0100cf0:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0100cf7:	00 
c0100cf8:	c7 04 24 a6 41 10 c0 	movl   $0xc01041a6,(%esp)
c0100cff:	e8 c3 1f 00 00       	call   c0102cc7 <_panic>
	list *prev = data->prev;
c0100d04:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d07:	8b 00                	mov    (%eax),%eax
c0100d09:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0100d0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d0f:	8b 40 04             	mov    0x4(%eax),%eax
c0100d12:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0100d15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100d19:	74 09                	je     c0100d24 <list_del+0x50>
c0100d1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d1e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100d21:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0100d24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100d28:	74 08                	je     c0100d32 <list_del+0x5e>
c0100d2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100d2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100d30:	89 10                	mov    %edx,(%eax)
}
c0100d32:	c9                   	leave  
c0100d33:	c3                   	ret    

c0100d34 <list_init>:

static inline void
list_init(list *one) {
c0100d34:	55                   	push   %ebp
c0100d35:	89 e5                	mov    %esp,%ebp
c0100d37:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100d3a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100d3e:	75 24                	jne    c0100d64 <list_init+0x30>
c0100d40:	c7 44 24 0c bc 41 10 	movl   $0xc01041bc,0xc(%esp)
c0100d47:	c0 
c0100d48:	c7 44 24 08 91 41 10 	movl   $0xc0104191,0x8(%esp)
c0100d4f:	c0 
c0100d50:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0100d57:	00 
c0100d58:	c7 04 24 a6 41 10 c0 	movl   $0xc01041a6,(%esp)
c0100d5f:	e8 63 1f 00 00       	call   c0102cc7 <_panic>
	one->prev = one->next = one;
c0100d64:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d67:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d6a:	89 50 04             	mov    %edx,0x4(%eax)
c0100d6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d70:	8b 50 04             	mov    0x4(%eax),%edx
c0100d73:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d76:	89 10                	mov    %edx,(%eax)
}
c0100d78:	c9                   	leave  
c0100d79:	c3                   	ret    

c0100d7a <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100d7a:	55                   	push   %ebp
c0100d7b:	89 e5                	mov    %esp,%ebp
c0100d7d:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100d80:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d83:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100d88:	77 21                	ja     c0100dab <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100d8a:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d8d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100d91:	c7 44 24 08 c8 41 10 	movl   $0xc01041c8,0x8(%esp)
c0100d98:	c0 
c0100d99:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d9c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100da0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100da3:	89 04 24             	mov    %eax,(%esp)
c0100da6:	e8 1c 1f 00 00       	call   c0102cc7 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100dab:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dae:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100db3:	c9                   	leave  
c0100db4:	c3                   	ret    

c0100db5 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100db5:	55                   	push   %ebp
c0100db6:	89 e5                	mov    %esp,%ebp
c0100db8:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100dbb:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dbe:	c1 e8 0c             	shr    $0xc,%eax
c0100dc1:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100dc6:	76 21                	jbe    c0100de9 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100dc8:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dcb:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100dcf:	c7 44 24 08 ec 41 10 	movl   $0xc01041ec,0x8(%esp)
c0100dd6:	c0 
c0100dd7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100dda:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100dde:	8b 45 08             	mov    0x8(%ebp),%eax
c0100de1:	89 04 24             	mov    %eax,(%esp)
c0100de4:	e8 de 1e 00 00       	call   c0102cc7 <_panic>
	return (void *)(pa + KERNBASE);
c0100de9:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dec:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100df1:	c9                   	leave  
c0100df2:	c3                   	ret    

c0100df3 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100df3:	55                   	push   %ebp
c0100df4:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100df6:	8b 55 08             	mov    0x8(%ebp),%edx
c0100df9:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0100dfe:	29 c2                	sub    %eax,%edx
c0100e00:	89 d0                	mov    %edx,%eax
c0100e02:	c1 f8 03             	sar    $0x3,%eax
c0100e05:	c1 e0 0c             	shl    $0xc,%eax
}
c0100e08:	5d                   	pop    %ebp
c0100e09:	c3                   	ret    

c0100e0a <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100e0a:	55                   	push   %ebp
c0100e0b:	89 e5                	mov    %esp,%ebp
c0100e0d:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e13:	89 04 24             	mov    %eax,(%esp)
c0100e16:	e8 d8 ff ff ff       	call   c0100df3 <page2pa>
c0100e1b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100e1f:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100e26:	00 
c0100e27:	c7 04 24 0f 42 10 c0 	movl   $0xc010420f,(%esp)
c0100e2e:	e8 82 ff ff ff       	call   c0100db5 <_kaddr>
}
c0100e33:	c9                   	leave  
c0100e34:	c3                   	ret    

c0100e35 <pcb_init>:
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];


void pcb_init()
{
c0100e35:	55                   	push   %ebp
c0100e36:	89 e5                	mov    %esp,%ebp
c0100e38:	83 ec 28             	sub    $0x28,%esp
	/*int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}*/
	list_init(&ready);
c0100e3b:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100e42:	e8 ed fe ff ff       	call   c0100d34 <list_init>
	list_init(&block);
c0100e47:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0100e4e:	e8 e1 fe ff ff       	call   c0100d34 <list_init>
	list_init(&free);
c0100e53:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e5a:	e8 d5 fe ff ff       	call   c0100d34 <list_init>
	now=&ready;
c0100e5f:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0100e66:	4f 16 c0 
	pcbnow=&init;
c0100e69:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100e70:	3f 16 c0 
	init.pgdir=kern_pgdir;
c0100e73:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100e78:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100e7d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e84:	eb 48                	jmp    c0100ece <pcb_init+0x99>
		list_add_before(&free,&pcb[i].plist);
c0100e86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e89:	c1 e0 0c             	shl    $0xc,%eax
c0100e8c:	05 40 57 16 c0       	add    $0xc0165740,%eax
c0100e91:	83 c0 08             	add    $0x8,%eax
c0100e94:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100e98:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e9f:	e8 e3 fd ff ff       	call   c0100c87 <list_add_before>
		pcb[i].pid=i+1;
c0100ea4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ea7:	83 c0 01             	add    $0x1,%eax
c0100eaa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ead:	c1 e2 0c             	shl    $0xc,%edx
c0100eb0:	81 c2 50 57 16 c0    	add    $0xc0165750,%edx
c0100eb6:	89 02                	mov    %eax,(%edx)
		pcb[i].ppid=0;
c0100eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ebb:	c1 e0 0c             	shl    $0xc,%eax
c0100ebe:	05 50 57 16 c0       	add    $0xc0165750,%eax
c0100ec3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&free);
	now=&ready;
	pcbnow=&init;
	init.pgdir=kern_pgdir;
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100eca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ece:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0100ed2:	7e b2                	jle    c0100e86 <pcb_init+0x51>
		list_add_before(&free,&pcb[i].plist);
		pcb[i].pid=i+1;
		pcb[i].ppid=0;
	}
			
}
c0100ed4:	c9                   	leave  
c0100ed5:	c3                   	ret    

c0100ed6 <pcb_alloc>:

static uint32_t cntpid=0;
PCB* pcb_alloc()
{
c0100ed6:	55                   	push   %ebp
c0100ed7:	89 e5                	mov    %esp,%ebp
c0100ed9:	83 ec 38             	sub    $0x38,%esp
	/*
	PCB* p = pcb_free_list;
 	if (p == NULL) return NULL;*/
	list *lnext=&free;
c0100edc:	c7 45 f4 08 4f 16 c0 	movl   $0xc0164f08,-0xc(%ebp)
	list *freenext;
	if(lnext->next==lnext)
c0100ee3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ee6:	8b 40 04             	mov    0x4(%eax),%eax
c0100ee9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100eec:	75 11                	jne    c0100eff <pcb_alloc+0x29>
	{
		freenext=NULL;
c0100eee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		return NULL;
c0100ef5:	b8 00 00 00 00       	mov    $0x0,%eax
c0100efa:	e9 0f 01 00 00       	jmp    c010100e <pcb_alloc+0x138>
	}
	else
	{
		freenext=lnext->next;
c0100eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f02:	8b 40 04             	mov    0x4(%eax),%eax
c0100f05:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	PCB* p=list_entry(freenext,PCB,plist);
c0100f08:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f0b:	83 e8 08             	sub    $0x8,%eax
c0100f0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100f11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100f18:	e8 e1 0f 00 00       	call   c0101efe <page_alloc>
c0100f1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (pp == NULL) return NULL;
c0100f20:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0100f24:	75 0a                	jne    c0100f30 <pcb_alloc+0x5a>
c0100f26:	b8 00 00 00 00       	mov    $0x0,%eax
c0100f2b:	e9 de 00 00 00       	jmp    c010100e <pcb_alloc+0x138>
	p->pgdir = page2kva(pp);
c0100f30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f33:	89 04 24             	mov    %eax,(%esp)
c0100f36:	e8 cf fe ff ff       	call   c0100e0a <page2kva>
c0100f3b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f3e:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100f41:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f44:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100f48:	8d 50 01             	lea    0x1(%eax),%edx
c0100f4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f4e:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100f52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f55:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100f5c:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100f61:	8d 50 01             	lea    0x1(%eax),%edx
c0100f64:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100f6a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f6d:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100f70:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f73:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100f7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f7d:	83 c0 08             	add    $0x8,%eax
c0100f80:	89 04 24             	mov    %eax,(%esp)
c0100f83:	e8 4c fd ff ff       	call   c0100cd4 <list_del>
	list_add_before(&ready,&p->plist);
c0100f88:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f8b:	83 c0 08             	add    $0x8,%eax
c0100f8e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100f92:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100f99:	e8 e9 fc ff ff       	call   c0100c87 <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100f9e:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100fa4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fa7:	8b 40 04             	mov    0x4(%eax),%eax
c0100faa:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100fb1:	00 
c0100fb2:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100fb6:	89 04 24             	mov    %eax,(%esp)
c0100fb9:	e8 a0 22 00 00       	call   c010325e <memcpy>
	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	
c0100fbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fc1:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100fc6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100fc9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fcc:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100fd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fd6:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100fdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fe0:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fe9:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100fef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ff2:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0100ff9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ffc:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c0101003:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101006:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101009:	89 10                	mov    %edx,(%eax)
	return p;
c010100b:	8b 45 ec             	mov    -0x14(%ebp),%eax

}
c010100e:	c9                   	leave  
c010100f:	c3                   	ret    

c0101010 <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0101010:	55                   	push   %ebp
c0101011:	89 e5                	mov    %esp,%ebp
c0101013:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0101016:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101019:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010101c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010101f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101024:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0101027:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c010102e:	8b 45 10             	mov    0x10(%ebp),%eax
c0101031:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101034:	01 c2                	add    %eax,%edx
c0101036:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101039:	01 d0                	add    %edx,%eax
c010103b:	83 e8 01             	sub    $0x1,%eax
c010103e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101041:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101044:	ba 00 00 00 00       	mov    $0x0,%edx
c0101049:	f7 75 e8             	divl   -0x18(%ebp)
c010104c:	89 d0                	mov    %edx,%eax
c010104e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101051:	29 c2                	sub    %eax,%edx
c0101053:	89 d0                	mov    %edx,%eax
c0101055:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c0101058:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010105b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010105e:	eb 61                	jmp    c01010c1 <mm_malloc+0xb1>
		p = page_alloc(0);
c0101060:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101067:	e8 92 0e 00 00       	call   c0101efe <page_alloc>
c010106c:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c010106f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0101073:	75 24                	jne    c0101099 <mm_malloc+0x89>
c0101075:	c7 44 24 0c 25 42 10 	movl   $0xc0104225,0xc(%esp)
c010107c:	c0 
c010107d:	c7 44 24 08 91 41 10 	movl   $0xc0104191,0x8(%esp)
c0101084:	c0 
c0101085:	c7 44 24 04 59 00 00 	movl   $0x59,0x4(%esp)
c010108c:	00 
c010108d:	c7 04 24 2f 42 10 c0 	movl   $0xc010422f,(%esp)
c0101094:	e8 2e 1c 00 00       	call   c0102cc7 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0101099:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010109c:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c01010a3:	00 
c01010a4:	89 44 24 08          	mov    %eax,0x8(%esp)
c01010a8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01010ab:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010af:	8b 45 08             	mov    0x8(%ebp),%eax
c01010b2:	89 04 24             	mov    %eax,(%esp)
c01010b5:	e8 1e 15 00 00       	call   c01025d8 <page_insert>
{
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c01010ba:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01010c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010c4:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01010c7:	72 97                	jb     c0101060 <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c01010c9:	c9                   	leave  
c01010ca:	c3                   	ret    

c01010cb <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c01010cb:	55                   	push   %ebp
c01010cc:	89 e5                	mov    %esp,%ebp
c01010ce:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c01010d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010d4:	8b 55 08             	mov    0x8(%ebp),%edx
c01010d7:	01 d0                	add    %edx,%eax
c01010d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c01010dc:	8b 45 10             	mov    0x10(%ebp),%eax
c01010df:	c1 e8 09             	shr    $0x9,%eax
c01010e2:	83 c0 01             	add    $0x1,%eax
c01010e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c01010e8:	eb 6e                	jmp    c0101158 <readseg+0x8d>
		readsect(disks, sect);
c01010ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010ed:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010f1:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c01010f8:	e8 65 00 00 00       	call   c0101162 <readsect>
		uint32_t rem = offset & 0x1ff;
c01010fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0101100:	25 ff 01 00 00       	and    $0x1ff,%eax
c0101105:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c0101108:	b8 00 02 00 00       	mov    $0x200,%eax
c010110d:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0101110:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101113:	8b 45 08             	mov    0x8(%ebp),%eax
c0101116:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101119:	29 c2                	sub    %eax,%edx
c010111b:	89 d0                	mov    %edx,%eax
c010111d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101120:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101123:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101126:	39 d0                	cmp    %edx,%eax
c0101128:	76 02                	jbe    c010112c <readseg+0x61>
c010112a:	89 d0                	mov    %edx,%eax
c010112c:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c010112f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101132:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c0101138:	8b 45 08             	mov    0x8(%ebp),%eax
c010113b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010113e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101142:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101146:	89 04 24             	mov    %eax,(%esp)
c0101149:	e8 10 21 00 00       	call   c010325e <memcpy>
		va += size;
c010114e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101151:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c0101154:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c0101158:	8b 45 08             	mov    0x8(%ebp),%eax
c010115b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010115e:	72 8a                	jb     c01010ea <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c0101160:	c9                   	leave  
c0101161:	c3                   	ret    

c0101162 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c0101162:	55                   	push   %ebp
c0101163:	89 e5                	mov    %esp,%ebp
c0101165:	57                   	push   %edi
c0101166:	53                   	push   %ebx
c0101167:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010116a:	90                   	nop
c010116b:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101172:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101175:	89 c2                	mov    %eax,%edx
c0101177:	ec                   	in     (%dx),%al
c0101178:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c010117b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c010117f:	0f b6 c0             	movzbl %al,%eax
c0101182:	25 c0 00 00 00       	and    $0xc0,%eax
c0101187:	83 f8 40             	cmp    $0x40,%eax
c010118a:	75 df                	jne    c010116b <readsect+0x9>
c010118c:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c0101193:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0101197:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c010119b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010119e:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c010119f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011a2:	0f b6 c0             	movzbl %al,%eax
c01011a5:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c01011ac:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01011af:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01011b3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01011b6:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c01011b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011ba:	c1 e8 08             	shr    $0x8,%eax
c01011bd:	0f b6 c0             	movzbl %al,%eax
c01011c0:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c01011c7:	88 45 db             	mov    %al,-0x25(%ebp)
c01011ca:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01011ce:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011d1:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c01011d2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011d5:	c1 e8 10             	shr    $0x10,%eax
c01011d8:	0f b6 c0             	movzbl %al,%eax
c01011db:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c01011e2:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01011e5:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01011e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01011ec:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c01011ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011f0:	c1 e8 18             	shr    $0x18,%eax
c01011f3:	83 c8 e0             	or     $0xffffffe0,%eax
c01011f6:	0f b6 c0             	movzbl %al,%eax
c01011f9:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c0101200:	88 45 cb             	mov    %al,-0x35(%ebp)
c0101203:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0101207:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010120a:	ee                   	out    %al,(%dx)
c010120b:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101212:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c0101216:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010121a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c010121d:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010121e:	90                   	nop
c010121f:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101226:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0101229:	89 c2                	mov    %eax,%edx
c010122b:	ec                   	in     (%dx),%al
c010122c:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c010122f:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0101233:	0f b6 c0             	movzbl %al,%eax
c0101236:	25 c0 00 00 00       	and    $0xc0,%eax
c010123b:	83 f8 40             	cmp    $0x40,%eax
c010123e:	75 df                	jne    c010121f <readsect+0xbd>
c0101240:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c0101247:	8b 45 08             	mov    0x8(%ebp),%eax
c010124a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010124d:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c0101254:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0101257:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c010125a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010125d:	89 cb                	mov    %ecx,%ebx
c010125f:	89 df                	mov    %ebx,%edi
c0101261:	89 c1                	mov    %eax,%ecx
c0101263:	fc                   	cld    
c0101264:	f2 6d                	repnz insl (%dx),%es:(%edi)
c0101266:	89 c8                	mov    %ecx,%eax
c0101268:	89 fb                	mov    %edi,%ebx
c010126a:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c010126d:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c0101270:	83 c4 50             	add    $0x50,%esp
c0101273:	5b                   	pop    %ebx
c0101274:	5f                   	pop    %edi
c0101275:	5d                   	pop    %ebp
c0101276:	c3                   	ret    

c0101277 <pcb_new>:

void pcb_new()
{
c0101277:	55                   	push   %ebp
c0101278:	89 e5                	mov    %esp,%ebp
c010127a:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c010127d:	e8 54 fc ff ff       	call   c0100ed6 <pcb_alloc>
c0101282:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c0101285:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101289:	75 05                	jne    c0101290 <pcb_new+0x19>
c010128b:	e9 8b 01 00 00       	jmp    c010141b <pcb_new+0x1a4>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c0101290:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c0101297:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010129a:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c01012a1:	00 
c01012a2:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01012a9:	00 
c01012aa:	89 04 24             	mov    %eax,(%esp)
c01012ad:	e8 19 fe ff ff       	call   c01010cb <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c01012b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012b5:	8b 00                	mov    (%eax),%eax
c01012b7:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c01012bc:	74 24                	je     c01012e2 <pcb_new+0x6b>
c01012be:	c7 44 24 0c 42 42 10 	movl   $0xc0104242,0xc(%esp)
c01012c5:	c0 
c01012c6:	c7 44 24 08 91 41 10 	movl   $0xc0104191,0x8(%esp)
c01012cd:	c0 
c01012ce:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c01012d5:	00 
c01012d6:	c7 04 24 2f 42 10 c0 	movl   $0xc010422f,(%esp)
c01012dd:	e8 e5 19 00 00       	call   c0102cc7 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c01012e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012e5:	8b 50 1c             	mov    0x1c(%eax),%edx
c01012e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012eb:	01 d0                	add    %edx,%eax
c01012ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c01012f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012f3:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01012f7:	0f b7 c0             	movzwl %ax,%eax
c01012fa:	c1 e0 05             	shl    $0x5,%eax
c01012fd:	89 c2                	mov    %eax,%edx
c01012ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101302:	01 d0                	add    %edx,%eax
c0101304:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c0101307:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010130a:	8b 40 04             	mov    0x4(%eax),%eax
c010130d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101311:	c7 44 24 04 86 00 00 	movl   $0x86,0x4(%esp)
c0101318:	00 
c0101319:	c7 04 24 2f 42 10 c0 	movl   $0xc010422f,(%esp)
c0101320:	e8 55 fa ff ff       	call   c0100d7a <_paddr>
c0101325:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0101328:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010132b:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) 
c010132e:	e9 8a 00 00 00       	jmp    c01013bd <pcb_new+0x146>
	{
		if (ph -> p_type != ELF_PROG_LOAD) 
c0101333:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101336:	8b 00                	mov    (%eax),%eax
c0101338:	83 f8 01             	cmp    $0x1,%eax
c010133b:	74 02                	je     c010133f <pcb_new+0xc8>
			continue;
c010133d:	eb 7a                	jmp    c01013b9 <pcb_new+0x142>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c010133f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101342:	8b 48 14             	mov    0x14(%eax),%ecx
c0101345:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101348:	8b 50 08             	mov    0x8(%eax),%edx
c010134b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010134e:	8b 40 04             	mov    0x4(%eax),%eax
c0101351:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0101355:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101359:	89 04 24             	mov    %eax,(%esp)
c010135c:	e8 af fc ff ff       	call   c0101010 <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c0101361:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101364:	8b 40 04             	mov    0x4(%eax),%eax
c0101367:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c010136d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101370:	8b 50 10             	mov    0x10(%eax),%edx
c0101373:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101376:	8b 40 08             	mov    0x8(%eax),%eax
c0101379:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010137d:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101381:	89 04 24             	mov    %eax,(%esp)
c0101384:	e8 42 fd ff ff       	call   c01010cb <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c0101389:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010138c:	8b 50 14             	mov    0x14(%eax),%edx
c010138f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101392:	8b 40 10             	mov    0x10(%eax),%eax
c0101395:	29 c2                	sub    %eax,%edx
c0101397:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010139a:	8b 48 08             	mov    0x8(%eax),%ecx
c010139d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013a0:	8b 40 10             	mov    0x10(%eax),%eax
c01013a3:	01 c8                	add    %ecx,%eax
c01013a5:	89 54 24 08          	mov    %edx,0x8(%esp)
c01013a9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01013b0:	00 
c01013b1:	89 04 24             	mov    %eax,(%esp)
c01013b4:	e8 c2 1e 00 00       	call   c010327b <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) 
c01013b9:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01013bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013c0:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01013c3:	0f 82 6a ff ff ff    	jb     c0101333 <pcb_new+0xbc>
			continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf->e_entry;
c01013c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013cc:	8b 00                	mov    (%eax),%eax
c01013ce:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01013d1:	8b 52 18             	mov    0x18(%edx),%edx
c01013d4:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP-USTACKSIZE, USTACKSIZE);
c01013d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013da:	8b 40 04             	mov    0x4(%eax),%eax
c01013dd:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c01013e4:	00 
c01013e5:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c01013ec:	be 
c01013ed:	89 04 24             	mov    %eax,(%esp)
c01013f0:	e8 1b fc ff ff       	call   c0101010 <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c01013f5:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01013fa:	89 44 24 08          	mov    %eax,0x8(%esp)
c01013fe:	c7 44 24 04 91 00 00 	movl   $0x91,0x4(%esp)
c0101405:	00 
c0101406:	c7 04 24 2f 42 10 c0 	movl   $0xc010422f,(%esp)
c010140d:	e8 68 f9 ff ff       	call   c0100d7a <_paddr>
c0101412:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101415:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101418:	0f 22 d8             	mov    %eax,%cr3
}
c010141b:	c9                   	leave  
c010141c:	c3                   	ret    

c010141d <pcb_deepcopy>:

void pcb_deepcopy(PCB *fa,PCB *tb)
{
c010141d:	55                   	push   %ebp
c010141e:	89 e5                	mov    %esp,%ebp
c0101420:	53                   	push   %ebx
c0101421:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);//get the addr for the information of process
c0101424:	c7 45 f4 2c 00 00 00 	movl   $0x2c,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c010142b:	b8 00 10 00 00       	mov    $0x1000,%eax
c0101430:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0101433:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c0101436:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101439:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c010143c:	8b 55 08             	mov    0x8(%ebp),%edx
c010143f:	01 d1                	add    %edx,%ecx
c0101441:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c0101444:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101447:	01 da                	add    %ebx,%edx
c0101449:	89 44 24 08          	mov    %eax,0x8(%esp)
c010144d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101451:	89 14 24             	mov    %edx,(%esp)
c0101454:	e8 05 1e 00 00       	call   c010325e <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c0101459:	8b 45 08             	mov    0x8(%ebp),%eax
c010145c:	8b 00                	mov    (%eax),%eax
c010145e:	89 c2                	mov    %eax,%edx
c0101460:	8b 45 08             	mov    0x8(%ebp),%eax
c0101463:	29 c2                	sub    %eax,%edx
c0101465:	89 d0                	mov    %edx,%eax
c0101467:	89 c2                	mov    %eax,%edx
c0101469:	8b 45 0c             	mov    0xc(%ebp),%eax
c010146c:	01 c2                	add    %eax,%edx
c010146e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101471:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c0101473:	8b 45 08             	mov    0x8(%ebp),%eax
c0101476:	8b 50 18             	mov    0x18(%eax),%edx
c0101479:	8b 45 0c             	mov    0xc(%ebp),%eax
c010147c:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c010147f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101482:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101485:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101488:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c010148b:	8b 45 08             	mov    0x8(%ebp),%eax
c010148e:	8b 50 20             	mov    0x20(%eax),%edx
c0101491:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101494:	89 50 20             	mov    %edx,0x20(%eax)
	pg_copy(fa->pgdir,tb->pgdir);//written in pmap.c
c0101497:	8b 45 0c             	mov    0xc(%ebp),%eax
c010149a:	8b 50 04             	mov    0x4(%eax),%edx
c010149d:	8b 45 08             	mov    0x8(%ebp),%eax
c01014a0:	8b 40 04             	mov    0x4(%eax),%eax
c01014a3:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014a7:	89 04 24             	mov    %eax,(%esp)
c01014aa:	e8 e0 0b 00 00       	call   c010208f <pg_copy>
}
c01014af:	83 c4 24             	add    $0x24,%esp
c01014b2:	5b                   	pop    %ebx
c01014b3:	5d                   	pop    %ebp
c01014b4:	c3                   	ret    

c01014b5 <pcb_shallowcopy>:

void pcb_shallowcopy(PCB *fa,PCB *tb)
{
c01014b5:	55                   	push   %ebp
c01014b6:	89 e5                	mov    %esp,%ebp
c01014b8:	53                   	push   %ebx
c01014b9:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);
c01014bc:	c7 45 f4 2c 00 00 00 	movl   $0x2c,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c01014c3:	b8 00 10 00 00       	mov    $0x1000,%eax
c01014c8:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01014cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c01014ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014d1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c01014d4:	8b 55 08             	mov    0x8(%ebp),%edx
c01014d7:	01 d1                	add    %edx,%ecx
c01014d9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c01014dc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01014df:	01 da                	add    %ebx,%edx
c01014e1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01014e5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01014e9:	89 14 24             	mov    %edx,(%esp)
c01014ec:	e8 6d 1d 00 00       	call   c010325e <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c01014f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01014f4:	8b 00                	mov    (%eax),%eax
c01014f6:	89 c2                	mov    %eax,%edx
c01014f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01014fb:	29 c2                	sub    %eax,%edx
c01014fd:	89 d0                	mov    %edx,%eax
c01014ff:	89 c2                	mov    %eax,%edx
c0101501:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101504:	01 c2                	add    %eax,%edx
c0101506:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101509:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c010150b:	8b 45 08             	mov    0x8(%ebp),%eax
c010150e:	8b 50 18             	mov    0x18(%eax),%edx
c0101511:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101514:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c0101517:	8b 45 08             	mov    0x8(%ebp),%eax
c010151a:	8b 50 1c             	mov    0x1c(%eax),%edx
c010151d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101520:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c0101523:	8b 45 08             	mov    0x8(%ebp),%eax
c0101526:	8b 50 20             	mov    0x20(%eax),%edx
c0101529:	8b 45 0c             	mov    0xc(%ebp),%eax
c010152c:	89 50 20             	mov    %edx,0x20(%eax)
	pg_scopy(fa->pgdir,tb->pgdir);	
c010152f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101532:	8b 50 04             	mov    0x4(%eax),%edx
c0101535:	8b 45 08             	mov    0x8(%ebp),%eax
c0101538:	8b 40 04             	mov    0x4(%eax),%eax
c010153b:	89 54 24 04          	mov    %edx,0x4(%esp)
c010153f:	89 04 24             	mov    %eax,(%esp)
c0101542:	e8 41 0d 00 00       	call   c0102288 <pg_scopy>
}
c0101547:	83 c4 24             	add    $0x24,%esp
c010154a:	5b                   	pop    %ebx
c010154b:	5d                   	pop    %ebp
c010154c:	c3                   	ret    

c010154d <pcb_remove>:

void pcb_remove(PCB *p)
{
c010154d:	55                   	push   %ebp
c010154e:	89 e5                	mov    %esp,%ebp
c0101550:	83 ec 18             	sub    $0x18,%esp
	pg_remove(p->pgdir);
c0101553:	8b 45 08             	mov    0x8(%ebp),%eax
c0101556:	8b 40 04             	mov    0x4(%eax),%eax
c0101559:	89 04 24             	mov    %eax,(%esp)
c010155c:	e8 c4 0e 00 00       	call   c0102425 <pg_remove>
}
c0101561:	c9                   	leave  
c0101562:	c3                   	ret    

c0101563 <kthread>:

int kthread(void *addr)
{
c0101563:	55                   	push   %ebp
c0101564:	89 e5                	mov    %esp,%ebp
c0101566:	83 ec 28             	sub    $0x28,%esp
	PCB *p=pcb_alloc();
c0101569:	e8 68 f9 ff ff       	call   c0100ed6 <pcb_alloc>
c010156e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	pcb_shallowcopy(pcbnow,p);
c0101571:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101576:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101579:	89 54 24 04          	mov    %edx,0x4(%esp)
c010157d:	89 04 24             	mov    %eax,(%esp)
c0101580:	e8 30 ff ff ff       	call   c01014b5 <pcb_shallowcopy>
	mm_malloc(p->pgdir,USTACKTOP-USTACKSIZE,USTACKSIZE);
c0101585:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101588:	8b 40 04             	mov    0x4(%eax),%eax
c010158b:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101592:	00 
c0101593:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c010159a:	be 
c010159b:	89 04 24             	mov    %eax,(%esp)
c010159e:	e8 6d fa ff ff       	call   c0101010 <mm_malloc>
	int *temp=(int*)(USTACKTOP-8);
c01015a3:	c7 45 f0 f8 df ff be 	movl   $0xbeffdff8,-0x10(%ebp)
	*temp=0x0;
c01015aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015ad:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	TrapFrame *tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);
c01015b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015b6:	05 ac 0f 00 00       	add    $0xfac,%eax
c01015bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
	tf->eip=(uint32_t)addr;
c01015be:	8b 55 08             	mov    0x8(%ebp),%edx
c01015c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01015c4:	89 50 38             	mov    %edx,0x38(%eax)
	tf->esp=USTACKTOP-12;
c01015c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01015ca:	c7 40 44 f4 df ff be 	movl   $0xbeffdff4,0x44(%eax)
	return 0;
c01015d1:	b8 00 00 00 00       	mov    $0x0,%eax
}
c01015d6:	c9                   	leave  
c01015d7:	c3                   	ret    

c01015d8 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01015d8:	55                   	push   %ebp
c01015d9:	89 e5                	mov    %esp,%ebp
c01015db:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01015de:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01015e2:	75 24                	jne    c0101608 <list_add+0x30>
c01015e4:	c7 44 24 0c 5c 42 10 	movl   $0xc010425c,0xc(%esp)
c01015eb:	c0 
c01015ec:	c7 44 24 08 69 42 10 	movl   $0xc0104269,0x8(%esp)
c01015f3:	c0 
c01015f4:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c01015fb:	00 
c01015fc:	c7 04 24 7e 42 10 c0 	movl   $0xc010427e,(%esp)
c0101603:	e8 bf 16 00 00       	call   c0102cc7 <_panic>
	data->prev = prev;
c0101608:	8b 45 10             	mov    0x10(%ebp),%eax
c010160b:	8b 55 08             	mov    0x8(%ebp),%edx
c010160e:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101610:	8b 45 10             	mov    0x10(%ebp),%eax
c0101613:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101616:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101619:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010161d:	74 09                	je     c0101628 <list_add+0x50>
c010161f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101622:	8b 55 10             	mov    0x10(%ebp),%edx
c0101625:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101628:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010162c:	74 08                	je     c0101636 <list_add+0x5e>
c010162e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101631:	8b 55 10             	mov    0x10(%ebp),%edx
c0101634:	89 10                	mov    %edx,(%eax)
}
c0101636:	c9                   	leave  
c0101637:	c3                   	ret    

c0101638 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101638:	55                   	push   %ebp
c0101639:	89 e5                	mov    %esp,%ebp
c010163b:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c010163e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101642:	75 24                	jne    c0101668 <list_add_before+0x30>
c0101644:	c7 44 24 0c 94 42 10 	movl   $0xc0104294,0xc(%esp)
c010164b:	c0 
c010164c:	c7 44 24 08 69 42 10 	movl   $0xc0104269,0x8(%esp)
c0101653:	c0 
c0101654:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c010165b:	00 
c010165c:	c7 04 24 7e 42 10 c0 	movl   $0xc010427e,(%esp)
c0101663:	e8 5f 16 00 00       	call   c0102cc7 <_panic>
	list_add(one->prev, one, data);
c0101668:	8b 45 08             	mov    0x8(%ebp),%eax
c010166b:	8b 00                	mov    (%eax),%eax
c010166d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101670:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101674:	8b 55 08             	mov    0x8(%ebp),%edx
c0101677:	89 54 24 04          	mov    %edx,0x4(%esp)
c010167b:	89 04 24             	mov    %eax,(%esp)
c010167e:	e8 55 ff ff ff       	call   c01015d8 <list_add>
}
c0101683:	c9                   	leave  
c0101684:	c3                   	ret    

c0101685 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0101685:	55                   	push   %ebp
c0101686:	89 e5                	mov    %esp,%ebp
c0101688:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c010168b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010168f:	75 24                	jne    c01016b5 <list_del+0x30>
c0101691:	c7 44 24 0c 5c 42 10 	movl   $0xc010425c,0xc(%esp)
c0101698:	c0 
c0101699:	c7 44 24 08 69 42 10 	movl   $0xc0104269,0x8(%esp)
c01016a0:	c0 
c01016a1:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c01016a8:	00 
c01016a9:	c7 04 24 7e 42 10 c0 	movl   $0xc010427e,(%esp)
c01016b0:	e8 12 16 00 00       	call   c0102cc7 <_panic>
	list *prev = data->prev;
c01016b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01016b8:	8b 00                	mov    (%eax),%eax
c01016ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01016bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01016c0:	8b 40 04             	mov    0x4(%eax),%eax
c01016c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01016c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01016ca:	74 09                	je     c01016d5 <list_del+0x50>
c01016cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016cf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01016d2:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01016d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01016d9:	74 08                	je     c01016e3 <list_del+0x5e>
c01016db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016de:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01016e1:	89 10                	mov    %edx,(%eax)
}
c01016e3:	c9                   	leave  
c01016e4:	c3                   	ret    

c01016e5 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01016e5:	55                   	push   %ebp
c01016e6:	89 e5                	mov    %esp,%ebp
c01016e8:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01016eb:	8b 45 10             	mov    0x10(%ebp),%eax
c01016ee:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01016f3:	77 21                	ja     c0101716 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01016f5:	8b 45 10             	mov    0x10(%ebp),%eax
c01016f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01016fc:	c7 44 24 08 a0 42 10 	movl   $0xc01042a0,0x8(%esp)
c0101703:	c0 
c0101704:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101707:	89 44 24 04          	mov    %eax,0x4(%esp)
c010170b:	8b 45 08             	mov    0x8(%ebp),%eax
c010170e:	89 04 24             	mov    %eax,(%esp)
c0101711:	e8 b1 15 00 00       	call   c0102cc7 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101716:	8b 45 10             	mov    0x10(%ebp),%eax
c0101719:	05 00 00 00 40       	add    $0x40000000,%eax
}
c010171e:	c9                   	leave  
c010171f:	c3                   	ret    

c0101720 <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
c0101720:	55                   	push   %ebp
c0101721:	89 e5                	mov    %esp,%ebp
c0101723:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c0101726:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010172b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c010172e:	e8 a3 f7 ff ff       	call   c0100ed6 <pcb_alloc>
c0101733:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_deepcopy(fa,ch);//written in pcb.c
c0101736:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101739:	89 44 24 04          	mov    %eax,0x4(%esp)
c010173d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101740:	89 04 24             	mov    %eax,(%esp)
c0101743:	e8 d5 fc ff ff       	call   c010141d <pcb_deepcopy>
	ch->ppid=fa->pid;
c0101748:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010174b:	8b 50 10             	mov    0x10(%eax),%edx
c010174e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101751:	89 50 14             	mov    %edx,0x14(%eax)
	(fa->tf)->eax=ch->pid;
c0101754:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101757:	8b 00                	mov    (%eax),%eax
c0101759:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010175c:	8b 52 10             	mov    0x10(%edx),%edx
c010175f:	89 50 1c             	mov    %edx,0x1c(%eax)
	(ch->tf)->eax=0;
c0101762:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101765:	8b 00                	mov    (%eax),%eax
c0101767:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c010176e:	c9                   	leave  
c010176f:	c3                   	ret    

c0101770 <sys_getpid>:

uint32_t sys_getpid(){
c0101770:	55                   	push   %ebp
c0101771:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c0101773:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101778:	8b 40 10             	mov    0x10(%eax),%eax
}
c010177b:	5d                   	pop    %ebp
c010177c:	c3                   	ret    

c010177d <sys_exit>:

void sys_exit(int suc){
c010177d:	55                   	push   %ebp
c010177e:	89 e5                	mov    %esp,%ebp
c0101780:	83 ec 28             	sub    $0x28,%esp
	if(suc==0)
c0101783:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101787:	75 1a                	jne    c01017a3 <sys_exit+0x26>
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
c0101789:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010178e:	8b 40 10             	mov    0x10(%eax),%eax
c0101791:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101795:	c7 04 24 c4 42 10 c0 	movl   $0xc01042c4,(%esp)
c010179c:	e8 55 16 00 00       	call   c0102df6 <printk>
c01017a1:	eb 18                	jmp    c01017bb <sys_exit+0x3e>
	else
		printk("Not teminate the process of pid %d!!!\n",pcbnow->pid);
c01017a3:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017a8:	8b 40 10             	mov    0x10(%eax),%eax
c01017ab:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017af:	c7 04 24 f4 42 10 c0 	movl   $0xc01042f4,(%esp)
c01017b6:	e8 3b 16 00 00       	call   c0102df6 <printk>
	list *lnext;
	list *t=&ready;
c01017bb:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01017c2:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017c7:	8b 40 04             	mov    0x4(%eax),%eax
c01017ca:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01017cd:	75 22                	jne    c01017f1 <sys_exit+0x74>
 	{
		if(t->next==now)
c01017cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017d2:	8b 50 04             	mov    0x4(%eax),%edx
c01017d5:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017da:	39 c2                	cmp    %eax,%edx
c01017dc:	75 08                	jne    c01017e6 <sys_exit+0x69>
			lnext=t;
c01017de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01017e4:	eb 2f                	jmp    c0101815 <sys_exit+0x98>
		else
			lnext=t->next;
c01017e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017e9:	8b 40 04             	mov    0x4(%eax),%eax
c01017ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01017ef:	eb 24                	jmp    c0101815 <sys_exit+0x98>
	}
	else
	{
		if(now->next==now)
c01017f1:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017f6:	8b 50 04             	mov    0x4(%eax),%edx
c01017f9:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017fe:	39 c2                	cmp    %eax,%edx
c0101800:	75 08                	jne    c010180a <sys_exit+0x8d>
			lnext=t;
c0101802:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101805:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101808:	eb 0b                	jmp    c0101815 <sys_exit+0x98>
		else
			lnext=now->next;
c010180a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010180f:	8b 40 04             	mov    0x4(%eax),%eax
c0101812:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c0101815:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010181a:	89 04 24             	mov    %eax,(%esp)
c010181d:	e8 63 fe ff ff       	call   c0101685 <list_del>
	list_add_before(&free,now);
c0101822:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101827:	89 44 24 04          	mov    %eax,0x4(%esp)
c010182b:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0101832:	e8 01 fe ff ff       	call   c0101638 <list_add_before>
	lcr3(PADDR(kern_pgdir));
c0101837:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010183c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101840:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
c0101847:	00 
c0101848:	c7 04 24 1b 43 10 c0 	movl   $0xc010431b,(%esp)
c010184f:	e8 91 fe ff ff       	call   c01016e5 <_paddr>
c0101854:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101857:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010185a:	0f 22 d8             	mov    %eax,%cr3
	pcb_remove(pcbnow);
c010185d:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101862:	89 04 24             	mov    %eax,(%esp)
c0101865:	e8 e3 fc ff ff       	call   c010154d <pcb_remove>
	now=lnext;
c010186a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010186d:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c0101872:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101877:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c010187c:	75 0c                	jne    c010188a <sys_exit+0x10d>
		pcbnow=&init;
c010187e:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0101885:	3f 16 c0 
c0101888:	eb 0d                	jmp    c0101897 <sys_exit+0x11a>
	else
		pcbnow=list_entry(now,PCB,plist);
c010188a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010188f:	83 e8 08             	sub    $0x8,%eax
c0101892:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c0101897:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010189c:	05 f8 0f 00 00       	add    $0xff8,%eax
c01018a1:	89 04 24             	mov    %eax,(%esp)
c01018a4:	e8 0d 13 00 00       	call   c0102bb6 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01018a9:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01018ae:	8b 40 04             	mov    0x4(%eax),%eax
c01018b1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01018b5:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01018bc:	00 
c01018bd:	c7 04 24 1b 43 10 c0 	movl   $0xc010431b,(%esp)
c01018c4:	e8 1c fe ff ff       	call   c01016e5 <_paddr>
c01018c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01018cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01018cf:	0f 22 d8             	mov    %eax,%cr3
}
c01018d2:	c9                   	leave  
c01018d3:	c3                   	ret    

c01018d4 <sys_sleep>:

void sys_sleep(int time){
c01018d4:	55                   	push   %ebp
c01018d5:	89 e5                	mov    %esp,%ebp
c01018d7:	83 ec 28             	sub    $0x28,%esp
	list *lnext;
	list *t=&ready;
c01018da:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01018e1:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018e6:	8b 40 04             	mov    0x4(%eax),%eax
c01018e9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01018ec:	75 22                	jne    c0101910 <sys_sleep+0x3c>
	{
		if(t->next==now)
c01018ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01018f1:	8b 50 04             	mov    0x4(%eax),%edx
c01018f4:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018f9:	39 c2                	cmp    %eax,%edx
c01018fb:	75 08                	jne    c0101905 <sys_sleep+0x31>
			lnext=t;
c01018fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101900:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101903:	eb 2f                	jmp    c0101934 <sys_sleep+0x60>
		else
			lnext=t->next;
c0101905:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101908:	8b 40 04             	mov    0x4(%eax),%eax
c010190b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010190e:	eb 24                	jmp    c0101934 <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c0101910:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101915:	8b 50 04             	mov    0x4(%eax),%edx
c0101918:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010191d:	39 c2                	cmp    %eax,%edx
c010191f:	75 08                	jne    c0101929 <sys_sleep+0x55>
			lnext=t;
c0101921:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101924:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101927:	eb 0b                	jmp    c0101934 <sys_sleep+0x60>
		else
			lnext=now->next;
c0101929:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010192e:	8b 40 04             	mov    0x4(%eax),%eax
c0101931:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c0101934:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101939:	89 04 24             	mov    %eax,(%esp)
c010193c:	e8 44 fd ff ff       	call   c0101685 <list_del>
	list_add_before(&block,now);
c0101941:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101946:	89 44 24 04          	mov    %eax,0x4(%esp)
c010194a:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0101951:	e8 e2 fc ff ff       	call   c0101638 <list_add_before>
	pcbnow->state=BLOCKED;
c0101956:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010195b:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c0101962:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c0101968:	8b 45 08             	mov    0x8(%ebp),%eax
c010196b:	c1 e0 02             	shl    $0x2,%eax
c010196e:	89 c1                	mov    %eax,%ecx
c0101970:	c1 e1 04             	shl    $0x4,%ecx
c0101973:	29 c1                	sub    %eax,%ecx
c0101975:	89 c8                	mov    %ecx,%eax
c0101977:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=lnext;
c010197a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010197d:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c0101982:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101987:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c010198c:	75 0c                	jne    c010199a <sys_sleep+0xc6>
		pcbnow=&init;
c010198e:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0101995:	3f 16 c0 
c0101998:	eb 0d                	jmp    c01019a7 <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c010199a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010199f:	83 e8 08             	sub    $0x8,%eax
c01019a2:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01019a7:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01019ac:	05 f8 0f 00 00       	add    $0xff8,%eax
c01019b1:	89 04 24             	mov    %eax,(%esp)
c01019b4:	e8 fd 11 00 00       	call   c0102bb6 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01019b9:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01019be:	8b 40 04             	mov    0x4(%eax),%eax
c01019c1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01019c5:	c7 44 24 04 53 00 00 	movl   $0x53,0x4(%esp)
c01019cc:	00 
c01019cd:	c7 04 24 1b 43 10 c0 	movl   $0xc010431b,(%esp)
c01019d4:	e8 0c fd ff ff       	call   c01016e5 <_paddr>
c01019d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01019dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01019df:	0f 22 d8             	mov    %eax,%cr3
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
c01019e2:	c9                   	leave  
c01019e3:	c3                   	ret    

c01019e4 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01019e4:	55                   	push   %ebp
c01019e5:	89 e5                	mov    %esp,%ebp
c01019e7:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01019ea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01019ee:	75 24                	jne    c0101a14 <list_add+0x30>
c01019f0:	c7 44 24 0c 34 43 10 	movl   $0xc0104334,0xc(%esp)
c01019f7:	c0 
c01019f8:	c7 44 24 08 41 43 10 	movl   $0xc0104341,0x8(%esp)
c01019ff:	c0 
c0101a00:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0101a07:	00 
c0101a08:	c7 04 24 56 43 10 c0 	movl   $0xc0104356,(%esp)
c0101a0f:	e8 b3 12 00 00       	call   c0102cc7 <_panic>
	data->prev = prev;
c0101a14:	8b 45 10             	mov    0x10(%ebp),%eax
c0101a17:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a1a:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101a1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0101a1f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a22:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101a25:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a29:	74 09                	je     c0101a34 <list_add+0x50>
c0101a2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a2e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a31:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101a34:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101a38:	74 08                	je     c0101a42 <list_add+0x5e>
c0101a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a3d:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a40:	89 10                	mov    %edx,(%eax)
}
c0101a42:	c9                   	leave  
c0101a43:	c3                   	ret    

c0101a44 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101a44:	55                   	push   %ebp
c0101a45:	89 e5                	mov    %esp,%ebp
c0101a47:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101a4a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a4e:	75 24                	jne    c0101a74 <list_add_before+0x30>
c0101a50:	c7 44 24 0c 6c 43 10 	movl   $0xc010436c,0xc(%esp)
c0101a57:	c0 
c0101a58:	c7 44 24 08 41 43 10 	movl   $0xc0104341,0x8(%esp)
c0101a5f:	c0 
c0101a60:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0101a67:	00 
c0101a68:	c7 04 24 56 43 10 c0 	movl   $0xc0104356,(%esp)
c0101a6f:	e8 53 12 00 00       	call   c0102cc7 <_panic>
	list_add(one->prev, one, data);
c0101a74:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a77:	8b 00                	mov    (%eax),%eax
c0101a79:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a7c:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a80:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a83:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101a87:	89 04 24             	mov    %eax,(%esp)
c0101a8a:	e8 55 ff ff ff       	call   c01019e4 <list_add>
}
c0101a8f:	c9                   	leave  
c0101a90:	c3                   	ret    

c0101a91 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0101a91:	55                   	push   %ebp
c0101a92:	89 e5                	mov    %esp,%ebp
c0101a94:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0101a97:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a9b:	75 24                	jne    c0101ac1 <list_del+0x30>
c0101a9d:	c7 44 24 0c 34 43 10 	movl   $0xc0104334,0xc(%esp)
c0101aa4:	c0 
c0101aa5:	c7 44 24 08 41 43 10 	movl   $0xc0104341,0x8(%esp)
c0101aac:	c0 
c0101aad:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0101ab4:	00 
c0101ab5:	c7 04 24 56 43 10 c0 	movl   $0xc0104356,(%esp)
c0101abc:	e8 06 12 00 00       	call   c0102cc7 <_panic>
	list *prev = data->prev;
c0101ac1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ac4:	8b 00                	mov    (%eax),%eax
c0101ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0101ac9:	8b 45 08             	mov    0x8(%ebp),%eax
c0101acc:	8b 40 04             	mov    0x4(%eax),%eax
c0101acf:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0101ad2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101ad6:	74 09                	je     c0101ae1 <list_del+0x50>
c0101ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101adb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ade:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0101ae1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101ae5:	74 08                	je     c0101aef <list_del+0x5e>
c0101ae7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101aea:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101aed:	89 10                	mov    %edx,(%eax)
}
c0101aef:	c9                   	leave  
c0101af0:	c3                   	ret    

c0101af1 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c0101af1:	55                   	push   %ebp
c0101af2:	89 e5                	mov    %esp,%ebp
c0101af4:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101af7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101afb:	75 24                	jne    c0101b21 <list_empty+0x30>
c0101afd:	c7 44 24 0c 6c 43 10 	movl   $0xc010436c,0xc(%esp)
c0101b04:	c0 
c0101b05:	c7 44 24 08 41 43 10 	movl   $0xc0104341,0x8(%esp)
c0101b0c:	c0 
c0101b0d:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0101b14:	00 
c0101b15:	c7 04 24 56 43 10 c0 	movl   $0xc0104356,(%esp)
c0101b1c:	e8 a6 11 00 00       	call   c0102cc7 <_panic>
	return one == one->next;
c0101b21:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b24:	8b 40 04             	mov    0x4(%eax),%eax
c0101b27:	3b 45 08             	cmp    0x8(%ebp),%eax
c0101b2a:	0f 94 c0             	sete   %al
c0101b2d:	0f b6 c0             	movzbl %al,%eax
}
c0101b30:	c9                   	leave  
c0101b31:	c3                   	ret    

c0101b32 <ksem_init>:
#include "common.h"
#include "list.h"
#include "pcb.h"

int ksem_init(Sema *sema,int value)
{
c0101b32:	55                   	push   %ebp
c0101b33:	89 e5                	mov    %esp,%ebp
	sema->value=value;
c0101b35:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b38:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101b3b:	89 10                	mov    %edx,(%eax)
	sema->link=0;
c0101b3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b40:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	return 0;
c0101b47:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101b4c:	5d                   	pop    %ebp
c0101b4d:	c3                   	ret    

c0101b4e <ksem_destroy>:

int ksem_destroy(Sema *sema)
{
c0101b4e:	55                   	push   %ebp
c0101b4f:	89 e5                	mov    %esp,%ebp
c0101b51:	83 ec 28             	sub    $0x28,%esp
	sema->value=-1;
c0101b54:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b57:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
	sema->link=0;
c0101b5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b60:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list *one;
	list_foreach(one,&sema->wait)
c0101b67:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b6a:	8b 40 0c             	mov    0xc(%eax),%eax
c0101b6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101b70:	eb 27                	jmp    c0101b99 <ksem_destroy+0x4b>
	{
		list_del(one);
c0101b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b75:	89 04 24             	mov    %eax,(%esp)
c0101b78:	e8 14 ff ff ff       	call   c0101a91 <list_del>
		list_add_before(&ready,one);	
c0101b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b80:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101b84:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101b8b:	e8 b4 fe ff ff       	call   c0101a44 <list_add_before>
int ksem_destroy(Sema *sema)
{
	sema->value=-1;
	sema->link=0;
	list *one;
	list_foreach(one,&sema->wait)
c0101b90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b93:	8b 40 04             	mov    0x4(%eax),%eax
c0101b96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b9c:	83 c0 08             	add    $0x8,%eax
c0101b9f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0101ba2:	75 ce                	jne    c0101b72 <ksem_destroy+0x24>
	{
		list_del(one);
		list_add_before(&ready,one);	
	}
	list_del(&sema->wait);
c0101ba4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ba7:	83 c0 08             	add    $0x8,%eax
c0101baa:	89 04 24             	mov    %eax,(%esp)
c0101bad:	e8 df fe ff ff       	call   c0101a91 <list_del>
	return 0;
c0101bb2:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101bb7:	c9                   	leave  
c0101bb8:	c3                   	ret    

c0101bb9 <ksem_wait>:

int ksem_wait(Sema *sema)
{
c0101bb9:	55                   	push   %ebp
c0101bba:	89 e5                	mov    %esp,%ebp
c0101bbc:	83 ec 18             	sub    $0x18,%esp
	if(sema->value>0)
c0101bbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bc2:	8b 00                	mov    (%eax),%eax
c0101bc4:	85 c0                	test   %eax,%eax
c0101bc6:	7e 14                	jle    c0101bdc <ksem_wait+0x23>
	{
		sema->value--;
c0101bc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bcb:	8b 00                	mov    (%eax),%eax
c0101bcd:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101bd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bd3:	89 10                	mov    %edx,(%eax)
		return 0;
c0101bd5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bda:	eb 30                	jmp    c0101c0c <ksem_wait+0x53>
	}
	else{
		list_del(&pcbnow->slist);
c0101bdc:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101be1:	83 c0 24             	add    $0x24,%eax
c0101be4:	89 04 24             	mov    %eax,(%esp)
c0101be7:	e8 a5 fe ff ff       	call   c0101a91 <list_del>
		list_add_before(&sema->wait,&pcbnow);
c0101bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bef:	83 c0 08             	add    $0x8,%eax
c0101bf2:	c7 44 24 04 e0 3e 16 	movl   $0xc0163ee0,0x4(%esp)
c0101bf9:	c0 
c0101bfa:	89 04 24             	mov    %eax,(%esp)
c0101bfd:	e8 42 fe ff ff       	call   c0101a44 <list_add_before>
		schedule();
c0101c02:	e8 d6 0c 00 00       	call   c01028dd <schedule>
	}
	return -1;
c0101c07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
c0101c0c:	c9                   	leave  
c0101c0d:	c3                   	ret    

c0101c0e <ksem_trywait>:

int ksem_trywait(Sema *sema)
{
c0101c0e:	55                   	push   %ebp
c0101c0f:	89 e5                	mov    %esp,%ebp
	if(sema->value>0)
c0101c11:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c14:	8b 00                	mov    (%eax),%eax
c0101c16:	85 c0                	test   %eax,%eax
c0101c18:	7e 14                	jle    c0101c2e <ksem_trywait+0x20>
	{
		sema->value--;
c0101c1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c1d:	8b 00                	mov    (%eax),%eax
c0101c1f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c22:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c25:	89 10                	mov    %edx,(%eax)
		return 0;
c0101c27:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c2c:	eb 05                	jmp    c0101c33 <ksem_trywait+0x25>
	}
	else{
		return -1;
c0101c2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
}
c0101c33:	5d                   	pop    %ebp
c0101c34:	c3                   	ret    

c0101c35 <ksem_post>:

int ksem_post(Sema *sema)
{
c0101c35:	55                   	push   %ebp
c0101c36:	89 e5                	mov    %esp,%ebp
c0101c38:	83 ec 28             	sub    $0x28,%esp
	if(list_empty(&sema->wait)){
c0101c3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c3e:	83 c0 08             	add    $0x8,%eax
c0101c41:	89 04 24             	mov    %eax,(%esp)
c0101c44:	e8 a8 fe ff ff       	call   c0101af1 <list_empty>
c0101c49:	85 c0                	test   %eax,%eax
c0101c4b:	74 0f                	je     c0101c5c <ksem_post+0x27>
		sema->value++;
c0101c4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c50:	8b 00                	mov    (%eax),%eax
c0101c52:	8d 50 01             	lea    0x1(%eax),%edx
c0101c55:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c58:	89 10                	mov    %edx,(%eax)
c0101c5a:	eb 2c                	jmp    c0101c88 <ksem_post+0x53>
	}
	else{
		list *one=sema->wait.next;
c0101c5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c5f:	8b 40 0c             	mov    0xc(%eax),%eax
c0101c62:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(one);
c0101c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c68:	89 04 24             	mov    %eax,(%esp)
c0101c6b:	e8 21 fe ff ff       	call   c0101a91 <list_del>
		list_add_before(&ready,one);
c0101c70:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c73:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c77:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101c7e:	e8 c1 fd ff ff       	call   c0101a44 <list_add_before>
		schedule();
c0101c83:	e8 55 0c 00 00       	call   c01028dd <schedule>
	}
}
c0101c88:	c9                   	leave  
c0101c89:	c3                   	ret    

c0101c8a <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101c8a:	55                   	push   %ebp
c0101c8b:	89 e5                	mov    %esp,%ebp
c0101c8d:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101c90:	8b 45 10             	mov    0x10(%ebp),%eax
c0101c93:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101c98:	77 21                	ja     c0101cbb <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101c9a:	8b 45 10             	mov    0x10(%ebp),%eax
c0101c9d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101ca1:	c7 44 24 08 78 43 10 	movl   $0xc0104378,0x8(%esp)
c0101ca8:	c0 
c0101ca9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cac:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cb3:	89 04 24             	mov    %eax,(%esp)
c0101cb6:	e8 0c 10 00 00       	call   c0102cc7 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101cbb:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cbe:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101cc3:	c9                   	leave  
c0101cc4:	c3                   	ret    

c0101cc5 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0101cc5:	55                   	push   %ebp
c0101cc6:	89 e5                	mov    %esp,%ebp
c0101cc8:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101ccb:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cce:	c1 e8 0c             	shr    $0xc,%eax
c0101cd1:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101cd6:	76 21                	jbe    c0101cf9 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0101cd8:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cdb:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101cdf:	c7 44 24 08 9c 43 10 	movl   $0xc010439c,0x8(%esp)
c0101ce6:	c0 
c0101ce7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cea:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101cee:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cf1:	89 04 24             	mov    %eax,(%esp)
c0101cf4:	e8 ce 0f 00 00       	call   c0102cc7 <_panic>
	return (void *)(pa + KERNBASE);
c0101cf9:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cfc:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0101d01:	c9                   	leave  
c0101d02:	c3                   	ret    

c0101d03 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0101d03:	55                   	push   %ebp
c0101d04:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0101d06:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d09:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0101d0e:	29 c2                	sub    %eax,%edx
c0101d10:	89 d0                	mov    %edx,%eax
c0101d12:	c1 f8 03             	sar    $0x3,%eax
c0101d15:	c1 e0 0c             	shl    $0xc,%eax
}
c0101d18:	5d                   	pop    %ebp
c0101d19:	c3                   	ret    

c0101d1a <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c0101d1a:	55                   	push   %ebp
c0101d1b:	89 e5                	mov    %esp,%ebp
c0101d1d:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101d20:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d23:	c1 e8 0c             	shr    $0xc,%eax
c0101d26:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101d2b:	76 1c                	jbe    c0101d49 <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c0101d2d:	c7 44 24 08 c0 43 10 	movl   $0xc01043c0,0x8(%esp)
c0101d34:	c0 
c0101d35:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c0101d3c:	00 
c0101d3d:	c7 04 24 df 43 10 c0 	movl   $0xc01043df,(%esp)
c0101d44:	e8 7e 0f 00 00       	call   c0102cc7 <_panic>
	return &pages[PGNUM(pa)];
c0101d49:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d4c:	c1 e8 0c             	shr    $0xc,%eax
c0101d4f:	c1 e0 03             	shl    $0x3,%eax
c0101d52:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c0101d57:	c9                   	leave  
c0101d58:	c3                   	ret    

c0101d59 <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c0101d59:	55                   	push   %ebp
c0101d5a:	89 e5                	mov    %esp,%ebp
c0101d5c:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101d5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d62:	89 04 24             	mov    %eax,(%esp)
c0101d65:	e8 99 ff ff ff       	call   c0101d03 <page2pa>
c0101d6a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d6e:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0101d75:	00 
c0101d76:	c7 04 24 df 43 10 c0 	movl   $0xc01043df,(%esp)
c0101d7d:	e8 43 ff ff ff       	call   c0101cc5 <_kaddr>
}
c0101d82:	c9                   	leave  
c0101d83:	c3                   	ret    

c0101d84 <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c0101d84:	55                   	push   %ebp
c0101d85:	89 e5                	mov    %esp,%ebp
c0101d87:	53                   	push   %ebx
c0101d88:	83 ec 44             	sub    $0x44,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
c0101d8b:	c7 45 e8 00 30 13 c0 	movl   $0xc0133000,-0x18(%ebp)
	pte_t *pgta=kpgtable;
c0101d92:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101d99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101da0:	eb 40                	jmp    c0101de2 <page_init+0x5e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
c0101da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101da5:	05 00 03 00 00       	add    $0x300,%eax
c0101daa:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101db1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101db4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101db7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101dba:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101dbe:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101dc5:	00 
c0101dc6:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0101dcd:	e8 b8 fe ff ff       	call   c0101c8a <_paddr>
c0101dd2:	83 c8 03             	or     $0x3,%eax
c0101dd5:	89 03                	mov    %eax,(%ebx)
		pgta+=NPTENTRIES;
c0101dd7:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
	pte_t *pgta=kpgtable;
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101dde:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101de2:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101de6:	7e ba                	jle    c0101da2 <page_init+0x1e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
c0101de8:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgta--;
c0101def:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (;pframe>=0; pframe-=PGSIZE){
c0101df3:	eb 18                	jmp    c0101e0d <page_init+0x89>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
c0101df5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101df8:	83 c8 07             	or     $0x7,%eax
c0101dfb:	89 c2                	mov    %eax,%edx
c0101dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e00:	89 10                	mov    %edx,(%eax)
		pgta--;
c0101e02:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
	pgta--;
	for (;pframe>=0; pframe-=PGSIZE){
c0101e06:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c0101e0d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101e11:	79 e2                	jns    c0101df5 <page_init+0x71>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
c0101e13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e16:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c0101e1b:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101e20:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e24:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c0101e2b:	00 
c0101e2c:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0101e33:	e8 52 fe ff ff       	call   c0101c8a <_paddr>
c0101e38:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101e3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101e3e:	0f 22 d8             	mov    %eax,%cr3
	for (i=0;i<0x400;i++) {
c0101e41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e48:	eb 11                	jmp    c0101e5b <page_init+0xd7>
		pages[i].pp_ref = 1;
c0101e4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e4d:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c0101e54:	c0 01 00 
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
c0101e57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e5b:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101e62:	7e e6                	jle    c0101e4a <page_init+0xc6>
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101e64:	c7 45 f4 ff 7f 00 00 	movl   $0x7fff,-0xc(%ebp)
c0101e6b:	eb 31                	jmp    c0101e9e <page_init+0x11a>
		pages[i].pp_ref = 0;
c0101e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e70:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101e77:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101e7a:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e83:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101e8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e8d:	c1 e0 03             	shl    $0x3,%eax
c0101e90:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101e95:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101e9a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0101e9e:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101ea5:	7f c6                	jg     c0101e6d <page_init+0xe9>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101ea7:	c7 45 e4 00 10 00 00 	movl   $0x1000,-0x1c(%ebp)
c0101eae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101eb1:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101eb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101eb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ebc:	ba 00 00 00 00       	mov    $0x0,%edx
c0101ec1:	f7 75 e4             	divl   -0x1c(%ebp)
c0101ec4:	89 d0                	mov    %edx,%eax
c0101ec6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101ec9:	29 c2                	sub    %eax,%edx
c0101ecb:	89 d0                	mov    %edx,%eax
c0101ecd:	89 c2                	mov    %eax,%edx
c0101ecf:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101ed4:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101edb:	00 
c0101edc:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101ee3:	00 
c0101ee4:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101ee8:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101eef:	00 
c0101ef0:	89 04 24             	mov    %eax,(%esp)
c0101ef3:	e8 7b 06 00 00       	call   c0102573 <boot_map_region>
}
c0101ef8:	83 c4 44             	add    $0x44,%esp
c0101efb:	5b                   	pop    %ebx
c0101efc:	5d                   	pop    %ebp
c0101efd:	c3                   	ret    

c0101efe <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101efe:	55                   	push   %ebp
c0101eff:	89 e5                	mov    %esp,%ebp
c0101f01:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101f04:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101f09:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101f0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101f10:	75 07                	jne    c0101f19 <page_alloc+0x1b>
c0101f12:	b8 00 00 00 00       	mov    $0x0,%eax
c0101f17:	eb 45                	jmp    c0101f5e <page_alloc+0x60>
	page_free_list = page_free_list -> pp_link;
c0101f19:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101f1e:	8b 00                	mov    (%eax),%eax
c0101f20:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	if (alloc_flags & ALLOC_ZERO) {
c0101f25:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f28:	83 e0 01             	and    $0x1,%eax
c0101f2b:	85 c0                	test   %eax,%eax
c0101f2d:	74 23                	je     c0101f52 <page_alloc+0x54>
		memset(page2kva(p), 0, PGSIZE);
c0101f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f32:	89 04 24             	mov    %eax,(%esp)
c0101f35:	e8 1f fe ff ff       	call   c0101d59 <page2kva>
c0101f3a:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101f41:	00 
c0101f42:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101f49:	00 
c0101f4a:	89 04 24             	mov    %eax,(%esp)
c0101f4d:	e8 29 13 00 00       	call   c010327b <memset>
	}
	p -> pp_link = NULL;
c0101f52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f55:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101f5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101f5e:	c9                   	leave  
c0101f5f:	c3                   	ret    

c0101f60 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101f60:	55                   	push   %ebp
c0101f61:	89 e5                	mov    %esp,%ebp
	pp->pp_link = page_free_list;
c0101f63:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101f69:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f6c:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f71:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101f76:	5d                   	pop    %ebp
c0101f77:	c3                   	ret    

c0101f78 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0101f78:	55                   	push   %ebp
c0101f79:	89 e5                	mov    %esp,%ebp
c0101f7b:	83 ec 04             	sub    $0x4,%esp
	if (--pp->pp_ref == 0)
c0101f7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f81:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101f85:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101f88:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f8b:	66 89 50 04          	mov    %dx,0x4(%eax)
c0101f8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f92:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101f96:	66 85 c0             	test   %ax,%ax
c0101f99:	75 0b                	jne    c0101fa6 <page_decref+0x2e>
		page_free(pp);
c0101f9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f9e:	89 04 24             	mov    %eax,(%esp)
c0101fa1:	e8 ba ff ff ff       	call   c0101f60 <page_free>
}
c0101fa6:	c9                   	leave  
c0101fa7:	c3                   	ret    

c0101fa8 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0101fa8:	55                   	push   %ebp
c0101fa9:	89 e5                	mov    %esp,%ebp
c0101fab:	53                   	push   %ebx
c0101fac:	83 ec 24             	sub    $0x24,%esp
	pte_t *t=NULL;
c0101faf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (pgdir[PDX(va)] & PTE_P) {
c0101fb6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fb9:	c1 e8 16             	shr    $0x16,%eax
c0101fbc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101fc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fc6:	01 d0                	add    %edx,%eax
c0101fc8:	8b 00                	mov    (%eax),%eax
c0101fca:	83 e0 01             	and    $0x1,%eax
c0101fcd:	85 c0                	test   %eax,%eax
c0101fcf:	74 36                	je     c0102007 <pgdir_walk+0x5f>
		t = KADDR(PTE_ADDR(pgdir[PDX(va)]));
c0101fd1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fd4:	c1 e8 16             	shr    $0x16,%eax
c0101fd7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101fde:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fe1:	01 d0                	add    %edx,%eax
c0101fe3:	8b 00                	mov    (%eax),%eax
c0101fe5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101fea:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101fee:	c7 44 24 04 a3 00 00 	movl   $0xa3,0x4(%esp)
c0101ff5:	00 
c0101ff6:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0101ffd:	e8 c3 fc ff ff       	call   c0101cc5 <_kaddr>
c0102002:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102005:	eb 6b                	jmp    c0102072 <pgdir_walk+0xca>
	}
	else {
		if (create == false) 
c0102007:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010200b:	75 07                	jne    c0102014 <pgdir_walk+0x6c>
			return NULL;
c010200d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102012:	eb 75                	jmp    c0102089 <pgdir_walk+0xe1>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0102014:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010201b:	e8 de fe ff ff       	call   c0101efe <page_alloc>
c0102020:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (p == NULL) 
c0102023:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102027:	75 07                	jne    c0102030 <pgdir_walk+0x88>
			return NULL;
c0102029:	b8 00 00 00 00       	mov    $0x0,%eax
c010202e:	eb 59                	jmp    c0102089 <pgdir_walk+0xe1>
		p -> pp_ref ++;
c0102030:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102033:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102037:	8d 50 01             	lea    0x1(%eax),%edx
c010203a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010203d:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[PDX(va)] = page2pa(p) | PTE_P | PTE_W | PTE_U;
c0102041:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102044:	c1 e8 16             	shr    $0x16,%eax
c0102047:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010204e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102051:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0102054:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102057:	89 04 24             	mov    %eax,(%esp)
c010205a:	e8 a4 fc ff ff       	call   c0101d03 <page2pa>
c010205f:	83 c8 07             	or     $0x7,%eax
c0102062:	89 03                	mov    %eax,(%ebx)
		t=page2kva(p);
c0102064:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102067:	89 04 24             	mov    %eax,(%esp)
c010206a:	e8 ea fc ff ff       	call   c0101d59 <page2kva>
c010206f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	return &t[PTX(va)];
c0102072:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102075:	c1 e8 0c             	shr    $0xc,%eax
c0102078:	25 ff 03 00 00       	and    $0x3ff,%eax
c010207d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102084:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102087:	01 d0                	add    %edx,%eax
}
c0102089:	83 c4 24             	add    $0x24,%esp
c010208c:	5b                   	pop    %ebx
c010208d:	5d                   	pop    %ebp
c010208e:	c3                   	ret    

c010208f <pg_copy>:


void 
pg_copy(pde_t *fa, pde_t *tb)
{
c010208f:	55                   	push   %ebp
c0102090:	89 e5                	mov    %esp,%ebp
c0102092:	53                   	push   %ebx
c0102093:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c0102096:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010209d:	e9 d3 01 00 00       	jmp    c0102275 <pg_copy+0x1e6>
		if (fa[i]&PTE_P){	
c01020a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020a5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01020af:	01 d0                	add    %edx,%eax
c01020b1:	8b 00                	mov    (%eax),%eax
c01020b3:	83 e0 01             	and    $0x1,%eax
c01020b6:	85 c0                	test   %eax,%eax
c01020b8:	0f 84 b3 01 00 00    	je     c0102271 <pg_copy+0x1e2>
			if (tb[i]&PTE_P) 
c01020be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020c1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020cb:	01 d0                	add    %edx,%eax
c01020cd:	8b 00                	mov    (%eax),%eax
c01020cf:	83 e0 01             	and    $0x1,%eax
c01020d2:	85 c0                	test   %eax,%eax
c01020d4:	74 05                	je     c01020db <pg_copy+0x4c>
				continue;
c01020d6:	e9 96 01 00 00       	jmp    c0102271 <pg_copy+0x1e2>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c01020db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020de:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01020e8:	01 d0                	add    %edx,%eax
c01020ea:	8b 00                	mov    (%eax),%eax
c01020ec:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01020f1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01020f5:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
c01020fc:	00 
c01020fd:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0102104:	e8 bc fb ff ff       	call   c0101cc5 <_kaddr>
c0102109:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c010210c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102113:	e8 e6 fd ff ff       	call   c0101efe <page_alloc>
c0102118:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c010211b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010211e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102122:	8d 50 01             	lea    0x1(%eax),%edx
c0102125:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102128:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c010212c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010212f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102136:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102139:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010213c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010213f:	89 04 24             	mov    %eax,(%esp)
c0102142:	e8 bc fb ff ff       	call   c0101d03 <page2pa>
c0102147:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010214a:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0102151:	8b 55 08             	mov    0x8(%ebp),%edx
c0102154:	01 ca                	add    %ecx,%edx
c0102156:	8b 12                	mov    (%edx),%edx
c0102158:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c010215e:	09 d0                	or     %edx,%eax
c0102160:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c0102162:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102165:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010216c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010216f:	01 d0                	add    %edx,%eax
c0102171:	8b 00                	mov    (%eax),%eax
c0102173:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102178:	89 44 24 08          	mov    %eax,0x8(%esp)
c010217c:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c0102183:	00 
c0102184:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c010218b:	e8 35 fb ff ff       	call   c0101cc5 <_kaddr>
c0102190:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c0102193:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010219a:	e9 c5 00 00 00       	jmp    c0102264 <pg_copy+0x1d5>
				if (fat[j]&PTE_P){ 
c010219f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021a2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01021a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021ac:	01 d0                	add    %edx,%eax
c01021ae:	8b 00                	mov    (%eax),%eax
c01021b0:	83 e0 01             	and    $0x1,%eax
c01021b3:	85 c0                	test   %eax,%eax
c01021b5:	0f 84 a5 00 00 00    	je     c0102260 <pg_copy+0x1d1>
					p = page_alloc(0);
c01021bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01021c2:	e8 37 fd ff ff       	call   c0101efe <page_alloc>
c01021c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c01021ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021cd:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01021d1:	8d 50 01             	lea    0x1(%eax),%edx
c01021d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021d7:	66 89 50 04          	mov    %dx,0x4(%eax)
					tbt[j] = page2pa(p)|(fat[j]&0xFFF);
c01021db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021de:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01021e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01021e8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01021eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021ee:	89 04 24             	mov    %eax,(%esp)
c01021f1:	e8 0d fb ff ff       	call   c0101d03 <page2pa>
c01021f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01021f9:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0102200:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102203:	01 ca                	add    %ecx,%edx
c0102205:	8b 12                	mov    (%edx),%edx
c0102207:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c010220d:	09 d0                	or     %edx,%eax
c010220f:	89 03                	mov    %eax,(%ebx)
					memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
c0102211:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102214:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010221b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010221e:	01 d0                	add    %edx,%eax
c0102220:	8b 00                	mov    (%eax),%eax
c0102222:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102227:	89 44 24 08          	mov    %eax,0x8(%esp)
c010222b:	c7 44 24 04 c5 00 00 	movl   $0xc5,0x4(%esp)
c0102232:	00 
c0102233:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c010223a:	e8 86 fa ff ff       	call   c0101cc5 <_kaddr>
c010223f:	89 c3                	mov    %eax,%ebx
c0102241:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102244:	89 04 24             	mov    %eax,(%esp)
c0102247:	e8 0d fb ff ff       	call   c0101d59 <page2kva>
c010224c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0102253:	00 
c0102254:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0102258:	89 04 24             	mov    %eax,(%esp)
c010225b:	e8 fe 0f 00 00       	call   c010325e <memcpy>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c0102260:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102264:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c010226b:	0f 8e 2e ff ff ff    	jle    c010219f <pg_copy+0x110>

void 
pg_copy(pde_t *fa, pde_t *tb)
{
	int i, j;
	for (i=0;i<1024;i++){
c0102271:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102275:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c010227c:	0f 8e 20 fe ff ff    	jle    c01020a2 <pg_copy+0x13>
					memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
				}
			}
		}
	}
}
c0102282:	83 c4 34             	add    $0x34,%esp
c0102285:	5b                   	pop    %ebx
c0102286:	5d                   	pop    %ebp
c0102287:	c3                   	ret    

c0102288 <pg_scopy>:

void 
pg_scopy(pde_t *fa, pde_t *tb)
{
c0102288:	55                   	push   %ebp
c0102289:	89 e5                	mov    %esp,%ebp
c010228b:	53                   	push   %ebx
c010228c:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c010228f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102296:	e9 77 01 00 00       	jmp    c0102412 <pg_scopy+0x18a>
		if (fa[i]&PTE_P){	
c010229b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010229e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01022a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01022a8:	01 d0                	add    %edx,%eax
c01022aa:	8b 00                	mov    (%eax),%eax
c01022ac:	83 e0 01             	and    $0x1,%eax
c01022af:	85 c0                	test   %eax,%eax
c01022b1:	0f 84 57 01 00 00    	je     c010240e <pg_scopy+0x186>
			if (tb[i]&PTE_P) 
c01022b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022ba:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01022c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022c4:	01 d0                	add    %edx,%eax
c01022c6:	8b 00                	mov    (%eax),%eax
c01022c8:	83 e0 01             	and    $0x1,%eax
c01022cb:	85 c0                	test   %eax,%eax
c01022cd:	74 05                	je     c01022d4 <pg_scopy+0x4c>
				continue;
c01022cf:	e9 3a 01 00 00       	jmp    c010240e <pg_scopy+0x186>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c01022d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022d7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01022de:	8b 45 08             	mov    0x8(%ebp),%eax
c01022e1:	01 d0                	add    %edx,%eax
c01022e3:	8b 00                	mov    (%eax),%eax
c01022e5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01022ea:	89 44 24 08          	mov    %eax,0x8(%esp)
c01022ee:	c7 44 24 04 d4 00 00 	movl   $0xd4,0x4(%esp)
c01022f5:	00 
c01022f6:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c01022fd:	e8 c3 f9 ff ff       	call   c0101cc5 <_kaddr>
c0102302:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c0102305:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010230c:	e8 ed fb ff ff       	call   c0101efe <page_alloc>
c0102311:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c0102314:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102317:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010231b:	8d 50 01             	lea    0x1(%eax),%edx
c010231e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102321:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c0102325:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102328:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010232f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102332:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0102335:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102338:	89 04 24             	mov    %eax,(%esp)
c010233b:	e8 c3 f9 ff ff       	call   c0101d03 <page2pa>
c0102340:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102343:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c010234a:	8b 55 08             	mov    0x8(%ebp),%edx
c010234d:	01 ca                	add    %ecx,%edx
c010234f:	8b 12                	mov    (%edx),%edx
c0102351:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0102357:	09 d0                	or     %edx,%eax
c0102359:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c010235b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010235e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102365:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102368:	01 d0                	add    %edx,%eax
c010236a:	8b 00                	mov    (%eax),%eax
c010236c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102371:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102375:	c7 44 24 04 d8 00 00 	movl   $0xd8,0x4(%esp)
c010237c:	00 
c010237d:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0102384:	e8 3c f9 ff ff       	call   c0101cc5 <_kaddr>
c0102389:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c010238c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102393:	eb 70                	jmp    c0102405 <pg_scopy+0x17d>
				if (fat[j]&PTE_P){ 
c0102395:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102398:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010239f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023a2:	01 d0                	add    %edx,%eax
c01023a4:	8b 00                	mov    (%eax),%eax
c01023a6:	83 e0 01             	and    $0x1,%eax
c01023a9:	85 c0                	test   %eax,%eax
c01023ab:	74 54                	je     c0102401 <pg_scopy+0x179>
					p=pa2page(PTE_ADDR(fat[j]));
c01023ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023b0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023ba:	01 d0                	add    %edx,%eax
c01023bc:	8b 00                	mov    (%eax),%eax
c01023be:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01023c3:	89 04 24             	mov    %eax,(%esp)
c01023c6:	e8 4f f9 ff ff       	call   c0101d1a <pa2page>
c01023cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c01023ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01023d1:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01023d5:	8d 50 01             	lea    0x1(%eax),%edx
c01023d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01023db:	66 89 50 04          	mov    %dx,0x4(%eax)
					tbt[j] = fat[j];
c01023df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023e2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01023ec:	01 c2                	add    %eax,%edx
c01023ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023f1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c01023f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023fb:	01 c8                	add    %ecx,%eax
c01023fd:	8b 00                	mov    (%eax),%eax
c01023ff:	89 02                	mov    %eax,(%edx)
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c0102401:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102405:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c010240c:	7e 87                	jle    c0102395 <pg_scopy+0x10d>

void 
pg_scopy(pde_t *fa, pde_t *tb)
{
	int i, j;
	for (i=0;i<1024;i++){
c010240e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102412:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0102419:	0f 8e 7c fe ff ff    	jle    c010229b <pg_scopy+0x13>
					tbt[j] = fat[j];
				}
			}
		}
	}
}
c010241f:	83 c4 34             	add    $0x34,%esp
c0102422:	5b                   	pop    %ebx
c0102423:	5d                   	pop    %ebp
c0102424:	c3                   	ret    

c0102425 <pg_remove>:

void 
pg_remove(pde_t *pgdir)
{
c0102425:	55                   	push   %ebp
c0102426:	89 e5                	mov    %esp,%ebp
c0102428:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for (i=0; i<1024;i++) {
c010242b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102432:	e9 fb 00 00 00       	jmp    c0102532 <pg_remove+0x10d>
		if (pgdir[i]&PTE_P) {
c0102437:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010243a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102441:	8b 45 08             	mov    0x8(%ebp),%eax
c0102444:	01 d0                	add    %edx,%eax
c0102446:	8b 00                	mov    (%eax),%eax
c0102448:	83 e0 01             	and    $0x1,%eax
c010244b:	85 c0                	test   %eax,%eax
c010244d:	0f 84 db 00 00 00    	je     c010252e <pg_remove+0x109>
			if (kern_pgdir[i]&PTE_P) 
c0102453:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0102458:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010245b:	c1 e2 02             	shl    $0x2,%edx
c010245e:	01 d0                	add    %edx,%eax
c0102460:	8b 00                	mov    (%eax),%eax
c0102462:	83 e0 01             	and    $0x1,%eax
c0102465:	85 c0                	test   %eax,%eax
c0102467:	74 05                	je     c010246e <pg_remove+0x49>
				continue;
c0102469:	e9 c0 00 00 00       	jmp    c010252e <pg_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
c010246e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102471:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102478:	8b 45 08             	mov    0x8(%ebp),%eax
c010247b:	01 d0                	add    %edx,%eax
c010247d:	8b 00                	mov    (%eax),%eax
c010247f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102484:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102488:	c7 44 24 04 ec 00 00 	movl   $0xec,0x4(%esp)
c010248f:	00 
c0102490:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0102497:	e8 29 f8 ff ff       	call   c0101cc5 <_kaddr>
c010249c:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (j=0; j<NPTENTRIES;j++){
c010249f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01024a6:	eb 42                	jmp    c01024ea <pg_remove+0xc5>
				if (pgtable[j]&PTE_P){
c01024a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024ab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01024b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024b5:	01 d0                	add    %edx,%eax
c01024b7:	8b 00                	mov    (%eax),%eax
c01024b9:	83 e0 01             	and    $0x1,%eax
c01024bc:	85 c0                	test   %eax,%eax
c01024be:	74 26                	je     c01024e6 <pg_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
c01024c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024c3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01024ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024cd:	01 d0                	add    %edx,%eax
c01024cf:	8b 00                	mov    (%eax),%eax
c01024d1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01024d6:	89 04 24             	mov    %eax,(%esp)
c01024d9:	e8 3c f8 ff ff       	call   c0101d1a <pa2page>
c01024de:	89 04 24             	mov    %eax,(%esp)
c01024e1:	e8 92 fa ff ff       	call   c0101f78 <page_decref>
	for (i=0; i<1024;i++) {
		if (pgdir[i]&PTE_P) {
			if (kern_pgdir[i]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
			for (j=0; j<NPTENTRIES;j++){
c01024e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01024ea:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c01024f1:	7e b5                	jle    c01024a8 <pg_remove+0x83>
				if (pgtable[j]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
c01024f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024f6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01024fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102500:	01 d0                	add    %edx,%eax
c0102502:	8b 00                	mov    (%eax),%eax
c0102504:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102509:	89 04 24             	mov    %eax,(%esp)
c010250c:	e8 09 f8 ff ff       	call   c0101d1a <pa2page>
c0102511:	89 04 24             	mov    %eax,(%esp)
c0102514:	e8 5f fa ff ff       	call   c0101f78 <page_decref>
			pgdir[i]=NULL;
c0102519:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010251c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102523:	8b 45 08             	mov    0x8(%ebp),%eax
c0102526:	01 d0                	add    %edx,%eax
c0102528:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

void 
pg_remove(pde_t *pgdir)
{
	int i,j;
	for (i=0; i<1024;i++) {
c010252e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102532:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0102539:	0f 8e f8 fe ff ff    	jle    c0102437 <pg_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
			pgdir[i]=NULL;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c010253f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102542:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102546:	c7 44 24 04 f6 00 00 	movl   $0xf6,0x4(%esp)
c010254d:	00 
c010254e:	c7 04 24 f5 43 10 c0 	movl   $0xc01043f5,(%esp)
c0102555:	e8 30 f7 ff ff       	call   c0101c8a <_paddr>
c010255a:	89 04 24             	mov    %eax,(%esp)
c010255d:	e8 b8 f7 ff ff       	call   c0101d1a <pa2page>
c0102562:	89 04 24             	mov    %eax,(%esp)
c0102565:	e8 0e fa ff ff       	call   c0101f78 <page_decref>
	pgdir=NULL;
c010256a:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c0102571:	c9                   	leave  
c0102572:	c3                   	ret    

c0102573 <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c0102573:	55                   	push   %ebp
c0102574:	89 e5                	mov    %esp,%ebp
c0102576:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c0102579:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102580:	eb 47                	jmp    c01025c9 <boot_map_region+0x56>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0102582:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102585:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010258c:	00 
c010258d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102591:	8b 45 08             	mov    0x8(%ebp),%eax
c0102594:	89 04 24             	mov    %eax,(%esp)
c0102597:	e8 0c fa ff ff       	call   c0101fa8 <pgdir_walk>
c010259c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (pte == NULL) 
c010259f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01025a3:	75 02                	jne    c01025a7 <boot_map_region+0x34>
			return;
c01025a5:	eb 2f                	jmp    c01025d6 <boot_map_region+0x63>
		pte[0]=pa|perm|PTE_P;
c01025a7:	8b 45 18             	mov    0x18(%ebp),%eax
c01025aa:	0b 45 14             	or     0x14(%ebp),%eax
c01025ad:	83 c8 01             	or     $0x1,%eax
c01025b0:	89 c2                	mov    %eax,%edx
c01025b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025b5:	89 10                	mov    %edx,(%eax)
		va+=PGSIZE;
c01025b7:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa+=PGSIZE;
c01025be:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c01025c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01025c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025cc:	8b 55 10             	mov    0x10(%ebp),%edx
c01025cf:	c1 ea 0c             	shr    $0xc,%edx
c01025d2:	39 d0                	cmp    %edx,%eax
c01025d4:	72 ac                	jb     c0102582 <boot_map_region+0xf>
			return;
		pte[0]=pa|perm|PTE_P;
		va+=PGSIZE;
		pa+=PGSIZE;
	}
}
c01025d6:	c9                   	leave  
c01025d7:	c3                   	ret    

c01025d8 <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c01025d8:	55                   	push   %ebp
c01025d9:	89 e5                	mov    %esp,%ebp
c01025db:	53                   	push   %ebx
c01025dc:	83 ec 24             	sub    $0x24,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 1);
c01025df:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01025e6:	00 
c01025e7:	8b 45 10             	mov    0x10(%ebp),%eax
c01025ea:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01025f1:	89 04 24             	mov    %eax,(%esp)
c01025f4:	e8 af f9 ff ff       	call   c0101fa8 <pgdir_walk>
c01025f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c01025fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102600:	75 0a                	jne    c010260c <page_insert+0x34>
		return -1;
c0102602:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102607:	e9 85 00 00 00       	jmp    c0102691 <page_insert+0xb9>
	}
	else if (pte[0] & PTE_P) {
c010260c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010260f:	8b 00                	mov    (%eax),%eax
c0102611:	83 e0 01             	and    $0x1,%eax
c0102614:	85 c0                	test   %eax,%eax
c0102616:	74 49                	je     c0102661 <page_insert+0x89>
		if (PTE_ADDR(pte[0]) == page2pa(pp)) {
c0102618:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010261b:	8b 00                	mov    (%eax),%eax
c010261d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102622:	89 c3                	mov    %eax,%ebx
c0102624:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102627:	89 04 24             	mov    %eax,(%esp)
c010262a:	e8 d4 f6 ff ff       	call   c0101d03 <page2pa>
c010262f:	39 c3                	cmp    %eax,%ebx
c0102631:	75 1c                	jne    c010264f <page_insert+0x77>
			pte[0] = page2pa(pp)|perm|PTE_P;
c0102633:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102636:	89 04 24             	mov    %eax,(%esp)
c0102639:	e8 c5 f6 ff ff       	call   c0101d03 <page2pa>
c010263e:	8b 55 14             	mov    0x14(%ebp),%edx
c0102641:	09 d0                	or     %edx,%eax
c0102643:	83 c8 01             	or     $0x1,%eax
c0102646:	89 c2                	mov    %eax,%edx
c0102648:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010264b:	89 10                	mov    %edx,(%eax)
c010264d:	eb 12                	jmp    c0102661 <page_insert+0x89>
		}
		else {
			page_remove(pgdir, va);
c010264f:	8b 45 10             	mov    0x10(%ebp),%eax
c0102652:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102656:	8b 45 08             	mov    0x8(%ebp),%eax
c0102659:	89 04 24             	mov    %eax,(%esp)
c010265c:	e8 88 00 00 00       	call   c01026e9 <page_remove>
		}
	}
	pte[0] = page2pa(pp)|perm|PTE_P;
c0102661:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102664:	89 04 24             	mov    %eax,(%esp)
c0102667:	e8 97 f6 ff ff       	call   c0101d03 <page2pa>
c010266c:	8b 55 14             	mov    0x14(%ebp),%edx
c010266f:	09 d0                	or     %edx,%eax
c0102671:	83 c8 01             	or     $0x1,%eax
c0102674:	89 c2                	mov    %eax,%edx
c0102676:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102679:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c010267b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010267e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102682:	8d 50 01             	lea    0x1(%eax),%edx
c0102685:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102688:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c010268c:	b8 00 00 00 00       	mov    $0x0,%eax

}
c0102691:	83 c4 24             	add    $0x24,%esp
c0102694:	5b                   	pop    %ebx
c0102695:	5d                   	pop    %ebp
c0102696:	c3                   	ret    

c0102697 <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c0102697:	55                   	push   %ebp
c0102698:	89 e5                	mov    %esp,%ebp
c010269a:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 0);
c010269d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01026a4:	00 
c01026a5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026a8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01026af:	89 04 24             	mov    %eax,(%esp)
c01026b2:	e8 f1 f8 ff ff       	call   c0101fa8 <pgdir_walk>
c01026b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) 
c01026ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01026be:	75 07                	jne    c01026c7 <page_lookup+0x30>
		return NULL;
c01026c0:	b8 00 00 00 00       	mov    $0x0,%eax
c01026c5:	eb 20                	jmp    c01026e7 <page_lookup+0x50>
	if (pte_store != NULL) 
c01026c7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01026cb:	74 08                	je     c01026d5 <page_lookup+0x3e>
		*pte_store = pte;
c01026cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01026d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01026d3:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(pte[0]));
c01026d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026d8:	8b 00                	mov    (%eax),%eax
c01026da:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01026df:	89 04 24             	mov    %eax,(%esp)
c01026e2:	e8 33 f6 ff ff       	call   c0101d1a <pa2page>
}
c01026e7:	c9                   	leave  
c01026e8:	c3                   	ret    

c01026e9 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c01026e9:	55                   	push   %ebp
c01026ea:	89 e5                	mov    %esp,%ebp
c01026ec:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte=NULL;
c01026ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	struct Page *p = page_lookup(pgdir, va, &pte);
c01026f6:	8d 45 f0             	lea    -0x10(%ebp),%eax
c01026f9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01026fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102700:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102704:	8b 45 08             	mov    0x8(%ebp),%eax
c0102707:	89 04 24             	mov    %eax,(%esp)
c010270a:	e8 88 ff ff ff       	call   c0102697 <page_lookup>
c010270f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p != NULL) {
c0102712:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102716:	74 14                	je     c010272c <page_remove+0x43>
		pte[0] = 0;
c0102718:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010271b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c0102721:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102724:	89 04 24             	mov    %eax,(%esp)
c0102727:	e8 4c f8 ff ff       	call   c0101f78 <page_decref>
	}
	tlb_invalidate(pgdir, va);
c010272c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010272f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102733:	8b 45 08             	mov    0x8(%ebp),%eax
c0102736:	89 04 24             	mov    %eax,(%esp)
c0102739:	e8 02 00 00 00       	call   c0102740 <tlb_invalidate>
}
c010273e:	c9                   	leave  
c010273f:	c3                   	ret    

c0102740 <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c0102740:	55                   	push   %ebp
c0102741:	89 e5                	mov    %esp,%ebp
c0102743:	83 ec 10             	sub    $0x10,%esp
c0102746:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102749:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c010274c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010274f:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c0102752:	c9                   	leave  
c0102753:	c3                   	ret    

c0102754 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0102754:	55                   	push   %ebp
c0102755:	89 e5                	mov    %esp,%ebp
c0102757:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c010275a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010275e:	75 24                	jne    c0102784 <list_add+0x30>
c0102760:	c7 44 24 0c 0c 44 10 	movl   $0xc010440c,0xc(%esp)
c0102767:	c0 
c0102768:	c7 44 24 08 19 44 10 	movl   $0xc0104419,0x8(%esp)
c010276f:	c0 
c0102770:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0102777:	00 
c0102778:	c7 04 24 2e 44 10 c0 	movl   $0xc010442e,(%esp)
c010277f:	e8 43 05 00 00       	call   c0102cc7 <_panic>
	data->prev = prev;
c0102784:	8b 45 10             	mov    0x10(%ebp),%eax
c0102787:	8b 55 08             	mov    0x8(%ebp),%edx
c010278a:	89 10                	mov    %edx,(%eax)
	data->next = next;
c010278c:	8b 45 10             	mov    0x10(%ebp),%eax
c010278f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102792:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0102795:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102799:	74 09                	je     c01027a4 <list_add+0x50>
c010279b:	8b 45 08             	mov    0x8(%ebp),%eax
c010279e:	8b 55 10             	mov    0x10(%ebp),%edx
c01027a1:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c01027a4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027a8:	74 08                	je     c01027b2 <list_add+0x5e>
c01027aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027ad:	8b 55 10             	mov    0x10(%ebp),%edx
c01027b0:	89 10                	mov    %edx,(%eax)
}
c01027b2:	c9                   	leave  
c01027b3:	c3                   	ret    

c01027b4 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c01027b4:	55                   	push   %ebp
c01027b5:	89 e5                	mov    %esp,%ebp
c01027b7:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01027ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01027be:	75 24                	jne    c01027e4 <list_add_before+0x30>
c01027c0:	c7 44 24 0c 44 44 10 	movl   $0xc0104444,0xc(%esp)
c01027c7:	c0 
c01027c8:	c7 44 24 08 19 44 10 	movl   $0xc0104419,0x8(%esp)
c01027cf:	c0 
c01027d0:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c01027d7:	00 
c01027d8:	c7 04 24 2e 44 10 c0 	movl   $0xc010442e,(%esp)
c01027df:	e8 e3 04 00 00       	call   c0102cc7 <_panic>
	list_add(one->prev, one, data);
c01027e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01027e7:	8b 00                	mov    (%eax),%eax
c01027e9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01027ec:	89 54 24 08          	mov    %edx,0x8(%esp)
c01027f0:	8b 55 08             	mov    0x8(%ebp),%edx
c01027f3:	89 54 24 04          	mov    %edx,0x4(%esp)
c01027f7:	89 04 24             	mov    %eax,(%esp)
c01027fa:	e8 55 ff ff ff       	call   c0102754 <list_add>
}
c01027ff:	c9                   	leave  
c0102800:	c3                   	ret    

c0102801 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0102801:	55                   	push   %ebp
c0102802:	89 e5                	mov    %esp,%ebp
c0102804:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0102807:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010280b:	75 24                	jne    c0102831 <list_del+0x30>
c010280d:	c7 44 24 0c 0c 44 10 	movl   $0xc010440c,0xc(%esp)
c0102814:	c0 
c0102815:	c7 44 24 08 19 44 10 	movl   $0xc0104419,0x8(%esp)
c010281c:	c0 
c010281d:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0102824:	00 
c0102825:	c7 04 24 2e 44 10 c0 	movl   $0xc010442e,(%esp)
c010282c:	e8 96 04 00 00       	call   c0102cc7 <_panic>
	list *prev = data->prev;
c0102831:	8b 45 08             	mov    0x8(%ebp),%eax
c0102834:	8b 00                	mov    (%eax),%eax
c0102836:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0102839:	8b 45 08             	mov    0x8(%ebp),%eax
c010283c:	8b 40 04             	mov    0x4(%eax),%eax
c010283f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0102842:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102846:	74 09                	je     c0102851 <list_del+0x50>
c0102848:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010284b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010284e:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0102851:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102855:	74 08                	je     c010285f <list_del+0x5e>
c0102857:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010285a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010285d:	89 10                	mov    %edx,(%eax)
}
c010285f:	c9                   	leave  
c0102860:	c3                   	ret    

c0102861 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c0102861:	55                   	push   %ebp
c0102862:	89 e5                	mov    %esp,%ebp
c0102864:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0102867:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010286b:	75 24                	jne    c0102891 <list_empty+0x30>
c010286d:	c7 44 24 0c 44 44 10 	movl   $0xc0104444,0xc(%esp)
c0102874:	c0 
c0102875:	c7 44 24 08 19 44 10 	movl   $0xc0104419,0x8(%esp)
c010287c:	c0 
c010287d:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0102884:	00 
c0102885:	c7 04 24 2e 44 10 c0 	movl   $0xc010442e,(%esp)
c010288c:	e8 36 04 00 00       	call   c0102cc7 <_panic>
	return one == one->next;
c0102891:	8b 45 08             	mov    0x8(%ebp),%eax
c0102894:	8b 40 04             	mov    0x4(%eax),%eax
c0102897:	3b 45 08             	cmp    0x8(%ebp),%eax
c010289a:	0f 94 c0             	sete   %al
c010289d:	0f b6 c0             	movzbl %al,%eax
}
c01028a0:	c9                   	leave  
c01028a1:	c3                   	ret    

c01028a2 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01028a2:	55                   	push   %ebp
c01028a3:	89 e5                	mov    %esp,%ebp
c01028a5:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01028a8:	8b 45 10             	mov    0x10(%ebp),%eax
c01028ab:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01028b0:	77 21                	ja     c01028d3 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01028b2:	8b 45 10             	mov    0x10(%ebp),%eax
c01028b5:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01028b9:	c7 44 24 08 50 44 10 	movl   $0xc0104450,0x8(%esp)
c01028c0:	c0 
c01028c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028c4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01028cb:	89 04 24             	mov    %eax,(%esp)
c01028ce:	e8 f4 03 00 00       	call   c0102cc7 <_panic>
	return (physaddr_t)kva - KERNBASE;
c01028d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01028d6:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01028db:	c9                   	leave  
c01028dc:	c3                   	ret    

c01028dd <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
c01028dd:	55                   	push   %ebp
c01028de:	89 e5                	mov    %esp,%ebp
c01028e0:	83 ec 38             	sub    $0x38,%esp
	list *one,*ne;
	list *bl=&block;
c01028e3:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c01028ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028ed:	8b 40 04             	mov    0x4(%eax),%eax
c01028f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01028f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028f6:	8b 40 04             	mov    0x4(%eax),%eax
c01028f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01028fc:	eb 4f                	jmp    c010294d <schedule+0x70>
		PCB *p=list_entry(one,PCB,plist);
c01028fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102901:	83 e8 08             	sub    $0x8,%eax
c0102904:	89 45 e8             	mov    %eax,-0x18(%ebp)
		p->timecount--;
c0102907:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010290a:	8b 40 1c             	mov    0x1c(%eax),%eax
c010290d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102910:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102913:	89 50 1c             	mov    %edx,0x1c(%eax)
		if(p->timecount==0){
c0102916:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102919:	8b 40 1c             	mov    0x1c(%eax),%eax
c010291c:	85 c0                	test   %eax,%eax
c010291e:	75 1e                	jne    c010293e <schedule+0x61>
			list_del(one);
c0102920:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102923:	89 04 24             	mov    %eax,(%esp)
c0102926:	e8 d6 fe ff ff       	call   c0102801 <list_del>
			list_add_before(&ready,one);
c010292b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010292e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102932:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102939:	e8 76 fe ff ff       	call   c01027b4 <list_add_before>
//extern TSS tss;
void schedule(){
	list *one,*ne;
	list *bl=&block;
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c010293e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102941:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102944:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102947:	8b 40 04             	mov    0x4(%eax),%eax
c010294a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010294d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102950:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0102953:	75 a9                	jne    c01028fe <schedule+0x21>
		if(p->timecount==0){
			list_del(one);
			list_add_before(&ready,one);
		}
	}
	if(!list_empty(&ready)){
c0102955:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c010295c:	e8 00 ff ff ff       	call   c0102861 <list_empty>
c0102961:	85 c0                	test   %eax,%eax
c0102963:	75 7e                	jne    c01029e3 <schedule+0x106>
		list *re=&ready;
c0102965:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c010296c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102971:	8b 40 04             	mov    0x4(%eax),%eax
c0102974:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c0102977:	75 0d                	jne    c0102986 <schedule+0xa9>
			now=re->next;
c0102979:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010297c:	8b 40 04             	mov    0x4(%eax),%eax
c010297f:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c0102984:	eb 0d                	jmp    c0102993 <schedule+0xb6>
		else
			now=now->next;
c0102986:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010298b:	8b 40 04             	mov    0x4(%eax),%eax
c010298e:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c0102993:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102998:	83 e8 08             	sub    $0x8,%eax
c010299b:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c01029a0:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01029a5:	05 f8 0f 00 00       	add    $0xff8,%eax
c01029aa:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c01029ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01029b0:	89 04 24             	mov    %eax,(%esp)
c01029b3:	e8 fe 01 00 00       	call   c0102bb6 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c01029b8:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01029bd:	8b 40 04             	mov    0x4(%eax),%eax
c01029c0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01029c4:	c7 44 24 04 1e 00 00 	movl   $0x1e,0x4(%esp)
c01029cb:	00 
c01029cc:	c7 04 24 74 44 10 c0 	movl   $0xc0104474,(%esp)
c01029d3:	e8 ca fe ff ff       	call   c01028a2 <_paddr>
c01029d8:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c01029db:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01029de:	0f 22 d8             	mov    %eax,%cr3
c01029e1:	eb 3a                	jmp    c0102a1d <schedule+0x140>
		
	}
	else{
		pcbnow=&init;
c01029e3:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01029ea:	3f 16 c0 
		now=&ready;
c01029ed:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c01029f4:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c01029f7:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01029fc:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a00:	c7 44 24 04 24 00 00 	movl   $0x24,0x4(%esp)
c0102a07:	00 
c0102a08:	c7 04 24 74 44 10 c0 	movl   $0xc0104474,(%esp)
c0102a0f:	e8 8e fe ff ff       	call   c01028a2 <_paddr>
c0102a14:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102a17:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102a1a:	0f 22 d8             	mov    %eax,%cr3
	}
}
c0102a1d:	c9                   	leave  
c0102a1e:	c3                   	ret    

c0102a1f <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c0102a1f:	55                   	push   %ebp
c0102a20:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c0102a22:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a25:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0102a2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a2d:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c0102a33:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a36:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0102a3a:	8b 45 10             	mov    0x10(%ebp),%eax
c0102a3d:	83 e0 0f             	and    $0xf,%eax
c0102a40:	89 c2                	mov    %eax,%edx
c0102a42:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a45:	89 d1                	mov    %edx,%ecx
c0102a47:	83 e1 0f             	and    $0xf,%ecx
c0102a4a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a4e:	83 e2 f0             	and    $0xfffffff0,%edx
c0102a51:	09 ca                	or     %ecx,%edx
c0102a53:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c0102a56:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a59:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a5d:	83 ca 10             	or     $0x10,%edx
c0102a60:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c0102a63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a66:	83 e0 03             	and    $0x3,%eax
c0102a69:	89 c2                	mov    %eax,%edx
c0102a6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a6e:	83 e2 03             	and    $0x3,%edx
c0102a71:	89 d1                	mov    %edx,%ecx
c0102a73:	c1 e1 05             	shl    $0x5,%ecx
c0102a76:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a7a:	83 e2 9f             	and    $0xffffff9f,%edx
c0102a7d:	09 ca                	or     %ecx,%edx
c0102a7f:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102a82:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a85:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a89:	83 ca 80             	or     $0xffffff80,%edx
c0102a8c:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c0102a8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a92:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a96:	83 ca 0f             	or     $0xf,%edx
c0102a99:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102a9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a9f:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102aa3:	83 e2 ef             	and    $0xffffffef,%edx
c0102aa6:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102aa9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aac:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102ab0:	83 e2 df             	and    $0xffffffdf,%edx
c0102ab3:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102ab6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ab9:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102abd:	83 ca 40             	or     $0x40,%edx
c0102ac0:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c0102ac3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac6:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102aca:	83 ca 80             	or     $0xffffff80,%edx
c0102acd:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c0102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ad3:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c0102ad7:	5d                   	pop    %ebp
c0102ad8:	c3                   	ret    

c0102ad9 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c0102ad9:	55                   	push   %ebp
c0102ada:	89 e5                	mov    %esp,%ebp
c0102adc:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c0102adf:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c0102ae6:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c0102ae9:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c0102af0:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c0102af7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102afa:	89 c2                	mov    %eax,%edx
c0102afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aff:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c0102b02:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102b05:	89 c2                	mov    %eax,%edx
c0102b07:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b0a:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c0102b0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102b11:	c1 e8 10             	shr    $0x10,%eax
c0102b14:	89 c2                	mov    %eax,%edx
c0102b16:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b19:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c0102b1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b1f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102b23:	83 e2 f0             	and    $0xfffffff0,%edx
c0102b26:	83 ca 09             	or     $0x9,%edx
c0102b29:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c0102b2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b2f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102b33:	83 e2 ef             	and    $0xffffffef,%edx
c0102b36:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c0102b39:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b3c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102b40:	83 ca 60             	or     $0x60,%edx
c0102b43:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102b46:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b49:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102b4d:	83 ca 80             	or     $0xffffff80,%edx
c0102b50:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102b53:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102b56:	c1 e8 10             	shr    $0x10,%eax
c0102b59:	83 e0 0f             	and    $0xf,%eax
c0102b5c:	89 c2                	mov    %eax,%edx
c0102b5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b61:	89 d1                	mov    %edx,%ecx
c0102b63:	83 e1 0f             	and    $0xf,%ecx
c0102b66:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b6a:	83 e2 f0             	and    $0xfffffff0,%edx
c0102b6d:	09 ca                	or     %ecx,%edx
c0102b6f:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102b72:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b75:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b79:	83 e2 ef             	and    $0xffffffef,%edx
c0102b7c:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102b7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b82:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b86:	83 e2 df             	and    $0xffffffdf,%edx
c0102b89:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102b8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b8f:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b93:	83 ca 40             	or     $0x40,%edx
c0102b96:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c0102b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b9c:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102ba0:	83 e2 7f             	and    $0x7f,%edx
c0102ba3:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c0102ba6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102ba9:	c1 e8 18             	shr    $0x18,%eax
c0102bac:	89 c2                	mov    %eax,%edx
c0102bae:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bb1:	88 50 07             	mov    %dl,0x7(%eax)
}
c0102bb4:	c9                   	leave  
c0102bb5:	c3                   	ret    

c0102bb6 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c0102bb6:	55                   	push   %ebp
c0102bb7:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c0102bb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bbc:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c0102bc1:	5d                   	pop    %ebp
c0102bc2:	c3                   	ret    

c0102bc3 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0102bc3:	55                   	push   %ebp
c0102bc4:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0102bc6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bc9:	83 e8 01             	sub    $0x1,%eax
c0102bcc:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c0102bd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bd5:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102bdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bde:	c1 e8 10             	shr    $0x10,%eax
c0102be1:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c0102be7:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c0102bec:	0f 01 10             	lgdtl  (%eax)
}
c0102bef:	5d                   	pop    %ebp
c0102bf0:	c3                   	ret    

c0102bf1 <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c0102bf1:	55                   	push   %ebp
c0102bf2:	89 e5                	mov    %esp,%ebp
c0102bf4:	83 ec 04             	sub    $0x4,%esp
c0102bf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bfa:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c0102bfe:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102c02:	0f 00 d8             	ltr    %ax
}
c0102c05:	c9                   	leave  
c0102c06:	c3                   	ret    

c0102c07 <init_segment>:

void
init_segment(void) {
c0102c07:	55                   	push   %ebp
c0102c08:	89 e5                	mov    %esp,%ebp
c0102c0a:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c0102c0d:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c0102c14:	00 
c0102c15:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102c1c:	00 
c0102c1d:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102c24:	e8 52 06 00 00       	call   c010327b <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c0102c29:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102c30:	00 
c0102c31:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102c38:	00 
c0102c39:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c0102c40:	e8 da fd ff ff       	call   c0102a1f <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0102c45:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102c4c:	00 
c0102c4d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102c54:	00 
c0102c55:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c0102c5c:	e8 be fd ff ff       	call   c0102a1f <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0102c61:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102c68:	00 
c0102c69:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102c70:	00 
c0102c71:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c0102c78:	e8 a2 fd ff ff       	call   c0102a1f <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c0102c7d:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102c84:	00 
c0102c85:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102c8c:	00 
c0102c8d:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c0102c94:	e8 86 fd ff ff       	call   c0102a1f <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0102c99:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c0102ca0:	00 
c0102ca1:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102ca8:	e8 16 ff ff ff       	call   c0102bc3 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c0102cad:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c0102cb4:	e8 20 fe ff ff       	call   c0102ad9 <set_tss>
	load_tr(USEL(SEG_TSS));
c0102cb9:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c0102cc0:	e8 2c ff ff ff       	call   c0102bf1 <load_tr>
}
c0102cc5:	c9                   	leave  
c0102cc6:	c3                   	ret    

c0102cc7 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c0102cc7:	55                   	push   %ebp
c0102cc8:	89 e5                	mov    %esp,%ebp
c0102cca:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c0102ccd:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c0102cd2:	85 c0                	test   %eax,%eax
c0102cd4:	74 01                	je     c0102cd7 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0102cd6:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c0102cd7:	8b 45 10             	mov    0x10(%ebp),%eax
c0102cda:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c0102cdf:	fa                   	cli    
c0102ce0:	fc                   	cld    

	va_start(ap, fmt);
c0102ce1:	8d 45 14             	lea    0x14(%ebp),%eax
c0102ce4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0102ce7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cea:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102cee:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cf1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cf5:	c7 04 24 8c 44 10 c0 	movl   $0xc010448c,(%esp)
c0102cfc:	e8 f5 00 00 00       	call   c0102df6 <printk>
	vprintk(fmt, ap);
c0102d01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d04:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d08:	8b 45 10             	mov    0x10(%ebp),%eax
c0102d0b:	89 04 24             	mov    %eax,(%esp)
c0102d0e:	e8 b0 00 00 00       	call   c0102dc3 <vprintk>
	printk("\n");
c0102d13:	c7 04 24 a4 44 10 c0 	movl   $0xc01044a4,(%esp)
c0102d1a:	e8 d7 00 00 00       	call   c0102df6 <printk>
	va_end(ap);

}
c0102d1f:	c9                   	leave  
c0102d20:	c3                   	ret    

c0102d21 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c0102d21:	55                   	push   %ebp
c0102d22:	89 e5                	mov    %esp,%ebp
c0102d24:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102d27:	8d 45 14             	lea    0x14(%ebp),%eax
c0102d2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c0102d2d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d30:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d34:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d37:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d3b:	c7 04 24 a6 44 10 c0 	movl   $0xc01044a6,(%esp)
c0102d42:	e8 af 00 00 00       	call   c0102df6 <printk>
	vprintk(fmt, ap);
c0102d47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d4a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102d51:	89 04 24             	mov    %eax,(%esp)
c0102d54:	e8 6a 00 00 00       	call   c0102dc3 <vprintk>
	printk("\n");
c0102d59:	c7 04 24 a4 44 10 c0 	movl   $0xc01044a4,(%esp)
c0102d60:	e8 91 00 00 00       	call   c0102df6 <printk>
	va_end(ap);
}
c0102d65:	c9                   	leave  
c0102d66:	c3                   	ret    

c0102d67 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0102d67:	55                   	push   %ebp
c0102d68:	89 e5                	mov    %esp,%ebp
c0102d6a:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0102d6d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102d71:	75 2b                	jne    c0102d9e <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0102d73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102d7a:	eb 1a                	jmp    c0102d96 <sys_write+0x2f>
			serial_printc(buf[i]);
c0102d7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102d7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d82:	01 d0                	add    %edx,%eax
c0102d84:	0f b6 00             	movzbl (%eax),%eax
c0102d87:	0f be c0             	movsbl %al,%eax
c0102d8a:	89 04 24             	mov    %eax,(%esp)
c0102d8d:	e8 c5 dd ff ff       	call   c0100b57 <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0102d92:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d99:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102d9c:	7c de                	jl     c0102d7c <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c0102d9e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102da1:	c9                   	leave  
c0102da2:	c3                   	ret    

c0102da3 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c0102da3:	55                   	push   %ebp
c0102da4:	89 e5                	mov    %esp,%ebp
c0102da6:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c0102da9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dac:	89 04 24             	mov    %eax,(%esp)
c0102daf:	e8 cd dd ff ff       	call   c0100b81 <putchar>
	++*cnt;
c0102db4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102db7:	8b 00                	mov    (%eax),%eax
c0102db9:	8d 50 01             	lea    0x1(%eax),%edx
c0102dbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dbf:	89 10                	mov    %edx,(%eax)
}
c0102dc1:	c9                   	leave  
c0102dc2:	c3                   	ret    

c0102dc3 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0102dc3:	55                   	push   %ebp
c0102dc4:	89 e5                	mov    %esp,%ebp
c0102dc6:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102dc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c0102dd0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dd3:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102dd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dda:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102dde:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102de1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102de5:	c7 04 24 a3 2d 10 c0 	movl   $0xc0102da3,(%esp)
c0102dec:	e8 92 0a 00 00       	call   c0103883 <vprintfmt>
	return cnt;
c0102df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102df4:	c9                   	leave  
c0102df5:	c3                   	ret    

c0102df6 <printk>:

int printk(const char *fmt, ...)
{
c0102df6:	55                   	push   %ebp
c0102df7:	89 e5                	mov    %esp,%ebp
c0102df9:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0102dfc:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102dff:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c0102e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e05:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e09:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e0c:	89 04 24             	mov    %eax,(%esp)
c0102e0f:	e8 af ff ff ff       	call   c0102dc3 <vprintk>
c0102e14:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e1a:	c9                   	leave  
c0102e1b:	c3                   	ret    

c0102e1c <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0102e1c:	6a 00                	push   $0x0
c0102e1e:	6a 00                	push   $0x0
c0102e20:	e9 a9 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e25 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102e25:	6a 00                	push   $0x0
c0102e27:	6a 01                	push   $0x1
c0102e29:	e9 a0 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e2e <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c0102e2e:	6a 00                	push   $0x0
c0102e30:	6a 02                	push   $0x2
c0102e32:	e9 97 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e37 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102e37:	6a 00                	push   $0x0
c0102e39:	6a 03                	push   $0x3
c0102e3b:	e9 8e 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e40 <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c0102e40:	6a 00                	push   $0x0
c0102e42:	6a 04                	push   $0x4
c0102e44:	e9 85 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e49 <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102e49:	6a 00                	push   $0x0
c0102e4b:	6a 05                	push   $0x5
c0102e4d:	e9 7c 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e52 <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0102e52:	6a 00                	push   $0x0
c0102e54:	6a 06                	push   $0x6
c0102e56:	e9 73 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e5b <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0102e5b:	6a 00                	push   $0x0
c0102e5d:	6a 07                	push   $0x7
c0102e5f:	e9 6a 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e64 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0102e64:	6a 08                	push   $0x8
c0102e66:	e9 63 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e6b <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c0102e6b:	6a 00                	push   $0x0
c0102e6d:	6a 09                	push   $0x9
c0102e6f:	e9 5a 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e74 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0102e74:	6a 0a                	push   $0xa
c0102e76:	e9 53 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e7b <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c0102e7b:	6a 0b                	push   $0xb
c0102e7d:	e9 4c 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e82 <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0102e82:	6a 0c                	push   $0xc
c0102e84:	e9 45 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e89 <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c0102e89:	6a 0d                	push   $0xd
c0102e8b:	e9 3e 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e90 <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c0102e90:	6a 0e                	push   $0xe
c0102e92:	e9 37 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102e97 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c0102e97:	6a 00                	push   $0x0
c0102e99:	68 80 00 00 00       	push   $0x80
c0102e9e:	e9 2b 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102ea3 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c0102ea3:	6a 00                	push   $0x0
c0102ea5:	68 e8 03 00 00       	push   $0x3e8
c0102eaa:	e9 1f 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102eaf <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c0102eaf:	6a 00                	push   $0x0
c0102eb1:	68 e9 03 00 00       	push   $0x3e9
c0102eb6:	e9 13 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102ebb <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c0102ebb:	6a 00                	push   $0x0
c0102ebd:	68 f6 03 00 00       	push   $0x3f6
c0102ec2:	e9 07 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102ec7 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c0102ec7:	6a ff                	push   $0xffffffff
c0102ec9:	e9 00 00 00 00       	jmp    c0102ece <asm_do_irq>

c0102ece <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c0102ece:	fa                   	cli    
	pushl %ds
c0102ecf:	1e                   	push   %ds
  	pushl %es
c0102ed0:	06                   	push   %es
  	pushl %fs
c0102ed1:	0f a0                	push   %fs
  	pushl %gs
c0102ed3:	0f a8                	push   %gs
	pushal
c0102ed5:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0102ed6:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c0102eda:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c0102edc:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c0102ede:	54                   	push   %esp
	call irq_handle
c0102edf:	e8 e3 d8 ff ff       	call   c01007c7 <irq_handle>
	movl pcbnow,%eax
c0102ee4:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c0102ee9:	8b 20                	mov    (%eax),%esp

	popal
c0102eeb:	61                   	popa   
	popl %gs
c0102eec:	0f a9                	pop    %gs
  	popl %fs
c0102eee:	0f a1                	pop    %fs
  	popl %es
c0102ef0:	07                   	pop    %es
  	popl %ds
c0102ef1:	1f                   	pop    %ds
	addl $8, %esp
c0102ef2:	83 c4 08             	add    $0x8,%esp
	sti
c0102ef5:	fb                   	sti    
	iret
c0102ef6:	cf                   	iret   
c0102ef7:	90                   	nop
c0102ef8:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c0102efe:	00 00                	add    %al,(%eax)
c0102f00:	fe 4f 52             	decb   0x52(%edi)
c0102f03:	e4 66                	in     $0x66,%al

c0102f04 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102f04:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0102f0b:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0102f0d:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c0102f12:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102f15:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102f18:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0102f1d:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0102f20:	b8 27 2f 10 c0       	mov    $0xc0102f27,%eax
	jmp	*%eax
c0102f25:	ff e0                	jmp    *%eax

c0102f27 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102f27:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0102f2c:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c0102f31:	e8 ba d2 ff ff       	call   c01001f0 <main>

c0102f36 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102f36:	eb fe                	jmp    c0102f36 <spin>

c0102f38 <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102f38:	55                   	push   %ebp
c0102f39:	89 e5                	mov    %esp,%ebp
c0102f3b:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0102f3e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102f42:	78 18                	js     c0102f5c <draw_pixel+0x24>
c0102f44:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102f48:	78 12                	js     c0102f5c <draw_pixel+0x24>
c0102f4a:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102f51:	7f 09                	jg     c0102f5c <draw_pixel+0x24>
c0102f53:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102f5a:	7e 24                	jle    c0102f80 <draw_pixel+0x48>
c0102f5c:	c7 44 24 0c c0 44 10 	movl   $0xc01044c0,0xc(%esp)
c0102f63:	c0 
c0102f64:	c7 44 24 08 f4 44 10 	movl   $0xc01044f4,0x8(%esp)
c0102f6b:	c0 
c0102f6c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
c0102f73:	00 
c0102f74:	c7 04 24 09 45 10 c0 	movl   $0xc0104509,(%esp)
c0102f7b:	e8 47 fd ff ff       	call   c0102cc7 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0102f80:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f83:	c1 e0 08             	shl    $0x8,%eax
c0102f86:	89 c2                	mov    %eax,%edx
c0102f88:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f8b:	c1 e0 06             	shl    $0x6,%eax
c0102f8e:	01 c2                	add    %eax,%edx
c0102f90:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f93:	01 c2                	add    %eax,%edx
c0102f95:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f98:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c0102f9e:	c9                   	leave  
c0102f9f:	c3                   	ret    

c0102fa0 <sysclean>:


void sysclean(void)
{
c0102fa0:	55                   	push   %ebp
c0102fa1:	89 e5                	mov    %esp,%ebp
c0102fa3:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c0102fa6:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0102fad:	00 
c0102fae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102fb5:	00 
c0102fb6:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c0102fbd:	e8 b9 02 00 00       	call   c010327b <memset>
}
c0102fc2:	c9                   	leave  
c0102fc3:	c3                   	ret    

c0102fc4 <syspr>:
int syspr()
{
c0102fc4:	55                   	push   %ebp
c0102fc5:	89 e5                	mov    %esp,%ebp
c0102fc7:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c0102fca:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0102fd1:	c0 
c0102fd2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102fd9:	e8 53 01 00 00       	call   c0103131 <syscall>
}
c0102fde:	c9                   	leave  
c0102fdf:	c3                   	ret    

c0102fe0 <systime>:

int systime(void)
{
c0102fe0:	55                   	push   %ebp
c0102fe1:	89 e5                	mov    %esp,%ebp
c0102fe3:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c0102fe6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102fed:	e8 3f 01 00 00       	call   c0103131 <syscall>
}
c0102ff2:	c9                   	leave  
c0102ff3:	c3                   	ret    

c0102ff4 <sysreadkey>:

int sysreadkey(void)
{
c0102ff4:	55                   	push   %ebp
c0102ff5:	89 e5                	mov    %esp,%ebp
c0102ff7:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c0102ffa:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0103001:	e8 2b 01 00 00       	call   c0103131 <syscall>
}
c0103006:	c9                   	leave  
c0103007:	c3                   	ret    

c0103008 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0103008:	55                   	push   %ebp
c0103009:	89 e5                	mov    %esp,%ebp
c010300b:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c010300e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103011:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103015:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103018:	89 44 24 08          	mov    %eax,0x8(%esp)
c010301c:	8b 45 08             	mov    0x8(%ebp),%eax
c010301f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103023:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c010302a:	e8 02 01 00 00       	call   c0103131 <syscall>
}
c010302f:	c9                   	leave  
c0103030:	c3                   	ret    

c0103031 <fork>:

int fork(void)
{
c0103031:	55                   	push   %ebp
c0103032:	89 e5                	mov    %esp,%ebp
c0103034:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c0103037:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c010303e:	e8 ee 00 00 00       	call   c0103131 <syscall>
}
c0103043:	c9                   	leave  
c0103044:	c3                   	ret    

c0103045 <getpid>:

int getpid(void)
{
c0103045:	55                   	push   %ebp
c0103046:	89 e5                	mov    %esp,%ebp
c0103048:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c010304b:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0103052:	e8 da 00 00 00       	call   c0103131 <syscall>
}
c0103057:	c9                   	leave  
c0103058:	c3                   	ret    

c0103059 <exit>:

void exit(int suc)
{
c0103059:	55                   	push   %ebp
c010305a:	89 e5                	mov    %esp,%ebp
c010305c:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
c010305f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103062:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103066:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c010306d:	e8 bf 00 00 00       	call   c0103131 <syscall>
}
c0103072:	c9                   	leave  
c0103073:	c3                   	ret    

c0103074 <sleep>:

void sleep(int sec)
{
c0103074:	55                   	push   %ebp
c0103075:	89 e5                	mov    %esp,%ebp
c0103077:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c010307a:	8b 45 08             	mov    0x8(%ebp),%eax
c010307d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103081:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0103088:	e8 a4 00 00 00       	call   c0103131 <syscall>
	//printf("qweqwe");
}
c010308d:	c9                   	leave  
c010308e:	c3                   	ret    

c010308f <thread>:

int thread(void *addr)
{
c010308f:	55                   	push   %ebp
c0103090:	89 e5                	mov    %esp,%ebp
c0103092:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
c0103095:	8b 45 08             	mov    0x8(%ebp),%eax
c0103098:	89 44 24 04          	mov    %eax,0x4(%esp)
c010309c:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
c01030a3:	e8 89 00 00 00       	call   c0103131 <syscall>
}
c01030a8:	c9                   	leave  
c01030a9:	c3                   	ret    

c01030aa <sem_init>:

int sem_init(Sema* sema)
{
c01030aa:	55                   	push   %ebp
c01030ab:	89 e5                	mov    %esp,%ebp
c01030ad:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema);
c01030b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01030b3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030b7:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
c01030be:	e8 6e 00 00 00       	call   c0103131 <syscall>
}
c01030c3:	c9                   	leave  
c01030c4:	c3                   	ret    

c01030c5 <sem_destroy>:

int sem_destroy(Sema* sema)
{
c01030c5:	55                   	push   %ebp
c01030c6:	89 e5                	mov    %esp,%ebp
c01030c8:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
c01030cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01030ce:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030d2:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
c01030d9:	e8 53 00 00 00       	call   c0103131 <syscall>
}
c01030de:	c9                   	leave  
c01030df:	c3                   	ret    

c01030e0 <sem_wait>:

int sem_wait(Sema* sema)
{
c01030e0:	55                   	push   %ebp
c01030e1:	89 e5                	mov    %esp,%ebp
c01030e3:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
c01030e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01030e9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030ed:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
c01030f4:	e8 38 00 00 00       	call   c0103131 <syscall>
}
c01030f9:	c9                   	leave  
c01030fa:	c3                   	ret    

c01030fb <sem_trywait>:

int sem_trywait(Sema *sema)
{
c01030fb:	55                   	push   %ebp
c01030fc:	89 e5                	mov    %esp,%ebp
c01030fe:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
c0103101:	8b 45 08             	mov    0x8(%ebp),%eax
c0103104:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103108:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
c010310f:	e8 1d 00 00 00       	call   c0103131 <syscall>
}
c0103114:	c9                   	leave  
c0103115:	c3                   	ret    

c0103116 <sem_post>:

int sem_post(Sema *sema)
{
c0103116:	55                   	push   %ebp
c0103117:	89 e5                	mov    %esp,%ebp
c0103119:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
c010311c:	8b 45 08             	mov    0x8(%ebp),%eax
c010311f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103123:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
c010312a:	e8 02 00 00 00       	call   c0103131 <syscall>
}
c010312f:	c9                   	leave  
c0103130:	c3                   	ret    

c0103131 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c0103131:	55                   	push   %ebp
c0103132:	89 e5                	mov    %esp,%ebp
c0103134:	53                   	push   %ebx
c0103135:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0103138:	8d 45 08             	lea    0x8(%ebp),%eax
c010313b:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c010313e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103141:	8b 00                	mov    (%eax),%eax
c0103143:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0103146:	83 c2 04             	add    $0x4,%edx
c0103149:	8b 1a                	mov    (%edx),%ebx
c010314b:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010314e:	83 c2 08             	add    $0x8,%edx
c0103151:	8b 0a                	mov    (%edx),%ecx
c0103153:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0103156:	83 c2 0c             	add    $0xc,%edx
c0103159:	8b 12                	mov    (%edx),%edx
c010315b:	cd 80                	int    $0x80
c010315d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c0103160:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103163:	83 c4 10             	add    $0x10,%esp
c0103166:	5b                   	pop    %ebx
c0103167:	5d                   	pop    %ebp
c0103168:	c3                   	ret    

c0103169 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0103169:	55                   	push   %ebp
c010316a:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c010316c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010316f:	8b 00                	mov    (%eax),%eax
c0103171:	8d 48 01             	lea    0x1(%eax),%ecx
c0103174:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103177:	89 0a                	mov    %ecx,(%edx)
c0103179:	8b 55 08             	mov    0x8(%ebp),%edx
c010317c:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c0103182:	5d                   	pop    %ebp
c0103183:	c3                   	ret    

c0103184 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0103184:	55                   	push   %ebp
c0103185:	89 e5                	mov    %esp,%ebp
c0103187:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c010318a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0103191:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103194:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103198:	8b 45 08             	mov    0x8(%ebp),%eax
c010319b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010319f:	8d 45 f4             	lea    -0xc(%ebp),%eax
c01031a2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031a6:	c7 04 24 69 31 10 c0 	movl   $0xc0103169,(%esp)
c01031ad:	e8 d1 06 00 00       	call   c0103883 <vprintfmt>
	return cnt;
c01031b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01031b5:	c9                   	leave  
c01031b6:	c3                   	ret    

c01031b7 <printf>:
int printf(const char *fmt, ...)
{
c01031b7:	55                   	push   %ebp
c01031b8:	89 e5                	mov    %esp,%ebp
c01031ba:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c01031bd:	8d 45 0c             	lea    0xc(%ebp),%eax
c01031c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c01031c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01031cd:	89 04 24             	mov    %eax,(%esp)
c01031d0:	e8 af ff ff ff       	call   c0103184 <vprintf>
c01031d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c01031d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01031db:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031df:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c01031e6:	c0 
c01031e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01031ee:	e8 15 fe ff ff       	call   c0103008 <syswrite>
	return cnt;
c01031f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01031f6:	c9                   	leave  
c01031f7:	c3                   	ret    

c01031f8 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c01031f8:	55                   	push   %ebp
c01031f9:	89 e5                	mov    %esp,%ebp
c01031fb:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c01031fe:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c0103205:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0103209:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010320c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0103211:	89 c8                	mov    %ecx,%eax
c0103213:	f7 ea                	imul   %edx
c0103215:	c1 fa 02             	sar    $0x2,%edx
c0103218:	89 c8                	mov    %ecx,%eax
c010321a:	c1 f8 1f             	sar    $0x1f,%eax
c010321d:	29 c2                	sub    %eax,%edx
c010321f:	89 d0                	mov    %edx,%eax
c0103221:	c1 e0 02             	shl    $0x2,%eax
c0103224:	01 d0                	add    %edx,%eax
c0103226:	01 c0                	add    %eax,%eax
c0103228:	29 c1                	sub    %eax,%ecx
c010322a:	89 ca                	mov    %ecx,%edx
c010322c:	89 d0                	mov    %edx,%eax
c010322e:	83 c0 30             	add    $0x30,%eax
c0103231:	89 c2                	mov    %eax,%edx
c0103233:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103236:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0103238:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010323b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0103240:	89 c8                	mov    %ecx,%eax
c0103242:	f7 ea                	imul   %edx
c0103244:	c1 fa 02             	sar    $0x2,%edx
c0103247:	89 c8                	mov    %ecx,%eax
c0103249:	c1 f8 1f             	sar    $0x1f,%eax
c010324c:	29 c2                	sub    %eax,%edx
c010324e:	89 d0                	mov    %edx,%eax
c0103250:	89 45 08             	mov    %eax,0x8(%ebp)
c0103253:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103257:	75 ac                	jne    c0103205 <itoa+0xd>
	return p;
c0103259:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c010325c:	c9                   	leave  
c010325d:	c3                   	ret    

c010325e <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c010325e:	55                   	push   %ebp
c010325f:	89 e5                	mov    %esp,%ebp
c0103261:	57                   	push   %edi
c0103262:	56                   	push   %esi
c0103263:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0103264:	8b 45 10             	mov    0x10(%ebp),%eax
c0103267:	8b 55 0c             	mov    0xc(%ebp),%edx
c010326a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010326d:	89 c1                	mov    %eax,%ecx
c010326f:	89 d6                	mov    %edx,%esi
c0103271:	89 df                	mov    %ebx,%edi
c0103273:	fc                   	cld    
c0103274:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0103276:	5b                   	pop    %ebx
c0103277:	5e                   	pop    %esi
c0103278:	5f                   	pop    %edi
c0103279:	5d                   	pop    %ebp
c010327a:	c3                   	ret    

c010327b <memset>:

void memset(void *dest, int data, size_t size) {
c010327b:	55                   	push   %ebp
c010327c:	89 e5                	mov    %esp,%ebp
c010327e:	57                   	push   %edi
c010327f:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0103280:	8b 55 10             	mov    0x10(%ebp),%edx
c0103283:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103286:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0103289:	89 d1                	mov    %edx,%ecx
c010328b:	89 df                	mov    %ebx,%edi
c010328d:	fc                   	cld    
c010328e:	f3 aa                	rep stos %al,%es:(%edi)
}
c0103290:	5b                   	pop    %ebx
c0103291:	5f                   	pop    %edi
c0103292:	5d                   	pop    %ebp
c0103293:	c3                   	ret    

c0103294 <strlen>:

size_t strlen(const char *str) {
c0103294:	55                   	push   %ebp
c0103295:	89 e5                	mov    %esp,%ebp
c0103297:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c010329a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c01032a1:	eb 04                	jmp    c01032a7 <strlen+0x13>
c01032a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01032a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01032aa:	8d 50 01             	lea    0x1(%eax),%edx
c01032ad:	89 55 08             	mov    %edx,0x8(%ebp)
c01032b0:	0f b6 00             	movzbl (%eax),%eax
c01032b3:	84 c0                	test   %al,%al
c01032b5:	75 ec                	jne    c01032a3 <strlen+0xf>
	return len;
c01032b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01032ba:	c9                   	leave  
c01032bb:	c3                   	ret    

c01032bc <strcpy>:

void strcpy(char *d, const char *s) {
c01032bc:	55                   	push   %ebp
c01032bd:	89 e5                	mov    %esp,%ebp
c01032bf:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c01032c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032c5:	89 04 24             	mov    %eax,(%esp)
c01032c8:	e8 c7 ff ff ff       	call   c0103294 <strlen>
c01032cd:	83 c0 01             	add    $0x1,%eax
c01032d0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01032d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032d7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01032db:	8b 45 08             	mov    0x8(%ebp),%eax
c01032de:	89 04 24             	mov    %eax,(%esp)
c01032e1:	e8 78 ff ff ff       	call   c010325e <memcpy>
}
c01032e6:	c9                   	leave  
c01032e7:	c3                   	ret    

c01032e8 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c01032e8:	55                   	push   %ebp
c01032e9:	89 e5                	mov    %esp,%ebp
c01032eb:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c01032ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01032f5:	eb 0c                	jmp    c0103303 <strnlen+0x1b>
		n++;
c01032f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c01032fb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01032ff:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0103303:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103307:	74 0a                	je     c0103313 <strnlen+0x2b>
c0103309:	8b 45 08             	mov    0x8(%ebp),%eax
c010330c:	0f b6 00             	movzbl (%eax),%eax
c010330f:	84 c0                	test   %al,%al
c0103311:	75 e4                	jne    c01032f7 <strnlen+0xf>
		n++;
	return n;
c0103313:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0103316:	c9                   	leave  
c0103317:	c3                   	ret    

c0103318 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0103318:	55                   	push   %ebp
c0103319:	89 e5                	mov    %esp,%ebp
c010331b:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c010331e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103321:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0103324:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010332b:	eb 23                	jmp    c0103350 <strncpy+0x38>
		*dst++ = *src;
c010332d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103330:	8d 50 01             	lea    0x1(%eax),%edx
c0103333:	89 55 08             	mov    %edx,0x8(%ebp)
c0103336:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103339:	0f b6 12             	movzbl (%edx),%edx
c010333c:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c010333e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103341:	0f b6 00             	movzbl (%eax),%eax
c0103344:	84 c0                	test   %al,%al
c0103346:	74 04                	je     c010334c <strncpy+0x34>
			src++;
c0103348:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c010334c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0103350:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103353:	3b 45 10             	cmp    0x10(%ebp),%eax
c0103356:	72 d5                	jb     c010332d <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c0103358:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c010335b:	c9                   	leave  
c010335c:	c3                   	ret    

c010335d <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c010335d:	55                   	push   %ebp
c010335e:	89 e5                	mov    %esp,%ebp
c0103360:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c0103363:	8b 45 08             	mov    0x8(%ebp),%eax
c0103366:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0103369:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010336d:	74 33                	je     c01033a2 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c010336f:	eb 17                	jmp    c0103388 <strlcpy+0x2b>
			*dst++ = *src++;
c0103371:	8b 45 08             	mov    0x8(%ebp),%eax
c0103374:	8d 50 01             	lea    0x1(%eax),%edx
c0103377:	89 55 08             	mov    %edx,0x8(%ebp)
c010337a:	8b 55 0c             	mov    0xc(%ebp),%edx
c010337d:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103380:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c0103383:	0f b6 12             	movzbl (%edx),%edx
c0103386:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0103388:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c010338c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103390:	74 0a                	je     c010339c <strlcpy+0x3f>
c0103392:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103395:	0f b6 00             	movzbl (%eax),%eax
c0103398:	84 c0                	test   %al,%al
c010339a:	75 d5                	jne    c0103371 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c010339c:	8b 45 08             	mov    0x8(%ebp),%eax
c010339f:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c01033a2:	8b 55 08             	mov    0x8(%ebp),%edx
c01033a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01033a8:	29 c2                	sub    %eax,%edx
c01033aa:	89 d0                	mov    %edx,%eax
}
c01033ac:	c9                   	leave  
c01033ad:	c3                   	ret    

c01033ae <strcmp>:

int
strcmp(const char *p, const char *q)
{
c01033ae:	55                   	push   %ebp
c01033af:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c01033b1:	eb 08                	jmp    c01033bb <strcmp+0xd>
		p++, q++;
c01033b3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01033b7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c01033bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01033be:	0f b6 00             	movzbl (%eax),%eax
c01033c1:	84 c0                	test   %al,%al
c01033c3:	74 10                	je     c01033d5 <strcmp+0x27>
c01033c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01033c8:	0f b6 10             	movzbl (%eax),%edx
c01033cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033ce:	0f b6 00             	movzbl (%eax),%eax
c01033d1:	38 c2                	cmp    %al,%dl
c01033d3:	74 de                	je     c01033b3 <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c01033d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01033d8:	0f b6 00             	movzbl (%eax),%eax
c01033db:	0f b6 d0             	movzbl %al,%edx
c01033de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033e1:	0f b6 00             	movzbl (%eax),%eax
c01033e4:	0f b6 c0             	movzbl %al,%eax
c01033e7:	29 c2                	sub    %eax,%edx
c01033e9:	89 d0                	mov    %edx,%eax
}
c01033eb:	5d                   	pop    %ebp
c01033ec:	c3                   	ret    

c01033ed <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c01033ed:	55                   	push   %ebp
c01033ee:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c01033f0:	eb 0c                	jmp    c01033fe <strncmp+0x11>
		n--, p++, q++;
c01033f2:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01033f6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01033fa:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c01033fe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103402:	74 1a                	je     c010341e <strncmp+0x31>
c0103404:	8b 45 08             	mov    0x8(%ebp),%eax
c0103407:	0f b6 00             	movzbl (%eax),%eax
c010340a:	84 c0                	test   %al,%al
c010340c:	74 10                	je     c010341e <strncmp+0x31>
c010340e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103411:	0f b6 10             	movzbl (%eax),%edx
c0103414:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103417:	0f b6 00             	movzbl (%eax),%eax
c010341a:	38 c2                	cmp    %al,%dl
c010341c:	74 d4                	je     c01033f2 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c010341e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103422:	75 07                	jne    c010342b <strncmp+0x3e>
		return 0;
c0103424:	b8 00 00 00 00       	mov    $0x0,%eax
c0103429:	eb 16                	jmp    c0103441 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c010342b:	8b 45 08             	mov    0x8(%ebp),%eax
c010342e:	0f b6 00             	movzbl (%eax),%eax
c0103431:	0f b6 d0             	movzbl %al,%edx
c0103434:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103437:	0f b6 00             	movzbl (%eax),%eax
c010343a:	0f b6 c0             	movzbl %al,%eax
c010343d:	29 c2                	sub    %eax,%edx
c010343f:	89 d0                	mov    %edx,%eax
}
c0103441:	5d                   	pop    %ebp
c0103442:	c3                   	ret    

c0103443 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c0103443:	55                   	push   %ebp
c0103444:	89 e5                	mov    %esp,%ebp
c0103446:	83 ec 04             	sub    $0x4,%esp
c0103449:	8b 45 0c             	mov    0xc(%ebp),%eax
c010344c:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c010344f:	eb 14                	jmp    c0103465 <strchr+0x22>
		if (*s == c)
c0103451:	8b 45 08             	mov    0x8(%ebp),%eax
c0103454:	0f b6 00             	movzbl (%eax),%eax
c0103457:	3a 45 fc             	cmp    -0x4(%ebp),%al
c010345a:	75 05                	jne    c0103461 <strchr+0x1e>
			return (char *) s;
c010345c:	8b 45 08             	mov    0x8(%ebp),%eax
c010345f:	eb 13                	jmp    c0103474 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c0103461:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103465:	8b 45 08             	mov    0x8(%ebp),%eax
c0103468:	0f b6 00             	movzbl (%eax),%eax
c010346b:	84 c0                	test   %al,%al
c010346d:	75 e2                	jne    c0103451 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c010346f:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0103474:	c9                   	leave  
c0103475:	c3                   	ret    

c0103476 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c0103476:	55                   	push   %ebp
c0103477:	89 e5                	mov    %esp,%ebp
c0103479:	83 ec 04             	sub    $0x4,%esp
c010347c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010347f:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0103482:	eb 11                	jmp    c0103495 <strfind+0x1f>
		if (*s == c)
c0103484:	8b 45 08             	mov    0x8(%ebp),%eax
c0103487:	0f b6 00             	movzbl (%eax),%eax
c010348a:	3a 45 fc             	cmp    -0x4(%ebp),%al
c010348d:	75 02                	jne    c0103491 <strfind+0x1b>
			break;
c010348f:	eb 0e                	jmp    c010349f <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0103491:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103495:	8b 45 08             	mov    0x8(%ebp),%eax
c0103498:	0f b6 00             	movzbl (%eax),%eax
c010349b:	84 c0                	test   %al,%al
c010349d:	75 e5                	jne    c0103484 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c010349f:	8b 45 08             	mov    0x8(%ebp),%eax
}
c01034a2:	c9                   	leave  
c01034a3:	c3                   	ret    

c01034a4 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c01034a4:	55                   	push   %ebp
c01034a5:	89 e5                	mov    %esp,%ebp
c01034a7:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c01034aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c01034b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01034b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c01034b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01034b9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01034bc:	73 3d                	jae    c01034fb <memmove+0x57>
c01034be:	8b 45 10             	mov    0x10(%ebp),%eax
c01034c1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01034c4:	01 d0                	add    %edx,%eax
c01034c6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01034c9:	76 30                	jbe    c01034fb <memmove+0x57>
		s += n;
c01034cb:	8b 45 10             	mov    0x10(%ebp),%eax
c01034ce:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c01034d1:	8b 45 10             	mov    0x10(%ebp),%eax
c01034d4:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c01034d7:	eb 13                	jmp    c01034ec <memmove+0x48>
			*--d = *--s;
c01034d9:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c01034dd:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c01034e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01034e4:	0f b6 10             	movzbl (%eax),%edx
c01034e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01034ea:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c01034ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01034ef:	8d 50 ff             	lea    -0x1(%eax),%edx
c01034f2:	89 55 10             	mov    %edx,0x10(%ebp)
c01034f5:	85 c0                	test   %eax,%eax
c01034f7:	75 e0                	jne    c01034d9 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c01034f9:	eb 26                	jmp    c0103521 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c01034fb:	eb 17                	jmp    c0103514 <memmove+0x70>
			*d++ = *s++;
c01034fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103500:	8d 50 01             	lea    0x1(%eax),%edx
c0103503:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103506:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0103509:	8d 4a 01             	lea    0x1(%edx),%ecx
c010350c:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c010350f:	0f b6 12             	movzbl (%edx),%edx
c0103512:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0103514:	8b 45 10             	mov    0x10(%ebp),%eax
c0103517:	8d 50 ff             	lea    -0x1(%eax),%edx
c010351a:	89 55 10             	mov    %edx,0x10(%ebp)
c010351d:	85 c0                	test   %eax,%eax
c010351f:	75 dc                	jne    c01034fd <memmove+0x59>
			*d++ = *s++;

	return dst;
c0103521:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0103524:	c9                   	leave  
c0103525:	c3                   	ret    

c0103526 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0103526:	55                   	push   %ebp
c0103527:	89 e5                	mov    %esp,%ebp
c0103529:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c010352c:	8b 45 08             	mov    0x8(%ebp),%eax
c010352f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c0103532:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103535:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0103538:	eb 30                	jmp    c010356a <memcmp+0x44>
		if (*s1 != *s2)
c010353a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010353d:	0f b6 10             	movzbl (%eax),%edx
c0103540:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103543:	0f b6 00             	movzbl (%eax),%eax
c0103546:	38 c2                	cmp    %al,%dl
c0103548:	74 18                	je     c0103562 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c010354a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010354d:	0f b6 00             	movzbl (%eax),%eax
c0103550:	0f b6 d0             	movzbl %al,%edx
c0103553:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103556:	0f b6 00             	movzbl (%eax),%eax
c0103559:	0f b6 c0             	movzbl %al,%eax
c010355c:	29 c2                	sub    %eax,%edx
c010355e:	89 d0                	mov    %edx,%eax
c0103560:	eb 1a                	jmp    c010357c <memcmp+0x56>
		s1++, s2++;
c0103562:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0103566:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c010356a:	8b 45 10             	mov    0x10(%ebp),%eax
c010356d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103570:	89 55 10             	mov    %edx,0x10(%ebp)
c0103573:	85 c0                	test   %eax,%eax
c0103575:	75 c3                	jne    c010353a <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c0103577:	b8 00 00 00 00       	mov    $0x0,%eax
}
c010357c:	c9                   	leave  
c010357d:	c3                   	ret    

c010357e <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c010357e:	55                   	push   %ebp
c010357f:	89 e5                	mov    %esp,%ebp
c0103581:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c0103584:	8b 45 10             	mov    0x10(%ebp),%eax
c0103587:	8b 55 08             	mov    0x8(%ebp),%edx
c010358a:	01 d0                	add    %edx,%eax
c010358c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c010358f:	eb 13                	jmp    c01035a4 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c0103591:	8b 45 08             	mov    0x8(%ebp),%eax
c0103594:	0f b6 10             	movzbl (%eax),%edx
c0103597:	8b 45 0c             	mov    0xc(%ebp),%eax
c010359a:	38 c2                	cmp    %al,%dl
c010359c:	75 02                	jne    c01035a0 <memfind+0x22>
			break;
c010359e:	eb 0c                	jmp    c01035ac <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c01035a0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01035a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01035a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c01035aa:	72 e5                	jb     c0103591 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c01035ac:	8b 45 08             	mov    0x8(%ebp),%eax
}
c01035af:	c9                   	leave  
c01035b0:	c3                   	ret    

c01035b1 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c01035b1:	55                   	push   %ebp
c01035b2:	89 e5                	mov    %esp,%ebp
c01035b4:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c01035b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c01035be:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c01035c5:	eb 04                	jmp    c01035cb <strtol+0x1a>
		s++;
c01035c7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c01035cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01035ce:	0f b6 00             	movzbl (%eax),%eax
c01035d1:	3c 20                	cmp    $0x20,%al
c01035d3:	74 f2                	je     c01035c7 <strtol+0x16>
c01035d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01035d8:	0f b6 00             	movzbl (%eax),%eax
c01035db:	3c 09                	cmp    $0x9,%al
c01035dd:	74 e8                	je     c01035c7 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c01035df:	8b 45 08             	mov    0x8(%ebp),%eax
c01035e2:	0f b6 00             	movzbl (%eax),%eax
c01035e5:	3c 2b                	cmp    $0x2b,%al
c01035e7:	75 06                	jne    c01035ef <strtol+0x3e>
		s++;
c01035e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01035ed:	eb 15                	jmp    c0103604 <strtol+0x53>
	else if (*s == '-')
c01035ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01035f2:	0f b6 00             	movzbl (%eax),%eax
c01035f5:	3c 2d                	cmp    $0x2d,%al
c01035f7:	75 0b                	jne    c0103604 <strtol+0x53>
		s++, neg = 1;
c01035f9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01035fd:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c0103604:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103608:	74 06                	je     c0103610 <strtol+0x5f>
c010360a:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c010360e:	75 24                	jne    c0103634 <strtol+0x83>
c0103610:	8b 45 08             	mov    0x8(%ebp),%eax
c0103613:	0f b6 00             	movzbl (%eax),%eax
c0103616:	3c 30                	cmp    $0x30,%al
c0103618:	75 1a                	jne    c0103634 <strtol+0x83>
c010361a:	8b 45 08             	mov    0x8(%ebp),%eax
c010361d:	83 c0 01             	add    $0x1,%eax
c0103620:	0f b6 00             	movzbl (%eax),%eax
c0103623:	3c 78                	cmp    $0x78,%al
c0103625:	75 0d                	jne    c0103634 <strtol+0x83>
		s += 2, base = 16;
c0103627:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c010362b:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c0103632:	eb 2a                	jmp    c010365e <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c0103634:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103638:	75 17                	jne    c0103651 <strtol+0xa0>
c010363a:	8b 45 08             	mov    0x8(%ebp),%eax
c010363d:	0f b6 00             	movzbl (%eax),%eax
c0103640:	3c 30                	cmp    $0x30,%al
c0103642:	75 0d                	jne    c0103651 <strtol+0xa0>
		s++, base = 8;
c0103644:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103648:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c010364f:	eb 0d                	jmp    c010365e <strtol+0xad>
	else if (base == 0)
c0103651:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103655:	75 07                	jne    c010365e <strtol+0xad>
		base = 10;
c0103657:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c010365e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103661:	0f b6 00             	movzbl (%eax),%eax
c0103664:	3c 2f                	cmp    $0x2f,%al
c0103666:	7e 1b                	jle    c0103683 <strtol+0xd2>
c0103668:	8b 45 08             	mov    0x8(%ebp),%eax
c010366b:	0f b6 00             	movzbl (%eax),%eax
c010366e:	3c 39                	cmp    $0x39,%al
c0103670:	7f 11                	jg     c0103683 <strtol+0xd2>
			dig = *s - '0';
c0103672:	8b 45 08             	mov    0x8(%ebp),%eax
c0103675:	0f b6 00             	movzbl (%eax),%eax
c0103678:	0f be c0             	movsbl %al,%eax
c010367b:	83 e8 30             	sub    $0x30,%eax
c010367e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103681:	eb 48                	jmp    c01036cb <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c0103683:	8b 45 08             	mov    0x8(%ebp),%eax
c0103686:	0f b6 00             	movzbl (%eax),%eax
c0103689:	3c 60                	cmp    $0x60,%al
c010368b:	7e 1b                	jle    c01036a8 <strtol+0xf7>
c010368d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103690:	0f b6 00             	movzbl (%eax),%eax
c0103693:	3c 7a                	cmp    $0x7a,%al
c0103695:	7f 11                	jg     c01036a8 <strtol+0xf7>
			dig = *s - 'a' + 10;
c0103697:	8b 45 08             	mov    0x8(%ebp),%eax
c010369a:	0f b6 00             	movzbl (%eax),%eax
c010369d:	0f be c0             	movsbl %al,%eax
c01036a0:	83 e8 57             	sub    $0x57,%eax
c01036a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01036a6:	eb 23                	jmp    c01036cb <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c01036a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01036ab:	0f b6 00             	movzbl (%eax),%eax
c01036ae:	3c 40                	cmp    $0x40,%al
c01036b0:	7e 3d                	jle    c01036ef <strtol+0x13e>
c01036b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01036b5:	0f b6 00             	movzbl (%eax),%eax
c01036b8:	3c 5a                	cmp    $0x5a,%al
c01036ba:	7f 33                	jg     c01036ef <strtol+0x13e>
			dig = *s - 'A' + 10;
c01036bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01036bf:	0f b6 00             	movzbl (%eax),%eax
c01036c2:	0f be c0             	movsbl %al,%eax
c01036c5:	83 e8 37             	sub    $0x37,%eax
c01036c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c01036cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036ce:	3b 45 10             	cmp    0x10(%ebp),%eax
c01036d1:	7c 02                	jl     c01036d5 <strtol+0x124>
			break;
c01036d3:	eb 1a                	jmp    c01036ef <strtol+0x13e>
		s++, val = (val * base) + dig;
c01036d5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01036d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01036dc:	0f af 45 10          	imul   0x10(%ebp),%eax
c01036e0:	89 c2                	mov    %eax,%edx
c01036e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036e5:	01 d0                	add    %edx,%eax
c01036e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c01036ea:	e9 6f ff ff ff       	jmp    c010365e <strtol+0xad>

	if (endptr)
c01036ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01036f3:	74 08                	je     c01036fd <strtol+0x14c>
		*endptr = (char *) s;
c01036f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036f8:	8b 55 08             	mov    0x8(%ebp),%edx
c01036fb:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c01036fd:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0103701:	74 07                	je     c010370a <strtol+0x159>
c0103703:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103706:	f7 d8                	neg    %eax
c0103708:	eb 03                	jmp    c010370d <strtol+0x15c>
c010370a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c010370d:	c9                   	leave  
c010370e:	c3                   	ret    

c010370f <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c010370f:	55                   	push   %ebp
c0103710:	89 e5                	mov    %esp,%ebp
c0103712:	53                   	push   %ebx
c0103713:	83 ec 34             	sub    $0x34,%esp
c0103716:	8b 45 10             	mov    0x10(%ebp),%eax
c0103719:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010371c:	8b 45 14             	mov    0x14(%ebp),%eax
c010371f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c0103722:	8b 45 18             	mov    0x18(%ebp),%eax
c0103725:	ba 00 00 00 00       	mov    $0x0,%edx
c010372a:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c010372d:	77 72                	ja     c01037a1 <printnum+0x92>
c010372f:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c0103732:	72 05                	jb     c0103739 <printnum+0x2a>
c0103734:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0103737:	77 68                	ja     c01037a1 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c0103739:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010373c:	8d 58 ff             	lea    -0x1(%eax),%ebx
c010373f:	8b 45 18             	mov    0x18(%ebp),%eax
c0103742:	ba 00 00 00 00       	mov    $0x0,%edx
c0103747:	89 44 24 08          	mov    %eax,0x8(%esp)
c010374b:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010374f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103752:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103755:	89 04 24             	mov    %eax,(%esp)
c0103758:	89 54 24 04          	mov    %edx,0x4(%esp)
c010375c:	e8 4f 06 00 00       	call   c0103db0 <__udivdi3>
c0103761:	8b 4d 20             	mov    0x20(%ebp),%ecx
c0103764:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c0103768:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c010376c:	8b 4d 18             	mov    0x18(%ebp),%ecx
c010376f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103773:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103777:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010377b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010377e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103782:	8b 45 08             	mov    0x8(%ebp),%eax
c0103785:	89 04 24             	mov    %eax,(%esp)
c0103788:	e8 82 ff ff ff       	call   c010370f <printnum>
c010378d:	eb 1c                	jmp    c01037ab <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c010378f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103792:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103796:	8b 45 20             	mov    0x20(%ebp),%eax
c0103799:	89 04 24             	mov    %eax,(%esp)
c010379c:	8b 45 08             	mov    0x8(%ebp),%eax
c010379f:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c01037a1:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c01037a5:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c01037a9:	7f e4                	jg     c010378f <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c01037ab:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01037ae:	bb 00 00 00 00       	mov    $0x0,%ebx
c01037b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01037b9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01037bd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01037c1:	89 04 24             	mov    %eax,(%esp)
c01037c4:	89 54 24 04          	mov    %edx,0x4(%esp)
c01037c8:	e8 13 07 00 00       	call   c0103ee0 <__umoddi3>
c01037cd:	05 a4 45 10 c0       	add    $0xc01045a4,%eax
c01037d2:	0f b6 00             	movzbl (%eax),%eax
c01037d5:	0f be c0             	movsbl %al,%eax
c01037d8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01037db:	89 54 24 04          	mov    %edx,0x4(%esp)
c01037df:	89 04 24             	mov    %eax,(%esp)
c01037e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01037e5:	ff d0                	call   *%eax
}
c01037e7:	83 c4 34             	add    $0x34,%esp
c01037ea:	5b                   	pop    %ebx
c01037eb:	5d                   	pop    %ebp
c01037ec:	c3                   	ret    

c01037ed <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c01037ed:	55                   	push   %ebp
c01037ee:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c01037f0:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01037f4:	7e 14                	jle    c010380a <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c01037f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01037f9:	8b 00                	mov    (%eax),%eax
c01037fb:	8d 48 08             	lea    0x8(%eax),%ecx
c01037fe:	8b 55 08             	mov    0x8(%ebp),%edx
c0103801:	89 0a                	mov    %ecx,(%edx)
c0103803:	8b 50 04             	mov    0x4(%eax),%edx
c0103806:	8b 00                	mov    (%eax),%eax
c0103808:	eb 30                	jmp    c010383a <getuint+0x4d>
	else if (lflag)
c010380a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010380e:	74 16                	je     c0103826 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c0103810:	8b 45 08             	mov    0x8(%ebp),%eax
c0103813:	8b 00                	mov    (%eax),%eax
c0103815:	8d 48 04             	lea    0x4(%eax),%ecx
c0103818:	8b 55 08             	mov    0x8(%ebp),%edx
c010381b:	89 0a                	mov    %ecx,(%edx)
c010381d:	8b 00                	mov    (%eax),%eax
c010381f:	ba 00 00 00 00       	mov    $0x0,%edx
c0103824:	eb 14                	jmp    c010383a <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c0103826:	8b 45 08             	mov    0x8(%ebp),%eax
c0103829:	8b 00                	mov    (%eax),%eax
c010382b:	8d 48 04             	lea    0x4(%eax),%ecx
c010382e:	8b 55 08             	mov    0x8(%ebp),%edx
c0103831:	89 0a                	mov    %ecx,(%edx)
c0103833:	8b 00                	mov    (%eax),%eax
c0103835:	ba 00 00 00 00       	mov    $0x0,%edx
}
c010383a:	5d                   	pop    %ebp
c010383b:	c3                   	ret    

c010383c <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c010383c:	55                   	push   %ebp
c010383d:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010383f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c0103843:	7e 14                	jle    c0103859 <getint+0x1d>
		return va_arg(*ap, long long);
c0103845:	8b 45 08             	mov    0x8(%ebp),%eax
c0103848:	8b 00                	mov    (%eax),%eax
c010384a:	8d 48 08             	lea    0x8(%eax),%ecx
c010384d:	8b 55 08             	mov    0x8(%ebp),%edx
c0103850:	89 0a                	mov    %ecx,(%edx)
c0103852:	8b 50 04             	mov    0x4(%eax),%edx
c0103855:	8b 00                	mov    (%eax),%eax
c0103857:	eb 28                	jmp    c0103881 <getint+0x45>
	else if (lflag)
c0103859:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010385d:	74 12                	je     c0103871 <getint+0x35>
		return va_arg(*ap, long);
c010385f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103862:	8b 00                	mov    (%eax),%eax
c0103864:	8d 48 04             	lea    0x4(%eax),%ecx
c0103867:	8b 55 08             	mov    0x8(%ebp),%edx
c010386a:	89 0a                	mov    %ecx,(%edx)
c010386c:	8b 00                	mov    (%eax),%eax
c010386e:	99                   	cltd   
c010386f:	eb 10                	jmp    c0103881 <getint+0x45>
	else
		return va_arg(*ap, int);
c0103871:	8b 45 08             	mov    0x8(%ebp),%eax
c0103874:	8b 00                	mov    (%eax),%eax
c0103876:	8d 48 04             	lea    0x4(%eax),%ecx
c0103879:	8b 55 08             	mov    0x8(%ebp),%edx
c010387c:	89 0a                	mov    %ecx,(%edx)
c010387e:	8b 00                	mov    (%eax),%eax
c0103880:	99                   	cltd   
}
c0103881:	5d                   	pop    %ebp
c0103882:	c3                   	ret    

c0103883 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c0103883:	55                   	push   %ebp
c0103884:	89 e5                	mov    %esp,%ebp
c0103886:	56                   	push   %esi
c0103887:	53                   	push   %ebx
c0103888:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c010388b:	eb 18                	jmp    c01038a5 <vprintfmt+0x22>
			if (ch == '\0')
c010388d:	85 db                	test   %ebx,%ebx
c010388f:	75 05                	jne    c0103896 <vprintfmt+0x13>
				return;
c0103891:	e9 e9 03 00 00       	jmp    c0103c7f <vprintfmt+0x3fc>
			putch(ch, putdat);
c0103896:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103899:	89 44 24 04          	mov    %eax,0x4(%esp)
c010389d:	89 1c 24             	mov    %ebx,(%esp)
c01038a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01038a3:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01038a5:	8b 45 10             	mov    0x10(%ebp),%eax
c01038a8:	8d 50 01             	lea    0x1(%eax),%edx
c01038ab:	89 55 10             	mov    %edx,0x10(%ebp)
c01038ae:	0f b6 00             	movzbl (%eax),%eax
c01038b1:	0f b6 d8             	movzbl %al,%ebx
c01038b4:	83 fb 25             	cmp    $0x25,%ebx
c01038b7:	75 d4                	jne    c010388d <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c01038b9:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c01038bd:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c01038c4:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c01038cb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c01038d2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c01038d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01038dc:	8d 50 01             	lea    0x1(%eax),%edx
c01038df:	89 55 10             	mov    %edx,0x10(%ebp)
c01038e2:	0f b6 00             	movzbl (%eax),%eax
c01038e5:	0f b6 d8             	movzbl %al,%ebx
c01038e8:	8d 43 dd             	lea    -0x23(%ebx),%eax
c01038eb:	83 f8 55             	cmp    $0x55,%eax
c01038ee:	0f 87 5a 03 00 00    	ja     c0103c4e <vprintfmt+0x3cb>
c01038f4:	8b 04 85 c8 45 10 c0 	mov    -0x3fefba38(,%eax,4),%eax
c01038fb:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c01038fd:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c0103901:	eb d6                	jmp    c01038d9 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c0103903:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c0103907:	eb d0                	jmp    c01038d9 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103909:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c0103910:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103913:	89 d0                	mov    %edx,%eax
c0103915:	c1 e0 02             	shl    $0x2,%eax
c0103918:	01 d0                	add    %edx,%eax
c010391a:	01 c0                	add    %eax,%eax
c010391c:	01 d8                	add    %ebx,%eax
c010391e:	83 e8 30             	sub    $0x30,%eax
c0103921:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c0103924:	8b 45 10             	mov    0x10(%ebp),%eax
c0103927:	0f b6 00             	movzbl (%eax),%eax
c010392a:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c010392d:	83 fb 2f             	cmp    $0x2f,%ebx
c0103930:	7e 0b                	jle    c010393d <vprintfmt+0xba>
c0103932:	83 fb 39             	cmp    $0x39,%ebx
c0103935:	7f 06                	jg     c010393d <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103937:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c010393b:	eb d3                	jmp    c0103910 <vprintfmt+0x8d>
			goto process_precision;
c010393d:	eb 33                	jmp    c0103972 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c010393f:	8b 45 14             	mov    0x14(%ebp),%eax
c0103942:	8d 50 04             	lea    0x4(%eax),%edx
c0103945:	89 55 14             	mov    %edx,0x14(%ebp)
c0103948:	8b 00                	mov    (%eax),%eax
c010394a:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c010394d:	eb 23                	jmp    c0103972 <vprintfmt+0xef>

		case '.':
			if (width < 0)
c010394f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103953:	79 0c                	jns    c0103961 <vprintfmt+0xde>
				width = 0;
c0103955:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c010395c:	e9 78 ff ff ff       	jmp    c01038d9 <vprintfmt+0x56>
c0103961:	e9 73 ff ff ff       	jmp    c01038d9 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c0103966:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c010396d:	e9 67 ff ff ff       	jmp    c01038d9 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c0103972:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103976:	79 12                	jns    c010398a <vprintfmt+0x107>
				width = precision, precision = -1;
c0103978:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010397b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010397e:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c0103985:	e9 4f ff ff ff       	jmp    c01038d9 <vprintfmt+0x56>
c010398a:	e9 4a ff ff ff       	jmp    c01038d9 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c010398f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c0103993:	e9 41 ff ff ff       	jmp    c01038d9 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c0103998:	8b 45 14             	mov    0x14(%ebp),%eax
c010399b:	8d 50 04             	lea    0x4(%eax),%edx
c010399e:	89 55 14             	mov    %edx,0x14(%ebp)
c01039a1:	8b 00                	mov    (%eax),%eax
c01039a3:	8b 55 0c             	mov    0xc(%ebp),%edx
c01039a6:	89 54 24 04          	mov    %edx,0x4(%esp)
c01039aa:	89 04 24             	mov    %eax,(%esp)
c01039ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01039b0:	ff d0                	call   *%eax
			break;
c01039b2:	e9 c2 02 00 00       	jmp    c0103c79 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c01039b7:	8b 45 14             	mov    0x14(%ebp),%eax
c01039ba:	8d 50 04             	lea    0x4(%eax),%edx
c01039bd:	89 55 14             	mov    %edx,0x14(%ebp)
c01039c0:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c01039c2:	85 db                	test   %ebx,%ebx
c01039c4:	79 02                	jns    c01039c8 <vprintfmt+0x145>
				err = -err;
c01039c6:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c01039c8:	83 fb 06             	cmp    $0x6,%ebx
c01039cb:	7f 0b                	jg     c01039d8 <vprintfmt+0x155>
c01039cd:	8b 34 9d 88 45 10 c0 	mov    -0x3fefba78(,%ebx,4),%esi
c01039d4:	85 f6                	test   %esi,%esi
c01039d6:	75 23                	jne    c01039fb <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c01039d8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01039dc:	c7 44 24 08 b5 45 10 	movl   $0xc01045b5,0x8(%esp)
c01039e3:	c0 
c01039e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039e7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01039ee:	89 04 24             	mov    %eax,(%esp)
c01039f1:	e8 90 02 00 00       	call   c0103c86 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c01039f6:	e9 7e 02 00 00       	jmp    c0103c79 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c01039fb:	89 74 24 0c          	mov    %esi,0xc(%esp)
c01039ff:	c7 44 24 08 be 45 10 	movl   $0xc01045be,0x8(%esp)
c0103a06:	c0 
c0103a07:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a0a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a11:	89 04 24             	mov    %eax,(%esp)
c0103a14:	e8 6d 02 00 00       	call   c0103c86 <printfmt>
			break;
c0103a19:	e9 5b 02 00 00       	jmp    c0103c79 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c0103a1e:	8b 45 14             	mov    0x14(%ebp),%eax
c0103a21:	8d 50 04             	lea    0x4(%eax),%edx
c0103a24:	89 55 14             	mov    %edx,0x14(%ebp)
c0103a27:	8b 30                	mov    (%eax),%esi
c0103a29:	85 f6                	test   %esi,%esi
c0103a2b:	75 05                	jne    c0103a32 <vprintfmt+0x1af>
				p = "(null)";
c0103a2d:	be c1 45 10 c0       	mov    $0xc01045c1,%esi
			if (width > 0 && padc != '-')
c0103a32:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103a36:	7e 37                	jle    c0103a6f <vprintfmt+0x1ec>
c0103a38:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c0103a3c:	74 31                	je     c0103a6f <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c0103a3e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103a41:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a45:	89 34 24             	mov    %esi,(%esp)
c0103a48:	e8 9b f8 ff ff       	call   c01032e8 <strnlen>
c0103a4d:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0103a50:	eb 17                	jmp    c0103a69 <vprintfmt+0x1e6>
					putch(padc, putdat);
c0103a52:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c0103a56:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103a59:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103a5d:	89 04 24             	mov    %eax,(%esp)
c0103a60:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a63:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c0103a65:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103a69:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103a6d:	7f e3                	jg     c0103a52 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103a6f:	eb 38                	jmp    c0103aa9 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c0103a71:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0103a75:	74 1f                	je     c0103a96 <vprintfmt+0x213>
c0103a77:	83 fb 1f             	cmp    $0x1f,%ebx
c0103a7a:	7e 05                	jle    c0103a81 <vprintfmt+0x1fe>
c0103a7c:	83 fb 7e             	cmp    $0x7e,%ebx
c0103a7f:	7e 15                	jle    c0103a96 <vprintfmt+0x213>
					putch('?', putdat);
c0103a81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a84:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a88:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c0103a8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a92:	ff d0                	call   *%eax
c0103a94:	eb 0f                	jmp    c0103aa5 <vprintfmt+0x222>
				else
					putch(ch, putdat);
c0103a96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a99:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a9d:	89 1c 24             	mov    %ebx,(%esp)
c0103aa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103aa3:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103aa5:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103aa9:	89 f0                	mov    %esi,%eax
c0103aab:	8d 70 01             	lea    0x1(%eax),%esi
c0103aae:	0f b6 00             	movzbl (%eax),%eax
c0103ab1:	0f be d8             	movsbl %al,%ebx
c0103ab4:	85 db                	test   %ebx,%ebx
c0103ab6:	74 10                	je     c0103ac8 <vprintfmt+0x245>
c0103ab8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103abc:	78 b3                	js     c0103a71 <vprintfmt+0x1ee>
c0103abe:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c0103ac2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103ac6:	79 a9                	jns    c0103a71 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103ac8:	eb 17                	jmp    c0103ae1 <vprintfmt+0x25e>
				putch(' ', putdat);
c0103aca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103acd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ad1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103ad8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103adb:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103add:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103ae1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103ae5:	7f e3                	jg     c0103aca <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103ae7:	e9 8d 01 00 00       	jmp    c0103c79 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c0103aec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103aef:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103af3:	8d 45 14             	lea    0x14(%ebp),%eax
c0103af6:	89 04 24             	mov    %eax,(%esp)
c0103af9:	e8 3e fd ff ff       	call   c010383c <getint>
c0103afe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b01:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c0103b04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b07:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103b0a:	85 d2                	test   %edx,%edx
c0103b0c:	79 26                	jns    c0103b34 <vprintfmt+0x2b1>
				putch('-', putdat);
c0103b0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b11:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b15:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0103b1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b1f:	ff d0                	call   *%eax
				num = -(long long) num;
c0103b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b24:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103b27:	f7 d8                	neg    %eax
c0103b29:	83 d2 00             	adc    $0x0,%edx
c0103b2c:	f7 da                	neg    %edx
c0103b2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b31:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0103b34:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103b3b:	e9 c5 00 00 00       	jmp    c0103c05 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c0103b40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b43:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b47:	8d 45 14             	lea    0x14(%ebp),%eax
c0103b4a:	89 04 24             	mov    %eax,(%esp)
c0103b4d:	e8 9b fc ff ff       	call   c01037ed <getuint>
c0103b52:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b55:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c0103b58:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103b5f:	e9 a1 00 00 00       	jmp    c0103c05 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c0103b64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b67:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b6b:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103b72:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b75:	ff d0                	call   *%eax
			putch('X', putdat);
c0103b77:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b7a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b7e:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103b85:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b88:	ff d0                	call   *%eax
			putch('X', putdat);
c0103b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b8d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b91:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103b98:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b9b:	ff d0                	call   *%eax
			break;
c0103b9d:	e9 d7 00 00 00       	jmp    c0103c79 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c0103ba2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ba5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ba9:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c0103bb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb3:	ff d0                	call   *%eax
			putch('x', putdat);
c0103bb5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bb8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bbc:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c0103bc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bc6:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103bc8:	8b 45 14             	mov    0x14(%ebp),%eax
c0103bcb:	8d 50 04             	lea    0x4(%eax),%edx
c0103bce:	89 55 14             	mov    %edx,0x14(%ebp)
c0103bd1:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c0103bd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103bd6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0103bdd:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0103be4:	eb 1f                	jmp    c0103c05 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103be6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103be9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bed:	8d 45 14             	lea    0x14(%ebp),%eax
c0103bf0:	89 04 24             	mov    %eax,(%esp)
c0103bf3:	e8 f5 fb ff ff       	call   c01037ed <getuint>
c0103bf8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103bfb:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103bfe:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0103c05:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0103c09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c0c:	89 54 24 18          	mov    %edx,0x18(%esp)
c0103c10:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103c13:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103c17:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103c1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c1e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103c21:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103c25:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103c29:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c2c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c30:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c33:	89 04 24             	mov    %eax,(%esp)
c0103c36:	e8 d4 fa ff ff       	call   c010370f <printnum>
			break;
c0103c3b:	eb 3c                	jmp    c0103c79 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c0103c3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c40:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c44:	89 1c 24             	mov    %ebx,(%esp)
c0103c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c4a:	ff d0                	call   *%eax
			break;
c0103c4c:	eb 2b                	jmp    c0103c79 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c0103c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c51:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c55:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c0103c5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c5f:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c0103c61:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103c65:	eb 04                	jmp    c0103c6b <vprintfmt+0x3e8>
c0103c67:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103c6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c6e:	83 e8 01             	sub    $0x1,%eax
c0103c71:	0f b6 00             	movzbl (%eax),%eax
c0103c74:	3c 25                	cmp    $0x25,%al
c0103c76:	75 ef                	jne    c0103c67 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c0103c78:	90                   	nop
		}
	}
c0103c79:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103c7a:	e9 26 fc ff ff       	jmp    c01038a5 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c0103c7f:	83 c4 40             	add    $0x40,%esp
c0103c82:	5b                   	pop    %ebx
c0103c83:	5e                   	pop    %esi
c0103c84:	5d                   	pop    %ebp
c0103c85:	c3                   	ret    

c0103c86 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c0103c86:	55                   	push   %ebp
c0103c87:	89 e5                	mov    %esp,%ebp
c0103c89:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0103c8c:	8d 45 14             	lea    0x14(%ebp),%eax
c0103c8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c0103c92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c95:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103c99:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c9c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ca3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103caa:	89 04 24             	mov    %eax,(%esp)
c0103cad:	e8 d1 fb ff ff       	call   c0103883 <vprintfmt>
	va_end(ap);
}
c0103cb2:	c9                   	leave  
c0103cb3:	c3                   	ret    

c0103cb4 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c0103cb4:	55                   	push   %ebp
c0103cb5:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cba:	8b 40 08             	mov    0x8(%eax),%eax
c0103cbd:	8d 50 01             	lea    0x1(%eax),%edx
c0103cc0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cc3:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103cc6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cc9:	8b 10                	mov    (%eax),%edx
c0103ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cce:	8b 40 04             	mov    0x4(%eax),%eax
c0103cd1:	39 c2                	cmp    %eax,%edx
c0103cd3:	73 12                	jae    c0103ce7 <sprintputch+0x33>
		*b->buf++ = ch;
c0103cd5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cd8:	8b 00                	mov    (%eax),%eax
c0103cda:	8d 48 01             	lea    0x1(%eax),%ecx
c0103cdd:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103ce0:	89 0a                	mov    %ecx,(%edx)
c0103ce2:	8b 55 08             	mov    0x8(%ebp),%edx
c0103ce5:	88 10                	mov    %dl,(%eax)
}
c0103ce7:	5d                   	pop    %ebp
c0103ce8:	c3                   	ret    

c0103ce9 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103ce9:	55                   	push   %ebp
c0103cea:	89 e5                	mov    %esp,%ebp
c0103cec:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103cef:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103cf5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cf8:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103cfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cfe:	01 d0                	add    %edx,%eax
c0103d00:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103d03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0103d0a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103d0e:	74 06                	je     c0103d16 <vsnprintf+0x2d>
c0103d10:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103d14:	7f 07                	jg     c0103d1d <vsnprintf+0x34>
		return -E_INVAL;
c0103d16:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0103d1b:	eb 2a                	jmp    c0103d47 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c0103d1d:	8b 45 14             	mov    0x14(%ebp),%eax
c0103d20:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103d24:	8b 45 10             	mov    0x10(%ebp),%eax
c0103d27:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103d2b:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0103d2e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103d32:	c7 04 24 b4 3c 10 c0 	movl   $0xc0103cb4,(%esp)
c0103d39:	e8 45 fb ff ff       	call   c0103883 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c0103d3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103d41:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c0103d44:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103d47:	c9                   	leave  
c0103d48:	c3                   	ret    

c0103d49 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c0103d49:	55                   	push   %ebp
c0103d4a:	89 e5                	mov    %esp,%ebp
c0103d4c:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c0103d4f:	8d 45 14             	lea    0x14(%ebp),%eax
c0103d52:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c0103d55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103d58:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103d5c:	8b 45 10             	mov    0x10(%ebp),%eax
c0103d5f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103d63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d66:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103d6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d6d:	89 04 24             	mov    %eax,(%esp)
c0103d70:	e8 74 ff ff ff       	call   c0103ce9 <vsnprintf>
c0103d75:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c0103d78:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103d7b:	c9                   	leave  
c0103d7c:	c3                   	ret    

c0103d7d <srand>:
static int seed = 0;

void
srand(int s) {
c0103d7d:	55                   	push   %ebp
c0103d7e:	89 e5                	mov    %esp,%ebp
	seed = s;
c0103d80:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d83:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c0103d88:	5d                   	pop    %ebp
c0103d89:	c3                   	ret    

c0103d8a <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0103d8a:	55                   	push   %ebp
c0103d8b:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0103d8d:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103d92:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0103d98:	83 c0 01             	add    $0x1,%eax
c0103d9b:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c0103da0:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103da5:	c1 f8 10             	sar    $0x10,%eax
c0103da8:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0103dad:	5d                   	pop    %ebp
c0103dae:	c3                   	ret    
c0103daf:	90                   	nop

c0103db0 <__udivdi3>:
c0103db0:	55                   	push   %ebp
c0103db1:	57                   	push   %edi
c0103db2:	56                   	push   %esi
c0103db3:	83 ec 0c             	sub    $0xc,%esp
c0103db6:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103dba:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c0103dbe:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103dc2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103dc6:	85 c0                	test   %eax,%eax
c0103dc8:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0103dcc:	89 ea                	mov    %ebp,%edx
c0103dce:	89 0c 24             	mov    %ecx,(%esp)
c0103dd1:	75 2d                	jne    c0103e00 <__udivdi3+0x50>
c0103dd3:	39 e9                	cmp    %ebp,%ecx
c0103dd5:	77 61                	ja     c0103e38 <__udivdi3+0x88>
c0103dd7:	85 c9                	test   %ecx,%ecx
c0103dd9:	89 ce                	mov    %ecx,%esi
c0103ddb:	75 0b                	jne    c0103de8 <__udivdi3+0x38>
c0103ddd:	b8 01 00 00 00       	mov    $0x1,%eax
c0103de2:	31 d2                	xor    %edx,%edx
c0103de4:	f7 f1                	div    %ecx
c0103de6:	89 c6                	mov    %eax,%esi
c0103de8:	31 d2                	xor    %edx,%edx
c0103dea:	89 e8                	mov    %ebp,%eax
c0103dec:	f7 f6                	div    %esi
c0103dee:	89 c5                	mov    %eax,%ebp
c0103df0:	89 f8                	mov    %edi,%eax
c0103df2:	f7 f6                	div    %esi
c0103df4:	89 ea                	mov    %ebp,%edx
c0103df6:	83 c4 0c             	add    $0xc,%esp
c0103df9:	5e                   	pop    %esi
c0103dfa:	5f                   	pop    %edi
c0103dfb:	5d                   	pop    %ebp
c0103dfc:	c3                   	ret    
c0103dfd:	8d 76 00             	lea    0x0(%esi),%esi
c0103e00:	39 e8                	cmp    %ebp,%eax
c0103e02:	77 24                	ja     c0103e28 <__udivdi3+0x78>
c0103e04:	0f bd e8             	bsr    %eax,%ebp
c0103e07:	83 f5 1f             	xor    $0x1f,%ebp
c0103e0a:	75 3c                	jne    c0103e48 <__udivdi3+0x98>
c0103e0c:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103e10:	39 34 24             	cmp    %esi,(%esp)
c0103e13:	0f 86 9f 00 00 00    	jbe    c0103eb8 <__udivdi3+0x108>
c0103e19:	39 d0                	cmp    %edx,%eax
c0103e1b:	0f 82 97 00 00 00    	jb     c0103eb8 <__udivdi3+0x108>
c0103e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103e28:	31 d2                	xor    %edx,%edx
c0103e2a:	31 c0                	xor    %eax,%eax
c0103e2c:	83 c4 0c             	add    $0xc,%esp
c0103e2f:	5e                   	pop    %esi
c0103e30:	5f                   	pop    %edi
c0103e31:	5d                   	pop    %ebp
c0103e32:	c3                   	ret    
c0103e33:	90                   	nop
c0103e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103e38:	89 f8                	mov    %edi,%eax
c0103e3a:	f7 f1                	div    %ecx
c0103e3c:	31 d2                	xor    %edx,%edx
c0103e3e:	83 c4 0c             	add    $0xc,%esp
c0103e41:	5e                   	pop    %esi
c0103e42:	5f                   	pop    %edi
c0103e43:	5d                   	pop    %ebp
c0103e44:	c3                   	ret    
c0103e45:	8d 76 00             	lea    0x0(%esi),%esi
c0103e48:	89 e9                	mov    %ebp,%ecx
c0103e4a:	8b 3c 24             	mov    (%esp),%edi
c0103e4d:	d3 e0                	shl    %cl,%eax
c0103e4f:	89 c6                	mov    %eax,%esi
c0103e51:	b8 20 00 00 00       	mov    $0x20,%eax
c0103e56:	29 e8                	sub    %ebp,%eax
c0103e58:	89 c1                	mov    %eax,%ecx
c0103e5a:	d3 ef                	shr    %cl,%edi
c0103e5c:	89 e9                	mov    %ebp,%ecx
c0103e5e:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0103e62:	8b 3c 24             	mov    (%esp),%edi
c0103e65:	09 74 24 08          	or     %esi,0x8(%esp)
c0103e69:	89 d6                	mov    %edx,%esi
c0103e6b:	d3 e7                	shl    %cl,%edi
c0103e6d:	89 c1                	mov    %eax,%ecx
c0103e6f:	89 3c 24             	mov    %edi,(%esp)
c0103e72:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103e76:	d3 ee                	shr    %cl,%esi
c0103e78:	89 e9                	mov    %ebp,%ecx
c0103e7a:	d3 e2                	shl    %cl,%edx
c0103e7c:	89 c1                	mov    %eax,%ecx
c0103e7e:	d3 ef                	shr    %cl,%edi
c0103e80:	09 d7                	or     %edx,%edi
c0103e82:	89 f2                	mov    %esi,%edx
c0103e84:	89 f8                	mov    %edi,%eax
c0103e86:	f7 74 24 08          	divl   0x8(%esp)
c0103e8a:	89 d6                	mov    %edx,%esi
c0103e8c:	89 c7                	mov    %eax,%edi
c0103e8e:	f7 24 24             	mull   (%esp)
c0103e91:	39 d6                	cmp    %edx,%esi
c0103e93:	89 14 24             	mov    %edx,(%esp)
c0103e96:	72 30                	jb     c0103ec8 <__udivdi3+0x118>
c0103e98:	8b 54 24 04          	mov    0x4(%esp),%edx
c0103e9c:	89 e9                	mov    %ebp,%ecx
c0103e9e:	d3 e2                	shl    %cl,%edx
c0103ea0:	39 c2                	cmp    %eax,%edx
c0103ea2:	73 05                	jae    c0103ea9 <__udivdi3+0xf9>
c0103ea4:	3b 34 24             	cmp    (%esp),%esi
c0103ea7:	74 1f                	je     c0103ec8 <__udivdi3+0x118>
c0103ea9:	89 f8                	mov    %edi,%eax
c0103eab:	31 d2                	xor    %edx,%edx
c0103ead:	e9 7a ff ff ff       	jmp    c0103e2c <__udivdi3+0x7c>
c0103eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103eb8:	31 d2                	xor    %edx,%edx
c0103eba:	b8 01 00 00 00       	mov    $0x1,%eax
c0103ebf:	e9 68 ff ff ff       	jmp    c0103e2c <__udivdi3+0x7c>
c0103ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103ec8:	8d 47 ff             	lea    -0x1(%edi),%eax
c0103ecb:	31 d2                	xor    %edx,%edx
c0103ecd:	83 c4 0c             	add    $0xc,%esp
c0103ed0:	5e                   	pop    %esi
c0103ed1:	5f                   	pop    %edi
c0103ed2:	5d                   	pop    %ebp
c0103ed3:	c3                   	ret    
c0103ed4:	66 90                	xchg   %ax,%ax
c0103ed6:	66 90                	xchg   %ax,%ax
c0103ed8:	66 90                	xchg   %ax,%ax
c0103eda:	66 90                	xchg   %ax,%ax
c0103edc:	66 90                	xchg   %ax,%ax
c0103ede:	66 90                	xchg   %ax,%ax

c0103ee0 <__umoddi3>:
c0103ee0:	55                   	push   %ebp
c0103ee1:	57                   	push   %edi
c0103ee2:	56                   	push   %esi
c0103ee3:	83 ec 14             	sub    $0x14,%esp
c0103ee6:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103eea:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103eee:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103ef2:	89 c7                	mov    %eax,%edi
c0103ef4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ef8:	8b 44 24 30          	mov    0x30(%esp),%eax
c0103efc:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103f00:	89 34 24             	mov    %esi,(%esp)
c0103f03:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103f07:	85 c0                	test   %eax,%eax
c0103f09:	89 c2                	mov    %eax,%edx
c0103f0b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103f0f:	75 17                	jne    c0103f28 <__umoddi3+0x48>
c0103f11:	39 fe                	cmp    %edi,%esi
c0103f13:	76 4b                	jbe    c0103f60 <__umoddi3+0x80>
c0103f15:	89 c8                	mov    %ecx,%eax
c0103f17:	89 fa                	mov    %edi,%edx
c0103f19:	f7 f6                	div    %esi
c0103f1b:	89 d0                	mov    %edx,%eax
c0103f1d:	31 d2                	xor    %edx,%edx
c0103f1f:	83 c4 14             	add    $0x14,%esp
c0103f22:	5e                   	pop    %esi
c0103f23:	5f                   	pop    %edi
c0103f24:	5d                   	pop    %ebp
c0103f25:	c3                   	ret    
c0103f26:	66 90                	xchg   %ax,%ax
c0103f28:	39 f8                	cmp    %edi,%eax
c0103f2a:	77 54                	ja     c0103f80 <__umoddi3+0xa0>
c0103f2c:	0f bd e8             	bsr    %eax,%ebp
c0103f2f:	83 f5 1f             	xor    $0x1f,%ebp
c0103f32:	75 5c                	jne    c0103f90 <__umoddi3+0xb0>
c0103f34:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0103f38:	39 3c 24             	cmp    %edi,(%esp)
c0103f3b:	0f 87 e7 00 00 00    	ja     c0104028 <__umoddi3+0x148>
c0103f41:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103f45:	29 f1                	sub    %esi,%ecx
c0103f47:	19 c7                	sbb    %eax,%edi
c0103f49:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103f4d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103f51:	8b 44 24 08          	mov    0x8(%esp),%eax
c0103f55:	8b 54 24 0c          	mov    0xc(%esp),%edx
c0103f59:	83 c4 14             	add    $0x14,%esp
c0103f5c:	5e                   	pop    %esi
c0103f5d:	5f                   	pop    %edi
c0103f5e:	5d                   	pop    %ebp
c0103f5f:	c3                   	ret    
c0103f60:	85 f6                	test   %esi,%esi
c0103f62:	89 f5                	mov    %esi,%ebp
c0103f64:	75 0b                	jne    c0103f71 <__umoddi3+0x91>
c0103f66:	b8 01 00 00 00       	mov    $0x1,%eax
c0103f6b:	31 d2                	xor    %edx,%edx
c0103f6d:	f7 f6                	div    %esi
c0103f6f:	89 c5                	mov    %eax,%ebp
c0103f71:	8b 44 24 04          	mov    0x4(%esp),%eax
c0103f75:	31 d2                	xor    %edx,%edx
c0103f77:	f7 f5                	div    %ebp
c0103f79:	89 c8                	mov    %ecx,%eax
c0103f7b:	f7 f5                	div    %ebp
c0103f7d:	eb 9c                	jmp    c0103f1b <__umoddi3+0x3b>
c0103f7f:	90                   	nop
c0103f80:	89 c8                	mov    %ecx,%eax
c0103f82:	89 fa                	mov    %edi,%edx
c0103f84:	83 c4 14             	add    $0x14,%esp
c0103f87:	5e                   	pop    %esi
c0103f88:	5f                   	pop    %edi
c0103f89:	5d                   	pop    %ebp
c0103f8a:	c3                   	ret    
c0103f8b:	90                   	nop
c0103f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103f90:	8b 04 24             	mov    (%esp),%eax
c0103f93:	be 20 00 00 00       	mov    $0x20,%esi
c0103f98:	89 e9                	mov    %ebp,%ecx
c0103f9a:	29 ee                	sub    %ebp,%esi
c0103f9c:	d3 e2                	shl    %cl,%edx
c0103f9e:	89 f1                	mov    %esi,%ecx
c0103fa0:	d3 e8                	shr    %cl,%eax
c0103fa2:	89 e9                	mov    %ebp,%ecx
c0103fa4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103fa8:	8b 04 24             	mov    (%esp),%eax
c0103fab:	09 54 24 04          	or     %edx,0x4(%esp)
c0103faf:	89 fa                	mov    %edi,%edx
c0103fb1:	d3 e0                	shl    %cl,%eax
c0103fb3:	89 f1                	mov    %esi,%ecx
c0103fb5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103fb9:	8b 44 24 10          	mov    0x10(%esp),%eax
c0103fbd:	d3 ea                	shr    %cl,%edx
c0103fbf:	89 e9                	mov    %ebp,%ecx
c0103fc1:	d3 e7                	shl    %cl,%edi
c0103fc3:	89 f1                	mov    %esi,%ecx
c0103fc5:	d3 e8                	shr    %cl,%eax
c0103fc7:	89 e9                	mov    %ebp,%ecx
c0103fc9:	09 f8                	or     %edi,%eax
c0103fcb:	8b 7c 24 10          	mov    0x10(%esp),%edi
c0103fcf:	f7 74 24 04          	divl   0x4(%esp)
c0103fd3:	d3 e7                	shl    %cl,%edi
c0103fd5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103fd9:	89 d7                	mov    %edx,%edi
c0103fdb:	f7 64 24 08          	mull   0x8(%esp)
c0103fdf:	39 d7                	cmp    %edx,%edi
c0103fe1:	89 c1                	mov    %eax,%ecx
c0103fe3:	89 14 24             	mov    %edx,(%esp)
c0103fe6:	72 2c                	jb     c0104014 <__umoddi3+0x134>
c0103fe8:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c0103fec:	72 22                	jb     c0104010 <__umoddi3+0x130>
c0103fee:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103ff2:	29 c8                	sub    %ecx,%eax
c0103ff4:	19 d7                	sbb    %edx,%edi
c0103ff6:	89 e9                	mov    %ebp,%ecx
c0103ff8:	89 fa                	mov    %edi,%edx
c0103ffa:	d3 e8                	shr    %cl,%eax
c0103ffc:	89 f1                	mov    %esi,%ecx
c0103ffe:	d3 e2                	shl    %cl,%edx
c0104000:	89 e9                	mov    %ebp,%ecx
c0104002:	d3 ef                	shr    %cl,%edi
c0104004:	09 d0                	or     %edx,%eax
c0104006:	89 fa                	mov    %edi,%edx
c0104008:	83 c4 14             	add    $0x14,%esp
c010400b:	5e                   	pop    %esi
c010400c:	5f                   	pop    %edi
c010400d:	5d                   	pop    %ebp
c010400e:	c3                   	ret    
c010400f:	90                   	nop
c0104010:	39 d7                	cmp    %edx,%edi
c0104012:	75 da                	jne    c0103fee <__umoddi3+0x10e>
c0104014:	8b 14 24             	mov    (%esp),%edx
c0104017:	89 c1                	mov    %eax,%ecx
c0104019:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c010401d:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0104021:	eb cb                	jmp    c0103fee <__umoddi3+0x10e>
c0104023:	90                   	nop
c0104024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104028:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c010402c:	0f 82 0f ff ff ff    	jb     c0103f41 <__umoddi3+0x61>
c0104032:	e9 1a ff ff ff       	jmp    c0103f51 <__umoddi3+0x71>
