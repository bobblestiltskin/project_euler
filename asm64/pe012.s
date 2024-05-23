# this computes projecteuler.net problem 012

.align 2

.section .rodata
resstring:
        .asciz "%d\n"

.equ    last, 250

icount		.req x4
jcount		.req x5
tmp		.req x6
num		.req x7

.text
        .align  2
        .global get_num_divisors
        .type   get_num_divisors, %function
get_num_divisors:
        stp fp, lr, [sp, #-0x30]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        mov fp, sp

	mov	num, x0
	mov	icount, 0
	mov	jcount, 1
jstart:
	mov	x0, num
	mov	x1, jcount
	bl	divide
	cmp	x1, 0
	beq	factor
	b	nextj
factor:
	add	icount, icount, 1
nextj:
	add	jcount, jcount, 1
	mul	tmp, jcount, jcount
	cmp	num, tmp
	bgt	jstart
	mov	x0, icount

        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x30

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
	bge	printme
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
