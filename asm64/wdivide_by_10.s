# this subroutine divides the passed number by 10 and
# returns the dividend and remainder
# 
# inputs
#   w0 - integer to divide
#
# outputs
#   w0 - the dividend
#   w1 - the remainder

tmp_ten    .req w4
remainder  .req w5
tmp_mul    .req w6
tmp_div    .req w7

.equ ten, 10
.text
.align	2
.global	wdivide_by_10_remainder
.type	wdivide_by_10_remainder, %function
wdivide_by_10_remainder:
        stp fp, lr, [sp, #-0x30]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        mov fp, sp

	cmp	w0, 10
	blt	rsmall

        movz tmp_ten, ten
        udiv tmp_div, w0, tmp_ten
        mul  tmp_mul, tmp_div, tmp_ten
        sub remainder, w0, tmp_mul

	mov w1, remainder
	mov w0, tmp_div

	b	rlast
rsmall:
	mov	w1, w0
	mov	w0, 0
rlast:
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x30

	ret
