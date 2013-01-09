.syntax unified

.equ	limit,2000000

number		.req r1
limit		.req r2
sum_add		.req r3
sum_hi		.req r4
sum_lo		.req r5

.align 2

.section .rodata
	.align	2
llustring:
	.asciz "%llu\n"
.text
.align	8
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4, r5, fp, lr}

	ldr	limit, =limit
        mov	sum_hi, 0
	mov	sum_lo, 2
	mov	number, 3	@ 2 is the first prime
loop:
	cmp	number, limit
	bge	printme

	mov	r0, number
	bl	isprime
	cmp	r0, 1
	bne	nexti
	
	adds	sum_lo, sum_lo, number
	adc	sum_hi, sum_hi, 0

nexti:
	add	number, number, 2
	b	loop
	
printme:
	mov	r2, sum_lo
	mov	r3, sum_hi
	ldr	r0, =llustring	@ store address of start of string to r0
	bl	printf
	ldmfd	sp!, {r4, r5, fp, pc}

	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
