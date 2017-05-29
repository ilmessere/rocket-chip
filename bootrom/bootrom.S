#define DRAM_BASE 0x80000000
#define STACK_PTR 0x80004000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li sp, STACK_PTR // initialize stack pointer
  li s0, DRAM_BASE
  csrr a0, mhartid
  la a1, _dtb
  jr s0

.section .text.hang, "ax", @progbits
.globl _hang
_hang:
  csrr a0, mhartid
  la a1, _dtb
1:
  wfi
  j 1b

.section .rodata.dtb, "a", @progbits
.globl _dtb
.align 5, 0
_dtb:
.ascii "DTB goes here"
