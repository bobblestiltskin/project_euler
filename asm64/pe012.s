# this computes projecteuler.net problem 012

.include "regs.s"

.align 2

.section .rodata
resstring:
        .asciz "%d\n"

.equ    last, 250

icount		.req x19
jcount		.req x20
tmp		.req x21
num		.req x22

.text
        .align  2
        .global get_num_divisors
        .type   get_num_divisors, %function
get_num_divisors:
	callee_save_regs_on_stack
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	mov	num, x0
	mov	icount, 0
	mov	jcount, 1
jstart:
	mov	x0, num
	mov	x1, jcount
	bl	divide
	cmp	x1, 0
	b.eq	factor
	b	nextj
factor:
	add	icount, icount, 1
nextj:
	add	jcount, jcount, 1
	mul	tmp, jcount, jcount
	cmp	num, tmp
	b.gt	jstart
	mov	x0, icount

        ldp	fp, lr, [sp], #0x10
	callee_restore_regs_from_stack
	ret

        .align  2
        .global main
        .type   main, %function
main:
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp
	mov	num, 0
	mov	icount, 0
	mov	jcount, 1
loop:
	cmp	num, #last
	b.ge	printme
	add	icount, icount, jcount
	mov	x0, icount
	bl	get_num_divisors
	mov	num, x0

	add	jcount, jcount, 1
	b	loop

printme:
        mov     x1, icount
        ldr     x0, =resstring  /* store address of start of string to r0 */
        bl      printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret
