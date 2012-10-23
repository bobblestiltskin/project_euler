.syntax unified

.equ maxfib,4000000

previous	.req r4
current		.req r5
next		.req r6
sum		.req r7
max		.req r8
tmp		.req r9

.section .rodata
	.align	2
fibstring:
	.asciz "fib is %d\n"
sumstring:
	.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4-r9, lr}
	ldr	max,   =maxfib
	mov	previous, 1 
	mov	current, 1
	mov	sum, 0

#	mov	r1, current
#	ldr	r0, =fibstring	@ store address of start of string to r0
#	bl	printf
loop:
	cmp	current, max
	bgt	last

#	mov	r1, current		
#	ldr	r0, =fibstring	@ store address of start of string to r0
#	bl	printf

	add	next, current, previous

	movs	tmp, current, lsr 1 @ set carry flag from lsr - for the odd-valued terms
	addcc	sum, sum, current   @ these are even-valued fibonacci (when cc is true)

	mov	previous, current
	mov	current, next
	b	loop

last:
	mov	r1, sum		
	ldr	r0, =sumstring	@ store address of start of string to r0
	bl	printf

	ldmfd	sp!, {r4-r9, pc}
	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
