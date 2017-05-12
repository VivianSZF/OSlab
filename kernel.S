
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0100000 <do_syscall>:
void sys_fork(void);
uint32_t sys_getpid(void);
void sys_exit(int suc);
void sys_sleep(int time);

void do_syscall(struct TrapFrame *tf) {
c0100000:	55                   	push   %ebp
c0100001:	89 e5                	mov    %esp,%ebp
c0100003:	83 ec 28             	sub    $0x28,%esp
	//printk("%d\n",tf->eax);
	switch(tf->eax) {
c0100006:	8b 45 08             	mov    0x8(%ebp),%eax
c0100009:	8b 40 1c             	mov    0x1c(%eax),%eax
c010000c:	83 f8 08             	cmp    $0x8,%eax
c010000f:	0f 87 ac 00 00 00    	ja     c01000c1 <do_syscall+0xc1>
c0100015:	8b 04 85 24 3a 10 c0 	mov    -0x3fefc5dc(,%eax,4),%eax
c010001c:	ff e0                	jmp    *%eax
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c010001e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100021:	8b 40 10             	mov    0x10(%eax),%eax
c0100024:	89 04 24             	mov    %eax,(%esp)
c0100027:	e8 a1 09 00 00       	call   c01009cd <sys_pr>
c010002c:	89 c2                	mov    %eax,%edx
c010002e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100031:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100034:	e9 b8 00 00 00       	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_time:
			tf->eax=sys_time();
c0100039:	e8 da 00 00 00       	call   c0100118 <sys_time>
c010003e:	89 c2                	mov    %eax,%edx
c0100040:	8b 45 08             	mov    0x8(%ebp),%eax
c0100043:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100046:	e9 a6 00 00 00       	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
c010004b:	e8 d2 00 00 00       	call   c0100122 <sys_readkey>
c0100050:	89 c2                	mov    %eax,%edx
c0100052:	8b 45 08             	mov    0x8(%ebp),%eax
c0100055:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c0100058:	e9 94 00 00 00       	jmp    c01000f1 <do_syscall+0xf1>
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
c010007e:	e8 21 27 00 00       	call   c01027a4 <sys_write>
c0100083:	89 c2                	mov    %eax,%edx
c0100085:	8b 45 08             	mov    0x8(%ebp),%eax
c0100088:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008b:	eb 64                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_fork:
			sys_fork();
c010008d:	e8 d0 14 00 00       	call   c0101562 <sys_fork>
			break;
c0100092:	eb 5d                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_getpid:
			tf->eax=sys_getpid();
c0100094:	e8 19 15 00 00       	call   c01015b2 <sys_getpid>
c0100099:	8b 55 08             	mov    0x8(%ebp),%edx
c010009c:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c010009f:	eb 50                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_exit:
			sys_exit(tf->ebx);
c01000a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01000a4:	8b 40 10             	mov    0x10(%eax),%eax
c01000a7:	89 04 24             	mov    %eax,(%esp)
c01000aa:	e8 10 15 00 00       	call   c01015bf <sys_exit>
			break;
c01000af:	eb 40                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01000b4:	8b 40 10             	mov    0x10(%eax),%eax
c01000b7:	89 04 24             	mov    %eax,(%esp)
c01000ba:	e8 57 16 00 00       	call   c0101716 <sys_sleep>
			break;
c01000bf:	eb 30                	jmp    c01000f1 <do_syscall+0xf1>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c01000c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01000c4:	8b 50 38             	mov    0x38(%eax),%edx
c01000c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ca:	8b 40 1c             	mov    0x1c(%eax),%eax
c01000cd:	89 54 24 10          	mov    %edx,0x10(%esp)
c01000d1:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01000d5:	c7 44 24 08 d8 39 10 	movl   $0xc01039d8,0x8(%esp)
c01000dc:	c0 
c01000dd:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
c01000e4:	00 
c01000e5:	c7 04 24 05 3a 10 c0 	movl   $0xc0103a05,(%esp)
c01000ec:	e8 13 26 00 00       	call   c0102704 <_panic>
 	}
} 
c01000f1:	c9                   	leave  
c01000f2:	c3                   	ret    

c01000f3 <enable_interrupt>:
	asm volatile("lidt (%0)" : : "r"(data));
}

/* 打开外部中断 */
static inline void
enable_interrupt(void) {
c01000f3:	55                   	push   %ebp
c01000f4:	89 e5                	mov    %esp,%ebp
	asm volatile("sti");
c01000f6:	fb                   	sti    
}
c01000f7:	5d                   	pop    %ebp
c01000f8:	c3                   	ret    

c01000f9 <timer_event>:
void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
c01000f9:	55                   	push   %ebp
c01000fa:	89 e5                	mov    %esp,%ebp
	tick++;
c01000fc:	a1 00 10 11 c0       	mov    0xc0111000,%eax
c0100101:	83 c0 01             	add    $0x1,%eax
c0100104:	a3 00 10 11 c0       	mov    %eax,0xc0111000
}
c0100109:	5d                   	pop    %ebp
c010010a:	c3                   	ret    

c010010b <keyboard_event>:
static int last_code = -1;
void keyboard_event(int code)
{
c010010b:	55                   	push   %ebp
c010010c:	89 e5                	mov    %esp,%ebp
	last_code = code;
c010010e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100111:	a3 00 60 10 c0       	mov    %eax,0xc0106000
}
c0100116:	5d                   	pop    %ebp
c0100117:	c3                   	ret    

c0100118 <sys_time>:
int sys_time(void)
{
c0100118:	55                   	push   %ebp
c0100119:	89 e5                	mov    %esp,%ebp
	return tick;
c010011b:	a1 00 10 11 c0       	mov    0xc0111000,%eax
}
c0100120:	5d                   	pop    %ebp
c0100121:	c3                   	ret    

c0100122 <sys_readkey>:
int sys_readkey(void)
{
c0100122:	55                   	push   %ebp
c0100123:	89 e5                	mov    %esp,%ebp
c0100125:	83 ec 10             	sub    $0x10,%esp
	int code = last_code;
c0100128:	a1 00 60 10 c0       	mov    0xc0106000,%eax
c010012d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	last_code = -1;
c0100130:	c7 05 00 60 10 c0 ff 	movl   $0xffffffff,0xc0106000
c0100137:	ff ff ff 
	return code;
c010013a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c010013d:	c9                   	leave  
c010013e:	c3                   	ret    

c010013f <main>:

int main()
{
c010013f:	55                   	push   %ebp
c0100140:	89 e5                	mov    %esp,%ebp
c0100142:	83 e4 f0             	and    $0xfffffff0,%esp
c0100145:	83 ec 10             	sub    $0x10,%esp
	page_init();
c0100148:	e8 d3 17 00 00       	call   c0101920 <page_init>
	//printk("here");
	init_segment();
c010014d:	e8 f2 24 00 00       	call   c0102644 <init_segment>
	pcb_init();
c0100152:	e8 2d 0c 00 00       	call   c0100d84 <pcb_init>
	//printk("here");
	init_serial();
c0100157:	e8 93 08 00 00       	call   c01009ef <init_serial>
	init_video();
c010015c:	e8 5c 07 00 00       	call   c01008bd <init_video>
	init_timer();
c0100161:	e8 7d 09 00 00       	call   c0100ae3 <init_timer>
	init_idt();
c0100166:	e8 73 02 00 00       	call   c01003de <init_idt>
	init_intr();
c010016b:	e8 31 00 00 00       	call   c01001a1 <init_intr>
	
	//printk("here");

	set_timer_intr_handler(timer_event);
c0100170:	c7 04 24 f9 00 10 c0 	movl   $0xc01000f9,(%esp)
c0100177:	e8 80 05 00 00       	call   c01006fc <set_timer_intr_handler>
	set_keyboard_intr_handler(keyboard_event);
c010017c:	c7 04 24 0b 01 10 c0 	movl   $0xc010010b,(%esp)
c0100183:	e8 81 05 00 00       	call   c0100709 <set_keyboard_intr_handler>
	//printk("here");
	pcb_new();
c0100188:	e8 39 10 00 00       	call   c01011c6 <pcb_new>
	//PCB* p=pcb_new();
	enable_interrupt();
c010018d:	e8 61 ff ff ff       	call   c01000f3 <enable_interrupt>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0100192:	f4                   	hlt    
	hlt();
	printk("we are here");
c0100193:	c7 04 24 48 3a 10 c0 	movl   $0xc0103a48,(%esp)
c010019a:	e8 94 26 00 00       	call   c0102833 <printk>
	//to_user(p);
	//printk("here");
	while(1);
c010019f:	eb fe                	jmp    c010019f <main+0x60>

c01001a1 <init_intr>:
#define IRQ_SLAVE	2

/* 初始�?259中断控制器：
 * 硬件中断IRQ�?2号开始，自动发送EOI */
void
init_intr(void) {
c01001a1:	55                   	push   %ebp
c01001a2:	89 e5                	mov    %esp,%ebp
c01001a4:	83 ec 70             	sub    $0x70,%esp
c01001a7:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
c01001ae:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01001b2:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01001b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01001b9:	ee                   	out    %al,(%dx)
c01001ba:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
c01001c1:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
c01001c5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c01001c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01001cc:	ee                   	out    %al,(%dx)
c01001cd:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c01001d4:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
c01001d8:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01001dc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01001df:	ee                   	out    %al,(%dx)
c01001e0:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
c01001e7:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
c01001eb:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01001ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01001f2:	ee                   	out    %al,(%dx)
c01001f3:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
c01001fa:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
c01001fe:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100202:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100205:	ee                   	out    %al,(%dx)
c0100206:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
c010020d:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
c0100211:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100215:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100218:	ee                   	out    %al,(%dx)
c0100219:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
c0100220:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
c0100224:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100228:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010022b:	ee                   	out    %al,(%dx)
c010022c:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
c0100233:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
c0100237:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010023b:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c010023e:	ee                   	out    %al,(%dx)
c010023f:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
c0100246:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
c010024a:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c010024e:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0100251:	ee                   	out    %al,(%dx)
c0100252:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
c0100259:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
c010025d:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
c0100261:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0100264:	ee                   	out    %al,(%dx)
c0100265:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
c010026c:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
c0100270:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
c0100274:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100277:	ee                   	out    %al,(%dx)
c0100278:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
c010027f:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
c0100283:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
c0100287:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010028a:	ee                   	out    %al,(%dx)
c010028b:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
c0100292:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
c0100296:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
c010029a:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010029d:	ee                   	out    %al,(%dx)
c010029e:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
c01002a5:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
c01002a9:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
c01002ad:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01002b0:	ee                   	out    %al,(%dx)
	outb(IO_PIC1, 0x68);             /* clear specific mask */
	outb(IO_PIC1, 0x0a);             /* read IRR by default */

	outb(IO_PIC2, 0x68);             /* OCW3 */
	outb(IO_PIC2, 0x0a);             /* OCW3 */
}
c01002b1:	c9                   	leave  
c01002b2:	c3                   	ret    

c01002b3 <save_idt>:
	asm volatile("hlt");
}

/* 修改IDRT */
static inline void
save_idt(void *addr, uint32_t size) {
c01002b3:	55                   	push   %ebp
c01002b4:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c01002b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01002b9:	83 e8 01             	sub    $0x1,%eax
c01002bc:	66 a3 04 10 11 c0    	mov    %ax,0xc0111004
	data[1] = (uint32_t)addr;
c01002c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01002c5:	66 a3 06 10 11 c0    	mov    %ax,0xc0111006
	data[2] = ((uint32_t)addr) >> 16;
c01002cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01002ce:	c1 e8 10             	shr    $0x10,%eax
c01002d1:	66 a3 08 10 11 c0    	mov    %ax,0xc0111008
	asm volatile("lidt (%0)" : : "r"(data));
c01002d7:	b8 04 10 11 c0       	mov    $0xc0111004,%eax
c01002dc:	0f 01 18             	lidtl  (%eax)
}
c01002df:	5d                   	pop    %ebp
c01002e0:	c3                   	ret    

c01002e1 <set_intr>:
/* IDT表的内容 */
struct Gatedesc idt[NR_IRQ];

/* 初始化一个中断门(interrupt gate) */
static void
set_intr(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c01002e1:	55                   	push   %ebp
c01002e2:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c01002e4:	8b 45 10             	mov    0x10(%ebp),%eax
c01002e7:	89 c2                	mov    %eax,%edx
c01002e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01002ec:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c01002ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01002f2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01002f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01002fc:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100300:	8b 45 08             	mov    0x8(%ebp),%eax
c0100303:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = INTERRUPT_GATE_32;
c0100307:	8b 45 08             	mov    0x8(%ebp),%eax
c010030a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010030e:	83 e2 f0             	and    $0xfffffff0,%edx
c0100311:	83 ca 0e             	or     $0xe,%edx
c0100314:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c0100317:	8b 45 08             	mov    0x8(%ebp),%eax
c010031a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010031e:	83 e2 ef             	and    $0xffffffef,%edx
c0100321:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c0100324:	8b 45 14             	mov    0x14(%ebp),%eax
c0100327:	83 e0 03             	and    $0x3,%eax
c010032a:	89 c2                	mov    %eax,%edx
c010032c:	8b 45 08             	mov    0x8(%ebp),%eax
c010032f:	83 e2 03             	and    $0x3,%edx
c0100332:	89 d1                	mov    %edx,%ecx
c0100334:	c1 e1 05             	shl    $0x5,%ecx
c0100337:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010033b:	83 e2 9f             	and    $0xffffff9f,%edx
c010033e:	09 ca                	or     %ecx,%edx
c0100340:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c0100343:	8b 45 08             	mov    0x8(%ebp),%eax
c0100346:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010034a:	83 ca 80             	or     $0xffffff80,%edx
c010034d:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100350:	8b 45 10             	mov    0x10(%ebp),%eax
c0100353:	c1 e8 10             	shr    $0x10,%eax
c0100356:	89 c2                	mov    %eax,%edx
c0100358:	8b 45 08             	mov    0x8(%ebp),%eax
c010035b:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c010035f:	5d                   	pop    %ebp
c0100360:	c3                   	ret    

c0100361 <set_trap>:

/* 初始化一个陷阱门(trap gate) */
static void
set_trap(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100361:	55                   	push   %ebp
c0100362:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c0100364:	8b 45 10             	mov    0x10(%ebp),%eax
c0100367:	89 c2                	mov    %eax,%edx
c0100369:	8b 45 08             	mov    0x8(%ebp),%eax
c010036c:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c010036f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100372:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100379:	8b 45 08             	mov    0x8(%ebp),%eax
c010037c:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100380:	8b 45 08             	mov    0x8(%ebp),%eax
c0100383:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = TRAP_GATE_32;
c0100387:	8b 45 08             	mov    0x8(%ebp),%eax
c010038a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010038e:	83 ca 0f             	or     $0xf,%edx
c0100391:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c0100394:	8b 45 08             	mov    0x8(%ebp),%eax
c0100397:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010039b:	83 e2 ef             	and    $0xffffffef,%edx
c010039e:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c01003a1:	8b 45 14             	mov    0x14(%ebp),%eax
c01003a4:	83 e0 03             	and    $0x3,%eax
c01003a7:	89 c2                	mov    %eax,%edx
c01003a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01003ac:	83 e2 03             	and    $0x3,%edx
c01003af:	89 d1                	mov    %edx,%ecx
c01003b1:	c1 e1 05             	shl    $0x5,%ecx
c01003b4:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003b8:	83 e2 9f             	and    $0xffffff9f,%edx
c01003bb:	09 ca                	or     %ecx,%edx
c01003bd:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c01003c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01003c3:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003c7:	83 ca 80             	or     $0xffffff80,%edx
c01003ca:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c01003cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01003d0:	c1 e8 10             	shr    $0x10,%eax
c01003d3:	89 c2                	mov    %eax,%edx
c01003d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d8:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c01003dc:	5d                   	pop    %ebp
c01003dd:	c3                   	ret    

c01003de <init_idt>:
void vec13();
void vec14();
void vecsys();
void irq_empty();

void init_idt() {
c01003de:	55                   	push   %ebp
c01003df:	89 e5                	mov    %esp,%ebp
c01003e1:	83 ec 20             	sub    $0x20,%esp
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01003e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01003eb:	eb 31                	jmp    c010041e <init_idt+0x40>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
c01003ed:	b8 04 29 10 c0       	mov    $0xc0102904,%eax
c01003f2:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01003f5:	c1 e2 03             	shl    $0x3,%edx
c01003f8:	81 c2 20 4f 16 c0    	add    $0xc0164f20,%edx
c01003fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100405:	00 
c0100406:	89 44 24 08          	mov    %eax,0x8(%esp)
c010040a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100411:	00 
c0100412:	89 14 24             	mov    %edx,(%esp)
c0100415:	e8 47 ff ff ff       	call   c0100361 <set_trap>
void irq_empty();

void init_idt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c010041a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010041e:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
c0100425:	7e c6                	jle    c01003ed <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
	}

	/* 设置异常的中断处�?*/
	set_trap(idt + 0, SEG_KERNEL_CODE, (uint32_t)vec0, DPL_KERNEL);
c0100427:	b8 59 28 10 c0       	mov    $0xc0102859,%eax
c010042c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100433:	00 
c0100434:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100438:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010043f:	00 
c0100440:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c0100447:	e8 15 ff ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c010044c:	b8 62 28 10 c0       	mov    $0xc0102862,%eax
c0100451:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100458:	00 
c0100459:	89 44 24 08          	mov    %eax,0x8(%esp)
c010045d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100464:	00 
c0100465:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c010046c:	e8 f0 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100471:	b8 6b 28 10 c0       	mov    $0xc010286b,%eax
c0100476:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010047d:	00 
c010047e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100482:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100489:	00 
c010048a:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c0100491:	e8 cb fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c0100496:	b8 74 28 10 c0       	mov    $0xc0102874,%eax
c010049b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004a2:	00 
c01004a3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004a7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004ae:	00 
c01004af:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c01004b6:	e8 a6 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c01004bb:	b8 7d 28 10 c0       	mov    $0xc010287d,%eax
c01004c0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004c7:	00 
c01004c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004cc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004d3:	00 
c01004d4:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c01004db:	e8 81 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c01004e0:	b8 86 28 10 c0       	mov    $0xc0102886,%eax
c01004e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004ec:	00 
c01004ed:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004f1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004f8:	00 
c01004f9:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c0100500:	e8 5c fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c0100505:	b8 8f 28 10 c0       	mov    $0xc010288f,%eax
c010050a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100511:	00 
c0100512:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100516:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010051d:	00 
c010051e:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c0100525:	e8 37 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c010052a:	b8 98 28 10 c0       	mov    $0xc0102898,%eax
c010052f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100536:	00 
c0100537:	89 44 24 08          	mov    %eax,0x8(%esp)
c010053b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100542:	00 
c0100543:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c010054a:	e8 12 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c010054f:	b8 a1 28 10 c0       	mov    $0xc01028a1,%eax
c0100554:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010055b:	00 
c010055c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100560:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100567:	00 
c0100568:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c010056f:	e8 ed fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c0100574:	b8 a8 28 10 c0       	mov    $0xc01028a8,%eax
c0100579:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100580:	00 
c0100581:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100585:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010058c:	00 
c010058d:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c0100594:	e8 c8 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c0100599:	b8 b1 28 10 c0       	mov    $0xc01028b1,%eax
c010059e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005a5:	00 
c01005a6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005aa:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005b1:	00 
c01005b2:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c01005b9:	e8 a3 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c01005be:	b8 b8 28 10 c0       	mov    $0xc01028b8,%eax
c01005c3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ca:	00 
c01005cb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005cf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005d6:	00 
c01005d7:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c01005de:	e8 7e fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c01005e3:	b8 bf 28 10 c0       	mov    $0xc01028bf,%eax
c01005e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ef:	00 
c01005f0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005f4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005fb:	00 
c01005fc:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c0100603:	e8 59 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c0100608:	b8 c6 28 10 c0       	mov    $0xc01028c6,%eax
c010060d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100614:	00 
c0100615:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100619:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100620:	00 
c0100621:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c0100628:	e8 34 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c010062d:	b8 cd 28 10 c0       	mov    $0xc01028cd,%eax
c0100632:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100639:	00 
c010063a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010063e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100645:	00 
c0100646:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c010064d:	e8 0f fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100652:	b8 d4 28 10 c0       	mov    $0xc01028d4,%eax
c0100657:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c010065e:	00 
c010065f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100663:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010066a:	00 
c010066b:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c0100672:	e8 ea fc ff ff       	call   c0100361 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c0100677:	b8 e0 28 10 c0       	mov    $0xc01028e0,%eax
c010067c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100683:	00 
c0100684:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100688:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010068f:	00 
c0100690:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c0100697:	e8 45 fc ff ff       	call   c01002e1 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c010069c:	b8 ec 28 10 c0       	mov    $0xc01028ec,%eax
c01006a1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006a8:	00 
c01006a9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ad:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006b4:	00 
c01006b5:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c01006bc:	e8 20 fc ff ff       	call   c01002e1 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c01006c1:	b8 f8 28 10 c0       	mov    $0xc01028f8,%eax
c01006c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006cd:	00 
c01006ce:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006d2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006d9:	00 
c01006da:	c7 04 24 90 50 16 c0 	movl   $0xc0165090,(%esp)
c01006e1:	e8 fb fb ff ff       	call   c01002e1 <set_intr>
	 * x86.h提供了相关内联汇编的支持
	 * 然后将hlt()删除
	 * 
	 * */
	
	save_idt(idt, sizeof(idt));
c01006e6:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
c01006ed:	00 
c01006ee:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c01006f5:	e8 b9 fb ff ff       	call   c01002b3 <save_idt>
}
c01006fa:	c9                   	leave  
c01006fb:	c3                   	ret    

c01006fc <set_timer_intr_handler>:

static void (*do_timer)(void);
static void (*do_keyboard)(int);

void
set_timer_intr_handler( void (*ptr)(void) ) {
c01006fc:	55                   	push   %ebp
c01006fd:	89 e5                	mov    %esp,%ebp
	do_timer = ptr;
c01006ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0100702:	a3 0c 10 11 c0       	mov    %eax,0xc011100c
}
c0100707:	5d                   	pop    %ebp
c0100708:	c3                   	ret    

c0100709 <set_keyboard_intr_handler>:
void
set_keyboard_intr_handler( void (*ptr)(int) ) {
c0100709:	55                   	push   %ebp
c010070a:	89 e5                	mov    %esp,%ebp
	do_keyboard = ptr;
c010070c:	8b 45 08             	mov    0x8(%ebp),%eax
c010070f:	a3 10 10 11 c0       	mov    %eax,0xc0111010
}
c0100714:	5d                   	pop    %ebp
c0100715:	c3                   	ret    

c0100716 <irq_handle>:

/* TrapFrame的定义在include/memory.h
 * 请仔细理解这段程序的含义，这些内容将在后续的实验中被反复使用�?*/
void
irq_handle(struct TrapFrame *tf) {
c0100716:	55                   	push   %ebp
c0100717:	89 e5                	mov    %esp,%ebp
c0100719:	83 ec 48             	sub    $0x48,%esp
	pcbnow->tf=tf;
c010071c:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0100721:	8b 55 08             	mov    0x8(%ebp),%edx
c0100724:	89 10                	mov    %edx,(%eax)
	if (tf->irq == 0x80) {
c0100726:	8b 45 08             	mov    0x8(%ebp),%eax
c0100729:	8b 40 30             	mov    0x30(%eax),%eax
c010072c:	3d 80 00 00 00       	cmp    $0x80,%eax
c0100731:	75 10                	jne    c0100743 <irq_handle+0x2d>
		do_syscall(tf);
c0100733:	8b 45 08             	mov    0x8(%ebp),%eax
c0100736:	89 04 24             	mov    %eax,(%esp)
c0100739:	e8 c2 f8 ff ff       	call   c0100000 <do_syscall>
c010073e:	e9 78 01 00 00       	jmp    c01008bb <irq_handle+0x1a5>
	}
	else if(tf->irq < 1000) {
c0100743:	8b 45 08             	mov    0x8(%ebp),%eax
c0100746:	8b 40 30             	mov    0x30(%eax),%eax
c0100749:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c010074e:	7f 73                	jg     c01007c3 <irq_handle+0xad>
		if(tf->irq == -1) {
c0100750:	8b 45 08             	mov    0x8(%ebp),%eax
c0100753:	8b 40 30             	mov    0x30(%eax),%eax
c0100756:	83 f8 ff             	cmp    $0xffffffff,%eax
c0100759:	75 1e                	jne    c0100779 <irq_handle+0x63>
			printk("%s, %d: Unhandled exception!\n", __FUNCTION__, __LINE__);
c010075b:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
c0100762:	00 
c0100763:	c7 44 24 04 c6 3a 10 	movl   $0xc0103ac6,0x4(%esp)
c010076a:	c0 
c010076b:	c7 04 24 54 3a 10 c0 	movl   $0xc0103a54,(%esp)
c0100772:	e8 bc 20 00 00       	call   c0102833 <printk>
c0100777:	eb 26                	jmp    c010079f <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100779:	8b 45 08             	mov    0x8(%ebp),%eax
c010077c:	8b 40 30             	mov    0x30(%eax),%eax
c010077f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100783:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c010078a:	00 
c010078b:	c7 44 24 04 c6 3a 10 	movl   $0xc0103ac6,0x4(%esp)
c0100792:	c0 
c0100793:	c7 04 24 74 3a 10 c0 	movl   $0xc0103a74,(%esp)
c010079a:	e8 94 20 00 00       	call   c0102833 <printk>
		}
		assert(0);
c010079f:	c7 44 24 0c 97 3a 10 	movl   $0xc0103a97,0xc(%esp)
c01007a6:	c0 
c01007a7:	c7 44 24 08 99 3a 10 	movl   $0xc0103a99,0x8(%esp)
c01007ae:	c0 
c01007af:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c01007b6:	00 
c01007b7:	c7 04 24 ae 3a 10 c0 	movl   $0xc0103aae,(%esp)
c01007be:	e8 41 1f 00 00       	call   c0102704 <_panic>
	}

	else if (tf->irq == 1000) {
c01007c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01007c6:	8b 40 30             	mov    0x30(%eax),%eax
c01007c9:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c01007ce:	75 11                	jne    c01007e1 <irq_handle+0xcb>
		do_timer();
c01007d0:	a1 0c 10 11 c0       	mov    0xc011100c,%eax
c01007d5:	ff d0                	call   *%eax
		schedule();
c01007d7:	e8 3e 1b 00 00       	call   c010231a <schedule>
c01007dc:	e9 da 00 00 00       	jmp    c01008bb <irq_handle+0x1a5>
	} else if (tf->irq == 1001) {
c01007e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01007e4:	8b 40 30             	mov    0x30(%eax),%eax
c01007e7:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c01007ec:	75 76                	jne    c0100864 <irq_handle+0x14e>
c01007ee:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01007f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01007f8:	89 c2                	mov    %eax,%edx
c01007fa:	ec                   	in     (%dx),%al
c01007fb:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c01007fe:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c0100802:	0f b6 c0             	movzbl %al,%eax
c0100805:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100808:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c010080f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100812:	89 c2                	mov    %eax,%edx
c0100814:	ec                   	in     (%dx),%al
c0100815:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c0100818:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c010081c:	0f b6 c0             	movzbl %al,%eax
c010081f:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c0100822:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100825:	83 c8 80             	or     $0xffffff80,%eax
c0100828:	0f b6 c0             	movzbl %al,%eax
c010082b:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c0100832:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100835:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100839:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010083c:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c010083d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100840:	0f b6 c0             	movzbl %al,%eax
c0100843:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c010084a:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010084d:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100851:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100854:	ee                   	out    %al,(%dx)
		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c0100855:	a1 10 10 11 c0       	mov    0xc0111010,%eax
c010085a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010085d:	89 14 24             	mov    %edx,(%esp)
c0100860:	ff d0                	call   *%eax
c0100862:	eb 57                	jmp    c01008bb <irq_handle+0x1a5>
	}else if(tf->irq==1014){
c0100864:	8b 45 08             	mov    0x8(%ebp),%eax
c0100867:	8b 40 30             	mov    0x30(%eax),%eax
c010086a:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c010086f:	74 4a                	je     c01008bb <irq_handle+0x1a5>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100871:	8b 45 08             	mov    0x8(%ebp),%eax
c0100874:	8b 40 30             	mov    0x30(%eax),%eax
c0100877:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010087b:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
c0100882:	00 
c0100883:	c7 44 24 04 c6 3a 10 	movl   $0xc0103ac6,0x4(%esp)
c010088a:	c0 
c010088b:	c7 04 24 74 3a 10 c0 	movl   $0xc0103a74,(%esp)
c0100892:	e8 9c 1f 00 00       	call   c0102833 <printk>
		assert(0);
c0100897:	c7 44 24 0c 97 3a 10 	movl   $0xc0103a97,0xc(%esp)
c010089e:	c0 
c010089f:	c7 44 24 08 99 3a 10 	movl   $0xc0103a99,0x8(%esp)
c01008a6:	c0 
c01008a7:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01008ae:	00 
c01008af:	c7 04 24 ae 3a 10 c0 	movl   $0xc0103aae,(%esp)
c01008b6:	e8 49 1e 00 00       	call   c0102704 <_panic>
	}
}
c01008bb:	c9                   	leave  
c01008bc:	c3                   	ret    

c01008bd <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c01008bd:	55                   	push   %ebp
c01008be:	89 e5                	mov    %esp,%ebp
c01008c0:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c01008c3:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008ca:	00 
c01008cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008d2:	00 
c01008d3:	c7 04 24 20 10 11 c0 	movl   $0xc0111020,(%esp)
c01008da:	e8 36 23 00 00       	call   c0102c15 <memset>
	memset(vref, 0, SCR_SIZE);
c01008df:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008e6:	00 
c01008e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008ee:	00 
c01008ef:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01008f6:	e8 1a 23 00 00       	call   c0102c15 <memset>
}
c01008fb:	c9                   	leave  
c01008fc:	c3                   	ret    

c01008fd <prepare_buffer>:

void prepare_buffer(void) {
c01008fd:	55                   	push   %ebp
c01008fe:	89 e5                	mov    %esp,%ebp
c0100900:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c0100903:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010090a:	00 
c010090b:	c7 44 24 04 20 10 11 	movl   $0xc0111020,0x4(%esp)
c0100912:	c0 
c0100913:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c010091a:	e8 d9 22 00 00       	call   c0102bf8 <memcpy>
#endif
	vmem = vbuf;
c010091f:	c7 05 04 60 10 c0 20 	movl   $0xc0111020,0xc0106004
c0100926:	10 11 c0 
	memset(vmem, 0, SCR_SIZE);
c0100929:	a1 04 60 10 c0       	mov    0xc0106004,%eax
c010092e:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100935:	00 
c0100936:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010093d:	00 
c010093e:	89 04 24             	mov    %eax,(%esp)
c0100941:	e8 cf 22 00 00       	call   c0102c15 <memset>
}
c0100946:	c9                   	leave  
c0100947:	c3                   	ret    

c0100948 <display_buffer>:

void display_buffer(void) {
c0100948:	55                   	push   %ebp
c0100949:	89 e5                	mov    %esp,%ebp
c010094b:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c010094e:	c7 45 f8 20 10 11 c0 	movl   $0xc0111020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c0100955:	c7 45 f4 20 0a 12 c0 	movl   $0xc0120a20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c010095c:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c0100963:	c7 05 04 60 10 c0 00 	movl   $0xa0000,0xc0106004
c010096a:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c010096d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100974:	eb 4c                	jmp    c01009c2 <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c0100976:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100979:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100980:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100983:	01 d0                	add    %edx,%eax
c0100985:	8b 10                	mov    (%eax),%edx
c0100987:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010098a:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100991:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100994:	01 c8                	add    %ecx,%eax
c0100996:	8b 00                	mov    (%eax),%eax
c0100998:	39 c2                	cmp    %eax,%edx
c010099a:	74 22                	je     c01009be <display_buffer+0x76>
			mem[i] = buf[i];
c010099c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010099f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01009a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01009a9:	01 c2                	add    %eax,%edx
c01009ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01009ae:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c01009b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01009b8:	01 c8                	add    %ecx,%eax
c01009ba:	8b 00                	mov    (%eax),%eax
c01009bc:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c01009be:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01009c2:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c01009c9:	7e ab                	jle    c0100976 <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c01009cb:	c9                   	leave  
c01009cc:	c3                   	ret    

c01009cd <sys_pr>:

void sys_pr(void *src)
{
c01009cd:	55                   	push   %ebp
c01009ce:	89 e5                	mov    %esp,%ebp
c01009d0:	57                   	push   %edi
c01009d1:	56                   	push   %esi
c01009d2:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c01009d3:	8b 1d 04 60 10 c0    	mov    0xc0106004,%ebx
c01009d9:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c01009de:	8b 55 08             	mov    0x8(%ebp),%edx
c01009e1:	89 c1                	mov    %eax,%ecx
c01009e3:	89 d6                	mov    %edx,%esi
c01009e5:	89 df                	mov    %ebx,%edi
c01009e7:	fc                   	cld    
c01009e8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c01009ea:	5b                   	pop    %ebx
c01009eb:	5e                   	pop    %esi
c01009ec:	5f                   	pop    %edi
c01009ed:	5d                   	pop    %ebp
c01009ee:	c3                   	ret    

c01009ef <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c01009ef:	55                   	push   %ebp
c01009f0:	89 e5                	mov    %esp,%ebp
c01009f2:	83 ec 40             	sub    $0x40,%esp
c01009f5:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c01009fc:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c0100a00:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100a04:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100a07:	ee                   	out    %al,(%dx)
c0100a08:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c0100a0f:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c0100a13:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100a17:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a1a:	ee                   	out    %al,(%dx)
c0100a1b:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c0100a22:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0100a26:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100a2a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100a2d:	ee                   	out    %al,(%dx)
c0100a2e:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c0100a35:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c0100a39:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100a3d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100a40:	ee                   	out    %al,(%dx)
c0100a41:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c0100a48:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100a4c:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100a50:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100a53:	ee                   	out    %al,(%dx)
c0100a54:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100a5b:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100a5f:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100a63:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100a66:	ee                   	out    %al,(%dx)
c0100a67:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100a6e:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100a72:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100a76:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100a79:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100a7a:	c9                   	leave  
c0100a7b:	c3                   	ret    

c0100a7c <serial_idle>:

static inline int serial_idle(void) {
c0100a7c:	55                   	push   %ebp
c0100a7d:	89 e5                	mov    %esp,%ebp
c0100a7f:	83 ec 10             	sub    $0x10,%esp
c0100a82:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100a89:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a8c:	89 c2                	mov    %eax,%edx
c0100a8e:	ec                   	in     (%dx),%al
c0100a8f:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100a92:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100a96:	0f b6 c0             	movzbl %al,%eax
c0100a99:	83 e0 20             	and    $0x20,%eax
c0100a9c:	85 c0                	test   %eax,%eax
c0100a9e:	0f 95 c0             	setne  %al
c0100aa1:	0f b6 c0             	movzbl %al,%eax
}
c0100aa4:	c9                   	leave  
c0100aa5:	c3                   	ret    

c0100aa6 <serial_printc>:

void serial_printc(int ch) {
c0100aa6:	55                   	push   %ebp
c0100aa7:	89 e5                	mov    %esp,%ebp
c0100aa9:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100aac:	90                   	nop
c0100aad:	e8 ca ff ff ff       	call   c0100a7c <serial_idle>
c0100ab2:	85 c0                	test   %eax,%eax
c0100ab4:	74 f7                	je     c0100aad <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100ab6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ab9:	0f b6 c0             	movzbl %al,%eax
c0100abc:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100ac3:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100ac6:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100aca:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100acd:	ee                   	out    %al,(%dx)
}
c0100ace:	c9                   	leave  
c0100acf:	c3                   	ret    

c0100ad0 <putchar>:

void putchar(int ch){
c0100ad0:	55                   	push   %ebp
c0100ad1:	89 e5                	mov    %esp,%ebp
c0100ad3:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ad9:	89 04 24             	mov    %eax,(%esp)
c0100adc:	e8 c5 ff ff ff       	call   c0100aa6 <serial_printc>
c0100ae1:	c9                   	leave  
c0100ae2:	c3                   	ret    

c0100ae3 <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100ae3:	55                   	push   %ebp
c0100ae4:	89 e5                	mov    %esp,%ebp
c0100ae6:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100ae9:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100af0:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100af7:	7e 24                	jle    c0100b1d <init_timer+0x3a>
c0100af9:	c7 44 24 0c d1 3a 10 	movl   $0xc0103ad1,0xc(%esp)
c0100b00:	c0 
c0100b01:	c7 44 24 08 e1 3a 10 	movl   $0xc0103ae1,0x8(%esp)
c0100b08:	c0 
c0100b09:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100b10:	00 
c0100b11:	c7 04 24 f6 3a 10 c0 	movl   $0xc0103af6,(%esp)
c0100b18:	e8 e7 1b 00 00       	call   c0102704 <_panic>
c0100b1d:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100b24:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100b28:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100b2c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b2f:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100b30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b33:	99                   	cltd   
c0100b34:	c1 ea 18             	shr    $0x18,%edx
c0100b37:	01 d0                	add    %edx,%eax
c0100b39:	0f b6 c0             	movzbl %al,%eax
c0100b3c:	29 d0                	sub    %edx,%eax
c0100b3e:	0f b6 c0             	movzbl %al,%eax
c0100b41:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100b48:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100b4b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100b4f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100b52:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b56:	99                   	cltd   
c0100b57:	c1 ea 18             	shr    $0x18,%edx
c0100b5a:	01 d0                	add    %edx,%eax
c0100b5c:	c1 f8 08             	sar    $0x8,%eax
c0100b5f:	0f b6 c0             	movzbl %al,%eax
c0100b62:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100b69:	88 45 df             	mov    %al,-0x21(%ebp)
c0100b6c:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100b70:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100b73:	ee                   	out    %al,(%dx)
}
c0100b74:	c9                   	leave  
c0100b75:	c3                   	ret    

c0100b76 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0100b76:	55                   	push   %ebp
c0100b77:	89 e5                	mov    %esp,%ebp
c0100b79:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0100b7c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0100b80:	75 24                	jne    c0100ba6 <list_add+0x30>
c0100b82:	c7 44 24 0c 0c 3b 10 	movl   $0xc0103b0c,0xc(%esp)
c0100b89:	c0 
c0100b8a:	c7 44 24 08 19 3b 10 	movl   $0xc0103b19,0x8(%esp)
c0100b91:	c0 
c0100b92:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0100b99:	00 
c0100b9a:	c7 04 24 2e 3b 10 c0 	movl   $0xc0103b2e,(%esp)
c0100ba1:	e8 5e 1b 00 00       	call   c0102704 <_panic>
	data->prev = prev;
c0100ba6:	8b 45 10             	mov    0x10(%ebp),%eax
c0100ba9:	8b 55 08             	mov    0x8(%ebp),%edx
c0100bac:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0100bae:	8b 45 10             	mov    0x10(%ebp),%eax
c0100bb1:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100bb4:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0100bb7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100bbb:	74 09                	je     c0100bc6 <list_add+0x50>
c0100bbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bc0:	8b 55 10             	mov    0x10(%ebp),%edx
c0100bc3:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0100bc6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100bca:	74 08                	je     c0100bd4 <list_add+0x5e>
c0100bcc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bcf:	8b 55 10             	mov    0x10(%ebp),%edx
c0100bd2:	89 10                	mov    %edx,(%eax)
}
c0100bd4:	c9                   	leave  
c0100bd5:	c3                   	ret    

c0100bd6 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0100bd6:	55                   	push   %ebp
c0100bd7:	89 e5                	mov    %esp,%ebp
c0100bd9:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100bdc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100be0:	75 24                	jne    c0100c06 <list_add_before+0x30>
c0100be2:	c7 44 24 0c 44 3b 10 	movl   $0xc0103b44,0xc(%esp)
c0100be9:	c0 
c0100bea:	c7 44 24 08 19 3b 10 	movl   $0xc0103b19,0x8(%esp)
c0100bf1:	c0 
c0100bf2:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0100bf9:	00 
c0100bfa:	c7 04 24 2e 3b 10 c0 	movl   $0xc0103b2e,(%esp)
c0100c01:	e8 fe 1a 00 00       	call   c0102704 <_panic>
	list_add(one->prev, one, data);
c0100c06:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c09:	8b 00                	mov    (%eax),%eax
c0100c0b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c0e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100c12:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c15:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100c19:	89 04 24             	mov    %eax,(%esp)
c0100c1c:	e8 55 ff ff ff       	call   c0100b76 <list_add>
}
c0100c21:	c9                   	leave  
c0100c22:	c3                   	ret    

c0100c23 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0100c23:	55                   	push   %ebp
c0100c24:	89 e5                	mov    %esp,%ebp
c0100c26:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0100c29:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c2d:	75 24                	jne    c0100c53 <list_del+0x30>
c0100c2f:	c7 44 24 0c 0c 3b 10 	movl   $0xc0103b0c,0xc(%esp)
c0100c36:	c0 
c0100c37:	c7 44 24 08 19 3b 10 	movl   $0xc0103b19,0x8(%esp)
c0100c3e:	c0 
c0100c3f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0100c46:	00 
c0100c47:	c7 04 24 2e 3b 10 c0 	movl   $0xc0103b2e,(%esp)
c0100c4e:	e8 b1 1a 00 00       	call   c0102704 <_panic>
	list *prev = data->prev;
c0100c53:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c56:	8b 00                	mov    (%eax),%eax
c0100c58:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0100c5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c5e:	8b 40 04             	mov    0x4(%eax),%eax
c0100c61:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0100c64:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100c68:	74 09                	je     c0100c73 <list_del+0x50>
c0100c6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100c70:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0100c73:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100c77:	74 08                	je     c0100c81 <list_del+0x5e>
c0100c79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c7f:	89 10                	mov    %edx,(%eax)
}
c0100c81:	c9                   	leave  
c0100c82:	c3                   	ret    

c0100c83 <list_init>:

static inline void
list_init(list *one) {
c0100c83:	55                   	push   %ebp
c0100c84:	89 e5                	mov    %esp,%ebp
c0100c86:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100c89:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c8d:	75 24                	jne    c0100cb3 <list_init+0x30>
c0100c8f:	c7 44 24 0c 44 3b 10 	movl   $0xc0103b44,0xc(%esp)
c0100c96:	c0 
c0100c97:	c7 44 24 08 19 3b 10 	movl   $0xc0103b19,0x8(%esp)
c0100c9e:	c0 
c0100c9f:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
c0100ca6:	00 
c0100ca7:	c7 04 24 2e 3b 10 c0 	movl   $0xc0103b2e,(%esp)
c0100cae:	e8 51 1a 00 00       	call   c0102704 <_panic>
	one->prev = one->next = one;
c0100cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cb6:	8b 55 08             	mov    0x8(%ebp),%edx
c0100cb9:	89 50 04             	mov    %edx,0x4(%eax)
c0100cbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cbf:	8b 50 04             	mov    0x4(%eax),%edx
c0100cc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cc5:	89 10                	mov    %edx,(%eax)
}
c0100cc7:	c9                   	leave  
c0100cc8:	c3                   	ret    

c0100cc9 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100cc9:	55                   	push   %ebp
c0100cca:	89 e5                	mov    %esp,%ebp
c0100ccc:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100ccf:	8b 45 10             	mov    0x10(%ebp),%eax
c0100cd2:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100cd7:	77 21                	ja     c0100cfa <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100cd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0100cdc:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100ce0:	c7 44 24 08 50 3b 10 	movl   $0xc0103b50,0x8(%esp)
c0100ce7:	c0 
c0100ce8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ceb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100cef:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cf2:	89 04 24             	mov    %eax,(%esp)
c0100cf5:	e8 0a 1a 00 00       	call   c0102704 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100cfa:	8b 45 10             	mov    0x10(%ebp),%eax
c0100cfd:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100d02:	c9                   	leave  
c0100d03:	c3                   	ret    

c0100d04 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100d04:	55                   	push   %ebp
c0100d05:	89 e5                	mov    %esp,%ebp
c0100d07:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100d0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d0d:	c1 e8 0c             	shr    $0xc,%eax
c0100d10:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100d15:	76 21                	jbe    c0100d38 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100d17:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d1a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100d1e:	c7 44 24 08 74 3b 10 	movl   $0xc0103b74,0x8(%esp)
c0100d25:	c0 
c0100d26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d29:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d30:	89 04 24             	mov    %eax,(%esp)
c0100d33:	e8 cc 19 00 00       	call   c0102704 <_panic>
	return (void *)(pa + KERNBASE);
c0100d38:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d3b:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100d40:	c9                   	leave  
c0100d41:	c3                   	ret    

c0100d42 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100d42:	55                   	push   %ebp
c0100d43:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100d45:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d48:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0100d4d:	29 c2                	sub    %eax,%edx
c0100d4f:	89 d0                	mov    %edx,%eax
c0100d51:	c1 f8 03             	sar    $0x3,%eax
c0100d54:	c1 e0 0c             	shl    $0xc,%eax
}
c0100d57:	5d                   	pop    %ebp
c0100d58:	c3                   	ret    

c0100d59 <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100d59:	55                   	push   %ebp
c0100d5a:	89 e5                	mov    %esp,%ebp
c0100d5c:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100d5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d62:	89 04 24             	mov    %eax,(%esp)
c0100d65:	e8 d8 ff ff ff       	call   c0100d42 <page2pa>
c0100d6a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100d6e:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100d75:	00 
c0100d76:	c7 04 24 97 3b 10 c0 	movl   $0xc0103b97,(%esp)
c0100d7d:	e8 82 ff ff ff       	call   c0100d04 <_kaddr>
}
c0100d82:	c9                   	leave  
c0100d83:	c3                   	ret    

c0100d84 <pcb_init>:
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];


void pcb_init()
{
c0100d84:	55                   	push   %ebp
c0100d85:	89 e5                	mov    %esp,%ebp
c0100d87:	83 ec 28             	sub    $0x28,%esp
	/*int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}*/
	list_init(&ready);
c0100d8a:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100d91:	e8 ed fe ff ff       	call   c0100c83 <list_init>
	list_init(&block);
c0100d96:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0100d9d:	e8 e1 fe ff ff       	call   c0100c83 <list_init>
	list_init(&free);
c0100da2:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100da9:	e8 d5 fe ff ff       	call   c0100c83 <list_init>
	now=&ready;
c0100dae:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0100db5:	4f 16 c0 
	pcbnow=&init;
c0100db8:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100dbf:	3f 16 c0 
	init.pgdir=kern_pgdir;
c0100dc2:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100dc7:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100dcc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100dd3:	eb 48                	jmp    c0100e1d <pcb_init+0x99>
		list_add_before(&free,&pcb[i].plist);
c0100dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dd8:	c1 e0 0c             	shl    $0xc,%eax
c0100ddb:	05 40 57 16 c0       	add    $0xc0165740,%eax
c0100de0:	83 c0 08             	add    $0x8,%eax
c0100de3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100de7:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100dee:	e8 e3 fd ff ff       	call   c0100bd6 <list_add_before>
		pcb[i].pid=i+1;
c0100df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100df6:	83 c0 01             	add    $0x1,%eax
c0100df9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100dfc:	c1 e2 0c             	shl    $0xc,%edx
c0100dff:	81 c2 50 57 16 c0    	add    $0xc0165750,%edx
c0100e05:	89 02                	mov    %eax,(%edx)
		pcb[i].ppid=0;
c0100e07:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e0a:	c1 e0 0c             	shl    $0xc,%eax
c0100e0d:	05 50 57 16 c0       	add    $0xc0165750,%eax
c0100e12:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&free);
	now=&ready;
	pcbnow=&init;
	init.pgdir=kern_pgdir;
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100e19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100e1d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0100e21:	7e b2                	jle    c0100dd5 <pcb_init+0x51>
		list_add_before(&free,&pcb[i].plist);
		pcb[i].pid=i+1;
		pcb[i].ppid=0;
	}
			
}
c0100e23:	c9                   	leave  
c0100e24:	c3                   	ret    

c0100e25 <pcb_alloc>:

static uint32_t cntpid=0;
PCB* pcb_alloc()
{
c0100e25:	55                   	push   %ebp
c0100e26:	89 e5                	mov    %esp,%ebp
c0100e28:	83 ec 38             	sub    $0x38,%esp
	/*
	PCB* p = pcb_free_list;
 	if (p == NULL) return NULL;*/
	list *lnext=&free;
c0100e2b:	c7 45 f4 08 4f 16 c0 	movl   $0xc0164f08,-0xc(%ebp)
	list *freenext;
	if(lnext->next==lnext)
c0100e32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e35:	8b 40 04             	mov    0x4(%eax),%eax
c0100e38:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100e3b:	75 11                	jne    c0100e4e <pcb_alloc+0x29>
	{
		freenext=NULL;
c0100e3d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		return NULL;
c0100e44:	b8 00 00 00 00       	mov    $0x0,%eax
c0100e49:	e9 0f 01 00 00       	jmp    c0100f5d <pcb_alloc+0x138>
	}
	else
	{
		freenext=lnext->next;
c0100e4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e51:	8b 40 04             	mov    0x4(%eax),%eax
c0100e54:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	PCB* p=list_entry(freenext,PCB,plist);
c0100e57:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e5a:	83 e8 08             	sub    $0x8,%eax
c0100e5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100e60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100e67:	e8 33 0c 00 00       	call   c0101a9f <page_alloc>
c0100e6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (pp == NULL) return NULL;
c0100e6f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0100e73:	75 0a                	jne    c0100e7f <pcb_alloc+0x5a>
c0100e75:	b8 00 00 00 00       	mov    $0x0,%eax
c0100e7a:	e9 de 00 00 00       	jmp    c0100f5d <pcb_alloc+0x138>
	p->pgdir = page2kva(pp);
c0100e7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e82:	89 04 24             	mov    %eax,(%esp)
c0100e85:	e8 cf fe ff ff       	call   c0100d59 <page2kva>
c0100e8a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100e8d:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100e90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e93:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100e97:	8d 50 01             	lea    0x1(%eax),%edx
c0100e9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e9d:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100ea1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ea4:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100eab:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100eb0:	8d 50 01             	lea    0x1(%eax),%edx
c0100eb3:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100eb9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100ebc:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100ebf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ec2:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100ec9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ecc:	83 c0 08             	add    $0x8,%eax
c0100ecf:	89 04 24             	mov    %eax,(%esp)
c0100ed2:	e8 4c fd ff ff       	call   c0100c23 <list_del>
	list_add_before(&ready,&p->plist);
c0100ed7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100eda:	83 c0 08             	add    $0x8,%eax
c0100edd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ee1:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100ee8:	e8 e9 fc ff ff       	call   c0100bd6 <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100eed:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100ef3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ef6:	8b 40 04             	mov    0x4(%eax),%eax
c0100ef9:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100f00:	00 
c0100f01:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100f05:	89 04 24             	mov    %eax,(%esp)
c0100f08:	e8 eb 1c 00 00       	call   c0102bf8 <memcpy>
	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	
c0100f0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f10:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100f15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100f18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f1b:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100f22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f25:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100f2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f2f:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100f35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f38:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100f3e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f41:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0100f48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f4b:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c0100f52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100f58:	89 10                	mov    %edx,(%eax)
	return p;
c0100f5a:	8b 45 ec             	mov    -0x14(%ebp),%eax

}
c0100f5d:	c9                   	leave  
c0100f5e:	c3                   	ret    

c0100f5f <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0100f5f:	55                   	push   %ebp
c0100f60:	89 e5                	mov    %esp,%ebp
c0100f62:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0100f65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100f68:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f6e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100f73:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0100f76:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c0100f7d:	8b 45 10             	mov    0x10(%ebp),%eax
c0100f80:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f83:	01 c2                	add    %eax,%edx
c0100f85:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f88:	01 d0                	add    %edx,%eax
c0100f8a:	83 e8 01             	sub    $0x1,%eax
c0100f8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100f90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f93:	ba 00 00 00 00       	mov    $0x0,%edx
c0100f98:	f7 75 e8             	divl   -0x18(%ebp)
c0100f9b:	89 d0                	mov    %edx,%eax
c0100f9d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100fa0:	29 c2                	sub    %eax,%edx
c0100fa2:	89 d0                	mov    %edx,%eax
c0100fa4:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c0100fa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100faa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100fad:	eb 61                	jmp    c0101010 <mm_malloc+0xb1>
		p = page_alloc(0);
c0100faf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0100fb6:	e8 e4 0a 00 00       	call   c0101a9f <page_alloc>
c0100fbb:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c0100fbe:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0100fc2:	75 24                	jne    c0100fe8 <mm_malloc+0x89>
c0100fc4:	c7 44 24 0c ad 3b 10 	movl   $0xc0103bad,0xc(%esp)
c0100fcb:	c0 
c0100fcc:	c7 44 24 08 19 3b 10 	movl   $0xc0103b19,0x8(%esp)
c0100fd3:	c0 
c0100fd4:	c7 44 24 04 59 00 00 	movl   $0x59,0x4(%esp)
c0100fdb:	00 
c0100fdc:	c7 04 24 b7 3b 10 c0 	movl   $0xc0103bb7,(%esp)
c0100fe3:	e8 1c 17 00 00       	call   c0102704 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0100fe8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100feb:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c0100ff2:	00 
c0100ff3:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100ff7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ffa:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ffe:	8b 45 08             	mov    0x8(%ebp),%eax
c0101001:	89 04 24             	mov    %eax,(%esp)
c0101004:	e8 25 10 00 00       	call   c010202e <page_insert>
{
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c0101009:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0101010:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101013:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0101016:	72 97                	jb     c0100faf <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c0101018:	c9                   	leave  
c0101019:	c3                   	ret    

c010101a <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c010101a:	55                   	push   %ebp
c010101b:	89 e5                	mov    %esp,%ebp
c010101d:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c0101020:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101023:	8b 55 08             	mov    0x8(%ebp),%edx
c0101026:	01 d0                	add    %edx,%eax
c0101028:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c010102b:	8b 45 10             	mov    0x10(%ebp),%eax
c010102e:	c1 e8 09             	shr    $0x9,%eax
c0101031:	83 c0 01             	add    $0x1,%eax
c0101034:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c0101037:	eb 6e                	jmp    c01010a7 <readseg+0x8d>
		readsect(disks, sect);
c0101039:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010103c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101040:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c0101047:	e8 65 00 00 00       	call   c01010b1 <readsect>
		uint32_t rem = offset & 0x1ff;
c010104c:	8b 45 10             	mov    0x10(%ebp),%eax
c010104f:	25 ff 01 00 00       	and    $0x1ff,%eax
c0101054:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c0101057:	b8 00 02 00 00       	mov    $0x200,%eax
c010105c:	2b 45 ec             	sub    -0x14(%ebp),%eax
c010105f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101062:	8b 45 08             	mov    0x8(%ebp),%eax
c0101065:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101068:	29 c2                	sub    %eax,%edx
c010106a:	89 d0                	mov    %edx,%eax
c010106c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010106f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101072:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101075:	39 d0                	cmp    %edx,%eax
c0101077:	76 02                	jbe    c010107b <readseg+0x61>
c0101079:	89 d0                	mov    %edx,%eax
c010107b:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c010107e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101081:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c0101087:	8b 45 08             	mov    0x8(%ebp),%eax
c010108a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010108d:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101091:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0101095:	89 04 24             	mov    %eax,(%esp)
c0101098:	e8 5b 1b 00 00       	call   c0102bf8 <memcpy>
		va += size;
c010109d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01010a0:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c01010a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c01010a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01010aa:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01010ad:	72 8a                	jb     c0101039 <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c01010af:	c9                   	leave  
c01010b0:	c3                   	ret    

c01010b1 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c01010b1:	55                   	push   %ebp
c01010b2:	89 e5                	mov    %esp,%ebp
c01010b4:	57                   	push   %edi
c01010b5:	53                   	push   %ebx
c01010b6:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c01010b9:	90                   	nop
c01010ba:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01010c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010c4:	89 c2                	mov    %eax,%edx
c01010c6:	ec                   	in     (%dx),%al
c01010c7:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c01010ca:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c01010ce:	0f b6 c0             	movzbl %al,%eax
c01010d1:	25 c0 00 00 00       	and    $0xc0,%eax
c01010d6:	83 f8 40             	cmp    $0x40,%eax
c01010d9:	75 df                	jne    c01010ba <readsect+0x9>
c01010db:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c01010e2:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01010e6:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01010ea:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01010ed:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c01010ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010f1:	0f b6 c0             	movzbl %al,%eax
c01010f4:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c01010fb:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01010fe:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0101102:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101105:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c0101106:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101109:	c1 e8 08             	shr    $0x8,%eax
c010110c:	0f b6 c0             	movzbl %al,%eax
c010110f:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c0101116:	88 45 db             	mov    %al,-0x25(%ebp)
c0101119:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c010111d:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101120:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c0101121:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101124:	c1 e8 10             	shr    $0x10,%eax
c0101127:	0f b6 c0             	movzbl %al,%eax
c010112a:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c0101131:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0101134:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0101138:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010113b:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c010113c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010113f:	c1 e8 18             	shr    $0x18,%eax
c0101142:	83 c8 e0             	or     $0xffffffe0,%eax
c0101145:	0f b6 c0             	movzbl %al,%eax
c0101148:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c010114f:	88 45 cb             	mov    %al,-0x35(%ebp)
c0101152:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0101156:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0101159:	ee                   	out    %al,(%dx)
c010115a:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101161:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c0101165:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101169:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c010116c:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010116d:	90                   	nop
c010116e:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101175:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0101178:	89 c2                	mov    %eax,%edx
c010117a:	ec                   	in     (%dx),%al
c010117b:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c010117e:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0101182:	0f b6 c0             	movzbl %al,%eax
c0101185:	25 c0 00 00 00       	and    $0xc0,%eax
c010118a:	83 f8 40             	cmp    $0x40,%eax
c010118d:	75 df                	jne    c010116e <readsect+0xbd>
c010118f:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c0101196:	8b 45 08             	mov    0x8(%ebp),%eax
c0101199:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010119c:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c01011a3:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c01011a6:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c01011a9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01011ac:	89 cb                	mov    %ecx,%ebx
c01011ae:	89 df                	mov    %ebx,%edi
c01011b0:	89 c1                	mov    %eax,%ecx
c01011b2:	fc                   	cld    
c01011b3:	f2 6d                	repnz insl (%dx),%es:(%edi)
c01011b5:	89 c8                	mov    %ecx,%eax
c01011b7:	89 fb                	mov    %edi,%ebx
c01011b9:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c01011bc:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c01011bf:	83 c4 50             	add    $0x50,%esp
c01011c2:	5b                   	pop    %ebx
c01011c3:	5f                   	pop    %edi
c01011c4:	5d                   	pop    %ebp
c01011c5:	c3                   	ret    

c01011c6 <pcb_new>:

void pcb_new()
{
c01011c6:	55                   	push   %ebp
c01011c7:	89 e5                	mov    %esp,%ebp
c01011c9:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c01011cc:	e8 54 fc ff ff       	call   c0100e25 <pcb_alloc>
c01011d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c01011d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01011d8:	75 05                	jne    c01011df <pcb_new+0x19>
c01011da:	e9 8b 01 00 00       	jmp    c010136a <pcb_new+0x1a4>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c01011df:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c01011e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01011e9:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c01011f0:	00 
c01011f1:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01011f8:	00 
c01011f9:	89 04 24             	mov    %eax,(%esp)
c01011fc:	e8 19 fe ff ff       	call   c010101a <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c0101201:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101204:	8b 00                	mov    (%eax),%eax
c0101206:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c010120b:	74 24                	je     c0101231 <pcb_new+0x6b>
c010120d:	c7 44 24 0c ca 3b 10 	movl   $0xc0103bca,0xc(%esp)
c0101214:	c0 
c0101215:	c7 44 24 08 19 3b 10 	movl   $0xc0103b19,0x8(%esp)
c010121c:	c0 
c010121d:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c0101224:	00 
c0101225:	c7 04 24 b7 3b 10 c0 	movl   $0xc0103bb7,(%esp)
c010122c:	e8 d3 14 00 00       	call   c0102704 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c0101231:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101234:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101237:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010123a:	01 d0                	add    %edx,%eax
c010123c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c010123f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101242:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0101246:	0f b7 c0             	movzwl %ax,%eax
c0101249:	c1 e0 05             	shl    $0x5,%eax
c010124c:	89 c2                	mov    %eax,%edx
c010124e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101251:	01 d0                	add    %edx,%eax
c0101253:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c0101256:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101259:	8b 40 04             	mov    0x4(%eax),%eax
c010125c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101260:	c7 44 24 04 86 00 00 	movl   $0x86,0x4(%esp)
c0101267:	00 
c0101268:	c7 04 24 b7 3b 10 c0 	movl   $0xc0103bb7,(%esp)
c010126f:	e8 55 fa ff ff       	call   c0100cc9 <_paddr>
c0101274:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0101277:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010127a:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) 
c010127d:	e9 8a 00 00 00       	jmp    c010130c <pcb_new+0x146>
	{
		if (ph -> p_type != ELF_PROG_LOAD) 
c0101282:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101285:	8b 00                	mov    (%eax),%eax
c0101287:	83 f8 01             	cmp    $0x1,%eax
c010128a:	74 02                	je     c010128e <pcb_new+0xc8>
			continue;
c010128c:	eb 7a                	jmp    c0101308 <pcb_new+0x142>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c010128e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101291:	8b 48 14             	mov    0x14(%eax),%ecx
c0101294:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101297:	8b 50 08             	mov    0x8(%eax),%edx
c010129a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010129d:	8b 40 04             	mov    0x4(%eax),%eax
c01012a0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01012a4:	89 54 24 04          	mov    %edx,0x4(%esp)
c01012a8:	89 04 24             	mov    %eax,(%esp)
c01012ab:	e8 af fc ff ff       	call   c0100f5f <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c01012b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012b3:	8b 40 04             	mov    0x4(%eax),%eax
c01012b6:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c01012bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012bf:	8b 50 10             	mov    0x10(%eax),%edx
c01012c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012c5:	8b 40 08             	mov    0x8(%eax),%eax
c01012c8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01012cc:	89 54 24 04          	mov    %edx,0x4(%esp)
c01012d0:	89 04 24             	mov    %eax,(%esp)
c01012d3:	e8 42 fd ff ff       	call   c010101a <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c01012d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012db:	8b 50 14             	mov    0x14(%eax),%edx
c01012de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012e1:	8b 40 10             	mov    0x10(%eax),%eax
c01012e4:	29 c2                	sub    %eax,%edx
c01012e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012e9:	8b 48 08             	mov    0x8(%eax),%ecx
c01012ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012ef:	8b 40 10             	mov    0x10(%eax),%eax
c01012f2:	01 c8                	add    %ecx,%eax
c01012f4:	89 54 24 08          	mov    %edx,0x8(%esp)
c01012f8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01012ff:	00 
c0101300:	89 04 24             	mov    %eax,(%esp)
c0101303:	e8 0d 19 00 00       	call   c0102c15 <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) 
c0101308:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c010130c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010130f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101312:	0f 82 6a ff ff ff    	jb     c0101282 <pcb_new+0xbc>
			continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf->e_entry;
c0101318:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010131b:	8b 00                	mov    (%eax),%eax
c010131d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101320:	8b 52 18             	mov    0x18(%edx),%edx
c0101323:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP-USTACKSIZE, USTACKSIZE);
c0101326:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101329:	8b 40 04             	mov    0x4(%eax),%eax
c010132c:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101333:	00 
c0101334:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c010133b:	be 
c010133c:	89 04 24             	mov    %eax,(%esp)
c010133f:	e8 1b fc ff ff       	call   c0100f5f <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c0101344:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101349:	89 44 24 08          	mov    %eax,0x8(%esp)
c010134d:	c7 44 24 04 91 00 00 	movl   $0x91,0x4(%esp)
c0101354:	00 
c0101355:	c7 04 24 b7 3b 10 c0 	movl   $0xc0103bb7,(%esp)
c010135c:	e8 68 f9 ff ff       	call   c0100cc9 <_paddr>
c0101361:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101364:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101367:	0f 22 d8             	mov    %eax,%cr3
}
c010136a:	c9                   	leave  
c010136b:	c3                   	ret    

c010136c <pcb_deepcopy>:

PCB* pcb_deepcopy(PCB *fa,PCB *tb)
{
c010136c:	55                   	push   %ebp
c010136d:	89 e5                	mov    %esp,%ebp
c010136f:	53                   	push   %ebx
c0101370:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);//get the addr for the information of process
c0101373:	c7 45 f4 24 00 00 00 	movl   $0x24,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c010137a:	b8 00 10 00 00       	mov    $0x1000,%eax
c010137f:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0101382:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c0101385:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101388:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c010138b:	8b 55 08             	mov    0x8(%ebp),%edx
c010138e:	01 d1                	add    %edx,%ecx
c0101390:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c0101393:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101396:	01 da                	add    %ebx,%edx
c0101398:	89 44 24 08          	mov    %eax,0x8(%esp)
c010139c:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01013a0:	89 14 24             	mov    %edx,(%esp)
c01013a3:	e8 50 18 00 00       	call   c0102bf8 <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c01013a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01013ab:	8b 00                	mov    (%eax),%eax
c01013ad:	89 c2                	mov    %eax,%edx
c01013af:	8b 45 08             	mov    0x8(%ebp),%eax
c01013b2:	29 c2                	sub    %eax,%edx
c01013b4:	89 d0                	mov    %edx,%eax
c01013b6:	89 c2                	mov    %eax,%edx
c01013b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013bb:	01 c2                	add    %eax,%edx
c01013bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013c0:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c01013c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01013c5:	8b 50 18             	mov    0x18(%eax),%edx
c01013c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013cb:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c01013ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01013d1:	8b 50 1c             	mov    0x1c(%eax),%edx
c01013d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013d7:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c01013da:	8b 45 08             	mov    0x8(%ebp),%eax
c01013dd:	8b 50 20             	mov    0x20(%eax),%edx
c01013e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013e3:	89 50 20             	mov    %edx,0x20(%eax)
	pg_copy(fa->pgdir,tb->pgdir);//written in pmap.c
c01013e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013e9:	8b 50 04             	mov    0x4(%eax),%edx
c01013ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01013ef:	8b 40 04             	mov    0x4(%eax),%eax
c01013f2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01013f6:	89 04 24             	mov    %eax,(%esp)
c01013f9:	e8 80 08 00 00       	call   c0101c7e <pg_copy>
}
c01013fe:	83 c4 24             	add    $0x24,%esp
c0101401:	5b                   	pop    %ebx
c0101402:	5d                   	pop    %ebp
c0101403:	c3                   	ret    

c0101404 <pcb_remove>:

void pcb_remove(PCB *p)
{
c0101404:	55                   	push   %ebp
c0101405:	89 e5                	mov    %esp,%ebp
c0101407:	83 ec 18             	sub    $0x18,%esp
	pg_remove(p->pgdir);
c010140a:	8b 45 08             	mov    0x8(%ebp),%eax
c010140d:	8b 40 04             	mov    0x4(%eax),%eax
c0101410:	89 04 24             	mov    %eax,(%esp)
c0101413:	e8 5f 0a 00 00       	call   c0101e77 <pg_remove>
}
c0101418:	c9                   	leave  
c0101419:	c3                   	ret    

c010141a <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c010141a:	55                   	push   %ebp
c010141b:	89 e5                	mov    %esp,%ebp
c010141d:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0101420:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101424:	75 24                	jne    c010144a <list_add+0x30>
c0101426:	c7 44 24 0c e4 3b 10 	movl   $0xc0103be4,0xc(%esp)
c010142d:	c0 
c010142e:	c7 44 24 08 f1 3b 10 	movl   $0xc0103bf1,0x8(%esp)
c0101435:	c0 
c0101436:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c010143d:	00 
c010143e:	c7 04 24 06 3c 10 c0 	movl   $0xc0103c06,(%esp)
c0101445:	e8 ba 12 00 00       	call   c0102704 <_panic>
	data->prev = prev;
c010144a:	8b 45 10             	mov    0x10(%ebp),%eax
c010144d:	8b 55 08             	mov    0x8(%ebp),%edx
c0101450:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101452:	8b 45 10             	mov    0x10(%ebp),%eax
c0101455:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101458:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010145b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010145f:	74 09                	je     c010146a <list_add+0x50>
c0101461:	8b 45 08             	mov    0x8(%ebp),%eax
c0101464:	8b 55 10             	mov    0x10(%ebp),%edx
c0101467:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c010146a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010146e:	74 08                	je     c0101478 <list_add+0x5e>
c0101470:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101473:	8b 55 10             	mov    0x10(%ebp),%edx
c0101476:	89 10                	mov    %edx,(%eax)
}
c0101478:	c9                   	leave  
c0101479:	c3                   	ret    

c010147a <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c010147a:	55                   	push   %ebp
c010147b:	89 e5                	mov    %esp,%ebp
c010147d:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101480:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101484:	75 24                	jne    c01014aa <list_add_before+0x30>
c0101486:	c7 44 24 0c 1c 3c 10 	movl   $0xc0103c1c,0xc(%esp)
c010148d:	c0 
c010148e:	c7 44 24 08 f1 3b 10 	movl   $0xc0103bf1,0x8(%esp)
c0101495:	c0 
c0101496:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c010149d:	00 
c010149e:	c7 04 24 06 3c 10 c0 	movl   $0xc0103c06,(%esp)
c01014a5:	e8 5a 12 00 00       	call   c0102704 <_panic>
	list_add(one->prev, one, data);
c01014aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01014ad:	8b 00                	mov    (%eax),%eax
c01014af:	8b 55 0c             	mov    0xc(%ebp),%edx
c01014b2:	89 54 24 08          	mov    %edx,0x8(%esp)
c01014b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01014b9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014bd:	89 04 24             	mov    %eax,(%esp)
c01014c0:	e8 55 ff ff ff       	call   c010141a <list_add>
}
c01014c5:	c9                   	leave  
c01014c6:	c3                   	ret    

c01014c7 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c01014c7:	55                   	push   %ebp
c01014c8:	89 e5                	mov    %esp,%ebp
c01014ca:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c01014cd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01014d1:	75 24                	jne    c01014f7 <list_del+0x30>
c01014d3:	c7 44 24 0c e4 3b 10 	movl   $0xc0103be4,0xc(%esp)
c01014da:	c0 
c01014db:	c7 44 24 08 f1 3b 10 	movl   $0xc0103bf1,0x8(%esp)
c01014e2:	c0 
c01014e3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c01014ea:	00 
c01014eb:	c7 04 24 06 3c 10 c0 	movl   $0xc0103c06,(%esp)
c01014f2:	e8 0d 12 00 00       	call   c0102704 <_panic>
	list *prev = data->prev;
c01014f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01014fa:	8b 00                	mov    (%eax),%eax
c01014fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01014ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0101502:	8b 40 04             	mov    0x4(%eax),%eax
c0101505:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0101508:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010150c:	74 09                	je     c0101517 <list_del+0x50>
c010150e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101511:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101514:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0101517:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010151b:	74 08                	je     c0101525 <list_del+0x5e>
c010151d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101520:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101523:	89 10                	mov    %edx,(%eax)
}
c0101525:	c9                   	leave  
c0101526:	c3                   	ret    

c0101527 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101527:	55                   	push   %ebp
c0101528:	89 e5                	mov    %esp,%ebp
c010152a:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c010152d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101530:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101535:	77 21                	ja     c0101558 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101537:	8b 45 10             	mov    0x10(%ebp),%eax
c010153a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010153e:	c7 44 24 08 28 3c 10 	movl   $0xc0103c28,0x8(%esp)
c0101545:	c0 
c0101546:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101549:	89 44 24 04          	mov    %eax,0x4(%esp)
c010154d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101550:	89 04 24             	mov    %eax,(%esp)
c0101553:	e8 ac 11 00 00       	call   c0102704 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101558:	8b 45 10             	mov    0x10(%ebp),%eax
c010155b:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101560:	c9                   	leave  
c0101561:	c3                   	ret    

c0101562 <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
c0101562:	55                   	push   %ebp
c0101563:	89 e5                	mov    %esp,%ebp
c0101565:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c0101568:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010156d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c0101570:	e8 b0 f8 ff ff       	call   c0100e25 <pcb_alloc>
c0101575:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_deepcopy(fa,ch);//written in pcb.c
c0101578:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010157b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010157f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101582:	89 04 24             	mov    %eax,(%esp)
c0101585:	e8 e2 fd ff ff       	call   c010136c <pcb_deepcopy>
	ch->ppid=fa->pid;
c010158a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010158d:	8b 50 10             	mov    0x10(%eax),%edx
c0101590:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101593:	89 50 14             	mov    %edx,0x14(%eax)
	(fa->tf)->eax=ch->pid;
c0101596:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101599:	8b 00                	mov    (%eax),%eax
c010159b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010159e:	8b 52 10             	mov    0x10(%edx),%edx
c01015a1:	89 50 1c             	mov    %edx,0x1c(%eax)
	(ch->tf)->eax=0;
c01015a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015a7:	8b 00                	mov    (%eax),%eax
c01015a9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c01015b0:	c9                   	leave  
c01015b1:	c3                   	ret    

c01015b2 <sys_getpid>:

uint32_t sys_getpid(){
c01015b2:	55                   	push   %ebp
c01015b3:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c01015b5:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015ba:	8b 40 10             	mov    0x10(%eax),%eax
}
c01015bd:	5d                   	pop    %ebp
c01015be:	c3                   	ret    

c01015bf <sys_exit>:

void sys_exit(int suc){
c01015bf:	55                   	push   %ebp
c01015c0:	89 e5                	mov    %esp,%ebp
c01015c2:	83 ec 28             	sub    $0x28,%esp
	if(suc==0)
c01015c5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01015c9:	75 1a                	jne    c01015e5 <sys_exit+0x26>
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
c01015cb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015d0:	8b 40 10             	mov    0x10(%eax),%eax
c01015d3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015d7:	c7 04 24 4c 3c 10 c0 	movl   $0xc0103c4c,(%esp)
c01015de:	e8 50 12 00 00       	call   c0102833 <printk>
c01015e3:	eb 18                	jmp    c01015fd <sys_exit+0x3e>
	else
		printk("Not teminate the process of pid %d!!!\n",pcbnow->pid);
c01015e5:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015ea:	8b 40 10             	mov    0x10(%eax),%eax
c01015ed:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015f1:	c7 04 24 7c 3c 10 c0 	movl   $0xc0103c7c,(%esp)
c01015f8:	e8 36 12 00 00       	call   c0102833 <printk>
	list *lnext;
	list *t=&ready;
c01015fd:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c0101604:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101609:	8b 40 04             	mov    0x4(%eax),%eax
c010160c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010160f:	75 22                	jne    c0101633 <sys_exit+0x74>
 	{
		if(t->next==now)
c0101611:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101614:	8b 50 04             	mov    0x4(%eax),%edx
c0101617:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010161c:	39 c2                	cmp    %eax,%edx
c010161e:	75 08                	jne    c0101628 <sys_exit+0x69>
			lnext=t;
c0101620:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101623:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101626:	eb 2f                	jmp    c0101657 <sys_exit+0x98>
		else
			lnext=t->next;
c0101628:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010162b:	8b 40 04             	mov    0x4(%eax),%eax
c010162e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101631:	eb 24                	jmp    c0101657 <sys_exit+0x98>
	}
	else
	{
		if(now->next==now)
c0101633:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101638:	8b 50 04             	mov    0x4(%eax),%edx
c010163b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101640:	39 c2                	cmp    %eax,%edx
c0101642:	75 08                	jne    c010164c <sys_exit+0x8d>
			lnext=t;
c0101644:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101647:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010164a:	eb 0b                	jmp    c0101657 <sys_exit+0x98>
		else
			lnext=now->next;
c010164c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101651:	8b 40 04             	mov    0x4(%eax),%eax
c0101654:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c0101657:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010165c:	89 04 24             	mov    %eax,(%esp)
c010165f:	e8 63 fe ff ff       	call   c01014c7 <list_del>
	list_add_before(&free,now);
c0101664:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101669:	89 44 24 04          	mov    %eax,0x4(%esp)
c010166d:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0101674:	e8 01 fe ff ff       	call   c010147a <list_add_before>
	lcr3(PADDR(kern_pgdir));
c0101679:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010167e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101682:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
c0101689:	00 
c010168a:	c7 04 24 a3 3c 10 c0 	movl   $0xc0103ca3,(%esp)
c0101691:	e8 91 fe ff ff       	call   c0101527 <_paddr>
c0101696:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101699:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010169c:	0f 22 d8             	mov    %eax,%cr3
	pcb_remove(pcbnow);
c010169f:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016a4:	89 04 24             	mov    %eax,(%esp)
c01016a7:	e8 58 fd ff ff       	call   c0101404 <pcb_remove>
	now=lnext;
c01016ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016af:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c01016b4:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016b9:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c01016be:	75 0c                	jne    c01016cc <sys_exit+0x10d>
		pcbnow=&init;
c01016c0:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01016c7:	3f 16 c0 
c01016ca:	eb 0d                	jmp    c01016d9 <sys_exit+0x11a>
	else
		pcbnow=list_entry(now,PCB,plist);
c01016cc:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016d1:	83 e8 08             	sub    $0x8,%eax
c01016d4:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01016d9:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016de:	05 f8 0f 00 00       	add    $0xff8,%eax
c01016e3:	89 04 24             	mov    %eax,(%esp)
c01016e6:	e8 08 0f 00 00       	call   c01025f3 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01016eb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016f0:	8b 40 04             	mov    0x4(%eax),%eax
c01016f3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01016f7:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01016fe:	00 
c01016ff:	c7 04 24 a3 3c 10 c0 	movl   $0xc0103ca3,(%esp)
c0101706:	e8 1c fe ff ff       	call   c0101527 <_paddr>
c010170b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010170e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101711:	0f 22 d8             	mov    %eax,%cr3
}
c0101714:	c9                   	leave  
c0101715:	c3                   	ret    

c0101716 <sys_sleep>:

void sys_sleep(int time){
c0101716:	55                   	push   %ebp
c0101717:	89 e5                	mov    %esp,%ebp
c0101719:	83 ec 28             	sub    $0x28,%esp
	list *lnext;
	list *t=&ready;
c010171c:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c0101723:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101728:	8b 40 04             	mov    0x4(%eax),%eax
c010172b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010172e:	75 22                	jne    c0101752 <sys_sleep+0x3c>
	{
		if(t->next==now)
c0101730:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101733:	8b 50 04             	mov    0x4(%eax),%edx
c0101736:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010173b:	39 c2                	cmp    %eax,%edx
c010173d:	75 08                	jne    c0101747 <sys_sleep+0x31>
			lnext=t;
c010173f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101742:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101745:	eb 2f                	jmp    c0101776 <sys_sleep+0x60>
		else
			lnext=t->next;
c0101747:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010174a:	8b 40 04             	mov    0x4(%eax),%eax
c010174d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101750:	eb 24                	jmp    c0101776 <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c0101752:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101757:	8b 50 04             	mov    0x4(%eax),%edx
c010175a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010175f:	39 c2                	cmp    %eax,%edx
c0101761:	75 08                	jne    c010176b <sys_sleep+0x55>
			lnext=t;
c0101763:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101766:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101769:	eb 0b                	jmp    c0101776 <sys_sleep+0x60>
		else
			lnext=now->next;
c010176b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101770:	8b 40 04             	mov    0x4(%eax),%eax
c0101773:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c0101776:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010177b:	89 04 24             	mov    %eax,(%esp)
c010177e:	e8 44 fd ff ff       	call   c01014c7 <list_del>
	list_add_before(&block,now);
c0101783:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101788:	89 44 24 04          	mov    %eax,0x4(%esp)
c010178c:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0101793:	e8 e2 fc ff ff       	call   c010147a <list_add_before>
	pcbnow->state=BLOCKED;
c0101798:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010179d:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c01017a4:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c01017aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01017ad:	c1 e0 02             	shl    $0x2,%eax
c01017b0:	89 c1                	mov    %eax,%ecx
c01017b2:	c1 e1 04             	shl    $0x4,%ecx
c01017b5:	29 c1                	sub    %eax,%ecx
c01017b7:	89 c8                	mov    %ecx,%eax
c01017b9:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=lnext;
c01017bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017bf:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c01017c4:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017c9:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c01017ce:	75 0c                	jne    c01017dc <sys_sleep+0xc6>
		pcbnow=&init;
c01017d0:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01017d7:	3f 16 c0 
c01017da:	eb 0d                	jmp    c01017e9 <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c01017dc:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017e1:	83 e8 08             	sub    $0x8,%eax
c01017e4:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01017e9:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017ee:	05 f8 0f 00 00       	add    $0xff8,%eax
c01017f3:	89 04 24             	mov    %eax,(%esp)
c01017f6:	e8 f8 0d 00 00       	call   c01025f3 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01017fb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101800:	8b 40 04             	mov    0x4(%eax),%eax
c0101803:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101807:	c7 44 24 04 53 00 00 	movl   $0x53,0x4(%esp)
c010180e:	00 
c010180f:	c7 04 24 a3 3c 10 c0 	movl   $0xc0103ca3,(%esp)
c0101816:	e8 0c fd ff ff       	call   c0101527 <_paddr>
c010181b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010181e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101821:	0f 22 d8             	mov    %eax,%cr3
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
c0101824:	c9                   	leave  
c0101825:	c3                   	ret    

c0101826 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101826:	55                   	push   %ebp
c0101827:	89 e5                	mov    %esp,%ebp
c0101829:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c010182c:	8b 45 10             	mov    0x10(%ebp),%eax
c010182f:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101834:	77 21                	ja     c0101857 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101836:	8b 45 10             	mov    0x10(%ebp),%eax
c0101839:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010183d:	c7 44 24 08 bc 3c 10 	movl   $0xc0103cbc,0x8(%esp)
c0101844:	c0 
c0101845:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101848:	89 44 24 04          	mov    %eax,0x4(%esp)
c010184c:	8b 45 08             	mov    0x8(%ebp),%eax
c010184f:	89 04 24             	mov    %eax,(%esp)
c0101852:	e8 ad 0e 00 00       	call   c0102704 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101857:	8b 45 10             	mov    0x10(%ebp),%eax
c010185a:	05 00 00 00 40       	add    $0x40000000,%eax
}
c010185f:	c9                   	leave  
c0101860:	c3                   	ret    

c0101861 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0101861:	55                   	push   %ebp
c0101862:	89 e5                	mov    %esp,%ebp
c0101864:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101867:	8b 45 10             	mov    0x10(%ebp),%eax
c010186a:	c1 e8 0c             	shr    $0xc,%eax
c010186d:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101872:	76 21                	jbe    c0101895 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0101874:	8b 45 10             	mov    0x10(%ebp),%eax
c0101877:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010187b:	c7 44 24 08 e0 3c 10 	movl   $0xc0103ce0,0x8(%esp)
c0101882:	c0 
c0101883:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101886:	89 44 24 04          	mov    %eax,0x4(%esp)
c010188a:	8b 45 08             	mov    0x8(%ebp),%eax
c010188d:	89 04 24             	mov    %eax,(%esp)
c0101890:	e8 6f 0e 00 00       	call   c0102704 <_panic>
	return (void *)(pa + KERNBASE);
c0101895:	8b 45 10             	mov    0x10(%ebp),%eax
c0101898:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c010189d:	c9                   	leave  
c010189e:	c3                   	ret    

c010189f <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c010189f:	55                   	push   %ebp
c01018a0:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c01018a2:	8b 55 08             	mov    0x8(%ebp),%edx
c01018a5:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c01018aa:	29 c2                	sub    %eax,%edx
c01018ac:	89 d0                	mov    %edx,%eax
c01018ae:	c1 f8 03             	sar    $0x3,%eax
c01018b1:	c1 e0 0c             	shl    $0xc,%eax
}
c01018b4:	5d                   	pop    %ebp
c01018b5:	c3                   	ret    

c01018b6 <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c01018b6:	55                   	push   %ebp
c01018b7:	89 e5                	mov    %esp,%ebp
c01018b9:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c01018bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01018bf:	c1 e8 0c             	shr    $0xc,%eax
c01018c2:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01018c7:	76 1c                	jbe    c01018e5 <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c01018c9:	c7 44 24 08 04 3d 10 	movl   $0xc0103d04,0x8(%esp)
c01018d0:	c0 
c01018d1:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c01018d8:	00 
c01018d9:	c7 04 24 23 3d 10 c0 	movl   $0xc0103d23,(%esp)
c01018e0:	e8 1f 0e 00 00       	call   c0102704 <_panic>
	return &pages[PGNUM(pa)];
c01018e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01018e8:	c1 e8 0c             	shr    $0xc,%eax
c01018eb:	c1 e0 03             	shl    $0x3,%eax
c01018ee:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c01018f3:	c9                   	leave  
c01018f4:	c3                   	ret    

c01018f5 <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c01018f5:	55                   	push   %ebp
c01018f6:	89 e5                	mov    %esp,%ebp
c01018f8:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c01018fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01018fe:	89 04 24             	mov    %eax,(%esp)
c0101901:	e8 99 ff ff ff       	call   c010189f <page2pa>
c0101906:	89 44 24 08          	mov    %eax,0x8(%esp)
c010190a:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0101911:	00 
c0101912:	c7 04 24 23 3d 10 c0 	movl   $0xc0103d23,(%esp)
c0101919:	e8 43 ff ff ff       	call   c0101861 <_kaddr>
}
c010191e:	c9                   	leave  
c010191f:	c3                   	ret    

c0101920 <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c0101920:	55                   	push   %ebp
c0101921:	89 e5                	mov    %esp,%ebp
c0101923:	53                   	push   %ebx
c0101924:	83 ec 54             	sub    $0x54,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
c0101927:	c7 45 e4 00 30 13 c0 	movl   $0xc0133000,-0x1c(%ebp)
	pte_t *pgtable = kpgtable;
c010192e:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c0101935:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010193c:	eb 40                	jmp    c010197e <page_init+0x5e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
c010193e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101941:	05 00 03 00 00       	add    $0x300,%eax
c0101946:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010194d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101950:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101953:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101956:	89 44 24 08          	mov    %eax,0x8(%esp)
c010195a:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101961:	00 
c0101962:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101969:	e8 b8 fe ff ff       	call   c0101826 <_paddr>
c010196e:	83 c8 03             	or     $0x3,%eax
c0101971:	89 03                	mov    %eax,(%ebx)
		pgtable += NPTENTRIES;
c0101973:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
	pte_t *pgtable = kpgtable;
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c010197a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010197e:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101982:	7e ba                	jle    c010193e <page_init+0x1e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
c0101984:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgtable--;
c010198b:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c010198f:	eb 18                	jmp    c01019a9 <page_init+0x89>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
c0101991:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101994:	83 c8 07             	or     $0x7,%eax
c0101997:	89 c2                	mov    %eax,%edx
c0101999:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010199c:	89 10                	mov    %edx,(%eax)
		pgtable --;
c010199e:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
	pgtable--;
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c01019a2:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c01019a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01019ad:	79 e2                	jns    c0101991 <page_init+0x71>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
		pgtable --;
	}
	kern_pgdir = pgdir;
c01019af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01019b2:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c01019b7:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01019bc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01019c0:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c01019c7:	00 
c01019c8:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c01019cf:	e8 52 fe ff ff       	call   c0101826 <_paddr>
c01019d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01019d7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01019da:	0f 22 d8             	mov    %eax,%cr3
	unsigned long i;
	int base = 0x400;
c01019dd:	c7 45 e0 00 04 00 00 	movl   $0x400,-0x20(%ebp)
	for (i = 0; i < base; i++) {
c01019e4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01019eb:	eb 11                	jmp    c01019fe <page_init+0xde>
		pages[i].pp_ref = 1;
c01019ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01019f0:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c01019f7:	c0 01 00 
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
c01019fa:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01019fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101a01:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101a04:	77 e7                	ja     c01019ed <page_init+0xcd>
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101a06:	c7 45 e8 ff 7f 00 00 	movl   $0x7fff,-0x18(%ebp)
c0101a0d:	eb 31                	jmp    c0101a40 <page_init+0x120>
		pages[i].pp_ref = 0;
c0101a0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a12:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101a19:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101a1c:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101a22:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a25:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101a2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a2f:	c1 e0 03             	shl    $0x3,%eax
c0101a32:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101a37:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101a3c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c0101a40:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101a43:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101a46:	76 c7                	jbe    c0101a0f <page_init+0xef>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101a48:	c7 45 dc 00 10 00 00 	movl   $0x1000,-0x24(%ebp)
c0101a4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a52:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101a57:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101a5a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101a5d:	ba 00 00 00 00       	mov    $0x0,%edx
c0101a62:	f7 75 dc             	divl   -0x24(%ebp)
c0101a65:	89 d0                	mov    %edx,%eax
c0101a67:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a6a:	29 c2                	sub    %eax,%edx
c0101a6c:	89 d0                	mov    %edx,%eax
c0101a6e:	89 c2                	mov    %eax,%edx
c0101a70:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101a75:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101a7c:	00 
c0101a7d:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101a84:	00 
c0101a85:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a89:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101a90:	00 
c0101a91:	89 04 24             	mov    %eax,(%esp)
c0101a94:	e8 2c 05 00 00       	call   c0101fc5 <boot_map_region>
}
c0101a99:	83 c4 54             	add    $0x54,%esp
c0101a9c:	5b                   	pop    %ebx
c0101a9d:	5d                   	pop    %ebp
c0101a9e:	c3                   	ret    

c0101a9f <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101a9f:	55                   	push   %ebp
c0101aa0:	89 e5                	mov    %esp,%ebp
c0101aa2:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101aa5:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101aaa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101aad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101ab1:	75 07                	jne    c0101aba <page_alloc+0x1b>
c0101ab3:	b8 00 00 00 00       	mov    $0x0,%eax
c0101ab8:	eb 45                	jmp    c0101aff <page_alloc+0x60>
	if (alloc_flags & ALLOC_ZERO) {
c0101aba:	8b 45 08             	mov    0x8(%ebp),%eax
c0101abd:	83 e0 01             	and    $0x1,%eax
c0101ac0:	85 c0                	test   %eax,%eax
c0101ac2:	74 23                	je     c0101ae7 <page_alloc+0x48>
		memset(page2kva(p), 0, PGSIZE);
c0101ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ac7:	89 04 24             	mov    %eax,(%esp)
c0101aca:	e8 26 fe ff ff       	call   c01018f5 <page2kva>
c0101acf:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101ad6:	00 
c0101ad7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101ade:	00 
c0101adf:	89 04 24             	mov    %eax,(%esp)
c0101ae2:	e8 2e 11 00 00       	call   c0102c15 <memset>
	}
	page_free_list = page_free_list -> pp_link;
c0101ae7:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101aec:	8b 00                	mov    (%eax),%eax
c0101aee:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	p -> pp_link = NULL;
c0101af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101af6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101aff:	c9                   	leave  
c0101b00:	c3                   	ret    

c0101b01 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101b01:	55                   	push   %ebp
c0101b02:	89 e5                	mov    %esp,%ebp
c0101b04:	83 ec 18             	sub    $0x18,%esp
	assert(pp->pp_ref == 0 && pp->pp_link == NULL);
c0101b07:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b0a:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b0e:	66 85 c0             	test   %ax,%ax
c0101b11:	75 09                	jne    c0101b1c <page_free+0x1b>
c0101b13:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b16:	8b 00                	mov    (%eax),%eax
c0101b18:	85 c0                	test   %eax,%eax
c0101b1a:	74 24                	je     c0101b40 <page_free+0x3f>
c0101b1c:	c7 44 24 0c 50 3d 10 	movl   $0xc0103d50,0xc(%esp)
c0101b23:	c0 
c0101b24:	c7 44 24 08 77 3d 10 	movl   $0xc0103d77,0x8(%esp)
c0101b2b:	c0 
c0101b2c:	c7 44 24 04 7b 00 00 	movl   $0x7b,0x4(%esp)
c0101b33:	00 
c0101b34:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101b3b:	e8 c4 0b 00 00       	call   c0102704 <_panic>
	pp->pp_link = page_free_list;
c0101b40:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101b46:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b49:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101b4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b4e:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101b53:	c9                   	leave  
c0101b54:	c3                   	ret    

c0101b55 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0101b55:	55                   	push   %ebp
c0101b56:	89 e5                	mov    %esp,%ebp
c0101b58:	83 ec 18             	sub    $0x18,%esp
	if (--pp->pp_ref == 0)
c0101b5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b5e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b62:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b68:	66 89 50 04          	mov    %dx,0x4(%eax)
c0101b6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b6f:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b73:	66 85 c0             	test   %ax,%ax
c0101b76:	75 0b                	jne    c0101b83 <page_decref+0x2e>
		page_free(pp);
c0101b78:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b7b:	89 04 24             	mov    %eax,(%esp)
c0101b7e:	e8 7e ff ff ff       	call   c0101b01 <page_free>
}
c0101b83:	c9                   	leave  
c0101b84:	c3                   	ret    

c0101b85 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0101b85:	55                   	push   %ebp
c0101b86:	89 e5                	mov    %esp,%ebp
c0101b88:	53                   	push   %ebx
c0101b89:	83 ec 24             	sub    $0x24,%esp
	pte_t *pgtable;
	int pdx = PDX(va);
c0101b8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b8f:	c1 e8 16             	shr    $0x16,%eax
c0101b92:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pgdir[pdx] & PTE_P) {
c0101b95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101b98:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101b9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ba2:	01 d0                	add    %edx,%eax
c0101ba4:	8b 00                	mov    (%eax),%eax
c0101ba6:	83 e0 01             	and    $0x1,%eax
c0101ba9:	85 c0                	test   %eax,%eax
c0101bab:	74 33                	je     c0101be0 <pgdir_walk+0x5b>
		pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
c0101bad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101bb0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101bb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bba:	01 d0                	add    %edx,%eax
c0101bbc:	8b 00                	mov    (%eax),%eax
c0101bbe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101bc3:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101bc7:	c7 44 24 04 a7 00 00 	movl   $0xa7,0x4(%esp)
c0101bce:	00 
c0101bcf:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101bd6:	e8 86 fc ff ff       	call   c0101861 <_kaddr>
c0101bdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bde:	eb 7b                	jmp    c0101c5b <pgdir_walk+0xd6>
	}
	else {
		if (create == false) return NULL;
c0101be0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101be4:	75 0a                	jne    c0101bf0 <pgdir_walk+0x6b>
c0101be6:	b8 00 00 00 00       	mov    $0x0,%eax
c0101beb:	e9 88 00 00 00       	jmp    c0101c78 <pgdir_walk+0xf3>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0101bf0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101bf7:	e8 a3 fe ff ff       	call   c0101a9f <page_alloc>
c0101bfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (p == NULL) return NULL;
c0101bff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101c03:	75 07                	jne    c0101c0c <pgdir_walk+0x87>
c0101c05:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c0a:	eb 6c                	jmp    c0101c78 <pgdir_walk+0xf3>
		pgtable = page2kva(p);
c0101c0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c0f:	89 04 24             	mov    %eax,(%esp)
c0101c12:	e8 de fc ff ff       	call   c01018f5 <page2kva>
c0101c17:	89 45 f4             	mov    %eax,-0xc(%ebp)
		p -> pp_ref ++;
c0101c1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c1d:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101c21:	8d 50 01             	lea    0x1(%eax),%edx
c0101c24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c27:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[pdx] = PADDR(pgtable) | PTE_P | PTE_W | PTE_U;
c0101c2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101c2e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c35:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c38:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c3e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101c42:	c7 44 24 04 af 00 00 	movl   $0xaf,0x4(%esp)
c0101c49:	00 
c0101c4a:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101c51:	e8 d0 fb ff ff       	call   c0101826 <_paddr>
c0101c56:	83 c8 07             	or     $0x7,%eax
c0101c59:	89 03                	mov    %eax,(%ebx)
	}
	int ptx = PTX(va);
c0101c5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c5e:	c1 e8 0c             	shr    $0xc,%eax
c0101c61:	25 ff 03 00 00       	and    $0x3ff,%eax
c0101c66:	89 45 e8             	mov    %eax,-0x18(%ebp)
	return &pgtable[ptx];
c0101c69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c6c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c76:	01 d0                	add    %edx,%eax

}
c0101c78:	83 c4 24             	add    $0x24,%esp
c0101c7b:	5b                   	pop    %ebx
c0101c7c:	5d                   	pop    %ebp
c0101c7d:	c3                   	ret    

c0101c7e <pg_copy>:

void 
pg_copy(pde_t *src, pde_t *dst)
{
c0101c7e:	55                   	push   %ebp
c0101c7f:	89 e5                	mov    %esp,%ebp
c0101c81:	53                   	push   %ebx
c0101c82:	83 ec 34             	sub    $0x34,%esp
	struct Page *p;
	int pdx, ptx;
	for (pdx=0;pdx<1024;pdx++){
c0101c85:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101c8c:	e9 d3 01 00 00       	jmp    c0101e64 <pg_copy+0x1e6>
		if (src[pdx]&PTE_P){	
c0101c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c94:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c9e:	01 d0                	add    %edx,%eax
c0101ca0:	8b 00                	mov    (%eax),%eax
c0101ca2:	83 e0 01             	and    $0x1,%eax
c0101ca5:	85 c0                	test   %eax,%eax
c0101ca7:	0f 84 b3 01 00 00    	je     c0101e60 <pg_copy+0x1e2>
			if (dst[pdx]&PTE_P) 
c0101cad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101cb0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cba:	01 d0                	add    %edx,%eax
c0101cbc:	8b 00                	mov    (%eax),%eax
c0101cbe:	83 e0 01             	and    $0x1,%eax
c0101cc1:	85 c0                	test   %eax,%eax
c0101cc3:	74 05                	je     c0101cca <pg_copy+0x4c>
				continue;
c0101cc5:	e9 96 01 00 00       	jmp    c0101e60 <pg_copy+0x1e2>
			pte_t *src_table=KADDR(PTE_ADDR(src[pdx]));
c0101cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ccd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101cd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cd7:	01 d0                	add    %edx,%eax
c0101cd9:	8b 00                	mov    (%eax),%eax
c0101cdb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101ce0:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101ce4:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c0101ceb:	00 
c0101cec:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101cf3:	e8 69 fb ff ff       	call   c0101861 <_kaddr>
c0101cf8:	89 45 ec             	mov    %eax,-0x14(%ebp)
			p = page_alloc(ALLOC_ZERO);
c0101cfb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101d02:	e8 98 fd ff ff       	call   c0101a9f <page_alloc>
c0101d07:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c0101d0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d0d:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101d11:	8d 50 01             	lea    0x1(%eax),%edx
c0101d14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d17:	66 89 50 04          	mov    %dx,0x4(%eax)
			dst[pdx]=page2pa(p)|(src[pdx]&0xFFF);
c0101d1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d1e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d25:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d28:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101d2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d2e:	89 04 24             	mov    %eax,(%esp)
c0101d31:	e8 69 fb ff ff       	call   c010189f <page2pa>
c0101d36:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101d39:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101d40:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d43:	01 ca                	add    %ecx,%edx
c0101d45:	8b 12                	mov    (%edx),%edx
c0101d47:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101d4d:	09 d0                	or     %edx,%eax
c0101d4f:	89 03                	mov    %eax,(%ebx)
			pte_t *dst_table=KADDR(PTE_ADDR(dst[pdx]));
c0101d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d5e:	01 d0                	add    %edx,%eax
c0101d60:	8b 00                	mov    (%eax),%eax
c0101d62:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101d67:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d6b:	c7 44 24 04 c3 00 00 	movl   $0xc3,0x4(%esp)
c0101d72:	00 
c0101d73:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101d7a:	e8 e2 fa ff ff       	call   c0101861 <_kaddr>
c0101d7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (ptx=0;ptx<NPTENTRIES;ptx++){ 
c0101d82:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101d89:	e9 c5 00 00 00       	jmp    c0101e53 <pg_copy+0x1d5>
				if (src_table[ptx]&PTE_P){ 
c0101d8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101d91:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d9b:	01 d0                	add    %edx,%eax
c0101d9d:	8b 00                	mov    (%eax),%eax
c0101d9f:	83 e0 01             	and    $0x1,%eax
c0101da2:	85 c0                	test   %eax,%eax
c0101da4:	0f 84 a5 00 00 00    	je     c0101e4f <pg_copy+0x1d1>
					p = page_alloc(0);
c0101daa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101db1:	e8 e9 fc ff ff       	call   c0101a9f <page_alloc>
c0101db6:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c0101db9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dbc:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101dc0:	8d 50 01             	lea    0x1(%eax),%edx
c0101dc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dc6:	66 89 50 04          	mov    %dx,0x4(%eax)
					dst_table[ptx] = page2pa(p)|(src_table[ptx]&0xFFF);
c0101dca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101dcd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101dd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101dd7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101dda:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ddd:	89 04 24             	mov    %eax,(%esp)
c0101de0:	e8 ba fa ff ff       	call   c010189f <page2pa>
c0101de5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101de8:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101def:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101df2:	01 ca                	add    %ecx,%edx
c0101df4:	8b 12                	mov    (%edx),%edx
c0101df6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101dfc:	09 d0                	or     %edx,%eax
c0101dfe:	89 03                	mov    %eax,(%ebx)
					memcpy(page2kva(p), KADDR(PTE_ADDR(src_table[ptx])), PGSIZE);
c0101e00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e03:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e0d:	01 d0                	add    %edx,%eax
c0101e0f:	8b 00                	mov    (%eax),%eax
c0101e11:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101e16:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e1a:	c7 44 24 04 c9 00 00 	movl   $0xc9,0x4(%esp)
c0101e21:	00 
c0101e22:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101e29:	e8 33 fa ff ff       	call   c0101861 <_kaddr>
c0101e2e:	89 c3                	mov    %eax,%ebx
c0101e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e33:	89 04 24             	mov    %eax,(%esp)
c0101e36:	e8 ba fa ff ff       	call   c01018f5 <page2kva>
c0101e3b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101e42:	00 
c0101e43:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0101e47:	89 04 24             	mov    %eax,(%esp)
c0101e4a:	e8 a9 0d 00 00       	call   c0102bf8 <memcpy>
			pte_t *src_table=KADDR(PTE_ADDR(src[pdx]));
			p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			dst[pdx]=page2pa(p)|(src[pdx]&0xFFF);
			pte_t *dst_table=KADDR(PTE_ADDR(dst[pdx]));
			for (ptx=0;ptx<NPTENTRIES;ptx++){ 
c0101e4f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101e53:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101e5a:	0f 8e 2e ff ff ff    	jle    c0101d8e <pg_copy+0x110>
void 
pg_copy(pde_t *src, pde_t *dst)
{
	struct Page *p;
	int pdx, ptx;
	for (pdx=0;pdx<1024;pdx++){
c0101e60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e64:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101e6b:	0f 8e 20 fe ff ff    	jle    c0101c91 <pg_copy+0x13>
					memcpy(page2kva(p), KADDR(PTE_ADDR(src_table[ptx])), PGSIZE);
				}
			}
		}
	}
}
c0101e71:	83 c4 34             	add    $0x34,%esp
c0101e74:	5b                   	pop    %ebx
c0101e75:	5d                   	pop    %ebp
c0101e76:	c3                   	ret    

c0101e77 <pg_remove>:
void 
pg_remove(pde_t *pgdir)
{
c0101e77:	55                   	push   %ebp
c0101e78:	89 e5                	mov    %esp,%ebp
c0101e7a:	83 ec 28             	sub    $0x28,%esp
	int pdx,ptx;
	for (pdx=0; pdx<1024;pdx++) {
c0101e7d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e84:	e9 fb 00 00 00       	jmp    c0101f84 <pg_remove+0x10d>
		if (pgdir[pdx]&PTE_P) {
c0101e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e8c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e93:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e96:	01 d0                	add    %edx,%eax
c0101e98:	8b 00                	mov    (%eax),%eax
c0101e9a:	83 e0 01             	and    $0x1,%eax
c0101e9d:	85 c0                	test   %eax,%eax
c0101e9f:	0f 84 db 00 00 00    	je     c0101f80 <pg_remove+0x109>
			if (kern_pgdir[pdx]&PTE_P) 
c0101ea5:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101eaa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101ead:	c1 e2 02             	shl    $0x2,%edx
c0101eb0:	01 d0                	add    %edx,%eax
c0101eb2:	8b 00                	mov    (%eax),%eax
c0101eb4:	83 e0 01             	and    $0x1,%eax
c0101eb7:	85 c0                	test   %eax,%eax
c0101eb9:	74 05                	je     c0101ec0 <pg_remove+0x49>
				continue;
c0101ebb:	e9 c0 00 00 00       	jmp    c0101f80 <pg_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[pdx]));
c0101ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ec3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101eca:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ecd:	01 d0                	add    %edx,%eax
c0101ecf:	8b 00                	mov    (%eax),%eax
c0101ed1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101ed6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101eda:	c7 44 24 04 d7 00 00 	movl   $0xd7,0x4(%esp)
c0101ee1:	00 
c0101ee2:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101ee9:	e8 73 f9 ff ff       	call   c0101861 <_kaddr>
c0101eee:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (ptx=0; ptx<NPTENTRIES;ptx++){
c0101ef1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ef8:	eb 42                	jmp    c0101f3c <pg_remove+0xc5>
				if (pgtable[ptx]&PTE_P){
c0101efa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101efd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101f07:	01 d0                	add    %edx,%eax
c0101f09:	8b 00                	mov    (%eax),%eax
c0101f0b:	83 e0 01             	and    $0x1,%eax
c0101f0e:	85 c0                	test   %eax,%eax
c0101f10:	74 26                	je     c0101f38 <pg_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[ptx])));
c0101f12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f15:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101f1f:	01 d0                	add    %edx,%eax
c0101f21:	8b 00                	mov    (%eax),%eax
c0101f23:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101f28:	89 04 24             	mov    %eax,(%esp)
c0101f2b:	e8 86 f9 ff ff       	call   c01018b6 <pa2page>
c0101f30:	89 04 24             	mov    %eax,(%esp)
c0101f33:	e8 1d fc ff ff       	call   c0101b55 <page_decref>
	for (pdx=0; pdx<1024;pdx++) {
		if (pgdir[pdx]&PTE_P) {
			if (kern_pgdir[pdx]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[pdx]));
			for (ptx=0; ptx<NPTENTRIES;ptx++){
c0101f38:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f3c:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101f43:	7e b5                	jle    c0101efa <pg_remove+0x83>
				if (pgtable[ptx]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[ptx])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[pdx])));
c0101f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f48:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f52:	01 d0                	add    %edx,%eax
c0101f54:	8b 00                	mov    (%eax),%eax
c0101f56:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101f5b:	89 04 24             	mov    %eax,(%esp)
c0101f5e:	e8 53 f9 ff ff       	call   c01018b6 <pa2page>
c0101f63:	89 04 24             	mov    %eax,(%esp)
c0101f66:	e8 ea fb ff ff       	call   c0101b55 <page_decref>
			pgdir[pdx]=0;
c0101f6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f6e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f75:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f78:	01 d0                	add    %edx,%eax
c0101f7a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
void 
pg_remove(pde_t *pgdir)
{
	int pdx,ptx;
	for (pdx=0; pdx<1024;pdx++) {
c0101f80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101f84:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101f8b:	0f 8e f8 fe ff ff    	jle    c0101e89 <pg_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[pdx])));
			pgdir[pdx]=0;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c0101f91:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f94:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101f98:	c7 44 24 04 e1 00 00 	movl   $0xe1,0x4(%esp)
c0101f9f:	00 
c0101fa0:	c7 04 24 39 3d 10 c0 	movl   $0xc0103d39,(%esp)
c0101fa7:	e8 7a f8 ff ff       	call   c0101826 <_paddr>
c0101fac:	89 04 24             	mov    %eax,(%esp)
c0101faf:	e8 02 f9 ff ff       	call   c01018b6 <pa2page>
c0101fb4:	89 04 24             	mov    %eax,(%esp)
c0101fb7:	e8 99 fb ff ff       	call   c0101b55 <page_decref>
	pgdir=NULL;
c0101fbc:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c0101fc3:	c9                   	leave  
c0101fc4:	c3                   	ret    

c0101fc5 <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c0101fc5:	55                   	push   %ebp
c0101fc6:	89 e5                	mov    %esp,%ebp
c0101fc8:	83 ec 28             	sub    $0x28,%esp
	int i,n;
	n=size/PGSIZE;
c0101fcb:	8b 45 10             	mov    0x10(%ebp),%eax
c0101fce:	c1 e8 0c             	shr    $0xc,%eax
c0101fd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (i = 0; i < n; i ++) {
c0101fd4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101fdb:	eb 47                	jmp    c0102024 <boot_map_region+0x5f>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0101fdd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fe0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101fe7:	00 
c0101fe8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101fec:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fef:	89 04 24             	mov    %eax,(%esp)
c0101ff2:	e8 8e fb ff ff       	call   c0101b85 <pgdir_walk>
c0101ff7:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (pte == NULL) return;
c0101ffa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101ffe:	75 02                	jne    c0102002 <boot_map_region+0x3d>
c0102000:	eb 2a                	jmp    c010202c <boot_map_region+0x67>
		*pte = pa | perm | PTE_P;
c0102002:	8b 45 18             	mov    0x18(%ebp),%eax
c0102005:	0b 45 14             	or     0x14(%ebp),%eax
c0102008:	83 c8 01             	or     $0x1,%eax
c010200b:	89 c2                	mov    %eax,%edx
c010200d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102010:	89 10                	mov    %edx,(%eax)
		va += PGSIZE;
c0102012:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa += PGSIZE;
c0102019:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i,n;
	n=size/PGSIZE;
	for (i = 0; i < n; i ++) {
c0102020:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102024:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102027:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010202a:	7c b1                	jl     c0101fdd <boot_map_region+0x18>
		if (pte == NULL) return;
		*pte = pa | perm | PTE_P;
		va += PGSIZE;
		pa += PGSIZE;
	}
}
c010202c:	c9                   	leave  
c010202d:	c3                   	ret    

c010202e <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c010202e:	55                   	push   %ebp
c010202f:	89 e5                	mov    %esp,%ebp
c0102031:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, true);
c0102034:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010203b:	00 
c010203c:	8b 45 10             	mov    0x10(%ebp),%eax
c010203f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102043:	8b 45 08             	mov    0x8(%ebp),%eax
c0102046:	89 04 24             	mov    %eax,(%esp)
c0102049:	e8 37 fb ff ff       	call   c0101b85 <pgdir_walk>
c010204e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c0102051:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102055:	75 07                	jne    c010205e <page_insert+0x30>
		return -1;
c0102057:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010205c:	eb 73                	jmp    c01020d1 <page_insert+0xa3>
	}
	physaddr_t pa = page2pa(pp);
c010205e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102061:	89 04 24             	mov    %eax,(%esp)
c0102064:	e8 36 f8 ff ff       	call   c010189f <page2pa>
c0102069:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (*pte & PTE_P) {
c010206c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010206f:	8b 00                	mov    (%eax),%eax
c0102071:	83 e0 01             	and    $0x1,%eax
c0102074:	85 c0                	test   %eax,%eax
c0102076:	74 33                	je     c01020ab <page_insert+0x7d>
		if (PTE_ADDR(*pte) == pa) {
c0102078:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010207b:	8b 00                	mov    (%eax),%eax
c010207d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102082:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0102085:	75 12                	jne    c0102099 <page_insert+0x6b>
			*pte = pa | perm | PTE_P;
c0102087:	8b 45 14             	mov    0x14(%ebp),%eax
c010208a:	0b 45 f0             	or     -0x10(%ebp),%eax
c010208d:	83 c8 01             	or     $0x1,%eax
c0102090:	89 c2                	mov    %eax,%edx
c0102092:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102095:	89 10                	mov    %edx,(%eax)
c0102097:	eb 12                	jmp    c01020ab <page_insert+0x7d>
		}
		else {
			page_remove(pgdir, va);
c0102099:	8b 45 10             	mov    0x10(%ebp),%eax
c010209c:	89 44 24 04          	mov    %eax,0x4(%esp)
c01020a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01020a3:	89 04 24             	mov    %eax,(%esp)
c01020a6:	e8 7a 00 00 00       	call   c0102125 <page_remove>
		}
	}
	*pte = pa | perm | PTE_P;
c01020ab:	8b 45 14             	mov    0x14(%ebp),%eax
c01020ae:	0b 45 f0             	or     -0x10(%ebp),%eax
c01020b1:	83 c8 01             	or     $0x1,%eax
c01020b4:	89 c2                	mov    %eax,%edx
c01020b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020b9:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c01020bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020be:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01020c2:	8d 50 01             	lea    0x1(%eax),%edx
c01020c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020c8:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c01020cc:	b8 00 00 00 00       	mov    $0x0,%eax

}
c01020d1:	c9                   	leave  
c01020d2:	c3                   	ret    

c01020d3 <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c01020d3:	55                   	push   %ebp
c01020d4:	89 e5                	mov    %esp,%ebp
c01020d6:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, false);
c01020d9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01020e0:	00 
c01020e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020e4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01020e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01020eb:	89 04 24             	mov    %eax,(%esp)
c01020ee:	e8 92 fa ff ff       	call   c0101b85 <pgdir_walk>
c01020f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) return NULL;
c01020f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01020fa:	75 07                	jne    c0102103 <page_lookup+0x30>
c01020fc:	b8 00 00 00 00       	mov    $0x0,%eax
c0102101:	eb 20                	jmp    c0102123 <page_lookup+0x50>
	if (pte_store != NULL) *pte_store = pte;
c0102103:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102107:	74 08                	je     c0102111 <page_lookup+0x3e>
c0102109:	8b 45 10             	mov    0x10(%ebp),%eax
c010210c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010210f:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(*pte));
c0102111:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102114:	8b 00                	mov    (%eax),%eax
c0102116:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010211b:	89 04 24             	mov    %eax,(%esp)
c010211e:	e8 93 f7 ff ff       	call   c01018b6 <pa2page>
}
c0102123:	c9                   	leave  
c0102124:	c3                   	ret    

c0102125 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c0102125:	55                   	push   %ebp
c0102126:	89 e5                	mov    %esp,%ebp
c0102128:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte;
	pte_t **pte_store = &pte;
c010212b:	8d 45 ec             	lea    -0x14(%ebp),%eax
c010212e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct Page *p = page_lookup(pgdir, va, pte_store);
c0102131:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102134:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102138:	8b 45 0c             	mov    0xc(%ebp),%eax
c010213b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010213f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102142:	89 04 24             	mov    %eax,(%esp)
c0102145:	e8 89 ff ff ff       	call   c01020d3 <page_lookup>
c010214a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p != NULL) {
c010214d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102151:	74 28                	je     c010217b <page_remove+0x56>
		**pte_store = 0;
c0102153:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102156:	8b 00                	mov    (%eax),%eax
c0102158:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c010215e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102161:	89 04 24             	mov    %eax,(%esp)
c0102164:	e8 ec f9 ff ff       	call   c0101b55 <page_decref>
		tlb_invalidate(pgdir, va);
c0102169:	8b 45 0c             	mov    0xc(%ebp),%eax
c010216c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102170:	8b 45 08             	mov    0x8(%ebp),%eax
c0102173:	89 04 24             	mov    %eax,(%esp)
c0102176:	e8 02 00 00 00       	call   c010217d <tlb_invalidate>
	}
}
c010217b:	c9                   	leave  
c010217c:	c3                   	ret    

c010217d <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c010217d:	55                   	push   %ebp
c010217e:	89 e5                	mov    %esp,%ebp
c0102180:	83 ec 10             	sub    $0x10,%esp
c0102183:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102186:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c0102189:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010218c:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c010218f:	c9                   	leave  
c0102190:	c3                   	ret    

c0102191 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0102191:	55                   	push   %ebp
c0102192:	89 e5                	mov    %esp,%ebp
c0102194:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0102197:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010219b:	75 24                	jne    c01021c1 <list_add+0x30>
c010219d:	c7 44 24 0c 8c 3d 10 	movl   $0xc0103d8c,0xc(%esp)
c01021a4:	c0 
c01021a5:	c7 44 24 08 99 3d 10 	movl   $0xc0103d99,0x8(%esp)
c01021ac:	c0 
c01021ad:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c01021b4:	00 
c01021b5:	c7 04 24 ae 3d 10 c0 	movl   $0xc0103dae,(%esp)
c01021bc:	e8 43 05 00 00       	call   c0102704 <_panic>
	data->prev = prev;
c01021c1:	8b 45 10             	mov    0x10(%ebp),%eax
c01021c4:	8b 55 08             	mov    0x8(%ebp),%edx
c01021c7:	89 10                	mov    %edx,(%eax)
	data->next = next;
c01021c9:	8b 45 10             	mov    0x10(%ebp),%eax
c01021cc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01021cf:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c01021d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01021d6:	74 09                	je     c01021e1 <list_add+0x50>
c01021d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01021db:	8b 55 10             	mov    0x10(%ebp),%edx
c01021de:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c01021e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01021e5:	74 08                	je     c01021ef <list_add+0x5e>
c01021e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021ea:	8b 55 10             	mov    0x10(%ebp),%edx
c01021ed:	89 10                	mov    %edx,(%eax)
}
c01021ef:	c9                   	leave  
c01021f0:	c3                   	ret    

c01021f1 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c01021f1:	55                   	push   %ebp
c01021f2:	89 e5                	mov    %esp,%ebp
c01021f4:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01021f7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01021fb:	75 24                	jne    c0102221 <list_add_before+0x30>
c01021fd:	c7 44 24 0c c4 3d 10 	movl   $0xc0103dc4,0xc(%esp)
c0102204:	c0 
c0102205:	c7 44 24 08 99 3d 10 	movl   $0xc0103d99,0x8(%esp)
c010220c:	c0 
c010220d:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0102214:	00 
c0102215:	c7 04 24 ae 3d 10 c0 	movl   $0xc0103dae,(%esp)
c010221c:	e8 e3 04 00 00       	call   c0102704 <_panic>
	list_add(one->prev, one, data);
c0102221:	8b 45 08             	mov    0x8(%ebp),%eax
c0102224:	8b 00                	mov    (%eax),%eax
c0102226:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102229:	89 54 24 08          	mov    %edx,0x8(%esp)
c010222d:	8b 55 08             	mov    0x8(%ebp),%edx
c0102230:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102234:	89 04 24             	mov    %eax,(%esp)
c0102237:	e8 55 ff ff ff       	call   c0102191 <list_add>
}
c010223c:	c9                   	leave  
c010223d:	c3                   	ret    

c010223e <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c010223e:	55                   	push   %ebp
c010223f:	89 e5                	mov    %esp,%ebp
c0102241:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0102244:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102248:	75 24                	jne    c010226e <list_del+0x30>
c010224a:	c7 44 24 0c 8c 3d 10 	movl   $0xc0103d8c,0xc(%esp)
c0102251:	c0 
c0102252:	c7 44 24 08 99 3d 10 	movl   $0xc0103d99,0x8(%esp)
c0102259:	c0 
c010225a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0102261:	00 
c0102262:	c7 04 24 ae 3d 10 c0 	movl   $0xc0103dae,(%esp)
c0102269:	e8 96 04 00 00       	call   c0102704 <_panic>
	list *prev = data->prev;
c010226e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102271:	8b 00                	mov    (%eax),%eax
c0102273:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0102276:	8b 45 08             	mov    0x8(%ebp),%eax
c0102279:	8b 40 04             	mov    0x4(%eax),%eax
c010227c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c010227f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102283:	74 09                	je     c010228e <list_del+0x50>
c0102285:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102288:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010228b:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c010228e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102292:	74 08                	je     c010229c <list_del+0x5e>
c0102294:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102297:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010229a:	89 10                	mov    %edx,(%eax)
}
c010229c:	c9                   	leave  
c010229d:	c3                   	ret    

c010229e <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c010229e:	55                   	push   %ebp
c010229f:	89 e5                	mov    %esp,%ebp
c01022a1:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01022a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01022a8:	75 24                	jne    c01022ce <list_empty+0x30>
c01022aa:	c7 44 24 0c c4 3d 10 	movl   $0xc0103dc4,0xc(%esp)
c01022b1:	c0 
c01022b2:	c7 44 24 08 99 3d 10 	movl   $0xc0103d99,0x8(%esp)
c01022b9:	c0 
c01022ba:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
c01022c1:	00 
c01022c2:	c7 04 24 ae 3d 10 c0 	movl   $0xc0103dae,(%esp)
c01022c9:	e8 36 04 00 00       	call   c0102704 <_panic>
	return one == one->next;
c01022ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01022d1:	8b 40 04             	mov    0x4(%eax),%eax
c01022d4:	3b 45 08             	cmp    0x8(%ebp),%eax
c01022d7:	0f 94 c0             	sete   %al
c01022da:	0f b6 c0             	movzbl %al,%eax
}
c01022dd:	c9                   	leave  
c01022de:	c3                   	ret    

c01022df <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01022df:	55                   	push   %ebp
c01022e0:	89 e5                	mov    %esp,%ebp
c01022e2:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01022e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01022e8:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01022ed:	77 21                	ja     c0102310 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01022ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01022f2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01022f6:	c7 44 24 08 d0 3d 10 	movl   $0xc0103dd0,0x8(%esp)
c01022fd:	c0 
c01022fe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102301:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102305:	8b 45 08             	mov    0x8(%ebp),%eax
c0102308:	89 04 24             	mov    %eax,(%esp)
c010230b:	e8 f4 03 00 00       	call   c0102704 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0102310:	8b 45 10             	mov    0x10(%ebp),%eax
c0102313:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0102318:	c9                   	leave  
c0102319:	c3                   	ret    

c010231a <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
c010231a:	55                   	push   %ebp
c010231b:	89 e5                	mov    %esp,%ebp
c010231d:	83 ec 38             	sub    $0x38,%esp
	list *one,*ne;
	list *bl=&block;
c0102320:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c0102327:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010232a:	8b 40 04             	mov    0x4(%eax),%eax
c010232d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102330:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102333:	8b 40 04             	mov    0x4(%eax),%eax
c0102336:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102339:	eb 4f                	jmp    c010238a <schedule+0x70>
		PCB *p=list_entry(one,PCB,plist);
c010233b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010233e:	83 e8 08             	sub    $0x8,%eax
c0102341:	89 45 e8             	mov    %eax,-0x18(%ebp)
		p->timecount--;
c0102344:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102347:	8b 40 1c             	mov    0x1c(%eax),%eax
c010234a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010234d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102350:	89 50 1c             	mov    %edx,0x1c(%eax)
		if(p->timecount==0){
c0102353:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102356:	8b 40 1c             	mov    0x1c(%eax),%eax
c0102359:	85 c0                	test   %eax,%eax
c010235b:	75 1e                	jne    c010237b <schedule+0x61>
			list_del(one);
c010235d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102360:	89 04 24             	mov    %eax,(%esp)
c0102363:	e8 d6 fe ff ff       	call   c010223e <list_del>
			list_add_before(&ready,one);
c0102368:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010236b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010236f:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102376:	e8 76 fe ff ff       	call   c01021f1 <list_add_before>
//extern TSS tss;
void schedule(){
	list *one,*ne;
	list *bl=&block;
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c010237b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010237e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102381:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102384:	8b 40 04             	mov    0x4(%eax),%eax
c0102387:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010238a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010238d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0102390:	75 a9                	jne    c010233b <schedule+0x21>
		if(p->timecount==0){
			list_del(one);
			list_add_before(&ready,one);
		}
	}
	if(!list_empty(&ready)){
c0102392:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102399:	e8 00 ff ff ff       	call   c010229e <list_empty>
c010239e:	85 c0                	test   %eax,%eax
c01023a0:	75 7e                	jne    c0102420 <schedule+0x106>
		list *re=&ready;
c01023a2:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c01023a9:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01023ae:	8b 40 04             	mov    0x4(%eax),%eax
c01023b1:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c01023b4:	75 0d                	jne    c01023c3 <schedule+0xa9>
			now=re->next;
c01023b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01023b9:	8b 40 04             	mov    0x4(%eax),%eax
c01023bc:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c01023c1:	eb 0d                	jmp    c01023d0 <schedule+0xb6>
		else
			now=now->next;
c01023c3:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01023c8:	8b 40 04             	mov    0x4(%eax),%eax
c01023cb:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c01023d0:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01023d5:	83 e8 08             	sub    $0x8,%eax
c01023d8:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c01023dd:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023e2:	05 f8 0f 00 00       	add    $0xff8,%eax
c01023e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c01023ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01023ed:	89 04 24             	mov    %eax,(%esp)
c01023f0:	e8 fe 01 00 00       	call   c01025f3 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c01023f5:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023fa:	8b 40 04             	mov    0x4(%eax),%eax
c01023fd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102401:	c7 44 24 04 1e 00 00 	movl   $0x1e,0x4(%esp)
c0102408:	00 
c0102409:	c7 04 24 f4 3d 10 c0 	movl   $0xc0103df4,(%esp)
c0102410:	e8 ca fe ff ff       	call   c01022df <_paddr>
c0102415:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0102418:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010241b:	0f 22 d8             	mov    %eax,%cr3
c010241e:	eb 3a                	jmp    c010245a <schedule+0x140>
		
	}
	else{
		pcbnow=&init;
c0102420:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0102427:	3f 16 c0 
		now=&ready;
c010242a:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0102431:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c0102434:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0102439:	89 44 24 08          	mov    %eax,0x8(%esp)
c010243d:	c7 44 24 04 24 00 00 	movl   $0x24,0x4(%esp)
c0102444:	00 
c0102445:	c7 04 24 f4 3d 10 c0 	movl   $0xc0103df4,(%esp)
c010244c:	e8 8e fe ff ff       	call   c01022df <_paddr>
c0102451:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102454:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102457:	0f 22 d8             	mov    %eax,%cr3
	}
}
c010245a:	c9                   	leave  
c010245b:	c3                   	ret    

c010245c <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c010245c:	55                   	push   %ebp
c010245d:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c010245f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102462:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0102467:	8b 45 08             	mov    0x8(%ebp),%eax
c010246a:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c0102470:	8b 45 08             	mov    0x8(%ebp),%eax
c0102473:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0102477:	8b 45 10             	mov    0x10(%ebp),%eax
c010247a:	83 e0 0f             	and    $0xf,%eax
c010247d:	89 c2                	mov    %eax,%edx
c010247f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102482:	89 d1                	mov    %edx,%ecx
c0102484:	83 e1 0f             	and    $0xf,%ecx
c0102487:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010248b:	83 e2 f0             	and    $0xfffffff0,%edx
c010248e:	09 ca                	or     %ecx,%edx
c0102490:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c0102493:	8b 45 08             	mov    0x8(%ebp),%eax
c0102496:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010249a:	83 ca 10             	or     $0x10,%edx
c010249d:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c01024a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024a3:	83 e0 03             	and    $0x3,%eax
c01024a6:	89 c2                	mov    %eax,%edx
c01024a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ab:	83 e2 03             	and    $0x3,%edx
c01024ae:	89 d1                	mov    %edx,%ecx
c01024b0:	c1 e1 05             	shl    $0x5,%ecx
c01024b3:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01024b7:	83 e2 9f             	and    $0xffffff9f,%edx
c01024ba:	09 ca                	or     %ecx,%edx
c01024bc:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c01024bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01024c2:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01024c6:	83 ca 80             	or     $0xffffff80,%edx
c01024c9:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c01024cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01024cf:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024d3:	83 ca 0f             	or     $0xf,%edx
c01024d6:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c01024d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01024dc:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024e0:	83 e2 ef             	and    $0xffffffef,%edx
c01024e3:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c01024e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01024e9:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024ed:	83 e2 df             	and    $0xffffffdf,%edx
c01024f0:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c01024f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01024f6:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024fa:	83 ca 40             	or     $0x40,%edx
c01024fd:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c0102500:	8b 45 08             	mov    0x8(%ebp),%eax
c0102503:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102507:	83 ca 80             	or     $0xffffff80,%edx
c010250a:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c010250d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102510:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c0102514:	5d                   	pop    %ebp
c0102515:	c3                   	ret    

c0102516 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c0102516:	55                   	push   %ebp
c0102517:	89 e5                	mov    %esp,%ebp
c0102519:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c010251c:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c0102523:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c0102526:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c010252d:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c0102534:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102537:	89 c2                	mov    %eax,%edx
c0102539:	8b 45 08             	mov    0x8(%ebp),%eax
c010253c:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c010253f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102542:	89 c2                	mov    %eax,%edx
c0102544:	8b 45 08             	mov    0x8(%ebp),%eax
c0102547:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c010254b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010254e:	c1 e8 10             	shr    $0x10,%eax
c0102551:	89 c2                	mov    %eax,%edx
c0102553:	8b 45 08             	mov    0x8(%ebp),%eax
c0102556:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c0102559:	8b 45 08             	mov    0x8(%ebp),%eax
c010255c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102560:	83 e2 f0             	and    $0xfffffff0,%edx
c0102563:	83 ca 09             	or     $0x9,%edx
c0102566:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c0102569:	8b 45 08             	mov    0x8(%ebp),%eax
c010256c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102570:	83 e2 ef             	and    $0xffffffef,%edx
c0102573:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c0102576:	8b 45 08             	mov    0x8(%ebp),%eax
c0102579:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010257d:	83 ca 60             	or     $0x60,%edx
c0102580:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102583:	8b 45 08             	mov    0x8(%ebp),%eax
c0102586:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010258a:	83 ca 80             	or     $0xffffff80,%edx
c010258d:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102590:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102593:	c1 e8 10             	shr    $0x10,%eax
c0102596:	83 e0 0f             	and    $0xf,%eax
c0102599:	89 c2                	mov    %eax,%edx
c010259b:	8b 45 08             	mov    0x8(%ebp),%eax
c010259e:	89 d1                	mov    %edx,%ecx
c01025a0:	83 e1 0f             	and    $0xf,%ecx
c01025a3:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025a7:	83 e2 f0             	and    $0xfffffff0,%edx
c01025aa:	09 ca                	or     %ecx,%edx
c01025ac:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c01025af:	8b 45 08             	mov    0x8(%ebp),%eax
c01025b2:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025b6:	83 e2 ef             	and    $0xffffffef,%edx
c01025b9:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c01025bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01025bf:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025c3:	83 e2 df             	and    $0xffffffdf,%edx
c01025c6:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c01025c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01025cc:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025d0:	83 ca 40             	or     $0x40,%edx
c01025d3:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c01025d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01025d9:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025dd:	83 e2 7f             	and    $0x7f,%edx
c01025e0:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c01025e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01025e6:	c1 e8 18             	shr    $0x18,%eax
c01025e9:	89 c2                	mov    %eax,%edx
c01025eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ee:	88 50 07             	mov    %dl,0x7(%eax)
}
c01025f1:	c9                   	leave  
c01025f2:	c3                   	ret    

c01025f3 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c01025f3:	55                   	push   %ebp
c01025f4:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c01025f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01025f9:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c01025fe:	5d                   	pop    %ebp
c01025ff:	c3                   	ret    

c0102600 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0102600:	55                   	push   %ebp
c0102601:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0102603:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102606:	83 e8 01             	sub    $0x1,%eax
c0102609:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c010260f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102612:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102618:	8b 45 08             	mov    0x8(%ebp),%eax
c010261b:	c1 e8 10             	shr    $0x10,%eax
c010261e:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c0102624:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c0102629:	0f 01 10             	lgdtl  (%eax)
}
c010262c:	5d                   	pop    %ebp
c010262d:	c3                   	ret    

c010262e <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c010262e:	55                   	push   %ebp
c010262f:	89 e5                	mov    %esp,%ebp
c0102631:	83 ec 04             	sub    $0x4,%esp
c0102634:	8b 45 08             	mov    0x8(%ebp),%eax
c0102637:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c010263b:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c010263f:	0f 00 d8             	ltr    %ax
}
c0102642:	c9                   	leave  
c0102643:	c3                   	ret    

c0102644 <init_segment>:

void
init_segment(void) {
c0102644:	55                   	push   %ebp
c0102645:	89 e5                	mov    %esp,%ebp
c0102647:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c010264a:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c0102651:	00 
c0102652:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102659:	00 
c010265a:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102661:	e8 af 05 00 00       	call   c0102c15 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c0102666:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010266d:	00 
c010266e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102675:	00 
c0102676:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c010267d:	e8 da fd ff ff       	call   c010245c <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0102682:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102689:	00 
c010268a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102691:	00 
c0102692:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c0102699:	e8 be fd ff ff       	call   c010245c <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c010269e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01026a5:	00 
c01026a6:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c01026ad:	00 
c01026ae:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c01026b5:	e8 a2 fd ff ff       	call   c010245c <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c01026ba:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c01026c1:	00 
c01026c2:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c01026c9:	00 
c01026ca:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c01026d1:	e8 86 fd ff ff       	call   c010245c <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c01026d6:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c01026dd:	00 
c01026de:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c01026e5:	e8 16 ff ff ff       	call   c0102600 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c01026ea:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c01026f1:	e8 20 fe ff ff       	call   c0102516 <set_tss>
	load_tr(USEL(SEG_TSS));
c01026f6:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c01026fd:	e8 2c ff ff ff       	call   c010262e <load_tr>
}
c0102702:	c9                   	leave  
c0102703:	c3                   	ret    

c0102704 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c0102704:	55                   	push   %ebp
c0102705:	89 e5                	mov    %esp,%ebp
c0102707:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c010270a:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c010270f:	85 c0                	test   %eax,%eax
c0102711:	74 01                	je     c0102714 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0102713:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c0102714:	8b 45 10             	mov    0x10(%ebp),%eax
c0102717:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c010271c:	fa                   	cli    
c010271d:	fc                   	cld    

	va_start(ap, fmt);
c010271e:	8d 45 14             	lea    0x14(%ebp),%eax
c0102721:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0102724:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102727:	89 44 24 08          	mov    %eax,0x8(%esp)
c010272b:	8b 45 08             	mov    0x8(%ebp),%eax
c010272e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102732:	c7 04 24 0c 3e 10 c0 	movl   $0xc0103e0c,(%esp)
c0102739:	e8 f5 00 00 00       	call   c0102833 <printk>
	vprintk(fmt, ap);
c010273e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102741:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102745:	8b 45 10             	mov    0x10(%ebp),%eax
c0102748:	89 04 24             	mov    %eax,(%esp)
c010274b:	e8 b0 00 00 00       	call   c0102800 <vprintk>
	printk("\n");
c0102750:	c7 04 24 24 3e 10 c0 	movl   $0xc0103e24,(%esp)
c0102757:	e8 d7 00 00 00       	call   c0102833 <printk>
	va_end(ap);

}
c010275c:	c9                   	leave  
c010275d:	c3                   	ret    

c010275e <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c010275e:	55                   	push   %ebp
c010275f:	89 e5                	mov    %esp,%ebp
c0102761:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102764:	8d 45 14             	lea    0x14(%ebp),%eax
c0102767:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c010276a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010276d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102771:	8b 45 08             	mov    0x8(%ebp),%eax
c0102774:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102778:	c7 04 24 26 3e 10 c0 	movl   $0xc0103e26,(%esp)
c010277f:	e8 af 00 00 00       	call   c0102833 <printk>
	vprintk(fmt, ap);
c0102784:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102787:	89 44 24 04          	mov    %eax,0x4(%esp)
c010278b:	8b 45 10             	mov    0x10(%ebp),%eax
c010278e:	89 04 24             	mov    %eax,(%esp)
c0102791:	e8 6a 00 00 00       	call   c0102800 <vprintk>
	printk("\n");
c0102796:	c7 04 24 24 3e 10 c0 	movl   $0xc0103e24,(%esp)
c010279d:	e8 91 00 00 00       	call   c0102833 <printk>
	va_end(ap);
}
c01027a2:	c9                   	leave  
c01027a3:	c3                   	ret    

c01027a4 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c01027a4:	55                   	push   %ebp
c01027a5:	89 e5                	mov    %esp,%ebp
c01027a7:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c01027aa:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01027ae:	75 2b                	jne    c01027db <sys_write+0x37>
		for (i = 0; i < n; i++) {
c01027b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01027b7:	eb 1a                	jmp    c01027d3 <sys_write+0x2f>
			serial_printc(buf[i]);
c01027b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01027bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027bf:	01 d0                	add    %edx,%eax
c01027c1:	0f b6 00             	movzbl (%eax),%eax
c01027c4:	0f be c0             	movsbl %al,%eax
c01027c7:	89 04 24             	mov    %eax,(%esp)
c01027ca:	e8 d7 e2 ff ff       	call   c0100aa6 <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c01027cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01027d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027d6:	3b 45 10             	cmp    0x10(%ebp),%eax
c01027d9:	7c de                	jl     c01027b9 <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c01027db:	8b 45 10             	mov    0x10(%ebp),%eax
c01027de:	c9                   	leave  
c01027df:	c3                   	ret    

c01027e0 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c01027e0:	55                   	push   %ebp
c01027e1:	89 e5                	mov    %esp,%ebp
c01027e3:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c01027e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01027e9:	89 04 24             	mov    %eax,(%esp)
c01027ec:	e8 df e2 ff ff       	call   c0100ad0 <putchar>
	++*cnt;
c01027f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027f4:	8b 00                	mov    (%eax),%eax
c01027f6:	8d 50 01             	lea    0x1(%eax),%edx
c01027f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027fc:	89 10                	mov    %edx,(%eax)
}
c01027fe:	c9                   	leave  
c01027ff:	c3                   	ret    

c0102800 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0102800:	55                   	push   %ebp
c0102801:	89 e5                	mov    %esp,%ebp
c0102803:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102806:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c010280d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102810:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102814:	8b 45 08             	mov    0x8(%ebp),%eax
c0102817:	89 44 24 08          	mov    %eax,0x8(%esp)
c010281b:	8d 45 f4             	lea    -0xc(%ebp),%eax
c010281e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102822:	c7 04 24 e0 27 10 c0 	movl   $0xc01027e0,(%esp)
c0102829:	e8 ef 09 00 00       	call   c010321d <vprintfmt>
	return cnt;
c010282e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102831:	c9                   	leave  
c0102832:	c3                   	ret    

c0102833 <printk>:

int printk(const char *fmt, ...)
{
c0102833:	55                   	push   %ebp
c0102834:	89 e5                	mov    %esp,%ebp
c0102836:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0102839:	8d 45 0c             	lea    0xc(%ebp),%eax
c010283c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c010283f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102842:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102846:	8b 45 08             	mov    0x8(%ebp),%eax
c0102849:	89 04 24             	mov    %eax,(%esp)
c010284c:	e8 af ff ff ff       	call   c0102800 <vprintk>
c0102851:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102854:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102857:	c9                   	leave  
c0102858:	c3                   	ret    

c0102859 <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0102859:	6a 00                	push   $0x0
c010285b:	6a 00                	push   $0x0
c010285d:	e9 a9 00 00 00       	jmp    c010290b <asm_do_irq>

c0102862 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102862:	6a 00                	push   $0x0
c0102864:	6a 01                	push   $0x1
c0102866:	e9 a0 00 00 00       	jmp    c010290b <asm_do_irq>

c010286b <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c010286b:	6a 00                	push   $0x0
c010286d:	6a 02                	push   $0x2
c010286f:	e9 97 00 00 00       	jmp    c010290b <asm_do_irq>

c0102874 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102874:	6a 00                	push   $0x0
c0102876:	6a 03                	push   $0x3
c0102878:	e9 8e 00 00 00       	jmp    c010290b <asm_do_irq>

c010287d <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c010287d:	6a 00                	push   $0x0
c010287f:	6a 04                	push   $0x4
c0102881:	e9 85 00 00 00       	jmp    c010290b <asm_do_irq>

c0102886 <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102886:	6a 00                	push   $0x0
c0102888:	6a 05                	push   $0x5
c010288a:	e9 7c 00 00 00       	jmp    c010290b <asm_do_irq>

c010288f <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c010288f:	6a 00                	push   $0x0
c0102891:	6a 06                	push   $0x6
c0102893:	e9 73 00 00 00       	jmp    c010290b <asm_do_irq>

c0102898 <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0102898:	6a 00                	push   $0x0
c010289a:	6a 07                	push   $0x7
c010289c:	e9 6a 00 00 00       	jmp    c010290b <asm_do_irq>

c01028a1 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c01028a1:	6a 08                	push   $0x8
c01028a3:	e9 63 00 00 00       	jmp    c010290b <asm_do_irq>

c01028a8 <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c01028a8:	6a 00                	push   $0x0
c01028aa:	6a 09                	push   $0x9
c01028ac:	e9 5a 00 00 00       	jmp    c010290b <asm_do_irq>

c01028b1 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c01028b1:	6a 0a                	push   $0xa
c01028b3:	e9 53 00 00 00       	jmp    c010290b <asm_do_irq>

c01028b8 <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c01028b8:	6a 0b                	push   $0xb
c01028ba:	e9 4c 00 00 00       	jmp    c010290b <asm_do_irq>

c01028bf <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c01028bf:	6a 0c                	push   $0xc
c01028c1:	e9 45 00 00 00       	jmp    c010290b <asm_do_irq>

c01028c6 <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c01028c6:	6a 0d                	push   $0xd
c01028c8:	e9 3e 00 00 00       	jmp    c010290b <asm_do_irq>

c01028cd <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c01028cd:	6a 0e                	push   $0xe
c01028cf:	e9 37 00 00 00       	jmp    c010290b <asm_do_irq>

c01028d4 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c01028d4:	6a 00                	push   $0x0
c01028d6:	68 80 00 00 00       	push   $0x80
c01028db:	e9 2b 00 00 00       	jmp    c010290b <asm_do_irq>

c01028e0 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c01028e0:	6a 00                	push   $0x0
c01028e2:	68 e8 03 00 00       	push   $0x3e8
c01028e7:	e9 1f 00 00 00       	jmp    c010290b <asm_do_irq>

c01028ec <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c01028ec:	6a 00                	push   $0x0
c01028ee:	68 e9 03 00 00       	push   $0x3e9
c01028f3:	e9 13 00 00 00       	jmp    c010290b <asm_do_irq>

c01028f8 <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c01028f8:	6a 00                	push   $0x0
c01028fa:	68 f6 03 00 00       	push   $0x3f6
c01028ff:	e9 07 00 00 00       	jmp    c010290b <asm_do_irq>

c0102904 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c0102904:	6a ff                	push   $0xffffffff
c0102906:	e9 00 00 00 00       	jmp    c010290b <asm_do_irq>

c010290b <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c010290b:	fa                   	cli    
	pushl %ds
c010290c:	1e                   	push   %ds
  	pushl %es
c010290d:	06                   	push   %es
  	pushl %fs
c010290e:	0f a0                	push   %fs
  	pushl %gs
c0102910:	0f a8                	push   %gs
	pushal
c0102912:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0102913:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c0102917:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c0102919:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c010291b:	54                   	push   %esp
	call irq_handle
c010291c:	e8 f5 dd ff ff       	call   c0100716 <irq_handle>
	movl pcbnow,%eax
c0102921:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c0102926:	8b 20                	mov    (%eax),%esp
	#addl $4, %esp

	popal
c0102928:	61                   	popa   
	popl %gs
c0102929:	0f a9                	pop    %gs
  	popl %fs
c010292b:	0f a1                	pop    %fs
  	popl %es
c010292d:	07                   	pop    %es
  	popl %ds
c010292e:	1f                   	pop    %ds
	addl $8, %esp
c010292f:	83 c4 08             	add    $0x8,%esp
	sti
c0102932:	fb                   	sti    
	iret
c0102933:	cf                   	iret   
c0102934:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c010293a:	00 00                	add    %al,(%eax)
c010293c:	fe 4f 52             	decb   0x52(%edi)
c010293f:	e4 66                	in     $0x66,%al

c0102940 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102940:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0102947:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0102949:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c010294e:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102951:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102954:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0102959:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c010295c:	b8 63 29 10 c0       	mov    $0xc0102963,%eax
	jmp	*%eax
c0102961:	ff e0                	jmp    *%eax

c0102963 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102963:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0102968:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c010296d:	e8 cd d7 ff ff       	call   c010013f <main>

c0102972 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102972:	eb fe                	jmp    c0102972 <spin>

c0102974 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102974:	55                   	push   %ebp
c0102975:	89 e5                	mov    %esp,%ebp
c0102977:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c010297a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010297e:	78 18                	js     c0102998 <draw_pixel+0x24>
c0102980:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102984:	78 12                	js     c0102998 <draw_pixel+0x24>
c0102986:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c010298d:	7f 09                	jg     c0102998 <draw_pixel+0x24>
c010298f:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102996:	7e 24                	jle    c01029bc <draw_pixel+0x48>
c0102998:	c7 44 24 0c 40 3e 10 	movl   $0xc0103e40,0xc(%esp)
c010299f:	c0 
c01029a0:	c7 44 24 08 74 3e 10 	movl   $0xc0103e74,0x8(%esp)
c01029a7:	c0 
c01029a8:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
c01029af:	00 
c01029b0:	c7 04 24 89 3e 10 c0 	movl   $0xc0103e89,(%esp)
c01029b7:	e8 48 fd ff ff       	call   c0102704 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c01029bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01029bf:	c1 e0 08             	shl    $0x8,%eax
c01029c2:	89 c2                	mov    %eax,%edx
c01029c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01029c7:	c1 e0 06             	shl    $0x6,%eax
c01029ca:	01 c2                	add    %eax,%edx
c01029cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029cf:	01 c2                	add    %eax,%edx
c01029d1:	8b 45 10             	mov    0x10(%ebp),%eax
c01029d4:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c01029da:	c9                   	leave  
c01029db:	c3                   	ret    

c01029dc <sysclean>:


void sysclean(void)
{
c01029dc:	55                   	push   %ebp
c01029dd:	89 e5                	mov    %esp,%ebp
c01029df:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c01029e2:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01029e9:	00 
c01029ea:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01029f1:	00 
c01029f2:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c01029f9:	e8 17 02 00 00       	call   c0102c15 <memset>
}
c01029fe:	c9                   	leave  
c01029ff:	c3                   	ret    

c0102a00 <syspr>:
int syspr()
{
c0102a00:	55                   	push   %ebp
c0102a01:	89 e5                	mov    %esp,%ebp
c0102a03:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c0102a06:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0102a0d:	c0 
c0102a0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102a15:	e8 b1 00 00 00       	call   c0102acb <syscall>
}
c0102a1a:	c9                   	leave  
c0102a1b:	c3                   	ret    

c0102a1c <systime>:

int systime(void)
{
c0102a1c:	55                   	push   %ebp
c0102a1d:	89 e5                	mov    %esp,%ebp
c0102a1f:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c0102a22:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102a29:	e8 9d 00 00 00       	call   c0102acb <syscall>
}
c0102a2e:	c9                   	leave  
c0102a2f:	c3                   	ret    

c0102a30 <sysreadkey>:

int sysreadkey(void)
{
c0102a30:	55                   	push   %ebp
c0102a31:	89 e5                	mov    %esp,%ebp
c0102a33:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c0102a36:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0102a3d:	e8 89 00 00 00       	call   c0102acb <syscall>
}
c0102a42:	c9                   	leave  
c0102a43:	c3                   	ret    

c0102a44 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0102a44:	55                   	push   %ebp
c0102a45:	89 e5                	mov    %esp,%ebp
c0102a47:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c0102a4a:	8b 45 10             	mov    0x10(%ebp),%eax
c0102a4d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102a51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a54:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a58:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a5b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a5f:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0102a66:	e8 60 00 00 00       	call   c0102acb <syscall>
}
c0102a6b:	c9                   	leave  
c0102a6c:	c3                   	ret    

c0102a6d <fork>:

int fork(void)
{
c0102a6d:	55                   	push   %ebp
c0102a6e:	89 e5                	mov    %esp,%ebp
c0102a70:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c0102a73:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0102a7a:	e8 4c 00 00 00       	call   c0102acb <syscall>
}
c0102a7f:	c9                   	leave  
c0102a80:	c3                   	ret    

c0102a81 <getpid>:

int getpid(void)
{
c0102a81:	55                   	push   %ebp
c0102a82:	89 e5                	mov    %esp,%ebp
c0102a84:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c0102a87:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0102a8e:	e8 38 00 00 00       	call   c0102acb <syscall>
}
c0102a93:	c9                   	leave  
c0102a94:	c3                   	ret    

c0102a95 <exit>:

void exit(int suc)
{
c0102a95:	55                   	push   %ebp
c0102a96:	89 e5                	mov    %esp,%ebp
c0102a98:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
c0102a9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102aa2:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c0102aa9:	e8 1d 00 00 00       	call   c0102acb <syscall>
}
c0102aae:	c9                   	leave  
c0102aaf:	c3                   	ret    

c0102ab0 <sleep>:

void sleep(int sec)
{
c0102ab0:	55                   	push   %ebp
c0102ab1:	89 e5                	mov    %esp,%ebp
c0102ab3:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c0102ab6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ab9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102abd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0102ac4:	e8 02 00 00 00       	call   c0102acb <syscall>
	//printf("qweqwe");
}
c0102ac9:	c9                   	leave  
c0102aca:	c3                   	ret    

c0102acb <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c0102acb:	55                   	push   %ebp
c0102acc:	89 e5                	mov    %esp,%ebp
c0102ace:	53                   	push   %ebx
c0102acf:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0102ad2:	8d 45 08             	lea    0x8(%ebp),%eax
c0102ad5:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c0102ad8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102adb:	8b 00                	mov    (%eax),%eax
c0102add:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102ae0:	83 c2 04             	add    $0x4,%edx
c0102ae3:	8b 1a                	mov    (%edx),%ebx
c0102ae5:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102ae8:	83 c2 08             	add    $0x8,%edx
c0102aeb:	8b 0a                	mov    (%edx),%ecx
c0102aed:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102af0:	83 c2 0c             	add    $0xc,%edx
c0102af3:	8b 12                	mov    (%edx),%edx
c0102af5:	cd 80                	int    $0x80
c0102af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c0102afa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102afd:	83 c4 10             	add    $0x10,%esp
c0102b00:	5b                   	pop    %ebx
c0102b01:	5d                   	pop    %ebp
c0102b02:	c3                   	ret    

c0102b03 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0102b03:	55                   	push   %ebp
c0102b04:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0102b06:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b09:	8b 00                	mov    (%eax),%eax
c0102b0b:	8d 48 01             	lea    0x1(%eax),%ecx
c0102b0e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102b11:	89 0a                	mov    %ecx,(%edx)
c0102b13:	8b 55 08             	mov    0x8(%ebp),%edx
c0102b16:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c0102b1c:	5d                   	pop    %ebp
c0102b1d:	c3                   	ret    

c0102b1e <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0102b1e:	55                   	push   %ebp
c0102b1f:	89 e5                	mov    %esp,%ebp
c0102b21:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102b24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0102b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b2e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102b32:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b35:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102b39:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b40:	c7 04 24 03 2b 10 c0 	movl   $0xc0102b03,(%esp)
c0102b47:	e8 d1 06 00 00       	call   c010321d <vprintfmt>
	return cnt;
c0102b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102b4f:	c9                   	leave  
c0102b50:	c3                   	ret    

c0102b51 <printf>:
int printf(const char *fmt, ...)
{
c0102b51:	55                   	push   %ebp
c0102b52:	89 e5                	mov    %esp,%ebp
c0102b54:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0102b57:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102b5a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c0102b5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b60:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b64:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b67:	89 04 24             	mov    %eax,(%esp)
c0102b6a:	e8 af ff ff ff       	call   c0102b1e <vprintf>
c0102b6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c0102b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b75:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102b79:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c0102b80:	c0 
c0102b81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102b88:	e8 b7 fe ff ff       	call   c0102a44 <syswrite>
	return cnt;
c0102b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b90:	c9                   	leave  
c0102b91:	c3                   	ret    

c0102b92 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c0102b92:	55                   	push   %ebp
c0102b93:	89 e5                	mov    %esp,%ebp
c0102b95:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0102b98:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c0102b9f:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102ba3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102ba6:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102bab:	89 c8                	mov    %ecx,%eax
c0102bad:	f7 ea                	imul   %edx
c0102baf:	c1 fa 02             	sar    $0x2,%edx
c0102bb2:	89 c8                	mov    %ecx,%eax
c0102bb4:	c1 f8 1f             	sar    $0x1f,%eax
c0102bb7:	29 c2                	sub    %eax,%edx
c0102bb9:	89 d0                	mov    %edx,%eax
c0102bbb:	c1 e0 02             	shl    $0x2,%eax
c0102bbe:	01 d0                	add    %edx,%eax
c0102bc0:	01 c0                	add    %eax,%eax
c0102bc2:	29 c1                	sub    %eax,%ecx
c0102bc4:	89 ca                	mov    %ecx,%edx
c0102bc6:	89 d0                	mov    %edx,%eax
c0102bc8:	83 c0 30             	add    $0x30,%eax
c0102bcb:	89 c2                	mov    %eax,%edx
c0102bcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102bd0:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0102bd2:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102bd5:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102bda:	89 c8                	mov    %ecx,%eax
c0102bdc:	f7 ea                	imul   %edx
c0102bde:	c1 fa 02             	sar    $0x2,%edx
c0102be1:	89 c8                	mov    %ecx,%eax
c0102be3:	c1 f8 1f             	sar    $0x1f,%eax
c0102be6:	29 c2                	sub    %eax,%edx
c0102be8:	89 d0                	mov    %edx,%eax
c0102bea:	89 45 08             	mov    %eax,0x8(%ebp)
c0102bed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102bf1:	75 ac                	jne    c0102b9f <itoa+0xd>
	return p;
c0102bf3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102bf6:	c9                   	leave  
c0102bf7:	c3                   	ret    

c0102bf8 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c0102bf8:	55                   	push   %ebp
c0102bf9:	89 e5                	mov    %esp,%ebp
c0102bfb:	57                   	push   %edi
c0102bfc:	56                   	push   %esi
c0102bfd:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0102bfe:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c01:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102c04:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102c07:	89 c1                	mov    %eax,%ecx
c0102c09:	89 d6                	mov    %edx,%esi
c0102c0b:	89 df                	mov    %ebx,%edi
c0102c0d:	fc                   	cld    
c0102c0e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0102c10:	5b                   	pop    %ebx
c0102c11:	5e                   	pop    %esi
c0102c12:	5f                   	pop    %edi
c0102c13:	5d                   	pop    %ebp
c0102c14:	c3                   	ret    

c0102c15 <memset>:

void memset(void *dest, int data, size_t size) {
c0102c15:	55                   	push   %ebp
c0102c16:	89 e5                	mov    %esp,%ebp
c0102c18:	57                   	push   %edi
c0102c19:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0102c1a:	8b 55 10             	mov    0x10(%ebp),%edx
c0102c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c20:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102c23:	89 d1                	mov    %edx,%ecx
c0102c25:	89 df                	mov    %ebx,%edi
c0102c27:	fc                   	cld    
c0102c28:	f3 aa                	rep stos %al,%es:(%edi)
}
c0102c2a:	5b                   	pop    %ebx
c0102c2b:	5f                   	pop    %edi
c0102c2c:	5d                   	pop    %ebp
c0102c2d:	c3                   	ret    

c0102c2e <strlen>:

size_t strlen(const char *str) {
c0102c2e:	55                   	push   %ebp
c0102c2f:	89 e5                	mov    %esp,%ebp
c0102c31:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0102c34:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0102c3b:	eb 04                	jmp    c0102c41 <strlen+0x13>
c0102c3d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102c41:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c44:	8d 50 01             	lea    0x1(%eax),%edx
c0102c47:	89 55 08             	mov    %edx,0x8(%ebp)
c0102c4a:	0f b6 00             	movzbl (%eax),%eax
c0102c4d:	84 c0                	test   %al,%al
c0102c4f:	75 ec                	jne    c0102c3d <strlen+0xf>
	return len;
c0102c51:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102c54:	c9                   	leave  
c0102c55:	c3                   	ret    

c0102c56 <strcpy>:

void strcpy(char *d, const char *s) {
c0102c56:	55                   	push   %ebp
c0102c57:	89 e5                	mov    %esp,%ebp
c0102c59:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c0102c5c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c5f:	89 04 24             	mov    %eax,(%esp)
c0102c62:	e8 c7 ff ff ff       	call   c0102c2e <strlen>
c0102c67:	83 c0 01             	add    $0x1,%eax
c0102c6a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c6e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c71:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c75:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c78:	89 04 24             	mov    %eax,(%esp)
c0102c7b:	e8 78 ff ff ff       	call   c0102bf8 <memcpy>
}
c0102c80:	c9                   	leave  
c0102c81:	c3                   	ret    

c0102c82 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c0102c82:	55                   	push   %ebp
c0102c83:	89 e5                	mov    %esp,%ebp
c0102c85:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102c88:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102c8f:	eb 0c                	jmp    c0102c9d <strnlen+0x1b>
		n++;
c0102c91:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102c95:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102c99:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102c9d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102ca1:	74 0a                	je     c0102cad <strnlen+0x2b>
c0102ca3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ca6:	0f b6 00             	movzbl (%eax),%eax
c0102ca9:	84 c0                	test   %al,%al
c0102cab:	75 e4                	jne    c0102c91 <strnlen+0xf>
		n++;
	return n;
c0102cad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102cb0:	c9                   	leave  
c0102cb1:	c3                   	ret    

c0102cb2 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0102cb2:	55                   	push   %ebp
c0102cb3:	89 e5                	mov    %esp,%ebp
c0102cb5:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c0102cb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cbb:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0102cbe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102cc5:	eb 23                	jmp    c0102cea <strncpy+0x38>
		*dst++ = *src;
c0102cc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cca:	8d 50 01             	lea    0x1(%eax),%edx
c0102ccd:	89 55 08             	mov    %edx,0x8(%ebp)
c0102cd0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102cd3:	0f b6 12             	movzbl (%edx),%edx
c0102cd6:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c0102cd8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cdb:	0f b6 00             	movzbl (%eax),%eax
c0102cde:	84 c0                	test   %al,%al
c0102ce0:	74 04                	je     c0102ce6 <strncpy+0x34>
			src++;
c0102ce2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c0102ce6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102cea:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102ced:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102cf0:	72 d5                	jb     c0102cc7 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c0102cf2:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0102cf5:	c9                   	leave  
c0102cf6:	c3                   	ret    

c0102cf7 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c0102cf7:	55                   	push   %ebp
c0102cf8:	89 e5                	mov    %esp,%ebp
c0102cfa:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c0102cfd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d00:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0102d03:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102d07:	74 33                	je     c0102d3c <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c0102d09:	eb 17                	jmp    c0102d22 <strlcpy+0x2b>
			*dst++ = *src++;
c0102d0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d0e:	8d 50 01             	lea    0x1(%eax),%edx
c0102d11:	89 55 08             	mov    %edx,0x8(%ebp)
c0102d14:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102d17:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102d1a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c0102d1d:	0f b6 12             	movzbl (%edx),%edx
c0102d20:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0102d22:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102d26:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102d2a:	74 0a                	je     c0102d36 <strlcpy+0x3f>
c0102d2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d2f:	0f b6 00             	movzbl (%eax),%eax
c0102d32:	84 c0                	test   %al,%al
c0102d34:	75 d5                	jne    c0102d0b <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0102d36:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d39:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c0102d3c:	8b 55 08             	mov    0x8(%ebp),%edx
c0102d3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102d42:	29 c2                	sub    %eax,%edx
c0102d44:	89 d0                	mov    %edx,%eax
}
c0102d46:	c9                   	leave  
c0102d47:	c3                   	ret    

c0102d48 <strcmp>:

int
strcmp(const char *p, const char *q)
{
c0102d48:	55                   	push   %ebp
c0102d49:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c0102d4b:	eb 08                	jmp    c0102d55 <strcmp+0xd>
		p++, q++;
c0102d4d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102d51:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0102d55:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d58:	0f b6 00             	movzbl (%eax),%eax
c0102d5b:	84 c0                	test   %al,%al
c0102d5d:	74 10                	je     c0102d6f <strcmp+0x27>
c0102d5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d62:	0f b6 10             	movzbl (%eax),%edx
c0102d65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d68:	0f b6 00             	movzbl (%eax),%eax
c0102d6b:	38 c2                	cmp    %al,%dl
c0102d6d:	74 de                	je     c0102d4d <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c0102d6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d72:	0f b6 00             	movzbl (%eax),%eax
c0102d75:	0f b6 d0             	movzbl %al,%edx
c0102d78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d7b:	0f b6 00             	movzbl (%eax),%eax
c0102d7e:	0f b6 c0             	movzbl %al,%eax
c0102d81:	29 c2                	sub    %eax,%edx
c0102d83:	89 d0                	mov    %edx,%eax
}
c0102d85:	5d                   	pop    %ebp
c0102d86:	c3                   	ret    

c0102d87 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0102d87:	55                   	push   %ebp
c0102d88:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c0102d8a:	eb 0c                	jmp    c0102d98 <strncmp+0x11>
		n--, p++, q++;
c0102d8c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102d90:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102d94:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c0102d98:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102d9c:	74 1a                	je     c0102db8 <strncmp+0x31>
c0102d9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102da1:	0f b6 00             	movzbl (%eax),%eax
c0102da4:	84 c0                	test   %al,%al
c0102da6:	74 10                	je     c0102db8 <strncmp+0x31>
c0102da8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dab:	0f b6 10             	movzbl (%eax),%edx
c0102dae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102db1:	0f b6 00             	movzbl (%eax),%eax
c0102db4:	38 c2                	cmp    %al,%dl
c0102db6:	74 d4                	je     c0102d8c <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c0102db8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102dbc:	75 07                	jne    c0102dc5 <strncmp+0x3e>
		return 0;
c0102dbe:	b8 00 00 00 00       	mov    $0x0,%eax
c0102dc3:	eb 16                	jmp    c0102ddb <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c0102dc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dc8:	0f b6 00             	movzbl (%eax),%eax
c0102dcb:	0f b6 d0             	movzbl %al,%edx
c0102dce:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dd1:	0f b6 00             	movzbl (%eax),%eax
c0102dd4:	0f b6 c0             	movzbl %al,%eax
c0102dd7:	29 c2                	sub    %eax,%edx
c0102dd9:	89 d0                	mov    %edx,%eax
}
c0102ddb:	5d                   	pop    %ebp
c0102ddc:	c3                   	ret    

c0102ddd <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c0102ddd:	55                   	push   %ebp
c0102dde:	89 e5                	mov    %esp,%ebp
c0102de0:	83 ec 04             	sub    $0x4,%esp
c0102de3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102de6:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102de9:	eb 14                	jmp    c0102dff <strchr+0x22>
		if (*s == c)
c0102deb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dee:	0f b6 00             	movzbl (%eax),%eax
c0102df1:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102df4:	75 05                	jne    c0102dfb <strchr+0x1e>
			return (char *) s;
c0102df6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102df9:	eb 13                	jmp    c0102e0e <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c0102dfb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102dff:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e02:	0f b6 00             	movzbl (%eax),%eax
c0102e05:	84 c0                	test   %al,%al
c0102e07:	75 e2                	jne    c0102deb <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c0102e09:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102e0e:	c9                   	leave  
c0102e0f:	c3                   	ret    

c0102e10 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c0102e10:	55                   	push   %ebp
c0102e11:	89 e5                	mov    %esp,%ebp
c0102e13:	83 ec 04             	sub    $0x4,%esp
c0102e16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e19:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102e1c:	eb 11                	jmp    c0102e2f <strfind+0x1f>
		if (*s == c)
c0102e1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e21:	0f b6 00             	movzbl (%eax),%eax
c0102e24:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102e27:	75 02                	jne    c0102e2b <strfind+0x1b>
			break;
c0102e29:	eb 0e                	jmp    c0102e39 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0102e2b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102e2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e32:	0f b6 00             	movzbl (%eax),%eax
c0102e35:	84 c0                	test   %al,%al
c0102e37:	75 e5                	jne    c0102e1e <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c0102e39:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102e3c:	c9                   	leave  
c0102e3d:	c3                   	ret    

c0102e3e <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c0102e3e:	55                   	push   %ebp
c0102e3f:	89 e5                	mov    %esp,%ebp
c0102e41:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0102e44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e47:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c0102e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e4d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c0102e50:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102e53:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102e56:	73 3d                	jae    c0102e95 <memmove+0x57>
c0102e58:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e5b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102e5e:	01 d0                	add    %edx,%eax
c0102e60:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102e63:	76 30                	jbe    c0102e95 <memmove+0x57>
		s += n;
c0102e65:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e68:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c0102e6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e6e:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c0102e71:	eb 13                	jmp    c0102e86 <memmove+0x48>
			*--d = *--s;
c0102e73:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0102e77:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102e7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102e7e:	0f b6 10             	movzbl (%eax),%edx
c0102e81:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102e84:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0102e86:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e89:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102e8c:	89 55 10             	mov    %edx,0x10(%ebp)
c0102e8f:	85 c0                	test   %eax,%eax
c0102e91:	75 e0                	jne    c0102e73 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0102e93:	eb 26                	jmp    c0102ebb <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102e95:	eb 17                	jmp    c0102eae <memmove+0x70>
			*d++ = *s++;
c0102e97:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102e9a:	8d 50 01             	lea    0x1(%eax),%edx
c0102e9d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0102ea0:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102ea3:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102ea6:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0102ea9:	0f b6 12             	movzbl (%edx),%edx
c0102eac:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102eae:	8b 45 10             	mov    0x10(%ebp),%eax
c0102eb1:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102eb4:	89 55 10             	mov    %edx,0x10(%ebp)
c0102eb7:	85 c0                	test   %eax,%eax
c0102eb9:	75 dc                	jne    c0102e97 <memmove+0x59>
			*d++ = *s++;

	return dst;
c0102ebb:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102ebe:	c9                   	leave  
c0102ebf:	c3                   	ret    

c0102ec0 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0102ec0:	55                   	push   %ebp
c0102ec1:	89 e5                	mov    %esp,%ebp
c0102ec3:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c0102ec6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ec9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c0102ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ecf:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0102ed2:	eb 30                	jmp    c0102f04 <memcmp+0x44>
		if (*s1 != *s2)
c0102ed4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102ed7:	0f b6 10             	movzbl (%eax),%edx
c0102eda:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102edd:	0f b6 00             	movzbl (%eax),%eax
c0102ee0:	38 c2                	cmp    %al,%dl
c0102ee2:	74 18                	je     c0102efc <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c0102ee4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102ee7:	0f b6 00             	movzbl (%eax),%eax
c0102eea:	0f b6 d0             	movzbl %al,%edx
c0102eed:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102ef0:	0f b6 00             	movzbl (%eax),%eax
c0102ef3:	0f b6 c0             	movzbl %al,%eax
c0102ef6:	29 c2                	sub    %eax,%edx
c0102ef8:	89 d0                	mov    %edx,%eax
c0102efa:	eb 1a                	jmp    c0102f16 <memcmp+0x56>
		s1++, s2++;
c0102efc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102f00:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c0102f04:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f07:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102f0a:	89 55 10             	mov    %edx,0x10(%ebp)
c0102f0d:	85 c0                	test   %eax,%eax
c0102f0f:	75 c3                	jne    c0102ed4 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c0102f11:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102f16:	c9                   	leave  
c0102f17:	c3                   	ret    

c0102f18 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c0102f18:	55                   	push   %ebp
c0102f19:	89 e5                	mov    %esp,%ebp
c0102f1b:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c0102f1e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f21:	8b 55 08             	mov    0x8(%ebp),%edx
c0102f24:	01 d0                	add    %edx,%eax
c0102f26:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c0102f29:	eb 13                	jmp    c0102f3e <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c0102f2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f2e:	0f b6 10             	movzbl (%eax),%edx
c0102f31:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f34:	38 c2                	cmp    %al,%dl
c0102f36:	75 02                	jne    c0102f3a <memfind+0x22>
			break;
c0102f38:	eb 0c                	jmp    c0102f46 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c0102f3a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f41:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0102f44:	72 e5                	jb     c0102f2b <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0102f46:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102f49:	c9                   	leave  
c0102f4a:	c3                   	ret    

c0102f4b <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c0102f4b:	55                   	push   %ebp
c0102f4c:	89 e5                	mov    %esp,%ebp
c0102f4e:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c0102f51:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c0102f58:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102f5f:	eb 04                	jmp    c0102f65 <strtol+0x1a>
		s++;
c0102f61:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102f65:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f68:	0f b6 00             	movzbl (%eax),%eax
c0102f6b:	3c 20                	cmp    $0x20,%al
c0102f6d:	74 f2                	je     c0102f61 <strtol+0x16>
c0102f6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f72:	0f b6 00             	movzbl (%eax),%eax
c0102f75:	3c 09                	cmp    $0x9,%al
c0102f77:	74 e8                	je     c0102f61 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c0102f79:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f7c:	0f b6 00             	movzbl (%eax),%eax
c0102f7f:	3c 2b                	cmp    $0x2b,%al
c0102f81:	75 06                	jne    c0102f89 <strtol+0x3e>
		s++;
c0102f83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f87:	eb 15                	jmp    c0102f9e <strtol+0x53>
	else if (*s == '-')
c0102f89:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f8c:	0f b6 00             	movzbl (%eax),%eax
c0102f8f:	3c 2d                	cmp    $0x2d,%al
c0102f91:	75 0b                	jne    c0102f9e <strtol+0x53>
		s++, neg = 1;
c0102f93:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f97:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c0102f9e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102fa2:	74 06                	je     c0102faa <strtol+0x5f>
c0102fa4:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0102fa8:	75 24                	jne    c0102fce <strtol+0x83>
c0102faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fad:	0f b6 00             	movzbl (%eax),%eax
c0102fb0:	3c 30                	cmp    $0x30,%al
c0102fb2:	75 1a                	jne    c0102fce <strtol+0x83>
c0102fb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fb7:	83 c0 01             	add    $0x1,%eax
c0102fba:	0f b6 00             	movzbl (%eax),%eax
c0102fbd:	3c 78                	cmp    $0x78,%al
c0102fbf:	75 0d                	jne    c0102fce <strtol+0x83>
		s += 2, base = 16;
c0102fc1:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c0102fc5:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c0102fcc:	eb 2a                	jmp    c0102ff8 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c0102fce:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102fd2:	75 17                	jne    c0102feb <strtol+0xa0>
c0102fd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fd7:	0f b6 00             	movzbl (%eax),%eax
c0102fda:	3c 30                	cmp    $0x30,%al
c0102fdc:	75 0d                	jne    c0102feb <strtol+0xa0>
		s++, base = 8;
c0102fde:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102fe2:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c0102fe9:	eb 0d                	jmp    c0102ff8 <strtol+0xad>
	else if (base == 0)
c0102feb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102fef:	75 07                	jne    c0102ff8 <strtol+0xad>
		base = 10;
c0102ff1:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c0102ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ffb:	0f b6 00             	movzbl (%eax),%eax
c0102ffe:	3c 2f                	cmp    $0x2f,%al
c0103000:	7e 1b                	jle    c010301d <strtol+0xd2>
c0103002:	8b 45 08             	mov    0x8(%ebp),%eax
c0103005:	0f b6 00             	movzbl (%eax),%eax
c0103008:	3c 39                	cmp    $0x39,%al
c010300a:	7f 11                	jg     c010301d <strtol+0xd2>
			dig = *s - '0';
c010300c:	8b 45 08             	mov    0x8(%ebp),%eax
c010300f:	0f b6 00             	movzbl (%eax),%eax
c0103012:	0f be c0             	movsbl %al,%eax
c0103015:	83 e8 30             	sub    $0x30,%eax
c0103018:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010301b:	eb 48                	jmp    c0103065 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c010301d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103020:	0f b6 00             	movzbl (%eax),%eax
c0103023:	3c 60                	cmp    $0x60,%al
c0103025:	7e 1b                	jle    c0103042 <strtol+0xf7>
c0103027:	8b 45 08             	mov    0x8(%ebp),%eax
c010302a:	0f b6 00             	movzbl (%eax),%eax
c010302d:	3c 7a                	cmp    $0x7a,%al
c010302f:	7f 11                	jg     c0103042 <strtol+0xf7>
			dig = *s - 'a' + 10;
c0103031:	8b 45 08             	mov    0x8(%ebp),%eax
c0103034:	0f b6 00             	movzbl (%eax),%eax
c0103037:	0f be c0             	movsbl %al,%eax
c010303a:	83 e8 57             	sub    $0x57,%eax
c010303d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103040:	eb 23                	jmp    c0103065 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c0103042:	8b 45 08             	mov    0x8(%ebp),%eax
c0103045:	0f b6 00             	movzbl (%eax),%eax
c0103048:	3c 40                	cmp    $0x40,%al
c010304a:	7e 3d                	jle    c0103089 <strtol+0x13e>
c010304c:	8b 45 08             	mov    0x8(%ebp),%eax
c010304f:	0f b6 00             	movzbl (%eax),%eax
c0103052:	3c 5a                	cmp    $0x5a,%al
c0103054:	7f 33                	jg     c0103089 <strtol+0x13e>
			dig = *s - 'A' + 10;
c0103056:	8b 45 08             	mov    0x8(%ebp),%eax
c0103059:	0f b6 00             	movzbl (%eax),%eax
c010305c:	0f be c0             	movsbl %al,%eax
c010305f:	83 e8 37             	sub    $0x37,%eax
c0103062:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c0103065:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103068:	3b 45 10             	cmp    0x10(%ebp),%eax
c010306b:	7c 02                	jl     c010306f <strtol+0x124>
			break;
c010306d:	eb 1a                	jmp    c0103089 <strtol+0x13e>
		s++, val = (val * base) + dig;
c010306f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103073:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103076:	0f af 45 10          	imul   0x10(%ebp),%eax
c010307a:	89 c2                	mov    %eax,%edx
c010307c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010307f:	01 d0                	add    %edx,%eax
c0103081:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c0103084:	e9 6f ff ff ff       	jmp    c0102ff8 <strtol+0xad>

	if (endptr)
c0103089:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010308d:	74 08                	je     c0103097 <strtol+0x14c>
		*endptr = (char *) s;
c010308f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103092:	8b 55 08             	mov    0x8(%ebp),%edx
c0103095:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c0103097:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010309b:	74 07                	je     c01030a4 <strtol+0x159>
c010309d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01030a0:	f7 d8                	neg    %eax
c01030a2:	eb 03                	jmp    c01030a7 <strtol+0x15c>
c01030a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c01030a7:	c9                   	leave  
c01030a8:	c3                   	ret    

c01030a9 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c01030a9:	55                   	push   %ebp
c01030aa:	89 e5                	mov    %esp,%ebp
c01030ac:	53                   	push   %ebx
c01030ad:	83 ec 34             	sub    $0x34,%esp
c01030b0:	8b 45 10             	mov    0x10(%ebp),%eax
c01030b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01030b6:	8b 45 14             	mov    0x14(%ebp),%eax
c01030b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c01030bc:	8b 45 18             	mov    0x18(%ebp),%eax
c01030bf:	ba 00 00 00 00       	mov    $0x0,%edx
c01030c4:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01030c7:	77 72                	ja     c010313b <printnum+0x92>
c01030c9:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01030cc:	72 05                	jb     c01030d3 <printnum+0x2a>
c01030ce:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01030d1:	77 68                	ja     c010313b <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c01030d3:	8b 45 1c             	mov    0x1c(%ebp),%eax
c01030d6:	8d 58 ff             	lea    -0x1(%eax),%ebx
c01030d9:	8b 45 18             	mov    0x18(%ebp),%eax
c01030dc:	ba 00 00 00 00       	mov    $0x0,%edx
c01030e1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030e5:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01030e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01030ef:	89 04 24             	mov    %eax,(%esp)
c01030f2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01030f6:	e8 55 06 00 00       	call   c0103750 <__udivdi3>
c01030fb:	8b 4d 20             	mov    0x20(%ebp),%ecx
c01030fe:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c0103102:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c0103106:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103109:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c010310d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103111:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103115:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103118:	89 44 24 04          	mov    %eax,0x4(%esp)
c010311c:	8b 45 08             	mov    0x8(%ebp),%eax
c010311f:	89 04 24             	mov    %eax,(%esp)
c0103122:	e8 82 ff ff ff       	call   c01030a9 <printnum>
c0103127:	eb 1c                	jmp    c0103145 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c0103129:	8b 45 0c             	mov    0xc(%ebp),%eax
c010312c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103130:	8b 45 20             	mov    0x20(%ebp),%eax
c0103133:	89 04 24             	mov    %eax,(%esp)
c0103136:	8b 45 08             	mov    0x8(%ebp),%eax
c0103139:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c010313b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c010313f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0103143:	7f e4                	jg     c0103129 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c0103145:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103148:	bb 00 00 00 00       	mov    $0x0,%ebx
c010314d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103150:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103153:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103157:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c010315b:	89 04 24             	mov    %eax,(%esp)
c010315e:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103162:	e8 19 07 00 00       	call   c0103880 <__umoddi3>
c0103167:	05 24 3f 10 c0       	add    $0xc0103f24,%eax
c010316c:	0f b6 00             	movzbl (%eax),%eax
c010316f:	0f be c0             	movsbl %al,%eax
c0103172:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103175:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103179:	89 04 24             	mov    %eax,(%esp)
c010317c:	8b 45 08             	mov    0x8(%ebp),%eax
c010317f:	ff d0                	call   *%eax
}
c0103181:	83 c4 34             	add    $0x34,%esp
c0103184:	5b                   	pop    %ebx
c0103185:	5d                   	pop    %ebp
c0103186:	c3                   	ret    

c0103187 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c0103187:	55                   	push   %ebp
c0103188:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010318a:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010318e:	7e 14                	jle    c01031a4 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c0103190:	8b 45 08             	mov    0x8(%ebp),%eax
c0103193:	8b 00                	mov    (%eax),%eax
c0103195:	8d 48 08             	lea    0x8(%eax),%ecx
c0103198:	8b 55 08             	mov    0x8(%ebp),%edx
c010319b:	89 0a                	mov    %ecx,(%edx)
c010319d:	8b 50 04             	mov    0x4(%eax),%edx
c01031a0:	8b 00                	mov    (%eax),%eax
c01031a2:	eb 30                	jmp    c01031d4 <getuint+0x4d>
	else if (lflag)
c01031a4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01031a8:	74 16                	je     c01031c0 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c01031aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ad:	8b 00                	mov    (%eax),%eax
c01031af:	8d 48 04             	lea    0x4(%eax),%ecx
c01031b2:	8b 55 08             	mov    0x8(%ebp),%edx
c01031b5:	89 0a                	mov    %ecx,(%edx)
c01031b7:	8b 00                	mov    (%eax),%eax
c01031b9:	ba 00 00 00 00       	mov    $0x0,%edx
c01031be:	eb 14                	jmp    c01031d4 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c01031c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c3:	8b 00                	mov    (%eax),%eax
c01031c5:	8d 48 04             	lea    0x4(%eax),%ecx
c01031c8:	8b 55 08             	mov    0x8(%ebp),%edx
c01031cb:	89 0a                	mov    %ecx,(%edx)
c01031cd:	8b 00                	mov    (%eax),%eax
c01031cf:	ba 00 00 00 00       	mov    $0x0,%edx
}
c01031d4:	5d                   	pop    %ebp
c01031d5:	c3                   	ret    

c01031d6 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c01031d6:	55                   	push   %ebp
c01031d7:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c01031d9:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01031dd:	7e 14                	jle    c01031f3 <getint+0x1d>
		return va_arg(*ap, long long);
c01031df:	8b 45 08             	mov    0x8(%ebp),%eax
c01031e2:	8b 00                	mov    (%eax),%eax
c01031e4:	8d 48 08             	lea    0x8(%eax),%ecx
c01031e7:	8b 55 08             	mov    0x8(%ebp),%edx
c01031ea:	89 0a                	mov    %ecx,(%edx)
c01031ec:	8b 50 04             	mov    0x4(%eax),%edx
c01031ef:	8b 00                	mov    (%eax),%eax
c01031f1:	eb 28                	jmp    c010321b <getint+0x45>
	else if (lflag)
c01031f3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01031f7:	74 12                	je     c010320b <getint+0x35>
		return va_arg(*ap, long);
c01031f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01031fc:	8b 00                	mov    (%eax),%eax
c01031fe:	8d 48 04             	lea    0x4(%eax),%ecx
c0103201:	8b 55 08             	mov    0x8(%ebp),%edx
c0103204:	89 0a                	mov    %ecx,(%edx)
c0103206:	8b 00                	mov    (%eax),%eax
c0103208:	99                   	cltd   
c0103209:	eb 10                	jmp    c010321b <getint+0x45>
	else
		return va_arg(*ap, int);
c010320b:	8b 45 08             	mov    0x8(%ebp),%eax
c010320e:	8b 00                	mov    (%eax),%eax
c0103210:	8d 48 04             	lea    0x4(%eax),%ecx
c0103213:	8b 55 08             	mov    0x8(%ebp),%edx
c0103216:	89 0a                	mov    %ecx,(%edx)
c0103218:	8b 00                	mov    (%eax),%eax
c010321a:	99                   	cltd   
}
c010321b:	5d                   	pop    %ebp
c010321c:	c3                   	ret    

c010321d <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c010321d:	55                   	push   %ebp
c010321e:	89 e5                	mov    %esp,%ebp
c0103220:	56                   	push   %esi
c0103221:	53                   	push   %ebx
c0103222:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103225:	eb 18                	jmp    c010323f <vprintfmt+0x22>
			if (ch == '\0')
c0103227:	85 db                	test   %ebx,%ebx
c0103229:	75 05                	jne    c0103230 <vprintfmt+0x13>
				return;
c010322b:	e9 e9 03 00 00       	jmp    c0103619 <vprintfmt+0x3fc>
			putch(ch, putdat);
c0103230:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103233:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103237:	89 1c 24             	mov    %ebx,(%esp)
c010323a:	8b 45 08             	mov    0x8(%ebp),%eax
c010323d:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c010323f:	8b 45 10             	mov    0x10(%ebp),%eax
c0103242:	8d 50 01             	lea    0x1(%eax),%edx
c0103245:	89 55 10             	mov    %edx,0x10(%ebp)
c0103248:	0f b6 00             	movzbl (%eax),%eax
c010324b:	0f b6 d8             	movzbl %al,%ebx
c010324e:	83 fb 25             	cmp    $0x25,%ebx
c0103251:	75 d4                	jne    c0103227 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c0103253:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c0103257:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c010325e:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c0103265:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c010326c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c0103273:	8b 45 10             	mov    0x10(%ebp),%eax
c0103276:	8d 50 01             	lea    0x1(%eax),%edx
c0103279:	89 55 10             	mov    %edx,0x10(%ebp)
c010327c:	0f b6 00             	movzbl (%eax),%eax
c010327f:	0f b6 d8             	movzbl %al,%ebx
c0103282:	8d 43 dd             	lea    -0x23(%ebx),%eax
c0103285:	83 f8 55             	cmp    $0x55,%eax
c0103288:	0f 87 5a 03 00 00    	ja     c01035e8 <vprintfmt+0x3cb>
c010328e:	8b 04 85 48 3f 10 c0 	mov    -0x3fefc0b8(,%eax,4),%eax
c0103295:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c0103297:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c010329b:	eb d6                	jmp    c0103273 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c010329d:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c01032a1:	eb d0                	jmp    c0103273 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01032a3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c01032aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01032ad:	89 d0                	mov    %edx,%eax
c01032af:	c1 e0 02             	shl    $0x2,%eax
c01032b2:	01 d0                	add    %edx,%eax
c01032b4:	01 c0                	add    %eax,%eax
c01032b6:	01 d8                	add    %ebx,%eax
c01032b8:	83 e8 30             	sub    $0x30,%eax
c01032bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c01032be:	8b 45 10             	mov    0x10(%ebp),%eax
c01032c1:	0f b6 00             	movzbl (%eax),%eax
c01032c4:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c01032c7:	83 fb 2f             	cmp    $0x2f,%ebx
c01032ca:	7e 0b                	jle    c01032d7 <vprintfmt+0xba>
c01032cc:	83 fb 39             	cmp    $0x39,%ebx
c01032cf:	7f 06                	jg     c01032d7 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01032d1:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c01032d5:	eb d3                	jmp    c01032aa <vprintfmt+0x8d>
			goto process_precision;
c01032d7:	eb 33                	jmp    c010330c <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c01032d9:	8b 45 14             	mov    0x14(%ebp),%eax
c01032dc:	8d 50 04             	lea    0x4(%eax),%edx
c01032df:	89 55 14             	mov    %edx,0x14(%ebp)
c01032e2:	8b 00                	mov    (%eax),%eax
c01032e4:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c01032e7:	eb 23                	jmp    c010330c <vprintfmt+0xef>

		case '.':
			if (width < 0)
c01032e9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01032ed:	79 0c                	jns    c01032fb <vprintfmt+0xde>
				width = 0;
c01032ef:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c01032f6:	e9 78 ff ff ff       	jmp    c0103273 <vprintfmt+0x56>
c01032fb:	e9 73 ff ff ff       	jmp    c0103273 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c0103300:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c0103307:	e9 67 ff ff ff       	jmp    c0103273 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c010330c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103310:	79 12                	jns    c0103324 <vprintfmt+0x107>
				width = precision, precision = -1;
c0103312:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103315:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103318:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c010331f:	e9 4f ff ff ff       	jmp    c0103273 <vprintfmt+0x56>
c0103324:	e9 4a ff ff ff       	jmp    c0103273 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c0103329:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c010332d:	e9 41 ff ff ff       	jmp    c0103273 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c0103332:	8b 45 14             	mov    0x14(%ebp),%eax
c0103335:	8d 50 04             	lea    0x4(%eax),%edx
c0103338:	89 55 14             	mov    %edx,0x14(%ebp)
c010333b:	8b 00                	mov    (%eax),%eax
c010333d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103340:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103344:	89 04 24             	mov    %eax,(%esp)
c0103347:	8b 45 08             	mov    0x8(%ebp),%eax
c010334a:	ff d0                	call   *%eax
			break;
c010334c:	e9 c2 02 00 00       	jmp    c0103613 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c0103351:	8b 45 14             	mov    0x14(%ebp),%eax
c0103354:	8d 50 04             	lea    0x4(%eax),%edx
c0103357:	89 55 14             	mov    %edx,0x14(%ebp)
c010335a:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c010335c:	85 db                	test   %ebx,%ebx
c010335e:	79 02                	jns    c0103362 <vprintfmt+0x145>
				err = -err;
c0103360:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c0103362:	83 fb 06             	cmp    $0x6,%ebx
c0103365:	7f 0b                	jg     c0103372 <vprintfmt+0x155>
c0103367:	8b 34 9d 08 3f 10 c0 	mov    -0x3fefc0f8(,%ebx,4),%esi
c010336e:	85 f6                	test   %esi,%esi
c0103370:	75 23                	jne    c0103395 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c0103372:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0103376:	c7 44 24 08 35 3f 10 	movl   $0xc0103f35,0x8(%esp)
c010337d:	c0 
c010337e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103381:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103385:	8b 45 08             	mov    0x8(%ebp),%eax
c0103388:	89 04 24             	mov    %eax,(%esp)
c010338b:	e8 90 02 00 00       	call   c0103620 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c0103390:	e9 7e 02 00 00       	jmp    c0103613 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c0103395:	89 74 24 0c          	mov    %esi,0xc(%esp)
c0103399:	c7 44 24 08 3e 3f 10 	movl   $0xc0103f3e,0x8(%esp)
c01033a0:	c0 
c01033a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033a4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01033a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01033ab:	89 04 24             	mov    %eax,(%esp)
c01033ae:	e8 6d 02 00 00       	call   c0103620 <printfmt>
			break;
c01033b3:	e9 5b 02 00 00       	jmp    c0103613 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c01033b8:	8b 45 14             	mov    0x14(%ebp),%eax
c01033bb:	8d 50 04             	lea    0x4(%eax),%edx
c01033be:	89 55 14             	mov    %edx,0x14(%ebp)
c01033c1:	8b 30                	mov    (%eax),%esi
c01033c3:	85 f6                	test   %esi,%esi
c01033c5:	75 05                	jne    c01033cc <vprintfmt+0x1af>
				p = "(null)";
c01033c7:	be 41 3f 10 c0       	mov    $0xc0103f41,%esi
			if (width > 0 && padc != '-')
c01033cc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01033d0:	7e 37                	jle    c0103409 <vprintfmt+0x1ec>
c01033d2:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c01033d6:	74 31                	je     c0103409 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c01033d8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01033db:	89 44 24 04          	mov    %eax,0x4(%esp)
c01033df:	89 34 24             	mov    %esi,(%esp)
c01033e2:	e8 9b f8 ff ff       	call   c0102c82 <strnlen>
c01033e7:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c01033ea:	eb 17                	jmp    c0103403 <vprintfmt+0x1e6>
					putch(padc, putdat);
c01033ec:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c01033f0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01033f3:	89 54 24 04          	mov    %edx,0x4(%esp)
c01033f7:	89 04 24             	mov    %eax,(%esp)
c01033fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01033fd:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c01033ff:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103403:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103407:	7f e3                	jg     c01033ec <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103409:	eb 38                	jmp    c0103443 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c010340b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c010340f:	74 1f                	je     c0103430 <vprintfmt+0x213>
c0103411:	83 fb 1f             	cmp    $0x1f,%ebx
c0103414:	7e 05                	jle    c010341b <vprintfmt+0x1fe>
c0103416:	83 fb 7e             	cmp    $0x7e,%ebx
c0103419:	7e 15                	jle    c0103430 <vprintfmt+0x213>
					putch('?', putdat);
c010341b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010341e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103422:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c0103429:	8b 45 08             	mov    0x8(%ebp),%eax
c010342c:	ff d0                	call   *%eax
c010342e:	eb 0f                	jmp    c010343f <vprintfmt+0x222>
				else
					putch(ch, putdat);
c0103430:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103433:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103437:	89 1c 24             	mov    %ebx,(%esp)
c010343a:	8b 45 08             	mov    0x8(%ebp),%eax
c010343d:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c010343f:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103443:	89 f0                	mov    %esi,%eax
c0103445:	8d 70 01             	lea    0x1(%eax),%esi
c0103448:	0f b6 00             	movzbl (%eax),%eax
c010344b:	0f be d8             	movsbl %al,%ebx
c010344e:	85 db                	test   %ebx,%ebx
c0103450:	74 10                	je     c0103462 <vprintfmt+0x245>
c0103452:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103456:	78 b3                	js     c010340b <vprintfmt+0x1ee>
c0103458:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c010345c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103460:	79 a9                	jns    c010340b <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103462:	eb 17                	jmp    c010347b <vprintfmt+0x25e>
				putch(' ', putdat);
c0103464:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103467:	89 44 24 04          	mov    %eax,0x4(%esp)
c010346b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103472:	8b 45 08             	mov    0x8(%ebp),%eax
c0103475:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103477:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c010347b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c010347f:	7f e3                	jg     c0103464 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103481:	e9 8d 01 00 00       	jmp    c0103613 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c0103486:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103489:	89 44 24 04          	mov    %eax,0x4(%esp)
c010348d:	8d 45 14             	lea    0x14(%ebp),%eax
c0103490:	89 04 24             	mov    %eax,(%esp)
c0103493:	e8 3e fd ff ff       	call   c01031d6 <getint>
c0103498:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010349b:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c010349e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034a4:	85 d2                	test   %edx,%edx
c01034a6:	79 26                	jns    c01034ce <vprintfmt+0x2b1>
				putch('-', putdat);
c01034a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034ab:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034af:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c01034b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01034b9:	ff d0                	call   *%eax
				num = -(long long) num;
c01034bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034be:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034c1:	f7 d8                	neg    %eax
c01034c3:	83 d2 00             	adc    $0x0,%edx
c01034c6:	f7 da                	neg    %edx
c01034c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c01034ce:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c01034d5:	e9 c5 00 00 00       	jmp    c010359f <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c01034da:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01034dd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034e1:	8d 45 14             	lea    0x14(%ebp),%eax
c01034e4:	89 04 24             	mov    %eax,(%esp)
c01034e7:	e8 9b fc ff ff       	call   c0103187 <getuint>
c01034ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034ef:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c01034f2:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c01034f9:	e9 a1 00 00 00       	jmp    c010359f <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c01034fe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103501:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103505:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c010350c:	8b 45 08             	mov    0x8(%ebp),%eax
c010350f:	ff d0                	call   *%eax
			putch('X', putdat);
c0103511:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103514:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103518:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c010351f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103522:	ff d0                	call   *%eax
			putch('X', putdat);
c0103524:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103527:	89 44 24 04          	mov    %eax,0x4(%esp)
c010352b:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103532:	8b 45 08             	mov    0x8(%ebp),%eax
c0103535:	ff d0                	call   *%eax
			break;
c0103537:	e9 d7 00 00 00       	jmp    c0103613 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c010353c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010353f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103543:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c010354a:	8b 45 08             	mov    0x8(%ebp),%eax
c010354d:	ff d0                	call   *%eax
			putch('x', putdat);
c010354f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103552:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103556:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c010355d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103560:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103562:	8b 45 14             	mov    0x14(%ebp),%eax
c0103565:	8d 50 04             	lea    0x4(%eax),%edx
c0103568:	89 55 14             	mov    %edx,0x14(%ebp)
c010356b:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c010356d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103570:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0103577:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c010357e:	eb 1f                	jmp    c010359f <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103580:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103583:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103587:	8d 45 14             	lea    0x14(%ebp),%eax
c010358a:	89 04 24             	mov    %eax,(%esp)
c010358d:	e8 f5 fb ff ff       	call   c0103187 <getuint>
c0103592:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103595:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103598:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c010359f:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c01035a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035a6:	89 54 24 18          	mov    %edx,0x18(%esp)
c01035aa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01035ad:	89 54 24 14          	mov    %edx,0x14(%esp)
c01035b1:	89 44 24 10          	mov    %eax,0x10(%esp)
c01035b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01035bb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01035bf:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01035c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01035cd:	89 04 24             	mov    %eax,(%esp)
c01035d0:	e8 d4 fa ff ff       	call   c01030a9 <printnum>
			break;
c01035d5:	eb 3c                	jmp    c0103613 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c01035d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035da:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035de:	89 1c 24             	mov    %ebx,(%esp)
c01035e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01035e4:	ff d0                	call   *%eax
			break;
c01035e6:	eb 2b                	jmp    c0103613 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c01035e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035eb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035ef:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c01035f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01035f9:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c01035fb:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01035ff:	eb 04                	jmp    c0103605 <vprintfmt+0x3e8>
c0103601:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103605:	8b 45 10             	mov    0x10(%ebp),%eax
c0103608:	83 e8 01             	sub    $0x1,%eax
c010360b:	0f b6 00             	movzbl (%eax),%eax
c010360e:	3c 25                	cmp    $0x25,%al
c0103610:	75 ef                	jne    c0103601 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c0103612:	90                   	nop
		}
	}
c0103613:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103614:	e9 26 fc ff ff       	jmp    c010323f <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c0103619:	83 c4 40             	add    $0x40,%esp
c010361c:	5b                   	pop    %ebx
c010361d:	5e                   	pop    %esi
c010361e:	5d                   	pop    %ebp
c010361f:	c3                   	ret    

c0103620 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c0103620:	55                   	push   %ebp
c0103621:	89 e5                	mov    %esp,%ebp
c0103623:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0103626:	8d 45 14             	lea    0x14(%ebp),%eax
c0103629:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c010362c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010362f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103633:	8b 45 10             	mov    0x10(%ebp),%eax
c0103636:	89 44 24 08          	mov    %eax,0x8(%esp)
c010363a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010363d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103641:	8b 45 08             	mov    0x8(%ebp),%eax
c0103644:	89 04 24             	mov    %eax,(%esp)
c0103647:	e8 d1 fb ff ff       	call   c010321d <vprintfmt>
	va_end(ap);
}
c010364c:	c9                   	leave  
c010364d:	c3                   	ret    

c010364e <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c010364e:	55                   	push   %ebp
c010364f:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103651:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103654:	8b 40 08             	mov    0x8(%eax),%eax
c0103657:	8d 50 01             	lea    0x1(%eax),%edx
c010365a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010365d:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103660:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103663:	8b 10                	mov    (%eax),%edx
c0103665:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103668:	8b 40 04             	mov    0x4(%eax),%eax
c010366b:	39 c2                	cmp    %eax,%edx
c010366d:	73 12                	jae    c0103681 <sprintputch+0x33>
		*b->buf++ = ch;
c010366f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103672:	8b 00                	mov    (%eax),%eax
c0103674:	8d 48 01             	lea    0x1(%eax),%ecx
c0103677:	8b 55 0c             	mov    0xc(%ebp),%edx
c010367a:	89 0a                	mov    %ecx,(%edx)
c010367c:	8b 55 08             	mov    0x8(%ebp),%edx
c010367f:	88 10                	mov    %dl,(%eax)
}
c0103681:	5d                   	pop    %ebp
c0103682:	c3                   	ret    

c0103683 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103683:	55                   	push   %ebp
c0103684:	89 e5                	mov    %esp,%ebp
c0103686:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103689:	8b 45 08             	mov    0x8(%ebp),%eax
c010368c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010368f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103692:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103695:	8b 45 08             	mov    0x8(%ebp),%eax
c0103698:	01 d0                	add    %edx,%eax
c010369a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010369d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c01036a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01036a8:	74 06                	je     c01036b0 <vsnprintf+0x2d>
c01036aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01036ae:	7f 07                	jg     c01036b7 <vsnprintf+0x34>
		return -E_INVAL;
c01036b0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c01036b5:	eb 2a                	jmp    c01036e1 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c01036b7:	8b 45 14             	mov    0x14(%ebp),%eax
c01036ba:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01036be:	8b 45 10             	mov    0x10(%ebp),%eax
c01036c1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036c5:	8d 45 ec             	lea    -0x14(%ebp),%eax
c01036c8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036cc:	c7 04 24 4e 36 10 c0 	movl   $0xc010364e,(%esp)
c01036d3:	e8 45 fb ff ff       	call   c010321d <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c01036d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01036db:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c01036de:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01036e1:	c9                   	leave  
c01036e2:	c3                   	ret    

c01036e3 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c01036e3:	55                   	push   %ebp
c01036e4:	89 e5                	mov    %esp,%ebp
c01036e6:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c01036e9:	8d 45 14             	lea    0x14(%ebp),%eax
c01036ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c01036ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036f2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01036f6:	8b 45 10             	mov    0x10(%ebp),%eax
c01036f9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103700:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103704:	8b 45 08             	mov    0x8(%ebp),%eax
c0103707:	89 04 24             	mov    %eax,(%esp)
c010370a:	e8 74 ff ff ff       	call   c0103683 <vsnprintf>
c010370f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c0103712:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103715:	c9                   	leave  
c0103716:	c3                   	ret    

c0103717 <srand>:
static int seed = 0;

void
srand(int s) {
c0103717:	55                   	push   %ebp
c0103718:	89 e5                	mov    %esp,%ebp
	seed = s;
c010371a:	8b 45 08             	mov    0x8(%ebp),%eax
c010371d:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c0103722:	5d                   	pop    %ebp
c0103723:	c3                   	ret    

c0103724 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0103724:	55                   	push   %ebp
c0103725:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0103727:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c010372c:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0103732:	83 c0 01             	add    $0x1,%eax
c0103735:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c010373a:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c010373f:	c1 f8 10             	sar    $0x10,%eax
c0103742:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0103747:	5d                   	pop    %ebp
c0103748:	c3                   	ret    
c0103749:	66 90                	xchg   %ax,%ax
c010374b:	66 90                	xchg   %ax,%ax
c010374d:	66 90                	xchg   %ax,%ax
c010374f:	90                   	nop

c0103750 <__udivdi3>:
c0103750:	55                   	push   %ebp
c0103751:	57                   	push   %edi
c0103752:	56                   	push   %esi
c0103753:	83 ec 0c             	sub    $0xc,%esp
c0103756:	8b 44 24 28          	mov    0x28(%esp),%eax
c010375a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c010375e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103762:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103766:	85 c0                	test   %eax,%eax
c0103768:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010376c:	89 ea                	mov    %ebp,%edx
c010376e:	89 0c 24             	mov    %ecx,(%esp)
c0103771:	75 2d                	jne    c01037a0 <__udivdi3+0x50>
c0103773:	39 e9                	cmp    %ebp,%ecx
c0103775:	77 61                	ja     c01037d8 <__udivdi3+0x88>
c0103777:	85 c9                	test   %ecx,%ecx
c0103779:	89 ce                	mov    %ecx,%esi
c010377b:	75 0b                	jne    c0103788 <__udivdi3+0x38>
c010377d:	b8 01 00 00 00       	mov    $0x1,%eax
c0103782:	31 d2                	xor    %edx,%edx
c0103784:	f7 f1                	div    %ecx
c0103786:	89 c6                	mov    %eax,%esi
c0103788:	31 d2                	xor    %edx,%edx
c010378a:	89 e8                	mov    %ebp,%eax
c010378c:	f7 f6                	div    %esi
c010378e:	89 c5                	mov    %eax,%ebp
c0103790:	89 f8                	mov    %edi,%eax
c0103792:	f7 f6                	div    %esi
c0103794:	89 ea                	mov    %ebp,%edx
c0103796:	83 c4 0c             	add    $0xc,%esp
c0103799:	5e                   	pop    %esi
c010379a:	5f                   	pop    %edi
c010379b:	5d                   	pop    %ebp
c010379c:	c3                   	ret    
c010379d:	8d 76 00             	lea    0x0(%esi),%esi
c01037a0:	39 e8                	cmp    %ebp,%eax
c01037a2:	77 24                	ja     c01037c8 <__udivdi3+0x78>
c01037a4:	0f bd e8             	bsr    %eax,%ebp
c01037a7:	83 f5 1f             	xor    $0x1f,%ebp
c01037aa:	75 3c                	jne    c01037e8 <__udivdi3+0x98>
c01037ac:	8b 74 24 04          	mov    0x4(%esp),%esi
c01037b0:	39 34 24             	cmp    %esi,(%esp)
c01037b3:	0f 86 9f 00 00 00    	jbe    c0103858 <__udivdi3+0x108>
c01037b9:	39 d0                	cmp    %edx,%eax
c01037bb:	0f 82 97 00 00 00    	jb     c0103858 <__udivdi3+0x108>
c01037c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01037c8:	31 d2                	xor    %edx,%edx
c01037ca:	31 c0                	xor    %eax,%eax
c01037cc:	83 c4 0c             	add    $0xc,%esp
c01037cf:	5e                   	pop    %esi
c01037d0:	5f                   	pop    %edi
c01037d1:	5d                   	pop    %ebp
c01037d2:	c3                   	ret    
c01037d3:	90                   	nop
c01037d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01037d8:	89 f8                	mov    %edi,%eax
c01037da:	f7 f1                	div    %ecx
c01037dc:	31 d2                	xor    %edx,%edx
c01037de:	83 c4 0c             	add    $0xc,%esp
c01037e1:	5e                   	pop    %esi
c01037e2:	5f                   	pop    %edi
c01037e3:	5d                   	pop    %ebp
c01037e4:	c3                   	ret    
c01037e5:	8d 76 00             	lea    0x0(%esi),%esi
c01037e8:	89 e9                	mov    %ebp,%ecx
c01037ea:	8b 3c 24             	mov    (%esp),%edi
c01037ed:	d3 e0                	shl    %cl,%eax
c01037ef:	89 c6                	mov    %eax,%esi
c01037f1:	b8 20 00 00 00       	mov    $0x20,%eax
c01037f6:	29 e8                	sub    %ebp,%eax
c01037f8:	89 c1                	mov    %eax,%ecx
c01037fa:	d3 ef                	shr    %cl,%edi
c01037fc:	89 e9                	mov    %ebp,%ecx
c01037fe:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0103802:	8b 3c 24             	mov    (%esp),%edi
c0103805:	09 74 24 08          	or     %esi,0x8(%esp)
c0103809:	89 d6                	mov    %edx,%esi
c010380b:	d3 e7                	shl    %cl,%edi
c010380d:	89 c1                	mov    %eax,%ecx
c010380f:	89 3c 24             	mov    %edi,(%esp)
c0103812:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103816:	d3 ee                	shr    %cl,%esi
c0103818:	89 e9                	mov    %ebp,%ecx
c010381a:	d3 e2                	shl    %cl,%edx
c010381c:	89 c1                	mov    %eax,%ecx
c010381e:	d3 ef                	shr    %cl,%edi
c0103820:	09 d7                	or     %edx,%edi
c0103822:	89 f2                	mov    %esi,%edx
c0103824:	89 f8                	mov    %edi,%eax
c0103826:	f7 74 24 08          	divl   0x8(%esp)
c010382a:	89 d6                	mov    %edx,%esi
c010382c:	89 c7                	mov    %eax,%edi
c010382e:	f7 24 24             	mull   (%esp)
c0103831:	39 d6                	cmp    %edx,%esi
c0103833:	89 14 24             	mov    %edx,(%esp)
c0103836:	72 30                	jb     c0103868 <__udivdi3+0x118>
c0103838:	8b 54 24 04          	mov    0x4(%esp),%edx
c010383c:	89 e9                	mov    %ebp,%ecx
c010383e:	d3 e2                	shl    %cl,%edx
c0103840:	39 c2                	cmp    %eax,%edx
c0103842:	73 05                	jae    c0103849 <__udivdi3+0xf9>
c0103844:	3b 34 24             	cmp    (%esp),%esi
c0103847:	74 1f                	je     c0103868 <__udivdi3+0x118>
c0103849:	89 f8                	mov    %edi,%eax
c010384b:	31 d2                	xor    %edx,%edx
c010384d:	e9 7a ff ff ff       	jmp    c01037cc <__udivdi3+0x7c>
c0103852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103858:	31 d2                	xor    %edx,%edx
c010385a:	b8 01 00 00 00       	mov    $0x1,%eax
c010385f:	e9 68 ff ff ff       	jmp    c01037cc <__udivdi3+0x7c>
c0103864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103868:	8d 47 ff             	lea    -0x1(%edi),%eax
c010386b:	31 d2                	xor    %edx,%edx
c010386d:	83 c4 0c             	add    $0xc,%esp
c0103870:	5e                   	pop    %esi
c0103871:	5f                   	pop    %edi
c0103872:	5d                   	pop    %ebp
c0103873:	c3                   	ret    
c0103874:	66 90                	xchg   %ax,%ax
c0103876:	66 90                	xchg   %ax,%ax
c0103878:	66 90                	xchg   %ax,%ax
c010387a:	66 90                	xchg   %ax,%ax
c010387c:	66 90                	xchg   %ax,%ax
c010387e:	66 90                	xchg   %ax,%ax

c0103880 <__umoddi3>:
c0103880:	55                   	push   %ebp
c0103881:	57                   	push   %edi
c0103882:	56                   	push   %esi
c0103883:	83 ec 14             	sub    $0x14,%esp
c0103886:	8b 44 24 28          	mov    0x28(%esp),%eax
c010388a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c010388e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103892:	89 c7                	mov    %eax,%edi
c0103894:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103898:	8b 44 24 30          	mov    0x30(%esp),%eax
c010389c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c01038a0:	89 34 24             	mov    %esi,(%esp)
c01038a3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01038a7:	85 c0                	test   %eax,%eax
c01038a9:	89 c2                	mov    %eax,%edx
c01038ab:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c01038af:	75 17                	jne    c01038c8 <__umoddi3+0x48>
c01038b1:	39 fe                	cmp    %edi,%esi
c01038b3:	76 4b                	jbe    c0103900 <__umoddi3+0x80>
c01038b5:	89 c8                	mov    %ecx,%eax
c01038b7:	89 fa                	mov    %edi,%edx
c01038b9:	f7 f6                	div    %esi
c01038bb:	89 d0                	mov    %edx,%eax
c01038bd:	31 d2                	xor    %edx,%edx
c01038bf:	83 c4 14             	add    $0x14,%esp
c01038c2:	5e                   	pop    %esi
c01038c3:	5f                   	pop    %edi
c01038c4:	5d                   	pop    %ebp
c01038c5:	c3                   	ret    
c01038c6:	66 90                	xchg   %ax,%ax
c01038c8:	39 f8                	cmp    %edi,%eax
c01038ca:	77 54                	ja     c0103920 <__umoddi3+0xa0>
c01038cc:	0f bd e8             	bsr    %eax,%ebp
c01038cf:	83 f5 1f             	xor    $0x1f,%ebp
c01038d2:	75 5c                	jne    c0103930 <__umoddi3+0xb0>
c01038d4:	8b 7c 24 08          	mov    0x8(%esp),%edi
c01038d8:	39 3c 24             	cmp    %edi,(%esp)
c01038db:	0f 87 e7 00 00 00    	ja     c01039c8 <__umoddi3+0x148>
c01038e1:	8b 7c 24 04          	mov    0x4(%esp),%edi
c01038e5:	29 f1                	sub    %esi,%ecx
c01038e7:	19 c7                	sbb    %eax,%edi
c01038e9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01038ed:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c01038f1:	8b 44 24 08          	mov    0x8(%esp),%eax
c01038f5:	8b 54 24 0c          	mov    0xc(%esp),%edx
c01038f9:	83 c4 14             	add    $0x14,%esp
c01038fc:	5e                   	pop    %esi
c01038fd:	5f                   	pop    %edi
c01038fe:	5d                   	pop    %ebp
c01038ff:	c3                   	ret    
c0103900:	85 f6                	test   %esi,%esi
c0103902:	89 f5                	mov    %esi,%ebp
c0103904:	75 0b                	jne    c0103911 <__umoddi3+0x91>
c0103906:	b8 01 00 00 00       	mov    $0x1,%eax
c010390b:	31 d2                	xor    %edx,%edx
c010390d:	f7 f6                	div    %esi
c010390f:	89 c5                	mov    %eax,%ebp
c0103911:	8b 44 24 04          	mov    0x4(%esp),%eax
c0103915:	31 d2                	xor    %edx,%edx
c0103917:	f7 f5                	div    %ebp
c0103919:	89 c8                	mov    %ecx,%eax
c010391b:	f7 f5                	div    %ebp
c010391d:	eb 9c                	jmp    c01038bb <__umoddi3+0x3b>
c010391f:	90                   	nop
c0103920:	89 c8                	mov    %ecx,%eax
c0103922:	89 fa                	mov    %edi,%edx
c0103924:	83 c4 14             	add    $0x14,%esp
c0103927:	5e                   	pop    %esi
c0103928:	5f                   	pop    %edi
c0103929:	5d                   	pop    %ebp
c010392a:	c3                   	ret    
c010392b:	90                   	nop
c010392c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103930:	8b 04 24             	mov    (%esp),%eax
c0103933:	be 20 00 00 00       	mov    $0x20,%esi
c0103938:	89 e9                	mov    %ebp,%ecx
c010393a:	29 ee                	sub    %ebp,%esi
c010393c:	d3 e2                	shl    %cl,%edx
c010393e:	89 f1                	mov    %esi,%ecx
c0103940:	d3 e8                	shr    %cl,%eax
c0103942:	89 e9                	mov    %ebp,%ecx
c0103944:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103948:	8b 04 24             	mov    (%esp),%eax
c010394b:	09 54 24 04          	or     %edx,0x4(%esp)
c010394f:	89 fa                	mov    %edi,%edx
c0103951:	d3 e0                	shl    %cl,%eax
c0103953:	89 f1                	mov    %esi,%ecx
c0103955:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103959:	8b 44 24 10          	mov    0x10(%esp),%eax
c010395d:	d3 ea                	shr    %cl,%edx
c010395f:	89 e9                	mov    %ebp,%ecx
c0103961:	d3 e7                	shl    %cl,%edi
c0103963:	89 f1                	mov    %esi,%ecx
c0103965:	d3 e8                	shr    %cl,%eax
c0103967:	89 e9                	mov    %ebp,%ecx
c0103969:	09 f8                	or     %edi,%eax
c010396b:	8b 7c 24 10          	mov    0x10(%esp),%edi
c010396f:	f7 74 24 04          	divl   0x4(%esp)
c0103973:	d3 e7                	shl    %cl,%edi
c0103975:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103979:	89 d7                	mov    %edx,%edi
c010397b:	f7 64 24 08          	mull   0x8(%esp)
c010397f:	39 d7                	cmp    %edx,%edi
c0103981:	89 c1                	mov    %eax,%ecx
c0103983:	89 14 24             	mov    %edx,(%esp)
c0103986:	72 2c                	jb     c01039b4 <__umoddi3+0x134>
c0103988:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c010398c:	72 22                	jb     c01039b0 <__umoddi3+0x130>
c010398e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103992:	29 c8                	sub    %ecx,%eax
c0103994:	19 d7                	sbb    %edx,%edi
c0103996:	89 e9                	mov    %ebp,%ecx
c0103998:	89 fa                	mov    %edi,%edx
c010399a:	d3 e8                	shr    %cl,%eax
c010399c:	89 f1                	mov    %esi,%ecx
c010399e:	d3 e2                	shl    %cl,%edx
c01039a0:	89 e9                	mov    %ebp,%ecx
c01039a2:	d3 ef                	shr    %cl,%edi
c01039a4:	09 d0                	or     %edx,%eax
c01039a6:	89 fa                	mov    %edi,%edx
c01039a8:	83 c4 14             	add    $0x14,%esp
c01039ab:	5e                   	pop    %esi
c01039ac:	5f                   	pop    %edi
c01039ad:	5d                   	pop    %ebp
c01039ae:	c3                   	ret    
c01039af:	90                   	nop
c01039b0:	39 d7                	cmp    %edx,%edi
c01039b2:	75 da                	jne    c010398e <__umoddi3+0x10e>
c01039b4:	8b 14 24             	mov    (%esp),%edx
c01039b7:	89 c1                	mov    %eax,%ecx
c01039b9:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c01039bd:	1b 54 24 04          	sbb    0x4(%esp),%edx
c01039c1:	eb cb                	jmp    c010398e <__umoddi3+0x10e>
c01039c3:	90                   	nop
c01039c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01039c8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c01039cc:	0f 82 0f ff ff ff    	jb     c01038e1 <__umoddi3+0x61>
c01039d2:	e9 1a ff ff ff       	jmp    c01038f1 <__umoddi3+0x71>
