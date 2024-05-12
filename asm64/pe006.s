.equ limit,100

number	.req r4
sumsq	.req r5
sqsum	.req r6
tmp	.req r7

.section .rodata
	.align	2
string:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
#	stmfd	sp!, {r4-r7, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	sqsum, 0
	mov	sumsq, 0
	ldr	number, =limit
loop:
	mul	tmp, number, number
	add	sqsum, sqsum, tmp
# decrement number and loop or exit
	subs	number, number, 1
	beq	end_loop
	b	loop
end_loop:
	ldr	number, =limit
	add	number, number, 1
	ldr	sumsq, =limit
	mul	sumsq, sumsq, number
	lsr	sumsq, sumsq, 1
	mul	sumsq, sumsq, sumsq
last:
	sub	tmp, sumsq, sqsum 
	mov	r1, tmp
	ldr	r0, =string	/* store address of start of string to r0 */
	bl	printf

	mov	r0, 0
#	ldmfd	sp!, {r4-r7, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
