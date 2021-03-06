.syntax unified

.equ last, 1000000
.equ first, 500000

.align 4

maxi		.req r4
maxv		.req r5
counter		.req r6
i		.req r7
j_hi		.req r8
j_lo		.req r9
limit		.req r10

.section .rodata
        .align  2
numstring:
        .asciz "%d\n"
.text
        .align  2
        .global main
        .type   main, %function
main:
        stmfd   sp!, {r4-r10, lr}

	mov	maxi, 0
	mov	maxv, 0
	ldr	i, =first
	ldr	limit, =last
loopstart:
	mov	counter, 0
	mov	j_lo, i
inner:
	cmp	j_lo, 1
	beq	inc_counter
	mov	r0, j_hi
	mov	r1, j_lo
	bl	next_term
	mov	j_hi, r0
	mov	j_lo, r1
	add	counter, counter, 1
	b	inner
inc_counter:
	add	counter, counter, 1
	cmp	maxv, counter
	movlt	maxv, counter
	movlt	maxi, i
	adds	i, i, 1
	cmp 	i, limit
	blt	loopstart
	
printme:
	mov	r1, maxi
        ldr     r0, =numstring
        bl      printf
        mov     r0, 0
        ldmfd   sp!, {r4-r10, pc}
        mov     r7, 1           @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

        .global next_term
        .type   next_term, %function
next_term:
        stmfd   sp!, {lr}
	ands	r2, r1, 1
	bne	odd
	movs	r0, r0, lsr 1	@ leave bit 0 in carry
	rrx	r1, r1		@ then get it and push it on
	b	next_term_last
odd:
	adds	r2, r1, r1
	adc	r0, r0, 0
	adds	r2, r2, r1
	adc	r0, r0, 0
	adds	r2, r2, 1
	adc	r0, r0, 0
	mov	r1, r2		@ r1 is 3n+1 - any overflow to r0

next_term_last:
        ldmfd   sp!, {pc}
