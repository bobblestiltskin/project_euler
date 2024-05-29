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

.include "regs.s"

iptr		.req x19
optr		.req x20
numtens		.req x21
ilength		.req x22

.global mul_tens_string
.type mul_tens_string, %function
.text
.align	2

mul_tens_string:
	callee_save_regs_on_stack
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	iptr, x0
	mov	ilength, x1
	mov	numtens, x2
	add	optr, x0, x1
	add	ilength, ilength, numtens

	mov	w2, #0
cbl_start:
	cmp	numtens, #0
	b.eq	cbl_end
	strb	w2, [optr], 1
	subs	numtens, numtens, #1

	b	cbl_start
cbl_end:
	mov	x0, iptr
	mov	x1, ilength

        ldp 	fp, lr, [sp], #0x10
	callee_restore_regs_from_stack
	ret
