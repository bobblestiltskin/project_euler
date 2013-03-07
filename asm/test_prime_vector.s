.syntax unified
.equ	word,4

number		.req r4
primeflag	.req r5
numprimes	.req r6
primes_ptr	.req r7

.macro num_is_prime a
_start\@:
	mov	number, \a
	mov	r0, number
	mov	r1, primes_ptr
	mov	r2, numprimes
	bl	prime_vector
	mov	primeflag, r0
	teq	r0, 1
	streq	number, [primes_ptr, numprimes, lsl 2]
	addeq	numprimes, numprimes, 1

	mov	r2, primeflag
	mov	r1, number
	ldr	r0, =primestring
	bl	printf
.endm

.section .bss
.lcomm primes_vector, 80

.section .rodata
	.align	2
primestring:
	.asciz "num %d primality is %d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	ldr	primes_ptr, =primes_vector
	mov	numprimes, 1
	mov	number, 2
	strb	number, [primes_ptr]

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

last:
	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
