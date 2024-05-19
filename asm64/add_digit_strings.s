# see usage in test_add_digit_strings.s

.equ datum_size, 1

.text
optr		.req x12
sptr		.req x13
lptr		.req x14
scellw		.req w15
scell		.req x15
lcellw		.req w16
lcell		.req x16
carryw		.req w17
carry		.req x17
counter		.req x18
tmp		.req x19
length		.req x20

# this subroutine adds the byte array at x0, length x1
# to the byte array at x2, length x3. The data is output 
# to the pointer passed as x4.
#
# inputs
#   x0 - pointer to input1 vector
#   x1 - length of input1 vector
#   x2 - pointer to input2 vector
#   x3 - length of input2 vector
#   x4 - pointer to output vector
#
# outputs
#   x0 - pointer to output vector
#   x1 - length of output vector

.text
.align	2

.global add_digit_strings
.type add_digit_strings, %function
add_digit_strings:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	cmp	x3, x1
	b.ge	no_swap

	mov	x5, x0
	mov	x0, x2
	mov	x2, x5
	mov	x5, x1
	mov	x1, x3
	mov	x3, x5
no_swap:
	bl	add_strings_short_to_long

        ldp fp, lr, [sp], #0x10
	ret

# this subroutine adds the short byte array at x0, length x1
# to the byte array at x2, length x3.
#
# inputs
#   x0 - pointer to short vector
#   x1 - length of short vector
#   x2 - pointer to long vector
#   x3 - length of long vector
#   x4 - pointer to output vector
#
# outputs
#   x0 - pointer to output vector
#   x1 - length of output vector

.global add_strings_short_to_long
.type add_strings_short_to_long, %function
add_strings_short_to_long:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	length, x3
	mov	sptr, x0
	add	sptr, sptr, x1
	sub	sptr, sptr, 1

	mov	lptr, x2
	add	lptr, lptr, x3
	sub	lptr, lptr, 1
	add	optr, x4, x3

	mov	carryw, 0
	mov	counter, x1
sstart:
	ldrb	scellw, [sptr], -1
	ldrb	lcellw, [lptr], -1
	add	lcellw, lcellw, scellw
	add	lcellw, lcellw, carryw
	mov	carry, 0
	cmp	lcellw, 10
	b.lt	no_set_carry
	mov	carryw, 1
	sub	lcellw, lcellw, 10
no_set_carry:
	strb	lcellw, [optr], #-1
	subs	counter, counter, 1
	b.ne	sstart
	
	mov	counter, x3
	subs	counter, counter, x1
	b.eq	asstl_last
lstart:
	ldrb	lcellw, [lptr], -1
	add	lcellw, lcellw, carryw
	mov	carryw, 0
	cmp	lcell, 10
	b.lt	no_carry_update
	mov	carryw, 1
	sub	lcellw, lcellw, 10
no_carry_update:
	strb	lcellw, [optr], -1
	subs	counter, counter, 1
	bne	lstart

asstl_last:
	cmp	carryw, 1
	b.ne	no_carry_store
	strb	carryw, [optr], -1
no_carry_store:
	add	x0, optr, 1
	sxtw	carry, carryw
	add	x1, length, carry

        ldp fp, lr, [sp], #0x10
	ret
