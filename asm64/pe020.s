# this computes projecteuler.net problem 020

.equ	LENGTH,200
.equ	scalar100,100

.section .rodata
sumstring:
.asciz "%d\n"

.section bss
.align	2
.lcomm input,LENGTH
.lcomm output,LENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp
	mov	w3, 1
	ldr	x0, =input
	strb	w3, [x0]

	ldr	x0, =scalar100
	ldr	x1, =input
	ldr	x2, =output
	bl	factorial

	mov	x2, 0
lstart:
	ldrb	w3, [x0], 1
	sxtw	x3, w3
	add	x2, x2, x3
	subs	x1, x1, 1
	bne	lstart
	
	mov	x1, x2
	ldr	x0, =sumstring
	bl	printf
	
	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret
