.syntax unified

.equ datum_size, 1

# this subroutine multiplies the byte array at r0, length r1 by the digit r2 
# and stores to r0 with output length in r1
#
# inputs
#   r0 - pointer to input vector
#   r1 - length of input vector
#   r2 - multiplicand
#   r3 - pointer to output vector
#
# outputs
#   r0 - pointer to output vector
#   r1 - length of output vector
#
# local
#
	cell		.req r3
	iptr		.req r4
	optr		.req r5
	offset		.req r6
	tmp		.req r7
	carry		.req r8
	multiplier	.req r9
#
.global mul_digit_string
.type mul_digit_string, %function
.text
.align	2
#
mul_digit_string:
	stmfd	sp!, {r4-r9, lr}
	mov	carry, 0
	mov	offset, r1
	mov	multiplier, r2
	sub	offset, offset, 1
	add	iptr, r0, offset
	add	optr, r3, offset
	add	offset, offset, 1
	mov	tmp, r1
loopstart:
	ldrb	cell, [iptr], -1
	mul	r0, cell, multiplier
	add	r0, r0, carry
	bl	divide_by_10_remainder
	strb	r1, [optr], -1
	mov	carry, r0
	subs	offset, offset, 1
	beq	last
	b	loopstart
last:
	cmp	carry, 0
	addeq	r0, optr, 1
	moveq	r1, tmp
	strbne	carry, [optr]
	movne	r0, optr
	addne	r1, tmp, 1
	ldmfd	sp!, {r4-r9, pc}