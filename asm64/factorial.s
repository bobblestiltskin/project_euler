# this computes the factorial of the number passed 
#
# inputs
#   x0 - the number used for factorial
#   x1 - pointer to input vector of bytes
#   x2 - pointer to output vector of bytes
#
# outputs
#   x0 - output vector pointer
#   x1 - length of output vector

.macro save_regs_on_stack
        stp x20, x21, [sp, #-0x90]!
        stp x18, x19, [sp, #0x10]
        stp x16, x17, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x12, x13, [sp, #0x40]
        stp x10, x11, [sp, #0x50]
        stp x8, x9,   [sp, #0x60]
        stp x6, x7,   [sp, #0x70]
        stp x4, x5,   [sp, #0x80]
.endm

.macro restore_regs_from_stack
        ldp x4, x5,   [sp, #0x80]
        ldp x6, x7,   [sp, #0x70]
        ldp x8, x9,   [sp, #0x60]
        ldp x10, x11, [sp, #0x50]
        ldp x12, x13, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x16, x17, [sp, #0x20]
        ldp x18, x19, [sp, #0x10]
        ldp x20, x21, [sp], #0x90
.endm

number	.req x4
iptr	.req x5
ilen	.req x6
tmp	.req x7
counter	.req x8
optr	.req x9

.text
	.align	2
	.global	factorial
	.type	factorial, %function
factorial:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	cmp	x0, 1
	b.gt	factorial_ok
	mov	x0, x1
	mov	x1, 1

	save_regs_on_stack

        bl      copybytes

	restore_regs_from_stack

	b	factorial_end
factorial_ok:
	mov	number, x0
	mov	iptr, x1
	mov	optr, x2
	mov	ilen, 1
	mov	counter, 2
factorial_start:
	mov	x0, optr
	mov	x1, ilen
	add	x1, x1, 1
bclear:
	save_regs_on_stack

        bl      clearbytes

	restore_regs_from_stack
aclear:
        mov     x0, iptr
        mov     x1, ilen
        mov     x2, counter
        mov     x3, optr
bmis:
	save_regs_on_stack

        bl      mul_int_string

	restore_regs_from_stack
amis:
	cmp	counter, number
	beq	factorial_last
	mov	ilen, x1
	mov	x2, iptr
bcopy:
	save_regs_on_stack

	bl	copybytes

	restore_regs_from_stack
acopy:
	add	counter, counter, 1
	b	factorial_start
factorial_last:
	mov	counter, x0
	mov	tmp, x1
	mov	x0, iptr
	mov	x1, ilen

	save_regs_on_stack

        bl      clearbytes

	restore_regs_from_stack

	mov	x1, tmp
	mov	x0, counter
factorial_end:

        ldp fp, lr, [sp], #0x10
	ret
