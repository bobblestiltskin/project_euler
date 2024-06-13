# this subroutine returns 1 if the passed number is prime; 0 if not

# inputs
#   r0 - integer to test

# outputs
#   r0 - prime boolean

.include "regs.s"

number		.req x19
divisor		.req x20
tmp		.req x21

.global isprime
.type isprime, %function
.text
.align	2

isprime:
	callee_save_regs_on_stack
	stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	mov	number, x0
	ands	tmp, number, 1
	b.ne	odd
	mov	x0, 0
	cmp	number, 2 	/* 2 is the only prime even number */
	b.ne	last
	mov	x0, 1
	b	last
odd:
	mov	divisor, 3
	cmp 	number, 8
	b.gt	big
	mov	x0, 1
	cmp	number, 1	/* 1 is the only odd number < 8 not prime */
	b.ne	last
	mov	x0, 0
	b	last
big:
	mov	x0, number
	mov	x1, divisor
	bl	divide
	cmp	x1, 0
	b.eq	factor
	add	divisor, divisor, 2
	mul	tmp, divisor, divisor
	subs	tmp, tmp, number
	b.le	big
	mov	x0, 1
	b	last
factor:
	mov	x0, 0
last:
        ldp	fp, lr, [sp], #0x10
	callee_restore_regs_from_stack
	ret
