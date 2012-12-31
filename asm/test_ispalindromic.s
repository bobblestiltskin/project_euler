.equ nonpalindromic,123456
.equ palindromic1,123321
.equ palindromic2,815518
.syntax unified

number		.req r4
palindromicflag	.req r5

.macro num_is_palindromic a
	ldr	number, =\a
	mov	r0, number
	bl	is_palindromic
	mov	palindromicflag, r0

	mov	r2, palindromicflag
	mov	r1, number
	ldr	r0, =palindromicstring
	bl	printf
.endm

.section .rodata
	.align	2
palindromicstring:
	.asciz "num %d palindromicity is %d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	num_is_palindromic nonpalindromic
	num_is_palindromic palindromic1
	num_is_palindromic palindromic2

	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
