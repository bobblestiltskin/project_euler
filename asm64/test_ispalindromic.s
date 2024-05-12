.equ palindromic1,123321
.equ nonpalindromic,123456
.equ palindromic2,815518

number		.req x4
palindromicflag	.req x5

.macro num_is_palindromic a
	ldr	number, =\a
	mov	x0, number
	bl	is_palindromic
	mov	palindromicflag, x0

	mov	x2, palindromicflag
	mov	x1, number
	ldr	x0, =palindromicstring
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
	ldr	number, =palindromic1
	mov	x0, number
	bl	is_palindromic
	mov	palindromicflag, x0

	mov	x2, palindromicflag
	mov	x1, number
	ldr	x0, =palindromicstring
	bl	printf

	num_is_palindromic palindromic1
	num_is_palindromic nonpalindromic
	num_is_palindromic palindromic2

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
