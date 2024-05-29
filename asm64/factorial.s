# this computes the factorial of the number passed 
#
# inputs
#   x0 - the number used for factorial
#   x1 - pointer to input vector of bytes
#   x2 - pointer to output vector of bytes
#
# outputs
#   x0 - output vector pointer
#   x1 - length of output vector

.include "regs.s"

number	.req x9
iptr	.req x10
ilen	.req x11
tmp	.req x12
counter	.req x13
optr	.req x14

.text
	.align	2
	.global	factorial
	.type	factorial, %function
factorial:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	cmp	x0, 1
	b.gt	factorial_ok
	mov	x0, x1
	mov	x1, 1
        bl      copybytes

	b	factorial_end
factorial_ok:
	mov	number, x0
	mov	iptr, x1
	mov	optr, x2
	mov	ilen, 1
	mov	counter, 2
factorial_start:
	mov	x0, optr
	mov	x1, ilen
	add	x1, x1, 1
bclear:
        bl      clearbytes
aclear:
        mov     x0, iptr
        mov     x1, ilen
        mov     x2, counter
        mov     x3, optr
bmis:
	caller_save_regs_on_stack
        bl      mul_int_string
	caller_restore_regs_from_stack
amis:
	cmp	counter, number
	b.eq	factorial_last
	mov	ilen, x1
	mov	x2, iptr
bcopy:
	bl	copybytes
acopy:
	add	counter, counter, 1
	b	factorial_start
factorial_last:
	mov	counter, x0
	mov	tmp, x1
	mov	x0, iptr
	mov	x1, ilen
        bl      clearbytes

	mov	x1, tmp
	mov	x0, counter
factorial_end:
        ldp fp, lr, [sp], #0x10
	ret
