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

number		.req x4
vptr		.req x5
tmp		.req x6
squared		.req x7
vsize		.req x8

.global prime_vector
.type prime_vector, %function
.text
.align	2

prime_vector:
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

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
	bgt	nexti
	mov	x0, 1
last:
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

        ret
