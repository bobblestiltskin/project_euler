.syntax unified 

.equ datum_size, 1

.text
#optr		.req r11
optr		.req r4
sptr		.req r5
lptr		.req r6
scell		.req r7
lcell		.req r8
carry		.req r9
ltmp		.req r9
counter		.req r10
ptmp		.req r10

# this subroutine adds the byte array at r0, length r1
# to the byte array at r2, length r3. The data is output 
# to the pointer passed as r4.
#
# inputs
#   r0 - pointer to input1 vector
#   r1 - length of input1 vector
#   r2 - pointer to input2 vector
#   r3 - length of input3 vector
#   r4 - pointer to output vector
#
# outputs
#   r0 - pointer to output vector
#   r1 - length of output vector

.text
.align	2

.global add_digit_strings
.type add_digit_strings, %function
add_digit_strings:
        stmfd   sp!, {r9-r10, lr}
	cmp	r3, r1
	movlt	ptmp, r0
	movlt	r0, r2
	movlt	r2, ptmp
	movlt	ltmp, r1
	movlt	r1, r3
	movlt	r3, ltmp
	bl	add_strings_short_to_long
        ldmfd   sp!, {r9-r10, pc}

# this subroutine adds the short byte array at r0, length r1
# to the byte array at r2, length r3.
#
# inputs
#   r0 - pointer to short vector
#   r1 - length of short vector
#   r2 - pointer to long vector
#   r3 - length of long vector
#   r4 - pointer to output vector
#
# outputs
#   r0 - pointer to output vector
#   r1 - length of output vector

.global add_strings_short_to_long
.type add_strings_short_to_long, %function
add_strings_short_to_long:
#        stmfd   sp!, {r5-r11, lr} @ 7 longs
        stmfd   sp!, {r5-r10, lr} @ 7 longs
	ldr	optr, [sp, #40]
	mov	sptr, r0
	add	sptr, sptr, r1
	sub	sptr, sptr, 1

	mov	lptr, r2
	add	lptr, lptr, r3
	sub	lptr, lptr, 1
	
	add	optr, optr, r3

	mov	carry, 0
	mov	counter, r1
sstart:
	ldrb	scell, [sptr], -1
	ldrb	lcell, [lptr], -1
	add	lcell, lcell, scell
	add	lcell, lcell, carry
	mov	carry, 0
	cmp	lcell, 10
	movge	carry, 1
	subge	lcell, lcell, 10
	strb	lcell, [optr], -1
	subs	counter, counter, 1
	bne	sstart
	
	mov	counter, r3
	subs	counter, counter, r1
	beq	asstl_last
lstart:
	ldrb	lcell, [lptr], -1
	add	lcell, lcell, carry
	mov	carry, 0
	cmp	lcell, 10
	movge	carry, 1
	subge	lcell, lcell, 10
	strb	lcell, [optr], -1
	subs	counter, counter, 1
	bne	lstart

asstl_last:
	cmp	carry, 1
	strbeq	carry, [optr], -1
#	addne	optr, optr, 1

	add	r0, optr, 1
	add	r1, r3, carry
        ldmfd   sp!, {r5-r10, pc}
#        ldmfd   sp!, {r5-r11, pc}
