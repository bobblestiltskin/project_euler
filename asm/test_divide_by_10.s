.equ num0,7830
.equ num3,783
.equ num7,7847
.equ num8,78

.syntax unified

.macro number num
	ldr	r1, =\num
	ldr	r0, =numstring
	bl	printf

	ldr	r0, =\num
	bl	divide_by_10_remainder
	mov	r2, r0
	ldr	r0, =laststring
	bl	printf
.endm

.section .rodata
	.align	2
numstring:
	.asciz "num is %d\n"
laststring:
	.asciz "remainder is %d and dividend is %d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	number  num0
	number  num7
	number  num3
	number  num8

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
