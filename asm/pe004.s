.syntax unified

.equ max3,999
.equ min3,100
.equ maxdigits,6

i	.req r4
j	.req r5
product	.req r6
maxp	.req r7
mini	.req r8
minj	.req r9
maxj	.req r10

.section .rodata
	.align	2
sumstring:
	.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4-r10, lr}
        ldr	i, =max3
	ldr	mini, =min3
	ldr	maxj, =max3
	ldr	minj, =min3
iloop:
	mov	j, maxj
jloop:
	mul	product, i, j

	mov	r0, product
	bl	is_palindromic
	cmp	r0, #1
	bne	next
	cmp	product, maxp
	ble	next
	mov	maxp, product
	mov	r0, product
	bl	divide_by_10 @ divides r0 by 10 
	bl	divide_by_10 @ so 3 consecutive calls
	bl	divide_by_10 @ will divide by 1000
	mov	minj, r0
	mov	minj, r0

next:
	subs	j, j, 1
	cmp	j, minj
	bgt	jloop

	subs	i, i, 1
	mov	maxj, i
	cmp	i, mini
	bgt	iloop

last:
	mov	r1, maxp		
	ldr	r0, =sumstring	@ store address of start of string to r0
	bl	printf

	mov	r0, 0
	ldmfd	sp!, {r4-r10, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
