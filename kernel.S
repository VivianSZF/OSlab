
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0100000 <do_syscall>:
int sys_pr(void*);
int sys_readkey(void);
int sys_write(int,void*,int);
int sys_time(void);

void do_syscall(struct TrapFrame *tf) {
c0100000:	55                   	push   %ebp
c0100001:	89 e5                	mov    %esp,%ebp
c0100003:	83 ec 28             	sub    $0x28,%esp
	switch(tf->eax) {
c0100006:	8b 45 08             	mov    0x8(%ebp),%eax
c0100009:	8b 40 1c             	mov    0x1c(%eax),%eax
c010000c:	83 f8 02             	cmp    $0x2,%eax
c010000f:	74 30                	je     c0100041 <do_syscall+0x41>
c0100011:	83 f8 02             	cmp    $0x2,%eax
c0100014:	77 07                	ja     c010001d <do_syscall+0x1d>
c0100016:	83 f8 01             	cmp    $0x1,%eax
c0100019:	74 0e                	je     c0100029 <do_syscall+0x29>
c010001b:	eb 72                	jmp    c010008f <do_syscall+0x8f>
c010001d:	83 f8 03             	cmp    $0x3,%eax
c0100020:	74 2e                	je     c0100050 <do_syscall+0x50>
c0100022:	83 f8 04             	cmp    $0x4,%eax
c0100025:	74 38                	je     c010005f <do_syscall+0x5f>
c0100027:	eb 66                	jmp    c010008f <do_syscall+0x8f>
		case SYS_printf:  
			tf->eax=sys_pr((void*)tf->ebx);
c0100029:	8b 45 08             	mov    0x8(%ebp),%eax
c010002c:	8b 40 10             	mov    0x10(%eax),%eax
c010002f:	89 04 24             	mov    %eax,(%esp)
c0100032:	e8 4d 09 00 00       	call   c0100984 <sys_pr>
c0100037:	89 c2                	mov    %eax,%edx
c0100039:	8b 45 08             	mov    0x8(%ebp),%eax
c010003c:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010003f:	eb 7e                	jmp    c01000bf <do_syscall+0xbf>
		case SYS_time:
			tf->eax=sys_time();
c0100041:	e8 9a 00 00 00       	call   c01000e0 <sys_time>
c0100046:	89 c2                	mov    %eax,%edx
c0100048:	8b 45 08             	mov    0x8(%ebp),%eax
c010004b:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010004e:	eb 6f                	jmp    c01000bf <do_syscall+0xbf>
		case SYS_readkey: 
			tf->eax=sys_readkey(); 
c0100050:	e8 95 00 00 00       	call   c01000ea <sys_readkey>
c0100055:	89 c2                	mov    %eax,%edx
c0100057:	8b 45 08             	mov    0x8(%ebp),%eax
c010005a:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010005d:	eb 60                	jmp    c01000bf <do_syscall+0xbf>
		case SYS_write: 
			tf->eax=sys_write(tf->ebx,(void*)tf->ecx,tf->edx); 
c010005f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100062:	8b 40 14             	mov    0x14(%eax),%eax
c0100065:	89 c1                	mov    %eax,%ecx
c0100067:	8b 45 08             	mov    0x8(%ebp),%eax
c010006a:	8b 40 18             	mov    0x18(%eax),%eax
c010006d:	89 c2                	mov    %eax,%edx
c010006f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100072:	8b 40 10             	mov    0x10(%eax),%eax
c0100075:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0100079:	89 54 24 04          	mov    %edx,0x4(%esp)
c010007d:	89 04 24             	mov    %eax,(%esp)
c0100080:	e8 33 1b 00 00       	call   c0101bb8 <sys_write>
c0100085:	89 c2                	mov    %eax,%edx
c0100087:	8b 45 08             	mov    0x8(%ebp),%eax
c010008a:	89 50 1c             	mov    %edx,0x1c(%eax)
			break;
c010008d:	eb 30                	jmp    c01000bf <do_syscall+0xbf>
		default: panic("Unhandled system call: id = %d, eip = 0x%08x", tf->eax, tf->eip);
c010008f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100092:	8b 50 38             	mov    0x38(%eax),%edx
c0100095:	8b 45 08             	mov    0x8(%ebp),%eax
c0100098:	8b 40 1c             	mov    0x1c(%eax),%eax
c010009b:	89 54 24 10          	mov    %edx,0x10(%esp)
c010009f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01000a3:	c7 44 24 08 88 2d 10 	movl   $0xc0102d88,0x8(%esp)
c01000aa:	c0 
c01000ab:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
c01000b2:	00 
c01000b3:	c7 04 24 b5 2d 10 c0 	movl   $0xc0102db5,(%esp)
c01000ba:	e8 59 1a 00 00       	call   c0101b18 <_panic>
 	}
} 
c01000bf:	c9                   	leave  
c01000c0:	c3                   	ret    

c01000c1 <timer_event>:
void pcb_init();
PCB* pcb_new();

static int tick = 0;
void timer_event()
{
c01000c1:	55                   	push   %ebp
c01000c2:	89 e5                	mov    %esp,%ebp
	tick++;
c01000c4:	a1 00 00 11 c0       	mov    0xc0110000,%eax
c01000c9:	83 c0 01             	add    $0x1,%eax
c01000cc:	a3 00 00 11 c0       	mov    %eax,0xc0110000
}
c01000d1:	5d                   	pop    %ebp
c01000d2:	c3                   	ret    

c01000d3 <keyboard_event>:
static int last_code = -1;
void keyboard_event(int code)
{
c01000d3:	55                   	push   %ebp
c01000d4:	89 e5                	mov    %esp,%ebp
	last_code = code;
c01000d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01000d9:	a3 00 50 10 c0       	mov    %eax,0xc0105000
}
c01000de:	5d                   	pop    %ebp
c01000df:	c3                   	ret    

c01000e0 <sys_time>:
int sys_time(void)
{
c01000e0:	55                   	push   %ebp
c01000e1:	89 e5                	mov    %esp,%ebp
	return tick;
c01000e3:	a1 00 00 11 c0       	mov    0xc0110000,%eax
}
c01000e8:	5d                   	pop    %ebp
c01000e9:	c3                   	ret    

c01000ea <sys_readkey>:
int sys_readkey(void)
{
c01000ea:	55                   	push   %ebp
c01000eb:	89 e5                	mov    %esp,%ebp
c01000ed:	83 ec 10             	sub    $0x10,%esp
	int code = last_code;
c01000f0:	a1 00 50 10 c0       	mov    0xc0105000,%eax
c01000f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
	last_code = -1;
c01000f8:	c7 05 00 50 10 c0 ff 	movl   $0xffffffff,0xc0105000
c01000ff:	ff ff ff 
	return code;
c0100102:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0100105:	c9                   	leave  
c0100106:	c3                   	ret    

c0100107 <main>:

int main()
{
c0100107:	55                   	push   %ebp
c0100108:	89 e5                	mov    %esp,%ebp
c010010a:	83 e4 f0             	and    $0xfffffff0,%esp
c010010d:	83 ec 20             	sub    $0x20,%esp
	page_init();
c0100110:	e8 38 11 00 00       	call   c010124d <page_init>
	//printk("here");
	init_segment();
c0100115:	e8 c3 18 00 00       	call   c01019dd <init_segment>
	pcb_init();
c010011a:	e8 c9 0a 00 00       	call   c0100be8 <pcb_init>
	//printk("here");
	init_serial();
c010011f:	e8 82 08 00 00       	call   c01009a6 <init_serial>
	init_video();
c0100124:	e8 4b 07 00 00       	call   c0100874 <init_video>
	init_timer();
c0100129:	e8 6c 09 00 00       	call   c0100a9a <init_timer>
	init_idt();
c010012e:	e8 71 02 00 00       	call   c01003a4 <init_idt>
	init_intr();
c0100133:	e8 2f 00 00 00       	call   c0100167 <init_intr>
	set_timer_intr_handler(timer_event);
c0100138:	c7 04 24 c1 00 10 c0 	movl   $0xc01000c1,(%esp)
c010013f:	e8 7e 05 00 00       	call   c01006c2 <set_timer_intr_handler>
	set_keyboard_intr_handler(keyboard_event);
c0100144:	c7 04 24 d3 00 10 c0 	movl   $0xc01000d3,(%esp)
c010014b:	e8 7f 05 00 00       	call   c01006cf <set_keyboard_intr_handler>
	//printk("here");
	PCB* p=pcb_new();
c0100150:	e8 52 0e 00 00       	call   c0100fa7 <pcb_new>
c0100155:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	//printk("er are here");
	to_user(p);
c0100159:	8b 44 24 1c          	mov    0x1c(%esp),%eax
c010015d:	89 04 24             	mov    %eax,(%esp)
c0100160:	e8 38 19 00 00       	call   c0101a9d <to_user>
	while(1);
c0100165:	eb fe                	jmp    c0100165 <main+0x5e>

c0100167 <init_intr>:
#define IRQ_SLAVE	2

/* 初始�?259中断控制器：
 * 硬件中断IRQ�?2号开始，自动发送EOI */
void
init_intr(void) {
c0100167:	55                   	push   %ebp
c0100168:	89 e5                	mov    %esp,%ebp
c010016a:	83 ec 70             	sub    $0x70,%esp
c010016d:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
c0100174:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100178:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010017c:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010017f:	ee                   	out    %al,(%dx)
c0100180:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
c0100187:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
c010018b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c010018f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100192:	ee                   	out    %al,(%dx)
c0100193:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010019a:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
c010019e:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01001a2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01001a5:	ee                   	out    %al,(%dx)
c01001a6:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
c01001ad:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
c01001b1:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01001b5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01001b8:	ee                   	out    %al,(%dx)
c01001b9:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
c01001c0:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
c01001c4:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01001c8:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01001cb:	ee                   	out    %al,(%dx)
c01001cc:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
c01001d3:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
c01001d7:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01001db:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01001de:	ee                   	out    %al,(%dx)
c01001df:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
c01001e6:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
c01001ea:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c01001ee:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01001f1:	ee                   	out    %al,(%dx)
c01001f2:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
c01001f9:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
c01001fd:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0100201:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0100204:	ee                   	out    %al,(%dx)
c0100205:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
c010020c:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
c0100210:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0100214:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0100217:	ee                   	out    %al,(%dx)
c0100218:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
c010021f:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
c0100223:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
c0100227:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010022a:	ee                   	out    %al,(%dx)
c010022b:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
c0100232:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
c0100236:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
c010023a:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010023d:	ee                   	out    %al,(%dx)
c010023e:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
c0100245:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
c0100249:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
c010024d:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0100250:	ee                   	out    %al,(%dx)
c0100251:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
c0100258:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
c010025c:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
c0100260:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100263:	ee                   	out    %al,(%dx)
c0100264:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
c010026b:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
c010026f:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
c0100273:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0100276:	ee                   	out    %al,(%dx)
	outb(IO_PIC1, 0x68);             /* clear specific mask */
	outb(IO_PIC1, 0x0a);             /* read IRR by default */

	outb(IO_PIC2, 0x68);             /* OCW3 */
	outb(IO_PIC2, 0x0a);             /* OCW3 */
}
c0100277:	c9                   	leave  
c0100278:	c3                   	ret    

c0100279 <save_idt>:
	asm volatile("hlt");
}

/* 修改IDRT */
static inline void
save_idt(void *addr, uint32_t size) {
c0100279:	55                   	push   %ebp
c010027a:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c010027c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010027f:	83 e8 01             	sub    $0x1,%eax
c0100282:	66 a3 04 00 11 c0    	mov    %ax,0xc0110004
	data[1] = (uint32_t)addr;
c0100288:	8b 45 08             	mov    0x8(%ebp),%eax
c010028b:	66 a3 06 00 11 c0    	mov    %ax,0xc0110006
	data[2] = ((uint32_t)addr) >> 16;
c0100291:	8b 45 08             	mov    0x8(%ebp),%eax
c0100294:	c1 e8 10             	shr    $0x10,%eax
c0100297:	66 a3 08 00 11 c0    	mov    %ax,0xc0110008
	asm volatile("lidt (%0)" : : "r"(data));
c010029d:	b8 04 00 11 c0       	mov    $0xc0110004,%eax
c01002a2:	0f 01 18             	lidtl  (%eax)
}
c01002a5:	5d                   	pop    %ebp
c01002a6:	c3                   	ret    

c01002a7 <set_intr>:
/* IDT表的内容 */
struct Gatedesc idt[NR_IRQ];

/* 初始化一个中断门(interrupt gate) */
static void
set_intr(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c01002a7:	55                   	push   %ebp
c01002a8:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c01002aa:	8b 45 10             	mov    0x10(%ebp),%eax
c01002ad:	89 c2                	mov    %eax,%edx
c01002af:	8b 45 08             	mov    0x8(%ebp),%eax
c01002b2:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c01002b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01002b8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01002bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01002c2:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c01002c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01002c9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = INTERRUPT_GATE_32;
c01002cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01002d0:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01002d4:	83 e2 f0             	and    $0xfffffff0,%edx
c01002d7:	83 ca 0e             	or     $0xe,%edx
c01002da:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c01002dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01002e0:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c01002e4:	83 e2 ef             	and    $0xffffffef,%edx
c01002e7:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c01002ea:	8b 45 14             	mov    0x14(%ebp),%eax
c01002ed:	83 e0 03             	and    $0x3,%eax
c01002f0:	89 c2                	mov    %eax,%edx
c01002f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01002f5:	83 e2 03             	and    $0x3,%edx
c01002f8:	89 d1                	mov    %edx,%ecx
c01002fa:	c1 e1 05             	shl    $0x5,%ecx
c01002fd:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100301:	83 e2 9f             	and    $0xffffff9f,%edx
c0100304:	09 ca                	or     %ecx,%edx
c0100306:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c0100309:	8b 45 08             	mov    0x8(%ebp),%eax
c010030c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100310:	83 ca 80             	or     $0xffffff80,%edx
c0100313:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100316:	8b 45 10             	mov    0x10(%ebp),%eax
c0100319:	c1 e8 10             	shr    $0x10,%eax
c010031c:	89 c2                	mov    %eax,%edx
c010031e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100321:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c0100325:	5d                   	pop    %ebp
c0100326:	c3                   	ret    

c0100327 <set_trap>:

/* 初始化一个陷阱门(trap gate) */
static void
set_trap(struct Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
c0100327:	55                   	push   %ebp
c0100328:	89 e5                	mov    %esp,%ebp
	ptr->offset_15_0 = offset & 0xFFFF;
c010032a:	8b 45 10             	mov    0x10(%ebp),%eax
c010032d:	89 c2                	mov    %eax,%edx
c010032f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100332:	66 89 10             	mov    %dx,(%eax)
	ptr->segment = selector << 3;
c0100335:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100338:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010033f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100342:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->pad0 = 0;
c0100346:	8b 45 08             	mov    0x8(%ebp),%eax
c0100349:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = TRAP_GATE_32;
c010034d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100350:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100354:	83 ca 0f             	or     $0xf,%edx
c0100357:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->system = false;
c010035a:	8b 45 08             	mov    0x8(%ebp),%eax
c010035d:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0100361:	83 e2 ef             	and    $0xffffffef,%edx
c0100364:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = dpl;
c0100367:	8b 45 14             	mov    0x14(%ebp),%eax
c010036a:	83 e0 03             	and    $0x3,%eax
c010036d:	89 c2                	mov    %eax,%edx
c010036f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100372:	83 e2 03             	and    $0x3,%edx
c0100375:	89 d1                	mov    %edx,%ecx
c0100377:	c1 e1 05             	shl    $0x5,%ecx
c010037a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010037e:	83 e2 9f             	and    $0xffffff9f,%edx
c0100381:	09 ca                	or     %ecx,%edx
c0100383:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = true;
c0100386:	8b 45 08             	mov    0x8(%ebp),%eax
c0100389:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c010038d:	83 ca 80             	or     $0xffffff80,%edx
c0100390:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
c0100393:	8b 45 10             	mov    0x10(%ebp),%eax
c0100396:	c1 e8 10             	shr    $0x10,%eax
c0100399:	89 c2                	mov    %eax,%edx
c010039b:	8b 45 08             	mov    0x8(%ebp),%eax
c010039e:	66 89 50 06          	mov    %dx,0x6(%eax)
}
c01003a2:	5d                   	pop    %ebp
c01003a3:	c3                   	ret    

c01003a4 <init_idt>:
void vec13();
void vec14();
void vecsys();
void irq_empty();

void init_idt() {
c01003a4:	55                   	push   %ebp
c01003a5:	89 e5                	mov    %esp,%ebp
c01003a7:	83 ec 20             	sub    $0x20,%esp
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01003aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01003b1:	eb 31                	jmp    c01003e4 <init_idt+0x40>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
c01003b3:	b8 18 1d 10 c0       	mov    $0xc0101d18,%eax
c01003b8:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01003bb:	c1 e2 03             	shl    $0x3,%edx
c01003be:	81 c2 e0 2e 16 c0    	add    $0xc0162ee0,%edx
c01003c4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01003cb:	00 
c01003cc:	89 44 24 08          	mov    %eax,0x8(%esp)
c01003d0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01003d7:	00 
c01003d8:	89 14 24             	mov    %edx,(%esp)
c01003db:	e8 47 ff ff ff       	call   c0100327 <set_trap>
void irq_empty();

void init_idt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irq_empty)�?*/
	for (i = 0; i < NR_IRQ; i ++) {
c01003e0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01003e4:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
c01003eb:	7e c6                	jle    c01003b3 <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE, (uint32_t)irq_empty, DPL_KERNEL);
	}

	/* 设置异常的中断处�?*/
	set_trap(idt + 0, SEG_KERNEL_CODE, (uint32_t)vec0, DPL_KERNEL);
c01003ed:	b8 6d 1c 10 c0       	mov    $0xc0101c6d,%eax
c01003f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01003f9:	00 
c01003fa:	89 44 24 08          	mov    %eax,0x8(%esp)
c01003fe:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100405:	00 
c0100406:	c7 04 24 e0 2e 16 c0 	movl   $0xc0162ee0,(%esp)
c010040d:	e8 15 ff ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 1, SEG_KERNEL_CODE, (uint32_t)vec1, DPL_KERNEL);
c0100412:	b8 76 1c 10 c0       	mov    $0xc0101c76,%eax
c0100417:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010041e:	00 
c010041f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100423:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010042a:	00 
c010042b:	c7 04 24 e8 2e 16 c0 	movl   $0xc0162ee8,(%esp)
c0100432:	e8 f0 fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 2, SEG_KERNEL_CODE, (uint32_t)vec2, DPL_KERNEL);
c0100437:	b8 7f 1c 10 c0       	mov    $0xc0101c7f,%eax
c010043c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100443:	00 
c0100444:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100448:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010044f:	00 
c0100450:	c7 04 24 f0 2e 16 c0 	movl   $0xc0162ef0,(%esp)
c0100457:	e8 cb fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 3, SEG_KERNEL_CODE, (uint32_t)vec3, DPL_KERNEL);
c010045c:	b8 88 1c 10 c0       	mov    $0xc0101c88,%eax
c0100461:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100468:	00 
c0100469:	89 44 24 08          	mov    %eax,0x8(%esp)
c010046d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100474:	00 
c0100475:	c7 04 24 f8 2e 16 c0 	movl   $0xc0162ef8,(%esp)
c010047c:	e8 a6 fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 4, SEG_KERNEL_CODE, (uint32_t)vec4, DPL_KERNEL);
c0100481:	b8 91 1c 10 c0       	mov    $0xc0101c91,%eax
c0100486:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010048d:	00 
c010048e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100492:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100499:	00 
c010049a:	c7 04 24 00 2f 16 c0 	movl   $0xc0162f00,(%esp)
c01004a1:	e8 81 fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 5, SEG_KERNEL_CODE, (uint32_t)vec5, DPL_KERNEL);
c01004a6:	b8 9a 1c 10 c0       	mov    $0xc0101c9a,%eax
c01004ab:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004b2:	00 
c01004b3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004b7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004be:	00 
c01004bf:	c7 04 24 08 2f 16 c0 	movl   $0xc0162f08,(%esp)
c01004c6:	e8 5c fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 6, SEG_KERNEL_CODE, (uint32_t)vec6, DPL_KERNEL);
c01004cb:	b8 a3 1c 10 c0       	mov    $0xc0101ca3,%eax
c01004d0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004d7:	00 
c01004d8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01004dc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01004e3:	00 
c01004e4:	c7 04 24 10 2f 16 c0 	movl   $0xc0162f10,(%esp)
c01004eb:	e8 37 fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 7, SEG_KERNEL_CODE, (uint32_t)vec7, DPL_KERNEL);
c01004f0:	b8 ac 1c 10 c0       	mov    $0xc0101cac,%eax
c01004f5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01004fc:	00 
c01004fd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100501:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100508:	00 
c0100509:	c7 04 24 18 2f 16 c0 	movl   $0xc0162f18,(%esp)
c0100510:	e8 12 fe ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 8, SEG_KERNEL_CODE, (uint32_t)vec8, DPL_KERNEL);
c0100515:	b8 b5 1c 10 c0       	mov    $0xc0101cb5,%eax
c010051a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100521:	00 
c0100522:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100526:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010052d:	00 
c010052e:	c7 04 24 20 2f 16 c0 	movl   $0xc0162f20,(%esp)
c0100535:	e8 ed fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 9, SEG_KERNEL_CODE, (uint32_t)vec9, DPL_KERNEL);
c010053a:	b8 bc 1c 10 c0       	mov    $0xc0101cbc,%eax
c010053f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100546:	00 
c0100547:	89 44 24 08          	mov    %eax,0x8(%esp)
c010054b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100552:	00 
c0100553:	c7 04 24 28 2f 16 c0 	movl   $0xc0162f28,(%esp)
c010055a:	e8 c8 fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 10, SEG_KERNEL_CODE, (uint32_t)vec10, DPL_KERNEL);
c010055f:	b8 c5 1c 10 c0       	mov    $0xc0101cc5,%eax
c0100564:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010056b:	00 
c010056c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100570:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100577:	00 
c0100578:	c7 04 24 30 2f 16 c0 	movl   $0xc0162f30,(%esp)
c010057f:	e8 a3 fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 11, SEG_KERNEL_CODE, (uint32_t)vec11, DPL_KERNEL);
c0100584:	b8 cc 1c 10 c0       	mov    $0xc0101ccc,%eax
c0100589:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100590:	00 
c0100591:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100595:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010059c:	00 
c010059d:	c7 04 24 38 2f 16 c0 	movl   $0xc0162f38,(%esp)
c01005a4:	e8 7e fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 12, SEG_KERNEL_CODE, (uint32_t)vec12, DPL_KERNEL);
c01005a9:	b8 d3 1c 10 c0       	mov    $0xc0101cd3,%eax
c01005ae:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005b5:	00 
c01005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005ba:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005c1:	00 
c01005c2:	c7 04 24 40 2f 16 c0 	movl   $0xc0162f40,(%esp)
c01005c9:	e8 59 fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 13, SEG_KERNEL_CODE, (uint32_t)vec13, DPL_KERNEL);
c01005ce:	b8 da 1c 10 c0       	mov    $0xc0101cda,%eax
c01005d3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005da:	00 
c01005db:	89 44 24 08          	mov    %eax,0x8(%esp)
c01005df:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01005e6:	00 
c01005e7:	c7 04 24 48 2f 16 c0 	movl   $0xc0162f48,(%esp)
c01005ee:	e8 34 fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 14, SEG_KERNEL_CODE, (uint32_t)vec14, DPL_KERNEL);
c01005f3:	b8 e1 1c 10 c0       	mov    $0xc0101ce1,%eax
c01005f8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01005ff:	00 
c0100600:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100604:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010060b:	00 
c010060c:	c7 04 24 50 2f 16 c0 	movl   $0xc0162f50,(%esp)
c0100613:	e8 0f fd ff ff       	call   c0100327 <set_trap>
	set_trap(idt + 0x80, SEG_KERNEL_CODE, (uint32_t)vecsys, DPL_USER);
c0100618:	b8 e8 1c 10 c0       	mov    $0xc0101ce8,%eax
c010061d:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
c0100624:	00 
c0100625:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100629:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100630:	00 
c0100631:	c7 04 24 e0 32 16 c0 	movl   $0xc01632e0,(%esp)
c0100638:	e8 ea fc ff ff       	call   c0100327 <set_trap>

	/* 设置外部中断的处�?*/
	set_intr(idt + 32, SEG_KERNEL_CODE, (uint32_t)irq0, DPL_KERNEL);
c010063d:	b8 f4 1c 10 c0       	mov    $0xc0101cf4,%eax
c0100642:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100649:	00 
c010064a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010064e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100655:	00 
c0100656:	c7 04 24 e0 2f 16 c0 	movl   $0xc0162fe0,(%esp)
c010065d:	e8 45 fc ff ff       	call   c01002a7 <set_intr>
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE, (uint32_t)irq1, DPL_KERNEL);
c0100662:	b8 00 1d 10 c0       	mov    $0xc0101d00,%eax
c0100667:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010066e:	00 
c010066f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100673:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010067a:	00 
c010067b:	c7 04 24 e8 2f 16 c0 	movl   $0xc0162fe8,(%esp)
c0100682:	e8 20 fc ff ff       	call   c01002a7 <set_intr>
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE, (uint32_t)irq14, DPL_KERNEL);
c0100687:	b8 0c 1d 10 c0       	mov    $0xc0101d0c,%eax
c010068c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0100693:	00 
c0100694:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100698:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010069f:	00 
c01006a0:	c7 04 24 50 30 16 c0 	movl   $0xc0163050,(%esp)
c01006a7:	e8 fb fb ff ff       	call   c01002a7 <set_intr>
	 * x86.h提供了相关内联汇编的支持
	 * 然后将hlt()删除
	 * 
	 * */
	
	save_idt(idt, sizeof(idt));
c01006ac:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
c01006b3:	00 
c01006b4:	c7 04 24 e0 2e 16 c0 	movl   $0xc0162ee0,(%esp)
c01006bb:	e8 b9 fb ff ff       	call   c0100279 <save_idt>
}
c01006c0:	c9                   	leave  
c01006c1:	c3                   	ret    

c01006c2 <set_timer_intr_handler>:

static void (*do_timer)(void);
static void (*do_keyboard)(int);

void
set_timer_intr_handler( void (*ptr)(void) ) {
c01006c2:	55                   	push   %ebp
c01006c3:	89 e5                	mov    %esp,%ebp
	do_timer = ptr;
c01006c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01006c8:	a3 0c 00 11 c0       	mov    %eax,0xc011000c
}
c01006cd:	5d                   	pop    %ebp
c01006ce:	c3                   	ret    

c01006cf <set_keyboard_intr_handler>:
void
set_keyboard_intr_handler( void (*ptr)(int) ) {
c01006cf:	55                   	push   %ebp
c01006d0:	89 e5                	mov    %esp,%ebp
	do_keyboard = ptr;
c01006d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01006d5:	a3 10 00 11 c0       	mov    %eax,0xc0110010
}
c01006da:	5d                   	pop    %ebp
c01006db:	c3                   	ret    

c01006dc <irq_handle>:

/* TrapFrame的定义在include/memory.h
 * 请仔细理解这段程序的含义，这些内容将在后续的实验中被反复使用�?*/
void
irq_handle(struct TrapFrame *tf) {
c01006dc:	55                   	push   %ebp
c01006dd:	89 e5                	mov    %esp,%ebp
c01006df:	83 ec 48             	sub    $0x48,%esp
	if (tf->irq == 0x80) {
c01006e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01006e5:	8b 40 30             	mov    0x30(%eax),%eax
c01006e8:	3d 80 00 00 00       	cmp    $0x80,%eax
c01006ed:	75 10                	jne    c01006ff <irq_handle+0x23>
		do_syscall(tf);
c01006ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01006f2:	89 04 24             	mov    %eax,(%esp)
c01006f5:	e8 06 f9 ff ff       	call   c0100000 <do_syscall>
c01006fa:	e9 73 01 00 00       	jmp    c0100872 <irq_handle+0x196>
	}
	else if(tf->irq < 1000) {
c01006ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0100702:	8b 40 30             	mov    0x30(%eax),%eax
c0100705:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c010070a:	7f 73                	jg     c010077f <irq_handle+0xa3>
		if(tf->irq == -1) {
c010070c:	8b 45 08             	mov    0x8(%ebp),%eax
c010070f:	8b 40 30             	mov    0x30(%eax),%eax
c0100712:	83 f8 ff             	cmp    $0xffffffff,%eax
c0100715:	75 1e                	jne    c0100735 <irq_handle+0x59>
			printk("%s, %d: Unhandled exception!\n", __FUNCTION__, __LINE__);
c0100717:	c7 44 24 08 1b 00 00 	movl   $0x1b,0x8(%esp)
c010071e:	00 
c010071f:	c7 44 24 04 46 2e 10 	movl   $0xc0102e46,0x4(%esp)
c0100726:	c0 
c0100727:	c7 04 24 d4 2d 10 c0 	movl   $0xc0102dd4,(%esp)
c010072e:	e8 14 15 00 00       	call   c0101c47 <printk>
c0100733:	eb 26                	jmp    c010075b <irq_handle+0x7f>
		}
		else {
			printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100735:	8b 45 08             	mov    0x8(%ebp),%eax
c0100738:	8b 40 30             	mov    0x30(%eax),%eax
c010073b:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010073f:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
c0100746:	00 
c0100747:	c7 44 24 04 46 2e 10 	movl   $0xc0102e46,0x4(%esp)
c010074e:	c0 
c010074f:	c7 04 24 f4 2d 10 c0 	movl   $0xc0102df4,(%esp)
c0100756:	e8 ec 14 00 00       	call   c0101c47 <printk>
		}
		assert(0);
c010075b:	c7 44 24 0c 17 2e 10 	movl   $0xc0102e17,0xc(%esp)
c0100762:	c0 
c0100763:	c7 44 24 08 19 2e 10 	movl   $0xc0102e19,0x8(%esp)
c010076a:	c0 
c010076b:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c0100772:	00 
c0100773:	c7 04 24 2e 2e 10 c0 	movl   $0xc0102e2e,(%esp)
c010077a:	e8 99 13 00 00       	call   c0101b18 <_panic>
	}

	else if (tf->irq == 1000) {
c010077f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100782:	8b 40 30             	mov    0x30(%eax),%eax
c0100785:	3d e8 03 00 00       	cmp    $0x3e8,%eax
c010078a:	75 0c                	jne    c0100798 <irq_handle+0xbc>
		do_timer();
c010078c:	a1 0c 00 11 c0       	mov    0xc011000c,%eax
c0100791:	ff d0                	call   *%eax
c0100793:	e9 da 00 00 00       	jmp    c0100872 <irq_handle+0x196>
	} else if (tf->irq == 1001) {
c0100798:	8b 45 08             	mov    0x8(%ebp),%eax
c010079b:	8b 40 30             	mov    0x30(%eax),%eax
c010079e:	3d e9 03 00 00       	cmp    $0x3e9,%eax
c01007a3:	75 76                	jne    c010081b <irq_handle+0x13f>
c01007a5:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01007ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01007af:	89 c2                	mov    %eax,%edx
c01007b1:	ec                   	in     (%dx),%al
c01007b2:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
c01007b5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
		uint32_t code = inb(0x60);
c01007b9:	0f b6 c0             	movzbl %al,%eax
c01007bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007bf:	c7 45 e4 61 00 00 00 	movl   $0x61,-0x1c(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c01007c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01007c9:	89 c2                	mov    %eax,%edx
c01007cb:	ec                   	in     (%dx),%al
c01007cc:	88 45 e3             	mov    %al,-0x1d(%ebp)
	return data;
c01007cf:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
		uint32_t val = inb(0x61);
c01007d3:	0f b6 c0             	movzbl %al,%eax
c01007d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
		outb(0x61, val | 0x80);
c01007d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01007dc:	83 c8 80             	or     $0xffffff80,%eax
c01007df:	0f b6 c0             	movzbl %al,%eax
c01007e2:	c7 45 dc 61 00 00 00 	movl   $0x61,-0x24(%ebp)
c01007e9:	88 45 db             	mov    %al,-0x25(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c01007ec:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01007f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01007f3:	ee                   	out    %al,(%dx)
		outb(0x61, val);
c01007f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01007f7:	0f b6 c0             	movzbl %al,%eax
c01007fa:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%ebp)
c0100801:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0100804:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100808:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010080b:	ee                   	out    %al,(%dx)

		//printk("%s, %d: key code = %x\n", __FUNCTION__, __LINE__, code);
		do_keyboard(code);
c010080c:	a1 10 00 11 c0       	mov    0xc0110010,%eax
c0100811:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100814:	89 14 24             	mov    %edx,(%esp)
c0100817:	ff d0                	call   *%eax
c0100819:	eb 57                	jmp    c0100872 <irq_handle+0x196>
	}else if(tf->irq==1014){
c010081b:	8b 45 08             	mov    0x8(%ebp),%eax
c010081e:	8b 40 30             	mov    0x30(%eax),%eax
c0100821:	3d f6 03 00 00       	cmp    $0x3f6,%eax
c0100826:	74 4a                	je     c0100872 <irq_handle+0x196>
	
	} 
	else {
		printk("%s, %d: Unexpected exception #%d!\n", __FUNCTION__, __LINE__, tf->irq);
c0100828:	8b 45 08             	mov    0x8(%ebp),%eax
c010082b:	8b 40 30             	mov    0x30(%eax),%eax
c010082e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100832:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c0100839:	00 
c010083a:	c7 44 24 04 46 2e 10 	movl   $0xc0102e46,0x4(%esp)
c0100841:	c0 
c0100842:	c7 04 24 f4 2d 10 c0 	movl   $0xc0102df4,(%esp)
c0100849:	e8 f9 13 00 00       	call   c0101c47 <printk>
		assert(0);
c010084e:	c7 44 24 0c 17 2e 10 	movl   $0xc0102e17,0xc(%esp)
c0100855:	c0 
c0100856:	c7 44 24 08 19 2e 10 	movl   $0xc0102e19,0x8(%esp)
c010085d:	c0 
c010085e:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
c0100865:	00 
c0100866:	c7 04 24 2e 2e 10 c0 	movl   $0xc0102e2e,(%esp)
c010086d:	e8 a6 12 00 00       	call   c0101b18 <_panic>
	}
}
c0100872:	c9                   	leave  
c0100873:	c3                   	ret    

c0100874 <init_video>:
#ifdef PARTIAL_UPDATE
static uint8_t vref[SCR_SIZE];
#endif

void init_video(void)
{
c0100874:	55                   	push   %ebp
c0100875:	89 e5                	mov    %esp,%ebp
c0100877:	83 ec 18             	sub    $0x18,%esp
	memset(vbuf, 0, SCR_SIZE);
c010087a:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0100881:	00 
c0100882:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100889:	00 
c010088a:	c7 04 24 20 00 11 c0 	movl   $0xc0110020,(%esp)
c0100891:	e8 31 17 00 00       	call   c0101fc7 <memset>
	memset(vref, 0, SCR_SIZE);
c0100896:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c010089d:	00 
c010089e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008a5:	00 
c01008a6:	c7 04 24 20 fa 11 c0 	movl   $0xc011fa20,(%esp)
c01008ad:	e8 15 17 00 00       	call   c0101fc7 <memset>
}
c01008b2:	c9                   	leave  
c01008b3:	c3                   	ret    

c01008b4 <prepare_buffer>:

void prepare_buffer(void) {
c01008b4:	55                   	push   %ebp
c01008b5:	89 e5                	mov    %esp,%ebp
c01008b7:	83 ec 18             	sub    $0x18,%esp
#ifdef PARTIAL_UPDATE
	memcpy(vref, vbuf, SCR_SIZE);
c01008ba:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008c1:	00 
c01008c2:	c7 44 24 04 20 00 11 	movl   $0xc0110020,0x4(%esp)
c01008c9:	c0 
c01008ca:	c7 04 24 20 fa 11 c0 	movl   $0xc011fa20,(%esp)
c01008d1:	e8 d4 16 00 00       	call   c0101faa <memcpy>
#endif
	vmem = vbuf;
c01008d6:	c7 05 04 50 10 c0 20 	movl   $0xc0110020,0xc0105004
c01008dd:	00 11 c0 
	memset(vmem, 0, SCR_SIZE);
c01008e0:	a1 04 50 10 c0       	mov    0xc0105004,%eax
c01008e5:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c01008ec:	00 
c01008ed:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01008f4:	00 
c01008f5:	89 04 24             	mov    %eax,(%esp)
c01008f8:	e8 ca 16 00 00       	call   c0101fc7 <memset>
}
c01008fd:	c9                   	leave  
c01008fe:	c3                   	ret    

c01008ff <display_buffer>:

void display_buffer(void) {
c01008ff:	55                   	push   %ebp
c0100900:	89 e5                	mov    %esp,%ebp
c0100902:	83 ec 10             	sub    $0x10,%esp
#ifdef PARTIAL_UPDATE
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
c0100905:	c7 45 f8 20 00 11 c0 	movl   $0xc0110020,-0x8(%ebp)
	uint32_t *ref = (uint32_t*)vref;
c010090c:	c7 45 f4 20 fa 11 c0 	movl   $0xc011fa20,-0xc(%ebp)
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
c0100913:	c7 45 f0 00 00 0a 00 	movl   $0xa0000,-0x10(%ebp)
	vmem = VMEM_ADDR;
c010091a:	c7 05 04 50 10 c0 00 	movl   $0xa0000,0xc0105004
c0100921:	00 0a 00 
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100924:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010092b:	eb 4c                	jmp    c0100979 <display_buffer+0x7a>
		if (buf[i] != ref[i]) {
c010092d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100930:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100937:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010093a:	01 d0                	add    %edx,%eax
c010093c:	8b 10                	mov    (%eax),%edx
c010093e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100941:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0100948:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010094b:	01 c8                	add    %ecx,%eax
c010094d:	8b 00                	mov    (%eax),%eax
c010094f:	39 c2                	cmp    %eax,%edx
c0100951:	74 22                	je     c0100975 <display_buffer+0x76>
			mem[i] = buf[i];
c0100953:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100956:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010095d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100960:	01 c2                	add    %eax,%edx
c0100962:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100965:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c010096c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010096f:	01 c8                	add    %ecx,%eax
c0100971:	8b 00                	mov    (%eax),%eax
c0100973:	89 02                	mov    %eax,(%edx)
	int i;
	uint32_t *buf = (uint32_t*)vbuf;
	uint32_t *ref = (uint32_t*)vref;
	uint32_t *mem = (uint32_t*)VMEM_ADDR;
	vmem = VMEM_ADDR;
	for (i = 0; i < SCR_SIZE / 4; i ++) {
c0100975:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100979:	81 7d fc 7f 3e 00 00 	cmpl   $0x3e7f,-0x4(%ebp)
c0100980:	7e ab                	jle    c010092d <display_buffer+0x2e>
	}
#else
	vmem = VMEM_ADDR;
	asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(vbuf), "D"(vmem));
#endif
}
c0100982:	c9                   	leave  
c0100983:	c3                   	ret    

c0100984 <sys_pr>:

void sys_pr(void *src)
{
c0100984:	55                   	push   %ebp
c0100985:	89 e5                	mov    %esp,%ebp
c0100987:	57                   	push   %edi
c0100988:	56                   	push   %esi
c0100989:	53                   	push   %ebx
    asm volatile ("cld; rep movsl" : : "c"(SCR_SIZE / 4), "S"(src), "D"(vmem));
c010098a:	8b 1d 04 50 10 c0    	mov    0xc0105004,%ebx
c0100990:	b8 80 3e 00 00       	mov    $0x3e80,%eax
c0100995:	8b 55 08             	mov    0x8(%ebp),%edx
c0100998:	89 c1                	mov    %eax,%ecx
c010099a:	89 d6                	mov    %edx,%esi
c010099c:	89 df                	mov    %ebx,%edi
c010099e:	fc                   	cld    
c010099f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
}
c01009a1:	5b                   	pop    %ebx
c01009a2:	5e                   	pop    %esi
c01009a3:	5f                   	pop    %edi
c01009a4:	5d                   	pop    %ebp
c01009a5:	c3                   	ret    

c01009a6 <init_serial>:
#include "x86.h"

#define SERIAL_PORT  0x3F8

void init_serial(void) {
c01009a6:	55                   	push   %ebp
c01009a7:	89 e5                	mov    %esp,%ebp
c01009a9:	83 ec 40             	sub    $0x40,%esp
c01009ac:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
c01009b3:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
c01009b7:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01009bb:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01009be:	ee                   	out    %al,(%dx)
c01009bf:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
c01009c6:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
c01009ca:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c01009ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01009d1:	ee                   	out    %al,(%dx)
c01009d2:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
c01009d9:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c01009dd:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01009e1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01009e4:	ee                   	out    %al,(%dx)
c01009e5:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
c01009ec:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
c01009f0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01009f4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01009f7:	ee                   	out    %al,(%dx)
c01009f8:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
c01009ff:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
c0100a03:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100a07:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100a0a:	ee                   	out    %al,(%dx)
c0100a0b:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
c0100a12:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
c0100a16:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100a1a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100a1d:	ee                   	out    %al,(%dx)
c0100a1e:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
c0100a25:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
c0100a29:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100a2d:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100a30:	ee                   	out    %al,(%dx)
	outb(SERIAL_PORT + 0, 0x01);
	outb(SERIAL_PORT + 1, 0x00);
	outb(SERIAL_PORT + 3, 0x03);
	outb(SERIAL_PORT + 2, 0xC7);
	outb(SERIAL_PORT + 4, 0x0B);
}
c0100a31:	c9                   	leave  
c0100a32:	c3                   	ret    

c0100a33 <serial_idle>:

static inline int serial_idle(void) {
c0100a33:	55                   	push   %ebp
c0100a34:	89 e5                	mov    %esp,%ebp
c0100a36:	83 ec 10             	sub    $0x10,%esp
c0100a39:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100a43:	89 c2                	mov    %eax,%edx
c0100a45:	ec                   	in     (%dx),%al
c0100a46:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
c0100a49:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return (inb(SERIAL_PORT + 5) & 0x20) != 0;
c0100a4d:	0f b6 c0             	movzbl %al,%eax
c0100a50:	83 e0 20             	and    $0x20,%eax
c0100a53:	85 c0                	test   %eax,%eax
c0100a55:	0f 95 c0             	setne  %al
c0100a58:	0f b6 c0             	movzbl %al,%eax
}
c0100a5b:	c9                   	leave  
c0100a5c:	c3                   	ret    

c0100a5d <serial_printc>:

void serial_printc(int ch) {
c0100a5d:	55                   	push   %ebp
c0100a5e:	89 e5                	mov    %esp,%ebp
c0100a60:	83 ec 10             	sub    $0x10,%esp
	while (!serial_idle());
c0100a63:	90                   	nop
c0100a64:	e8 ca ff ff ff       	call   c0100a33 <serial_idle>
c0100a69:	85 c0                	test   %eax,%eax
c0100a6b:	74 f7                	je     c0100a64 <serial_printc+0x7>
	outb(SERIAL_PORT, ch);
c0100a6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a70:	0f b6 c0             	movzbl %al,%eax
c0100a73:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
c0100a7a:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100a7d:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0100a81:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100a84:	ee                   	out    %al,(%dx)
}
c0100a85:	c9                   	leave  
c0100a86:	c3                   	ret    

c0100a87 <putchar>:

void putchar(int ch){
c0100a87:	55                   	push   %ebp
c0100a88:	89 e5                	mov    %esp,%ebp
c0100a8a:	83 ec 04             	sub    $0x4,%esp
	serial_printc(ch);
c0100a8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a90:	89 04 24             	mov    %eax,(%esp)
c0100a93:	e8 c5 ff ff ff       	call   c0100a5d <serial_printc>
c0100a98:	c9                   	leave  
c0100a99:	c3                   	ret    

c0100a9a <init_timer>:
/* 8253输入频率�?.193182MHz */
#define TIMER_PORT 0x40
#define FREQ_8253 1193182

void
init_timer(void) {
c0100a9a:	55                   	push   %ebp
c0100a9b:	89 e5                	mov    %esp,%ebp
c0100a9d:	83 ec 38             	sub    $0x38,%esp
	int counter = FREQ_8253 / HZ;
c0100aa0:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
	assert(counter < 65536);
c0100aa7:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
c0100aae:	7e 24                	jle    c0100ad4 <init_timer+0x3a>
c0100ab0:	c7 44 24 0c 51 2e 10 	movl   $0xc0102e51,0xc(%esp)
c0100ab7:	c0 
c0100ab8:	c7 44 24 08 61 2e 10 	movl   $0xc0102e61,0x8(%esp)
c0100abf:	c0 
c0100ac0:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0100ac7:	00 
c0100ac8:	c7 04 24 76 2e 10 c0 	movl   $0xc0102e76,(%esp)
c0100acf:	e8 44 10 00 00       	call   c0101b18 <_panic>
c0100ad4:	c7 45 f0 43 00 00 00 	movl   $0x43,-0x10(%ebp)
c0100adb:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
c0100adf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0100ae3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100ae6:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 3, 0x34);
	outb(TIMER_PORT + 0, counter % 256);
c0100ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100aea:	99                   	cltd   
c0100aeb:	c1 ea 18             	shr    $0x18,%edx
c0100aee:	01 d0                	add    %edx,%eax
c0100af0:	0f b6 c0             	movzbl %al,%eax
c0100af3:	29 d0                	sub    %edx,%eax
c0100af5:	0f b6 c0             	movzbl %al,%eax
c0100af8:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
c0100aff:	88 45 e7             	mov    %al,-0x19(%ebp)
c0100b02:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0100b06:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100b09:	ee                   	out    %al,(%dx)
	outb(TIMER_PORT + 0, counter / 256);
c0100b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b0d:	99                   	cltd   
c0100b0e:	c1 ea 18             	shr    $0x18,%edx
c0100b11:	01 d0                	add    %edx,%eax
c0100b13:	c1 f8 08             	sar    $0x8,%eax
c0100b16:	0f b6 c0             	movzbl %al,%eax
c0100b19:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c0100b20:	88 45 df             	mov    %al,-0x21(%ebp)
c0100b23:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c0100b27:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100b2a:	ee                   	out    %al,(%dx)
}
c0100b2b:	c9                   	leave  
c0100b2c:	c3                   	ret    

c0100b2d <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0100b2d:	55                   	push   %ebp
c0100b2e:	89 e5                	mov    %esp,%ebp
c0100b30:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0100b33:	8b 45 10             	mov    0x10(%ebp),%eax
c0100b36:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0100b3b:	77 21                	ja     c0100b5e <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0100b3d:	8b 45 10             	mov    0x10(%ebp),%eax
c0100b40:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100b44:	c7 44 24 08 8c 2e 10 	movl   $0xc0102e8c,0x8(%esp)
c0100b4b:	c0 
c0100b4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b4f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100b53:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b56:	89 04 24             	mov    %eax,(%esp)
c0100b59:	e8 ba 0f 00 00       	call   c0101b18 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0100b5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100b61:	05 00 00 00 40       	add    $0x40000000,%eax
}
c0100b66:	c9                   	leave  
c0100b67:	c3                   	ret    

c0100b68 <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c0100b68:	55                   	push   %ebp
c0100b69:	89 e5                	mov    %esp,%ebp
c0100b6b:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0100b6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100b71:	c1 e8 0c             	shr    $0xc,%eax
c0100b74:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c0100b79:	76 21                	jbe    c0100b9c <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c0100b7b:	8b 45 10             	mov    0x10(%ebp),%eax
c0100b7e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100b82:	c7 44 24 08 b0 2e 10 	movl   $0xc0102eb0,0x8(%esp)
c0100b89:	c0 
c0100b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b8d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100b91:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b94:	89 04 24             	mov    %eax,(%esp)
c0100b97:	e8 7c 0f 00 00       	call   c0101b18 <_panic>
	return (void *)(pa + KERNBASE);
c0100b9c:	8b 45 10             	mov    0x10(%ebp),%eax
c0100b9f:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c0100ba4:	c9                   	leave  
c0100ba5:	c3                   	ret    

c0100ba6 <page2pa>:

void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c0100ba6:	55                   	push   %ebp
c0100ba7:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c0100ba9:	8b 55 08             	mov    0x8(%ebp),%edx
c0100bac:	b8 a0 3a 16 c0       	mov    $0xc0163aa0,%eax
c0100bb1:	29 c2                	sub    %eax,%edx
c0100bb3:	89 d0                	mov    %edx,%eax
c0100bb5:	c1 f8 03             	sar    $0x3,%eax
c0100bb8:	c1 e0 0c             	shl    $0xc,%eax
}
c0100bbb:	5d                   	pop    %ebp
c0100bbc:	c3                   	ret    

c0100bbd <page2kva>:
	return &pages[PGNUM(pa)];
}

static inline void*
page2kva(struct Page *pp)
{
c0100bbd:	55                   	push   %ebp
c0100bbe:	89 e5                	mov    %esp,%ebp
c0100bc0:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0100bc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bc6:	89 04 24             	mov    %eax,(%esp)
c0100bc9:	e8 d8 ff ff ff       	call   c0100ba6 <page2pa>
c0100bce:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100bd2:	c7 44 24 04 4f 00 00 	movl   $0x4f,0x4(%esp)
c0100bd9:	00 
c0100bda:	c7 04 24 d3 2e 10 c0 	movl   $0xc0102ed3,(%esp)
c0100be1:	e8 82 ff ff ff       	call   c0100b68 <_kaddr>
}
c0100be6:	c9                   	leave  
c0100be7:	c3                   	ret    

c0100be8 <pcb_init>:
#define SECT_SIZE 512
#define GAME_OFFSET (400 * SECT_SIZE)
static uint8_t elfs[4096];

void pcb_init()
{
c0100be8:	55                   	push   %ebp
c0100be9:	89 e5                	mov    %esp,%ebp
c0100beb:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < MAXN_PCB; i++) {
c0100bee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0100bf5:	eb 27                	jmp    c0100c1e <pcb_init+0x36>
		pcb[i].pcbo = pcb_free_list;
c0100bf7:	a1 00 37 16 c0       	mov    0xc0163700,%eax
c0100bfc:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100bff:	6b d2 54             	imul   $0x54,%edx,%edx
c0100c02:	81 c2 70 37 16 c0    	add    $0xc0163770,%edx
c0100c08:	89 02                	mov    %eax,(%edx)
		pcb_free_list = &pcb[i];
c0100c0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100c0d:	6b c0 54             	imul   $0x54,%eax,%eax
c0100c10:	05 20 37 16 c0       	add    $0xc0163720,%eax
c0100c15:	a3 00 37 16 c0       	mov    %eax,0xc0163700
static uint8_t elfs[4096];

void pcb_init()
{
	int i;
	for (i = 0; i < MAXN_PCB; i++) {
c0100c1a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0100c1e:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
c0100c22:	7e d3                	jle    c0100bf7 <pcb_init+0xf>
		pcb[i].pcbo = pcb_free_list;
		pcb_free_list = &pcb[i];
	}
}
c0100c24:	c9                   	leave  
c0100c25:	c3                   	ret    

c0100c26 <pcb_alloc>:
PCB* pcb_alloc()
{
c0100c26:	55                   	push   %ebp
c0100c27:	89 e5                	mov    %esp,%ebp
c0100c29:	53                   	push   %ebx
c0100c2a:	83 ec 24             	sub    $0x24,%esp
	PCB *p = pcb_free_list;
c0100c2d:	a1 00 37 16 c0       	mov    0xc0163700,%eax
c0100c32:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0100c35:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100c39:	75 0a                	jne    c0100c45 <pcb_alloc+0x1f>
c0100c3b:	b8 00 00 00 00       	mov    $0x0,%eax
c0100c40:	e9 f5 00 00 00       	jmp    c0100d3a <pcb_alloc+0x114>
	struct Page *pp = page_alloc(ALLOC_ZERO);
c0100c45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0100c4c:	e8 c1 07 00 00       	call   c0101412 <page_alloc>
c0100c51:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pp == NULL) return NULL;
c0100c54:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100c58:	75 0a                	jne    c0100c64 <pcb_alloc+0x3e>
c0100c5a:	b8 00 00 00 00       	mov    $0x0,%eax
c0100c5f:	e9 d6 00 00 00       	jmp    c0100d3a <pcb_alloc+0x114>
	p->pgdir = page2kva(pp);
c0100c64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c67:	89 04 24             	mov    %eax,(%esp)
c0100c6a:	e8 4e ff ff ff       	call   c0100bbd <page2kva>
c0100c6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c72:	89 42 4c             	mov    %eax,0x4c(%edx)
	pp->pp_ref ++;
c0100c75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c78:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0100c7c:	8d 50 01             	lea    0x1(%eax),%edx
c0100c7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c82:	66 89 50 04          	mov    %dx,0x4(%eax)
	memcpy(p->pgdir, kern_pgdir, PGSIZE);
c0100c86:	8b 15 80 3a 16 c0    	mov    0xc0163a80,%edx
c0100c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c8f:	8b 40 4c             	mov    0x4c(%eax),%eax
c0100c92:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100c99:	00 
c0100c9a:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100c9e:	89 04 24             	mov    %eax,(%esp)
c0100ca1:	e8 04 13 00 00       	call   c0101faa <memcpy>
	p->pgdir[PDX(UVPT)] = PADDR(p->pgdir) | PTE_P | PTE_U;
c0100ca6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ca9:	8b 40 4c             	mov    0x4c(%eax),%eax
c0100cac:	8d 98 f8 0b 00 00    	lea    0xbf8(%eax),%ebx
c0100cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cb5:	8b 40 4c             	mov    0x4c(%eax),%eax
c0100cb8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100cbc:	c7 44 24 04 22 00 00 	movl   $0x22,0x4(%esp)
c0100cc3:	00 
c0100cc4:	c7 04 24 e9 2e 10 c0 	movl   $0xc0102ee9,(%esp)
c0100ccb:	e8 5d fe ff ff       	call   c0100b2d <_paddr>
c0100cd0:	83 c8 05             	or     $0x5,%eax
c0100cd3:	89 03                	mov    %eax,(%ebx)
	memset(&p->tf, 0, sizeof(p->tf));
c0100cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cd8:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
c0100cdf:	00 
c0100ce0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100ce7:	00 
c0100ce8:	89 04 24             	mov    %eax,(%esp)
c0100ceb:	e8 d7 12 00 00       	call   c0101fc7 <memset>
	p->tf.ds = GD_UD | 3;
c0100cf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cf3:	c7 40 2c 23 00 00 00 	movl   $0x23,0x2c(%eax)
	p->tf.es = GD_UD | 3;
c0100cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cfd:	c7 40 28 23 00 00 00 	movl   $0x23,0x28(%eax)
	p->tf.ss = GD_UD | 3;
c0100d04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d07:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	p->tf.esp = USTACKTOP;
c0100d0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d10:	c7 40 44 00 e0 ff be 	movl   $0xbeffe000,0x44(%eax)
	p->tf.cs = GD_UT | 3;
c0100d17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d1a:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	p->tf.eflags = 0x2 | FL_IF;
c0100d20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d23:	c7 40 40 02 02 00 00 	movl   $0x202,0x40(%eax)
	pcb_free_list = pcb_free_list->pcbo;
c0100d2a:	a1 00 37 16 c0       	mov    0xc0163700,%eax
c0100d2f:	8b 40 50             	mov    0x50(%eax),%eax
c0100d32:	a3 00 37 16 c0       	mov    %eax,0xc0163700
	return p;
c0100d37:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0100d3a:	83 c4 24             	add    $0x24,%esp
c0100d3d:	5b                   	pop    %ebx
c0100d3e:	5d                   	pop    %ebp
c0100d3f:	c3                   	ret    

c0100d40 <mm_malloc>:

void mm_malloc(pde_t *pgdir, uint32_t va, size_t len)
{
c0100d40:	55                   	push   %ebp
c0100d41:	89 e5                	mov    %esp,%ebp
c0100d43:	83 ec 38             	sub    $0x38,%esp
	struct PageInfo *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
c0100d46:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d49:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100d4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100d4f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d54:	89 45 ec             	mov    %eax,-0x14(%ebp)
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
c0100d57:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%ebp)
c0100d5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0100d61:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100d64:	01 c2                	add    %eax,%edx
c0100d66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100d69:	01 d0                	add    %edx,%eax
c0100d6b:	83 e8 01             	sub    $0x1,%eax
c0100d6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100d71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100d74:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d79:	f7 75 e8             	divl   -0x18(%ebp)
c0100d7c:	89 d0                	mov    %edx,%eax
c0100d7e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100d81:	29 c2                	sub    %eax,%edx
c0100d83:	89 d0                	mov    %edx,%eax
c0100d85:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int i;

	for (i = va_start; i < va_end; i += PGSIZE) {
c0100d88:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100d8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100d8e:	eb 61                	jmp    c0100df1 <mm_malloc+0xb1>
		p = page_alloc(0);
c0100d90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0100d97:	e8 76 06 00 00       	call   c0101412 <page_alloc>
c0100d9c:	89 45 dc             	mov    %eax,-0x24(%ebp)
		assert(p != NULL);
c0100d9f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0100da3:	75 24                	jne    c0100dc9 <mm_malloc+0x89>
c0100da5:	c7 44 24 0c fc 2e 10 	movl   $0xc0102efc,0xc(%esp)
c0100dac:	c0 
c0100dad:	c7 44 24 08 06 2f 10 	movl   $0xc0102f06,0x8(%esp)
c0100db4:	c0 
c0100db5:	c7 44 24 04 37 00 00 	movl   $0x37,0x4(%esp)
c0100dbc:	00 
c0100dbd:	c7 04 24 e9 2e 10 c0 	movl   $0xc0102ee9,(%esp)
c0100dc4:	e8 4f 0d 00 00       	call   c0101b18 <_panic>
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
c0100dc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dcc:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
c0100dd3:	00 
c0100dd4:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100dd8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ddb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ddf:	8b 45 08             	mov    0x8(%ebp),%eax
c0100de2:	89 04 24             	mov    %eax,(%esp)
c0100de5:	e8 70 08 00 00       	call   c010165a <page_insert>
	struct PageInfo *p;
	uint32_t va_start = ROUNDDOWN(va, PGSIZE);
	uint32_t va_end = ROUNDUP(va+len, PGSIZE);
	int i;

	for (i = va_start; i < va_end; i += PGSIZE) {
c0100dea:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0100df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100df4:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0100df7:	72 97                	jb     c0100d90 <mm_malloc+0x50>
		p = page_alloc(0);
		assert(p != NULL);
		page_insert(pgdir, p, (void*)i, PTE_W | PTE_P | PTE_U);
	}
}
c0100df9:	c9                   	leave  
c0100dfa:	c3                   	ret    

c0100dfb <readseg>:

static uint8_t disks[SECT_SIZE];
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
c0100dfb:	55                   	push   %ebp
c0100dfc:	89 e5                	mov    %esp,%ebp
c0100dfe:	83 ec 38             	sub    $0x38,%esp
	uint32_t end_va;
	end_va = va + count;
c0100e01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100e04:	8b 55 08             	mov    0x8(%ebp),%edx
c0100e07:	01 d0                	add    %edx,%eax
c0100e09:	89 45 f0             	mov    %eax,-0x10(%ebp)
	uint32_t sect = (offset / SECT_SIZE) + 1;
c0100e0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0100e0f:	c1 e8 09             	shr    $0x9,%eax
c0100e12:	83 c0 01             	add    $0x1,%eax
c0100e15:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (va < end_va) {
c0100e18:	eb 6e                	jmp    c0100e88 <readseg+0x8d>
		readsect(disks, sect);
c0100e1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e1d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100e21:	c7 04 24 20 04 13 c0 	movl   $0xc0130420,(%esp)
c0100e28:	e8 65 00 00 00       	call   c0100e92 <readsect>
		uint32_t rem = offset & 0x1ff;
c0100e2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0100e30:	25 ff 01 00 00       	and    $0x1ff,%eax
c0100e35:	89 45 ec             	mov    %eax,-0x14(%ebp)
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
c0100e38:	b8 00 02 00 00       	mov    $0x200,%eax
c0100e3d:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0100e40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e43:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e46:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100e49:	29 c2                	sub    %eax,%edx
c0100e4b:	89 d0                	mov    %edx,%eax
c0100e4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100e53:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e56:	39 d0                	cmp    %edx,%eax
c0100e58:	76 02                	jbe    c0100e5c <readseg+0x61>
c0100e5a:	89 d0                	mov    %edx,%eax
c0100e5c:	89 45 e0             	mov    %eax,-0x20(%ebp)
		memcpy((void*)va, disks + rem, size);	
c0100e5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100e62:	8d 88 20 04 13 c0    	lea    -0x3fecfbe0(%eax),%ecx
c0100e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e6b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100e6e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100e72:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0100e76:	89 04 24             	mov    %eax,(%esp)
c0100e79:	e8 2c 11 00 00       	call   c0101faa <memcpy>
		va += size;
c0100e7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100e81:	01 45 08             	add    %eax,0x8(%ebp)
		sect++;
c0100e84:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
void readseg(uint32_t va, uint32_t count, uint32_t offset)
{
	uint32_t end_va;
	end_va = va + count;
	uint32_t sect = (offset / SECT_SIZE) + 1;
	while (va < end_va) {
c0100e88:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e8b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0100e8e:	72 8a                	jb     c0100e1a <readseg+0x1f>
		uint32_t size = MIN(SECT_SIZE - rem, end_va - va);
		memcpy((void*)va, disks + rem, size);	
		va += size;
		sect++;
	}
}
c0100e90:	c9                   	leave  
c0100e91:	c3                   	ret    

c0100e92 <readsect>:

void readsect(void *dst, uint32_t offset)
{
c0100e92:	55                   	push   %ebp
c0100e93:	89 e5                	mov    %esp,%ebp
c0100e95:	57                   	push   %edi
c0100e96:	53                   	push   %ebx
c0100e97:	83 ec 50             	sub    $0x50,%esp
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0100e9a:	90                   	nop
c0100e9b:	c7 45 f4 f7 01 00 00 	movl   $0x1f7,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ea5:	89 c2                	mov    %eax,%edx
c0100ea7:	ec                   	in     (%dx),%al
c0100ea8:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
c0100eab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0100eaf:	0f b6 c0             	movzbl %al,%eax
c0100eb2:	25 c0 00 00 00       	and    $0xc0,%eax
c0100eb7:	83 f8 40             	cmp    $0x40,%eax
c0100eba:	75 df                	jne    c0100e9b <readsect+0x9>
c0100ebc:	c7 45 ec f2 01 00 00 	movl   $0x1f2,-0x14(%ebp)
c0100ec3:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
c0100ec7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0100ecb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0100ece:	ee                   	out    %al,(%dx)
	outb(0x1F2, 1);
	outb(0x1F3, offset);
c0100ecf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ed2:	0f b6 c0             	movzbl %al,%eax
c0100ed5:	c7 45 e4 f3 01 00 00 	movl   $0x1f3,-0x1c(%ebp)
c0100edc:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100edf:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0100ee3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100ee6:	ee                   	out    %al,(%dx)
	outb(0x1F4, offset >> 8);
c0100ee7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100eea:	c1 e8 08             	shr    $0x8,%eax
c0100eed:	0f b6 c0             	movzbl %al,%eax
c0100ef0:	c7 45 dc f4 01 00 00 	movl   $0x1f4,-0x24(%ebp)
c0100ef7:	88 45 db             	mov    %al,-0x25(%ebp)
c0100efa:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c0100efe:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100f01:	ee                   	out    %al,(%dx)
	outb(0x1F5, offset >> 16);
c0100f02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100f05:	c1 e8 10             	shr    $0x10,%eax
c0100f08:	0f b6 c0             	movzbl %al,%eax
c0100f0b:	c7 45 d4 f5 01 00 00 	movl   $0x1f5,-0x2c(%ebp)
c0100f12:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0100f15:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0100f19:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100f1c:	ee                   	out    %al,(%dx)
	outb(0x1F6, (offset >> 24) | 0xE0);
c0100f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100f20:	c1 e8 18             	shr    $0x18,%eax
c0100f23:	83 c8 e0             	or     $0xffffffe0,%eax
c0100f26:	0f b6 c0             	movzbl %al,%eax
c0100f29:	c7 45 cc f6 01 00 00 	movl   $0x1f6,-0x34(%ebp)
c0100f30:	88 45 cb             	mov    %al,-0x35(%ebp)
c0100f33:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0100f37:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0100f3a:	ee                   	out    %al,(%dx)
c0100f3b:	c7 45 c4 f7 01 00 00 	movl   $0x1f7,-0x3c(%ebp)
c0100f42:	c6 45 c3 20          	movb   $0x20,-0x3d(%ebp)
c0100f46:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0100f4a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0100f4d:	ee                   	out    %al,(%dx)
    	outb(0x1F7, 0x20);
	while ((inb(0x1F7) & 0xC0) != 0x40);
c0100f4e:	90                   	nop
c0100f4f:	c7 45 bc f7 01 00 00 	movl   $0x1f7,-0x44(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
c0100f56:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0100f59:	89 c2                	mov    %eax,%edx
c0100f5b:	ec                   	in     (%dx),%al
c0100f5c:	88 45 bb             	mov    %al,-0x45(%ebp)
	return data;
c0100f5f:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
c0100f63:	0f b6 c0             	movzbl %al,%eax
c0100f66:	25 c0 00 00 00       	and    $0xc0,%eax
c0100f6b:	83 f8 40             	cmp    $0x40,%eax
c0100f6e:	75 df                	jne    c0100f4f <readsect+0xbd>
c0100f70:	c7 45 b4 f0 01 00 00 	movl   $0x1f0,-0x4c(%ebp)
c0100f77:	8b 45 08             	mov    0x8(%ebp),%eax
c0100f7a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0100f7d:	c7 45 ac 80 00 00 00 	movl   $0x80,-0x54(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
c0100f84:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0100f87:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0100f8a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0100f8d:	89 cb                	mov    %ecx,%ebx
c0100f8f:	89 df                	mov    %ebx,%edi
c0100f91:	89 c1                	mov    %eax,%ecx
c0100f93:	fc                   	cld    
c0100f94:	f2 6d                	repnz insl (%dx),%es:(%edi)
c0100f96:	89 c8                	mov    %ecx,%eax
c0100f98:	89 fb                	mov    %edi,%ebx
c0100f9a:	89 5d b0             	mov    %ebx,-0x50(%ebp)
c0100f9d:	89 45 ac             	mov    %eax,-0x54(%ebp)
	insl(0x1F0, dst, SECT_SIZE / 4);
}
c0100fa0:	83 c4 50             	add    $0x50,%esp
c0100fa3:	5b                   	pop    %ebx
c0100fa4:	5f                   	pop    %edi
c0100fa5:	5d                   	pop    %ebp
c0100fa6:	c3                   	ret    

c0100fa7 <pcb_new>:

PCB* pcb_new()
{
c0100fa7:	55                   	push   %ebp
c0100fa8:	89 e5                	mov    %esp,%ebp
c0100faa:	83 ec 38             	sub    $0x38,%esp
	PCB *p = pcb_alloc();
c0100fad:	e8 74 fc ff ff       	call   c0100c26 <pcb_alloc>
c0100fb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p == NULL) return NULL;
c0100fb5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100fb9:	75 0a                	jne    c0100fc5 <pcb_new+0x1e>
c0100fbb:	b8 00 00 00 00       	mov    $0x0,%eax
c0100fc0:	e9 8c 01 00 00       	jmp    c0101151 <pcb_new+0x1aa>
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	elf = (void*)elfs;
c0100fc5:	c7 45 ec 20 f4 12 c0 	movl   $0xc012f420,-0x14(%ebp)
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
c0100fcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fcf:	c7 44 24 08 00 20 03 	movl   $0x32000,0x8(%esp)
c0100fd6:	00 
c0100fd7:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c0100fde:	00 
c0100fdf:	89 04 24             	mov    %eax,(%esp)
c0100fe2:	e8 14 fe ff ff       	call   c0100dfb <readseg>
	assert(elf->e_magic == ELF_MAGIC);
c0100fe7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fea:	8b 00                	mov    (%eax),%eax
c0100fec:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
c0100ff1:	74 24                	je     c0101017 <pcb_new+0x70>
c0100ff3:	c7 44 24 0c 1b 2f 10 	movl   $0xc0102f1b,0xc(%esp)
c0100ffa:	c0 
c0100ffb:	c7 44 24 08 06 2f 10 	movl   $0xc0102f06,0x8(%esp)
c0101002:	c0 
c0101003:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
c010100a:	00 
c010100b:	c7 04 24 e9 2e 10 c0 	movl   $0xc0102ee9,(%esp)
c0101012:	e8 01 0b 00 00       	call   c0101b18 <_panic>
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
c0101017:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010101a:	8b 50 1c             	mov    0x1c(%eax),%edx
c010101d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101020:	01 d0                	add    %edx,%eax
c0101022:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf -> e_phnum;
c0101025:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101028:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010102c:	0f b7 c0             	movzwl %ax,%eax
c010102f:	c1 e0 05             	shl    $0x5,%eax
c0101032:	89 c2                	mov    %eax,%edx
c0101034:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101037:	01 d0                	add    %edx,%eax
c0101039:	89 45 e8             	mov    %eax,-0x18(%ebp)
	lcr3(PADDR(p-> pgdir));
c010103c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010103f:	8b 40 4c             	mov    0x4c(%eax),%eax
c0101042:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101046:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
c010104d:	00 
c010104e:	c7 04 24 e9 2e 10 c0 	movl   $0xc0102ee9,(%esp)
c0101055:	e8 d3 fa ff ff       	call   c0100b2d <_paddr>
c010105a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c010105d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101060:	0f 22 d8             	mov    %eax,%cr3
	for (; ph < eph; ph++) {
c0101063:	e9 8a 00 00 00       	jmp    c01010f2 <pcb_new+0x14b>
		if (ph -> p_type != ELF_PROG_LOAD) continue;
c0101068:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010106b:	8b 00                	mov    (%eax),%eax
c010106d:	83 f8 01             	cmp    $0x1,%eax
c0101070:	74 02                	je     c0101074 <pcb_new+0xcd>
c0101072:	eb 7a                	jmp    c01010ee <pcb_new+0x147>
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
c0101074:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101077:	8b 48 14             	mov    0x14(%eax),%ecx
c010107a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010107d:	8b 50 08             	mov    0x8(%eax),%edx
c0101080:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101083:	8b 40 4c             	mov    0x4c(%eax),%eax
c0101086:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010108a:	89 54 24 04          	mov    %edx,0x4(%esp)
c010108e:	89 04 24             	mov    %eax,(%esp)
c0101091:	e8 aa fc ff ff       	call   c0100d40 <mm_malloc>
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
c0101096:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101099:	8b 40 04             	mov    0x4(%eax),%eax
c010109c:	8d 88 00 20 03 00    	lea    0x32000(%eax),%ecx
c01010a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010a5:	8b 50 10             	mov    0x10(%eax),%edx
c01010a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010ab:	8b 40 08             	mov    0x8(%eax),%eax
c01010ae:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01010b2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01010b6:	89 04 24             	mov    %eax,(%esp)
c01010b9:	e8 3d fd ff ff       	call   c0100dfb <readseg>
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
c01010be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010c1:	8b 50 14             	mov    0x14(%eax),%edx
c01010c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010c7:	8b 40 10             	mov    0x10(%eax),%eax
c01010ca:	29 c2                	sub    %eax,%edx
c01010cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010cf:	8b 48 08             	mov    0x8(%eax),%ecx
c01010d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010d5:	8b 40 10             	mov    0x10(%eax),%eax
c01010d8:	01 c8                	add    %ecx,%eax
c01010da:	89 54 24 08          	mov    %edx,0x8(%esp)
c01010de:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01010e5:	00 
c01010e6:	89 04 24             	mov    %eax,(%esp)
c01010e9:	e8 d9 0e 00 00       	call   c0101fc7 <memset>
	readseg((uint32_t)elf, SECT_SIZE*8, GAME_OFFSET);
	assert(elf->e_magic == ELF_MAGIC);
	ph = (struct Proghdr *)((uint8_t *)elf + elf -> e_phoff);
	eph = ph + elf -> e_phnum;
	lcr3(PADDR(p-> pgdir));
	for (; ph < eph; ph++) {
c01010ee:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01010f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010f5:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c01010f8:	0f 82 6a ff ff ff    	jb     c0101068 <pcb_new+0xc1>
		if (ph -> p_type != ELF_PROG_LOAD) continue;
		mm_malloc(p->pgdir, ph->p_va, ph->p_memsz);
		readseg(ph->p_va, ph->p_filesz, GAME_OFFSET + ph->p_offset);
		memset((void*)(ph->p_va+ph->p_filesz), 0, ph->p_memsz-ph->p_filesz);
	}
	p->tf.eip = elf -> e_entry;
c01010fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101101:	8b 50 18             	mov    0x18(%eax),%edx
c0101104:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101107:	89 50 38             	mov    %edx,0x38(%eax)
	mm_malloc(p->pgdir, USTACKTOP - KSTKSIZE, KSTKSIZE);
c010110a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010110d:	8b 40 4c             	mov    0x4c(%eax),%eax
c0101110:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c0101117:	00 
c0101118:	c7 44 24 04 00 60 ff 	movl   $0xbeff6000,0x4(%esp)
c010111f:	be 
c0101120:	89 04 24             	mov    %eax,(%esp)
c0101123:	e8 18 fc ff ff       	call   c0100d40 <mm_malloc>
	lcr3(PADDR(kern_pgdir));
c0101128:	a1 80 3a 16 c0       	mov    0xc0163a80,%eax
c010112d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101131:	c7 44 24 04 6d 00 00 	movl   $0x6d,0x4(%esp)
c0101138:	00 
c0101139:	c7 04 24 e9 2e 10 c0 	movl   $0xc0102ee9,(%esp)
c0101140:	e8 e8 f9 ff ff       	call   c0100b2d <_paddr>
c0101145:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101148:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010114b:	0f 22 d8             	mov    %eax,%cr3
	return p;
c010114e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
c0101151:	c9                   	leave  
c0101152:	c3                   	ret    

c0101153 <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c0101153:	55                   	push   %ebp
c0101154:	89 e5                	mov    %esp,%ebp
c0101156:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c0101159:	8b 45 10             	mov    0x10(%ebp),%eax
c010115c:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c0101161:	77 21                	ja     c0101184 <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c0101163:	8b 45 10             	mov    0x10(%ebp),%eax
c0101166:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010116a:	c7 44 24 08 38 2f 10 	movl   $0xc0102f38,0x8(%esp)
c0101171:	c0 
c0101172:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101175:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101179:	8b 45 08             	mov    0x8(%ebp),%eax
c010117c:	89 04 24             	mov    %eax,(%esp)
c010117f:	e8 94 09 00 00       	call   c0101b18 <_panic>
	return (physaddr_t)kva - KERNBASE;
c0101184:	8b 45 10             	mov    0x10(%ebp),%eax
c0101187:	05 00 00 00 40       	add    $0x40000000,%eax
}
c010118c:	c9                   	leave  
c010118d:	c3                   	ret    

c010118e <_kaddr>:
 * virtual address.  It panics if you pass an invalid physical address. */
#define KADDR(pa) _kaddr(__FILE__, __LINE__, pa)
#define npages (PHYMEM / PGSIZE)
static inline void*
_kaddr(const char *file, int line, physaddr_t pa)
{
c010118e:	55                   	push   %ebp
c010118f:	89 e5                	mov    %esp,%ebp
c0101191:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c0101194:	8b 45 10             	mov    0x10(%ebp),%eax
c0101197:	c1 e8 0c             	shr    $0xc,%eax
c010119a:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c010119f:	76 21                	jbe    c01011c2 <_kaddr+0x34>
		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
c01011a1:	8b 45 10             	mov    0x10(%ebp),%eax
c01011a4:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01011a8:	c7 44 24 08 5c 2f 10 	movl   $0xc0102f5c,0x8(%esp)
c01011af:	c0 
c01011b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011b3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01011b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01011ba:	89 04 24             	mov    %eax,(%esp)
c01011bd:	e8 56 09 00 00       	call   c0101b18 <_panic>
	return (void *)(pa + KERNBASE);
c01011c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01011c5:	2d 00 00 00 40       	sub    $0x40000000,%eax
}
c01011ca:	c9                   	leave  
c01011cb:	c3                   	ret    

c01011cc <page2pa>:

void	tlb_invalidate(pde_t *pgdir, void *va);

static inline physaddr_t
page2pa(struct Page *pp)
{
c01011cc:	55                   	push   %ebp
c01011cd:	89 e5                	mov    %esp,%ebp
	return (pp - pages) << PGSHIFT;
c01011cf:	8b 55 08             	mov    0x8(%ebp),%edx
c01011d2:	b8 a0 3a 16 c0       	mov    $0xc0163aa0,%eax
c01011d7:	29 c2                	sub    %eax,%edx
c01011d9:	89 d0                	mov    %edx,%eax
c01011db:	c1 f8 03             	sar    $0x3,%eax
c01011de:	c1 e0 0c             	shl    $0xc,%eax
}
c01011e1:	5d                   	pop    %ebp
c01011e2:	c3                   	ret    

c01011e3 <pa2page>:

static inline struct Page*
pa2page(physaddr_t pa)
{
c01011e3:	55                   	push   %ebp
c01011e4:	89 e5                	mov    %esp,%ebp
c01011e6:	83 ec 18             	sub    $0x18,%esp
	if (PGNUM(pa) >= npages)
c01011e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01011ec:	c1 e8 0c             	shr    $0xc,%eax
c01011ef:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01011f4:	76 1c                	jbe    c0101212 <pa2page+0x2f>
		panic("pa2page called with invalid pa");
c01011f6:	c7 44 24 08 80 2f 10 	movl   $0xc0102f80,0x8(%esp)
c01011fd:	c0 
c01011fe:	c7 44 24 04 48 00 00 	movl   $0x48,0x4(%esp)
c0101205:	00 
c0101206:	c7 04 24 9f 2f 10 c0 	movl   $0xc0102f9f,(%esp)
c010120d:	e8 06 09 00 00       	call   c0101b18 <_panic>
	return &pages[PGNUM(pa)];
c0101212:	8b 45 08             	mov    0x8(%ebp),%eax
c0101215:	c1 e8 0c             	shr    $0xc,%eax
c0101218:	c1 e0 03             	shl    $0x3,%eax
c010121b:	05 a0 3a 16 c0       	add    $0xc0163aa0,%eax
}
c0101220:	c9                   	leave  
c0101221:	c3                   	ret    

c0101222 <page2kva>:

static inline void*
page2kva(struct Page *pp)
{
c0101222:	55                   	push   %ebp
c0101223:	89 e5                	mov    %esp,%ebp
c0101225:	83 ec 18             	sub    $0x18,%esp
	return KADDR(page2pa(pp));
c0101228:	8b 45 08             	mov    0x8(%ebp),%eax
c010122b:	89 04 24             	mov    %eax,(%esp)
c010122e:	e8 99 ff ff ff       	call   c01011cc <page2pa>
c0101233:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101237:	c7 44 24 04 4f 00 00 	movl   $0x4f,0x4(%esp)
c010123e:	00 
c010123f:	c7 04 24 9f 2f 10 c0 	movl   $0xc0102f9f,(%esp)
c0101246:	e8 43 ff ff ff       	call   c010118e <_kaddr>
}
c010124b:	c9                   	leave  
c010124c:	c3                   	ret    

c010124d <page_init>:
__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[PHYMEM/PGSIZE];

void
page_init(void)
{
c010124d:	55                   	push   %ebp
c010124e:	89 e5                	mov    %esp,%ebp
c0101250:	53                   	push   %ebx
c0101251:	83 ec 54             	sub    $0x54,%esp
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
c0101254:	c7 45 e4 00 20 13 c0 	movl   $0xc0132000,-0x1c(%ebp)
	pte_t *pgtable = kpgtable;
c010125b:	c7 45 f0 00 30 13 c0 	movl   $0xc0133000,-0x10(%ebp)
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c0101262:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101269:	eb 40                	jmp    c01012ab <page_init+0x5e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
c010126b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010126e:	05 00 03 00 00       	add    $0x300,%eax
c0101273:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010127a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010127d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0101280:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101283:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101287:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
c010128e:	00 
c010128f:	c7 04 24 b5 2f 10 c0 	movl   $0xc0102fb5,(%esp)
c0101296:	e8 b8 fe ff ff       	call   c0101153 <_paddr>
c010129b:	83 c8 03             	or     $0x3,%eax
c010129e:	89 03                	mov    %eax,(%ebx)
		pgtable += NPTENTRIES;
c01012a0:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
	pte_t *pgtable = kpgtable;
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
c01012a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01012ab:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c01012af:	7e ba                	jle    c010126b <page_init+0x1e>
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
c01012b1:	c7 45 ec 00 f0 ff 07 	movl   $0x7fff000,-0x14(%ebp)
	pgtable--;
c01012b8:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c01012bc:	eb 18                	jmp    c01012d6 <page_init+0x89>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
c01012be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012c1:	83 c8 07             	or     $0x7,%eax
c01012c4:	89 c2                	mov    %eax,%edx
c01012c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01012c9:	89 10                	mov    %edx,(%eax)
		pgtable --;
c01012cb:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
	pgtable--;
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
c01012cf:	81 6d ec 00 10 00 00 	subl   $0x1000,-0x14(%ebp)
c01012d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01012da:	79 e2                	jns    c01012be <page_init+0x71>
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
		pgtable --;
	}
	kern_pgdir = pgdir;
c01012dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01012df:	a3 80 3a 16 c0       	mov    %eax,0xc0163a80
	lcr3(PADDR(kern_pgdir));	
c01012e4:	a1 80 3a 16 c0       	mov    0xc0163a80,%eax
c01012e9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01012ed:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
c01012f4:	00 
c01012f5:	c7 04 24 b5 2f 10 c0 	movl   $0xc0102fb5,(%esp)
c01012fc:	e8 52 fe ff ff       	call   c0101153 <_paddr>
c0101301:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101304:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101307:	0f 22 d8             	mov    %eax,%cr3
	unsigned long i;
	int base = 0x400;
c010130a:	c7 45 e0 00 04 00 00 	movl   $0x400,-0x20(%ebp)
	for (i = 0; i < base; i++) {
c0101311:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101318:	eb 11                	jmp    c010132b <page_init+0xde>
		pages[i].pp_ref = 1;
c010131a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010131d:	66 c7 04 c5 a4 3a 16 	movw   $0x1,-0x3fe9c55c(,%eax,8)
c0101324:	c0 01 00 
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
c0101327:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010132b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010132e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101331:	77 e7                	ja     c010131a <page_init+0xcd>
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101333:	c7 45 e8 ff 7f 00 00 	movl   $0x7fff,-0x18(%ebp)
c010133a:	eb 31                	jmp    c010136d <page_init+0x120>
		pages[i].pp_ref = 0;
c010133c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010133f:	66 c7 04 c5 a4 3a 16 	movw   $0x0,-0x3fe9c55c(,%eax,8)
c0101346:	c0 00 00 
		pages[i].pp_link = page_free_list;
c0101349:	8b 15 00 10 13 c0    	mov    0xc0131000,%edx
c010134f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101352:	89 14 c5 a0 3a 16 c0 	mov    %edx,-0x3fe9c560(,%eax,8)
		page_free_list = &pages[i];
c0101359:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010135c:	c1 e0 03             	shl    $0x3,%eax
c010135f:	05 a0 3a 16 c0       	add    $0xc0163aa0,%eax
c0101364:	a3 00 10 13 c0       	mov    %eax,0xc0131000
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
c0101369:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c010136d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101370:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0101373:	76 c7                	jbe    c010133c <page_init+0xef>
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, KSTACKTOP-KSTKSIZE, KSTKSIZE, PADDR(bootstack), (PTE_W | PTE_P));
c0101375:	c7 44 24 08 00 80 10 	movl   $0xc0108000,0x8(%esp)
c010137c:	c0 
c010137d:	c7 44 24 04 5b 00 00 	movl   $0x5b,0x4(%esp)
c0101384:	00 
c0101385:	c7 04 24 b5 2f 10 c0 	movl   $0xc0102fb5,(%esp)
c010138c:	e8 c2 fd ff ff       	call   c0101153 <_paddr>
c0101391:	8b 15 80 3a 16 c0    	mov    0xc0163a80,%edx
c0101397:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c010139e:	00 
c010139f:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01013a3:	c7 44 24 08 00 80 00 	movl   $0x8000,0x8(%esp)
c01013aa:	00 
c01013ab:	c7 44 24 04 00 80 ff 	movl   $0xbfff8000,0x4(%esp)
c01013b2:	bf 
c01013b3:	89 14 24             	mov    %edx,(%esp)
c01013b6:	e8 36 02 00 00       	call   c01015f1 <boot_map_region>
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
c01013bb:	c7 45 dc 00 10 00 00 	movl   $0x1000,-0x24(%ebp)
c01013c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01013c5:	05 ff f9 00 00       	add    $0xf9ff,%eax
c01013ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01013cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01013d0:	ba 00 00 00 00       	mov    $0x0,%edx
c01013d5:	f7 75 dc             	divl   -0x24(%ebp)
c01013d8:	89 d0                	mov    %edx,%eax
c01013da:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01013dd:	29 c2                	sub    %eax,%edx
c01013df:	89 d0                	mov    %edx,%eax
c01013e1:	89 c2                	mov    %eax,%edx
c01013e3:	a1 80 3a 16 c0       	mov    0xc0163a80,%eax
c01013e8:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%esp)
c01013ef:	00 
c01013f0:	c7 44 24 0c 00 00 0a 	movl   $0xa0000,0xc(%esp)
c01013f7:	00 
c01013f8:	89 54 24 08          	mov    %edx,0x8(%esp)
c01013fc:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
c0101403:	00 
c0101404:	89 04 24             	mov    %eax,(%esp)
c0101407:	e8 e5 01 00 00       	call   c01015f1 <boot_map_region>
}
c010140c:	83 c4 54             	add    $0x54,%esp
c010140f:	5b                   	pop    %ebx
c0101410:	5d                   	pop    %ebp
c0101411:	c3                   	ret    

c0101412 <page_alloc>:
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
c0101412:	55                   	push   %ebp
c0101413:	89 e5                	mov    %esp,%ebp
c0101415:	83 ec 28             	sub    $0x28,%esp
	struct Page *p = page_free_list;
c0101418:	a1 00 10 13 c0       	mov    0xc0131000,%eax
c010141d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (p == NULL) return NULL;
c0101420:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101424:	75 07                	jne    c010142d <page_alloc+0x1b>
c0101426:	b8 00 00 00 00       	mov    $0x0,%eax
c010142b:	eb 45                	jmp    c0101472 <page_alloc+0x60>
	if (alloc_flags & ALLOC_ZERO) {
c010142d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101430:	83 e0 01             	and    $0x1,%eax
c0101433:	85 c0                	test   %eax,%eax
c0101435:	74 23                	je     c010145a <page_alloc+0x48>
		memset(page2kva(p), 0, PGSIZE);
c0101437:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010143a:	89 04 24             	mov    %eax,(%esp)
c010143d:	e8 e0 fd ff ff       	call   c0101222 <page2kva>
c0101442:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0101449:	00 
c010144a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101451:	00 
c0101452:	89 04 24             	mov    %eax,(%esp)
c0101455:	e8 6d 0b 00 00       	call   c0101fc7 <memset>
	}
	page_free_list = page_free_list -> pp_link;
c010145a:	a1 00 10 13 c0       	mov    0xc0131000,%eax
c010145f:	8b 00                	mov    (%eax),%eax
c0101461:	a3 00 10 13 c0       	mov    %eax,0xc0131000
	p -> pp_link = NULL;
c0101466:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101469:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	return p;
c010146f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101472:	c9                   	leave  
c0101473:	c3                   	ret    

c0101474 <page_free>:
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
c0101474:	55                   	push   %ebp
c0101475:	89 e5                	mov    %esp,%ebp
c0101477:	83 ec 18             	sub    $0x18,%esp
	assert(pp->pp_ref == 0 && pp->pp_link == NULL);
c010147a:	8b 45 08             	mov    0x8(%ebp),%eax
c010147d:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101481:	66 85 c0             	test   %ax,%ax
c0101484:	75 09                	jne    c010148f <page_free+0x1b>
c0101486:	8b 45 08             	mov    0x8(%ebp),%eax
c0101489:	8b 00                	mov    (%eax),%eax
c010148b:	85 c0                	test   %eax,%eax
c010148d:	74 24                	je     c01014b3 <page_free+0x3f>
c010148f:	c7 44 24 0c cc 2f 10 	movl   $0xc0102fcc,0xc(%esp)
c0101496:	c0 
c0101497:	c7 44 24 08 f3 2f 10 	movl   $0xc0102ff3,0x8(%esp)
c010149e:	c0 
c010149f:	c7 44 24 04 7c 00 00 	movl   $0x7c,0x4(%esp)
c01014a6:	00 
c01014a7:	c7 04 24 b5 2f 10 c0 	movl   $0xc0102fb5,(%esp)
c01014ae:	e8 65 06 00 00       	call   c0101b18 <_panic>
	pp->pp_link = page_free_list;
c01014b3:	8b 15 00 10 13 c0    	mov    0xc0131000,%edx
c01014b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01014bc:	89 10                	mov    %edx,(%eax)
	page_free_list = pp;
c01014be:	8b 45 08             	mov    0x8(%ebp),%eax
c01014c1:	a3 00 10 13 c0       	mov    %eax,0xc0131000
}
c01014c6:	c9                   	leave  
c01014c7:	c3                   	ret    

c01014c8 <page_decref>:
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
c01014c8:	55                   	push   %ebp
c01014c9:	89 e5                	mov    %esp,%ebp
c01014cb:	83 ec 18             	sub    $0x18,%esp
	if (--pp->pp_ref == 0)
c01014ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01014d1:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01014d5:	8d 50 ff             	lea    -0x1(%eax),%edx
c01014d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01014db:	66 89 50 04          	mov    %dx,0x4(%eax)
c01014df:	8b 45 08             	mov    0x8(%ebp),%eax
c01014e2:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01014e6:	66 85 c0             	test   %ax,%ax
c01014e9:	75 0b                	jne    c01014f6 <page_decref+0x2e>
		page_free(pp);
c01014eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01014ee:	89 04 24             	mov    %eax,(%esp)
c01014f1:	e8 7e ff ff ff       	call   c0101474 <page_free>
}
c01014f6:	c9                   	leave  
c01014f7:	c3                   	ret    

c01014f8 <pgdir_walk>:
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
c01014f8:	55                   	push   %ebp
c01014f9:	89 e5                	mov    %esp,%ebp
c01014fb:	53                   	push   %ebx
c01014fc:	83 ec 24             	sub    $0x24,%esp
	pte_t *pgtable;
	int pdx = PDX(va);
c01014ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101502:	c1 e8 16             	shr    $0x16,%eax
c0101505:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pgdir[pdx] & PTE_P) {
c0101508:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010150b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0101512:	8b 45 08             	mov    0x8(%ebp),%eax
c0101515:	01 d0                	add    %edx,%eax
c0101517:	8b 00                	mov    (%eax),%eax
c0101519:	83 e0 01             	and    $0x1,%eax
c010151c:	85 c0                	test   %eax,%eax
c010151e:	74 33                	je     c0101553 <pgdir_walk+0x5b>
		pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
c0101520:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101523:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010152a:	8b 45 08             	mov    0x8(%ebp),%eax
c010152d:	01 d0                	add    %edx,%eax
c010152f:	8b 00                	mov    (%eax),%eax
c0101531:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101536:	89 44 24 08          	mov    %eax,0x8(%esp)
c010153a:	c7 44 24 04 a8 00 00 	movl   $0xa8,0x4(%esp)
c0101541:	00 
c0101542:	c7 04 24 b5 2f 10 c0 	movl   $0xc0102fb5,(%esp)
c0101549:	e8 40 fc ff ff       	call   c010118e <_kaddr>
c010154e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101551:	eb 7b                	jmp    c01015ce <pgdir_walk+0xd6>
	}
	else {
		if (create == false) return NULL;
c0101553:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101557:	75 0a                	jne    c0101563 <pgdir_walk+0x6b>
c0101559:	b8 00 00 00 00       	mov    $0x0,%eax
c010155e:	e9 88 00 00 00       	jmp    c01015eb <pgdir_walk+0xf3>
		struct Page *p = page_alloc(ALLOC_ZERO);
c0101563:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010156a:	e8 a3 fe ff ff       	call   c0101412 <page_alloc>
c010156f:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (p == NULL) return NULL;
c0101572:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101576:	75 07                	jne    c010157f <pgdir_walk+0x87>
c0101578:	b8 00 00 00 00       	mov    $0x0,%eax
c010157d:	eb 6c                	jmp    c01015eb <pgdir_walk+0xf3>
		pgtable = page2kva(p);
c010157f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101582:	89 04 24             	mov    %eax,(%esp)
c0101585:	e8 98 fc ff ff       	call   c0101222 <page2kva>
c010158a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		p -> pp_ref ++;
c010158d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101590:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0101594:	8d 50 01             	lea    0x1(%eax),%edx
c0101597:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010159a:	66 89 50 04          	mov    %dx,0x4(%eax)
		pgdir[pdx] = PADDR(pgtable) | PTE_P | PTE_W | PTE_U;
c010159e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015a1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01015a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01015ab:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01015ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015b1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01015b5:	c7 44 24 04 b0 00 00 	movl   $0xb0,0x4(%esp)
c01015bc:	00 
c01015bd:	c7 04 24 b5 2f 10 c0 	movl   $0xc0102fb5,(%esp)
c01015c4:	e8 8a fb ff ff       	call   c0101153 <_paddr>
c01015c9:	83 c8 07             	or     $0x7,%eax
c01015cc:	89 03                	mov    %eax,(%ebx)
	}
	int ptx = PTX(va);
c01015ce:	8b 45 0c             	mov    0xc(%ebp),%eax
c01015d1:	c1 e8 0c             	shr    $0xc,%eax
c01015d4:	25 ff 03 00 00       	and    $0x3ff,%eax
c01015d9:	89 45 e8             	mov    %eax,-0x18(%ebp)
	return &pgtable[ptx];
c01015dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01015df:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01015e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015e9:	01 d0                	add    %edx,%eax

}
c01015eb:	83 c4 24             	add    $0x24,%esp
c01015ee:	5b                   	pop    %ebx
c01015ef:	5d                   	pop    %ebp
c01015f0:	c3                   	ret    

c01015f1 <boot_map_region>:
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
c01015f1:	55                   	push   %ebp
c01015f2:	89 e5                	mov    %esp,%ebp
c01015f4:	83 ec 28             	sub    $0x28,%esp
	int i,n;
	n=size/PGSIZE;
c01015f7:	8b 45 10             	mov    0x10(%ebp),%eax
c01015fa:	c1 e8 0c             	shr    $0xc,%eax
c01015fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (i = 0; i < n; i ++) {
c0101600:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101607:	eb 47                	jmp    c0101650 <boot_map_region+0x5f>
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
c0101609:	8b 45 0c             	mov    0xc(%ebp),%eax
c010160c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101613:	00 
c0101614:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101618:	8b 45 08             	mov    0x8(%ebp),%eax
c010161b:	89 04 24             	mov    %eax,(%esp)
c010161e:	e8 d5 fe ff ff       	call   c01014f8 <pgdir_walk>
c0101623:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (pte == NULL) return;
c0101626:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010162a:	75 02                	jne    c010162e <boot_map_region+0x3d>
c010162c:	eb 2a                	jmp    c0101658 <boot_map_region+0x67>
		*pte = pa | perm | PTE_P;
c010162e:	8b 45 18             	mov    0x18(%ebp),%eax
c0101631:	0b 45 14             	or     0x14(%ebp),%eax
c0101634:	83 c8 01             	or     $0x1,%eax
c0101637:	89 c2                	mov    %eax,%edx
c0101639:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010163c:	89 10                	mov    %edx,(%eax)
		va += PGSIZE;
c010163e:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
		pa += PGSIZE;
c0101645:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i,n;
	n=size/PGSIZE;
	for (i = 0; i < n; i ++) {
c010164c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101650:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101653:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101656:	7c b1                	jl     c0101609 <boot_map_region+0x18>
		if (pte == NULL) return;
		*pte = pa | perm | PTE_P;
		va += PGSIZE;
		pa += PGSIZE;
	}
}
c0101658:	c9                   	leave  
c0101659:	c3                   	ret    

c010165a <page_insert>:
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
c010165a:	55                   	push   %ebp
c010165b:	89 e5                	mov    %esp,%ebp
c010165d:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, true);
c0101660:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0101667:	00 
c0101668:	8b 45 10             	mov    0x10(%ebp),%eax
c010166b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010166f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101672:	89 04 24             	mov    %eax,(%esp)
c0101675:	e8 7e fe ff ff       	call   c01014f8 <pgdir_walk>
c010167a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) {
c010167d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101681:	75 07                	jne    c010168a <page_insert+0x30>
		return -1;
c0101683:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101688:	eb 73                	jmp    c01016fd <page_insert+0xa3>
	}
	physaddr_t pa = page2pa(pp);
c010168a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010168d:	89 04 24             	mov    %eax,(%esp)
c0101690:	e8 37 fb ff ff       	call   c01011cc <page2pa>
c0101695:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (*pte & PTE_P) {
c0101698:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010169b:	8b 00                	mov    (%eax),%eax
c010169d:	83 e0 01             	and    $0x1,%eax
c01016a0:	85 c0                	test   %eax,%eax
c01016a2:	74 33                	je     c01016d7 <page_insert+0x7d>
		if (PTE_ADDR(*pte) == pa) {
c01016a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016a7:	8b 00                	mov    (%eax),%eax
c01016a9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01016ae:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01016b1:	75 12                	jne    c01016c5 <page_insert+0x6b>
			*pte = pa | perm | PTE_P;
c01016b3:	8b 45 14             	mov    0x14(%ebp),%eax
c01016b6:	0b 45 f0             	or     -0x10(%ebp),%eax
c01016b9:	83 c8 01             	or     $0x1,%eax
c01016bc:	89 c2                	mov    %eax,%edx
c01016be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016c1:	89 10                	mov    %edx,(%eax)
c01016c3:	eb 12                	jmp    c01016d7 <page_insert+0x7d>
		}
		else {
			page_remove(pgdir, va);
c01016c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01016c8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01016cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01016cf:	89 04 24             	mov    %eax,(%esp)
c01016d2:	e8 7a 00 00 00       	call   c0101751 <page_remove>
		}
	}
	*pte = pa | perm | PTE_P;
c01016d7:	8b 45 14             	mov    0x14(%ebp),%eax
c01016da:	0b 45 f0             	or     -0x10(%ebp),%eax
c01016dd:	83 c8 01             	or     $0x1,%eax
c01016e0:	89 c2                	mov    %eax,%edx
c01016e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016e5:	89 10                	mov    %edx,(%eax)
	pp -> pp_ref ++;
c01016e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01016ea:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c01016ee:	8d 50 01             	lea    0x1(%eax),%edx
c01016f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01016f4:	66 89 50 04          	mov    %dx,0x4(%eax)
	return 0;
c01016f8:	b8 00 00 00 00       	mov    $0x0,%eax

}
c01016fd:	c9                   	leave  
c01016fe:	c3                   	ret    

c01016ff <page_lookup>:
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
c01016ff:	55                   	push   %ebp
c0101700:	89 e5                	mov    %esp,%ebp
c0101702:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte = pgdir_walk(pgdir, va, false);
c0101705:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010170c:	00 
c010170d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101710:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101714:	8b 45 08             	mov    0x8(%ebp),%eax
c0101717:	89 04 24             	mov    %eax,(%esp)
c010171a:	e8 d9 fd ff ff       	call   c01014f8 <pgdir_walk>
c010171f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (pte == NULL) return NULL;
c0101722:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101726:	75 07                	jne    c010172f <page_lookup+0x30>
c0101728:	b8 00 00 00 00       	mov    $0x0,%eax
c010172d:	eb 20                	jmp    c010174f <page_lookup+0x50>
	if (pte_store != NULL) *pte_store = pte;
c010172f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0101733:	74 08                	je     c010173d <page_lookup+0x3e>
c0101735:	8b 45 10             	mov    0x10(%ebp),%eax
c0101738:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010173b:	89 10                	mov    %edx,(%eax)
	return pa2page(PTE_ADDR(*pte));
c010173d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101740:	8b 00                	mov    (%eax),%eax
c0101742:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101747:	89 04 24             	mov    %eax,(%esp)
c010174a:	e8 94 fa ff ff       	call   c01011e3 <pa2page>
}
c010174f:	c9                   	leave  
c0101750:	c3                   	ret    

c0101751 <page_remove>:
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
c0101751:	55                   	push   %ebp
c0101752:	89 e5                	mov    %esp,%ebp
c0101754:	83 ec 28             	sub    $0x28,%esp
	pte_t *pte;
	pte_t **pte_store = &pte;
c0101757:	8d 45 ec             	lea    -0x14(%ebp),%eax
c010175a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct Page *p = page_lookup(pgdir, va, pte_store);
c010175d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101760:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101764:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101767:	89 44 24 04          	mov    %eax,0x4(%esp)
c010176b:	8b 45 08             	mov    0x8(%ebp),%eax
c010176e:	89 04 24             	mov    %eax,(%esp)
c0101771:	e8 89 ff ff ff       	call   c01016ff <page_lookup>
c0101776:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (p != NULL) {
c0101779:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010177d:	74 28                	je     c01017a7 <page_remove+0x56>
		**pte_store = 0;
c010177f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101782:	8b 00                	mov    (%eax),%eax
c0101784:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		page_decref(p);
c010178a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010178d:	89 04 24             	mov    %eax,(%esp)
c0101790:	e8 33 fd ff ff       	call   c01014c8 <page_decref>
		tlb_invalidate(pgdir, va);
c0101795:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101798:	89 44 24 04          	mov    %eax,0x4(%esp)
c010179c:	8b 45 08             	mov    0x8(%ebp),%eax
c010179f:	89 04 24             	mov    %eax,(%esp)
c01017a2:	e8 02 00 00 00       	call   c01017a9 <tlb_invalidate>
	}
}
c01017a7:	c9                   	leave  
c01017a8:	c3                   	ret    

c01017a9 <tlb_invalidate>:
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
c01017a9:	55                   	push   %ebp
c01017aa:	89 e5                	mov    %esp,%ebp
c01017ac:	83 ec 10             	sub    $0x10,%esp
c01017af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

static __inline void
invlpg(void *addr)
{
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
c01017b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01017b8:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
c01017bb:	c9                   	leave  
c01017bc:	c3                   	ret    

c01017bd <_paddr>:
 */
#define PADDR(kva) _paddr(__FILE__, __LINE__, kva)

static inline physaddr_t
_paddr(const char *file, int line, void *kva)
{
c01017bd:	55                   	push   %ebp
c01017be:	89 e5                	mov    %esp,%ebp
c01017c0:	83 ec 18             	sub    $0x18,%esp
	if ((uint32_t)kva < KERNBASE)
c01017c3:	8b 45 10             	mov    0x10(%ebp),%eax
c01017c6:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
c01017cb:	77 21                	ja     c01017ee <_paddr+0x31>
		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
c01017cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01017d0:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01017d4:	c7 44 24 08 08 30 10 	movl   $0xc0103008,0x8(%esp)
c01017db:	c0 
c01017dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017df:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01017e6:	89 04 24             	mov    %eax,(%esp)
c01017e9:	e8 2a 03 00 00       	call   c0101b18 <_panic>
	return (physaddr_t)kva - KERNBASE;
c01017ee:	8b 45 10             	mov    0x10(%ebp),%eax
c01017f1:	05 00 00 00 40       	add    $0x40000000,%eax
}
c01017f6:	c9                   	leave  
c01017f7:	c3                   	ret    

c01017f8 <set_segment>:

//refer to PA.......
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
c01017f8:	55                   	push   %ebp
c01017f9:	89 e5                	mov    %esp,%ebp
	ptr->limit_15_0  = 0xFFFF;
c01017fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01017fe:	66 c7 00 ff ff       	movw   $0xffff,(%eax)
	ptr->base_15_0   = 0x0;
c0101803:	8b 45 08             	mov    0x8(%ebp),%eax
c0101806:	66 c7 40 02 00 00    	movw   $0x0,0x2(%eax)
	ptr->base_23_16  = 0x0;
c010180c:	8b 45 08             	mov    0x8(%ebp),%eax
c010180f:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	ptr->type = type;
c0101813:	8b 45 10             	mov    0x10(%ebp),%eax
c0101816:	83 e0 0f             	and    $0xf,%eax
c0101819:	89 c2                	mov    %eax,%edx
c010181b:	8b 45 08             	mov    0x8(%ebp),%eax
c010181e:	89 d1                	mov    %edx,%ecx
c0101820:	83 e1 0f             	and    $0xf,%ecx
c0101823:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101827:	83 e2 f0             	and    $0xfffffff0,%edx
c010182a:	09 ca                	or     %ecx,%edx
c010182c:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 1;
c010182f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101832:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101836:	83 ca 10             	or     $0x10,%edx
c0101839:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = pl;
c010183c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010183f:	83 e0 03             	and    $0x3,%eax
c0101842:	89 c2                	mov    %eax,%edx
c0101844:	8b 45 08             	mov    0x8(%ebp),%eax
c0101847:	83 e2 03             	and    $0x3,%edx
c010184a:	89 d1                	mov    %edx,%ecx
c010184c:	c1 e1 05             	shl    $0x5,%ecx
c010184f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101853:	83 e2 9f             	and    $0xffffff9f,%edx
c0101856:	09 ca                	or     %ecx,%edx
c0101858:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c010185b:	8b 45 08             	mov    0x8(%ebp),%eax
c010185e:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101862:	83 ca 80             	or     $0xffffff80,%edx
c0101865:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = 0xF;
c0101868:	8b 45 08             	mov    0x8(%ebp),%eax
c010186b:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010186f:	83 ca 0f             	or     $0xf,%edx
c0101872:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0101875:	8b 45 08             	mov    0x8(%ebp),%eax
c0101878:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010187c:	83 e2 ef             	and    $0xffffffef,%edx
c010187f:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0101882:	8b 45 08             	mov    0x8(%ebp),%eax
c0101885:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0101889:	83 e2 df             	and    $0xffffffdf,%edx
c010188c:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c010188f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101892:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0101896:	83 ca 40             	or     $0x40,%edx
c0101899:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 1;
c010189c:	8b 45 08             	mov    0x8(%ebp),%eax
c010189f:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c01018a3:	83 ca 80             	or     $0xffffff80,%edx
c01018a6:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = 0x0;
c01018a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01018ac:	c6 40 07 00          	movb   $0x0,0x7(%eax)
}
c01018b0:	5d                   	pop    %ebp
c01018b1:	c3                   	ret    

c01018b2 <set_tss>:

static TSS tss; 
inline static void
set_tss(Segdesc *ptr) {
c01018b2:	55                   	push   %ebp
c01018b3:	89 e5                	mov    %esp,%ebp
c01018b5:	83 ec 10             	sub    $0x10,%esp
	tss.ss0 = KSEL(SEG_KERNEL_DATA);
c01018b8:	c7 05 48 30 15 c0 10 	movl   $0x10,0xc0153048
c01018bf:	00 00 00 
	tss.esp0 = KSTACKTOP;
c01018c2:	c7 05 44 30 15 c0 00 	movl   $0xc0000000,0xc0153044
c01018c9:	00 00 c0 
	uint32_t base = (uint32_t)&tss;
c01018cc:	c7 45 fc 40 30 15 c0 	movl   $0xc0153040,-0x4(%ebp)
	uint32_t limit = sizeof(TSS) - 1;
c01018d3:	c7 45 f8 63 00 00 00 	movl   $0x63,-0x8(%ebp)
	ptr->limit_15_0  = limit & 0xffff;
c01018da:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01018dd:	89 c2                	mov    %eax,%edx
c01018df:	8b 45 08             	mov    0x8(%ebp),%eax
c01018e2:	66 89 10             	mov    %dx,(%eax)
	ptr->base_15_0   = base & 0xffff;
c01018e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01018e8:	89 c2                	mov    %eax,%edx
c01018ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01018ed:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->base_23_16  = (base >> 16) & 0xff;
c01018f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01018f4:	c1 e8 10             	shr    $0x10,%eax
c01018f7:	89 c2                	mov    %eax,%edx
c01018f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01018fc:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->type = STS_T32A;
c01018ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0101902:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101906:	83 e2 f0             	and    $0xfffffff0,%edx
c0101909:	83 ca 09             	or     $0x9,%edx
c010190c:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->segment_type = 0;
c010190f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101912:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101916:	83 e2 ef             	and    $0xffffffef,%edx
c0101919:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->privilege_level = DPL_USER;
c010191c:	8b 45 08             	mov    0x8(%ebp),%eax
c010191f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101923:	83 ca 60             	or     $0x60,%edx
c0101926:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->present = 1;
c0101929:	8b 45 08             	mov    0x8(%ebp),%eax
c010192c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
c0101930:	83 ca 80             	or     $0xffffff80,%edx
c0101933:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->limit_19_16 = limit >> 16;
c0101936:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0101939:	c1 e8 10             	shr    $0x10,%eax
c010193c:	83 e0 0f             	and    $0xf,%eax
c010193f:	89 c2                	mov    %eax,%edx
c0101941:	8b 45 08             	mov    0x8(%ebp),%eax
c0101944:	89 d1                	mov    %edx,%ecx
c0101946:	83 e1 0f             	and    $0xf,%ecx
c0101949:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010194d:	83 e2 f0             	and    $0xfffffff0,%edx
c0101950:	09 ca                	or     %ecx,%edx
c0101952:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->soft_use = 0;
c0101955:	8b 45 08             	mov    0x8(%ebp),%eax
c0101958:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c010195c:	83 e2 ef             	and    $0xffffffef,%edx
c010195f:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->operation_size = 0;
c0101962:	8b 45 08             	mov    0x8(%ebp),%eax
c0101965:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0101969:	83 e2 df             	and    $0xffffffdf,%edx
c010196c:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->pad0 = 1;
c010196f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101972:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0101976:	83 ca 40             	or     $0x40,%edx
c0101979:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->granularity = 0;
c010197c:	8b 45 08             	mov    0x8(%ebp),%eax
c010197f:	0f b6 50 06          	movzbl 0x6(%eax),%edx
c0101983:	83 e2 7f             	and    $0x7f,%edx
c0101986:	88 50 06             	mov    %dl,0x6(%eax)
	ptr->base_31_24  = base >> 24;
c0101989:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010198c:	c1 e8 18             	shr    $0x18,%eax
c010198f:	89 c2                	mov    %eax,%edx
c0101991:	8b 45 08             	mov    0x8(%ebp),%eax
c0101994:	88 50 07             	mov    %dl,0x7(%eax)
}
c0101997:	c9                   	leave  
c0101998:	c3                   	ret    

c0101999 <write_gdtr>:

void write_gdtr(void *addr, uint32_t size)
{
c0101999:	55                   	push   %ebp
c010199a:	89 e5                	mov    %esp,%ebp
	static volatile uint16_t data[3];
	data[0] = size - 1;
c010199c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010199f:	83 e8 01             	sub    $0x1,%eax
c01019a2:	66 a3 a4 30 15 c0    	mov    %ax,0xc01530a4
	data[1] = (uint32_t)addr;
c01019a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01019ab:	66 a3 a6 30 15 c0    	mov    %ax,0xc01530a6
	data[2] = ((uint32_t)addr) >> 16;
c01019b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01019b4:	c1 e8 10             	shr    $0x10,%eax
c01019b7:	66 a3 a8 30 15 c0    	mov    %ax,0xc01530a8
	asm volatile("lgdt (%0)" : : "r"(data));//lgdt(*data);
c01019bd:	b8 a4 30 15 c0       	mov    $0xc01530a4,%eax
c01019c2:	0f 01 10             	lgdtl  (%eax)
}
c01019c5:	5d                   	pop    %ebp
c01019c6:	c3                   	ret    

c01019c7 <load_tr>:

static inline void load_tr(uint16_t selector) 
{
c01019c7:	55                   	push   %ebp
c01019c8:	89 e5                	mov    %esp,%ebp
c01019ca:	83 ec 04             	sub    $0x4,%esp
c01019cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01019d0:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	asm volatile("ltr %0" : : "r"(selector));
c01019d4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01019d8:	0f 00 d8             	ltr    %ax
}
c01019db:	c9                   	leave  
c01019dc:	c3                   	ret    

c01019dd <init_segment>:

void
init_segment(void) {
c01019dd:	55                   	push   %ebp
c01019de:	89 e5                	mov    %esp,%ebp
c01019e0:	83 ec 18             	sub    $0x18,%esp
	memset(gdt, 0, sizeof(gdt));
c01019e3:	c7 44 24 08 38 00 00 	movl   $0x38,0x8(%esp)
c01019ea:	00 
c01019eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01019f2:	00 
c01019f3:	c7 04 24 00 30 15 c0 	movl   $0xc0153000,(%esp)
c01019fa:	e8 c8 05 00 00       	call   c0101fc7 <memset>
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
c01019ff:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0101a06:	00 
c0101a07:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101a0e:	00 
c0101a0f:	c7 04 24 08 30 15 c0 	movl   $0xc0153008,(%esp)
c0101a16:	e8 dd fd ff ff       	call   c01017f8 <set_segment>
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W );
c0101a1b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0101a22:	00 
c0101a23:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101a2a:	00 
c0101a2b:	c7 04 24 10 30 15 c0 	movl   $0xc0153010,(%esp)
c0101a32:	e8 c1 fd ff ff       	call   c01017f8 <set_segment>
	set_segment(&gdt[SEG_USER_CODE], DPL_USER, STA_X | STA_R);
c0101a37:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0101a3e:	00 
c0101a3f:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0101a46:	00 
c0101a47:	c7 04 24 18 30 15 c0 	movl   $0xc0153018,(%esp)
c0101a4e:	e8 a5 fd ff ff       	call   c01017f8 <set_segment>
	set_segment(&gdt[SEG_USER_DATA], DPL_USER, STA_W);
c0101a53:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0101a5a:	00 
c0101a5b:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0101a62:	00 
c0101a63:	c7 04 24 20 30 15 c0 	movl   $0xc0153020,(%esp)
c0101a6a:	e8 89 fd ff ff       	call   c01017f8 <set_segment>
	write_gdtr(gdt, sizeof(gdt));
c0101a6f:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c0101a76:	00 
c0101a77:	c7 04 24 00 30 15 c0 	movl   $0xc0153000,(%esp)
c0101a7e:	e8 16 ff ff ff       	call   c0101999 <write_gdtr>
	set_tss(&gdt[SEG_TSS]);
c0101a83:	c7 04 24 28 30 15 c0 	movl   $0xc0153028,(%esp)
c0101a8a:	e8 23 fe ff ff       	call   c01018b2 <set_tss>
	load_tr(USEL(SEG_TSS));
c0101a8f:	c7 04 24 2b 00 00 00 	movl   $0x2b,(%esp)
c0101a96:	e8 2c ff ff ff       	call   c01019c7 <load_tr>
}
c0101a9b:	c9                   	leave  
c0101a9c:	c3                   	ret    

c0101a9d <to_user>:

void to_user(PCB *p)
{
c0101a9d:	55                   	push   %ebp
c0101a9e:	89 e5                	mov    %esp,%ebp
c0101aa0:	83 ec 28             	sub    $0x28,%esp
	lcr3(PADDR(p->pgdir));
c0101aa3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aa6:	8b 40 4c             	mov    0x4c(%eax),%eax
c0101aa9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101aad:	c7 44 24 04 4f 00 00 	movl   $0x4f,0x4(%esp)
c0101ab4:	00 
c0101ab5:	c7 04 24 2c 30 10 c0 	movl   $0xc010302c,(%esp)
c0101abc:	e8 fc fc ff ff       	call   c01017bd <_paddr>
c0101ac1:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

static __inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
c0101ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ac7:	0f 22 d8             	mov    %eax,%cr3
	asm volatile("mov %0, %%ds" : : "r"(p->tf.ds));
c0101aca:	8b 45 08             	mov    0x8(%ebp),%eax
c0101acd:	8b 40 2c             	mov    0x2c(%eax),%eax
c0101ad0:	8e d8                	mov    %eax,%ds
	asm volatile("mov %0, %%es" : : "r"(p->tf.es));
c0101ad2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ad5:	8b 40 28             	mov    0x28(%eax),%eax
c0101ad8:	8e c0                	mov    %eax,%es
	asm volatile("mov %0, %%fs" : : "r"(p->tf.fs));
c0101ada:	8b 45 08             	mov    0x8(%ebp),%eax
c0101add:	8b 40 24             	mov    0x24(%eax),%eax
c0101ae0:	8e e0                	mov    %eax,%fs
	asm volatile("mov %0, %%gs" : : "r"(p->tf.gs));
c0101ae2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ae5:	8b 40 20             	mov    0x20(%eax),%eax
c0101ae8:	8e e8                	mov    %eax,%gs
	asm volatile("pushl %0" : : "r"((uint32_t)p->tf.ss));
c0101aea:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aed:	0f b7 40 48          	movzwl 0x48(%eax),%eax
c0101af1:	0f b7 c0             	movzwl %ax,%eax
c0101af4:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"(p->tf.esp));
c0101af5:	8b 45 08             	mov    0x8(%ebp),%eax
c0101af8:	8b 40 44             	mov    0x44(%eax),%eax
c0101afb:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"(p->tf.eflags));
c0101afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101aff:	8b 40 40             	mov    0x40(%eax),%eax
c0101b02:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"((uint32_t)p->tf.cs));
c0101b03:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b06:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
c0101b0a:	0f b7 c0             	movzwl %ax,%eax
c0101b0d:	50                   	push   %eax
	asm volatile("pushl %0" : : "r"(p->tf.eip));
c0101b0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b11:	8b 40 38             	mov    0x38(%eax),%eax
c0101b14:	50                   	push   %eax
	asm volatile("iret");	
c0101b15:	cf                   	iret   
}
c0101b16:	c9                   	leave  
c0101b17:	c3                   	ret    

c0101b18 <_panic>:

static const char *panicstr;

void
_panic(const char *file, int line, const char *fmt,...)
{
c0101b18:	55                   	push   %ebp
c0101b19:	89 e5                	mov    %esp,%ebp
c0101b1b:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	if (panicstr)
c0101b1e:	a1 ac 30 15 c0       	mov    0xc01530ac,%eax
c0101b23:	85 c0                	test   %eax,%eax
c0101b25:	74 01                	je     c0101b28 <_panic+0x10>
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
c0101b27:	f4                   	hlt    
		hlt();
	panicstr = fmt;
c0101b28:	8b 45 10             	mov    0x10(%ebp),%eax
c0101b2b:	a3 ac 30 15 c0       	mov    %eax,0xc01530ac

	// Be extra sure that the machine is in as reasonable state
	__asm __volatile("cli; cld");
c0101b30:	fa                   	cli    
c0101b31:	fc                   	cld    

	va_start(ap, fmt);
c0101b32:	8d 45 14             	lea    0x14(%ebp),%eax
c0101b35:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel panic at %s:%d: ", file, line);
c0101b38:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b3b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101b3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b42:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101b46:	c7 04 24 3f 30 10 c0 	movl   $0xc010303f,(%esp)
c0101b4d:	e8 f5 00 00 00       	call   c0101c47 <printk>
	vprintk(fmt, ap);
c0101b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b55:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101b59:	8b 45 10             	mov    0x10(%ebp),%eax
c0101b5c:	89 04 24             	mov    %eax,(%esp)
c0101b5f:	e8 b0 00 00 00       	call   c0101c14 <vprintk>
	printk("\n");
c0101b64:	c7 04 24 57 30 10 c0 	movl   $0xc0103057,(%esp)
c0101b6b:	e8 d7 00 00 00       	call   c0101c47 <printk>
	va_end(ap);

}
c0101b70:	c9                   	leave  
c0101b71:	c3                   	ret    

c0101b72 <_warn>:

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt,...)
{
c0101b72:	55                   	push   %ebp
c0101b73:	89 e5                	mov    %esp,%ebp
c0101b75:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c0101b78:	8d 45 14             	lea    0x14(%ebp),%eax
c0101b7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printk("kernel warning at %s:%d: ", file, line);
c0101b7e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b81:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101b85:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b88:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101b8c:	c7 04 24 59 30 10 c0 	movl   $0xc0103059,(%esp)
c0101b93:	e8 af 00 00 00       	call   c0101c47 <printk>
	vprintk(fmt, ap);
c0101b98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101b9f:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ba2:	89 04 24             	mov    %eax,(%esp)
c0101ba5:	e8 6a 00 00 00       	call   c0101c14 <vprintk>
	printk("\n");
c0101baa:	c7 04 24 57 30 10 c0 	movl   $0xc0103057,(%esp)
c0101bb1:	e8 91 00 00 00       	call   c0101c47 <printk>
	va_end(ap);
}
c0101bb6:	c9                   	leave  
c0101bb7:	c3                   	ret    

c0101bb8 <sys_write>:
#include "stdio.h"
#include "serial.h"

int sys_write(int fd, const char *buf, int n)
{
c0101bb8:	55                   	push   %ebp
c0101bb9:	89 e5                	mov    %esp,%ebp
c0101bbb:	83 ec 28             	sub    $0x28,%esp
	int i;
	if (fd == 1) {
c0101bbe:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0101bc2:	75 2b                	jne    c0101bef <sys_write+0x37>
		for (i = 0; i < n; i++) {
c0101bc4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101bcb:	eb 1a                	jmp    c0101be7 <sys_write+0x2f>
			serial_printc(buf[i]);
c0101bcd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101bd0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101bd3:	01 d0                	add    %edx,%eax
c0101bd5:	0f b6 00             	movzbl (%eax),%eax
c0101bd8:	0f be c0             	movsbl %al,%eax
c0101bdb:	89 04 24             	mov    %eax,(%esp)
c0101bde:	e8 7a ee ff ff       	call   c0100a5d <serial_printc>

int sys_write(int fd, const char *buf, int n)
{
	int i;
	if (fd == 1) {
		for (i = 0; i < n; i++) {
c0101be3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101be7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bea:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101bed:	7c de                	jl     c0101bcd <sys_write+0x15>
			serial_printc(buf[i]);
		}
	}
	return n;
c0101bef:	8b 45 10             	mov    0x10(%ebp),%eax
c0101bf2:	c9                   	leave  
c0101bf3:	c3                   	ret    

c0101bf4 <putch>:
#include "stdarg.h"

void putchar(int);

static void putch(int ch, int *cnt)
{
c0101bf4:	55                   	push   %ebp
c0101bf5:	89 e5                	mov    %esp,%ebp
c0101bf7:	83 ec 18             	sub    $0x18,%esp
	putchar(ch);
c0101bfa:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bfd:	89 04 24             	mov    %eax,(%esp)
c0101c00:	e8 82 ee ff ff       	call   c0100a87 <putchar>
	++*cnt;
c0101c05:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c08:	8b 00                	mov    (%eax),%eax
c0101c0a:	8d 50 01             	lea    0x1(%eax),%edx
c0101c0d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c10:	89 10                	mov    %edx,(%eax)
}
c0101c12:	c9                   	leave  
c0101c13:	c3                   	ret    

c0101c14 <vprintk>:

int vprintk(const char *fmt, va_list ap)
{
c0101c14:	55                   	push   %ebp
c0101c15:	89 e5                	mov    %esp,%ebp
c0101c17:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0101c1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void*)putch, &cnt, fmt, ap);
c0101c21:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c24:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101c28:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c2b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101c2f:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0101c32:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c36:	c7 04 24 f4 1b 10 c0 	movl   $0xc0101bf4,(%esp)
c0101c3d:	e8 8d 09 00 00       	call   c01025cf <vprintfmt>
	return cnt;
c0101c42:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101c45:	c9                   	leave  
c0101c46:	c3                   	ret    

c0101c47 <printk>:

int printk(const char *fmt, ...)
{
c0101c47:	55                   	push   %ebp
c0101c48:	89 e5                	mov    %esp,%ebp
c0101c4a:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;
	va_start(ap, fmt);
c0101c4d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0101c50:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintk(fmt, ap);
c0101c53:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101c56:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c5d:	89 04 24             	mov    %eax,(%esp)
c0101c60:	e8 af ff ff ff       	call   c0101c14 <vprintk>
c0101c65:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);
	return cnt;
c0101c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c6b:	c9                   	leave  
c0101c6c:	c3                   	ret    

c0101c6d <vec0>:
# 中断和异常处理函数的入口
# 中断处理函数会在IDT中为相应的中�?异常设置处理程序
# 中断/异常的行为参见i386手册
#include "mmu.h"
.globl vec0; vec0: pushl $0;pushl $0; jmp asm_do_irq
c0101c6d:	6a 00                	push   $0x0
c0101c6f:	6a 00                	push   $0x0
c0101c71:	e9 a9 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101c76 <vec1>:
.globl vec1; vec1: pushl $0;pushl $1; jmp asm_do_irq
c0101c76:	6a 00                	push   $0x0
c0101c78:	6a 01                	push   $0x1
c0101c7a:	e9 a0 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101c7f <vec2>:
.globl vec2; vec2: pushl $0;pushl $2; jmp asm_do_irq
c0101c7f:	6a 00                	push   $0x0
c0101c81:	6a 02                	push   $0x2
c0101c83:	e9 97 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101c88 <vec3>:
.globl vec3; vec3: pushl $0;pushl $3; jmp asm_do_irq
c0101c88:	6a 00                	push   $0x0
c0101c8a:	6a 03                	push   $0x3
c0101c8c:	e9 8e 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101c91 <vec4>:
.globl vec4; vec4: pushl $0;pushl $4; jmp asm_do_irq
c0101c91:	6a 00                	push   $0x0
c0101c93:	6a 04                	push   $0x4
c0101c95:	e9 85 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101c9a <vec5>:
.globl vec5; vec5: pushl $0;pushl $5; jmp asm_do_irq
c0101c9a:	6a 00                	push   $0x0
c0101c9c:	6a 05                	push   $0x5
c0101c9e:	e9 7c 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101ca3 <vec6>:
.globl vec6; vec6: pushl $0;pushl $6; jmp asm_do_irq
c0101ca3:	6a 00                	push   $0x0
c0101ca5:	6a 06                	push   $0x6
c0101ca7:	e9 73 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cac <vec7>:
.globl vec7; vec7: pushl $0;pushl $7; jmp asm_do_irq
c0101cac:	6a 00                	push   $0x0
c0101cae:	6a 07                	push   $0x7
c0101cb0:	e9 6a 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cb5 <vec8>:
.globl vec8; vec8: 	  pushl $8; jmp asm_do_irq
c0101cb5:	6a 08                	push   $0x8
c0101cb7:	e9 63 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cbc <vec9>:
.globl vec9; vec9: pushl $0;pushl $9; jmp asm_do_irq
c0101cbc:	6a 00                	push   $0x0
c0101cbe:	6a 09                	push   $0x9
c0101cc0:	e9 5a 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cc5 <vec10>:
.globl vec10; vec10: 	  pushl $10; jmp asm_do_irq
c0101cc5:	6a 0a                	push   $0xa
c0101cc7:	e9 53 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101ccc <vec11>:
.globl vec11; vec11: 	  pushl $11; jmp asm_do_irq
c0101ccc:	6a 0b                	push   $0xb
c0101cce:	e9 4c 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cd3 <vec12>:
.globl vec12; vec12: 	  pushl $12; jmp asm_do_irq
c0101cd3:	6a 0c                	push   $0xc
c0101cd5:	e9 45 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cda <vec13>:
.globl vec13; vec13: 	  pushl $13; jmp asm_do_irq
c0101cda:	6a 0d                	push   $0xd
c0101cdc:	e9 3e 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101ce1 <vec14>:
.globl vec14; vec14:        pushl $14; jmp asm_do_irq
c0101ce1:	6a 0e                	push   $0xe
c0101ce3:	e9 37 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101ce8 <vecsys>:
.globl vecsys;vecsys:pushl $0;pushl $0x80; jmp asm_do_irq
c0101ce8:	6a 00                	push   $0x0
c0101cea:	68 80 00 00 00       	push   $0x80
c0101cef:	e9 2b 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101cf4 <irq0>:
.globl irq0; irq0:   pushl $0;pushl $1000; jmp asm_do_irq
c0101cf4:	6a 00                	push   $0x0
c0101cf6:	68 e8 03 00 00       	push   $0x3e8
c0101cfb:	e9 1f 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101d00 <irq1>:
.globl irq1; irq1:   pushl $0;pushl $1001; jmp asm_do_irq
c0101d00:	6a 00                	push   $0x0
c0101d02:	68 e9 03 00 00       	push   $0x3e9
c0101d07:	e9 13 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101d0c <irq14>:
.globl irq14;irq14:  pushl $0;pushl $1014; jmp asm_do_irq
c0101d0c:	6a 00                	push   $0x0
c0101d0e:	68 f6 03 00 00       	push   $0x3f6
c0101d13:	e9 07 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101d18 <irq_empty>:
.globl irq_empty; irq_empty: pushl $-1; jmp asm_do_irq
c0101d18:	6a ff                	push   $0xffffffff
c0101d1a:	e9 00 00 00 00       	jmp    c0101d1f <asm_do_irq>

c0101d1f <asm_do_irq>:

# ！调用C编写的中断处理程�?见irq/irq_handle.c)�?
.globl asm_do_irq
.extern irq_handle
asm_do_irq:
	pushl %ds
c0101d1f:	1e                   	push   %ds
  	pushl %es
c0101d20:	06                   	push   %es
  	pushl %fs
c0101d21:	0f a0                	push   %fs
  	pushl %gs
c0101d23:	0f a8                	push   %gs
	pushal
c0101d25:	60                   	pusha  
	movw $KSEL(SEG_KERNEL_DATA), %ax
c0101d26:	66 b8 10 00          	mov    $0x10,%ax
  	movw %ax, %ds
c0101d2a:	8e d8                	mov    %eax,%ds
  	movw %ax, %es
c0101d2c:	8e c0                	mov    %eax,%es
	pushl %esp			# ???
c0101d2e:	54                   	push   %esp
	call irq_handle
c0101d2f:	e8 a8 e9 ff ff       	call   c01006dc <irq_handle>
	addl $4, %esp
c0101d34:	83 c4 04             	add    $0x4,%esp

	popal
c0101d37:	61                   	popa   
	popl %gs
c0101d38:	0f a9                	pop    %gs
  	popl %fs
c0101d3a:	0f a1                	pop    %fs
  	popl %es
c0101d3c:	07                   	pop    %es
  	popl %ds
c0101d3d:	1f                   	pop    %ds
	addl $8, %esp
c0101d3e:	83 c4 08             	add    $0x8,%esp
	iret
c0101d41:	cf                   	iret   
c0101d42:	66 90                	xchg   %ax,%ax
c0101d44:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
c0101d4a:	00 00                	add    %al,(%eax)
c0101d4c:	fe 4f 52             	decb   0x52(%edi)
c0101d4f:	e4 66                	in     $0x66,%al

c0101d50 <entry>:
.globl		_start
_start = RELOC(entry)

.globl entry
entry:
	movw	$0x1234,0x472			# warm boot
c0101d50:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
c0101d57:	34 12 
	# sufficient until we set up our real page table in mem_init
	# in lab 2.

	# Load the physical address of entry_pgdir into cr3.  entry_pgdir
	# is defined in entrypgdir.c.
	movl	$(RELOC(entry_pgdir)), %eax
c0101d59:	b8 00 60 10 00       	mov    $0x106000,%eax
	movl	%eax, %cr3
c0101d5e:	0f 22 d8             	mov    %eax,%cr3
	# Turn on paging.
	movl	%cr0, %eax
c0101d61:	0f 20 c0             	mov    %cr0,%eax
	orl	$(CR0_PE|CR0_PG|CR0_WP), %eax
c0101d64:	0d 01 00 01 80       	or     $0x80010001,%eax
	movl	%eax, %cr0
c0101d69:	0f 22 c0             	mov    %eax,%cr0

	# Now paging is enabled, but we're still running at a low EIP
	# (why is this okay?).  Jump up above KERNBASE before entering
	# C code.
	mov	$relocated, %eax
c0101d6c:	b8 73 1d 10 c0       	mov    $0xc0101d73,%eax
	jmp	*%eax
c0101d71:	ff e0                	jmp    *%eax

c0101d73 <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
c0101d73:	bd 00 00 00 00       	mov    $0x0,%ebp

	# Set the stack pointer
	movl	$(bootstacktop),%esp
c0101d78:	bc 00 00 11 c0       	mov    $0xc0110000,%esp

	# now to C code

	call	main
c0101d7d:	e8 85 e3 ff ff       	call   c0100107 <main>

c0101d82 <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
c0101d82:	eb fe                	jmp    c0101d82 <spin>

c0101d84 <draw_pixel>:
#include "video.h"

static uint8_t buff[SCR_SIZE];

void
draw_pixel(int x, int y, int color) {
c0101d84:	55                   	push   %ebp
c0101d85:	89 e5                	mov    %esp,%ebp
c0101d87:	83 ec 18             	sub    $0x18,%esp
	assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
c0101d8a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101d8e:	78 18                	js     c0101da8 <draw_pixel+0x24>
c0101d90:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0101d94:	78 12                	js     c0101da8 <draw_pixel+0x24>
c0101d96:	81 7d 08 c7 00 00 00 	cmpl   $0xc7,0x8(%ebp)
c0101d9d:	7f 09                	jg     c0101da8 <draw_pixel+0x24>
c0101d9f:	81 7d 0c 3f 01 00 00 	cmpl   $0x13f,0xc(%ebp)
c0101da6:	7e 24                	jle    c0101dcc <draw_pixel+0x48>
c0101da8:	c7 44 24 0c 74 30 10 	movl   $0xc0103074,0xc(%esp)
c0101daf:	c0 
c0101db0:	c7 44 24 08 a8 30 10 	movl   $0xc01030a8,0x8(%esp)
c0101db7:	c0 
c0101db8:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
c0101dbf:	00 
c0101dc0:	c7 04 24 bd 30 10 c0 	movl   $0xc01030bd,(%esp)
c0101dc7:	e8 4c fd ff ff       	call   c0101b18 <_panic>
	buff[(x << 8) + (x << 6) + y] = color;
c0101dcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dcf:	c1 e0 08             	shl    $0x8,%eax
c0101dd2:	89 c2                	mov    %eax,%edx
c0101dd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dd7:	c1 e0 06             	shl    $0x6,%eax
c0101dda:	01 c2                	add    %eax,%edx
c0101ddc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ddf:	01 c2                	add    %eax,%edx
c0101de1:	8b 45 10             	mov    0x10(%ebp),%eax
c0101de4:	88 82 c0 30 15 c0    	mov    %al,-0x3feacf40(%edx)
}
c0101dea:	c9                   	leave  
c0101deb:	c3                   	ret    

c0101dec <sysclean>:


void sysclean(void)
{
c0101dec:	55                   	push   %ebp
c0101ded:	89 e5                	mov    %esp,%ebp
c0101def:	83 ec 18             	sub    $0x18,%esp
	memset(buff, 0, sizeof(buff));
c0101df2:	c7 44 24 08 00 fa 00 	movl   $0xfa00,0x8(%esp)
c0101df9:	00 
c0101dfa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101e01:	00 
c0101e02:	c7 04 24 c0 30 15 c0 	movl   $0xc01530c0,(%esp)
c0101e09:	e8 b9 01 00 00       	call   c0101fc7 <memset>
}
c0101e0e:	c9                   	leave  
c0101e0f:	c3                   	ret    

c0101e10 <syspr>:
int syspr()
{
c0101e10:	55                   	push   %ebp
c0101e11:	89 e5                	mov    %esp,%ebp
c0101e13:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_pr, buff);
c0101e16:	c7 44 24 04 c0 30 15 	movl   $0xc01530c0,0x4(%esp)
c0101e1d:	c0 
c0101e1e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101e25:	e8 53 00 00 00       	call   c0101e7d <syscall>
}
c0101e2a:	c9                   	leave  
c0101e2b:	c3                   	ret    

c0101e2c <systime>:

int systime(void)
{
c0101e2c:	55                   	push   %ebp
c0101e2d:	89 e5                	mov    %esp,%ebp
c0101e2f:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_time);
c0101e32:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0101e39:	e8 3f 00 00 00       	call   c0101e7d <syscall>
}
c0101e3e:	c9                   	leave  
c0101e3f:	c3                   	ret    

c0101e40 <sysreadkey>:

int sysreadkey(void)
{
c0101e40:	55                   	push   %ebp
c0101e41:	89 e5                	mov    %esp,%ebp
c0101e43:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_readkey);
c0101e46:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0101e4d:	e8 2b 00 00 00       	call   c0101e7d <syscall>
}
c0101e52:	c9                   	leave  
c0101e53:	c3                   	ret    

c0101e54 <syswrite>:

int syswrite(int fd, const void*buf1, int n)
{
c0101e54:	55                   	push   %ebp
c0101e55:	89 e5                	mov    %esp,%ebp
c0101e57:	83 ec 18             	sub    $0x18,%esp
	return syscall(SYS_write, fd, buf1, n);
c0101e5a:	8b 45 10             	mov    0x10(%ebp),%eax
c0101e5d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101e61:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101e64:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e6b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101e6f:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0101e76:	e8 02 00 00 00       	call   c0101e7d <syscall>
c0101e7b:	c9                   	leave  
c0101e7c:	c3                   	ret    

c0101e7d <syscall>:
#include "stdarg.h"

int __attribute__((__noinline__))
syscall(int id, ...)
{
c0101e7d:	55                   	push   %ebp
c0101e7e:	89 e5                	mov    %esp,%ebp
c0101e80:	53                   	push   %ebx
c0101e81:	83 ec 10             	sub    $0x10,%esp
	int ret;
    	int *args = &id;
c0101e84:	8d 45 08             	lea    0x8(%ebp),%eax
c0101e87:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
c0101e8a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0101e8d:	8b 00                	mov    (%eax),%eax
c0101e8f:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0101e92:	83 c2 04             	add    $0x4,%edx
c0101e95:	8b 1a                	mov    (%edx),%ebx
c0101e97:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0101e9a:	83 c2 08             	add    $0x8,%edx
c0101e9d:	8b 0a                	mov    (%edx),%ecx
c0101e9f:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0101ea2:	83 c2 0c             	add    $0xc,%edx
c0101ea5:	8b 12                	mov    (%edx),%edx
c0101ea7:	cd 80                	int    $0x80
c0101ea9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
c0101eac:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101eaf:	83 c4 10             	add    $0x10,%esp
c0101eb2:	5b                   	pop    %ebx
c0101eb3:	5d                   	pop    %ebp
c0101eb4:	c3                   	ret    

c0101eb5 <putch>:

#define MAX_BUF 1000
static char buf[MAX_BUF];

static void putch(int ch, int *cnt)
{
c0101eb5:	55                   	push   %ebp
c0101eb6:	89 e5                	mov    %esp,%ebp
	buf[(*cnt)++] = ch;
c0101eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ebb:	8b 00                	mov    (%eax),%eax
c0101ebd:	8d 48 01             	lea    0x1(%eax),%ecx
c0101ec0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101ec3:	89 0a                	mov    %ecx,(%edx)
c0101ec5:	8b 55 08             	mov    0x8(%ebp),%edx
c0101ec8:	88 90 c0 2a 16 c0    	mov    %dl,-0x3fe9d540(%eax)
}
c0101ece:	5d                   	pop    %ebp
c0101ecf:	c3                   	ret    

c0101ed0 <vprintf>:
int vprintf(const char *fmt, va_list ap)
{
c0101ed0:	55                   	push   %ebp
c0101ed1:	89 e5                	mov    %esp,%ebp
c0101ed3:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
c0101ed6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	vprintfmt((void *)putch, &cnt, fmt, ap);
c0101edd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ee0:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101ee4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ee7:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101eeb:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0101eee:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101ef2:	c7 04 24 b5 1e 10 c0 	movl   $0xc0101eb5,(%esp)
c0101ef9:	e8 d1 06 00 00       	call   c01025cf <vprintfmt>
	return cnt;
c0101efe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0101f01:	c9                   	leave  
c0101f02:	c3                   	ret    

c0101f03 <printf>:
int printf(const char *fmt, ...)
{
c0101f03:	55                   	push   %ebp
c0101f04:	89 e5                	mov    %esp,%ebp
c0101f06:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
c0101f09:	8d 45 0c             	lea    0xc(%ebp),%eax
c0101f0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	cnt = vprintf(fmt, ap);
c0101f0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f12:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101f16:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f19:	89 04 24             	mov    %eax,(%esp)
c0101f1c:	e8 af ff ff ff       	call   c0101ed0 <vprintf>
c0101f21:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	syswrite(stdout, buf, cnt);
c0101f24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f27:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101f2b:	c7 44 24 04 c0 2a 16 	movl   $0xc0162ac0,0x4(%esp)
c0101f32:	c0 
c0101f33:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101f3a:	e8 15 ff ff ff       	call   c0101e54 <syswrite>
	return cnt;
c0101f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f42:	c9                   	leave  
c0101f43:	c3                   	ret    

c0101f44 <itoa>:
/* 注意！itoa只有一个缓冲，因此
 * char *p = itoa(100);
 * char *q = itoa(200);
 * 后p和q所指内容都�?200"�?
 */
char *itoa(int a) {
c0101f44:	55                   	push   %ebp
c0101f45:	89 e5                	mov    %esp,%ebp
c0101f47:	83 ec 10             	sub    $0x10,%esp
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
c0101f4a:	c7 45 fc c5 2e 16 c0 	movl   $0xc0162ec5,-0x4(%ebp)
	do {
		*--p = '0' + a % 10;
c0101f51:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c0101f55:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101f58:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101f5d:	89 c8                	mov    %ecx,%eax
c0101f5f:	f7 ea                	imul   %edx
c0101f61:	c1 fa 02             	sar    $0x2,%edx
c0101f64:	89 c8                	mov    %ecx,%eax
c0101f66:	c1 f8 1f             	sar    $0x1f,%eax
c0101f69:	29 c2                	sub    %eax,%edx
c0101f6b:	89 d0                	mov    %edx,%eax
c0101f6d:	c1 e0 02             	shl    $0x2,%eax
c0101f70:	01 d0                	add    %edx,%eax
c0101f72:	01 c0                	add    %eax,%eax
c0101f74:	29 c1                	sub    %eax,%ecx
c0101f76:	89 ca                	mov    %ecx,%edx
c0101f78:	89 d0                	mov    %edx,%eax
c0101f7a:	83 c0 30             	add    $0x30,%eax
c0101f7d:	89 c2                	mov    %eax,%edx
c0101f7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101f82:	88 10                	mov    %dl,(%eax)
	} while (a /= 10);
c0101f84:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101f87:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101f8c:	89 c8                	mov    %ecx,%eax
c0101f8e:	f7 ea                	imul   %edx
c0101f90:	c1 fa 02             	sar    $0x2,%edx
c0101f93:	89 c8                	mov    %ecx,%eax
c0101f95:	c1 f8 1f             	sar    $0x1f,%eax
c0101f98:	29 c2                	sub    %eax,%edx
c0101f9a:	89 d0                	mov    %edx,%eax
c0101f9c:	89 45 08             	mov    %eax,0x8(%ebp)
c0101f9f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0101fa3:	75 ac                	jne    c0101f51 <itoa+0xd>
	return p;
c0101fa5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0101fa8:	c9                   	leave  
c0101fa9:	c3                   	ret    

c0101faa <memcpy>:

void memcpy(void *dest, const void *src, size_t size) {
c0101faa:	55                   	push   %ebp
c0101fab:	89 e5                	mov    %esp,%ebp
c0101fad:	57                   	push   %edi
c0101fae:	56                   	push   %esi
c0101faf:	53                   	push   %ebx
	asm volatile ("cld; rep movsb" : : "c"(size), "S"(src), "D"(dest));
c0101fb0:	8b 45 10             	mov    0x10(%ebp),%eax
c0101fb3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101fb6:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101fb9:	89 c1                	mov    %eax,%ecx
c0101fbb:	89 d6                	mov    %edx,%esi
c0101fbd:	89 df                	mov    %ebx,%edi
c0101fbf:	fc                   	cld    
c0101fc0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
c0101fc2:	5b                   	pop    %ebx
c0101fc3:	5e                   	pop    %esi
c0101fc4:	5f                   	pop    %edi
c0101fc5:	5d                   	pop    %ebp
c0101fc6:	c3                   	ret    

c0101fc7 <memset>:

void memset(void *dest, int data, size_t size) {
c0101fc7:	55                   	push   %ebp
c0101fc8:	89 e5                	mov    %esp,%ebp
c0101fca:	57                   	push   %edi
c0101fcb:	53                   	push   %ebx
	asm volatile ("cld; rep stosb" : : "c"(size), "a"(data), "D"(dest));
c0101fcc:	8b 55 10             	mov    0x10(%ebp),%edx
c0101fcf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fd2:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101fd5:	89 d1                	mov    %edx,%ecx
c0101fd7:	89 df                	mov    %ebx,%edi
c0101fd9:	fc                   	cld    
c0101fda:	f3 aa                	rep stos %al,%es:(%edi)
}
c0101fdc:	5b                   	pop    %ebx
c0101fdd:	5f                   	pop    %edi
c0101fde:	5d                   	pop    %ebp
c0101fdf:	c3                   	ret    

c0101fe0 <strlen>:

size_t strlen(const char *str) {
c0101fe0:	55                   	push   %ebp
c0101fe1:	89 e5                	mov    %esp,%ebp
c0101fe3:	83 ec 10             	sub    $0x10,%esp
	int len = 0;
c0101fe6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	while (*str ++) len ++;
c0101fed:	eb 04                	jmp    c0101ff3 <strlen+0x13>
c0101fef:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ff6:	8d 50 01             	lea    0x1(%eax),%edx
c0101ff9:	89 55 08             	mov    %edx,0x8(%ebp)
c0101ffc:	0f b6 00             	movzbl (%eax),%eax
c0101fff:	84 c0                	test   %al,%al
c0102001:	75 ec                	jne    c0101fef <strlen+0xf>
	return len;
c0102003:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102006:	c9                   	leave  
c0102007:	c3                   	ret    

c0102008 <strcpy>:

void strcpy(char *d, const char *s) {
c0102008:	55                   	push   %ebp
c0102009:	89 e5                	mov    %esp,%ebp
c010200b:	83 ec 0c             	sub    $0xc,%esp
	memcpy(d, s, strlen(s) + 1);
c010200e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102011:	89 04 24             	mov    %eax,(%esp)
c0102014:	e8 c7 ff ff ff       	call   c0101fe0 <strlen>
c0102019:	83 c0 01             	add    $0x1,%eax
c010201c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102020:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102023:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102027:	8b 45 08             	mov    0x8(%ebp),%eax
c010202a:	89 04 24             	mov    %eax,(%esp)
c010202d:	e8 78 ff ff ff       	call   c0101faa <memcpy>
}
c0102032:	c9                   	leave  
c0102033:	c3                   	ret    

c0102034 <strnlen>:

int
strnlen(const char *s, size_t size)
{
c0102034:	55                   	push   %ebp
c0102035:	89 e5                	mov    %esp,%ebp
c0102037:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c010203a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102041:	eb 0c                	jmp    c010204f <strnlen+0x1b>
		n++;
c0102043:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
c0102047:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010204b:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c010204f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102053:	74 0a                	je     c010205f <strnlen+0x2b>
c0102055:	8b 45 08             	mov    0x8(%ebp),%eax
c0102058:	0f b6 00             	movzbl (%eax),%eax
c010205b:	84 c0                	test   %al,%al
c010205d:	75 e4                	jne    c0102043 <strnlen+0xf>
		n++;
	return n;
c010205f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
c0102062:	c9                   	leave  
c0102063:	c3                   	ret    

c0102064 <strncpy>:



char *
strncpy(char *dst, const char *src, size_t size) {
c0102064:	55                   	push   %ebp
c0102065:	89 e5                	mov    %esp,%ebp
c0102067:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
c010206a:	8b 45 08             	mov    0x8(%ebp),%eax
c010206d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
c0102070:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102077:	eb 23                	jmp    c010209c <strncpy+0x38>
		*dst++ = *src;
c0102079:	8b 45 08             	mov    0x8(%ebp),%eax
c010207c:	8d 50 01             	lea    0x1(%eax),%edx
c010207f:	89 55 08             	mov    %edx,0x8(%ebp)
c0102082:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102085:	0f b6 12             	movzbl (%edx),%edx
c0102088:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
c010208a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010208d:	0f b6 00             	movzbl (%eax),%eax
c0102090:	84 c0                	test   %al,%al
c0102092:	74 04                	je     c0102098 <strncpy+0x34>
			src++;
c0102094:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
c0102098:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010209c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010209f:	3b 45 10             	cmp    0x10(%ebp),%eax
c01020a2:	72 d5                	jb     c0102079 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
c01020a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c01020a7:	c9                   	leave  
c01020a8:	c3                   	ret    

c01020a9 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
c01020a9:	55                   	push   %ebp
c01020aa:	89 e5                	mov    %esp,%ebp
c01020ac:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
c01020af:	8b 45 08             	mov    0x8(%ebp),%eax
c01020b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
c01020b5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01020b9:	74 33                	je     c01020ee <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
c01020bb:	eb 17                	jmp    c01020d4 <strlcpy+0x2b>
			*dst++ = *src++;
c01020bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01020c0:	8d 50 01             	lea    0x1(%eax),%edx
c01020c3:	89 55 08             	mov    %edx,0x8(%ebp)
c01020c6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01020c9:	8d 4a 01             	lea    0x1(%edx),%ecx
c01020cc:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c01020cf:	0f b6 12             	movzbl (%edx),%edx
c01020d2:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
c01020d4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01020d8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01020dc:	74 0a                	je     c01020e8 <strlcpy+0x3f>
c01020de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020e1:	0f b6 00             	movzbl (%eax),%eax
c01020e4:	84 c0                	test   %al,%al
c01020e6:	75 d5                	jne    c01020bd <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
c01020e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01020eb:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
c01020ee:	8b 55 08             	mov    0x8(%ebp),%edx
c01020f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01020f4:	29 c2                	sub    %eax,%edx
c01020f6:	89 d0                	mov    %edx,%eax
}
c01020f8:	c9                   	leave  
c01020f9:	c3                   	ret    

c01020fa <strcmp>:

int
strcmp(const char *p, const char *q)
{
c01020fa:	55                   	push   %ebp
c01020fb:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
c01020fd:	eb 08                	jmp    c0102107 <strcmp+0xd>
		p++, q++;
c01020ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102103:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
c0102107:	8b 45 08             	mov    0x8(%ebp),%eax
c010210a:	0f b6 00             	movzbl (%eax),%eax
c010210d:	84 c0                	test   %al,%al
c010210f:	74 10                	je     c0102121 <strcmp+0x27>
c0102111:	8b 45 08             	mov    0x8(%ebp),%eax
c0102114:	0f b6 10             	movzbl (%eax),%edx
c0102117:	8b 45 0c             	mov    0xc(%ebp),%eax
c010211a:	0f b6 00             	movzbl (%eax),%eax
c010211d:	38 c2                	cmp    %al,%dl
c010211f:	74 de                	je     c01020ff <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
c0102121:	8b 45 08             	mov    0x8(%ebp),%eax
c0102124:	0f b6 00             	movzbl (%eax),%eax
c0102127:	0f b6 d0             	movzbl %al,%edx
c010212a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010212d:	0f b6 00             	movzbl (%eax),%eax
c0102130:	0f b6 c0             	movzbl %al,%eax
c0102133:	29 c2                	sub    %eax,%edx
c0102135:	89 d0                	mov    %edx,%eax
}
c0102137:	5d                   	pop    %ebp
c0102138:	c3                   	ret    

c0102139 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
c0102139:	55                   	push   %ebp
c010213a:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
c010213c:	eb 0c                	jmp    c010214a <strncmp+0x11>
		n--, p++, q++;
c010213e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0102142:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102146:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
c010214a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010214e:	74 1a                	je     c010216a <strncmp+0x31>
c0102150:	8b 45 08             	mov    0x8(%ebp),%eax
c0102153:	0f b6 00             	movzbl (%eax),%eax
c0102156:	84 c0                	test   %al,%al
c0102158:	74 10                	je     c010216a <strncmp+0x31>
c010215a:	8b 45 08             	mov    0x8(%ebp),%eax
c010215d:	0f b6 10             	movzbl (%eax),%edx
c0102160:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102163:	0f b6 00             	movzbl (%eax),%eax
c0102166:	38 c2                	cmp    %al,%dl
c0102168:	74 d4                	je     c010213e <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
c010216a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010216e:	75 07                	jne    c0102177 <strncmp+0x3e>
		return 0;
c0102170:	b8 00 00 00 00       	mov    $0x0,%eax
c0102175:	eb 16                	jmp    c010218d <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
c0102177:	8b 45 08             	mov    0x8(%ebp),%eax
c010217a:	0f b6 00             	movzbl (%eax),%eax
c010217d:	0f b6 d0             	movzbl %al,%edx
c0102180:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102183:	0f b6 00             	movzbl (%eax),%eax
c0102186:	0f b6 c0             	movzbl %al,%eax
c0102189:	29 c2                	sub    %eax,%edx
c010218b:	89 d0                	mov    %edx,%eax
}
c010218d:	5d                   	pop    %ebp
c010218e:	c3                   	ret    

c010218f <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
c010218f:	55                   	push   %ebp
c0102190:	89 e5                	mov    %esp,%ebp
c0102192:	83 ec 04             	sub    $0x4,%esp
c0102195:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102198:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c010219b:	eb 14                	jmp    c01021b1 <strchr+0x22>
		if (*s == c)
c010219d:	8b 45 08             	mov    0x8(%ebp),%eax
c01021a0:	0f b6 00             	movzbl (%eax),%eax
c01021a3:	3a 45 fc             	cmp    -0x4(%ebp),%al
c01021a6:	75 05                	jne    c01021ad <strchr+0x1e>
			return (char *) s;
c01021a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01021ab:	eb 13                	jmp    c01021c0 <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
c01021ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01021b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01021b4:	0f b6 00             	movzbl (%eax),%eax
c01021b7:	84 c0                	test   %al,%al
c01021b9:	75 e2                	jne    c010219d <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
c01021bb:	b8 00 00 00 00       	mov    $0x0,%eax
}
c01021c0:	c9                   	leave  
c01021c1:	c3                   	ret    

c01021c2 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
c01021c2:	55                   	push   %ebp
c01021c3:	89 e5                	mov    %esp,%ebp
c01021c5:	83 ec 04             	sub    $0x4,%esp
c01021c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021cb:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
c01021ce:	eb 11                	jmp    c01021e1 <strfind+0x1f>
		if (*s == c)
c01021d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01021d3:	0f b6 00             	movzbl (%eax),%eax
c01021d6:	3a 45 fc             	cmp    -0x4(%ebp),%al
c01021d9:	75 02                	jne    c01021dd <strfind+0x1b>
			break;
c01021db:	eb 0e                	jmp    c01021eb <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
c01021dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01021e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01021e4:	0f b6 00             	movzbl (%eax),%eax
c01021e7:	84 c0                	test   %al,%al
c01021e9:	75 e5                	jne    c01021d0 <strfind+0xe>
		if (*s == c)
			break;
	return (char *) s;
c01021eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
c01021ee:	c9                   	leave  
c01021ef:	c3                   	ret    

c01021f0 <memmove>:

/* no memcpy - use memmove instead */

void *
memmove(void *dst, const void *src, size_t n)
{
c01021f0:	55                   	push   %ebp
c01021f1:	89 e5                	mov    %esp,%ebp
c01021f3:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;
	
	s = src;
c01021f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	d = dst;
c01021fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01021ff:	89 45 f8             	mov    %eax,-0x8(%ebp)
	if (s < d && s + n > d) {
c0102202:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102205:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102208:	73 3d                	jae    c0102247 <memmove+0x57>
c010220a:	8b 45 10             	mov    0x10(%ebp),%eax
c010220d:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102210:	01 d0                	add    %edx,%eax
c0102212:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102215:	76 30                	jbe    c0102247 <memmove+0x57>
		s += n;
c0102217:	8b 45 10             	mov    0x10(%ebp),%eax
c010221a:	01 45 fc             	add    %eax,-0x4(%ebp)
		d += n;
c010221d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102220:	01 45 f8             	add    %eax,-0x8(%ebp)
		while (n-- > 0)
c0102223:	eb 13                	jmp    c0102238 <memmove+0x48>
			*--d = *--s;
c0102225:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
c0102229:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c010222d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102230:	0f b6 10             	movzbl (%eax),%edx
c0102233:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102236:	88 10                	mov    %dl,(%eax)
	s = src;
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
c0102238:	8b 45 10             	mov    0x10(%ebp),%eax
c010223b:	8d 50 ff             	lea    -0x1(%eax),%edx
c010223e:	89 55 10             	mov    %edx,0x10(%ebp)
c0102241:	85 c0                	test   %eax,%eax
c0102243:	75 e0                	jne    c0102225 <memmove+0x35>
	const char *s;
	char *d;
	
	s = src;
	d = dst;
	if (s < d && s + n > d) {
c0102245:	eb 26                	jmp    c010226d <memmove+0x7d>
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102247:	eb 17                	jmp    c0102260 <memmove+0x70>
			*d++ = *s++;
c0102249:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010224c:	8d 50 01             	lea    0x1(%eax),%edx
c010224f:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0102252:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0102255:	8d 4a 01             	lea    0x1(%edx),%ecx
c0102258:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c010225b:	0f b6 12             	movzbl (%edx),%edx
c010225e:	88 10                	mov    %dl,(%eax)
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
c0102260:	8b 45 10             	mov    0x10(%ebp),%eax
c0102263:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102266:	89 55 10             	mov    %edx,0x10(%ebp)
c0102269:	85 c0                	test   %eax,%eax
c010226b:	75 dc                	jne    c0102249 <memmove+0x59>
			*d++ = *s++;

	return dst;
c010226d:	8b 45 08             	mov    0x8(%ebp),%eax
}
c0102270:	c9                   	leave  
c0102271:	c3                   	ret    

c0102272 <memcmp>:
/* it is *not* prototyped in inc/string.h - do not use directly. */


int
memcmp(const void *v1, const void *v2, size_t n)
{
c0102272:	55                   	push   %ebp
c0102273:	89 e5                	mov    %esp,%ebp
c0102275:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
c0102278:	8b 45 08             	mov    0x8(%ebp),%eax
c010227b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
c010227e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102281:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
c0102284:	eb 30                	jmp    c01022b6 <memcmp+0x44>
		if (*s1 != *s2)
c0102286:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102289:	0f b6 10             	movzbl (%eax),%edx
c010228c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010228f:	0f b6 00             	movzbl (%eax),%eax
c0102292:	38 c2                	cmp    %al,%dl
c0102294:	74 18                	je     c01022ae <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
c0102296:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102299:	0f b6 00             	movzbl (%eax),%eax
c010229c:	0f b6 d0             	movzbl %al,%edx
c010229f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022a2:	0f b6 00             	movzbl (%eax),%eax
c01022a5:	0f b6 c0             	movzbl %al,%eax
c01022a8:	29 c2                	sub    %eax,%edx
c01022aa:	89 d0                	mov    %edx,%eax
c01022ac:	eb 1a                	jmp    c01022c8 <memcmp+0x56>
		s1++, s2++;
c01022ae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01022b2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
c01022b6:	8b 45 10             	mov    0x10(%ebp),%eax
c01022b9:	8d 50 ff             	lea    -0x1(%eax),%edx
c01022bc:	89 55 10             	mov    %edx,0x10(%ebp)
c01022bf:	85 c0                	test   %eax,%eax
c01022c1:	75 c3                	jne    c0102286 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
c01022c3:	b8 00 00 00 00       	mov    $0x0,%eax
}
c01022c8:	c9                   	leave  
c01022c9:	c3                   	ret    

c01022ca <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
c01022ca:	55                   	push   %ebp
c01022cb:	89 e5                	mov    %esp,%ebp
c01022cd:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
c01022d0:	8b 45 10             	mov    0x10(%ebp),%eax
c01022d3:	8b 55 08             	mov    0x8(%ebp),%edx
c01022d6:	01 d0                	add    %edx,%eax
c01022d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
c01022db:	eb 13                	jmp    c01022f0 <memfind+0x26>
		if (*(const unsigned char *) s == (unsigned char) c)
c01022dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01022e0:	0f b6 10             	movzbl (%eax),%edx
c01022e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022e6:	38 c2                	cmp    %al,%dl
c01022e8:	75 02                	jne    c01022ec <memfind+0x22>
			break;
c01022ea:	eb 0c                	jmp    c01022f8 <memfind+0x2e>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
c01022ec:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01022f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01022f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c01022f6:	72 e5                	jb     c01022dd <memfind+0x13>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
	return (void *) s;
c01022f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
c01022fb:	c9                   	leave  
c01022fc:	c3                   	ret    

c01022fd <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
c01022fd:	55                   	push   %ebp
c01022fe:	89 e5                	mov    %esp,%ebp
c0102300:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
c0102303:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
c010230a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102311:	eb 04                	jmp    c0102317 <strtol+0x1a>
		s++;
c0102313:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
c0102317:	8b 45 08             	mov    0x8(%ebp),%eax
c010231a:	0f b6 00             	movzbl (%eax),%eax
c010231d:	3c 20                	cmp    $0x20,%al
c010231f:	74 f2                	je     c0102313 <strtol+0x16>
c0102321:	8b 45 08             	mov    0x8(%ebp),%eax
c0102324:	0f b6 00             	movzbl (%eax),%eax
c0102327:	3c 09                	cmp    $0x9,%al
c0102329:	74 e8                	je     c0102313 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
c010232b:	8b 45 08             	mov    0x8(%ebp),%eax
c010232e:	0f b6 00             	movzbl (%eax),%eax
c0102331:	3c 2b                	cmp    $0x2b,%al
c0102333:	75 06                	jne    c010233b <strtol+0x3e>
		s++;
c0102335:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102339:	eb 15                	jmp    c0102350 <strtol+0x53>
	else if (*s == '-')
c010233b:	8b 45 08             	mov    0x8(%ebp),%eax
c010233e:	0f b6 00             	movzbl (%eax),%eax
c0102341:	3c 2d                	cmp    $0x2d,%al
c0102343:	75 0b                	jne    c0102350 <strtol+0x53>
		s++, neg = 1;
c0102345:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102349:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
c0102350:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102354:	74 06                	je     c010235c <strtol+0x5f>
c0102356:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c010235a:	75 24                	jne    c0102380 <strtol+0x83>
c010235c:	8b 45 08             	mov    0x8(%ebp),%eax
c010235f:	0f b6 00             	movzbl (%eax),%eax
c0102362:	3c 30                	cmp    $0x30,%al
c0102364:	75 1a                	jne    c0102380 <strtol+0x83>
c0102366:	8b 45 08             	mov    0x8(%ebp),%eax
c0102369:	83 c0 01             	add    $0x1,%eax
c010236c:	0f b6 00             	movzbl (%eax),%eax
c010236f:	3c 78                	cmp    $0x78,%al
c0102371:	75 0d                	jne    c0102380 <strtol+0x83>
		s += 2, base = 16;
c0102373:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c0102377:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c010237e:	eb 2a                	jmp    c01023aa <strtol+0xad>
	else if (base == 0 && s[0] == '0')
c0102380:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0102384:	75 17                	jne    c010239d <strtol+0xa0>
c0102386:	8b 45 08             	mov    0x8(%ebp),%eax
c0102389:	0f b6 00             	movzbl (%eax),%eax
c010238c:	3c 30                	cmp    $0x30,%al
c010238e:	75 0d                	jne    c010239d <strtol+0xa0>
		s++, base = 8;
c0102390:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102394:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c010239b:	eb 0d                	jmp    c01023aa <strtol+0xad>
	else if (base == 0)
c010239d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01023a1:	75 07                	jne    c01023aa <strtol+0xad>
		base = 10;
c01023a3:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
c01023aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01023ad:	0f b6 00             	movzbl (%eax),%eax
c01023b0:	3c 2f                	cmp    $0x2f,%al
c01023b2:	7e 1b                	jle    c01023cf <strtol+0xd2>
c01023b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01023b7:	0f b6 00             	movzbl (%eax),%eax
c01023ba:	3c 39                	cmp    $0x39,%al
c01023bc:	7f 11                	jg     c01023cf <strtol+0xd2>
			dig = *s - '0';
c01023be:	8b 45 08             	mov    0x8(%ebp),%eax
c01023c1:	0f b6 00             	movzbl (%eax),%eax
c01023c4:	0f be c0             	movsbl %al,%eax
c01023c7:	83 e8 30             	sub    $0x30,%eax
c01023ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01023cd:	eb 48                	jmp    c0102417 <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
c01023cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01023d2:	0f b6 00             	movzbl (%eax),%eax
c01023d5:	3c 60                	cmp    $0x60,%al
c01023d7:	7e 1b                	jle    c01023f4 <strtol+0xf7>
c01023d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01023dc:	0f b6 00             	movzbl (%eax),%eax
c01023df:	3c 7a                	cmp    $0x7a,%al
c01023e1:	7f 11                	jg     c01023f4 <strtol+0xf7>
			dig = *s - 'a' + 10;
c01023e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01023e6:	0f b6 00             	movzbl (%eax),%eax
c01023e9:	0f be c0             	movsbl %al,%eax
c01023ec:	83 e8 57             	sub    $0x57,%eax
c01023ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01023f2:	eb 23                	jmp    c0102417 <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
c01023f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01023f7:	0f b6 00             	movzbl (%eax),%eax
c01023fa:	3c 40                	cmp    $0x40,%al
c01023fc:	7e 3d                	jle    c010243b <strtol+0x13e>
c01023fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102401:	0f b6 00             	movzbl (%eax),%eax
c0102404:	3c 5a                	cmp    $0x5a,%al
c0102406:	7f 33                	jg     c010243b <strtol+0x13e>
			dig = *s - 'A' + 10;
c0102408:	8b 45 08             	mov    0x8(%ebp),%eax
c010240b:	0f b6 00             	movzbl (%eax),%eax
c010240e:	0f be c0             	movsbl %al,%eax
c0102411:	83 e8 37             	sub    $0x37,%eax
c0102414:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
c0102417:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010241a:	3b 45 10             	cmp    0x10(%ebp),%eax
c010241d:	7c 02                	jl     c0102421 <strtol+0x124>
			break;
c010241f:	eb 1a                	jmp    c010243b <strtol+0x13e>
		s++, val = (val * base) + dig;
c0102421:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102425:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102428:	0f af 45 10          	imul   0x10(%ebp),%eax
c010242c:	89 c2                	mov    %eax,%edx
c010242e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102431:	01 d0                	add    %edx,%eax
c0102433:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
c0102436:	e9 6f ff ff ff       	jmp    c01023aa <strtol+0xad>

	if (endptr)
c010243b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010243f:	74 08                	je     c0102449 <strtol+0x14c>
		*endptr = (char *) s;
c0102441:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102444:	8b 55 08             	mov    0x8(%ebp),%edx
c0102447:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
c0102449:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010244d:	74 07                	je     c0102456 <strtol+0x159>
c010244f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102452:	f7 d8                	neg    %eax
c0102454:	eb 03                	jmp    c0102459 <strtol+0x15c>
c0102456:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
c0102459:	c9                   	leave  
c010245a:	c3                   	ret    

c010245b <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
c010245b:	55                   	push   %ebp
c010245c:	89 e5                	mov    %esp,%ebp
c010245e:	53                   	push   %ebx
c010245f:	83 ec 34             	sub    $0x34,%esp
c0102462:	8b 45 10             	mov    0x10(%ebp),%eax
c0102465:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102468:	8b 45 14             	mov    0x14(%ebp),%eax
c010246b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
c010246e:	8b 45 18             	mov    0x18(%ebp),%eax
c0102471:	ba 00 00 00 00       	mov    $0x0,%edx
c0102476:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c0102479:	77 72                	ja     c01024ed <printnum+0x92>
c010247b:	3b 55 f4             	cmp    -0xc(%ebp),%edx
c010247e:	72 05                	jb     c0102485 <printnum+0x2a>
c0102480:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0102483:	77 68                	ja     c01024ed <printnum+0x92>
		printnum(putch, putdat, num / base, base, width - 1, padc);
c0102485:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0102488:	8d 58 ff             	lea    -0x1(%eax),%ebx
c010248b:	8b 45 18             	mov    0x18(%ebp),%eax
c010248e:	ba 00 00 00 00       	mov    $0x0,%edx
c0102493:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102497:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010249b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010249e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01024a1:	89 04 24             	mov    %eax,(%esp)
c01024a4:	89 54 24 04          	mov    %edx,0x4(%esp)
c01024a8:	e8 53 06 00 00       	call   c0102b00 <__udivdi3>
c01024ad:	8b 4d 20             	mov    0x20(%ebp),%ecx
c01024b0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
c01024b4:	89 5c 24 14          	mov    %ebx,0x14(%esp)
c01024b8:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01024bb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c01024bf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01024c3:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01024c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024ca:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01024d1:	89 04 24             	mov    %eax,(%esp)
c01024d4:	e8 82 ff ff ff       	call   c010245b <printnum>
c01024d9:	eb 1c                	jmp    c01024f7 <printnum+0x9c>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
c01024db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024de:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024e2:	8b 45 20             	mov    0x20(%ebp),%eax
c01024e5:	89 04 24             	mov    %eax,(%esp)
c01024e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024eb:	ff d0                	call   *%eax
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
c01024ed:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c01024f1:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c01024f5:	7f e4                	jg     c01024db <printnum+0x80>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
c01024f7:	8b 4d 18             	mov    0x18(%ebp),%ecx
c01024fa:	bb 00 00 00 00       	mov    $0x0,%ebx
c01024ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102502:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102505:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0102509:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c010250d:	89 04 24             	mov    %eax,(%esp)
c0102510:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102514:	e8 17 07 00 00       	call   c0102c30 <__umoddi3>
c0102519:	05 58 31 10 c0       	add    $0xc0103158,%eax
c010251e:	0f b6 00             	movzbl (%eax),%eax
c0102521:	0f be c0             	movsbl %al,%eax
c0102524:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102527:	89 54 24 04          	mov    %edx,0x4(%esp)
c010252b:	89 04 24             	mov    %eax,(%esp)
c010252e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102531:	ff d0                	call   *%eax
}
c0102533:	83 c4 34             	add    $0x34,%esp
c0102536:	5b                   	pop    %ebx
c0102537:	5d                   	pop    %ebp
c0102538:	c3                   	ret    

c0102539 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
c0102539:	55                   	push   %ebp
c010253a:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010253c:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c0102540:	7e 14                	jle    c0102556 <getuint+0x1d>
		return va_arg(*ap, unsigned long long);
c0102542:	8b 45 08             	mov    0x8(%ebp),%eax
c0102545:	8b 00                	mov    (%eax),%eax
c0102547:	8d 48 08             	lea    0x8(%eax),%ecx
c010254a:	8b 55 08             	mov    0x8(%ebp),%edx
c010254d:	89 0a                	mov    %ecx,(%edx)
c010254f:	8b 50 04             	mov    0x4(%eax),%edx
c0102552:	8b 00                	mov    (%eax),%eax
c0102554:	eb 30                	jmp    c0102586 <getuint+0x4d>
	else if (lflag)
c0102556:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010255a:	74 16                	je     c0102572 <getuint+0x39>
		return va_arg(*ap, unsigned long);
c010255c:	8b 45 08             	mov    0x8(%ebp),%eax
c010255f:	8b 00                	mov    (%eax),%eax
c0102561:	8d 48 04             	lea    0x4(%eax),%ecx
c0102564:	8b 55 08             	mov    0x8(%ebp),%edx
c0102567:	89 0a                	mov    %ecx,(%edx)
c0102569:	8b 00                	mov    (%eax),%eax
c010256b:	ba 00 00 00 00       	mov    $0x0,%edx
c0102570:	eb 14                	jmp    c0102586 <getuint+0x4d>
	else
		return va_arg(*ap, unsigned int);
c0102572:	8b 45 08             	mov    0x8(%ebp),%eax
c0102575:	8b 00                	mov    (%eax),%eax
c0102577:	8d 48 04             	lea    0x4(%eax),%ecx
c010257a:	8b 55 08             	mov    0x8(%ebp),%edx
c010257d:	89 0a                	mov    %ecx,(%edx)
c010257f:	8b 00                	mov    (%eax),%eax
c0102581:	ba 00 00 00 00       	mov    $0x0,%edx
}
c0102586:	5d                   	pop    %ebp
c0102587:	c3                   	ret    

c0102588 <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
c0102588:	55                   	push   %ebp
c0102589:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
c010258b:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010258f:	7e 14                	jle    c01025a5 <getint+0x1d>
		return va_arg(*ap, long long);
c0102591:	8b 45 08             	mov    0x8(%ebp),%eax
c0102594:	8b 00                	mov    (%eax),%eax
c0102596:	8d 48 08             	lea    0x8(%eax),%ecx
c0102599:	8b 55 08             	mov    0x8(%ebp),%edx
c010259c:	89 0a                	mov    %ecx,(%edx)
c010259e:	8b 50 04             	mov    0x4(%eax),%edx
c01025a1:	8b 00                	mov    (%eax),%eax
c01025a3:	eb 28                	jmp    c01025cd <getint+0x45>
	else if (lflag)
c01025a5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01025a9:	74 12                	je     c01025bd <getint+0x35>
		return va_arg(*ap, long);
c01025ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ae:	8b 00                	mov    (%eax),%eax
c01025b0:	8d 48 04             	lea    0x4(%eax),%ecx
c01025b3:	8b 55 08             	mov    0x8(%ebp),%edx
c01025b6:	89 0a                	mov    %ecx,(%edx)
c01025b8:	8b 00                	mov    (%eax),%eax
c01025ba:	99                   	cltd   
c01025bb:	eb 10                	jmp    c01025cd <getint+0x45>
	else
		return va_arg(*ap, int);
c01025bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01025c0:	8b 00                	mov    (%eax),%eax
c01025c2:	8d 48 04             	lea    0x4(%eax),%ecx
c01025c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01025c8:	89 0a                	mov    %ecx,(%edx)
c01025ca:	8b 00                	mov    (%eax),%eax
c01025cc:	99                   	cltd   
}
c01025cd:	5d                   	pop    %ebp
c01025ce:	c3                   	ret    

c01025cf <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
c01025cf:	55                   	push   %ebp
c01025d0:	89 e5                	mov    %esp,%ebp
c01025d2:	56                   	push   %esi
c01025d3:	53                   	push   %ebx
c01025d4:	83 ec 40             	sub    $0x40,%esp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01025d7:	eb 18                	jmp    c01025f1 <vprintfmt+0x22>
			if (ch == '\0')
c01025d9:	85 db                	test   %ebx,%ebx
c01025db:	75 05                	jne    c01025e2 <vprintfmt+0x13>
				return;
c01025dd:	e9 e9 03 00 00       	jmp    c01029cb <vprintfmt+0x3fc>
			putch(ch, putdat);
c01025e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025e5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025e9:	89 1c 24             	mov    %ebx,(%esp)
c01025ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ef:	ff d0                	call   *%eax
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01025f1:	8b 45 10             	mov    0x10(%ebp),%eax
c01025f4:	8d 50 01             	lea    0x1(%eax),%edx
c01025f7:	89 55 10             	mov    %edx,0x10(%ebp)
c01025fa:	0f b6 00             	movzbl (%eax),%eax
c01025fd:	0f b6 d8             	movzbl %al,%ebx
c0102600:	83 fb 25             	cmp    $0x25,%ebx
c0102603:	75 d4                	jne    c01025d9 <vprintfmt+0xa>
				return;
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		padc = ' ';
c0102605:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
		width = -1;
c0102609:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
		precision = -1;
c0102610:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
		lflag = 0;
c0102617:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		altflag = 0;
c010261e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
c0102625:	8b 45 10             	mov    0x10(%ebp),%eax
c0102628:	8d 50 01             	lea    0x1(%eax),%edx
c010262b:	89 55 10             	mov    %edx,0x10(%ebp)
c010262e:	0f b6 00             	movzbl (%eax),%eax
c0102631:	0f b6 d8             	movzbl %al,%ebx
c0102634:	8d 43 dd             	lea    -0x23(%ebx),%eax
c0102637:	83 f8 55             	cmp    $0x55,%eax
c010263a:	0f 87 5a 03 00 00    	ja     c010299a <vprintfmt+0x3cb>
c0102640:	8b 04 85 7c 31 10 c0 	mov    -0x3fefce84(,%eax,4),%eax
c0102647:	ff e0                	jmp    *%eax

		// flag to pad on the right
		case '-':
			padc = '-';
c0102649:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
			goto reswitch;
c010264d:	eb d6                	jmp    c0102625 <vprintfmt+0x56>
			
		// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
c010264f:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
			goto reswitch;
c0102653:	eb d0                	jmp    c0102625 <vprintfmt+0x56>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0102655:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
				precision = precision * 10 + ch - '0';
c010265c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010265f:	89 d0                	mov    %edx,%eax
c0102661:	c1 e0 02             	shl    $0x2,%eax
c0102664:	01 d0                	add    %edx,%eax
c0102666:	01 c0                	add    %eax,%eax
c0102668:	01 d8                	add    %ebx,%eax
c010266a:	83 e8 30             	sub    $0x30,%eax
c010266d:	89 45 e0             	mov    %eax,-0x20(%ebp)
				ch = *fmt;
c0102670:	8b 45 10             	mov    0x10(%ebp),%eax
c0102673:	0f b6 00             	movzbl (%eax),%eax
c0102676:	0f be d8             	movsbl %al,%ebx
				if (ch < '0' || ch > '9')
c0102679:	83 fb 2f             	cmp    $0x2f,%ebx
c010267c:	7e 0b                	jle    c0102689 <vprintfmt+0xba>
c010267e:	83 fb 39             	cmp    $0x39,%ebx
c0102681:	7f 06                	jg     c0102689 <vprintfmt+0xba>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
c0102683:	83 45 10 01          	addl   $0x1,0x10(%ebp)
				precision = precision * 10 + ch - '0';
				ch = *fmt;
				if (ch < '0' || ch > '9')
					break;
			}
c0102687:	eb d3                	jmp    c010265c <vprintfmt+0x8d>
			goto process_precision;
c0102689:	eb 33                	jmp    c01026be <vprintfmt+0xef>

		case '*':
			precision = va_arg(ap, int);
c010268b:	8b 45 14             	mov    0x14(%ebp),%eax
c010268e:	8d 50 04             	lea    0x4(%eax),%edx
c0102691:	89 55 14             	mov    %edx,0x14(%ebp)
c0102694:	8b 00                	mov    (%eax),%eax
c0102696:	89 45 e0             	mov    %eax,-0x20(%ebp)
			goto process_precision;
c0102699:	eb 23                	jmp    c01026be <vprintfmt+0xef>

		case '.':
			if (width < 0)
c010269b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c010269f:	79 0c                	jns    c01026ad <vprintfmt+0xde>
				width = 0;
c01026a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			goto reswitch;
c01026a8:	e9 78 ff ff ff       	jmp    c0102625 <vprintfmt+0x56>
c01026ad:	e9 73 ff ff ff       	jmp    c0102625 <vprintfmt+0x56>

		case '#':
			altflag = 1;
c01026b2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
			goto reswitch;
c01026b9:	e9 67 ff ff ff       	jmp    c0102625 <vprintfmt+0x56>

		process_precision:
			if (width < 0)
c01026be:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01026c2:	79 12                	jns    c01026d6 <vprintfmt+0x107>
				width = precision, precision = -1;
c01026c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01026c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01026ca:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
			goto reswitch;
c01026d1:	e9 4f ff ff ff       	jmp    c0102625 <vprintfmt+0x56>
c01026d6:	e9 4a ff ff ff       	jmp    c0102625 <vprintfmt+0x56>

		// long flag (doubled for long long)
		case 'l':
			lflag++;
c01026db:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
			goto reswitch;
c01026df:	e9 41 ff ff ff       	jmp    c0102625 <vprintfmt+0x56>

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
c01026e4:	8b 45 14             	mov    0x14(%ebp),%eax
c01026e7:	8d 50 04             	lea    0x4(%eax),%edx
c01026ea:	89 55 14             	mov    %edx,0x14(%ebp)
c01026ed:	8b 00                	mov    (%eax),%eax
c01026ef:	8b 55 0c             	mov    0xc(%ebp),%edx
c01026f2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01026f6:	89 04 24             	mov    %eax,(%esp)
c01026f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01026fc:	ff d0                	call   *%eax
			break;
c01026fe:	e9 c2 02 00 00       	jmp    c01029c5 <vprintfmt+0x3f6>

		// error message
		case 'e':
			err = va_arg(ap, int);
c0102703:	8b 45 14             	mov    0x14(%ebp),%eax
c0102706:	8d 50 04             	lea    0x4(%eax),%edx
c0102709:	89 55 14             	mov    %edx,0x14(%ebp)
c010270c:	8b 18                	mov    (%eax),%ebx
			if (err < 0)
c010270e:	85 db                	test   %ebx,%ebx
c0102710:	79 02                	jns    c0102714 <vprintfmt+0x145>
				err = -err;
c0102712:	f7 db                	neg    %ebx
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
c0102714:	83 fb 06             	cmp    $0x6,%ebx
c0102717:	7f 0b                	jg     c0102724 <vprintfmt+0x155>
c0102719:	8b 34 9d 3c 31 10 c0 	mov    -0x3fefcec4(,%ebx,4),%esi
c0102720:	85 f6                	test   %esi,%esi
c0102722:	75 23                	jne    c0102747 <vprintfmt+0x178>
				printfmt(putch, putdat, "error %d", err);
c0102724:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0102728:	c7 44 24 08 69 31 10 	movl   $0xc0103169,0x8(%esp)
c010272f:	c0 
c0102730:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102733:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102737:	8b 45 08             	mov    0x8(%ebp),%eax
c010273a:	89 04 24             	mov    %eax,(%esp)
c010273d:	e8 90 02 00 00       	call   c01029d2 <printfmt>
			else
				printfmt(putch, putdat, "%s", p);
			break;
c0102742:	e9 7e 02 00 00       	jmp    c01029c5 <vprintfmt+0x3f6>
			if (err < 0)
				err = -err;
			if (err >= MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
c0102747:	89 74 24 0c          	mov    %esi,0xc(%esp)
c010274b:	c7 44 24 08 72 31 10 	movl   $0xc0103172,0x8(%esp)
c0102752:	c0 
c0102753:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102756:	89 44 24 04          	mov    %eax,0x4(%esp)
c010275a:	8b 45 08             	mov    0x8(%ebp),%eax
c010275d:	89 04 24             	mov    %eax,(%esp)
c0102760:	e8 6d 02 00 00       	call   c01029d2 <printfmt>
			break;
c0102765:	e9 5b 02 00 00       	jmp    c01029c5 <vprintfmt+0x3f6>

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
c010276a:	8b 45 14             	mov    0x14(%ebp),%eax
c010276d:	8d 50 04             	lea    0x4(%eax),%edx
c0102770:	89 55 14             	mov    %edx,0x14(%ebp)
c0102773:	8b 30                	mov    (%eax),%esi
c0102775:	85 f6                	test   %esi,%esi
c0102777:	75 05                	jne    c010277e <vprintfmt+0x1af>
				p = "(null)";
c0102779:	be 75 31 10 c0       	mov    $0xc0103175,%esi
			if (width > 0 && padc != '-')
c010277e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102782:	7e 37                	jle    c01027bb <vprintfmt+0x1ec>
c0102784:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c0102788:	74 31                	je     c01027bb <vprintfmt+0x1ec>
				for (width -= strnlen(p, precision); width > 0; width--)
c010278a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010278d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102791:	89 34 24             	mov    %esi,(%esp)
c0102794:	e8 9b f8 ff ff       	call   c0102034 <strnlen>
c0102799:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c010279c:	eb 17                	jmp    c01027b5 <vprintfmt+0x1e6>
					putch(padc, putdat);
c010279e:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c01027a2:	8b 55 0c             	mov    0xc(%ebp),%edx
c01027a5:	89 54 24 04          	mov    %edx,0x4(%esp)
c01027a9:	89 04 24             	mov    %eax,(%esp)
c01027ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01027af:	ff d0                	call   *%eax
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
c01027b1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01027b5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01027b9:	7f e3                	jg     c010279e <vprintfmt+0x1cf>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c01027bb:	eb 38                	jmp    c01027f5 <vprintfmt+0x226>
				if (altflag && (ch < ' ' || ch > '~'))
c01027bd:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01027c1:	74 1f                	je     c01027e2 <vprintfmt+0x213>
c01027c3:	83 fb 1f             	cmp    $0x1f,%ebx
c01027c6:	7e 05                	jle    c01027cd <vprintfmt+0x1fe>
c01027c8:	83 fb 7e             	cmp    $0x7e,%ebx
c01027cb:	7e 15                	jle    c01027e2 <vprintfmt+0x213>
					putch('?', putdat);
c01027cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027d0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027d4:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c01027db:	8b 45 08             	mov    0x8(%ebp),%eax
c01027de:	ff d0                	call   *%eax
c01027e0:	eb 0f                	jmp    c01027f1 <vprintfmt+0x222>
				else
					putch(ch, putdat);
c01027e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027e5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027e9:	89 1c 24             	mov    %ebx,(%esp)
c01027ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01027ef:	ff d0                	call   *%eax
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
c01027f1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c01027f5:	89 f0                	mov    %esi,%eax
c01027f7:	8d 70 01             	lea    0x1(%eax),%esi
c01027fa:	0f b6 00             	movzbl (%eax),%eax
c01027fd:	0f be d8             	movsbl %al,%ebx
c0102800:	85 db                	test   %ebx,%ebx
c0102802:	74 10                	je     c0102814 <vprintfmt+0x245>
c0102804:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102808:	78 b3                	js     c01027bd <vprintfmt+0x1ee>
c010280a:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c010280e:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102812:	79 a9                	jns    c01027bd <vprintfmt+0x1ee>
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0102814:	eb 17                	jmp    c010282d <vprintfmt+0x25e>
				putch(' ', putdat);
c0102816:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102819:	89 44 24 04          	mov    %eax,0x4(%esp)
c010281d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0102824:	8b 45 08             	mov    0x8(%ebp),%eax
c0102827:	ff d0                	call   *%eax
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
c0102829:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c010282d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102831:	7f e3                	jg     c0102816 <vprintfmt+0x247>
				putch(' ', putdat);
			break;
c0102833:	e9 8d 01 00 00       	jmp    c01029c5 <vprintfmt+0x3f6>

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
c0102838:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010283b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010283f:	8d 45 14             	lea    0x14(%ebp),%eax
c0102842:	89 04 24             	mov    %eax,(%esp)
c0102845:	e8 3e fd ff ff       	call   c0102588 <getint>
c010284a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010284d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			if ((long long) num < 0) {
c0102850:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102853:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102856:	85 d2                	test   %edx,%edx
c0102858:	79 26                	jns    c0102880 <vprintfmt+0x2b1>
				putch('-', putdat);
c010285a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010285d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102861:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0102868:	8b 45 08             	mov    0x8(%ebp),%eax
c010286b:	ff d0                	call   *%eax
				num = -(long long) num;
c010286d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102870:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102873:	f7 d8                	neg    %eax
c0102875:	83 d2 00             	adc    $0x0,%edx
c0102878:	f7 da                	neg    %edx
c010287a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010287d:	89 55 f4             	mov    %edx,-0xc(%ebp)
			}
			base = 10;
c0102880:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c0102887:	e9 c5 00 00 00       	jmp    c0102951 <vprintfmt+0x382>

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
c010288c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010288f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102893:	8d 45 14             	lea    0x14(%ebp),%eax
c0102896:	89 04 24             	mov    %eax,(%esp)
c0102899:	e8 9b fc ff ff       	call   c0102539 <getuint>
c010289e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01028a1:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 10;
c01028a4:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
			goto number;
c01028ab:	e9 a1 00 00 00       	jmp    c0102951 <vprintfmt+0x382>

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
c01028b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028b3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028b7:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01028be:	8b 45 08             	mov    0x8(%ebp),%eax
c01028c1:	ff d0                	call   *%eax
			putch('X', putdat);
c01028c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028ca:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01028d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01028d4:	ff d0                	call   *%eax
			putch('X', putdat);
c01028d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028d9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028dd:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
c01028e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01028e7:	ff d0                	call   *%eax
			break;
c01028e9:	e9 d7 00 00 00       	jmp    c01029c5 <vprintfmt+0x3f6>

		// pointer
		case 'p':
			putch('0', putdat);
c01028ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028f1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028f5:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c01028fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01028ff:	ff d0                	call   *%eax
			putch('x', putdat);
c0102901:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102904:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102908:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c010290f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102912:	ff d0                	call   *%eax
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
c0102914:	8b 45 14             	mov    0x14(%ebp),%eax
c0102917:	8d 50 04             	lea    0x4(%eax),%edx
c010291a:	89 55 14             	mov    %edx,0x14(%ebp)
c010291d:	8b 00                	mov    (%eax),%eax

		// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
c010291f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102922:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
c0102929:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
			goto number;
c0102930:	eb 1f                	jmp    c0102951 <vprintfmt+0x382>

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
c0102932:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102935:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102939:	8d 45 14             	lea    0x14(%ebp),%eax
c010293c:	89 04 24             	mov    %eax,(%esp)
c010293f:	e8 f5 fb ff ff       	call   c0102539 <getuint>
c0102944:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102947:	89 55 f4             	mov    %edx,-0xc(%ebp)
			base = 16;
c010294a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
		number:
			printnum(putch, putdat, num, base, width, padc);
c0102951:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0102955:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102958:	89 54 24 18          	mov    %edx,0x18(%esp)
c010295c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010295f:	89 54 24 14          	mov    %edx,0x14(%esp)
c0102963:	89 44 24 10          	mov    %eax,0x10(%esp)
c0102967:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010296a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010296d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102971:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0102975:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102978:	89 44 24 04          	mov    %eax,0x4(%esp)
c010297c:	8b 45 08             	mov    0x8(%ebp),%eax
c010297f:	89 04 24             	mov    %eax,(%esp)
c0102982:	e8 d4 fa ff ff       	call   c010245b <printnum>
			break;
c0102987:	eb 3c                	jmp    c01029c5 <vprintfmt+0x3f6>

		// escaped '%' character
		case '%':
			putch(ch, putdat);
c0102989:	8b 45 0c             	mov    0xc(%ebp),%eax
c010298c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102990:	89 1c 24             	mov    %ebx,(%esp)
c0102993:	8b 45 08             	mov    0x8(%ebp),%eax
c0102996:	ff d0                	call   *%eax
			break;
c0102998:	eb 2b                	jmp    c01029c5 <vprintfmt+0x3f6>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
c010299a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010299d:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029a1:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c01029a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01029ab:	ff d0                	call   *%eax
			for (fmt--; fmt[-1] != '%'; fmt--)
c01029ad:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01029b1:	eb 04                	jmp    c01029b7 <vprintfmt+0x3e8>
c01029b3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01029b7:	8b 45 10             	mov    0x10(%ebp),%eax
c01029ba:	83 e8 01             	sub    $0x1,%eax
c01029bd:	0f b6 00             	movzbl (%eax),%eax
c01029c0:	3c 25                	cmp    $0x25,%al
c01029c2:	75 ef                	jne    c01029b3 <vprintfmt+0x3e4>
				/* do nothing */;
			break;
c01029c4:	90                   	nop
		}
	}
c01029c5:	90                   	nop
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
c01029c6:	e9 26 fc ff ff       	jmp    c01025f1 <vprintfmt+0x22>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
c01029cb:	83 c4 40             	add    $0x40,%esp
c01029ce:	5b                   	pop    %ebx
c01029cf:	5e                   	pop    %esi
c01029d0:	5d                   	pop    %ebp
c01029d1:	c3                   	ret    

c01029d2 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
c01029d2:	55                   	push   %ebp
c01029d3:	89 e5                	mov    %esp,%ebp
c01029d5:	83 ec 28             	sub    $0x28,%esp
	va_list ap;

	va_start(ap, fmt);
c01029d8:	8d 45 14             	lea    0x14(%ebp),%eax
c01029db:	89 45 f4             	mov    %eax,-0xc(%ebp)
	vprintfmt(putch, putdat, fmt, ap);
c01029de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01029e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01029e8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01029ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029ef:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01029f6:	89 04 24             	mov    %eax,(%esp)
c01029f9:	e8 d1 fb ff ff       	call   c01025cf <vprintfmt>
	va_end(ap);
}
c01029fe:	c9                   	leave  
c01029ff:	c3                   	ret    

c0102a00 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
c0102a00:	55                   	push   %ebp
c0102a01:	89 e5                	mov    %esp,%ebp
	b->cnt++;
c0102a03:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a06:	8b 40 08             	mov    0x8(%eax),%eax
c0102a09:	8d 50 01             	lea    0x1(%eax),%edx
c0102a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a0f:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
c0102a12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a15:	8b 10                	mov    (%eax),%edx
c0102a17:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a1a:	8b 40 04             	mov    0x4(%eax),%eax
c0102a1d:	39 c2                	cmp    %eax,%edx
c0102a1f:	73 12                	jae    c0102a33 <sprintputch+0x33>
		*b->buf++ = ch;
c0102a21:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a24:	8b 00                	mov    (%eax),%eax
c0102a26:	8d 48 01             	lea    0x1(%eax),%ecx
c0102a29:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102a2c:	89 0a                	mov    %ecx,(%edx)
c0102a2e:	8b 55 08             	mov    0x8(%ebp),%edx
c0102a31:	88 10                	mov    %dl,(%eax)
}
c0102a33:	5d                   	pop    %ebp
c0102a34:	c3                   	ret    

c0102a35 <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
c0102a35:	55                   	push   %ebp
c0102a36:	89 e5                	mov    %esp,%ebp
c0102a38:	83 ec 28             	sub    $0x28,%esp
	struct sprintbuf b = {buf, buf+n-1, 0};
c0102a3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a3e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102a41:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a44:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102a47:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a4a:	01 d0                	add    %edx,%eax
c0102a4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102a4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	if (buf == NULL || n < 1)
c0102a56:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102a5a:	74 06                	je     c0102a62 <vsnprintf+0x2d>
c0102a5c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a60:	7f 07                	jg     c0102a69 <vsnprintf+0x34>
		return -E_INVAL;
c0102a62:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0102a67:	eb 2a                	jmp    c0102a93 <vsnprintf+0x5e>

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
c0102a69:	8b 45 14             	mov    0x14(%ebp),%eax
c0102a6c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102a70:	8b 45 10             	mov    0x10(%ebp),%eax
c0102a73:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a77:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0102a7a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a7e:	c7 04 24 00 2a 10 c0 	movl   $0xc0102a00,(%esp)
c0102a85:	e8 45 fb ff ff       	call   c01025cf <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
c0102a8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a8d:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
c0102a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102a93:	c9                   	leave  
c0102a94:	c3                   	ret    

c0102a95 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
c0102a95:	55                   	push   %ebp
c0102a96:	89 e5                	mov    %esp,%ebp
c0102a98:	83 ec 28             	sub    $0x28,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
c0102a9b:	8d 45 14             	lea    0x14(%ebp),%eax
c0102a9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	rc = vsnprintf(buf, n, fmt, ap);
c0102aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102aa4:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102aa8:	8b 45 10             	mov    0x10(%ebp),%eax
c0102aab:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102aaf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ab2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ab6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ab9:	89 04 24             	mov    %eax,(%esp)
c0102abc:	e8 74 ff ff ff       	call   c0102a35 <vsnprintf>
c0102ac1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	va_end(ap);

	return rc;
c0102ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
c0102ac7:	c9                   	leave  
c0102ac8:	c3                   	ret    

c0102ac9 <srand>:
static int seed = 0;

void
srand(int s) {
c0102ac9:	55                   	push   %ebp
c0102aca:	89 e5                	mov    %esp,%ebp
	seed = s;
c0102acc:	8b 45 08             	mov    0x8(%ebp),%eax
c0102acf:	a3 c8 2e 16 c0       	mov    %eax,0xc0162ec8
}
c0102ad4:	5d                   	pop    %ebp
c0102ad5:	c3                   	ret    

c0102ad6 <rand>:

/* 生成下一个随机数 */
int
rand(void) {
c0102ad6:	55                   	push   %ebp
c0102ad7:	89 e5                	mov    %esp,%ebp
	seed = 0x015A4E35 * seed + 1;
c0102ad9:	a1 c8 2e 16 c0       	mov    0xc0162ec8,%eax
c0102ade:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
c0102ae4:	83 c0 01             	add    $0x1,%eax
c0102ae7:	a3 c8 2e 16 c0       	mov    %eax,0xc0162ec8
	return (seed >> 16) & 0x7FFF;
c0102aec:	a1 c8 2e 16 c0       	mov    0xc0162ec8,%eax
c0102af1:	c1 f8 10             	sar    $0x10,%eax
c0102af4:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
c0102af9:	5d                   	pop    %ebp
c0102afa:	c3                   	ret    
c0102afb:	66 90                	xchg   %ax,%ax
c0102afd:	66 90                	xchg   %ax,%ax
c0102aff:	90                   	nop

c0102b00 <__udivdi3>:
c0102b00:	55                   	push   %ebp
c0102b01:	57                   	push   %edi
c0102b02:	56                   	push   %esi
c0102b03:	83 ec 0c             	sub    $0xc,%esp
c0102b06:	8b 44 24 28          	mov    0x28(%esp),%eax
c0102b0a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
c0102b0e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
c0102b12:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0102b16:	85 c0                	test   %eax,%eax
c0102b18:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0102b1c:	89 ea                	mov    %ebp,%edx
c0102b1e:	89 0c 24             	mov    %ecx,(%esp)
c0102b21:	75 2d                	jne    c0102b50 <__udivdi3+0x50>
c0102b23:	39 e9                	cmp    %ebp,%ecx
c0102b25:	77 61                	ja     c0102b88 <__udivdi3+0x88>
c0102b27:	85 c9                	test   %ecx,%ecx
c0102b29:	89 ce                	mov    %ecx,%esi
c0102b2b:	75 0b                	jne    c0102b38 <__udivdi3+0x38>
c0102b2d:	b8 01 00 00 00       	mov    $0x1,%eax
c0102b32:	31 d2                	xor    %edx,%edx
c0102b34:	f7 f1                	div    %ecx
c0102b36:	89 c6                	mov    %eax,%esi
c0102b38:	31 d2                	xor    %edx,%edx
c0102b3a:	89 e8                	mov    %ebp,%eax
c0102b3c:	f7 f6                	div    %esi
c0102b3e:	89 c5                	mov    %eax,%ebp
c0102b40:	89 f8                	mov    %edi,%eax
c0102b42:	f7 f6                	div    %esi
c0102b44:	89 ea                	mov    %ebp,%edx
c0102b46:	83 c4 0c             	add    $0xc,%esp
c0102b49:	5e                   	pop    %esi
c0102b4a:	5f                   	pop    %edi
c0102b4b:	5d                   	pop    %ebp
c0102b4c:	c3                   	ret    
c0102b4d:	8d 76 00             	lea    0x0(%esi),%esi
c0102b50:	39 e8                	cmp    %ebp,%eax
c0102b52:	77 24                	ja     c0102b78 <__udivdi3+0x78>
c0102b54:	0f bd e8             	bsr    %eax,%ebp
c0102b57:	83 f5 1f             	xor    $0x1f,%ebp
c0102b5a:	75 3c                	jne    c0102b98 <__udivdi3+0x98>
c0102b5c:	8b 74 24 04          	mov    0x4(%esp),%esi
c0102b60:	39 34 24             	cmp    %esi,(%esp)
c0102b63:	0f 86 9f 00 00 00    	jbe    c0102c08 <__udivdi3+0x108>
c0102b69:	39 d0                	cmp    %edx,%eax
c0102b6b:	0f 82 97 00 00 00    	jb     c0102c08 <__udivdi3+0x108>
c0102b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102b78:	31 d2                	xor    %edx,%edx
c0102b7a:	31 c0                	xor    %eax,%eax
c0102b7c:	83 c4 0c             	add    $0xc,%esp
c0102b7f:	5e                   	pop    %esi
c0102b80:	5f                   	pop    %edi
c0102b81:	5d                   	pop    %ebp
c0102b82:	c3                   	ret    
c0102b83:	90                   	nop
c0102b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102b88:	89 f8                	mov    %edi,%eax
c0102b8a:	f7 f1                	div    %ecx
c0102b8c:	31 d2                	xor    %edx,%edx
c0102b8e:	83 c4 0c             	add    $0xc,%esp
c0102b91:	5e                   	pop    %esi
c0102b92:	5f                   	pop    %edi
c0102b93:	5d                   	pop    %ebp
c0102b94:	c3                   	ret    
c0102b95:	8d 76 00             	lea    0x0(%esi),%esi
c0102b98:	89 e9                	mov    %ebp,%ecx
c0102b9a:	8b 3c 24             	mov    (%esp),%edi
c0102b9d:	d3 e0                	shl    %cl,%eax
c0102b9f:	89 c6                	mov    %eax,%esi
c0102ba1:	b8 20 00 00 00       	mov    $0x20,%eax
c0102ba6:	29 e8                	sub    %ebp,%eax
c0102ba8:	89 c1                	mov    %eax,%ecx
c0102baa:	d3 ef                	shr    %cl,%edi
c0102bac:	89 e9                	mov    %ebp,%ecx
c0102bae:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0102bb2:	8b 3c 24             	mov    (%esp),%edi
c0102bb5:	09 74 24 08          	or     %esi,0x8(%esp)
c0102bb9:	89 d6                	mov    %edx,%esi
c0102bbb:	d3 e7                	shl    %cl,%edi
c0102bbd:	89 c1                	mov    %eax,%ecx
c0102bbf:	89 3c 24             	mov    %edi,(%esp)
c0102bc2:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0102bc6:	d3 ee                	shr    %cl,%esi
c0102bc8:	89 e9                	mov    %ebp,%ecx
c0102bca:	d3 e2                	shl    %cl,%edx
c0102bcc:	89 c1                	mov    %eax,%ecx
c0102bce:	d3 ef                	shr    %cl,%edi
c0102bd0:	09 d7                	or     %edx,%edi
c0102bd2:	89 f2                	mov    %esi,%edx
c0102bd4:	89 f8                	mov    %edi,%eax
c0102bd6:	f7 74 24 08          	divl   0x8(%esp)
c0102bda:	89 d6                	mov    %edx,%esi
c0102bdc:	89 c7                	mov    %eax,%edi
c0102bde:	f7 24 24             	mull   (%esp)
c0102be1:	39 d6                	cmp    %edx,%esi
c0102be3:	89 14 24             	mov    %edx,(%esp)
c0102be6:	72 30                	jb     c0102c18 <__udivdi3+0x118>
c0102be8:	8b 54 24 04          	mov    0x4(%esp),%edx
c0102bec:	89 e9                	mov    %ebp,%ecx
c0102bee:	d3 e2                	shl    %cl,%edx
c0102bf0:	39 c2                	cmp    %eax,%edx
c0102bf2:	73 05                	jae    c0102bf9 <__udivdi3+0xf9>
c0102bf4:	3b 34 24             	cmp    (%esp),%esi
c0102bf7:	74 1f                	je     c0102c18 <__udivdi3+0x118>
c0102bf9:	89 f8                	mov    %edi,%eax
c0102bfb:	31 d2                	xor    %edx,%edx
c0102bfd:	e9 7a ff ff ff       	jmp    c0102b7c <__udivdi3+0x7c>
c0102c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102c08:	31 d2                	xor    %edx,%edx
c0102c0a:	b8 01 00 00 00       	mov    $0x1,%eax
c0102c0f:	e9 68 ff ff ff       	jmp    c0102b7c <__udivdi3+0x7c>
c0102c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102c18:	8d 47 ff             	lea    -0x1(%edi),%eax
c0102c1b:	31 d2                	xor    %edx,%edx
c0102c1d:	83 c4 0c             	add    $0xc,%esp
c0102c20:	5e                   	pop    %esi
c0102c21:	5f                   	pop    %edi
c0102c22:	5d                   	pop    %ebp
c0102c23:	c3                   	ret    
c0102c24:	66 90                	xchg   %ax,%ax
c0102c26:	66 90                	xchg   %ax,%ax
c0102c28:	66 90                	xchg   %ax,%ax
c0102c2a:	66 90                	xchg   %ax,%ax
c0102c2c:	66 90                	xchg   %ax,%ax
c0102c2e:	66 90                	xchg   %ax,%ax

c0102c30 <__umoddi3>:
c0102c30:	55                   	push   %ebp
c0102c31:	57                   	push   %edi
c0102c32:	56                   	push   %esi
c0102c33:	83 ec 14             	sub    $0x14,%esp
c0102c36:	8b 44 24 28          	mov    0x28(%esp),%eax
c0102c3a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
c0102c3e:	8b 74 24 2c          	mov    0x2c(%esp),%esi
c0102c42:	89 c7                	mov    %eax,%edi
c0102c44:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c48:	8b 44 24 30          	mov    0x30(%esp),%eax
c0102c4c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0102c50:	89 34 24             	mov    %esi,(%esp)
c0102c53:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0102c57:	85 c0                	test   %eax,%eax
c0102c59:	89 c2                	mov    %eax,%edx
c0102c5b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0102c5f:	75 17                	jne    c0102c78 <__umoddi3+0x48>
c0102c61:	39 fe                	cmp    %edi,%esi
c0102c63:	76 4b                	jbe    c0102cb0 <__umoddi3+0x80>
c0102c65:	89 c8                	mov    %ecx,%eax
c0102c67:	89 fa                	mov    %edi,%edx
c0102c69:	f7 f6                	div    %esi
c0102c6b:	89 d0                	mov    %edx,%eax
c0102c6d:	31 d2                	xor    %edx,%edx
c0102c6f:	83 c4 14             	add    $0x14,%esp
c0102c72:	5e                   	pop    %esi
c0102c73:	5f                   	pop    %edi
c0102c74:	5d                   	pop    %ebp
c0102c75:	c3                   	ret    
c0102c76:	66 90                	xchg   %ax,%ax
c0102c78:	39 f8                	cmp    %edi,%eax
c0102c7a:	77 54                	ja     c0102cd0 <__umoddi3+0xa0>
c0102c7c:	0f bd e8             	bsr    %eax,%ebp
c0102c7f:	83 f5 1f             	xor    $0x1f,%ebp
c0102c82:	75 5c                	jne    c0102ce0 <__umoddi3+0xb0>
c0102c84:	8b 7c 24 08          	mov    0x8(%esp),%edi
c0102c88:	39 3c 24             	cmp    %edi,(%esp)
c0102c8b:	0f 87 e7 00 00 00    	ja     c0102d78 <__umoddi3+0x148>
c0102c91:	8b 7c 24 04          	mov    0x4(%esp),%edi
c0102c95:	29 f1                	sub    %esi,%ecx
c0102c97:	19 c7                	sbb    %eax,%edi
c0102c99:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0102c9d:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0102ca1:	8b 44 24 08          	mov    0x8(%esp),%eax
c0102ca5:	8b 54 24 0c          	mov    0xc(%esp),%edx
c0102ca9:	83 c4 14             	add    $0x14,%esp
c0102cac:	5e                   	pop    %esi
c0102cad:	5f                   	pop    %edi
c0102cae:	5d                   	pop    %ebp
c0102caf:	c3                   	ret    
c0102cb0:	85 f6                	test   %esi,%esi
c0102cb2:	89 f5                	mov    %esi,%ebp
c0102cb4:	75 0b                	jne    c0102cc1 <__umoddi3+0x91>
c0102cb6:	b8 01 00 00 00       	mov    $0x1,%eax
c0102cbb:	31 d2                	xor    %edx,%edx
c0102cbd:	f7 f6                	div    %esi
c0102cbf:	89 c5                	mov    %eax,%ebp
c0102cc1:	8b 44 24 04          	mov    0x4(%esp),%eax
c0102cc5:	31 d2                	xor    %edx,%edx
c0102cc7:	f7 f5                	div    %ebp
c0102cc9:	89 c8                	mov    %ecx,%eax
c0102ccb:	f7 f5                	div    %ebp
c0102ccd:	eb 9c                	jmp    c0102c6b <__umoddi3+0x3b>
c0102ccf:	90                   	nop
c0102cd0:	89 c8                	mov    %ecx,%eax
c0102cd2:	89 fa                	mov    %edi,%edx
c0102cd4:	83 c4 14             	add    $0x14,%esp
c0102cd7:	5e                   	pop    %esi
c0102cd8:	5f                   	pop    %edi
c0102cd9:	5d                   	pop    %ebp
c0102cda:	c3                   	ret    
c0102cdb:	90                   	nop
c0102cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102ce0:	8b 04 24             	mov    (%esp),%eax
c0102ce3:	be 20 00 00 00       	mov    $0x20,%esi
c0102ce8:	89 e9                	mov    %ebp,%ecx
c0102cea:	29 ee                	sub    %ebp,%esi
c0102cec:	d3 e2                	shl    %cl,%edx
c0102cee:	89 f1                	mov    %esi,%ecx
c0102cf0:	d3 e8                	shr    %cl,%eax
c0102cf2:	89 e9                	mov    %ebp,%ecx
c0102cf4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cf8:	8b 04 24             	mov    (%esp),%eax
c0102cfb:	09 54 24 04          	or     %edx,0x4(%esp)
c0102cff:	89 fa                	mov    %edi,%edx
c0102d01:	d3 e0                	shl    %cl,%eax
c0102d03:	89 f1                	mov    %esi,%ecx
c0102d05:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d09:	8b 44 24 10          	mov    0x10(%esp),%eax
c0102d0d:	d3 ea                	shr    %cl,%edx
c0102d0f:	89 e9                	mov    %ebp,%ecx
c0102d11:	d3 e7                	shl    %cl,%edi
c0102d13:	89 f1                	mov    %esi,%ecx
c0102d15:	d3 e8                	shr    %cl,%eax
c0102d17:	89 e9                	mov    %ebp,%ecx
c0102d19:	09 f8                	or     %edi,%eax
c0102d1b:	8b 7c 24 10          	mov    0x10(%esp),%edi
c0102d1f:	f7 74 24 04          	divl   0x4(%esp)
c0102d23:	d3 e7                	shl    %cl,%edi
c0102d25:	89 7c 24 0c          	mov    %edi,0xc(%esp)
c0102d29:	89 d7                	mov    %edx,%edi
c0102d2b:	f7 64 24 08          	mull   0x8(%esp)
c0102d2f:	39 d7                	cmp    %edx,%edi
c0102d31:	89 c1                	mov    %eax,%ecx
c0102d33:	89 14 24             	mov    %edx,(%esp)
c0102d36:	72 2c                	jb     c0102d64 <__umoddi3+0x134>
c0102d38:	39 44 24 0c          	cmp    %eax,0xc(%esp)
c0102d3c:	72 22                	jb     c0102d60 <__umoddi3+0x130>
c0102d3e:	8b 44 24 0c          	mov    0xc(%esp),%eax
c0102d42:	29 c8                	sub    %ecx,%eax
c0102d44:	19 d7                	sbb    %edx,%edi
c0102d46:	89 e9                	mov    %ebp,%ecx
c0102d48:	89 fa                	mov    %edi,%edx
c0102d4a:	d3 e8                	shr    %cl,%eax
c0102d4c:	89 f1                	mov    %esi,%ecx
c0102d4e:	d3 e2                	shl    %cl,%edx
c0102d50:	89 e9                	mov    %ebp,%ecx
c0102d52:	d3 ef                	shr    %cl,%edi
c0102d54:	09 d0                	or     %edx,%eax
c0102d56:	89 fa                	mov    %edi,%edx
c0102d58:	83 c4 14             	add    $0x14,%esp
c0102d5b:	5e                   	pop    %esi
c0102d5c:	5f                   	pop    %edi
c0102d5d:	5d                   	pop    %ebp
c0102d5e:	c3                   	ret    
c0102d5f:	90                   	nop
c0102d60:	39 d7                	cmp    %edx,%edi
c0102d62:	75 da                	jne    c0102d3e <__umoddi3+0x10e>
c0102d64:	8b 14 24             	mov    (%esp),%edx
c0102d67:	89 c1                	mov    %eax,%ecx
c0102d69:	2b 4c 24 08          	sub    0x8(%esp),%ecx
c0102d6d:	1b 54 24 04          	sbb    0x4(%esp),%edx
c0102d71:	eb cb                	jmp    c0102d3e <__umoddi3+0x10e>
c0102d73:	90                   	nop
c0102d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102d78:	3b 44 24 0c          	cmp    0xc(%esp),%eax
c0102d7c:	0f 82 0f ff ff ff    	jb     c0102c91 <__umoddi3+0x61>
c0102d82:	e9 1a ff ff ff       	jmp    c0102ca1 <__umoddi3+0x71>
