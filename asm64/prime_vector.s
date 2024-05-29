.equ	word, 8

# this subroutine returns 1 if the passed number is prime; 0 if not
#
# inputs
#   x0 - integer to test
#   x1 - pointer to vector of prime integers smaller than r0
#   x2 - length of vector passed in r1
#
# outputs
#   x0 - prime boolean

.include "regs.s"

number		.req x19
vptr		.req x20
tmp		.req x21
squared		.req x22
vsize		.req x23

.global prime_vector
.type prime_vector, %function
.text
.align	2

prime_vector:
	callee_save_regs_on_stack
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	mov	number, x0
	mov	vptr, x1
	mov	vsize, x2
nexti:
	ldr	tmp, [vptr], word
	mul	squared, tmp, tmp
	cmp	squared, number
        b.le	squared_smaller
	mov	x0, 1
	b	last
squared_smaller:
	mov	x0, number
	mov	x1, tmp
	bl	divide
	cmp	x1, 0
        b.ne    not_prime
	mov	x0, xzr
	b	last
not_prime:
	subs	vsize, vsize, 1
	b.gt	nexti
	mov	x0, 1
last:

        ldp	fp, lr, [sp], #0x10
	callee_restore_regs_from_stack

        ret
