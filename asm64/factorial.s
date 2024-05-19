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

number	.req x4
iptr	.req x5
ilen	.req x6
tmp	.req x7
counter	.req x8
optr	.req x9

.text
	.align	2
	.global	factorial
	.type	factorial, %function
factorial:
#	stmfd   sp!, {r4-r9, lr}
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

	cmp	x0, 2
	b.ge	factorial_ok
	mov	x0, x1
	mov	x1, 1
	bl	copybytes
	b	factorial_end
factorial_ok:
	mov	number, x0
	mov	iptr, x1
	mov	optr, x2
	mov	ilen, 1
	mov	counter, 2
	mov	x0, optr
factorial_start:
	mov	x0, optr
	mov	x1, ilen
	add	x1, x1, 1
bclear:
	bl	clearbytes
aclear:
        mov     x0, iptr
        mov     x1, ilen
        mov     x2, counter
        mov     x3, optr
bmis:
        bl      mul_int_string
amis:
	cmp	counter, number
	beq	factorial_last
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
	bl	clearbytes
	mov	x1, tmp
	mov	x0, counter
factorial_end:
#	ldmfd   sp!, {r4-r9, pc}
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40
#
	ret
