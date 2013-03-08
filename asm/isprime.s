.syntax unified

# this subroutine returns 1 if the passed number is prime; 0 if not

# inputs
#   r0 - integer to test

# outputs
#   r0 - prime boolean

number		.req r4
divisor		.req r5
tmp		.req r6

.global isprime
.type isprime, %function
.text
.align	2

isprime:
	stmfd	sp!, {r4-r6, lr}
	mov	number, r0
	ands	tmp, number, 1
	bne	odd
	mov	r0, 0
	cmp	number, 2 	@ 2 is the only prime even number
	bne	last
	mov	r0, 1
	b	last
odd:
	mov	divisor, 3
	cmp 	number, 8
	bgt	big
	mov	r0, 1
	cmp	number, 1	@ 1 is the only odd number < 8 not prime
	bne	last
	mov	r0, 0
	b	last
big:
	mov	r0, number
	mov	r1, divisor
	bl	divide
	teq	r1, 0
	beq	factor
	add	divisor, divisor, 2
	mul	tmp, divisor, divisor
	subs	tmp, tmp, number
	ble	big
	mov	r0, 1
	b	last
factor:
	mov	r0, 0
last:
	ldmfd	sp!, {r4-r6, pc}
