# divide takes value in r0, divisor in r1 and returns dividend in r0 and modulus in r1 
# inputs
#   x0 - integer to divide
#   x1 - the divisor
#
# outputs
#   x0 - the dividend
#   x1 - the remainder

.include "regs.s"

number     .req x0
divisor    .req x1

remainder  .req x19
tmp_mul    .req x20
tmp_div    .req x21

.text
.align	2
.global	divide
.type	divide, %function
divide:
	callee_save_regs_on_stack
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	cmp	number, divisor
	b.lt	rsmall

        udiv tmp_div, number, divisor
        mul  tmp_mul, tmp_div, divisor
        sub  remainder, number, tmp_mul

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
