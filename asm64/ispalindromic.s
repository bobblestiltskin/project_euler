# this subroutine returns 1 if the passed 6-digit number is palindromic; 0 if not
#
# inputs
#   x0 - integer to test
#
# outputs
#   x0 - palindromic boolean

.include "regs.s"

digit1		.req x19
digit2		.req x20
digit3		.req x21
digit4		.req x22
digit5		.req x23
digit6		.req x24

.global is_palindromic
.type is_palindromic, %function
.text
.align	2
is_palindromic:
	callee_save_regs_on_stack
        stp fp, lr, [sp, #-0x10]!
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
        ldp fp, lr, [sp], #0x10
	callee_restore_regs_from_stack

	ret
