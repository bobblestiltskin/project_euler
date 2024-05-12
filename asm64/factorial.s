# this computes the factorial of the number passed 
#
# inputs
#   r0 - the number used for factorial
#   r1 - pointer to input vector of bytes
#   r2 - pointer to output vector of bytes
#
# outputs
#   r0 - output vector pointer
#   r1 - length of output vector

number	.req r4
iptr	.req r5
ilen	.req r6
tmp	.req r7
counter	.req r8
optr	.req r9

.text
	.align	2
	.global	factorial
	.type	factorial, %function
factorial:
#	stmfd   sp!, {r4-r9, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	cmp	r0, 2
	bge	factorial_ok
	mov	r0, r1
	mov	r1, 1
	bl	copybytes
	b	factorial_end
factorial_ok:
	mov	number, r0
	mov	iptr, r1
	mov	optr, r2
	mov	ilen, 1
	mov	counter, 2
	mov	r0, optr
factorial_start:
	mov	r0, optr
	mov	r1, ilen
	add	r1, r1, 1
bclear:
	bl	clearbytes
aclear:
        mov     r0, iptr
        mov     r1, ilen
        mov     r2, counter
        mov     r3, optr
bmis:
        bl      mul_int_string
amis:
	teq	counter, number
	beq	factorial_last
	mov	ilen, r1
	mov	r2, iptr
bcopy:
	bl	copybytes
acopy:
	add	counter, counter, 1
	b	factorial_start
factorial_last:
	mov	counter, r0
	mov	tmp, r1
	mov	r0, iptr
	mov	r1, ilen
	bl	clearbytes
	mov	r1, tmp
	mov	r0, counter
factorial_end:
#	ldmfd   sp!, {r4-r9, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
