# this subroutine returns 1 if the passed number is prime; 0 if not

# inputs
#   r0 - integer to test

# outputs
#   r0 - prime boolean

number		.req x4
divisor		.req x5
tmp		.req x6

.global isprime
.type isprime, %function
.text
.align	2

isprime:
#	stmfd	sp!, {r4-r6, lr}
        stp fp, lr, [sp, #-0x30]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        mov fp, sp

	mov	number, x0
	ands	tmp, number, 1
	bne	odd
	mov	x0, 0
	cmp	number, 2 	/* 2 is the only prime even number */
	bne	last
	mov	x0, 1
	b	last
odd:
	mov	divisor, 3
	cmp 	number, 8
	bgt	big
	mov	x0, 1
	cmp	number, 1	/* 1 is the only odd number < 8 not prime */
	bne	last
	mov	x0, 0
	b	last
big:
	mov	x0, number
	mov	x1, divisor
	bl	divide
	cmp	x1, 0
	b.eq	factor
	add	divisor, divisor, 2
	mul	tmp, divisor, divisor
	subs	tmp, tmp, number
	ble	big
	mov	x0, 1
	b	last
factor:
	mov	x0, 0
last:
#	ldmfd	sp!, {r4-r6, pc}
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x30

	ret
