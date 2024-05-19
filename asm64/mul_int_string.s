.equ datum_size, 1
#.equ MAXLEN,192
.equ MAXLEN,384

.section bss
.lcomm tmp_vector,MAXLEN

# this subroutine multiplies the byte array at x0 with length x1 by x2 
# and stores to x0 with output length in x1
# the output vector is passed as x3.
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
mylr		.req x19

.global mul_int_string
.type mul_int_string, %function
.text
.align	2

mul_int_string:
        stp fp, lr, [sp, #-0x60]!
        stp x10, x11, [sp, #0x10]
        stp x12, x13, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x16, x17, [sp, #0x40]
        stp x18, x19, [sp, #0x50]
        mov fp, sp
	mov mylr, x30

	mov	iptr, x0
	ldr	tptr, =tmp_vector
	mov	ilength, x1
	mov	olength, x1
	mov	number, x2
	mov	optr, x3

	cmp	number, 10
	b.lt	single_digit

	mov	numtens, #0
loopstart:
	mov 	x0, number
	bl	divide_by_10_remainder
	mov	number, x0
	mov	digit, x1

	mov	x0, iptr
	mov	x1, ilength
	mov	x2, digit
	mov	x3, tptr
	bl	mul_digit_string

	mov	tptr, x0
	mov	tlength, x1

	cmp	numtens, #0
	b.ne	havetens

# first digit processed. copy the current data to the output
	mov	x0, tptr
	mov	x1, tlength
	mov	x2, optr
	bl	copybytes

	b	increment_numtens
havetens:
# already have output data so add the new data to the current data

# multiply current by 10 by adding zeroes to the end and extending

	add	x0, tptr, tlength
	mov 	x1, numtens
	bl	clearbytes
	add	tlength, tlength, numtens

# add the current data to the output data
	mov	x0, tptr
	mov	x1, tlength
	mov	x2, optr
	mov	x3, olength
	mov	x4, optr

	bl	add_digit_strings
	mov	optr, x0
	mov	olength, x1

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
        ldp x18, x19, [sp, #0x50]
        ldp x16, x17, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x12, x13, [sp, #0x20]
        ldp x10, x11, [sp, #0x10]
        ldp fp, lr, [sp], #0x60

#	mov lr, mylr
	ret
