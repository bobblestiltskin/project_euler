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

iptr		.req r4
optr		.req r5
offset		.req r6
tmp		.req r7
carry		.req r8
multiplier	.req r9
cell		.req r10

.global mul_digit_string
.type mul_digit_string, %function
.text
.align	2

mul_digit_string:
#	stmfd	sp!, {r4-r10, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	teq	r2, 0
	bne	mds_one
	moveq	r0, r3
	moveq	tmp, r3
	moveq	r1, 1
	bleq	clearbytes
	mov	r0, tmp
	moveq	r1, 1
	b	mds_end
mds_one:
	teq	r2, 1
	bne	mds_start
	moveq	r2, r3
	moveq	tmp, r0
	moveq	cell, r1
	bleq	copybytes
	mov	r0, tmp
	mov	r1, cell
	b	mds_end
mds_start:
	mov	carry, r0
	mov	tmp, r1
	mov	offset, r3
	mov	r0, r3
	add	r1, r1, 1
	bl	clearbytes
	mov	r0, carry
	mov	r1, tmp
	mov	r3, offset

	mov	carry, 0
	mov	multiplier, r2
	mov	offset, r1
	sub	offset, offset, 1
	add	iptr, r0, offset
	add	optr, r3, offset
	add	offset, offset, 1
	mov	tmp, r1
mds_loopstart:
	ldrb	cell, [iptr], -1
	mul	r0, cell, multiplier
	add	r0, r0, carry
	bl	divide_by_10_remainder
	strb	r1, [optr], -1
	mov	carry, r0
	subs	offset, offset, 1
	beq	mds_last
	b	mds_loopstart
mds_last:
	cmp	carry, 0
	addeq	r0, optr, 1
	moveq	r1, tmp
	strbne	carry, [optr]
	movne	r0, optr
	addne	r1, tmp, 1
mds_end:
#	ldmfd	sp!, {r4-r10, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
