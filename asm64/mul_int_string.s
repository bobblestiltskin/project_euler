.equ datum_size, 1
#.equ MAXLEN,192
.equ MAXLEN,384

.section bss
.lcomm tmp_vector,MAXLEN
.lcomm rolling_sum,MAXLEN

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
rptr		.req x19
rlength		.req x20
wtmp		.req w21

.global mul_int_string
.type mul_int_string, %function
.text
.align	2

mul_int_string:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	iptr, x0
	ldr	tptr, =tmp_vector
	ldr	rptr, =rolling_sum
	mov	ilength, x1
	mov	olength, x1
	mov	number, x2
	mov	optr, x3

	cmp	number, 10
	b.lt	single_digit

	mov	numtens, #0
loopstart:
	mov 	x0, number

        stp x6, x7, [sp, #-0x20]!
        stp x4, x5, [sp, #0x10]

	bl	divide_by_10_remainder

        ldp x4, x5, [sp, #0x10]
        ldp x6, x7, [sp], #0x20

	mov	number, x0
	mov	digit, x1

	mov	x0, iptr
	mov	x1, ilength
	mov	x2, digit
	mov	x3, tptr

        stp x10, x11, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]

	bl	mul_digit_string

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp x10, x11, [sp], #0x40

	mov	tptr, x0
	mov	tlength, x1

	cmp	numtens, #0
	b.ne	havetens

# first digit processed. copy the current data to the rolling sum

	mov	x0, tptr
	mov	x1, tlength
	mov	x2, rptr
	mov	rlength, tlength

        stp x6, x7, [sp, #-0x20]!
        stp x4, x5, [sp, #0x10]

	bl	copybytes

        ldp x4, x5, [sp, #0x10]
        ldp x6, x7, [sp], #0x20

	b	increment_numtens
havetens:
# already have output data so add the new data to the current data

# multiply current by 10 by adding zeroes to the end and extending

        mov     x0, tptr
        mov     x1, tlength
        mov     x2, numtens
        mov     x3, optr

        stp x18, x19, [sp, #-0x50]!
        stp x10, x11, [sp, #0x10]
        stp x12, x13, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x16, x17, [sp, #0x40]

        bl      mul_tens_string

	mov	optr, x0
	mov	olength, x1

        ldp x16, x17, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x12, x13, [sp, #0x20]
        ldp x10, x11, [sp, #0x10]
        ldp x18, x19, [sp], #0x50

	mov	x0, optr
	add	tlength, olength, 1
#	add	olength, olength, numtens
#	mov	tlength, olength
	mov	x1, olength
	mov	x2, tptr

        stp x6, x7, [sp, #-0x20]!
        stp x4, x5, [sp, #0x10]

	bl	copybytes

        ldp x4, x5, [sp, #0x10]
        ldp x6, x7, [sp], #0x20

	mov	x0, tptr
	mov	x1, tlength
ba:

# add the current data to the rolling sum
	mov	x0, rptr
	mov	x1, rlength
	mov	x2, tptr
	mov	x3, tlength
	mov	x4, optr

        stp x20, x21, [sp, #-0x50]!
        stp x12, x13, [sp, #0x10]
        stp x14, x15, [sp, #0x20]
        stp x16, x17, [sp, #0x30]
        stp x18, x19, [sp, #0x40]

	bl	add_digit_strings

        ldp x18, x19, [sp, #0x40]
        ldp x16, x17, [sp, #0x30]
        ldp x14, x15, [sp, #0x20]
        ldp x12, x13, [sp, #0x10]
        ldp x20, x21, [sp], #0x50

	mov	optr, x0
	mov	olength, x1

# move the output data to the rolling sum

	mov	x0, optr
	mov	x1, olength
	mov	x2, rptr
	mov	rlength, olength

        stp x6, x7, [sp, #-0x20]!
        stp x4, x5, [sp, #0x10]

	bl	copybytes

        ldp x4, x5, [sp, #0x10]
        ldp x6, x7, [sp], #0x20
increment_numtens:
	add	numtens, numtens, #1
	cmp	number, #0
	b.ne	loopstart
loopend:
	mov	x0, optr
	mov	x1, olength
#	mov	x0, rptr
#	mov	x1, rlength

	b	mis_end
single_digit:
        stp x10, x11, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]

	bl	mul_digit_string

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp x10, x11, [sp], #0x40
mis_end:
        ldp fp, lr, [sp], #0x10
	ret
