# this subroutine multiplies the byte array at x0, length x1 by the number of x2
# and stores to x0 with output length in x1
#
# inputs
#   x0 - pointer to input vector
#   x1 - length of input vector
#   x2 - number of zeroes to append
#   x3 - pointer to output vector
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
	add	optr, x0, x1

	add	len, ilength, numtens
	mov	ptr, x0
	mov	w2, #0
cbl_start:
	cmp	numtens, #0
	b.eq	cbl_end
	strb	w2, [optr], 1
	subs	numtens, numtens, #1

	b	cbl_start
cbl_end:
	mov	x0, ptr
	mov	x1, len

        ldp 	fp, lr, [sp], #0x10
	ret
