# this computes projecteuler.net problem 002

.equ maxfib,4000000

previous	.req x4
current		.req x5
next		.req x6
sum		.req x7
max		.req x8
tmp		.req x9

.section .rodata
	.align	2
sumstring:
	.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	ldr	max,   =maxfib
	mov	previous, 1 
	mov	current, 1
	mov	sum, 0

loop:
	cmp	current, max
	b.gt	last

	add	next, current, previous
        tbnz    current, #0, odd /* check 0th bit of current - set to 1 for odd numbers - so we jump to odd */
	add	sum, sum, current   /* these are even-valued fibonacci */
odd:
	mov	previous, current
	mov	current, next
	b	loop

last:
	mov	x1, sum
	ldr	x0, =sumstring	/* store address of start of string to x0 */
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
