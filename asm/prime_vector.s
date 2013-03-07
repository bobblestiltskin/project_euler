.syntax unified
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
vcount		.req r9

.global prime_vector
.type prime_vector, %function
.text
.align	2

prime_vector:
	stmfd	sp!, {r4-r9, lr}
	mov	number, r0
	mov	vptr, r1
	mov	vsize, r2
	mov	vcount, 0
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
	add	vcount, vcount, 1
	cmp	vcount, vsize
	blt	nexti
	movge	r0, 0
last:
	ldmfd	sp!, {r4-r9, pc}
