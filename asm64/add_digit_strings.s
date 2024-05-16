# see usage in test_add_digit_strings.s - it requires
# the fifth parameter to be passed on the stack

.equ datum_size, 1

.text
optr		.req x4
sptr		.req x5
lptr		.req x6
scellw		.req w7
scell		.req x7
lcellw		.req w8
lcell		.req x8
carryw		.req w9
carry		.req x9
ltmp		.req x9
counter		.req x10
ptmp		.req x10

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

	mov	ptmp, x0
	mov	x0, x2
	mov	x2, ptmp
	mov	ltmp, x1
	mov	x1, x3
	mov	x3, ltmp
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
	add	x1, x3, carry

        ldp fp, lr, [sp], #0x10

	ret
