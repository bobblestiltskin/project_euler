.equ	limit,20

.align 4

/* algorithm
initialise try_products to 1
foreach number > 1 and <= limit
test if it is prime
if try_products is set, then multiply the number by itself 
while it does not exceed limit, then multiply the total by
this product. if the number squared exceeds the limit, then 
set try_product to 0.
if try_products is 0 and the number is prime, then multiply
the total by number. */

try_product	.req x4
number		.req x5
last		.req x6
total		.req x7
tmp		.req x8

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	total, 1
	mov	try_product, 1
	mov	number, 2
loop:
	mov	x0, number
	bl	isprime20
	cmp	x0, 1
	bne	nexti
	
	cmp	try_product, 1
	bne	no_product
	mul	tmp, number, number
	cmp	tmp, limit
	ble	prod_start
	mov	try_product, 0
	b	no_product
prod_start:
	mov	tmp, number
	mov	last, tmp
prod_loop:
	cmp	tmp, limit
	bgt	last_mul
	mov	last, tmp
	mul	tmp, tmp, number
	b	prod_loop
last_mul:
	mul	total, total, last
no_product:
	cmp	try_product, 0
	bne	nexti
	mul	total, total, number
nexti:
	cmp	number, limit
	beq	printme
	add	number, number, 1
	b	loop
	
printme:
	mov	x1, total
	ldr	x0, =resstring	/* store address of start of string to r0 */ 
	bl	printf

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

# this subroutine returns 1 if the passed number (<= 20) is prime; 0 if not
#
# inputs
#   r0 - integer to test
#
# outputs
#   r0 - prime boolean

.global isprime20
.type isprime20, %function
.text
.align	2

isprime20:
        stp fp, lr, [sp]
        mov fp, sp

	mov	x1, x0
	ands	x2, x1, 1
	bne	odd
	mov	x0, 0
	cmp	x1, 2 	/* 2 is the only prime even r1 */
	bne	last
	mov	x0, 1
	b	last
odd:
	mov	x0, 1
	cmp	x1, 9
	bne	test15
	mov	x0, 0
	b	last
test15:
	cmp	x1, 15
	bne	last
	mov	x0, 0
last:
        ldp fp, lr, [sp]

        ret
