# this subroutine multiplies the byte array at x0, length x1 by the digit x2 
# and stores to x0 with output length in x1
#
# inputs
#   x0 - pointer to input vector
#   x1 - length of input vector
#   x2 - multiplicand
#   x3 - pointer to output vector
#
# outputs
#   x0 - pointer to output vector
#   x1 - length of output vector

iptr		.req x4
optr		.req x5
offset		.req x6
tmp		.req x7
carryb		.req w8
carry		.req x8
multiplier	.req x9
cellb		.req w10
cell		.req x10
ilength		.req x11

.global mul_digit_string
.type mul_digit_string, %function
.text
.align	2

mul_digit_string:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	iptr, x0
	mov	ilength, x1
	mov	multiplier, x2
	mov	optr, x3

	cmp	multiplier, 0
	b.ne	mds_one
	mov	cellb, 0
	mov	optr, x3
	strb	cellb, [x3], 1
	mov	x0, optr
	mov	x1, 1
	b	mds_end
mds_one:
	cmp	multiplier, 1
	b.ne	mds_start
	mov	x0, iptr
	mov	x1, ilength
	mov	x2, optr

        stp x10, x11, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]

	bl	copybytes

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp x10, x11, [sp], #0x40

	mov	x0, optr
	mov	x1, ilength
	b	mds_end
mds_start:
	mov	carry, x0
	mov	tmp, x1
	mov	offset, x3
	mov	x0, x3
	add	x1, x1, 1

        stp x10, x11, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]

	bl	clearbytes

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp x10, x11, [sp], #0x40

	mov	x0, carry
	mov	x1, tmp
	mov	x3, offset

	mov	carryb, 0
	mov	multiplier, x2
	mov	offset, x1
	sub	offset, offset, 1
	add	iptr, x0, offset
	add	optr, x3, offset
	add	offset, offset, 1
	mov	tmp, x1
mds_loopstart:
	ldrb	cellb, [iptr], -1
	sxtw	cell, cellb
	mul	x0, cell, multiplier
	sxtw	carry, carryb
	add	x0, x0, carry

        stp x10, x11, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]

	bl	divide_by_10_remainder

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp x10, x11, [sp], #0x40

	strb	w1, [optr], -1
	mov	carryb, w0

	subs	offset, offset, 1
	beq	mds_last
	b	mds_loopstart
mds_last:
	cmp	carryb, 0
	b.ne 	store_byte
	add	x0, optr, 1
	mov	x1, tmp
	b	mds_end
store_byte:
	strb	carryb, [optr]
	mov	x0, optr
	add	x1, tmp, 1
mds_end:
        ldp 	fp, lr, [sp], #0x10
	ret
