# this computes projecteuler.net problem 014

.equ last, 1000000
.equ first, 500000

.align 4

maxi		.req x4
maxv		.req x5
counter		.req x6
i		.req x7
j		.req x8
limit		.req x10

.section .rodata
        .align  2
numstring:
        .asciz "%d\n"
.text
        .align  2
        .global main
        .type   main, %function
main:
	mov	maxi, 0
	mov	maxv, 0
	ldr	i, =first
	ldr	limit, =last
loopstart:
	mov	counter, 0
	mov	j, i
inner:
	cmp	j, 1
	beq	inc_counter
	bl	next_term
	add	counter, counter, 1
	b	inner
inc_counter:
	add	counter, counter, 1
	cmp	maxv, counter
        b.ge    nexti
	mov	maxv, counter
	mov	maxi, i
nexti:
	adds	i, i, 1
	cmp 	i, limit
	blt	loopstart
	
printme:
	mov	x1, maxi
        ldr     x0, =numstring
        bl      printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

        .global next_term
        .type   next_term, %function
next_term:
#        stmfd   sp!, {lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	ands	x2, x1, 1
	bne	odd
	add	x0, xzr, x0, lsr 1	/* leave bit 0 in carry */
	b	next_term_last
odd:
	adds	x2, x0, x0
	adds	x2, x2, x0
	adds	x2, x2, 1
	mov	x0, x2		/* r1 is 3n+1 - any overflow to r0 */

next_term_last:
#        ldmfd   sp!, {pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
