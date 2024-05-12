number		.req x4
primeflag	.req x5

.macro num_is_prime a
	mov	number, \a
	mov	x0, number
	bl	isprime
	mov	primeflag, x0

	mov	x2, primeflag
	mov	x1, number
	ldr	x0, =primestring
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
	ldr	number, =716151937
	mov	x0, number
	bl	isprime
	mov	primeflag, x0

	mov	x2, primeflag
	mov	x1, number
	ldr	x0, =primestring
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

