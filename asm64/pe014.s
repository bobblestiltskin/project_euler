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
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp
	mov	maxi, 0
	mov	maxv, 0
	ldr	i, =first
	ldr	limit, =last
loopstart:
	mov	counter, 0
	mov	j, i
inner:
	cmp	j, 1
	b.eq	inc_counter
	mov	x0, j
	bl	next_term
	mov	j, x0
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
	b.lt	loopstart
	
printme:
	mov	x1, maxi
        ldr     x0, =numstring
        bl      printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret

        .global next_term
        .type   next_term, %function
next_term:
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	tbnz    x0, #0, odd /* check 0th bit of current - set to 1 for odd numbers - so we jump to odd */
	add	x0, xzr, x0, lsr 1	/* halve x0; leave bit 0 in carry */
	b	next_term_last
odd:
	adds	x2, x0, x0
	adds	x2, x2, x0
	adds	x2, x2, 1
	mov	x0, x2		/* x0 is 3n+1 */
next_term_last:
        ldp	fp, lr, [sp], #0x10
	ret
