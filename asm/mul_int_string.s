.syntax unified

.equ datum_size, 1
.equ MAXLEN,192

# how could we allocate temporary arrays from the code
# we need the size to be some function of r2?

.section bss
.lcomm tmp_vector,MAXLEN

# this subroutine multiplies the byte array at r0, length r1 by the int r2 
# and stores to r0 with output length in r1
#
# inputs
#   r0 - pointer to input vector
#   r1 - length of input vector
#   r2 - multiplicand
#   r3 - pointer to output vector
#
# outputs
#   r0 - pointer to output vector
#   r1 - length of output vector
#
# local

	iptr		.req r4
	optr		.req r5
	ilength		.req r6
	tlength		.req r7
	olength		.req r8
	tmp		.req r9
	multiplier	.req r10

.global mul_int_string
.type mul_int_string, %function
.text
.align	2

mul_int_string:
	stmfd	sp!, {r4-r10, lr}
	mov	iptr, r0
	mov	ilength, r1
	mov	tlength, r1
	mov	olength, r1
	mov	multiplier, r2
	mov	optr, r3
mis_loopstart:
	teq	multiplier, 0
	beq	mis_last

	ldr	r0, =tmp_vector
	mov	r1, tlength
	bl	clearbytes

	mov	r0, multiplier
	bl	divide_by_10_remainder
	mov	multiplier, r0
	mov	r2, r1
	mov	r0, iptr
	mov	r1, ilength
	ldr	r3, =tmp_vector
bm:
	bl	mul_digit_string
am:
	mov	tmp, r0
	cmp     tlength, r1
        movlt   tlength, r1    @ set tlength to max of tlength and r1

        stmfd   sp!, {r4}
        mov     r0, optr
        stmfd   sp!, {r0}       @ this is the fifth parameter for the subroutine

	mov	r0, tmp
	mov	r1, tlength
	mov	r2, optr
ba:
	mov	r3, olength
	bl	add_digit_strings
	mov	optr, r0
	cmp	olength, r1
	movlt	olength, r1
        add     sp, sp, 4       @ revert sp to before (1)
	ldmfd	sp!, {r4}
aa:
	teq	multiplier, 0
	addne	ilength, ilength, 1	
	beq	mis_last
	bne	mis_loopstart
mis_last:
	ldmfd	sp!, {r4-r10, pc}

