# divide takes value in r0, divisor in r1 and returns dividend in r0 and modulus in r1 
	.global	divide
	.type	divide, %function
divide:
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

# this subroutine divides x0 by x1 and
# returns the dividend and remainder
#
# inputs
#   x0 - integer to divide
#   x1 - the divisor
#
# outputs
#   x0 - the dividend
#   x1 - the remainder

number     .req x0
divisor    .req x1

remainder  .req x5
tmp_mul    .req x6
tmp_div    .req x7

.text
.align	2
.global	divide_with_remainder
.type	divide_with_remainder, %function
divide_with_remainder:
        stp fp, lr, [sp, #-0x30]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        mov fp, sp

	cmp	number, divisor
	blt	rsmall

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
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x30

	ret
