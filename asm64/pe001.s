.equ max3start,999
.equ max5start,995

number	.req x4
matched	.req x5
sum	.req x6
max3	.req x7
max5	.req x8

.section .rodata
	.align	2
string:
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

	ldr	max5,   =max5start
	ldr	max3,   =max3start
	ldr	number, =max3start    /* start at 1000 - 1 ; numbers < 1000 */
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
	cmp	matched, 1 		/* have we already added it? */
        b.eq    last
	add	sum, sum, number 	/* if not add it to the total */

last:
# decrement number and reset matched and loop
	mov	matched, 0
	subs	number, number, 1
	bne	loop

	mov	x1, sum		
	ldr	x0, =string	/* store address of start of string to x0 */
	bl	printf

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
