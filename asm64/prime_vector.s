.equ	word, 4

# this subroutine returns 1 if the passed number is prime; 0 if not
#
# inputs
#   r0 - integer to test
#   r1 - pointer to vector of prime integers smaller than r0
#   r2 - length of vector passed in r1
#
# outputs
#   r0 - prime boolean

number		.req r4
vptr		.req r5
tmp		.req r6
squared		.req r7
vsize		.req r8

.global prime_vector
.type prime_vector, %function
.text
.align	2

prime_vector:
#	stmfd	sp!, {r4-r8, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	number, r0
	mov	vptr, r1
	mov	vsize, r2
nexti:
	ldr	tmp, [vptr], word
	mul	squared, tmp, tmp
	cmp	squared, number
	movgt	r0, 1
	bgt	last
	mov	r0, number
	mov	r1, tmp
	bl	divide
	teq	r1, 0
	moveq	r0, 0
	beq	last
	subs	vsize, vsize, 1
	bgt	nexti
	mov	r0, 1
last:
#	ldmfd	sp!, {r4-r8, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40
