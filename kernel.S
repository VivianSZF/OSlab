
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
	printk("%d\n",tf->eax);
c0100006:	8b 45 08             	mov    0x8(%ebp),%eax
c0100009:	8b 40 1c             	mov    0x1c(%eax),%eax
c010000c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100010:	c7 04 24 b8 3a 10 c0 	movl   $0xc0103ab8,(%esp)
c0100017:	e8 f5 28 00 00       	call   c0102911 <printk>
	switch(tf->eax) {
c010001c:	8b 45 08             	mov    0x8(%ebp),%eax
c010001f:	8b 40 1c             	mov    0x1c(%eax),%eax
c0100022:	83 f8 08             	cmp    $0x8,%eax
c0100025:	0f 87 ac 00 00 00    	ja     c01000d7 <do_syscall+0xd7>
c010002b:	8b 04 85 08 3b 10 c0 	mov    -0x3fefc4f8(,%eax,4),%eax
c0100032:	ff e0                	jmp    *%eax
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c0100034:	8b 45 08             	mov    0x8(%ebp),%eax
c0100037:	8b 40 10             	mov    0x10(%eax),%eax
c010003a:	89 04 24             	mov    %eax,(%esp)
c010003d:	e8 a1 09 00 00       	call   c01009e3 <sys_pr>
c0100042:	89 c2                	mov    %eax,%edx
c0100044:	8b 45 08             	mov    0x8(%ebp),%eax
c0100047:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010004a:	e9 b8 00 00 00       	jmp    c0100107 <do_syscall+0x107>
		case SYS_time:
			tf->eax=sys_time();
c010004f:	e8 da 00 00 00       	call   c010012e <sys_time>
c0100054:	89 c2                	mov    %eax,%edx
c0100056:	8b 45 08             	mov    0x8(%ebp),%eax
c0100059:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010005c:	e9 a6 00 00 00       	jmp    c0100107 <do_syscall+0x107>
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
c0100061:	e8 d2 00 00 00       	call   c0100138 <sys_readkey>
c0100066:	89 c2                	mov    %eax,%edx
c0100068:	8b 45 08             	mov    0x8(%ebp),%eax
c010006b:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010006e:	e9 94 00 00 00       	jmp    c0100107 <do_syscall+0x107>
		case SYS_write: 
			tf->eax=sys_write(tf->ebx,(void*)tf->ecx,tf->edx); 
c0100073:	8b 45 08             	mov    0x8(%ebp),%eax
c0100076:	8b 40 14             	mov    0x14(%eax),%eax
c0100079:	89 c1                	mov    %eax,%ecx
c010007b:	8b 45 08             	mov    0x8(%ebp),%eax
c010007e:	8b 40 18             	mov    0x18(%eax),%eax
c0100081:	89 c2                	mov    %eax,%edx
c0100083:	8b 45 08             	mov    0x8(%ebp),%eax
c0100086:	8b 40 10             	mov    0x10(%eax),%eax
c0100089:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010008d:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100091:	89 04 24             	mov    %eax,(%esp)
c0100094:	e8 e9 27 00 00       	call   c0102882 <sys_write>
c0100099:	89 c2                	mov    %eax,%edx
c010009b:	8b 45 08             	mov    0x8(%ebp),%eax
c010009e:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c01000a1:	eb 64                	jmp    c0100107 <do_syscall+0x107>
		case SYS_fork:
			sys_fork();
c01000a3:	e8 d0 14 00 00       	call   c0101578 <sys_fork>
			break;
c01000a8:	eb 5d                	jmp    c0100107 <do_syscall+0x107>
		case SYS_getpid:
			tf->eax=sys_getpid();
c01000aa:	e8 19 15 00 00       	call   c01015c8 <sys_getpid>
c01000af:	8b 55 08             	mov    0x8(%ebp),%edx
c01000b2:	89 42 1c             	mov    %eax,0x1c(%edx)
			break;
c01000b5:	eb 50                	jmp    c0100107 <do_syscall+0x107>
		case SYS_exit:
			sys_exit(tf->ebx);
c01000b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ba:	8b 40 10             	mov    0x10(%eax),%eax
c01000bd:	89 04 24             	mov    %eax,(%esp)
c01000c0:	e8 10 15 00 00       	call   c01015d5 <sys_exit>
			break;
c01000c5:	eb 40                	jmp    c0100107 <do_syscall+0x107>
		case SYS_sleep:
			sys_sleep(tf->ebx);
c01000c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ca:	8b 40 10             	mov    0x10(%eax),%eax
c01000cd:	89 04 24             	mov    %eax,(%esp)
c01000d0:	e8 57 16 00 00       	call   c010172c <sys_sleep>
			break;
c01000d5:	eb 30                	jmp    c0100107 <do_syscall+0x107>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c01000d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01000da:	8b 50 38             	mov    0x38(%eax),%edx
c01000dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01000e0:	8b 40 1c             	mov    0x1c(%eax),%eax
c01000e3:	89 54 24 10          	mov    %edx,0x10(%esp)
c01000e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01000eb:	c7 44 24 08 bc 3a 10 	movl   $0xc0103abc,0x8(%esp)
c01000f2:	c0 
c01000f3:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
c01000fa:	00 
c01000fb:	c7 04 24 e9 3a 10 c0 	movl   $0xc0103ae9,(%esp)
c0100102:	e8 db 26 00 00       	call   c01027e2 <_panic>
 	}
} 
c0100107:	c9                   	leave  
c0100108:	c3                   	ret    

c0100109 <enable_interrupt>:
	asm volatile("lidt (%0)" : : "r"(data));
}

/* 打开外部中断 */
static inline void
enable_interrupt(void) {
c0100109:	55                   	push   %ebp
c010010a:	89 e5                	mov    %esp,%ebp
	asm volatile("sti");
c010010c:	fb                   	sti    
}
c010010d:	5d                   	pop    %ebp
c010010e:	c3                   	ret    

c010010f <timer_event>:
void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
c010010f:	55                   	push   %ebp
c0100110:	89 e5                	mov    %esp,%ebp
	tick++;
c0100112:	a1 00 10 11 c0       	mov    0xc0111000,%eax
c0100117:	83 c0 01             	add    $0x1,%eax
c010011a:	a3 00 10 11 c0       	mov    %eax,0xc0111000
}
c010011f:	5d                   	pop    %ebp
c0100120:	c3                   	ret    

c0100121 <keyboard_event>:
static int last_code = -1;
void keyboard_event(int code)
{
c0100121:	55                   	push   %ebp
c0100122:	89 e5                	mov    %esp,%ebp
	last_code = code;
c0100124:	8b 45 08             	mov    0x8(%ebp),%eax
c0100127:	a3 00 60 10 c0       	mov    %eax,0xc0106000
}
c010012c:	5d                   	pop    %ebp
c010012d:	c3                   	ret    

c010012e <sys_time>:
int sys_time(void)
{
c010012e:	55                   	push   %ebp
c010012f:	89 e5                	mov    %esp,%ebp
	return tick;
c0100131:	a1 00 10 11 c0       	mov    0xc0111000,%eax
}
c0100136:	5d                   	pop    %ebp
c0100137:	c3                   	ret    

c0100138 <sys_readkey>:
int sys_readkey(void)
{
c0100138:	55                   	push   %ebp
c0100139:	89 e5                	mov    %esp,%ebp
c010013b:	83 ec 10             	sub    $0x10,%esp
	int code = last_code;
c010013e:	a1 00 60 10 c0       	mov    0xc0106000,%eax
c0100143:	89 45 fc             	mov    %eax,-0x4(%ebp)
	last_code = -1;
c0100146:	c7 05 00 60 10 c0 ff 	movl   $0xffffffff,0xc0106000
c010014d:	ff ff ff 
	return code;
c0100150:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0100153:	c9                   	leave  
c0100154:	c3                   	ret    

c0100155 <main>:

int main()
{
c0100155:	55                   	push   %ebp
c0100156:	89 e5                	mov    %esp,%ebp
c0100158:	83 e4 f0             	and    $0xfffffff0,%esp
c010015b:	83 ec 10             	sub    $0x10,%esp
	page_init();
c010015e:	e8 d3 17 00 00       	call   c0101936 <page_init>
	//printk("here");
	init_segment();
c0100163:	e8 2d 25 00 00       	call   c0102695 <init_segment>
	pcb_init();
c0100168:	e8 2d 0c 00 00       	call   c0100d9a <pcb_init>
	//printk("here");
	init_serial();
c010016d:	e8 93 08 00 00       	call   c0100a05 <init_serial>
	init_video();
c0100172:	e8 5c 07 00 00       	call   c01008d3 <init_video>
	init_timer();
c0100177:	e8 7d 09 00 00       	call   c0100af9 <init_timer>
	init_idt();
c010017c:	e8 73 02 00 00       	call   c01003f4 <init_idt>
	init_intr();
c0100181:	e8 31 00 00 00       	call   c01001b7 <init_intr>
	
	//printk("here");

	set_timer_intr_handler(timer_event);
c0100186:	c7 04 24 0f 01 10 c0 	movl   $0xc010010f,(%esp)
c010018d:	e8 80 05 00 00       	call   c0100712 <set_timer_intr_handler>
	set_keyboard_intr_handler(keyboard_event);
c0100192:	c7 04 24 21 01 10 c0 	movl   $0xc0100121,(%esp)
c0100199:	e8 81 05 00 00       	call   c010071f <set_keyboard_intr_handler>
	//printk("here");
	pcb_new();
c010019e:	e8 39 10 00 00       	call   c01011dc <pcb_new>
	//PCB* p=pcb_new();
	enable_interrupt();
c01001a3:	e8 61 ff ff ff       	call   c0100109 <enable_interrupt>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c01001a8:	f4                   	hlt    
	hlt();
	printk("we are here");
c01001a9:	c7 04 24 2c 3b 10 c0 	movl   $0xc0103b2c,(%esp)
c01001b0:	e8 5c 27 00 00       	call   c0102911 <printk>
	//to_user(p);
	//printk("here");
	while(1);
c01001b5:	eb fe                	jmp    c01001b5 <main+0x60>

c01001b7 <init_intr>:
#define IRQ_SLAVE	2

/* 初始�?259中断控制器：
 * 硬件中断IRQ�?2号开始，自动发送EOI */
void
init_intr(void) {
c01001b7:	55                   	push   %ebp
c01001b8:	89 e5                	mov    %esp,%ebp
c01001ba:	83 ec 70             	sub    $0x70,%esp
c01001bd:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
c01001c4:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01001c8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01001cc:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01001cf:	ee                   	out    %al,(%dx)
c01001d0:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
c01001d7:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
c01001db:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c01001df:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01001e2:	ee                   	out    %al,(%dx)
c01001e3:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c01001ea:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
c01001ee:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01001f2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01001f5:	ee                   	out    %al,(%dx)
c01001f6:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
c01001fd:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
c0100201:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100205:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100208:	ee                   	out    %al,(%dx)
c0100209:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
c0100210:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
c0100214:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100218:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010021b:	ee                   	out    %al,(%dx)
c010021c:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
c0100223:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
c0100227:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c010022b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010022e:	ee                   	out    %al,(%dx)
c010022f:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
c0100236:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
c010023a:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c010023e:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100241:	ee                   	out    %al,(%dx)
c0100242:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
c0100249:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
c010024d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0100251:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0100254:	ee                   	out    %al,(%dx)
c0100255:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
c010025c:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
c0100260:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0100264:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0100267:	ee                   	out    %al,(%dx)
c0100268:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
c010026f:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
c0100273:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
c0100277:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010027a:	ee                   	out    %al,(%dx)
c010027b:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
c0100282:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
c0100286:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
c010028a:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010028d:	ee                   	out    %al,(%dx)
c010028e:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
c0100295:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
c0100299:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
c010029d:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01002a0:	ee                   	out    %al,(%dx)
c01002a1:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
c01002a8:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
c01002ac:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
c01002b0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01002b3:	ee                   	out    %al,(%dx)
c01002b4:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
c01002bb:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
c01002bf:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
c01002c3:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01002c6:	ee                   	out    %al,(%dx)
	outb(IO_PIC1, 0x68);             /* clear specific mask */
	outb(IO_PIC1, 0x0a);             /* read IRR by default */

	outb(IO_PIC2, 0x68);             /* OCW3 */
	outb(IO_PIC2, 0x0a);             /* OCW3 */
}
c01002c7:	c9                   	leave  
c01002c8:	c3                   	ret    

c01002c9 <save_idt>:
	asm volatile("hlt");
}

/* 修改IDRT */
static inline void
save_idt(void *addr, uint32_t size) {
c01002c9:	55                   	push   %ebp
c01002ca:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c01002cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01002cf:	83 e8 01             	sub    $0x1,%eax
c01002d2:	66 a3 04 10 11 c0    	mov    %ax,0xc0111004
	data[1] = (uint32_t)addr;
c01002d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01002db:	66 a3 06 10 11 c0    	mov    %ax,0xc0111006
	data[2] = ((uint32_t)addr) >> 16;
c01002e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01002e4:	c1 e8 10             	shr    $0x10,%eax
c01002e7:	66 a3 08 10 11 c0    	mov    %ax,0xc0111008
	asm volatile("lidt (%0)" : : "r"(data));
c01002ed:	b8 04 10 11 c0       	mov    $0xc0111004,%eax
c01002f2:	0f 01 18             	lidtl  (%eax)
}
c01002f5:	5d                   	pop    %ebp
c01002f6:	c3                   	ret    

c01002f7 <set_intr>:
/* IDT表的内容 */
struct Gatedesc idt[NR_IRQ];

/* 初始化一个中断门(interrupt gate) */
static void
set_intr(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c01002f7:	55                   	push   %ebp
c01002f8:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c01002fa:	8b 45 10             	mov    0x10(%ebp),%eax
c01002fd:	89 c2                	mov    %eax,%edx
c01002ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0100302:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100305:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100308:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010030f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100312:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100316:	8b 45 08             	mov    0x8(%ebp),%eax
c0100319:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = INTERRUPT_GATE_32;
c010031d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100320:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100324:	83 e2 f0             	and    $0xfffffff0,%edx
c0100327:	83 ca 0e             	or     $0xe,%edx
c010032a:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c010032d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100330:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100334:	83 e2 ef             	and    $0xffffffef,%edx
c0100337:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c010033a:	8b 45 14             	mov    0x14(%ebp),%eax
c010033d:	83 e0 03             	and    $0x3,%eax
c0100340:	89 c2                	mov    %eax,%edx
c0100342:	8b 45 08             	mov    0x8(%ebp),%eax
c0100345:	83 e2 03             	and    $0x3,%edx
c0100348:	89 d1                	mov    %edx,%ecx
c010034a:	c1 e1 05             	shl    $0x5,%ecx
c010034d:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100351:	83 e2 9f             	and    $0xffffff9f,%edx
c0100354:	09 ca                	or     %ecx,%edx
c0100356:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c0100359:	8b 45 08             	mov    0x8(%ebp),%eax
c010035c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100360:	83 ca 80             	or     $0xffffff80,%edx
c0100363:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100366:	8b 45 10             	mov    0x10(%ebp),%eax
c0100369:	c1 e8 10             	shr    $0x10,%eax
c010036c:	89 c2                	mov    %eax,%edx
c010036e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100371:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100375:	5d                   	pop    %ebp
c0100376:	c3                   	ret    

c0100377 <set_trap>:

/* 初始化一个陷阱门(trap gate) */
static void
set_trap(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100377:	55                   	push   %ebp
c0100378:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c010037a:	8b 45 10             	mov    0x10(%ebp),%eax
c010037d:	89 c2                	mov    %eax,%edx
c010037f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100382:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100385:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100388:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010038f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100392:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100396:	8b 45 08             	mov    0x8(%ebp),%eax
c0100399:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = TRAP_GATE_32;
c010039d:	8b 45 08             	mov    0x8(%ebp),%eax
c01003a0:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003a4:	83 ca 0f             	or     $0xf,%edx
c01003a7:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c01003aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01003ad:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003b1:	83 e2 ef             	and    $0xffffffef,%edx
c01003b4:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c01003b7:	8b 45 14             	mov    0x14(%ebp),%eax
c01003ba:	83 e0 03             	and    $0x3,%eax
c01003bd:	89 c2                	mov    %eax,%edx
c01003bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01003c2:	83 e2 03             	and    $0x3,%edx
c01003c5:	89 d1                	mov    %edx,%ecx
c01003c7:	c1 e1 05             	shl    $0x5,%ecx
c01003ca:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003ce:	83 e2 9f             	and    $0xffffff9f,%edx
c01003d1:	09 ca                	or     %ecx,%edx
c01003d3:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c01003d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d9:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01003dd:	83 ca 80             	or     $0xffffff80,%edx
c01003e0:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c01003e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01003e6:	c1 e8 10             	shr    $0x10,%eax
c01003e9:	89 c2                	mov    %eax,%edx
c01003eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01003ee:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c01003f2:	5d                   	pop    %ebp
c01003f3:	c3                   	ret    

c01003f4 <init_idt>:
void vec13();
void vec14();
void vecsys();
void irq_empty();

void init_idt() {
c01003f4:	55                   	push   %ebp
c01003f5:	89 e5                	mov    %esp,%ebp
c01003f7:	83 ec 20             	sub    $0x20,%esp
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01003fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100401:	eb 31                	jmp    c0100434 <init_idt+0x40>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
c0100403:	b8 e2 29 10 c0       	mov    $0xc01029e2,%eax
c0100408:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010040b:	c1 e2 03             	shl    $0x3,%edx
c010040e:	81 c2 20 4f 16 c0    	add    $0xc0164f20,%edx
c0100414:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010041b:	00 
c010041c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100420:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100427:	00 
c0100428:	89 14 24             	mov    %edx,(%esp)
c010042b:	e8 47 ff ff ff       	call   c0100377 <set_trap>
void irq_empty();

void init_idt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c0100430:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100434:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
c010043b:	7e c6                	jle    c0100403 <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
	}

	/* 设置异常的中断处�?*/
	set_trap(idt + 0, SEG_KERNEL_CODE, (uint32_t)vec0, DPL_KERNEL);
c010043d:	b8 37 29 10 c0       	mov    $0xc0102937,%eax
c0100442:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100449:	00 
c010044a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010044e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100455:	00 
c0100456:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c010045d:	e8 15 ff ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c0100462:	b8 40 29 10 c0       	mov    $0xc0102940,%eax
c0100467:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010046e:	00 
c010046f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100473:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010047a:	00 
c010047b:	c7 04 24 28 4f 16 c0 	movl   $0xc0164f28,(%esp)
c0100482:	e8 f0 fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100487:	b8 49 29 10 c0       	mov    $0xc0102949,%eax
c010048c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100493:	00 
c0100494:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100498:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010049f:	00 
c01004a0:	c7 04 24 30 4f 16 c0 	movl   $0xc0164f30,(%esp)
c01004a7:	e8 cb fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c01004ac:	b8 52 29 10 c0       	mov    $0xc0102952,%eax
c01004b1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004b8:	00 
c01004b9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004bd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004c4:	00 
c01004c5:	c7 04 24 38 4f 16 c0 	movl   $0xc0164f38,(%esp)
c01004cc:	e8 a6 fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c01004d1:	b8 5b 29 10 c0       	mov    $0xc010295b,%eax
c01004d6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004dd:	00 
c01004de:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004e2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004e9:	00 
c01004ea:	c7 04 24 40 4f 16 c0 	movl   $0xc0164f40,(%esp)
c01004f1:	e8 81 fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c01004f6:	b8 64 29 10 c0       	mov    $0xc0102964,%eax
c01004fb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100502:	00 
c0100503:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100507:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010050e:	00 
c010050f:	c7 04 24 48 4f 16 c0 	movl   $0xc0164f48,(%esp)
c0100516:	e8 5c fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c010051b:	b8 6d 29 10 c0       	mov    $0xc010296d,%eax
c0100520:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100527:	00 
c0100528:	89 44 24 08          	mov    %eax,0x8(%esp)
c010052c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100533:	00 
c0100534:	c7 04 24 50 4f 16 c0 	movl   $0xc0164f50,(%esp)
c010053b:	e8 37 fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c0100540:	b8 76 29 10 c0       	mov    $0xc0102976,%eax
c0100545:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010054c:	00 
c010054d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100551:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100558:	00 
c0100559:	c7 04 24 58 4f 16 c0 	movl   $0xc0164f58,(%esp)
c0100560:	e8 12 fe ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c0100565:	b8 7f 29 10 c0       	mov    $0xc010297f,%eax
c010056a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100571:	00 
c0100572:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100576:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010057d:	00 
c010057e:	c7 04 24 60 4f 16 c0 	movl   $0xc0164f60,(%esp)
c0100585:	e8 ed fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c010058a:	b8 86 29 10 c0       	mov    $0xc0102986,%eax
c010058f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100596:	00 
c0100597:	89 44 24 08          	mov    %eax,0x8(%esp)
c010059b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005a2:	00 
c01005a3:	c7 04 24 68 4f 16 c0 	movl   $0xc0164f68,(%esp)
c01005aa:	e8 c8 fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c01005af:	b8 8f 29 10 c0       	mov    $0xc010298f,%eax
c01005b4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005bb:	00 
c01005bc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005c0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005c7:	00 
c01005c8:	c7 04 24 70 4f 16 c0 	movl   $0xc0164f70,(%esp)
c01005cf:	e8 a3 fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c01005d4:	b8 96 29 10 c0       	mov    $0xc0102996,%eax
c01005d9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005e0:	00 
c01005e1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005e5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005ec:	00 
c01005ed:	c7 04 24 78 4f 16 c0 	movl   $0xc0164f78,(%esp)
c01005f4:	e8 7e fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c01005f9:	b8 9d 29 10 c0       	mov    $0xc010299d,%eax
c01005fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100605:	00 
c0100606:	89 44 24 08          	mov    %eax,0x8(%esp)
c010060a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100611:	00 
c0100612:	c7 04 24 80 4f 16 c0 	movl   $0xc0164f80,(%esp)
c0100619:	e8 59 fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c010061e:	b8 a4 29 10 c0       	mov    $0xc01029a4,%eax
c0100623:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010062a:	00 
c010062b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010062f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100636:	00 
c0100637:	c7 04 24 88 4f 16 c0 	movl   $0xc0164f88,(%esp)
c010063e:	e8 34 fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c0100643:	b8 ab 29 10 c0       	mov    $0xc01029ab,%eax
c0100648:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010064f:	00 
c0100650:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100654:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010065b:	00 
c010065c:	c7 04 24 90 4f 16 c0 	movl   $0xc0164f90,(%esp)
c0100663:	e8 0f fd ff ff       	call   c0100377 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100668:	b8 b2 29 10 c0       	mov    $0xc01029b2,%eax
c010066d:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c0100674:	00 
c0100675:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100679:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100680:	00 
c0100681:	c7 04 24 20 53 16 c0 	movl   $0xc0165320,(%esp)
c0100688:	e8 ea fc ff ff       	call   c0100377 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c010068d:	b8 be 29 10 c0       	mov    $0xc01029be,%eax
c0100692:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100699:	00 
c010069a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010069e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006a5:	00 
c01006a6:	c7 04 24 20 50 16 c0 	movl   $0xc0165020,(%esp)
c01006ad:	e8 45 fc ff ff       	call   c01002f7 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c01006b2:	b8 ca 29 10 c0       	mov    $0xc01029ca,%eax
c01006b7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006be:	00 
c01006bf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006c3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006ca:	00 
c01006cb:	c7 04 24 28 50 16 c0 	movl   $0xc0165028,(%esp)
c01006d2:	e8 20 fc ff ff       	call   c01002f7 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c01006d7:	b8 d6 29 10 c0       	mov    $0xc01029d6,%eax
c01006dc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01006e3:	00 
c01006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006e8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01006ef:	00 
c01006f0:	c7 04 24 90 50 16 c0 	movl   $0xc0165090,(%esp)
c01006f7:	e8 fb fb ff ff       	call   c01002f7 <set_intr>
	 * x86.h提供了相关内联汇编的支持
	 * 然后将hlt()删除
	 * 
	 * */
	
	save_idt(idt, sizeof(idt));
c01006fc:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
c0100703:	00 
c0100704:	c7 04 24 20 4f 16 c0 	movl   $0xc0164f20,(%esp)
c010070b:	e8 b9 fb ff ff       	call   c01002c9 <save_idt>
}
c0100710:	c9                   	leave  
c0100711:	c3                   	ret    

c0100712 <set_timer_intr_handler>:

static void (*do_timer)(void);
static void (*do_keyboard)(int);

void
set_timer_intr_handler( void (*ptr)(void) ) {
c0100712:	55                   	push   %ebp
c0100713:	89 e5                	mov    %esp,%ebp
	do_timer = ptr;
c0100715:	8b 45 08             	mov    0x8(%ebp),%eax
c0100718:	a3 0c 10 11 c0       	mov    %eax,0xc011100c
}
c010071d:	5d                   	pop    %ebp
c010071e:	c3                   	ret    

c010071f <set_keyboard_intr_handler>:
void
set_keyboard_intr_handler( void (*ptr)(int) ) {
c010071f:	55                   	push   %ebp
c0100720:	89 e5                	mov    %esp,%ebp
	do_keyboard = ptr;
c0100722:	8b 45 08             	mov    0x8(%ebp),%eax
c0100725:	a3 10 10 11 c0       	mov    %eax,0xc0111010
}
c010072a:	5d                   	pop    %ebp
c010072b:	c3                   	ret    

c010072c <irq_handle>:

/* TrapFrame的定义在include/memory.h
 * 请仔细理解这段程序的含义，这些内容将在后续的实验中被反复使用�?*/
void
irq_handle(struct TrapFrame *tf) {
c010072c:	55                   	push   %ebp
c010072d:	89 e5                	mov    %esp,%ebp
c010072f:	83 ec 48             	sub    $0x48,%esp
	pcbnow->tf=tf;
c0100732:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0100737:	8b 55 08             	mov    0x8(%ebp),%edx
c010073a:	89 10                	mov    %edx,(%eax)
	if (tf->irq == 0x80) {
c010073c:	8b 45 08             	mov    0x8(%ebp),%eax
c010073f:	8b 40 30             	mov    0x30(%eax),%eax
c0100742:	3d 80 00 00 00       	cmp    $0x80,%eax
c0100747:	75 10                	jne    c0100759 <irq_handle+0x2d>
		do_syscall(tf);
c0100749:	8b 45 08             	mov    0x8(%ebp),%eax
c010074c:	89 04 24             	mov    %eax,(%esp)
c010074f:	e8 ac f8 ff ff       	call   c0100000 <do_syscall>
c0100754:	e9 78 01 00 00       	jmp    c01008d1 <irq_handle+0x1a5>
	}
	else if(tf->irq < 1000) {
c0100759:	8b 45 08             	mov    0x8(%ebp),%eax
c010075c:	8b 40 30             	mov    0x30(%eax),%eax
c010075f:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100764:	7f 73                	jg     c01007d9 <irq_handle+0xad>
		if(tf->irq == -1) {
c0100766:	8b 45 08             	mov    0x8(%ebp),%eax
c0100769:	8b 40 30             	mov    0x30(%eax),%eax
c010076c:	83 f8 ff             	cmp    $0xffffffff,%eax
c010076f:	75 1e                	jne    c010078f <irq_handle+0x63>
			printk("%s, %d: Unhandled exception!\n", __FUNCTION__, __LINE__);
c0100771:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
c0100778:	00 
c0100779:	c7 44 24 04 aa 3b 10 	movl   $0xc0103baa,0x4(%esp)
c0100780:	c0 
c0100781:	c7 04 24 38 3b 10 c0 	movl   $0xc0103b38,(%esp)
c0100788:	e8 84 21 00 00       	call   c0102911 <printk>
c010078d:	eb 26                	jmp    c01007b5 <irq_handle+0x89>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c010078f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100792:	8b 40 30             	mov    0x30(%eax),%eax
c0100795:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100799:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c01007a0:	00 
c01007a1:	c7 44 24 04 aa 3b 10 	movl   $0xc0103baa,0x4(%esp)
c01007a8:	c0 
c01007a9:	c7 04 24 58 3b 10 c0 	movl   $0xc0103b58,(%esp)
c01007b0:	e8 5c 21 00 00       	call   c0102911 <printk>
		}
		assert(0);
c01007b5:	c7 44 24 0c 7b 3b 10 	movl   $0xc0103b7b,0xc(%esp)
c01007bc:	c0 
c01007bd:	c7 44 24 08 7d 3b 10 	movl   $0xc0103b7d,0x8(%esp)
c01007c4:	c0 
c01007c5:	c7 44 24 04 23 00 00 	movl   $0x23,0x4(%esp)
c01007cc:	00 
c01007cd:	c7 04 24 92 3b 10 c0 	movl   $0xc0103b92,(%esp)
c01007d4:	e8 09 20 00 00       	call   c01027e2 <_panic>
	}

	else if (tf->irq == 1000) {
c01007d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01007dc:	8b 40 30             	mov    0x30(%eax),%eax
c01007df:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c01007e4:	75 11                	jne    c01007f7 <irq_handle+0xcb>
		do_timer();
c01007e6:	a1 0c 10 11 c0       	mov    0xc011100c,%eax
c01007eb:	ff d0                	call   *%eax
		schedule();
c01007ed:	e8 3e 1b 00 00       	call   c0102330 <schedule>
c01007f2:	e9 da 00 00 00       	jmp    c01008d1 <irq_handle+0x1a5>
	} else if (tf->irq == 1001) {
c01007f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01007fa:	8b 40 30             	mov    0x30(%eax),%eax
c01007fd:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c0100802:	75 76                	jne    c010087a <irq_handle+0x14e>
c0100804:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c010080b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010080e:	89 c2                	mov    %eax,%edx
c0100810:	ec                   	in     (%dx),%al
c0100811:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c0100814:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c0100818:	0f b6 c0             	movzbl %al,%eax
c010081b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010081e:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100825:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100828:	89 c2                	mov    %eax,%edx
c010082a:	ec                   	in     (%dx),%al
c010082b:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c010082e:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c0100832:	0f b6 c0             	movzbl %al,%eax
c0100835:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c0100838:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010083b:	83 c8 80             	or     $0xffffff80,%eax
c010083e:	0f b6 c0             	movzbl %al,%eax
c0100841:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c0100848:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c010084b:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c010084f:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100852:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c0100853:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100856:	0f b6 c0             	movzbl %al,%eax
c0100859:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c0100860:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0100863:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100867:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010086a:	ee                   	out    %al,(%dx)
		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c010086b:	a1 10 10 11 c0       	mov    0xc0111010,%eax
c0100870:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100873:	89 14 24             	mov    %edx,(%esp)
c0100876:	ff d0                	call   *%eax
c0100878:	eb 57                	jmp    c01008d1 <irq_handle+0x1a5>
	}else if(tf->irq==1014){
c010087a:	8b 45 08             	mov    0x8(%ebp),%eax
c010087d:	8b 40 30             	mov    0x30(%eax),%eax
c0100880:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c0100885:	74 4a                	je     c01008d1 <irq_handle+0x1a5>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100887:	8b 45 08             	mov    0x8(%ebp),%eax
c010088a:	8b 40 30             	mov    0x30(%eax),%eax
c010088d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100891:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
c0100898:	00 
c0100899:	c7 44 24 04 aa 3b 10 	movl   $0xc0103baa,0x4(%esp)
c01008a0:	c0 
c01008a1:	c7 04 24 58 3b 10 c0 	movl   $0xc0103b58,(%esp)
c01008a8:	e8 64 20 00 00       	call   c0102911 <printk>
		assert(0);
c01008ad:	c7 44 24 0c 7b 3b 10 	movl   $0xc0103b7b,0xc(%esp)
c01008b4:	c0 
c01008b5:	c7 44 24 08 7d 3b 10 	movl   $0xc0103b7d,0x8(%esp)
c01008bc:	c0 
c01008bd:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c01008c4:	00 
c01008c5:	c7 04 24 92 3b 10 c0 	movl   $0xc0103b92,(%esp)
c01008cc:	e8 11 1f 00 00       	call   c01027e2 <_panic>
	}
}
c01008d1:	c9                   	leave  
c01008d2:	c3                   	ret    

c01008d3 <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c01008d3:	55                   	push   %ebp
c01008d4:	89 e5                	mov    %esp,%ebp
c01008d6:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c01008d9:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008e0:	00 
c01008e1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008e8:	00 
c01008e9:	c7 04 24 20 10 11 c0 	movl   $0xc0111020,(%esp)
c01008f0:	e8 00 24 00 00       	call   c0102cf5 <memset>
	memset(vref, 0, SCR_SIZE);
c01008f5:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008fc:	00 
c01008fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100904:	00 
c0100905:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c010090c:	e8 e4 23 00 00       	call   c0102cf5 <memset>
}
c0100911:	c9                   	leave  
c0100912:	c3                   	ret    

c0100913 <prepare_buffer>:

void prepare_buffer(void) {
c0100913:	55                   	push   %ebp
c0100914:	89 e5                	mov    %esp,%ebp
c0100916:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c0100919:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100920:	00 
c0100921:	c7 44 24 04 20 10 11 	movl   $0xc0111020,0x4(%esp)
c0100928:	c0 
c0100929:	c7 04 24 20 0a 12 c0 	movl   $0xc0120a20,(%esp)
c0100930:	e8 a3 23 00 00       	call   c0102cd8 <memcpy>
#endif
	vmem = vbuf;
c0100935:	c7 05 04 60 10 c0 20 	movl   $0xc0111020,0xc0106004
c010093c:	10 11 c0 
	memset(vmem, 0, SCR_SIZE);
c010093f:	a1 04 60 10 c0       	mov    0xc0106004,%eax
c0100944:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010094b:	00 
c010094c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100953:	00 
c0100954:	89 04 24             	mov    %eax,(%esp)
c0100957:	e8 99 23 00 00       	call   c0102cf5 <memset>
}
c010095c:	c9                   	leave  
c010095d:	c3                   	ret    

c010095e <display_buffer>:

void display_buffer(void) {
c010095e:	55                   	push   %ebp
c010095f:	89 e5                	mov    %esp,%ebp
c0100961:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c0100964:	c7 45 f8 20 10 11 c0 	movl   $0xc0111020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c010096b:	c7 45 f4 20 0a 12 c0 	movl   $0xc0120a20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c0100972:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c0100979:	c7 05 04 60 10 c0 00 	movl   $0xa0000,0xc0106004
c0100980:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100983:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010098a:	eb 4c                	jmp    c01009d8 <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c010098c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010098f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100996:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0100999:	01 d0                	add    %edx,%eax
c010099b:	8b 10                	mov    (%eax),%edx
c010099d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01009a0:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c01009a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01009aa:	01 c8                	add    %ecx,%eax
c01009ac:	8b 00                	mov    (%eax),%eax
c01009ae:	39 c2                	cmp    %eax,%edx
c01009b0:	74 22                	je     c01009d4 <display_buffer+0x76>
			mem[i] = buf[i];
c01009b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01009b5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01009bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01009bf:	01 c2                	add    %eax,%edx
c01009c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01009c4:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c01009cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01009ce:	01 c8                	add    %ecx,%eax
c01009d0:	8b 00                	mov    (%eax),%eax
c01009d2:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c01009d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01009d8:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c01009df:	7e ab                	jle    c010098c <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c01009e1:	c9                   	leave  
c01009e2:	c3                   	ret    

c01009e3 <sys_pr>:

void sys_pr(void *src)
{
c01009e3:	55                   	push   %ebp
c01009e4:	89 e5                	mov    %esp,%ebp
c01009e6:	57                   	push   %edi
c01009e7:	56                   	push   %esi
c01009e8:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c01009e9:	8b 1d 04 60 10 c0    	mov    0xc0106004,%ebx
c01009ef:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c01009f4:	8b 55 08             	mov    0x8(%ebp),%edx
c01009f7:	89 c1                	mov    %eax,%ecx
c01009f9:	89 d6                	mov    %edx,%esi
c01009fb:	89 df                	mov    %ebx,%edi
c01009fd:	fc                   	cld    
c01009fe:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c0100a00:	5b                   	pop    %ebx
c0100a01:	5e                   	pop    %esi
c0100a02:	5f                   	pop    %edi
c0100a03:	5d                   	pop    %ebp
c0100a04:	c3                   	ret    

c0100a05 <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c0100a05:	55                   	push   %ebp
c0100a06:	89 e5                	mov    %esp,%ebp
c0100a08:	83 ec 40             	sub    $0x40,%esp
c0100a0b:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c0100a12:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c0100a16:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100a1a:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100a1d:	ee                   	out    %al,(%dx)
c0100a1e:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c0100a25:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c0100a29:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100a2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a30:	ee                   	out    %al,(%dx)
c0100a31:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c0100a38:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0100a3c:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100a40:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100a43:	ee                   	out    %al,(%dx)
c0100a44:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c0100a4b:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c0100a4f:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100a53:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100a56:	ee                   	out    %al,(%dx)
c0100a57:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c0100a5e:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100a62:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100a66:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100a69:	ee                   	out    %al,(%dx)
c0100a6a:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100a71:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100a75:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100a79:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100a7c:	ee                   	out    %al,(%dx)
c0100a7d:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100a84:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100a88:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100a8c:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100a8f:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100a90:	c9                   	leave  
c0100a91:	c3                   	ret    

c0100a92 <serial_idle>:

static inline int serial_idle(void) {
c0100a92:	55                   	push   %ebp
c0100a93:	89 e5                	mov    %esp,%ebp
c0100a95:	83 ec 10             	sub    $0x10,%esp
c0100a98:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100a9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100aa2:	89 c2                	mov    %eax,%edx
c0100aa4:	ec                   	in     (%dx),%al
c0100aa5:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100aa8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100aac:	0f b6 c0             	movzbl %al,%eax
c0100aaf:	83 e0 20             	and    $0x20,%eax
c0100ab2:	85 c0                	test   %eax,%eax
c0100ab4:	0f 95 c0             	setne  %al
c0100ab7:	0f b6 c0             	movzbl %al,%eax
}
c0100aba:	c9                   	leave  
c0100abb:	c3                   	ret    

c0100abc <serial_printc>:

void serial_printc(int ch) {
c0100abc:	55                   	push   %ebp
c0100abd:	89 e5                	mov    %esp,%ebp
c0100abf:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100ac2:	90                   	nop
c0100ac3:	e8 ca ff ff ff       	call   c0100a92 <serial_idle>
c0100ac8:	85 c0                	test   %eax,%eax
c0100aca:	74 f7                	je     c0100ac3 <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100acc:	8b 45 08             	mov    0x8(%ebp),%eax
c0100acf:	0f b6 c0             	movzbl %al,%eax
c0100ad2:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100ad9:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100adc:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100ae0:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100ae3:	ee                   	out    %al,(%dx)
}
c0100ae4:	c9                   	leave  
c0100ae5:	c3                   	ret    

c0100ae6 <putchar>:

void putchar(int ch){
c0100ae6:	55                   	push   %ebp
c0100ae7:	89 e5                	mov    %esp,%ebp
c0100ae9:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100aec:	8b 45 08             	mov    0x8(%ebp),%eax
c0100aef:	89 04 24             	mov    %eax,(%esp)
c0100af2:	e8 c5 ff ff ff       	call   c0100abc <serial_printc>
c0100af7:	c9                   	leave  
c0100af8:	c3                   	ret    

c0100af9 <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100af9:	55                   	push   %ebp
c0100afa:	89 e5                	mov    %esp,%ebp
c0100afc:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100aff:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100b06:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100b0d:	7e 24                	jle    c0100b33 <init_timer+0x3a>
c0100b0f:	c7 44 24 0c b5 3b 10 	movl   $0xc0103bb5,0xc(%esp)
c0100b16:	c0 
c0100b17:	c7 44 24 08 c5 3b 10 	movl   $0xc0103bc5,0x8(%esp)
c0100b1e:	c0 
c0100b1f:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100b26:	00 
c0100b27:	c7 04 24 da 3b 10 c0 	movl   $0xc0103bda,(%esp)
c0100b2e:	e8 af 1c 00 00       	call   c01027e2 <_panic>
c0100b33:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100b3a:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100b3e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100b42:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b45:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b49:	99                   	cltd   
c0100b4a:	c1 ea 18             	shr    $0x18,%edx
c0100b4d:	01 d0                	add    %edx,%eax
c0100b4f:	0f b6 c0             	movzbl %al,%eax
c0100b52:	29 d0                	sub    %edx,%eax
c0100b54:	0f b6 c0             	movzbl %al,%eax
c0100b57:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100b5e:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100b61:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100b65:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100b68:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b6c:	99                   	cltd   
c0100b6d:	c1 ea 18             	shr    $0x18,%edx
c0100b70:	01 d0                	add    %edx,%eax
c0100b72:	c1 f8 08             	sar    $0x8,%eax
c0100b75:	0f b6 c0             	movzbl %al,%eax
c0100b78:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100b7f:	88 45 df             	mov    %al,-0x21(%ebp)
c0100b82:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100b86:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100b89:	ee                   	out    %al,(%dx)
}
c0100b8a:	c9                   	leave  
c0100b8b:	c3                   	ret    

c0100b8c <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0100b8c:	55                   	push   %ebp
c0100b8d:	89 e5                	mov    %esp,%ebp
c0100b8f:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0100b92:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0100b96:	75 24                	jne    c0100bbc <list_add+0x30>
c0100b98:	c7 44 24 0c f0 3b 10 	movl   $0xc0103bf0,0xc(%esp)
c0100b9f:	c0 
c0100ba0:	c7 44 24 08 fd 3b 10 	movl   $0xc0103bfd,0x8(%esp)
c0100ba7:	c0 
c0100ba8:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0100baf:	00 
c0100bb0:	c7 04 24 12 3c 10 c0 	movl   $0xc0103c12,(%esp)
c0100bb7:	e8 26 1c 00 00       	call   c01027e2 <_panic>
	data->prev = prev;
c0100bbc:	8b 45 10             	mov    0x10(%ebp),%eax
c0100bbf:	8b 55 08             	mov    0x8(%ebp),%edx
c0100bc2:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0100bc4:	8b 45 10             	mov    0x10(%ebp),%eax
c0100bc7:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100bca:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0100bcd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100bd1:	74 09                	je     c0100bdc <list_add+0x50>
c0100bd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bd6:	8b 55 10             	mov    0x10(%ebp),%edx
c0100bd9:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0100bdc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100be0:	74 08                	je     c0100bea <list_add+0x5e>
c0100be2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100be5:	8b 55 10             	mov    0x10(%ebp),%edx
c0100be8:	89 10                	mov    %edx,(%eax)
}
c0100bea:	c9                   	leave  
c0100beb:	c3                   	ret    

c0100bec <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0100bec:	55                   	push   %ebp
c0100bed:	89 e5                	mov    %esp,%ebp
c0100bef:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100bf2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100bf6:	75 24                	jne    c0100c1c <list_add_before+0x30>
c0100bf8:	c7 44 24 0c 28 3c 10 	movl   $0xc0103c28,0xc(%esp)
c0100bff:	c0 
c0100c00:	c7 44 24 08 fd 3b 10 	movl   $0xc0103bfd,0x8(%esp)
c0100c07:	c0 
c0100c08:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0100c0f:	00 
c0100c10:	c7 04 24 12 3c 10 c0 	movl   $0xc0103c12,(%esp)
c0100c17:	e8 c6 1b 00 00       	call   c01027e2 <_panic>
	list_add(one->prev, one, data);
c0100c1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c1f:	8b 00                	mov    (%eax),%eax
c0100c21:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c24:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100c28:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c2b:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100c2f:	89 04 24             	mov    %eax,(%esp)
c0100c32:	e8 55 ff ff ff       	call   c0100b8c <list_add>
}
c0100c37:	c9                   	leave  
c0100c38:	c3                   	ret    

c0100c39 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0100c39:	55                   	push   %ebp
c0100c3a:	89 e5                	mov    %esp,%ebp
c0100c3c:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c0100c3f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100c43:	75 24                	jne    c0100c69 <list_del+0x30>
c0100c45:	c7 44 24 0c f0 3b 10 	movl   $0xc0103bf0,0xc(%esp)
c0100c4c:	c0 
c0100c4d:	c7 44 24 08 fd 3b 10 	movl   $0xc0103bfd,0x8(%esp)
c0100c54:	c0 
c0100c55:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0100c5c:	00 
c0100c5d:	c7 04 24 12 3c 10 c0 	movl   $0xc0103c12,(%esp)
c0100c64:	e8 79 1b 00 00       	call   c01027e2 <_panic>
	list *prev = data->prev;
c0100c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c6c:	8b 00                	mov    (%eax),%eax
c0100c6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0100c71:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c74:	8b 40 04             	mov    0x4(%eax),%eax
c0100c77:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0100c7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100c7e:	74 09                	je     c0100c89 <list_del+0x50>
c0100c80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c83:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100c86:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c0100c89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100c8d:	74 08                	je     c0100c97 <list_del+0x5e>
c0100c8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c92:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c95:	89 10                	mov    %edx,(%eax)
}
c0100c97:	c9                   	leave  
c0100c98:	c3                   	ret    

c0100c99 <list_init>:

static inline void
list_init(list *one) {
c0100c99:	55                   	push   %ebp
c0100c9a:	89 e5                	mov    %esp,%ebp
c0100c9c:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0100c9f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100ca3:	75 24                	jne    c0100cc9 <list_init+0x30>
c0100ca5:	c7 44 24 0c 28 3c 10 	movl   $0xc0103c28,0xc(%esp)
c0100cac:	c0 
c0100cad:	c7 44 24 08 fd 3b 10 	movl   $0xc0103bfd,0x8(%esp)
c0100cb4:	c0 
c0100cb5:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
c0100cbc:	00 
c0100cbd:	c7 04 24 12 3c 10 c0 	movl   $0xc0103c12,(%esp)
c0100cc4:	e8 19 1b 00 00       	call   c01027e2 <_panic>
	one->prev = one->next = one;
c0100cc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ccc:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ccf:	89 50 04             	mov    %edx,0x4(%eax)
c0100cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cd5:	8b 50 04             	mov    0x4(%eax),%edx
c0100cd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cdb:	89 10                	mov    %edx,(%eax)
}
c0100cdd:	c9                   	leave  
c0100cde:	c3                   	ret    

c0100cdf <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100cdf:	55                   	push   %ebp
c0100ce0:	89 e5                	mov    %esp,%ebp
c0100ce2:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100ce5:	8b 45 10             	mov    0x10(%ebp),%eax
c0100ce8:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100ced:	77 21                	ja     c0100d10 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100cef:	8b 45 10             	mov    0x10(%ebp),%eax
c0100cf2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100cf6:	c7 44 24 08 34 3c 10 	movl   $0xc0103c34,0x8(%esp)
c0100cfd:	c0 
c0100cfe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d01:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d05:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d08:	89 04 24             	mov    %eax,(%esp)
c0100d0b:	e8 d2 1a 00 00       	call   c01027e2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100d10:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d13:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100d18:	c9                   	leave  
c0100d19:	c3                   	ret    

c0100d1a <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100d1a:	55                   	push   %ebp
c0100d1b:	89 e5                	mov    %esp,%ebp
c0100d1d:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100d20:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d23:	c1 e8 0c             	shr    $0xc,%eax
c0100d26:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100d2b:	76 21                	jbe    c0100d4e <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100d2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d30:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100d34:	c7 44 24 08 58 3c 10 	movl   $0xc0103c58,0x8(%esp)
c0100d3b:	c0 
c0100d3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d3f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d46:	89 04 24             	mov    %eax,(%esp)
c0100d49:	e8 94 1a 00 00       	call   c01027e2 <_panic>
	return (void *)(pa + KERNBASE);
c0100d4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d51:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100d56:	c9                   	leave  
c0100d57:	c3                   	ret    

c0100d58 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100d58:	55                   	push   %ebp
c0100d59:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100d5b:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d5e:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c0100d63:	29 c2                	sub    %eax,%edx
c0100d65:	89 d0                	mov    %edx,%eax
c0100d67:	c1 f8 03             	sar    $0x3,%eax
c0100d6a:	c1 e0 0c             	shl    $0xc,%eax
}
c0100d6d:	5d                   	pop    %ebp
c0100d6e:	c3                   	ret    

c0100d6f <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100d6f:	55                   	push   %ebp
c0100d70:	89 e5                	mov    %esp,%ebp
c0100d72:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100d75:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d78:	89 04 24             	mov    %eax,(%esp)
c0100d7b:	e8 d8 ff ff ff       	call   c0100d58 <page2pa>
c0100d80:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100d84:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0100d8b:	00 
c0100d8c:	c7 04 24 7b 3c 10 c0 	movl   $0xc0103c7b,(%esp)
c0100d93:	e8 82 ff ff ff       	call   c0100d1a <_kaddr>
}
c0100d98:	c9                   	leave  
c0100d99:	c3                   	ret    

c0100d9a <pcb_init>:
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];


void pcb_init()
{
c0100d9a:	55                   	push   %ebp
c0100d9b:	89 e5                	mov    %esp,%ebp
c0100d9d:	83 ec 28             	sub    $0x28,%esp
	/*int i;
	for (i = 0; i < MAXN_PCB; i++) {
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}*/
	list_init(&ready);
c0100da0:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100da7:	e8 ed fe ff ff       	call   c0100c99 <list_init>
	list_init(&block);
c0100dac:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c0100db3:	e8 e1 fe ff ff       	call   c0100c99 <list_init>
	list_init(&free);
c0100db8:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100dbf:	e8 d5 fe ff ff       	call   c0100c99 <list_init>
	now=&ready;
c0100dc4:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0100dcb:	4f 16 c0 
	pcbnow=&init;
c0100dce:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c0100dd5:	3f 16 c0 
	init.pgdir=kern_pgdir;
c0100dd8:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0100ddd:	a3 04 3f 16 c0       	mov    %eax,0xc0163f04
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100de2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100de9:	eb 48                	jmp    c0100e33 <pcb_init+0x99>
		list_add_before(&free,&pcb[i].plist);
c0100deb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dee:	c1 e0 0c             	shl    $0xc,%eax
c0100df1:	05 40 57 16 c0       	add    $0xc0165740,%eax
c0100df6:	83 c0 08             	add    $0x8,%eax
c0100df9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100dfd:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c0100e04:	e8 e3 fd ff ff       	call   c0100bec <list_add_before>
		pcb[i].pid=i+1;
c0100e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e0c:	83 c0 01             	add    $0x1,%eax
c0100e0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100e12:	c1 e2 0c             	shl    $0xc,%edx
c0100e15:	81 c2 50 57 16 c0    	add    $0xc0165750,%edx
c0100e1b:	89 02                	mov    %eax,(%edx)
		pcb[i].ppid=0;
c0100e1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e20:	c1 e0 0c             	shl    $0xc,%eax
c0100e23:	05 50 57 16 c0       	add    $0xc0165750,%eax
c0100e28:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	list_init(&free);
	now=&ready;
	pcbnow=&init;
	init.pgdir=kern_pgdir;
	int i;
	for(i=0;i<MAXN_PCB;i++){
c0100e2f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100e33:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0100e37:	7e b2                	jle    c0100deb <pcb_init+0x51>
		list_add_before(&free,&pcb[i].plist);
		pcb[i].pid=i+1;
		pcb[i].ppid=0;
	}
			
}
c0100e39:	c9                   	leave  
c0100e3a:	c3                   	ret    

c0100e3b <pcb_alloc>:

static uint32_t cntpid=0;
PCB* pcb_alloc()
{
c0100e3b:	55                   	push   %ebp
c0100e3c:	89 e5                	mov    %esp,%ebp
c0100e3e:	83 ec 38             	sub    $0x38,%esp
	/*
	PCB* p = pcb_free_list;
 	if (p == NULL) return NULL;*/
	list *lnext=&free;
c0100e41:	c7 45 f4 08 4f 16 c0 	movl   $0xc0164f08,-0xc(%ebp)
	list *freenext;
	if(lnext->next==lnext)
c0100e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e4b:	8b 40 04             	mov    0x4(%eax),%eax
c0100e4e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100e51:	75 11                	jne    c0100e64 <pcb_alloc+0x29>
	{
		freenext=NULL;
c0100e53:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		return NULL;
c0100e5a:	b8 00 00 00 00       	mov    $0x0,%eax
c0100e5f:	e9 0f 01 00 00       	jmp    c0100f73 <pcb_alloc+0x138>
	}
	else
	{
		freenext=lnext->next;
c0100e64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e67:	8b 40 04             	mov    0x4(%eax),%eax
c0100e6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	PCB* p=list_entry(freenext,PCB,plist);
c0100e6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e70:	83 e8 08             	sub    $0x8,%eax
c0100e73:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100e76:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100e7d:	e8 33 0c 00 00       	call   c0101ab5 <page_alloc>
c0100e82:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (pp == NULL) return NULL;
c0100e85:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0100e89:	75 0a                	jne    c0100e95 <pcb_alloc+0x5a>
c0100e8b:	b8 00 00 00 00       	mov    $0x0,%eax
c0100e90:	e9 de 00 00 00       	jmp    c0100f73 <pcb_alloc+0x138>
	p->pgdir = page2kva(pp);
c0100e95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e98:	89 04 24             	mov    %eax,(%esp)
c0100e9b:	e8 cf fe ff ff       	call   c0100d6f <page2kva>
c0100ea0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100ea3:	89 42 04             	mov    %eax,0x4(%edx)
	//memcpy(p->pgdir,kern_pgdir,PGSIZE);
	pp->pp_ref ++;
c0100ea6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100ea9:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100ead:	8d 50 01             	lea    0x1(%eax),%edx
c0100eb0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100eb3:	66 89 50 04          	mov    %dx,0x4(%eax)
	p->ppid=0;
c0100eb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100eba:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	p->pid=cntpid++;
c0100ec1:	a1 20 14 13 c0       	mov    0xc0131420,%eax
c0100ec6:	8d 50 01             	lea    0x1(%eax),%edx
c0100ec9:	89 15 20 14 13 c0    	mov    %edx,0xc0131420
c0100ecf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100ed2:	89 42 10             	mov    %eax,0x10(%edx)
	p->state=RUNNING;
c0100ed5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ed8:	c7 40 18 01 00 00 00 	movl   $0x1,0x18(%eax)
	list_del(&p->plist);
c0100edf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ee2:	83 c0 08             	add    $0x8,%eax
c0100ee5:	89 04 24             	mov    %eax,(%esp)
c0100ee8:	e8 4c fd ff ff       	call   c0100c39 <list_del>
	list_add_before(&ready,&p->plist);
c0100eed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ef0:	83 c0 08             	add    $0x8,%eax
c0100ef3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ef7:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c0100efe:	e8 e9 fc ff ff       	call   c0100bec <list_add_before>
	memcpy(p->pgdir,kern_pgdir,PGSIZE);
c0100f03:	8b 15 40 f7 16 c0    	mov    0xc016f740,%edx
c0100f09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f0c:	8b 40 04             	mov    0x4(%eax),%eax
c0100f0f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100f16:	00 
c0100f17:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100f1b:	89 04 24             	mov    %eax,(%esp)
c0100f1e:	e8 b5 1d 00 00       	call   c0102cd8 <memcpy>
	TrapFrame* tf=(TrapFrame*)((uint32_t)p->kstack+STACKSIZE-sizeof(TrapFrame)-8);	
c0100f23:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f26:	05 ac 0f 00 00       	add    $0xfac,%eax
c0100f2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	tf->ds = USEL(SEG_USER_DATA);
c0100f2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f31:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	tf->es = USEL(SEG_USER_DATA);
c0100f38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f3b:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	tf->ss = USEL(SEG_USER_DATA);
c0100f42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f45:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	tf->cs = USEL(SEG_USER_CODE);
c0100f4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f4e:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	tf->esp = USTACKTOP-8;
c0100f54:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f57:	c7 40 44 f8 df ff be 	movl   $0xbeffdff8,0x44(%eax)
	tf->eflags = 0x2 | FL_IF;
c0100f5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f61:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	p->tf=tf;
c0100f68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f6b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100f6e:	89 10                	mov    %edx,(%eax)
	return p;
c0100f70:	8b 45 ec             	mov    -0x14(%ebp),%eax

}
c0100f73:	c9                   	leave  
c0100f74:	c3                   	ret    

c0100f75 <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0100f75:	55                   	push   %ebp
c0100f76:	89 e5                	mov    %esp,%ebp
c0100f78:	83 ec 38             	sub    $0x38,%esp
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0100f7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100f7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f84:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100f89:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0100f8c:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c0100f93:	8b 45 10             	mov    0x10(%ebp),%eax
c0100f96:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f99:	01 c2                	add    %eax,%edx
c0100f9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f9e:	01 d0                	add    %edx,%eax
c0100fa0:	83 e8 01             	sub    $0x1,%eax
c0100fa3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100fa6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fa9:	ba 00 00 00 00       	mov    $0x0,%edx
c0100fae:	f7 75 e8             	divl   -0x18(%ebp)
c0100fb1:	89 d0                	mov    %edx,%eax
c0100fb3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100fb6:	29 c2                	sub    %eax,%edx
c0100fb8:	89 d0                	mov    %edx,%eax
c0100fba:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c0100fbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100fc3:	eb 61                	jmp    c0101026 <mm_malloc+0xb1>
		p = page_alloc(0);
c0100fc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0100fcc:	e8 e4 0a 00 00       	call   c0101ab5 <page_alloc>
c0100fd1:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c0100fd4:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0100fd8:	75 24                	jne    c0100ffe <mm_malloc+0x89>
c0100fda:	c7 44 24 0c 91 3c 10 	movl   $0xc0103c91,0xc(%esp)
c0100fe1:	c0 
c0100fe2:	c7 44 24 08 fd 3b 10 	movl   $0xc0103bfd,0x8(%esp)
c0100fe9:	c0 
c0100fea:	c7 44 24 04 59 00 00 	movl   $0x59,0x4(%esp)
c0100ff1:	00 
c0100ff2:	c7 04 24 9b 3c 10 c0 	movl   $0xc0103c9b,(%esp)
c0100ff9:	e8 e4 17 00 00       	call   c01027e2 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0100ffe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101001:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c0101008:	00 
c0101009:	89 44 24 08          	mov    %eax,0x8(%esp)
c010100d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101010:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101014:	8b 45 08             	mov    0x8(%ebp),%eax
c0101017:	89 04 24             	mov    %eax,(%esp)
c010101a:	e8 25 10 00 00       	call   c0102044 <page_insert>
{
	struct Page *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;
	for (i = va_start; i < va_end; i += PGSIZE) {
c010101f:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0101026:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101029:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c010102c:	72 97                	jb     c0100fc5 <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c010102e:	c9                   	leave  
c010102f:	c3                   	ret    

c0101030 <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c0101030:	55                   	push   %ebp
c0101031:	89 e5                	mov    %esp,%ebp
c0101033:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c0101036:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101039:	8b 55 08             	mov    0x8(%ebp),%edx
c010103c:	01 d0                	add    %edx,%eax
c010103e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c0101041:	8b 45 10             	mov    0x10(%ebp),%eax
c0101044:	c1 e8 09             	shr    $0x9,%eax
c0101047:	83 c0 01             	add    $0x1,%eax
c010104a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c010104d:	eb 6e                	jmp    c01010bd <readseg+0x8d>
		readsect(disks, sect);
c010104f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101052:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101056:	c7 04 24 40 14 13 c0 	movl   $0xc0131440,(%esp)
c010105d:	e8 65 00 00 00       	call   c01010c7 <readsect>
		uint32_t rem = offset & 0x1ff;
c0101062:	8b 45 10             	mov    0x10(%ebp),%eax
c0101065:	25 ff 01 00 00       	and    $0x1ff,%eax
c010106a:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c010106d:	b8 00 02 00 00       	mov    $0x200,%eax
c0101072:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0101075:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101078:	8b 45 08             	mov    0x8(%ebp),%eax
c010107b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010107e:	29 c2                	sub    %eax,%edx
c0101080:	89 d0                	mov    %edx,%eax
c0101082:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101085:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0101088:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010108b:	39 d0                	cmp    %edx,%eax
c010108d:	76 02                	jbe    c0101091 <readseg+0x61>
c010108f:	89 d0                	mov    %edx,%eax
c0101091:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c0101094:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101097:	8d 88 40 14 13 c0    	lea    -0x3fecebc0(%eax),%ecx
c010109d:	8b 45 08             	mov    0x8(%ebp),%eax
c01010a0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01010a3:	89 54 24 08          	mov    %edx,0x8(%esp)
c01010a7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01010ab:	89 04 24             	mov    %eax,(%esp)
c01010ae:	e8 25 1c 00 00       	call   c0102cd8 <memcpy>
		va += size;
c01010b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01010b6:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c01010b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c01010bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01010c0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01010c3:	72 8a                	jb     c010104f <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c01010c5:	c9                   	leave  
c01010c6:	c3                   	ret    

c01010c7 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c01010c7:	55                   	push   %ebp
c01010c8:	89 e5                	mov    %esp,%ebp
c01010ca:	57                   	push   %edi
c01010cb:	53                   	push   %ebx
c01010cc:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c01010cf:	90                   	nop
c01010d0:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01010d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010da:	89 c2                	mov    %eax,%edx
c01010dc:	ec                   	in     (%dx),%al
c01010dd:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c01010e0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c01010e4:	0f b6 c0             	movzbl %al,%eax
c01010e7:	25 c0 00 00 00       	and    $0xc0,%eax
c01010ec:	83 f8 40             	cmp    $0x40,%eax
c01010ef:	75 df                	jne    c01010d0 <readsect+0x9>
c01010f1:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c01010f8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01010fc:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0101100:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101103:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c0101104:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101107:	0f b6 c0             	movzbl %al,%eax
c010110a:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c0101111:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0101114:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0101118:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010111b:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c010111c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010111f:	c1 e8 08             	shr    $0x8,%eax
c0101122:	0f b6 c0             	movzbl %al,%eax
c0101125:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c010112c:	88 45 db             	mov    %al,-0x25(%ebp)
c010112f:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0101133:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101136:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c0101137:	8b 45 0c             	mov    0xc(%ebp),%eax
c010113a:	c1 e8 10             	shr    $0x10,%eax
c010113d:	0f b6 c0             	movzbl %al,%eax
c0101140:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c0101147:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010114a:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c010114e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0101151:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c0101152:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101155:	c1 e8 18             	shr    $0x18,%eax
c0101158:	83 c8 e0             	or     $0xffffffe0,%eax
c010115b:	0f b6 c0             	movzbl %al,%eax
c010115e:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c0101165:	88 45 cb             	mov    %al,-0x35(%ebp)
c0101168:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c010116c:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010116f:	ee                   	out    %al,(%dx)
c0101170:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0101177:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c010117b:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010117f:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0101182:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0101183:	90                   	nop
c0101184:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c010118b:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010118e:	89 c2                	mov    %eax,%edx
c0101190:	ec                   	in     (%dx),%al
c0101191:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c0101194:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0101198:	0f b6 c0             	movzbl %al,%eax
c010119b:	25 c0 00 00 00       	and    $0xc0,%eax
c01011a0:	83 f8 40             	cmp    $0x40,%eax
c01011a3:	75 df                	jne    c0101184 <readsect+0xbd>
c01011a5:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c01011ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01011af:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01011b2:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c01011b9:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c01011bc:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c01011bf:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01011c2:	89 cb                	mov    %ecx,%ebx
c01011c4:	89 df                	mov    %ebx,%edi
c01011c6:	89 c1                	mov    %eax,%ecx
c01011c8:	fc                   	cld    
c01011c9:	f2 6d                	repnz insl (%dx),%es:(%edi)
c01011cb:	89 c8                	mov    %ecx,%eax
c01011cd:	89 fb                	mov    %edi,%ebx
c01011cf:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c01011d2:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c01011d5:	83 c4 50             	add    $0x50,%esp
c01011d8:	5b                   	pop    %ebx
c01011d9:	5f                   	pop    %edi
c01011da:	5d                   	pop    %ebp
c01011db:	c3                   	ret    

c01011dc <pcb_new>:

void pcb_new()
{
c01011dc:	55                   	push   %ebp
c01011dd:	89 e5                	mov    %esp,%ebp
c01011df:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c01011e2:	e8 54 fc ff ff       	call   c0100e3b <pcb_alloc>
c01011e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c01011ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01011ee:	75 05                	jne    c01011f5 <pcb_new+0x19>
c01011f0:	e9 8b 01 00 00       	jmp    c0101380 <pcb_new+0x1a4>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c01011f5:	c7 45 ec 20 04 13 c0 	movl   $0xc0130420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c01011fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01011ff:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c0101206:	00 
c0101207:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c010120e:	00 
c010120f:	89 04 24             	mov    %eax,(%esp)
c0101212:	e8 19 fe ff ff       	call   c0101030 <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c0101217:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010121a:	8b 00                	mov    (%eax),%eax
c010121c:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c0101221:	74 24                	je     c0101247 <pcb_new+0x6b>
c0101223:	c7 44 24 0c ae 3c 10 	movl   $0xc0103cae,0xc(%esp)
c010122a:	c0 
c010122b:	c7 44 24 08 fd 3b 10 	movl   $0xc0103bfd,0x8(%esp)
c0101232:	c0 
c0101233:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c010123a:	00 
c010123b:	c7 04 24 9b 3c 10 c0 	movl   $0xc0103c9b,(%esp)
c0101242:	e8 9b 15 00 00       	call   c01027e2 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c0101247:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010124a:	8b 50 1c             	mov    0x1c(%eax),%edx
c010124d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101250:	01 d0                	add    %edx,%eax
c0101252:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c0101255:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101258:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010125c:	0f b7 c0             	movzwl %ax,%eax
c010125f:	c1 e0 05             	shl    $0x5,%eax
c0101262:	89 c2                	mov    %eax,%edx
c0101264:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101267:	01 d0                	add    %edx,%eax
c0101269:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c010126c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010126f:	8b 40 04             	mov    0x4(%eax),%eax
c0101272:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101276:	c7 44 24 04 86 00 00 	movl   $0x86,0x4(%esp)
c010127d:	00 
c010127e:	c7 04 24 9b 3c 10 c0 	movl   $0xc0103c9b,(%esp)
c0101285:	e8 55 fa ff ff       	call   c0100cdf <_paddr>
c010128a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c010128d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101290:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) 
c0101293:	e9 8a 00 00 00       	jmp    c0101322 <pcb_new+0x146>
	{
		if (ph -> p_type != ELF_PROG_LOAD) 
c0101298:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010129b:	8b 00                	mov    (%eax),%eax
c010129d:	83 f8 01             	cmp    $0x1,%eax
c01012a0:	74 02                	je     c01012a4 <pcb_new+0xc8>
			continue;
c01012a2:	eb 7a                	jmp    c010131e <pcb_new+0x142>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c01012a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012a7:	8b 48 14             	mov    0x14(%eax),%ecx
c01012aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012ad:	8b 50 08             	mov    0x8(%eax),%edx
c01012b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01012b3:	8b 40 04             	mov    0x4(%eax),%eax
c01012b6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01012ba:	89 54 24 04          	mov    %edx,0x4(%esp)
c01012be:	89 04 24             	mov    %eax,(%esp)
c01012c1:	e8 af fc ff ff       	call   c0100f75 <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c01012c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012c9:	8b 40 04             	mov    0x4(%eax),%eax
c01012cc:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c01012d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012d5:	8b 50 10             	mov    0x10(%eax),%edx
c01012d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012db:	8b 40 08             	mov    0x8(%eax),%eax
c01012de:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01012e2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01012e6:	89 04 24             	mov    %eax,(%esp)
c01012e9:	e8 42 fd ff ff       	call   c0101030 <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c01012ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012f1:	8b 50 14             	mov    0x14(%eax),%edx
c01012f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012f7:	8b 40 10             	mov    0x10(%eax),%eax
c01012fa:	29 c2                	sub    %eax,%edx
c01012fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012ff:	8b 48 08             	mov    0x8(%eax),%ecx
c0101302:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101305:	8b 40 10             	mov    0x10(%eax),%eax
c0101308:	01 c8                	add    %ecx,%eax
c010130a:	89 54 24 08          	mov    %edx,0x8(%esp)
c010130e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101315:	00 
c0101316:	89 04 24             	mov    %eax,(%esp)
c0101319:	e8 d7 19 00 00       	call   c0102cf5 <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) 
c010131e:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c0101322:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101325:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101328:	0f 82 6a ff ff ff    	jb     c0101298 <pcb_new+0xbc>
			continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	(p->tf)->eip = elf->e_entry;
c010132e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101331:	8b 00                	mov    (%eax),%eax
c0101333:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101336:	8b 52 18             	mov    0x18(%edx),%edx
c0101339:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP-USTACKSIZE, USTACKSIZE);
c010133c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010133f:	8b 40 04             	mov    0x4(%eax),%eax
c0101342:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101349:	00 
c010134a:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c0101351:	be 
c0101352:	89 04 24             	mov    %eax,(%esp)
c0101355:	e8 1b fc ff ff       	call   c0100f75 <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c010135a:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010135f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101363:	c7 44 24 04 91 00 00 	movl   $0x91,0x4(%esp)
c010136a:	00 
c010136b:	c7 04 24 9b 3c 10 c0 	movl   $0xc0103c9b,(%esp)
c0101372:	e8 68 f9 ff ff       	call   c0100cdf <_paddr>
c0101377:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010137a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010137d:	0f 22 d8             	mov    %eax,%cr3
}
c0101380:	c9                   	leave  
c0101381:	c3                   	ret    

c0101382 <pcb_deepcopy>:

PCB* pcb_deepcopy(PCB *fa,PCB *tb)
{
c0101382:	55                   	push   %ebp
c0101383:	89 e5                	mov    %esp,%ebp
c0101385:	53                   	push   %ebx
c0101386:	83 ec 24             	sub    $0x24,%esp
	int movaddr=(int)(&((PCB*)0)->addr);//get the addr for the information of process
c0101389:	c7 45 f4 24 00 00 00 	movl   $0x24,-0xc(%ebp)
	int copysize=KSTACK_SIZE-movaddr;
c0101390:	b8 00 10 00 00       	mov    $0x1000,%eax
c0101395:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0101398:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memcpy(tb->kstack+movaddr,fa->kstack+movaddr,copysize);
c010139b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010139e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c01013a1:	8b 55 08             	mov    0x8(%ebp),%edx
c01013a4:	01 d1                	add    %edx,%ecx
c01013a6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c01013a9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01013ac:	01 da                	add    %ebx,%edx
c01013ae:	89 44 24 08          	mov    %eax,0x8(%esp)
c01013b2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01013b6:	89 14 24             	mov    %edx,(%esp)
c01013b9:	e8 1a 19 00 00       	call   c0102cd8 <memcpy>
	tb->tf=tb->kstack+((void*)fa->tf-(void*)fa->kstack);
c01013be:	8b 45 08             	mov    0x8(%ebp),%eax
c01013c1:	8b 00                	mov    (%eax),%eax
c01013c3:	89 c2                	mov    %eax,%edx
c01013c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01013c8:	29 c2                	sub    %eax,%edx
c01013ca:	89 d0                	mov    %edx,%eax
c01013cc:	89 c2                	mov    %eax,%edx
c01013ce:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013d1:	01 c2                	add    %eax,%edx
c01013d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013d6:	89 10                	mov    %edx,(%eax)
	tb->state=fa->state;
c01013d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01013db:	8b 50 18             	mov    0x18(%eax),%edx
c01013de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013e1:	89 50 18             	mov    %edx,0x18(%eax)
	tb->timecount=fa->timecount;
c01013e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01013e7:	8b 50 1c             	mov    0x1c(%eax),%edx
c01013ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013ed:	89 50 1c             	mov    %edx,0x1c(%eax)
	tb->sleeptime=fa->sleeptime;
c01013f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01013f3:	8b 50 20             	mov    0x20(%eax),%edx
c01013f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013f9:	89 50 20             	mov    %edx,0x20(%eax)
	pgdir_copy(fa->pgdir,tb->pgdir);//written in pmap.c
c01013fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013ff:	8b 50 04             	mov    0x4(%eax),%edx
c0101402:	8b 45 08             	mov    0x8(%ebp),%eax
c0101405:	8b 40 04             	mov    0x4(%eax),%eax
c0101408:	89 54 24 04          	mov    %edx,0x4(%esp)
c010140c:	89 04 24             	mov    %eax,(%esp)
c010140f:	e8 80 08 00 00       	call   c0101c94 <pgdir_copy>
}
c0101414:	83 c4 24             	add    $0x24,%esp
c0101417:	5b                   	pop    %ebx
c0101418:	5d                   	pop    %ebp
c0101419:	c3                   	ret    

c010141a <pcb_remove>:

void pcb_remove(PCB *p)
{
c010141a:	55                   	push   %ebp
c010141b:	89 e5                	mov    %esp,%ebp
c010141d:	83 ec 18             	sub    $0x18,%esp
	pgdir_remove(p->pgdir);
c0101420:	8b 45 08             	mov    0x8(%ebp),%eax
c0101423:	8b 40 04             	mov    0x4(%eax),%eax
c0101426:	89 04 24             	mov    %eax,(%esp)
c0101429:	e8 5f 0a 00 00       	call   c0101e8d <pgdir_remove>
}
c010142e:	c9                   	leave  
c010142f:	c3                   	ret    

c0101430 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c0101430:	55                   	push   %ebp
c0101431:	89 e5                	mov    %esp,%ebp
c0101433:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c0101436:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010143a:	75 24                	jne    c0101460 <list_add+0x30>
c010143c:	c7 44 24 0c c8 3c 10 	movl   $0xc0103cc8,0xc(%esp)
c0101443:	c0 
c0101444:	c7 44 24 08 d5 3c 10 	movl   $0xc0103cd5,0x8(%esp)
c010144b:	c0 
c010144c:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0101453:	00 
c0101454:	c7 04 24 ea 3c 10 c0 	movl   $0xc0103cea,(%esp)
c010145b:	e8 82 13 00 00       	call   c01027e2 <_panic>
	data->prev = prev;
c0101460:	8b 45 10             	mov    0x10(%ebp),%eax
c0101463:	8b 55 08             	mov    0x8(%ebp),%edx
c0101466:	89 10                	mov    %edx,(%eax)
	data->next = next;
c0101468:	8b 45 10             	mov    0x10(%ebp),%eax
c010146b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010146e:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c0101471:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101475:	74 09                	je     c0101480 <list_add+0x50>
c0101477:	8b 45 08             	mov    0x8(%ebp),%eax
c010147a:	8b 55 10             	mov    0x10(%ebp),%edx
c010147d:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c0101480:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101484:	74 08                	je     c010148e <list_add+0x5e>
c0101486:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101489:	8b 55 10             	mov    0x10(%ebp),%edx
c010148c:	89 10                	mov    %edx,(%eax)
}
c010148e:	c9                   	leave  
c010148f:	c3                   	ret    

c0101490 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0101490:	55                   	push   %ebp
c0101491:	89 e5                	mov    %esp,%ebp
c0101493:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c0101496:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010149a:	75 24                	jne    c01014c0 <list_add_before+0x30>
c010149c:	c7 44 24 0c 00 3d 10 	movl   $0xc0103d00,0xc(%esp)
c01014a3:	c0 
c01014a4:	c7 44 24 08 d5 3c 10 	movl   $0xc0103cd5,0x8(%esp)
c01014ab:	c0 
c01014ac:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c01014b3:	00 
c01014b4:	c7 04 24 ea 3c 10 c0 	movl   $0xc0103cea,(%esp)
c01014bb:	e8 22 13 00 00       	call   c01027e2 <_panic>
	list_add(one->prev, one, data);
c01014c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01014c3:	8b 00                	mov    (%eax),%eax
c01014c5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01014c8:	89 54 24 08          	mov    %edx,0x8(%esp)
c01014cc:	8b 55 08             	mov    0x8(%ebp),%edx
c01014cf:	89 54 24 04          	mov    %edx,0x4(%esp)
c01014d3:	89 04 24             	mov    %eax,(%esp)
c01014d6:	e8 55 ff ff ff       	call   c0101430 <list_add>
}
c01014db:	c9                   	leave  
c01014dc:	c3                   	ret    

c01014dd <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c01014dd:	55                   	push   %ebp
c01014de:	89 e5                	mov    %esp,%ebp
c01014e0:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c01014e3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01014e7:	75 24                	jne    c010150d <list_del+0x30>
c01014e9:	c7 44 24 0c c8 3c 10 	movl   $0xc0103cc8,0xc(%esp)
c01014f0:	c0 
c01014f1:	c7 44 24 08 d5 3c 10 	movl   $0xc0103cd5,0x8(%esp)
c01014f8:	c0 
c01014f9:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0101500:	00 
c0101501:	c7 04 24 ea 3c 10 c0 	movl   $0xc0103cea,(%esp)
c0101508:	e8 d5 12 00 00       	call   c01027e2 <_panic>
	list *prev = data->prev;
c010150d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101510:	8b 00                	mov    (%eax),%eax
c0101512:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c0101515:	8b 45 08             	mov    0x8(%ebp),%eax
c0101518:	8b 40 04             	mov    0x4(%eax),%eax
c010151b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c010151e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101522:	74 09                	je     c010152d <list_del+0x50>
c0101524:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101527:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010152a:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c010152d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101531:	74 08                	je     c010153b <list_del+0x5e>
c0101533:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101536:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101539:	89 10                	mov    %edx,(%eax)
}
c010153b:	c9                   	leave  
c010153c:	c3                   	ret    

c010153d <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c010153d:	55                   	push   %ebp
c010153e:	89 e5                	mov    %esp,%ebp
c0101540:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101543:	8b 45 10             	mov    0x10(%ebp),%eax
c0101546:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c010154b:	77 21                	ja     c010156e <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c010154d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101550:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101554:	c7 44 24 08 0c 3d 10 	movl   $0xc0103d0c,0x8(%esp)
c010155b:	c0 
c010155c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010155f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101563:	8b 45 08             	mov    0x8(%ebp),%eax
c0101566:	89 04 24             	mov    %eax,(%esp)
c0101569:	e8 74 12 00 00       	call   c01027e2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c010156e:	8b 45 10             	mov    0x10(%ebp),%eax
c0101571:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101576:	c9                   	leave  
c0101577:	c3                   	ret    

c0101578 <sys_fork>:
#include "mmu.h"
#include "pmap.h"
#include "x86.h"

extern PCB* pcb_deepcopy(PCB*,PCB*);
void sys_fork(){
c0101578:	55                   	push   %ebp
c0101579:	89 e5                	mov    %esp,%ebp
c010157b:	83 ec 28             	sub    $0x28,%esp
	PCB* fa=pcbnow;
c010157e:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101583:	89 45 f4             	mov    %eax,-0xc(%ebp)
	PCB* ch=pcb_alloc();
c0101586:	e8 b0 f8 ff ff       	call   c0100e3b <pcb_alloc>
c010158b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	pcb_deepcopy(fa,ch);//written in pcb.c
c010158e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101591:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101595:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101598:	89 04 24             	mov    %eax,(%esp)
c010159b:	e8 e2 fd ff ff       	call   c0101382 <pcb_deepcopy>
	ch->ppid=fa->pid;
c01015a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015a3:	8b 50 10             	mov    0x10(%eax),%edx
c01015a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015a9:	89 50 14             	mov    %edx,0x14(%eax)
	(fa->tf)->eax=ch->pid;
c01015ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015af:	8b 00                	mov    (%eax),%eax
c01015b1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01015b4:	8b 52 10             	mov    0x10(%edx),%edx
c01015b7:	89 50 1c             	mov    %edx,0x1c(%eax)
	(ch->tf)->eax=0;
c01015ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015bd:	8b 00                	mov    (%eax),%eax
c01015bf:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
}
c01015c6:	c9                   	leave  
c01015c7:	c3                   	ret    

c01015c8 <sys_getpid>:

uint32_t sys_getpid(){
c01015c8:	55                   	push   %ebp
c01015c9:	89 e5                	mov    %esp,%ebp
	return pcbnow->pid;
c01015cb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015d0:	8b 40 10             	mov    0x10(%eax),%eax
}
c01015d3:	5d                   	pop    %ebp
c01015d4:	c3                   	ret    

c01015d5 <sys_exit>:

void sys_exit(int suc){
c01015d5:	55                   	push   %ebp
c01015d6:	89 e5                	mov    %esp,%ebp
c01015d8:	83 ec 28             	sub    $0x28,%esp
	if(suc==0)
c01015db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01015df:	75 1a                	jne    c01015fb <sys_exit+0x26>
		printk("teminate the process of pid %d successfully!\n",pcbnow->pid);
c01015e1:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01015e6:	8b 40 10             	mov    0x10(%eax),%eax
c01015e9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015ed:	c7 04 24 30 3d 10 c0 	movl   $0xc0103d30,(%esp)
c01015f4:	e8 18 13 00 00       	call   c0102911 <printk>
c01015f9:	eb 18                	jmp    c0101613 <sys_exit+0x3e>
	else
		printk("Not teminate the process of pid %d!!!\n",pcbnow->pid);
c01015fb:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101600:	8b 40 10             	mov    0x10(%eax),%eax
c0101603:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101607:	c7 04 24 60 3d 10 c0 	movl   $0xc0103d60,(%esp)
c010160e:	e8 fe 12 00 00       	call   c0102911 <printk>
	list *lnext;
	list *t=&ready;
c0101613:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c010161a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010161f:	8b 40 04             	mov    0x4(%eax),%eax
c0101622:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101625:	75 22                	jne    c0101649 <sys_exit+0x74>
 	{
		if(t->next==now)
c0101627:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010162a:	8b 50 04             	mov    0x4(%eax),%edx
c010162d:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101632:	39 c2                	cmp    %eax,%edx
c0101634:	75 08                	jne    c010163e <sys_exit+0x69>
			lnext=t;
c0101636:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101639:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010163c:	eb 2f                	jmp    c010166d <sys_exit+0x98>
		else
			lnext=t->next;
c010163e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101641:	8b 40 04             	mov    0x4(%eax),%eax
c0101644:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101647:	eb 24                	jmp    c010166d <sys_exit+0x98>
	}
	else
	{
		if(now->next==now)
c0101649:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010164e:	8b 50 04             	mov    0x4(%eax),%edx
c0101651:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101656:	39 c2                	cmp    %eax,%edx
c0101658:	75 08                	jne    c0101662 <sys_exit+0x8d>
			lnext=t;
c010165a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010165d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101660:	eb 0b                	jmp    c010166d <sys_exit+0x98>
		else
			lnext=now->next;
c0101662:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101667:	8b 40 04             	mov    0x4(%eax),%eax
c010166a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 	}
	list_del(now);
c010166d:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101672:	89 04 24             	mov    %eax,(%esp)
c0101675:	e8 63 fe ff ff       	call   c01014dd <list_del>
	list_add_before(&free,now);
c010167a:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010167f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101683:	c7 04 24 08 4f 16 c0 	movl   $0xc0164f08,(%esp)
c010168a:	e8 01 fe ff ff       	call   c0101490 <list_add_before>
	lcr3(PADDR(kern_pgdir));
c010168f:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101694:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101698:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
c010169f:	00 
c01016a0:	c7 04 24 87 3d 10 c0 	movl   $0xc0103d87,(%esp)
c01016a7:	e8 91 fe ff ff       	call   c010153d <_paddr>
c01016ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01016af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01016b2:	0f 22 d8             	mov    %eax,%cr3
	pcb_remove(pcbnow);
c01016b5:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016ba:	89 04 24             	mov    %eax,(%esp)
c01016bd:	e8 58 fd ff ff       	call   c010141a <pcb_remove>
	now=lnext;
c01016c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016c5:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c01016ca:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016cf:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c01016d4:	75 0c                	jne    c01016e2 <sys_exit+0x10d>
		pcbnow=&init;
c01016d6:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01016dd:	3f 16 c0 
c01016e0:	eb 0d                	jmp    c01016ef <sys_exit+0x11a>
	else
		pcbnow=list_entry(now,PCB,plist);
c01016e2:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01016e7:	83 e8 08             	sub    $0x8,%eax
c01016ea:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01016ef:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01016f4:	05 f8 0f 00 00       	add    $0xff8,%eax
c01016f9:	89 04 24             	mov    %eax,(%esp)
c01016fc:	e8 43 0f 00 00       	call   c0102644 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c0101701:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101706:	8b 40 04             	mov    0x4(%eax),%eax
c0101709:	89 44 24 08          	mov    %eax,0x8(%esp)
c010170d:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
c0101714:	00 
c0101715:	c7 04 24 87 3d 10 c0 	movl   $0xc0103d87,(%esp)
c010171c:	e8 1c fe ff ff       	call   c010153d <_paddr>
c0101721:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101724:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101727:	0f 22 d8             	mov    %eax,%cr3
}
c010172a:	c9                   	leave  
c010172b:	c3                   	ret    

c010172c <sys_sleep>:

void sys_sleep(int time){
c010172c:	55                   	push   %ebp
c010172d:	89 e5                	mov    %esp,%ebp
c010172f:	83 ec 28             	sub    $0x28,%esp
	list *lnext;
	list *t=&ready;
c0101732:	c7 45 f0 00 4f 16 c0 	movl   $0xc0164f00,-0x10(%ebp)
	if(now->next==t)
c0101739:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010173e:	8b 40 04             	mov    0x4(%eax),%eax
c0101741:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101744:	75 22                	jne    c0101768 <sys_sleep+0x3c>
	{
		if(t->next==now)
c0101746:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101749:	8b 50 04             	mov    0x4(%eax),%edx
c010174c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101751:	39 c2                	cmp    %eax,%edx
c0101753:	75 08                	jne    c010175d <sys_sleep+0x31>
			lnext=t;
c0101755:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101758:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010175b:	eb 2f                	jmp    c010178c <sys_sleep+0x60>
		else
			lnext=t->next;
c010175d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101760:	8b 40 04             	mov    0x4(%eax),%eax
c0101763:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101766:	eb 24                	jmp    c010178c <sys_sleep+0x60>
	}
	else
	{
		if(now->next==now)
c0101768:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010176d:	8b 50 04             	mov    0x4(%eax),%edx
c0101770:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101775:	39 c2                	cmp    %eax,%edx
c0101777:	75 08                	jne    c0101781 <sys_sleep+0x55>
			lnext=t;
c0101779:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010177c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010177f:	eb 0b                	jmp    c010178c <sys_sleep+0x60>
		else
			lnext=now->next;
c0101781:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101786:	8b 40 04             	mov    0x4(%eax),%eax
c0101789:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	list_del(now);
c010178c:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c0101791:	89 04 24             	mov    %eax,(%esp)
c0101794:	e8 44 fd ff ff       	call   c01014dd <list_del>
	list_add_before(&block,now);
c0101799:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c010179e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017a2:	c7 04 24 e4 3e 16 c0 	movl   $0xc0163ee4,(%esp)
c01017a9:	e8 e2 fc ff ff       	call   c0101490 <list_add_before>
	pcbnow->state=BLOCKED;
c01017ae:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01017b3:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
	pcbnow->timecount=time*60;
c01017ba:	8b 15 e0 3e 16 c0    	mov    0xc0163ee0,%edx
c01017c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01017c3:	c1 e0 02             	shl    $0x2,%eax
c01017c6:	89 c1                	mov    %eax,%ecx
c01017c8:	c1 e1 04             	shl    $0x4,%ecx
c01017cb:	29 c1                	sub    %eax,%ecx
c01017cd:	89 c8                	mov    %ecx,%eax
c01017cf:	89 42 1c             	mov    %eax,0x1c(%edx)
	now=lnext;
c01017d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017d5:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
	if(now==&ready)
c01017da:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017df:	3d 00 4f 16 c0       	cmp    $0xc0164f00,%eax
c01017e4:	75 0c                	jne    c01017f2 <sys_sleep+0xc6>
		pcbnow=&init;
c01017e6:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c01017ed:	3f 16 c0 
c01017f0:	eb 0d                	jmp    c01017ff <sys_sleep+0xd3>
	else
		pcbnow=list_entry(now,PCB,plist);
c01017f2:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01017f7:	83 e8 08             	sub    $0x8,%eax
c01017fa:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
	set_tss_esp0((uint32_t)pcbnow+STACKSIZE-8);
c01017ff:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101804:	05 f8 0f 00 00       	add    $0xff8,%eax
c0101809:	89 04 24             	mov    %eax,(%esp)
c010180c:	e8 33 0e 00 00       	call   c0102644 <set_tss_esp0>
	lcr3(PADDR(pcbnow->pgdir));
c0101811:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0101816:	8b 40 04             	mov    0x4(%eax),%eax
c0101819:	89 44 24 08          	mov    %eax,0x8(%esp)
c010181d:	c7 44 24 04 53 00 00 	movl   $0x53,0x4(%esp)
c0101824:	00 
c0101825:	c7 04 24 87 3d 10 c0 	movl   $0xc0103d87,(%esp)
c010182c:	e8 0c fd ff ff       	call   c010153d <_paddr>
c0101831:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101834:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101837:	0f 22 d8             	mov    %eax,%cr3
	//printk("%x\n",((uint32_t)pcbnow+STACKSIZE-8));
}
c010183a:	c9                   	leave  
c010183b:	c3                   	ret    

c010183c <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c010183c:	55                   	push   %ebp
c010183d:	89 e5                	mov    %esp,%ebp
c010183f:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101842:	8b 45 10             	mov    0x10(%ebp),%eax
c0101845:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c010184a:	77 21                	ja     c010186d <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c010184c:	8b 45 10             	mov    0x10(%ebp),%eax
c010184f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101853:	c7 44 24 08 a0 3d 10 	movl   $0xc0103da0,0x8(%esp)
c010185a:	c0 
c010185b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010185e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101862:	8b 45 08             	mov    0x8(%ebp),%eax
c0101865:	89 04 24             	mov    %eax,(%esp)
c0101868:	e8 75 0f 00 00       	call   c01027e2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c010186d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101870:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0101875:	c9                   	leave  
c0101876:	c3                   	ret    

c0101877 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0101877:	55                   	push   %ebp
c0101878:	89 e5                	mov    %esp,%ebp
c010187a:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c010187d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101880:	c1 e8 0c             	shr    $0xc,%eax
c0101883:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0101888:	76 21                	jbe    c01018ab <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c010188a:	8b 45 10             	mov    0x10(%ebp),%eax
c010188d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101891:	c7 44 24 08 c4 3d 10 	movl   $0xc0103dc4,0x8(%esp)
c0101898:	c0 
c0101899:	8b 45 0c             	mov    0xc(%ebp),%eax
c010189c:	89 44 24 04          	mov    %eax,0x4(%esp)
c01018a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01018a3:	89 04 24             	mov    %eax,(%esp)
c01018a6:	e8 37 0f 00 00       	call   c01027e2 <_panic>
	return (void *)(pa + KERNBASE);
c01018ab:	8b 45 10             	mov    0x10(%ebp),%eax
c01018ae:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c01018b3:	c9                   	leave  
c01018b4:	c3                   	ret    

c01018b5 <page2pa>:
void	pgdir_remove(pde_t *pgdir);
void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c01018b5:	55                   	push   %ebp
c01018b6:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c01018b8:	8b 55 08             	mov    0x8(%ebp),%edx
c01018bb:	b8 60 f7 16 c0       	mov    $0xc016f760,%eax
c01018c0:	29 c2                	sub    %eax,%edx
c01018c2:	89 d0                	mov    %edx,%eax
c01018c4:	c1 f8 03             	sar    $0x3,%eax
c01018c7:	c1 e0 0c             	shl    $0xc,%eax
}
c01018ca:	5d                   	pop    %ebp
c01018cb:	c3                   	ret    

c01018cc <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c01018cc:	55                   	push   %ebp
c01018cd:	89 e5                	mov    %esp,%ebp
c01018cf:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c01018d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01018d5:	c1 e8 0c             	shr    $0xc,%eax
c01018d8:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01018dd:	76 1c                	jbe    c01018fb <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c01018df:	c7 44 24 08 e8 3d 10 	movl   $0xc0103de8,0x8(%esp)
c01018e6:	c0 
c01018e7:	c7 44 24 04 4a 00 00 	movl   $0x4a,0x4(%esp)
c01018ee:	00 
c01018ef:	c7 04 24 07 3e 10 c0 	movl   $0xc0103e07,(%esp)
c01018f6:	e8 e7 0e 00 00       	call   c01027e2 <_panic>
	return &pages[PGNUM(pa)];
c01018fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01018fe:	c1 e8 0c             	shr    $0xc,%eax
c0101901:	c1 e0 03             	shl    $0x3,%eax
c0101904:	05 60 f7 16 c0       	add    $0xc016f760,%eax
}
c0101909:	c9                   	leave  
c010190a:	c3                   	ret    

c010190b <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c010190b:	55                   	push   %ebp
c010190c:	89 e5                	mov    %esp,%ebp
c010190e:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101911:	8b 45 08             	mov    0x8(%ebp),%eax
c0101914:	89 04 24             	mov    %eax,(%esp)
c0101917:	e8 99 ff ff ff       	call   c01018b5 <page2pa>
c010191c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101920:	c7 44 24 04 51 00 00 	movl   $0x51,0x4(%esp)
c0101927:	00 
c0101928:	c7 04 24 07 3e 10 c0 	movl   $0xc0103e07,(%esp)
c010192f:	e8 43 ff ff ff       	call   c0101877 <_kaddr>
}
c0101934:	c9                   	leave  
c0101935:	c3                   	ret    

c0101936 <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c0101936:	55                   	push   %ebp
c0101937:	89 e5                	mov    %esp,%ebp
c0101939:	53                   	push   %ebx
c010193a:	83 ec 54             	sub    $0x54,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
c010193d:	c7 45 e4 00 30 13 c0 	movl   $0xc0133000,-0x1c(%ebp)
	pte_t *pgtable = kpgtable;
c0101944:	c7 45 f0 00 40 13 c0 	movl   $0xc0134000,-0x10(%ebp)
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c010194b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101952:	eb 40                	jmp    c0101994 <page_init+0x5e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
c0101954:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101957:	05 00 03 00 00       	add    $0x300,%eax
c010195c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101963:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101966:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101969:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010196c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101970:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c0101977:	00 
c0101978:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c010197f:	e8 b8 fe ff ff       	call   c010183c <_paddr>
c0101984:	83 c8 03             	or     $0x3,%eax
c0101987:	89 03                	mov    %eax,(%ebx)
		pgtable += NPTENTRIES;
c0101989:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
	pte_t *pgtable = kpgtable;
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c0101990:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101994:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c0101998:	7e ba                	jle    c0101954 <page_init+0x1e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
c010199a:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgtable--;
c01019a1:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c01019a5:	eb 18                	jmp    c01019bf <page_init+0x89>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
c01019a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01019aa:	83 c8 07             	or     $0x7,%eax
c01019ad:	89 c2                	mov    %eax,%edx
c01019af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01019b2:	89 10                	mov    %edx,(%eax)
		pgtable --;
c01019b4:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
	pgtable--;
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c01019b8:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c01019bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01019c3:	79 e2                	jns    c01019a7 <page_init+0x71>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
		pgtable --;
	}
	kern_pgdir = pgdir;
c01019c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01019c8:	a3 40 f7 16 c0       	mov    %eax,0xc016f740
	lcr3(PADDR(kern_pgdir));	
c01019cd:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c01019d2:	89 44 24 08          	mov    %eax,0x8(%esp)
c01019d6:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c01019dd:	00 
c01019de:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c01019e5:	e8 52 fe ff ff       	call   c010183c <_paddr>
c01019ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01019ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01019f0:	0f 22 d8             	mov    %eax,%cr3
	unsigned long i;
	int base = 0x400;
c01019f3:	c7 45 e0 00 04 00 00 	movl   $0x400,-0x20(%ebp)
	for (i = 0; i < base; i++) {
c01019fa:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101a01:	eb 11                	jmp    c0101a14 <page_init+0xde>
		pages[i].pp_ref = 1;
c0101a03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a06:	66 c7 04 c5 64 f7 16 	movw   $0x1,-0x3fe9089c(,%eax,8)
c0101a0d:	c0 01 00 
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
c0101a10:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0101a14:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101a17:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101a1a:	77 e7                	ja     c0101a03 <page_init+0xcd>
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101a1c:	c7 45 e8 ff 7f 00 00 	movl   $0x7fff,-0x18(%ebp)
c0101a23:	eb 31                	jmp    c0101a56 <page_init+0x120>
		pages[i].pp_ref = 0;
c0101a25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a28:	66 c7 04 c5 64 f7 16 	movw   $0x0,-0x3fe9089c(,%eax,8)
c0101a2f:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101a32:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101a38:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a3b:	89 14 c5 60 f7 16 c0 	mov    %edx,-0x3fe908a0(,%eax,8)
		page_free_list = &pages[i];
c0101a42:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101a45:	c1 e0 03             	shl    $0x3,%eax
c0101a48:	05 60 f7 16 c0       	add    $0xc016f760,%eax
c0101a4d:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101a52:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c0101a56:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101a59:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101a5c:	76 c7                	jbe    c0101a25 <page_init+0xef>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c0101a5e:	c7 45 dc 00 10 00 00 	movl   $0x1000,-0x24(%ebp)
c0101a65:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a68:	05 ff f9 00 00       	add    $0xf9ff,%eax
c0101a6d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101a70:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101a73:	ba 00 00 00 00       	mov    $0x0,%edx
c0101a78:	f7 75 dc             	divl   -0x24(%ebp)
c0101a7b:	89 d0                	mov    %edx,%eax
c0101a7d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a80:	29 c2                	sub    %eax,%edx
c0101a82:	89 d0                	mov    %edx,%eax
c0101a84:	89 c2                	mov    %eax,%edx
c0101a86:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101a8b:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c0101a92:	00 
c0101a93:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c0101a9a:	00 
c0101a9b:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101a9f:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101aa6:	00 
c0101aa7:	89 04 24             	mov    %eax,(%esp)
c0101aaa:	e8 2c 05 00 00       	call   c0101fdb <boot_map_region>
}
c0101aaf:	83 c4 54             	add    $0x54,%esp
c0101ab2:	5b                   	pop    %ebx
c0101ab3:	5d                   	pop    %ebp
c0101ab4:	c3                   	ret    

c0101ab5 <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101ab5:	55                   	push   %ebp
c0101ab6:	89 e5                	mov    %esp,%ebp
c0101ab8:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101abb:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101ac0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101ac3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101ac7:	75 07                	jne    c0101ad0 <page_alloc+0x1b>
c0101ac9:	b8 00 00 00 00       	mov    $0x0,%eax
c0101ace:	eb 45                	jmp    c0101b15 <page_alloc+0x60>
	if (alloc_flags & ALLOC_ZERO) {
c0101ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ad3:	83 e0 01             	and    $0x1,%eax
c0101ad6:	85 c0                	test   %eax,%eax
c0101ad8:	74 23                	je     c0101afd <page_alloc+0x48>
		memset(page2kva(p), 0, PGSIZE);
c0101ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101add:	89 04 24             	mov    %eax,(%esp)
c0101ae0:	e8 26 fe ff ff       	call   c010190b <page2kva>
c0101ae5:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101aec:	00 
c0101aed:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101af4:	00 
c0101af5:	89 04 24             	mov    %eax,(%esp)
c0101af8:	e8 f8 11 00 00       	call   c0102cf5 <memset>
	}
	page_free_list = page_free_list -> pp_link;
c0101afd:	a1 00 20 13 c0       	mov    0xc0132000,%eax
c0101b02:	8b 00                	mov    (%eax),%eax
c0101b04:	a3 00 20 13 c0       	mov    %eax,0xc0132000
	p -> pp_link = NULL;
c0101b09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b0c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c0101b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101b15:	c9                   	leave  
c0101b16:	c3                   	ret    

c0101b17 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101b17:	55                   	push   %ebp
c0101b18:	89 e5                	mov    %esp,%ebp
c0101b1a:	83 ec 18             	sub    $0x18,%esp
	assert(pp->pp_ref == 0 && pp->pp_link == NULL);
c0101b1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b20:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b24:	66 85 c0             	test   %ax,%ax
c0101b27:	75 09                	jne    c0101b32 <page_free+0x1b>
c0101b29:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b2c:	8b 00                	mov    (%eax),%eax
c0101b2e:	85 c0                	test   %eax,%eax
c0101b30:	74 24                	je     c0101b56 <page_free+0x3f>
c0101b32:	c7 44 24 0c 34 3e 10 	movl   $0xc0103e34,0xc(%esp)
c0101b39:	c0 
c0101b3a:	c7 44 24 08 5b 3e 10 	movl   $0xc0103e5b,0x8(%esp)
c0101b41:	c0 
c0101b42:	c7 44 24 04 7b 00 00 	movl   $0x7b,0x4(%esp)
c0101b49:	00 
c0101b4a:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101b51:	e8 8c 0c 00 00       	call   c01027e2 <_panic>
	pp->pp_link = page_free_list;
c0101b56:	8b 15 00 20 13 c0    	mov    0xc0132000,%edx
c0101b5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b5f:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c0101b61:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b64:	a3 00 20 13 c0       	mov    %eax,0xc0132000
}
c0101b69:	c9                   	leave  
c0101b6a:	c3                   	ret    

c0101b6b <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c0101b6b:	55                   	push   %ebp
c0101b6c:	89 e5                	mov    %esp,%ebp
c0101b6e:	83 ec 18             	sub    $0x18,%esp
	if (--pp->pp_ref == 0)
c0101b71:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b74:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b78:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101b7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b7e:	66 89 50 04          	mov    %dx,0x4(%eax)
c0101b82:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b85:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101b89:	66 85 c0             	test   %ax,%ax
c0101b8c:	75 0b                	jne    c0101b99 <page_decref+0x2e>
		page_free(pp);
c0101b8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b91:	89 04 24             	mov    %eax,(%esp)
c0101b94:	e8 7e ff ff ff       	call   c0101b17 <page_free>
}
c0101b99:	c9                   	leave  
c0101b9a:	c3                   	ret    

c0101b9b <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c0101b9b:	55                   	push   %ebp
c0101b9c:	89 e5                	mov    %esp,%ebp
c0101b9e:	53                   	push   %ebx
c0101b9f:	83 ec 24             	sub    $0x24,%esp
	pte_t *pgtable;
	int pdx = PDX(va);
c0101ba2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ba5:	c1 e8 16             	shr    $0x16,%eax
c0101ba8:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pgdir[pdx] & PTE_P) {
c0101bab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101bae:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101bb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bb8:	01 d0                	add    %edx,%eax
c0101bba:	8b 00                	mov    (%eax),%eax
c0101bbc:	83 e0 01             	and    $0x1,%eax
c0101bbf:	85 c0                	test   %eax,%eax
c0101bc1:	74 33                	je     c0101bf6 <pgdir_walk+0x5b>
		pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
c0101bc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101bc6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101bcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bd0:	01 d0                	add    %edx,%eax
c0101bd2:	8b 00                	mov    (%eax),%eax
c0101bd4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101bd9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101bdd:	c7 44 24 04 a7 00 00 	movl   $0xa7,0x4(%esp)
c0101be4:	00 
c0101be5:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101bec:	e8 86 fc ff ff       	call   c0101877 <_kaddr>
c0101bf1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bf4:	eb 7b                	jmp    c0101c71 <pgdir_walk+0xd6>
	}
	else {
		if (create == false) return NULL;
c0101bf6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101bfa:	75 0a                	jne    c0101c06 <pgdir_walk+0x6b>
c0101bfc:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c01:	e9 88 00 00 00       	jmp    c0101c8e <pgdir_walk+0xf3>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0101c06:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101c0d:	e8 a3 fe ff ff       	call   c0101ab5 <page_alloc>
c0101c12:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (p == NULL) return NULL;
c0101c15:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101c19:	75 07                	jne    c0101c22 <pgdir_walk+0x87>
c0101c1b:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c20:	eb 6c                	jmp    c0101c8e <pgdir_walk+0xf3>
		pgtable = page2kva(p);
c0101c22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c25:	89 04 24             	mov    %eax,(%esp)
c0101c28:	e8 de fc ff ff       	call   c010190b <page2kva>
c0101c2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		p -> pp_ref ++;
c0101c30:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c33:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101c37:	8d 50 01             	lea    0x1(%eax),%edx
c0101c3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c3d:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[pdx] = PADDR(pgtable) | PTE_P | PTE_W | PTE_U;
c0101c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101c44:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c4e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c54:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101c58:	c7 44 24 04 af 00 00 	movl   $0xaf,0x4(%esp)
c0101c5f:	00 
c0101c60:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101c67:	e8 d0 fb ff ff       	call   c010183c <_paddr>
c0101c6c:	83 c8 07             	or     $0x7,%eax
c0101c6f:	89 03                	mov    %eax,(%ebx)
	}
	int ptx = PTX(va);
c0101c71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c74:	c1 e8 0c             	shr    $0xc,%eax
c0101c77:	25 ff 03 00 00       	and    $0x3ff,%eax
c0101c7c:	89 45 e8             	mov    %eax,-0x18(%ebp)
	return &pgtable[ptx];
c0101c7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c82:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c8c:	01 d0                	add    %edx,%eax

}
c0101c8e:	83 c4 24             	add    $0x24,%esp
c0101c91:	5b                   	pop    %ebx
c0101c92:	5d                   	pop    %ebp
c0101c93:	c3                   	ret    

c0101c94 <pgdir_copy>:

void 
pgdir_copy(pde_t *src, pde_t *dst)
{
c0101c94:	55                   	push   %ebp
c0101c95:	89 e5                	mov    %esp,%ebp
c0101c97:	53                   	push   %ebx
c0101c98:	83 ec 34             	sub    $0x34,%esp
	struct Page *p;
	int pdx, ptx;
	for (pdx=0;pdx<1024;pdx++){
c0101c9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101ca2:	e9 d3 01 00 00       	jmp    c0101e7a <pgdir_copy+0x1e6>
		if (src[pdx]&PTE_P){	
c0101ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101caa:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101cb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cb4:	01 d0                	add    %edx,%eax
c0101cb6:	8b 00                	mov    (%eax),%eax
c0101cb8:	83 e0 01             	and    $0x1,%eax
c0101cbb:	85 c0                	test   %eax,%eax
c0101cbd:	0f 84 b3 01 00 00    	je     c0101e76 <pgdir_copy+0x1e2>
			if (dst[pdx]&PTE_P) 
c0101cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101cc6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ccd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101cd0:	01 d0                	add    %edx,%eax
c0101cd2:	8b 00                	mov    (%eax),%eax
c0101cd4:	83 e0 01             	and    $0x1,%eax
c0101cd7:	85 c0                	test   %eax,%eax
c0101cd9:	74 05                	je     c0101ce0 <pgdir_copy+0x4c>
				continue;
c0101cdb:	e9 96 01 00 00       	jmp    c0101e76 <pgdir_copy+0x1e2>
			pte_t *src_table=KADDR(PTE_ADDR(src[pdx]));
c0101ce0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ce3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101cea:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ced:	01 d0                	add    %edx,%eax
c0101cef:	8b 00                	mov    (%eax),%eax
c0101cf1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101cf6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101cfa:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
c0101d01:	00 
c0101d02:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101d09:	e8 69 fb ff ff       	call   c0101877 <_kaddr>
c0101d0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
			p = page_alloc(ALLOC_ZERO);
c0101d11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101d18:	e8 98 fd ff ff       	call   c0101ab5 <page_alloc>
c0101d1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p->pp_ref ++;
c0101d20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d23:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101d27:	8d 50 01             	lea    0x1(%eax),%edx
c0101d2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d2d:	66 89 50 04          	mov    %dx,0x4(%eax)
			dst[pdx]=page2pa(p)|(src[pdx]&0xFFF);
c0101d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d34:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d3e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101d41:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d44:	89 04 24             	mov    %eax,(%esp)
c0101d47:	e8 69 fb ff ff       	call   c01018b5 <page2pa>
c0101d4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101d4f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101d56:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d59:	01 ca                	add    %ecx,%edx
c0101d5b:	8b 12                	mov    (%edx),%edx
c0101d5d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101d63:	09 d0                	or     %edx,%eax
c0101d65:	89 03                	mov    %eax,(%ebx)
			pte_t *dst_table=KADDR(PTE_ADDR(dst[pdx]));
c0101d67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d6a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101d71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d74:	01 d0                	add    %edx,%eax
c0101d76:	8b 00                	mov    (%eax),%eax
c0101d78:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101d7d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d81:	c7 44 24 04 c3 00 00 	movl   $0xc3,0x4(%esp)
c0101d88:	00 
c0101d89:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101d90:	e8 e2 fa ff ff       	call   c0101877 <_kaddr>
c0101d95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			for (ptx=0;ptx<NPTENTRIES;ptx++){ 
c0101d98:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101d9f:	e9 c5 00 00 00       	jmp    c0101e69 <pgdir_copy+0x1d5>
				if (src_table[ptx]&PTE_P){ 
c0101da4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101da7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101dae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101db1:	01 d0                	add    %edx,%eax
c0101db3:	8b 00                	mov    (%eax),%eax
c0101db5:	83 e0 01             	and    $0x1,%eax
c0101db8:	85 c0                	test   %eax,%eax
c0101dba:	0f 84 a5 00 00 00    	je     c0101e65 <pgdir_copy+0x1d1>
					p = page_alloc(0);
c0101dc0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0101dc7:	e8 e9 fc ff ff       	call   c0101ab5 <page_alloc>
c0101dcc:	89 45 e8             	mov    %eax,-0x18(%ebp)
					p->pp_ref++;
c0101dcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dd2:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101dd6:	8d 50 01             	lea    0x1(%eax),%edx
c0101dd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ddc:	66 89 50 04          	mov    %dx,0x4(%eax)
					dst_table[ptx] = page2pa(p)|(src_table[ptx]&0xFFF);
c0101de0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101de3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101dea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ded:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101df0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101df3:	89 04 24             	mov    %eax,(%esp)
c0101df6:	e8 ba fa ff ff       	call   c01018b5 <page2pa>
c0101dfb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101dfe:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
c0101e05:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101e08:	01 ca                	add    %ecx,%edx
c0101e0a:	8b 12                	mov    (%edx),%edx
c0101e0c:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c0101e12:	09 d0                	or     %edx,%eax
c0101e14:	89 03                	mov    %eax,(%ebx)
					memcpy(page2kva(p), KADDR(PTE_ADDR(src_table[ptx])), PGSIZE);
c0101e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e19:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101e20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e23:	01 d0                	add    %edx,%eax
c0101e25:	8b 00                	mov    (%eax),%eax
c0101e27:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101e2c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e30:	c7 44 24 04 c9 00 00 	movl   $0xc9,0x4(%esp)
c0101e37:	00 
c0101e38:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101e3f:	e8 33 fa ff ff       	call   c0101877 <_kaddr>
c0101e44:	89 c3                	mov    %eax,%ebx
c0101e46:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e49:	89 04 24             	mov    %eax,(%esp)
c0101e4c:	e8 ba fa ff ff       	call   c010190b <page2kva>
c0101e51:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101e58:	00 
c0101e59:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0101e5d:	89 04 24             	mov    %eax,(%esp)
c0101e60:	e8 73 0e 00 00       	call   c0102cd8 <memcpy>
			pte_t *src_table=KADDR(PTE_ADDR(src[pdx]));
			p = page_alloc(ALLOC_ZERO);
			p->pp_ref ++;
			dst[pdx]=page2pa(p)|(src[pdx]&0xFFF);
			pte_t *dst_table=KADDR(PTE_ADDR(dst[pdx]));
			for (ptx=0;ptx<NPTENTRIES;ptx++){ 
c0101e65:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101e69:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101e70:	0f 8e 2e ff ff ff    	jle    c0101da4 <pgdir_copy+0x110>
void 
pgdir_copy(pde_t *src, pde_t *dst)
{
	struct Page *p;
	int pdx, ptx;
	for (pdx=0;pdx<1024;pdx++){
c0101e76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e7a:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101e81:	0f 8e 20 fe ff ff    	jle    c0101ca7 <pgdir_copy+0x13>
					memcpy(page2kva(p), KADDR(PTE_ADDR(src_table[ptx])), PGSIZE);
				}
			}
		}
	}
}
c0101e87:	83 c4 34             	add    $0x34,%esp
c0101e8a:	5b                   	pop    %ebx
c0101e8b:	5d                   	pop    %ebp
c0101e8c:	c3                   	ret    

c0101e8d <pgdir_remove>:
void 
pgdir_remove(pde_t *pgdir)
{
c0101e8d:	55                   	push   %ebp
c0101e8e:	89 e5                	mov    %esp,%ebp
c0101e90:	83 ec 28             	sub    $0x28,%esp
	int pdx,ptx;
	for (pdx=0; pdx<1024;pdx++) {
c0101e93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101e9a:	e9 fb 00 00 00       	jmp    c0101f9a <pgdir_remove+0x10d>
		if (pgdir[pdx]&PTE_P) {
c0101e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ea2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ea9:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eac:	01 d0                	add    %edx,%eax
c0101eae:	8b 00                	mov    (%eax),%eax
c0101eb0:	83 e0 01             	and    $0x1,%eax
c0101eb3:	85 c0                	test   %eax,%eax
c0101eb5:	0f 84 db 00 00 00    	je     c0101f96 <pgdir_remove+0x109>
			if (kern_pgdir[pdx]&PTE_P) 
c0101ebb:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c0101ec0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101ec3:	c1 e2 02             	shl    $0x2,%edx
c0101ec6:	01 d0                	add    %edx,%eax
c0101ec8:	8b 00                	mov    (%eax),%eax
c0101eca:	83 e0 01             	and    $0x1,%eax
c0101ecd:	85 c0                	test   %eax,%eax
c0101ecf:	74 05                	je     c0101ed6 <pgdir_remove+0x49>
				continue;
c0101ed1:	e9 c0 00 00 00       	jmp    c0101f96 <pgdir_remove+0x109>
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[pdx]));
c0101ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ed9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ee3:	01 d0                	add    %edx,%eax
c0101ee5:	8b 00                	mov    (%eax),%eax
c0101ee7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101eec:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101ef0:	c7 44 24 04 d7 00 00 	movl   $0xd7,0x4(%esp)
c0101ef7:	00 
c0101ef8:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101eff:	e8 73 f9 ff ff       	call   c0101877 <_kaddr>
c0101f04:	89 45 ec             	mov    %eax,-0x14(%ebp)
			for (ptx=0; ptx<NPTENTRIES;ptx++){
c0101f07:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101f0e:	eb 42                	jmp    c0101f52 <pgdir_remove+0xc5>
				if (pgtable[ptx]&PTE_P){
c0101f10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f13:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101f1d:	01 d0                	add    %edx,%eax
c0101f1f:	8b 00                	mov    (%eax),%eax
c0101f21:	83 e0 01             	and    $0x1,%eax
c0101f24:	85 c0                	test   %eax,%eax
c0101f26:	74 26                	je     c0101f4e <pgdir_remove+0xc1>
					page_decref(pa2page(PTE_ADDR(pgtable[ptx])));
c0101f28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f2b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101f35:	01 d0                	add    %edx,%eax
c0101f37:	8b 00                	mov    (%eax),%eax
c0101f39:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101f3e:	89 04 24             	mov    %eax,(%esp)
c0101f41:	e8 86 f9 ff ff       	call   c01018cc <pa2page>
c0101f46:	89 04 24             	mov    %eax,(%esp)
c0101f49:	e8 1d fc ff ff       	call   c0101b6b <page_decref>
	for (pdx=0; pdx<1024;pdx++) {
		if (pgdir[pdx]&PTE_P) {
			if (kern_pgdir[pdx]&PTE_P) 
				continue;
			pte_t *pgtable =KADDR(PTE_ADDR(pgdir[pdx]));
			for (ptx=0; ptx<NPTENTRIES;ptx++){
c0101f4e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f52:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
c0101f59:	7e b5                	jle    c0101f10 <pgdir_remove+0x83>
				if (pgtable[ptx]&PTE_P){
					page_decref(pa2page(PTE_ADDR(pgtable[ptx])));
				}
			}
			page_decref(pa2page(PTE_ADDR(pgdir[pdx])));
c0101f5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f5e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f65:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f68:	01 d0                	add    %edx,%eax
c0101f6a:	8b 00                	mov    (%eax),%eax
c0101f6c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101f71:	89 04 24             	mov    %eax,(%esp)
c0101f74:	e8 53 f9 ff ff       	call   c01018cc <pa2page>
c0101f79:	89 04 24             	mov    %eax,(%esp)
c0101f7c:	e8 ea fb ff ff       	call   c0101b6b <page_decref>
			pgdir[pdx]=0;
c0101f81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f84:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101f8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f8e:	01 d0                	add    %edx,%eax
c0101f90:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
void 
pgdir_remove(pde_t *pgdir)
{
	int pdx,ptx;
	for (pdx=0; pdx<1024;pdx++) {
c0101f96:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101f9a:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c0101fa1:	0f 8e f8 fe ff ff    	jle    c0101e9f <pgdir_remove+0x12>
			}
			page_decref(pa2page(PTE_ADDR(pgdir[pdx])));
			pgdir[pdx]=0;
		}
	}
	page_decref(pa2page(PADDR(pgdir)));
c0101fa7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101faa:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101fae:	c7 44 24 04 e1 00 00 	movl   $0xe1,0x4(%esp)
c0101fb5:	00 
c0101fb6:	c7 04 24 1d 3e 10 c0 	movl   $0xc0103e1d,(%esp)
c0101fbd:	e8 7a f8 ff ff       	call   c010183c <_paddr>
c0101fc2:	89 04 24             	mov    %eax,(%esp)
c0101fc5:	e8 02 f9 ff ff       	call   c01018cc <pa2page>
c0101fca:	89 04 24             	mov    %eax,(%esp)
c0101fcd:	e8 99 fb ff ff       	call   c0101b6b <page_decref>
	pgdir=NULL;
c0101fd2:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
c0101fd9:	c9                   	leave  
c0101fda:	c3                   	ret    

c0101fdb <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c0101fdb:	55                   	push   %ebp
c0101fdc:	89 e5                	mov    %esp,%ebp
c0101fde:	83 ec 28             	sub    $0x28,%esp
	int i,n;
	n=size/PGSIZE;
c0101fe1:	8b 45 10             	mov    0x10(%ebp),%eax
c0101fe4:	c1 e8 0c             	shr    $0xc,%eax
c0101fe7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (i = 0; i < n; i ++) {
c0101fea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101ff1:	eb 47                	jmp    c010203a <boot_map_region+0x5f>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0101ff3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ff6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101ffd:	00 
c0101ffe:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102002:	8b 45 08             	mov    0x8(%ebp),%eax
c0102005:	89 04 24             	mov    %eax,(%esp)
c0102008:	e8 8e fb ff ff       	call   c0101b9b <pgdir_walk>
c010200d:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (pte == NULL) return;
c0102010:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0102014:	75 02                	jne    c0102018 <boot_map_region+0x3d>
c0102016:	eb 2a                	jmp    c0102042 <boot_map_region+0x67>
		*pte = pa | perm | PTE_P;
c0102018:	8b 45 18             	mov    0x18(%ebp),%eax
c010201b:	0b 45 14             	or     0x14(%ebp),%eax
c010201e:	83 c8 01             	or     $0x1,%eax
c0102021:	89 c2                	mov    %eax,%edx
c0102023:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102026:	89 10                	mov    %edx,(%eax)
		va += PGSIZE;
c0102028:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa += PGSIZE;
c010202f:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i,n;
	n=size/PGSIZE;
	for (i = 0; i < n; i ++) {
c0102036:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010203a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010203d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0102040:	7c b1                	jl     c0101ff3 <boot_map_region+0x18>
		if (pte == NULL) return;
		*pte = pa | perm | PTE_P;
		va += PGSIZE;
		pa += PGSIZE;
	}
}
c0102042:	c9                   	leave  
c0102043:	c3                   	ret    

c0102044 <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c0102044:	55                   	push   %ebp
c0102045:	89 e5                	mov    %esp,%ebp
c0102047:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, true);
c010204a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0102051:	00 
c0102052:	8b 45 10             	mov    0x10(%ebp),%eax
c0102055:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102059:	8b 45 08             	mov    0x8(%ebp),%eax
c010205c:	89 04 24             	mov    %eax,(%esp)
c010205f:	e8 37 fb ff ff       	call   c0101b9b <pgdir_walk>
c0102064:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c0102067:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010206b:	75 07                	jne    c0102074 <page_insert+0x30>
		return -1;
c010206d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102072:	eb 73                	jmp    c01020e7 <page_insert+0xa3>
	}
	physaddr_t pa = page2pa(pp);
c0102074:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102077:	89 04 24             	mov    %eax,(%esp)
c010207a:	e8 36 f8 ff ff       	call   c01018b5 <page2pa>
c010207f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (*pte & PTE_P) {
c0102082:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102085:	8b 00                	mov    (%eax),%eax
c0102087:	83 e0 01             	and    $0x1,%eax
c010208a:	85 c0                	test   %eax,%eax
c010208c:	74 33                	je     c01020c1 <page_insert+0x7d>
		if (PTE_ADDR(*pte) == pa) {
c010208e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102091:	8b 00                	mov    (%eax),%eax
c0102093:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102098:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010209b:	75 12                	jne    c01020af <page_insert+0x6b>
			*pte = pa | perm | PTE_P;
c010209d:	8b 45 14             	mov    0x14(%ebp),%eax
c01020a0:	0b 45 f0             	or     -0x10(%ebp),%eax
c01020a3:	83 c8 01             	or     $0x1,%eax
c01020a6:	89 c2                	mov    %eax,%edx
c01020a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020ab:	89 10                	mov    %edx,(%eax)
c01020ad:	eb 12                	jmp    c01020c1 <page_insert+0x7d>
		}
		else {
			page_remove(pgdir, va);
c01020af:	8b 45 10             	mov    0x10(%ebp),%eax
c01020b2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01020b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01020b9:	89 04 24             	mov    %eax,(%esp)
c01020bc:	e8 7a 00 00 00       	call   c010213b <page_remove>
		}
	}
	*pte = pa | perm | PTE_P;
c01020c1:	8b 45 14             	mov    0x14(%ebp),%eax
c01020c4:	0b 45 f0             	or     -0x10(%ebp),%eax
c01020c7:	83 c8 01             	or     $0x1,%eax
c01020ca:	89 c2                	mov    %eax,%edx
c01020cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020cf:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c01020d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020d4:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01020d8:	8d 50 01             	lea    0x1(%eax),%edx
c01020db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020de:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c01020e2:	b8 00 00 00 00       	mov    $0x0,%eax

}
c01020e7:	c9                   	leave  
c01020e8:	c3                   	ret    

c01020e9 <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c01020e9:	55                   	push   %ebp
c01020ea:	89 e5                	mov    %esp,%ebp
c01020ec:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, false);
c01020ef:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01020f6:	00 
c01020f7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020fa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01020fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102101:	89 04 24             	mov    %eax,(%esp)
c0102104:	e8 92 fa ff ff       	call   c0101b9b <pgdir_walk>
c0102109:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) return NULL;
c010210c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102110:	75 07                	jne    c0102119 <page_lookup+0x30>
c0102112:	b8 00 00 00 00       	mov    $0x0,%eax
c0102117:	eb 20                	jmp    c0102139 <page_lookup+0x50>
	if (pte_store != NULL) *pte_store = pte;
c0102119:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010211d:	74 08                	je     c0102127 <page_lookup+0x3e>
c010211f:	8b 45 10             	mov    0x10(%ebp),%eax
c0102122:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102125:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(*pte));
c0102127:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010212a:	8b 00                	mov    (%eax),%eax
c010212c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0102131:	89 04 24             	mov    %eax,(%esp)
c0102134:	e8 93 f7 ff ff       	call   c01018cc <pa2page>
}
c0102139:	c9                   	leave  
c010213a:	c3                   	ret    

c010213b <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c010213b:	55                   	push   %ebp
c010213c:	89 e5                	mov    %esp,%ebp
c010213e:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte;
	pte_t **pte_store = &pte;
c0102141:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0102144:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct Page *p = page_lookup(pgdir, va, pte_store);
c0102147:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010214a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010214e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102151:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102155:	8b 45 08             	mov    0x8(%ebp),%eax
c0102158:	89 04 24             	mov    %eax,(%esp)
c010215b:	e8 89 ff ff ff       	call   c01020e9 <page_lookup>
c0102160:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p != NULL) {
c0102163:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102167:	74 28                	je     c0102191 <page_remove+0x56>
		**pte_store = 0;
c0102169:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010216c:	8b 00                	mov    (%eax),%eax
c010216e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c0102174:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102177:	89 04 24             	mov    %eax,(%esp)
c010217a:	e8 ec f9 ff ff       	call   c0101b6b <page_decref>
		tlb_invalidate(pgdir, va);
c010217f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102182:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102186:	8b 45 08             	mov    0x8(%ebp),%eax
c0102189:	89 04 24             	mov    %eax,(%esp)
c010218c:	e8 02 00 00 00       	call   c0102193 <tlb_invalidate>
	}
}
c0102191:	c9                   	leave  
c0102192:	c3                   	ret    

c0102193 <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c0102193:	55                   	push   %ebp
c0102194:	89 e5                	mov    %esp,%ebp
c0102196:	83 ec 10             	sub    $0x10,%esp
c0102199:	8b 45 0c             	mov    0xc(%ebp),%eax
c010219c:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c010219f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021a2:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c01021a5:	c9                   	leave  
c01021a6:	c3                   	ret    

c01021a7 <list_add>:

#define list_entry(ptr, type, member) \
	((type*)((char*)(ptr) - (int)(&((type*)0)->member)))

static inline void
list_add(list *prev, list *next, list *data) {
c01021a7:	55                   	push   %ebp
c01021a8:	89 e5                	mov    %esp,%ebp
c01021aa:	83 ec 18             	sub    $0x18,%esp
	assert(data != NULL);
c01021ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01021b1:	75 24                	jne    c01021d7 <list_add+0x30>
c01021b3:	c7 44 24 0c 70 3e 10 	movl   $0xc0103e70,0xc(%esp)
c01021ba:	c0 
c01021bb:	c7 44 24 08 7d 3e 10 	movl   $0xc0103e7d,0x8(%esp)
c01021c2:	c0 
c01021c3:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c01021ca:	00 
c01021cb:	c7 04 24 92 3e 10 c0 	movl   $0xc0103e92,(%esp)
c01021d2:	e8 0b 06 00 00       	call   c01027e2 <_panic>
	data->prev = prev;
c01021d7:	8b 45 10             	mov    0x10(%ebp),%eax
c01021da:	8b 55 08             	mov    0x8(%ebp),%edx
c01021dd:	89 10                	mov    %edx,(%eax)
	data->next = next;
c01021df:	8b 45 10             	mov    0x10(%ebp),%eax
c01021e2:	8b 55 0c             	mov    0xc(%ebp),%edx
c01021e5:	89 50 04             	mov    %edx,0x4(%eax)
	if (prev != NULL) prev->next = data;
c01021e8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01021ec:	74 09                	je     c01021f7 <list_add+0x50>
c01021ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01021f1:	8b 55 10             	mov    0x10(%ebp),%edx
c01021f4:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = data;
c01021f7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01021fb:	74 08                	je     c0102205 <list_add+0x5e>
c01021fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102200:	8b 55 10             	mov    0x10(%ebp),%edx
c0102203:	89 10                	mov    %edx,(%eax)
}
c0102205:	c9                   	leave  
c0102206:	c3                   	ret    

c0102207 <list_add_before>:

static inline void
list_add_before(list *one, list *data) {
c0102207:	55                   	push   %ebp
c0102208:	89 e5                	mov    %esp,%ebp
c010220a:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c010220d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102211:	75 24                	jne    c0102237 <list_add_before+0x30>
c0102213:	c7 44 24 0c a8 3e 10 	movl   $0xc0103ea8,0xc(%esp)
c010221a:	c0 
c010221b:	c7 44 24 08 7d 3e 10 	movl   $0xc0103e7d,0x8(%esp)
c0102222:	c0 
c0102223:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c010222a:	00 
c010222b:	c7 04 24 92 3e 10 c0 	movl   $0xc0103e92,(%esp)
c0102232:	e8 ab 05 00 00       	call   c01027e2 <_panic>
	list_add(one->prev, one, data);
c0102237:	8b 45 08             	mov    0x8(%ebp),%eax
c010223a:	8b 00                	mov    (%eax),%eax
c010223c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010223f:	89 54 24 08          	mov    %edx,0x8(%esp)
c0102243:	8b 55 08             	mov    0x8(%ebp),%edx
c0102246:	89 54 24 04          	mov    %edx,0x4(%esp)
c010224a:	89 04 24             	mov    %eax,(%esp)
c010224d:	e8 55 ff ff ff       	call   c01021a7 <list_add>
}
c0102252:	c9                   	leave  
c0102253:	c3                   	ret    

c0102254 <list_del>:
	assert(one != NULL);
	list_add(one, one->next, data);
}

static inline void
list_del(list *data) {
c0102254:	55                   	push   %ebp
c0102255:	89 e5                	mov    %esp,%ebp
c0102257:	83 ec 28             	sub    $0x28,%esp
	assert(data != NULL);
c010225a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010225e:	75 24                	jne    c0102284 <list_del+0x30>
c0102260:	c7 44 24 0c 70 3e 10 	movl   $0xc0103e70,0xc(%esp)
c0102267:	c0 
c0102268:	c7 44 24 08 7d 3e 10 	movl   $0xc0103e7d,0x8(%esp)
c010226f:	c0 
c0102270:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0102277:	00 
c0102278:	c7 04 24 92 3e 10 c0 	movl   $0xc0103e92,(%esp)
c010227f:	e8 5e 05 00 00       	call   c01027e2 <_panic>
	list *prev = data->prev;
c0102284:	8b 45 08             	mov    0x8(%ebp),%eax
c0102287:	8b 00                	mov    (%eax),%eax
c0102289:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list *next = data->next;
c010228c:	8b 45 08             	mov    0x8(%ebp),%eax
c010228f:	8b 40 04             	mov    0x4(%eax),%eax
c0102292:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (prev != NULL) prev->next = next;
c0102295:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102299:	74 09                	je     c01022a4 <list_del+0x50>
c010229b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010229e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01022a1:	89 50 04             	mov    %edx,0x4(%eax)
	if (next != NULL) next->prev = prev;
c01022a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01022a8:	74 08                	je     c01022b2 <list_del+0x5e>
c01022aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01022b0:	89 10                	mov    %edx,(%eax)
}
c01022b2:	c9                   	leave  
c01022b3:	c3                   	ret    

c01022b4 <list_empty>:
	assert(one != NULL);
	one->prev = one->next = one;
}

static inline bool
list_empty(list *one) {
c01022b4:	55                   	push   %ebp
c01022b5:	89 e5                	mov    %esp,%ebp
c01022b7:	83 ec 18             	sub    $0x18,%esp
	assert(one != NULL);
c01022ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01022be:	75 24                	jne    c01022e4 <list_empty+0x30>
c01022c0:	c7 44 24 0c a8 3e 10 	movl   $0xc0103ea8,0xc(%esp)
c01022c7:	c0 
c01022c8:	c7 44 24 08 7d 3e 10 	movl   $0xc0103e7d,0x8(%esp)
c01022cf:	c0 
c01022d0:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
c01022d7:	00 
c01022d8:	c7 04 24 92 3e 10 c0 	movl   $0xc0103e92,(%esp)
c01022df:	e8 fe 04 00 00       	call   c01027e2 <_panic>
	return one == one->next;
c01022e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01022e7:	8b 40 04             	mov    0x4(%eax),%eax
c01022ea:	3b 45 08             	cmp    0x8(%ebp),%eax
c01022ed:	0f 94 c0             	sete   %al
c01022f0:	0f b6 c0             	movzbl %al,%eax
}
c01022f3:	c9                   	leave  
c01022f4:	c3                   	ret    

c01022f5 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01022f5:	55                   	push   %ebp
c01022f6:	89 e5                	mov    %esp,%ebp
c01022f8:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01022fb:	8b 45 10             	mov    0x10(%ebp),%eax
c01022fe:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0102303:	77 21                	ja     c0102326 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0102305:	8b 45 10             	mov    0x10(%ebp),%eax
c0102308:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010230c:	c7 44 24 08 b4 3e 10 	movl   $0xc0103eb4,0x8(%esp)
c0102313:	c0 
c0102314:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102317:	89 44 24 04          	mov    %eax,0x4(%esp)
c010231b:	8b 45 08             	mov    0x8(%ebp),%eax
c010231e:	89 04 24             	mov    %eax,(%esp)
c0102321:	e8 bc 04 00 00       	call   c01027e2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0102326:	8b 45 10             	mov    0x10(%ebp),%eax
c0102329:	05 00 00 00 40       	add    $0x40000000,%eax
}
c010232e:	c9                   	leave  
c010232f:	c3                   	ret    

c0102330 <schedule>:
#include "list.h"
#include "pmap.h"
#include "memlayout.h"

//extern TSS tss;
void schedule(){
c0102330:	55                   	push   %ebp
c0102331:	89 e5                	mov    %esp,%ebp
c0102333:	83 ec 38             	sub    $0x38,%esp
	list *one,*ne;
	list *bl=&block;
c0102336:	c7 45 ec e4 3e 16 c0 	movl   $0xc0163ee4,-0x14(%ebp)
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c010233d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102340:	8b 40 04             	mov    0x4(%eax),%eax
c0102343:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102346:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102349:	8b 40 04             	mov    0x4(%eax),%eax
c010234c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010234f:	eb 4f                	jmp    c01023a0 <schedule+0x70>
		PCB *p=list_entry(one,PCB,plist);
c0102351:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102354:	83 e8 08             	sub    $0x8,%eax
c0102357:	89 45 e8             	mov    %eax,-0x18(%ebp)
		p->timecount--;
c010235a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010235d:	8b 40 1c             	mov    0x1c(%eax),%eax
c0102360:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102363:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102366:	89 50 1c             	mov    %edx,0x1c(%eax)
		if(p->timecount==0){
c0102369:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010236c:	8b 40 1c             	mov    0x1c(%eax),%eax
c010236f:	85 c0                	test   %eax,%eax
c0102371:	75 1e                	jne    c0102391 <schedule+0x61>
			list_del(one);
c0102373:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102376:	89 04 24             	mov    %eax,(%esp)
c0102379:	e8 d6 fe ff ff       	call   c0102254 <list_del>
			list_add_before(&ready,one);
c010237e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102381:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102385:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c010238c:	e8 76 fe ff ff       	call   c0102207 <list_add_before>
//extern TSS tss;
void schedule(){
	list *one,*ne;
	list *bl=&block;
	//printk("Oh,Shit!!!");
	for(one=bl->next,ne=one->next;one!=bl;one=ne,ne=ne->next){
c0102391:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102394:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102397:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010239a:	8b 40 04             	mov    0x4(%eax),%eax
c010239d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01023a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023a3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c01023a6:	75 a9                	jne    c0102351 <schedule+0x21>
		if(p->timecount==0){
			list_del(one);
			list_add_before(&ready,one);
		}
	}
	if(!list_empty(&ready)){
c01023a8:	c7 04 24 00 4f 16 c0 	movl   $0xc0164f00,(%esp)
c01023af:	e8 00 ff ff ff       	call   c01022b4 <list_empty>
c01023b4:	85 c0                	test   %eax,%eax
c01023b6:	75 7e                	jne    c0102436 <schedule+0x106>
		list *re=&ready;
c01023b8:	c7 45 e4 00 4f 16 c0 	movl   $0xc0164f00,-0x1c(%ebp)
		if(now->next==re)
c01023bf:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01023c4:	8b 40 04             	mov    0x4(%eax),%eax
c01023c7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c01023ca:	75 0d                	jne    c01023d9 <schedule+0xa9>
			now=re->next;
c01023cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01023cf:	8b 40 04             	mov    0x4(%eax),%eax
c01023d2:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
c01023d7:	eb 0d                	jmp    c01023e6 <schedule+0xb6>
		else
			now=now->next;
c01023d9:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01023de:	8b 40 04             	mov    0x4(%eax),%eax
c01023e1:	a3 ec 3e 16 c0       	mov    %eax,0xc0163eec
		pcbnow=list_entry(now,PCB,plist);
c01023e6:	a1 ec 3e 16 c0       	mov    0xc0163eec,%eax
c01023eb:	83 e8 08             	sub    $0x8,%eax
c01023ee:	a3 e0 3e 16 c0       	mov    %eax,0xc0163ee0
		uint32_t t=(uint32_t)pcbnow+STACKSIZE-8;
c01023f3:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c01023f8:	05 f8 0f 00 00       	add    $0xff8,%eax
c01023fd:	89 45 e0             	mov    %eax,-0x20(%ebp)
		set_tss_esp0(t);
c0102400:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102403:	89 04 24             	mov    %eax,(%esp)
c0102406:	e8 39 02 00 00       	call   c0102644 <set_tss_esp0>
		lcr3(PADDR(pcbnow->pgdir));
c010240b:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
c0102410:	8b 40 04             	mov    0x4(%eax),%eax
c0102413:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102417:	c7 44 24 04 1e 00 00 	movl   $0x1e,0x4(%esp)
c010241e:	00 
c010241f:	c7 04 24 d8 3e 10 c0 	movl   $0xc0103ed8,(%esp)
c0102426:	e8 ca fe ff ff       	call   c01022f5 <_paddr>
c010242b:	89 45 dc             	mov    %eax,-0x24(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c010242e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102431:	0f 22 d8             	mov    %eax,%cr3
c0102434:	eb 3a                	jmp    c0102470 <schedule+0x140>
		
	}
	else{
		pcbnow=&init;
c0102436:	c7 05 e0 3e 16 c0 00 	movl   $0xc0163f00,0xc0163ee0
c010243d:	3f 16 c0 
		now=&ready;
c0102440:	c7 05 ec 3e 16 c0 00 	movl   $0xc0164f00,0xc0163eec
c0102447:	4f 16 c0 
		lcr3(PADDR(kern_pgdir));
c010244a:	a1 40 f7 16 c0       	mov    0xc016f740,%eax
c010244f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102453:	c7 44 24 04 24 00 00 	movl   $0x24,0x4(%esp)
c010245a:	00 
c010245b:	c7 04 24 d8 3e 10 c0 	movl   $0xc0103ed8,(%esp)
c0102462:	e8 8e fe ff ff       	call   c01022f5 <_paddr>
c0102467:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010246a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010246d:	0f 22 d8             	mov    %eax,%cr3
	}
}
c0102470:	c9                   	leave  
c0102471:	c3                   	ret    

c0102472 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0102472:	55                   	push   %ebp
c0102473:	89 e5                	mov    %esp,%ebp
c0102475:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0102478:	8b 45 10             	mov    0x10(%ebp),%eax
c010247b:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0102480:	77 21                	ja     c01024a3 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0102482:	8b 45 10             	mov    0x10(%ebp),%eax
c0102485:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102489:	c7 44 24 08 f0 3e 10 	movl   $0xc0103ef0,0x8(%esp)
c0102490:	c0 
c0102491:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102494:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102498:	8b 45 08             	mov    0x8(%ebp),%eax
c010249b:	89 04 24             	mov    %eax,(%esp)
c010249e:	e8 3f 03 00 00       	call   c01027e2 <_panic>
	return (physaddr_t)kva - KERNBASE;
c01024a3:	8b 45 10             	mov    0x10(%ebp),%eax
c01024a6:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01024ab:	c9                   	leave  
c01024ac:	c3                   	ret    

c01024ad <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c01024ad:	55                   	push   %ebp
c01024ae:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c01024b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01024b3:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c01024b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024bb:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c01024c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01024c4:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c01024c8:	8b 45 10             	mov    0x10(%ebp),%eax
c01024cb:	83 e0 0f             	and    $0xf,%eax
c01024ce:	89 c2                	mov    %eax,%edx
c01024d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01024d3:	89 d1                	mov    %edx,%ecx
c01024d5:	83 e1 0f             	and    $0xf,%ecx
c01024d8:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01024dc:	83 e2 f0             	and    $0xfffffff0,%edx
c01024df:	09 ca                	or     %ecx,%edx
c01024e1:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c01024e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01024e7:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01024eb:	83 ca 10             	or     $0x10,%edx
c01024ee:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c01024f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024f4:	83 e0 03             	and    $0x3,%eax
c01024f7:	89 c2                	mov    %eax,%edx
c01024f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01024fc:	83 e2 03             	and    $0x3,%edx
c01024ff:	89 d1                	mov    %edx,%ecx
c0102501:	c1 e1 05             	shl    $0x5,%ecx
c0102504:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102508:	83 e2 9f             	and    $0xffffff9f,%edx
c010250b:	09 ca                	or     %ecx,%edx
c010250d:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0102510:	8b 45 08             	mov    0x8(%ebp),%eax
c0102513:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0102517:	83 ca 80             	or     $0xffffff80,%edx
c010251a:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c010251d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102520:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102524:	83 ca 0f             	or     $0xf,%edx
c0102527:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c010252a:	8b 45 08             	mov    0x8(%ebp),%eax
c010252d:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102531:	83 e2 ef             	and    $0xffffffef,%edx
c0102534:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0102537:	8b 45 08             	mov    0x8(%ebp),%eax
c010253a:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010253e:	83 e2 df             	and    $0xffffffdf,%edx
c0102541:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c0102544:	8b 45 08             	mov    0x8(%ebp),%eax
c0102547:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010254b:	83 ca 40             	or     $0x40,%edx
c010254e:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c0102551:	8b 45 08             	mov    0x8(%ebp),%eax
c0102554:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102558:	83 ca 80             	or     $0xffffff80,%edx
c010255b:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c010255e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102561:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c0102565:	5d                   	pop    %ebp
c0102566:	c3                   	ret    

c0102567 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c0102567:	55                   	push   %ebp
c0102568:	89 e5                	mov    %esp,%ebp
c010256a:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c010256d:	c7 05 48 40 15 c0 10 	movl   $0x10,0xc0154048
c0102574:	00 00 00 
	uint32_t base = (uint32_t)&tss;
c0102577:	c7 45 fc 40 40 15 c0 	movl   $0xc0154040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c010257e:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c0102585:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102588:	89 c2                	mov    %eax,%edx
c010258a:	8b 45 08             	mov    0x8(%ebp),%eax
c010258d:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c0102590:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102593:	89 c2                	mov    %eax,%edx
c0102595:	8b 45 08             	mov    0x8(%ebp),%eax
c0102598:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c010259c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010259f:	c1 e8 10             	shr    $0x10,%eax
c01025a2:	89 c2                	mov    %eax,%edx
c01025a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01025a7:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c01025aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ad:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01025b1:	83 e2 f0             	and    $0xfffffff0,%edx
c01025b4:	83 ca 09             	or     $0x9,%edx
c01025b7:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c01025ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01025bd:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01025c1:	83 e2 ef             	and    $0xffffffef,%edx
c01025c4:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c01025c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ca:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01025ce:	83 ca 60             	or     $0x60,%edx
c01025d1:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c01025d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01025d7:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01025db:	83 ca 80             	or     $0xffffff80,%edx
c01025de:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c01025e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01025e4:	c1 e8 10             	shr    $0x10,%eax
c01025e7:	83 e0 0f             	and    $0xf,%eax
c01025ea:	89 c2                	mov    %eax,%edx
c01025ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ef:	89 d1                	mov    %edx,%ecx
c01025f1:	83 e1 0f             	and    $0xf,%ecx
c01025f4:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01025f8:	83 e2 f0             	and    $0xfffffff0,%edx
c01025fb:	09 ca                	or     %ecx,%edx
c01025fd:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0102600:	8b 45 08             	mov    0x8(%ebp),%eax
c0102603:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102607:	83 e2 ef             	and    $0xffffffef,%edx
c010260a:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c010260d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102610:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102614:	83 e2 df             	and    $0xffffffdf,%edx
c0102617:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c010261a:	8b 45 08             	mov    0x8(%ebp),%eax
c010261d:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0102621:	83 ca 40             	or     $0x40,%edx
c0102624:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c0102627:	8b 45 08             	mov    0x8(%ebp),%eax
c010262a:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010262e:	83 e2 7f             	and    $0x7f,%edx
c0102631:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c0102634:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102637:	c1 e8 18             	shr    $0x18,%eax
c010263a:	89 c2                	mov    %eax,%edx
c010263c:	8b 45 08             	mov    0x8(%ebp),%eax
c010263f:	88 50 07             	mov    %dl,0x7(%eax)
}
c0102642:	c9                   	leave  
c0102643:	c3                   	ret    

c0102644 <set_tss_esp0>:

void set_tss_esp0(uint32_t esp) {
c0102644:	55                   	push   %ebp
c0102645:	89 e5                	mov    %esp,%ebp
	tss.esp0 = esp;
c0102647:	8b 45 08             	mov    0x8(%ebp),%eax
c010264a:	a3 44 40 15 c0       	mov    %eax,0xc0154044
}
c010264f:	5d                   	pop    %ebp
c0102650:	c3                   	ret    

c0102651 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0102651:	55                   	push   %ebp
c0102652:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c0102654:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102657:	83 e8 01             	sub    $0x1,%eax
c010265a:	66 a3 a4 40 15 c0    	mov    %ax,0xc01540a4
	data[1] = (uint32_t)addr;
c0102660:	8b 45 08             	mov    0x8(%ebp),%eax
c0102663:	66 a3 a6 40 15 c0    	mov    %ax,0xc01540a6
	data[2] = ((uint32_t)addr) >> 16;
c0102669:	8b 45 08             	mov    0x8(%ebp),%eax
c010266c:	c1 e8 10             	shr    $0x10,%eax
c010266f:	66 a3 a8 40 15 c0    	mov    %ax,0xc01540a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c0102675:	b8 a4 40 15 c0       	mov    $0xc01540a4,%eax
c010267a:	0f 01 10             	lgdtl  (%eax)
}
c010267d:	5d                   	pop    %ebp
c010267e:	c3                   	ret    

c010267f <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c010267f:	55                   	push   %ebp
c0102680:	89 e5                	mov    %esp,%ebp
c0102682:	83 ec 04             	sub    $0x4,%esp
c0102685:	8b 45 08             	mov    0x8(%ebp),%eax
c0102688:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c010268c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0102690:	0f 00 d8             	ltr    %ax
}
c0102693:	c9                   	leave  
c0102694:	c3                   	ret    

c0102695 <init_segment>:

void
init_segment(void) {
c0102695:	55                   	push   %ebp
c0102696:	89 e5                	mov    %esp,%ebp
c0102698:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c010269b:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c01026a2:	00 
c01026a3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01026aa:	00 
c01026ab:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c01026b2:	e8 3e 06 00 00       	call   c0102cf5 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c01026b7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01026be:	00 
c01026bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01026c6:	00 
c01026c7:	c7 04 24 08 40 15 c0 	movl   $0xc0154008,(%esp)
c01026ce:	e8 da fd ff ff       	call   c01024ad <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c01026d3:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c01026da:	00 
c01026db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01026e2:	00 
c01026e3:	c7 04 24 10 40 15 c0 	movl   $0xc0154010,(%esp)
c01026ea:	e8 be fd ff ff       	call   c01024ad <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c01026ef:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01026f6:	00 
c01026f7:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c01026fe:	00 
c01026ff:	c7 04 24 18 40 15 c0 	movl   $0xc0154018,(%esp)
c0102706:	e8 a2 fd ff ff       	call   c01024ad <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c010270b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0102712:	00 
c0102713:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c010271a:	00 
c010271b:	c7 04 24 20 40 15 c0 	movl   $0xc0154020,(%esp)
c0102722:	e8 86 fd ff ff       	call   c01024ad <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0102727:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c010272e:	00 
c010272f:	c7 04 24 00 40 15 c0 	movl   $0xc0154000,(%esp)
c0102736:	e8 16 ff ff ff       	call   c0102651 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c010273b:	c7 04 24 28 40 15 c0 	movl   $0xc0154028,(%esp)
c0102742:	e8 20 fe ff ff       	call   c0102567 <set_tss>
	load_tr(USEL(SEG_TSS));
c0102747:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c010274e:	e8 2c ff ff ff       	call   c010267f <load_tr>
}
c0102753:	c9                   	leave  
c0102754:	c3                   	ret    

c0102755 <to_user>:

void to_user(PCB *p)
{
c0102755:	55                   	push   %ebp
c0102756:	89 e5                	mov    %esp,%ebp
c0102758:	83 ec 28             	sub    $0x28,%esp
	lcr3(PADDR(p->pgdir));
c010275b:	8b 45 08             	mov    0x8(%ebp),%eax
c010275e:	8b 40 04             	mov    0x4(%eax),%eax
c0102761:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102765:	c7 44 24 04 52 00 00 	movl   $0x52,0x4(%esp)
c010276c:	00 
c010276d:	c7 04 24 14 3f 10 c0 	movl   $0xc0103f14,(%esp)
c0102774:	e8 f9 fc ff ff       	call   c0102472 <_paddr>
c0102779:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010277c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010277f:	0f 22 d8             	mov    %eax,%cr3
	asm volatile("mov %0, %%ds" : : "r"((p->tf)->ds));
c0102782:	8b 45 08             	mov    0x8(%ebp),%eax
c0102785:	8b 00                	mov    (%eax),%eax
c0102787:	8b 40 2c             	mov    0x2c(%eax),%eax
c010278a:	8e d8                	mov    %eax,%ds
	asm volatile("mov %0, %%es" : : "r"((p->tf)->es));
c010278c:	8b 45 08             	mov    0x8(%ebp),%eax
c010278f:	8b 00                	mov    (%eax),%eax
c0102791:	8b 40 28             	mov    0x28(%eax),%eax
c0102794:	8e c0                	mov    %eax,%es
	asm volatile("mov %0, %%fs" : : "r"((p->tf)->fs));
c0102796:	8b 45 08             	mov    0x8(%ebp),%eax
c0102799:	8b 00                	mov    (%eax),%eax
c010279b:	8b 40 24             	mov    0x24(%eax),%eax
c010279e:	8e e0                	mov    %eax,%fs
	asm volatile("mov %0, %%gs" : : "r"((p->tf)->gs));
c01027a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01027a3:	8b 00                	mov    (%eax),%eax
c01027a5:	8b 40 20             	mov    0x20(%eax),%eax
c01027a8:	8e e8                	mov    %eax,%gs
	asm volatile("pushl %0" : : "r"((uint32_t)(p->tf)->ss));
c01027aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01027ad:	8b 00                	mov    (%eax),%eax
c01027af:	0f b7 40 48          	movzwl 0x48(%eax),%eax
c01027b3:	0f b7 c0             	movzwl %ax,%eax
c01027b6:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"((p->tf)->esp));
c01027b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01027ba:	8b 00                	mov    (%eax),%eax
c01027bc:	8b 40 44             	mov    0x44(%eax),%eax
c01027bf:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"((p->tf)->eflags));
c01027c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01027c3:	8b 00                	mov    (%eax),%eax
c01027c5:	8b 40 40             	mov    0x40(%eax),%eax
c01027c8:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"((uint32_t)(p->tf)->cs));
c01027c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01027cc:	8b 00                	mov    (%eax),%eax
c01027ce:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
c01027d2:	0f b7 c0             	movzwl %ax,%eax
c01027d5:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"((p->tf)->eip));
c01027d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01027d9:	8b 00                	mov    (%eax),%eax
c01027db:	8b 40 38             	mov    0x38(%eax),%eax
c01027de:	50                   	push   %eax
	asm volatile("iret");	
c01027df:	cf                   	iret   
}
c01027e0:	c9                   	leave  
c01027e1:	c3                   	ret    

c01027e2 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c01027e2:	55                   	push   %ebp
c01027e3:	89 e5                	mov    %esp,%ebp
c01027e5:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c01027e8:	a1 ac 40 15 c0       	mov    0xc01540ac,%eax
c01027ed:	85 c0                	test   %eax,%eax
c01027ef:	74 01                	je     c01027f2 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c01027f1:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c01027f2:	8b 45 10             	mov    0x10(%ebp),%eax
c01027f5:	a3 ac 40 15 c0       	mov    %eax,0xc01540ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c01027fa:	fa                   	cli    
c01027fb:	fc                   	cld    

	va_start(ap, fmt);
c01027fc:	8d 45 14             	lea    0x14(%ebp),%eax
c01027ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0102802:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102805:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102809:	8b 45 08             	mov    0x8(%ebp),%eax
c010280c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102810:	c7 04 24 27 3f 10 c0 	movl   $0xc0103f27,(%esp)
c0102817:	e8 f5 00 00 00       	call   c0102911 <printk>
	vprintk(fmt, ap);
c010281c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010281f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102823:	8b 45 10             	mov    0x10(%ebp),%eax
c0102826:	89 04 24             	mov    %eax,(%esp)
c0102829:	e8 b0 00 00 00       	call   c01028de <vprintk>
	printk("\n");
c010282e:	c7 04 24 3f 3f 10 c0 	movl   $0xc0103f3f,(%esp)
c0102835:	e8 d7 00 00 00       	call   c0102911 <printk>
	va_end(ap);

}
c010283a:	c9                   	leave  
c010283b:	c3                   	ret    

c010283c <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c010283c:	55                   	push   %ebp
c010283d:	89 e5                	mov    %esp,%ebp
c010283f:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0102842:	8d 45 14             	lea    0x14(%ebp),%eax
c0102845:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c0102848:	8b 45 0c             	mov    0xc(%ebp),%eax
c010284b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010284f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102852:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102856:	c7 04 24 41 3f 10 c0 	movl   $0xc0103f41,(%esp)
c010285d:	e8 af 00 00 00       	call   c0102911 <printk>
	vprintk(fmt, ap);
c0102862:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102865:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102869:	8b 45 10             	mov    0x10(%ebp),%eax
c010286c:	89 04 24             	mov    %eax,(%esp)
c010286f:	e8 6a 00 00 00       	call   c01028de <vprintk>
	printk("\n");
c0102874:	c7 04 24 3f 3f 10 c0 	movl   $0xc0103f3f,(%esp)
c010287b:	e8 91 00 00 00       	call   c0102911 <printk>
	va_end(ap);
}
c0102880:	c9                   	leave  
c0102881:	c3                   	ret    

c0102882 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0102882:	55                   	push   %ebp
c0102883:	89 e5                	mov    %esp,%ebp
c0102885:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0102888:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010288c:	75 2b                	jne    c01028b9 <sys_write+0x37>
		for (i = 0; i < n; i++) {
c010288e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102895:	eb 1a                	jmp    c01028b1 <sys_write+0x2f>
			serial_printc(buf[i]);
c0102897:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010289a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010289d:	01 d0                	add    %edx,%eax
c010289f:	0f b6 00             	movzbl (%eax),%eax
c01028a2:	0f be c0             	movsbl %al,%eax
c01028a5:	89 04 24             	mov    %eax,(%esp)
c01028a8:	e8 0f e2 ff ff       	call   c0100abc <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c01028ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01028b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028b4:	3b 45 10             	cmp    0x10(%ebp),%eax
c01028b7:	7c de                	jl     c0102897 <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c01028b9:	8b 45 10             	mov    0x10(%ebp),%eax
c01028bc:	c9                   	leave  
c01028bd:	c3                   	ret    

c01028be <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c01028be:	55                   	push   %ebp
c01028bf:	89 e5                	mov    %esp,%ebp
c01028c1:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c01028c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01028c7:	89 04 24             	mov    %eax,(%esp)
c01028ca:	e8 17 e2 ff ff       	call   c0100ae6 <putchar>
	++*cnt;
c01028cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028d2:	8b 00                	mov    (%eax),%eax
c01028d4:	8d 50 01             	lea    0x1(%eax),%edx
c01028d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028da:	89 10                	mov    %edx,(%eax)
}
c01028dc:	c9                   	leave  
c01028dd:	c3                   	ret    

c01028de <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c01028de:	55                   	push   %ebp
c01028df:	89 e5                	mov    %esp,%ebp
c01028e1:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c01028e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c01028eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028ee:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01028f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01028f5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01028f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
c01028fc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102900:	c7 04 24 be 28 10 c0 	movl   $0xc01028be,(%esp)
c0102907:	e8 f1 09 00 00       	call   c01032fd <vprintfmt>
	return cnt;
c010290c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c010290f:	c9                   	leave  
c0102910:	c3                   	ret    

c0102911 <printk>:

int printk(const char *fmt, ...)
{
c0102911:	55                   	push   %ebp
c0102912:	89 e5                	mov    %esp,%ebp
c0102914:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0102917:	8d 45 0c             	lea    0xc(%ebp),%eax
c010291a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c010291d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102920:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102924:	8b 45 08             	mov    0x8(%ebp),%eax
c0102927:	89 04 24             	mov    %eax,(%esp)
c010292a:	e8 af ff ff ff       	call   c01028de <vprintk>
c010292f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0102932:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102935:	c9                   	leave  
c0102936:	c3                   	ret    

c0102937 <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0102937:	6a 00                	push   $0x0
c0102939:	6a 00                	push   $0x0
c010293b:	e9 a9 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102940 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0102940:	6a 00                	push   $0x0
c0102942:	6a 01                	push   $0x1
c0102944:	e9 a0 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102949 <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c0102949:	6a 00                	push   $0x0
c010294b:	6a 02                	push   $0x2
c010294d:	e9 97 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102952 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0102952:	6a 00                	push   $0x0
c0102954:	6a 03                	push   $0x3
c0102956:	e9 8e 00 00 00       	jmp    c01029e9 <asm_do_irq>

c010295b <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c010295b:	6a 00                	push   $0x0
c010295d:	6a 04                	push   $0x4
c010295f:	e9 85 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102964 <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0102964:	6a 00                	push   $0x0
c0102966:	6a 05                	push   $0x5
c0102968:	e9 7c 00 00 00       	jmp    c01029e9 <asm_do_irq>

c010296d <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c010296d:	6a 00                	push   $0x0
c010296f:	6a 06                	push   $0x6
c0102971:	e9 73 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102976 <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0102976:	6a 00                	push   $0x0
c0102978:	6a 07                	push   $0x7
c010297a:	e9 6a 00 00 00       	jmp    c01029e9 <asm_do_irq>

c010297f <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c010297f:	6a 08                	push   $0x8
c0102981:	e9 63 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102986 <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c0102986:	6a 00                	push   $0x0
c0102988:	6a 09                	push   $0x9
c010298a:	e9 5a 00 00 00       	jmp    c01029e9 <asm_do_irq>

c010298f <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c010298f:	6a 0a                	push   $0xa
c0102991:	e9 53 00 00 00       	jmp    c01029e9 <asm_do_irq>

c0102996 <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c0102996:	6a 0b                	push   $0xb
c0102998:	e9 4c 00 00 00       	jmp    c01029e9 <asm_do_irq>

c010299d <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c010299d:	6a 0c                	push   $0xc
c010299f:	e9 45 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029a4 <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c01029a4:	6a 0d                	push   $0xd
c01029a6:	e9 3e 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029ab <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c01029ab:	6a 0e                	push   $0xe
c01029ad:	e9 37 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029b2 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c01029b2:	6a 00                	push   $0x0
c01029b4:	68 80 00 00 00       	push   $0x80
c01029b9:	e9 2b 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029be <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c01029be:	6a 00                	push   $0x0
c01029c0:	68 e8 03 00 00       	push   $0x3e8
c01029c5:	e9 1f 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029ca <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c01029ca:	6a 00                	push   $0x0
c01029cc:	68 e9 03 00 00       	push   $0x3e9
c01029d1:	e9 13 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029d6 <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c01029d6:	6a 00                	push   $0x0
c01029d8:	68 f6 03 00 00       	push   $0x3f6
c01029dd:	e9 07 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029e2 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c01029e2:	6a ff                	push   $0xffffffff
c01029e4:	e9 00 00 00 00       	jmp    c01029e9 <asm_do_irq>

c01029e9 <asm_do_irq>:
# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
.extern pcbnow
asm_do_irq:
	cli
c01029e9:	fa                   	cli    
	pushl %ds
c01029ea:	1e                   	push   %ds
  	pushl %es
c01029eb:	06                   	push   %es
  	pushl %fs
c01029ec:	0f a0                	push   %fs
  	pushl %gs
c01029ee:	0f a8                	push   %gs
	pushal
c01029f0:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c01029f1:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c01029f5:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c01029f7:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c01029f9:	54                   	push   %esp
	call irq_handle
c01029fa:	e8 2d dd ff ff       	call   c010072c <irq_handle>
	movl pcbnow,%eax
c01029ff:	a1 e0 3e 16 c0       	mov    0xc0163ee0,%eax
	movl (%eax),%esp
c0102a04:	8b 20                	mov    (%eax),%esp
	#addl $4, %esp

	popal
c0102a06:	61                   	popa   
	popl %gs
c0102a07:	0f a9                	pop    %gs
  	popl %fs
c0102a09:	0f a1                	pop    %fs
  	popl %es
c0102a0b:	07                   	pop    %es
  	popl %ds
c0102a0c:	1f                   	pop    %ds
	addl $8, %esp
c0102a0d:	83 c4 08             	add    $0x8,%esp
	sti
c0102a10:	fb                   	sti    
	iret
c0102a11:	cf                   	iret   
c0102a12:	66 90                	xchg   %ax,%ax
c0102a14:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c0102a1a:	00 00                	add    %al,(%eax)
c0102a1c:	fe 4f 52             	decb   0x52(%edi)
c0102a1f:	e4 66                	in     $0x66,%al

c0102a20 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0102a20:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0102a27:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0102a29:	b8 00 70 10 00       	mov    $0x107000,%eax
	movl	%eax, %cr3
c0102a2e:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0102a31:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0102a34:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0102a39:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0102a3c:	b8 43 2a 10 c0       	mov    $0xc0102a43,%eax
	jmp	*%eax
c0102a41:	ff e0                	jmp    *%eax

c0102a43 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0102a43:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0102a48:	bc 00 10 11 c0       	mov    $0xc0111000,%esp

	# now to C code

	call	main
c0102a4d:	e8 03 d7 ff ff       	call   c0100155 <main>

c0102a52 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0102a52:	eb fe                	jmp    c0102a52 <spin>

c0102a54 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0102a54:	55                   	push   %ebp
c0102a55:	89 e5                	mov    %esp,%ebp
c0102a57:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0102a5a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102a5e:	78 18                	js     c0102a78 <draw_pixel+0x24>
c0102a60:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a64:	78 12                	js     c0102a78 <draw_pixel+0x24>
c0102a66:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0102a6d:	7f 09                	jg     c0102a78 <draw_pixel+0x24>
c0102a6f:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0102a76:	7e 24                	jle    c0102a9c <draw_pixel+0x48>
c0102a78:	c7 44 24 0c 5c 3f 10 	movl   $0xc0103f5c,0xc(%esp)
c0102a7f:	c0 
c0102a80:	c7 44 24 08 90 3f 10 	movl   $0xc0103f90,0x8(%esp)
c0102a87:	c0 
c0102a88:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
c0102a8f:	00 
c0102a90:	c7 04 24 a5 3f 10 c0 	movl   $0xc0103fa5,(%esp)
c0102a97:	e8 46 fd ff ff       	call   c01027e2 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0102a9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a9f:	c1 e0 08             	shl    $0x8,%eax
c0102aa2:	89 c2                	mov    %eax,%edx
c0102aa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aa7:	c1 e0 06             	shl    $0x6,%eax
c0102aaa:	01 c2                	add    %eax,%edx
c0102aac:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102aaf:	01 c2                	add    %eax,%edx
c0102ab1:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ab4:	88 82 c0 40 15 c0    	mov    %al,-0x3feabf40(%edx)
}
c0102aba:	c9                   	leave  
c0102abb:	c3                   	ret    

c0102abc <sysclean>:


void sysclean(void)
{
c0102abc:	55                   	push   %ebp
c0102abd:	89 e5                	mov    %esp,%ebp
c0102abf:	83 ec 18             	sub    $0x18,%esp
	//printf("1");
	memset(buff, 0, sizeof(buff));
c0102ac2:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0102ac9:	00 
c0102aca:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102ad1:	00 
c0102ad2:	c7 04 24 c0 40 15 c0 	movl   $0xc01540c0,(%esp)
c0102ad9:	e8 17 02 00 00       	call   c0102cf5 <memset>
}
c0102ade:	c9                   	leave  
c0102adf:	c3                   	ret    

c0102ae0 <syspr>:
int syspr()
{
c0102ae0:	55                   	push   %ebp
c0102ae1:	89 e5                	mov    %esp,%ebp
c0102ae3:	83 ec 18             	sub    $0x18,%esp
	//printf("2");
	return syscall(SYS_pr, buff);
c0102ae6:	c7 44 24 04 c0 40 15 	movl   $0xc01540c0,0x4(%esp)
c0102aed:	c0 
c0102aee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102af5:	e8 b1 00 00 00       	call   c0102bab <syscall>
}
c0102afa:	c9                   	leave  
c0102afb:	c3                   	ret    

c0102afc <systime>:

int systime(void)
{
c0102afc:	55                   	push   %ebp
c0102afd:	89 e5                	mov    %esp,%ebp
c0102aff:	83 ec 18             	sub    $0x18,%esp
	//printf("3");
	return syscall(SYS_time);
c0102b02:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102b09:	e8 9d 00 00 00       	call   c0102bab <syscall>
}
c0102b0e:	c9                   	leave  
c0102b0f:	c3                   	ret    

c0102b10 <sysreadkey>:

int sysreadkey(void)
{
c0102b10:	55                   	push   %ebp
c0102b11:	89 e5                	mov    %esp,%ebp
c0102b13:	83 ec 18             	sub    $0x18,%esp
	//printf("4");
	return syscall(SYS_readkey);
c0102b16:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0102b1d:	e8 89 00 00 00       	call   c0102bab <syscall>
}
c0102b22:	c9                   	leave  
c0102b23:	c3                   	ret    

c0102b24 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0102b24:	55                   	push   %ebp
c0102b25:	89 e5                	mov    %esp,%ebp
c0102b27:	83 ec 18             	sub    $0x18,%esp
	//printf("5");
	return syscall(SYS_write, fd, buf1, n);
c0102b2a:	8b 45 10             	mov    0x10(%ebp),%eax
c0102b2d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102b31:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b34:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102b38:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b3b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b3f:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0102b46:	e8 60 00 00 00       	call   c0102bab <syscall>
}
c0102b4b:	c9                   	leave  
c0102b4c:	c3                   	ret    

c0102b4d <fork>:

int fork(void)
{
c0102b4d:	55                   	push   %ebp
c0102b4e:	89 e5                	mov    %esp,%ebp
c0102b50:	83 ec 18             	sub    $0x18,%esp
	//printf("6");
	return syscall(SYS_fork);
c0102b53:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0102b5a:	e8 4c 00 00 00       	call   c0102bab <syscall>
}
c0102b5f:	c9                   	leave  
c0102b60:	c3                   	ret    

c0102b61 <getpid>:

int getpid(void)
{
c0102b61:	55                   	push   %ebp
c0102b62:	89 e5                	mov    %esp,%ebp
c0102b64:	83 ec 18             	sub    $0x18,%esp
	//printf("7");
	return syscall(SYS_getpid);
c0102b67:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
c0102b6e:	e8 38 00 00 00       	call   c0102bab <syscall>
}
c0102b73:	c9                   	leave  
c0102b74:	c3                   	ret    

c0102b75 <exit>:

void exit(int suc)
{
c0102b75:	55                   	push   %ebp
c0102b76:	89 e5                	mov    %esp,%ebp
c0102b78:	83 ec 18             	sub    $0x18,%esp
	//printf("8");
	syscall(SYS_exit,suc);
c0102b7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b7e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b82:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
c0102b89:	e8 1d 00 00 00       	call   c0102bab <syscall>
}
c0102b8e:	c9                   	leave  
c0102b8f:	c3                   	ret    

c0102b90 <sleep>:

void sleep(int sec)
{
c0102b90:	55                   	push   %ebp
c0102b91:	89 e5                	mov    %esp,%ebp
c0102b93:	83 ec 18             	sub    $0x18,%esp
	//printf("9");	
	syscall(SYS_sleep,sec);
c0102b96:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b99:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b9d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0102ba4:	e8 02 00 00 00       	call   c0102bab <syscall>
	//printf("qweqwe");
}
c0102ba9:	c9                   	leave  
c0102baa:	c3                   	ret    

c0102bab <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c0102bab:	55                   	push   %ebp
c0102bac:	89 e5                	mov    %esp,%ebp
c0102bae:	53                   	push   %ebx
c0102baf:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0102bb2:	8d 45 08             	lea    0x8(%ebp),%eax
c0102bb5:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c0102bb8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102bbb:	8b 00                	mov    (%eax),%eax
c0102bbd:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102bc0:	83 c2 04             	add    $0x4,%edx
c0102bc3:	8b 1a                	mov    (%edx),%ebx
c0102bc5:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102bc8:	83 c2 08             	add    $0x8,%edx
c0102bcb:	8b 0a                	mov    (%edx),%ecx
c0102bcd:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0102bd0:	83 c2 0c             	add    $0xc,%edx
c0102bd3:	8b 12                	mov    (%edx),%edx
c0102bd5:	cd 80                	int    $0x80
c0102bd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c0102bda:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102bdd:	83 c4 10             	add    $0x10,%esp
c0102be0:	5b                   	pop    %ebx
c0102be1:	5d                   	pop    %ebp
c0102be2:	c3                   	ret    

c0102be3 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0102be3:	55                   	push   %ebp
c0102be4:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0102be6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102be9:	8b 00                	mov    (%eax),%eax
c0102beb:	8d 48 01             	lea    0x1(%eax),%ecx
c0102bee:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102bf1:	89 0a                	mov    %ecx,(%edx)
c0102bf3:	8b 55 08             	mov    0x8(%ebp),%edx
c0102bf6:	88 90 c0 3a 16 c0    	mov    %dl,-0x3fe9c540(%eax)
}
c0102bfc:	5d                   	pop    %ebp
c0102bfd:	c3                   	ret    

c0102bfe <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0102bfe:	55                   	push   %ebp
c0102bff:	89 e5                	mov    %esp,%ebp
c0102c01:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0102c04:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0102c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c0e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102c12:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c15:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c19:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0102c1c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c20:	c7 04 24 e3 2b 10 c0 	movl   $0xc0102be3,(%esp)
c0102c27:	e8 d1 06 00 00       	call   c01032fd <vprintfmt>
	return cnt;
c0102c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102c2f:	c9                   	leave  
c0102c30:	c3                   	ret    

c0102c31 <printf>:
int printf(const char *fmt, ...)
{
c0102c31:	55                   	push   %ebp
c0102c32:	89 e5                	mov    %esp,%ebp
c0102c34:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0102c37:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102c3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c0102c3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102c40:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c44:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c47:	89 04 24             	mov    %eax,(%esp)
c0102c4a:	e8 af ff ff ff       	call   c0102bfe <vprintf>
c0102c4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c0102c52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c55:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c59:	c7 44 24 04 c0 3a 16 	movl   $0xc0163ac0,0x4(%esp)
c0102c60:	c0 
c0102c61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102c68:	e8 b7 fe ff ff       	call   c0102b24 <syswrite>
	return cnt;
c0102c6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c70:	c9                   	leave  
c0102c71:	c3                   	ret    

c0102c72 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c0102c72:	55                   	push   %ebp
c0102c73:	89 e5                	mov    %esp,%ebp
c0102c75:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0102c78:	c7 45 fc c5 3e 16 c0 	movl   $0xc0163ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c0102c7f:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102c83:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102c86:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102c8b:	89 c8                	mov    %ecx,%eax
c0102c8d:	f7 ea                	imul   %edx
c0102c8f:	c1 fa 02             	sar    $0x2,%edx
c0102c92:	89 c8                	mov    %ecx,%eax
c0102c94:	c1 f8 1f             	sar    $0x1f,%eax
c0102c97:	29 c2                	sub    %eax,%edx
c0102c99:	89 d0                	mov    %edx,%eax
c0102c9b:	c1 e0 02             	shl    $0x2,%eax
c0102c9e:	01 d0                	add    %edx,%eax
c0102ca0:	01 c0                	add    %eax,%eax
c0102ca2:	29 c1                	sub    %eax,%ecx
c0102ca4:	89 ca                	mov    %ecx,%edx
c0102ca6:	89 d0                	mov    %edx,%eax
c0102ca8:	83 c0 30             	add    $0x30,%eax
c0102cab:	89 c2                	mov    %eax,%edx
c0102cad:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102cb0:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0102cb2:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102cb5:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0102cba:	89 c8                	mov    %ecx,%eax
c0102cbc:	f7 ea                	imul   %edx
c0102cbe:	c1 fa 02             	sar    $0x2,%edx
c0102cc1:	89 c8                	mov    %ecx,%eax
c0102cc3:	c1 f8 1f             	sar    $0x1f,%eax
c0102cc6:	29 c2                	sub    %eax,%edx
c0102cc8:	89 d0                	mov    %edx,%eax
c0102cca:	89 45 08             	mov    %eax,0x8(%ebp)
c0102ccd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102cd1:	75 ac                	jne    c0102c7f <itoa+0xd>
	return p;
c0102cd3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102cd6:	c9                   	leave  
c0102cd7:	c3                   	ret    

c0102cd8 <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c0102cd8:	55                   	push   %ebp
c0102cd9:	89 e5                	mov    %esp,%ebp
c0102cdb:	57                   	push   %edi
c0102cdc:	56                   	push   %esi
c0102cdd:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0102cde:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ce1:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102ce4:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102ce7:	89 c1                	mov    %eax,%ecx
c0102ce9:	89 d6                	mov    %edx,%esi
c0102ceb:	89 df                	mov    %ebx,%edi
c0102ced:	fc                   	cld    
c0102cee:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0102cf0:	5b                   	pop    %ebx
c0102cf1:	5e                   	pop    %esi
c0102cf2:	5f                   	pop    %edi
c0102cf3:	5d                   	pop    %ebp
c0102cf4:	c3                   	ret    

c0102cf5 <memset>:

void memset(void *dest, int data, size_t size) {
c0102cf5:	55                   	push   %ebp
c0102cf6:	89 e5                	mov    %esp,%ebp
c0102cf8:	57                   	push   %edi
c0102cf9:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0102cfa:	8b 55 10             	mov    0x10(%ebp),%edx
c0102cfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d00:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0102d03:	89 d1                	mov    %edx,%ecx
c0102d05:	89 df                	mov    %ebx,%edi
c0102d07:	fc                   	cld    
c0102d08:	f3 aa                	rep stos %al,%es:(%edi)
}
c0102d0a:	5b                   	pop    %ebx
c0102d0b:	5f                   	pop    %edi
c0102d0c:	5d                   	pop    %ebp
c0102d0d:	c3                   	ret    

c0102d0e <strlen>:

size_t strlen(const char *str) {
c0102d0e:	55                   	push   %ebp
c0102d0f:	89 e5                	mov    %esp,%ebp
c0102d11:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0102d14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0102d1b:	eb 04                	jmp    c0102d21 <strlen+0x13>
c0102d1d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102d21:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d24:	8d 50 01             	lea    0x1(%eax),%edx
c0102d27:	89 55 08             	mov    %edx,0x8(%ebp)
c0102d2a:	0f b6 00             	movzbl (%eax),%eax
c0102d2d:	84 c0                	test   %al,%al
c0102d2f:	75 ec                	jne    c0102d1d <strlen+0xf>
	return len;
c0102d31:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102d34:	c9                   	leave  
c0102d35:	c3                   	ret    

c0102d36 <strcpy>:

void strcpy(char *d, const char *s) {
c0102d36:	55                   	push   %ebp
c0102d37:	89 e5                	mov    %esp,%ebp
c0102d39:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c0102d3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d3f:	89 04 24             	mov    %eax,(%esp)
c0102d42:	e8 c7 ff ff ff       	call   c0102d0e <strlen>
c0102d47:	83 c0 01             	add    $0x1,%eax
c0102d4a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d51:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d55:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d58:	89 04 24             	mov    %eax,(%esp)
c0102d5b:	e8 78 ff ff ff       	call   c0102cd8 <memcpy>
}
c0102d60:	c9                   	leave  
c0102d61:	c3                   	ret    

c0102d62 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c0102d62:	55                   	push   %ebp
c0102d63:	89 e5                	mov    %esp,%ebp
c0102d65:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102d68:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102d6f:	eb 0c                	jmp    c0102d7d <strnlen+0x1b>
		n++;
c0102d71:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102d75:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102d79:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102d7d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102d81:	74 0a                	je     c0102d8d <strnlen+0x2b>
c0102d83:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d86:	0f b6 00             	movzbl (%eax),%eax
c0102d89:	84 c0                	test   %al,%al
c0102d8b:	75 e4                	jne    c0102d71 <strnlen+0xf>
		n++;
	return n;
c0102d8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102d90:	c9                   	leave  
c0102d91:	c3                   	ret    

c0102d92 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0102d92:	55                   	push   %ebp
c0102d93:	89 e5                	mov    %esp,%ebp
c0102d95:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c0102d98:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d9b:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0102d9e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102da5:	eb 23                	jmp    c0102dca <strncpy+0x38>
		*dst++ = *src;
c0102da7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102daa:	8d 50 01             	lea    0x1(%eax),%edx
c0102dad:	89 55 08             	mov    %edx,0x8(%ebp)
c0102db0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102db3:	0f b6 12             	movzbl (%edx),%edx
c0102db6:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c0102db8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dbb:	0f b6 00             	movzbl (%eax),%eax
c0102dbe:	84 c0                	test   %al,%al
c0102dc0:	74 04                	je     c0102dc6 <strncpy+0x34>
			src++;
c0102dc2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c0102dc6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102dca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102dcd:	3b 45 10             	cmp    0x10(%ebp),%eax
c0102dd0:	72 d5                	jb     c0102da7 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c0102dd2:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0102dd5:	c9                   	leave  
c0102dd6:	c3                   	ret    

c0102dd7 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c0102dd7:	55                   	push   %ebp
c0102dd8:	89 e5                	mov    %esp,%ebp
c0102dda:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c0102ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102de0:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c0102de3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102de7:	74 33                	je     c0102e1c <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c0102de9:	eb 17                	jmp    c0102e02 <strlcpy+0x2b>
			*dst++ = *src++;
c0102deb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dee:	8d 50 01             	lea    0x1(%eax),%edx
c0102df1:	89 55 08             	mov    %edx,0x8(%ebp)
c0102df4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102df7:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102dfa:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c0102dfd:	0f b6 12             	movzbl (%edx),%edx
c0102e00:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c0102e02:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102e06:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102e0a:	74 0a                	je     c0102e16 <strlcpy+0x3f>
c0102e0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e0f:	0f b6 00             	movzbl (%eax),%eax
c0102e12:	84 c0                	test   %al,%al
c0102e14:	75 d5                	jne    c0102deb <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c0102e16:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e19:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c0102e1c:	8b 55 08             	mov    0x8(%ebp),%edx
c0102e1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102e22:	29 c2                	sub    %eax,%edx
c0102e24:	89 d0                	mov    %edx,%eax
}
c0102e26:	c9                   	leave  
c0102e27:	c3                   	ret    

c0102e28 <strcmp>:

int
strcmp(const char *p, const char *q)
{
c0102e28:	55                   	push   %ebp
c0102e29:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c0102e2b:	eb 08                	jmp    c0102e35 <strcmp+0xd>
		p++, q++;
c0102e2d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102e31:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0102e35:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e38:	0f b6 00             	movzbl (%eax),%eax
c0102e3b:	84 c0                	test   %al,%al
c0102e3d:	74 10                	je     c0102e4f <strcmp+0x27>
c0102e3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e42:	0f b6 10             	movzbl (%eax),%edx
c0102e45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e48:	0f b6 00             	movzbl (%eax),%eax
c0102e4b:	38 c2                	cmp    %al,%dl
c0102e4d:	74 de                	je     c0102e2d <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c0102e4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e52:	0f b6 00             	movzbl (%eax),%eax
c0102e55:	0f b6 d0             	movzbl %al,%edx
c0102e58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e5b:	0f b6 00             	movzbl (%eax),%eax
c0102e5e:	0f b6 c0             	movzbl %al,%eax
c0102e61:	29 c2                	sub    %eax,%edx
c0102e63:	89 d0                	mov    %edx,%eax
}
c0102e65:	5d                   	pop    %ebp
c0102e66:	c3                   	ret    

c0102e67 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0102e67:	55                   	push   %ebp
c0102e68:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c0102e6a:	eb 0c                	jmp    c0102e78 <strncmp+0x11>
		n--, p++, q++;
c0102e6c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102e70:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102e74:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c0102e78:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102e7c:	74 1a                	je     c0102e98 <strncmp+0x31>
c0102e7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e81:	0f b6 00             	movzbl (%eax),%eax
c0102e84:	84 c0                	test   %al,%al
c0102e86:	74 10                	je     c0102e98 <strncmp+0x31>
c0102e88:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e8b:	0f b6 10             	movzbl (%eax),%edx
c0102e8e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e91:	0f b6 00             	movzbl (%eax),%eax
c0102e94:	38 c2                	cmp    %al,%dl
c0102e96:	74 d4                	je     c0102e6c <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c0102e98:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102e9c:	75 07                	jne    c0102ea5 <strncmp+0x3e>
		return 0;
c0102e9e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102ea3:	eb 16                	jmp    c0102ebb <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c0102ea5:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ea8:	0f b6 00             	movzbl (%eax),%eax
c0102eab:	0f b6 d0             	movzbl %al,%edx
c0102eae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102eb1:	0f b6 00             	movzbl (%eax),%eax
c0102eb4:	0f b6 c0             	movzbl %al,%eax
c0102eb7:	29 c2                	sub    %eax,%edx
c0102eb9:	89 d0                	mov    %edx,%eax
}
c0102ebb:	5d                   	pop    %ebp
c0102ebc:	c3                   	ret    

c0102ebd <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c0102ebd:	55                   	push   %ebp
c0102ebe:	89 e5                	mov    %esp,%ebp
c0102ec0:	83 ec 04             	sub    $0x4,%esp
c0102ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ec6:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102ec9:	eb 14                	jmp    c0102edf <strchr+0x22>
		if (*s == c)
c0102ecb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ece:	0f b6 00             	movzbl (%eax),%eax
c0102ed1:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102ed4:	75 05                	jne    c0102edb <strchr+0x1e>
			return (char *) s;
c0102ed6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ed9:	eb 13                	jmp    c0102eee <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c0102edb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102edf:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ee2:	0f b6 00             	movzbl (%eax),%eax
c0102ee5:	84 c0                	test   %al,%al
c0102ee7:	75 e2                	jne    c0102ecb <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c0102ee9:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102eee:	c9                   	leave  
c0102eef:	c3                   	ret    

c0102ef0 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c0102ef0:	55                   	push   %ebp
c0102ef1:	89 e5                	mov    %esp,%ebp
c0102ef3:	83 ec 04             	sub    $0x4,%esp
c0102ef6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ef9:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c0102efc:	eb 11                	jmp    c0102f0f <strfind+0x1f>
		if (*s == c)
c0102efe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f01:	0f b6 00             	movzbl (%eax),%eax
c0102f04:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0102f07:	75 02                	jne    c0102f0b <strfind+0x1b>
			break;
c0102f09:	eb 0e                	jmp    c0102f19 <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c0102f0b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102f0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f12:	0f b6 00             	movzbl (%eax),%eax
c0102f15:	84 c0                	test   %al,%al
c0102f17:	75 e5                	jne    c0102efe <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c0102f19:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102f1c:	c9                   	leave  
c0102f1d:	c3                   	ret    

c0102f1e <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c0102f1e:	55                   	push   %ebp
c0102f1f:	89 e5                	mov    %esp,%ebp
c0102f21:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c0102f24:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f27:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c0102f2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f2d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c0102f30:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102f33:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102f36:	73 3d                	jae    c0102f75 <memmove+0x57>
c0102f38:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f3b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102f3e:	01 d0                	add    %edx,%eax
c0102f40:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102f43:	76 30                	jbe    c0102f75 <memmove+0x57>
		s += n;
c0102f45:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f48:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c0102f4b:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f4e:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c0102f51:	eb 13                	jmp    c0102f66 <memmove+0x48>
			*--d = *--s;
c0102f53:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0102f57:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0102f5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102f5e:	0f b6 10             	movzbl (%eax),%edx
c0102f61:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102f64:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0102f66:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f69:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102f6c:	89 55 10             	mov    %edx,0x10(%ebp)
c0102f6f:	85 c0                	test   %eax,%eax
c0102f71:	75 e0                	jne    c0102f53 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0102f73:	eb 26                	jmp    c0102f9b <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102f75:	eb 17                	jmp    c0102f8e <memmove+0x70>
			*d++ = *s++;
c0102f77:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102f7a:	8d 50 01             	lea    0x1(%eax),%edx
c0102f7d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0102f80:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102f83:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102f86:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0102f89:	0f b6 12             	movzbl (%edx),%edx
c0102f8c:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102f8e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102f91:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102f94:	89 55 10             	mov    %edx,0x10(%ebp)
c0102f97:	85 c0                	test   %eax,%eax
c0102f99:	75 dc                	jne    c0102f77 <memmove+0x59>
			*d++ = *s++;

	return dst;
c0102f9b:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102f9e:	c9                   	leave  
c0102f9f:	c3                   	ret    

c0102fa0 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0102fa0:	55                   	push   %ebp
c0102fa1:	89 e5                	mov    %esp,%ebp
c0102fa3:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c0102fa6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fa9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c0102fac:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102faf:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0102fb2:	eb 30                	jmp    c0102fe4 <memcmp+0x44>
		if (*s1 != *s2)
c0102fb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102fb7:	0f b6 10             	movzbl (%eax),%edx
c0102fba:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102fbd:	0f b6 00             	movzbl (%eax),%eax
c0102fc0:	38 c2                	cmp    %al,%dl
c0102fc2:	74 18                	je     c0102fdc <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c0102fc4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102fc7:	0f b6 00             	movzbl (%eax),%eax
c0102fca:	0f b6 d0             	movzbl %al,%edx
c0102fcd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102fd0:	0f b6 00             	movzbl (%eax),%eax
c0102fd3:	0f b6 c0             	movzbl %al,%eax
c0102fd6:	29 c2                	sub    %eax,%edx
c0102fd8:	89 d0                	mov    %edx,%eax
c0102fda:	eb 1a                	jmp    c0102ff6 <memcmp+0x56>
		s1++, s2++;
c0102fdc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102fe0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c0102fe4:	8b 45 10             	mov    0x10(%ebp),%eax
c0102fe7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102fea:	89 55 10             	mov    %edx,0x10(%ebp)
c0102fed:	85 c0                	test   %eax,%eax
c0102fef:	75 c3                	jne    c0102fb4 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c0102ff1:	b8 00 00 00 00       	mov    $0x0,%eax
}
c0102ff6:	c9                   	leave  
c0102ff7:	c3                   	ret    

c0102ff8 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c0102ff8:	55                   	push   %ebp
c0102ff9:	89 e5                	mov    %esp,%ebp
c0102ffb:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c0102ffe:	8b 45 10             	mov    0x10(%ebp),%eax
c0103001:	8b 55 08             	mov    0x8(%ebp),%edx
c0103004:	01 d0                	add    %edx,%eax
c0103006:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c0103009:	eb 13                	jmp    c010301e <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c010300b:	8b 45 08             	mov    0x8(%ebp),%eax
c010300e:	0f b6 10             	movzbl (%eax),%edx
c0103011:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103014:	38 c2                	cmp    %al,%dl
c0103016:	75 02                	jne    c010301a <memfind+0x22>
			break;
c0103018:	eb 0c                	jmp    c0103026 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c010301a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010301e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103021:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0103024:	72 e5                	jb     c010300b <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c0103026:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0103029:	c9                   	leave  
c010302a:	c3                   	ret    

c010302b <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c010302b:	55                   	push   %ebp
c010302c:	89 e5                	mov    %esp,%ebp
c010302e:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c0103031:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c0103038:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c010303f:	eb 04                	jmp    c0103045 <strtol+0x1a>
		s++;
c0103041:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0103045:	8b 45 08             	mov    0x8(%ebp),%eax
c0103048:	0f b6 00             	movzbl (%eax),%eax
c010304b:	3c 20                	cmp    $0x20,%al
c010304d:	74 f2                	je     c0103041 <strtol+0x16>
c010304f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103052:	0f b6 00             	movzbl (%eax),%eax
c0103055:	3c 09                	cmp    $0x9,%al
c0103057:	74 e8                	je     c0103041 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c0103059:	8b 45 08             	mov    0x8(%ebp),%eax
c010305c:	0f b6 00             	movzbl (%eax),%eax
c010305f:	3c 2b                	cmp    $0x2b,%al
c0103061:	75 06                	jne    c0103069 <strtol+0x3e>
		s++;
c0103063:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103067:	eb 15                	jmp    c010307e <strtol+0x53>
	else if (*s == '-')
c0103069:	8b 45 08             	mov    0x8(%ebp),%eax
c010306c:	0f b6 00             	movzbl (%eax),%eax
c010306f:	3c 2d                	cmp    $0x2d,%al
c0103071:	75 0b                	jne    c010307e <strtol+0x53>
		s++, neg = 1;
c0103073:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103077:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c010307e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103082:	74 06                	je     c010308a <strtol+0x5f>
c0103084:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0103088:	75 24                	jne    c01030ae <strtol+0x83>
c010308a:	8b 45 08             	mov    0x8(%ebp),%eax
c010308d:	0f b6 00             	movzbl (%eax),%eax
c0103090:	3c 30                	cmp    $0x30,%al
c0103092:	75 1a                	jne    c01030ae <strtol+0x83>
c0103094:	8b 45 08             	mov    0x8(%ebp),%eax
c0103097:	83 c0 01             	add    $0x1,%eax
c010309a:	0f b6 00             	movzbl (%eax),%eax
c010309d:	3c 78                	cmp    $0x78,%al
c010309f:	75 0d                	jne    c01030ae <strtol+0x83>
		s += 2, base = 16;
c01030a1:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c01030a5:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c01030ac:	eb 2a                	jmp    c01030d8 <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c01030ae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01030b2:	75 17                	jne    c01030cb <strtol+0xa0>
c01030b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01030b7:	0f b6 00             	movzbl (%eax),%eax
c01030ba:	3c 30                	cmp    $0x30,%al
c01030bc:	75 0d                	jne    c01030cb <strtol+0xa0>
		s++, base = 8;
c01030be:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01030c2:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c01030c9:	eb 0d                	jmp    c01030d8 <strtol+0xad>
	else if (base == 0)
c01030cb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01030cf:	75 07                	jne    c01030d8 <strtol+0xad>
		base = 10;
c01030d1:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c01030d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01030db:	0f b6 00             	movzbl (%eax),%eax
c01030de:	3c 2f                	cmp    $0x2f,%al
c01030e0:	7e 1b                	jle    c01030fd <strtol+0xd2>
c01030e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01030e5:	0f b6 00             	movzbl (%eax),%eax
c01030e8:	3c 39                	cmp    $0x39,%al
c01030ea:	7f 11                	jg     c01030fd <strtol+0xd2>
			dig = *s - '0';
c01030ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01030ef:	0f b6 00             	movzbl (%eax),%eax
c01030f2:	0f be c0             	movsbl %al,%eax
c01030f5:	83 e8 30             	sub    $0x30,%eax
c01030f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01030fb:	eb 48                	jmp    c0103145 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c01030fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103100:	0f b6 00             	movzbl (%eax),%eax
c0103103:	3c 60                	cmp    $0x60,%al
c0103105:	7e 1b                	jle    c0103122 <strtol+0xf7>
c0103107:	8b 45 08             	mov    0x8(%ebp),%eax
c010310a:	0f b6 00             	movzbl (%eax),%eax
c010310d:	3c 7a                	cmp    $0x7a,%al
c010310f:	7f 11                	jg     c0103122 <strtol+0xf7>
			dig = *s - 'a' + 10;
c0103111:	8b 45 08             	mov    0x8(%ebp),%eax
c0103114:	0f b6 00             	movzbl (%eax),%eax
c0103117:	0f be c0             	movsbl %al,%eax
c010311a:	83 e8 57             	sub    $0x57,%eax
c010311d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103120:	eb 23                	jmp    c0103145 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c0103122:	8b 45 08             	mov    0x8(%ebp),%eax
c0103125:	0f b6 00             	movzbl (%eax),%eax
c0103128:	3c 40                	cmp    $0x40,%al
c010312a:	7e 3d                	jle    c0103169 <strtol+0x13e>
c010312c:	8b 45 08             	mov    0x8(%ebp),%eax
c010312f:	0f b6 00             	movzbl (%eax),%eax
c0103132:	3c 5a                	cmp    $0x5a,%al
c0103134:	7f 33                	jg     c0103169 <strtol+0x13e>
			dig = *s - 'A' + 10;
c0103136:	8b 45 08             	mov    0x8(%ebp),%eax
c0103139:	0f b6 00             	movzbl (%eax),%eax
c010313c:	0f be c0             	movsbl %al,%eax
c010313f:	83 e8 37             	sub    $0x37,%eax
c0103142:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c0103145:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103148:	3b 45 10             	cmp    0x10(%ebp),%eax
c010314b:	7c 02                	jl     c010314f <strtol+0x124>
			break;
c010314d:	eb 1a                	jmp    c0103169 <strtol+0x13e>
		s++, val = (val * base) + dig;
c010314f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0103153:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103156:	0f af 45 10          	imul   0x10(%ebp),%eax
c010315a:	89 c2                	mov    %eax,%edx
c010315c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010315f:	01 d0                	add    %edx,%eax
c0103161:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c0103164:	e9 6f ff ff ff       	jmp    c01030d8 <strtol+0xad>

	if (endptr)
c0103169:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010316d:	74 08                	je     c0103177 <strtol+0x14c>
		*endptr = (char *) s;
c010316f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103172:	8b 55 08             	mov    0x8(%ebp),%edx
c0103175:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c0103177:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010317b:	74 07                	je     c0103184 <strtol+0x159>
c010317d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103180:	f7 d8                	neg    %eax
c0103182:	eb 03                	jmp    c0103187 <strtol+0x15c>
c0103184:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0103187:	c9                   	leave  
c0103188:	c3                   	ret    

c0103189 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c0103189:	55                   	push   %ebp
c010318a:	89 e5                	mov    %esp,%ebp
c010318c:	53                   	push   %ebx
c010318d:	83 ec 34             	sub    $0x34,%esp
c0103190:	8b 45 10             	mov    0x10(%ebp),%eax
c0103193:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103196:	8b 45 14             	mov    0x14(%ebp),%eax
c0103199:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c010319c:	8b 45 18             	mov    0x18(%ebp),%eax
c010319f:	ba 00 00 00 00       	mov    $0x0,%edx
c01031a4:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01031a7:	77 72                	ja     c010321b <printnum+0x92>
c01031a9:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c01031ac:	72 05                	jb     c01031b3 <printnum+0x2a>
c01031ae:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01031b1:	77 68                	ja     c010321b <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c01031b3:	8b 45 1c             	mov    0x1c(%ebp),%eax
c01031b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
c01031b9:	8b 45 18             	mov    0x18(%ebp),%eax
c01031bc:	ba 00 00 00 00       	mov    $0x0,%edx
c01031c1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031c5:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01031c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01031cf:	89 04 24             	mov    %eax,(%esp)
c01031d2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01031d6:	e8 55 06 00 00       	call   c0103830 <__udivdi3>
c01031db:	8b 4d 20             	mov    0x20(%ebp),%ecx
c01031de:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c01031e2:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c01031e6:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01031e9:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c01031ed:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031f1:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01031f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031f8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ff:	89 04 24             	mov    %eax,(%esp)
c0103202:	e8 82 ff ff ff       	call   c0103189 <printnum>
c0103207:	eb 1c                	jmp    c0103225 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c0103209:	8b 45 0c             	mov    0xc(%ebp),%eax
c010320c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103210:	8b 45 20             	mov    0x20(%ebp),%eax
c0103213:	89 04 24             	mov    %eax,(%esp)
c0103216:	8b 45 08             	mov    0x8(%ebp),%eax
c0103219:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c010321b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c010321f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0103223:	7f e4                	jg     c0103209 <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c0103225:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103228:	bb 00 00 00 00       	mov    $0x0,%ebx
c010322d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103230:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103233:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103237:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c010323b:	89 04 24             	mov    %eax,(%esp)
c010323e:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103242:	e8 19 07 00 00       	call   c0103960 <__umoddi3>
c0103247:	05 40 40 10 c0       	add    $0xc0104040,%eax
c010324c:	0f b6 00             	movzbl (%eax),%eax
c010324f:	0f be c0             	movsbl %al,%eax
c0103252:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103255:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103259:	89 04 24             	mov    %eax,(%esp)
c010325c:	8b 45 08             	mov    0x8(%ebp),%eax
c010325f:	ff d0                	call   *%eax
}
c0103261:	83 c4 34             	add    $0x34,%esp
c0103264:	5b                   	pop    %ebx
c0103265:	5d                   	pop    %ebp
c0103266:	c3                   	ret    

c0103267 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c0103267:	55                   	push   %ebp
c0103268:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010326a:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010326e:	7e 14                	jle    c0103284 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c0103270:	8b 45 08             	mov    0x8(%ebp),%eax
c0103273:	8b 00                	mov    (%eax),%eax
c0103275:	8d 48 08             	lea    0x8(%eax),%ecx
c0103278:	8b 55 08             	mov    0x8(%ebp),%edx
c010327b:	89 0a                	mov    %ecx,(%edx)
c010327d:	8b 50 04             	mov    0x4(%eax),%edx
c0103280:	8b 00                	mov    (%eax),%eax
c0103282:	eb 30                	jmp    c01032b4 <getuint+0x4d>
	else if (lflag)
c0103284:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103288:	74 16                	je     c01032a0 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c010328a:	8b 45 08             	mov    0x8(%ebp),%eax
c010328d:	8b 00                	mov    (%eax),%eax
c010328f:	8d 48 04             	lea    0x4(%eax),%ecx
c0103292:	8b 55 08             	mov    0x8(%ebp),%edx
c0103295:	89 0a                	mov    %ecx,(%edx)
c0103297:	8b 00                	mov    (%eax),%eax
c0103299:	ba 00 00 00 00       	mov    $0x0,%edx
c010329e:	eb 14                	jmp    c01032b4 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c01032a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01032a3:	8b 00                	mov    (%eax),%eax
c01032a5:	8d 48 04             	lea    0x4(%eax),%ecx
c01032a8:	8b 55 08             	mov    0x8(%ebp),%edx
c01032ab:	89 0a                	mov    %ecx,(%edx)
c01032ad:	8b 00                	mov    (%eax),%eax
c01032af:	ba 00 00 00 00       	mov    $0x0,%edx
}
c01032b4:	5d                   	pop    %ebp
c01032b5:	c3                   	ret    

c01032b6 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c01032b6:	55                   	push   %ebp
c01032b7:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c01032b9:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c01032bd:	7e 14                	jle    c01032d3 <getint+0x1d>
		return va_arg(*ap, long long);
c01032bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01032c2:	8b 00                	mov    (%eax),%eax
c01032c4:	8d 48 08             	lea    0x8(%eax),%ecx
c01032c7:	8b 55 08             	mov    0x8(%ebp),%edx
c01032ca:	89 0a                	mov    %ecx,(%edx)
c01032cc:	8b 50 04             	mov    0x4(%eax),%edx
c01032cf:	8b 00                	mov    (%eax),%eax
c01032d1:	eb 28                	jmp    c01032fb <getint+0x45>
	else if (lflag)
c01032d3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01032d7:	74 12                	je     c01032eb <getint+0x35>
		return va_arg(*ap, long);
c01032d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01032dc:	8b 00                	mov    (%eax),%eax
c01032de:	8d 48 04             	lea    0x4(%eax),%ecx
c01032e1:	8b 55 08             	mov    0x8(%ebp),%edx
c01032e4:	89 0a                	mov    %ecx,(%edx)
c01032e6:	8b 00                	mov    (%eax),%eax
c01032e8:	99                   	cltd   
c01032e9:	eb 10                	jmp    c01032fb <getint+0x45>
	else
		return va_arg(*ap, int);
c01032eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01032ee:	8b 00                	mov    (%eax),%eax
c01032f0:	8d 48 04             	lea    0x4(%eax),%ecx
c01032f3:	8b 55 08             	mov    0x8(%ebp),%edx
c01032f6:	89 0a                	mov    %ecx,(%edx)
c01032f8:	8b 00                	mov    (%eax),%eax
c01032fa:	99                   	cltd   
}
c01032fb:	5d                   	pop    %ebp
c01032fc:	c3                   	ret    

c01032fd <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c01032fd:	55                   	push   %ebp
c01032fe:	89 e5                	mov    %esp,%ebp
c0103300:	56                   	push   %esi
c0103301:	53                   	push   %ebx
c0103302:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c0103305:	eb 18                	jmp    c010331f <vprintfmt+0x22>
			if (ch == '\0')
c0103307:	85 db                	test   %ebx,%ebx
c0103309:	75 05                	jne    c0103310 <vprintfmt+0x13>
				return;
c010330b:	e9 e9 03 00 00       	jmp    c01036f9 <vprintfmt+0x3fc>
			putch(ch, putdat);
c0103310:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103313:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103317:	89 1c 24             	mov    %ebx,(%esp)
c010331a:	8b 45 08             	mov    0x8(%ebp),%eax
c010331d:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c010331f:	8b 45 10             	mov    0x10(%ebp),%eax
c0103322:	8d 50 01             	lea    0x1(%eax),%edx
c0103325:	89 55 10             	mov    %edx,0x10(%ebp)
c0103328:	0f b6 00             	movzbl (%eax),%eax
c010332b:	0f b6 d8             	movzbl %al,%ebx
c010332e:	83 fb 25             	cmp    $0x25,%ebx
c0103331:	75 d4                	jne    c0103307 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c0103333:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c0103337:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c010333e:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c0103345:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c010334c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c0103353:	8b 45 10             	mov    0x10(%ebp),%eax
c0103356:	8d 50 01             	lea    0x1(%eax),%edx
c0103359:	89 55 10             	mov    %edx,0x10(%ebp)
c010335c:	0f b6 00             	movzbl (%eax),%eax
c010335f:	0f b6 d8             	movzbl %al,%ebx
c0103362:	8d 43 dd             	lea    -0x23(%ebx),%eax
c0103365:	83 f8 55             	cmp    $0x55,%eax
c0103368:	0f 87 5a 03 00 00    	ja     c01036c8 <vprintfmt+0x3cb>
c010336e:	8b 04 85 64 40 10 c0 	mov    -0x3fefbf9c(,%eax,4),%eax
c0103375:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c0103377:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c010337b:	eb d6                	jmp    c0103353 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c010337d:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c0103381:	eb d0                	jmp    c0103353 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0103383:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c010338a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010338d:	89 d0                	mov    %edx,%eax
c010338f:	c1 e0 02             	shl    $0x2,%eax
c0103392:	01 d0                	add    %edx,%eax
c0103394:	01 c0                	add    %eax,%eax
c0103396:	01 d8                	add    %ebx,%eax
c0103398:	83 e8 30             	sub    $0x30,%eax
c010339b:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c010339e:	8b 45 10             	mov    0x10(%ebp),%eax
c01033a1:	0f b6 00             	movzbl (%eax),%eax
c01033a4:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c01033a7:	83 fb 2f             	cmp    $0x2f,%ebx
c01033aa:	7e 0b                	jle    c01033b7 <vprintfmt+0xba>
c01033ac:	83 fb 39             	cmp    $0x39,%ebx
c01033af:	7f 06                	jg     c01033b7 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c01033b1:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c01033b5:	eb d3                	jmp    c010338a <vprintfmt+0x8d>
			goto process_precision;
c01033b7:	eb 33                	jmp    c01033ec <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c01033b9:	8b 45 14             	mov    0x14(%ebp),%eax
c01033bc:	8d 50 04             	lea    0x4(%eax),%edx
c01033bf:	89 55 14             	mov    %edx,0x14(%ebp)
c01033c2:	8b 00                	mov    (%eax),%eax
c01033c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c01033c7:	eb 23                	jmp    c01033ec <vprintfmt+0xef>

		case '.':
			if (width < 0)
c01033c9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01033cd:	79 0c                	jns    c01033db <vprintfmt+0xde>
				width = 0;
c01033cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c01033d6:	e9 78 ff ff ff       	jmp    c0103353 <vprintfmt+0x56>
c01033db:	e9 73 ff ff ff       	jmp    c0103353 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c01033e0:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c01033e7:	e9 67 ff ff ff       	jmp    c0103353 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c01033ec:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01033f0:	79 12                	jns    c0103404 <vprintfmt+0x107>
				width = precision, precision = -1;
c01033f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01033f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01033f8:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c01033ff:	e9 4f ff ff ff       	jmp    c0103353 <vprintfmt+0x56>
c0103404:	e9 4a ff ff ff       	jmp    c0103353 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c0103409:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c010340d:	e9 41 ff ff ff       	jmp    c0103353 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c0103412:	8b 45 14             	mov    0x14(%ebp),%eax
c0103415:	8d 50 04             	lea    0x4(%eax),%edx
c0103418:	89 55 14             	mov    %edx,0x14(%ebp)
c010341b:	8b 00                	mov    (%eax),%eax
c010341d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103420:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103424:	89 04 24             	mov    %eax,(%esp)
c0103427:	8b 45 08             	mov    0x8(%ebp),%eax
c010342a:	ff d0                	call   *%eax
			break;
c010342c:	e9 c2 02 00 00       	jmp    c01036f3 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c0103431:	8b 45 14             	mov    0x14(%ebp),%eax
c0103434:	8d 50 04             	lea    0x4(%eax),%edx
c0103437:	89 55 14             	mov    %edx,0x14(%ebp)
c010343a:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c010343c:	85 db                	test   %ebx,%ebx
c010343e:	79 02                	jns    c0103442 <vprintfmt+0x145>
				err = -err;
c0103440:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c0103442:	83 fb 06             	cmp    $0x6,%ebx
c0103445:	7f 0b                	jg     c0103452 <vprintfmt+0x155>
c0103447:	8b 34 9d 24 40 10 c0 	mov    -0x3fefbfdc(,%ebx,4),%esi
c010344e:	85 f6                	test   %esi,%esi
c0103450:	75 23                	jne    c0103475 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c0103452:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0103456:	c7 44 24 08 51 40 10 	movl   $0xc0104051,0x8(%esp)
c010345d:	c0 
c010345e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103461:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103465:	8b 45 08             	mov    0x8(%ebp),%eax
c0103468:	89 04 24             	mov    %eax,(%esp)
c010346b:	e8 90 02 00 00       	call   c0103700 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c0103470:	e9 7e 02 00 00       	jmp    c01036f3 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c0103475:	89 74 24 0c          	mov    %esi,0xc(%esp)
c0103479:	c7 44 24 08 5a 40 10 	movl   $0xc010405a,0x8(%esp)
c0103480:	c0 
c0103481:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103484:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103488:	8b 45 08             	mov    0x8(%ebp),%eax
c010348b:	89 04 24             	mov    %eax,(%esp)
c010348e:	e8 6d 02 00 00       	call   c0103700 <printfmt>
			break;
c0103493:	e9 5b 02 00 00       	jmp    c01036f3 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c0103498:	8b 45 14             	mov    0x14(%ebp),%eax
c010349b:	8d 50 04             	lea    0x4(%eax),%edx
c010349e:	89 55 14             	mov    %edx,0x14(%ebp)
c01034a1:	8b 30                	mov    (%eax),%esi
c01034a3:	85 f6                	test   %esi,%esi
c01034a5:	75 05                	jne    c01034ac <vprintfmt+0x1af>
				p = "(null)";
c01034a7:	be 5d 40 10 c0       	mov    $0xc010405d,%esi
			if (width > 0 && padc != '-')
c01034ac:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01034b0:	7e 37                	jle    c01034e9 <vprintfmt+0x1ec>
c01034b2:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c01034b6:	74 31                	je     c01034e9 <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c01034b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01034bb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01034bf:	89 34 24             	mov    %esi,(%esp)
c01034c2:	e8 9b f8 ff ff       	call   c0102d62 <strnlen>
c01034c7:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c01034ca:	eb 17                	jmp    c01034e3 <vprintfmt+0x1e6>
					putch(padc, putdat);
c01034cc:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c01034d0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01034d3:	89 54 24 04          	mov    %edx,0x4(%esp)
c01034d7:	89 04 24             	mov    %eax,(%esp)
c01034da:	8b 45 08             	mov    0x8(%ebp),%eax
c01034dd:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c01034df:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01034e3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01034e7:	7f e3                	jg     c01034cc <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c01034e9:	eb 38                	jmp    c0103523 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c01034eb:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01034ef:	74 1f                	je     c0103510 <vprintfmt+0x213>
c01034f1:	83 fb 1f             	cmp    $0x1f,%ebx
c01034f4:	7e 05                	jle    c01034fb <vprintfmt+0x1fe>
c01034f6:	83 fb 7e             	cmp    $0x7e,%ebx
c01034f9:	7e 15                	jle    c0103510 <vprintfmt+0x213>
					putch('?', putdat);
c01034fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034fe:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103502:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c0103509:	8b 45 08             	mov    0x8(%ebp),%eax
c010350c:	ff d0                	call   *%eax
c010350e:	eb 0f                	jmp    c010351f <vprintfmt+0x222>
				else
					putch(ch, putdat);
c0103510:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103513:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103517:	89 1c 24             	mov    %ebx,(%esp)
c010351a:	8b 45 08             	mov    0x8(%ebp),%eax
c010351d:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c010351f:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c0103523:	89 f0                	mov    %esi,%eax
c0103525:	8d 70 01             	lea    0x1(%eax),%esi
c0103528:	0f b6 00             	movzbl (%eax),%eax
c010352b:	0f be d8             	movsbl %al,%ebx
c010352e:	85 db                	test   %ebx,%ebx
c0103530:	74 10                	je     c0103542 <vprintfmt+0x245>
c0103532:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103536:	78 b3                	js     c01034eb <vprintfmt+0x1ee>
c0103538:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c010353c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103540:	79 a9                	jns    c01034eb <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103542:	eb 17                	jmp    c010355b <vprintfmt+0x25e>
				putch(' ', putdat);
c0103544:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103547:	89 44 24 04          	mov    %eax,0x4(%esp)
c010354b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103552:	8b 45 08             	mov    0x8(%ebp),%eax
c0103555:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0103557:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c010355b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c010355f:	7f e3                	jg     c0103544 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0103561:	e9 8d 01 00 00       	jmp    c01036f3 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c0103566:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103569:	89 44 24 04          	mov    %eax,0x4(%esp)
c010356d:	8d 45 14             	lea    0x14(%ebp),%eax
c0103570:	89 04 24             	mov    %eax,(%esp)
c0103573:	e8 3e fd ff ff       	call   c01032b6 <getint>
c0103578:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010357b:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c010357e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103581:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103584:	85 d2                	test   %edx,%edx
c0103586:	79 26                	jns    c01035ae <vprintfmt+0x2b1>
				putch('-', putdat);
c0103588:	8b 45 0c             	mov    0xc(%ebp),%eax
c010358b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010358f:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0103596:	8b 45 08             	mov    0x8(%ebp),%eax
c0103599:	ff d0                	call   *%eax
				num = -(long long) num;
c010359b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010359e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01035a1:	f7 d8                	neg    %eax
c01035a3:	83 d2 00             	adc    $0x0,%edx
c01035a6:	f7 da                	neg    %edx
c01035a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c01035ae:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c01035b5:	e9 c5 00 00 00       	jmp    c010367f <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c01035ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01035bd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035c1:	8d 45 14             	lea    0x14(%ebp),%eax
c01035c4:	89 04 24             	mov    %eax,(%esp)
c01035c7:	e8 9b fc ff ff       	call   c0103267 <getuint>
c01035cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035cf:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c01035d2:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c01035d9:	e9 a1 00 00 00       	jmp    c010367f <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c01035de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035e1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035e5:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01035ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01035ef:	ff d0                	call   *%eax
			putch('X', putdat);
c01035f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035f4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035f8:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01035ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0103602:	ff d0                	call   *%eax
			putch('X', putdat);
c0103604:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103607:	89 44 24 04          	mov    %eax,0x4(%esp)
c010360b:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c0103612:	8b 45 08             	mov    0x8(%ebp),%eax
c0103615:	ff d0                	call   *%eax
			break;
c0103617:	e9 d7 00 00 00       	jmp    c01036f3 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c010361c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010361f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103623:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c010362a:	8b 45 08             	mov    0x8(%ebp),%eax
c010362d:	ff d0                	call   *%eax
			putch('x', putdat);
c010362f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103632:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103636:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c010363d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103640:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0103642:	8b 45 14             	mov    0x14(%ebp),%eax
c0103645:	8d 50 04             	lea    0x4(%eax),%edx
c0103648:	89 55 14             	mov    %edx,0x14(%ebp)
c010364b:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c010364d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103650:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0103657:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c010365e:	eb 1f                	jmp    c010367f <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0103660:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103663:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103667:	8d 45 14             	lea    0x14(%ebp),%eax
c010366a:	89 04 24             	mov    %eax,(%esp)
c010366d:	e8 f5 fb ff ff       	call   c0103267 <getuint>
c0103672:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103675:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c0103678:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c010367f:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0103683:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103686:	89 54 24 18          	mov    %edx,0x18(%esp)
c010368a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010368d:	89 54 24 14          	mov    %edx,0x14(%esp)
c0103691:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103695:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103698:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010369b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010369f:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01036a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036a6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01036ad:	89 04 24             	mov    %eax,(%esp)
c01036b0:	e8 d4 fa ff ff       	call   c0103189 <printnum>
			break;
c01036b5:	eb 3c                	jmp    c01036f3 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c01036b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036ba:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036be:	89 1c 24             	mov    %ebx,(%esp)
c01036c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01036c4:	ff d0                	call   *%eax
			break;
c01036c6:	eb 2b                	jmp    c01036f3 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c01036c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036cb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036cf:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c01036d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01036d9:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c01036db:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01036df:	eb 04                	jmp    c01036e5 <vprintfmt+0x3e8>
c01036e1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01036e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01036e8:	83 e8 01             	sub    $0x1,%eax
c01036eb:	0f b6 00             	movzbl (%eax),%eax
c01036ee:	3c 25                	cmp    $0x25,%al
c01036f0:	75 ef                	jne    c01036e1 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c01036f2:	90                   	nop
		}
	}
c01036f3:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01036f4:	e9 26 fc ff ff       	jmp    c010331f <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c01036f9:	83 c4 40             	add    $0x40,%esp
c01036fc:	5b                   	pop    %ebx
c01036fd:	5e                   	pop    %esi
c01036fe:	5d                   	pop    %ebp
c01036ff:	c3                   	ret    

c0103700 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c0103700:	55                   	push   %ebp
c0103701:	89 e5                	mov    %esp,%ebp
c0103703:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0103706:	8d 45 14             	lea    0x14(%ebp),%eax
c0103709:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c010370c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010370f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103713:	8b 45 10             	mov    0x10(%ebp),%eax
c0103716:	89 44 24 08          	mov    %eax,0x8(%esp)
c010371a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010371d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103721:	8b 45 08             	mov    0x8(%ebp),%eax
c0103724:	89 04 24             	mov    %eax,(%esp)
c0103727:	e8 d1 fb ff ff       	call   c01032fd <vprintfmt>
	va_end(ap);
}
c010372c:	c9                   	leave  
c010372d:	c3                   	ret    

c010372e <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c010372e:	55                   	push   %ebp
c010372f:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0103731:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103734:	8b 40 08             	mov    0x8(%eax),%eax
c0103737:	8d 50 01             	lea    0x1(%eax),%edx
c010373a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010373d:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0103740:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103743:	8b 10                	mov    (%eax),%edx
c0103745:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103748:	8b 40 04             	mov    0x4(%eax),%eax
c010374b:	39 c2                	cmp    %eax,%edx
c010374d:	73 12                	jae    c0103761 <sprintputch+0x33>
		*b->buf++ = ch;
c010374f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103752:	8b 00                	mov    (%eax),%eax
c0103754:	8d 48 01             	lea    0x1(%eax),%ecx
c0103757:	8b 55 0c             	mov    0xc(%ebp),%edx
c010375a:	89 0a                	mov    %ecx,(%edx)
c010375c:	8b 55 08             	mov    0x8(%ebp),%edx
c010375f:	88 10                	mov    %dl,(%eax)
}
c0103761:	5d                   	pop    %ebp
c0103762:	c3                   	ret    

c0103763 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0103763:	55                   	push   %ebp
c0103764:	89 e5                	mov    %esp,%ebp
c0103766:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0103769:	8b 45 08             	mov    0x8(%ebp),%eax
c010376c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010376f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103772:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103775:	8b 45 08             	mov    0x8(%ebp),%eax
c0103778:	01 d0                	add    %edx,%eax
c010377a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010377d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0103784:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103788:	74 06                	je     c0103790 <vsnprintf+0x2d>
c010378a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010378e:	7f 07                	jg     c0103797 <vsnprintf+0x34>
		return -E_INVAL;
c0103790:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0103795:	eb 2a                	jmp    c01037c1 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c0103797:	8b 45 14             	mov    0x14(%ebp),%eax
c010379a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010379e:	8b 45 10             	mov    0x10(%ebp),%eax
c01037a1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01037a5:	8d 45 ec             	lea    -0x14(%ebp),%eax
c01037a8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01037ac:	c7 04 24 2e 37 10 c0 	movl   $0xc010372e,(%esp)
c01037b3:	e8 45 fb ff ff       	call   c01032fd <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c01037b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01037bb:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c01037be:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01037c1:	c9                   	leave  
c01037c2:	c3                   	ret    

c01037c3 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c01037c3:	55                   	push   %ebp
c01037c4:	89 e5                	mov    %esp,%ebp
c01037c6:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c01037c9:	8d 45 14             	lea    0x14(%ebp),%eax
c01037cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c01037cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037d2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01037d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01037d9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01037dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037e0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01037e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01037e7:	89 04 24             	mov    %eax,(%esp)
c01037ea:	e8 74 ff ff ff       	call   c0103763 <vsnprintf>
c01037ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c01037f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c01037f5:	c9                   	leave  
c01037f6:	c3                   	ret    

c01037f7 <srand>:
static int seed = 0;

void
srand(int s) {
c01037f7:	55                   	push   %ebp
c01037f8:	89 e5                	mov    %esp,%ebp
	seed = s;
c01037fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01037fd:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
}
c0103802:	5d                   	pop    %ebp
c0103803:	c3                   	ret    

c0103804 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0103804:	55                   	push   %ebp
c0103805:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0103807:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c010380c:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0103812:	83 c0 01             	add    $0x1,%eax
c0103815:	a3 c8 3e 16 c0       	mov    %eax,0xc0163ec8
	return (seed >> 16) & 0x7FFF;
c010381a:	a1 c8 3e 16 c0       	mov    0xc0163ec8,%eax
c010381f:	c1 f8 10             	sar    $0x10,%eax
c0103822:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0103827:	5d                   	pop    %ebp
c0103828:	c3                   	ret    
c0103829:	66 90                	xchg   %ax,%ax
c010382b:	66 90                	xchg   %ax,%ax
c010382d:	66 90                	xchg   %ax,%ax
c010382f:	90                   	nop

c0103830 <__udivdi3>:
c0103830:	55                   	push   %ebp
c0103831:	57                   	push   %edi
c0103832:	56                   	push   %esi
c0103833:	83 ec 0c             	sub    $0xc,%esp
c0103836:	8b 44 24 28          	mov    0x28(%esp),%eax
c010383a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c010383e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0103842:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0103846:	85 c0                	test   %eax,%eax
c0103848:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010384c:	89 ea                	mov    %ebp,%edx
c010384e:	89 0c 24             	mov    %ecx,(%esp)
c0103851:	75 2d                	jne    c0103880 <__udivdi3+0x50>
c0103853:	39 e9                	cmp    %ebp,%ecx
c0103855:	77 61                	ja     c01038b8 <__udivdi3+0x88>
c0103857:	85 c9                	test   %ecx,%ecx
c0103859:	89 ce                	mov    %ecx,%esi
c010385b:	75 0b                	jne    c0103868 <__udivdi3+0x38>
c010385d:	b8 01 00 00 00       	mov    $0x1,%eax
c0103862:	31 d2                	xor    %edx,%edx
c0103864:	f7 f1                	div    %ecx
c0103866:	89 c6                	mov    %eax,%esi
c0103868:	31 d2                	xor    %edx,%edx
c010386a:	89 e8                	mov    %ebp,%eax
c010386c:	f7 f6                	div    %esi
c010386e:	89 c5                	mov    %eax,%ebp
c0103870:	89 f8                	mov    %edi,%eax
c0103872:	f7 f6                	div    %esi
c0103874:	89 ea                	mov    %ebp,%edx
c0103876:	83 c4 0c             	add    $0xc,%esp
c0103879:	5e                   	pop    %esi
c010387a:	5f                   	pop    %edi
c010387b:	5d                   	pop    %ebp
c010387c:	c3                   	ret    
c010387d:	8d 76 00             	lea    0x0(%esi),%esi
c0103880:	39 e8                	cmp    %ebp,%eax
c0103882:	77 24                	ja     c01038a8 <__udivdi3+0x78>
c0103884:	0f bd e8             	bsr    %eax,%ebp
c0103887:	83 f5 1f             	xor    $0x1f,%ebp
c010388a:	75 3c                	jne    c01038c8 <__udivdi3+0x98>
c010388c:	8b 74 24 04          	mov    0x4(%esp),%esi
c0103890:	39 34 24             	cmp    %esi,(%esp)
c0103893:	0f 86 9f 00 00 00    	jbe    c0103938 <__udivdi3+0x108>
c0103899:	39 d0                	cmp    %edx,%eax
c010389b:	0f 82 97 00 00 00    	jb     c0103938 <__udivdi3+0x108>
c01038a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01038a8:	31 d2                	xor    %edx,%edx
c01038aa:	31 c0                	xor    %eax,%eax
c01038ac:	83 c4 0c             	add    $0xc,%esp
c01038af:	5e                   	pop    %esi
c01038b0:	5f                   	pop    %edi
c01038b1:	5d                   	pop    %ebp
c01038b2:	c3                   	ret    
c01038b3:	90                   	nop
c01038b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01038b8:	89 f8                	mov    %edi,%eax
c01038ba:	f7 f1                	div    %ecx
c01038bc:	31 d2                	xor    %edx,%edx
c01038be:	83 c4 0c             	add    $0xc,%esp
c01038c1:	5e                   	pop    %esi
c01038c2:	5f                   	pop    %edi
c01038c3:	5d                   	pop    %ebp
c01038c4:	c3                   	ret    
c01038c5:	8d 76 00             	lea    0x0(%esi),%esi
c01038c8:	89 e9                	mov    %ebp,%ecx
c01038ca:	8b 3c 24             	mov    (%esp),%edi
c01038cd:	d3 e0                	shl    %cl,%eax
c01038cf:	89 c6                	mov    %eax,%esi
c01038d1:	b8 20 00 00 00       	mov    $0x20,%eax
c01038d6:	29 e8                	sub    %ebp,%eax
c01038d8:	89 c1                	mov    %eax,%ecx
c01038da:	d3 ef                	shr    %cl,%edi
c01038dc:	89 e9                	mov    %ebp,%ecx
c01038de:	89 7c 24 08          	mov    %edi,0x8(%esp)
c01038e2:	8b 3c 24             	mov    (%esp),%edi
c01038e5:	09 74 24 08          	or     %esi,0x8(%esp)
c01038e9:	89 d6                	mov    %edx,%esi
c01038eb:	d3 e7                	shl    %cl,%edi
c01038ed:	89 c1                	mov    %eax,%ecx
c01038ef:	89 3c 24             	mov    %edi,(%esp)
c01038f2:	8b 7c 24 04          	mov    0x4(%esp),%edi
c01038f6:	d3 ee                	shr    %cl,%esi
c01038f8:	89 e9                	mov    %ebp,%ecx
c01038fa:	d3 e2                	shl    %cl,%edx
c01038fc:	89 c1                	mov    %eax,%ecx
c01038fe:	d3 ef                	shr    %cl,%edi
c0103900:	09 d7                	or     %edx,%edi
c0103902:	89 f2                	mov    %esi,%edx
c0103904:	89 f8                	mov    %edi,%eax
c0103906:	f7 74 24 08          	divl   0x8(%esp)
c010390a:	89 d6                	mov    %edx,%esi
c010390c:	89 c7                	mov    %eax,%edi
c010390e:	f7 24 24             	mull   (%esp)
c0103911:	39 d6                	cmp    %edx,%esi
c0103913:	89 14 24             	mov    %edx,(%esp)
c0103916:	72 30                	jb     c0103948 <__udivdi3+0x118>
c0103918:	8b 54 24 04          	mov    0x4(%esp),%edx
c010391c:	89 e9                	mov    %ebp,%ecx
c010391e:	d3 e2                	shl    %cl,%edx
c0103920:	39 c2                	cmp    %eax,%edx
c0103922:	73 05                	jae    c0103929 <__udivdi3+0xf9>
c0103924:	3b 34 24             	cmp    (%esp),%esi
c0103927:	74 1f                	je     c0103948 <__udivdi3+0x118>
c0103929:	89 f8                	mov    %edi,%eax
c010392b:	31 d2                	xor    %edx,%edx
c010392d:	e9 7a ff ff ff       	jmp    c01038ac <__udivdi3+0x7c>
c0103932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103938:	31 d2                	xor    %edx,%edx
c010393a:	b8 01 00 00 00       	mov    $0x1,%eax
c010393f:	e9 68 ff ff ff       	jmp    c01038ac <__udivdi3+0x7c>
c0103944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103948:	8d 47 ff             	lea    -0x1(%edi),%eax
c010394b:	31 d2                	xor    %edx,%edx
c010394d:	83 c4 0c             	add    $0xc,%esp
c0103950:	5e                   	pop    %esi
c0103951:	5f                   	pop    %edi
c0103952:	5d                   	pop    %ebp
c0103953:	c3                   	ret    
c0103954:	66 90                	xchg   %ax,%ax
c0103956:	66 90                	xchg   %ax,%ax
c0103958:	66 90                	xchg   %ax,%ax
c010395a:	66 90                	xchg   %ax,%ax
c010395c:	66 90                	xchg   %ax,%ax
c010395e:	66 90                	xchg   %ax,%ax

c0103960 <__umoddi3>:
c0103960:	55                   	push   %ebp
c0103961:	57                   	push   %edi
c0103962:	56                   	push   %esi
c0103963:	83 ec 14             	sub    $0x14,%esp
c0103966:	8b 44 24 28          	mov    0x28(%esp),%eax
c010396a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c010396e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0103972:	89 c7                	mov    %eax,%edi
c0103974:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103978:	8b 44 24 30          	mov    0x30(%esp),%eax
c010397c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0103980:	89 34 24             	mov    %esi,(%esp)
c0103983:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103987:	85 c0                	test   %eax,%eax
c0103989:	89 c2                	mov    %eax,%edx
c010398b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c010398f:	75 17                	jne    c01039a8 <__umoddi3+0x48>
c0103991:	39 fe                	cmp    %edi,%esi
c0103993:	76 4b                	jbe    c01039e0 <__umoddi3+0x80>
c0103995:	89 c8                	mov    %ecx,%eax
c0103997:	89 fa                	mov    %edi,%edx
c0103999:	f7 f6                	div    %esi
c010399b:	89 d0                	mov    %edx,%eax
c010399d:	31 d2                	xor    %edx,%edx
c010399f:	83 c4 14             	add    $0x14,%esp
c01039a2:	5e                   	pop    %esi
c01039a3:	5f                   	pop    %edi
c01039a4:	5d                   	pop    %ebp
c01039a5:	c3                   	ret    
c01039a6:	66 90                	xchg   %ax,%ax
c01039a8:	39 f8                	cmp    %edi,%eax
c01039aa:	77 54                	ja     c0103a00 <__umoddi3+0xa0>
c01039ac:	0f bd e8             	bsr    %eax,%ebp
c01039af:	83 f5 1f             	xor    $0x1f,%ebp
c01039b2:	75 5c                	jne    c0103a10 <__umoddi3+0xb0>
c01039b4:	8b 7c 24 08          	mov    0x8(%esp),%edi
c01039b8:	39 3c 24             	cmp    %edi,(%esp)
c01039bb:	0f 87 e7 00 00 00    	ja     c0103aa8 <__umoddi3+0x148>
c01039c1:	8b 7c 24 04          	mov    0x4(%esp),%edi
c01039c5:	29 f1                	sub    %esi,%ecx
c01039c7:	19 c7                	sbb    %eax,%edi
c01039c9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01039cd:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c01039d1:	8b 44 24 08          	mov    0x8(%esp),%eax
c01039d5:	8b 54 24 0c          	mov    0xc(%esp),%edx
c01039d9:	83 c4 14             	add    $0x14,%esp
c01039dc:	5e                   	pop    %esi
c01039dd:	5f                   	pop    %edi
c01039de:	5d                   	pop    %ebp
c01039df:	c3                   	ret    
c01039e0:	85 f6                	test   %esi,%esi
c01039e2:	89 f5                	mov    %esi,%ebp
c01039e4:	75 0b                	jne    c01039f1 <__umoddi3+0x91>
c01039e6:	b8 01 00 00 00       	mov    $0x1,%eax
c01039eb:	31 d2                	xor    %edx,%edx
c01039ed:	f7 f6                	div    %esi
c01039ef:	89 c5                	mov    %eax,%ebp
c01039f1:	8b 44 24 04          	mov    0x4(%esp),%eax
c01039f5:	31 d2                	xor    %edx,%edx
c01039f7:	f7 f5                	div    %ebp
c01039f9:	89 c8                	mov    %ecx,%eax
c01039fb:	f7 f5                	div    %ebp
c01039fd:	eb 9c                	jmp    c010399b <__umoddi3+0x3b>
c01039ff:	90                   	nop
c0103a00:	89 c8                	mov    %ecx,%eax
c0103a02:	89 fa                	mov    %edi,%edx
c0103a04:	83 c4 14             	add    $0x14,%esp
c0103a07:	5e                   	pop    %esi
c0103a08:	5f                   	pop    %edi
c0103a09:	5d                   	pop    %ebp
c0103a0a:	c3                   	ret    
c0103a0b:	90                   	nop
c0103a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103a10:	8b 04 24             	mov    (%esp),%eax
c0103a13:	be 20 00 00 00       	mov    $0x20,%esi
c0103a18:	89 e9                	mov    %ebp,%ecx
c0103a1a:	29 ee                	sub    %ebp,%esi
c0103a1c:	d3 e2                	shl    %cl,%edx
c0103a1e:	89 f1                	mov    %esi,%ecx
c0103a20:	d3 e8                	shr    %cl,%eax
c0103a22:	89 e9                	mov    %ebp,%ecx
c0103a24:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a28:	8b 04 24             	mov    (%esp),%eax
c0103a2b:	09 54 24 04          	or     %edx,0x4(%esp)
c0103a2f:	89 fa                	mov    %edi,%edx
c0103a31:	d3 e0                	shl    %cl,%eax
c0103a33:	89 f1                	mov    %esi,%ecx
c0103a35:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103a39:	8b 44 24 10          	mov    0x10(%esp),%eax
c0103a3d:	d3 ea                	shr    %cl,%edx
c0103a3f:	89 e9                	mov    %ebp,%ecx
c0103a41:	d3 e7                	shl    %cl,%edi
c0103a43:	89 f1                	mov    %esi,%ecx
c0103a45:	d3 e8                	shr    %cl,%eax
c0103a47:	89 e9                	mov    %ebp,%ecx
c0103a49:	09 f8                	or     %edi,%eax
c0103a4b:	8b 7c 24 10          	mov    0x10(%esp),%edi
c0103a4f:	f7 74 24 04          	divl   0x4(%esp)
c0103a53:	d3 e7                	shl    %cl,%edi
c0103a55:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0103a59:	89 d7                	mov    %edx,%edi
c0103a5b:	f7 64 24 08          	mull   0x8(%esp)
c0103a5f:	39 d7                	cmp    %edx,%edi
c0103a61:	89 c1                	mov    %eax,%ecx
c0103a63:	89 14 24             	mov    %edx,(%esp)
c0103a66:	72 2c                	jb     c0103a94 <__umoddi3+0x134>
c0103a68:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c0103a6c:	72 22                	jb     c0103a90 <__umoddi3+0x130>
c0103a6e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0103a72:	29 c8                	sub    %ecx,%eax
c0103a74:	19 d7                	sbb    %edx,%edi
c0103a76:	89 e9                	mov    %ebp,%ecx
c0103a78:	89 fa                	mov    %edi,%edx
c0103a7a:	d3 e8                	shr    %cl,%eax
c0103a7c:	89 f1                	mov    %esi,%ecx
c0103a7e:	d3 e2                	shl    %cl,%edx
c0103a80:	89 e9                	mov    %ebp,%ecx
c0103a82:	d3 ef                	shr    %cl,%edi
c0103a84:	09 d0                	or     %edx,%eax
c0103a86:	89 fa                	mov    %edi,%edx
c0103a88:	83 c4 14             	add    $0x14,%esp
c0103a8b:	5e                   	pop    %esi
c0103a8c:	5f                   	pop    %edi
c0103a8d:	5d                   	pop    %ebp
c0103a8e:	c3                   	ret    
c0103a8f:	90                   	nop
c0103a90:	39 d7                	cmp    %edx,%edi
c0103a92:	75 da                	jne    c0103a6e <__umoddi3+0x10e>
c0103a94:	8b 14 24             	mov    (%esp),%edx
c0103a97:	89 c1                	mov    %eax,%ecx
c0103a99:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c0103a9d:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0103aa1:	eb cb                	jmp    c0103a6e <__umoddi3+0x10e>
c0103aa3:	90                   	nop
c0103aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103aa8:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c0103aac:	0f 82 0f ff ff ff    	jb     c01039c1 <__umoddi3+0x61>
c0103ab2:	e9 1a ff ff ff       	jmp    c01039d1 <__umoddi3+0x71>
