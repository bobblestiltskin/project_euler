.equ num0,7830
.equ num3,783
.equ num7,7847
.equ num8,78
.equ num9,7

.syntax unified

.macro dividend num
	ldr	r1, =\num
	ldr	r0, =numstring
	bl	printf

	ldr	r0, =\num
	bl	divide_by_10
	mov	r1, r0
	ldr	r0, =dividendstring
	bl	printf
.endm

.macro remainder num
	ldr	r1, =\num
	ldr	r0, =numstring
	bl	printf

	ldr	r0, =\num
	bl	divide_by_10_remainder
	mov	r2, r0
	ldr	r0, =remainderstring
	bl	printf
.endm

.section .rodata
	.align	2
numstring:
	.asciz "num is %d\n"
dividendstring:
	.asciz "dividend is %d\n"
remainderstring:
	.asciz "remainder is %d and dividend is %d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	remainder  num0
	remainder  num7
	remainder  num3
	remainder  num8
	remainder  num9

	dividend  num0
	dividend  num7
	dividend  num3
	dividend  num8
	dividend  num9

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
