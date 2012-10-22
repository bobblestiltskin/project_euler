# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

.syntax unified

.equ max3start,999
.equ max5start,995

number	.req r4
matched	.req r5
sum	.req r6
max3	.req r7
max5	.req r8

.section .rodata
	.align	2
string:
	.asciz "Sum of numbers %d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {number, matched, sum, max3, max5, lr}
	ldr	max5,   =max5start
	ldr	max3,   =max3start
	ldr	number, =max3start    @ start at 1000 - 1 ; numbers < 1000
	mov	matched, 0
	mov	sum, 0
loop:
	cmp	number, max3
	bne	test5

# matched a multiple of 3 - decrement max3, add to sum and set matched to 1
	mov	matched, 1
	add	sum, sum, number
	subs	max3, max3, 3

test5:
	cmp	number, max5
	bne	last

# matched a multiple of 5 - decrement max5, add to sum and set matched to 1
	subs	max5, max5, 5
	cmp	matched, 1 		@ have we already added it?
	beq	last 			@ if so jump 
	add	sum, sum, number 	@ else add it to the total

last:
# decrement number and reset matched and loop
	subs	number, number, 1
	mov	matched, 0
	bne	loop

	mov	r1, sum		
	ldr	r0, =string	@ store address of start of string to r0
	bl	printf
	mov	r0, 0

	ldmfd	sp!, {number, matched, sum, max3, max5, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
