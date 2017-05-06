
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
	switch(tf->eax) {
c0100006:	8b 45 08             	mov    0x8(%ebp),%eax
c0100009:	8b 40 1c             	mov    0x1c(%eax),%eax
c010000c:	83 f8 08             	cmp    $0x8,%eax
c010000f:	0f 87 ac 00 00 00    	ja     c01000c1 <do_syscall+0xc1>
c0100015:	8b 04 85 b4 3a 10 c0 	mov    -0x3fefc54c(,%eax,4),%eax
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
c010007e:	e8 a7 27 00 00       	call   c010282a <sys_write>
c0100083:	89 c2                	mov    %eax,%edx
c0100085:	8b 45 08             	mov    0x8(%ebp),%eax
c0100088:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008b:	eb 64                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_fork:
			sys_fork();
c010008d:	e8 a8 14 00 00       	call   c010153a <sys_fork>
			break;
c0100092:	eb 5d                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_getpid:
			tf->eax=sys_getpid();
c0100094:	e8 f1 14 00 00       	call   c010158a <sys_getpid>
c0100099:	8b 55 08             	mov    0x8(%ebp),%edx
c010009c:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c010009f:	eb 50                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_exit:
			sys_exit(tf->ebx);
c01000a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01000a4:	8b 40 10             	mov    0x10(%eax),%eax
c01000a7:	89 04 24             	mov    %eax,(%esp)
c01000aa:	e8 e8 14 00 00       	call   c0101597 <sys_exit>
			break;
c01000af:	eb 40                	jmp    c01000f1 <do_syscall+0xf1>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01000b4:	8b 40 10             	mov    0x10(%eax),%eax
c01000b7:	89 04 24             	mov    %eax,(%esp)
c01000ba:	e8 f7 15 00 00       	call   c01016b6 <sys_sleep>
			break;
c01000bf:	eb 30                	jmp    c01000f1 <do_syscall+0xf1>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c01000c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01000c4:	8b 50 38             	mov    0x38(%eax),%edx
c01000c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ca:	8b 40 1c             	mov    0x1c(%eax),%eax
c01000cd:	89 54 24 10          	mov    %edx,0x10(%esp)
c01000d1:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01000d5:	c7 44 24 08 68 3a 10 	movl   $0xc0103a68,0x8(%esp)
c01000dc:	c0 
c01000dd:	c7 44 24 04 27 00 00 	movl   $0x27,0x4(%esp)
c01000e4:	00 
c01000e5:	c7 04 24 95 3a 10 c0 	movl   $0xc0103a95,(%esp)
c01000ec:	e8 99 26 00 00       	call   c010278a <_panic>
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
c0100148:	e8 61 17 00 00       	call   c01018ae <page_init>
	//printk("here");
	init_segment();
c010014d:	e8 eb 24 00 00       	call   c010263d <init_segment>
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
c0100188:	e8 0f 10 00 00       	call   c010119c <pcb_new>
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
c0100193:	c7 04 24 d8 3a 10 c0 	movl   $0xc0103ad8,(%esp)
c010019a:	e8 1a 27 00 00       	call   c01028b9 <printk>
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
c01003ed:	b8 8a 29 10 c0       	mov    $0xc010298a,%eax
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
c0100427:	b8 df 28 10 c0       	mov    $0xc01028df,%eax
c010042c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100433:	00 
c0100434:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100438:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010043f:	00 
c0100440:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c0100447:	e8 15 ff ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c010044c:	b8 e8 28 10 c0       	mov    $0xc01028e8,%eax
c0100451:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100458:	00 
c0100459:	89 44 24 08          	mov    %eax,0x8(%esp)
c010045d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100464:	00 
c0100465:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c010046c:	e8 f0 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100471:	b8 f1 28 10 c0       	mov    $0xc01028f1,%eax
c0100476:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010047d:	00 
c010047e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100482:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100489:	00 
c010048a:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c0100491:	e8 cb fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c0100496:	b8 fa 28 10 c0       	mov    $0xc01028fa,%eax
c010049b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004a2:	00 
c01004a3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004a7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004ae:	00 
c01004af:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c01004b6:	e8 a6 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c01004bb:	b8 03 29 10 c0       	mov    $0xc0102903,%eax
c01004c0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004c7:	00 
c01004c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004cc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004d3:	00 
c01004d4:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c01004db:	e8 81 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c01004e0:	b8 0c 29 10 c0       	mov    $0xc010290c,%eax
c01004e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004ec:	00 
c01004ed:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004f1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004f8:	00 
c01004f9:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c0100500:	e8 5c fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c0100505:	b8 15 29 10 c0       	mov    $0xc0102915,%eax
c010050a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100511:	00 
c0100512:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100516:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010051d:	00 
c010051e:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c0100525:	e8 37 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c010052a:	b8 1e 29 10 c0       	mov    $0xc010291e,%eax
c010052f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100536:	00 
c0100537:	89 44 24 08          	mov    %eax,0x8(%esp)
c010053b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100542:	00 
c0100543:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c010054a:	e8 12 fe ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c010054f:	b8 27 29 10 c0       	mov    $0xc0102927,%eax
c0100554:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010055b:	00 
c010055c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100560:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100567:	00 
c0100568:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c010056f:	e8 ed fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c0100574:	b8 2e 29 10 c0       	mov    $0xc010292e,%eax
c0100579:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100580:	00 
c0100581:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100585:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010058c:	00 
c010058d:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c0100594:	e8 c8 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c0100599:	b8 37 29 10 c0       	mov    $0xc0102937,%eax
c010059e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005a5:	00 
c01005a6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005aa:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005b1:	00 
c01005b2:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c01005b9:	e8 a3 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c01005be:	b8 3e 29 10 c0       	mov    $0xc010293e,%eax
c01005c3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ca:	00 
c01005cb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005cf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005d6:	00 
c01005d7:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c01005de:	e8 7e fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c01005e3:	b8 45 29 10 c0       	mov    $0xc0102945,%eax
c01005e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ef:	00 
c01005f0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005f4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005fb:	00 
c01005fc:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c0100603:	e8 59 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c0100608:	b8 4c 29 10 c0       	mov    $0xc010294c,%eax
c010060d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100614:	00 
c0100615:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100619:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100620:	00 
c0100621:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c0100628:	e8 34 fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c010062d:	b8 53 29 10 c0       	mov    $0xc0102953,%eax
c0100632:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100639:	00 
c010063a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010063e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100645:	00 
c0100646:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c010064d:	e8 0f fd ff ff       	call   c0100361 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100652:	b8 5a 29 10 c0       	mov    $0xc010295a,%eax
c0100657:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c010065e:	00 
c010065f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100663:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010066a:	00 
c010066b:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c0100672:	e8 ea fc ff ff       	call   c0100361 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c0100677:	b8 66 29 10 c0       	mov    $0xc0102966,%eax
c010067c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100683:	00 
c0100684:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100688:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010068f:	00 
c0100690:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c0100697:	e8 45 fc ff ff       	call   c01002e1 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c010069c:	b8 72 29 10 c0       	mov    $0xc0102972,%eax
c01006a1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006a8:	00 
c01006a9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006ad:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006b4:	00 
c01006b5:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c01006bc:	e8 20 fc ff ff       	call   c01002e1 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c01006c1:	b8 7e 29 10 c0       	mov    $0xc010297e,%eax
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
c0100763:	c7 44 24 04 56 3b 10 	movl   $0xc0103b56,0x4(%esp)
c010076a:	c0 
c010076b:	c7 04 24 e4 3a 10 c0 	movl   $0xc0103ae4,(%esp)
c0100772:	e8 42 21 00 00       	call   c01028b9 <printk>
c0100777:	eb 26                	jmp    c010079f <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100779:	8b 45 08             	mov    0x8(%ebp),%eax
c010077c:	8b 40 30             	mov    0x30(%eax),%eax
c010077f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100783:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c010078a:	00 
c010078b:	c7 44 24 04 56 3b 10 	movl   $0xc0103b56,0x4(%esp)
c0100792:	c0 
c0100793:	c7 04 24 04 3b 10 c0 	movl   $0xc0103b04,(%esp)
c010079a:	e8 1a 21 00 00       	call   c01028b9 <printk>
		}
		assert(0);
c010079f:	c7 44 24 0c 27 3b 10 	movl   $0xc0103b27,0xc(%esp)
c01007a6:	c0 
c01007a7:	c7 44 24 08 29 3b 10 	movl   $0xc0103b29,0x8(%esp)
c01007ae:	c0 
c01007af:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c01007b6:	00 
c01007b7:	c7 04 24 3e 3b 10 c0 	movl   $0xc0103b3e,(%esp)
c01007be:	e8 c7 1f 00 00       	call   c010278a <_panic>
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
c01007d7:	e8 0b 1b 00 00       	call   c01022e7 <schedule>
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
c0100883:	c7 44 24 04 56 3b 10 	movl   $0xc0103b56,0x4(%esp)
c010088a:	c0 
c010088b:	c7 04 24 04 3b 10 c0 	movl   $0xc0103b04,(%esp)
c0100892:	e8 22 20 00 00       	call   c01028b9 <printk>
		assert(0);
c0100897:	c7 44 24 0c 27 3b 10 	movl   $0xc0103b27,0xc(%esp)
c010089e:	c0 
c010089f:	c7 44 24 08 29 3b 10 	movl   $0xc0103b29,0x8(%esp)
c01008a6:	c0 
c01008a7:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01008ae:	00 
c01008af:	c7 04 24 3e 3b 10 c0 	movl   $0xc0103b3e,(%esp)
c01008b6:	e8 cf 1e 00 00       	call   c010278a <_panic>
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
c01008da:	e8 be 23 00 00       	call   c0102c9d <memset>
	memset(vref, 0, SCR_SIZE);
c01008df:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008e6:	00 
c01008e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008ee:	00 
c01008ef:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c01008f6:	e8 a2 23 00 00       	call   c0102c9d <memset>
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
c010091a:	e8 61 23 00 00       	call   c0102c80 <memcpy>
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
c0100941:	e8 57 23 00 00       	call   c0102c9d <memset>
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
c0100af9:	c7 44 24 0c 61 3b 10 	movl   $0xc0103b61,0xc(%esp)
c0100b00:	c0 
c0100b01:	c7 44 24 08 71 3b 10 	movl   $0xc0103b71,0x8(%esp)
c0100b08:	c0 
c0100b09:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100b10:	00 
c0100b11:	c7 04 24 86 3b 10 c0 	movl   $0xc0103b86,(%esp)
c0100b18:	e8 6d 1c 00 00       	call   c010278a <_panic>
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
c0100b82:	c7 44 24 0c 9c 3b 10 	movl   $0xc0103b9c,0xc(%esp)
c0100b89:	c0 
c0100b8a:	c7 44 24 08 a9 3b 10 	movl   $0xc0103ba9,0x8(%esp)
c0100b91:	c0 
c0100b92:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0100b99:	00 
c0100b9a:	c7 04 24 be 3b 10 c0 	movl   $0xc0103bbe,(%esp)
c0100ba1:	e8 e4 1b 00 00       	call   c010278a <_panic>
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
c0100be2:	c7 44 24 0c d4 3b 10 	movl   $0xc0103bd4,0xc(%esp)
c0100be9:	c0 
c0100bea:	c7 44 24 08 a9 3b 10 	movl   $0xc0103ba9,0x8(%esp)
c0100bf1:	c0 
c0100bf2:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0100bf9:	00 
c0100bfa:	c7 04 24 be 3b 10 c0 	movl   $0xc0103bbe,(%esp)
c0100c01:	e8 84 1b 00 00       	call   c010278a <_panic>
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
c0100c2f:	c7 44 24 0c 9c 3b 10 	movl   $0xc0103b9c,0xc(%esp)
c0100c36:	c0 
c0100c37:	c7 44 24 08 a9 3b 10 	movl   $0xc0103ba9,0x8(%esp)
c0100c3e:	c0 
c0100c3f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0100c46:	00 
c0100c47:	c7 04 24 be 3b 10 c0 	movl   $0xc0103bbe,(%esp)
c0100c4e:	e8 37 1b 00 00       	call   c010278a <_panic>
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
c0100c8f:	c7 44 24 0c d4 3b 10 	movl   $0xc0103bd4,0xc(%esp)
c0100c96:	c0 
c0100c97:	c7 44 24 08 a9 3b 10 	movl   $0xc0103ba9,0x8(%esp)
c0100c9e:	c0 
c0100c9f:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
c0100ca6:	00 
c0100ca7:	c7 04 24 be 3b 10 c0 	movl   $0xc0103bbe,(%esp)
c0100cae:	e8 d7 1a 00 00       	call   c010278a <_panic>
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
c0100ce0:	c7 44 24 08 e0 3b 10 	movl   $0xc0103be0,0x8(%esp)
c0100ce7:	c0 
c0100ce8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ceb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100cef:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cf2:	89 04 24             	mov    %eax,(%esp)
c0100cf5:	e8 90 1a 00 00       	call   c010278a <_panic>
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
c0100d1e:	c7 44 24 08 04 3c 10 	movl   $0xc0103c04,0x8(%esp)
c0100d25:	c0 
c0100d26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d29:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d30:	89 04 24             	mov    %eax,(%esp)
c0100d33:	e8 52 1a 00 00       	call   c010278a <_panic>
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
c0100d76:	c7 04 24 27 3c 10 c0 	movl   $0xc0103c27,(%esp)
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
	init.pgdir=kern_pgdir;
c0100db8:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100dbd:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	pcbnow=&init;
c0100dc2:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100dc9:	3f 16 c0 
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
	init.pgdir=kern_pgdir;
	pcbnow=&init;
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
c0100e28:	83 ec 28             	sub    $0x28,%esp
	/*
	PCB* p = pcb_free_list;
 	if (p == NULL) return NULL;*/
	PCB* p=list_entry(free.next,PCB,plist);
c0100e2b:	a1 0c 4f 16 c0       	mov    0xc0164f0c,%eax
c0100e30:	83 e8 08             	sub    $0x8,%eax
c0100e33:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100e36:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100e3d:	e8 31 0c 00 00       	call   c0101a73 <page_alloc>
c0100e42:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pp == NULL) return NULL;
c0100e45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100e49:	75 0a                	jne    c0100e55 <pcb_alloc+0x30>
c0100e4b:	b8 00 00 00 00       	mov    $0x0,%eax
c0100e50:	e9 de 00 00 00       	jmp    c0100f33 <pcb_alloc+0x10e>
	p->pgdir = page2kva(pp);
c0100e55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e58:	89 04 24             	mov    %eax,(%esp)
c0100e5b:	e8 f9 fe ff ff       	call   c0100d59 <page2kva>
c0100e60:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100e63:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100e66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e69:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100e6d:	8d 50 01             	lea    0x1(%eax),%edx
c0100e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e73:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e7a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100e81:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100e86:	8d 50 01             	lea    0x1(%eax),%edx
c0100e89:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100e8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100e92:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100e95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e98:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ea2:	83 c0 08             	add    $0x8,%eax
c0100ea5:	89 04 24             	mov    %eax,(%esp)
c0100ea8:	e8 76 fd ff ff       	call   c0100c23 <list_del>
	list_add_before(&ready,&p->plist);
c0100ead:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eb0:	83 c0 08             	add    $0x8,%eax
c0100eb3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100eb7:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100ebe:	e8 13 fd ff ff       	call   c0100bd6 <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100ec3:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100ec9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ecc:	8b 40 04             	mov    0x4(%eax),%eax
c0100ecf:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100ed6:	00 
c0100ed7:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100edb:	89 04 24             	mov    %eax,(%esp)
c0100ede:	e8 9d 1d 00 00       	call   c0102c80 <memcpy>

	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	//??
c0100ee3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ee6:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100eeb:	89 45 ec             	mov    %eax,-0x14(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100eee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ef1:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100ef8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100efb:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100f02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f05:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100f0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f0e:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100f14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f17:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0100f1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f21:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c0100f28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f2b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100f2e:	89 10                	mov    %edx,(%eax)

	return p;
c0100f30:	8b 45 f4             	mov    -0xc(%ebp),%eax

}
c0100f33:	c9                   	leave  
c0100f34:	c3                   	ret    

c0100f35 <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0100f35:	55                   	push   %ebp
c0100f36:	89 e5                	mov    %esp,%ebp
c0100f38:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0100f3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100f3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f44:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100f49:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0100f4c:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c0100f53:	8b 45 10             	mov    0x10(%ebp),%eax
c0100f56:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f59:	01 c2                	add    %eax,%edx
c0100f5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f5e:	01 d0                	add    %edx,%eax
c0100f60:	83 e8 01             	sub    $0x1,%eax
c0100f63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100f66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f69:	ba 00 00 00 00       	mov    $0x0,%edx
c0100f6e:	f7 75 e8             	divl   -0x18(%ebp)
c0100f71:	89 d0                	mov    %edx,%eax
c0100f73:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100f76:	29 c2                	sub    %eax,%edx
c0100f78:	89 d0                	mov    %edx,%eax
c0100f7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;

	for (i = va_start; i < va_end; i += PGSIZE) {
c0100f7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f80:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100f83:	eb 61                	jmp    c0100fe6 <mm_malloc+0xb1>
		p = page_alloc(0);
c0100f85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0100f8c:	e8 e2 0a 00 00       	call   c0101a73 <page_alloc>
c0100f91:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c0100f94:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0100f98:	75 24                	jne    c0100fbe <mm_malloc+0x89>
c0100f9a:	c7 44 24 0c 3d 3c 10 	movl   $0xc0103c3d,0xc(%esp)
c0100fa1:	c0 
c0100fa2:	c7 44 24 08 a9 3b 10 	movl   $0xc0103ba9,0x8(%esp)
c0100fa9:	c0 
c0100faa:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100fb1:	00 
c0100fb2:	c7 04 24 47 3c 10 c0 	movl   $0xc0103c47,(%esp)
c0100fb9:	e8 cc 17 00 00       	call   c010278a <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0100fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fc1:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c0100fc8:	00 
c0100fc9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100fcd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100fd0:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100fd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100fd7:	89 04 24             	mov    %eax,(%esp)
c0100fda:	e8 1c 10 00 00       	call   c0101ffb <page_insert>
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;

	for (i = va_start; i < va_end; i += PGSIZE) {
c0100fdf:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0100fe6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fe9:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0100fec:	72 97                	jb     c0100f85 <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c0100fee:	c9                   	leave  
c0100fef:	c3                   	ret    

c0100ff0 <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c0100ff0:	55                   	push   %ebp
c0100ff1:	89 e5                	mov    %esp,%ebp
c0100ff3:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c0100ff6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ff9:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ffc:	01 d0                	add    %edx,%eax
c0100ffe:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c0101001:	8b 45 10             	mov    0x10(%ebp),%eax
c0101004:	c1 e8 09             	shr    $0x9,%eax
c0101007:	83 c0 01             	add    $0x1,%eax
c010100a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c010100d:	eb 6e                	jmp    c010107d <readseg+0x8d>
		readsect(disks, sect);
c010100f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101012:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101016:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c010101d:	e8 65 00 00 00       	call   c0101087 <readsect>
		uint32_t rem = offset & 0x1ff;
c0101022:	8b 45 10             	mov    0x10(%ebp),%eax
c0101025:	25 ff 01 00 00       	and    $0x1ff,%eax
c010102a:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c010102d:	b8 00 02 00 00       	mov    $0x200,%eax
c0101032:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0101035:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101038:	8b 45 08             	mov    0x8(%ebp),%eax
c010103b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010103e:	29 c2                	sub    %eax,%edx
c0101040:	89 d0                	mov    %edx,%eax
c0101042:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101045:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101048:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010104b:	39 d0                	cmp    %edx,%eax
c010104d:	76 02                	jbe    c0101051 <readseg+0x61>
c010104f:	89 d0                	mov    %edx,%eax
c0101051:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c0101054:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101057:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c010105d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101060:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0101063:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101067:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010106b:	89 04 24             	mov    %eax,(%esp)
c010106e:	e8 0d 1c 00 00       	call   c0102c80 <memcpy>
		va += size;
c0101073:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101076:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c0101079:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c010107d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101080:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101083:	72 8a                	jb     c010100f <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c0101085:	c9                   	leave  
c0101086:	c3                   	ret    

c0101087 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c0101087:	55                   	push   %ebp
c0101088:	89 e5                	mov    %esp,%ebp
c010108a:	57                   	push   %edi
c010108b:	53                   	push   %ebx
c010108c:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c010108f:	90                   	nop
c0101090:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0101097:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010109a:	89 c2                	mov    %eax,%edx
c010109c:	ec                   	in     (%dx),%al
c010109d:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c01010a0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c01010a4:	0f b6 c0             	movzbl %al,%eax
c01010a7:	25 c0 00 00 00       	and    $0xc0,%eax
c01010ac:	83 f8 40             	cmp    $0x40,%eax
c01010af:	75 df                	jne    c0101090 <readsect+0x9>
c01010b1:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c01010b8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01010bc:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01010c0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01010c3:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c01010c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010c7:	0f b6 c0             	movzbl %al,%eax
c01010ca:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c01010d1:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01010d4:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01010d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01010db:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c01010dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010df:	c1 e8 08             	shr    $0x8,%eax
c01010e2:	0f b6 c0             	movzbl %al,%eax
c01010e5:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c01010ec:	88 45 db             	mov    %al,-0x25(%ebp)
c01010ef:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01010f3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01010f6:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c01010f7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01010fa:	c1 e8 10             	shr    $0x10,%eax
c01010fd:	0f b6 c0             	movzbl %al,%eax
c0101100:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c0101107:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010110a:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c010110e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0101111:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c0101112:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101115:	c1 e8 18             	shr    $0x18,%eax
c0101118:	83 c8 e0             	or     $0xffffffe0,%eax
c010111b:	0f b6 c0             	movzbl %al,%eax
c010111e:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c0101125:	88 45 cb             	mov    %al,-0x35(%ebp)
c0101128:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c010112c:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010112f:	ee                   	out    %al,(%dx)
c0101130:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101137:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c010113b:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010113f:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0101142:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0101143:	90                   	nop
c0101144:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c010114b:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010114e:	89 c2                	mov    %eax,%edx
c0101150:	ec                   	in     (%dx),%al
c0101151:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c0101154:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0101158:	0f b6 c0             	movzbl %al,%eax
c010115b:	25 c0 00 00 00       	and    $0xc0,%eax
c0101160:	83 f8 40             	cmp    $0x40,%eax
c0101163:	75 df                	jne    c0101144 <readsect+0xbd>
c0101165:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c010116c:	8b 45 08             	mov    0x8(%ebp),%eax
c010116f:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0101172:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c0101179:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010117c:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c010117f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0101182:	89 cb                	mov    %ecx,%ebx
c0101184:	89 df                	mov    %ebx,%edi
c0101186:	89 c1                	mov    %eax,%ecx
c0101188:	fc                   	cld    
c0101189:	f2 6d                	repnz insl (%dx),%es:(%edi)
c010118b:	89 c8                	mov    %ecx,%eax
c010118d:	89 fb                	mov    %edi,%ebx
c010118f:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c0101192:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c0101195:	83 c4 50             	add    $0x50,%esp
c0101198:	5b                   	pop    %ebx
c0101199:	5f                   	pop    %edi
c010119a:	5d                   	pop    %ebp
c010119b:	c3                   	ret    

c010119c <pcb_new>:

PCB* pcb_new()
{
c010119c:	55                   	push   %ebp
c010119d:	89 e5                	mov    %esp,%ebp
c010119f:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c01011a2:	e8 7e fc ff ff       	call   c0100e25 <pcb_alloc>
c01011a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c01011aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01011ae:	75 0a                	jne    c01011ba <pcb_new+0x1e>
c01011b0:	b8 00 00 00 00       	mov    $0x0,%eax
c01011b5:	e9 8e 01 00 00       	jmp    c0101348 <pcb_new+0x1ac>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c01011ba:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c01011c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01011c4:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c01011cb:	00 
c01011cc:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01011d3:	00 
c01011d4:	89 04 24             	mov    %eax,(%esp)
c01011d7:	e8 14 fe ff ff       	call   c0100ff0 <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c01011dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01011df:	8b 00                	mov    (%eax),%eax
c01011e1:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c01011e6:	74 24                	je     c010120c <pcb_new+0x70>
c01011e8:	c7 44 24 0c 5a 3c 10 	movl   $0xc0103c5a,0xc(%esp)
c01011ef:	c0 
c01011f0:	c7 44 24 08 a9 3b 10 	movl   $0xc0103ba9,0x8(%esp)
c01011f7:	c0 
c01011f8:	c7 44 24 04 7b 00 00 	movl   $0x7b,0x4(%esp)
c01011ff:	00 
c0101200:	c7 04 24 47 3c 10 c0 	movl   $0xc0103c47,(%esp)
c0101207:	e8 7e 15 00 00       	call   c010278a <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c010120c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010120f:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101212:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101215:	01 d0                	add    %edx,%eax
c0101217:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c010121a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010121d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0101221:	0f b7 c0             	movzwl %ax,%eax
c0101224:	c1 e0 05             	shl    $0x5,%eax
c0101227:	89 c2                	mov    %eax,%edx
c0101229:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010122c:	01 d0                	add    %edx,%eax
c010122e:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c0101231:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101234:	8b 40 04             	mov    0x4(%eax),%eax
c0101237:	89 44 24 08          	mov    %eax,0x8(%esp)
c010123b:	c7 44 24 04 7e 00 00 	movl   $0x7e,0x4(%esp)
c0101242:	00 
c0101243:	c7 04 24 47 3c 10 c0 	movl   $0xc0103c47,(%esp)
c010124a:	e8 7a fa ff ff       	call   c0100cc9 <_paddr>
c010124f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0101252:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101255:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) {
c0101258:	e9 8a 00 00 00       	jmp    c01012e7 <pcb_new+0x14b>
		if (ph -> p_type != ELF_PROG_LOAD) continue;
c010125d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101260:	8b 00                	mov    (%eax),%eax
c0101262:	83 f8 01             	cmp    $0x1,%eax
c0101265:	74 02                	je     c0101269 <pcb_new+0xcd>
c0101267:	eb 7a                	jmp    c01012e3 <pcb_new+0x147>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c0101269:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010126c:	8b 48 14             	mov    0x14(%eax),%ecx
c010126f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101272:	8b 50 08             	mov    0x8(%eax),%edx
c0101275:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101278:	8b 40 04             	mov    0x4(%eax),%eax
c010127b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010127f:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101283:	89 04 24             	mov    %eax,(%esp)
c0101286:	e8 aa fc ff ff       	call   c0100f35 <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c010128b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010128e:	8b 40 04             	mov    0x4(%eax),%eax
c0101291:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c0101297:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010129a:	8b 50 10             	mov    0x10(%eax),%edx
c010129d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012a0:	8b 40 08             	mov    0x8(%eax),%eax
c01012a3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01012a7:	89 54 24 04          	mov    %edx,0x4(%esp)
c01012ab:	89 04 24             	mov    %eax,(%esp)
c01012ae:	e8 3d fd ff ff       	call   c0100ff0 <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c01012b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012b6:	8b 50 14             	mov    0x14(%eax),%edx
c01012b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012bc:	8b 40 10             	mov    0x10(%eax),%eax
c01012bf:	29 c2                	sub    %eax,%edx
c01012c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012c4:	8b 48 08             	mov    0x8(%eax),%ecx
c01012c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012ca:	8b 40 10             	mov    0x10(%eax),%eax
c01012cd:	01 c8                	add    %ecx,%eax
c01012cf:	89 54 24 08          	mov    %edx,0x8(%esp)
c01012d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01012da:	00 
c01012db:	89 04 24             	mov    %eax,(%esp)
c01012de:	e8 ba 19 00 00       	call   c0102c9d <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) {
c01012e3:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01012e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012ea:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01012ed:	0f 82 6a ff ff ff    	jb     c010125d <pcb_new+0xc1>
		if (ph -> p_type != ELF_PROG_LOAD) continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf -> e_entry;
c01012f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01012f6:	8b 00                	mov    (%eax),%eax
c01012f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01012fb:	8b 52 18             	mov    0x18(%edx),%edx
c01012fe:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP - USTACKSIZE, USTACKSIZE);
c0101301:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101304:	8b 40 04             	mov    0x4(%eax),%eax
c0101307:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c010130e:	00 
c010130f:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c0101316:	be 
c0101317:	89 04 24             	mov    %eax,(%esp)
c010131a:	e8 16 fc ff ff       	call   c0100f35 <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c010131f:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101324:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101328:	c7 44 24 04 87 00 00 	movl   $0x87,0x4(%esp)
c010132f:	00 
c0101330:	c7 04 24 47 3c 10 c0 	movl   $0xc0103c47,(%esp)
c0101337:	e8 8d f9 ff ff       	call   c0100cc9 <_paddr>
c010133c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010133f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101342:	0f 22 d8             	mov    %eax,%cr3
	return p;
c0101345:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
c0101348:	c9                   	leave  
c0101349:	c3                   	ret    

c010134a <pcb_deepcopy>:

PCB* pcb_deepcopy(PCB *fa,PCB *tb)
{
c010134a:	55                   	push   %ebp
c010134b:	89 e5                	mov    %esp,%ebp
c010134d:	53                   	push   %ebx
c010134e:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);
c0101351:	c7 45 f4 24 00 00 00 	movl   $0x24,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c0101358:	b8 00 10 00 00       	mov    $0x1000,%eax
c010135d:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0101360:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c0101363:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101366:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0101369:	8b 55 08             	mov    0x8(%ebp),%edx
c010136c:	01 d1                	add    %edx,%ecx
c010136e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c0101371:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101374:	01 da                	add    %ebx,%edx
c0101376:	89 44 24 08          	mov    %eax,0x8(%esp)
c010137a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010137e:	89 14 24             	mov    %edx,(%esp)
c0101381:	e8 fa 18 00 00       	call   c0102c80 <memcpy>
	tb->tf=fa->tf;//tb->kstack+(fa->tf-(void*)fa->kstack);
c0101386:	8b 45 08             	mov    0x8(%ebp),%eax
c0101389:	8b 10                	mov    (%eax),%edx
c010138b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010138e:	89 10                	mov    %edx,(%eax)
	pgdir_copy(fa->pgdir,tb->pgdir);
c0101390:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101393:	8b 50 04             	mov    0x4(%eax),%edx
c0101396:	8b 45 08             	mov    0x8(%ebp),%eax
c0101399:	8b 40 04             	mov    0x4(%eax),%eax
c010139c:	89 54 24 04          	mov    %edx,0x4(%esp)
c01013a0:	89 04 24             	mov    %eax,(%esp)
c01013a3:	e8 aa 08 00 00       	call   c0101c52 <pgdir_copy>
	tb->state=fa->state;
c01013a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01013ab:	8b 50 18             	mov    0x18(%eax),%edx
c01013ae:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013b1:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c01013b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01013b7:	8b 50 1c             	mov    0x1c(%eax),%edx
c01013ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013bd:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c01013c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01013c3:	8b 50 20             	mov    0x20(%eax),%edx
c01013c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013c9:	89 50 20             	mov    %edx,0x20(%eax)
}
c01013cc:	83 c4 24             	add    $0x24,%esp
c01013cf:	5b                   	pop    %ebx
c01013d0:	5d                   	pop    %ebp
c01013d1:	c3                   	ret    

c01013d2 <pcb_remove>:

void pcb_remove(PCB *p)
{
c01013d2:	55                   	push   %ebp
c01013d3:	89 e5                	mov    %esp,%ebp
c01013d5:	83 ec 18             	sub    $0x18,%esp
	pgdir_remove(p->pgdir);
c01013d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01013db:	8b 40 04             	mov    0x4(%eax),%eax
c01013de:	89 04 24             	mov    %eax,(%esp)
c01013e1:	e8 65 0a 00 00       	call   c0101e4b <pgdir_remove>
	p->pgdir=NULL;
c01013e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01013e9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
c01013f0:	c9                   	leave  
c01013f1:	c3                   	ret    

c01013f2 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01013f2:	55                   	push   %ebp
c01013f3:	89 e5                	mov    %esp,%ebp
c01013f5:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01013f8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01013fc:	75 24                	jne    c0101422 <list_add+0x30>
c01013fe:	c7 44 24 0c 74 3c 10 	movl   $0xc0103c74,0xc(%esp)
c0101405:	c0 
c0101406:	c7 44 24 08 81 3c 10 	movl   $0xc0103c81,0x8(%esp)
c010140d:	c0 
c010140e:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0101415:	00 
c0101416:	c7 04 24 96 3c 10 c0 	movl   $0xc0103c96,(%esp)
c010141d:	e8 68 13 00 00       	call   c010278a <_panic>
	data->prev = prev;
c0101422:	8b 45 10             	mov    0x10(%ebp),%eax
c0101425:	8b 55 08             	mov    0x8(%ebp),%edx
c0101428:	89 10                	mov    %edx,(%eax)
	data->next = next;
c010142a:	8b 45 10             	mov    0x10(%ebp),%eax
c010142d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101430:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101433:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101437:	74 09                	je     c0101442 <list_add+0x50>
c0101439:	8b 45 08             	mov    0x8(%ebp),%eax
c010143c:	8b 55 10             	mov    0x10(%ebp),%edx
c010143f:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101442:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101446:	74 08                	je     c0101450 <list_add+0x5e>
c0101448:	8b 45 0c             	mov    0xc(%ebp),%eax
c010144b:	8b 55 10             	mov    0x10(%ebp),%edx
c010144e:	89 10                	mov    %edx,(%eax)
}
c0101450:	c9                   	leave  
c0101451:	c3                   	ret    

c0101452 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101452:	55                   	push   %ebp
c0101453:	89 e5                	mov    %esp,%ebp
c0101455:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101458:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010145c:	75 24                	jne    c0101482 <list_add_before+0x30>
c010145e:	c7 44 24 0c ac 3c 10 	movl   $0xc0103cac,0xc(%esp)
c0101465:	c0 
c0101466:	c7 44 24 08 81 3c 10 	movl   $0xc0103c81,0x8(%esp)
c010146d:	c0 
c010146e:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0101475:	00 
c0101476:	c7 04 24 96 3c 10 c0 	movl   $0xc0103c96,(%esp)
c010147d:	e8 08 13 00 00       	call   c010278a <_panic>
	list_add(one->prev, one, data);
c0101482:	8b 45 08             	mov    0x8(%ebp),%eax
c0101485:	8b 00                	mov    (%eax),%eax
c0101487:	8b 55 0c             	mov    0xc(%ebp),%edx
c010148a:	89 54 24 08          	mov    %edx,0x8(%esp)
c010148e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101491:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101495:	89 04 24             	mov    %eax,(%esp)
c0101498:	e8 55 ff ff ff       	call   c01013f2 <list_add>
}
c010149d:	c9                   	leave  
c010149e:	c3                   	ret    

c010149f <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c010149f:	55                   	push   %ebp
c01014a0:	89 e5                	mov    %esp,%ebp
c01014a2:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c01014a5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01014a9:	75 24                	jne    c01014cf <list_del+0x30>
c01014ab:	c7 44 24 0c 74 3c 10 	movl   $0xc0103c74,0xc(%esp)
c01014b2:	c0 
c01014b3:	c7 44 24 08 81 3c 10 	movl   $0xc0103c81,0x8(%esp)
c01014ba:	c0 
c01014bb:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c01014c2:	00 
c01014c3:	c7 04 24 96 3c 10 c0 	movl   $0xc0103c96,(%esp)
c01014ca:	e8 bb 12 00 00       	call   c010278a <_panic>
	list *prev = data->prev;
c01014cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01014d2:	8b 00                	mov    (%eax),%eax
c01014d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c01014d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01014da:	8b 40 04             	mov    0x4(%eax),%eax
c01014dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c01014e0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01014e4:	74 09                	je     c01014ef <list_del+0x50>
c01014e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014e9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01014ec:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01014ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01014f3:	74 08                	je     c01014fd <list_del+0x5e>
c01014f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01014fb:	89 10                	mov    %edx,(%eax)
}
c01014fd:	c9                   	leave  
c01014fe:	c3                   	ret    

c01014ff <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01014ff:	55                   	push   %ebp
c0101500:	89 e5                	mov    %esp,%ebp
c0101502:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101505:	8b 45 10             	mov    0x10(%ebp),%eax
c0101508:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c010150d:	77 21                	ja     c0101530 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c010150f:	8b 45 10             	mov    0x10(%ebp),%eax
c0101512:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101516:	c7 44 24 08 b8 3c 10 	movl   $0xc0103cb8,0x8(%esp)
c010151d:	c0 
c010151e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101521:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101525:	8b 45 08             	mov    0x8(%ebp),%eax
c0101528:	89 04 24             	mov    %eax,(%esp)
c010152b:	e8 5a 12 00 00       	call   c010278a <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101530:	8b 45 10             	mov    0x10(%ebp),%eax
c0101533:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101538:	c9                   	leave  
c0101539:	c3                   	ret    

c010153a <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
c010153a:	55                   	push   %ebp
c010153b:	89 e5                	mov    %esp,%ebp
c010153d:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c0101540:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101545:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c0101548:	e8 d8 f8 ff ff       	call   c0100e25 <pcb_alloc>
c010154d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_deepcopy(fa,ch);//written in pcb.c
c0101550:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101553:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101557:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010155a:	89 04 24             	mov    %eax,(%esp)
c010155d:	e8 e8 fd ff ff       	call   c010134a <pcb_deepcopy>
	ch->ppid=fa->pid;
c0101562:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101565:	8b 50 10             	mov    0x10(%eax),%edx
c0101568:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010156b:	89 50 14             	mov    %edx,0x14(%eax)
	fa->tf->eax=ch->pid;
c010156e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101571:	8b 00                	mov    (%eax),%eax
c0101573:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101576:	8b 52 10             	mov    0x10(%edx),%edx
c0101579:	89 50 1c             	mov    %edx,0x1c(%eax)
	ch->tf->eax=0;
c010157c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010157f:	8b 00                	mov    (%eax),%eax
c0101581:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c0101588:	c9                   	leave  
c0101589:	c3                   	ret    

c010158a <sys_getpid>:

uint32_t sys_getpid(){
c010158a:	55                   	push   %ebp
c010158b:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c010158d:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101592:	8b 40 10             	mov    0x10(%eax),%eax
}
c0101595:	5d                   	pop    %ebp
c0101596:	c3                   	ret    

c0101597 <sys_exit>:

void sys_exit(int suc){
c0101597:	55                   	push   %ebp
c0101598:	89 e5                	mov    %esp,%ebp
c010159a:	83 ec 28             	sub    $0x28,%esp
	if(suc==0)
c010159d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01015a1:	75 1a                	jne    c01015bd <sys_exit+0x26>
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
c01015a3:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015a8:	8b 40 10             	mov    0x10(%eax),%eax
c01015ab:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015af:	c7 04 24 dc 3c 10 c0 	movl   $0xc0103cdc,(%esp)
c01015b6:	e8 fe 12 00 00       	call   c01028b9 <printk>
c01015bb:	eb 18                	jmp    c01015d5 <sys_exit+0x3e>
	else
		printk("Not teminate the process of pid %d successfully!!!\n",pcbnow->pid);
c01015bd:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015c2:	8b 40 10             	mov    0x10(%eax),%eax
c01015c5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015c9:	c7 04 24 0c 3d 10 c0 	movl   $0xc0103d0c,(%esp)
c01015d0:	e8 e4 12 00 00       	call   c01028b9 <printk>
	list *next;
	list *t=&ready;
c01015d5:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01015dc:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01015e1:	8b 40 04             	mov    0x4(%eax),%eax
c01015e4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01015e7:	75 22                	jne    c010160b <sys_exit+0x74>
 	{
		if(t->next==now)
c01015e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015ec:	8b 50 04             	mov    0x4(%eax),%edx
c01015ef:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01015f4:	39 c2                	cmp    %eax,%edx
c01015f6:	75 08                	jne    c0101600 <sys_exit+0x69>
			next=t;
c01015f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01015fe:	eb 2f                	jmp    c010162f <sys_exit+0x98>
		else
			next=t->next;
c0101600:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101603:	8b 40 04             	mov    0x4(%eax),%eax
c0101606:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101609:	eb 24                	jmp    c010162f <sys_exit+0x98>
	}
	else
	{
		if(now->next==now)
c010160b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101610:	8b 50 04             	mov    0x4(%eax),%edx
c0101613:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101618:	39 c2                	cmp    %eax,%edx
c010161a:	75 08                	jne    c0101624 <sys_exit+0x8d>
			next=t;
c010161c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010161f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101622:	eb 0b                	jmp    c010162f <sys_exit+0x98>
		else
			next=now->next;
c0101624:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101629:	8b 40 04             	mov    0x4(%eax),%eax
c010162c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c010162f:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101634:	89 04 24             	mov    %eax,(%esp)
c0101637:	e8 63 fe ff ff       	call   c010149f <list_del>
	list_add_before(&free,now);
c010163c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101641:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101645:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c010164c:	e8 01 fe ff ff       	call   c0101452 <list_add_before>
	//??lcr3(PADDR(kern_pgdir));
	pcb_remove(pcbnow);
c0101651:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101656:	89 04 24             	mov    %eax,(%esp)
c0101659:	e8 74 fd ff ff       	call   c01013d2 <pcb_remove>
	now=next;
c010165e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101661:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c0101666:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010166b:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c0101670:	75 0c                	jne    c010167e <sys_exit+0xe7>
		pcbnow=&init;
c0101672:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0101679:	3f 16 c0 
c010167c:	eb 0d                	jmp    c010168b <sys_exit+0xf4>
	else
		pcbnow=list_entry(now,PCB,plist);
c010167e:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101683:	83 e8 08             	sub    $0x8,%eax
c0101686:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	lcr3(PADDR(pcbnow->pgdir));
c010168b:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101690:	8b 40 04             	mov    0x4(%eax),%eax
c0101693:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101697:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
c010169e:	00 
c010169f:	c7 04 24 40 3d 10 c0 	movl   $0xc0103d40,(%esp)
c01016a6:	e8 54 fe ff ff       	call   c01014ff <_paddr>
c01016ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01016ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01016b1:	0f 22 d8             	mov    %eax,%cr3
}
c01016b4:	c9                   	leave  
c01016b5:	c3                   	ret    

c01016b6 <sys_sleep>:

void sys_sleep(int time){
c01016b6:	55                   	push   %ebp
c01016b7:	89 e5                	mov    %esp,%ebp
c01016b9:	83 ec 28             	sub    $0x28,%esp
	list *next;
	list *t=&ready;
c01016bc:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c01016c3:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016c8:	8b 40 04             	mov    0x4(%eax),%eax
c01016cb:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01016ce:	75 22                	jne    c01016f2 <sys_sleep+0x3c>
	{
		if(t->next==now)
c01016d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016d3:	8b 50 04             	mov    0x4(%eax),%edx
c01016d6:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016db:	39 c2                	cmp    %eax,%edx
c01016dd:	75 08                	jne    c01016e7 <sys_sleep+0x31>
			next=t;
c01016df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016e5:	eb 2f                	jmp    c0101716 <sys_sleep+0x60>
		else
			next=t->next;
c01016e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016ea:	8b 40 04             	mov    0x4(%eax),%eax
c01016ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016f0:	eb 24                	jmp    c0101716 <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c01016f2:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016f7:	8b 50 04             	mov    0x4(%eax),%edx
c01016fa:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016ff:	39 c2                	cmp    %eax,%edx
c0101701:	75 08                	jne    c010170b <sys_sleep+0x55>
			next=t;
c0101703:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101706:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101709:	eb 0b                	jmp    c0101716 <sys_sleep+0x60>
		else
			next=now->next;
c010170b:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101710:	8b 40 04             	mov    0x4(%eax),%eax
c0101713:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c0101716:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010171b:	89 04 24             	mov    %eax,(%esp)
c010171e:	e8 7c fd ff ff       	call   c010149f <list_del>
	list_add_before(&block,now);
c0101723:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101728:	89 44 24 04          	mov    %eax,0x4(%esp)
c010172c:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0101733:	e8 1a fd ff ff       	call   c0101452 <list_add_before>
	pcbnow->state=BLOCKED;
c0101738:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010173d:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c0101744:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c010174a:	8b 45 08             	mov    0x8(%ebp),%eax
c010174d:	c1 e0 02             	shl    $0x2,%eax
c0101750:	89 c1                	mov    %eax,%ecx
c0101752:	c1 e1 04             	shl    $0x4,%ecx
c0101755:	29 c1                	sub    %eax,%ecx
c0101757:	89 c8                	mov    %ecx,%eax
c0101759:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=next;
c010175c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010175f:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c0101764:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101769:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c010176e:	75 0c                	jne    c010177c <sys_sleep+0xc6>
		pcbnow=&init;
c0101770:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0101777:	3f 16 c0 
c010177a:	eb 0d                	jmp    c0101789 <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c010177c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101781:	83 e8 08             	sub    $0x8,%eax
c0101784:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	lcr3(PADDR(pcbnow->pgdir));
c0101789:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c010178e:	8b 40 04             	mov    0x4(%eax),%eax
c0101791:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101795:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c010179c:	00 
c010179d:	c7 04 24 40 3d 10 c0 	movl   $0xc0103d40,(%esp)
c01017a4:	e8 56 fd ff ff       	call   c01014ff <_paddr>
c01017a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01017ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01017af:	0f 22 d8             	mov    %eax,%cr3
}
c01017b2:	c9                   	leave  
c01017b3:	c3                   	ret    

c01017b4 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01017b4:	55                   	push   %ebp
c01017b5:	89 e5                	mov    %esp,%ebp
c01017b7:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01017ba:	8b 45 10             	mov    0x10(%ebp),%eax
c01017bd:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01017c2:	77 21                	ja     c01017e5 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01017c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01017c7:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01017cb:	c7 44 24 08 5c 3d 10 	movl   $0xc0103d5c,0x8(%esp)
c01017d2:	c0 
c01017d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017d6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017da:	8b 45 08             	mov    0x8(%ebp),%eax
c01017dd:	89 04 24             	mov    %eax,(%esp)
c01017e0:	e8 a5 0f 00 00       	call   c010278a <_panic>
	return (physaddr_t)kva - KERNBASE;
c01017e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01017e8:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01017ed:	c9                   	leave  
c01017ee:	c3                   	ret    

c01017ef <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c01017ef:	55                   	push   %ebp
c01017f0:	89 e5                	mov    %esp,%ebp
c01017f2:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c01017f5:	8b 45 10             	mov    0x10(%ebp),%eax
c01017f8:	c1 e8 0c             	shr    $0xc,%eax
c01017fb:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101800:	76 21                	jbe    c0101823 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0101802:	8b 45 10             	mov    0x10(%ebp),%eax
c0101805:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101809:	c7 44 24 08 80 3d 10 	movl   $0xc0103d80,0x8(%esp)
c0101810:	c0 
c0101811:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101814:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101818:	8b 45 08             	mov    0x8(%ebp),%eax
c010181b:	89 04 24             	mov    %eax,(%esp)
c010181e:	e8 67 0f 00 00       	call   c010278a <_panic>
	return (void *)(pa + KERNBASE);
c0101823:	8b 45 10             	mov    0x10(%ebp),%eax
c0101826:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c010182b:	c9                   	leave  
c010182c:	c3                   	ret    

c010182d <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c010182d:	55                   	push   %ebp
c010182e:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0101830:	8b 55 08             	mov    0x8(%ebp),%edx
c0101833:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0101838:	29 c2                	sub    %eax,%edx
c010183a:	89 d0                	mov    %edx,%eax
c010183c:	c1 f8 03             	sar    $0x3,%eax
c010183f:	c1 e0 0c             	shl    $0xc,%eax
}
c0101842:	5d                   	pop    %ebp
c0101843:	c3                   	ret    

c0101844 <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c0101844:	55                   	push   %ebp
c0101845:	89 e5                	mov    %esp,%ebp
c0101847:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c010184a:	8b 45 08             	mov    0x8(%ebp),%eax
c010184d:	c1 e8 0c             	shr    $0xc,%eax
c0101850:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101855:	76 1c                	jbe    c0101873 <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c0101857:	c7 44 24 08 a4 3d 10 	movl   $0xc0103da4,0x8(%esp)
c010185e:	c0 
c010185f:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c0101866:	00 
c0101867:	c7 04 24 c3 3d 10 c0 	movl   $0xc0103dc3,(%esp)
c010186e:	e8 17 0f 00 00       	call   c010278a <_panic>
	return &pages[PGNUM(pa)];
c0101873:	8b 45 08             	mov    0x8(%ebp),%eax
c0101876:	c1 e8 0c             	shr    $0xc,%eax
c0101879:	c1 e0 03             	shl    $0x3,%eax
c010187c:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c0101881:	c9                   	leave  
c0101882:	c3                   	ret    

c0101883 <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c0101883:	55                   	push   %ebp
c0101884:	89 e5                	mov    %esp,%ebp
c0101886:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101889:	8b 45 08             	mov    0x8(%ebp),%eax
c010188c:	89 04 24             	mov    %eax,(%esp)
c010188f:	e8 99 ff ff ff       	call   c010182d <page2pa>
c0101894:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101898:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c010189f:	00 
c01018a0:	c7 04 24 c3 3d 10 c0 	movl   $0xc0103dc3,(%esp)
c01018a7:	e8 43 ff ff ff       	call   c01017ef <_kaddr>
}
c01018ac:	c9                   	leave  
c01018ad:	c3                   	ret    

c01018ae <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c01018ae:	55                   	push   %ebp
c01018af:	89 e5                	mov    %esp,%ebp
c01018b1:	53                   	push   %ebx
c01018b2:	83 ec 54             	sub    $0x54,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
c01018b5:	c7 45 e4 00 30 13 c0 	movl   $0xc0133000,-0x1c(%ebp)
	pte_t *pgtable = kpgtable;
c01018bc:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c01018c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01018ca:	eb 40                	jmp    c010190c <page_init+0x5e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
c01018cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018cf:	05 00 03 00 00       	add    $0x300,%eax
c01018d4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01018db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01018de:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01018e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01018e4:	89 44 24 08          	mov    %eax,0x8(%esp)
c01018e8:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c01018ef:	00 
c01018f0:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c01018f7:	e8 b8 fe ff ff       	call   c01017b4 <_paddr>
c01018fc:	83 c8 03             	or     $0x3,%eax
c01018ff:	89 03                	mov    %eax,(%ebx)
		pgtable += NPTENTRIES;
c0101901:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
	pte_t *pgtable = kpgtable;
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c0101908:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010190c:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101910:	7e ba                	jle    c01018cc <page_init+0x1e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
c0101912:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgtable--;
c0101919:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c010191d:	eb 18                	jmp    c0101937 <page_init+0x89>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
c010191f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101922:	83 c8 07             	or     $0x7,%eax
c0101925:	89 c2                	mov    %eax,%edx
c0101927:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010192a:	89 10                	mov    %edx,(%eax)
		pgtable --;
c010192c:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
	pgtable--;
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c0101930:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c0101937:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010193b:	79 e2                	jns    c010191f <page_init+0x71>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
		pgtable --;
	}
	kern_pgdir = pgdir;
c010193d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101940:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c0101945:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010194a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010194e:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c0101955:	00 
c0101956:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c010195d:	e8 52 fe ff ff       	call   c01017b4 <_paddr>
c0101962:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101965:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101968:	0f 22 d8             	mov    %eax,%cr3
	unsigned long i;
	int base = 0x400;
c010196b:	c7 45 e0 00 04 00 00 	movl   $0x400,-0x20(%ebp)
	for (i = 0; i < base; i++) {
c0101972:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101979:	eb 11                	jmp    c010198c <page_init+0xde>
		pages[i].pp_ref = 1;
c010197b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010197e:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c0101985:	c0 01 00 
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
c0101988:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010198c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010198f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101992:	77 e7                	ja     c010197b <page_init+0xcd>
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101994:	c7 45 e8 ff 7f 00 00 	movl   $0x7fff,-0x18(%ebp)
c010199b:	eb 31                	jmp    c01019ce <page_init+0x120>
		pages[i].pp_ref = 0;
c010199d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01019a0:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c01019a7:	c0 00 00 
		pages[i].pp_link = page_free_list;
c01019aa:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c01019b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01019b3:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c01019ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01019bd:	c1 e0 03             	shl    $0x3,%eax
c01019c0:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c01019c5:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c01019ca:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c01019ce:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01019d1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01019d4:	76 c7                	jbe    c010199d <page_init+0xef>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, KSTACKTOP-KSTKSIZE, KSTKSIZE, PADDR(bootstack), (PTE_W | PTE_P));
c01019d6:	c7 44 24 08 00 90 10 	movl   $0xc0109000,0x8(%esp)
c01019dd:	c0 
c01019de:	c7 44 24 04 5b 00 00 	movl   $0x5b,0x4(%esp)
c01019e5:	00 
c01019e6:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c01019ed:	e8 c2 fd ff ff       	call   c01017b4 <_paddr>
c01019f2:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c01019f8:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c01019ff:	00 
c0101a00:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101a04:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101a0b:	00 
c0101a0c:	c7 44 24 04 00 80 ff 	movl   $0xbfff8000,0x4(%esp)
c0101a13:	bf 
c0101a14:	89 14 24             	mov    %edx,(%esp)
c0101a17:	e8 76 05 00 00       	call   c0101f92 <boot_map_region>
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101a1c:	c7 45 dc 00 10 00 00 	movl   $0x1000,-0x24(%ebp)
c0101a23:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a26:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101a2b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101a2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101a31:	ba 00 00 00 00       	mov    $0x0,%edx
c0101a36:	f7 75 dc             	divl   -0x24(%ebp)
c0101a39:	89 d0                	mov    %edx,%eax
c0101a3b:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a3e:	29 c2                	sub    %eax,%edx
c0101a40:	89 d0                	mov    %edx,%eax
c0101a42:	89 c2                	mov    %eax,%edx
c0101a44:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101a49:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101a50:	00 
c0101a51:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101a58:	00 
c0101a59:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a5d:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101a64:	00 
c0101a65:	89 04 24             	mov    %eax,(%esp)
c0101a68:	e8 25 05 00 00       	call   c0101f92 <boot_map_region>
}
c0101a6d:	83 c4 54             	add    $0x54,%esp
c0101a70:	5b                   	pop    %ebx
c0101a71:	5d                   	pop    %ebp
c0101a72:	c3                   	ret    

c0101a73 <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101a73:	55                   	push   %ebp
c0101a74:	89 e5                	mov    %esp,%ebp
c0101a76:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101a79:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101a7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101a81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101a85:	75 07                	jne    c0101a8e <page_alloc+0x1b>
c0101a87:	b8 00 00 00 00       	mov    $0x0,%eax
c0101a8c:	eb 45                	jmp    c0101ad3 <page_alloc+0x60>
	if (alloc_flags & ALLOC_ZERO) {
c0101a8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a91:	83 e0 01             	and    $0x1,%eax
c0101a94:	85 c0                	test   %eax,%eax
c0101a96:	74 23                	je     c0101abb <page_alloc+0x48>
		memset(page2kva(p), 0, PGSIZE);
c0101a98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a9b:	89 04 24             	mov    %eax,(%esp)
c0101a9e:	e8 e0 fd ff ff       	call   c0101883 <page2kva>
c0101aa3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101aaa:	00 
c0101aab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101ab2:	00 
c0101ab3:	89 04 24             	mov    %eax,(%esp)
c0101ab6:	e8 e2 11 00 00       	call   c0102c9d <memset>
	}
	page_free_list = page_free_list -> pp_link;
c0101abb:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101ac0:	8b 00                	mov    (%eax),%eax
c0101ac2:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	p -> pp_link = NULL;
c0101ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101aca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101ad0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101ad3:	c9                   	leave  
c0101ad4:	c3                   	ret    

c0101ad5 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101ad5:	55                   	push   %ebp
c0101ad6:	89 e5                	mov    %esp,%ebp
c0101ad8:	83 ec 18             	sub    $0x18,%esp
	assert(pp->pp_ref == 0 && pp->pp_link == NULL);
c0101adb:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ade:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101ae2:	66 85 c0             	test   %ax,%ax
c0101ae5:	75 09                	jne    c0101af0 <page_free+0x1b>
c0101ae7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aea:	8b 00                	mov    (%eax),%eax
c0101aec:	85 c0                	test   %eax,%eax
c0101aee:	74 24                	je     c0101b14 <page_free+0x3f>
c0101af0:	c7 44 24 0c f0 3d 10 	movl   $0xc0103df0,0xc(%esp)
c0101af7:	c0 
c0101af8:	c7 44 24 08 17 3e 10 	movl   $0xc0103e17,0x8(%esp)
c0101aff:	c0 
c0101b00:	c7 44 24 04 7c 00 00 	movl   $0x7c,0x4(%esp)
c0101b07:	00 
c0101b08:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101b0f:	e8 76 0c 00 00       	call   c010278a <_panic>
	pp->pp_link = page_free_list;
c0101b14:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101b1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b1d:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101b1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b22:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101b27:	c9                   	leave  
c0101b28:	c3                   	ret    

c0101b29 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0101b29:	55                   	push   %ebp
c0101b2a:	89 e5                	mov    %esp,%ebp
c0101b2c:	83 ec 18             	sub    $0x18,%esp
	if (--pp->pp_ref == 0)
c0101b2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b32:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b36:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101b39:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b3c:	66 89 50 04          	mov    %dx,0x4(%eax)
c0101b40:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b43:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b47:	66 85 c0             	test   %ax,%ax
c0101b4a:	75 0b                	jne    c0101b57 <page_decref+0x2e>
		page_free(pp);
c0101b4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b4f:	89 04 24             	mov    %eax,(%esp)
c0101b52:	e8 7e ff ff ff       	call   c0101ad5 <page_free>
}
c0101b57:	c9                   	leave  
c0101b58:	c3                   	ret    

c0101b59 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0101b59:	55                   	push   %ebp
c0101b5a:	89 e5                	mov    %esp,%ebp
c0101b5c:	53                   	push   %ebx
c0101b5d:	83 ec 24             	sub    $0x24,%esp
	pte_t *pgtable;
	int pdx = PDX(va);
c0101b60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b63:	c1 e8 16             	shr    $0x16,%eax
c0101b66:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pgdir[pdx] & PTE_P) {
c0101b69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101b6c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101b73:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b76:	01 d0                	add    %edx,%eax
c0101b78:	8b 00                	mov    (%eax),%eax
c0101b7a:	83 e0 01             	and    $0x1,%eax
c0101b7d:	85 c0                	test   %eax,%eax
c0101b7f:	74 33                	je     c0101bb4 <pgdir_walk+0x5b>
		pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
c0101b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101b84:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101b8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b8e:	01 d0                	add    %edx,%eax
c0101b90:	8b 00                	mov    (%eax),%eax
c0101b92:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101b97:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101b9b:	c7 44 24 04 a8 00 00 	movl   $0xa8,0x4(%esp)
c0101ba2:	00 
c0101ba3:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101baa:	e8 40 fc ff ff       	call   c01017ef <_kaddr>
c0101baf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bb2:	eb 7b                	jmp    c0101c2f <pgdir_walk+0xd6>
	}
	else {
		if (create == false) return NULL;
c0101bb4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101bb8:	75 0a                	jne    c0101bc4 <pgdir_walk+0x6b>
c0101bba:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bbf:	e9 88 00 00 00       	jmp    c0101c4c <pgdir_walk+0xf3>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0101bc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101bcb:	e8 a3 fe ff ff       	call   c0101a73 <page_alloc>
c0101bd0:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (p == NULL) return NULL;
c0101bd3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101bd7:	75 07                	jne    c0101be0 <pgdir_walk+0x87>
c0101bd9:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bde:	eb 6c                	jmp    c0101c4c <pgdir_walk+0xf3>
		pgtable = page2kva(p);
c0101be0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101be3:	89 04 24             	mov    %eax,(%esp)
c0101be6:	e8 98 fc ff ff       	call   c0101883 <page2kva>
c0101beb:	89 45 f4             	mov    %eax,-0xc(%ebp)
		p -> pp_ref ++;
c0101bee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101bf1:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101bf5:	8d 50 01             	lea    0x1(%eax),%edx
c0101bf8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101bfb:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[pdx] = PADDR(pgtable) | PTE_P | PTE_W | PTE_U;
c0101bff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101c02:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c09:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c0c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c12:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101c16:	c7 44 24 04 b0 00 00 	movl   $0xb0,0x4(%esp)
c0101c1d:	00 
c0101c1e:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101c25:	e8 8a fb ff ff       	call   c01017b4 <_paddr>
c0101c2a:	83 c8 07             	or     $0x7,%eax
c0101c2d:	89 03                	mov    %eax,(%ebx)
	}
	int ptx = PTX(va);
c0101c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c32:	c1 e8 0c             	shr    $0xc,%eax
c0101c35:	25 ff 03 00 00       	and    $0x3ff,%eax
c0101c3a:	89 45 e8             	mov    %eax,-0x18(%ebp)
	return &pgtable[ptx];
c0101c3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c40:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c4a:	01 d0                	add    %edx,%eax

}
c0101c4c:	83 c4 24             	add    $0x24,%esp
c0101c4f:	5b                   	pop    %ebx
c0101c50:	5d                   	pop    %ebp
c0101c51:	c3                   	ret    

c0101c52 <pgdir_copy>:

void pgdir_copy(pde_t *src, pde_t *dst)
{
c0101c52:	55                   	push   %ebp
c0101c53:	89 e5                	mov    %esp,%ebp
c0101c55:	53                   	push   %ebx
c0101c56:	83 ec 34             	sub    $0x34,%esp
	struct Page *pp;
	int pdx, ptx;
	for (pdx = 0; pdx < 1024; pdx++) {
c0101c59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101c60:	e9 d3 01 00 00       	jmp    c0101e38 <pgdir_copy+0x1e6>
		if (src[pdx] & PTE_P) {	
c0101c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c68:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c72:	01 d0                	add    %edx,%eax
c0101c74:	8b 00                	mov    (%eax),%eax
c0101c76:	83 e0 01             	and    $0x1,%eax
c0101c79:	85 c0                	test   %eax,%eax
c0101c7b:	0f 84 b3 01 00 00    	je     c0101e34 <pgdir_copy+0x1e2>
			if (dst[pdx] & PTE_P) continue;
c0101c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c84:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c8e:	01 d0                	add    %edx,%eax
c0101c90:	8b 00                	mov    (%eax),%eax
c0101c92:	83 e0 01             	and    $0x1,%eax
c0101c95:	85 c0                	test   %eax,%eax
c0101c97:	74 05                	je     c0101c9e <pgdir_copy+0x4c>
c0101c99:	e9 96 01 00 00       	jmp    c0101e34 <pgdir_copy+0x1e2>
			pte_t *src_table = KADDR(PTE_ADDR(src[pdx]));
c0101c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ca1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ca8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cab:	01 d0                	add    %edx,%eax
c0101cad:	8b 00                	mov    (%eax),%eax
c0101caf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101cb4:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101cb8:	c7 44 24 04 be 00 00 	movl   $0xbe,0x4(%esp)
c0101cbf:	00 
c0101cc0:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101cc7:	e8 23 fb ff ff       	call   c01017ef <_kaddr>
c0101ccc:	89 45 ec             	mov    %eax,-0x14(%ebp)
			pp = page_alloc(ALLOC_ZERO);
c0101ccf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101cd6:	e8 98 fd ff ff       	call   c0101a73 <page_alloc>
c0101cdb:	89 45 e8             	mov    %eax,-0x18(%ebp)
			pp->pp_ref ++;
c0101cde:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ce1:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101ce5:	8d 50 01             	lea    0x1(%eax),%edx
c0101ce8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ceb:	66 89 50 04          	mov    %dx,0x4(%eax)
			dst[pdx] = page2pa(pp) | (src[pdx]&0xFFF);
c0101cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101cf2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101cf9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cfc:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101cff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d02:	89 04 24             	mov    %eax,(%esp)
c0101d05:	e8 23 fb ff ff       	call   c010182d <page2pa>
c0101d0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101d0d:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101d14:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d17:	01 ca                	add    %ecx,%edx
c0101d19:	8b 12                	mov    (%edx),%edx
c0101d1b:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101d21:	09 d0                	or     %edx,%eax
c0101d23:	89 03                	mov    %eax,(%ebx)
			pte_t *dst_table = KADDR(dst[pdx]&0xFFF);
c0101d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d28:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d32:	01 d0                	add    %edx,%eax
c0101d34:	8b 00                	mov    (%eax),%eax
c0101d36:	25 ff 0f 00 00       	and    $0xfff,%eax
c0101d3b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d3f:	c7 44 24 04 c2 00 00 	movl   $0xc2,0x4(%esp)
c0101d46:	00 
c0101d47:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101d4e:	e8 9c fa ff ff       	call   c01017ef <_kaddr>
c0101d53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (ptx = 0; ptx < 1024; ptx++) { 
c0101d56:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101d5d:	e9 c5 00 00 00       	jmp    c0101e27 <pgdir_copy+0x1d5>
				if (src_table[ptx] & PTE_P) { 
c0101d62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101d65:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d6f:	01 d0                	add    %edx,%eax
c0101d71:	8b 00                	mov    (%eax),%eax
c0101d73:	83 e0 01             	and    $0x1,%eax
c0101d76:	85 c0                	test   %eax,%eax
c0101d78:	0f 84 a5 00 00 00    	je     c0101e23 <pgdir_copy+0x1d1>
					pp = page_alloc(0);
c0101d7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101d85:	e8 e9 fc ff ff       	call   c0101a73 <page_alloc>
c0101d8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
					pp->pp_ref ++;
c0101d8d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d90:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101d94:	8d 50 01             	lea    0x1(%eax),%edx
c0101d97:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d9a:	66 89 50 04          	mov    %dx,0x4(%eax)
					dst_table[ptx] = page2pa(pp) | (src_table[ptx]&0xFFF);
c0101d9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101da1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101da8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101dab:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101dae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101db1:	89 04 24             	mov    %eax,(%esp)
c0101db4:	e8 74 fa ff ff       	call   c010182d <page2pa>
c0101db9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101dbc:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101dc3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101dc6:	01 ca                	add    %ecx,%edx
c0101dc8:	8b 12                	mov    (%edx),%edx
c0101dca:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101dd0:	09 d0                	or     %edx,%eax
c0101dd2:	89 03                	mov    %eax,(%ebx)
					memcpy(page2kva(pp), KADDR(PTE_ADDR(src_table[ptx])), PGSIZE);
c0101dd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101dd7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101dde:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101de1:	01 d0                	add    %edx,%eax
c0101de3:	8b 00                	mov    (%eax),%eax
c0101de5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101dea:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101dee:	c7 44 24 04 c8 00 00 	movl   $0xc8,0x4(%esp)
c0101df5:	00 
c0101df6:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101dfd:	e8 ed f9 ff ff       	call   c01017ef <_kaddr>
c0101e02:	89 c3                	mov    %eax,%ebx
c0101e04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e07:	89 04 24             	mov    %eax,(%esp)
c0101e0a:	e8 74 fa ff ff       	call   c0101883 <page2kva>
c0101e0f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101e16:	00 
c0101e17:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0101e1b:	89 04 24             	mov    %eax,(%esp)
c0101e1e:	e8 5d 0e 00 00       	call   c0102c80 <memcpy>
			pte_t *src_table = KADDR(PTE_ADDR(src[pdx]));
			pp = page_alloc(ALLOC_ZERO);
			pp->pp_ref ++;
			dst[pdx] = page2pa(pp) | (src[pdx]&0xFFF);
			pte_t *dst_table = KADDR(dst[pdx]&0xFFF);
			for (ptx = 0; ptx < 1024; ptx++) { 
c0101e23:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101e27:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101e2e:	0f 8e 2e ff ff ff    	jle    c0101d62 <pgdir_copy+0x110>

void pgdir_copy(pde_t *src, pde_t *dst)
{
	struct Page *pp;
	int pdx, ptx;
	for (pdx = 0; pdx < 1024; pdx++) {
c0101e34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e38:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101e3f:	0f 8e 20 fe ff ff    	jle    c0101c65 <pgdir_copy+0x13>
					memcpy(page2kva(pp), KADDR(PTE_ADDR(src_table[ptx])), PGSIZE);
				}
			}
		}
	}
}
c0101e45:	83 c4 34             	add    $0x34,%esp
c0101e48:	5b                   	pop    %ebx
c0101e49:	5d                   	pop    %ebp
c0101e4a:	c3                   	ret    

c0101e4b <pgdir_remove>:
void pgdir_remove(pde_t *pgdir)
{
c0101e4b:	55                   	push   %ebp
c0101e4c:	89 e5                	mov    %esp,%ebp
c0101e4e:	83 ec 28             	sub    $0x28,%esp
	int pdx, ptx;
	for (pdx = 0; pdx < 1024; pdx++) {
c0101e51:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e58:	e9 fb 00 00 00       	jmp    c0101f58 <pgdir_remove+0x10d>
		if (pgdir[pdx] & PTE_P) {
c0101e5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e60:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e67:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e6a:	01 d0                	add    %edx,%eax
c0101e6c:	8b 00                	mov    (%eax),%eax
c0101e6e:	83 e0 01             	and    $0x1,%eax
c0101e71:	85 c0                	test   %eax,%eax
c0101e73:	0f 84 db 00 00 00    	je     c0101f54 <pgdir_remove+0x109>
			if (kern_pgdir[pdx] & PTE_P) continue;
c0101e79:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101e7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101e81:	c1 e2 02             	shl    $0x2,%edx
c0101e84:	01 d0                	add    %edx,%eax
c0101e86:	8b 00                	mov    (%eax),%eax
c0101e88:	83 e0 01             	and    $0x1,%eax
c0101e8b:	85 c0                	test   %eax,%eax
c0101e8d:	74 05                	je     c0101e94 <pgdir_remove+0x49>
c0101e8f:	e9 c0 00 00 00       	jmp    c0101f54 <pgdir_remove+0x109>
			pte_t *pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
c0101e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e97:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ea1:	01 d0                	add    %edx,%eax
c0101ea3:	8b 00                	mov    (%eax),%eax
c0101ea5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101eaa:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101eae:	c7 44 24 04 d4 00 00 	movl   $0xd4,0x4(%esp)
c0101eb5:	00 
c0101eb6:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101ebd:	e8 2d f9 ff ff       	call   c01017ef <_kaddr>
c0101ec2:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (ptx = 0; ptx < NPTENTRIES; ++ptx) {
c0101ec5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ecc:	eb 42                	jmp    c0101f10 <pgdir_remove+0xc5>
				if (pgtable[ptx] & PTE_P) {
c0101ece:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ed1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ed8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101edb:	01 d0                	add    %edx,%eax
c0101edd:	8b 00                	mov    (%eax),%eax
c0101edf:	83 e0 01             	and    $0x1,%eax
c0101ee2:	85 c0                	test   %eax,%eax
c0101ee4:	74 26                	je     c0101f0c <pgdir_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[ptx])));
c0101ee6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ee9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ef0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ef3:	01 d0                	add    %edx,%eax
c0101ef5:	8b 00                	mov    (%eax),%eax
c0101ef7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101efc:	89 04 24             	mov    %eax,(%esp)
c0101eff:	e8 40 f9 ff ff       	call   c0101844 <pa2page>
c0101f04:	89 04 24             	mov    %eax,(%esp)
c0101f07:	e8 1d fc ff ff       	call   c0101b29 <page_decref>
	int pdx, ptx;
	for (pdx = 0; pdx < 1024; pdx++) {
		if (pgdir[pdx] & PTE_P) {
			if (kern_pgdir[pdx] & PTE_P) continue;
			pte_t *pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
			for (ptx = 0; ptx < NPTENTRIES; ++ptx) {
c0101f0c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f10:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101f17:	7e b5                	jle    c0101ece <pgdir_remove+0x83>
				if (pgtable[ptx] & PTE_P) {
					page_decref(pa2page(PTE_ADDR(pgtable[ptx])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[pdx])));
c0101f19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f1c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f23:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f26:	01 d0                	add    %edx,%eax
c0101f28:	8b 00                	mov    (%eax),%eax
c0101f2a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101f2f:	89 04 24             	mov    %eax,(%esp)
c0101f32:	e8 0d f9 ff ff       	call   c0101844 <pa2page>
c0101f37:	89 04 24             	mov    %eax,(%esp)
c0101f3a:	e8 ea fb ff ff       	call   c0101b29 <page_decref>
			pgdir[pdx] = 0;
c0101f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f42:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f49:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f4c:	01 d0                	add    %edx,%eax
c0101f4e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
void pgdir_remove(pde_t *pgdir)
{
	int pdx, ptx;
	for (pdx = 0; pdx < 1024; pdx++) {
c0101f54:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101f58:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101f5f:	0f 8e f8 fe ff ff    	jle    c0101e5d <pgdir_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[pdx])));
			pgdir[pdx] = 0;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c0101f65:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f68:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101f6c:	c7 44 24 04 de 00 00 	movl   $0xde,0x4(%esp)
c0101f73:	00 
c0101f74:	c7 04 24 d9 3d 10 c0 	movl   $0xc0103dd9,(%esp)
c0101f7b:	e8 34 f8 ff ff       	call   c01017b4 <_paddr>
c0101f80:	89 04 24             	mov    %eax,(%esp)
c0101f83:	e8 bc f8 ff ff       	call   c0101844 <pa2page>
c0101f88:	89 04 24             	mov    %eax,(%esp)
c0101f8b:	e8 99 fb ff ff       	call   c0101b29 <page_decref>
}
c0101f90:	c9                   	leave  
c0101f91:	c3                   	ret    

c0101f92 <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c0101f92:	55                   	push   %ebp
c0101f93:	89 e5                	mov    %esp,%ebp
c0101f95:	83 ec 28             	sub    $0x28,%esp
	int i,n;
	n=size/PGSIZE;
c0101f98:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f9b:	c1 e8 0c             	shr    $0xc,%eax
c0101f9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (i = 0; i < n; i ++) {
c0101fa1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101fa8:	eb 47                	jmp    c0101ff1 <boot_map_region+0x5f>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0101faa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fad:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101fb4:	00 
c0101fb5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101fb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fbc:	89 04 24             	mov    %eax,(%esp)
c0101fbf:	e8 95 fb ff ff       	call   c0101b59 <pgdir_walk>
c0101fc4:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (pte == NULL) return;
c0101fc7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101fcb:	75 02                	jne    c0101fcf <boot_map_region+0x3d>
c0101fcd:	eb 2a                	jmp    c0101ff9 <boot_map_region+0x67>
		*pte = pa | perm | PTE_P;
c0101fcf:	8b 45 18             	mov    0x18(%ebp),%eax
c0101fd2:	0b 45 14             	or     0x14(%ebp),%eax
c0101fd5:	83 c8 01             	or     $0x1,%eax
c0101fd8:	89 c2                	mov    %eax,%edx
c0101fda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101fdd:	89 10                	mov    %edx,(%eax)
		va += PGSIZE;
c0101fdf:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa += PGSIZE;
c0101fe6:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i,n;
	n=size/PGSIZE;
	for (i = 0; i < n; i ++) {
c0101fed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101ff1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ff4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101ff7:	7c b1                	jl     c0101faa <boot_map_region+0x18>
		if (pte == NULL) return;
		*pte = pa | perm | PTE_P;
		va += PGSIZE;
		pa += PGSIZE;
	}
}
c0101ff9:	c9                   	leave  
c0101ffa:	c3                   	ret    

c0101ffb <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c0101ffb:	55                   	push   %ebp
c0101ffc:	89 e5                	mov    %esp,%ebp
c0101ffe:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, true);
c0102001:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0102008:	00 
c0102009:	8b 45 10             	mov    0x10(%ebp),%eax
c010200c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102010:	8b 45 08             	mov    0x8(%ebp),%eax
c0102013:	89 04 24             	mov    %eax,(%esp)
c0102016:	e8 3e fb ff ff       	call   c0101b59 <pgdir_walk>
c010201b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c010201e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102022:	75 07                	jne    c010202b <page_insert+0x30>
		return -1;
c0102024:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102029:	eb 73                	jmp    c010209e <page_insert+0xa3>
	}
	physaddr_t pa = page2pa(pp);
c010202b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010202e:	89 04 24             	mov    %eax,(%esp)
c0102031:	e8 f7 f7 ff ff       	call   c010182d <page2pa>
c0102036:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (*pte & PTE_P) {
c0102039:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010203c:	8b 00                	mov    (%eax),%eax
c010203e:	83 e0 01             	and    $0x1,%eax
c0102041:	85 c0                	test   %eax,%eax
c0102043:	74 33                	je     c0102078 <page_insert+0x7d>
		if (PTE_ADDR(*pte) == pa) {
c0102045:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102048:	8b 00                	mov    (%eax),%eax
c010204a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010204f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0102052:	75 12                	jne    c0102066 <page_insert+0x6b>
			*pte = pa | perm | PTE_P;
c0102054:	8b 45 14             	mov    0x14(%ebp),%eax
c0102057:	0b 45 f0             	or     -0x10(%ebp),%eax
c010205a:	83 c8 01             	or     $0x1,%eax
c010205d:	89 c2                	mov    %eax,%edx
c010205f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102062:	89 10                	mov    %edx,(%eax)
c0102064:	eb 12                	jmp    c0102078 <page_insert+0x7d>
		}
		else {
			page_remove(pgdir, va);
c0102066:	8b 45 10             	mov    0x10(%ebp),%eax
c0102069:	89 44 24 04          	mov    %eax,0x4(%esp)
c010206d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102070:	89 04 24             	mov    %eax,(%esp)
c0102073:	e8 7a 00 00 00       	call   c01020f2 <page_remove>
		}
	}
	*pte = pa | perm | PTE_P;
c0102078:	8b 45 14             	mov    0x14(%ebp),%eax
c010207b:	0b 45 f0             	or     -0x10(%ebp),%eax
c010207e:	83 c8 01             	or     $0x1,%eax
c0102081:	89 c2                	mov    %eax,%edx
c0102083:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102086:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c0102088:	8b 45 0c             	mov    0xc(%ebp),%eax
c010208b:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c010208f:	8d 50 01             	lea    0x1(%eax),%edx
c0102092:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102095:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c0102099:	b8 00 00 00 00       	mov    $0x0,%eax

}
c010209e:	c9                   	leave  
c010209f:	c3                   	ret    

c01020a0 <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c01020a0:	55                   	push   %ebp
c01020a1:	89 e5                	mov    %esp,%ebp
c01020a3:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, false);
c01020a6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01020ad:	00 
c01020ae:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020b1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01020b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01020b8:	89 04 24             	mov    %eax,(%esp)
c01020bb:	e8 99 fa ff ff       	call   c0101b59 <pgdir_walk>
c01020c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) return NULL;
c01020c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01020c7:	75 07                	jne    c01020d0 <page_lookup+0x30>
c01020c9:	b8 00 00 00 00       	mov    $0x0,%eax
c01020ce:	eb 20                	jmp    c01020f0 <page_lookup+0x50>
	if (pte_store != NULL) *pte_store = pte;
c01020d0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01020d4:	74 08                	je     c01020de <page_lookup+0x3e>
c01020d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01020d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01020dc:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(*pte));
c01020de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020e1:	8b 00                	mov    (%eax),%eax
c01020e3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01020e8:	89 04 24             	mov    %eax,(%esp)
c01020eb:	e8 54 f7 ff ff       	call   c0101844 <pa2page>
}
c01020f0:	c9                   	leave  
c01020f1:	c3                   	ret    

c01020f2 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c01020f2:	55                   	push   %ebp
c01020f3:	89 e5                	mov    %esp,%ebp
c01020f5:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte;
	pte_t **pte_store = &pte;
c01020f8:	8d 45 ec             	lea    -0x14(%ebp),%eax
c01020fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct Page *p = page_lookup(pgdir, va, pte_store);
c01020fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102101:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102105:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102108:	89 44 24 04          	mov    %eax,0x4(%esp)
c010210c:	8b 45 08             	mov    0x8(%ebp),%eax
c010210f:	89 04 24             	mov    %eax,(%esp)
c0102112:	e8 89 ff ff ff       	call   c01020a0 <page_lookup>
c0102117:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p != NULL) {
c010211a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010211e:	74 28                	je     c0102148 <page_remove+0x56>
		**pte_store = 0;
c0102120:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102123:	8b 00                	mov    (%eax),%eax
c0102125:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c010212b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010212e:	89 04 24             	mov    %eax,(%esp)
c0102131:	e8 f3 f9 ff ff       	call   c0101b29 <page_decref>
		tlb_invalidate(pgdir, va);
c0102136:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102139:	89 44 24 04          	mov    %eax,0x4(%esp)
c010213d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102140:	89 04 24             	mov    %eax,(%esp)
c0102143:	e8 02 00 00 00       	call   c010214a <tlb_invalidate>
	}
}
c0102148:	c9                   	leave  
c0102149:	c3                   	ret    

c010214a <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c010214a:	55                   	push   %ebp
c010214b:	89 e5                	mov    %esp,%ebp
c010214d:	83 ec 10             	sub    $0x10,%esp
c0102150:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102153:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c0102156:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102159:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c010215c:	c9                   	leave  
c010215d:	c3                   	ret    

c010215e <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c010215e:	55                   	push   %ebp
c010215f:	89 e5                	mov    %esp,%ebp
c0102161:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0102164:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102168:	75 24                	jne    c010218e <list_add+0x30>
c010216a:	c7 44 24 0c 2c 3e 10 	movl   $0xc0103e2c,0xc(%esp)
c0102171:	c0 
c0102172:	c7 44 24 08 39 3e 10 	movl   $0xc0103e39,0x8(%esp)
c0102179:	c0 
c010217a:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0102181:	00 
c0102182:	c7 04 24 4e 3e 10 c0 	movl   $0xc0103e4e,(%esp)
c0102189:	e8 fc 05 00 00       	call   c010278a <_panic>
	data->prev = prev;
c010218e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102191:	8b 55 08             	mov    0x8(%ebp),%edx
c0102194:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0102196:	8b 45 10             	mov    0x10(%ebp),%eax
c0102199:	8b 55 0c             	mov    0xc(%ebp),%edx
c010219c:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c010219f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01021a3:	74 09                	je     c01021ae <list_add+0x50>
c01021a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01021a8:	8b 55 10             	mov    0x10(%ebp),%edx
c01021ab:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c01021ae:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01021b2:	74 08                	je     c01021bc <list_add+0x5e>
c01021b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021b7:	8b 55 10             	mov    0x10(%ebp),%edx
c01021ba:	89 10                	mov    %edx,(%eax)
}
c01021bc:	c9                   	leave  
c01021bd:	c3                   	ret    

c01021be <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c01021be:	55                   	push   %ebp
c01021bf:	89 e5                	mov    %esp,%ebp
c01021c1:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01021c4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01021c8:	75 24                	jne    c01021ee <list_add_before+0x30>
c01021ca:	c7 44 24 0c 64 3e 10 	movl   $0xc0103e64,0xc(%esp)
c01021d1:	c0 
c01021d2:	c7 44 24 08 39 3e 10 	movl   $0xc0103e39,0x8(%esp)
c01021d9:	c0 
c01021da:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c01021e1:	00 
c01021e2:	c7 04 24 4e 3e 10 c0 	movl   $0xc0103e4e,(%esp)
c01021e9:	e8 9c 05 00 00       	call   c010278a <_panic>
	list_add(one->prev, one, data);
c01021ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01021f1:	8b 00                	mov    (%eax),%eax
c01021f3:	8b 55 0c             	mov    0xc(%ebp),%edx
c01021f6:	89 54 24 08          	mov    %edx,0x8(%esp)
c01021fa:	8b 55 08             	mov    0x8(%ebp),%edx
c01021fd:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102201:	89 04 24             	mov    %eax,(%esp)
c0102204:	e8 55 ff ff ff       	call   c010215e <list_add>
}
c0102209:	c9                   	leave  
c010220a:	c3                   	ret    

c010220b <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c010220b:	55                   	push   %ebp
c010220c:	89 e5                	mov    %esp,%ebp
c010220e:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0102211:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102215:	75 24                	jne    c010223b <list_del+0x30>
c0102217:	c7 44 24 0c 2c 3e 10 	movl   $0xc0103e2c,0xc(%esp)
c010221e:	c0 
c010221f:	c7 44 24 08 39 3e 10 	movl   $0xc0103e39,0x8(%esp)
c0102226:	c0 
c0102227:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c010222e:	00 
c010222f:	c7 04 24 4e 3e 10 c0 	movl   $0xc0103e4e,(%esp)
c0102236:	e8 4f 05 00 00       	call   c010278a <_panic>
	list *prev = data->prev;
c010223b:	8b 45 08             	mov    0x8(%ebp),%eax
c010223e:	8b 00                	mov    (%eax),%eax
c0102240:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0102243:	8b 45 08             	mov    0x8(%ebp),%eax
c0102246:	8b 40 04             	mov    0x4(%eax),%eax
c0102249:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c010224c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102250:	74 09                	je     c010225b <list_del+0x50>
c0102252:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102255:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102258:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c010225b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010225f:	74 08                	je     c0102269 <list_del+0x5e>
c0102261:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102264:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102267:	89 10                	mov    %edx,(%eax)
}
c0102269:	c9                   	leave  
c010226a:	c3                   	ret    

c010226b <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c010226b:	55                   	push   %ebp
c010226c:	89 e5                	mov    %esp,%ebp
c010226e:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0102271:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102275:	75 24                	jne    c010229b <list_empty+0x30>
c0102277:	c7 44 24 0c 64 3e 10 	movl   $0xc0103e64,0xc(%esp)
c010227e:	c0 
c010227f:	c7 44 24 08 39 3e 10 	movl   $0xc0103e39,0x8(%esp)
c0102286:	c0 
c0102287:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
c010228e:	00 
c010228f:	c7 04 24 4e 3e 10 c0 	movl   $0xc0103e4e,(%esp)
c0102296:	e8 ef 04 00 00       	call   c010278a <_panic>
	return one == one->next;
c010229b:	8b 45 08             	mov    0x8(%ebp),%eax
c010229e:	8b 40 04             	mov    0x4(%eax),%eax
c01022a1:	3b 45 08             	cmp    0x8(%ebp),%eax
c01022a4:	0f 94 c0             	sete   %al
c01022a7:	0f b6 c0             	movzbl %al,%eax
}
c01022aa:	c9                   	leave  
c01022ab:	c3                   	ret    

c01022ac <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01022ac:	55                   	push   %ebp
c01022ad:	89 e5                	mov    %esp,%ebp
c01022af:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01022b2:	8b 45 10             	mov    0x10(%ebp),%eax
c01022b5:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01022ba:	77 21                	ja     c01022dd <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01022bc:	8b 45 10             	mov    0x10(%ebp),%eax
c01022bf:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01022c3:	c7 44 24 08 70 3e 10 	movl   $0xc0103e70,0x8(%esp)
c01022ca:	c0 
c01022cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022ce:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01022d5:	89 04 24             	mov    %eax,(%esp)
c01022d8:	e8 ad 04 00 00       	call   c010278a <_panic>
	return (physaddr_t)kva - KERNBASE;
c01022dd:	8b 45 10             	mov    0x10(%ebp),%eax
c01022e0:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01022e5:	c9                   	leave  
c01022e6:	c3                   	ret    

c01022e7 <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
c01022e7:	55                   	push   %ebp
c01022e8:	89 e5                	mov    %esp,%ebp
c01022ea:	83 ec 38             	sub    $0x38,%esp
	list *one;
	list *head=&block;
c01022ed:	c7 45 f0 e4 3e 16 c0 	movl   $0xc0163ee4,-0x10(%ebp)
	for(one=head->next;one!=head;one=one->next){
c01022f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022f7:	8b 40 04             	mov    0x4(%eax),%eax
c01022fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01022fd:	eb 49                	jmp    c0102348 <schedule+0x61>
		PCB *p=list_entry(one,PCB,plist);
c01022ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102302:	83 e8 08             	sub    $0x8,%eax
c0102305:	89 45 ec             	mov    %eax,-0x14(%ebp)
		p->timecount--;
c0102308:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010230b:	8b 40 1c             	mov    0x1c(%eax),%eax
c010230e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102311:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102314:	89 50 1c             	mov    %edx,0x1c(%eax)
		if(p->timecount==0){
c0102317:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010231a:	8b 40 1c             	mov    0x1c(%eax),%eax
c010231d:	85 c0                	test   %eax,%eax
c010231f:	75 1e                	jne    c010233f <schedule+0x58>
			list_del(one);
c0102321:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102324:	89 04 24             	mov    %eax,(%esp)
c0102327:	e8 df fe ff ff       	call   c010220b <list_del>
			list_add_before(&ready,one);
c010232c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010232f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102333:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c010233a:	e8 7f fe ff ff       	call   c01021be <list_add_before>

//extern TSS tss;
void schedule(){
	list *one;
	list *head=&block;
	for(one=head->next;one!=head;one=one->next){
c010233f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102342:	8b 40 04             	mov    0x4(%eax),%eax
c0102345:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102348:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010234b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010234e:	75 af                	jne    c01022ff <schedule+0x18>
		if(p->timecount==0){
			list_del(one);
			list_add_before(&ready,one);
		}
	}
	if(!list_empty(&ready)){
c0102350:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0102357:	e8 0f ff ff ff       	call   c010226b <list_empty>
c010235c:	85 c0                	test   %eax,%eax
c010235e:	75 7e                	jne    c01023de <schedule+0xf7>
		list *re=&ready;
c0102360:	c7 45 e8 00 4f 16 c0 	movl   $0xc0164f00,-0x18(%ebp)
		if(now->next==re)
c0102367:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010236c:	8b 40 04             	mov    0x4(%eax),%eax
c010236f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0102372:	75 0d                	jne    c0102381 <schedule+0x9a>
			now=re->next;
c0102374:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102377:	8b 40 04             	mov    0x4(%eax),%eax
c010237a:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c010237f:	eb 0d                	jmp    c010238e <schedule+0xa7>
		else
			now=now->next;
c0102381:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102386:	8b 40 04             	mov    0x4(%eax),%eax
c0102389:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c010238e:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0102393:	83 e8 08             	sub    $0x8,%eax
c0102396:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)((void*)pcbnow+STACKSIZE);
c010239b:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023a0:	05 00 10 00 00       	add    $0x1000,%eax
c01023a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		lcr3(PADDR(pcbnow->pgdir));
c01023a8:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023ad:	8b 40 04             	mov    0x4(%eax),%eax
c01023b0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01023b4:	c7 44 24 04 1c 00 00 	movl   $0x1c,0x4(%esp)
c01023bb:	00 
c01023bc:	c7 04 24 94 3e 10 c0 	movl   $0xc0103e94,(%esp)
c01023c3:	e8 e4 fe ff ff       	call   c01022ac <_paddr>
c01023c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c01023cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01023ce:	0f 22 d8             	mov    %eax,%cr3
		set_tss_esp0(t);
c01023d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01023d4:	89 04 24             	mov    %eax,(%esp)
c01023d7:	e8 10 02 00 00       	call   c01025ec <set_tss_esp0>
c01023dc:	eb 3a                	jmp    c0102418 <schedule+0x131>
	}
	else{
		pcbnow=&init;
c01023de:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01023e5:	3f 16 c0 
		now=&ready;
c01023e8:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c01023ef:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c01023f2:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01023f7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01023fb:	c7 44 24 04 22 00 00 	movl   $0x22,0x4(%esp)
c0102402:	00 
c0102403:	c7 04 24 94 3e 10 c0 	movl   $0xc0103e94,(%esp)
c010240a:	e8 9d fe ff ff       	call   c01022ac <_paddr>
c010240f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102412:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102415:	0f 22 d8             	mov    %eax,%cr3
	}
}
c0102418:	c9                   	leave  
c0102419:	c3                   	ret    

c010241a <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c010241a:	55                   	push   %ebp
c010241b:	89 e5                	mov    %esp,%ebp
c010241d:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0102420:	8b 45 10             	mov    0x10(%ebp),%eax
c0102423:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0102428:	77 21                	ja     c010244b <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c010242a:	8b 45 10             	mov    0x10(%ebp),%eax
c010242d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102431:	c7 44 24 08 ac 3e 10 	movl   $0xc0103eac,0x8(%esp)
c0102438:	c0 
c0102439:	8b 45 0c             	mov    0xc(%ebp),%eax
c010243c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102440:	8b 45 08             	mov    0x8(%ebp),%eax
c0102443:	89 04 24             	mov    %eax,(%esp)
c0102446:	e8 3f 03 00 00       	call   c010278a <_panic>
	return (physaddr_t)kva - KERNBASE;
c010244b:	8b 45 10             	mov    0x10(%ebp),%eax
c010244e:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0102453:	c9                   	leave  
c0102454:	c3                   	ret    

c0102455 <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c0102455:	55                   	push   %ebp
c0102456:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c0102458:	8b 45 08             	mov    0x8(%ebp),%eax
c010245b:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0102460:	8b 45 08             	mov    0x8(%ebp),%eax
c0102463:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c0102469:	8b 45 08             	mov    0x8(%ebp),%eax
c010246c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0102470:	8b 45 10             	mov    0x10(%ebp),%eax
c0102473:	83 e0 0f             	and    $0xf,%eax
c0102476:	89 c2                	mov    %eax,%edx
c0102478:	8b 45 08             	mov    0x8(%ebp),%eax
c010247b:	89 d1                	mov    %edx,%ecx
c010247d:	83 e1 0f             	and    $0xf,%ecx
c0102480:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102484:	83 e2 f0             	and    $0xfffffff0,%edx
c0102487:	09 ca                	or     %ecx,%edx
c0102489:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c010248c:	8b 45 08             	mov    0x8(%ebp),%eax
c010248f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102493:	83 ca 10             	or     $0x10,%edx
c0102496:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c0102499:	8b 45 0c             	mov    0xc(%ebp),%eax
c010249c:	83 e0 03             	and    $0x3,%eax
c010249f:	89 c2                	mov    %eax,%edx
c01024a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01024a4:	83 e2 03             	and    $0x3,%edx
c01024a7:	89 d1                	mov    %edx,%ecx
c01024a9:	c1 e1 05             	shl    $0x5,%ecx
c01024ac:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01024b0:	83 e2 9f             	and    $0xffffff9f,%edx
c01024b3:	09 ca                	or     %ecx,%edx
c01024b5:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c01024b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024bb:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01024bf:	83 ca 80             	or     $0xffffff80,%edx
c01024c2:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c01024c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01024c8:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024cc:	83 ca 0f             	or     $0xf,%edx
c01024cf:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c01024d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01024d5:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024d9:	83 e2 ef             	and    $0xffffffef,%edx
c01024dc:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c01024df:	8b 45 08             	mov    0x8(%ebp),%eax
c01024e2:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024e6:	83 e2 df             	and    $0xffffffdf,%edx
c01024e9:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c01024ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ef:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01024f3:	83 ca 40             	or     $0x40,%edx
c01024f6:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c01024f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01024fc:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102500:	83 ca 80             	or     $0xffffff80,%edx
c0102503:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c0102506:	8b 45 08             	mov    0x8(%ebp),%eax
c0102509:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c010250d:	5d                   	pop    %ebp
c010250e:	c3                   	ret    

c010250f <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c010250f:	55                   	push   %ebp
c0102510:	89 e5                	mov    %esp,%ebp
c0102512:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c0102515:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c010251c:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c010251f:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c0102526:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c010252d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102530:	89 c2                	mov    %eax,%edx
c0102532:	8b 45 08             	mov    0x8(%ebp),%eax
c0102535:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c0102538:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010253b:	89 c2                	mov    %eax,%edx
c010253d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102540:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c0102544:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102547:	c1 e8 10             	shr    $0x10,%eax
c010254a:	89 c2                	mov    %eax,%edx
c010254c:	8b 45 08             	mov    0x8(%ebp),%eax
c010254f:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c0102552:	8b 45 08             	mov    0x8(%ebp),%eax
c0102555:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102559:	83 e2 f0             	and    $0xfffffff0,%edx
c010255c:	83 ca 09             	or     $0x9,%edx
c010255f:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c0102562:	8b 45 08             	mov    0x8(%ebp),%eax
c0102565:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102569:	83 e2 ef             	and    $0xffffffef,%edx
c010256c:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c010256f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102572:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102576:	83 ca 60             	or     $0x60,%edx
c0102579:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c010257c:	8b 45 08             	mov    0x8(%ebp),%eax
c010257f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102583:	83 ca 80             	or     $0xffffff80,%edx
c0102586:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0102589:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010258c:	c1 e8 10             	shr    $0x10,%eax
c010258f:	83 e0 0f             	and    $0xf,%eax
c0102592:	89 c2                	mov    %eax,%edx
c0102594:	8b 45 08             	mov    0x8(%ebp),%eax
c0102597:	89 d1                	mov    %edx,%ecx
c0102599:	83 e1 0f             	and    $0xf,%ecx
c010259c:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025a0:	83 e2 f0             	and    $0xfffffff0,%edx
c01025a3:	09 ca                	or     %ecx,%edx
c01025a5:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c01025a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ab:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025af:	83 e2 ef             	and    $0xffffffef,%edx
c01025b2:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c01025b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01025b8:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025bc:	83 e2 df             	and    $0xffffffdf,%edx
c01025bf:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c01025c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01025c5:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025c9:	83 ca 40             	or     $0x40,%edx
c01025cc:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c01025cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01025d2:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025d6:	83 e2 7f             	and    $0x7f,%edx
c01025d9:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c01025dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01025df:	c1 e8 18             	shr    $0x18,%eax
c01025e2:	89 c2                	mov    %eax,%edx
c01025e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01025e7:	88 50 07             	mov    %dl,0x7(%eax)
}
c01025ea:	c9                   	leave  
c01025eb:	c3                   	ret    

c01025ec <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c01025ec:	55                   	push   %ebp
c01025ed:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c01025ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01025f2:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c01025f7:	5d                   	pop    %ebp
c01025f8:	c3                   	ret    

c01025f9 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c01025f9:	55                   	push   %ebp
c01025fa:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c01025fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025ff:	83 e8 01             	sub    $0x1,%eax
c0102602:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c0102608:	8b 45 08             	mov    0x8(%ebp),%eax
c010260b:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102611:	8b 45 08             	mov    0x8(%ebp),%eax
c0102614:	c1 e8 10             	shr    $0x10,%eax
c0102617:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c010261d:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c0102622:	0f 01 10             	lgdtl  (%eax)
}
c0102625:	5d                   	pop    %ebp
c0102626:	c3                   	ret    

c0102627 <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c0102627:	55                   	push   %ebp
c0102628:	89 e5                	mov    %esp,%ebp
c010262a:	83 ec 04             	sub    $0x4,%esp
c010262d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102630:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c0102634:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102638:	0f 00 d8             	ltr    %ax
}
c010263b:	c9                   	leave  
c010263c:	c3                   	ret    

c010263d <init_segment>:

void
init_segment(void) {
c010263d:	55                   	push   %ebp
c010263e:	89 e5                	mov    %esp,%ebp
c0102640:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c0102643:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c010264a:	00 
c010264b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102652:	00 
c0102653:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c010265a:	e8 3e 06 00 00       	call   c0102c9d <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c010265f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0102666:	00 
c0102667:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010266e:	00 
c010266f:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c0102676:	e8 da fd ff ff       	call   c0102455 <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c010267b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102682:	00 
c0102683:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010268a:	00 
c010268b:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c0102692:	e8 be fd ff ff       	call   c0102455 <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0102697:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010269e:	00 
c010269f:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c01026a6:	00 
c01026a7:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c01026ae:	e8 a2 fd ff ff       	call   c0102455 <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c01026b3:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c01026ba:	00 
c01026bb:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c01026c2:	00 
c01026c3:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c01026ca:	e8 86 fd ff ff       	call   c0102455 <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c01026cf:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c01026d6:	00 
c01026d7:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c01026de:	e8 16 ff ff ff       	call   c01025f9 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c01026e3:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c01026ea:	e8 20 fe ff ff       	call   c010250f <set_tss>
	load_tr(USEL(SEG_TSS));
c01026ef:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c01026f6:	e8 2c ff ff ff       	call   c0102627 <load_tr>
}
c01026fb:	c9                   	leave  
c01026fc:	c3                   	ret    

c01026fd <to_user>:

void to_user(PCB *p)
{
c01026fd:	55                   	push   %ebp
c01026fe:	89 e5                	mov    %esp,%ebp
c0102700:	83 ec 28             	sub    $0x28,%esp
	lcr3(PADDR(p->pgdir));
c0102703:	8b 45 08             	mov    0x8(%ebp),%eax
c0102706:	8b 40 04             	mov    0x4(%eax),%eax
c0102709:	89 44 24 08          	mov    %eax,0x8(%esp)
c010270d:	c7 44 24 04 52 00 00 	movl   $0x52,0x4(%esp)
c0102714:	00 
c0102715:	c7 04 24 d0 3e 10 c0 	movl   $0xc0103ed0,(%esp)
c010271c:	e8 f9 fc ff ff       	call   c010241a <_paddr>
c0102721:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102724:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102727:	0f 22 d8             	mov    %eax,%cr3
	asm volatile("mov %0, %%ds" : : "r"(p->tf->ds));
c010272a:	8b 45 08             	mov    0x8(%ebp),%eax
c010272d:	8b 00                	mov    (%eax),%eax
c010272f:	8b 40 2c             	mov    0x2c(%eax),%eax
c0102732:	8e d8                	mov    %eax,%ds
	asm volatile("mov %0, %%es" : : "r"(p->tf->es));
c0102734:	8b 45 08             	mov    0x8(%ebp),%eax
c0102737:	8b 00                	mov    (%eax),%eax
c0102739:	8b 40 28             	mov    0x28(%eax),%eax
c010273c:	8e c0                	mov    %eax,%es
	asm volatile("mov %0, %%fs" : : "r"(p->tf->fs));
c010273e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102741:	8b 00                	mov    (%eax),%eax
c0102743:	8b 40 24             	mov    0x24(%eax),%eax
c0102746:	8e e0                	mov    %eax,%fs
	asm volatile("mov %0, %%gs" : : "r"(p->tf->gs));
c0102748:	8b 45 08             	mov    0x8(%ebp),%eax
c010274b:	8b 00                	mov    (%eax),%eax
c010274d:	8b 40 20             	mov    0x20(%eax),%eax
c0102750:	8e e8                	mov    %eax,%gs
	asm volatile("pushl %0" : : "r"((uint32_t)p->tf->ss));
c0102752:	8b 45 08             	mov    0x8(%ebp),%eax
c0102755:	8b 00                	mov    (%eax),%eax
c0102757:	0f b7 40 48          	movzwl 0x48(%eax),%eax
c010275b:	0f b7 c0             	movzwl %ax,%eax
c010275e:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"(p->tf->esp));
c010275f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102762:	8b 00                	mov    (%eax),%eax
c0102764:	8b 40 44             	mov    0x44(%eax),%eax
c0102767:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"(p->tf->eflags));
c0102768:	8b 45 08             	mov    0x8(%ebp),%eax
c010276b:	8b 00                	mov    (%eax),%eax
c010276d:	8b 40 40             	mov    0x40(%eax),%eax
c0102770:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"((uint32_t)p->tf->cs));
c0102771:	8b 45 08             	mov    0x8(%ebp),%eax
c0102774:	8b 00                	mov    (%eax),%eax
c0102776:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
c010277a:	0f b7 c0             	movzwl %ax,%eax
c010277d:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"(p->tf->eip));
c010277e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102781:	8b 00                	mov    (%eax),%eax
c0102783:	8b 40 38             	mov    0x38(%eax),%eax
c0102786:	50                   	push   %eax
	asm volatile("iret");	
c0102787:	cf                   	iret   
}
c0102788:	c9                   	leave  
c0102789:	c3                   	ret    

c010278a <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c010278a:	55                   	push   %ebp
c010278b:	89 e5                	mov    %esp,%ebp
c010278d:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c0102790:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c0102795:	85 c0                	test   %eax,%eax
c0102797:	74 01                	je     c010279a <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0102799:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c010279a:	8b 45 10             	mov    0x10(%ebp),%eax
c010279d:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c01027a2:	fa                   	cli    
c01027a3:	fc                   	cld    

	va_start(ap, fmt);
c01027a4:	8d 45 14             	lea    0x14(%ebp),%eax
c01027a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c01027aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027ad:	89 44 24 08          	mov    %eax,0x8(%esp)
c01027b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01027b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027b8:	c7 04 24 e3 3e 10 c0 	movl   $0xc0103ee3,(%esp)
c01027bf:	e8 f5 00 00 00       	call   c01028b9 <printk>
	vprintk(fmt, ap);
c01027c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027c7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027cb:	8b 45 10             	mov    0x10(%ebp),%eax
c01027ce:	89 04 24             	mov    %eax,(%esp)
c01027d1:	e8 b0 00 00 00       	call   c0102886 <vprintk>
	printk("\n");
c01027d6:	c7 04 24 fb 3e 10 c0 	movl   $0xc0103efb,(%esp)
c01027dd:	e8 d7 00 00 00       	call   c01028b9 <printk>
	va_end(ap);

}
c01027e2:	c9                   	leave  
c01027e3:	c3                   	ret    

c01027e4 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c01027e4:	55                   	push   %ebp
c01027e5:	89 e5                	mov    %esp,%ebp
c01027e7:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c01027ea:	8d 45 14             	lea    0x14(%ebp),%eax
c01027ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c01027f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027f3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01027f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01027fa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027fe:	c7 04 24 fd 3e 10 c0 	movl   $0xc0103efd,(%esp)
c0102805:	e8 af 00 00 00       	call   c01028b9 <printk>
	vprintk(fmt, ap);
c010280a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010280d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102811:	8b 45 10             	mov    0x10(%ebp),%eax
c0102814:	89 04 24             	mov    %eax,(%esp)
c0102817:	e8 6a 00 00 00       	call   c0102886 <vprintk>
	printk("\n");
c010281c:	c7 04 24 fb 3e 10 c0 	movl   $0xc0103efb,(%esp)
c0102823:	e8 91 00 00 00       	call   c01028b9 <printk>
	va_end(ap);
}
c0102828:	c9                   	leave  
c0102829:	c3                   	ret    

c010282a <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c010282a:	55                   	push   %ebp
c010282b:	89 e5                	mov    %esp,%ebp
c010282d:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0102830:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0102834:	75 2b                	jne    c0102861 <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0102836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010283d:	eb 1a                	jmp    c0102859 <sys_write+0x2f>
			serial_printc(buf[i]);
c010283f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102842:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102845:	01 d0                	add    %edx,%eax
c0102847:	0f b6 00             	movzbl (%eax),%eax
c010284a:	0f be c0             	movsbl %al,%eax
c010284d:	89 04 24             	mov    %eax,(%esp)
c0102850:	e8 51 e2 ff ff       	call   c0100aa6 <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0102855:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102859:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010285c:	3b 45 10             	cmp    0x10(%ebp),%eax
c010285f:	7c de                	jl     c010283f <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c0102861:	8b 45 10             	mov    0x10(%ebp),%eax
c0102864:	c9                   	leave  
c0102865:	c3                   	ret    

c0102866 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c0102866:	55                   	push   %ebp
c0102867:	89 e5                	mov    %esp,%ebp
c0102869:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c010286c:	8b 45 08             	mov    0x8(%ebp),%eax
c010286f:	89 04 24             	mov    %eax,(%esp)
c0102872:	e8 59 e2 ff ff       	call   c0100ad0 <putchar>
	++*cnt;
c0102877:	8b 45 0c             	mov    0xc(%ebp),%eax
c010287a:	8b 00                	mov    (%eax),%eax
c010287c:	8d 50 01             	lea    0x1(%eax),%edx
c010287f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102882:	89 10                	mov    %edx,(%eax)
}
c0102884:	c9                   	leave  
c0102885:	c3                   	ret    

c0102886 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0102886:	55                   	push   %ebp
c0102887:	89 e5                	mov    %esp,%ebp
c0102889:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c010288c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c0102893:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102896:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010289a:	8b 45 08             	mov    0x8(%ebp),%eax
c010289d:	89 44 24 08          	mov    %eax,0x8(%esp)
c01028a1:	8d 45 f4             	lea    -0xc(%ebp),%eax
c01028a4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028a8:	c7 04 24 66 28 10 c0 	movl   $0xc0102866,(%esp)
c01028af:	e8 f1 09 00 00       	call   c01032a5 <vprintfmt>
	return cnt;
c01028b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01028b7:	c9                   	leave  
c01028b8:	c3                   	ret    

c01028b9 <printk>:

int printk(const char *fmt, ...)
{
c01028b9:	55                   	push   %ebp
c01028ba:	89 e5                	mov    %esp,%ebp
c01028bc:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c01028bf:	8d 45 0c             	lea    0xc(%ebp),%eax
c01028c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c01028c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028c8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01028cf:	89 04 24             	mov    %eax,(%esp)
c01028d2:	e8 af ff ff ff       	call   c0102886 <vprintk>
c01028d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c01028da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028dd:	c9                   	leave  
c01028de:	c3                   	ret    

c01028df <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c01028df:	6a 00                	push   $0x0
c01028e1:	6a 00                	push   $0x0
c01028e3:	e9 a9 00 00 00       	jmp    c0102991 <asm_do_irq>

c01028e8 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c01028e8:	6a 00                	push   $0x0
c01028ea:	6a 01                	push   $0x1
c01028ec:	e9 a0 00 00 00       	jmp    c0102991 <asm_do_irq>

c01028f1 <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c01028f1:	6a 00                	push   $0x0
c01028f3:	6a 02                	push   $0x2
c01028f5:	e9 97 00 00 00       	jmp    c0102991 <asm_do_irq>

c01028fa <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c01028fa:	6a 00                	push   $0x0
c01028fc:	6a 03                	push   $0x3
c01028fe:	e9 8e 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102903 <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c0102903:	6a 00                	push   $0x0
c0102905:	6a 04                	push   $0x4
c0102907:	e9 85 00 00 00       	jmp    c0102991 <asm_do_irq>

c010290c <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c010290c:	6a 00                	push   $0x0
c010290e:	6a 05                	push   $0x5
c0102910:	e9 7c 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102915 <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0102915:	6a 00                	push   $0x0
c0102917:	6a 06                	push   $0x6
c0102919:	e9 73 00 00 00       	jmp    c0102991 <asm_do_irq>

c010291e <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c010291e:	6a 00                	push   $0x0
c0102920:	6a 07                	push   $0x7
c0102922:	e9 6a 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102927 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0102927:	6a 08                	push   $0x8
c0102929:	e9 63 00 00 00       	jmp    c0102991 <asm_do_irq>

c010292e <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c010292e:	6a 00                	push   $0x0
c0102930:	6a 09                	push   $0x9
c0102932:	e9 5a 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102937 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0102937:	6a 0a                	push   $0xa
c0102939:	e9 53 00 00 00       	jmp    c0102991 <asm_do_irq>

c010293e <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c010293e:	6a 0b                	push   $0xb
c0102940:	e9 4c 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102945 <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0102945:	6a 0c                	push   $0xc
c0102947:	e9 45 00 00 00       	jmp    c0102991 <asm_do_irq>

c010294c <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c010294c:	6a 0d                	push   $0xd
c010294e:	e9 3e 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102953 <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c0102953:	6a 0e                	push   $0xe
c0102955:	e9 37 00 00 00       	jmp    c0102991 <asm_do_irq>

c010295a <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c010295a:	6a 00                	push   $0x0
c010295c:	68 80 00 00 00       	push   $0x80
c0102961:	e9 2b 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102966 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c0102966:	6a 00                	push   $0x0
c0102968:	68 e8 03 00 00       	push   $0x3e8
c010296d:	e9 1f 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102972 <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c0102972:	6a 00                	push   $0x0
c0102974:	68 e9 03 00 00       	push   $0x3e9
c0102979:	e9 13 00 00 00       	jmp    c0102991 <asm_do_irq>

c010297e <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c010297e:	6a 00                	push   $0x0
c0102980:	68 f6 03 00 00       	push   $0x3f6
c0102985:	e9 07 00 00 00       	jmp    c0102991 <asm_do_irq>

c010298a <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c010298a:	6a ff                	push   $0xffffffff
c010298c:	e9 00 00 00 00       	jmp    c0102991 <asm_do_irq>

c0102991 <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c0102991:	fa                   	cli    
	pushl %ds
c0102992:	1e                   	push   %ds
  	pushl %es
c0102993:	06                   	push   %es
  	pushl %fs
c0102994:	0f a0                	push   %fs
  	pushl %gs
c0102996:	0f a8                	push   %gs
	pushal
c0102998:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0102999:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c010299d:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c010299f:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c01029a1:	54                   	push   %esp
	call irq_handle
c01029a2:	e8 6f dd ff ff       	call   c0100716 <irq_handle>
	movl pcbnow,%eax
c01029a7:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c01029ac:	8b 20                	mov    (%eax),%esp
	#addl $4, %esp

	popal
c01029ae:	61                   	popa   
	popl %gs
c01029af:	0f a9                	pop    %gs
  	popl %fs
c01029b1:	0f a1                	pop    %fs
  	popl %es
c01029b3:	07                   	pop    %es
  	popl %ds
c01029b4:	1f                   	pop    %ds
	addl $8, %esp
c01029b5:	83 c4 08             	add    $0x8,%esp
	sti
c01029b8:	fb                   	sti    
	iret
c01029b9:	cf                   	iret   
c01029ba:	66 90                	xchg   %ax,%ax
c01029bc:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c01029c2:	00 00                	add    %al,(%eax)
c01029c4:	fe 4f 52             	decb   0x52(%edi)
c01029c7:	e4 66                	in     $0x66,%al

c01029c8 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c01029c8:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c01029cf:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c01029d1:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c01029d6:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c01029d9:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c01029dc:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c01029e1:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c01029e4:	b8 eb 29 10 c0       	mov    $0xc01029eb,%eax
	jmp	*%eax
c01029e9:	ff e0                	jmp    *%eax

c01029eb <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c01029eb:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c01029f0:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c01029f5:	e8 45 d7 ff ff       	call   c010013f <main>

c01029fa <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c01029fa:	eb fe                	jmp    c01029fa <spin>

c01029fc <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c01029fc:	55                   	push   %ebp
c01029fd:	89 e5                	mov    %esp,%ebp
c01029ff:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0102a02:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102a06:	78 18                	js     c0102a20 <draw_pixel+0x24>
c0102a08:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a0c:	78 12                	js     c0102a20 <draw_pixel+0x24>
c0102a0e:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102a15:	7f 09                	jg     c0102a20 <draw_pixel+0x24>
c0102a17:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102a1e:	7e 24                	jle    c0102a44 <draw_pixel+0x48>
c0102a20:	c7 44 24 0c 18 3f 10 	movl   $0xc0103f18,0xc(%esp)
c0102a27:	c0 
c0102a28:	c7 44 24 08 4c 3f 10 	movl   $0xc0103f4c,0x8(%esp)
c0102a2f:	c0 
c0102a30:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
c0102a37:	00 
c0102a38:	c7 04 24 61 3f 10 c0 	movl   $0xc0103f61,(%esp)
c0102a3f:	e8 46 fd ff ff       	call   c010278a <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0102a44:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a47:	c1 e0 08             	shl    $0x8,%eax
c0102a4a:	89 c2                	mov    %eax,%edx
c0102a4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a4f:	c1 e0 06             	shl    $0x6,%eax
c0102a52:	01 c2                	add    %eax,%edx
c0102a54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a57:	01 c2                	add    %eax,%edx
c0102a59:	8b 45 10             	mov    0x10(%ebp),%eax
c0102a5c:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c0102a62:	c9                   	leave  
c0102a63:	c3                   	ret    

c0102a64 <sysclean>:


void sysclean(void)
{
c0102a64:	55                   	push   %ebp
c0102a65:	89 e5                	mov    %esp,%ebp
c0102a67:	83 ec 18             	sub    $0x18,%esp
	memset(buff, 0, sizeof(buff));
c0102a6a:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0102a71:	00 
c0102a72:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102a79:	00 
c0102a7a:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c0102a81:	e8 17 02 00 00       	call   c0102c9d <memset>
}
c0102a86:	c9                   	leave  
c0102a87:	c3                   	ret    

c0102a88 <syspr>:
int syspr()
{
c0102a88:	55                   	push   %ebp
c0102a89:	89 e5                	mov    %esp,%ebp
c0102a8b:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_pr, buff);
c0102a8e:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0102a95:	c0 
c0102a96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102a9d:	e8 b1 00 00 00       	call   c0102b53 <syscall>
}
c0102aa2:	c9                   	leave  
c0102aa3:	c3                   	ret    

c0102aa4 <systime>:

int systime(void)
{
c0102aa4:	55                   	push   %ebp
c0102aa5:	89 e5                	mov    %esp,%ebp
c0102aa7:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_time);
c0102aaa:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102ab1:	e8 9d 00 00 00       	call   c0102b53 <syscall>
}
c0102ab6:	c9                   	leave  
c0102ab7:	c3                   	ret    

c0102ab8 <sysreadkey>:

int sysreadkey(void)
{
c0102ab8:	55                   	push   %ebp
c0102ab9:	89 e5                	mov    %esp,%ebp
c0102abb:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_readkey);
c0102abe:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0102ac5:	e8 89 00 00 00       	call   c0102b53 <syscall>
}
c0102aca:	c9                   	leave  
c0102acb:	c3                   	ret    

c0102acc <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0102acc:	55                   	push   %ebp
c0102acd:	89 e5                	mov    %esp,%ebp
c0102acf:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_write, fd, buf1, n);
c0102ad2:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ad5:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102ad9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102adc:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ae0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ae3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ae7:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0102aee:	e8 60 00 00 00       	call   c0102b53 <syscall>
}
c0102af3:	c9                   	leave  
c0102af4:	c3                   	ret    

c0102af5 <fork>:

int fork(void)
{
c0102af5:	55                   	push   %ebp
c0102af6:	89 e5                	mov    %esp,%ebp
c0102af8:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_fork);
c0102afb:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0102b02:	e8 4c 00 00 00       	call   c0102b53 <syscall>
}
c0102b07:	c9                   	leave  
c0102b08:	c3                   	ret    

c0102b09 <getpid>:

int getpid(void)
{
c0102b09:	55                   	push   %ebp
c0102b0a:	89 e5                	mov    %esp,%ebp
c0102b0c:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_getpid);
c0102b0f:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0102b16:	e8 38 00 00 00       	call   c0102b53 <syscall>
}
c0102b1b:	c9                   	leave  
c0102b1c:	c3                   	ret    

c0102b1d <exit>:

void exit(int suc)
{
c0102b1d:	55                   	push   %ebp
c0102b1e:	89 e5                	mov    %esp,%ebp
c0102b20:	83 ec 18             	sub    $0x18,%esp
	syscall(SYS_exit,suc);
c0102b23:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b26:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b2a:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c0102b31:	e8 1d 00 00 00       	call   c0102b53 <syscall>
}
c0102b36:	c9                   	leave  
c0102b37:	c3                   	ret    

c0102b38 <sleep>:

void sleep(int sec)
{
c0102b38:	55                   	push   %ebp
c0102b39:	89 e5                	mov    %esp,%ebp
c0102b3b:	83 ec 18             	sub    $0x18,%esp
	syscall(SYS_sleep,sec);
c0102b3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b41:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b45:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0102b4c:	e8 02 00 00 00       	call   c0102b53 <syscall>
}
c0102b51:	c9                   	leave  
c0102b52:	c3                   	ret    

c0102b53 <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c0102b53:	55                   	push   %ebp
c0102b54:	89 e5                	mov    %esp,%ebp
c0102b56:	53                   	push   %ebx
c0102b57:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0102b5a:	8d 45 08             	lea    0x8(%ebp),%eax
c0102b5d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c0102b60:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102b63:	8b 00                	mov    (%eax),%eax
c0102b65:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102b68:	83 c2 04             	add    $0x4,%edx
c0102b6b:	8b 1a                	mov    (%edx),%ebx
c0102b6d:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102b70:	83 c2 08             	add    $0x8,%edx
c0102b73:	8b 0a                	mov    (%edx),%ecx
c0102b75:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102b78:	83 c2 0c             	add    $0xc,%edx
c0102b7b:	8b 12                	mov    (%edx),%edx
c0102b7d:	cd 80                	int    $0x80
c0102b7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c0102b82:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102b85:	83 c4 10             	add    $0x10,%esp
c0102b88:	5b                   	pop    %ebx
c0102b89:	5d                   	pop    %ebp
c0102b8a:	c3                   	ret    

c0102b8b <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0102b8b:	55                   	push   %ebp
c0102b8c:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0102b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b91:	8b 00                	mov    (%eax),%eax
c0102b93:	8d 48 01             	lea    0x1(%eax),%ecx
c0102b96:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102b99:	89 0a                	mov    %ecx,(%edx)
c0102b9b:	8b 55 08             	mov    0x8(%ebp),%edx
c0102b9e:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c0102ba4:	5d                   	pop    %ebp
c0102ba5:	c3                   	ret    

c0102ba6 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0102ba6:	55                   	push   %ebp
c0102ba7:	89 e5                	mov    %esp,%ebp
c0102ba9:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102bac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0102bb3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bb6:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102bba:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bbd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102bc1:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102bc4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102bc8:	c7 04 24 8b 2b 10 c0 	movl   $0xc0102b8b,(%esp)
c0102bcf:	e8 d1 06 00 00       	call   c01032a5 <vprintfmt>
	return cnt;
c0102bd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102bd7:	c9                   	leave  
c0102bd8:	c3                   	ret    

c0102bd9 <printf>:
int printf(const char *fmt, ...)
{
c0102bd9:	55                   	push   %ebp
c0102bda:	89 e5                	mov    %esp,%ebp
c0102bdc:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0102bdf:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102be2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c0102be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102be8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bef:	89 04 24             	mov    %eax,(%esp)
c0102bf2:	e8 af ff ff ff       	call   c0102ba6 <vprintf>
c0102bf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c0102bfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102bfd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c01:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c0102c08:	c0 
c0102c09:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102c10:	e8 b7 fe ff ff       	call   c0102acc <syswrite>
	return cnt;
c0102c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c18:	c9                   	leave  
c0102c19:	c3                   	ret    

c0102c1a <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c0102c1a:	55                   	push   %ebp
c0102c1b:	89 e5                	mov    %esp,%ebp
c0102c1d:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0102c20:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c0102c27:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102c2b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102c2e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102c33:	89 c8                	mov    %ecx,%eax
c0102c35:	f7 ea                	imul   %edx
c0102c37:	c1 fa 02             	sar    $0x2,%edx
c0102c3a:	89 c8                	mov    %ecx,%eax
c0102c3c:	c1 f8 1f             	sar    $0x1f,%eax
c0102c3f:	29 c2                	sub    %eax,%edx
c0102c41:	89 d0                	mov    %edx,%eax
c0102c43:	c1 e0 02             	shl    $0x2,%eax
c0102c46:	01 d0                	add    %edx,%eax
c0102c48:	01 c0                	add    %eax,%eax
c0102c4a:	29 c1                	sub    %eax,%ecx
c0102c4c:	89 ca                	mov    %ecx,%edx
c0102c4e:	89 d0                	mov    %edx,%eax
c0102c50:	83 c0 30             	add    $0x30,%eax
c0102c53:	89 c2                	mov    %eax,%edx
c0102c55:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102c58:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0102c5a:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102c5d:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102c62:	89 c8                	mov    %ecx,%eax
c0102c64:	f7 ea                	imul   %edx
c0102c66:	c1 fa 02             	sar    $0x2,%edx
c0102c69:	89 c8                	mov    %ecx,%eax
c0102c6b:	c1 f8 1f             	sar    $0x1f,%eax
c0102c6e:	29 c2                	sub    %eax,%edx
c0102c70:	89 d0                	mov    %edx,%eax
c0102c72:	89 45 08             	mov    %eax,0x8(%ebp)
c0102c75:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102c79:	75 ac                	jne    c0102c27 <itoa+0xd>
	return p;
c0102c7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102c7e:	c9                   	leave  
c0102c7f:	c3                   	ret    

c0102c80 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c0102c80:	55                   	push   %ebp
c0102c81:	89 e5                	mov    %esp,%ebp
c0102c83:	57                   	push   %edi
c0102c84:	56                   	push   %esi
c0102c85:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0102c86:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c89:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102c8c:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102c8f:	89 c1                	mov    %eax,%ecx
c0102c91:	89 d6                	mov    %edx,%esi
c0102c93:	89 df                	mov    %ebx,%edi
c0102c95:	fc                   	cld    
c0102c96:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0102c98:	5b                   	pop    %ebx
c0102c99:	5e                   	pop    %esi
c0102c9a:	5f                   	pop    %edi
c0102c9b:	5d                   	pop    %ebp
c0102c9c:	c3                   	ret    

c0102c9d <memset>:

void memset(void *dest, int data, size_t size) {
c0102c9d:	55                   	push   %ebp
c0102c9e:	89 e5                	mov    %esp,%ebp
c0102ca0:	57                   	push   %edi
c0102ca1:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0102ca2:	8b 55 10             	mov    0x10(%ebp),%edx
c0102ca5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ca8:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102cab:	89 d1                	mov    %edx,%ecx
c0102cad:	89 df                	mov    %ebx,%edi
c0102caf:	fc                   	cld    
c0102cb0:	f3 aa                	rep stos %al,%es:(%edi)
}
c0102cb2:	5b                   	pop    %ebx
c0102cb3:	5f                   	pop    %edi
c0102cb4:	5d                   	pop    %ebp
c0102cb5:	c3                   	ret    

c0102cb6 <strlen>:

size_t strlen(const char *str) {
c0102cb6:	55                   	push   %ebp
c0102cb7:	89 e5                	mov    %esp,%ebp
c0102cb9:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0102cbc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0102cc3:	eb 04                	jmp    c0102cc9 <strlen+0x13>
c0102cc5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102cc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ccc:	8d 50 01             	lea    0x1(%eax),%edx
c0102ccf:	89 55 08             	mov    %edx,0x8(%ebp)
c0102cd2:	0f b6 00             	movzbl (%eax),%eax
c0102cd5:	84 c0                	test   %al,%al
c0102cd7:	75 ec                	jne    c0102cc5 <strlen+0xf>
	return len;
c0102cd9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102cdc:	c9                   	leave  
c0102cdd:	c3                   	ret    

c0102cde <strcpy>:

void strcpy(char *d, const char *s) {
c0102cde:	55                   	push   %ebp
c0102cdf:	89 e5                	mov    %esp,%ebp
c0102ce1:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c0102ce4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ce7:	89 04 24             	mov    %eax,(%esp)
c0102cea:	e8 c7 ff ff ff       	call   c0102cb6 <strlen>
c0102cef:	83 c0 01             	add    $0x1,%eax
c0102cf2:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102cf6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cfd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d00:	89 04 24             	mov    %eax,(%esp)
c0102d03:	e8 78 ff ff ff       	call   c0102c80 <memcpy>
}
c0102d08:	c9                   	leave  
c0102d09:	c3                   	ret    

c0102d0a <strnlen>:

int
strnlen(const char *s, size_t size)
{
c0102d0a:	55                   	push   %ebp
c0102d0b:	89 e5                	mov    %esp,%ebp
c0102d0d:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102d10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102d17:	eb 0c                	jmp    c0102d25 <strnlen+0x1b>
		n++;
c0102d19:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102d1d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102d21:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102d25:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102d29:	74 0a                	je     c0102d35 <strnlen+0x2b>
c0102d2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d2e:	0f b6 00             	movzbl (%eax),%eax
c0102d31:	84 c0                	test   %al,%al
c0102d33:	75 e4                	jne    c0102d19 <strnlen+0xf>
		n++;
	return n;
c0102d35:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102d38:	c9                   	leave  
c0102d39:	c3                   	ret    

c0102d3a <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0102d3a:	55                   	push   %ebp
c0102d3b:	89 e5                	mov    %esp,%ebp
c0102d3d:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c0102d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d43:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0102d46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102d4d:	eb 23                	jmp    c0102d72 <strncpy+0x38>
		*dst++ = *src;
c0102d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d52:	8d 50 01             	lea    0x1(%eax),%edx
c0102d55:	89 55 08             	mov    %edx,0x8(%ebp)
c0102d58:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102d5b:	0f b6 12             	movzbl (%edx),%edx
c0102d5e:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c0102d60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d63:	0f b6 00             	movzbl (%eax),%eax
c0102d66:	84 c0                	test   %al,%al
c0102d68:	74 04                	je     c0102d6e <strncpy+0x34>
			src++;
c0102d6a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c0102d6e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102d72:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102d75:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102d78:	72 d5                	jb     c0102d4f <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c0102d7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0102d7d:	c9                   	leave  
c0102d7e:	c3                   	ret    

c0102d7f <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c0102d7f:	55                   	push   %ebp
c0102d80:	89 e5                	mov    %esp,%ebp
c0102d82:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c0102d85:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d88:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0102d8b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102d8f:	74 33                	je     c0102dc4 <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c0102d91:	eb 17                	jmp    c0102daa <strlcpy+0x2b>
			*dst++ = *src++;
c0102d93:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d96:	8d 50 01             	lea    0x1(%eax),%edx
c0102d99:	89 55 08             	mov    %edx,0x8(%ebp)
c0102d9c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102d9f:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102da2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c0102da5:	0f b6 12             	movzbl (%edx),%edx
c0102da8:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0102daa:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102dae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102db2:	74 0a                	je     c0102dbe <strlcpy+0x3f>
c0102db4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102db7:	0f b6 00             	movzbl (%eax),%eax
c0102dba:	84 c0                	test   %al,%al
c0102dbc:	75 d5                	jne    c0102d93 <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0102dbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dc1:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c0102dc4:	8b 55 08             	mov    0x8(%ebp),%edx
c0102dc7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102dca:	29 c2                	sub    %eax,%edx
c0102dcc:	89 d0                	mov    %edx,%eax
}
c0102dce:	c9                   	leave  
c0102dcf:	c3                   	ret    

c0102dd0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
c0102dd0:	55                   	push   %ebp
c0102dd1:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c0102dd3:	eb 08                	jmp    c0102ddd <strcmp+0xd>
		p++, q++;
c0102dd5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102dd9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0102ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102de0:	0f b6 00             	movzbl (%eax),%eax
c0102de3:	84 c0                	test   %al,%al
c0102de5:	74 10                	je     c0102df7 <strcmp+0x27>
c0102de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dea:	0f b6 10             	movzbl (%eax),%edx
c0102ded:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102df0:	0f b6 00             	movzbl (%eax),%eax
c0102df3:	38 c2                	cmp    %al,%dl
c0102df5:	74 de                	je     c0102dd5 <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c0102df7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dfa:	0f b6 00             	movzbl (%eax),%eax
c0102dfd:	0f b6 d0             	movzbl %al,%edx
c0102e00:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e03:	0f b6 00             	movzbl (%eax),%eax
c0102e06:	0f b6 c0             	movzbl %al,%eax
c0102e09:	29 c2                	sub    %eax,%edx
c0102e0b:	89 d0                	mov    %edx,%eax
}
c0102e0d:	5d                   	pop    %ebp
c0102e0e:	c3                   	ret    

c0102e0f <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0102e0f:	55                   	push   %ebp
c0102e10:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c0102e12:	eb 0c                	jmp    c0102e20 <strncmp+0x11>
		n--, p++, q++;
c0102e14:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102e18:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102e1c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c0102e20:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102e24:	74 1a                	je     c0102e40 <strncmp+0x31>
c0102e26:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e29:	0f b6 00             	movzbl (%eax),%eax
c0102e2c:	84 c0                	test   %al,%al
c0102e2e:	74 10                	je     c0102e40 <strncmp+0x31>
c0102e30:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e33:	0f b6 10             	movzbl (%eax),%edx
c0102e36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e39:	0f b6 00             	movzbl (%eax),%eax
c0102e3c:	38 c2                	cmp    %al,%dl
c0102e3e:	74 d4                	je     c0102e14 <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c0102e40:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102e44:	75 07                	jne    c0102e4d <strncmp+0x3e>
		return 0;
c0102e46:	b8 00 00 00 00       	mov    $0x0,%eax
c0102e4b:	eb 16                	jmp    c0102e63 <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c0102e4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e50:	0f b6 00             	movzbl (%eax),%eax
c0102e53:	0f b6 d0             	movzbl %al,%edx
c0102e56:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e59:	0f b6 00             	movzbl (%eax),%eax
c0102e5c:	0f b6 c0             	movzbl %al,%eax
c0102e5f:	29 c2                	sub    %eax,%edx
c0102e61:	89 d0                	mov    %edx,%eax
}
c0102e63:	5d                   	pop    %ebp
c0102e64:	c3                   	ret    

c0102e65 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c0102e65:	55                   	push   %ebp
c0102e66:	89 e5                	mov    %esp,%ebp
c0102e68:	83 ec 04             	sub    $0x4,%esp
c0102e6b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e6e:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102e71:	eb 14                	jmp    c0102e87 <strchr+0x22>
		if (*s == c)
c0102e73:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e76:	0f b6 00             	movzbl (%eax),%eax
c0102e79:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102e7c:	75 05                	jne    c0102e83 <strchr+0x1e>
			return (char *) s;
c0102e7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e81:	eb 13                	jmp    c0102e96 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c0102e83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e8a:	0f b6 00             	movzbl (%eax),%eax
c0102e8d:	84 c0                	test   %al,%al
c0102e8f:	75 e2                	jne    c0102e73 <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c0102e91:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102e96:	c9                   	leave  
c0102e97:	c3                   	ret    

c0102e98 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c0102e98:	55                   	push   %ebp
c0102e99:	89 e5                	mov    %esp,%ebp
c0102e9b:	83 ec 04             	sub    $0x4,%esp
c0102e9e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ea1:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102ea4:	eb 11                	jmp    c0102eb7 <strfind+0x1f>
		if (*s == c)
c0102ea6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ea9:	0f b6 00             	movzbl (%eax),%eax
c0102eac:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102eaf:	75 02                	jne    c0102eb3 <strfind+0x1b>
			break;
c0102eb1:	eb 0e                	jmp    c0102ec1 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0102eb3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102eb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102eba:	0f b6 00             	movzbl (%eax),%eax
c0102ebd:	84 c0                	test   %al,%al
c0102ebf:	75 e5                	jne    c0102ea6 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c0102ec1:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102ec4:	c9                   	leave  
c0102ec5:	c3                   	ret    

c0102ec6 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c0102ec6:	55                   	push   %ebp
c0102ec7:	89 e5                	mov    %esp,%ebp
c0102ec9:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0102ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ecf:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c0102ed2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ed5:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c0102ed8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102edb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102ede:	73 3d                	jae    c0102f1d <memmove+0x57>
c0102ee0:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ee3:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102ee6:	01 d0                	add    %edx,%eax
c0102ee8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102eeb:	76 30                	jbe    c0102f1d <memmove+0x57>
		s += n;
c0102eed:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ef0:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c0102ef3:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ef6:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c0102ef9:	eb 13                	jmp    c0102f0e <memmove+0x48>
			*--d = *--s;
c0102efb:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0102eff:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102f03:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102f06:	0f b6 10             	movzbl (%eax),%edx
c0102f09:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102f0c:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0102f0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f11:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102f14:	89 55 10             	mov    %edx,0x10(%ebp)
c0102f17:	85 c0                	test   %eax,%eax
c0102f19:	75 e0                	jne    c0102efb <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0102f1b:	eb 26                	jmp    c0102f43 <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102f1d:	eb 17                	jmp    c0102f36 <memmove+0x70>
			*d++ = *s++;
c0102f1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102f22:	8d 50 01             	lea    0x1(%eax),%edx
c0102f25:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0102f28:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102f2b:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102f2e:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0102f31:	0f b6 12             	movzbl (%edx),%edx
c0102f34:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102f36:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f39:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102f3c:	89 55 10             	mov    %edx,0x10(%ebp)
c0102f3f:	85 c0                	test   %eax,%eax
c0102f41:	75 dc                	jne    c0102f1f <memmove+0x59>
			*d++ = *s++;

	return dst;
c0102f43:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102f46:	c9                   	leave  
c0102f47:	c3                   	ret    

c0102f48 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0102f48:	55                   	push   %ebp
c0102f49:	89 e5                	mov    %esp,%ebp
c0102f4b:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c0102f4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f51:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c0102f54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f57:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0102f5a:	eb 30                	jmp    c0102f8c <memcmp+0x44>
		if (*s1 != *s2)
c0102f5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102f5f:	0f b6 10             	movzbl (%eax),%edx
c0102f62:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102f65:	0f b6 00             	movzbl (%eax),%eax
c0102f68:	38 c2                	cmp    %al,%dl
c0102f6a:	74 18                	je     c0102f84 <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c0102f6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102f6f:	0f b6 00             	movzbl (%eax),%eax
c0102f72:	0f b6 d0             	movzbl %al,%edx
c0102f75:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102f78:	0f b6 00             	movzbl (%eax),%eax
c0102f7b:	0f b6 c0             	movzbl %al,%eax
c0102f7e:	29 c2                	sub    %eax,%edx
c0102f80:	89 d0                	mov    %edx,%eax
c0102f82:	eb 1a                	jmp    c0102f9e <memcmp+0x56>
		s1++, s2++;
c0102f84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102f88:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c0102f8c:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f8f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102f92:	89 55 10             	mov    %edx,0x10(%ebp)
c0102f95:	85 c0                	test   %eax,%eax
c0102f97:	75 c3                	jne    c0102f5c <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c0102f99:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102f9e:	c9                   	leave  
c0102f9f:	c3                   	ret    

c0102fa0 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c0102fa0:	55                   	push   %ebp
c0102fa1:	89 e5                	mov    %esp,%ebp
c0102fa3:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c0102fa6:	8b 45 10             	mov    0x10(%ebp),%eax
c0102fa9:	8b 55 08             	mov    0x8(%ebp),%edx
c0102fac:	01 d0                	add    %edx,%eax
c0102fae:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c0102fb1:	eb 13                	jmp    c0102fc6 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c0102fb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fb6:	0f b6 10             	movzbl (%eax),%edx
c0102fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102fbc:	38 c2                	cmp    %al,%dl
c0102fbe:	75 02                	jne    c0102fc2 <memfind+0x22>
			break;
c0102fc0:	eb 0c                	jmp    c0102fce <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c0102fc2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102fc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fc9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0102fcc:	72 e5                	jb     c0102fb3 <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0102fce:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102fd1:	c9                   	leave  
c0102fd2:	c3                   	ret    

c0102fd3 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c0102fd3:	55                   	push   %ebp
c0102fd4:	89 e5                	mov    %esp,%ebp
c0102fd6:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c0102fd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c0102fe0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102fe7:	eb 04                	jmp    c0102fed <strtol+0x1a>
		s++;
c0102fe9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ff0:	0f b6 00             	movzbl (%eax),%eax
c0102ff3:	3c 20                	cmp    $0x20,%al
c0102ff5:	74 f2                	je     c0102fe9 <strtol+0x16>
c0102ff7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ffa:	0f b6 00             	movzbl (%eax),%eax
c0102ffd:	3c 09                	cmp    $0x9,%al
c0102fff:	74 e8                	je     c0102fe9 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c0103001:	8b 45 08             	mov    0x8(%ebp),%eax
c0103004:	0f b6 00             	movzbl (%eax),%eax
c0103007:	3c 2b                	cmp    $0x2b,%al
c0103009:	75 06                	jne    c0103011 <strtol+0x3e>
		s++;
c010300b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010300f:	eb 15                	jmp    c0103026 <strtol+0x53>
	else if (*s == '-')
c0103011:	8b 45 08             	mov    0x8(%ebp),%eax
c0103014:	0f b6 00             	movzbl (%eax),%eax
c0103017:	3c 2d                	cmp    $0x2d,%al
c0103019:	75 0b                	jne    c0103026 <strtol+0x53>
		s++, neg = 1;
c010301b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010301f:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c0103026:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010302a:	74 06                	je     c0103032 <strtol+0x5f>
c010302c:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0103030:	75 24                	jne    c0103056 <strtol+0x83>
c0103032:	8b 45 08             	mov    0x8(%ebp),%eax
c0103035:	0f b6 00             	movzbl (%eax),%eax
c0103038:	3c 30                	cmp    $0x30,%al
c010303a:	75 1a                	jne    c0103056 <strtol+0x83>
c010303c:	8b 45 08             	mov    0x8(%ebp),%eax
c010303f:	83 c0 01             	add    $0x1,%eax
c0103042:	0f b6 00             	movzbl (%eax),%eax
c0103045:	3c 78                	cmp    $0x78,%al
c0103047:	75 0d                	jne    c0103056 <strtol+0x83>
		s += 2, base = 16;
c0103049:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c010304d:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c0103054:	eb 2a                	jmp    c0103080 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c0103056:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010305a:	75 17                	jne    c0103073 <strtol+0xa0>
c010305c:	8b 45 08             	mov    0x8(%ebp),%eax
c010305f:	0f b6 00             	movzbl (%eax),%eax
c0103062:	3c 30                	cmp    $0x30,%al
c0103064:	75 0d                	jne    c0103073 <strtol+0xa0>
		s++, base = 8;
c0103066:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010306a:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c0103071:	eb 0d                	jmp    c0103080 <strtol+0xad>
	else if (base == 0)
c0103073:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103077:	75 07                	jne    c0103080 <strtol+0xad>
		base = 10;
c0103079:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c0103080:	8b 45 08             	mov    0x8(%ebp),%eax
c0103083:	0f b6 00             	movzbl (%eax),%eax
c0103086:	3c 2f                	cmp    $0x2f,%al
c0103088:	7e 1b                	jle    c01030a5 <strtol+0xd2>
c010308a:	8b 45 08             	mov    0x8(%ebp),%eax
c010308d:	0f b6 00             	movzbl (%eax),%eax
c0103090:	3c 39                	cmp    $0x39,%al
c0103092:	7f 11                	jg     c01030a5 <strtol+0xd2>
			dig = *s - '0';
c0103094:	8b 45 08             	mov    0x8(%ebp),%eax
c0103097:	0f b6 00             	movzbl (%eax),%eax
c010309a:	0f be c0             	movsbl %al,%eax
c010309d:	83 e8 30             	sub    $0x30,%eax
c01030a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01030a3:	eb 48                	jmp    c01030ed <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c01030a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01030a8:	0f b6 00             	movzbl (%eax),%eax
c01030ab:	3c 60                	cmp    $0x60,%al
c01030ad:	7e 1b                	jle    c01030ca <strtol+0xf7>
c01030af:	8b 45 08             	mov    0x8(%ebp),%eax
c01030b2:	0f b6 00             	movzbl (%eax),%eax
c01030b5:	3c 7a                	cmp    $0x7a,%al
c01030b7:	7f 11                	jg     c01030ca <strtol+0xf7>
			dig = *s - 'a' + 10;
c01030b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01030bc:	0f b6 00             	movzbl (%eax),%eax
c01030bf:	0f be c0             	movsbl %al,%eax
c01030c2:	83 e8 57             	sub    $0x57,%eax
c01030c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01030c8:	eb 23                	jmp    c01030ed <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c01030ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01030cd:	0f b6 00             	movzbl (%eax),%eax
c01030d0:	3c 40                	cmp    $0x40,%al
c01030d2:	7e 3d                	jle    c0103111 <strtol+0x13e>
c01030d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01030d7:	0f b6 00             	movzbl (%eax),%eax
c01030da:	3c 5a                	cmp    $0x5a,%al
c01030dc:	7f 33                	jg     c0103111 <strtol+0x13e>
			dig = *s - 'A' + 10;
c01030de:	8b 45 08             	mov    0x8(%ebp),%eax
c01030e1:	0f b6 00             	movzbl (%eax),%eax
c01030e4:	0f be c0             	movsbl %al,%eax
c01030e7:	83 e8 37             	sub    $0x37,%eax
c01030ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c01030ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01030f0:	3b 45 10             	cmp    0x10(%ebp),%eax
c01030f3:	7c 02                	jl     c01030f7 <strtol+0x124>
			break;
c01030f5:	eb 1a                	jmp    c0103111 <strtol+0x13e>
		s++, val = (val * base) + dig;
c01030f7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01030fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01030fe:	0f af 45 10          	imul   0x10(%ebp),%eax
c0103102:	89 c2                	mov    %eax,%edx
c0103104:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103107:	01 d0                	add    %edx,%eax
c0103109:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c010310c:	e9 6f ff ff ff       	jmp    c0103080 <strtol+0xad>

	if (endptr)
c0103111:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103115:	74 08                	je     c010311f <strtol+0x14c>
		*endptr = (char *) s;
c0103117:	8b 45 0c             	mov    0xc(%ebp),%eax
c010311a:	8b 55 08             	mov    0x8(%ebp),%edx
c010311d:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c010311f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0103123:	74 07                	je     c010312c <strtol+0x159>
c0103125:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103128:	f7 d8                	neg    %eax
c010312a:	eb 03                	jmp    c010312f <strtol+0x15c>
c010312c:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c010312f:	c9                   	leave  
c0103130:	c3                   	ret    

c0103131 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c0103131:	55                   	push   %ebp
c0103132:	89 e5                	mov    %esp,%ebp
c0103134:	53                   	push   %ebx
c0103135:	83 ec 34             	sub    $0x34,%esp
c0103138:	8b 45 10             	mov    0x10(%ebp),%eax
c010313b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010313e:	8b 45 14             	mov    0x14(%ebp),%eax
c0103141:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c0103144:	8b 45 18             	mov    0x18(%ebp),%eax
c0103147:	ba 00 00 00 00       	mov    $0x0,%edx
c010314c:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c010314f:	77 72                	ja     c01031c3 <printnum+0x92>
c0103151:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c0103154:	72 05                	jb     c010315b <printnum+0x2a>
c0103156:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0103159:	77 68                	ja     c01031c3 <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c010315b:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010315e:	8d 58 ff             	lea    -0x1(%eax),%ebx
c0103161:	8b 45 18             	mov    0x18(%ebp),%eax
c0103164:	ba 00 00 00 00       	mov    $0x0,%edx
c0103169:	89 44 24 08          	mov    %eax,0x8(%esp)
c010316d:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103171:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103174:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103177:	89 04 24             	mov    %eax,(%esp)
c010317a:	89 54 24 04          	mov    %edx,0x4(%esp)
c010317e:	e8 5d 06 00 00       	call   c01037e0 <__udivdi3>
c0103183:	8b 4d 20             	mov    0x20(%ebp),%ecx
c0103186:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c010318a:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c010318e:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103191:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103195:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103199:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010319d:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031a0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01031a7:	89 04 24             	mov    %eax,(%esp)
c01031aa:	e8 82 ff ff ff       	call   c0103131 <printnum>
c01031af:	eb 1c                	jmp    c01031cd <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c01031b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031b8:	8b 45 20             	mov    0x20(%ebp),%eax
c01031bb:	89 04 24             	mov    %eax,(%esp)
c01031be:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c1:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c01031c3:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c01031c7:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c01031cb:	7f e4                	jg     c01031b1 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c01031cd:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01031d0:	bb 00 00 00 00       	mov    $0x0,%ebx
c01031d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01031db:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01031df:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01031e3:	89 04 24             	mov    %eax,(%esp)
c01031e6:	89 54 24 04          	mov    %edx,0x4(%esp)
c01031ea:	e8 21 07 00 00       	call   c0103910 <__umoddi3>
c01031ef:	05 fc 3f 10 c0       	add    $0xc0103ffc,%eax
c01031f4:	0f b6 00             	movzbl (%eax),%eax
c01031f7:	0f be c0             	movsbl %al,%eax
c01031fa:	8b 55 0c             	mov    0xc(%ebp),%edx
c01031fd:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103201:	89 04 24             	mov    %eax,(%esp)
c0103204:	8b 45 08             	mov    0x8(%ebp),%eax
c0103207:	ff d0                	call   *%eax
}
c0103209:	83 c4 34             	add    $0x34,%esp
c010320c:	5b                   	pop    %ebx
c010320d:	5d                   	pop    %ebp
c010320e:	c3                   	ret    

c010320f <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c010320f:	55                   	push   %ebp
c0103210:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c0103212:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c0103216:	7e 14                	jle    c010322c <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c0103218:	8b 45 08             	mov    0x8(%ebp),%eax
c010321b:	8b 00                	mov    (%eax),%eax
c010321d:	8d 48 08             	lea    0x8(%eax),%ecx
c0103220:	8b 55 08             	mov    0x8(%ebp),%edx
c0103223:	89 0a                	mov    %ecx,(%edx)
c0103225:	8b 50 04             	mov    0x4(%eax),%edx
c0103228:	8b 00                	mov    (%eax),%eax
c010322a:	eb 30                	jmp    c010325c <getuint+0x4d>
	else if (lflag)
c010322c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103230:	74 16                	je     c0103248 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c0103232:	8b 45 08             	mov    0x8(%ebp),%eax
c0103235:	8b 00                	mov    (%eax),%eax
c0103237:	8d 48 04             	lea    0x4(%eax),%ecx
c010323a:	8b 55 08             	mov    0x8(%ebp),%edx
c010323d:	89 0a                	mov    %ecx,(%edx)
c010323f:	8b 00                	mov    (%eax),%eax
c0103241:	ba 00 00 00 00       	mov    $0x0,%edx
c0103246:	eb 14                	jmp    c010325c <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c0103248:	8b 45 08             	mov    0x8(%ebp),%eax
c010324b:	8b 00                	mov    (%eax),%eax
c010324d:	8d 48 04             	lea    0x4(%eax),%ecx
c0103250:	8b 55 08             	mov    0x8(%ebp),%edx
c0103253:	89 0a                	mov    %ecx,(%edx)
c0103255:	8b 00                	mov    (%eax),%eax
c0103257:	ba 00 00 00 00       	mov    $0x0,%edx
}
c010325c:	5d                   	pop    %ebp
c010325d:	c3                   	ret    

c010325e <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c010325e:	55                   	push   %ebp
c010325f:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c0103261:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c0103265:	7e 14                	jle    c010327b <getint+0x1d>
		return va_arg(*ap, long long);
c0103267:	8b 45 08             	mov    0x8(%ebp),%eax
c010326a:	8b 00                	mov    (%eax),%eax
c010326c:	8d 48 08             	lea    0x8(%eax),%ecx
c010326f:	8b 55 08             	mov    0x8(%ebp),%edx
c0103272:	89 0a                	mov    %ecx,(%edx)
c0103274:	8b 50 04             	mov    0x4(%eax),%edx
c0103277:	8b 00                	mov    (%eax),%eax
c0103279:	eb 28                	jmp    c01032a3 <getint+0x45>
	else if (lflag)
c010327b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010327f:	74 12                	je     c0103293 <getint+0x35>
		return va_arg(*ap, long);
c0103281:	8b 45 08             	mov    0x8(%ebp),%eax
c0103284:	8b 00                	mov    (%eax),%eax
c0103286:	8d 48 04             	lea    0x4(%eax),%ecx
c0103289:	8b 55 08             	mov    0x8(%ebp),%edx
c010328c:	89 0a                	mov    %ecx,(%edx)
c010328e:	8b 00                	mov    (%eax),%eax
c0103290:	99                   	cltd   
c0103291:	eb 10                	jmp    c01032a3 <getint+0x45>
	else
		return va_arg(*ap, int);
c0103293:	8b 45 08             	mov    0x8(%ebp),%eax
c0103296:	8b 00                	mov    (%eax),%eax
c0103298:	8d 48 04             	lea    0x4(%eax),%ecx
c010329b:	8b 55 08             	mov    0x8(%ebp),%edx
c010329e:	89 0a                	mov    %ecx,(%edx)
c01032a0:	8b 00                	mov    (%eax),%eax
c01032a2:	99                   	cltd   
}
c01032a3:	5d                   	pop    %ebp
c01032a4:	c3                   	ret    

c01032a5 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c01032a5:	55                   	push   %ebp
c01032a6:	89 e5                	mov    %esp,%ebp
c01032a8:	56                   	push   %esi
c01032a9:	53                   	push   %ebx
c01032aa:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01032ad:	eb 18                	jmp    c01032c7 <vprintfmt+0x22>
			if (ch == '\0')
c01032af:	85 db                	test   %ebx,%ebx
c01032b1:	75 05                	jne    c01032b8 <vprintfmt+0x13>
				return;
c01032b3:	e9 e9 03 00 00       	jmp    c01036a1 <vprintfmt+0x3fc>
			putch(ch, putdat);
c01032b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032bb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01032bf:	89 1c 24             	mov    %ebx,(%esp)
c01032c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01032c5:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01032c7:	8b 45 10             	mov    0x10(%ebp),%eax
c01032ca:	8d 50 01             	lea    0x1(%eax),%edx
c01032cd:	89 55 10             	mov    %edx,0x10(%ebp)
c01032d0:	0f b6 00             	movzbl (%eax),%eax
c01032d3:	0f b6 d8             	movzbl %al,%ebx
c01032d6:	83 fb 25             	cmp    $0x25,%ebx
c01032d9:	75 d4                	jne    c01032af <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c01032db:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c01032df:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c01032e6:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c01032ed:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c01032f4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c01032fb:	8b 45 10             	mov    0x10(%ebp),%eax
c01032fe:	8d 50 01             	lea    0x1(%eax),%edx
c0103301:	89 55 10             	mov    %edx,0x10(%ebp)
c0103304:	0f b6 00             	movzbl (%eax),%eax
c0103307:	0f b6 d8             	movzbl %al,%ebx
c010330a:	8d 43 dd             	lea    -0x23(%ebx),%eax
c010330d:	83 f8 55             	cmp    $0x55,%eax
c0103310:	0f 87 5a 03 00 00    	ja     c0103670 <vprintfmt+0x3cb>
c0103316:	8b 04 85 20 40 10 c0 	mov    -0x3fefbfe0(,%eax,4),%eax
c010331d:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c010331f:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c0103323:	eb d6                	jmp    c01032fb <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c0103325:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c0103329:	eb d0                	jmp    c01032fb <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c010332b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c0103332:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103335:	89 d0                	mov    %edx,%eax
c0103337:	c1 e0 02             	shl    $0x2,%eax
c010333a:	01 d0                	add    %edx,%eax
c010333c:	01 c0                	add    %eax,%eax
c010333e:	01 d8                	add    %ebx,%eax
c0103340:	83 e8 30             	sub    $0x30,%eax
c0103343:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c0103346:	8b 45 10             	mov    0x10(%ebp),%eax
c0103349:	0f b6 00             	movzbl (%eax),%eax
c010334c:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c010334f:	83 fb 2f             	cmp    $0x2f,%ebx
c0103352:	7e 0b                	jle    c010335f <vprintfmt+0xba>
c0103354:	83 fb 39             	cmp    $0x39,%ebx
c0103357:	7f 06                	jg     c010335f <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103359:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c010335d:	eb d3                	jmp    c0103332 <vprintfmt+0x8d>
			goto process_precision;
c010335f:	eb 33                	jmp    c0103394 <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c0103361:	8b 45 14             	mov    0x14(%ebp),%eax
c0103364:	8d 50 04             	lea    0x4(%eax),%edx
c0103367:	89 55 14             	mov    %edx,0x14(%ebp)
c010336a:	8b 00                	mov    (%eax),%eax
c010336c:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c010336f:	eb 23                	jmp    c0103394 <vprintfmt+0xef>

		case '.':
			if (width < 0)
c0103371:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103375:	79 0c                	jns    c0103383 <vprintfmt+0xde>
				width = 0;
c0103377:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c010337e:	e9 78 ff ff ff       	jmp    c01032fb <vprintfmt+0x56>
c0103383:	e9 73 ff ff ff       	jmp    c01032fb <vprintfmt+0x56>

		case '#':
			altflag = 1;
c0103388:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c010338f:	e9 67 ff ff ff       	jmp    c01032fb <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c0103394:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103398:	79 12                	jns    c01033ac <vprintfmt+0x107>
				width = precision, precision = -1;
c010339a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010339d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01033a0:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c01033a7:	e9 4f ff ff ff       	jmp    c01032fb <vprintfmt+0x56>
c01033ac:	e9 4a ff ff ff       	jmp    c01032fb <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c01033b1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c01033b5:	e9 41 ff ff ff       	jmp    c01032fb <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c01033ba:	8b 45 14             	mov    0x14(%ebp),%eax
c01033bd:	8d 50 04             	lea    0x4(%eax),%edx
c01033c0:	89 55 14             	mov    %edx,0x14(%ebp)
c01033c3:	8b 00                	mov    (%eax),%eax
c01033c5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01033c8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01033cc:	89 04 24             	mov    %eax,(%esp)
c01033cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01033d2:	ff d0                	call   *%eax
			break;
c01033d4:	e9 c2 02 00 00       	jmp    c010369b <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c01033d9:	8b 45 14             	mov    0x14(%ebp),%eax
c01033dc:	8d 50 04             	lea    0x4(%eax),%edx
c01033df:	89 55 14             	mov    %edx,0x14(%ebp)
c01033e2:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c01033e4:	85 db                	test   %ebx,%ebx
c01033e6:	79 02                	jns    c01033ea <vprintfmt+0x145>
				err = -err;
c01033e8:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c01033ea:	83 fb 06             	cmp    $0x6,%ebx
c01033ed:	7f 0b                	jg     c01033fa <vprintfmt+0x155>
c01033ef:	8b 34 9d e0 3f 10 c0 	mov    -0x3fefc020(,%ebx,4),%esi
c01033f6:	85 f6                	test   %esi,%esi
c01033f8:	75 23                	jne    c010341d <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c01033fa:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01033fe:	c7 44 24 08 0d 40 10 	movl   $0xc010400d,0x8(%esp)
c0103405:	c0 
c0103406:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103409:	89 44 24 04          	mov    %eax,0x4(%esp)
c010340d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103410:	89 04 24             	mov    %eax,(%esp)
c0103413:	e8 90 02 00 00       	call   c01036a8 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c0103418:	e9 7e 02 00 00       	jmp    c010369b <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c010341d:	89 74 24 0c          	mov    %esi,0xc(%esp)
c0103421:	c7 44 24 08 16 40 10 	movl   $0xc0104016,0x8(%esp)
c0103428:	c0 
c0103429:	8b 45 0c             	mov    0xc(%ebp),%eax
c010342c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103430:	8b 45 08             	mov    0x8(%ebp),%eax
c0103433:	89 04 24             	mov    %eax,(%esp)
c0103436:	e8 6d 02 00 00       	call   c01036a8 <printfmt>
			break;
c010343b:	e9 5b 02 00 00       	jmp    c010369b <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c0103440:	8b 45 14             	mov    0x14(%ebp),%eax
c0103443:	8d 50 04             	lea    0x4(%eax),%edx
c0103446:	89 55 14             	mov    %edx,0x14(%ebp)
c0103449:	8b 30                	mov    (%eax),%esi
c010344b:	85 f6                	test   %esi,%esi
c010344d:	75 05                	jne    c0103454 <vprintfmt+0x1af>
				p = "(null)";
c010344f:	be 19 40 10 c0       	mov    $0xc0104019,%esi
			if (width > 0 && padc != '-')
c0103454:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103458:	7e 37                	jle    c0103491 <vprintfmt+0x1ec>
c010345a:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c010345e:	74 31                	je     c0103491 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c0103460:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103463:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103467:	89 34 24             	mov    %esi,(%esp)
c010346a:	e8 9b f8 ff ff       	call   c0102d0a <strnlen>
c010346f:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0103472:	eb 17                	jmp    c010348b <vprintfmt+0x1e6>
					putch(padc, putdat);
c0103474:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c0103478:	8b 55 0c             	mov    0xc(%ebp),%edx
c010347b:	89 54 24 04          	mov    %edx,0x4(%esp)
c010347f:	89 04 24             	mov    %eax,(%esp)
c0103482:	8b 45 08             	mov    0x8(%ebp),%eax
c0103485:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c0103487:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c010348b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c010348f:	7f e3                	jg     c0103474 <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c0103491:	eb 38                	jmp    c01034cb <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c0103493:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0103497:	74 1f                	je     c01034b8 <vprintfmt+0x213>
c0103499:	83 fb 1f             	cmp    $0x1f,%ebx
c010349c:	7e 05                	jle    c01034a3 <vprintfmt+0x1fe>
c010349e:	83 fb 7e             	cmp    $0x7e,%ebx
c01034a1:	7e 15                	jle    c01034b8 <vprintfmt+0x213>
					putch('?', putdat);
c01034a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034a6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034aa:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c01034b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01034b4:	ff d0                	call   *%eax
c01034b6:	eb 0f                	jmp    c01034c7 <vprintfmt+0x222>
				else
					putch(ch, putdat);
c01034b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034bb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034bf:	89 1c 24             	mov    %ebx,(%esp)
c01034c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c5:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c01034c7:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01034cb:	89 f0                	mov    %esi,%eax
c01034cd:	8d 70 01             	lea    0x1(%eax),%esi
c01034d0:	0f b6 00             	movzbl (%eax),%eax
c01034d3:	0f be d8             	movsbl %al,%ebx
c01034d6:	85 db                	test   %ebx,%ebx
c01034d8:	74 10                	je     c01034ea <vprintfmt+0x245>
c01034da:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01034de:	78 b3                	js     c0103493 <vprintfmt+0x1ee>
c01034e0:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c01034e4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01034e8:	79 a9                	jns    c0103493 <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c01034ea:	eb 17                	jmp    c0103503 <vprintfmt+0x25e>
				putch(' ', putdat);
c01034ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034ef:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034f3:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c01034fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01034fd:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c01034ff:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103503:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103507:	7f e3                	jg     c01034ec <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103509:	e9 8d 01 00 00       	jmp    c010369b <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c010350e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103511:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103515:	8d 45 14             	lea    0x14(%ebp),%eax
c0103518:	89 04 24             	mov    %eax,(%esp)
c010351b:	e8 3e fd ff ff       	call   c010325e <getint>
c0103520:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103523:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c0103526:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103529:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010352c:	85 d2                	test   %edx,%edx
c010352e:	79 26                	jns    c0103556 <vprintfmt+0x2b1>
				putch('-', putdat);
c0103530:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103533:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103537:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c010353e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103541:	ff d0                	call   *%eax
				num = -(long long) num;
c0103543:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103546:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103549:	f7 d8                	neg    %eax
c010354b:	83 d2 00             	adc    $0x0,%edx
c010354e:	f7 da                	neg    %edx
c0103550:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103553:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0103556:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c010355d:	e9 c5 00 00 00       	jmp    c0103627 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c0103562:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103565:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103569:	8d 45 14             	lea    0x14(%ebp),%eax
c010356c:	89 04 24             	mov    %eax,(%esp)
c010356f:	e8 9b fc ff ff       	call   c010320f <getuint>
c0103574:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103577:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c010357a:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0103581:	e9 a1 00 00 00       	jmp    c0103627 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c0103586:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103589:	89 44 24 04          	mov    %eax,0x4(%esp)
c010358d:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103594:	8b 45 08             	mov    0x8(%ebp),%eax
c0103597:	ff d0                	call   *%eax
			putch('X', putdat);
c0103599:	8b 45 0c             	mov    0xc(%ebp),%eax
c010359c:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035a0:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01035a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01035aa:	ff d0                	call   *%eax
			putch('X', putdat);
c01035ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035af:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035b3:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01035ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01035bd:	ff d0                	call   *%eax
			break;
c01035bf:	e9 d7 00 00 00       	jmp    c010369b <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c01035c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035c7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035cb:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c01035d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01035d5:	ff d0                	call   *%eax
			putch('x', putdat);
c01035d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035da:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035de:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c01035e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01035e8:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c01035ea:	8b 45 14             	mov    0x14(%ebp),%eax
c01035ed:	8d 50 04             	lea    0x4(%eax),%edx
c01035f0:	89 55 14             	mov    %edx,0x14(%ebp)
c01035f3:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c01035f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c01035ff:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0103606:	eb 1f                	jmp    c0103627 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103608:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010360b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010360f:	8d 45 14             	lea    0x14(%ebp),%eax
c0103612:	89 04 24             	mov    %eax,(%esp)
c0103615:	e8 f5 fb ff ff       	call   c010320f <getuint>
c010361a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010361d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103620:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0103627:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c010362b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010362e:	89 54 24 18          	mov    %edx,0x18(%esp)
c0103632:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103635:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103639:	89 44 24 10          	mov    %eax,0x10(%esp)
c010363d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103640:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103643:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103647:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010364b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010364e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103652:	8b 45 08             	mov    0x8(%ebp),%eax
c0103655:	89 04 24             	mov    %eax,(%esp)
c0103658:	e8 d4 fa ff ff       	call   c0103131 <printnum>
			break;
c010365d:	eb 3c                	jmp    c010369b <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c010365f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103662:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103666:	89 1c 24             	mov    %ebx,(%esp)
c0103669:	8b 45 08             	mov    0x8(%ebp),%eax
c010366c:	ff d0                	call   *%eax
			break;
c010366e:	eb 2b                	jmp    c010369b <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c0103670:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103673:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103677:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c010367e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103681:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c0103683:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0103687:	eb 04                	jmp    c010368d <vprintfmt+0x3e8>
c0103689:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c010368d:	8b 45 10             	mov    0x10(%ebp),%eax
c0103690:	83 e8 01             	sub    $0x1,%eax
c0103693:	0f b6 00             	movzbl (%eax),%eax
c0103696:	3c 25                	cmp    $0x25,%al
c0103698:	75 ef                	jne    c0103689 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c010369a:	90                   	nop
		}
	}
c010369b:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c010369c:	e9 26 fc ff ff       	jmp    c01032c7 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c01036a1:	83 c4 40             	add    $0x40,%esp
c01036a4:	5b                   	pop    %ebx
c01036a5:	5e                   	pop    %esi
c01036a6:	5d                   	pop    %ebp
c01036a7:	c3                   	ret    

c01036a8 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c01036a8:	55                   	push   %ebp
c01036a9:	89 e5                	mov    %esp,%ebp
c01036ab:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c01036ae:	8d 45 14             	lea    0x14(%ebp),%eax
c01036b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c01036b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036b7:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01036bb:	8b 45 10             	mov    0x10(%ebp),%eax
c01036be:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036c5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01036cc:	89 04 24             	mov    %eax,(%esp)
c01036cf:	e8 d1 fb ff ff       	call   c01032a5 <vprintfmt>
	va_end(ap);
}
c01036d4:	c9                   	leave  
c01036d5:	c3                   	ret    

c01036d6 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c01036d6:	55                   	push   %ebp
c01036d7:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c01036d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036dc:	8b 40 08             	mov    0x8(%eax),%eax
c01036df:	8d 50 01             	lea    0x1(%eax),%edx
c01036e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036e5:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c01036e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036eb:	8b 10                	mov    (%eax),%edx
c01036ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036f0:	8b 40 04             	mov    0x4(%eax),%eax
c01036f3:	39 c2                	cmp    %eax,%edx
c01036f5:	73 12                	jae    c0103709 <sprintputch+0x33>
		*b->buf++ = ch;
c01036f7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036fa:	8b 00                	mov    (%eax),%eax
c01036fc:	8d 48 01             	lea    0x1(%eax),%ecx
c01036ff:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103702:	89 0a                	mov    %ecx,(%edx)
c0103704:	8b 55 08             	mov    0x8(%ebp),%edx
c0103707:	88 10                	mov    %dl,(%eax)
}
c0103709:	5d                   	pop    %ebp
c010370a:	c3                   	ret    

c010370b <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c010370b:	55                   	push   %ebp
c010370c:	89 e5                	mov    %esp,%ebp
c010370e:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103711:	8b 45 08             	mov    0x8(%ebp),%eax
c0103714:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103717:	8b 45 0c             	mov    0xc(%ebp),%eax
c010371a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010371d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103720:	01 d0                	add    %edx,%eax
c0103722:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103725:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c010372c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103730:	74 06                	je     c0103738 <vsnprintf+0x2d>
c0103732:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103736:	7f 07                	jg     c010373f <vsnprintf+0x34>
		return -E_INVAL;
c0103738:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c010373d:	eb 2a                	jmp    c0103769 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c010373f:	8b 45 14             	mov    0x14(%ebp),%eax
c0103742:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103746:	8b 45 10             	mov    0x10(%ebp),%eax
c0103749:	89 44 24 08          	mov    %eax,0x8(%esp)
c010374d:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0103750:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103754:	c7 04 24 d6 36 10 c0 	movl   $0xc01036d6,(%esp)
c010375b:	e8 45 fb ff ff       	call   c01032a5 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c0103760:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103763:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c0103766:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0103769:	c9                   	leave  
c010376a:	c3                   	ret    

c010376b <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c010376b:	55                   	push   %ebp
c010376c:	89 e5                	mov    %esp,%ebp
c010376e:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c0103771:	8d 45 14             	lea    0x14(%ebp),%eax
c0103774:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c0103777:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010377a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010377e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103781:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103785:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103788:	89 44 24 04          	mov    %eax,0x4(%esp)
c010378c:	8b 45 08             	mov    0x8(%ebp),%eax
c010378f:	89 04 24             	mov    %eax,(%esp)
c0103792:	e8 74 ff ff ff       	call   c010370b <vsnprintf>
c0103797:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c010379a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c010379d:	c9                   	leave  
c010379e:	c3                   	ret    

c010379f <srand>:
static int seed = 0;

void
srand(int s) {
c010379f:	55                   	push   %ebp
c01037a0:	89 e5                	mov    %esp,%ebp
	seed = s;
c01037a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01037a5:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c01037aa:	5d                   	pop    %ebp
c01037ab:	c3                   	ret    

c01037ac <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c01037ac:	55                   	push   %ebp
c01037ad:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c01037af:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c01037b4:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c01037ba:	83 c0 01             	add    $0x1,%eax
c01037bd:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c01037c2:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c01037c7:	c1 f8 10             	sar    $0x10,%eax
c01037ca:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c01037cf:	5d                   	pop    %ebp
c01037d0:	c3                   	ret    
c01037d1:	66 90                	xchg   %ax,%ax
c01037d3:	66 90                	xchg   %ax,%ax
c01037d5:	66 90                	xchg   %ax,%ax
c01037d7:	66 90                	xchg   %ax,%ax
c01037d9:	66 90                	xchg   %ax,%ax
c01037db:	66 90                	xchg   %ax,%ax
c01037dd:	66 90                	xchg   %ax,%ax
c01037df:	90                   	nop

c01037e0 <__udivdi3>:
c01037e0:	55                   	push   %ebp
c01037e1:	57                   	push   %edi
c01037e2:	56                   	push   %esi
c01037e3:	83 ec 0c             	sub    $0xc,%esp
c01037e6:	8b 44 24 28          	mov    0x28(%esp),%eax
c01037ea:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c01037ee:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c01037f2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c01037f6:	85 c0                	test   %eax,%eax
c01037f8:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01037fc:	89 ea                	mov    %ebp,%edx
c01037fe:	89 0c 24             	mov    %ecx,(%esp)
c0103801:	75 2d                	jne    c0103830 <__udivdi3+0x50>
c0103803:	39 e9                	cmp    %ebp,%ecx
c0103805:	77 61                	ja     c0103868 <__udivdi3+0x88>
c0103807:	85 c9                	test   %ecx,%ecx
c0103809:	89 ce                	mov    %ecx,%esi
c010380b:	75 0b                	jne    c0103818 <__udivdi3+0x38>
c010380d:	b8 01 00 00 00       	mov    $0x1,%eax
c0103812:	31 d2                	xor    %edx,%edx
c0103814:	f7 f1                	div    %ecx
c0103816:	89 c6                	mov    %eax,%esi
c0103818:	31 d2                	xor    %edx,%edx
c010381a:	89 e8                	mov    %ebp,%eax
c010381c:	f7 f6                	div    %esi
c010381e:	89 c5                	mov    %eax,%ebp
c0103820:	89 f8                	mov    %edi,%eax
c0103822:	f7 f6                	div    %esi
c0103824:	89 ea                	mov    %ebp,%edx
c0103826:	83 c4 0c             	add    $0xc,%esp
c0103829:	5e                   	pop    %esi
c010382a:	5f                   	pop    %edi
c010382b:	5d                   	pop    %ebp
c010382c:	c3                   	ret    
c010382d:	8d 76 00             	lea    0x0(%esi),%esi
c0103830:	39 e8                	cmp    %ebp,%eax
c0103832:	77 24                	ja     c0103858 <__udivdi3+0x78>
c0103834:	0f bd e8             	bsr    %eax,%ebp
c0103837:	83 f5 1f             	xor    $0x1f,%ebp
c010383a:	75 3c                	jne    c0103878 <__udivdi3+0x98>
c010383c:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103840:	39 34 24             	cmp    %esi,(%esp)
c0103843:	0f 86 9f 00 00 00    	jbe    c01038e8 <__udivdi3+0x108>
c0103849:	39 d0                	cmp    %edx,%eax
c010384b:	0f 82 97 00 00 00    	jb     c01038e8 <__udivdi3+0x108>
c0103851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103858:	31 d2                	xor    %edx,%edx
c010385a:	31 c0                	xor    %eax,%eax
c010385c:	83 c4 0c             	add    $0xc,%esp
c010385f:	5e                   	pop    %esi
c0103860:	5f                   	pop    %edi
c0103861:	5d                   	pop    %ebp
c0103862:	c3                   	ret    
c0103863:	90                   	nop
c0103864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103868:	89 f8                	mov    %edi,%eax
c010386a:	f7 f1                	div    %ecx
c010386c:	31 d2                	xor    %edx,%edx
c010386e:	83 c4 0c             	add    $0xc,%esp
c0103871:	5e                   	pop    %esi
c0103872:	5f                   	pop    %edi
c0103873:	5d                   	pop    %ebp
c0103874:	c3                   	ret    
c0103875:	8d 76 00             	lea    0x0(%esi),%esi
c0103878:	89 e9                	mov    %ebp,%ecx
c010387a:	8b 3c 24             	mov    (%esp),%edi
c010387d:	d3 e0                	shl    %cl,%eax
c010387f:	89 c6                	mov    %eax,%esi
c0103881:	b8 20 00 00 00       	mov    $0x20,%eax
c0103886:	29 e8                	sub    %ebp,%eax
c0103888:	89 c1                	mov    %eax,%ecx
c010388a:	d3 ef                	shr    %cl,%edi
c010388c:	89 e9                	mov    %ebp,%ecx
c010388e:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0103892:	8b 3c 24             	mov    (%esp),%edi
c0103895:	09 74 24 08          	or     %esi,0x8(%esp)
c0103899:	89 d6                	mov    %edx,%esi
c010389b:	d3 e7                	shl    %cl,%edi
c010389d:	89 c1                	mov    %eax,%ecx
c010389f:	89 3c 24             	mov    %edi,(%esp)
c01038a2:	8b 7c 24 04          	mov    0x4(%esp),%edi
c01038a6:	d3 ee                	shr    %cl,%esi
c01038a8:	89 e9                	mov    %ebp,%ecx
c01038aa:	d3 e2                	shl    %cl,%edx
c01038ac:	89 c1                	mov    %eax,%ecx
c01038ae:	d3 ef                	shr    %cl,%edi
c01038b0:	09 d7                	or     %edx,%edi
c01038b2:	89 f2                	mov    %esi,%edx
c01038b4:	89 f8                	mov    %edi,%eax
c01038b6:	f7 74 24 08          	divl   0x8(%esp)
c01038ba:	89 d6                	mov    %edx,%esi
c01038bc:	89 c7                	mov    %eax,%edi
c01038be:	f7 24 24             	mull   (%esp)
c01038c1:	39 d6                	cmp    %edx,%esi
c01038c3:	89 14 24             	mov    %edx,(%esp)
c01038c6:	72 30                	jb     c01038f8 <__udivdi3+0x118>
c01038c8:	8b 54 24 04          	mov    0x4(%esp),%edx
c01038cc:	89 e9                	mov    %ebp,%ecx
c01038ce:	d3 e2                	shl    %cl,%edx
c01038d0:	39 c2                	cmp    %eax,%edx
c01038d2:	73 05                	jae    c01038d9 <__udivdi3+0xf9>
c01038d4:	3b 34 24             	cmp    (%esp),%esi
c01038d7:	74 1f                	je     c01038f8 <__udivdi3+0x118>
c01038d9:	89 f8                	mov    %edi,%eax
c01038db:	31 d2                	xor    %edx,%edx
c01038dd:	e9 7a ff ff ff       	jmp    c010385c <__udivdi3+0x7c>
c01038e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01038e8:	31 d2                	xor    %edx,%edx
c01038ea:	b8 01 00 00 00       	mov    $0x1,%eax
c01038ef:	e9 68 ff ff ff       	jmp    c010385c <__udivdi3+0x7c>
c01038f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01038f8:	8d 47 ff             	lea    -0x1(%edi),%eax
c01038fb:	31 d2                	xor    %edx,%edx
c01038fd:	83 c4 0c             	add    $0xc,%esp
c0103900:	5e                   	pop    %esi
c0103901:	5f                   	pop    %edi
c0103902:	5d                   	pop    %ebp
c0103903:	c3                   	ret    
c0103904:	66 90                	xchg   %ax,%ax
c0103906:	66 90                	xchg   %ax,%ax
c0103908:	66 90                	xchg   %ax,%ax
c010390a:	66 90                	xchg   %ax,%ax
c010390c:	66 90                	xchg   %ax,%ax
c010390e:	66 90                	xchg   %ax,%ax

c0103910 <__umoddi3>:
c0103910:	55                   	push   %ebp
c0103911:	57                   	push   %edi
c0103912:	56                   	push   %esi
c0103913:	83 ec 14             	sub    $0x14,%esp
c0103916:	8b 44 24 28          	mov    0x28(%esp),%eax
c010391a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c010391e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103922:	89 c7                	mov    %eax,%edi
c0103924:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103928:	8b 44 24 30          	mov    0x30(%esp),%eax
c010392c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103930:	89 34 24             	mov    %esi,(%esp)
c0103933:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103937:	85 c0                	test   %eax,%eax
c0103939:	89 c2                	mov    %eax,%edx
c010393b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c010393f:	75 17                	jne    c0103958 <__umoddi3+0x48>
c0103941:	39 fe                	cmp    %edi,%esi
c0103943:	76 4b                	jbe    c0103990 <__umoddi3+0x80>
c0103945:	89 c8                	mov    %ecx,%eax
c0103947:	89 fa                	mov    %edi,%edx
c0103949:	f7 f6                	div    %esi
c010394b:	89 d0                	mov    %edx,%eax
c010394d:	31 d2                	xor    %edx,%edx
c010394f:	83 c4 14             	add    $0x14,%esp
c0103952:	5e                   	pop    %esi
c0103953:	5f                   	pop    %edi
c0103954:	5d                   	pop    %ebp
c0103955:	c3                   	ret    
c0103956:	66 90                	xchg   %ax,%ax
c0103958:	39 f8                	cmp    %edi,%eax
c010395a:	77 54                	ja     c01039b0 <__umoddi3+0xa0>
c010395c:	0f bd e8             	bsr    %eax,%ebp
c010395f:	83 f5 1f             	xor    $0x1f,%ebp
c0103962:	75 5c                	jne    c01039c0 <__umoddi3+0xb0>
c0103964:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0103968:	39 3c 24             	cmp    %edi,(%esp)
c010396b:	0f 87 e7 00 00 00    	ja     c0103a58 <__umoddi3+0x148>
c0103971:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0103975:	29 f1                	sub    %esi,%ecx
c0103977:	19 c7                	sbb    %eax,%edi
c0103979:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010397d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103981:	8b 44 24 08          	mov    0x8(%esp),%eax
c0103985:	8b 54 24 0c          	mov    0xc(%esp),%edx
c0103989:	83 c4 14             	add    $0x14,%esp
c010398c:	5e                   	pop    %esi
c010398d:	5f                   	pop    %edi
c010398e:	5d                   	pop    %ebp
c010398f:	c3                   	ret    
c0103990:	85 f6                	test   %esi,%esi
c0103992:	89 f5                	mov    %esi,%ebp
c0103994:	75 0b                	jne    c01039a1 <__umoddi3+0x91>
c0103996:	b8 01 00 00 00       	mov    $0x1,%eax
c010399b:	31 d2                	xor    %edx,%edx
c010399d:	f7 f6                	div    %esi
c010399f:	89 c5                	mov    %eax,%ebp
c01039a1:	8b 44 24 04          	mov    0x4(%esp),%eax
c01039a5:	31 d2                	xor    %edx,%edx
c01039a7:	f7 f5                	div    %ebp
c01039a9:	89 c8                	mov    %ecx,%eax
c01039ab:	f7 f5                	div    %ebp
c01039ad:	eb 9c                	jmp    c010394b <__umoddi3+0x3b>
c01039af:	90                   	nop
c01039b0:	89 c8                	mov    %ecx,%eax
c01039b2:	89 fa                	mov    %edi,%edx
c01039b4:	83 c4 14             	add    $0x14,%esp
c01039b7:	5e                   	pop    %esi
c01039b8:	5f                   	pop    %edi
c01039b9:	5d                   	pop    %ebp
c01039ba:	c3                   	ret    
c01039bb:	90                   	nop
c01039bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01039c0:	8b 04 24             	mov    (%esp),%eax
c01039c3:	be 20 00 00 00       	mov    $0x20,%esi
c01039c8:	89 e9                	mov    %ebp,%ecx
c01039ca:	29 ee                	sub    %ebp,%esi
c01039cc:	d3 e2                	shl    %cl,%edx
c01039ce:	89 f1                	mov    %esi,%ecx
c01039d0:	d3 e8                	shr    %cl,%eax
c01039d2:	89 e9                	mov    %ebp,%ecx
c01039d4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039d8:	8b 04 24             	mov    (%esp),%eax
c01039db:	09 54 24 04          	or     %edx,0x4(%esp)
c01039df:	89 fa                	mov    %edi,%edx
c01039e1:	d3 e0                	shl    %cl,%eax
c01039e3:	89 f1                	mov    %esi,%ecx
c01039e5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01039e9:	8b 44 24 10          	mov    0x10(%esp),%eax
c01039ed:	d3 ea                	shr    %cl,%edx
c01039ef:	89 e9                	mov    %ebp,%ecx
c01039f1:	d3 e7                	shl    %cl,%edi
c01039f3:	89 f1                	mov    %esi,%ecx
c01039f5:	d3 e8                	shr    %cl,%eax
c01039f7:	89 e9                	mov    %ebp,%ecx
c01039f9:	09 f8                	or     %edi,%eax
c01039fb:	8b 7c 24 10          	mov    0x10(%esp),%edi
c01039ff:	f7 74 24 04          	divl   0x4(%esp)
c0103a03:	d3 e7                	shl    %cl,%edi
c0103a05:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103a09:	89 d7                	mov    %edx,%edi
c0103a0b:	f7 64 24 08          	mull   0x8(%esp)
c0103a0f:	39 d7                	cmp    %edx,%edi
c0103a11:	89 c1                	mov    %eax,%ecx
c0103a13:	89 14 24             	mov    %edx,(%esp)
c0103a16:	72 2c                	jb     c0103a44 <__umoddi3+0x134>
c0103a18:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c0103a1c:	72 22                	jb     c0103a40 <__umoddi3+0x130>
c0103a1e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103a22:	29 c8                	sub    %ecx,%eax
c0103a24:	19 d7                	sbb    %edx,%edi
c0103a26:	89 e9                	mov    %ebp,%ecx
c0103a28:	89 fa                	mov    %edi,%edx
c0103a2a:	d3 e8                	shr    %cl,%eax
c0103a2c:	89 f1                	mov    %esi,%ecx
c0103a2e:	d3 e2                	shl    %cl,%edx
c0103a30:	89 e9                	mov    %ebp,%ecx
c0103a32:	d3 ef                	shr    %cl,%edi
c0103a34:	09 d0                	or     %edx,%eax
c0103a36:	89 fa                	mov    %edi,%edx
c0103a38:	83 c4 14             	add    $0x14,%esp
c0103a3b:	5e                   	pop    %esi
c0103a3c:	5f                   	pop    %edi
c0103a3d:	5d                   	pop    %ebp
c0103a3e:	c3                   	ret    
c0103a3f:	90                   	nop
c0103a40:	39 d7                	cmp    %edx,%edi
c0103a42:	75 da                	jne    c0103a1e <__umoddi3+0x10e>
c0103a44:	8b 14 24             	mov    (%esp),%edx
c0103a47:	89 c1                	mov    %eax,%ecx
c0103a49:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c0103a4d:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0103a51:	eb cb                	jmp    c0103a1e <__umoddi3+0x10e>
c0103a53:	90                   	nop
c0103a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103a58:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c0103a5c:	0f 82 0f ff ff ff    	jb     c0103971 <__umoddi3+0x61>
c0103a62:	e9 1a ff ff ff       	jmp    c0103981 <__umoddi3+0x71>
