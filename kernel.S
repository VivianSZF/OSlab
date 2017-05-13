
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
c0100015:	8b 04 85 e4 39 10 c0 	mov    -0x3fefc61c(,%eax,4),%eax
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
c010007e:	e8 e3 26 00 00       	call   c0102766 <sys_write>
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
c01000d5:	c7 44 24 08 98 39 10 	movl   $0xc0103998,0x8(%esp)
c01000dc:	c0 
c01000dd:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
c01000e4:	00 
c01000e5:	c7 04 24 c5 39 10 c0 	movl   $0xc01039c5,(%esp)
c01000ec:	e8 d5 25 00 00       	call   c01026c6 <_panic>
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
c010014d:	e8 b4 24 00 00       	call   c0102606 <init_segment>
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
c0100193:	c7 04 24 08 3a 10 c0 	movl   $0xc0103a08,(%esp)
c010019a:	e8 56 26 00 00       	call   c01027f5 <printk>
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
c01003ed:	b8 c6 28 10 c0       	mov    $0xc01028c6,%eax
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
c0100427:	b8 1b 28 10 c0       	mov    $0xc010281b,%eax
c010042c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100433:	00 
c0100434:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100438:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010043f:	00 
c0100440:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c0100447:	e8 15 ff ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c010044c:	b8 24 28 10 c0       	mov    $0xc0102824,%eax
c0100451:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100458:	00 
c0100459:	89 44 24 08          	mov    %eax,0x8(%esp)
c010045d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100464:	00 
c0100465:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c010046c:	e8 f0 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100471:	b8 2d 28 10 c0       	mov    $0xc010282d,%eax
c0100476:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010047d:	00 
c010047e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100482:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100489:	00 
c010048a:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c0100491:	e8 cb fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c0100496:	b8 36 28 10 c0       	mov    $0xc0102836,%eax
c010049b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004a2:	00 
c01004a3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004a7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004ae:	00 
c01004af:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c01004b6:	e8 a6 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c01004bb:	b8 3f 28 10 c0       	mov    $0xc010283f,%eax
c01004c0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004c7:	00 
c01004c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004cc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004d3:	00 
c01004d4:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c01004db:	e8 81 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c01004e0:	b8 48 28 10 c0       	mov    $0xc0102848,%eax
c01004e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004ec:	00 
c01004ed:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004f1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004f8:	00 
c01004f9:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c0100500:	e8 5c fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c0100505:	b8 51 28 10 c0       	mov    $0xc0102851,%eax
c010050a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100511:	00 
c0100512:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100516:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010051d:	00 
c010051e:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c0100525:	e8 37 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c010052a:	b8 5a 28 10 c0       	mov    $0xc010285a,%eax
c010052f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100536:	00 
c0100537:	89 44 24 08          	mov    %eax,0x8(%esp)
c010053b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100542:	00 
c0100543:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c010054a:	e8 12 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c010054f:	b8 63 28 10 c0       	mov    $0xc0102863,%eax
c0100554:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010055b:	00 
c010055c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100560:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100567:	00 
c0100568:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c010056f:	e8 ed fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c0100574:	b8 6a 28 10 c0       	mov    $0xc010286a,%eax
c0100579:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100580:	00 
c0100581:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100585:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010058c:	00 
c010058d:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c0100594:	e8 c8 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c0100599:	b8 73 28 10 c0       	mov    $0xc0102873,%eax
c010059e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005a5:	00 
c01005a6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005aa:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005b1:	00 
c01005b2:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c01005b9:	e8 a3 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c01005be:	b8 7a 28 10 c0       	mov    $0xc010287a,%eax
c01005c3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ca:	00 
c01005cb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005cf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005d6:	00 
c01005d7:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c01005de:	e8 7e fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c01005e3:	b8 81 28 10 c0       	mov    $0xc0102881,%eax
c01005e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ef:	00 
c01005f0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005f4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005fb:	00 
c01005fc:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c0100603:	e8 59 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c0100608:	b8 88 28 10 c0       	mov    $0xc0102888,%eax
c010060d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100614:	00 
c0100615:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100619:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100620:	00 
c0100621:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c0100628:	e8 34 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c010062d:	b8 8f 28 10 c0       	mov    $0xc010288f,%eax
c0100632:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100639:	00 
c010063a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010063e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100645:	00 
c0100646:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c010064d:	e8 0f fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100652:	b8 96 28 10 c0       	mov    $0xc0102896,%eax
c0100657:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c010065e:	00 
c010065f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100663:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010066a:	00 
c010066b:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c0100672:	e8 ea fc ff ff       	call   c0100361 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c0100677:	b8 a2 28 10 c0       	mov    $0xc01028a2,%eax
c010067c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100683:	00 
c0100684:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100688:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010068f:	00 
c0100690:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c0100697:	e8 45 fc ff ff       	call   c01002e1 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c010069c:	b8 ae 28 10 c0       	mov    $0xc01028ae,%eax
c01006a1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006a8:	00 
c01006a9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ad:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006b4:	00 
c01006b5:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c01006bc:	e8 20 fc ff ff       	call   c01002e1 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c01006c1:	b8 ba 28 10 c0       	mov    $0xc01028ba,%eax
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
c0100763:	c7 44 24 04 86 3a 10 	movl   $0xc0103a86,0x4(%esp)
c010076a:	c0 
c010076b:	c7 04 24 14 3a 10 c0 	movl   $0xc0103a14,(%esp)
c0100772:	e8 7e 20 00 00       	call   c01027f5 <printk>
c0100777:	eb 26                	jmp    c010079f <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100779:	8b 45 08             	mov    0x8(%ebp),%eax
c010077c:	8b 40 30             	mov    0x30(%eax),%eax
c010077f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100783:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c010078a:	00 
c010078b:	c7 44 24 04 86 3a 10 	movl   $0xc0103a86,0x4(%esp)
c0100792:	c0 
c0100793:	c7 04 24 34 3a 10 c0 	movl   $0xc0103a34,(%esp)
c010079a:	e8 56 20 00 00       	call   c01027f5 <printk>
		}
		assert(0);
c010079f:	c7 44 24 0c 57 3a 10 	movl   $0xc0103a57,0xc(%esp)
c01007a6:	c0 
c01007a7:	c7 44 24 08 59 3a 10 	movl   $0xc0103a59,0x8(%esp)
c01007ae:	c0 
c01007af:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c01007b6:	00 
c01007b7:	c7 04 24 6e 3a 10 c0 	movl   $0xc0103a6e,(%esp)
c01007be:	e8 03 1f 00 00       	call   c01026c6 <_panic>
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
c01007d7:	e8 00 1b 00 00       	call   c01022dc <schedule>
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
c0100883:	c7 44 24 04 86 3a 10 	movl   $0xc0103a86,0x4(%esp)
c010088a:	c0 
c010088b:	c7 04 24 34 3a 10 c0 	movl   $0xc0103a34,(%esp)
c0100892:	e8 5e 1f 00 00       	call   c01027f5 <printk>
		assert(0);
c0100897:	c7 44 24 0c 57 3a 10 	movl   $0xc0103a57,0xc(%esp)
c010089e:	c0 
c010089f:	c7 44 24 08 59 3a 10 	movl   $0xc0103a59,0x8(%esp)
c01008a6:	c0 
c01008a7:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01008ae:	00 
c01008af:	c7 04 24 6e 3a 10 c0 	movl   $0xc0103a6e,(%esp)
c01008b6:	e8 0b 1e 00 00       	call   c01026c6 <_panic>
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
c01008da:	e8 fa 22 00 00       	call   c0102bd9 <memset>
	memset(vref, 0, SCR_SIZE);
c01008df:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008e6:	00 
c01008e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008ee:	00 
c01008ef:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01008f6:	e8 de 22 00 00       	call   c0102bd9 <memset>
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
c010091a:	e8 9d 22 00 00       	call   c0102bbc <memcpy>
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
c0100941:	e8 93 22 00 00       	call   c0102bd9 <memset>
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
c0100af9:	c7 44 24 0c 91 3a 10 	movl   $0xc0103a91,0xc(%esp)
c0100b00:	c0 
c0100b01:	c7 44 24 08 a1 3a 10 	movl   $0xc0103aa1,0x8(%esp)
c0100b08:	c0 
c0100b09:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100b10:	00 
c0100b11:	c7 04 24 b6 3a 10 c0 	movl   $0xc0103ab6,(%esp)
c0100b18:	e8 a9 1b 00 00       	call   c01026c6 <_panic>
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
c0100b82:	c7 44 24 0c cc 3a 10 	movl   $0xc0103acc,0xc(%esp)
c0100b89:	c0 
c0100b8a:	c7 44 24 08 d9 3a 10 	movl   $0xc0103ad9,0x8(%esp)
c0100b91:	c0 
c0100b92:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0100b99:	00 
c0100b9a:	c7 04 24 ee 3a 10 c0 	movl   $0xc0103aee,(%esp)
c0100ba1:	e8 20 1b 00 00       	call   c01026c6 <_panic>
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
c0100be2:	c7 44 24 0c 04 3b 10 	movl   $0xc0103b04,0xc(%esp)
c0100be9:	c0 
c0100bea:	c7 44 24 08 d9 3a 10 	movl   $0xc0103ad9,0x8(%esp)
c0100bf1:	c0 
c0100bf2:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0100bf9:	00 
c0100bfa:	c7 04 24 ee 3a 10 c0 	movl   $0xc0103aee,(%esp)
c0100c01:	e8 c0 1a 00 00       	call   c01026c6 <_panic>
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
c0100c2f:	c7 44 24 0c cc 3a 10 	movl   $0xc0103acc,0xc(%esp)
c0100c36:	c0 
c0100c37:	c7 44 24 08 d9 3a 10 	movl   $0xc0103ad9,0x8(%esp)
c0100c3e:	c0 
c0100c3f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0100c46:	00 
c0100c47:	c7 04 24 ee 3a 10 c0 	movl   $0xc0103aee,(%esp)
c0100c4e:	e8 73 1a 00 00       	call   c01026c6 <_panic>
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
c0100c8f:	c7 44 24 0c 04 3b 10 	movl   $0xc0103b04,0xc(%esp)
c0100c96:	c0 
c0100c97:	c7 44 24 08 d9 3a 10 	movl   $0xc0103ad9,0x8(%esp)
c0100c9e:	c0 
c0100c9f:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
c0100ca6:	00 
c0100ca7:	c7 04 24 ee 3a 10 c0 	movl   $0xc0103aee,(%esp)
c0100cae:	e8 13 1a 00 00       	call   c01026c6 <_panic>
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
c0100ce0:	c7 44 24 08 10 3b 10 	movl   $0xc0103b10,0x8(%esp)
c0100ce7:	c0 
c0100ce8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ceb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100cef:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cf2:	89 04 24             	mov    %eax,(%esp)
c0100cf5:	e8 cc 19 00 00       	call   c01026c6 <_panic>
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
c0100d1e:	c7 44 24 08 34 3b 10 	movl   $0xc0103b34,0x8(%esp)
c0100d25:	c0 
c0100d26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d29:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d30:	89 04 24             	mov    %eax,(%esp)
c0100d33:	e8 8e 19 00 00       	call   c01026c6 <_panic>
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
c0100d76:	c7 04 24 57 3b 10 c0 	movl   $0xc0103b57,(%esp)
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
c0100e67:	e8 2e 0c 00 00       	call   c0101a9a <page_alloc>
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
c0100f08:	e8 af 1c 00 00       	call   c0102bbc <memcpy>
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
c0100fb6:	e8 df 0a 00 00       	call   c0101a9a <page_alloc>
c0100fbb:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c0100fbe:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0100fc2:	75 24                	jne    c0100fe8 <mm_malloc+0x89>
c0100fc4:	c7 44 24 0c 6d 3b 10 	movl   $0xc0103b6d,0xc(%esp)
c0100fcb:	c0 
c0100fcc:	c7 44 24 08 d9 3a 10 	movl   $0xc0103ad9,0x8(%esp)
c0100fd3:	c0 
c0100fd4:	c7 44 24 04 59 00 00 	movl   $0x59,0x4(%esp)
c0100fdb:	00 
c0100fdc:	c7 04 24 77 3b 10 c0 	movl   $0xc0103b77,(%esp)
c0100fe3:	e8 de 16 00 00       	call   c01026c6 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0100fe8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100feb:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c0100ff2:	00 
c0100ff3:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100ff7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ffa:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ffe:	8b 45 08             	mov    0x8(%ebp),%eax
c0101001:	89 04 24             	mov    %eax,(%esp)
c0101004:	e8 ce 0f 00 00       	call   c0101fd7 <page_insert>
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
c0101098:	e8 1f 1b 00 00       	call   c0102bbc <memcpy>
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
c010120d:	c7 44 24 0c 8a 3b 10 	movl   $0xc0103b8a,0xc(%esp)
c0101214:	c0 
c0101215:	c7 44 24 08 d9 3a 10 	movl   $0xc0103ad9,0x8(%esp)
c010121c:	c0 
c010121d:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c0101224:	00 
c0101225:	c7 04 24 77 3b 10 c0 	movl   $0xc0103b77,(%esp)
c010122c:	e8 95 14 00 00       	call   c01026c6 <_panic>
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
c0101268:	c7 04 24 77 3b 10 c0 	movl   $0xc0103b77,(%esp)
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
c0101303:	e8 d1 18 00 00       	call   c0102bd9 <memset>
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
c0101355:	c7 04 24 77 3b 10 c0 	movl   $0xc0103b77,(%esp)
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
c01013a3:	e8 14 18 00 00       	call   c0102bbc <memcpy>
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
c01013f9:	e8 2d 08 00 00       	call   c0101c2b <pg_copy>
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
c0101413:	e8 0c 0a 00 00       	call   c0101e24 <pg_remove>
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
c0101426:	c7 44 24 0c a4 3b 10 	movl   $0xc0103ba4,0xc(%esp)
c010142d:	c0 
c010142e:	c7 44 24 08 b1 3b 10 	movl   $0xc0103bb1,0x8(%esp)
c0101435:	c0 
c0101436:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c010143d:	00 
c010143e:	c7 04 24 c6 3b 10 c0 	movl   $0xc0103bc6,(%esp)
c0101445:	e8 7c 12 00 00       	call   c01026c6 <_panic>
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
c0101486:	c7 44 24 0c dc 3b 10 	movl   $0xc0103bdc,0xc(%esp)
c010148d:	c0 
c010148e:	c7 44 24 08 b1 3b 10 	movl   $0xc0103bb1,0x8(%esp)
c0101495:	c0 
c0101496:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c010149d:	00 
c010149e:	c7 04 24 c6 3b 10 c0 	movl   $0xc0103bc6,(%esp)
c01014a5:	e8 1c 12 00 00       	call   c01026c6 <_panic>
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
c01014d3:	c7 44 24 0c a4 3b 10 	movl   $0xc0103ba4,0xc(%esp)
c01014da:	c0 
c01014db:	c7 44 24 08 b1 3b 10 	movl   $0xc0103bb1,0x8(%esp)
c01014e2:	c0 
c01014e3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c01014ea:	00 
c01014eb:	c7 04 24 c6 3b 10 c0 	movl   $0xc0103bc6,(%esp)
c01014f2:	e8 cf 11 00 00       	call   c01026c6 <_panic>
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
c010153e:	c7 44 24 08 e8 3b 10 	movl   $0xc0103be8,0x8(%esp)
c0101545:	c0 
c0101546:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101549:	89 44 24 04          	mov    %eax,0x4(%esp)
c010154d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101550:	89 04 24             	mov    %eax,(%esp)
c0101553:	e8 6e 11 00 00       	call   c01026c6 <_panic>
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
c01015d7:	c7 04 24 0c 3c 10 c0 	movl   $0xc0103c0c,(%esp)
c01015de:	e8 12 12 00 00       	call   c01027f5 <printk>
c01015e3:	eb 18                	jmp    c01015fd <sys_exit+0x3e>
	else
		printk("Not teminate the process of pid %d!!!\n",pcbnow->pid);
c01015e5:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015ea:	8b 40 10             	mov    0x10(%eax),%eax
c01015ed:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015f1:	c7 04 24 3c 3c 10 c0 	movl   $0xc0103c3c,(%esp)
c01015f8:	e8 f8 11 00 00       	call   c01027f5 <printk>
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
c010168a:	c7 04 24 63 3c 10 c0 	movl   $0xc0103c63,(%esp)
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
c01016e6:	e8 ca 0e 00 00       	call   c01025b5 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01016eb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016f0:	8b 40 04             	mov    0x4(%eax),%eax
c01016f3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01016f7:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01016fe:	00 
c01016ff:	c7 04 24 63 3c 10 c0 	movl   $0xc0103c63,(%esp)
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
c01017f6:	e8 ba 0d 00 00       	call   c01025b5 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c01017fb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101800:	8b 40 04             	mov    0x4(%eax),%eax
c0101803:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101807:	c7 44 24 04 53 00 00 	movl   $0x53,0x4(%esp)
c010180e:	00 
c010180f:	c7 04 24 63 3c 10 c0 	movl   $0xc0103c63,(%esp)
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
c010183d:	c7 44 24 08 7c 3c 10 	movl   $0xc0103c7c,0x8(%esp)
c0101844:	c0 
c0101845:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101848:	89 44 24 04          	mov    %eax,0x4(%esp)
c010184c:	8b 45 08             	mov    0x8(%ebp),%eax
c010184f:	89 04 24             	mov    %eax,(%esp)
c0101852:	e8 6f 0e 00 00       	call   c01026c6 <_panic>
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
c010187b:	c7 44 24 08 a0 3c 10 	movl   $0xc0103ca0,0x8(%esp)
c0101882:	c0 
c0101883:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101886:	89 44 24 04          	mov    %eax,0x4(%esp)
c010188a:	8b 45 08             	mov    0x8(%ebp),%eax
c010188d:	89 04 24             	mov    %eax,(%esp)
c0101890:	e8 31 0e 00 00       	call   c01026c6 <_panic>
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
c01018c9:	c7 44 24 08 c4 3c 10 	movl   $0xc0103cc4,0x8(%esp)
c01018d0:	c0 
c01018d1:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c01018d8:	00 
c01018d9:	c7 04 24 e3 3c 10 c0 	movl   $0xc0103ce3,(%esp)
c01018e0:	e8 e1 0d 00 00       	call   c01026c6 <_panic>
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
c0101912:	c7 04 24 e3 3c 10 c0 	movl   $0xc0103ce3,(%esp)
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
c0101924:	83 ec 44             	sub    $0x44,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
c0101927:	c7 45 e8 00 30 13 c0 	movl   $0xc0133000,-0x18(%ebp)
	pte_t *pgta=kpgtable;
c010192e:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (i=0; i<(npages/NPTENTRIES);i++) {
c0101935:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010193c:	eb 40                	jmp    c010197e <page_init+0x5e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
c010193e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101941:	05 00 03 00 00       	add    $0x300,%eax
c0101946:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010194d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101950:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101953:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101956:	89 44 24 08          	mov    %eax,0x8(%esp)
c010195a:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101961:	00 
c0101962:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101969:	e8 b8 fe ff ff       	call   c0101826 <_paddr>
c010196e:	83 c8 03             	or     $0x3,%eax
c0101971:	89 03                	mov    %eax,(%ebx)
		pgta+=NPTENTRIES;
c0101973:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int i;
	pde_t *pgdir=kpgdir;
	pte_t *pgta=kpgtable;
	for (i=0; i<(npages/NPTENTRIES);i++) {
c010197a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010197e:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101982:	7e ba                	jle    c010193e <page_init+0x1e>
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
c0101984:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgta--;
c010198b:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (;pframe>=0; pframe-=PGSIZE){
c010198f:	eb 18                	jmp    c01019a9 <page_init+0x89>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
c0101991:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101994:	83 c8 07             	or     $0x7,%eax
c0101997:	89 c2                	mov    %eax,%edx
c0101999:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010199c:	89 10                	mov    %edx,(%eax)
		pgta--;
c010199e:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[i+(KERNBASE>>PDXSHIFT)]=PADDR(pgta)|PTE_P|PTE_W;
		pgta+=NPTENTRIES;
	}
	int pframe=PHYMEM-PGSIZE;
	pgta--;
	for (;pframe>=0; pframe-=PGSIZE){
c01019a2:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c01019a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01019ad:	79 e2                	jns    c0101991 <page_init+0x71>
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
c01019af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01019b2:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c01019b7:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01019bc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01019c0:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c01019c7:	00 
c01019c8:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c01019cf:	e8 52 fe ff ff       	call   c0101826 <_paddr>
c01019d4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01019d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019da:	0f 22 d8             	mov    %eax,%cr3
	for (i=0;i<0x400;i++) {
c01019dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01019e4:	eb 11                	jmp    c01019f7 <page_init+0xd7>
		pages[i].pp_ref = 1;
c01019e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019e9:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c01019f0:	c0 01 00 
		*pgta=pframe|PTE_P|PTE_U|PTE_W;
		pgta--;
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
c01019f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01019f7:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c01019fe:	7e e6                	jle    c01019e6 <page_init+0xc6>
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101a00:	c7 45 f4 ff 7f 00 00 	movl   $0x7fff,-0xc(%ebp)
c0101a07:	eb 31                	jmp    c0101a3a <page_init+0x11a>
		pages[i].pp_ref = 0;
c0101a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a0c:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101a13:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101a16:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101a1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a1f:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101a26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a29:	c1 e0 03             	shl    $0x3,%eax
c0101a2c:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101a31:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	for (i=0;i<0x400;i++) {
		pages[i].pp_ref = 1;
	}
	for (i=npages-1;i>= 0x400;i--){
c0101a36:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0101a3a:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101a41:	7f c6                	jg     c0101a09 <page_init+0xe9>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101a43:	c7 45 e4 00 10 00 00 	movl   $0x1000,-0x1c(%ebp)
c0101a4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101a4d:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101a52:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101a55:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101a58:	ba 00 00 00 00       	mov    $0x0,%edx
c0101a5d:	f7 75 e4             	divl   -0x1c(%ebp)
c0101a60:	89 d0                	mov    %edx,%eax
c0101a62:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101a65:	29 c2                	sub    %eax,%edx
c0101a67:	89 d0                	mov    %edx,%eax
c0101a69:	89 c2                	mov    %eax,%edx
c0101a6b:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101a70:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101a77:	00 
c0101a78:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101a7f:	00 
c0101a80:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a84:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101a8b:	00 
c0101a8c:	89 04 24             	mov    %eax,(%esp)
c0101a8f:	e8 de 04 00 00       	call   c0101f72 <boot_map_region>
}
c0101a94:	83 c4 44             	add    $0x44,%esp
c0101a97:	5b                   	pop    %ebx
c0101a98:	5d                   	pop    %ebp
c0101a99:	c3                   	ret    

c0101a9a <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101a9a:	55                   	push   %ebp
c0101a9b:	89 e5                	mov    %esp,%ebp
c0101a9d:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101aa0:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101aa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101aa8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101aac:	75 07                	jne    c0101ab5 <page_alloc+0x1b>
c0101aae:	b8 00 00 00 00       	mov    $0x0,%eax
c0101ab3:	eb 45                	jmp    c0101afa <page_alloc+0x60>
	page_free_list = page_free_list -> pp_link;
c0101ab5:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101aba:	8b 00                	mov    (%eax),%eax
c0101abc:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	if (alloc_flags & ALLOC_ZERO) {
c0101ac1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ac4:	83 e0 01             	and    $0x1,%eax
c0101ac7:	85 c0                	test   %eax,%eax
c0101ac9:	74 23                	je     c0101aee <page_alloc+0x54>
		memset(page2kva(p), 0, PGSIZE);
c0101acb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ace:	89 04 24             	mov    %eax,(%esp)
c0101ad1:	e8 1f fe ff ff       	call   c01018f5 <page2kva>
c0101ad6:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101add:	00 
c0101ade:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101ae5:	00 
c0101ae6:	89 04 24             	mov    %eax,(%esp)
c0101ae9:	e8 eb 10 00 00       	call   c0102bd9 <memset>
	}
	p -> pp_link = NULL;
c0101aee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101af1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101afa:	c9                   	leave  
c0101afb:	c3                   	ret    

c0101afc <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101afc:	55                   	push   %ebp
c0101afd:	89 e5                	mov    %esp,%ebp
	pp->pp_link = page_free_list;
c0101aff:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101b05:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b08:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101b0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b0d:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101b12:	5d                   	pop    %ebp
c0101b13:	c3                   	ret    

c0101b14 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0101b14:	55                   	push   %ebp
c0101b15:	89 e5                	mov    %esp,%ebp
c0101b17:	83 ec 04             	sub    $0x4,%esp
	if (--pp->pp_ref == 0)
c0101b1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b1d:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b21:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101b24:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b27:	66 89 50 04          	mov    %dx,0x4(%eax)
c0101b2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b2e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b32:	66 85 c0             	test   %ax,%ax
c0101b35:	75 0b                	jne    c0101b42 <page_decref+0x2e>
		page_free(pp);
c0101b37:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b3a:	89 04 24             	mov    %eax,(%esp)
c0101b3d:	e8 ba ff ff ff       	call   c0101afc <page_free>
}
c0101b42:	c9                   	leave  
c0101b43:	c3                   	ret    

c0101b44 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0101b44:	55                   	push   %ebp
c0101b45:	89 e5                	mov    %esp,%ebp
c0101b47:	53                   	push   %ebx
c0101b48:	83 ec 24             	sub    $0x24,%esp
	pte_t *t=NULL;
c0101b4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (pgdir[PDX(va)] & PTE_P) {
c0101b52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b55:	c1 e8 16             	shr    $0x16,%eax
c0101b58:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101b5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b62:	01 d0                	add    %edx,%eax
c0101b64:	8b 00                	mov    (%eax),%eax
c0101b66:	83 e0 01             	and    $0x1,%eax
c0101b69:	85 c0                	test   %eax,%eax
c0101b6b:	74 36                	je     c0101ba3 <pgdir_walk+0x5f>
		t = KADDR(PTE_ADDR(pgdir[PDX(va)]));
c0101b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b70:	c1 e8 16             	shr    $0x16,%eax
c0101b73:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101b7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b7d:	01 d0                	add    %edx,%eax
c0101b7f:	8b 00                	mov    (%eax),%eax
c0101b81:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101b86:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101b8a:	c7 44 24 04 a3 00 00 	movl   $0xa3,0x4(%esp)
c0101b91:	00 
c0101b92:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101b99:	e8 c3 fc ff ff       	call   c0101861 <_kaddr>
c0101b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101ba1:	eb 6b                	jmp    c0101c0e <pgdir_walk+0xca>
	}
	else {
		if (create == false) 
c0101ba3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101ba7:	75 07                	jne    c0101bb0 <pgdir_walk+0x6c>
			return NULL;
c0101ba9:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bae:	eb 75                	jmp    c0101c25 <pgdir_walk+0xe1>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0101bb0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101bb7:	e8 de fe ff ff       	call   c0101a9a <page_alloc>
c0101bbc:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (p == NULL) 
c0101bbf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101bc3:	75 07                	jne    c0101bcc <pgdir_walk+0x88>
			return NULL;
c0101bc5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bca:	eb 59                	jmp    c0101c25 <pgdir_walk+0xe1>
		p -> pp_ref ++;
c0101bcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101bcf:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101bd3:	8d 50 01             	lea    0x1(%eax),%edx
c0101bd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101bd9:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[PDX(va)] = page2pa(p) | PTE_P | PTE_W | PTE_U;
c0101bdd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101be0:	c1 e8 16             	shr    $0x16,%eax
c0101be3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101bea:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bed:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101bf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101bf3:	89 04 24             	mov    %eax,(%esp)
c0101bf6:	e8 a4 fc ff ff       	call   c010189f <page2pa>
c0101bfb:	83 c8 07             	or     $0x7,%eax
c0101bfe:	89 03                	mov    %eax,(%ebx)
		t=page2kva(p);
c0101c00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101c03:	89 04 24             	mov    %eax,(%esp)
c0101c06:	e8 ea fc ff ff       	call   c01018f5 <page2kva>
c0101c0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	return &t[PTX(va)];
c0101c0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c11:	c1 e8 0c             	shr    $0xc,%eax
c0101c14:	25 ff 03 00 00       	and    $0x3ff,%eax
c0101c19:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c23:	01 d0                	add    %edx,%eax
}
c0101c25:	83 c4 24             	add    $0x24,%esp
c0101c28:	5b                   	pop    %ebx
c0101c29:	5d                   	pop    %ebp
c0101c2a:	c3                   	ret    

c0101c2b <pg_copy>:


void 
pg_copy(pde_t *fa, pde_t *tb)
{
c0101c2b:	55                   	push   %ebp
c0101c2c:	89 e5                	mov    %esp,%ebp
c0101c2e:	53                   	push   %ebx
c0101c2f:	83 ec 34             	sub    $0x34,%esp
	int i, j;
	for (i=0;i<1024;i++){
c0101c32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101c39:	e9 d3 01 00 00       	jmp    c0101e11 <pg_copy+0x1e6>
		if (fa[i]&PTE_P){	
c0101c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c41:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c48:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c4b:	01 d0                	add    %edx,%eax
c0101c4d:	8b 00                	mov    (%eax),%eax
c0101c4f:	83 e0 01             	and    $0x1,%eax
c0101c52:	85 c0                	test   %eax,%eax
c0101c54:	0f 84 b3 01 00 00    	je     c0101e0d <pg_copy+0x1e2>
			if (tb[i]&PTE_P) 
c0101c5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c67:	01 d0                	add    %edx,%eax
c0101c69:	8b 00                	mov    (%eax),%eax
c0101c6b:	83 e0 01             	and    $0x1,%eax
c0101c6e:	85 c0                	test   %eax,%eax
c0101c70:	74 05                	je     c0101c77 <pg_copy+0x4c>
				continue;
c0101c72:	e9 96 01 00 00       	jmp    c0101e0d <pg_copy+0x1e2>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
c0101c77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c7a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c81:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c84:	01 d0                	add    %edx,%eax
c0101c86:	8b 00                	mov    (%eax),%eax
c0101c88:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101c8d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101c91:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
c0101c98:	00 
c0101c99:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101ca0:	e8 bc fb ff ff       	call   c0101861 <_kaddr>
c0101ca5:	89 45 ec             	mov    %eax,-0x14(%ebp)
			struct Page *p = page_alloc(ALLOC_ZERO);
c0101ca8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101caf:	e8 e6 fd ff ff       	call   c0101a9a <page_alloc>
c0101cb4:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c0101cb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cba:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101cbe:	8d 50 01             	lea    0x1(%eax),%edx
c0101cc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cc4:	66 89 50 04          	mov    %dx,0x4(%eax)
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
c0101cc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ccb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101cd2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cd5:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101cd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cdb:	89 04 24             	mov    %eax,(%esp)
c0101cde:	e8 bc fb ff ff       	call   c010189f <page2pa>
c0101ce3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101ce6:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101ced:	8b 55 08             	mov    0x8(%ebp),%edx
c0101cf0:	01 ca                	add    %ecx,%edx
c0101cf2:	8b 12                	mov    (%edx),%edx
c0101cf4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101cfa:	09 d0                	or     %edx,%eax
c0101cfc:	89 03                	mov    %eax,(%ebx)
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
c0101cfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d01:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d08:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d0b:	01 d0                	add    %edx,%eax
c0101d0d:	8b 00                	mov    (%eax),%eax
c0101d0f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101d14:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d18:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c0101d1f:	00 
c0101d20:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101d27:	e8 35 fb ff ff       	call   c0101861 <_kaddr>
c0101d2c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (j=0;j<NPTENTRIES;j++){ 
c0101d2f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101d36:	e9 c5 00 00 00       	jmp    c0101e00 <pg_copy+0x1d5>
				if (fat[j]&PTE_P){ 
c0101d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101d3e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d48:	01 d0                	add    %edx,%eax
c0101d4a:	8b 00                	mov    (%eax),%eax
c0101d4c:	83 e0 01             	and    $0x1,%eax
c0101d4f:	85 c0                	test   %eax,%eax
c0101d51:	0f 84 a5 00 00 00    	je     c0101dfc <pg_copy+0x1d1>
					p = page_alloc(0);
c0101d57:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101d5e:	e8 37 fd ff ff       	call   c0101a9a <page_alloc>
c0101d63:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c0101d66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d69:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101d6d:	8d 50 01             	lea    0x1(%eax),%edx
c0101d70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d73:	66 89 50 04          	mov    %dx,0x4(%eax)
					tbt[j] = page2pa(p)|(fat[j]&0xFFF);
c0101d77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101d7a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d84:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101d87:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d8a:	89 04 24             	mov    %eax,(%esp)
c0101d8d:	e8 0d fb ff ff       	call   c010189f <page2pa>
c0101d92:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101d95:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101d9c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d9f:	01 ca                	add    %ecx,%edx
c0101da1:	8b 12                	mov    (%edx),%edx
c0101da3:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101da9:	09 d0                	or     %edx,%eax
c0101dab:	89 03                	mov    %eax,(%ebx)
					memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
c0101dad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101db0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101dba:	01 d0                	add    %edx,%eax
c0101dbc:	8b 00                	mov    (%eax),%eax
c0101dbe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101dc3:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101dc7:	c7 44 24 04 c5 00 00 	movl   $0xc5,0x4(%esp)
c0101dce:	00 
c0101dcf:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101dd6:	e8 86 fa ff ff       	call   c0101861 <_kaddr>
c0101ddb:	89 c3                	mov    %eax,%ebx
c0101ddd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101de0:	89 04 24             	mov    %eax,(%esp)
c0101de3:	e8 0d fb ff ff       	call   c01018f5 <page2kva>
c0101de8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101def:	00 
c0101df0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0101df4:	89 04 24             	mov    %eax,(%esp)
c0101df7:	e8 c0 0d 00 00       	call   c0102bbc <memcpy>
			pte_t *fat=KADDR(PTE_ADDR(fa[i]));
			struct Page *p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			tb[i]=page2pa(p)|(fa[i]&0xFFF);
			pte_t *tbt=KADDR(PTE_ADDR(tb[i]));
			for (j=0;j<NPTENTRIES;j++){ 
c0101dfc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101e00:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101e07:	0f 8e 2e ff ff ff    	jle    c0101d3b <pg_copy+0x110>

void 
pg_copy(pde_t *fa, pde_t *tb)
{
	int i, j;
	for (i=0;i<1024;i++){
c0101e0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e11:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101e18:	0f 8e 20 fe ff ff    	jle    c0101c3e <pg_copy+0x13>
					memcpy(page2kva(p), KADDR(PTE_ADDR(fat[j])), PGSIZE);
				}
			}
		}
	}
}
c0101e1e:	83 c4 34             	add    $0x34,%esp
c0101e21:	5b                   	pop    %ebx
c0101e22:	5d                   	pop    %ebp
c0101e23:	c3                   	ret    

c0101e24 <pg_remove>:
void 
pg_remove(pde_t *pgdir)
{
c0101e24:	55                   	push   %ebp
c0101e25:	89 e5                	mov    %esp,%ebp
c0101e27:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	for (i=0; i<1024;i++) {
c0101e2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e31:	e9 fb 00 00 00       	jmp    c0101f31 <pg_remove+0x10d>
		if (pgdir[i]&PTE_P) {
c0101e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e39:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e43:	01 d0                	add    %edx,%eax
c0101e45:	8b 00                	mov    (%eax),%eax
c0101e47:	83 e0 01             	and    $0x1,%eax
c0101e4a:	85 c0                	test   %eax,%eax
c0101e4c:	0f 84 db 00 00 00    	je     c0101f2d <pg_remove+0x109>
			if (kern_pgdir[i]&PTE_P) 
c0101e52:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101e57:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101e5a:	c1 e2 02             	shl    $0x2,%edx
c0101e5d:	01 d0                	add    %edx,%eax
c0101e5f:	8b 00                	mov    (%eax),%eax
c0101e61:	83 e0 01             	and    $0x1,%eax
c0101e64:	85 c0                	test   %eax,%eax
c0101e66:	74 05                	je     c0101e6d <pg_remove+0x49>
				continue;
c0101e68:	e9 c0 00 00 00       	jmp    c0101f2d <pg_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
c0101e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e70:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e7a:	01 d0                	add    %edx,%eax
c0101e7c:	8b 00                	mov    (%eax),%eax
c0101e7e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101e83:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e87:	c7 44 24 04 d3 00 00 	movl   $0xd3,0x4(%esp)
c0101e8e:	00 
c0101e8f:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101e96:	e8 c6 f9 ff ff       	call   c0101861 <_kaddr>
c0101e9b:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (j=0; j<NPTENTRIES;j++){
c0101e9e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ea5:	eb 42                	jmp    c0101ee9 <pg_remove+0xc5>
				if (pgtable[j]&PTE_P){
c0101ea7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101eaa:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101eb1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101eb4:	01 d0                	add    %edx,%eax
c0101eb6:	8b 00                	mov    (%eax),%eax
c0101eb8:	83 e0 01             	and    $0x1,%eax
c0101ebb:	85 c0                	test   %eax,%eax
c0101ebd:	74 26                	je     c0101ee5 <pg_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
c0101ebf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ec2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ec9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ecc:	01 d0                	add    %edx,%eax
c0101ece:	8b 00                	mov    (%eax),%eax
c0101ed0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101ed5:	89 04 24             	mov    %eax,(%esp)
c0101ed8:	e8 d9 f9 ff ff       	call   c01018b6 <pa2page>
c0101edd:	89 04 24             	mov    %eax,(%esp)
c0101ee0:	e8 2f fc ff ff       	call   c0101b14 <page_decref>
	for (i=0; i<1024;i++) {
		if (pgdir[i]&PTE_P) {
			if (kern_pgdir[i]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[i]));
			for (j=0; j<NPTENTRIES;j++){
c0101ee5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101ee9:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101ef0:	7e b5                	jle    c0101ea7 <pg_remove+0x83>
				if (pgtable[j]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[j])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
c0101ef2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ef5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101efc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eff:	01 d0                	add    %edx,%eax
c0101f01:	8b 00                	mov    (%eax),%eax
c0101f03:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101f08:	89 04 24             	mov    %eax,(%esp)
c0101f0b:	e8 a6 f9 ff ff       	call   c01018b6 <pa2page>
c0101f10:	89 04 24             	mov    %eax,(%esp)
c0101f13:	e8 fc fb ff ff       	call   c0101b14 <page_decref>
			pgdir[i]=NULL;
c0101f18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f1b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f22:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f25:	01 d0                	add    %edx,%eax
c0101f27:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
void 
pg_remove(pde_t *pgdir)
{
	int i,j;
	for (i=0; i<1024;i++) {
c0101f2d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101f31:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101f38:	0f 8e f8 fe ff ff    	jle    c0101e36 <pg_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[i])));
			pgdir[i]=NULL;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c0101f3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f41:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101f45:	c7 44 24 04 dd 00 00 	movl   $0xdd,0x4(%esp)
c0101f4c:	00 
c0101f4d:	c7 04 24 f9 3c 10 c0 	movl   $0xc0103cf9,(%esp)
c0101f54:	e8 cd f8 ff ff       	call   c0101826 <_paddr>
c0101f59:	89 04 24             	mov    %eax,(%esp)
c0101f5c:	e8 55 f9 ff ff       	call   c01018b6 <pa2page>
c0101f61:	89 04 24             	mov    %eax,(%esp)
c0101f64:	e8 ab fb ff ff       	call   c0101b14 <page_decref>
	pgdir=NULL;
c0101f69:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c0101f70:	c9                   	leave  
c0101f71:	c3                   	ret    

c0101f72 <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c0101f72:	55                   	push   %ebp
c0101f73:	89 e5                	mov    %esp,%ebp
c0101f75:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c0101f78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101f7f:	eb 47                	jmp    c0101fc8 <boot_map_region+0x56>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0101f81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101f84:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101f8b:	00 
c0101f8c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f93:	89 04 24             	mov    %eax,(%esp)
c0101f96:	e8 a9 fb ff ff       	call   c0101b44 <pgdir_walk>
c0101f9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (pte == NULL) 
c0101f9e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101fa2:	75 02                	jne    c0101fa6 <boot_map_region+0x34>
			return;
c0101fa4:	eb 2f                	jmp    c0101fd5 <boot_map_region+0x63>
		pte[0]=pa|perm|PTE_P;
c0101fa6:	8b 45 18             	mov    0x18(%ebp),%eax
c0101fa9:	0b 45 14             	or     0x14(%ebp),%eax
c0101fac:	83 c8 01             	or     $0x1,%eax
c0101faf:	89 c2                	mov    %eax,%edx
c0101fb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101fb4:	89 10                	mov    %edx,(%eax)
		va+=PGSIZE;
c0101fb6:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa+=PGSIZE;
c0101fbd:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i;
	for (i=0;i<size/PGSIZE;i++) {
c0101fc4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101fc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101fcb:	8b 55 10             	mov    0x10(%ebp),%edx
c0101fce:	c1 ea 0c             	shr    $0xc,%edx
c0101fd1:	39 d0                	cmp    %edx,%eax
c0101fd3:	72 ac                	jb     c0101f81 <boot_map_region+0xf>
			return;
		pte[0]=pa|perm|PTE_P;
		va+=PGSIZE;
		pa+=PGSIZE;
	}
}
c0101fd5:	c9                   	leave  
c0101fd6:	c3                   	ret    

c0101fd7 <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c0101fd7:	55                   	push   %ebp
c0101fd8:	89 e5                	mov    %esp,%ebp
c0101fda:	53                   	push   %ebx
c0101fdb:	83 ec 24             	sub    $0x24,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 1);
c0101fde:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101fe5:	00 
c0101fe6:	8b 45 10             	mov    0x10(%ebp),%eax
c0101fe9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ff0:	89 04 24             	mov    %eax,(%esp)
c0101ff3:	e8 4c fb ff ff       	call   c0101b44 <pgdir_walk>
c0101ff8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c0101ffb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101fff:	75 0a                	jne    c010200b <page_insert+0x34>
		return -1;
c0102001:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102006:	e9 85 00 00 00       	jmp    c0102090 <page_insert+0xb9>
	}
	else if (pte[0] & PTE_P) {
c010200b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010200e:	8b 00                	mov    (%eax),%eax
c0102010:	83 e0 01             	and    $0x1,%eax
c0102013:	85 c0                	test   %eax,%eax
c0102015:	74 49                	je     c0102060 <page_insert+0x89>
		if (PTE_ADDR(pte[0]) == page2pa(pp)) {
c0102017:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010201a:	8b 00                	mov    (%eax),%eax
c010201c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102021:	89 c3                	mov    %eax,%ebx
c0102023:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102026:	89 04 24             	mov    %eax,(%esp)
c0102029:	e8 71 f8 ff ff       	call   c010189f <page2pa>
c010202e:	39 c3                	cmp    %eax,%ebx
c0102030:	75 1c                	jne    c010204e <page_insert+0x77>
			pte[0] = page2pa(pp)|perm|PTE_P;
c0102032:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102035:	89 04 24             	mov    %eax,(%esp)
c0102038:	e8 62 f8 ff ff       	call   c010189f <page2pa>
c010203d:	8b 55 14             	mov    0x14(%ebp),%edx
c0102040:	09 d0                	or     %edx,%eax
c0102042:	83 c8 01             	or     $0x1,%eax
c0102045:	89 c2                	mov    %eax,%edx
c0102047:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010204a:	89 10                	mov    %edx,(%eax)
c010204c:	eb 12                	jmp    c0102060 <page_insert+0x89>
		}
		else {
			page_remove(pgdir, va);
c010204e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102051:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102055:	8b 45 08             	mov    0x8(%ebp),%eax
c0102058:	89 04 24             	mov    %eax,(%esp)
c010205b:	e8 88 00 00 00       	call   c01020e8 <page_remove>
		}
	}
	pte[0] = page2pa(pp)|perm|PTE_P;
c0102060:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102063:	89 04 24             	mov    %eax,(%esp)
c0102066:	e8 34 f8 ff ff       	call   c010189f <page2pa>
c010206b:	8b 55 14             	mov    0x14(%ebp),%edx
c010206e:	09 d0                	or     %edx,%eax
c0102070:	83 c8 01             	or     $0x1,%eax
c0102073:	89 c2                	mov    %eax,%edx
c0102075:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102078:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c010207a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010207d:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0102081:	8d 50 01             	lea    0x1(%eax),%edx
c0102084:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102087:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c010208b:	b8 00 00 00 00       	mov    $0x0,%eax

}
c0102090:	83 c4 24             	add    $0x24,%esp
c0102093:	5b                   	pop    %ebx
c0102094:	5d                   	pop    %ebp
c0102095:	c3                   	ret    

c0102096 <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c0102096:	55                   	push   %ebp
c0102097:	89 e5                	mov    %esp,%ebp
c0102099:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, 0);
c010209c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01020a3:	00 
c01020a4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020a7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01020ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01020ae:	89 04 24             	mov    %eax,(%esp)
c01020b1:	e8 8e fa ff ff       	call   c0101b44 <pgdir_walk>
c01020b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) 
c01020b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01020bd:	75 07                	jne    c01020c6 <page_lookup+0x30>
		return NULL;
c01020bf:	b8 00 00 00 00       	mov    $0x0,%eax
c01020c4:	eb 20                	jmp    c01020e6 <page_lookup+0x50>
	if (pte_store != NULL) 
c01020c6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01020ca:	74 08                	je     c01020d4 <page_lookup+0x3e>
		*pte_store = pte;
c01020cc:	8b 45 10             	mov    0x10(%ebp),%eax
c01020cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01020d2:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(pte[0]));
c01020d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020d7:	8b 00                	mov    (%eax),%eax
c01020d9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01020de:	89 04 24             	mov    %eax,(%esp)
c01020e1:	e8 d0 f7 ff ff       	call   c01018b6 <pa2page>
}
c01020e6:	c9                   	leave  
c01020e7:	c3                   	ret    

c01020e8 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c01020e8:	55                   	push   %ebp
c01020e9:	89 e5                	mov    %esp,%ebp
c01020eb:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte=NULL;
c01020ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	struct Page *p = page_lookup(pgdir, va, &pte);
c01020f5:	8d 45 f0             	lea    -0x10(%ebp),%eax
c01020f8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01020fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020ff:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102103:	8b 45 08             	mov    0x8(%ebp),%eax
c0102106:	89 04 24             	mov    %eax,(%esp)
c0102109:	e8 88 ff ff ff       	call   c0102096 <page_lookup>
c010210e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p != NULL) {
c0102111:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102115:	74 14                	je     c010212b <page_remove+0x43>
		pte[0] = 0;
c0102117:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010211a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c0102120:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102123:	89 04 24             	mov    %eax,(%esp)
c0102126:	e8 e9 f9 ff ff       	call   c0101b14 <page_decref>
	}
	tlb_invalidate(pgdir, va);
c010212b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010212e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102132:	8b 45 08             	mov    0x8(%ebp),%eax
c0102135:	89 04 24             	mov    %eax,(%esp)
c0102138:	e8 02 00 00 00       	call   c010213f <tlb_invalidate>
}
c010213d:	c9                   	leave  
c010213e:	c3                   	ret    

c010213f <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c010213f:	55                   	push   %ebp
c0102140:	89 e5                	mov    %esp,%ebp
c0102142:	83 ec 10             	sub    $0x10,%esp
c0102145:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102148:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c010214b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010214e:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c0102151:	c9                   	leave  
c0102152:	c3                   	ret    

c0102153 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0102153:	55                   	push   %ebp
c0102154:	89 e5                	mov    %esp,%ebp
c0102156:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0102159:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010215d:	75 24                	jne    c0102183 <list_add+0x30>
c010215f:	c7 44 24 0c 10 3d 10 	movl   $0xc0103d10,0xc(%esp)
c0102166:	c0 
c0102167:	c7 44 24 08 1d 3d 10 	movl   $0xc0103d1d,0x8(%esp)
c010216e:	c0 
c010216f:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0102176:	00 
c0102177:	c7 04 24 32 3d 10 c0 	movl   $0xc0103d32,(%esp)
c010217e:	e8 43 05 00 00       	call   c01026c6 <_panic>
	data->prev = prev;
c0102183:	8b 45 10             	mov    0x10(%ebp),%eax
c0102186:	8b 55 08             	mov    0x8(%ebp),%edx
c0102189:	89 10                	mov    %edx,(%eax)
	data->next = next;
c010218b:	8b 45 10             	mov    0x10(%ebp),%eax
c010218e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102191:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0102194:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102198:	74 09                	je     c01021a3 <list_add+0x50>
c010219a:	8b 45 08             	mov    0x8(%ebp),%eax
c010219d:	8b 55 10             	mov    0x10(%ebp),%edx
c01021a0:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c01021a3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01021a7:	74 08                	je     c01021b1 <list_add+0x5e>
c01021a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021ac:	8b 55 10             	mov    0x10(%ebp),%edx
c01021af:	89 10                	mov    %edx,(%eax)
}
c01021b1:	c9                   	leave  
c01021b2:	c3                   	ret    

c01021b3 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c01021b3:	55                   	push   %ebp
c01021b4:	89 e5                	mov    %esp,%ebp
c01021b6:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01021b9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01021bd:	75 24                	jne    c01021e3 <list_add_before+0x30>
c01021bf:	c7 44 24 0c 48 3d 10 	movl   $0xc0103d48,0xc(%esp)
c01021c6:	c0 
c01021c7:	c7 44 24 08 1d 3d 10 	movl   $0xc0103d1d,0x8(%esp)
c01021ce:	c0 
c01021cf:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c01021d6:	00 
c01021d7:	c7 04 24 32 3d 10 c0 	movl   $0xc0103d32,(%esp)
c01021de:	e8 e3 04 00 00       	call   c01026c6 <_panic>
	list_add(one->prev, one, data);
c01021e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01021e6:	8b 00                	mov    (%eax),%eax
c01021e8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01021eb:	89 54 24 08          	mov    %edx,0x8(%esp)
c01021ef:	8b 55 08             	mov    0x8(%ebp),%edx
c01021f2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01021f6:	89 04 24             	mov    %eax,(%esp)
c01021f9:	e8 55 ff ff ff       	call   c0102153 <list_add>
}
c01021fe:	c9                   	leave  
c01021ff:	c3                   	ret    

c0102200 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0102200:	55                   	push   %ebp
c0102201:	89 e5                	mov    %esp,%ebp
c0102203:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0102206:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010220a:	75 24                	jne    c0102230 <list_del+0x30>
c010220c:	c7 44 24 0c 10 3d 10 	movl   $0xc0103d10,0xc(%esp)
c0102213:	c0 
c0102214:	c7 44 24 08 1d 3d 10 	movl   $0xc0103d1d,0x8(%esp)
c010221b:	c0 
c010221c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0102223:	00 
c0102224:	c7 04 24 32 3d 10 c0 	movl   $0xc0103d32,(%esp)
c010222b:	e8 96 04 00 00       	call   c01026c6 <_panic>
	list *prev = data->prev;
c0102230:	8b 45 08             	mov    0x8(%ebp),%eax
c0102233:	8b 00                	mov    (%eax),%eax
c0102235:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0102238:	8b 45 08             	mov    0x8(%ebp),%eax
c010223b:	8b 40 04             	mov    0x4(%eax),%eax
c010223e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0102241:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102245:	74 09                	je     c0102250 <list_del+0x50>
c0102247:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010224a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010224d:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0102250:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102254:	74 08                	je     c010225e <list_del+0x5e>
c0102256:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102259:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010225c:	89 10                	mov    %edx,(%eax)
}
c010225e:	c9                   	leave  
c010225f:	c3                   	ret    

c0102260 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c0102260:	55                   	push   %ebp
c0102261:	89 e5                	mov    %esp,%ebp
c0102263:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0102266:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010226a:	75 24                	jne    c0102290 <list_empty+0x30>
c010226c:	c7 44 24 0c 48 3d 10 	movl   $0xc0103d48,0xc(%esp)
c0102273:	c0 
c0102274:	c7 44 24 08 1d 3d 10 	movl   $0xc0103d1d,0x8(%esp)
c010227b:	c0 
c010227c:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
c0102283:	00 
c0102284:	c7 04 24 32 3d 10 c0 	movl   $0xc0103d32,(%esp)
c010228b:	e8 36 04 00 00       	call   c01026c6 <_panic>
	return one == one->next;
c0102290:	8b 45 08             	mov    0x8(%ebp),%eax
c0102293:	8b 40 04             	mov    0x4(%eax),%eax
c0102296:	3b 45 08             	cmp    0x8(%ebp),%eax
c0102299:	0f 94 c0             	sete   %al
c010229c:	0f b6 c0             	movzbl %al,%eax
}
c010229f:	c9                   	leave  
c01022a0:	c3                   	ret    

c01022a1 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01022a1:	55                   	push   %ebp
c01022a2:	89 e5                	mov    %esp,%ebp
c01022a4:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01022a7:	8b 45 10             	mov    0x10(%ebp),%eax
c01022aa:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01022af:	77 21                	ja     c01022d2 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01022b1:	8b 45 10             	mov    0x10(%ebp),%eax
c01022b4:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01022b8:	c7 44 24 08 54 3d 10 	movl   $0xc0103d54,0x8(%esp)
c01022bf:	c0 
c01022c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022c3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01022ca:	89 04 24             	mov    %eax,(%esp)
c01022cd:	e8 f4 03 00 00       	call   c01026c6 <_panic>
	return (physaddr_t)kva - KERNBASE;
c01022d2:	8b 45 10             	mov    0x10(%ebp),%eax
c01022d5:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01022da:	c9                   	leave  
c01022db:	c3                   	ret    

c01022dc <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
c01022dc:	55                   	push   %ebp
c01022dd:	89 e5                	mov    %esp,%ebp
c01022df:	83 ec 38             	sub    $0x38,%esp
	list *one,*ne;
	list *bl=&block;
c01022e2:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c01022e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022ec:	8b 40 04             	mov    0x4(%eax),%eax
c01022ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01022f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022f5:	8b 40 04             	mov    0x4(%eax),%eax
c01022f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01022fb:	eb 4f                	jmp    c010234c <schedule+0x70>
		PCB *p=list_entry(one,PCB,plist);
c01022fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102300:	83 e8 08             	sub    $0x8,%eax
c0102303:	89 45 e8             	mov    %eax,-0x18(%ebp)
		p->timecount--;
c0102306:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102309:	8b 40 1c             	mov    0x1c(%eax),%eax
c010230c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010230f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102312:	89 50 1c             	mov    %edx,0x1c(%eax)
		if(p->timecount==0){
c0102315:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102318:	8b 40 1c             	mov    0x1c(%eax),%eax
c010231b:	85 c0                	test   %eax,%eax
c010231d:	75 1e                	jne    c010233d <schedule+0x61>
			list_del(one);
c010231f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102322:	89 04 24             	mov    %eax,(%esp)
c0102325:	e8 d6 fe ff ff       	call   c0102200 <list_del>
			list_add_before(&ready,one);
c010232a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010232d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102331:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102338:	e8 76 fe ff ff       	call   c01021b3 <list_add_before>
//extern TSS tss;
void schedule(){
	list *one,*ne;
	list *bl=&block;
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c010233d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102340:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102343:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102346:	8b 40 04             	mov    0x4(%eax),%eax
c0102349:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010234c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010234f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0102352:	75 a9                	jne    c01022fd <schedule+0x21>
		if(p->timecount==0){
			list_del(one);
			list_add_before(&ready,one);
		}
	}
	if(!list_empty(&ready)){
c0102354:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c010235b:	e8 00 ff ff ff       	call   c0102260 <list_empty>
c0102360:	85 c0                	test   %eax,%eax
c0102362:	75 7e                	jne    c01023e2 <schedule+0x106>
		list *re=&ready;
c0102364:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c010236b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102370:	8b 40 04             	mov    0x4(%eax),%eax
c0102373:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c0102376:	75 0d                	jne    c0102385 <schedule+0xa9>
			now=re->next;
c0102378:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010237b:	8b 40 04             	mov    0x4(%eax),%eax
c010237e:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c0102383:	eb 0d                	jmp    c0102392 <schedule+0xb6>
		else
			now=now->next;
c0102385:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010238a:	8b 40 04             	mov    0x4(%eax),%eax
c010238d:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c0102392:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102397:	83 e8 08             	sub    $0x8,%eax
c010239a:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c010239f:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023a4:	05 f8 0f 00 00       	add    $0xff8,%eax
c01023a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c01023ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01023af:	89 04 24             	mov    %eax,(%esp)
c01023b2:	e8 fe 01 00 00       	call   c01025b5 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c01023b7:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023bc:	8b 40 04             	mov    0x4(%eax),%eax
c01023bf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01023c3:	c7 44 24 04 1e 00 00 	movl   $0x1e,0x4(%esp)
c01023ca:	00 
c01023cb:	c7 04 24 78 3d 10 c0 	movl   $0xc0103d78,(%esp)
c01023d2:	e8 ca fe ff ff       	call   c01022a1 <_paddr>
c01023d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c01023da:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01023dd:	0f 22 d8             	mov    %eax,%cr3
c01023e0:	eb 3a                	jmp    c010241c <schedule+0x140>
		
	}
	else{
		pcbnow=&init;
c01023e2:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01023e9:	3f 16 c0 
		now=&ready;
c01023ec:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c01023f3:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c01023f6:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01023fb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01023ff:	c7 44 24 04 24 00 00 	movl   $0x24,0x4(%esp)
c0102406:	00 
c0102407:	c7 04 24 78 3d 10 c0 	movl   $0xc0103d78,(%esp)
c010240e:	e8 8e fe ff ff       	call   c01022a1 <_paddr>
c0102413:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102416:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102419:	0f 22 d8             	mov    %eax,%cr3
	}
}
c010241c:	c9                   	leave  
c010241d:	c3                   	ret    

c010241e <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c010241e:	55                   	push   %ebp
c010241f:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c0102421:	8b 45 08             	mov    0x8(%ebp),%eax
c0102424:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0102429:	8b 45 08             	mov    0x8(%ebp),%eax
c010242c:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c0102432:	8b 45 08             	mov    0x8(%ebp),%eax
c0102435:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0102439:	8b 45 10             	mov    0x10(%ebp),%eax
c010243c:	83 e0 0f             	and    $0xf,%eax
c010243f:	89 c2                	mov    %eax,%edx
c0102441:	8b 45 08             	mov    0x8(%ebp),%eax
c0102444:	89 d1                	mov    %edx,%ecx
c0102446:	83 e1 0f             	and    $0xf,%ecx
c0102449:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010244d:	83 e2 f0             	and    $0xfffffff0,%edx
c0102450:	09 ca                	or     %ecx,%edx
c0102452:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c0102455:	8b 45 08             	mov    0x8(%ebp),%eax
c0102458:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010245c:	83 ca 10             	or     $0x10,%edx
c010245f:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c0102462:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102465:	83 e0 03             	and    $0x3,%eax
c0102468:	89 c2                	mov    %eax,%edx
c010246a:	8b 45 08             	mov    0x8(%ebp),%eax
c010246d:	83 e2 03             	and    $0x3,%edx
c0102470:	89 d1                	mov    %edx,%ecx
c0102472:	c1 e1 05             	shl    $0x5,%ecx
c0102475:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102479:	83 e2 9f             	and    $0xffffff9f,%edx
c010247c:	09 ca                	or     %ecx,%edx
c010247e:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102481:	8b 45 08             	mov    0x8(%ebp),%eax
c0102484:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102488:	83 ca 80             	or     $0xffffff80,%edx
c010248b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c010248e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102491:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102495:	83 ca 0f             	or     $0xf,%edx
c0102498:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c010249b:	8b 45 08             	mov    0x8(%ebp),%eax
c010249e:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024a2:	83 e2 ef             	and    $0xffffffef,%edx
c01024a5:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c01024a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ab:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024af:	83 e2 df             	and    $0xffffffdf,%edx
c01024b2:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c01024b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01024b8:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024bc:	83 ca 40             	or     $0x40,%edx
c01024bf:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c01024c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01024c5:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024c9:	83 ca 80             	or     $0xffffff80,%edx
c01024cc:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c01024cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01024d2:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c01024d6:	5d                   	pop    %ebp
c01024d7:	c3                   	ret    

c01024d8 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c01024d8:	55                   	push   %ebp
c01024d9:	89 e5                	mov    %esp,%ebp
c01024db:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c01024de:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c01024e5:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c01024e8:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c01024ef:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c01024f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01024f9:	89 c2                	mov    %eax,%edx
c01024fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01024fe:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c0102501:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102504:	89 c2                	mov    %eax,%edx
c0102506:	8b 45 08             	mov    0x8(%ebp),%eax
c0102509:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c010250d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102510:	c1 e8 10             	shr    $0x10,%eax
c0102513:	89 c2                	mov    %eax,%edx
c0102515:	8b 45 08             	mov    0x8(%ebp),%eax
c0102518:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c010251b:	8b 45 08             	mov    0x8(%ebp),%eax
c010251e:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102522:	83 e2 f0             	and    $0xfffffff0,%edx
c0102525:	83 ca 09             	or     $0x9,%edx
c0102528:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c010252b:	8b 45 08             	mov    0x8(%ebp),%eax
c010252e:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102532:	83 e2 ef             	and    $0xffffffef,%edx
c0102535:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c0102538:	8b 45 08             	mov    0x8(%ebp),%eax
c010253b:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010253f:	83 ca 60             	or     $0x60,%edx
c0102542:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102545:	8b 45 08             	mov    0x8(%ebp),%eax
c0102548:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010254c:	83 ca 80             	or     $0xffffff80,%edx
c010254f:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102552:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102555:	c1 e8 10             	shr    $0x10,%eax
c0102558:	83 e0 0f             	and    $0xf,%eax
c010255b:	89 c2                	mov    %eax,%edx
c010255d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102560:	89 d1                	mov    %edx,%ecx
c0102562:	83 e1 0f             	and    $0xf,%ecx
c0102565:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102569:	83 e2 f0             	and    $0xfffffff0,%edx
c010256c:	09 ca                	or     %ecx,%edx
c010256e:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102571:	8b 45 08             	mov    0x8(%ebp),%eax
c0102574:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102578:	83 e2 ef             	and    $0xffffffef,%edx
c010257b:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c010257e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102581:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102585:	83 e2 df             	and    $0xffffffdf,%edx
c0102588:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c010258b:	8b 45 08             	mov    0x8(%ebp),%eax
c010258e:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102592:	83 ca 40             	or     $0x40,%edx
c0102595:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c0102598:	8b 45 08             	mov    0x8(%ebp),%eax
c010259b:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010259f:	83 e2 7f             	and    $0x7f,%edx
c01025a2:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c01025a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01025a8:	c1 e8 18             	shr    $0x18,%eax
c01025ab:	89 c2                	mov    %eax,%edx
c01025ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01025b0:	88 50 07             	mov    %dl,0x7(%eax)
}
c01025b3:	c9                   	leave  
c01025b4:	c3                   	ret    

c01025b5 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c01025b5:	55                   	push   %ebp
c01025b6:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c01025b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025bb:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c01025c0:	5d                   	pop    %ebp
c01025c1:	c3                   	ret    

c01025c2 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c01025c2:	55                   	push   %ebp
c01025c3:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c01025c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025c8:	83 e8 01             	sub    $0x1,%eax
c01025cb:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c01025d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01025d4:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c01025da:	8b 45 08             	mov    0x8(%ebp),%eax
c01025dd:	c1 e8 10             	shr    $0x10,%eax
c01025e0:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c01025e6:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c01025eb:	0f 01 10             	lgdtl  (%eax)
}
c01025ee:	5d                   	pop    %ebp
c01025ef:	c3                   	ret    

c01025f0 <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c01025f0:	55                   	push   %ebp
c01025f1:	89 e5                	mov    %esp,%ebp
c01025f3:	83 ec 04             	sub    $0x4,%esp
c01025f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01025f9:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c01025fd:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102601:	0f 00 d8             	ltr    %ax
}
c0102604:	c9                   	leave  
c0102605:	c3                   	ret    

c0102606 <init_segment>:

void
init_segment(void) {
c0102606:	55                   	push   %ebp
c0102607:	89 e5                	mov    %esp,%ebp
c0102609:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c010260c:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c0102613:	00 
c0102614:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010261b:	00 
c010261c:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102623:	e8 b1 05 00 00       	call   c0102bd9 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c0102628:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010262f:	00 
c0102630:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102637:	00 
c0102638:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c010263f:	e8 da fd ff ff       	call   c010241e <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0102644:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c010264b:	00 
c010264c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102653:	00 
c0102654:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c010265b:	e8 be fd ff ff       	call   c010241e <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0102660:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102667:	00 
c0102668:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c010266f:	00 
c0102670:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c0102677:	e8 a2 fd ff ff       	call   c010241e <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c010267c:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102683:	00 
c0102684:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c010268b:	00 
c010268c:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c0102693:	e8 86 fd ff ff       	call   c010241e <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0102698:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c010269f:	00 
c01026a0:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c01026a7:	e8 16 ff ff ff       	call   c01025c2 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c01026ac:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c01026b3:	e8 20 fe ff ff       	call   c01024d8 <set_tss>
	load_tr(USEL(SEG_TSS));
c01026b8:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c01026bf:	e8 2c ff ff ff       	call   c01025f0 <load_tr>
}
c01026c4:	c9                   	leave  
c01026c5:	c3                   	ret    

c01026c6 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c01026c6:	55                   	push   %ebp
c01026c7:	89 e5                	mov    %esp,%ebp
c01026c9:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c01026cc:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c01026d1:	85 c0                	test   %eax,%eax
c01026d3:	74 01                	je     c01026d6 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c01026d5:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c01026d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01026d9:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c01026de:	fa                   	cli    
c01026df:	fc                   	cld    

	va_start(ap, fmt);
c01026e0:	8d 45 14             	lea    0x14(%ebp),%eax
c01026e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c01026e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026e9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01026ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01026f0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026f4:	c7 04 24 90 3d 10 c0 	movl   $0xc0103d90,(%esp)
c01026fb:	e8 f5 00 00 00       	call   c01027f5 <printk>
	vprintk(fmt, ap);
c0102700:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102703:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102707:	8b 45 10             	mov    0x10(%ebp),%eax
c010270a:	89 04 24             	mov    %eax,(%esp)
c010270d:	e8 b0 00 00 00       	call   c01027c2 <vprintk>
	printk("\n");
c0102712:	c7 04 24 a8 3d 10 c0 	movl   $0xc0103da8,(%esp)
c0102719:	e8 d7 00 00 00       	call   c01027f5 <printk>
	va_end(ap);

}
c010271e:	c9                   	leave  
c010271f:	c3                   	ret    

c0102720 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c0102720:	55                   	push   %ebp
c0102721:	89 e5                	mov    %esp,%ebp
c0102723:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102726:	8d 45 14             	lea    0x14(%ebp),%eax
c0102729:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c010272c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010272f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102733:	8b 45 08             	mov    0x8(%ebp),%eax
c0102736:	89 44 24 04          	mov    %eax,0x4(%esp)
c010273a:	c7 04 24 aa 3d 10 c0 	movl   $0xc0103daa,(%esp)
c0102741:	e8 af 00 00 00       	call   c01027f5 <printk>
	vprintk(fmt, ap);
c0102746:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102749:	89 44 24 04          	mov    %eax,0x4(%esp)
c010274d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102750:	89 04 24             	mov    %eax,(%esp)
c0102753:	e8 6a 00 00 00       	call   c01027c2 <vprintk>
	printk("\n");
c0102758:	c7 04 24 a8 3d 10 c0 	movl   $0xc0103da8,(%esp)
c010275f:	e8 91 00 00 00       	call   c01027f5 <printk>
	va_end(ap);
}
c0102764:	c9                   	leave  
c0102765:	c3                   	ret    

c0102766 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0102766:	55                   	push   %ebp
c0102767:	89 e5                	mov    %esp,%ebp
c0102769:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c010276c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102770:	75 2b                	jne    c010279d <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0102772:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102779:	eb 1a                	jmp    c0102795 <sys_write+0x2f>
			serial_printc(buf[i]);
c010277b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010277e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102781:	01 d0                	add    %edx,%eax
c0102783:	0f b6 00             	movzbl (%eax),%eax
c0102786:	0f be c0             	movsbl %al,%eax
c0102789:	89 04 24             	mov    %eax,(%esp)
c010278c:	e8 15 e3 ff ff       	call   c0100aa6 <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0102791:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102795:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102798:	3b 45 10             	cmp    0x10(%ebp),%eax
c010279b:	7c de                	jl     c010277b <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c010279d:	8b 45 10             	mov    0x10(%ebp),%eax
c01027a0:	c9                   	leave  
c01027a1:	c3                   	ret    

c01027a2 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c01027a2:	55                   	push   %ebp
c01027a3:	89 e5                	mov    %esp,%ebp
c01027a5:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c01027a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01027ab:	89 04 24             	mov    %eax,(%esp)
c01027ae:	e8 1d e3 ff ff       	call   c0100ad0 <putchar>
	++*cnt;
c01027b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027b6:	8b 00                	mov    (%eax),%eax
c01027b8:	8d 50 01             	lea    0x1(%eax),%edx
c01027bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027be:	89 10                	mov    %edx,(%eax)
}
c01027c0:	c9                   	leave  
c01027c1:	c3                   	ret    

c01027c2 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c01027c2:	55                   	push   %ebp
c01027c3:	89 e5                	mov    %esp,%ebp
c01027c5:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c01027c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c01027cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027d2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01027d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01027d9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01027dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
c01027e0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027e4:	c7 04 24 a2 27 10 c0 	movl   $0xc01027a2,(%esp)
c01027eb:	e8 f1 09 00 00       	call   c01031e1 <vprintfmt>
	return cnt;
c01027f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01027f3:	c9                   	leave  
c01027f4:	c3                   	ret    

c01027f5 <printk>:

int printk(const char *fmt, ...)
{
c01027f5:	55                   	push   %ebp
c01027f6:	89 e5                	mov    %esp,%ebp
c01027f8:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c01027fb:	8d 45 0c             	lea    0xc(%ebp),%eax
c01027fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c0102801:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102804:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102808:	8b 45 08             	mov    0x8(%ebp),%eax
c010280b:	89 04 24             	mov    %eax,(%esp)
c010280e:	e8 af ff ff ff       	call   c01027c2 <vprintk>
c0102813:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102816:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102819:	c9                   	leave  
c010281a:	c3                   	ret    

c010281b <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c010281b:	6a 00                	push   $0x0
c010281d:	6a 00                	push   $0x0
c010281f:	e9 a9 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102824 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102824:	6a 00                	push   $0x0
c0102826:	6a 01                	push   $0x1
c0102828:	e9 a0 00 00 00       	jmp    c01028cd <asm_do_irq>

c010282d <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c010282d:	6a 00                	push   $0x0
c010282f:	6a 02                	push   $0x2
c0102831:	e9 97 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102836 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102836:	6a 00                	push   $0x0
c0102838:	6a 03                	push   $0x3
c010283a:	e9 8e 00 00 00       	jmp    c01028cd <asm_do_irq>

c010283f <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c010283f:	6a 00                	push   $0x0
c0102841:	6a 04                	push   $0x4
c0102843:	e9 85 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102848 <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102848:	6a 00                	push   $0x0
c010284a:	6a 05                	push   $0x5
c010284c:	e9 7c 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102851 <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0102851:	6a 00                	push   $0x0
c0102853:	6a 06                	push   $0x6
c0102855:	e9 73 00 00 00       	jmp    c01028cd <asm_do_irq>

c010285a <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c010285a:	6a 00                	push   $0x0
c010285c:	6a 07                	push   $0x7
c010285e:	e9 6a 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102863 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0102863:	6a 08                	push   $0x8
c0102865:	e9 63 00 00 00       	jmp    c01028cd <asm_do_irq>

c010286a <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c010286a:	6a 00                	push   $0x0
c010286c:	6a 09                	push   $0x9
c010286e:	e9 5a 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102873 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0102873:	6a 0a                	push   $0xa
c0102875:	e9 53 00 00 00       	jmp    c01028cd <asm_do_irq>

c010287a <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c010287a:	6a 0b                	push   $0xb
c010287c:	e9 4c 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102881 <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0102881:	6a 0c                	push   $0xc
c0102883:	e9 45 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102888 <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c0102888:	6a 0d                	push   $0xd
c010288a:	e9 3e 00 00 00       	jmp    c01028cd <asm_do_irq>

c010288f <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c010288f:	6a 0e                	push   $0xe
c0102891:	e9 37 00 00 00       	jmp    c01028cd <asm_do_irq>

c0102896 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c0102896:	6a 00                	push   $0x0
c0102898:	68 80 00 00 00       	push   $0x80
c010289d:	e9 2b 00 00 00       	jmp    c01028cd <asm_do_irq>

c01028a2 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c01028a2:	6a 00                	push   $0x0
c01028a4:	68 e8 03 00 00       	push   $0x3e8
c01028a9:	e9 1f 00 00 00       	jmp    c01028cd <asm_do_irq>

c01028ae <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c01028ae:	6a 00                	push   $0x0
c01028b0:	68 e9 03 00 00       	push   $0x3e9
c01028b5:	e9 13 00 00 00       	jmp    c01028cd <asm_do_irq>

c01028ba <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c01028ba:	6a 00                	push   $0x0
c01028bc:	68 f6 03 00 00       	push   $0x3f6
c01028c1:	e9 07 00 00 00       	jmp    c01028cd <asm_do_irq>

c01028c6 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c01028c6:	6a ff                	push   $0xffffffff
c01028c8:	e9 00 00 00 00       	jmp    c01028cd <asm_do_irq>

c01028cd <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c01028cd:	fa                   	cli    
	pushl %ds
c01028ce:	1e                   	push   %ds
  	pushl %es
c01028cf:	06                   	push   %es
  	pushl %fs
c01028d0:	0f a0                	push   %fs
  	pushl %gs
c01028d2:	0f a8                	push   %gs
	pushal
c01028d4:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c01028d5:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c01028d9:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c01028db:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c01028dd:	54                   	push   %esp
	call irq_handle
c01028de:	e8 33 de ff ff       	call   c0100716 <irq_handle>
	movl pcbnow,%eax
c01028e3:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c01028e8:	8b 20                	mov    (%eax),%esp
	#addl $4, %esp

	popal
c01028ea:	61                   	popa   
	popl %gs
c01028eb:	0f a9                	pop    %gs
  	popl %fs
c01028ed:	0f a1                	pop    %fs
  	popl %es
c01028ef:	07                   	pop    %es
  	popl %ds
c01028f0:	1f                   	pop    %ds
	addl $8, %esp
c01028f1:	83 c4 08             	add    $0x8,%esp
	sti
c01028f4:	fb                   	sti    
	iret
c01028f5:	cf                   	iret   
c01028f6:	66 90                	xchg   %ax,%ax
c01028f8:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c01028fe:	00 00                	add    %al,(%eax)
c0102900:	fe 4f 52             	decb   0x52(%edi)
c0102903:	e4 66                	in     $0x66,%al

c0102904 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102904:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c010290b:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c010290d:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c0102912:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102915:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102918:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c010291d:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0102920:	b8 27 29 10 c0       	mov    $0xc0102927,%eax
	jmp	*%eax
c0102925:	ff e0                	jmp    *%eax

c0102927 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102927:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c010292c:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c0102931:	e8 09 d8 ff ff       	call   c010013f <main>

c0102936 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102936:	eb fe                	jmp    c0102936 <spin>

c0102938 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102938:	55                   	push   %ebp
c0102939:	89 e5                	mov    %esp,%ebp
c010293b:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c010293e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102942:	78 18                	js     c010295c <draw_pixel+0x24>
c0102944:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102948:	78 12                	js     c010295c <draw_pixel+0x24>
c010294a:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102951:	7f 09                	jg     c010295c <draw_pixel+0x24>
c0102953:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c010295a:	7e 24                	jle    c0102980 <draw_pixel+0x48>
c010295c:	c7 44 24 0c c4 3d 10 	movl   $0xc0103dc4,0xc(%esp)
c0102963:	c0 
c0102964:	c7 44 24 08 f8 3d 10 	movl   $0xc0103df8,0x8(%esp)
c010296b:	c0 
c010296c:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
c0102973:	00 
c0102974:	c7 04 24 0d 3e 10 c0 	movl   $0xc0103e0d,(%esp)
c010297b:	e8 46 fd ff ff       	call   c01026c6 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0102980:	8b 45 08             	mov    0x8(%ebp),%eax
c0102983:	c1 e0 08             	shl    $0x8,%eax
c0102986:	89 c2                	mov    %eax,%edx
c0102988:	8b 45 08             	mov    0x8(%ebp),%eax
c010298b:	c1 e0 06             	shl    $0x6,%eax
c010298e:	01 c2                	add    %eax,%edx
c0102990:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102993:	01 c2                	add    %eax,%edx
c0102995:	8b 45 10             	mov    0x10(%ebp),%eax
c0102998:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c010299e:	c9                   	leave  
c010299f:	c3                   	ret    

c01029a0 <sysclean>:


void sysclean(void)
{
c01029a0:	55                   	push   %ebp
c01029a1:	89 e5                	mov    %esp,%ebp
c01029a3:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c01029a6:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01029ad:	00 
c01029ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01029b5:	00 
c01029b6:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c01029bd:	e8 17 02 00 00       	call   c0102bd9 <memset>
}
c01029c2:	c9                   	leave  
c01029c3:	c3                   	ret    

c01029c4 <syspr>:
int syspr()
{
c01029c4:	55                   	push   %ebp
c01029c5:	89 e5                	mov    %esp,%ebp
c01029c7:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c01029ca:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c01029d1:	c0 
c01029d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01029d9:	e8 b1 00 00 00       	call   c0102a8f <syscall>
}
c01029de:	c9                   	leave  
c01029df:	c3                   	ret    

c01029e0 <systime>:

int systime(void)
{
c01029e0:	55                   	push   %ebp
c01029e1:	89 e5                	mov    %esp,%ebp
c01029e3:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c01029e6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c01029ed:	e8 9d 00 00 00       	call   c0102a8f <syscall>
}
c01029f2:	c9                   	leave  
c01029f3:	c3                   	ret    

c01029f4 <sysreadkey>:

int sysreadkey(void)
{
c01029f4:	55                   	push   %ebp
c01029f5:	89 e5                	mov    %esp,%ebp
c01029f7:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c01029fa:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0102a01:	e8 89 00 00 00       	call   c0102a8f <syscall>
}
c0102a06:	c9                   	leave  
c0102a07:	c3                   	ret    

c0102a08 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0102a08:	55                   	push   %ebp
c0102a09:	89 e5                	mov    %esp,%ebp
c0102a0b:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c0102a0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102a11:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102a15:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a18:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a23:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0102a2a:	e8 60 00 00 00       	call   c0102a8f <syscall>
}
c0102a2f:	c9                   	leave  
c0102a30:	c3                   	ret    

c0102a31 <fork>:

int fork(void)
{
c0102a31:	55                   	push   %ebp
c0102a32:	89 e5                	mov    %esp,%ebp
c0102a34:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c0102a37:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0102a3e:	e8 4c 00 00 00       	call   c0102a8f <syscall>
}
c0102a43:	c9                   	leave  
c0102a44:	c3                   	ret    

c0102a45 <getpid>:

int getpid(void)
{
c0102a45:	55                   	push   %ebp
c0102a46:	89 e5                	mov    %esp,%ebp
c0102a48:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c0102a4b:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0102a52:	e8 38 00 00 00       	call   c0102a8f <syscall>
}
c0102a57:	c9                   	leave  
c0102a58:	c3                   	ret    

c0102a59 <exit>:

void exit(int suc)
{
c0102a59:	55                   	push   %ebp
c0102a5a:	89 e5                	mov    %esp,%ebp
c0102a5c:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
c0102a5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a62:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a66:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c0102a6d:	e8 1d 00 00 00       	call   c0102a8f <syscall>
}
c0102a72:	c9                   	leave  
c0102a73:	c3                   	ret    

c0102a74 <sleep>:

void sleep(int sec)
{
c0102a74:	55                   	push   %ebp
c0102a75:	89 e5                	mov    %esp,%ebp
c0102a77:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c0102a7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a7d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a81:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0102a88:	e8 02 00 00 00       	call   c0102a8f <syscall>
	//printf("qweqwe");
}
c0102a8d:	c9                   	leave  
c0102a8e:	c3                   	ret    

c0102a8f <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c0102a8f:	55                   	push   %ebp
c0102a90:	89 e5                	mov    %esp,%ebp
c0102a92:	53                   	push   %ebx
c0102a93:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0102a96:	8d 45 08             	lea    0x8(%ebp),%eax
c0102a99:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c0102a9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102a9f:	8b 00                	mov    (%eax),%eax
c0102aa1:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102aa4:	83 c2 04             	add    $0x4,%edx
c0102aa7:	8b 1a                	mov    (%edx),%ebx
c0102aa9:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102aac:	83 c2 08             	add    $0x8,%edx
c0102aaf:	8b 0a                	mov    (%edx),%ecx
c0102ab1:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102ab4:	83 c2 0c             	add    $0xc,%edx
c0102ab7:	8b 12                	mov    (%edx),%edx
c0102ab9:	cd 80                	int    $0x80
c0102abb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c0102abe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102ac1:	83 c4 10             	add    $0x10,%esp
c0102ac4:	5b                   	pop    %ebx
c0102ac5:	5d                   	pop    %ebp
c0102ac6:	c3                   	ret    

c0102ac7 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0102ac7:	55                   	push   %ebp
c0102ac8:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0102aca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102acd:	8b 00                	mov    (%eax),%eax
c0102acf:	8d 48 01             	lea    0x1(%eax),%ecx
c0102ad2:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102ad5:	89 0a                	mov    %ecx,(%edx)
c0102ad7:	8b 55 08             	mov    0x8(%ebp),%edx
c0102ada:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c0102ae0:	5d                   	pop    %ebp
c0102ae1:	c3                   	ret    

c0102ae2 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0102ae2:	55                   	push   %ebp
c0102ae3:	89 e5                	mov    %esp,%ebp
c0102ae5:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102ae8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0102aef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102af2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102af6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102af9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102afd:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102b00:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b04:	c7 04 24 c7 2a 10 c0 	movl   $0xc0102ac7,(%esp)
c0102b0b:	e8 d1 06 00 00       	call   c01031e1 <vprintfmt>
	return cnt;
c0102b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102b13:	c9                   	leave  
c0102b14:	c3                   	ret    

c0102b15 <printf>:
int printf(const char *fmt, ...)
{
c0102b15:	55                   	push   %ebp
c0102b16:	89 e5                	mov    %esp,%ebp
c0102b18:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0102b1b:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102b1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c0102b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b24:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b28:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b2b:	89 04 24             	mov    %eax,(%esp)
c0102b2e:	e8 af ff ff ff       	call   c0102ae2 <vprintf>
c0102b33:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c0102b36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b39:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102b3d:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c0102b44:	c0 
c0102b45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102b4c:	e8 b7 fe ff ff       	call   c0102a08 <syswrite>
	return cnt;
c0102b51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b54:	c9                   	leave  
c0102b55:	c3                   	ret    

c0102b56 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c0102b56:	55                   	push   %ebp
c0102b57:	89 e5                	mov    %esp,%ebp
c0102b59:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0102b5c:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c0102b63:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102b67:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102b6a:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102b6f:	89 c8                	mov    %ecx,%eax
c0102b71:	f7 ea                	imul   %edx
c0102b73:	c1 fa 02             	sar    $0x2,%edx
c0102b76:	89 c8                	mov    %ecx,%eax
c0102b78:	c1 f8 1f             	sar    $0x1f,%eax
c0102b7b:	29 c2                	sub    %eax,%edx
c0102b7d:	89 d0                	mov    %edx,%eax
c0102b7f:	c1 e0 02             	shl    $0x2,%eax
c0102b82:	01 d0                	add    %edx,%eax
c0102b84:	01 c0                	add    %eax,%eax
c0102b86:	29 c1                	sub    %eax,%ecx
c0102b88:	89 ca                	mov    %ecx,%edx
c0102b8a:	89 d0                	mov    %edx,%eax
c0102b8c:	83 c0 30             	add    $0x30,%eax
c0102b8f:	89 c2                	mov    %eax,%edx
c0102b91:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102b94:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0102b96:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102b99:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102b9e:	89 c8                	mov    %ecx,%eax
c0102ba0:	f7 ea                	imul   %edx
c0102ba2:	c1 fa 02             	sar    $0x2,%edx
c0102ba5:	89 c8                	mov    %ecx,%eax
c0102ba7:	c1 f8 1f             	sar    $0x1f,%eax
c0102baa:	29 c2                	sub    %eax,%edx
c0102bac:	89 d0                	mov    %edx,%eax
c0102bae:	89 45 08             	mov    %eax,0x8(%ebp)
c0102bb1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102bb5:	75 ac                	jne    c0102b63 <itoa+0xd>
	return p;
c0102bb7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102bba:	c9                   	leave  
c0102bbb:	c3                   	ret    

c0102bbc <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c0102bbc:	55                   	push   %ebp
c0102bbd:	89 e5                	mov    %esp,%ebp
c0102bbf:	57                   	push   %edi
c0102bc0:	56                   	push   %esi
c0102bc1:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0102bc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0102bc5:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102bc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102bcb:	89 c1                	mov    %eax,%ecx
c0102bcd:	89 d6                	mov    %edx,%esi
c0102bcf:	89 df                	mov    %ebx,%edi
c0102bd1:	fc                   	cld    
c0102bd2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0102bd4:	5b                   	pop    %ebx
c0102bd5:	5e                   	pop    %esi
c0102bd6:	5f                   	pop    %edi
c0102bd7:	5d                   	pop    %ebp
c0102bd8:	c3                   	ret    

c0102bd9 <memset>:

void memset(void *dest, int data, size_t size) {
c0102bd9:	55                   	push   %ebp
c0102bda:	89 e5                	mov    %esp,%ebp
c0102bdc:	57                   	push   %edi
c0102bdd:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0102bde:	8b 55 10             	mov    0x10(%ebp),%edx
c0102be1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102be4:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102be7:	89 d1                	mov    %edx,%ecx
c0102be9:	89 df                	mov    %ebx,%edi
c0102beb:	fc                   	cld    
c0102bec:	f3 aa                	rep stos %al,%es:(%edi)
}
c0102bee:	5b                   	pop    %ebx
c0102bef:	5f                   	pop    %edi
c0102bf0:	5d                   	pop    %ebp
c0102bf1:	c3                   	ret    

c0102bf2 <strlen>:

size_t strlen(const char *str) {
c0102bf2:	55                   	push   %ebp
c0102bf3:	89 e5                	mov    %esp,%ebp
c0102bf5:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0102bf8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0102bff:	eb 04                	jmp    c0102c05 <strlen+0x13>
c0102c01:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102c05:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c08:	8d 50 01             	lea    0x1(%eax),%edx
c0102c0b:	89 55 08             	mov    %edx,0x8(%ebp)
c0102c0e:	0f b6 00             	movzbl (%eax),%eax
c0102c11:	84 c0                	test   %al,%al
c0102c13:	75 ec                	jne    c0102c01 <strlen+0xf>
	return len;
c0102c15:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102c18:	c9                   	leave  
c0102c19:	c3                   	ret    

c0102c1a <strcpy>:

void strcpy(char *d, const char *s) {
c0102c1a:	55                   	push   %ebp
c0102c1b:	89 e5                	mov    %esp,%ebp
c0102c1d:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c0102c20:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c23:	89 04 24             	mov    %eax,(%esp)
c0102c26:	e8 c7 ff ff ff       	call   c0102bf2 <strlen>
c0102c2b:	83 c0 01             	add    $0x1,%eax
c0102c2e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c32:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c35:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c39:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c3c:	89 04 24             	mov    %eax,(%esp)
c0102c3f:	e8 78 ff ff ff       	call   c0102bbc <memcpy>
}
c0102c44:	c9                   	leave  
c0102c45:	c3                   	ret    

c0102c46 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c0102c46:	55                   	push   %ebp
c0102c47:	89 e5                	mov    %esp,%ebp
c0102c49:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102c4c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102c53:	eb 0c                	jmp    c0102c61 <strnlen+0x1b>
		n++;
c0102c55:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102c59:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102c5d:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102c61:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102c65:	74 0a                	je     c0102c71 <strnlen+0x2b>
c0102c67:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c6a:	0f b6 00             	movzbl (%eax),%eax
c0102c6d:	84 c0                	test   %al,%al
c0102c6f:	75 e4                	jne    c0102c55 <strnlen+0xf>
		n++;
	return n;
c0102c71:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102c74:	c9                   	leave  
c0102c75:	c3                   	ret    

c0102c76 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0102c76:	55                   	push   %ebp
c0102c77:	89 e5                	mov    %esp,%ebp
c0102c79:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c0102c7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0102c82:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102c89:	eb 23                	jmp    c0102cae <strncpy+0x38>
		*dst++ = *src;
c0102c8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c8e:	8d 50 01             	lea    0x1(%eax),%edx
c0102c91:	89 55 08             	mov    %edx,0x8(%ebp)
c0102c94:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102c97:	0f b6 12             	movzbl (%edx),%edx
c0102c9a:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c0102c9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c9f:	0f b6 00             	movzbl (%eax),%eax
c0102ca2:	84 c0                	test   %al,%al
c0102ca4:	74 04                	je     c0102caa <strncpy+0x34>
			src++;
c0102ca6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c0102caa:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102cae:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102cb1:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102cb4:	72 d5                	jb     c0102c8b <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c0102cb6:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0102cb9:	c9                   	leave  
c0102cba:	c3                   	ret    

c0102cbb <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c0102cbb:	55                   	push   %ebp
c0102cbc:	89 e5                	mov    %esp,%ebp
c0102cbe:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c0102cc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cc4:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0102cc7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102ccb:	74 33                	je     c0102d00 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c0102ccd:	eb 17                	jmp    c0102ce6 <strlcpy+0x2b>
			*dst++ = *src++;
c0102ccf:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cd2:	8d 50 01             	lea    0x1(%eax),%edx
c0102cd5:	89 55 08             	mov    %edx,0x8(%ebp)
c0102cd8:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102cdb:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102cde:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c0102ce1:	0f b6 12             	movzbl (%edx),%edx
c0102ce4:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0102ce6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102cea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102cee:	74 0a                	je     c0102cfa <strlcpy+0x3f>
c0102cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cf3:	0f b6 00             	movzbl (%eax),%eax
c0102cf6:	84 c0                	test   %al,%al
c0102cf8:	75 d5                	jne    c0102ccf <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0102cfa:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cfd:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c0102d00:	8b 55 08             	mov    0x8(%ebp),%edx
c0102d03:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102d06:	29 c2                	sub    %eax,%edx
c0102d08:	89 d0                	mov    %edx,%eax
}
c0102d0a:	c9                   	leave  
c0102d0b:	c3                   	ret    

c0102d0c <strcmp>:

int
strcmp(const char *p, const char *q)
{
c0102d0c:	55                   	push   %ebp
c0102d0d:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c0102d0f:	eb 08                	jmp    c0102d19 <strcmp+0xd>
		p++, q++;
c0102d11:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102d15:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0102d19:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d1c:	0f b6 00             	movzbl (%eax),%eax
c0102d1f:	84 c0                	test   %al,%al
c0102d21:	74 10                	je     c0102d33 <strcmp+0x27>
c0102d23:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d26:	0f b6 10             	movzbl (%eax),%edx
c0102d29:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d2c:	0f b6 00             	movzbl (%eax),%eax
c0102d2f:	38 c2                	cmp    %al,%dl
c0102d31:	74 de                	je     c0102d11 <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c0102d33:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d36:	0f b6 00             	movzbl (%eax),%eax
c0102d39:	0f b6 d0             	movzbl %al,%edx
c0102d3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d3f:	0f b6 00             	movzbl (%eax),%eax
c0102d42:	0f b6 c0             	movzbl %al,%eax
c0102d45:	29 c2                	sub    %eax,%edx
c0102d47:	89 d0                	mov    %edx,%eax
}
c0102d49:	5d                   	pop    %ebp
c0102d4a:	c3                   	ret    

c0102d4b <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0102d4b:	55                   	push   %ebp
c0102d4c:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c0102d4e:	eb 0c                	jmp    c0102d5c <strncmp+0x11>
		n--, p++, q++;
c0102d50:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102d54:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102d58:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c0102d5c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102d60:	74 1a                	je     c0102d7c <strncmp+0x31>
c0102d62:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d65:	0f b6 00             	movzbl (%eax),%eax
c0102d68:	84 c0                	test   %al,%al
c0102d6a:	74 10                	je     c0102d7c <strncmp+0x31>
c0102d6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d6f:	0f b6 10             	movzbl (%eax),%edx
c0102d72:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d75:	0f b6 00             	movzbl (%eax),%eax
c0102d78:	38 c2                	cmp    %al,%dl
c0102d7a:	74 d4                	je     c0102d50 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c0102d7c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102d80:	75 07                	jne    c0102d89 <strncmp+0x3e>
		return 0;
c0102d82:	b8 00 00 00 00       	mov    $0x0,%eax
c0102d87:	eb 16                	jmp    c0102d9f <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c0102d89:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d8c:	0f b6 00             	movzbl (%eax),%eax
c0102d8f:	0f b6 d0             	movzbl %al,%edx
c0102d92:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d95:	0f b6 00             	movzbl (%eax),%eax
c0102d98:	0f b6 c0             	movzbl %al,%eax
c0102d9b:	29 c2                	sub    %eax,%edx
c0102d9d:	89 d0                	mov    %edx,%eax
}
c0102d9f:	5d                   	pop    %ebp
c0102da0:	c3                   	ret    

c0102da1 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c0102da1:	55                   	push   %ebp
c0102da2:	89 e5                	mov    %esp,%ebp
c0102da4:	83 ec 04             	sub    $0x4,%esp
c0102da7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102daa:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102dad:	eb 14                	jmp    c0102dc3 <strchr+0x22>
		if (*s == c)
c0102daf:	8b 45 08             	mov    0x8(%ebp),%eax
c0102db2:	0f b6 00             	movzbl (%eax),%eax
c0102db5:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102db8:	75 05                	jne    c0102dbf <strchr+0x1e>
			return (char *) s;
c0102dba:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dbd:	eb 13                	jmp    c0102dd2 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c0102dbf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102dc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dc6:	0f b6 00             	movzbl (%eax),%eax
c0102dc9:	84 c0                	test   %al,%al
c0102dcb:	75 e2                	jne    c0102daf <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c0102dcd:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102dd2:	c9                   	leave  
c0102dd3:	c3                   	ret    

c0102dd4 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c0102dd4:	55                   	push   %ebp
c0102dd5:	89 e5                	mov    %esp,%ebp
c0102dd7:	83 ec 04             	sub    $0x4,%esp
c0102dda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ddd:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102de0:	eb 11                	jmp    c0102df3 <strfind+0x1f>
		if (*s == c)
c0102de2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102de5:	0f b6 00             	movzbl (%eax),%eax
c0102de8:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102deb:	75 02                	jne    c0102def <strfind+0x1b>
			break;
c0102ded:	eb 0e                	jmp    c0102dfd <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0102def:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102df3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102df6:	0f b6 00             	movzbl (%eax),%eax
c0102df9:	84 c0                	test   %al,%al
c0102dfb:	75 e5                	jne    c0102de2 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c0102dfd:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102e00:	c9                   	leave  
c0102e01:	c3                   	ret    

c0102e02 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c0102e02:	55                   	push   %ebp
c0102e03:	89 e5                	mov    %esp,%ebp
c0102e05:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0102e08:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c0102e0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e11:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c0102e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102e17:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102e1a:	73 3d                	jae    c0102e59 <memmove+0x57>
c0102e1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e1f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102e22:	01 d0                	add    %edx,%eax
c0102e24:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102e27:	76 30                	jbe    c0102e59 <memmove+0x57>
		s += n;
c0102e29:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e2c:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c0102e2f:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e32:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c0102e35:	eb 13                	jmp    c0102e4a <memmove+0x48>
			*--d = *--s;
c0102e37:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0102e3b:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102e3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102e42:	0f b6 10             	movzbl (%eax),%edx
c0102e45:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102e48:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0102e4a:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e4d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102e50:	89 55 10             	mov    %edx,0x10(%ebp)
c0102e53:	85 c0                	test   %eax,%eax
c0102e55:	75 e0                	jne    c0102e37 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0102e57:	eb 26                	jmp    c0102e7f <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102e59:	eb 17                	jmp    c0102e72 <memmove+0x70>
			*d++ = *s++;
c0102e5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102e5e:	8d 50 01             	lea    0x1(%eax),%edx
c0102e61:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0102e64:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102e67:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102e6a:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0102e6d:	0f b6 12             	movzbl (%edx),%edx
c0102e70:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102e72:	8b 45 10             	mov    0x10(%ebp),%eax
c0102e75:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102e78:	89 55 10             	mov    %edx,0x10(%ebp)
c0102e7b:	85 c0                	test   %eax,%eax
c0102e7d:	75 dc                	jne    c0102e5b <memmove+0x59>
			*d++ = *s++;

	return dst;
c0102e7f:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102e82:	c9                   	leave  
c0102e83:	c3                   	ret    

c0102e84 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0102e84:	55                   	push   %ebp
c0102e85:	89 e5                	mov    %esp,%ebp
c0102e87:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c0102e8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e8d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c0102e90:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e93:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0102e96:	eb 30                	jmp    c0102ec8 <memcmp+0x44>
		if (*s1 != *s2)
c0102e98:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102e9b:	0f b6 10             	movzbl (%eax),%edx
c0102e9e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102ea1:	0f b6 00             	movzbl (%eax),%eax
c0102ea4:	38 c2                	cmp    %al,%dl
c0102ea6:	74 18                	je     c0102ec0 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c0102ea8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102eab:	0f b6 00             	movzbl (%eax),%eax
c0102eae:	0f b6 d0             	movzbl %al,%edx
c0102eb1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102eb4:	0f b6 00             	movzbl (%eax),%eax
c0102eb7:	0f b6 c0             	movzbl %al,%eax
c0102eba:	29 c2                	sub    %eax,%edx
c0102ebc:	89 d0                	mov    %edx,%eax
c0102ebe:	eb 1a                	jmp    c0102eda <memcmp+0x56>
		s1++, s2++;
c0102ec0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102ec4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c0102ec8:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ecb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102ece:	89 55 10             	mov    %edx,0x10(%ebp)
c0102ed1:	85 c0                	test   %eax,%eax
c0102ed3:	75 c3                	jne    c0102e98 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c0102ed5:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102eda:	c9                   	leave  
c0102edb:	c3                   	ret    

c0102edc <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c0102edc:	55                   	push   %ebp
c0102edd:	89 e5                	mov    %esp,%ebp
c0102edf:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c0102ee2:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ee5:	8b 55 08             	mov    0x8(%ebp),%edx
c0102ee8:	01 d0                	add    %edx,%eax
c0102eea:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c0102eed:	eb 13                	jmp    c0102f02 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c0102eef:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ef2:	0f b6 10             	movzbl (%eax),%edx
c0102ef5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ef8:	38 c2                	cmp    %al,%dl
c0102efa:	75 02                	jne    c0102efe <memfind+0x22>
			break;
c0102efc:	eb 0c                	jmp    c0102f0a <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c0102efe:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f02:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f05:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0102f08:	72 e5                	jb     c0102eef <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0102f0a:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102f0d:	c9                   	leave  
c0102f0e:	c3                   	ret    

c0102f0f <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c0102f0f:	55                   	push   %ebp
c0102f10:	89 e5                	mov    %esp,%ebp
c0102f12:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c0102f15:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c0102f1c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102f23:	eb 04                	jmp    c0102f29 <strtol+0x1a>
		s++;
c0102f25:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102f29:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f2c:	0f b6 00             	movzbl (%eax),%eax
c0102f2f:	3c 20                	cmp    $0x20,%al
c0102f31:	74 f2                	je     c0102f25 <strtol+0x16>
c0102f33:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f36:	0f b6 00             	movzbl (%eax),%eax
c0102f39:	3c 09                	cmp    $0x9,%al
c0102f3b:	74 e8                	je     c0102f25 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c0102f3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f40:	0f b6 00             	movzbl (%eax),%eax
c0102f43:	3c 2b                	cmp    $0x2b,%al
c0102f45:	75 06                	jne    c0102f4d <strtol+0x3e>
		s++;
c0102f47:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f4b:	eb 15                	jmp    c0102f62 <strtol+0x53>
	else if (*s == '-')
c0102f4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f50:	0f b6 00             	movzbl (%eax),%eax
c0102f53:	3c 2d                	cmp    $0x2d,%al
c0102f55:	75 0b                	jne    c0102f62 <strtol+0x53>
		s++, neg = 1;
c0102f57:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f5b:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c0102f62:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102f66:	74 06                	je     c0102f6e <strtol+0x5f>
c0102f68:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0102f6c:	75 24                	jne    c0102f92 <strtol+0x83>
c0102f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f71:	0f b6 00             	movzbl (%eax),%eax
c0102f74:	3c 30                	cmp    $0x30,%al
c0102f76:	75 1a                	jne    c0102f92 <strtol+0x83>
c0102f78:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f7b:	83 c0 01             	add    $0x1,%eax
c0102f7e:	0f b6 00             	movzbl (%eax),%eax
c0102f81:	3c 78                	cmp    $0x78,%al
c0102f83:	75 0d                	jne    c0102f92 <strtol+0x83>
		s += 2, base = 16;
c0102f85:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c0102f89:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c0102f90:	eb 2a                	jmp    c0102fbc <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c0102f92:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102f96:	75 17                	jne    c0102faf <strtol+0xa0>
c0102f98:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f9b:	0f b6 00             	movzbl (%eax),%eax
c0102f9e:	3c 30                	cmp    $0x30,%al
c0102fa0:	75 0d                	jne    c0102faf <strtol+0xa0>
		s++, base = 8;
c0102fa2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102fa6:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c0102fad:	eb 0d                	jmp    c0102fbc <strtol+0xad>
	else if (base == 0)
c0102faf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102fb3:	75 07                	jne    c0102fbc <strtol+0xad>
		base = 10;
c0102fb5:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c0102fbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fbf:	0f b6 00             	movzbl (%eax),%eax
c0102fc2:	3c 2f                	cmp    $0x2f,%al
c0102fc4:	7e 1b                	jle    c0102fe1 <strtol+0xd2>
c0102fc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fc9:	0f b6 00             	movzbl (%eax),%eax
c0102fcc:	3c 39                	cmp    $0x39,%al
c0102fce:	7f 11                	jg     c0102fe1 <strtol+0xd2>
			dig = *s - '0';
c0102fd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fd3:	0f b6 00             	movzbl (%eax),%eax
c0102fd6:	0f be c0             	movsbl %al,%eax
c0102fd9:	83 e8 30             	sub    $0x30,%eax
c0102fdc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102fdf:	eb 48                	jmp    c0103029 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c0102fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fe4:	0f b6 00             	movzbl (%eax),%eax
c0102fe7:	3c 60                	cmp    $0x60,%al
c0102fe9:	7e 1b                	jle    c0103006 <strtol+0xf7>
c0102feb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fee:	0f b6 00             	movzbl (%eax),%eax
c0102ff1:	3c 7a                	cmp    $0x7a,%al
c0102ff3:	7f 11                	jg     c0103006 <strtol+0xf7>
			dig = *s - 'a' + 10;
c0102ff5:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ff8:	0f b6 00             	movzbl (%eax),%eax
c0102ffb:	0f be c0             	movsbl %al,%eax
c0102ffe:	83 e8 57             	sub    $0x57,%eax
c0103001:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103004:	eb 23                	jmp    c0103029 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c0103006:	8b 45 08             	mov    0x8(%ebp),%eax
c0103009:	0f b6 00             	movzbl (%eax),%eax
c010300c:	3c 40                	cmp    $0x40,%al
c010300e:	7e 3d                	jle    c010304d <strtol+0x13e>
c0103010:	8b 45 08             	mov    0x8(%ebp),%eax
c0103013:	0f b6 00             	movzbl (%eax),%eax
c0103016:	3c 5a                	cmp    $0x5a,%al
c0103018:	7f 33                	jg     c010304d <strtol+0x13e>
			dig = *s - 'A' + 10;
c010301a:	8b 45 08             	mov    0x8(%ebp),%eax
c010301d:	0f b6 00             	movzbl (%eax),%eax
c0103020:	0f be c0             	movsbl %al,%eax
c0103023:	83 e8 37             	sub    $0x37,%eax
c0103026:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c0103029:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010302c:	3b 45 10             	cmp    0x10(%ebp),%eax
c010302f:	7c 02                	jl     c0103033 <strtol+0x124>
			break;
c0103031:	eb 1a                	jmp    c010304d <strtol+0x13e>
		s++, val = (val * base) + dig;
c0103033:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103037:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010303a:	0f af 45 10          	imul   0x10(%ebp),%eax
c010303e:	89 c2                	mov    %eax,%edx
c0103040:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103043:	01 d0                	add    %edx,%eax
c0103045:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c0103048:	e9 6f ff ff ff       	jmp    c0102fbc <strtol+0xad>

	if (endptr)
c010304d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103051:	74 08                	je     c010305b <strtol+0x14c>
		*endptr = (char *) s;
c0103053:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103056:	8b 55 08             	mov    0x8(%ebp),%edx
c0103059:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c010305b:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010305f:	74 07                	je     c0103068 <strtol+0x159>
c0103061:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103064:	f7 d8                	neg    %eax
c0103066:	eb 03                	jmp    c010306b <strtol+0x15c>
c0103068:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c010306b:	c9                   	leave  
c010306c:	c3                   	ret    

c010306d <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c010306d:	55                   	push   %ebp
c010306e:	89 e5                	mov    %esp,%ebp
c0103070:	53                   	push   %ebx
c0103071:	83 ec 34             	sub    $0x34,%esp
c0103074:	8b 45 10             	mov    0x10(%ebp),%eax
c0103077:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010307a:	8b 45 14             	mov    0x14(%ebp),%eax
c010307d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c0103080:	8b 45 18             	mov    0x18(%ebp),%eax
c0103083:	ba 00 00 00 00       	mov    $0x0,%edx
c0103088:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c010308b:	77 72                	ja     c01030ff <printnum+0x92>
c010308d:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c0103090:	72 05                	jb     c0103097 <printnum+0x2a>
c0103092:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0103095:	77 68                	ja     c01030ff <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c0103097:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010309a:	8d 58 ff             	lea    -0x1(%eax),%ebx
c010309d:	8b 45 18             	mov    0x18(%ebp),%eax
c01030a0:	ba 00 00 00 00       	mov    $0x0,%edx
c01030a5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030a9:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01030ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01030b3:	89 04 24             	mov    %eax,(%esp)
c01030b6:	89 54 24 04          	mov    %edx,0x4(%esp)
c01030ba:	e8 51 06 00 00       	call   c0103710 <__udivdi3>
c01030bf:	8b 4d 20             	mov    0x20(%ebp),%ecx
c01030c2:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c01030c6:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c01030ca:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01030cd:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c01030d1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030d5:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01030d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030dc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01030e3:	89 04 24             	mov    %eax,(%esp)
c01030e6:	e8 82 ff ff ff       	call   c010306d <printnum>
c01030eb:	eb 1c                	jmp    c0103109 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c01030ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030f0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030f4:	8b 45 20             	mov    0x20(%ebp),%eax
c01030f7:	89 04 24             	mov    %eax,(%esp)
c01030fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01030fd:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c01030ff:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c0103103:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0103107:	7f e4                	jg     c01030ed <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c0103109:	8b 4d 18             	mov    0x18(%ebp),%ecx
c010310c:	bb 00 00 00 00       	mov    $0x0,%ebx
c0103111:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103114:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103117:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010311b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c010311f:	89 04 24             	mov    %eax,(%esp)
c0103122:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103126:	e8 15 07 00 00       	call   c0103840 <__umoddi3>
c010312b:	05 a8 3e 10 c0       	add    $0xc0103ea8,%eax
c0103130:	0f b6 00             	movzbl (%eax),%eax
c0103133:	0f be c0             	movsbl %al,%eax
c0103136:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103139:	89 54 24 04          	mov    %edx,0x4(%esp)
c010313d:	89 04 24             	mov    %eax,(%esp)
c0103140:	8b 45 08             	mov    0x8(%ebp),%eax
c0103143:	ff d0                	call   *%eax
}
c0103145:	83 c4 34             	add    $0x34,%esp
c0103148:	5b                   	pop    %ebx
c0103149:	5d                   	pop    %ebp
c010314a:	c3                   	ret    

c010314b <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c010314b:	55                   	push   %ebp
c010314c:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010314e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c0103152:	7e 14                	jle    c0103168 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c0103154:	8b 45 08             	mov    0x8(%ebp),%eax
c0103157:	8b 00                	mov    (%eax),%eax
c0103159:	8d 48 08             	lea    0x8(%eax),%ecx
c010315c:	8b 55 08             	mov    0x8(%ebp),%edx
c010315f:	89 0a                	mov    %ecx,(%edx)
c0103161:	8b 50 04             	mov    0x4(%eax),%edx
c0103164:	8b 00                	mov    (%eax),%eax
c0103166:	eb 30                	jmp    c0103198 <getuint+0x4d>
	else if (lflag)
c0103168:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010316c:	74 16                	je     c0103184 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c010316e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103171:	8b 00                	mov    (%eax),%eax
c0103173:	8d 48 04             	lea    0x4(%eax),%ecx
c0103176:	8b 55 08             	mov    0x8(%ebp),%edx
c0103179:	89 0a                	mov    %ecx,(%edx)
c010317b:	8b 00                	mov    (%eax),%eax
c010317d:	ba 00 00 00 00       	mov    $0x0,%edx
c0103182:	eb 14                	jmp    c0103198 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c0103184:	8b 45 08             	mov    0x8(%ebp),%eax
c0103187:	8b 00                	mov    (%eax),%eax
c0103189:	8d 48 04             	lea    0x4(%eax),%ecx
c010318c:	8b 55 08             	mov    0x8(%ebp),%edx
c010318f:	89 0a                	mov    %ecx,(%edx)
c0103191:	8b 00                	mov    (%eax),%eax
c0103193:	ba 00 00 00 00       	mov    $0x0,%edx
}
c0103198:	5d                   	pop    %ebp
c0103199:	c3                   	ret    

c010319a <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c010319a:	55                   	push   %ebp
c010319b:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010319d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01031a1:	7e 14                	jle    c01031b7 <getint+0x1d>
		return va_arg(*ap, long long);
c01031a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01031a6:	8b 00                	mov    (%eax),%eax
c01031a8:	8d 48 08             	lea    0x8(%eax),%ecx
c01031ab:	8b 55 08             	mov    0x8(%ebp),%edx
c01031ae:	89 0a                	mov    %ecx,(%edx)
c01031b0:	8b 50 04             	mov    0x4(%eax),%edx
c01031b3:	8b 00                	mov    (%eax),%eax
c01031b5:	eb 28                	jmp    c01031df <getint+0x45>
	else if (lflag)
c01031b7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01031bb:	74 12                	je     c01031cf <getint+0x35>
		return va_arg(*ap, long);
c01031bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c0:	8b 00                	mov    (%eax),%eax
c01031c2:	8d 48 04             	lea    0x4(%eax),%ecx
c01031c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01031c8:	89 0a                	mov    %ecx,(%edx)
c01031ca:	8b 00                	mov    (%eax),%eax
c01031cc:	99                   	cltd   
c01031cd:	eb 10                	jmp    c01031df <getint+0x45>
	else
		return va_arg(*ap, int);
c01031cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01031d2:	8b 00                	mov    (%eax),%eax
c01031d4:	8d 48 04             	lea    0x4(%eax),%ecx
c01031d7:	8b 55 08             	mov    0x8(%ebp),%edx
c01031da:	89 0a                	mov    %ecx,(%edx)
c01031dc:	8b 00                	mov    (%eax),%eax
c01031de:	99                   	cltd   
}
c01031df:	5d                   	pop    %ebp
c01031e0:	c3                   	ret    

c01031e1 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c01031e1:	55                   	push   %ebp
c01031e2:	89 e5                	mov    %esp,%ebp
c01031e4:	56                   	push   %esi
c01031e5:	53                   	push   %ebx
c01031e6:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01031e9:	eb 18                	jmp    c0103203 <vprintfmt+0x22>
			if (ch == '\0')
c01031eb:	85 db                	test   %ebx,%ebx
c01031ed:	75 05                	jne    c01031f4 <vprintfmt+0x13>
				return;
c01031ef:	e9 e9 03 00 00       	jmp    c01035dd <vprintfmt+0x3fc>
			putch(ch, putdat);
c01031f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031f7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031fb:	89 1c 24             	mov    %ebx,(%esp)
c01031fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103201:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103203:	8b 45 10             	mov    0x10(%ebp),%eax
c0103206:	8d 50 01             	lea    0x1(%eax),%edx
c0103209:	89 55 10             	mov    %edx,0x10(%ebp)
c010320c:	0f b6 00             	movzbl (%eax),%eax
c010320f:	0f b6 d8             	movzbl %al,%ebx
c0103212:	83 fb 25             	cmp    $0x25,%ebx
c0103215:	75 d4                	jne    c01031eb <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c0103217:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c010321b:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c0103222:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c0103229:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c0103230:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c0103237:	8b 45 10             	mov    0x10(%ebp),%eax
c010323a:	8d 50 01             	lea    0x1(%eax),%edx
c010323d:	89 55 10             	mov    %edx,0x10(%ebp)
c0103240:	0f b6 00             	movzbl (%eax),%eax
c0103243:	0f b6 d8             	movzbl %al,%ebx
c0103246:	8d 43 dd             	lea    -0x23(%ebx),%eax
c0103249:	83 f8 55             	cmp    $0x55,%eax
c010324c:	0f 87 5a 03 00 00    	ja     c01035ac <vprintfmt+0x3cb>
c0103252:	8b 04 85 cc 3e 10 c0 	mov    -0x3fefc134(,%eax,4),%eax
c0103259:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c010325b:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c010325f:	eb d6                	jmp    c0103237 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c0103261:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c0103265:	eb d0                	jmp    c0103237 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103267:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c010326e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103271:	89 d0                	mov    %edx,%eax
c0103273:	c1 e0 02             	shl    $0x2,%eax
c0103276:	01 d0                	add    %edx,%eax
c0103278:	01 c0                	add    %eax,%eax
c010327a:	01 d8                	add    %ebx,%eax
c010327c:	83 e8 30             	sub    $0x30,%eax
c010327f:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c0103282:	8b 45 10             	mov    0x10(%ebp),%eax
c0103285:	0f b6 00             	movzbl (%eax),%eax
c0103288:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c010328b:	83 fb 2f             	cmp    $0x2f,%ebx
c010328e:	7e 0b                	jle    c010329b <vprintfmt+0xba>
c0103290:	83 fb 39             	cmp    $0x39,%ebx
c0103293:	7f 06                	jg     c010329b <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103295:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c0103299:	eb d3                	jmp    c010326e <vprintfmt+0x8d>
			goto process_precision;
c010329b:	eb 33                	jmp    c01032d0 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c010329d:	8b 45 14             	mov    0x14(%ebp),%eax
c01032a0:	8d 50 04             	lea    0x4(%eax),%edx
c01032a3:	89 55 14             	mov    %edx,0x14(%ebp)
c01032a6:	8b 00                	mov    (%eax),%eax
c01032a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c01032ab:	eb 23                	jmp    c01032d0 <vprintfmt+0xef>

		case '.':
			if (width < 0)
c01032ad:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01032b1:	79 0c                	jns    c01032bf <vprintfmt+0xde>
				width = 0;
c01032b3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c01032ba:	e9 78 ff ff ff       	jmp    c0103237 <vprintfmt+0x56>
c01032bf:	e9 73 ff ff ff       	jmp    c0103237 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c01032c4:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c01032cb:	e9 67 ff ff ff       	jmp    c0103237 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c01032d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01032d4:	79 12                	jns    c01032e8 <vprintfmt+0x107>
				width = precision, precision = -1;
c01032d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01032d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01032dc:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c01032e3:	e9 4f ff ff ff       	jmp    c0103237 <vprintfmt+0x56>
c01032e8:	e9 4a ff ff ff       	jmp    c0103237 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c01032ed:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c01032f1:	e9 41 ff ff ff       	jmp    c0103237 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c01032f6:	8b 45 14             	mov    0x14(%ebp),%eax
c01032f9:	8d 50 04             	lea    0x4(%eax),%edx
c01032fc:	89 55 14             	mov    %edx,0x14(%ebp)
c01032ff:	8b 00                	mov    (%eax),%eax
c0103301:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103304:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103308:	89 04 24             	mov    %eax,(%esp)
c010330b:	8b 45 08             	mov    0x8(%ebp),%eax
c010330e:	ff d0                	call   *%eax
			break;
c0103310:	e9 c2 02 00 00       	jmp    c01035d7 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c0103315:	8b 45 14             	mov    0x14(%ebp),%eax
c0103318:	8d 50 04             	lea    0x4(%eax),%edx
c010331b:	89 55 14             	mov    %edx,0x14(%ebp)
c010331e:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c0103320:	85 db                	test   %ebx,%ebx
c0103322:	79 02                	jns    c0103326 <vprintfmt+0x145>
				err = -err;
c0103324:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c0103326:	83 fb 06             	cmp    $0x6,%ebx
c0103329:	7f 0b                	jg     c0103336 <vprintfmt+0x155>
c010332b:	8b 34 9d 8c 3e 10 c0 	mov    -0x3fefc174(,%ebx,4),%esi
c0103332:	85 f6                	test   %esi,%esi
c0103334:	75 23                	jne    c0103359 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c0103336:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c010333a:	c7 44 24 08 b9 3e 10 	movl   $0xc0103eb9,0x8(%esp)
c0103341:	c0 
c0103342:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103345:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103349:	8b 45 08             	mov    0x8(%ebp),%eax
c010334c:	89 04 24             	mov    %eax,(%esp)
c010334f:	e8 90 02 00 00       	call   c01035e4 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c0103354:	e9 7e 02 00 00       	jmp    c01035d7 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c0103359:	89 74 24 0c          	mov    %esi,0xc(%esp)
c010335d:	c7 44 24 08 c2 3e 10 	movl   $0xc0103ec2,0x8(%esp)
c0103364:	c0 
c0103365:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103368:	89 44 24 04          	mov    %eax,0x4(%esp)
c010336c:	8b 45 08             	mov    0x8(%ebp),%eax
c010336f:	89 04 24             	mov    %eax,(%esp)
c0103372:	e8 6d 02 00 00       	call   c01035e4 <printfmt>
			break;
c0103377:	e9 5b 02 00 00       	jmp    c01035d7 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c010337c:	8b 45 14             	mov    0x14(%ebp),%eax
c010337f:	8d 50 04             	lea    0x4(%eax),%edx
c0103382:	89 55 14             	mov    %edx,0x14(%ebp)
c0103385:	8b 30                	mov    (%eax),%esi
c0103387:	85 f6                	test   %esi,%esi
c0103389:	75 05                	jne    c0103390 <vprintfmt+0x1af>
				p = "(null)";
c010338b:	be c5 3e 10 c0       	mov    $0xc0103ec5,%esi
			if (width > 0 && padc != '-')
c0103390:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103394:	7e 37                	jle    c01033cd <vprintfmt+0x1ec>
c0103396:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c010339a:	74 31                	je     c01033cd <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c010339c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010339f:	89 44 24 04          	mov    %eax,0x4(%esp)
c01033a3:	89 34 24             	mov    %esi,(%esp)
c01033a6:	e8 9b f8 ff ff       	call   c0102c46 <strnlen>
c01033ab:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c01033ae:	eb 17                	jmp    c01033c7 <vprintfmt+0x1e6>
					putch(padc, putdat);
c01033b0:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c01033b4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01033b7:	89 54 24 04          	mov    %edx,0x4(%esp)
c01033bb:	89 04 24             	mov    %eax,(%esp)
c01033be:	8b 45 08             	mov    0x8(%ebp),%eax
c01033c1:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c01033c3:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01033c7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01033cb:	7f e3                	jg     c01033b0 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c01033cd:	eb 38                	jmp    c0103407 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c01033cf:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01033d3:	74 1f                	je     c01033f4 <vprintfmt+0x213>
c01033d5:	83 fb 1f             	cmp    $0x1f,%ebx
c01033d8:	7e 05                	jle    c01033df <vprintfmt+0x1fe>
c01033da:	83 fb 7e             	cmp    $0x7e,%ebx
c01033dd:	7e 15                	jle    c01033f4 <vprintfmt+0x213>
					putch('?', putdat);
c01033df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033e2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01033e6:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c01033ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01033f0:	ff d0                	call   *%eax
c01033f2:	eb 0f                	jmp    c0103403 <vprintfmt+0x222>
				else
					putch(ch, putdat);
c01033f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033f7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01033fb:	89 1c 24             	mov    %ebx,(%esp)
c01033fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103401:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103403:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103407:	89 f0                	mov    %esi,%eax
c0103409:	8d 70 01             	lea    0x1(%eax),%esi
c010340c:	0f b6 00             	movzbl (%eax),%eax
c010340f:	0f be d8             	movsbl %al,%ebx
c0103412:	85 db                	test   %ebx,%ebx
c0103414:	74 10                	je     c0103426 <vprintfmt+0x245>
c0103416:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c010341a:	78 b3                	js     c01033cf <vprintfmt+0x1ee>
c010341c:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c0103420:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103424:	79 a9                	jns    c01033cf <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103426:	eb 17                	jmp    c010343f <vprintfmt+0x25e>
				putch(' ', putdat);
c0103428:	8b 45 0c             	mov    0xc(%ebp),%eax
c010342b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010342f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103436:	8b 45 08             	mov    0x8(%ebp),%eax
c0103439:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c010343b:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c010343f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103443:	7f e3                	jg     c0103428 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103445:	e9 8d 01 00 00       	jmp    c01035d7 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c010344a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010344d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103451:	8d 45 14             	lea    0x14(%ebp),%eax
c0103454:	89 04 24             	mov    %eax,(%esp)
c0103457:	e8 3e fd ff ff       	call   c010319a <getint>
c010345c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010345f:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c0103462:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103465:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103468:	85 d2                	test   %edx,%edx
c010346a:	79 26                	jns    c0103492 <vprintfmt+0x2b1>
				putch('-', putdat);
c010346c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010346f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103473:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c010347a:	8b 45 08             	mov    0x8(%ebp),%eax
c010347d:	ff d0                	call   *%eax
				num = -(long long) num;
c010347f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103482:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103485:	f7 d8                	neg    %eax
c0103487:	83 d2 00             	adc    $0x0,%edx
c010348a:	f7 da                	neg    %edx
c010348c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010348f:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0103492:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103499:	e9 c5 00 00 00       	jmp    c0103563 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c010349e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01034a1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034a5:	8d 45 14             	lea    0x14(%ebp),%eax
c01034a8:	89 04 24             	mov    %eax,(%esp)
c01034ab:	e8 9b fc ff ff       	call   c010314b <getuint>
c01034b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034b3:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c01034b6:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c01034bd:	e9 a1 00 00 00       	jmp    c0103563 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c01034c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034c5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034c9:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01034d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01034d3:	ff d0                	call   *%eax
			putch('X', putdat);
c01034d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034d8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034dc:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01034e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01034e6:	ff d0                	call   *%eax
			putch('X', putdat);
c01034e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034eb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034ef:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01034f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01034f9:	ff d0                	call   *%eax
			break;
c01034fb:	e9 d7 00 00 00       	jmp    c01035d7 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c0103500:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103503:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103507:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c010350e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103511:	ff d0                	call   *%eax
			putch('x', putdat);
c0103513:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103516:	89 44 24 04          	mov    %eax,0x4(%esp)
c010351a:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c0103521:	8b 45 08             	mov    0x8(%ebp),%eax
c0103524:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103526:	8b 45 14             	mov    0x14(%ebp),%eax
c0103529:	8d 50 04             	lea    0x4(%eax),%edx
c010352c:	89 55 14             	mov    %edx,0x14(%ebp)
c010352f:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c0103531:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103534:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c010353b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0103542:	eb 1f                	jmp    c0103563 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103544:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103547:	89 44 24 04          	mov    %eax,0x4(%esp)
c010354b:	8d 45 14             	lea    0x14(%ebp),%eax
c010354e:	89 04 24             	mov    %eax,(%esp)
c0103551:	e8 f5 fb ff ff       	call   c010314b <getuint>
c0103556:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103559:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c010355c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0103563:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0103567:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010356a:	89 54 24 18          	mov    %edx,0x18(%esp)
c010356e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103571:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103575:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103579:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010357c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010357f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103583:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103587:	8b 45 0c             	mov    0xc(%ebp),%eax
c010358a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010358e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103591:	89 04 24             	mov    %eax,(%esp)
c0103594:	e8 d4 fa ff ff       	call   c010306d <printnum>
			break;
c0103599:	eb 3c                	jmp    c01035d7 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c010359b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010359e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035a2:	89 1c 24             	mov    %ebx,(%esp)
c01035a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01035a8:	ff d0                	call   *%eax
			break;
c01035aa:	eb 2b                	jmp    c01035d7 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c01035ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035af:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035b3:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c01035ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01035bd:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c01035bf:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01035c3:	eb 04                	jmp    c01035c9 <vprintfmt+0x3e8>
c01035c5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01035c9:	8b 45 10             	mov    0x10(%ebp),%eax
c01035cc:	83 e8 01             	sub    $0x1,%eax
c01035cf:	0f b6 00             	movzbl (%eax),%eax
c01035d2:	3c 25                	cmp    $0x25,%al
c01035d4:	75 ef                	jne    c01035c5 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c01035d6:	90                   	nop
		}
	}
c01035d7:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01035d8:	e9 26 fc ff ff       	jmp    c0103203 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c01035dd:	83 c4 40             	add    $0x40,%esp
c01035e0:	5b                   	pop    %ebx
c01035e1:	5e                   	pop    %esi
c01035e2:	5d                   	pop    %ebp
c01035e3:	c3                   	ret    

c01035e4 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c01035e4:	55                   	push   %ebp
c01035e5:	89 e5                	mov    %esp,%ebp
c01035e7:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c01035ea:	8d 45 14             	lea    0x14(%ebp),%eax
c01035ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c01035f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01035f3:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01035f7:	8b 45 10             	mov    0x10(%ebp),%eax
c01035fa:	89 44 24 08          	mov    %eax,0x8(%esp)
c01035fe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103601:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103605:	8b 45 08             	mov    0x8(%ebp),%eax
c0103608:	89 04 24             	mov    %eax,(%esp)
c010360b:	e8 d1 fb ff ff       	call   c01031e1 <vprintfmt>
	va_end(ap);
}
c0103610:	c9                   	leave  
c0103611:	c3                   	ret    

c0103612 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c0103612:	55                   	push   %ebp
c0103613:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103615:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103618:	8b 40 08             	mov    0x8(%eax),%eax
c010361b:	8d 50 01             	lea    0x1(%eax),%edx
c010361e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103621:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103624:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103627:	8b 10                	mov    (%eax),%edx
c0103629:	8b 45 0c             	mov    0xc(%ebp),%eax
c010362c:	8b 40 04             	mov    0x4(%eax),%eax
c010362f:	39 c2                	cmp    %eax,%edx
c0103631:	73 12                	jae    c0103645 <sprintputch+0x33>
		*b->buf++ = ch;
c0103633:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103636:	8b 00                	mov    (%eax),%eax
c0103638:	8d 48 01             	lea    0x1(%eax),%ecx
c010363b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010363e:	89 0a                	mov    %ecx,(%edx)
c0103640:	8b 55 08             	mov    0x8(%ebp),%edx
c0103643:	88 10                	mov    %dl,(%eax)
}
c0103645:	5d                   	pop    %ebp
c0103646:	c3                   	ret    

c0103647 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103647:	55                   	push   %ebp
c0103648:	89 e5                	mov    %esp,%ebp
c010364a:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c010364d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103650:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103653:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103656:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103659:	8b 45 08             	mov    0x8(%ebp),%eax
c010365c:	01 d0                	add    %edx,%eax
c010365e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103661:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0103668:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010366c:	74 06                	je     c0103674 <vsnprintf+0x2d>
c010366e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103672:	7f 07                	jg     c010367b <vsnprintf+0x34>
		return -E_INVAL;
c0103674:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0103679:	eb 2a                	jmp    c01036a5 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c010367b:	8b 45 14             	mov    0x14(%ebp),%eax
c010367e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103682:	8b 45 10             	mov    0x10(%ebp),%eax
c0103685:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103689:	8d 45 ec             	lea    -0x14(%ebp),%eax
c010368c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103690:	c7 04 24 12 36 10 c0 	movl   $0xc0103612,(%esp)
c0103697:	e8 45 fb ff ff       	call   c01031e1 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c010369c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010369f:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c01036a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01036a5:	c9                   	leave  
c01036a6:	c3                   	ret    

c01036a7 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c01036a7:	55                   	push   %ebp
c01036a8:	89 e5                	mov    %esp,%ebp
c01036aa:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c01036ad:	8d 45 14             	lea    0x14(%ebp),%eax
c01036b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c01036b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036b6:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01036ba:	8b 45 10             	mov    0x10(%ebp),%eax
c01036bd:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036c4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01036cb:	89 04 24             	mov    %eax,(%esp)
c01036ce:	e8 74 ff ff ff       	call   c0103647 <vsnprintf>
c01036d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c01036d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01036d9:	c9                   	leave  
c01036da:	c3                   	ret    

c01036db <srand>:
static int seed = 0;

void
srand(int s) {
c01036db:	55                   	push   %ebp
c01036dc:	89 e5                	mov    %esp,%ebp
	seed = s;
c01036de:	8b 45 08             	mov    0x8(%ebp),%eax
c01036e1:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c01036e6:	5d                   	pop    %ebp
c01036e7:	c3                   	ret    

c01036e8 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c01036e8:	55                   	push   %ebp
c01036e9:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c01036eb:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c01036f0:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c01036f6:	83 c0 01             	add    $0x1,%eax
c01036f9:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c01036fe:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c0103703:	c1 f8 10             	sar    $0x10,%eax
c0103706:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c010370b:	5d                   	pop    %ebp
c010370c:	c3                   	ret    
c010370d:	66 90                	xchg   %ax,%ax
c010370f:	90                   	nop

c0103710 <__udivdi3>:
c0103710:	55                   	push   %ebp
c0103711:	57                   	push   %edi
c0103712:	56                   	push   %esi
c0103713:	83 ec 0c             	sub    $0xc,%esp
c0103716:	8b 44 24 28          	mov    0x28(%esp),%eax
c010371a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c010371e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103722:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103726:	85 c0                	test   %eax,%eax
c0103728:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010372c:	89 ea                	mov    %ebp,%edx
c010372e:	89 0c 24             	mov    %ecx,(%esp)
c0103731:	75 2d                	jne    c0103760 <__udivdi3+0x50>
c0103733:	39 e9                	cmp    %ebp,%ecx
c0103735:	77 61                	ja     c0103798 <__udivdi3+0x88>
c0103737:	85 c9                	test   %ecx,%ecx
c0103739:	89 ce                	mov    %ecx,%esi
c010373b:	75 0b                	jne    c0103748 <__udivdi3+0x38>
c010373d:	b8 01 00 00 00       	mov    $0x1,%eax
c0103742:	31 d2                	xor    %edx,%edx
c0103744:	f7 f1                	div    %ecx
c0103746:	89 c6                	mov    %eax,%esi
c0103748:	31 d2                	xor    %edx,%edx
c010374a:	89 e8                	mov    %ebp,%eax
c010374c:	f7 f6                	div    %esi
c010374e:	89 c5                	mov    %eax,%ebp
c0103750:	89 f8                	mov    %edi,%eax
c0103752:	f7 f6                	div    %esi
c0103754:	89 ea                	mov    %ebp,%edx
c0103756:	83 c4 0c             	add    $0xc,%esp
c0103759:	5e                   	pop    %esi
c010375a:	5f                   	pop    %edi
c010375b:	5d                   	pop    %ebp
c010375c:	c3                   	ret    
c010375d:	8d 76 00             	lea    0x0(%esi),%esi
c0103760:	39 e8                	cmp    %ebp,%eax
c0103762:	77 24                	ja     c0103788 <__udivdi3+0x78>
c0103764:	0f bd e8             	bsr    %eax,%ebp
c0103767:	83 f5 1f             	xor    $0x1f,%ebp
c010376a:	75 3c                	jne    c01037a8 <__udivdi3+0x98>
c010376c:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103770:	39 34 24             	cmp    %esi,(%esp)
c0103773:	0f 86 9f 00 00 00    	jbe    c0103818 <__udivdi3+0x108>
c0103779:	39 d0                	cmp    %edx,%eax
c010377b:	0f 82 97 00 00 00    	jb     c0103818 <__udivdi3+0x108>
c0103781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103788:	31 d2                	xor    %edx,%edx
c010378a:	31 c0                	xor    %eax,%eax
c010378c:	83 c4 0c             	add    $0xc,%esp
c010378f:	5e                   	pop    %esi
c0103790:	5f                   	pop    %edi
c0103791:	5d                   	pop    %ebp
c0103792:	c3                   	ret    
c0103793:	90                   	nop
c0103794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103798:	89 f8                	mov    %edi,%eax
c010379a:	f7 f1                	div    %ecx
c010379c:	31 d2                	xor    %edx,%edx
c010379e:	83 c4 0c             	add    $0xc,%esp
c01037a1:	5e                   	pop    %esi
c01037a2:	5f                   	pop    %edi
c01037a3:	5d                   	pop    %ebp
c01037a4:	c3                   	ret    
c01037a5:	8d 76 00             	lea    0x0(%esi),%esi
c01037a8:	89 e9                	mov    %ebp,%ecx
c01037aa:	8b 3c 24             	mov    (%esp),%edi
c01037ad:	d3 e0                	shl    %cl,%eax
c01037af:	89 c6                	mov    %eax,%esi
c01037b1:	b8 20 00 00 00       	mov    $0x20,%eax
c01037b6:	29 e8                	sub    %ebp,%eax
c01037b8:	89 c1                	mov    %eax,%ecx
c01037ba:	d3 ef                	shr    %cl,%edi
c01037bc:	89 e9                	mov    %ebp,%ecx
c01037be:	89 7c 24 08          	mov    %edi,0x8(%esp)
c01037c2:	8b 3c 24             	mov    (%esp),%edi
c01037c5:	09 74 24 08          	or     %esi,0x8(%esp)
c01037c9:	89 d6                	mov    %edx,%esi
c01037cb:	d3 e7                	shl    %cl,%edi
c01037cd:	89 c1                	mov    %eax,%ecx
c01037cf:	89 3c 24             	mov    %edi,(%esp)
c01037d2:	8b 7c 24 04          	mov    0x4(%esp),%edi
c01037d6:	d3 ee                	shr    %cl,%esi
c01037d8:	89 e9                	mov    %ebp,%ecx
c01037da:	d3 e2                	shl    %cl,%edx
c01037dc:	89 c1                	mov    %eax,%ecx
c01037de:	d3 ef                	shr    %cl,%edi
c01037e0:	09 d7                	or     %edx,%edi
c01037e2:	89 f2                	mov    %esi,%edx
c01037e4:	89 f8                	mov    %edi,%eax
c01037e6:	f7 74 24 08          	divl   0x8(%esp)
c01037ea:	89 d6                	mov    %edx,%esi
c01037ec:	89 c7                	mov    %eax,%edi
c01037ee:	f7 24 24             	mull   (%esp)
c01037f1:	39 d6                	cmp    %edx,%esi
c01037f3:	89 14 24             	mov    %edx,(%esp)
c01037f6:	72 30                	jb     c0103828 <__udivdi3+0x118>
c01037f8:	8b 54 24 04          	mov    0x4(%esp),%edx
c01037fc:	89 e9                	mov    %ebp,%ecx
c01037fe:	d3 e2                	shl    %cl,%edx
c0103800:	39 c2                	cmp    %eax,%edx
c0103802:	73 05                	jae    c0103809 <__udivdi3+0xf9>
c0103804:	3b 34 24             	cmp    (%esp),%esi
c0103807:	74 1f                	je     c0103828 <__udivdi3+0x118>
c0103809:	89 f8                	mov    %edi,%eax
c010380b:	31 d2                	xor    %edx,%edx
c010380d:	e9 7a ff ff ff       	jmp    c010378c <__udivdi3+0x7c>
c0103812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103818:	31 d2                	xor    %edx,%edx
c010381a:	b8 01 00 00 00       	mov    $0x1,%eax
c010381f:	e9 68 ff ff ff       	jmp    c010378c <__udivdi3+0x7c>
c0103824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103828:	8d 47 ff             	lea    -0x1(%edi),%eax
c010382b:	31 d2                	xor    %edx,%edx
c010382d:	83 c4 0c             	add    $0xc,%esp
c0103830:	5e                   	pop    %esi
c0103831:	5f                   	pop    %edi
c0103832:	5d                   	pop    %ebp
c0103833:	c3                   	ret    
c0103834:	66 90                	xchg   %ax,%ax
c0103836:	66 90                	xchg   %ax,%ax
c0103838:	66 90                	xchg   %ax,%ax
c010383a:	66 90                	xchg   %ax,%ax
c010383c:	66 90                	xchg   %ax,%ax
c010383e:	66 90                	xchg   %ax,%ax

c0103840 <__umoddi3>:
c0103840:	55                   	push   %ebp
c0103841:	57                   	push   %edi
c0103842:	56                   	push   %esi
c0103843:	83 ec 14             	sub    $0x14,%esp
c0103846:	8b 44 24 28          	mov    0x28(%esp),%eax
c010384a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c010384e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103852:	89 c7                	mov    %eax,%edi
c0103854:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103858:	8b 44 24 30          	mov    0x30(%esp),%eax
c010385c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103860:	89 34 24             	mov    %esi,(%esp)
c0103863:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103867:	85 c0                	test   %eax,%eax
c0103869:	89 c2                	mov    %eax,%edx
c010386b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c010386f:	75 17                	jne    c0103888 <__umoddi3+0x48>
c0103871:	39 fe                	cmp    %edi,%esi
c0103873:	76 4b                	jbe    c01038c0 <__umoddi3+0x80>
c0103875:	89 c8                	mov    %ecx,%eax
c0103877:	89 fa                	mov    %edi,%edx
c0103879:	f7 f6                	div    %esi
c010387b:	89 d0                	mov    %edx,%eax
c010387d:	31 d2                	xor    %edx,%edx
c010387f:	83 c4 14             	add    $0x14,%esp
c0103882:	5e                   	pop    %esi
c0103883:	5f                   	pop    %edi
c0103884:	5d                   	pop    %ebp
c0103885:	c3                   	ret    
c0103886:	66 90                	xchg   %ax,%ax
c0103888:	39 f8                	cmp    %edi,%eax
c010388a:	77 54                	ja     c01038e0 <__umoddi3+0xa0>
c010388c:	0f bd e8             	bsr    %eax,%ebp
c010388f:	83 f5 1f             	xor    $0x1f,%ebp
c0103892:	75 5c                	jne    c01038f0 <__umoddi3+0xb0>
c0103894:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0103898:	39 3c 24             	cmp    %edi,(%esp)
c010389b:	0f 87 e7 00 00 00    	ja     c0103988 <__umoddi3+0x148>
c01038a1:	8b 7c 24 04          	mov    0x4(%esp),%edi
c01038a5:	29 f1                	sub    %esi,%ecx
c01038a7:	19 c7                	sbb    %eax,%edi
c01038a9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01038ad:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c01038b1:	8b 44 24 08          	mov    0x8(%esp),%eax
c01038b5:	8b 54 24 0c          	mov    0xc(%esp),%edx
c01038b9:	83 c4 14             	add    $0x14,%esp
c01038bc:	5e                   	pop    %esi
c01038bd:	5f                   	pop    %edi
c01038be:	5d                   	pop    %ebp
c01038bf:	c3                   	ret    
c01038c0:	85 f6                	test   %esi,%esi
c01038c2:	89 f5                	mov    %esi,%ebp
c01038c4:	75 0b                	jne    c01038d1 <__umoddi3+0x91>
c01038c6:	b8 01 00 00 00       	mov    $0x1,%eax
c01038cb:	31 d2                	xor    %edx,%edx
c01038cd:	f7 f6                	div    %esi
c01038cf:	89 c5                	mov    %eax,%ebp
c01038d1:	8b 44 24 04          	mov    0x4(%esp),%eax
c01038d5:	31 d2                	xor    %edx,%edx
c01038d7:	f7 f5                	div    %ebp
c01038d9:	89 c8                	mov    %ecx,%eax
c01038db:	f7 f5                	div    %ebp
c01038dd:	eb 9c                	jmp    c010387b <__umoddi3+0x3b>
c01038df:	90                   	nop
c01038e0:	89 c8                	mov    %ecx,%eax
c01038e2:	89 fa                	mov    %edi,%edx
c01038e4:	83 c4 14             	add    $0x14,%esp
c01038e7:	5e                   	pop    %esi
c01038e8:	5f                   	pop    %edi
c01038e9:	5d                   	pop    %ebp
c01038ea:	c3                   	ret    
c01038eb:	90                   	nop
c01038ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01038f0:	8b 04 24             	mov    (%esp),%eax
c01038f3:	be 20 00 00 00       	mov    $0x20,%esi
c01038f8:	89 e9                	mov    %ebp,%ecx
c01038fa:	29 ee                	sub    %ebp,%esi
c01038fc:	d3 e2                	shl    %cl,%edx
c01038fe:	89 f1                	mov    %esi,%ecx
c0103900:	d3 e8                	shr    %cl,%eax
c0103902:	89 e9                	mov    %ebp,%ecx
c0103904:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103908:	8b 04 24             	mov    (%esp),%eax
c010390b:	09 54 24 04          	or     %edx,0x4(%esp)
c010390f:	89 fa                	mov    %edi,%edx
c0103911:	d3 e0                	shl    %cl,%eax
c0103913:	89 f1                	mov    %esi,%ecx
c0103915:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103919:	8b 44 24 10          	mov    0x10(%esp),%eax
c010391d:	d3 ea                	shr    %cl,%edx
c010391f:	89 e9                	mov    %ebp,%ecx
c0103921:	d3 e7                	shl    %cl,%edi
c0103923:	89 f1                	mov    %esi,%ecx
c0103925:	d3 e8                	shr    %cl,%eax
c0103927:	89 e9                	mov    %ebp,%ecx
c0103929:	09 f8                	or     %edi,%eax
c010392b:	8b 7c 24 10          	mov    0x10(%esp),%edi
c010392f:	f7 74 24 04          	divl   0x4(%esp)
c0103933:	d3 e7                	shl    %cl,%edi
c0103935:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103939:	89 d7                	mov    %edx,%edi
c010393b:	f7 64 24 08          	mull   0x8(%esp)
c010393f:	39 d7                	cmp    %edx,%edi
c0103941:	89 c1                	mov    %eax,%ecx
c0103943:	89 14 24             	mov    %edx,(%esp)
c0103946:	72 2c                	jb     c0103974 <__umoddi3+0x134>
c0103948:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c010394c:	72 22                	jb     c0103970 <__umoddi3+0x130>
c010394e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103952:	29 c8                	sub    %ecx,%eax
c0103954:	19 d7                	sbb    %edx,%edi
c0103956:	89 e9                	mov    %ebp,%ecx
c0103958:	89 fa                	mov    %edi,%edx
c010395a:	d3 e8                	shr    %cl,%eax
c010395c:	89 f1                	mov    %esi,%ecx
c010395e:	d3 e2                	shl    %cl,%edx
c0103960:	89 e9                	mov    %ebp,%ecx
c0103962:	d3 ef                	shr    %cl,%edi
c0103964:	09 d0                	or     %edx,%eax
c0103966:	89 fa                	mov    %edi,%edx
c0103968:	83 c4 14             	add    $0x14,%esp
c010396b:	5e                   	pop    %esi
c010396c:	5f                   	pop    %edi
c010396d:	5d                   	pop    %ebp
c010396e:	c3                   	ret    
c010396f:	90                   	nop
c0103970:	39 d7                	cmp    %edx,%edi
c0103972:	75 da                	jne    c010394e <__umoddi3+0x10e>
c0103974:	8b 14 24             	mov    (%esp),%edx
c0103977:	89 c1                	mov    %eax,%ecx
c0103979:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c010397d:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0103981:	eb cb                	jmp    c010394e <__umoddi3+0x10e>
c0103983:	90                   	nop
c0103984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103988:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c010398c:	0f 82 0f ff ff ff    	jb     c01038a1 <__umoddi3+0x61>
c0103992:	e9 1a ff ff ff       	jmp    c01038b1 <__umoddi3+0x71>
