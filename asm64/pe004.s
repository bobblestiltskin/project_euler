.equ max3,999
.equ min3,100
.equ maxdigits,6

i	.req x4
j	.req x5
product	.req x6
maxp	.req x7
mini	.req x8
minj	.req x9
maxj	.req x10

.section .rodata
	.align	2
sumstring:
	.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
#	stmfd	sp!, {r4-r10, lr}
        stp fp, lr, [sp, #-0x50]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        stp x10, x11, [sp, #0x40]
        mov fp, sp

        ldr	i, =max3
	ldr	mini, =min3
	ldr	maxj, =max3
	ldr	minj, =min3
iloop:
	mov	j, maxj
jloop:
	mul	product, i, j

	mov	x0, product
	bl	is_palindromic
	cmp	x0, #1
	bne	next
	cmp	product, maxp
	ble	next
	mov	maxp, product
	mov	x0, product
	bl	divide_by_10 /* divides r0 by 10 */
	bl	divide_by_10 /* so 3 consecutive calls */
	bl	divide_by_10 /* will divide by 1000 */
	mov	minj, x0
	mov	minj, x0

next:
	subs	j, j, 1
	cmp	j, minj
	bgt	jloop

	subs	i, i, 1
	mov	maxj, i
	cmp	i, mini
	bgt	iloop

last:
	mov	x1, maxp
	ldr	x0, =sumstring	/* store address of start of string to r0 */
	bl	printf

	mov	x0, 0
#	ldmfd	sp!, {r4-r10, pc}
        ldp x10, x11, [sp, #0x40]
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x50

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
