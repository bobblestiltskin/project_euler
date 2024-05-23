# this computes projecteuler.net problem 004

.equ max3,999
.equ min3,100
.equ maxdigits,6

i	.req x14
j	.req x15
product	.req x16
maxp	.req x17
mini	.req x18
minj	.req x19
maxj	.req x20

.section .rodata
	.align	2
sumstring:
	.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp

        ldr	i, =max3
	ldr	mini, =min3
	ldr	maxj, =max3
	ldr	minj, =min3
        mov	maxp, xzr
iloop:
	mov	j, maxj
jloop:
	mul	product, i, j

	mov	x0, product

	bl	is_palindromic

	cmp	x0, #1
	bne	next
	cmp	product, maxp
	b.le	next
	mov	maxp, product
	mov	x0, product
	bl	divide_by_10_remainder /* divides x0 by 10 */
	bl	divide_by_10_remainder /* so 3 consecutive calls */
	bl	divide_by_10_remainder /* will divide by 1000 */
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
	ldr	x0, =sumstring	/* store address of start of string to x0 */
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret
