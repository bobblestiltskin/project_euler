.include "regs.s"

.equ datum_size, 1
.equ MAXLEN,10000

.section bss
.lcomm tmp_vector,MAXLEN
.lcomm rolling_sum,MAXLEN

# this subroutine multiplies the byte array at x0 with length x1 by the value x2
# and stores to x0 with output length in x1
# the output vector is passed as x3.
#
# the byte arrays stores integers of arbitrary length
# e.g. the integer 123456 is stored in 6 successive bytes digit by digit
#
# inputs
#   x0 - pointer to input vector
#   x1 - length of input vector
#   x2 - multiplicand
#   x3 - pointer to output vector
#
# outputs
#   x0 - pointer to output vector
#   x1 - length of output vector

tptr 		.req x10
iptr		.req x11
optr		.req x12
tlength		.req x13
ilength		.req x14
olength		.req x15
number		.req x16
numtens		.req x17
digit		.req x18
rptr		.req x19
rlength		.req x20
wtmp		.req w21
rs_init		.req w22

.global mul_int_string
.type mul_int_string, %function
.text
.align	2

mul_int_string:
	caller_save_regs_on_stack
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	mov	iptr, x0
	ldr	tptr, =tmp_vector
	ldr	rptr, =rolling_sum
	mov	ilength, x1
	mov	olength, x1
	mov	rlength, x1
	mov	number, x2
	mov	optr, x3

	cmp	number, 10
	b.lt	single_digit

	mov	rs_init, #0
	mov	numtens, #0
loopstart:
	mov 	x0, number
	bl	divide_by_10_remainder

	mov	number, x0
	mov	digit, x1

	cmp	digit, #0
	b.eq	increment_numtens

	mov	x0, iptr
	mov	x1, ilength
	mov	x2, digit
	mov	x3, tptr
	bl	mul_digit_string

	mov	tptr, x0
	mov	tlength, x1

	cmp	rs_init, #0
	b.ne	have_rolling_sum
	mov	rs_init, #1

# first digit processed. copy the current data to the rolling sum

	cmp	numtens, #0
	b.eq	no_tens

# multiply current by 10 by adding zeroes to the end and extending

        mov     x0, tptr
        mov     x1, tlength
        mov     x2, numtens
        bl      mul_tens_string

	mov	tlength, x1

	mov	x0, tptr
	mov	x1, tlength
	mov	x2, optr
	bl	copybytes

	mov	olength, x1

	b	increment_numtens
no_tens:
	mov	x0, tptr
	mov	x1, tlength
	mov	x2, rptr
	mov	rlength, tlength
	bl	copybytes

	b	increment_numtens
have_rolling_sum:
# already have output data so add the new data to the current data
# multiply current by 10 by adding zeroes to the end and extending

        mov     x0, tptr
        mov     x1, tlength
        mov     x2, numtens
        bl      mul_tens_string

	mov	tptr, x0
	mov	tlength, x1
ba:
# add the current data to the rolling sum
	mov	x0, tptr
	mov	x1, tlength
	mov	x2, rptr
	mov	x3, rlength
	sub	x4, optr, numtens
	bl	add_digit_strings

	mov	optr, x0
	mov	olength, x1
# update the rolling sum
	mov	x0, optr
	mov	x1, olength
	mov	x2, rptr
	bl	copybytes

	mov	rptr, x0
	mov	rlength, x1
increment_numtens:
	add	numtens, numtens, #1
	cmp	number, #0
	b.ne	loopstart
loopend:
	mov	x0, optr
	mov	x1, olength

	b	mis_end
single_digit:
	bl	mul_digit_string
mis_end:
        ldp	fp, lr, [sp], #0x10
	caller_restore_regs_from_stack
	ret
