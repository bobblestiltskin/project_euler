.align 2

.section .rodata
resstring:
        .asciz "%d\n"

.equ    last, 250

icount		.req r4
jcount		.req r5
tmp		.req r6
num		.req r7

.text
        .align  2
        .global get_num_divisors
        .type   get_num_divisors, %function
get_num_divisors:
#        stmfd   sp!, {r4-r7, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	num, r0
	mov	icount, 0
	mov	jcount, 1
jstart:
	mov	r0, num
	mov	r1, jcount
	bl	divide
	teq	r1, 0
	beq	factor
	b	nextj
factor:
	add	icount, icount, 1
nextj:
	add	jcount, jcount, 1
	mul	tmp, jcount, jcount
	cmp	num, tmp
	bgt	jstart
	mov	r0, icount
#        ldmfd   sp!, {r4-r7, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

#	mov	x0, #0		/* exit code to 0 */
#	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
#        svc	#0		/* then invoke the syscall from linux */

        .align  2
        .global main
        .type   main, %function
main:
#        stmfd   sp!, {r4-r7, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	num, 0
	mov	icount, 0
	mov	jcount, 1
loop:
	cmp	num, #last
	bge	printme
	add	icount, icount, jcount
	mov	r0, icount
	bl	get_num_divisors
	mov	num, r0

	add	jcount, jcount, 1
	b	loop

printme:
        mov     r1, icount
        ldr     r0, =resstring  /* store address of start of string to r0 */
        bl      printf

	mov	r0, 0
#        ldmfd   sp!, {r4-r7, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
