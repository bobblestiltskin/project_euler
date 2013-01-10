.syntax unified

.equ	limit,20

.align 4

@ algorithm
@ initialise try_products to 1
@ foreach number > 1 and <= limit
@ test if it is prime
@ if try_products is set, then multiply the number by itself 
@ while it does not exceed limit, then multiply the total by
@ this product. if the number squared exceeds the limit, then 
@ set try_product to 0.
@ if try_products is 0 and the number is prime, then multiply
@ the total by number.

try_product	.req r4
number		.req r5
last		.req r6
total		.req r7
tmp		.req r8

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4-r8, lr}

	mov	total, 1
	mov	try_product, 1
	mov	number, 2
loop:
	mov	r0, number
	bl	isprime
	cmp	r0, 1
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
	mov	r1, total
	ldr	r0, =resstring	@ store address of start of string to r0
	bl	printf

	mov	r0, 0
	ldmfd	sp!, {r4-r8, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
