
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0100000 <do_syscall>:
int ksem_wait(Sema *sema);
int ksem_trywait(Sema *sema);
int ksem_post(Sema *sema);
int kthread_join(void);

void do_syscall(struct TrapFrame *tf) {
c0100000:	55                   	push   %ebp
c0100001:	89 e5                	mov    %esp,%ebp
c0100003:	83 ec 28             	sub    $0x28,%esp
	//printk("%d\n",tf->eax);
	switch(tf->eax) {
c0100006:	8b 45 08             	mov    0x8(%ebp),%eax
c0100009:	8b 40 1c             	mov    0x1c(%eax),%eax
c010000c:	83 f8 0f             	cmp    $0xf,%eax
c010000f:	0f 87 66 01 00 00    	ja     c010017b <do_syscall+0x17b>
c0100015:	8b 04 85 14 40 10 c0 	mov    -0x3fefbfec(,%eax,4),%eax
c010001c:	ff e0                	jmp    *%eax
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c010001e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100021:	8b 40 10             	mov    0x10(%eax),%eax
c0100024:	89 04 24             	mov    %eax,(%esp)
c0100027:	e8 62 0a 00 00       	call   c0100a8e <sys_pr>
c010002c:	89 c2                	mov    %eax,%edx
c010002e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100031:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100034:	e9 72 01 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_time:
			tf->eax=sys_time();
c0100039:	e8 94 01 00 00       	call   c01001d2 <sys_time>
c010003e:	89 c2                	mov    %eax,%edx
c0100040:	8b 45 08             	mov    0x8(%ebp),%eax
c0100043:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100046:	e9 60 01 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
c010004b:	e8 8c 01 00 00       	call   c01001dc <sys_readkey>
c0100050:	89 c2                	mov    %eax,%edx
c0100052:	8b 45 08             	mov    0x8(%ebp),%eax
c0100055:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100058:	e9 4e 01 00 00       	jmp    c01001ab <do_syscall+0x1ab>
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
c010007e:	e8 56 2c 00 00       	call   c0102cd9 <sys_write>
c0100083:	89 c2                	mov    %eax,%edx
c0100085:	8b 45 08             	mov    0x8(%ebp),%eax
c0100088:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008b:	e9 1b 01 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_fork:
			sys_fork();
c0100090:	e8 ff 15 00 00       	call   c0101694 <sys_fork>
			break;
c0100095:	e9 11 01 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_getpid:
			tf->eax=sys_getpid();
c010009a:	e8 4d 16 00 00       	call   c01016ec <sys_getpid>
c010009f:	8b 55 08             	mov    0x8(%ebp),%edx
c01000a2:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c01000a5:	e9 01 01 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_exit:
			sys_exit();
c01000aa:	e8 4a 16 00 00       	call   c01016f9 <sys_exit>
			break;
c01000af:	e9 f7 00 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01000b7:	8b 40 10             	mov    0x10(%eax),%eax
c01000ba:	89 04 24             	mov    %eax,(%esp)
c01000bd:	e8 6e 17 00 00       	call   c0101830 <sys_sleep>
			break;
c01000c2:	e9 e4 00 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_thread:
			tf->eax=kthread((void*)tf->ebx);
c01000c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ca:	8b 40 10             	mov    0x10(%eax),%eax
c01000cd:	89 04 24             	mov    %eax,(%esp)
c01000d0:	e8 6b 18 00 00       	call   c0101940 <kthread>
c01000d5:	89 c2                	mov    %eax,%edx
c01000d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000da:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c01000dd:	e9 c9 00 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_sem_init:
			tf->eax=ksem_init((void*)tf->ebx,tf->ecx);
c01000e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01000e5:	8b 40 18             	mov    0x18(%eax),%eax
c01000e8:	89 c2                	mov    %eax,%edx
c01000ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ed:	8b 40 10             	mov    0x10(%eax),%eax
c01000f0:	89 54 24 04          	mov    %edx,0x4(%esp)
c01000f4:	89 04 24             	mov    %eax,(%esp)
c01000f7:	e8 79 1a 00 00       	call   c0101b75 <ksem_init>
c01000fc:	89 c2                	mov    %eax,%edx
c01000fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0100101:	89 50 1c             	mov    %edx,0x1c(%eax)
			//printk("131231412\n");
			break;
c0100104:	e9 a2 00 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_sem_destroy:
			tf->eax=ksem_destroy((Sema*)tf->ebx);
c0100109:	8b 45 08             	mov    0x8(%ebp),%eax
c010010c:	8b 40 10             	mov    0x10(%eax),%eax
c010010f:	89 04 24             	mov    %eax,(%esp)
c0100112:	e8 8b 1a 00 00       	call   c0101ba2 <ksem_destroy>
c0100117:	89 c2                	mov    %eax,%edx
c0100119:	8b 45 08             	mov    0x8(%ebp),%eax
c010011c:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010011f:	e9 87 00 00 00       	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_sem_wait:
			tf->eax=ksem_wait((Sema*)tf->ebx);
c0100124:	8b 45 08             	mov    0x8(%ebp),%eax
c0100127:	8b 40 10             	mov    0x10(%eax),%eax
c010012a:	89 04 24             	mov    %eax,(%esp)
c010012d:	e8 d9 1a 00 00       	call   c0101c0b <ksem_wait>
c0100132:	89 c2                	mov    %eax,%edx
c0100134:	8b 45 08             	mov    0x8(%ebp),%eax
c0100137:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010013a:	eb 6f                	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_sem_trywait:
			tf->eax=ksem_trywait((Sema*)tf->ebx);
c010013c:	8b 45 08             	mov    0x8(%ebp),%eax
c010013f:	8b 40 10             	mov    0x10(%eax),%eax
c0100142:	89 04 24             	mov    %eax,(%esp)
c0100145:	e8 3b 1b 00 00       	call   c0101c85 <ksem_trywait>
c010014a:	89 c2                	mov    %eax,%edx
c010014c:	8b 45 08             	mov    0x8(%ebp),%eax
c010014f:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100152:	eb 57                	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_sem_post:
			tf->eax=ksem_post((Sema*)tf->ebx);
c0100154:	8b 45 08             	mov    0x8(%ebp),%eax
c0100157:	8b 40 10             	mov    0x10(%eax),%eax
c010015a:	89 04 24             	mov    %eax,(%esp)
c010015d:	e8 59 1b 00 00       	call   c0101cbb <ksem_post>
c0100162:	89 c2                	mov    %eax,%edx
c0100164:	8b 45 08             	mov    0x8(%ebp),%eax
c0100167:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010016a:	eb 3f                	jmp    c01001ab <do_syscall+0x1ab>
		case SYS_thread_join:
			tf->eax=kthread_join();
c010016c:	e8 3c 18 00 00       	call   c01019ad <kthread_join>
c0100171:	89 c2                	mov    %eax,%edx
c0100173:	8b 45 08             	mov    0x8(%ebp),%eax
c0100176:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100179:	eb 30                	jmp    c01001ab <do_syscall+0x1ab>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c010017b:	8b 45 08             	mov    0x8(%ebp),%eax
c010017e:	8b 50 38             	mov    0x38(%eax),%edx
c0100181:	8b 45 08             	mov    0x8(%ebp),%eax
c0100184:	8b 40 1c             	mov    0x1c(%eax),%eax
c0100187:	89 54 24 10          	mov    %edx,0x10(%esp)
c010018b:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010018f:	c7 44 24 08 c8 3f 10 	movl   $0xc0103fc8,0x8(%esp)
c0100196:	c0 
c0100197:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c010019e:	00 
c010019f:	c7 04 24 f5 3f 10 c0 	movl   $0xc0103ff5,(%esp)
c01001a6:	e8 8e 2a 00 00       	call   c0102c39 <_panic>
 	}
} 
c01001ab:	c9                   	leave  
c01001ac:	c3                   	ret    

c01001ad <enable_interrupt>:
	asm volatile("lidt (%0)" : : "r"(data));
}

/* 打开外部中断 */
static inline void
enable_interrupt(void) {
c01001ad:	55                   	push   %ebp
c01001ae:	89 e5                	mov    %esp,%ebp
	asm volatile("sti");
c01001b0:	fb                   	sti    
}
c01001b1:	5d                   	pop    %ebp
c01001b2:	c3                   	ret    

c01001b3 <timer_event>:
void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
c01001b3:	55                   	push   %ebp
c01001b4:	89 e5                	mov    %esp,%ebp
	tick++;
c01001b6:	a1 00 10 11 c0       	mov    0xc0111000,%eax
c01001bb:	83 c0 01             	add    $0x1,%eax
c01001be:	a3 00 10 11 c0       	mov    %eax,0xc0111000
}
c01001c3:	5d                   	pop    %ebp
c01001c4:	c3                   	ret    

c01001c5 <keyboard_event>:
static int last_code = -1;
void keyboard_event(int code)
{
c01001c5:	55                   	push   %ebp
c01001c6:	89 e5                	mov    %esp,%ebp
	last_code = code;
c01001c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01001cb:	a3 00 60 10 c0       	mov    %eax,0xc0106000
}
c01001d0:	5d                   	pop    %ebp
c01001d1:	c3                   	ret    

c01001d2 <sys_time>:
int sys_time(void)
{
c01001d2:	55                   	push   %ebp
c01001d3:	89 e5                	mov    %esp,%ebp
	return tick;
c01001d5:	a1 00 10 11 c0       	mov    0xc0111000,%eax
}
c01001da:	5d                   	pop    %ebp
c01001db:	c3                   	ret    

c01001dc <sys_readkey>:
int sys_readkey(void)
{
c01001dc:	55                   	push   %ebp
c01001dd:	89 e5                	mov    %esp,%ebp
c01001df:	83 ec 10             	sub    $0x10,%esp
	int code = last_code;
c01001e2:	a1 00 60 10 c0       	mov    0xc0106000,%eax
c01001e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	last_code = -1;
c01001ea:	c7 05 00 60 10 c0 ff 	movl   $0xffffffff,0xc0106000
c01001f1:	ff ff ff 
	return code;
c01001f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01001f7:	c9                   	leave  
c01001f8:	c3                   	ret    

c01001f9 <main>:

int main()
{
c01001f9:	55                   	push   %ebp
c01001fa:	89 e5                	mov    %esp,%ebp
c01001fc:	83 e4 f0             	and    $0xfffffff0,%esp
c01001ff:	83 ec 10             	sub    $0x10,%esp
	page_init();
c0100202:	e8 26 1c 00 00       	call   c0101e2d <page_init>
	//printk("here");
	init_segment();
c0100207:	e8 6d 29 00 00       	call   c0102b79 <init_segment>
	pcb_init();
c010020c:	e8 34 0c 00 00       	call   c0100e45 <pcb_init>
	//printk("here");
	init_serial();
c0100211:	e8 9a 08 00 00       	call   c0100ab0 <init_serial>
	init_video();
c0100216:	e8 63 07 00 00       	call   c010097e <init_video>
	init_timer();
c010021b:	e8 84 09 00 00       	call   c0100ba4 <init_timer>
	init_idt();
c0100220:	e8 73 02 00 00       	call   c0100498 <init_idt>
	init_intr();
c0100225:	e8 31 00 00 00       	call   c010025b <init_intr>
	
	//printk("here");

	set_timer_intr_handler(timer_event);
c010022a:	c7 04 24 b3 01 10 c0 	movl   $0xc01001b3,(%esp)
c0100231:	e8 80 05 00 00       	call   c01007b6 <set_timer_intr_handler>
	set_keyboard_intr_handler(keyboard_event);
c0100236:	c7 04 24 c5 01 10 c0 	movl   $0xc01001c5,(%esp)
c010023d:	e8 81 05 00 00       	call   c01007c3 <set_keyboard_intr_handler>
	//printk("here");
	pcb_new();
c0100242:	e8 40 10 00 00       	call   c0101287 <pcb_new>
	//PCB* p=pcb_new();
	enable_interrupt();
c0100247:	e8 61 ff ff ff       	call   c01001ad <enable_interrupt>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c010024c:	f4                   	hlt    
	hlt();
	printk("we are here");
c010024d:	c7 04 24 54 40 10 c0 	movl   $0xc0104054,(%esp)
c0100254:	e8 0f 2b 00 00       	call   c0102d68 <printk>
	//to_user(p);
	//printk("here");
	while(1);
c0100259:	eb fe                	jmp    c0100259 <main+0x60>

c010025b <init_intr>:
#define IRQ_SLAVE	2

/* 初始�?259中断控制器：
 * 硬件中断IRQ�?2号开始，自动发送EOI */
void
init_intr(void) {
c010025b:	55                   	push   %ebp
c010025c:	89 e5                	mov    %esp,%ebp
c010025e:	83 ec 70             	sub    $0x70,%esp
c0100261:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
c0100268:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c010026c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100270:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100273:	ee                   	out    %al,(%dx)
c0100274:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
c010027b:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
c010027f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100283:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100286:	ee                   	out    %al,(%dx)
c0100287:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010028e:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
c0100292:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100296:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100299:	ee                   	out    %al,(%dx)
c010029a:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
c01002a1:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
c01002a5:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01002a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01002ac:	ee                   	out    %al,(%dx)
c01002ad:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
c01002b4:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
c01002b8:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01002bc:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01002bf:	ee                   	out    %al,(%dx)
c01002c0:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
c01002c7:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
c01002cb:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01002cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01002d2:	ee                   	out    %al,(%dx)
c01002d3:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
c01002da:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
c01002de:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c01002e2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01002e5:	ee                   	out    %al,(%dx)
c01002e6:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
c01002ed:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
c01002f1:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c01002f5:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c01002f8:	ee                   	out    %al,(%dx)
c01002f9:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
c0100300:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
c0100304:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0100308:	8b 55 bc             	mov    -0x44(%ebp),%edx
c010030b:	ee                   	out    %al,(%dx)
c010030c:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
c0100313:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
c0100317:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
c010031b:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010031e:	ee                   	out    %al,(%dx)
c010031f:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
c0100326:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
c010032a:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
c010032e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100331:	ee                   	out    %al,(%dx)
c0100332:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
c0100339:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
c010033d:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
c0100341:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0100344:	ee                   	out    %al,(%dx)
c0100345:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
c010034c:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
c0100350:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
c0100354:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100357:	ee                   	out    %al,(%dx)
c0100358:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
c010035f:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
c0100363:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
c0100367:	8b 55 94             	mov    -0x6c(%ebp),%edx
c010036a:	ee                   	out    %al,(%dx)
	outb(IO_PIC1, 0x68);             /* clear specific mask */
	outb(IO_PIC1, 0x0a);             /* read IRR by default */

	outb(IO_PIC2, 0x68);             /* OCW3 */
	outb(IO_PIC2, 0x0a);             /* OCW3 */
}
c010036b:	c9                   	leave  
c010036c:	c3                   	ret    

c010036d <save_idt>:
	asm volatile("hlt");
}

/* 修改IDRT */
static inline void
save_idt(void *addr, uint32_t size) {
c010036d:	55                   	push   %ebp
c010036e:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0100370:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100373:	83 e8 01             	sub    $0x1,%eax
c0100376:	66 a3 04 10 11 c0    	mov    %ax,0xc0111004
	data[1] = (uint32_t)addr;
c010037c:	8b 45 08             	mov    0x8(%ebp),%eax
c010037f:	66 a3 06 10 11 c0    	mov    %ax,0xc0111006
	data[2] = ((uint32_t)addr) >> 16;
c0100385:	8b 45 08             	mov    0x8(%ebp),%eax
c0100388:	c1 e8 10             	shr    $0x10,%eax
c010038b:	66 a3 08 10 11 c0    	mov    %ax,0xc0111008
	asm volatile("lidt (%0)" : : "r"(data));
c0100391:	b8 04 10 11 c0       	mov    $0xc0111004,%eax
c0100396:	0f 01 18             	lidtl  (%eax)
}
c0100399:	5d                   	pop    %ebp
c010039a:	c3                   	ret    

c010039b <set_intr>:
/* IDT表的内容 */
struct Gatedesc idt[NR_IRQ];

/* 初始化一个中断门(interrupt gate) */
static void
set_intr(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c010039b:	55                   	push   %ebp
c010039c:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c010039e:	8b 45 10             	mov    0x10(%ebp),%eax
c01003a1:	89 c2                	mov    %eax,%edx
c01003a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01003a6:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c01003a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01003ac:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01003b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01003b6:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c01003ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01003bd:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = INTERRUPT_GATE_32;
c01003c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01003c4:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003c8:	83 e2 f0             	and    $0xfffffff0,%edx
c01003cb:	83 ca 0e             	or     $0xe,%edx
c01003ce:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c01003d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d4:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003d8:	83 e2 ef             	and    $0xffffffef,%edx
c01003db:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c01003de:	8b 45 14             	mov    0x14(%ebp),%eax
c01003e1:	83 e0 03             	and    $0x3,%eax
c01003e4:	89 c2                	mov    %eax,%edx
c01003e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01003e9:	83 e2 03             	and    $0x3,%edx
c01003ec:	89 d1                	mov    %edx,%ecx
c01003ee:	c1 e1 05             	shl    $0x5,%ecx
c01003f1:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003f5:	83 e2 9f             	and    $0xffffff9f,%edx
c01003f8:	09 ca                	or     %ecx,%edx
c01003fa:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c01003fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100400:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100404:	83 ca 80             	or     $0xffffff80,%edx
c0100407:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c010040a:	8b 45 10             	mov    0x10(%ebp),%eax
c010040d:	c1 e8 10             	shr    $0x10,%eax
c0100410:	89 c2                	mov    %eax,%edx
c0100412:	8b 45 08             	mov    0x8(%ebp),%eax
c0100415:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100419:	5d                   	pop    %ebp
c010041a:	c3                   	ret    

c010041b <set_trap>:

/* 初始化一个陷阱门(trap gate) */
static void
set_trap(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c010041b:	55                   	push   %ebp
c010041c:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c010041e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100421:	89 c2                	mov    %eax,%edx
c0100423:	8b 45 08             	mov    0x8(%ebp),%eax
c0100426:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100429:	8b 45 0c             	mov    0xc(%ebp),%eax
c010042c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100433:	8b 45 08             	mov    0x8(%ebp),%eax
c0100436:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c010043a:	8b 45 08             	mov    0x8(%ebp),%eax
c010043d:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = TRAP_GATE_32;
c0100441:	8b 45 08             	mov    0x8(%ebp),%eax
c0100444:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100448:	83 ca 0f             	or     $0xf,%edx
c010044b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c010044e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100451:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100455:	83 e2 ef             	and    $0xffffffef,%edx
c0100458:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c010045b:	8b 45 14             	mov    0x14(%ebp),%eax
c010045e:	83 e0 03             	and    $0x3,%eax
c0100461:	89 c2                	mov    %eax,%edx
c0100463:	8b 45 08             	mov    0x8(%ebp),%eax
c0100466:	83 e2 03             	and    $0x3,%edx
c0100469:	89 d1                	mov    %edx,%ecx
c010046b:	c1 e1 05             	shl    $0x5,%ecx
c010046e:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100472:	83 e2 9f             	and    $0xffffff9f,%edx
c0100475:	09 ca                	or     %ecx,%edx
c0100477:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c010047a:	8b 45 08             	mov    0x8(%ebp),%eax
c010047d:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100481:	83 ca 80             	or     $0xffffff80,%edx
c0100484:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100487:	8b 45 10             	mov    0x10(%ebp),%eax
c010048a:	c1 e8 10             	shr    $0x10,%eax
c010048d:	89 c2                	mov    %eax,%edx
c010048f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100492:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100496:	5d                   	pop    %ebp
c0100497:	c3                   	ret    

c0100498 <init_idt>:
void vec13();
void vec14();
void vecsys();
void irq_empty();

void init_idt() {
c0100498:	55                   	push   %ebp
c0100499:	89 e5                	mov    %esp,%ebp
c010049b:	83 ec 20             	sub    $0x20,%esp
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c010049e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01004a5:	eb 31                	jmp    c01004d8 <init_idt+0x40>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
c01004a7:	b8 39 2e 10 c0       	mov    $0xc0102e39,%eax
c01004ac:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01004af:	c1 e2 03             	shl    $0x3,%edx
c01004b2:	81 c2 20 4f 16 c0    	add    $0xc0164f20,%edx
c01004b8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004bf:	00 
c01004c0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004c4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004cb:	00 
c01004cc:	89 14 24             	mov    %edx,(%esp)
c01004cf:	e8 47 ff ff ff       	call   c010041b <set_trap>
void irq_empty();

void init_idt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01004d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01004d8:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
c01004df:	7e c6                	jle    c01004a7 <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
	}

	/* 设置异常的中断处�?*/
	set_trap(idt + 0, SEG_KERNEL_CODE, (uint32_t)vec0, DPL_KERNEL);
c01004e1:	b8 8e 2d 10 c0       	mov    $0xc0102d8e,%eax
c01004e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004ed:	00 
c01004ee:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004f2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004f9:	00 
c01004fa:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c0100501:	e8 15 ff ff ff       	call   c010041b <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c0100506:	b8 97 2d 10 c0       	mov    $0xc0102d97,%eax
c010050b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100512:	00 
c0100513:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100517:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010051e:	00 
c010051f:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c0100526:	e8 f0 fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c010052b:	b8 a0 2d 10 c0       	mov    $0xc0102da0,%eax
c0100530:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100537:	00 
c0100538:	89 44 24 08          	mov    %eax,0x8(%esp)
c010053c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100543:	00 
c0100544:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c010054b:	e8 cb fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c0100550:	b8 a9 2d 10 c0       	mov    $0xc0102da9,%eax
c0100555:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010055c:	00 
c010055d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100561:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100568:	00 
c0100569:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c0100570:	e8 a6 fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c0100575:	b8 b2 2d 10 c0       	mov    $0xc0102db2,%eax
c010057a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100581:	00 
c0100582:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100586:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010058d:	00 
c010058e:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c0100595:	e8 81 fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c010059a:	b8 bb 2d 10 c0       	mov    $0xc0102dbb,%eax
c010059f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005a6:	00 
c01005a7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005ab:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005b2:	00 
c01005b3:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c01005ba:	e8 5c fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c01005bf:	b8 c4 2d 10 c0       	mov    $0xc0102dc4,%eax
c01005c4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005cb:	00 
c01005cc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005d0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005d7:	00 
c01005d8:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c01005df:	e8 37 fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c01005e4:	b8 cd 2d 10 c0       	mov    $0xc0102dcd,%eax
c01005e9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005f0:	00 
c01005f1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005f5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005fc:	00 
c01005fd:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c0100604:	e8 12 fe ff ff       	call   c010041b <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c0100609:	b8 d6 2d 10 c0       	mov    $0xc0102dd6,%eax
c010060e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100615:	00 
c0100616:	89 44 24 08          	mov    %eax,0x8(%esp)
c010061a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100621:	00 
c0100622:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c0100629:	e8 ed fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c010062e:	b8 dd 2d 10 c0       	mov    $0xc0102ddd,%eax
c0100633:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010063a:	00 
c010063b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010063f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100646:	00 
c0100647:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c010064e:	e8 c8 fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c0100653:	b8 e6 2d 10 c0       	mov    $0xc0102de6,%eax
c0100658:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010065f:	00 
c0100660:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100664:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010066b:	00 
c010066c:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c0100673:	e8 a3 fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c0100678:	b8 ed 2d 10 c0       	mov    $0xc0102ded,%eax
c010067d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100684:	00 
c0100685:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100689:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100690:	00 
c0100691:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c0100698:	e8 7e fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c010069d:	b8 f4 2d 10 c0       	mov    $0xc0102df4,%eax
c01006a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006a9:	00 
c01006aa:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ae:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006b5:	00 
c01006b6:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c01006bd:	e8 59 fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c01006c2:	b8 fb 2d 10 c0       	mov    $0xc0102dfb,%eax
c01006c7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006ce:	00 
c01006cf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006d3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006da:	00 
c01006db:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c01006e2:	e8 34 fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c01006e7:	b8 02 2e 10 c0       	mov    $0xc0102e02,%eax
c01006ec:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006f3:	00 
c01006f4:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006f8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006ff:	00 
c0100700:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c0100707:	e8 0f fd ff ff       	call   c010041b <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c010070c:	b8 09 2e 10 c0       	mov    $0xc0102e09,%eax
c0100711:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c0100718:	00 
c0100719:	89 44 24 08          	mov    %eax,0x8(%esp)
c010071d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100724:	00 
c0100725:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c010072c:	e8 ea fc ff ff       	call   c010041b <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c0100731:	b8 15 2e 10 c0       	mov    $0xc0102e15,%eax
c0100736:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010073d:	00 
c010073e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100742:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100749:	00 
c010074a:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c0100751:	e8 45 fc ff ff       	call   c010039b <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c0100756:	b8 21 2e 10 c0       	mov    $0xc0102e21,%eax
c010075b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100762:	00 
c0100763:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100767:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010076e:	00 
c010076f:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c0100776:	e8 20 fc ff ff       	call   c010039b <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c010077b:	b8 2d 2e 10 c0       	mov    $0xc0102e2d,%eax
c0100780:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100787:	00 
c0100788:	89 44 24 08          	mov    %eax,0x8(%esp)
c010078c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100793:	00 
c0100794:	c7 04 24 90 50 16 c0 	movl   $0xc0165090,(%esp)
c010079b:	e8 fb fb ff ff       	call   c010039b <set_intr>
	 * x86.h提供了相关内联汇编的支持
	 * 然后将hlt()删除
	 * 
	 * */
	
	save_idt(idt, sizeof(idt));
c01007a0:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
c01007a7:	00 
c01007a8:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c01007af:	e8 b9 fb ff ff       	call   c010036d <save_idt>
}
c01007b4:	c9                   	leave  
c01007b5:	c3                   	ret    

c01007b6 <set_timer_intr_handler>:

static void (*do_timer)(void);
static void (*do_keyboard)(int);

void
set_timer_intr_handler( void (*ptr)(void) ) {
c01007b6:	55                   	push   %ebp
c01007b7:	89 e5                	mov    %esp,%ebp
	do_timer = ptr;
c01007b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01007bc:	a3 0c 10 11 c0       	mov    %eax,0xc011100c
}
c01007c1:	5d                   	pop    %ebp
c01007c2:	c3                   	ret    

c01007c3 <set_keyboard_intr_handler>:
void
set_keyboard_intr_handler( void (*ptr)(int) ) {
c01007c3:	55                   	push   %ebp
c01007c4:	89 e5                	mov    %esp,%ebp
	do_keyboard = ptr;
c01007c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01007c9:	a3 10 10 11 c0       	mov    %eax,0xc0111010
}
c01007ce:	5d                   	pop    %ebp
c01007cf:	c3                   	ret    

c01007d0 <irq_handle>:

/* TrapFrame的定义在include/memory.h
 * 请仔细理解这段程序的含义，这些内容将在后续的实验中被反复使用�?*/
void
irq_handle(struct TrapFrame *tf) {
c01007d0:	55                   	push   %ebp
c01007d1:	89 e5                	mov    %esp,%ebp
c01007d3:	83 ec 48             	sub    $0x48,%esp
	pcbnow->tf=tf;
c01007d6:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01007db:	8b 55 08             	mov    0x8(%ebp),%edx
c01007de:	89 10                	mov    %edx,(%eax)
	if (tf->irq == 0x80) {
c01007e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01007e3:	8b 40 30             	mov    0x30(%eax),%eax
c01007e6:	3d 80 00 00 00       	cmp    $0x80,%eax
c01007eb:	75 10                	jne    c01007fd <irq_handle+0x2d>
		do_syscall(tf);
c01007ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01007f0:	89 04 24             	mov    %eax,(%esp)
c01007f3:	e8 08 f8 ff ff       	call   c0100000 <do_syscall>
c01007f8:	e9 7f 01 00 00       	jmp    c010097c <irq_handle+0x1ac>
	}
	else if(tf->irq < 1000) {
c01007fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100800:	8b 40 30             	mov    0x30(%eax),%eax
c0100803:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100808:	7f 73                	jg     c010087d <irq_handle+0xad>
		if(tf->irq == -1) {
c010080a:	8b 45 08             	mov    0x8(%ebp),%eax
c010080d:	8b 40 30             	mov    0x30(%eax),%eax
c0100810:	83 f8 ff             	cmp    $0xffffffff,%eax
c0100813:	75 1e                	jne    c0100833 <irq_handle+0x63>
			printk("%s, %d: Unhandled exception!\n", __FUNCTION__, __LINE__);
c0100815:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
c010081c:	00 
c010081d:	c7 44 24 04 d2 40 10 	movl   $0xc01040d2,0x4(%esp)
c0100824:	c0 
c0100825:	c7 04 24 60 40 10 c0 	movl   $0xc0104060,(%esp)
c010082c:	e8 37 25 00 00       	call   c0102d68 <printk>
c0100831:	eb 26                	jmp    c0100859 <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100833:	8b 45 08             	mov    0x8(%ebp),%eax
c0100836:	8b 40 30             	mov    0x30(%eax),%eax
c0100839:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010083d:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0100844:	00 
c0100845:	c7 44 24 04 d2 40 10 	movl   $0xc01040d2,0x4(%esp)
c010084c:	c0 
c010084d:	c7 04 24 80 40 10 c0 	movl   $0xc0104080,(%esp)
c0100854:	e8 0f 25 00 00       	call   c0102d68 <printk>
		}
		assert(0);
c0100859:	c7 44 24 0c a3 40 10 	movl   $0xc01040a3,0xc(%esp)
c0100860:	c0 
c0100861:	c7 44 24 08 a5 40 10 	movl   $0xc01040a5,0x8(%esp)
c0100868:	c0 
c0100869:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c0100870:	00 
c0100871:	c7 04 24 ba 40 10 c0 	movl   $0xc01040ba,(%esp)
c0100878:	e8 bc 23 00 00       	call   c0102c39 <_panic>
	}

	else if (tf->irq == 1000) {
c010087d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100880:	8b 40 30             	mov    0x30(%eax),%eax
c0100883:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c0100888:	75 18                	jne    c01008a2 <irq_handle+0xd2>
		do_timer();
c010088a:	a1 0c 10 11 c0       	mov    0xc011100c,%eax
c010088f:	ff d0                	call   *%eax
		schedule(1);
c0100891:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100898:	e8 ac 1f 00 00       	call   c0102849 <schedule>
c010089d:	e9 da 00 00 00       	jmp    c010097c <irq_handle+0x1ac>
	} else if (tf->irq == 1001) {
c01008a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01008a5:	8b 40 30             	mov    0x30(%eax),%eax
c01008a8:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c01008ad:	75 76                	jne    c0100925 <irq_handle+0x155>
c01008af:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008b9:	89 c2                	mov    %eax,%edx
c01008bb:	ec                   	in     (%dx),%al
c01008bc:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c01008bf:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c01008c3:	0f b6 c0             	movzbl %al,%eax
c01008c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01008c9:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01008d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01008d3:	89 c2                	mov    %eax,%edx
c01008d5:	ec                   	in     (%dx),%al
c01008d6:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c01008d9:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c01008dd:	0f b6 c0             	movzbl %al,%eax
c01008e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c01008e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01008e6:	83 c8 80             	or     $0xffffff80,%eax
c01008e9:	0f b6 c0             	movzbl %al,%eax
c01008ec:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c01008f3:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01008f6:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01008fa:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01008fd:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c01008fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100901:	0f b6 c0             	movzbl %al,%eax
c0100904:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c010090b:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010090e:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100912:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100915:	ee                   	out    %al,(%dx)
		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c0100916:	a1 10 10 11 c0       	mov    0xc0111010,%eax
c010091b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010091e:	89 14 24             	mov    %edx,(%esp)
c0100921:	ff d0                	call   *%eax
c0100923:	eb 57                	jmp    c010097c <irq_handle+0x1ac>
	}else if(tf->irq==1014){
c0100925:	8b 45 08             	mov    0x8(%ebp),%eax
c0100928:	8b 40 30             	mov    0x30(%eax),%eax
c010092b:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c0100930:	74 4a                	je     c010097c <irq_handle+0x1ac>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100932:	8b 45 08             	mov    0x8(%ebp),%eax
c0100935:	8b 40 30             	mov    0x30(%eax),%eax
c0100938:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010093c:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
c0100943:	00 
c0100944:	c7 44 24 04 d2 40 10 	movl   $0xc01040d2,0x4(%esp)
c010094b:	c0 
c010094c:	c7 04 24 80 40 10 c0 	movl   $0xc0104080,(%esp)
c0100953:	e8 10 24 00 00       	call   c0102d68 <printk>
		assert(0);
c0100958:	c7 44 24 0c a3 40 10 	movl   $0xc01040a3,0xc(%esp)
c010095f:	c0 
c0100960:	c7 44 24 08 a5 40 10 	movl   $0xc01040a5,0x8(%esp)
c0100967:	c0 
c0100968:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c010096f:	00 
c0100970:	c7 04 24 ba 40 10 c0 	movl   $0xc01040ba,(%esp)
c0100977:	e8 bd 22 00 00       	call   c0102c39 <_panic>
	}
}
c010097c:	c9                   	leave  
c010097d:	c3                   	ret    

c010097e <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c010097e:	55                   	push   %ebp
c010097f:	89 e5                	mov    %esp,%ebp
c0100981:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c0100984:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010098b:	00 
c010098c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100993:	00 
c0100994:	c7 04 24 20 10 11 c0 	movl   $0xc0111020,(%esp)
c010099b:	e8 63 28 00 00       	call   c0103203 <memset>
	memset(vref, 0, SCR_SIZE);
c01009a0:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009a7:	00 
c01009a8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01009af:	00 
c01009b0:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009b7:	e8 47 28 00 00       	call   c0103203 <memset>
}
c01009bc:	c9                   	leave  
c01009bd:	c3                   	ret    

c01009be <prepare_buffer>:

void prepare_buffer(void) {
c01009be:	55                   	push   %ebp
c01009bf:	89 e5                	mov    %esp,%ebp
c01009c1:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c01009c4:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009cb:	00 
c01009cc:	c7 44 24 04 20 10 11 	movl   $0xc0111020,0x4(%esp)
c01009d3:	c0 
c01009d4:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01009db:	e8 06 28 00 00       	call   c01031e6 <memcpy>
#endif
	vmem = vbuf;
c01009e0:	c7 05 04 60 10 c0 20 	movl   $0xc0111020,0xc0106004
c01009e7:	10 11 c0 
	memset(vmem, 0, SCR_SIZE);
c01009ea:	a1 04 60 10 c0       	mov    0xc0106004,%eax
c01009ef:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01009f6:	00 
c01009f7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01009fe:	00 
c01009ff:	89 04 24             	mov    %eax,(%esp)
c0100a02:	e8 fc 27 00 00       	call   c0103203 <memset>
}
c0100a07:	c9                   	leave  
c0100a08:	c3                   	ret    

c0100a09 <display_buffer>:

void display_buffer(void) {
c0100a09:	55                   	push   %ebp
c0100a0a:	89 e5                	mov    %esp,%ebp
c0100a0c:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c0100a0f:	c7 45 f8 20 10 11 c0 	movl   $0xc0111020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c0100a16:	c7 45 f4 20 0a 12 c0 	movl   $0xc0120a20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c0100a1d:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c0100a24:	c7 05 04 60 10 c0 00 	movl   $0xa0000,0xc0106004
c0100a2b:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a2e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100a35:	eb 4c                	jmp    c0100a83 <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c0100a37:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a3a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a41:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a44:	01 d0                	add    %edx,%eax
c0100a46:	8b 10                	mov    (%eax),%edx
c0100a48:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a4b:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a55:	01 c8                	add    %ecx,%eax
c0100a57:	8b 00                	mov    (%eax),%eax
c0100a59:	39 c2                	cmp    %eax,%edx
c0100a5b:	74 22                	je     c0100a7f <display_buffer+0x76>
			mem[i] = buf[i];
c0100a5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a60:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100a67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100a6a:	01 c2                	add    %eax,%edx
c0100a6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a6f:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100a76:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100a79:	01 c8                	add    %ecx,%eax
c0100a7b:	8b 00                	mov    (%eax),%eax
c0100a7d:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100a7f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100a83:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c0100a8a:	7e ab                	jle    c0100a37 <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c0100a8c:	c9                   	leave  
c0100a8d:	c3                   	ret    

c0100a8e <sys_pr>:

void sys_pr(void *src)
{
c0100a8e:	55                   	push   %ebp
c0100a8f:	89 e5                	mov    %esp,%ebp
c0100a91:	57                   	push   %edi
c0100a92:	56                   	push   %esi
c0100a93:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c0100a94:	8b 1d 04 60 10 c0    	mov    0xc0106004,%ebx
c0100a9a:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c0100a9f:	8b 55 08             	mov    0x8(%ebp),%edx
c0100aa2:	89 c1                	mov    %eax,%ecx
c0100aa4:	89 d6                	mov    %edx,%esi
c0100aa6:	89 df                	mov    %ebx,%edi
c0100aa8:	fc                   	cld    
c0100aa9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c0100aab:	5b                   	pop    %ebx
c0100aac:	5e                   	pop    %esi
c0100aad:	5f                   	pop    %edi
c0100aae:	5d                   	pop    %ebp
c0100aaf:	c3                   	ret    

c0100ab0 <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c0100ab0:	55                   	push   %ebp
c0100ab1:	89 e5                	mov    %esp,%ebp
c0100ab3:	83 ec 40             	sub    $0x40,%esp
c0100ab6:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c0100abd:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c0100ac1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100ac5:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100ac8:	ee                   	out    %al,(%dx)
c0100ac9:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c0100ad0:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c0100ad4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100ad8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100adb:	ee                   	out    %al,(%dx)
c0100adc:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c0100ae3:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0100ae7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100aeb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100aee:	ee                   	out    %al,(%dx)
c0100aef:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c0100af6:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c0100afa:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100afe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100b01:	ee                   	out    %al,(%dx)
c0100b02:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c0100b09:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100b0d:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100b11:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100b14:	ee                   	out    %al,(%dx)
c0100b15:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100b1c:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100b20:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100b24:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100b27:	ee                   	out    %al,(%dx)
c0100b28:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100b2f:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100b33:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100b37:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100b3a:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100b3b:	c9                   	leave  
c0100b3c:	c3                   	ret    

c0100b3d <serial_idle>:

static inline int serial_idle(void) {
c0100b3d:	55                   	push   %ebp
c0100b3e:	89 e5                	mov    %esp,%ebp
c0100b40:	83 ec 10             	sub    $0x10,%esp
c0100b43:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100b4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100b4d:	89 c2                	mov    %eax,%edx
c0100b4f:	ec                   	in     (%dx),%al
c0100b50:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100b53:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100b57:	0f b6 c0             	movzbl %al,%eax
c0100b5a:	83 e0 20             	and    $0x20,%eax
c0100b5d:	85 c0                	test   %eax,%eax
c0100b5f:	0f 95 c0             	setne  %al
c0100b62:	0f b6 c0             	movzbl %al,%eax
}
c0100b65:	c9                   	leave  
c0100b66:	c3                   	ret    

c0100b67 <serial_printc>:

void serial_printc(int ch) {
c0100b67:	55                   	push   %ebp
c0100b68:	89 e5                	mov    %esp,%ebp
c0100b6a:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100b6d:	90                   	nop
c0100b6e:	e8 ca ff ff ff       	call   c0100b3d <serial_idle>
c0100b73:	85 c0                	test   %eax,%eax
c0100b75:	74 f7                	je     c0100b6e <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100b77:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b7a:	0f b6 c0             	movzbl %al,%eax
c0100b7d:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100b84:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100b87:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100b8b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100b8e:	ee                   	out    %al,(%dx)
}
c0100b8f:	c9                   	leave  
c0100b90:	c3                   	ret    

c0100b91 <putchar>:

void putchar(int ch){
c0100b91:	55                   	push   %ebp
c0100b92:	89 e5                	mov    %esp,%ebp
c0100b94:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100b97:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b9a:	89 04 24             	mov    %eax,(%esp)
c0100b9d:	e8 c5 ff ff ff       	call   c0100b67 <serial_printc>
c0100ba2:	c9                   	leave  
c0100ba3:	c3                   	ret    

c0100ba4 <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100ba4:	55                   	push   %ebp
c0100ba5:	89 e5                	mov    %esp,%ebp
c0100ba7:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100baa:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100bb1:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100bb8:	7e 24                	jle    c0100bde <init_timer+0x3a>
c0100bba:	c7 44 24 0c dd 40 10 	movl   $0xc01040dd,0xc(%esp)
c0100bc1:	c0 
c0100bc2:	c7 44 24 08 ed 40 10 	movl   $0xc01040ed,0x8(%esp)
c0100bc9:	c0 
c0100bca:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100bd1:	00 
c0100bd2:	c7 04 24 02 41 10 c0 	movl   $0xc0104102,(%esp)
c0100bd9:	e8 5b 20 00 00       	call   c0102c39 <_panic>
c0100bde:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100be5:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100be9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100bed:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bf0:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100bf4:	99                   	cltd   
c0100bf5:	c1 ea 18             	shr    $0x18,%edx
c0100bf8:	01 d0                	add    %edx,%eax
c0100bfa:	0f b6 c0             	movzbl %al,%eax
c0100bfd:	29 d0                	sub    %edx,%eax
c0100bff:	0f b6 c0             	movzbl %al,%eax
c0100c02:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100c09:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100c0c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100c10:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100c13:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100c14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c17:	99                   	cltd   
c0100c18:	c1 ea 18             	shr    $0x18,%edx
c0100c1b:	01 d0                	add    %edx,%eax
c0100c1d:	c1 f8 08             	sar    $0x8,%eax
c0100c20:	0f b6 c0             	movzbl %al,%eax
c0100c23:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100c2a:	88 45 df             	mov    %al,-0x21(%ebp)
c0100c2d:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100c31:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100c34:	ee                   	out    %al,(%dx)
}
c0100c35:	c9                   	leave  
c0100c36:	c3                   	ret    

c0100c37 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0100c37:	55                   	push   %ebp
c0100c38:	89 e5                	mov    %esp,%ebp
c0100c3a:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0100c3d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0100c41:	75 24                	jne    c0100c67 <list_add+0x30>
c0100c43:	c7 44 24 0c 18 41 10 	movl   $0xc0104118,0xc(%esp)
c0100c4a:	c0 
c0100c4b:	c7 44 24 08 25 41 10 	movl   $0xc0104125,0x8(%esp)
c0100c52:	c0 
c0100c53:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0100c5a:	00 
c0100c5b:	c7 04 24 3a 41 10 c0 	movl   $0xc010413a,(%esp)
c0100c62:	e8 d2 1f 00 00       	call   c0102c39 <_panic>
	data->prev = prev;
c0100c67:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c6a:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c6d:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0100c6f:	8b 45 10             	mov    0x10(%ebp),%eax
c0100c72:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c75:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0100c78:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c7c:	74 09                	je     c0100c87 <list_add+0x50>
c0100c7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c81:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c84:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0100c87:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100c8b:	74 08                	je     c0100c95 <list_add+0x5e>
c0100c8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c90:	8b 55 10             	mov    0x10(%ebp),%edx
c0100c93:	89 10                	mov    %edx,(%eax)
}
c0100c95:	c9                   	leave  
c0100c96:	c3                   	ret    

c0100c97 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0100c97:	55                   	push   %ebp
c0100c98:	89 e5                	mov    %esp,%ebp
c0100c9a:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100c9d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100ca1:	75 24                	jne    c0100cc7 <list_add_before+0x30>
c0100ca3:	c7 44 24 0c 50 41 10 	movl   $0xc0104150,0xc(%esp)
c0100caa:	c0 
c0100cab:	c7 44 24 08 25 41 10 	movl   $0xc0104125,0x8(%esp)
c0100cb2:	c0 
c0100cb3:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0100cba:	00 
c0100cbb:	c7 04 24 3a 41 10 c0 	movl   $0xc010413a,(%esp)
c0100cc2:	e8 72 1f 00 00       	call   c0102c39 <_panic>
	list_add(one->prev, one, data);
c0100cc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cca:	8b 00                	mov    (%eax),%eax
c0100ccc:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100ccf:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100cd3:	8b 55 08             	mov    0x8(%ebp),%edx
c0100cd6:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100cda:	89 04 24             	mov    %eax,(%esp)
c0100cdd:	e8 55 ff ff ff       	call   c0100c37 <list_add>
}
c0100ce2:	c9                   	leave  
c0100ce3:	c3                   	ret    

c0100ce4 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0100ce4:	55                   	push   %ebp
c0100ce5:	89 e5                	mov    %esp,%ebp
c0100ce7:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0100cea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100cee:	75 24                	jne    c0100d14 <list_del+0x30>
c0100cf0:	c7 44 24 0c 18 41 10 	movl   $0xc0104118,0xc(%esp)
c0100cf7:	c0 
c0100cf8:	c7 44 24 08 25 41 10 	movl   $0xc0104125,0x8(%esp)
c0100cff:	c0 
c0100d00:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0100d07:	00 
c0100d08:	c7 04 24 3a 41 10 c0 	movl   $0xc010413a,(%esp)
c0100d0f:	e8 25 1f 00 00       	call   c0102c39 <_panic>
	list *prev = data->prev;
c0100d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d17:	8b 00                	mov    (%eax),%eax
c0100d19:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0100d1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d1f:	8b 40 04             	mov    0x4(%eax),%eax
c0100d22:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0100d25:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100d29:	74 09                	je     c0100d34 <list_del+0x50>
c0100d2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d2e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100d31:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0100d34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100d38:	74 08                	je     c0100d42 <list_del+0x5e>
c0100d3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100d3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100d40:	89 10                	mov    %edx,(%eax)
}
c0100d42:	c9                   	leave  
c0100d43:	c3                   	ret    

c0100d44 <list_init>:

static inline void
list_init(list *one) {
c0100d44:	55                   	push   %ebp
c0100d45:	89 e5                	mov    %esp,%ebp
c0100d47:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100d4a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100d4e:	75 24                	jne    c0100d74 <list_init+0x30>
c0100d50:	c7 44 24 0c 50 41 10 	movl   $0xc0104150,0xc(%esp)
c0100d57:	c0 
c0100d58:	c7 44 24 08 25 41 10 	movl   $0xc0104125,0x8(%esp)
c0100d5f:	c0 
c0100d60:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0100d67:	00 
c0100d68:	c7 04 24 3a 41 10 c0 	movl   $0xc010413a,(%esp)
c0100d6f:	e8 c5 1e 00 00       	call   c0102c39 <_panic>
	one->prev = one->next = one;
c0100d74:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d77:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d7a:	89 50 04             	mov    %edx,0x4(%eax)
c0100d7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d80:	8b 50 04             	mov    0x4(%eax),%edx
c0100d83:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d86:	89 10                	mov    %edx,(%eax)
}
c0100d88:	c9                   	leave  
c0100d89:	c3                   	ret    

c0100d8a <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100d8a:	55                   	push   %ebp
c0100d8b:	89 e5                	mov    %esp,%ebp
c0100d8d:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100d90:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d93:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100d98:	77 21                	ja     c0100dbb <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100d9a:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d9d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100da1:	c7 44 24 08 5c 41 10 	movl   $0xc010415c,0x8(%esp)
c0100da8:	c0 
c0100da9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100dac:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100db0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100db3:	89 04 24             	mov    %eax,(%esp)
c0100db6:	e8 7e 1e 00 00       	call   c0102c39 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100dbb:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dbe:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100dc3:	c9                   	leave  
c0100dc4:	c3                   	ret    

c0100dc5 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100dc5:	55                   	push   %ebp
c0100dc6:	89 e5                	mov    %esp,%ebp
c0100dc8:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100dcb:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dce:	c1 e8 0c             	shr    $0xc,%eax
c0100dd1:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100dd6:	76 21                	jbe    c0100df9 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100dd8:	8b 45 10             	mov    0x10(%ebp),%eax
c0100ddb:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100ddf:	c7 44 24 08 80 41 10 	movl   $0xc0104180,0x8(%esp)
c0100de6:	c0 
c0100de7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100dea:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100dee:	8b 45 08             	mov    0x8(%ebp),%eax
c0100df1:	89 04 24             	mov    %eax,(%esp)
c0100df4:	e8 40 1e 00 00       	call   c0102c39 <_panic>
	return (void *)(pa + KERNBASE);
c0100df9:	8b 45 10             	mov    0x10(%ebp),%eax
c0100dfc:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100e01:	c9                   	leave  
c0100e02:	c3                   	ret    

c0100e03 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100e03:	55                   	push   %ebp
c0100e04:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100e06:	8b 55 08             	mov    0x8(%ebp),%edx
c0100e09:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0100e0e:	29 c2                	sub    %eax,%edx
c0100e10:	89 d0                	mov    %edx,%eax
c0100e12:	c1 f8 03             	sar    $0x3,%eax
c0100e15:	c1 e0 0c             	shl    $0xc,%eax
}
c0100e18:	5d                   	pop    %ebp
c0100e19:	c3                   	ret    

c0100e1a <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100e1a:	55                   	push   %ebp
c0100e1b:	89 e5                	mov    %esp,%ebp
c0100e1d:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100e20:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e23:	89 04 24             	mov    %eax,(%esp)
c0100e26:	e8 d8 ff ff ff       	call   c0100e03 <page2pa>
c0100e2b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100e2f:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100e36:	00 
c0100e37:	c7 04 24 a3 41 10 c0 	movl   $0xc01041a3,(%esp)
c0100e3e:	e8 82 ff ff ff       	call   c0100dc5 <_kaddr>
}
c0100e43:	c9                   	leave  
c0100e44:	c3                   	ret    

c0100e45 <pcb_init>:
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];


void pcb_init()
{
c0100e45:	55                   	push   %ebp
c0100e46:	89 e5                	mov    %esp,%ebp
c0100e48:	83 ec 28             	sub    $0x28,%esp
	/*int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}*/
	list_init(&ready);
c0100e4b:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100e52:	e8 ed fe ff ff       	call   c0100d44 <list_init>
	list_init(&block);
c0100e57:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0100e5e:	e8 e1 fe ff ff       	call   c0100d44 <list_init>
	list_init(&free);
c0100e63:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e6a:	e8 d5 fe ff ff       	call   c0100d44 <list_init>
	now=&ready;
c0100e6f:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0100e76:	4f 16 c0 
	pcbnow=&init;
c0100e79:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100e80:	3f 16 c0 
	init.pgdir=kern_pgdir;
c0100e83:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100e88:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100e8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e94:	eb 48                	jmp    c0100ede <pcb_init+0x99>
		list_add_before(&free,&pcb[i].plist);
c0100e96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e99:	c1 e0 0c             	shl    $0xc,%eax
c0100e9c:	05 40 57 16 c0       	add    $0xc0165740,%eax
c0100ea1:	83 c0 08             	add    $0x8,%eax
c0100ea4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ea8:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100eaf:	e8 e3 fd ff ff       	call   c0100c97 <list_add_before>
		pcb[i].pid=i+1;
c0100eb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eb7:	83 c0 01             	add    $0x1,%eax
c0100eba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ebd:	c1 e2 0c             	shl    $0xc,%edx
c0100ec0:	81 c2 50 57 16 c0    	add    $0xc0165750,%edx
c0100ec6:	89 02                	mov    %eax,(%edx)
		pcb[i].ppid=0;
c0100ec8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ecb:	c1 e0 0c             	shl    $0xc,%eax
c0100ece:	05 50 57 16 c0       	add    $0xc0165750,%eax
c0100ed3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&free);
	now=&ready;
	pcbnow=&init;
	init.pgdir=kern_pgdir;
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100eda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ede:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0100ee2:	7e b2                	jle    c0100e96 <pcb_init+0x51>
		list_add_before(&free,&pcb[i].plist);
		pcb[i].pid=i+1;
		pcb[i].ppid=0;
	}
			
}
c0100ee4:	c9                   	leave  
c0100ee5:	c3                   	ret    

c0100ee6 <pcb_alloc>:

static uint32_t cntpid=0;
PCB* pcb_alloc()
{
c0100ee6:	55                   	push   %ebp
c0100ee7:	89 e5                	mov    %esp,%ebp
c0100ee9:	83 ec 38             	sub    $0x38,%esp
	list *lnext=&free;
c0100eec:	c7 45 f4 08 4f 16 c0 	movl   $0xc0164f08,-0xc(%ebp)
	list *freenext;
	if(lnext->next==lnext)
c0100ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ef6:	8b 40 04             	mov    0x4(%eax),%eax
c0100ef9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100efc:	75 11                	jne    c0100f0f <pcb_alloc+0x29>
	{
		freenext=NULL;
c0100efe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		return NULL;
c0100f05:	b8 00 00 00 00       	mov    $0x0,%eax
c0100f0a:	e9 0f 01 00 00       	jmp    c010101e <pcb_alloc+0x138>
	}
	else
	{
		freenext=lnext->next;
c0100f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f12:	8b 40 04             	mov    0x4(%eax),%eax
c0100f15:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	PCB* p=list_entry(freenext,PCB,plist);
c0100f18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f1b:	83 e8 08             	sub    $0x8,%eax
c0100f1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100f21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100f28:	e8 7a 10 00 00       	call   c0101fa7 <page_alloc>
c0100f2d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (pp == NULL) return NULL;
c0100f30:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0100f34:	75 0a                	jne    c0100f40 <pcb_alloc+0x5a>
c0100f36:	b8 00 00 00 00       	mov    $0x0,%eax
c0100f3b:	e9 de 00 00 00       	jmp    c010101e <pcb_alloc+0x138>
	p->pgdir = page2kva(pp);
c0100f40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f43:	89 04 24             	mov    %eax,(%esp)
c0100f46:	e8 cf fe ff ff       	call   c0100e1a <page2kva>
c0100f4b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f4e:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100f51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f54:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100f58:	8d 50 01             	lea    0x1(%eax),%edx
c0100f5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f5e:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100f62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f65:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100f6c:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100f71:	8d 50 01             	lea    0x1(%eax),%edx
c0100f74:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100f7a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f7d:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100f80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f83:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100f8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f8d:	83 c0 08             	add    $0x8,%eax
c0100f90:	89 04 24             	mov    %eax,(%esp)
c0100f93:	e8 4c fd ff ff       	call   c0100ce4 <list_del>
	list_add_before(&ready,&p->plist);
c0100f98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f9b:	83 c0 08             	add    $0x8,%eax
c0100f9e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100fa2:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100fa9:	e8 e9 fc ff ff       	call   c0100c97 <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100fae:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100fb4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fb7:	8b 40 04             	mov    0x4(%eax),%eax
c0100fba:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100fc1:	00 
c0100fc2:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100fc6:	89 04 24             	mov    %eax,(%esp)
c0100fc9:	e8 18 22 00 00       	call   c01031e6 <memcpy>
	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	
c0100fce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fd1:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100fd6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100fd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fdc:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100fe3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fe6:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100fed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ff0:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ff9:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100fff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101002:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0101009:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010100c:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c0101013:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101016:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101019:	89 10                	mov    %edx,(%eax)
	return p;
c010101b:	8b 45 ec             	mov    -0x14(%ebp),%eax

}
c010101e:	c9                   	leave  
c010101f:	c3                   	ret    

c0101020 <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0101020:	55                   	push   %ebp
c0101021:	89 e5                	mov    %esp,%ebp
c0101023:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0101026:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101029:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010102c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010102f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101034:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0101037:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c010103e:	8b 45 10             	mov    0x10(%ebp),%eax
c0101041:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101044:	01 c2                	add    %eax,%edx
c0101046:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101049:	01 d0                	add    %edx,%eax
c010104b:	83 e8 01             	sub    $0x1,%eax
c010104e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101051:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101054:	ba 00 00 00 00       	mov    $0x0,%edx
c0101059:	f7 75 e8             	divl   -0x18(%ebp)
c010105c:	89 d0                	mov    %edx,%eax
c010105e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101061:	29 c2                	sub    %eax,%edx
c0101063:	89 d0                	mov    %edx,%eax
c0101065:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c0101068:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010106b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010106e:	eb 61                	jmp    c01010d1 <mm_malloc+0xb1>
		p = page_alloc(0);
c0101070:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101077:	e8 2b 0f 00 00       	call   c0101fa7 <page_alloc>
c010107c:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c010107f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0101083:	75 24                	jne    c01010a9 <mm_malloc+0x89>
c0101085:	c7 44 24 0c b9 41 10 	movl   $0xc01041b9,0xc(%esp)
c010108c:	c0 
c010108d:	c7 44 24 08 25 41 10 	movl   $0xc0104125,0x8(%esp)
c0101094:	c0 
c0101095:	c7 44 24 04 56 00 00 	movl   $0x56,0x4(%esp)
c010109c:	00 
c010109d:	c7 04 24 c3 41 10 c0 	movl   $0xc01041c3,(%esp)
c01010a4:	e8 90 1b 00 00       	call   c0102c39 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c01010a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010ac:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c01010b3:	00 
c01010b4:	89 44 24 08          	mov    %eax,0x8(%esp)
c01010b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01010bb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01010c2:	89 04 24             	mov    %eax,(%esp)
c01010c5:	e8 7a 14 00 00       	call   c0102544 <page_insert>
{
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c01010ca:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01010d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010d4:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01010d7:	72 97                	jb     c0101070 <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c01010d9:	c9                   	leave  
c01010da:	c3                   	ret    

c01010db <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c01010db:	55                   	push   %ebp
c01010dc:	89 e5                	mov    %esp,%ebp
c01010de:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c01010e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010e4:	8b 55 08             	mov    0x8(%ebp),%edx
c01010e7:	01 d0                	add    %edx,%eax
c01010e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c01010ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01010ef:	c1 e8 09             	shr    $0x9,%eax
c01010f2:	83 c0 01             	add    $0x1,%eax
c01010f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c01010f8:	eb 6e                	jmp    c0101168 <readseg+0x8d>
		readsect(disks, sect);
c01010fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010fd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101101:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c0101108:	e8 65 00 00 00       	call   c0101172 <readsect>
		uint32_t rem = offset & 0x1ff;
c010110d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101110:	25 ff 01 00 00       	and    $0x1ff,%eax
c0101115:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c0101118:	b8 00 02 00 00       	mov    $0x200,%eax
c010111d:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0101120:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101123:	8b 45 08             	mov    0x8(%ebp),%eax
c0101126:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101129:	29 c2                	sub    %eax,%edx
c010112b:	89 d0                	mov    %edx,%eax
c010112d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101130:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101133:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101136:	39 d0                	cmp    %edx,%eax
c0101138:	76 02                	jbe    c010113c <readseg+0x61>
c010113a:	89 d0                	mov    %edx,%eax
c010113c:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c010113f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101142:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c0101148:	8b 45 08             	mov    0x8(%ebp),%eax
c010114b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010114e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101152:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101156:	89 04 24             	mov    %eax,(%esp)
c0101159:	e8 88 20 00 00       	call   c01031e6 <memcpy>
		va += size;
c010115e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101161:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c0101164:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c0101168:	8b 45 08             	mov    0x8(%ebp),%eax
c010116b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010116e:	72 8a                	jb     c01010fa <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c0101170:	c9                   	leave  
c0101171:	c3                   	ret    

c0101172 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c0101172:	55                   	push   %ebp
c0101173:	89 e5                	mov    %esp,%ebp
c0101175:	57                   	push   %edi
c0101176:	53                   	push   %ebx
c0101177:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010117a:	90                   	nop
c010117b:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101182:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101185:	89 c2                	mov    %eax,%edx
c0101187:	ec                   	in     (%dx),%al
c0101188:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c010118b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c010118f:	0f b6 c0             	movzbl %al,%eax
c0101192:	25 c0 00 00 00       	and    $0xc0,%eax
c0101197:	83 f8 40             	cmp    $0x40,%eax
c010119a:	75 df                	jne    c010117b <readsect+0x9>
c010119c:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c01011a3:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01011a7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01011ab:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01011ae:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c01011af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011b2:	0f b6 c0             	movzbl %al,%eax
c01011b5:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c01011bc:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01011bf:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01011c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01011c6:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c01011c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011ca:	c1 e8 08             	shr    $0x8,%eax
c01011cd:	0f b6 c0             	movzbl %al,%eax
c01011d0:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c01011d7:	88 45 db             	mov    %al,-0x25(%ebp)
c01011da:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01011de:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011e1:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c01011e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011e5:	c1 e8 10             	shr    $0x10,%eax
c01011e8:	0f b6 c0             	movzbl %al,%eax
c01011eb:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c01011f2:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01011f5:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01011f9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01011fc:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c01011fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101200:	c1 e8 18             	shr    $0x18,%eax
c0101203:	83 c8 e0             	or     $0xffffffe0,%eax
c0101206:	0f b6 c0             	movzbl %al,%eax
c0101209:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c0101210:	88 45 cb             	mov    %al,-0x35(%ebp)
c0101213:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0101217:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010121a:	ee                   	out    %al,(%dx)
c010121b:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101222:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c0101226:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010122a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c010122d:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010122e:	90                   	nop
c010122f:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101236:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0101239:	89 c2                	mov    %eax,%edx
c010123b:	ec                   	in     (%dx),%al
c010123c:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c010123f:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0101243:	0f b6 c0             	movzbl %al,%eax
c0101246:	25 c0 00 00 00       	and    $0xc0,%eax
c010124b:	83 f8 40             	cmp    $0x40,%eax
c010124e:	75 df                	jne    c010122f <readsect+0xbd>
c0101250:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c0101257:	8b 45 08             	mov    0x8(%ebp),%eax
c010125a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010125d:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c0101264:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0101267:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c010126a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010126d:	89 cb                	mov    %ecx,%ebx
c010126f:	89 df                	mov    %ebx,%edi
c0101271:	89 c1                	mov    %eax,%ecx
c0101273:	fc                   	cld    
c0101274:	f2 6d                	repnz insl (%dx),%es:(%edi)
c0101276:	89 c8                	mov    %ecx,%eax
c0101278:	89 fb                	mov    %edi,%ebx
c010127a:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c010127d:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c0101280:	83 c4 50             	add    $0x50,%esp
c0101283:	5b                   	pop    %ebx
c0101284:	5f                   	pop    %edi
c0101285:	5d                   	pop    %ebp
c0101286:	c3                   	ret    

c0101287 <pcb_new>:

void pcb_new()
{
c0101287:	55                   	push   %ebp
c0101288:	89 e5                	mov    %esp,%ebp
c010128a:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c010128d:	e8 54 fc ff ff       	call   c0100ee6 <pcb_alloc>
c0101292:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c0101295:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101299:	75 05                	jne    c01012a0 <pcb_new+0x19>
c010129b:	e9 8b 01 00 00       	jmp    c010142b <pcb_new+0x1a4>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c01012a0:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c01012a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012aa:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c01012b1:	00 
c01012b2:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01012b9:	00 
c01012ba:	89 04 24             	mov    %eax,(%esp)
c01012bd:	e8 19 fe ff ff       	call   c01010db <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c01012c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012c5:	8b 00                	mov    (%eax),%eax
c01012c7:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c01012cc:	74 24                	je     c01012f2 <pcb_new+0x6b>
c01012ce:	c7 44 24 0c d6 41 10 	movl   $0xc01041d6,0xc(%esp)
c01012d5:	c0 
c01012d6:	c7 44 24 08 25 41 10 	movl   $0xc0104125,0x8(%esp)
c01012dd:	c0 
c01012de:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
c01012e5:	00 
c01012e6:	c7 04 24 c3 41 10 c0 	movl   $0xc01041c3,(%esp)
c01012ed:	e8 47 19 00 00       	call   c0102c39 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c01012f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012f5:	8b 50 1c             	mov    0x1c(%eax),%edx
c01012f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012fb:	01 d0                	add    %edx,%eax
c01012fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c0101300:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101303:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0101307:	0f b7 c0             	movzwl %ax,%eax
c010130a:	c1 e0 05             	shl    $0x5,%eax
c010130d:	89 c2                	mov    %eax,%edx
c010130f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101312:	01 d0                	add    %edx,%eax
c0101314:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c0101317:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010131a:	8b 40 04             	mov    0x4(%eax),%eax
c010131d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101321:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c0101328:	00 
c0101329:	c7 04 24 c3 41 10 c0 	movl   $0xc01041c3,(%esp)
c0101330:	e8 55 fa ff ff       	call   c0100d8a <_paddr>
c0101335:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0101338:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010133b:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) 
c010133e:	e9 8a 00 00 00       	jmp    c01013cd <pcb_new+0x146>
	{
		if (ph -> p_type != ELF_PROG_LOAD) 
c0101343:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101346:	8b 00                	mov    (%eax),%eax
c0101348:	83 f8 01             	cmp    $0x1,%eax
c010134b:	74 02                	je     c010134f <pcb_new+0xc8>
			continue;
c010134d:	eb 7a                	jmp    c01013c9 <pcb_new+0x142>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c010134f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101352:	8b 48 14             	mov    0x14(%eax),%ecx
c0101355:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101358:	8b 50 08             	mov    0x8(%eax),%edx
c010135b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010135e:	8b 40 04             	mov    0x4(%eax),%eax
c0101361:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0101365:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101369:	89 04 24             	mov    %eax,(%esp)
c010136c:	e8 af fc ff ff       	call   c0101020 <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c0101371:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101374:	8b 40 04             	mov    0x4(%eax),%eax
c0101377:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c010137d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101380:	8b 50 10             	mov    0x10(%eax),%edx
c0101383:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101386:	8b 40 08             	mov    0x8(%eax),%eax
c0101389:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010138d:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101391:	89 04 24             	mov    %eax,(%esp)
c0101394:	e8 42 fd ff ff       	call   c01010db <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c0101399:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010139c:	8b 50 14             	mov    0x14(%eax),%edx
c010139f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013a2:	8b 40 10             	mov    0x10(%eax),%eax
c01013a5:	29 c2                	sub    %eax,%edx
c01013a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013aa:	8b 48 08             	mov    0x8(%eax),%ecx
c01013ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013b0:	8b 40 10             	mov    0x10(%eax),%eax
c01013b3:	01 c8                	add    %ecx,%eax
c01013b5:	89 54 24 08          	mov    %edx,0x8(%esp)
c01013b9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01013c0:	00 
c01013c1:	89 04 24             	mov    %eax,(%esp)
c01013c4:	e8 3a 1e 00 00       	call   c0103203 <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) 
c01013c9:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01013cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013d0:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01013d3:	0f 82 6a ff ff ff    	jb     c0101343 <pcb_new+0xbc>
			continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf->e_entry;
c01013d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013dc:	8b 00                	mov    (%eax),%eax
c01013de:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01013e1:	8b 52 18             	mov    0x18(%edx),%edx
c01013e4:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP-USTACKSIZE, USTACKSIZE);
c01013e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013ea:	8b 40 04             	mov    0x4(%eax),%eax
c01013ed:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c01013f4:	00 
c01013f5:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c01013fc:	be 
c01013fd:	89 04 24             	mov    %eax,(%esp)
c0101400:	e8 1b fc ff ff       	call   c0101020 <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c0101405:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010140a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010140e:	c7 44 24 04 8e 00 00 	movl   $0x8e,0x4(%esp)
c0101415:	00 
c0101416:	c7 04 24 c3 41 10 c0 	movl   $0xc01041c3,(%esp)
c010141d:	e8 68 f9 ff ff       	call   c0100d8a <_paddr>
c0101422:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101425:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101428:	0f 22 d8             	mov    %eax,%cr3
}
c010142b:	c9                   	leave  
c010142c:	c3                   	ret    

c010142d <pcb_copy>:

void pcb_copy(PCB *fa,PCB *tb,int pan)
{
c010142d:	55                   	push   %ebp
c010142e:	89 e5                	mov    %esp,%ebp
c0101430:	53                   	push   %ebx
c0101431:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);//get the addr for the information of process
c0101434:	c7 45 f4 2c 00 00 00 	movl   $0x2c,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c010143b:	b8 00 10 00 00       	mov    $0x1000,%eax
c0101440:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0101443:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c0101446:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101449:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c010144c:	8b 55 08             	mov    0x8(%ebp),%edx
c010144f:	01 d1                	add    %edx,%ecx
c0101451:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c0101454:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101457:	01 da                	add    %ebx,%edx
c0101459:	89 44 24 08          	mov    %eax,0x8(%esp)
c010145d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101461:	89 14 24             	mov    %edx,(%esp)
c0101464:	e8 7d 1d 00 00       	call   c01031e6 <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c0101469:	8b 45 08             	mov    0x8(%ebp),%eax
c010146c:	8b 00                	mov    (%eax),%eax
c010146e:	89 c2                	mov    %eax,%edx
c0101470:	8b 45 08             	mov    0x8(%ebp),%eax
c0101473:	29 c2                	sub    %eax,%edx
c0101475:	89 d0                	mov    %edx,%eax
c0101477:	89 c2                	mov    %eax,%edx
c0101479:	8b 45 0c             	mov    0xc(%ebp),%eax
c010147c:	01 c2                	add    %eax,%edx
c010147e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101481:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c0101483:	8b 45 08             	mov    0x8(%ebp),%eax
c0101486:	8b 50 18             	mov    0x18(%eax),%edx
c0101489:	8b 45 0c             	mov    0xc(%ebp),%eax
c010148c:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c010148f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101492:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101495:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101498:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c010149b:	8b 45 08             	mov    0x8(%ebp),%eax
c010149e:	8b 50 20             	mov    0x20(%eax),%edx
c01014a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014a4:	89 50 20             	mov    %edx,0x20(%eax)
	if(pan==DEEP){
c01014a7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01014ab:	75 22                	jne    c01014cf <pcb_copy+0xa2>
		pg_copy(fa->pgdir,tb->pgdir,DEEP);
c01014ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014b0:	8b 50 04             	mov    0x4(%eax),%edx
c01014b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01014b6:	8b 40 04             	mov    0x4(%eax),%eax
c01014b9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01014c0:	00 
c01014c1:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014c5:	89 04 24             	mov    %eax,(%esp)
c01014c8:	e8 6b 0c 00 00       	call   c0102138 <pg_copy>
c01014cd:	eb 20                	jmp    c01014ef <pcb_copy+0xc2>
	}
	else{
		pg_copy(fa->pgdir,tb->pgdir,SHALLOW);
c01014cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014d2:	8b 50 04             	mov    0x4(%eax),%edx
c01014d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01014d8:	8b 40 04             	mov    0x4(%eax),%eax
c01014db:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01014e2:	00 
c01014e3:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014e7:	89 04 24             	mov    %eax,(%esp)
c01014ea:	e8 49 0c 00 00       	call   c0102138 <pg_copy>
	}
}
c01014ef:	83 c4 24             	add    $0x24,%esp
c01014f2:	5b                   	pop    %ebx
c01014f3:	5d                   	pop    %ebp
c01014f4:	c3                   	ret    

c01014f5 <pcb_remove>:

void pcb_remove(PCB *p)
{
c01014f5:	55                   	push   %ebp
c01014f6:	89 e5                	mov    %esp,%ebp
c01014f8:	83 ec 18             	sub    $0x18,%esp
	pg_remove(p->pgdir);
c01014fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01014fe:	8b 40 04             	mov    0x4(%eax),%eax
c0101501:	89 04 24             	mov    %eax,(%esp)
c0101504:	e8 88 0e 00 00       	call   c0102391 <pg_remove>
}
c0101509:	c9                   	leave  
c010150a:	c3                   	ret    

c010150b <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c010150b:	55                   	push   %ebp
c010150c:	89 e5                	mov    %esp,%ebp
c010150e:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0101511:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101515:	75 24                	jne    c010153b <list_add+0x30>
c0101517:	c7 44 24 0c f0 41 10 	movl   $0xc01041f0,0xc(%esp)
c010151e:	c0 
c010151f:	c7 44 24 08 fd 41 10 	movl   $0xc01041fd,0x8(%esp)
c0101526:	c0 
c0101527:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c010152e:	00 
c010152f:	c7 04 24 12 42 10 c0 	movl   $0xc0104212,(%esp)
c0101536:	e8 fe 16 00 00       	call   c0102c39 <_panic>
	data->prev = prev;
c010153b:	8b 45 10             	mov    0x10(%ebp),%eax
c010153e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101541:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101543:	8b 45 10             	mov    0x10(%ebp),%eax
c0101546:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101549:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010154c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101550:	74 09                	je     c010155b <list_add+0x50>
c0101552:	8b 45 08             	mov    0x8(%ebp),%eax
c0101555:	8b 55 10             	mov    0x10(%ebp),%edx
c0101558:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c010155b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010155f:	74 08                	je     c0101569 <list_add+0x5e>
c0101561:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101564:	8b 55 10             	mov    0x10(%ebp),%edx
c0101567:	89 10                	mov    %edx,(%eax)
}
c0101569:	c9                   	leave  
c010156a:	c3                   	ret    

c010156b <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c010156b:	55                   	push   %ebp
c010156c:	89 e5                	mov    %esp,%ebp
c010156e:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101571:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101575:	75 24                	jne    c010159b <list_add_before+0x30>
c0101577:	c7 44 24 0c 28 42 10 	movl   $0xc0104228,0xc(%esp)
c010157e:	c0 
c010157f:	c7 44 24 08 fd 41 10 	movl   $0xc01041fd,0x8(%esp)
c0101586:	c0 
c0101587:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c010158e:	00 
c010158f:	c7 04 24 12 42 10 c0 	movl   $0xc0104212,(%esp)
c0101596:	e8 9e 16 00 00       	call   c0102c39 <_panic>
	list_add(one->prev, one, data);
c010159b:	8b 45 08             	mov    0x8(%ebp),%eax
c010159e:	8b 00                	mov    (%eax),%eax
c01015a0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01015a3:	89 54 24 08          	mov    %edx,0x8(%esp)
c01015a7:	8b 55 08             	mov    0x8(%ebp),%edx
c01015aa:	89 54 24 04          	mov    %edx,0x4(%esp)
c01015ae:	89 04 24             	mov    %eax,(%esp)
c01015b1:	e8 55 ff ff ff       	call   c010150b <list_add>
}
c01015b6:	c9                   	leave  
c01015b7:	c3                   	ret    

c01015b8 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c01015b8:	55                   	push   %ebp
c01015b9:	89 e5                	mov    %esp,%ebp
c01015bb:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c01015be:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01015c2:	75 24                	jne    c01015e8 <list_del+0x30>
c01015c4:	c7 44 24 0c f0 41 10 	movl   $0xc01041f0,0xc(%esp)
c01015cb:	c0 
c01015cc:	c7 44 24 08 fd 41 10 	movl   $0xc01041fd,0x8(%esp)
c01015d3:	c0 
c01015d4:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c01015db:	00 
c01015dc:	c7 04 24 12 42 10 c0 	movl   $0xc0104212,(%esp)
c01015e3:	e8 51 16 00 00       	call   c0102c39 <_panic>
	list *prev = data->prev;
c01015e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01015eb:	8b 00                	mov    (%eax),%eax
c01015ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01015f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01015f3:	8b 40 04             	mov    0x4(%eax),%eax
c01015f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01015f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01015fd:	74 09                	je     c0101608 <list_del+0x50>
c01015ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101602:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101605:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0101608:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010160c:	74 08                	je     c0101616 <list_del+0x5e>
c010160e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101611:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101614:	89 10                	mov    %edx,(%eax)
}
c0101616:	c9                   	leave  
c0101617:	c3                   	ret    

c0101618 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c0101618:	55                   	push   %ebp
c0101619:	89 e5                	mov    %esp,%ebp
c010161b:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c010161e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101622:	75 24                	jne    c0101648 <list_empty+0x30>
c0101624:	c7 44 24 0c 28 42 10 	movl   $0xc0104228,0xc(%esp)
c010162b:	c0 
c010162c:	c7 44 24 08 fd 41 10 	movl   $0xc01041fd,0x8(%esp)
c0101633:	c0 
c0101634:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c010163b:	00 
c010163c:	c7 04 24 12 42 10 c0 	movl   $0xc0104212,(%esp)
c0101643:	e8 f1 15 00 00       	call   c0102c39 <_panic>
	return one == one->next;
c0101648:	8b 45 08             	mov    0x8(%ebp),%eax
c010164b:	8b 40 04             	mov    0x4(%eax),%eax
c010164e:	3b 45 08             	cmp    0x8(%ebp),%eax
c0101651:	0f 94 c0             	sete   %al
c0101654:	0f b6 c0             	movzbl %al,%eax
}
c0101657:	c9                   	leave  
c0101658:	c3                   	ret    

c0101659 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101659:	55                   	push   %ebp
c010165a:	89 e5                	mov    %esp,%ebp
c010165c:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c010165f:	8b 45 10             	mov    0x10(%ebp),%eax
c0101662:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101667:	77 21                	ja     c010168a <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101669:	8b 45 10             	mov    0x10(%ebp),%eax
c010166c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101670:	c7 44 24 08 34 42 10 	movl   $0xc0104234,0x8(%esp)
c0101677:	c0 
c0101678:	8b 45 0c             	mov    0xc(%ebp),%eax
c010167b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010167f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101682:	89 04 24             	mov    %eax,(%esp)
c0101685:	e8 af 15 00 00       	call   c0102c39 <_panic>
	return (physaddr_t)kva - KERNBASE;
c010168a:	8b 45 10             	mov    0x10(%ebp),%eax
c010168d:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101692:	c9                   	leave  
c0101693:	c3                   	ret    

c0101694 <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_copy(PCB*,PCB*,int);
void sys_fork(){
c0101694:	55                   	push   %ebp
c0101695:	89 e5                	mov    %esp,%ebp
c0101697:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c010169a:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010169f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c01016a2:	e8 3f f8 ff ff       	call   c0100ee6 <pcb_alloc>
c01016a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_copy(fa,ch,DEEP);//written in pcb.c
c01016aa:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01016b1:	00 
c01016b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016b5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01016b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016bc:	89 04 24             	mov    %eax,(%esp)
c01016bf:	e8 69 fd ff ff       	call   c010142d <pcb_copy>
	ch->ppid=fa->pid;
c01016c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016c7:	8b 50 10             	mov    0x10(%eax),%edx
c01016ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016cd:	89 50 14             	mov    %edx,0x14(%eax)
	(fa->tf)->eax=ch->pid;
c01016d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016d3:	8b 00                	mov    (%eax),%eax
c01016d5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01016d8:	8b 52 10             	mov    0x10(%edx),%edx
c01016db:	89 50 1c             	mov    %edx,0x1c(%eax)
	(ch->tf)->eax=0;
c01016de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016e1:	8b 00                	mov    (%eax),%eax
c01016e3:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c01016ea:	c9                   	leave  
c01016eb:	c3                   	ret    

c01016ec <sys_getpid>:

uint32_t sys_getpid(){
c01016ec:	55                   	push   %ebp
c01016ed:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c01016ef:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016f4:	8b 40 10             	mov    0x10(%eax),%eax
}
c01016f7:	5d                   	pop    %ebp
c01016f8:	c3                   	ret    

c01016f9 <sys_exit>:

void sys_exit(){
c01016f9:	55                   	push   %ebp
c01016fa:	89 e5                	mov    %esp,%ebp
c01016fc:	83 ec 28             	sub    $0x28,%esp
	printk("teminate the thread %d successfully!\n",pcbnow->pid);
c01016ff:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101704:	8b 40 10             	mov    0x10(%eax),%eax
c0101707:	89 44 24 04          	mov    %eax,0x4(%esp)
c010170b:	c7 04 24 58 42 10 c0 	movl   $0xc0104258,(%esp)
c0101712:	e8 51 16 00 00       	call   c0102d68 <printk>
	list *lnext;
	list *t=&ready;
c0101717:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c010171e:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101723:	8b 40 04             	mov    0x4(%eax),%eax
c0101726:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101729:	75 22                	jne    c010174d <sys_exit+0x54>
 	{
		if(t->next==now)
c010172b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010172e:	8b 50 04             	mov    0x4(%eax),%edx
c0101731:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101736:	39 c2                	cmp    %eax,%edx
c0101738:	75 08                	jne    c0101742 <sys_exit+0x49>
			lnext=t;
c010173a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010173d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101740:	eb 2f                	jmp    c0101771 <sys_exit+0x78>
		else
			lnext=t->next;
c0101742:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101745:	8b 40 04             	mov    0x4(%eax),%eax
c0101748:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010174b:	eb 24                	jmp    c0101771 <sys_exit+0x78>
	}
	else
	{
		if(now->next==now)
c010174d:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101752:	8b 50 04             	mov    0x4(%eax),%edx
c0101755:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010175a:	39 c2                	cmp    %eax,%edx
c010175c:	75 08                	jne    c0101766 <sys_exit+0x6d>
			lnext=t;
c010175e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101761:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101764:	eb 0b                	jmp    c0101771 <sys_exit+0x78>
		else
			lnext=now->next;
c0101766:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010176b:	8b 40 04             	mov    0x4(%eax),%eax
c010176e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c0101771:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101776:	89 04 24             	mov    %eax,(%esp)
c0101779:	e8 3a fe ff ff       	call   c01015b8 <list_del>
	list_add_before(&free,now);
c010177e:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101783:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101787:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c010178e:	e8 d8 fd ff ff       	call   c010156b <list_add_before>
	lcr3(PADDR(kern_pgdir));
c0101793:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101798:	89 44 24 08          	mov    %eax,0x8(%esp)
c010179c:	c7 44 24 04 2a 00 00 	movl   $0x2a,0x4(%esp)
c01017a3:	00 
c01017a4:	c7 04 24 7e 42 10 c0 	movl   $0xc010427e,(%esp)
c01017ab:	e8 a9 fe ff ff       	call   c0101659 <_paddr>
c01017b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01017b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01017b6:	0f 22 d8             	mov    %eax,%cr3
	pcb_remove(pcbnow);
c01017b9:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017be:	89 04 24             	mov    %eax,(%esp)
c01017c1:	e8 2f fd ff ff       	call   c01014f5 <pcb_remove>
	now=lnext;
c01017c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017c9:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c01017ce:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017d3:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c01017d8:	75 0c                	jne    c01017e6 <sys_exit+0xed>
		pcbnow=&init;
c01017da:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01017e1:	3f 16 c0 
c01017e4:	eb 0d                	jmp    c01017f3 <sys_exit+0xfa>
	else
		pcbnow=list_entry(now,PCB,plist);
c01017e6:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017eb:	83 e8 08             	sub    $0x8,%eax
c01017ee:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01017f3:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017f8:	05 f8 0f 00 00       	add    $0xff8,%eax
c01017fd:	89 04 24             	mov    %eax,(%esp)
c0101800:	e8 23 13 00 00       	call   c0102b28 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c0101805:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010180a:	8b 40 04             	mov    0x4(%eax),%eax
c010180d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101811:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
c0101818:	00 
c0101819:	c7 04 24 7e 42 10 c0 	movl   $0xc010427e,(%esp)
c0101820:	e8 34 fe ff ff       	call   c0101659 <_paddr>
c0101825:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101828:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010182b:	0f 22 d8             	mov    %eax,%cr3
}
c010182e:	c9                   	leave  
c010182f:	c3                   	ret    

c0101830 <sys_sleep>:

void sys_sleep(int time){
c0101830:	55                   	push   %ebp
c0101831:	89 e5                	mov    %esp,%ebp
c0101833:	83 ec 28             	sub    $0x28,%esp
	list *lnext;
	list *t=&ready;
c0101836:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c010183d:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101842:	8b 40 04             	mov    0x4(%eax),%eax
c0101845:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101848:	75 22                	jne    c010186c <sys_sleep+0x3c>
	{
		if(t->next==now)
c010184a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010184d:	8b 50 04             	mov    0x4(%eax),%edx
c0101850:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101855:	39 c2                	cmp    %eax,%edx
c0101857:	75 08                	jne    c0101861 <sys_sleep+0x31>
			lnext=t;
c0101859:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010185c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010185f:	eb 2f                	jmp    c0101890 <sys_sleep+0x60>
		else
			lnext=t->next;
c0101861:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101864:	8b 40 04             	mov    0x4(%eax),%eax
c0101867:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010186a:	eb 24                	jmp    c0101890 <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c010186c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101871:	8b 50 04             	mov    0x4(%eax),%edx
c0101874:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101879:	39 c2                	cmp    %eax,%edx
c010187b:	75 08                	jne    c0101885 <sys_sleep+0x55>
			lnext=t;
c010187d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101880:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101883:	eb 0b                	jmp    c0101890 <sys_sleep+0x60>
		else
			lnext=now->next;
c0101885:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010188a:	8b 40 04             	mov    0x4(%eax),%eax
c010188d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c0101890:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101895:	89 04 24             	mov    %eax,(%esp)
c0101898:	e8 1b fd ff ff       	call   c01015b8 <list_del>
	list_add_before(&block,now);
c010189d:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018a2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01018a6:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c01018ad:	e8 b9 fc ff ff       	call   c010156b <list_add_before>
	pcbnow->state=BLOCKED;
c01018b2:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01018b7:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c01018be:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c01018c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01018c7:	c1 e0 02             	shl    $0x2,%eax
c01018ca:	89 c1                	mov    %eax,%ecx
c01018cc:	c1 e1 04             	shl    $0x4,%ecx
c01018cf:	29 c1                	sub    %eax,%ecx
c01018d1:	89 c8                	mov    %ecx,%eax
c01018d3:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=lnext;
c01018d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018d9:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c01018de:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018e3:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c01018e8:	75 0c                	jne    c01018f6 <sys_sleep+0xc6>
		pcbnow=&init;
c01018ea:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01018f1:	3f 16 c0 
c01018f4:	eb 0d                	jmp    c0101903 <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c01018f6:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01018fb:	83 e8 08             	sub    $0x8,%eax
c01018fe:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c0101903:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101908:	05 f8 0f 00 00       	add    $0xff8,%eax
c010190d:	89 04 24             	mov    %eax,(%esp)
c0101910:	e8 13 12 00 00       	call   c0102b28 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c0101915:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010191a:	8b 40 04             	mov    0x4(%eax),%eax
c010191d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101921:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c0101928:	00 
c0101929:	c7 04 24 7e 42 10 c0 	movl   $0xc010427e,(%esp)
c0101930:	e8 24 fd ff ff       	call   c0101659 <_paddr>
c0101935:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101938:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010193b:	0f 22 d8             	mov    %eax,%cr3
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
c010193e:	c9                   	leave  
c010193f:	c3                   	ret    

c0101940 <kthread>:

int kthread(void *addr)
{
c0101940:	55                   	push   %ebp
c0101941:	89 e5                	mov    %esp,%ebp
c0101943:	83 ec 28             	sub    $0x28,%esp
	PCB *p=pcb_alloc();
c0101946:	e8 9b f5 ff ff       	call   c0100ee6 <pcb_alloc>
c010194b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	pcb_copy(pcbnow,p,SHALLOW);
c010194e:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101953:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010195a:	00 
c010195b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010195e:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101962:	89 04 24             	mov    %eax,(%esp)
c0101965:	e8 c3 fa ff ff       	call   c010142d <pcb_copy>
	mm_malloc(p->pgdir,USTACKTOP-USTACKSIZE,USTACKSIZE);
c010196a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010196d:	8b 40 04             	mov    0x4(%eax),%eax
c0101970:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101977:	00 
c0101978:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c010197f:	be 
c0101980:	89 04 24             	mov    %eax,(%esp)
c0101983:	e8 98 f6 ff ff       	call   c0101020 <mm_malloc>
	TrapFrame *tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);
c0101988:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010198b:	05 ac 0f 00 00       	add    $0xfac,%eax
c0101990:	89 45 f0             	mov    %eax,-0x10(%ebp)
	tf->eip=(uint32_t)addr;
c0101993:	8b 55 08             	mov    0x8(%ebp),%edx
c0101996:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101999:	89 50 38             	mov    %edx,0x38(%eax)
	tf->esp=USTACKTOP-12;
c010199c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010199f:	c7 40 44 f4 df ff be 	movl   $0xbeffdff4,0x44(%eax)
	return 0;
c01019a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
c01019ab:	c9                   	leave  
c01019ac:	c3                   	ret    

c01019ad <kthread_join>:

int kthread_join()
{
c01019ad:	55                   	push   %ebp
c01019ae:	89 e5                	mov    %esp,%ebp
c01019b0:	83 ec 18             	sub    $0x18,%esp
	if(list_empty(&ready)&&list_empty(&block))
c01019b3:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c01019ba:	e8 59 fc ff ff       	call   c0101618 <list_empty>
c01019bf:	85 c0                	test   %eax,%eax
c01019c1:	74 17                	je     c01019da <kthread_join+0x2d>
c01019c3:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c01019ca:	e8 49 fc ff ff       	call   c0101618 <list_empty>
c01019cf:	85 c0                	test   %eax,%eax
c01019d1:	74 07                	je     c01019da <kthread_join+0x2d>
		return 1;
c01019d3:	b8 01 00 00 00       	mov    $0x1,%eax
c01019d8:	eb 05                	jmp    c01019df <kthread_join+0x32>
	else
		return 0;			
c01019da:	b8 00 00 00 00       	mov    $0x0,%eax
c01019df:	c9                   	leave  
c01019e0:	c3                   	ret    

c01019e1 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01019e1:	55                   	push   %ebp
c01019e2:	89 e5                	mov    %esp,%ebp
c01019e4:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01019e7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01019eb:	75 24                	jne    c0101a11 <list_add+0x30>
c01019ed:	c7 44 24 0c 97 42 10 	movl   $0xc0104297,0xc(%esp)
c01019f4:	c0 
c01019f5:	c7 44 24 08 a4 42 10 	movl   $0xc01042a4,0x8(%esp)
c01019fc:	c0 
c01019fd:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0101a04:	00 
c0101a05:	c7 04 24 b9 42 10 c0 	movl   $0xc01042b9,(%esp)
c0101a0c:	e8 28 12 00 00       	call   c0102c39 <_panic>
	data->prev = prev;
c0101a11:	8b 45 10             	mov    0x10(%ebp),%eax
c0101a14:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a17:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101a19:	8b 45 10             	mov    0x10(%ebp),%eax
c0101a1c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a1f:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101a22:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a26:	74 09                	je     c0101a31 <list_add+0x50>
c0101a28:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a2b:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a2e:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101a31:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101a35:	74 08                	je     c0101a3f <list_add+0x5e>
c0101a37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a3a:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a3d:	89 10                	mov    %edx,(%eax)
}
c0101a3f:	c9                   	leave  
c0101a40:	c3                   	ret    

c0101a41 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101a41:	55                   	push   %ebp
c0101a42:	89 e5                	mov    %esp,%ebp
c0101a44:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101a47:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a4b:	75 24                	jne    c0101a71 <list_add_before+0x30>
c0101a4d:	c7 44 24 0c cf 42 10 	movl   $0xc01042cf,0xc(%esp)
c0101a54:	c0 
c0101a55:	c7 44 24 08 a4 42 10 	movl   $0xc01042a4,0x8(%esp)
c0101a5c:	c0 
c0101a5d:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0101a64:	00 
c0101a65:	c7 04 24 b9 42 10 c0 	movl   $0xc01042b9,(%esp)
c0101a6c:	e8 c8 11 00 00       	call   c0102c39 <_panic>
	list_add(one->prev, one, data);
c0101a71:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a74:	8b 00                	mov    (%eax),%eax
c0101a76:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a79:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a7d:	8b 55 08             	mov    0x8(%ebp),%edx
c0101a80:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101a84:	89 04 24             	mov    %eax,(%esp)
c0101a87:	e8 55 ff ff ff       	call   c01019e1 <list_add>
}
c0101a8c:	c9                   	leave  
c0101a8d:	c3                   	ret    

c0101a8e <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0101a8e:	55                   	push   %ebp
c0101a8f:	89 e5                	mov    %esp,%ebp
c0101a91:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0101a94:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101a98:	75 24                	jne    c0101abe <list_del+0x30>
c0101a9a:	c7 44 24 0c 97 42 10 	movl   $0xc0104297,0xc(%esp)
c0101aa1:	c0 
c0101aa2:	c7 44 24 08 a4 42 10 	movl   $0xc01042a4,0x8(%esp)
c0101aa9:	c0 
c0101aaa:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0101ab1:	00 
c0101ab2:	c7 04 24 b9 42 10 c0 	movl   $0xc01042b9,(%esp)
c0101ab9:	e8 7b 11 00 00       	call   c0102c39 <_panic>
	list *prev = data->prev;
c0101abe:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ac1:	8b 00                	mov    (%eax),%eax
c0101ac3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0101ac6:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ac9:	8b 40 04             	mov    0x4(%eax),%eax
c0101acc:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0101acf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101ad3:	74 09                	je     c0101ade <list_del+0x50>
c0101ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ad8:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101adb:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0101ade:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101ae2:	74 08                	je     c0101aec <list_del+0x5e>
c0101ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ae7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101aea:	89 10                	mov    %edx,(%eax)
}
c0101aec:	c9                   	leave  
c0101aed:	c3                   	ret    

c0101aee <list_init>:

static inline void
list_init(list *one) {
c0101aee:	55                   	push   %ebp
c0101aef:	89 e5                	mov    %esp,%ebp
c0101af1:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101af4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101af8:	75 24                	jne    c0101b1e <list_init+0x30>
c0101afa:	c7 44 24 0c cf 42 10 	movl   $0xc01042cf,0xc(%esp)
c0101b01:	c0 
c0101b02:	c7 44 24 08 a4 42 10 	movl   $0xc01042a4,0x8(%esp)
c0101b09:	c0 
c0101b0a:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
c0101b11:	00 
c0101b12:	c7 04 24 b9 42 10 c0 	movl   $0xc01042b9,(%esp)
c0101b19:	e8 1b 11 00 00       	call   c0102c39 <_panic>
	one->prev = one->next = one;
c0101b1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b21:	8b 55 08             	mov    0x8(%ebp),%edx
c0101b24:	89 50 04             	mov    %edx,0x4(%eax)
c0101b27:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b2a:	8b 50 04             	mov    0x4(%eax),%edx
c0101b2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b30:	89 10                	mov    %edx,(%eax)
}
c0101b32:	c9                   	leave  
c0101b33:	c3                   	ret    

c0101b34 <list_empty>:

static inline bool
list_empty(list *one) {
c0101b34:	55                   	push   %ebp
c0101b35:	89 e5                	mov    %esp,%ebp
c0101b37:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101b3a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101b3e:	75 24                	jne    c0101b64 <list_empty+0x30>
c0101b40:	c7 44 24 0c cf 42 10 	movl   $0xc01042cf,0xc(%esp)
c0101b47:	c0 
c0101b48:	c7 44 24 08 a4 42 10 	movl   $0xc01042a4,0x8(%esp)
c0101b4f:	c0 
c0101b50:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0101b57:	00 
c0101b58:	c7 04 24 b9 42 10 c0 	movl   $0xc01042b9,(%esp)
c0101b5f:	e8 d5 10 00 00       	call   c0102c39 <_panic>
	return one == one->next;
c0101b64:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b67:	8b 40 04             	mov    0x4(%eax),%eax
c0101b6a:	3b 45 08             	cmp    0x8(%ebp),%eax
c0101b6d:	0f 94 c0             	sete   %al
c0101b70:	0f b6 c0             	movzbl %al,%eax
}
c0101b73:	c9                   	leave  
c0101b74:	c3                   	ret    

c0101b75 <ksem_init>:
#include "common.h"
#include "list.h"
#include "pcb.h"

int ksem_init(Sema *sema,int value)
{
c0101b75:	55                   	push   %ebp
c0101b76:	89 e5                	mov    %esp,%ebp
c0101b78:	83 ec 18             	sub    $0x18,%esp
	//printk("%d\n",value);
	sema->value=value;
c0101b7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b7e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101b81:	89 10                	mov    %edx,(%eax)
	sema->link=0;
c0101b83:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b86:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&sema->wait);
c0101b8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b90:	83 c0 08             	add    $0x8,%eax
c0101b93:	89 04 24             	mov    %eax,(%esp)
c0101b96:	e8 53 ff ff ff       	call   c0101aee <list_init>
	return 0;
c0101b9b:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101ba0:	c9                   	leave  
c0101ba1:	c3                   	ret    

c0101ba2 <ksem_destroy>:

int ksem_destroy(Sema *sema)
{
c0101ba2:	55                   	push   %ebp
c0101ba3:	89 e5                	mov    %esp,%ebp
c0101ba5:	83 ec 28             	sub    $0x28,%esp
	sema->value=0;
c0101ba8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	sema->link=0;
c0101bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bb4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list *one;
	list_foreach(one,&sema->wait)
c0101bbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bbe:	8b 40 0c             	mov    0xc(%eax),%eax
c0101bc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bc4:	eb 27                	jmp    c0101bed <ksem_destroy+0x4b>
	{
		list_del(one);
c0101bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bc9:	89 04 24             	mov    %eax,(%esp)
c0101bcc:	e8 bd fe ff ff       	call   c0101a8e <list_del>
		list_add_before(&ready,one);	
c0101bd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bd4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101bd8:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101bdf:	e8 5d fe ff ff       	call   c0101a41 <list_add_before>
int ksem_destroy(Sema *sema)
{
	sema->value=0;
	sema->link=0;
	list *one;
	list_foreach(one,&sema->wait)
c0101be4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101be7:	8b 40 04             	mov    0x4(%eax),%eax
c0101bea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bed:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bf0:	83 c0 08             	add    $0x8,%eax
c0101bf3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0101bf6:	75 ce                	jne    c0101bc6 <ksem_destroy+0x24>
	{
		list_del(one);
		list_add_before(&ready,one);	
	}
	printk("destroy the semaphore\n");
c0101bf8:	c7 04 24 db 42 10 c0 	movl   $0xc01042db,(%esp)
c0101bff:	e8 64 11 00 00       	call   c0102d68 <printk>
	return 0;
c0101c04:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0101c09:	c9                   	leave  
c0101c0a:	c3                   	ret    

c0101c0b <ksem_wait>:

int ksem_wait(Sema *sema)
{
c0101c0b:	55                   	push   %ebp
c0101c0c:	89 e5                	mov    %esp,%ebp
c0101c0e:	83 ec 28             	sub    $0x28,%esp
	sema->link++;
c0101c11:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c14:	8b 40 04             	mov    0x4(%eax),%eax
c0101c17:	8d 50 01             	lea    0x1(%eax),%edx
c0101c1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c1d:	89 50 04             	mov    %edx,0x4(%eax)
	if(sema->value>0)
c0101c20:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c23:	8b 00                	mov    (%eax),%eax
c0101c25:	85 c0                	test   %eax,%eax
c0101c27:	7e 14                	jle    c0101c3d <ksem_wait+0x32>
	{
		sema->value--;
c0101c29:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c2c:	8b 00                	mov    (%eax),%eax
c0101c2e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c31:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c34:	89 10                	mov    %edx,(%eax)
		return 0;
c0101c36:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c3b:	eb 46                	jmp    c0101c83 <ksem_wait+0x78>
	}
	else{
		sema->value--;
c0101c3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c40:	8b 00                	mov    (%eax),%eax
c0101c42:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c48:	89 10                	mov    %edx,(%eax)
		list *it = now;
c0101c4a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101c4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(it);
c0101c52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c55:	89 04 24             	mov    %eax,(%esp)
c0101c58:	e8 31 fe ff ff       	call   c0101a8e <list_del>
		schedule(0);
c0101c5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101c64:	e8 e0 0b 00 00       	call   c0102849 <schedule>
		list_add_before(&sema->wait,it);
c0101c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c6c:	8d 50 08             	lea    0x8(%eax),%edx
c0101c6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c72:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c76:	89 14 24             	mov    %edx,(%esp)
c0101c79:	e8 c3 fd ff ff       	call   c0101a41 <list_add_before>
	}
	return -1;
c0101c7e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
c0101c83:	c9                   	leave  
c0101c84:	c3                   	ret    

c0101c85 <ksem_trywait>:

int ksem_trywait(Sema *sema)
{
c0101c85:	55                   	push   %ebp
c0101c86:	89 e5                	mov    %esp,%ebp
	sema->link++;
c0101c88:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c8b:	8b 40 04             	mov    0x4(%eax),%eax
c0101c8e:	8d 50 01             	lea    0x1(%eax),%edx
c0101c91:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c94:	89 50 04             	mov    %edx,0x4(%eax)
	if(sema->value>0)
c0101c97:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c9a:	8b 00                	mov    (%eax),%eax
c0101c9c:	85 c0                	test   %eax,%eax
c0101c9e:	7e 14                	jle    c0101cb4 <ksem_trywait+0x2f>
	{
		sema->value--;
c0101ca0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ca3:	8b 00                	mov    (%eax),%eax
c0101ca5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101ca8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cab:	89 10                	mov    %edx,(%eax)
		return 0;
c0101cad:	b8 00 00 00 00       	mov    $0x0,%eax
c0101cb2:	eb 05                	jmp    c0101cb9 <ksem_trywait+0x34>
	}
	else{
		return -1;
c0101cb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
}
c0101cb9:	5d                   	pop    %ebp
c0101cba:	c3                   	ret    

c0101cbb <ksem_post>:

int ksem_post(Sema *sema)
{
c0101cbb:	55                   	push   %ebp
c0101cbc:	89 e5                	mov    %esp,%ebp
c0101cbe:	83 ec 28             	sub    $0x28,%esp
	sema->link--;
c0101cc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cc4:	8b 40 04             	mov    0x4(%eax),%eax
c0101cc7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ccd:	89 50 04             	mov    %edx,0x4(%eax)
	if(list_empty(&sema->wait)){
c0101cd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cd3:	83 c0 08             	add    $0x8,%eax
c0101cd6:	89 04 24             	mov    %eax,(%esp)
c0101cd9:	e8 56 fe ff ff       	call   c0101b34 <list_empty>
c0101cde:	85 c0                	test   %eax,%eax
c0101ce0:	74 0f                	je     c0101cf1 <ksem_post+0x36>
		sema->value++;
c0101ce2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ce5:	8b 00                	mov    (%eax),%eax
c0101ce7:	8d 50 01             	lea    0x1(%eax),%edx
c0101cea:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ced:	89 10                	mov    %edx,(%eax)
c0101cef:	eb 40                	jmp    c0101d31 <ksem_post+0x76>
	}
	else{
		sema->value++;
c0101cf1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cf4:	8b 00                	mov    (%eax),%eax
c0101cf6:	8d 50 01             	lea    0x1(%eax),%edx
c0101cf9:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cfc:	89 10                	mov    %edx,(%eax)
		list *one=sema->wait.next;
c0101cfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d01:	8b 40 0c             	mov    0xc(%eax),%eax
c0101d04:	89 45 f4             	mov    %eax,-0xc(%ebp)
		list_del(one);
c0101d07:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d0a:	89 04 24             	mov    %eax,(%esp)
c0101d0d:	e8 7c fd ff ff       	call   c0101a8e <list_del>
		list_add_before(&ready,one);
c0101d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d15:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d19:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0101d20:	e8 1c fd ff ff       	call   c0101a41 <list_add_before>
		schedule(0);
c0101d25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101d2c:	e8 18 0b 00 00       	call   c0102849 <schedule>
	}
}
c0101d31:	c9                   	leave  
c0101d32:	c3                   	ret    

c0101d33 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101d33:	55                   	push   %ebp
c0101d34:	89 e5                	mov    %esp,%ebp
c0101d36:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101d39:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d3c:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101d41:	77 21                	ja     c0101d64 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101d43:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d46:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101d4a:	c7 44 24 08 f4 42 10 	movl   $0xc01042f4,0x8(%esp)
c0101d51:	c0 
c0101d52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d55:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d59:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d5c:	89 04 24             	mov    %eax,(%esp)
c0101d5f:	e8 d5 0e 00 00       	call   c0102c39 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101d64:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d67:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101d6c:	c9                   	leave  
c0101d6d:	c3                   	ret    

c0101d6e <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0101d6e:	55                   	push   %ebp
c0101d6f:	89 e5                	mov    %esp,%ebp
c0101d71:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101d74:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d77:	c1 e8 0c             	shr    $0xc,%eax
c0101d7a:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101d7f:	76 21                	jbe    c0101da2 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0101d81:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d84:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101d88:	c7 44 24 08 18 43 10 	movl   $0xc0104318,0x8(%esp)
c0101d8f:	c0 
c0101d90:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d93:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d97:	8b 45 08             	mov    0x8(%ebp),%eax
c0101d9a:	89 04 24             	mov    %eax,(%esp)
c0101d9d:	e8 97 0e 00 00       	call   c0102c39 <_panic>
	return (void *)(pa + KERNBASE);
c0101da2:	8b 45 10             	mov    0x10(%ebp),%eax
c0101da5:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0101daa:	c9                   	leave  
c0101dab:	c3                   	ret    

c0101dac <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0101dac:	55                   	push   %ebp
c0101dad:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0101daf:	8b 55 08             	mov    0x8(%ebp),%edx
c0101db2:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0101db7:	29 c2                	sub    %eax,%edx
c0101db9:	89 d0                	mov    %edx,%eax
c0101dbb:	c1 f8 03             	sar    $0x3,%eax
c0101dbe:	c1 e0 0c             	shl    $0xc,%eax
}
c0101dc1:	5d                   	pop    %ebp
c0101dc2:	c3                   	ret    

c0101dc3 <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c0101dc3:	55                   	push   %ebp
c0101dc4:	89 e5                	mov    %esp,%ebp
c0101dc6:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101dc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dcc:	c1 e8 0c             	shr    $0xc,%eax
c0101dcf:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101dd4:	76 1c                	jbe    c0101df2 <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c0101dd6:	c7 44 24 08 3c 43 10 	movl   $0xc010433c,0x8(%esp)
c0101ddd:	c0 
c0101dde:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c0101de5:	00 
c0101de6:	c7 04 24 5b 43 10 c0 	movl   $0xc010435b,(%esp)
c0101ded:	e8 47 0e 00 00       	call   c0102c39 <_panic>
	return &pages[PGNUM(pa)];
c0101df2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101df5:	c1 e8 0c             	shr    $0xc,%eax
c0101df8:	c1 e0 03             	shl    $0x3,%eax
c0101dfb:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c0101e00:	c9                   	leave  
c0101e01:	c3                   	ret    

c0101e02 <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c0101e02:	55                   	push   %ebp
c0101e03:	89 e5                	mov    %esp,%ebp
c0101e05:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101e08:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e0b:	89 04 24             	mov    %eax,(%esp)
c0101e0e:	e8 99 ff ff ff       	call   c0101dac <page2pa>
c0101e13:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e17:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0101e1e:	00 
c0101e1f:	c7 04 24 5b 43 10 c0 	movl   $0xc010435b,(%esp)
c0101e26:	e8 43 ff ff ff       	call   c0101d6e <_kaddr>
}
c0101e2b:	c9                   	leave  
c0101e2c:	c3                   	ret    

c0101e2d <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c0101e2d:	55                   	push   %ebp
c0101e2e:	89 e5                	mov    %esp,%ebp
c0101e30:	53                   	push   %ebx
c0101e31:	83 ec 44             	sub    $0x44,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
c0101e34:	c7 45 e8 00 30 13 c0 	movl   $0xc0133000,-0x18(%ebp)
	pte_t *pgta=kpgtable;
c0101e3b:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101e42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e49:	eb 40                	jmp    c0101e8b <page_init+0x5e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
c0101e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e4e:	05 00 03 00 00       	add    $0x300,%eax
c0101e53:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e5d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101e60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e63:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e67:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101e6e:	00 
c0101e6f:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c0101e76:	e8 b8 fe ff ff       	call   c0101d33 <_paddr>
c0101e7b:	83 c8 03             	or     $0x3,%eax
c0101e7e:	89 03                	mov    %eax,(%ebx)
		pgta+=NPTENTRIES;
c0101e80:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
	pte_t *pgta=kpgtable;
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101e87:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e8b:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101e8f:	7e ba                	jle    c0101e4b <page_init+0x1e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
c0101e91:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgta--;
c0101e98:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (;pframe>=0; pframe-=PGSIZE){
c0101e9c:	eb 18                	jmp    c0101eb6 <page_init+0x89>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
c0101e9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ea1:	83 c8 07             	or     $0x7,%eax
c0101ea4:	89 c2                	mov    %eax,%edx
c0101ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ea9:	89 10                	mov    %edx,(%eax)
		pgta--;
c0101eab:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
	pgta--;
	for (;pframe>=0; pframe-=PGSIZE){
c0101eaf:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c0101eb6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101eba:	79 e2                	jns    c0101e9e <page_init+0x71>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
c0101ebc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ebf:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c0101ec4:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101ec9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101ecd:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c0101ed4:	00 
c0101ed5:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c0101edc:	e8 52 fe ff ff       	call   c0101d33 <_paddr>
c0101ee1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101ee4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ee7:	0f 22 d8             	mov    %eax,%cr3
	for (i=0;i<0x400;i++) {
c0101eea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101ef1:	eb 11                	jmp    c0101f04 <page_init+0xd7>
		pages[i].pp_ref = 1;
c0101ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ef6:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c0101efd:	c0 01 00 
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
c0101f00:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101f04:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101f0b:	7e e6                	jle    c0101ef3 <page_init+0xc6>
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101f0d:	c7 45 f4 ff 7f 00 00 	movl   $0x7fff,-0xc(%ebp)
c0101f14:	eb 31                	jmp    c0101f47 <page_init+0x11a>
		pages[i].pp_ref = 0;
c0101f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f19:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101f20:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101f23:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f2c:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101f33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f36:	c1 e0 03             	shl    $0x3,%eax
c0101f39:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101f3e:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101f43:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0101f47:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101f4e:	7f c6                	jg     c0101f16 <page_init+0xe9>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101f50:	c7 45 e4 00 10 00 00 	movl   $0x1000,-0x1c(%ebp)
c0101f57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f5a:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101f5f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101f62:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f65:	ba 00 00 00 00       	mov    $0x0,%edx
c0101f6a:	f7 75 e4             	divl   -0x1c(%ebp)
c0101f6d:	89 d0                	mov    %edx,%eax
c0101f6f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101f72:	29 c2                	sub    %eax,%edx
c0101f74:	89 d0                	mov    %edx,%eax
c0101f76:	89 c2                	mov    %eax,%edx
c0101f78:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101f7d:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101f84:	00 
c0101f85:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101f8c:	00 
c0101f8d:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101f91:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101f98:	00 
c0101f99:	89 04 24             	mov    %eax,(%esp)
c0101f9c:	e8 3e 05 00 00       	call   c01024df <boot_map_region>
}
c0101fa1:	83 c4 44             	add    $0x44,%esp
c0101fa4:	5b                   	pop    %ebx
c0101fa5:	5d                   	pop    %ebp
c0101fa6:	c3                   	ret    

c0101fa7 <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101fa7:	55                   	push   %ebp
c0101fa8:	89 e5                	mov    %esp,%ebp
c0101faa:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101fad:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101fb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101fb5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101fb9:	75 07                	jne    c0101fc2 <page_alloc+0x1b>
c0101fbb:	b8 00 00 00 00       	mov    $0x0,%eax
c0101fc0:	eb 45                	jmp    c0102007 <page_alloc+0x60>
	page_free_list = page_free_list -> pp_link;
c0101fc2:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101fc7:	8b 00                	mov    (%eax),%eax
c0101fc9:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	if (alloc_flags & ALLOC_ZERO) {
c0101fce:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fd1:	83 e0 01             	and    $0x1,%eax
c0101fd4:	85 c0                	test   %eax,%eax
c0101fd6:	74 23                	je     c0101ffb <page_alloc+0x54>
		memset(page2kva(p), 0, PGSIZE);
c0101fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101fdb:	89 04 24             	mov    %eax,(%esp)
c0101fde:	e8 1f fe ff ff       	call   c0101e02 <page2kva>
c0101fe3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101fea:	00 
c0101feb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101ff2:	00 
c0101ff3:	89 04 24             	mov    %eax,(%esp)
c0101ff6:	e8 08 12 00 00       	call   c0103203 <memset>
	}
	p -> pp_link = NULL;
c0101ffb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ffe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0102004:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102007:	c9                   	leave  
c0102008:	c3                   	ret    

c0102009 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0102009:	55                   	push   %ebp
c010200a:	89 e5                	mov    %esp,%ebp
	pp->pp_link = page_free_list;
c010200c:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0102012:	8b 45 08             	mov    0x8(%ebp),%eax
c0102015:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0102017:	8b 45 08             	mov    0x8(%ebp),%eax
c010201a:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c010201f:	5d                   	pop    %ebp
c0102020:	c3                   	ret    

c0102021 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0102021:	55                   	push   %ebp
c0102022:	89 e5                	mov    %esp,%ebp
c0102024:	83 ec 04             	sub    $0x4,%esp
	if (--pp->pp_ref == 0)
c0102027:	8b 45 08             	mov    0x8(%ebp),%eax
c010202a:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010202e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102031:	8b 45 08             	mov    0x8(%ebp),%eax
c0102034:	66 89 50 04          	mov    %dx,0x4(%eax)
c0102038:	8b 45 08             	mov    0x8(%ebp),%eax
c010203b:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010203f:	66 85 c0             	test   %ax,%ax
c0102042:	75 0b                	jne    c010204f <page_decref+0x2e>
		page_free(pp);
c0102044:	8b 45 08             	mov    0x8(%ebp),%eax
c0102047:	89 04 24             	mov    %eax,(%esp)
c010204a:	e8 ba ff ff ff       	call   c0102009 <page_free>
}
c010204f:	c9                   	leave  
c0102050:	c3                   	ret    

c0102051 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0102051:	55                   	push   %ebp
c0102052:	89 e5                	mov    %esp,%ebp
c0102054:	53                   	push   %ebx
c0102055:	83 ec 24             	sub    $0x24,%esp
	pte_t *t=NULL;
c0102058:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (pgdir[PDX(va)] & PTE_P) {
c010205f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102062:	c1 e8 16             	shr    $0x16,%eax
c0102065:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010206c:	8b 45 08             	mov    0x8(%ebp),%eax
c010206f:	01 d0                	add    %edx,%eax
c0102071:	8b 00                	mov    (%eax),%eax
c0102073:	83 e0 01             	and    $0x1,%eax
c0102076:	85 c0                	test   %eax,%eax
c0102078:	74 36                	je     c01020b0 <pgdir_walk+0x5f>
		t = KADDR(PTE_ADDR(pgdir[PDX(va)]));
c010207a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010207d:	c1 e8 16             	shr    $0x16,%eax
c0102080:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102087:	8b 45 08             	mov    0x8(%ebp),%eax
c010208a:	01 d0                	add    %edx,%eax
c010208c:	8b 00                	mov    (%eax),%eax
c010208e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102093:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102097:	c7 44 24 04 a3 00 00 	movl   $0xa3,0x4(%esp)
c010209e:	00 
c010209f:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c01020a6:	e8 c3 fc ff ff       	call   c0101d6e <_kaddr>
c01020ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01020ae:	eb 6b                	jmp    c010211b <pgdir_walk+0xca>
	}
	else {
		if (create == false) 
c01020b0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01020b4:	75 07                	jne    c01020bd <pgdir_walk+0x6c>
			return NULL;
c01020b6:	b8 00 00 00 00       	mov    $0x0,%eax
c01020bb:	eb 75                	jmp    c0102132 <pgdir_walk+0xe1>
		struct Page *p = page_alloc(ALLOC_ZERO);
c01020bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01020c4:	e8 de fe ff ff       	call   c0101fa7 <page_alloc>
c01020c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (p == NULL) 
c01020cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01020d0:	75 07                	jne    c01020d9 <pgdir_walk+0x88>
			return NULL;
c01020d2:	b8 00 00 00 00       	mov    $0x0,%eax
c01020d7:	eb 59                	jmp    c0102132 <pgdir_walk+0xe1>
		p -> pp_ref ++;
c01020d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020dc:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01020e0:	8d 50 01             	lea    0x1(%eax),%edx
c01020e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020e6:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[PDX(va)] = page2pa(p) | PTE_P | PTE_W | PTE_U;
c01020ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020ed:	c1 e8 16             	shr    $0x16,%eax
c01020f0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01020f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01020fa:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01020fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102100:	89 04 24             	mov    %eax,(%esp)
c0102103:	e8 a4 fc ff ff       	call   c0101dac <page2pa>
c0102108:	83 c8 07             	or     $0x7,%eax
c010210b:	89 03                	mov    %eax,(%ebx)
		t=page2kva(p);
c010210d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102110:	89 04 24             	mov    %eax,(%esp)
c0102113:	e8 ea fc ff ff       	call   c0101e02 <page2kva>
c0102118:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	return &t[PTX(va)];
c010211b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010211e:	c1 e8 0c             	shr    $0xc,%eax
c0102121:	25 ff 03 00 00       	and    $0x3ff,%eax
c0102126:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010212d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102130:	01 d0                	add    %edx,%eax
}
c0102132:	83 c4 24             	add    $0x24,%esp
c0102135:	5b                   	pop    %ebx
c0102136:	5d                   	pop    %ebp
c0102137:	c3                   	ret    

c0102138 <pg_copy>:


void 
pg_copy(pde_t *fa, pde_t *tb, int pan)
{
c0102138:	55                   	push   %ebp
c0102139:	89 e5                	mov    %esp,%ebp
c010213b:	53                   	push   %ebx
c010213c:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c010213f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102146:	e9 33 02 00 00       	jmp    c010237e <pg_copy+0x246>
		if (fa[i]&PTE_P){	
c010214b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010214e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102155:	8b 45 08             	mov    0x8(%ebp),%eax
c0102158:	01 d0                	add    %edx,%eax
c010215a:	8b 00                	mov    (%eax),%eax
c010215c:	83 e0 01             	and    $0x1,%eax
c010215f:	85 c0                	test   %eax,%eax
c0102161:	0f 84 13 02 00 00    	je     c010237a <pg_copy+0x242>
			if (tb[i]&PTE_P) 
c0102167:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010216a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102171:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102174:	01 d0                	add    %edx,%eax
c0102176:	8b 00                	mov    (%eax),%eax
c0102178:	83 e0 01             	and    $0x1,%eax
c010217b:	85 c0                	test   %eax,%eax
c010217d:	74 05                	je     c0102184 <pg_copy+0x4c>
				continue;
c010217f:	e9 f6 01 00 00       	jmp    c010237a <pg_copy+0x242>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c0102184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102187:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010218e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102191:	01 d0                	add    %edx,%eax
c0102193:	8b 00                	mov    (%eax),%eax
c0102195:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010219a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010219e:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
c01021a5:	00 
c01021a6:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c01021ad:	e8 bc fb ff ff       	call   c0101d6e <_kaddr>
c01021b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c01021b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01021bc:	e8 e6 fd ff ff       	call   c0101fa7 <page_alloc>
c01021c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c01021c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021c7:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01021cb:	8d 50 01             	lea    0x1(%eax),%edx
c01021ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021d1:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c01021d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021d8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01021df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021e2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01021e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021e8:	89 04 24             	mov    %eax,(%esp)
c01021eb:	e8 bc fb ff ff       	call   c0101dac <page2pa>
c01021f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01021f3:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c01021fa:	8b 55 08             	mov    0x8(%ebp),%edx
c01021fd:	01 ca                	add    %ecx,%edx
c01021ff:	8b 12                	mov    (%edx),%edx
c0102201:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0102207:	09 d0                	or     %edx,%eax
c0102209:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c010220b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010220e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102215:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102218:	01 d0                	add    %edx,%eax
c010221a:	8b 00                	mov    (%eax),%eax
c010221c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102221:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102225:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c010222c:	00 
c010222d:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c0102234:	e8 35 fb ff ff       	call   c0101d6e <_kaddr>
c0102239:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c010223c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102243:	e9 25 01 00 00       	jmp    c010236d <pg_copy+0x235>
				if (fat[j]&PTE_P){ 
c0102248:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010224b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102252:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102255:	01 d0                	add    %edx,%eax
c0102257:	8b 00                	mov    (%eax),%eax
c0102259:	83 e0 01             	and    $0x1,%eax
c010225c:	85 c0                	test   %eax,%eax
c010225e:	0f 84 05 01 00 00    	je     c0102369 <pg_copy+0x231>
					if(pan==0){
c0102264:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102268:	0f 85 a7 00 00 00    	jne    c0102315 <pg_copy+0x1dd>
						p = page_alloc(0);
c010226e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0102275:	e8 2d fd ff ff       	call   c0101fa7 <page_alloc>
c010227a:	89 45 e8             	mov    %eax,-0x18(%ebp)
						p->pp_ref++;
c010227d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102280:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102284:	8d 50 01             	lea    0x1(%eax),%edx
c0102287:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010228a:	66 89 50 04          	mov    %dx,0x4(%eax)
						tbt[j] = page2pa(p)|(fat[j]&0xFFF);
c010228e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102291:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102298:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010229b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010229e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022a1:	89 04 24             	mov    %eax,(%esp)
c01022a4:	e8 03 fb ff ff       	call   c0101dac <page2pa>
c01022a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01022ac:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c01022b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01022b6:	01 ca                	add    %ecx,%edx
c01022b8:	8b 12                	mov    (%edx),%edx
c01022ba:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c01022c0:	09 d0                	or     %edx,%eax
c01022c2:	89 03                	mov    %eax,(%ebx)
						memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
c01022c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022c7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01022ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022d1:	01 d0                	add    %edx,%eax
c01022d3:	8b 00                	mov    (%eax),%eax
c01022d5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01022da:	89 44 24 08          	mov    %eax,0x8(%esp)
c01022de:	c7 44 24 04 c6 00 00 	movl   $0xc6,0x4(%esp)
c01022e5:	00 
c01022e6:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c01022ed:	e8 7c fa ff ff       	call   c0101d6e <_kaddr>
c01022f2:	89 c3                	mov    %eax,%ebx
c01022f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022f7:	89 04 24             	mov    %eax,(%esp)
c01022fa:	e8 03 fb ff ff       	call   c0101e02 <page2kva>
c01022ff:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0102306:	00 
c0102307:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010230b:	89 04 24             	mov    %eax,(%esp)
c010230e:	e8 d3 0e 00 00       	call   c01031e6 <memcpy>
c0102313:	eb 54                	jmp    c0102369 <pg_copy+0x231>
					}
					else{
						p=pa2page(PTE_ADDR(fat[j]));
c0102315:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102318:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010231f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102322:	01 d0                	add    %edx,%eax
c0102324:	8b 00                	mov    (%eax),%eax
c0102326:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010232b:	89 04 24             	mov    %eax,(%esp)
c010232e:	e8 90 fa ff ff       	call   c0101dc3 <pa2page>
c0102333:	89 45 e8             	mov    %eax,-0x18(%ebp)
						p->pp_ref++;
c0102336:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102339:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010233d:	8d 50 01             	lea    0x1(%eax),%edx
c0102340:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102343:	66 89 50 04          	mov    %dx,0x4(%eax)
						tbt[j] = fat[j];
c0102347:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010234a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102351:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102354:	01 c2                	add    %eax,%edx
c0102356:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102359:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0102360:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102363:	01 c8                	add    %ecx,%eax
c0102365:	8b 00                	mov    (%eax),%eax
c0102367:	89 02                	mov    %eax,(%edx)
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c0102369:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010236d:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0102374:	0f 8e ce fe ff ff    	jle    c0102248 <pg_copy+0x110>

void 
pg_copy(pde_t *fa, pde_t *tb, int pan)
{
	int i, j;
	for (i=0;i<1024;i++){
c010237a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010237e:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0102385:	0f 8e c0 fd ff ff    	jle    c010214b <pg_copy+0x13>
					}
				}
			}
		}
	}
}
c010238b:	83 c4 34             	add    $0x34,%esp
c010238e:	5b                   	pop    %ebx
c010238f:	5d                   	pop    %ebp
c0102390:	c3                   	ret    

c0102391 <pg_remove>:

void 
pg_remove(pde_t *pgdir)
{
c0102391:	55                   	push   %ebp
c0102392:	89 e5                	mov    %esp,%ebp
c0102394:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for (i=0; i<1024;i++) {
c0102397:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010239e:	e9 fb 00 00 00       	jmp    c010249e <pg_remove+0x10d>
		if (pgdir[i]&PTE_P) {
c01023a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023a6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01023b0:	01 d0                	add    %edx,%eax
c01023b2:	8b 00                	mov    (%eax),%eax
c01023b4:	83 e0 01             	and    $0x1,%eax
c01023b7:	85 c0                	test   %eax,%eax
c01023b9:	0f 84 db 00 00 00    	je     c010249a <pg_remove+0x109>
			if (kern_pgdir[i]&PTE_P) 
c01023bf:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01023c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01023c7:	c1 e2 02             	shl    $0x2,%edx
c01023ca:	01 d0                	add    %edx,%eax
c01023cc:	8b 00                	mov    (%eax),%eax
c01023ce:	83 e0 01             	and    $0x1,%eax
c01023d1:	85 c0                	test   %eax,%eax
c01023d3:	74 05                	je     c01023da <pg_remove+0x49>
				continue;
c01023d5:	e9 c0 00 00 00       	jmp    c010249a <pg_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
c01023da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023dd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01023e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01023e7:	01 d0                	add    %edx,%eax
c01023e9:	8b 00                	mov    (%eax),%eax
c01023eb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01023f0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01023f4:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
c01023fb:	00 
c01023fc:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c0102403:	e8 66 f9 ff ff       	call   c0101d6e <_kaddr>
c0102408:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (j=0; j<NPTENTRIES;j++){
c010240b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102412:	eb 42                	jmp    c0102456 <pg_remove+0xc5>
				if (pgtable[j]&PTE_P){
c0102414:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102417:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010241e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102421:	01 d0                	add    %edx,%eax
c0102423:	8b 00                	mov    (%eax),%eax
c0102425:	83 e0 01             	and    $0x1,%eax
c0102428:	85 c0                	test   %eax,%eax
c010242a:	74 26                	je     c0102452 <pg_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
c010242c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010242f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102436:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102439:	01 d0                	add    %edx,%eax
c010243b:	8b 00                	mov    (%eax),%eax
c010243d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102442:	89 04 24             	mov    %eax,(%esp)
c0102445:	e8 79 f9 ff ff       	call   c0101dc3 <pa2page>
c010244a:	89 04 24             	mov    %eax,(%esp)
c010244d:	e8 cf fb ff ff       	call   c0102021 <page_decref>
	for (i=0; i<1024;i++) {
		if (pgdir[i]&PTE_P) {
			if (kern_pgdir[i]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
			for (j=0; j<NPTENTRIES;j++){
c0102452:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102456:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c010245d:	7e b5                	jle    c0102414 <pg_remove+0x83>
				if (pgtable[j]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
c010245f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102462:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0102469:	8b 45 08             	mov    0x8(%ebp),%eax
c010246c:	01 d0                	add    %edx,%eax
c010246e:	8b 00                	mov    (%eax),%eax
c0102470:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102475:	89 04 24             	mov    %eax,(%esp)
c0102478:	e8 46 f9 ff ff       	call   c0101dc3 <pa2page>
c010247d:	89 04 24             	mov    %eax,(%esp)
c0102480:	e8 9c fb ff ff       	call   c0102021 <page_decref>
			pgdir[i]=NULL;
c0102485:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102488:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010248f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102492:	01 d0                	add    %edx,%eax
c0102494:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

void 
pg_remove(pde_t *pgdir)
{
	int i,j;
	for (i=0; i<1024;i++) {
c010249a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010249e:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c01024a5:	0f 8e f8 fe ff ff    	jle    c01023a3 <pg_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
			pgdir[i]=NULL;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c01024ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ae:	89 44 24 08          	mov    %eax,0x8(%esp)
c01024b2:	c7 44 24 04 e5 00 00 	movl   $0xe5,0x4(%esp)
c01024b9:	00 
c01024ba:	c7 04 24 71 43 10 c0 	movl   $0xc0104371,(%esp)
c01024c1:	e8 6d f8 ff ff       	call   c0101d33 <_paddr>
c01024c6:	89 04 24             	mov    %eax,(%esp)
c01024c9:	e8 f5 f8 ff ff       	call   c0101dc3 <pa2page>
c01024ce:	89 04 24             	mov    %eax,(%esp)
c01024d1:	e8 4b fb ff ff       	call   c0102021 <page_decref>
	pgdir=NULL;
c01024d6:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c01024dd:	c9                   	leave  
c01024de:	c3                   	ret    

c01024df <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c01024df:	55                   	push   %ebp
c01024e0:	89 e5                	mov    %esp,%ebp
c01024e2:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c01024e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01024ec:	eb 47                	jmp    c0102535 <boot_map_region+0x56>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c01024ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01024f8:	00 
c01024f9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102500:	89 04 24             	mov    %eax,(%esp)
c0102503:	e8 49 fb ff ff       	call   c0102051 <pgdir_walk>
c0102508:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (pte == NULL) 
c010250b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010250f:	75 02                	jne    c0102513 <boot_map_region+0x34>
			return;
c0102511:	eb 2f                	jmp    c0102542 <boot_map_region+0x63>
		pte[0]=pa|perm|PTE_P;
c0102513:	8b 45 18             	mov    0x18(%ebp),%eax
c0102516:	0b 45 14             	or     0x14(%ebp),%eax
c0102519:	83 c8 01             	or     $0x1,%eax
c010251c:	89 c2                	mov    %eax,%edx
c010251e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102521:	89 10                	mov    %edx,(%eax)
		va+=PGSIZE;
c0102523:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa+=PGSIZE;
c010252a:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c0102531:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102535:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102538:	8b 55 10             	mov    0x10(%ebp),%edx
c010253b:	c1 ea 0c             	shr    $0xc,%edx
c010253e:	39 d0                	cmp    %edx,%eax
c0102540:	72 ac                	jb     c01024ee <boot_map_region+0xf>
			return;
		pte[0]=pa|perm|PTE_P;
		va+=PGSIZE;
		pa+=PGSIZE;
	}
}
c0102542:	c9                   	leave  
c0102543:	c3                   	ret    

c0102544 <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c0102544:	55                   	push   %ebp
c0102545:	89 e5                	mov    %esp,%ebp
c0102547:	53                   	push   %ebx
c0102548:	83 ec 24             	sub    $0x24,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 1);
c010254b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0102552:	00 
c0102553:	8b 45 10             	mov    0x10(%ebp),%eax
c0102556:	89 44 24 04          	mov    %eax,0x4(%esp)
c010255a:	8b 45 08             	mov    0x8(%ebp),%eax
c010255d:	89 04 24             	mov    %eax,(%esp)
c0102560:	e8 ec fa ff ff       	call   c0102051 <pgdir_walk>
c0102565:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c0102568:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010256c:	75 0a                	jne    c0102578 <page_insert+0x34>
		return -1;
c010256e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102573:	e9 85 00 00 00       	jmp    c01025fd <page_insert+0xb9>
	}
	else if (pte[0] & PTE_P) {
c0102578:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010257b:	8b 00                	mov    (%eax),%eax
c010257d:	83 e0 01             	and    $0x1,%eax
c0102580:	85 c0                	test   %eax,%eax
c0102582:	74 49                	je     c01025cd <page_insert+0x89>
		if (PTE_ADDR(pte[0]) == page2pa(pp)) {
c0102584:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102587:	8b 00                	mov    (%eax),%eax
c0102589:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010258e:	89 c3                	mov    %eax,%ebx
c0102590:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102593:	89 04 24             	mov    %eax,(%esp)
c0102596:	e8 11 f8 ff ff       	call   c0101dac <page2pa>
c010259b:	39 c3                	cmp    %eax,%ebx
c010259d:	75 1c                	jne    c01025bb <page_insert+0x77>
			pte[0] = page2pa(pp)|perm|PTE_P;
c010259f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025a2:	89 04 24             	mov    %eax,(%esp)
c01025a5:	e8 02 f8 ff ff       	call   c0101dac <page2pa>
c01025aa:	8b 55 14             	mov    0x14(%ebp),%edx
c01025ad:	09 d0                	or     %edx,%eax
c01025af:	83 c8 01             	or     $0x1,%eax
c01025b2:	89 c2                	mov    %eax,%edx
c01025b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025b7:	89 10                	mov    %edx,(%eax)
c01025b9:	eb 12                	jmp    c01025cd <page_insert+0x89>
		}
		else {
			page_remove(pgdir, va);
c01025bb:	8b 45 10             	mov    0x10(%ebp),%eax
c01025be:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01025c5:	89 04 24             	mov    %eax,(%esp)
c01025c8:	e8 88 00 00 00       	call   c0102655 <page_remove>
		}
	}
	pte[0] = page2pa(pp)|perm|PTE_P;
c01025cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025d0:	89 04 24             	mov    %eax,(%esp)
c01025d3:	e8 d4 f7 ff ff       	call   c0101dac <page2pa>
c01025d8:	8b 55 14             	mov    0x14(%ebp),%edx
c01025db:	09 d0                	or     %edx,%eax
c01025dd:	83 c8 01             	or     $0x1,%eax
c01025e0:	89 c2                	mov    %eax,%edx
c01025e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025e5:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c01025e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025ea:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01025ee:	8d 50 01             	lea    0x1(%eax),%edx
c01025f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025f4:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c01025f8:	b8 00 00 00 00       	mov    $0x0,%eax

}
c01025fd:	83 c4 24             	add    $0x24,%esp
c0102600:	5b                   	pop    %ebx
c0102601:	5d                   	pop    %ebp
c0102602:	c3                   	ret    

c0102603 <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c0102603:	55                   	push   %ebp
c0102604:	89 e5                	mov    %esp,%ebp
c0102606:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 0);
c0102609:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0102610:	00 
c0102611:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102614:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102618:	8b 45 08             	mov    0x8(%ebp),%eax
c010261b:	89 04 24             	mov    %eax,(%esp)
c010261e:	e8 2e fa ff ff       	call   c0102051 <pgdir_walk>
c0102623:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) 
c0102626:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010262a:	75 07                	jne    c0102633 <page_lookup+0x30>
		return NULL;
c010262c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102631:	eb 20                	jmp    c0102653 <page_lookup+0x50>
	if (pte_store != NULL) 
c0102633:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102637:	74 08                	je     c0102641 <page_lookup+0x3e>
		*pte_store = pte;
c0102639:	8b 45 10             	mov    0x10(%ebp),%eax
c010263c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010263f:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(pte[0]));
c0102641:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102644:	8b 00                	mov    (%eax),%eax
c0102646:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010264b:	89 04 24             	mov    %eax,(%esp)
c010264e:	e8 70 f7 ff ff       	call   c0101dc3 <pa2page>
}
c0102653:	c9                   	leave  
c0102654:	c3                   	ret    

c0102655 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c0102655:	55                   	push   %ebp
c0102656:	89 e5                	mov    %esp,%ebp
c0102658:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte=NULL;
c010265b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	struct Page *p = page_lookup(pgdir, va, &pte);
c0102662:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0102665:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102669:	8b 45 0c             	mov    0xc(%ebp),%eax
c010266c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102670:	8b 45 08             	mov    0x8(%ebp),%eax
c0102673:	89 04 24             	mov    %eax,(%esp)
c0102676:	e8 88 ff ff ff       	call   c0102603 <page_lookup>
c010267b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p != NULL) {
c010267e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102682:	74 14                	je     c0102698 <page_remove+0x43>
		pte[0] = 0;
c0102684:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102687:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c010268d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102690:	89 04 24             	mov    %eax,(%esp)
c0102693:	e8 89 f9 ff ff       	call   c0102021 <page_decref>
	}
	tlb_invalidate(pgdir, va);
c0102698:	8b 45 0c             	mov    0xc(%ebp),%eax
c010269b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010269f:	8b 45 08             	mov    0x8(%ebp),%eax
c01026a2:	89 04 24             	mov    %eax,(%esp)
c01026a5:	e8 02 00 00 00       	call   c01026ac <tlb_invalidate>
}
c01026aa:	c9                   	leave  
c01026ab:	c3                   	ret    

c01026ac <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c01026ac:	55                   	push   %ebp
c01026ad:	89 e5                	mov    %esp,%ebp
c01026af:	83 ec 10             	sub    $0x10,%esp
c01026b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c01026b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01026bb:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c01026be:	c9                   	leave  
c01026bf:	c3                   	ret    

c01026c0 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01026c0:	55                   	push   %ebp
c01026c1:	89 e5                	mov    %esp,%ebp
c01026c3:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01026c6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01026ca:	75 24                	jne    c01026f0 <list_add+0x30>
c01026cc:	c7 44 24 0c 88 43 10 	movl   $0xc0104388,0xc(%esp)
c01026d3:	c0 
c01026d4:	c7 44 24 08 95 43 10 	movl   $0xc0104395,0x8(%esp)
c01026db:	c0 
c01026dc:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c01026e3:	00 
c01026e4:	c7 04 24 aa 43 10 c0 	movl   $0xc01043aa,(%esp)
c01026eb:	e8 49 05 00 00       	call   c0102c39 <_panic>
	data->prev = prev;
c01026f0:	8b 45 10             	mov    0x10(%ebp),%eax
c01026f3:	8b 55 08             	mov    0x8(%ebp),%edx
c01026f6:	89 10                	mov    %edx,(%eax)
	data->next = next;
c01026f8:	8b 45 10             	mov    0x10(%ebp),%eax
c01026fb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01026fe:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0102701:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102705:	74 09                	je     c0102710 <list_add+0x50>
c0102707:	8b 45 08             	mov    0x8(%ebp),%eax
c010270a:	8b 55 10             	mov    0x10(%ebp),%edx
c010270d:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0102710:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102714:	74 08                	je     c010271e <list_add+0x5e>
c0102716:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102719:	8b 55 10             	mov    0x10(%ebp),%edx
c010271c:	89 10                	mov    %edx,(%eax)
}
c010271e:	c9                   	leave  
c010271f:	c3                   	ret    

c0102720 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0102720:	55                   	push   %ebp
c0102721:	89 e5                	mov    %esp,%ebp
c0102723:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0102726:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010272a:	75 24                	jne    c0102750 <list_add_before+0x30>
c010272c:	c7 44 24 0c c0 43 10 	movl   $0xc01043c0,0xc(%esp)
c0102733:	c0 
c0102734:	c7 44 24 08 95 43 10 	movl   $0xc0104395,0x8(%esp)
c010273b:	c0 
c010273c:	c7 44 24 04 1a 00 00 	movl   $0x1a,0x4(%esp)
c0102743:	00 
c0102744:	c7 04 24 aa 43 10 c0 	movl   $0xc01043aa,(%esp)
c010274b:	e8 e9 04 00 00       	call   c0102c39 <_panic>
	list_add(one->prev, one, data);
c0102750:	8b 45 08             	mov    0x8(%ebp),%eax
c0102753:	8b 00                	mov    (%eax),%eax
c0102755:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102758:	89 54 24 08          	mov    %edx,0x8(%esp)
c010275c:	8b 55 08             	mov    0x8(%ebp),%edx
c010275f:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102763:	89 04 24             	mov    %eax,(%esp)
c0102766:	e8 55 ff ff ff       	call   c01026c0 <list_add>
}
c010276b:	c9                   	leave  
c010276c:	c3                   	ret    

c010276d <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c010276d:	55                   	push   %ebp
c010276e:	89 e5                	mov    %esp,%ebp
c0102770:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0102773:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102777:	75 24                	jne    c010279d <list_del+0x30>
c0102779:	c7 44 24 0c 88 43 10 	movl   $0xc0104388,0xc(%esp)
c0102780:	c0 
c0102781:	c7 44 24 08 95 43 10 	movl   $0xc0104395,0x8(%esp)
c0102788:	c0 
c0102789:	c7 44 24 04 26 00 00 	movl   $0x26,0x4(%esp)
c0102790:	00 
c0102791:	c7 04 24 aa 43 10 c0 	movl   $0xc01043aa,(%esp)
c0102798:	e8 9c 04 00 00       	call   c0102c39 <_panic>
	list *prev = data->prev;
c010279d:	8b 45 08             	mov    0x8(%ebp),%eax
c01027a0:	8b 00                	mov    (%eax),%eax
c01027a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01027a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01027a8:	8b 40 04             	mov    0x4(%eax),%eax
c01027ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01027ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01027b2:	74 09                	je     c01027bd <list_del+0x50>
c01027b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027b7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01027ba:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01027bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01027c1:	74 08                	je     c01027cb <list_del+0x5e>
c01027c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01027c9:	89 10                	mov    %edx,(%eax)
}
c01027cb:	c9                   	leave  
c01027cc:	c3                   	ret    

c01027cd <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c01027cd:	55                   	push   %ebp
c01027ce:	89 e5                	mov    %esp,%ebp
c01027d0:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01027d3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01027d7:	75 24                	jne    c01027fd <list_empty+0x30>
c01027d9:	c7 44 24 0c c0 43 10 	movl   $0xc01043c0,0xc(%esp)
c01027e0:	c0 
c01027e1:	c7 44 24 08 95 43 10 	movl   $0xc0104395,0x8(%esp)
c01027e8:	c0 
c01027e9:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01027f0:	00 
c01027f1:	c7 04 24 aa 43 10 c0 	movl   $0xc01043aa,(%esp)
c01027f8:	e8 3c 04 00 00       	call   c0102c39 <_panic>
	return one == one->next;
c01027fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102800:	8b 40 04             	mov    0x4(%eax),%eax
c0102803:	3b 45 08             	cmp    0x8(%ebp),%eax
c0102806:	0f 94 c0             	sete   %al
c0102809:	0f b6 c0             	movzbl %al,%eax
}
c010280c:	c9                   	leave  
c010280d:	c3                   	ret    

c010280e <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c010280e:	55                   	push   %ebp
c010280f:	89 e5                	mov    %esp,%ebp
c0102811:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0102814:	8b 45 10             	mov    0x10(%ebp),%eax
c0102817:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c010281c:	77 21                	ja     c010283f <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c010281e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102821:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102825:	c7 44 24 08 cc 43 10 	movl   $0xc01043cc,0x8(%esp)
c010282c:	c0 
c010282d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102830:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102834:	8b 45 08             	mov    0x8(%ebp),%eax
c0102837:	89 04 24             	mov    %eax,(%esp)
c010283a:	e8 fa 03 00 00       	call   c0102c39 <_panic>
	return (physaddr_t)kva - KERNBASE;
c010283f:	8b 45 10             	mov    0x10(%ebp),%eax
c0102842:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0102847:	c9                   	leave  
c0102848:	c3                   	ret    

c0102849 <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(int pan){
c0102849:	55                   	push   %ebp
c010284a:	89 e5                	mov    %esp,%ebp
c010284c:	83 ec 38             	sub    $0x38,%esp
	if(pan==1){
c010284f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102853:	75 72                	jne    c01028c7 <schedule+0x7e>
		list *one,*ne;
		list *bl=&block;
c0102855:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
		//printk("Oh,Shit!!!");
		for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c010285c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010285f:	8b 40 04             	mov    0x4(%eax),%eax
c0102862:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102865:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102868:	8b 40 04             	mov    0x4(%eax),%eax
c010286b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010286e:	eb 4f                	jmp    c01028bf <schedule+0x76>
			PCB *p=list_entry(one,PCB,plist);
c0102870:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102873:	83 e8 08             	sub    $0x8,%eax
c0102876:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->timecount--;
c0102879:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010287c:	8b 40 1c             	mov    0x1c(%eax),%eax
c010287f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102882:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102885:	89 50 1c             	mov    %edx,0x1c(%eax)
			if(p->timecount==0){
c0102888:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010288b:	8b 40 1c             	mov    0x1c(%eax),%eax
c010288e:	85 c0                	test   %eax,%eax
c0102890:	75 1e                	jne    c01028b0 <schedule+0x67>
				list_del(one);
c0102892:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102895:	89 04 24             	mov    %eax,(%esp)
c0102898:	e8 d0 fe ff ff       	call   c010276d <list_del>
				list_add_before(&ready,one);
c010289d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028a0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028a4:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c01028ab:	e8 70 fe ff ff       	call   c0102720 <list_add_before>
void schedule(int pan){
	if(pan==1){
		list *one,*ne;
		list *bl=&block;
		//printk("Oh,Shit!!!");
		for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c01028b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01028b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028b9:	8b 40 04             	mov    0x4(%eax),%eax
c01028bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01028bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c01028c5:	75 a9                	jne    c0102870 <schedule+0x27>
				list_del(one);
				list_add_before(&ready,one);
			}
		}
	}
	if(!list_empty(&ready)){
c01028c7:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c01028ce:	e8 fa fe ff ff       	call   c01027cd <list_empty>
c01028d3:	85 c0                	test   %eax,%eax
c01028d5:	75 7e                	jne    c0102955 <schedule+0x10c>
		list *re=&ready;
c01028d7:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c01028de:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01028e3:	8b 40 04             	mov    0x4(%eax),%eax
c01028e6:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c01028e9:	75 0d                	jne    c01028f8 <schedule+0xaf>
			now=re->next;
c01028eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01028ee:	8b 40 04             	mov    0x4(%eax),%eax
c01028f1:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c01028f6:	eb 0d                	jmp    c0102905 <schedule+0xbc>
		else
			now=now->next;
c01028f8:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01028fd:	8b 40 04             	mov    0x4(%eax),%eax
c0102900:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c0102905:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010290a:	83 e8 08             	sub    $0x8,%eax
c010290d:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c0102912:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0102917:	05 f8 0f 00 00       	add    $0xff8,%eax
c010291c:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c010291f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102922:	89 04 24             	mov    %eax,(%esp)
c0102925:	e8 fe 01 00 00       	call   c0102b28 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c010292a:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010292f:	8b 40 04             	mov    0x4(%eax),%eax
c0102932:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102936:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c010293d:	00 
c010293e:	c7 04 24 f0 43 10 c0 	movl   $0xc01043f0,(%esp)
c0102945:	e8 c4 fe ff ff       	call   c010280e <_paddr>
c010294a:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c010294d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102950:	0f 22 d8             	mov    %eax,%cr3
c0102953:	eb 3a                	jmp    c010298f <schedule+0x146>
	}
	else{
		pcbnow=&init;
c0102955:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c010295c:	3f 16 c0 
		now=&ready;
c010295f:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0102966:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c0102969:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010296e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102972:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0102979:	00 
c010297a:	c7 04 24 f0 43 10 c0 	movl   $0xc01043f0,(%esp)
c0102981:	e8 88 fe ff ff       	call   c010280e <_paddr>
c0102986:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102989:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010298c:	0f 22 d8             	mov    %eax,%cr3
	}
}
c010298f:	c9                   	leave  
c0102990:	c3                   	ret    

c0102991 <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c0102991:	55                   	push   %ebp
c0102992:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c0102994:	8b 45 08             	mov    0x8(%ebp),%eax
c0102997:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c010299c:	8b 45 08             	mov    0x8(%ebp),%eax
c010299f:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c01029a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01029a8:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c01029ac:	8b 45 10             	mov    0x10(%ebp),%eax
c01029af:	83 e0 0f             	and    $0xf,%eax
c01029b2:	89 c2                	mov    %eax,%edx
c01029b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01029b7:	89 d1                	mov    %edx,%ecx
c01029b9:	83 e1 0f             	and    $0xf,%ecx
c01029bc:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01029c0:	83 e2 f0             	and    $0xfffffff0,%edx
c01029c3:	09 ca                	or     %ecx,%edx
c01029c5:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c01029c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01029cb:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01029cf:	83 ca 10             	or     $0x10,%edx
c01029d2:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c01029d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029d8:	83 e0 03             	and    $0x3,%eax
c01029db:	89 c2                	mov    %eax,%edx
c01029dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01029e0:	83 e2 03             	and    $0x3,%edx
c01029e3:	89 d1                	mov    %edx,%ecx
c01029e5:	c1 e1 05             	shl    $0x5,%ecx
c01029e8:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01029ec:	83 e2 9f             	and    $0xffffff9f,%edx
c01029ef:	09 ca                	or     %ecx,%edx
c01029f1:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c01029f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01029f7:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01029fb:	83 ca 80             	or     $0xffffff80,%edx
c01029fe:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c0102a01:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a04:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a08:	83 ca 0f             	or     $0xf,%edx
c0102a0b:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102a0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a11:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a15:	83 e2 ef             	and    $0xffffffef,%edx
c0102a18:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102a1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a1e:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a22:	83 e2 df             	and    $0xffffffdf,%edx
c0102a25:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102a28:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a2b:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a2f:	83 ca 40             	or     $0x40,%edx
c0102a32:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c0102a35:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a38:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102a3c:	83 ca 80             	or     $0xffffff80,%edx
c0102a3f:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c0102a42:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a45:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c0102a49:	5d                   	pop    %ebp
c0102a4a:	c3                   	ret    

c0102a4b <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c0102a4b:	55                   	push   %ebp
c0102a4c:	89 e5                	mov    %esp,%ebp
c0102a4e:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c0102a51:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c0102a58:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c0102a5b:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c0102a62:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c0102a69:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102a6c:	89 c2                	mov    %eax,%edx
c0102a6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a71:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c0102a74:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102a77:	89 c2                	mov    %eax,%edx
c0102a79:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a7c:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c0102a80:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102a83:	c1 e8 10             	shr    $0x10,%eax
c0102a86:	89 c2                	mov    %eax,%edx
c0102a88:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a8b:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c0102a8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a91:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102a95:	83 e2 f0             	and    $0xfffffff0,%edx
c0102a98:	83 ca 09             	or     $0x9,%edx
c0102a9b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c0102a9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aa1:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102aa5:	83 e2 ef             	and    $0xffffffef,%edx
c0102aa8:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c0102aab:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aae:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102ab2:	83 ca 60             	or     $0x60,%edx
c0102ab5:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102ab8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102abb:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102abf:	83 ca 80             	or     $0xffffff80,%edx
c0102ac2:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102ac5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102ac8:	c1 e8 10             	shr    $0x10,%eax
c0102acb:	83 e0 0f             	and    $0xf,%eax
c0102ace:	89 c2                	mov    %eax,%edx
c0102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ad3:	89 d1                	mov    %edx,%ecx
c0102ad5:	83 e1 0f             	and    $0xf,%ecx
c0102ad8:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102adc:	83 e2 f0             	and    $0xfffffff0,%edx
c0102adf:	09 ca                	or     %ecx,%edx
c0102ae1:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102ae4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ae7:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102aeb:	83 e2 ef             	and    $0xffffffef,%edx
c0102aee:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102af1:	8b 45 08             	mov    0x8(%ebp),%eax
c0102af4:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102af8:	83 e2 df             	and    $0xffffffdf,%edx
c0102afb:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102afe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b01:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b05:	83 ca 40             	or     $0x40,%edx
c0102b08:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c0102b0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b0e:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102b12:	83 e2 7f             	and    $0x7f,%edx
c0102b15:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c0102b18:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102b1b:	c1 e8 18             	shr    $0x18,%eax
c0102b1e:	89 c2                	mov    %eax,%edx
c0102b20:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b23:	88 50 07             	mov    %dl,0x7(%eax)
}
c0102b26:	c9                   	leave  
c0102b27:	c3                   	ret    

c0102b28 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c0102b28:	55                   	push   %ebp
c0102b29:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c0102b2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b2e:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c0102b33:	5d                   	pop    %ebp
c0102b34:	c3                   	ret    

c0102b35 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0102b35:	55                   	push   %ebp
c0102b36:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0102b38:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b3b:	83 e8 01             	sub    $0x1,%eax
c0102b3e:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c0102b44:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b47:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102b4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b50:	c1 e8 10             	shr    $0x10,%eax
c0102b53:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c0102b59:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c0102b5e:	0f 01 10             	lgdtl  (%eax)
}
c0102b61:	5d                   	pop    %ebp
c0102b62:	c3                   	ret    

c0102b63 <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c0102b63:	55                   	push   %ebp
c0102b64:	89 e5                	mov    %esp,%ebp
c0102b66:	83 ec 04             	sub    $0x4,%esp
c0102b69:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b6c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c0102b70:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102b74:	0f 00 d8             	ltr    %ax
}
c0102b77:	c9                   	leave  
c0102b78:	c3                   	ret    

c0102b79 <init_segment>:

void
init_segment(void) {
c0102b79:	55                   	push   %ebp
c0102b7a:	89 e5                	mov    %esp,%ebp
c0102b7c:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c0102b7f:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c0102b86:	00 
c0102b87:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102b8e:	00 
c0102b8f:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102b96:	e8 68 06 00 00       	call   c0103203 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c0102b9b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102ba2:	00 
c0102ba3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102baa:	00 
c0102bab:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c0102bb2:	e8 da fd ff ff       	call   c0102991 <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0102bb7:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102bbe:	00 
c0102bbf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102bc6:	00 
c0102bc7:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c0102bce:	e8 be fd ff ff       	call   c0102991 <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0102bd3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102bda:	00 
c0102bdb:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102be2:	00 
c0102be3:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c0102bea:	e8 a2 fd ff ff       	call   c0102991 <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c0102bef:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102bf6:	00 
c0102bf7:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0102bfe:	00 
c0102bff:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c0102c06:	e8 86 fd ff ff       	call   c0102991 <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0102c0b:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c0102c12:	00 
c0102c13:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102c1a:	e8 16 ff ff ff       	call   c0102b35 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c0102c1f:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c0102c26:	e8 20 fe ff ff       	call   c0102a4b <set_tss>
	load_tr(USEL(SEG_TSS));
c0102c2b:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c0102c32:	e8 2c ff ff ff       	call   c0102b63 <load_tr>
}
c0102c37:	c9                   	leave  
c0102c38:	c3                   	ret    

c0102c39 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c0102c39:	55                   	push   %ebp
c0102c3a:	89 e5                	mov    %esp,%ebp
c0102c3c:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c0102c3f:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c0102c44:	85 c0                	test   %eax,%eax
c0102c46:	74 01                	je     c0102c49 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0102c48:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c0102c49:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c4c:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c0102c51:	fa                   	cli    
c0102c52:	fc                   	cld    

	va_start(ap, fmt);
c0102c53:	8d 45 14             	lea    0x14(%ebp),%eax
c0102c56:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0102c59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c5c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c60:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c63:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c67:	c7 04 24 08 44 10 c0 	movl   $0xc0104408,(%esp)
c0102c6e:	e8 f5 00 00 00       	call   c0102d68 <printk>
	vprintk(fmt, ap);
c0102c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c76:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c7a:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c7d:	89 04 24             	mov    %eax,(%esp)
c0102c80:	e8 b0 00 00 00       	call   c0102d35 <vprintk>
	printk("\n");
c0102c85:	c7 04 24 20 44 10 c0 	movl   $0xc0104420,(%esp)
c0102c8c:	e8 d7 00 00 00       	call   c0102d68 <printk>
	va_end(ap);

}
c0102c91:	c9                   	leave  
c0102c92:	c3                   	ret    

c0102c93 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c0102c93:	55                   	push   %ebp
c0102c94:	89 e5                	mov    %esp,%ebp
c0102c96:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102c99:	8d 45 14             	lea    0x14(%ebp),%eax
c0102c9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c0102c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ca2:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ca6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ca9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cad:	c7 04 24 22 44 10 c0 	movl   $0xc0104422,(%esp)
c0102cb4:	e8 af 00 00 00       	call   c0102d68 <printk>
	vprintk(fmt, ap);
c0102cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cc0:	8b 45 10             	mov    0x10(%ebp),%eax
c0102cc3:	89 04 24             	mov    %eax,(%esp)
c0102cc6:	e8 6a 00 00 00       	call   c0102d35 <vprintk>
	printk("\n");
c0102ccb:	c7 04 24 20 44 10 c0 	movl   $0xc0104420,(%esp)
c0102cd2:	e8 91 00 00 00       	call   c0102d68 <printk>
	va_end(ap);
}
c0102cd7:	c9                   	leave  
c0102cd8:	c3                   	ret    

c0102cd9 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0102cd9:	55                   	push   %ebp
c0102cda:	89 e5                	mov    %esp,%ebp
c0102cdc:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0102cdf:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102ce3:	75 2b                	jne    c0102d10 <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0102ce5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102cec:	eb 1a                	jmp    c0102d08 <sys_write+0x2f>
			serial_printc(buf[i]);
c0102cee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102cf1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cf4:	01 d0                	add    %edx,%eax
c0102cf6:	0f b6 00             	movzbl (%eax),%eax
c0102cf9:	0f be c0             	movsbl %al,%eax
c0102cfc:	89 04 24             	mov    %eax,(%esp)
c0102cff:	e8 63 de ff ff       	call   c0100b67 <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0102d04:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102d08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d0b:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102d0e:	7c de                	jl     c0102cee <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c0102d10:	8b 45 10             	mov    0x10(%ebp),%eax
c0102d13:	c9                   	leave  
c0102d14:	c3                   	ret    

c0102d15 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c0102d15:	55                   	push   %ebp
c0102d16:	89 e5                	mov    %esp,%ebp
c0102d18:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c0102d1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d1e:	89 04 24             	mov    %eax,(%esp)
c0102d21:	e8 6b de ff ff       	call   c0100b91 <putchar>
	++*cnt;
c0102d26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d29:	8b 00                	mov    (%eax),%eax
c0102d2b:	8d 50 01             	lea    0x1(%eax),%edx
c0102d2e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d31:	89 10                	mov    %edx,(%eax)
}
c0102d33:	c9                   	leave  
c0102d34:	c3                   	ret    

c0102d35 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0102d35:	55                   	push   %ebp
c0102d36:	89 e5                	mov    %esp,%ebp
c0102d38:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102d3b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c0102d42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d45:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102d49:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d4c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d50:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102d53:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d57:	c7 04 24 15 2d 10 c0 	movl   $0xc0102d15,(%esp)
c0102d5e:	e8 a8 0a 00 00       	call   c010380b <vprintfmt>
	return cnt;
c0102d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102d66:	c9                   	leave  
c0102d67:	c3                   	ret    

c0102d68 <printk>:

int printk(const char *fmt, ...)
{
c0102d68:	55                   	push   %ebp
c0102d69:	89 e5                	mov    %esp,%ebp
c0102d6b:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0102d6e:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102d71:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c0102d74:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d77:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d7e:	89 04 24             	mov    %eax,(%esp)
c0102d81:	e8 af ff ff ff       	call   c0102d35 <vprintk>
c0102d86:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102d89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d8c:	c9                   	leave  
c0102d8d:	c3                   	ret    

c0102d8e <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0102d8e:	6a 00                	push   $0x0
c0102d90:	6a 00                	push   $0x0
c0102d92:	e9 a9 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102d97 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102d97:	6a 00                	push   $0x0
c0102d99:	6a 01                	push   $0x1
c0102d9b:	e9 a0 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102da0 <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c0102da0:	6a 00                	push   $0x0
c0102da2:	6a 02                	push   $0x2
c0102da4:	e9 97 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102da9 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102da9:	6a 00                	push   $0x0
c0102dab:	6a 03                	push   $0x3
c0102dad:	e9 8e 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102db2 <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c0102db2:	6a 00                	push   $0x0
c0102db4:	6a 04                	push   $0x4
c0102db6:	e9 85 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102dbb <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102dbb:	6a 00                	push   $0x0
c0102dbd:	6a 05                	push   $0x5
c0102dbf:	e9 7c 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102dc4 <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0102dc4:	6a 00                	push   $0x0
c0102dc6:	6a 06                	push   $0x6
c0102dc8:	e9 73 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102dcd <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0102dcd:	6a 00                	push   $0x0
c0102dcf:	6a 07                	push   $0x7
c0102dd1:	e9 6a 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102dd6 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0102dd6:	6a 08                	push   $0x8
c0102dd8:	e9 63 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102ddd <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c0102ddd:	6a 00                	push   $0x0
c0102ddf:	6a 09                	push   $0x9
c0102de1:	e9 5a 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102de6 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0102de6:	6a 0a                	push   $0xa
c0102de8:	e9 53 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102ded <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c0102ded:	6a 0b                	push   $0xb
c0102def:	e9 4c 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102df4 <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0102df4:	6a 0c                	push   $0xc
c0102df6:	e9 45 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102dfb <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c0102dfb:	6a 0d                	push   $0xd
c0102dfd:	e9 3e 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e02 <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c0102e02:	6a 0e                	push   $0xe
c0102e04:	e9 37 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e09 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c0102e09:	6a 00                	push   $0x0
c0102e0b:	68 80 00 00 00       	push   $0x80
c0102e10:	e9 2b 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e15 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c0102e15:	6a 00                	push   $0x0
c0102e17:	68 e8 03 00 00       	push   $0x3e8
c0102e1c:	e9 1f 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e21 <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c0102e21:	6a 00                	push   $0x0
c0102e23:	68 e9 03 00 00       	push   $0x3e9
c0102e28:	e9 13 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e2d <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c0102e2d:	6a 00                	push   $0x0
c0102e2f:	68 f6 03 00 00       	push   $0x3f6
c0102e34:	e9 07 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e39 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c0102e39:	6a ff                	push   $0xffffffff
c0102e3b:	e9 00 00 00 00       	jmp    c0102e40 <asm_do_irq>

c0102e40 <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c0102e40:	fa                   	cli    
	pushl %ds
c0102e41:	1e                   	push   %ds
  	pushl %es
c0102e42:	06                   	push   %es
  	pushl %fs
c0102e43:	0f a0                	push   %fs
  	pushl %gs
c0102e45:	0f a8                	push   %gs
	pushal
c0102e47:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0102e48:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c0102e4c:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c0102e4e:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c0102e50:	54                   	push   %esp
	call irq_handle
c0102e51:	e8 7a d9 ff ff       	call   c01007d0 <irq_handle>
	movl pcbnow,%eax
c0102e56:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c0102e5b:	8b 20                	mov    (%eax),%esp
	popal
c0102e5d:	61                   	popa   
	popl %gs
c0102e5e:	0f a9                	pop    %gs
  	popl %fs
c0102e60:	0f a1                	pop    %fs
  	popl %es
c0102e62:	07                   	pop    %es
  	popl %ds
c0102e63:	1f                   	pop    %ds
	addl $8, %esp
c0102e64:	83 c4 08             	add    $0x8,%esp
	sti
c0102e67:	fb                   	sti    
	iret
c0102e68:	cf                   	iret   
c0102e69:	66 90                	xchg   %ax,%ax
c0102e6b:	90                   	nop
c0102e6c:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c0102e72:	00 00                	add    %al,(%eax)
c0102e74:	fe 4f 52             	decb   0x52(%edi)
c0102e77:	e4 66                	in     $0x66,%al

c0102e78 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102e78:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0102e7f:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0102e81:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c0102e86:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102e89:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102e8c:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0102e91:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0102e94:	b8 9b 2e 10 c0       	mov    $0xc0102e9b,%eax
	jmp	*%eax
c0102e99:	ff e0                	jmp    *%eax

c0102e9b <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102e9b:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0102ea0:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c0102ea5:	e8 4f d3 ff ff       	call   c01001f9 <main>

c0102eaa <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102eaa:	eb fe                	jmp    c0102eaa <spin>

c0102eac <draw_pixel>:
#include "sema.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102eac:	55                   	push   %ebp
c0102ead:	89 e5                	mov    %esp,%ebp
c0102eaf:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0102eb2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102eb6:	78 18                	js     c0102ed0 <draw_pixel+0x24>
c0102eb8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102ebc:	78 12                	js     c0102ed0 <draw_pixel+0x24>
c0102ebe:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102ec5:	7f 09                	jg     c0102ed0 <draw_pixel+0x24>
c0102ec7:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102ece:	7e 24                	jle    c0102ef4 <draw_pixel+0x48>
c0102ed0:	c7 44 24 0c 3c 44 10 	movl   $0xc010443c,0xc(%esp)
c0102ed7:	c0 
c0102ed8:	c7 44 24 08 70 44 10 	movl   $0xc0104470,0x8(%esp)
c0102edf:	c0 
c0102ee0:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
c0102ee7:	00 
c0102ee8:	c7 04 24 85 44 10 c0 	movl   $0xc0104485,(%esp)
c0102eef:	e8 45 fd ff ff       	call   c0102c39 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0102ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ef7:	c1 e0 08             	shl    $0x8,%eax
c0102efa:	89 c2                	mov    %eax,%edx
c0102efc:	8b 45 08             	mov    0x8(%ebp),%eax
c0102eff:	c1 e0 06             	shl    $0x6,%eax
c0102f02:	01 c2                	add    %eax,%edx
c0102f04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f07:	01 c2                	add    %eax,%edx
c0102f09:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f0c:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c0102f12:	c9                   	leave  
c0102f13:	c3                   	ret    

c0102f14 <sysclean>:


void sysclean(void)
{
c0102f14:	55                   	push   %ebp
c0102f15:	89 e5                	mov    %esp,%ebp
c0102f17:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c0102f1a:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0102f21:	00 
c0102f22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102f29:	00 
c0102f2a:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c0102f31:	e8 cd 02 00 00       	call   c0103203 <memset>
}
c0102f36:	c9                   	leave  
c0102f37:	c3                   	ret    

c0102f38 <syspr>:
int syspr()
{
c0102f38:	55                   	push   %ebp
c0102f39:	89 e5                	mov    %esp,%ebp
c0102f3b:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c0102f3e:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0102f45:	c0 
c0102f46:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102f4d:	e8 67 01 00 00       	call   c01030b9 <syscall>
}
c0102f52:	c9                   	leave  
c0102f53:	c3                   	ret    

c0102f54 <systime>:

int systime(void)
{
c0102f54:	55                   	push   %ebp
c0102f55:	89 e5                	mov    %esp,%ebp
c0102f57:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c0102f5a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102f61:	e8 53 01 00 00       	call   c01030b9 <syscall>
}
c0102f66:	c9                   	leave  
c0102f67:	c3                   	ret    

c0102f68 <sysreadkey>:

int sysreadkey(void)
{
c0102f68:	55                   	push   %ebp
c0102f69:	89 e5                	mov    %esp,%ebp
c0102f6b:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c0102f6e:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0102f75:	e8 3f 01 00 00       	call   c01030b9 <syscall>
}
c0102f7a:	c9                   	leave  
c0102f7b:	c3                   	ret    

c0102f7c <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0102f7c:	55                   	push   %ebp
c0102f7d:	89 e5                	mov    %esp,%ebp
c0102f7f:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c0102f82:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f85:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102f89:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f8c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f93:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f97:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0102f9e:	e8 16 01 00 00       	call   c01030b9 <syscall>
}
c0102fa3:	c9                   	leave  
c0102fa4:	c3                   	ret    

c0102fa5 <fork>:

int fork(void)
{
c0102fa5:	55                   	push   %ebp
c0102fa6:	89 e5                	mov    %esp,%ebp
c0102fa8:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c0102fab:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0102fb2:	e8 02 01 00 00       	call   c01030b9 <syscall>
}
c0102fb7:	c9                   	leave  
c0102fb8:	c3                   	ret    

c0102fb9 <getpid>:

int getpid(void)
{
c0102fb9:	55                   	push   %ebp
c0102fba:	89 e5                	mov    %esp,%ebp
c0102fbc:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c0102fbf:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0102fc6:	e8 ee 00 00 00       	call   c01030b9 <syscall>
}
c0102fcb:	c9                   	leave  
c0102fcc:	c3                   	ret    

c0102fcd <exit>:

void exit(void)
{
c0102fcd:	55                   	push   %ebp
c0102fce:	89 e5                	mov    %esp,%ebp
c0102fd0:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit);
c0102fd3:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c0102fda:	e8 da 00 00 00       	call   c01030b9 <syscall>
}
c0102fdf:	c9                   	leave  
c0102fe0:	c3                   	ret    

c0102fe1 <sleep>:

void sleep(int sec)
{
c0102fe1:	55                   	push   %ebp
c0102fe2:	89 e5                	mov    %esp,%ebp
c0102fe4:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c0102fe7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fea:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fee:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0102ff5:	e8 bf 00 00 00       	call   c01030b9 <syscall>
	//printf("qweqwe");
}
c0102ffa:	c9                   	leave  
c0102ffb:	c3                   	ret    

c0102ffc <thread>:

int thread(void *addr)
{
c0102ffc:	55                   	push   %ebp
c0102ffd:	89 e5                	mov    %esp,%ebp
c0102fff:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread,addr);
c0103002:	8b 45 08             	mov    0x8(%ebp),%eax
c0103005:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103009:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
c0103010:	e8 a4 00 00 00       	call   c01030b9 <syscall>
}
c0103015:	c9                   	leave  
c0103016:	c3                   	ret    

c0103017 <sem_init>:

int sem_init(Sema *sema,int value)
{
c0103017:	55                   	push   %ebp
c0103018:	89 e5                	mov    %esp,%ebp
c010301a:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_init,sema,value);
c010301d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103020:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103024:	8b 45 08             	mov    0x8(%ebp),%eax
c0103027:	89 44 24 04          	mov    %eax,0x4(%esp)
c010302b:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
c0103032:	e8 82 00 00 00       	call   c01030b9 <syscall>
}
c0103037:	c9                   	leave  
c0103038:	c3                   	ret    

c0103039 <sem_destroy>:

int sem_destroy(Sema *sema)
{
c0103039:	55                   	push   %ebp
c010303a:	89 e5                	mov    %esp,%ebp
c010303c:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_destroy,sema);
c010303f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103042:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103046:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
c010304d:	e8 67 00 00 00       	call   c01030b9 <syscall>
}
c0103052:	c9                   	leave  
c0103053:	c3                   	ret    

c0103054 <sem_wait>:

int sem_wait(Sema *sema)
{
c0103054:	55                   	push   %ebp
c0103055:	89 e5                	mov    %esp,%ebp
c0103057:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_wait,sema);
c010305a:	8b 45 08             	mov    0x8(%ebp),%eax
c010305d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103061:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
c0103068:	e8 4c 00 00 00       	call   c01030b9 <syscall>
}
c010306d:	c9                   	leave  
c010306e:	c3                   	ret    

c010306f <sem_trywait>:

int sem_trywait(Sema *sema)
{
c010306f:	55                   	push   %ebp
c0103070:	89 e5                	mov    %esp,%ebp
c0103072:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_trywait,sema);
c0103075:	8b 45 08             	mov    0x8(%ebp),%eax
c0103078:	89 44 24 04          	mov    %eax,0x4(%esp)
c010307c:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
c0103083:	e8 31 00 00 00       	call   c01030b9 <syscall>
}
c0103088:	c9                   	leave  
c0103089:	c3                   	ret    

c010308a <sem_post>:

int sem_post(Sema *sema)
{
c010308a:	55                   	push   %ebp
c010308b:	89 e5                	mov    %esp,%ebp
c010308d:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_sem_post,sema);
c0103090:	8b 45 08             	mov    0x8(%ebp),%eax
c0103093:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103097:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
c010309e:	e8 16 00 00 00       	call   c01030b9 <syscall>
}
c01030a3:	c9                   	leave  
c01030a4:	c3                   	ret    

c01030a5 <thread_join>:

int thread_join(void)
{
c01030a5:	55                   	push   %ebp
c01030a6:	89 e5                	mov    %esp,%ebp
c01030a8:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_thread_join);
c01030ab:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
c01030b2:	e8 02 00 00 00       	call   c01030b9 <syscall>
c01030b7:	c9                   	leave  
c01030b8:	c3                   	ret    

c01030b9 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c01030b9:	55                   	push   %ebp
c01030ba:	89 e5                	mov    %esp,%ebp
c01030bc:	53                   	push   %ebx
c01030bd:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c01030c0:	8d 45 08             	lea    0x8(%ebp),%eax
c01030c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c01030c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01030c9:	8b 00                	mov    (%eax),%eax
c01030cb:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01030ce:	83 c2 04             	add    $0x4,%edx
c01030d1:	8b 1a                	mov    (%edx),%ebx
c01030d3:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01030d6:	83 c2 08             	add    $0x8,%edx
c01030d9:	8b 0a                	mov    (%edx),%ecx
c01030db:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01030de:	83 c2 0c             	add    $0xc,%edx
c01030e1:	8b 12                	mov    (%edx),%edx
c01030e3:	cd 80                	int    $0x80
c01030e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c01030e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01030eb:	83 c4 10             	add    $0x10,%esp
c01030ee:	5b                   	pop    %ebx
c01030ef:	5d                   	pop    %ebp
c01030f0:	c3                   	ret    

c01030f1 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c01030f1:	55                   	push   %ebp
c01030f2:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c01030f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030f7:	8b 00                	mov    (%eax),%eax
c01030f9:	8d 48 01             	lea    0x1(%eax),%ecx
c01030fc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01030ff:	89 0a                	mov    %ecx,(%edx)
c0103101:	8b 55 08             	mov    0x8(%ebp),%edx
c0103104:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c010310a:	5d                   	pop    %ebp
c010310b:	c3                   	ret    

c010310c <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c010310c:	55                   	push   %ebp
c010310d:	89 e5                	mov    %esp,%ebp
c010310f:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0103112:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0103119:	8b 45 0c             	mov    0xc(%ebp),%eax
c010311c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103120:	8b 45 08             	mov    0x8(%ebp),%eax
c0103123:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103127:	8d 45 f4             	lea    -0xc(%ebp),%eax
c010312a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010312e:	c7 04 24 f1 30 10 c0 	movl   $0xc01030f1,(%esp)
c0103135:	e8 d1 06 00 00       	call   c010380b <vprintfmt>
	return cnt;
c010313a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c010313d:	c9                   	leave  
c010313e:	c3                   	ret    

c010313f <printf>:
int printf(const char *fmt, ...)
{
c010313f:	55                   	push   %ebp
c0103140:	89 e5                	mov    %esp,%ebp
c0103142:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0103145:	8d 45 0c             	lea    0xc(%ebp),%eax
c0103148:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c010314b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010314e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103152:	8b 45 08             	mov    0x8(%ebp),%eax
c0103155:	89 04 24             	mov    %eax,(%esp)
c0103158:	e8 af ff ff ff       	call   c010310c <vprintf>
c010315d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c0103160:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103163:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103167:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c010316e:	c0 
c010316f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0103176:	e8 01 fe ff ff       	call   c0102f7c <syswrite>
	return cnt;
c010317b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010317e:	c9                   	leave  
c010317f:	c3                   	ret    

c0103180 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c0103180:	55                   	push   %ebp
c0103181:	89 e5                	mov    %esp,%ebp
c0103183:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0103186:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c010318d:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0103191:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103194:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0103199:	89 c8                	mov    %ecx,%eax
c010319b:	f7 ea                	imul   %edx
c010319d:	c1 fa 02             	sar    $0x2,%edx
c01031a0:	89 c8                	mov    %ecx,%eax
c01031a2:	c1 f8 1f             	sar    $0x1f,%eax
c01031a5:	29 c2                	sub    %eax,%edx
c01031a7:	89 d0                	mov    %edx,%eax
c01031a9:	c1 e0 02             	shl    $0x2,%eax
c01031ac:	01 d0                	add    %edx,%eax
c01031ae:	01 c0                	add    %eax,%eax
c01031b0:	29 c1                	sub    %eax,%ecx
c01031b2:	89 ca                	mov    %ecx,%edx
c01031b4:	89 d0                	mov    %edx,%eax
c01031b6:	83 c0 30             	add    $0x30,%eax
c01031b9:	89 c2                	mov    %eax,%edx
c01031bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01031be:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c01031c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01031c3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01031c8:	89 c8                	mov    %ecx,%eax
c01031ca:	f7 ea                	imul   %edx
c01031cc:	c1 fa 02             	sar    $0x2,%edx
c01031cf:	89 c8                	mov    %ecx,%eax
c01031d1:	c1 f8 1f             	sar    $0x1f,%eax
c01031d4:	29 c2                	sub    %eax,%edx
c01031d6:	89 d0                	mov    %edx,%eax
c01031d8:	89 45 08             	mov    %eax,0x8(%ebp)
c01031db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01031df:	75 ac                	jne    c010318d <itoa+0xd>
	return p;
c01031e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c01031e4:	c9                   	leave  
c01031e5:	c3                   	ret    

c01031e6 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c01031e6:	55                   	push   %ebp
c01031e7:	89 e5                	mov    %esp,%ebp
c01031e9:	57                   	push   %edi
c01031ea:	56                   	push   %esi
c01031eb:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c01031ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01031ef:	8b 55 0c             	mov    0xc(%ebp),%edx
c01031f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01031f5:	89 c1                	mov    %eax,%ecx
c01031f7:	89 d6                	mov    %edx,%esi
c01031f9:	89 df                	mov    %ebx,%edi
c01031fb:	fc                   	cld    
c01031fc:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c01031fe:	5b                   	pop    %ebx
c01031ff:	5e                   	pop    %esi
c0103200:	5f                   	pop    %edi
c0103201:	5d                   	pop    %ebp
c0103202:	c3                   	ret    

c0103203 <memset>:

void memset(void *dest, int data, size_t size) {
c0103203:	55                   	push   %ebp
c0103204:	89 e5                	mov    %esp,%ebp
c0103206:	57                   	push   %edi
c0103207:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0103208:	8b 55 10             	mov    0x10(%ebp),%edx
c010320b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010320e:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0103211:	89 d1                	mov    %edx,%ecx
c0103213:	89 df                	mov    %ebx,%edi
c0103215:	fc                   	cld    
c0103216:	f3 aa                	rep stos %al,%es:(%edi)
}
c0103218:	5b                   	pop    %ebx
c0103219:	5f                   	pop    %edi
c010321a:	5d                   	pop    %ebp
c010321b:	c3                   	ret    

c010321c <strlen>:

size_t strlen(const char *str) {
c010321c:	55                   	push   %ebp
c010321d:	89 e5                	mov    %esp,%ebp
c010321f:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0103222:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0103229:	eb 04                	jmp    c010322f <strlen+0x13>
c010322b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010322f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103232:	8d 50 01             	lea    0x1(%eax),%edx
c0103235:	89 55 08             	mov    %edx,0x8(%ebp)
c0103238:	0f b6 00             	movzbl (%eax),%eax
c010323b:	84 c0                	test   %al,%al
c010323d:	75 ec                	jne    c010322b <strlen+0xf>
	return len;
c010323f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0103242:	c9                   	leave  
c0103243:	c3                   	ret    

c0103244 <strcpy>:

void strcpy(char *d, const char *s) {
c0103244:	55                   	push   %ebp
c0103245:	89 e5                	mov    %esp,%ebp
c0103247:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c010324a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010324d:	89 04 24             	mov    %eax,(%esp)
c0103250:	e8 c7 ff ff ff       	call   c010321c <strlen>
c0103255:	83 c0 01             	add    $0x1,%eax
c0103258:	89 44 24 08          	mov    %eax,0x8(%esp)
c010325c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010325f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103263:	8b 45 08             	mov    0x8(%ebp),%eax
c0103266:	89 04 24             	mov    %eax,(%esp)
c0103269:	e8 78 ff ff ff       	call   c01031e6 <memcpy>
}
c010326e:	c9                   	leave  
c010326f:	c3                   	ret    

c0103270 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c0103270:	55                   	push   %ebp
c0103271:	89 e5                	mov    %esp,%ebp
c0103273:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0103276:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010327d:	eb 0c                	jmp    c010328b <strnlen+0x1b>
		n++;
c010327f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0103283:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103287:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c010328b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010328f:	74 0a                	je     c010329b <strnlen+0x2b>
c0103291:	8b 45 08             	mov    0x8(%ebp),%eax
c0103294:	0f b6 00             	movzbl (%eax),%eax
c0103297:	84 c0                	test   %al,%al
c0103299:	75 e4                	jne    c010327f <strnlen+0xf>
		n++;
	return n;
c010329b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c010329e:	c9                   	leave  
c010329f:	c3                   	ret    

c01032a0 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c01032a0:	55                   	push   %ebp
c01032a1:	89 e5                	mov    %esp,%ebp
c01032a3:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c01032a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01032a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c01032ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01032b3:	eb 23                	jmp    c01032d8 <strncpy+0x38>
		*dst++ = *src;
c01032b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01032b8:	8d 50 01             	lea    0x1(%eax),%edx
c01032bb:	89 55 08             	mov    %edx,0x8(%ebp)
c01032be:	8b 55 0c             	mov    0xc(%ebp),%edx
c01032c1:	0f b6 12             	movzbl (%edx),%edx
c01032c4:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c01032c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032c9:	0f b6 00             	movzbl (%eax),%eax
c01032cc:	84 c0                	test   %al,%al
c01032ce:	74 04                	je     c01032d4 <strncpy+0x34>
			src++;
c01032d0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c01032d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01032d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01032db:	3b 45 10             	cmp    0x10(%ebp),%eax
c01032de:	72 d5                	jb     c01032b5 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c01032e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c01032e3:	c9                   	leave  
c01032e4:	c3                   	ret    

c01032e5 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c01032e5:	55                   	push   %ebp
c01032e6:	89 e5                	mov    %esp,%ebp
c01032e8:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c01032eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01032ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c01032f1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01032f5:	74 33                	je     c010332a <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c01032f7:	eb 17                	jmp    c0103310 <strlcpy+0x2b>
			*dst++ = *src++;
c01032f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01032fc:	8d 50 01             	lea    0x1(%eax),%edx
c01032ff:	89 55 08             	mov    %edx,0x8(%ebp)
c0103302:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103305:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103308:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c010330b:	0f b6 12             	movzbl (%edx),%edx
c010330e:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0103310:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103314:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103318:	74 0a                	je     c0103324 <strlcpy+0x3f>
c010331a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010331d:	0f b6 00             	movzbl (%eax),%eax
c0103320:	84 c0                	test   %al,%al
c0103322:	75 d5                	jne    c01032f9 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0103324:	8b 45 08             	mov    0x8(%ebp),%eax
c0103327:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c010332a:	8b 55 08             	mov    0x8(%ebp),%edx
c010332d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103330:	29 c2                	sub    %eax,%edx
c0103332:	89 d0                	mov    %edx,%eax
}
c0103334:	c9                   	leave  
c0103335:	c3                   	ret    

c0103336 <strcmp>:

int
strcmp(const char *p, const char *q)
{
c0103336:	55                   	push   %ebp
c0103337:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c0103339:	eb 08                	jmp    c0103343 <strcmp+0xd>
		p++, q++;
c010333b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010333f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0103343:	8b 45 08             	mov    0x8(%ebp),%eax
c0103346:	0f b6 00             	movzbl (%eax),%eax
c0103349:	84 c0                	test   %al,%al
c010334b:	74 10                	je     c010335d <strcmp+0x27>
c010334d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103350:	0f b6 10             	movzbl (%eax),%edx
c0103353:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103356:	0f b6 00             	movzbl (%eax),%eax
c0103359:	38 c2                	cmp    %al,%dl
c010335b:	74 de                	je     c010333b <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c010335d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103360:	0f b6 00             	movzbl (%eax),%eax
c0103363:	0f b6 d0             	movzbl %al,%edx
c0103366:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103369:	0f b6 00             	movzbl (%eax),%eax
c010336c:	0f b6 c0             	movzbl %al,%eax
c010336f:	29 c2                	sub    %eax,%edx
c0103371:	89 d0                	mov    %edx,%eax
}
c0103373:	5d                   	pop    %ebp
c0103374:	c3                   	ret    

c0103375 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0103375:	55                   	push   %ebp
c0103376:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c0103378:	eb 0c                	jmp    c0103386 <strncmp+0x11>
		n--, p++, q++;
c010337a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c010337e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103382:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c0103386:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010338a:	74 1a                	je     c01033a6 <strncmp+0x31>
c010338c:	8b 45 08             	mov    0x8(%ebp),%eax
c010338f:	0f b6 00             	movzbl (%eax),%eax
c0103392:	84 c0                	test   %al,%al
c0103394:	74 10                	je     c01033a6 <strncmp+0x31>
c0103396:	8b 45 08             	mov    0x8(%ebp),%eax
c0103399:	0f b6 10             	movzbl (%eax),%edx
c010339c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010339f:	0f b6 00             	movzbl (%eax),%eax
c01033a2:	38 c2                	cmp    %al,%dl
c01033a4:	74 d4                	je     c010337a <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c01033a6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01033aa:	75 07                	jne    c01033b3 <strncmp+0x3e>
		return 0;
c01033ac:	b8 00 00 00 00       	mov    $0x0,%eax
c01033b1:	eb 16                	jmp    c01033c9 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c01033b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01033b6:	0f b6 00             	movzbl (%eax),%eax
c01033b9:	0f b6 d0             	movzbl %al,%edx
c01033bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033bf:	0f b6 00             	movzbl (%eax),%eax
c01033c2:	0f b6 c0             	movzbl %al,%eax
c01033c5:	29 c2                	sub    %eax,%edx
c01033c7:	89 d0                	mov    %edx,%eax
}
c01033c9:	5d                   	pop    %ebp
c01033ca:	c3                   	ret    

c01033cb <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c01033cb:	55                   	push   %ebp
c01033cc:	89 e5                	mov    %esp,%ebp
c01033ce:	83 ec 04             	sub    $0x4,%esp
c01033d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033d4:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c01033d7:	eb 14                	jmp    c01033ed <strchr+0x22>
		if (*s == c)
c01033d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01033dc:	0f b6 00             	movzbl (%eax),%eax
c01033df:	3a 45 fc             	cmp    -0x4(%ebp),%al
c01033e2:	75 05                	jne    c01033e9 <strchr+0x1e>
			return (char *) s;
c01033e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01033e7:	eb 13                	jmp    c01033fc <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c01033e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01033ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01033f0:	0f b6 00             	movzbl (%eax),%eax
c01033f3:	84 c0                	test   %al,%al
c01033f5:	75 e2                	jne    c01033d9 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c01033f7:	b8 00 00 00 00       	mov    $0x0,%eax
}
c01033fc:	c9                   	leave  
c01033fd:	c3                   	ret    

c01033fe <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c01033fe:	55                   	push   %ebp
c01033ff:	89 e5                	mov    %esp,%ebp
c0103401:	83 ec 04             	sub    $0x4,%esp
c0103404:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103407:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c010340a:	eb 11                	jmp    c010341d <strfind+0x1f>
		if (*s == c)
c010340c:	8b 45 08             	mov    0x8(%ebp),%eax
c010340f:	0f b6 00             	movzbl (%eax),%eax
c0103412:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0103415:	75 02                	jne    c0103419 <strfind+0x1b>
			break;
c0103417:	eb 0e                	jmp    c0103427 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0103419:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010341d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103420:	0f b6 00             	movzbl (%eax),%eax
c0103423:	84 c0                	test   %al,%al
c0103425:	75 e5                	jne    c010340c <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c0103427:	8b 45 08             	mov    0x8(%ebp),%eax
}
c010342a:	c9                   	leave  
c010342b:	c3                   	ret    

c010342c <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c010342c:	55                   	push   %ebp
c010342d:	89 e5                	mov    %esp,%ebp
c010342f:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0103432:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103435:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c0103438:	8b 45 08             	mov    0x8(%ebp),%eax
c010343b:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c010343e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103441:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0103444:	73 3d                	jae    c0103483 <memmove+0x57>
c0103446:	8b 45 10             	mov    0x10(%ebp),%eax
c0103449:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010344c:	01 d0                	add    %edx,%eax
c010344e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0103451:	76 30                	jbe    c0103483 <memmove+0x57>
		s += n;
c0103453:	8b 45 10             	mov    0x10(%ebp),%eax
c0103456:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c0103459:	8b 45 10             	mov    0x10(%ebp),%eax
c010345c:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c010345f:	eb 13                	jmp    c0103474 <memmove+0x48>
			*--d = *--s;
c0103461:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0103465:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0103469:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010346c:	0f b6 10             	movzbl (%eax),%edx
c010346f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103472:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0103474:	8b 45 10             	mov    0x10(%ebp),%eax
c0103477:	8d 50 ff             	lea    -0x1(%eax),%edx
c010347a:	89 55 10             	mov    %edx,0x10(%ebp)
c010347d:	85 c0                	test   %eax,%eax
c010347f:	75 e0                	jne    c0103461 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0103481:	eb 26                	jmp    c01034a9 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0103483:	eb 17                	jmp    c010349c <memmove+0x70>
			*d++ = *s++;
c0103485:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103488:	8d 50 01             	lea    0x1(%eax),%edx
c010348b:	89 55 f8             	mov    %edx,-0x8(%ebp)
c010348e:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0103491:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103494:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0103497:	0f b6 12             	movzbl (%edx),%edx
c010349a:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c010349c:	8b 45 10             	mov    0x10(%ebp),%eax
c010349f:	8d 50 ff             	lea    -0x1(%eax),%edx
c01034a2:	89 55 10             	mov    %edx,0x10(%ebp)
c01034a5:	85 c0                	test   %eax,%eax
c01034a7:	75 dc                	jne    c0103485 <memmove+0x59>
			*d++ = *s++;

	return dst;
c01034a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
c01034ac:	c9                   	leave  
c01034ad:	c3                   	ret    

c01034ae <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c01034ae:	55                   	push   %ebp
c01034af:	89 e5                	mov    %esp,%ebp
c01034b1:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c01034b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01034b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c01034ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034bd:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c01034c0:	eb 30                	jmp    c01034f2 <memcmp+0x44>
		if (*s1 != *s2)
c01034c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01034c5:	0f b6 10             	movzbl (%eax),%edx
c01034c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01034cb:	0f b6 00             	movzbl (%eax),%eax
c01034ce:	38 c2                	cmp    %al,%dl
c01034d0:	74 18                	je     c01034ea <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c01034d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01034d5:	0f b6 00             	movzbl (%eax),%eax
c01034d8:	0f b6 d0             	movzbl %al,%edx
c01034db:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01034de:	0f b6 00             	movzbl (%eax),%eax
c01034e1:	0f b6 c0             	movzbl %al,%eax
c01034e4:	29 c2                	sub    %eax,%edx
c01034e6:	89 d0                	mov    %edx,%eax
c01034e8:	eb 1a                	jmp    c0103504 <memcmp+0x56>
		s1++, s2++;
c01034ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01034ee:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c01034f2:	8b 45 10             	mov    0x10(%ebp),%eax
c01034f5:	8d 50 ff             	lea    -0x1(%eax),%edx
c01034f8:	89 55 10             	mov    %edx,0x10(%ebp)
c01034fb:	85 c0                	test   %eax,%eax
c01034fd:	75 c3                	jne    c01034c2 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c01034ff:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0103504:	c9                   	leave  
c0103505:	c3                   	ret    

c0103506 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c0103506:	55                   	push   %ebp
c0103507:	89 e5                	mov    %esp,%ebp
c0103509:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c010350c:	8b 45 10             	mov    0x10(%ebp),%eax
c010350f:	8b 55 08             	mov    0x8(%ebp),%edx
c0103512:	01 d0                	add    %edx,%eax
c0103514:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c0103517:	eb 13                	jmp    c010352c <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c0103519:	8b 45 08             	mov    0x8(%ebp),%eax
c010351c:	0f b6 10             	movzbl (%eax),%edx
c010351f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103522:	38 c2                	cmp    %al,%dl
c0103524:	75 02                	jne    c0103528 <memfind+0x22>
			break;
c0103526:	eb 0c                	jmp    c0103534 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c0103528:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010352c:	8b 45 08             	mov    0x8(%ebp),%eax
c010352f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0103532:	72 e5                	jb     c0103519 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0103534:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0103537:	c9                   	leave  
c0103538:	c3                   	ret    

c0103539 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c0103539:	55                   	push   %ebp
c010353a:	89 e5                	mov    %esp,%ebp
c010353c:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c010353f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c0103546:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c010354d:	eb 04                	jmp    c0103553 <strtol+0x1a>
		s++;
c010354f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0103553:	8b 45 08             	mov    0x8(%ebp),%eax
c0103556:	0f b6 00             	movzbl (%eax),%eax
c0103559:	3c 20                	cmp    $0x20,%al
c010355b:	74 f2                	je     c010354f <strtol+0x16>
c010355d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103560:	0f b6 00             	movzbl (%eax),%eax
c0103563:	3c 09                	cmp    $0x9,%al
c0103565:	74 e8                	je     c010354f <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c0103567:	8b 45 08             	mov    0x8(%ebp),%eax
c010356a:	0f b6 00             	movzbl (%eax),%eax
c010356d:	3c 2b                	cmp    $0x2b,%al
c010356f:	75 06                	jne    c0103577 <strtol+0x3e>
		s++;
c0103571:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103575:	eb 15                	jmp    c010358c <strtol+0x53>
	else if (*s == '-')
c0103577:	8b 45 08             	mov    0x8(%ebp),%eax
c010357a:	0f b6 00             	movzbl (%eax),%eax
c010357d:	3c 2d                	cmp    $0x2d,%al
c010357f:	75 0b                	jne    c010358c <strtol+0x53>
		s++, neg = 1;
c0103581:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103585:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c010358c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103590:	74 06                	je     c0103598 <strtol+0x5f>
c0103592:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0103596:	75 24                	jne    c01035bc <strtol+0x83>
c0103598:	8b 45 08             	mov    0x8(%ebp),%eax
c010359b:	0f b6 00             	movzbl (%eax),%eax
c010359e:	3c 30                	cmp    $0x30,%al
c01035a0:	75 1a                	jne    c01035bc <strtol+0x83>
c01035a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01035a5:	83 c0 01             	add    $0x1,%eax
c01035a8:	0f b6 00             	movzbl (%eax),%eax
c01035ab:	3c 78                	cmp    $0x78,%al
c01035ad:	75 0d                	jne    c01035bc <strtol+0x83>
		s += 2, base = 16;
c01035af:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c01035b3:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c01035ba:	eb 2a                	jmp    c01035e6 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c01035bc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01035c0:	75 17                	jne    c01035d9 <strtol+0xa0>
c01035c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01035c5:	0f b6 00             	movzbl (%eax),%eax
c01035c8:	3c 30                	cmp    $0x30,%al
c01035ca:	75 0d                	jne    c01035d9 <strtol+0xa0>
		s++, base = 8;
c01035cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01035d0:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c01035d7:	eb 0d                	jmp    c01035e6 <strtol+0xad>
	else if (base == 0)
c01035d9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01035dd:	75 07                	jne    c01035e6 <strtol+0xad>
		base = 10;
c01035df:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c01035e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01035e9:	0f b6 00             	movzbl (%eax),%eax
c01035ec:	3c 2f                	cmp    $0x2f,%al
c01035ee:	7e 1b                	jle    c010360b <strtol+0xd2>
c01035f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01035f3:	0f b6 00             	movzbl (%eax),%eax
c01035f6:	3c 39                	cmp    $0x39,%al
c01035f8:	7f 11                	jg     c010360b <strtol+0xd2>
			dig = *s - '0';
c01035fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01035fd:	0f b6 00             	movzbl (%eax),%eax
c0103600:	0f be c0             	movsbl %al,%eax
c0103603:	83 e8 30             	sub    $0x30,%eax
c0103606:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103609:	eb 48                	jmp    c0103653 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c010360b:	8b 45 08             	mov    0x8(%ebp),%eax
c010360e:	0f b6 00             	movzbl (%eax),%eax
c0103611:	3c 60                	cmp    $0x60,%al
c0103613:	7e 1b                	jle    c0103630 <strtol+0xf7>
c0103615:	8b 45 08             	mov    0x8(%ebp),%eax
c0103618:	0f b6 00             	movzbl (%eax),%eax
c010361b:	3c 7a                	cmp    $0x7a,%al
c010361d:	7f 11                	jg     c0103630 <strtol+0xf7>
			dig = *s - 'a' + 10;
c010361f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103622:	0f b6 00             	movzbl (%eax),%eax
c0103625:	0f be c0             	movsbl %al,%eax
c0103628:	83 e8 57             	sub    $0x57,%eax
c010362b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010362e:	eb 23                	jmp    c0103653 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c0103630:	8b 45 08             	mov    0x8(%ebp),%eax
c0103633:	0f b6 00             	movzbl (%eax),%eax
c0103636:	3c 40                	cmp    $0x40,%al
c0103638:	7e 3d                	jle    c0103677 <strtol+0x13e>
c010363a:	8b 45 08             	mov    0x8(%ebp),%eax
c010363d:	0f b6 00             	movzbl (%eax),%eax
c0103640:	3c 5a                	cmp    $0x5a,%al
c0103642:	7f 33                	jg     c0103677 <strtol+0x13e>
			dig = *s - 'A' + 10;
c0103644:	8b 45 08             	mov    0x8(%ebp),%eax
c0103647:	0f b6 00             	movzbl (%eax),%eax
c010364a:	0f be c0             	movsbl %al,%eax
c010364d:	83 e8 37             	sub    $0x37,%eax
c0103650:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c0103653:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103656:	3b 45 10             	cmp    0x10(%ebp),%eax
c0103659:	7c 02                	jl     c010365d <strtol+0x124>
			break;
c010365b:	eb 1a                	jmp    c0103677 <strtol+0x13e>
		s++, val = (val * base) + dig;
c010365d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103661:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103664:	0f af 45 10          	imul   0x10(%ebp),%eax
c0103668:	89 c2                	mov    %eax,%edx
c010366a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010366d:	01 d0                	add    %edx,%eax
c010366f:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c0103672:	e9 6f ff ff ff       	jmp    c01035e6 <strtol+0xad>

	if (endptr)
c0103677:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010367b:	74 08                	je     c0103685 <strtol+0x14c>
		*endptr = (char *) s;
c010367d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103680:	8b 55 08             	mov    0x8(%ebp),%edx
c0103683:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c0103685:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0103689:	74 07                	je     c0103692 <strtol+0x159>
c010368b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010368e:	f7 d8                	neg    %eax
c0103690:	eb 03                	jmp    c0103695 <strtol+0x15c>
c0103692:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0103695:	c9                   	leave  
c0103696:	c3                   	ret    

c0103697 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c0103697:	55                   	push   %ebp
c0103698:	89 e5                	mov    %esp,%ebp
c010369a:	53                   	push   %ebx
c010369b:	83 ec 34             	sub    $0x34,%esp
c010369e:	8b 45 10             	mov    0x10(%ebp),%eax
c01036a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01036a4:	8b 45 14             	mov    0x14(%ebp),%eax
c01036a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c01036aa:	8b 45 18             	mov    0x18(%ebp),%eax
c01036ad:	ba 00 00 00 00       	mov    $0x0,%edx
c01036b2:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01036b5:	77 72                	ja     c0103729 <printnum+0x92>
c01036b7:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01036ba:	72 05                	jb     c01036c1 <printnum+0x2a>
c01036bc:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01036bf:	77 68                	ja     c0103729 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c01036c1:	8b 45 1c             	mov    0x1c(%ebp),%eax
c01036c4:	8d 58 ff             	lea    -0x1(%eax),%ebx
c01036c7:	8b 45 18             	mov    0x18(%ebp),%eax
c01036ca:	ba 00 00 00 00       	mov    $0x0,%edx
c01036cf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036d3:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01036d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036da:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036dd:	89 04 24             	mov    %eax,(%esp)
c01036e0:	89 54 24 04          	mov    %edx,0x4(%esp)
c01036e4:	e8 57 06 00 00       	call   c0103d40 <__udivdi3>
c01036e9:	8b 4d 20             	mov    0x20(%ebp),%ecx
c01036ec:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c01036f0:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c01036f4:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01036f7:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c01036fb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036ff:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103703:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103706:	89 44 24 04          	mov    %eax,0x4(%esp)
c010370a:	8b 45 08             	mov    0x8(%ebp),%eax
c010370d:	89 04 24             	mov    %eax,(%esp)
c0103710:	e8 82 ff ff ff       	call   c0103697 <printnum>
c0103715:	eb 1c                	jmp    c0103733 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c0103717:	8b 45 0c             	mov    0xc(%ebp),%eax
c010371a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010371e:	8b 45 20             	mov    0x20(%ebp),%eax
c0103721:	89 04 24             	mov    %eax,(%esp)
c0103724:	8b 45 08             	mov    0x8(%ebp),%eax
c0103727:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c0103729:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c010372d:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0103731:	7f e4                	jg     c0103717 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c0103733:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103736:	bb 00 00 00 00       	mov    $0x0,%ebx
c010373b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010373e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103741:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103745:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0103749:	89 04 24             	mov    %eax,(%esp)
c010374c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103750:	e8 1b 07 00 00       	call   c0103e70 <__umoddi3>
c0103755:	05 20 45 10 c0       	add    $0xc0104520,%eax
c010375a:	0f b6 00             	movzbl (%eax),%eax
c010375d:	0f be c0             	movsbl %al,%eax
c0103760:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103763:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103767:	89 04 24             	mov    %eax,(%esp)
c010376a:	8b 45 08             	mov    0x8(%ebp),%eax
c010376d:	ff d0                	call   *%eax
}
c010376f:	83 c4 34             	add    $0x34,%esp
c0103772:	5b                   	pop    %ebx
c0103773:	5d                   	pop    %ebp
c0103774:	c3                   	ret    

c0103775 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c0103775:	55                   	push   %ebp
c0103776:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c0103778:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010377c:	7e 14                	jle    c0103792 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c010377e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103781:	8b 00                	mov    (%eax),%eax
c0103783:	8d 48 08             	lea    0x8(%eax),%ecx
c0103786:	8b 55 08             	mov    0x8(%ebp),%edx
c0103789:	89 0a                	mov    %ecx,(%edx)
c010378b:	8b 50 04             	mov    0x4(%eax),%edx
c010378e:	8b 00                	mov    (%eax),%eax
c0103790:	eb 30                	jmp    c01037c2 <getuint+0x4d>
	else if (lflag)
c0103792:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103796:	74 16                	je     c01037ae <getuint+0x39>
		return va_arg(*ap, unsigned long);
c0103798:	8b 45 08             	mov    0x8(%ebp),%eax
c010379b:	8b 00                	mov    (%eax),%eax
c010379d:	8d 48 04             	lea    0x4(%eax),%ecx
c01037a0:	8b 55 08             	mov    0x8(%ebp),%edx
c01037a3:	89 0a                	mov    %ecx,(%edx)
c01037a5:	8b 00                	mov    (%eax),%eax
c01037a7:	ba 00 00 00 00       	mov    $0x0,%edx
c01037ac:	eb 14                	jmp    c01037c2 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c01037ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01037b1:	8b 00                	mov    (%eax),%eax
c01037b3:	8d 48 04             	lea    0x4(%eax),%ecx
c01037b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01037b9:	89 0a                	mov    %ecx,(%edx)
c01037bb:	8b 00                	mov    (%eax),%eax
c01037bd:	ba 00 00 00 00       	mov    $0x0,%edx
}
c01037c2:	5d                   	pop    %ebp
c01037c3:	c3                   	ret    

c01037c4 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c01037c4:	55                   	push   %ebp
c01037c5:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c01037c7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01037cb:	7e 14                	jle    c01037e1 <getint+0x1d>
		return va_arg(*ap, long long);
c01037cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01037d0:	8b 00                	mov    (%eax),%eax
c01037d2:	8d 48 08             	lea    0x8(%eax),%ecx
c01037d5:	8b 55 08             	mov    0x8(%ebp),%edx
c01037d8:	89 0a                	mov    %ecx,(%edx)
c01037da:	8b 50 04             	mov    0x4(%eax),%edx
c01037dd:	8b 00                	mov    (%eax),%eax
c01037df:	eb 28                	jmp    c0103809 <getint+0x45>
	else if (lflag)
c01037e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01037e5:	74 12                	je     c01037f9 <getint+0x35>
		return va_arg(*ap, long);
c01037e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01037ea:	8b 00                	mov    (%eax),%eax
c01037ec:	8d 48 04             	lea    0x4(%eax),%ecx
c01037ef:	8b 55 08             	mov    0x8(%ebp),%edx
c01037f2:	89 0a                	mov    %ecx,(%edx)
c01037f4:	8b 00                	mov    (%eax),%eax
c01037f6:	99                   	cltd   
c01037f7:	eb 10                	jmp    c0103809 <getint+0x45>
	else
		return va_arg(*ap, int);
c01037f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01037fc:	8b 00                	mov    (%eax),%eax
c01037fe:	8d 48 04             	lea    0x4(%eax),%ecx
c0103801:	8b 55 08             	mov    0x8(%ebp),%edx
c0103804:	89 0a                	mov    %ecx,(%edx)
c0103806:	8b 00                	mov    (%eax),%eax
c0103808:	99                   	cltd   
}
c0103809:	5d                   	pop    %ebp
c010380a:	c3                   	ret    

c010380b <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c010380b:	55                   	push   %ebp
c010380c:	89 e5                	mov    %esp,%ebp
c010380e:	56                   	push   %esi
c010380f:	53                   	push   %ebx
c0103810:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103813:	eb 18                	jmp    c010382d <vprintfmt+0x22>
			if (ch == '\0')
c0103815:	85 db                	test   %ebx,%ebx
c0103817:	75 05                	jne    c010381e <vprintfmt+0x13>
				return;
c0103819:	e9 e9 03 00 00       	jmp    c0103c07 <vprintfmt+0x3fc>
			putch(ch, putdat);
c010381e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103821:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103825:	89 1c 24             	mov    %ebx,(%esp)
c0103828:	8b 45 08             	mov    0x8(%ebp),%eax
c010382b:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c010382d:	8b 45 10             	mov    0x10(%ebp),%eax
c0103830:	8d 50 01             	lea    0x1(%eax),%edx
c0103833:	89 55 10             	mov    %edx,0x10(%ebp)
c0103836:	0f b6 00             	movzbl (%eax),%eax
c0103839:	0f b6 d8             	movzbl %al,%ebx
c010383c:	83 fb 25             	cmp    $0x25,%ebx
c010383f:	75 d4                	jne    c0103815 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c0103841:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c0103845:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c010384c:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c0103853:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c010385a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c0103861:	8b 45 10             	mov    0x10(%ebp),%eax
c0103864:	8d 50 01             	lea    0x1(%eax),%edx
c0103867:	89 55 10             	mov    %edx,0x10(%ebp)
c010386a:	0f b6 00             	movzbl (%eax),%eax
c010386d:	0f b6 d8             	movzbl %al,%ebx
c0103870:	8d 43 dd             	lea    -0x23(%ebx),%eax
c0103873:	83 f8 55             	cmp    $0x55,%eax
c0103876:	0f 87 5a 03 00 00    	ja     c0103bd6 <vprintfmt+0x3cb>
c010387c:	8b 04 85 44 45 10 c0 	mov    -0x3fefbabc(,%eax,4),%eax
c0103883:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c0103885:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c0103889:	eb d6                	jmp    c0103861 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c010388b:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c010388f:	eb d0                	jmp    c0103861 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103891:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c0103898:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010389b:	89 d0                	mov    %edx,%eax
c010389d:	c1 e0 02             	shl    $0x2,%eax
c01038a0:	01 d0                	add    %edx,%eax
c01038a2:	01 c0                	add    %eax,%eax
c01038a4:	01 d8                	add    %ebx,%eax
c01038a6:	83 e8 30             	sub    $0x30,%eax
c01038a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c01038ac:	8b 45 10             	mov    0x10(%ebp),%eax
c01038af:	0f b6 00             	movzbl (%eax),%eax
c01038b2:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c01038b5:	83 fb 2f             	cmp    $0x2f,%ebx
c01038b8:	7e 0b                	jle    c01038c5 <vprintfmt+0xba>
c01038ba:	83 fb 39             	cmp    $0x39,%ebx
c01038bd:	7f 06                	jg     c01038c5 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01038bf:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c01038c3:	eb d3                	jmp    c0103898 <vprintfmt+0x8d>
			goto process_precision;
c01038c5:	eb 33                	jmp    c01038fa <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c01038c7:	8b 45 14             	mov    0x14(%ebp),%eax
c01038ca:	8d 50 04             	lea    0x4(%eax),%edx
c01038cd:	89 55 14             	mov    %edx,0x14(%ebp)
c01038d0:	8b 00                	mov    (%eax),%eax
c01038d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c01038d5:	eb 23                	jmp    c01038fa <vprintfmt+0xef>

		case '.':
			if (width < 0)
c01038d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01038db:	79 0c                	jns    c01038e9 <vprintfmt+0xde>
				width = 0;
c01038dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c01038e4:	e9 78 ff ff ff       	jmp    c0103861 <vprintfmt+0x56>
c01038e9:	e9 73 ff ff ff       	jmp    c0103861 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c01038ee:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c01038f5:	e9 67 ff ff ff       	jmp    c0103861 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c01038fa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01038fe:	79 12                	jns    c0103912 <vprintfmt+0x107>
				width = precision, precision = -1;
c0103900:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103903:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103906:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c010390d:	e9 4f ff ff ff       	jmp    c0103861 <vprintfmt+0x56>
c0103912:	e9 4a ff ff ff       	jmp    c0103861 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c0103917:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c010391b:	e9 41 ff ff ff       	jmp    c0103861 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c0103920:	8b 45 14             	mov    0x14(%ebp),%eax
c0103923:	8d 50 04             	lea    0x4(%eax),%edx
c0103926:	89 55 14             	mov    %edx,0x14(%ebp)
c0103929:	8b 00                	mov    (%eax),%eax
c010392b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010392e:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103932:	89 04 24             	mov    %eax,(%esp)
c0103935:	8b 45 08             	mov    0x8(%ebp),%eax
c0103938:	ff d0                	call   *%eax
			break;
c010393a:	e9 c2 02 00 00       	jmp    c0103c01 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c010393f:	8b 45 14             	mov    0x14(%ebp),%eax
c0103942:	8d 50 04             	lea    0x4(%eax),%edx
c0103945:	89 55 14             	mov    %edx,0x14(%ebp)
c0103948:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c010394a:	85 db                	test   %ebx,%ebx
c010394c:	79 02                	jns    c0103950 <vprintfmt+0x145>
				err = -err;
c010394e:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c0103950:	83 fb 06             	cmp    $0x6,%ebx
c0103953:	7f 0b                	jg     c0103960 <vprintfmt+0x155>
c0103955:	8b 34 9d 04 45 10 c0 	mov    -0x3fefbafc(,%ebx,4),%esi
c010395c:	85 f6                	test   %esi,%esi
c010395e:	75 23                	jne    c0103983 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c0103960:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0103964:	c7 44 24 08 31 45 10 	movl   $0xc0104531,0x8(%esp)
c010396b:	c0 
c010396c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010396f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103973:	8b 45 08             	mov    0x8(%ebp),%eax
c0103976:	89 04 24             	mov    %eax,(%esp)
c0103979:	e8 90 02 00 00       	call   c0103c0e <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c010397e:	e9 7e 02 00 00       	jmp    c0103c01 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c0103983:	89 74 24 0c          	mov    %esi,0xc(%esp)
c0103987:	c7 44 24 08 3a 45 10 	movl   $0xc010453a,0x8(%esp)
c010398e:	c0 
c010398f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103992:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103996:	8b 45 08             	mov    0x8(%ebp),%eax
c0103999:	89 04 24             	mov    %eax,(%esp)
c010399c:	e8 6d 02 00 00       	call   c0103c0e <printfmt>
			break;
c01039a1:	e9 5b 02 00 00       	jmp    c0103c01 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c01039a6:	8b 45 14             	mov    0x14(%ebp),%eax
c01039a9:	8d 50 04             	lea    0x4(%eax),%edx
c01039ac:	89 55 14             	mov    %edx,0x14(%ebp)
c01039af:	8b 30                	mov    (%eax),%esi
c01039b1:	85 f6                	test   %esi,%esi
c01039b3:	75 05                	jne    c01039ba <vprintfmt+0x1af>
				p = "(null)";
c01039b5:	be 3d 45 10 c0       	mov    $0xc010453d,%esi
			if (width > 0 && padc != '-')
c01039ba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01039be:	7e 37                	jle    c01039f7 <vprintfmt+0x1ec>
c01039c0:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c01039c4:	74 31                	je     c01039f7 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c01039c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01039c9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039cd:	89 34 24             	mov    %esi,(%esp)
c01039d0:	e8 9b f8 ff ff       	call   c0103270 <strnlen>
c01039d5:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c01039d8:	eb 17                	jmp    c01039f1 <vprintfmt+0x1e6>
					putch(padc, putdat);
c01039da:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c01039de:	8b 55 0c             	mov    0xc(%ebp),%edx
c01039e1:	89 54 24 04          	mov    %edx,0x4(%esp)
c01039e5:	89 04 24             	mov    %eax,(%esp)
c01039e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01039eb:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c01039ed:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01039f1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01039f5:	7f e3                	jg     c01039da <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c01039f7:	eb 38                	jmp    c0103a31 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c01039f9:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01039fd:	74 1f                	je     c0103a1e <vprintfmt+0x213>
c01039ff:	83 fb 1f             	cmp    $0x1f,%ebx
c0103a02:	7e 05                	jle    c0103a09 <vprintfmt+0x1fe>
c0103a04:	83 fb 7e             	cmp    $0x7e,%ebx
c0103a07:	7e 15                	jle    c0103a1e <vprintfmt+0x213>
					putch('?', putdat);
c0103a09:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a0c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a10:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c0103a17:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a1a:	ff d0                	call   *%eax
c0103a1c:	eb 0f                	jmp    c0103a2d <vprintfmt+0x222>
				else
					putch(ch, putdat);
c0103a1e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a21:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a25:	89 1c 24             	mov    %ebx,(%esp)
c0103a28:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a2b:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103a2d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103a31:	89 f0                	mov    %esi,%eax
c0103a33:	8d 70 01             	lea    0x1(%eax),%esi
c0103a36:	0f b6 00             	movzbl (%eax),%eax
c0103a39:	0f be d8             	movsbl %al,%ebx
c0103a3c:	85 db                	test   %ebx,%ebx
c0103a3e:	74 10                	je     c0103a50 <vprintfmt+0x245>
c0103a40:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103a44:	78 b3                	js     c01039f9 <vprintfmt+0x1ee>
c0103a46:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c0103a4a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103a4e:	79 a9                	jns    c01039f9 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103a50:	eb 17                	jmp    c0103a69 <vprintfmt+0x25e>
				putch(' ', putdat);
c0103a52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a55:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a59:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103a60:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a63:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103a65:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103a69:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103a6d:	7f e3                	jg     c0103a52 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103a6f:	e9 8d 01 00 00       	jmp    c0103c01 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c0103a74:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a77:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a7b:	8d 45 14             	lea    0x14(%ebp),%eax
c0103a7e:	89 04 24             	mov    %eax,(%esp)
c0103a81:	e8 3e fd ff ff       	call   c01037c4 <getint>
c0103a86:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103a89:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c0103a8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103a92:	85 d2                	test   %edx,%edx
c0103a94:	79 26                	jns    c0103abc <vprintfmt+0x2b1>
				putch('-', putdat);
c0103a96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a99:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a9d:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0103aa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103aa7:	ff d0                	call   *%eax
				num = -(long long) num;
c0103aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103aac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103aaf:	f7 d8                	neg    %eax
c0103ab1:	83 d2 00             	adc    $0x0,%edx
c0103ab4:	f7 da                	neg    %edx
c0103ab6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103ab9:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0103abc:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103ac3:	e9 c5 00 00 00       	jmp    c0103b8d <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c0103ac8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103acb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103acf:	8d 45 14             	lea    0x14(%ebp),%eax
c0103ad2:	89 04 24             	mov    %eax,(%esp)
c0103ad5:	e8 9b fc ff ff       	call   c0103775 <getuint>
c0103ada:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103add:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c0103ae0:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103ae7:	e9 a1 00 00 00       	jmp    c0103b8d <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c0103aec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103aef:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103af3:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103afa:	8b 45 08             	mov    0x8(%ebp),%eax
c0103afd:	ff d0                	call   *%eax
			putch('X', putdat);
c0103aff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b02:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b06:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103b0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b10:	ff d0                	call   *%eax
			putch('X', putdat);
c0103b12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b15:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b19:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103b20:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b23:	ff d0                	call   *%eax
			break;
c0103b25:	e9 d7 00 00 00       	jmp    c0103c01 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c0103b2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b2d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b31:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c0103b38:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b3b:	ff d0                	call   *%eax
			putch('x', putdat);
c0103b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b40:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b44:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c0103b4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b4e:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103b50:	8b 45 14             	mov    0x14(%ebp),%eax
c0103b53:	8d 50 04             	lea    0x4(%eax),%edx
c0103b56:	89 55 14             	mov    %edx,0x14(%ebp)
c0103b59:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c0103b5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0103b65:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0103b6c:	eb 1f                	jmp    c0103b8d <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103b6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b71:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103b75:	8d 45 14             	lea    0x14(%ebp),%eax
c0103b78:	89 04 24             	mov    %eax,(%esp)
c0103b7b:	e8 f5 fb ff ff       	call   c0103775 <getuint>
c0103b80:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b83:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103b86:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0103b8d:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0103b91:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b94:	89 54 24 18          	mov    %edx,0x18(%esp)
c0103b98:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103b9b:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103b9f:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103ba3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ba6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103ba9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103bad:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103bb1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bb4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bbb:	89 04 24             	mov    %eax,(%esp)
c0103bbe:	e8 d4 fa ff ff       	call   c0103697 <printnum>
			break;
c0103bc3:	eb 3c                	jmp    c0103c01 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c0103bc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bc8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bcc:	89 1c 24             	mov    %ebx,(%esp)
c0103bcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bd2:	ff d0                	call   *%eax
			break;
c0103bd4:	eb 2b                	jmp    c0103c01 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c0103bd6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bd9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103bdd:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c0103be4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103be7:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c0103be9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103bed:	eb 04                	jmp    c0103bf3 <vprintfmt+0x3e8>
c0103bef:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103bf3:	8b 45 10             	mov    0x10(%ebp),%eax
c0103bf6:	83 e8 01             	sub    $0x1,%eax
c0103bf9:	0f b6 00             	movzbl (%eax),%eax
c0103bfc:	3c 25                	cmp    $0x25,%al
c0103bfe:	75 ef                	jne    c0103bef <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c0103c00:	90                   	nop
		}
	}
c0103c01:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103c02:	e9 26 fc ff ff       	jmp    c010382d <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c0103c07:	83 c4 40             	add    $0x40,%esp
c0103c0a:	5b                   	pop    %ebx
c0103c0b:	5e                   	pop    %esi
c0103c0c:	5d                   	pop    %ebp
c0103c0d:	c3                   	ret    

c0103c0e <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c0103c0e:	55                   	push   %ebp
c0103c0f:	89 e5                	mov    %esp,%ebp
c0103c11:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0103c14:	8d 45 14             	lea    0x14(%ebp),%eax
c0103c17:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c0103c1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c1d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103c21:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c24:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103c28:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c2b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c32:	89 04 24             	mov    %eax,(%esp)
c0103c35:	e8 d1 fb ff ff       	call   c010380b <vprintfmt>
	va_end(ap);
}
c0103c3a:	c9                   	leave  
c0103c3b:	c3                   	ret    

c0103c3c <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c0103c3c:	55                   	push   %ebp
c0103c3d:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103c3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c42:	8b 40 08             	mov    0x8(%eax),%eax
c0103c45:	8d 50 01             	lea    0x1(%eax),%edx
c0103c48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c4b:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c51:	8b 10                	mov    (%eax),%edx
c0103c53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c56:	8b 40 04             	mov    0x4(%eax),%eax
c0103c59:	39 c2                	cmp    %eax,%edx
c0103c5b:	73 12                	jae    c0103c6f <sprintputch+0x33>
		*b->buf++ = ch;
c0103c5d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c60:	8b 00                	mov    (%eax),%eax
c0103c62:	8d 48 01             	lea    0x1(%eax),%ecx
c0103c65:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103c68:	89 0a                	mov    %ecx,(%edx)
c0103c6a:	8b 55 08             	mov    0x8(%ebp),%edx
c0103c6d:	88 10                	mov    %dl,(%eax)
}
c0103c6f:	5d                   	pop    %ebp
c0103c70:	c3                   	ret    

c0103c71 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103c71:	55                   	push   %ebp
c0103c72:	89 e5                	mov    %esp,%ebp
c0103c74:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103c77:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103c7d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c80:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103c83:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c86:	01 d0                	add    %edx,%eax
c0103c88:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103c8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0103c92:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103c96:	74 06                	je     c0103c9e <vsnprintf+0x2d>
c0103c98:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103c9c:	7f 07                	jg     c0103ca5 <vsnprintf+0x34>
		return -E_INVAL;
c0103c9e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0103ca3:	eb 2a                	jmp    c0103ccf <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c0103ca5:	8b 45 14             	mov    0x14(%ebp),%eax
c0103ca8:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103cac:	8b 45 10             	mov    0x10(%ebp),%eax
c0103caf:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103cb3:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0103cb6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cba:	c7 04 24 3c 3c 10 c0 	movl   $0xc0103c3c,(%esp)
c0103cc1:	e8 45 fb ff ff       	call   c010380b <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c0103cc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103cc9:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c0103ccc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103ccf:	c9                   	leave  
c0103cd0:	c3                   	ret    

c0103cd1 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c0103cd1:	55                   	push   %ebp
c0103cd2:	89 e5                	mov    %esp,%ebp
c0103cd4:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c0103cd7:	8d 45 14             	lea    0x14(%ebp),%eax
c0103cda:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c0103cdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ce0:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103ce4:	8b 45 10             	mov    0x10(%ebp),%eax
c0103ce7:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103ceb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cee:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf5:	89 04 24             	mov    %eax,(%esp)
c0103cf8:	e8 74 ff ff ff       	call   c0103c71 <vsnprintf>
c0103cfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c0103d00:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103d03:	c9                   	leave  
c0103d04:	c3                   	ret    

c0103d05 <srand>:
static int seed = 0;

void
srand(int s) {
c0103d05:	55                   	push   %ebp
c0103d06:	89 e5                	mov    %esp,%ebp
	seed = s;
c0103d08:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d0b:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c0103d10:	5d                   	pop    %ebp
c0103d11:	c3                   	ret    

c0103d12 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0103d12:	55                   	push   %ebp
c0103d13:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0103d15:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103d1a:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0103d20:	83 c0 01             	add    $0x1,%eax
c0103d23:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c0103d28:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103d2d:	c1 f8 10             	sar    $0x10,%eax
c0103d30:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0103d35:	5d                   	pop    %ebp
c0103d36:	c3                   	ret    
c0103d37:	66 90                	xchg   %ax,%ax
c0103d39:	66 90                	xchg   %ax,%ax
c0103d3b:	66 90                	xchg   %ax,%ax
c0103d3d:	66 90                	xchg   %ax,%ax
c0103d3f:	90                   	nop

c0103d40 <__udivdi3>:
c0103d40:	55                   	push   %ebp
c0103d41:	57                   	push   %edi
c0103d42:	56                   	push   %esi
c0103d43:	83 ec 0c             	sub    $0xc,%esp
c0103d46:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103d4a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c0103d4e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103d52:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103d56:	85 c0                	test   %eax,%eax
c0103d58:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0103d5c:	89 ea                	mov    %ebp,%edx
c0103d5e:	89 0c 24             	mov    %ecx,(%esp)
c0103d61:	75 2d                	jne    c0103d90 <__udivdi3+0x50>
c0103d63:	39 e9                	cmp    %ebp,%ecx
c0103d65:	77 61                	ja     c0103dc8 <__udivdi3+0x88>
c0103d67:	85 c9                	test   %ecx,%ecx
c0103d69:	89 ce                	mov    %ecx,%esi
c0103d6b:	75 0b                	jne    c0103d78 <__udivdi3+0x38>
c0103d6d:	b8 01 00 00 00       	mov    $0x1,%eax
c0103d72:	31 d2                	xor    %edx,%edx
c0103d74:	f7 f1                	div    %ecx
c0103d76:	89 c6                	mov    %eax,%esi
c0103d78:	31 d2                	xor    %edx,%edx
c0103d7a:	89 e8                	mov    %ebp,%eax
c0103d7c:	f7 f6                	div    %esi
c0103d7e:	89 c5                	mov    %eax,%ebp
c0103d80:	89 f8                	mov    %edi,%eax
c0103d82:	f7 f6                	div    %esi
c0103d84:	89 ea                	mov    %ebp,%edx
c0103d86:	83 c4 0c             	add    $0xc,%esp
c0103d89:	5e                   	pop    %esi
c0103d8a:	5f                   	pop    %edi
c0103d8b:	5d                   	pop    %ebp
c0103d8c:	c3                   	ret    
c0103d8d:	8d 76 00             	lea    0x0(%esi),%esi
c0103d90:	39 e8                	cmp    %ebp,%eax
c0103d92:	77 24                	ja     c0103db8 <__udivdi3+0x78>
c0103d94:	0f bd e8             	bsr    %eax,%ebp
c0103d97:	83 f5 1f             	xor    $0x1f,%ebp
c0103d9a:	75 3c                	jne    c0103dd8 <__udivdi3+0x98>
c0103d9c:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103da0:	39 34 24             	cmp    %esi,(%esp)
c0103da3:	0f 86 9f 00 00 00    	jbe    c0103e48 <__udivdi3+0x108>
c0103da9:	39 d0                	cmp    %edx,%eax
c0103dab:	0f 82 97 00 00 00    	jb     c0103e48 <__udivdi3+0x108>
c0103db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103db8:	31 d2                	xor    %edx,%edx
c0103dba:	31 c0                	xor    %eax,%eax
c0103dbc:	83 c4 0c             	add    $0xc,%esp
c0103dbf:	5e                   	pop    %esi
c0103dc0:	5f                   	pop    %edi
c0103dc1:	5d                   	pop    %ebp
c0103dc2:	c3                   	ret    
c0103dc3:	90                   	nop
c0103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103dc8:	89 f8                	mov    %edi,%eax
c0103dca:	f7 f1                	div    %ecx
c0103dcc:	31 d2                	xor    %edx,%edx
c0103dce:	83 c4 0c             	add    $0xc,%esp
c0103dd1:	5e                   	pop    %esi
c0103dd2:	5f                   	pop    %edi
c0103dd3:	5d                   	pop    %ebp
c0103dd4:	c3                   	ret    
c0103dd5:	8d 76 00             	lea    0x0(%esi),%esi
c0103dd8:	89 e9                	mov    %ebp,%ecx
c0103dda:	8b 3c 24             	mov    (%esp),%edi
c0103ddd:	d3 e0                	shl    %cl,%eax
c0103ddf:	89 c6                	mov    %eax,%esi
c0103de1:	b8 20 00 00 00       	mov    $0x20,%eax
c0103de6:	29 e8                	sub    %ebp,%eax
c0103de8:	89 c1                	mov    %eax,%ecx
c0103dea:	d3 ef                	shr    %cl,%edi
c0103dec:	89 e9                	mov    %ebp,%ecx
c0103dee:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0103df2:	8b 3c 24             	mov    (%esp),%edi
c0103df5:	09 74 24 08          	or     %esi,0x8(%esp)
c0103df9:	89 d6                	mov    %edx,%esi
c0103dfb:	d3 e7                	shl    %cl,%edi
c0103dfd:	89 c1                	mov    %eax,%ecx
c0103dff:	89 3c 24             	mov    %edi,(%esp)
c0103e02:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103e06:	d3 ee                	shr    %cl,%esi
c0103e08:	89 e9                	mov    %ebp,%ecx
c0103e0a:	d3 e2                	shl    %cl,%edx
c0103e0c:	89 c1                	mov    %eax,%ecx
c0103e0e:	d3 ef                	shr    %cl,%edi
c0103e10:	09 d7                	or     %edx,%edi
c0103e12:	89 f2                	mov    %esi,%edx
c0103e14:	89 f8                	mov    %edi,%eax
c0103e16:	f7 74 24 08          	divl   0x8(%esp)
c0103e1a:	89 d6                	mov    %edx,%esi
c0103e1c:	89 c7                	mov    %eax,%edi
c0103e1e:	f7 24 24             	mull   (%esp)
c0103e21:	39 d6                	cmp    %edx,%esi
c0103e23:	89 14 24             	mov    %edx,(%esp)
c0103e26:	72 30                	jb     c0103e58 <__udivdi3+0x118>
c0103e28:	8b 54 24 04          	mov    0x4(%esp),%edx
c0103e2c:	89 e9                	mov    %ebp,%ecx
c0103e2e:	d3 e2                	shl    %cl,%edx
c0103e30:	39 c2                	cmp    %eax,%edx
c0103e32:	73 05                	jae    c0103e39 <__udivdi3+0xf9>
c0103e34:	3b 34 24             	cmp    (%esp),%esi
c0103e37:	74 1f                	je     c0103e58 <__udivdi3+0x118>
c0103e39:	89 f8                	mov    %edi,%eax
c0103e3b:	31 d2                	xor    %edx,%edx
c0103e3d:	e9 7a ff ff ff       	jmp    c0103dbc <__udivdi3+0x7c>
c0103e42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103e48:	31 d2                	xor    %edx,%edx
c0103e4a:	b8 01 00 00 00       	mov    $0x1,%eax
c0103e4f:	e9 68 ff ff ff       	jmp    c0103dbc <__udivdi3+0x7c>
c0103e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103e58:	8d 47 ff             	lea    -0x1(%edi),%eax
c0103e5b:	31 d2                	xor    %edx,%edx
c0103e5d:	83 c4 0c             	add    $0xc,%esp
c0103e60:	5e                   	pop    %esi
c0103e61:	5f                   	pop    %edi
c0103e62:	5d                   	pop    %ebp
c0103e63:	c3                   	ret    
c0103e64:	66 90                	xchg   %ax,%ax
c0103e66:	66 90                	xchg   %ax,%ax
c0103e68:	66 90                	xchg   %ax,%ax
c0103e6a:	66 90                	xchg   %ax,%ax
c0103e6c:	66 90                	xchg   %ax,%ax
c0103e6e:	66 90                	xchg   %ax,%ax

c0103e70 <__umoddi3>:
c0103e70:	55                   	push   %ebp
c0103e71:	57                   	push   %edi
c0103e72:	56                   	push   %esi
c0103e73:	83 ec 14             	sub    $0x14,%esp
c0103e76:	8b 44 24 28          	mov    0x28(%esp),%eax
c0103e7a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103e7e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103e82:	89 c7                	mov    %eax,%edi
c0103e84:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e88:	8b 44 24 30          	mov    0x30(%esp),%eax
c0103e8c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103e90:	89 34 24             	mov    %esi,(%esp)
c0103e93:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103e97:	85 c0                	test   %eax,%eax
c0103e99:	89 c2                	mov    %eax,%edx
c0103e9b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103e9f:	75 17                	jne    c0103eb8 <__umoddi3+0x48>
c0103ea1:	39 fe                	cmp    %edi,%esi
c0103ea3:	76 4b                	jbe    c0103ef0 <__umoddi3+0x80>
c0103ea5:	89 c8                	mov    %ecx,%eax
c0103ea7:	89 fa                	mov    %edi,%edx
c0103ea9:	f7 f6                	div    %esi
c0103eab:	89 d0                	mov    %edx,%eax
c0103ead:	31 d2                	xor    %edx,%edx
c0103eaf:	83 c4 14             	add    $0x14,%esp
c0103eb2:	5e                   	pop    %esi
c0103eb3:	5f                   	pop    %edi
c0103eb4:	5d                   	pop    %ebp
c0103eb5:	c3                   	ret    
c0103eb6:	66 90                	xchg   %ax,%ax
c0103eb8:	39 f8                	cmp    %edi,%eax
c0103eba:	77 54                	ja     c0103f10 <__umoddi3+0xa0>
c0103ebc:	0f bd e8             	bsr    %eax,%ebp
c0103ebf:	83 f5 1f             	xor    $0x1f,%ebp
c0103ec2:	75 5c                	jne    c0103f20 <__umoddi3+0xb0>
c0103ec4:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0103ec8:	39 3c 24             	cmp    %edi,(%esp)
c0103ecb:	0f 87 e7 00 00 00    	ja     c0103fb8 <__umoddi3+0x148>
c0103ed1:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103ed5:	29 f1                	sub    %esi,%ecx
c0103ed7:	19 c7                	sbb    %eax,%edi
c0103ed9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103edd:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103ee1:	8b 44 24 08          	mov    0x8(%esp),%eax
c0103ee5:	8b 54 24 0c          	mov    0xc(%esp),%edx
c0103ee9:	83 c4 14             	add    $0x14,%esp
c0103eec:	5e                   	pop    %esi
c0103eed:	5f                   	pop    %edi
c0103eee:	5d                   	pop    %ebp
c0103eef:	c3                   	ret    
c0103ef0:	85 f6                	test   %esi,%esi
c0103ef2:	89 f5                	mov    %esi,%ebp
c0103ef4:	75 0b                	jne    c0103f01 <__umoddi3+0x91>
c0103ef6:	b8 01 00 00 00       	mov    $0x1,%eax
c0103efb:	31 d2                	xor    %edx,%edx
c0103efd:	f7 f6                	div    %esi
c0103eff:	89 c5                	mov    %eax,%ebp
c0103f01:	8b 44 24 04          	mov    0x4(%esp),%eax
c0103f05:	31 d2                	xor    %edx,%edx
c0103f07:	f7 f5                	div    %ebp
c0103f09:	89 c8                	mov    %ecx,%eax
c0103f0b:	f7 f5                	div    %ebp
c0103f0d:	eb 9c                	jmp    c0103eab <__umoddi3+0x3b>
c0103f0f:	90                   	nop
c0103f10:	89 c8                	mov    %ecx,%eax
c0103f12:	89 fa                	mov    %edi,%edx
c0103f14:	83 c4 14             	add    $0x14,%esp
c0103f17:	5e                   	pop    %esi
c0103f18:	5f                   	pop    %edi
c0103f19:	5d                   	pop    %ebp
c0103f1a:	c3                   	ret    
c0103f1b:	90                   	nop
c0103f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103f20:	8b 04 24             	mov    (%esp),%eax
c0103f23:	be 20 00 00 00       	mov    $0x20,%esi
c0103f28:	89 e9                	mov    %ebp,%ecx
c0103f2a:	29 ee                	sub    %ebp,%esi
c0103f2c:	d3 e2                	shl    %cl,%edx
c0103f2e:	89 f1                	mov    %esi,%ecx
c0103f30:	d3 e8                	shr    %cl,%eax
c0103f32:	89 e9                	mov    %ebp,%ecx
c0103f34:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f38:	8b 04 24             	mov    (%esp),%eax
c0103f3b:	09 54 24 04          	or     %edx,0x4(%esp)
c0103f3f:	89 fa                	mov    %edi,%edx
c0103f41:	d3 e0                	shl    %cl,%eax
c0103f43:	89 f1                	mov    %esi,%ecx
c0103f45:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103f49:	8b 44 24 10          	mov    0x10(%esp),%eax
c0103f4d:	d3 ea                	shr    %cl,%edx
c0103f4f:	89 e9                	mov    %ebp,%ecx
c0103f51:	d3 e7                	shl    %cl,%edi
c0103f53:	89 f1                	mov    %esi,%ecx
c0103f55:	d3 e8                	shr    %cl,%eax
c0103f57:	89 e9                	mov    %ebp,%ecx
c0103f59:	09 f8                	or     %edi,%eax
c0103f5b:	8b 7c 24 10          	mov    0x10(%esp),%edi
c0103f5f:	f7 74 24 04          	divl   0x4(%esp)
c0103f63:	d3 e7                	shl    %cl,%edi
c0103f65:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103f69:	89 d7                	mov    %edx,%edi
c0103f6b:	f7 64 24 08          	mull   0x8(%esp)
c0103f6f:	39 d7                	cmp    %edx,%edi
c0103f71:	89 c1                	mov    %eax,%ecx
c0103f73:	89 14 24             	mov    %edx,(%esp)
c0103f76:	72 2c                	jb     c0103fa4 <__umoddi3+0x134>
c0103f78:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c0103f7c:	72 22                	jb     c0103fa0 <__umoddi3+0x130>
c0103f7e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103f82:	29 c8                	sub    %ecx,%eax
c0103f84:	19 d7                	sbb    %edx,%edi
c0103f86:	89 e9                	mov    %ebp,%ecx
c0103f88:	89 fa                	mov    %edi,%edx
c0103f8a:	d3 e8                	shr    %cl,%eax
c0103f8c:	89 f1                	mov    %esi,%ecx
c0103f8e:	d3 e2                	shl    %cl,%edx
c0103f90:	89 e9                	mov    %ebp,%ecx
c0103f92:	d3 ef                	shr    %cl,%edi
c0103f94:	09 d0                	or     %edx,%eax
c0103f96:	89 fa                	mov    %edi,%edx
c0103f98:	83 c4 14             	add    $0x14,%esp
c0103f9b:	5e                   	pop    %esi
c0103f9c:	5f                   	pop    %edi
c0103f9d:	5d                   	pop    %ebp
c0103f9e:	c3                   	ret    
c0103f9f:	90                   	nop
c0103fa0:	39 d7                	cmp    %edx,%edi
c0103fa2:	75 da                	jne    c0103f7e <__umoddi3+0x10e>
c0103fa4:	8b 14 24             	mov    (%esp),%edx
c0103fa7:	89 c1                	mov    %eax,%ecx
c0103fa9:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c0103fad:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0103fb1:	eb cb                	jmp    c0103f7e <__umoddi3+0x10e>
c0103fb3:	90                   	nop
c0103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103fb8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c0103fbc:	0f 82 0f ff ff ff    	jb     c0103ed1 <__umoddi3+0x61>
c0103fc2:	e9 1a ff ff ff       	jmp    c0103ee1 <__umoddi3+0x71>
