# this subroutine returns 1 if the passed 6-digit number is palindromic; 0 if not
#
# inputs
#   x0 - integer to test
#
# outputs
#   x0 - palindromic boolean
#
	digit1		.req x4
	digit2		.req x5
	digit3		.req x6
	digit4		.req x7
	digit5		.req x8
	digit6		.req x9
#  
.global is_palindromic
.type is_palindromic, %function
.text
.align	2
#
is_palindromic:
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	bl	divide_by_10_remainder
	mov	digit1, x1

	bl	divide_by_10_remainder
	mov	digit2, x1

	bl	divide_by_10_remainder
	mov	digit3, x1

	bl	divide_by_10_remainder
	mov	digit4, x1

	bl	divide_by_10_remainder
	mov	digit5, x1
	mov	digit6, x0

        cmp digit1, digit6
        b.ne	no

        cmp digit2, digit5
        b.ne	no

        cmp digit3, digit4
        b.ne	no

        mov     x0, 1
        b	is_palindromic_end
no:
        mov 	x0, 0
is_palindromic_end:
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
