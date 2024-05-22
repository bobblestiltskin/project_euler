# this computes projecteuler.net problem 021

.equ	WORDSIZE, 8
.equ	SIZEB, 80000
.equ	SIZE, 10000

.macro save_regs_on_stack
        stp x20, x21, [sp, #-0x90]!
        stp x18, x19, [sp, #0x10]
        stp x16, x17, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x12, x13, [sp, #0x40]
        stp x10, x11, [sp, #0x50]
        stp x8, x9,   [sp, #0x60]
        stp x6, x7,   [sp, #0x70]
        stp x4, x5,   [sp, #0x80]
.endm

.macro restore_regs_from_stack
        ldp x4, x5,   [sp, #0x80]
        ldp x6, x7,   [sp, #0x70]
        ldp x8, x9,   [sp, #0x60]
        ldp x10, x11, [sp, #0x50]
        ldp x12, x13, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x16, x17, [sp, #0x20]
        ldp x18, x19, [sp, #0x10]
        ldp x20, x21, [sp], #0x90
.endm

.align 4

aptr		.req x4
number		.req x4
sum		.req x5
tmp		.req x5
icount		.req x6
total		.req x7
tmp8		.req x8

.section .bss
.lcomm array,SIZEB

.section .rodata
resstring:
        .asciz "%d\n"

.text
.align  2
.global main
.type   main, %function
main:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	icount, 0
	ldr	aptr, =array
array_loop:
	mov	x0, icount
	save_regs_on_stack
	bl	sum_factors
	restore_regs_from_stack
	str	x0, [aptr], WORDSIZE
	add	icount, icount, 1
	ldr	tmp, =SIZE
	cmp	icount, tmp
	b.lt	array_loop

	ldr 	aptr, =array
	mov	tmp, 0
	ldr	icount, =SIZE
	mov	total, 0
ploop:
	add	tmp8, tmp, tmp
	add	tmp8, tmp8, tmp8 /* multiply tmp by 4 */
	add	tmp8, tmp8, tmp8 /* multiply x2 by 8 */
	ldr	x2, [aptr, tmp8]
#	ldr	x2, [aptr, tmp, lsl 2]
	cmp	x2, icount
	b.ge	pnext
	cmp	tmp, x2
	b.eq	pnext
	add	tmp8, x2, x2
	add	tmp8, tmp8, tmp8 /* multiply x2 by 4 */
	add	tmp8, tmp8, tmp8 /* multiply x2 by 8 */
#	ldr	x3, [aptr, x2, lsl 2]
	ldr	x3, [aptr, tmp8]
	cmp	tmp, x3
	b.ne	pnext
	add	total, total, tmp
pnext:
	add	tmp, tmp, 1
	cmp	tmp, icount
	b.ne	ploop
printme:
        mov     x1, total
        ldr     x0, =resstring  /* store address of start of string to r0 */
        bl      printf

        ldp fp, lr, [sp], #0x10

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

.global sum_factors
.type   sum_factors, %function
sum_factors:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	number, x0
	mov	sum, 1
	mov	icount, 2
sf_loop:
	mul	x0, icount, icount
	cmp	x0, number
	b.gt	sf_end
	mov	x0, number
	mov	x1, icount
	bl	divide
	cmp	x1, 0
	b.ne	sf_next
	add	sum, sum, x0
	add	sum, sum, icount
sf_next:
	add	icount, icount, 1
	b	sf_loop
sf_end:	
	mov	x0, sum

        ldp fp, lr, [sp], #0x10
	ret
