# this subroutine divides the passed number by 10 and
# returns the dividend and remainder
# 
# inputs
#   x0 - integer to divide
#
# outputs
#   x0 - the dividend
#   x1 - the remainder

.include "regs.s"

tmp_ten    .req x19
remainder  .req x20
tmp_mul    .req x21
tmp_div    .req x22

.equ ten, 10
.text
.align	2
.global	divide_by_10_remainder
.type	divide_by_10_remainder, %function
divide_by_10_remainder:
	callee_save_regs_on_stack
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp
 
	cmp	x0, 10
	b.lt	rsmall

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
	ldp fp, lr, [sp], #0x10
	callee_restore_regs_from_stack
	ret
