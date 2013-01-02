.syntax unified

number		.req r4
primeflag	.req r5

.macro num_is_prime a
	mov	number, \a
	mov	r0, number
	bl	isprime
	mov	primeflag, r0

	mov	r2, primeflag
	mov	r1, number
	ldr	r0, =primestring
	bl	printf
.endm

.section .rodata
	.align	2
primestring:
	.asciz "num %d primality is %d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	num_is_prime 1
	num_is_prime 2
	num_is_prime 3
	num_is_prime 4
	num_is_prime 5
	num_is_prime 7
	num_is_prime 9
	num_is_prime 11
	num_is_prime 13
	num_is_prime 15
	num_is_prime 17
	num_is_prime 19
	num_is_prime 20
	num_is_prime 21
	num_is_prime 23
	num_is_prime 25
	num_is_prime 27
	num_is_prime 29

	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
