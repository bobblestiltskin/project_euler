# this subroutine divides the passed number by 10 and
# returns the dividend and remainder
# 
# inputs
#   x0 - integer to divide
#
# outputs
#   x0 - the dividend
#   x1 - the remainder

tmp_ten    .req x4
remainder  .req x5
tmp_mul    .req x6
tmp_div    .req x7

.equ ten, 10
.text
.align	2
.global	divide_by_10_remainder
.type	divide_by_10_remainder, %function
divide_by_10_remainder:
        stp fp, lr, [sp, #-0x30]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        mov fp, sp
 
	cmp	x0, 10
	blt	rsmall

        movz tmp_ten, ten
        udiv tmp_div, x0, tmp_ten
        mul  tmp_mul, tmp_div, tmp_ten
        sub remainder, x0, tmp_mul

	mov x1, remainder
	mov x0, tmp_div

	b	rlast
rsmall:
	mov	x1, x0
	mov	x0, 0
rlast:
	ldp x6, x7, [sp, #0x20]
	ldp x4, x5, [sp, #0x10]
	ldp fp, lr, [sp], #0x30
	ret
