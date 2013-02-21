.syntax unified

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
	stmfd   sp!, {r4-r9, lr}

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
	bl	clearbytes
        mov     r0, iptr
        mov     r1, ilen
        mov     r2, counter
        mov     r3, optr
        bl      mul_int_string
	teq	counter, number
	beq	factorial_end
	mov	ilen, r1
	mov	r2, iptr
	bl	copybytes
	add	counter, counter, 1
	b	factorial_start
factorial_end:
	ldmfd   sp!, {r4-r9, pc}
