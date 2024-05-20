# this subroutine multiplies the byte array at x0, length x1 by the number of x2
# and stores to x0 with output length in x1
#
# inputs
#   x0 - pointer to input vector
#   x1 - length of input vector
#   x2 - number of zeroes to append
#
# outputs
#   x0 - pointer to output vector
#   x1 - length of output vector

iptr		.req x4
optr		.req x5
len		.req x6
tmp		.req x7
ptr		.req x8
numtens		.req x9
ilength		.req x11

.global mul_tens_string
.type mul_tens_string, %function
.text
.align	2

mul_tens_string:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	iptr, x0
	mov	ilength, x1
	mov	numtens, x2
#	mov	len, numtens
#	add	len, len, ilength
	mov	optr, x3

	mov	x0, iptr
	mov	x1, ilength
	mov	x2, optr

	mov	len, x1
	mov	ptr, x2
copybytesloopstart:
	ldrb	w3, [x0], 1
	strb	w3, [x2], 1
	subs	x1, x1, 1
	b.ne	copybytesloopstart

cbl_start:
	cmp	numtens, #0
	b.eq	cbl_end
	mov	w3, #0
	strb	w3, [x2], 1
	add	len, len, 1
	subs	numtens, numtens, #1
	
	b	cbl_start
cbl_end:
	mov	x0, ptr
	mov	x1, len

        ldp 	fp, lr, [sp], #0x10
	ret
