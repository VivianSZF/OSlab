#include "mmu.h"

.set PROT_MODE_CSEG, 0x8        
.set PROT_MODE_DSEG, 0x10               

.globl start
start:
  .code16                    
  cli                                          

  # Set video mode
  movw    $0x13, %ax
  int     $0x10
  
  # Set up the segment registers
  xorw    %ax,%ax             
  movw    %ax,%ds            
  movw    %ax,%es             
  movw    %ax,%ss          

  # Enable A20:
seta20.1:
  inb     $0x64,%al               # Wait for not busy
  testb   $0x2,%al
  jnz     seta20.1

  movb    $0xd1,%al               # 0xd1 -> port 0x64
  outb    %al,$0x64

seta20.2:
  inb     $0x64,%al               # Wait for not busy
  testb   $0x2,%al
  jnz     seta20.2

  movb    $0xdf,%al               # 0xdf -> port 0x60
  outb    %al,$0x60

  # GDT
  lgdt    gdtdesc
  movl    %cr0, %eax
  orl     $0x1, %eax
  movl    %eax, %cr0
  
  ljmp    $PROT_MODE_CSEG, $protcseg

  .code32                 
protcseg:
  movw    $PROT_MODE_DSEG, %ax    
  movw    %ax, %ds               
  movw    %ax, %es                
  movw    %ax, %fs              
  movw    %ax, %gs              
  movw    %ax, %ss            
  
  movl    $0x8000, %esp
  call bootmain

# GDT
.p2align 2                               
gdt:
  SEG_NULL			
  SEG(STA_X|STA_R, 0x0, 0xffffffff)	
  SEG(STA_W, 0x0, 0xffffffff)	       

gdtdesc:
  .word   0x17                            
  .long   gdt                          

