.syntax unified

.equ	limit,10000

.align 4

number		.req r4
count		.req r5

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4-r5, lr}

	ldr	count, =limit
	mov	number, 3	@ 2 is the first prime
loop:
	mov	r0, number
	bl	isprime
	cmp	r0, 1
	bne	nexti
	
	subs	count, count, 1
	beq	printme
nexti:
	add	number, number, 2
	b	loop
	
printme:
	mov	r1, number
	ldr	r0, =resstring	@ store address of start of string to r0
	bl	printf
	ldmfd	sp!, {r4-r5, pc}

	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
