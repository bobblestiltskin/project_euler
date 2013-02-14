.syntax unified 

.equ datum_size, 1

.section rodata
resstring:
.asciz "%d\n"

.text
sptr		.req r4
lptr		.req r5
scell		.req r6
lcell		.req r7
tmp		.req r7
carry		.req r8
counter		.req r9
#
.global add_digit_strings
.type add_digit_strings, %function

# this subroutine adds the byte array at r0, length r1
# to the byte array at r2, length r3.
#
# the longer string is overwritten,
# or if the same length the second is overwritten
#
# inputs
#   r0 - pointer to input1 vector
#   r1 - length of input1 vector
#   r2 - pointer to input2 vector
#   r3 - length of input3 vector
#
# outputs
#   r0 - pointer to output vector
#   r1 - length of output vector

.text
.align	2

add_digit_strings:
        stmfd   sp!, {r4-r9, lr}
	cmp	r3, r1
	movlt	tmp, r0
	movlt	r0, r2
	movlt	r2, tmp
	bl	add_strings_short_to_long
        ldmfd   sp!, {r4-r9, pc}

.global add_strings_short_to_long
.type add_strings_short_to_long, %function

# this subroutine adds the short byte array at r0, length r1
# to the byte array at r2, length r3.
#
# inputs
#   r0 - pointer to short vector
#   r1 - length of short vector
#   r2 - pointer to long vector
#   r3 - length of long vector
#
# outputs
#   r0 - pointer to output vector
#   r1 - length of output vector

add_strings_short_to_long:
        stmfd   sp!, {r4-r9, lr}
	mov	sptr, r0
	add	sptr, sptr, r1
	sub	sptr, sptr, 1

	mov	lptr, r2
	add	lptr, lptr, r3
	sub	lptr, lptr, 1
	
	mov	carry, 0
	mov	counter, r1
sstart:
	ldrb	scell, [sptr], -1
	ldrb	lcell, [lptr]
	add	lcell, lcell, scell
	add	lcell, lcell, carry
	mov	carry, 0
	cmp	lcell, 10
	movge	carry, 1
	subge	lcell, lcell, 10
	strb	lcell, [lptr], -1
	subs	counter, counter, 1
	bne	sstart
	
	mov	counter, r3
	sub	counter, counter, r1
lstart:
	ldrb	lcell, [lptr]
	add	lcell, lcell, carry
	cmp	lcell, 10
	movge	carry, 1
	subge	lcell, lcell, 10
	strb	lcell, [lptr], -1
	subs	counter, counter, 1
	bne	lstart

        ldmfd   sp!, {r4-r9, pc}
