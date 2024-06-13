.equ	word,8
.equ	logword,3
.equ	numprimes8,1191464

number		.req x12
primeflag	.req x13
numprimes	.req x14
primes_ptr	.req x15
tmp		.req x16

.include "regs.s"

.macro num_is_prime a
_start\@:
	mov	number, \a
	mov	x0, number
	ldr	x1, =primes_vector
	mov	x2, numprimes

	caller_save_regs_on_stack
	bl	prime_vector
	caller_restore_regs_from_stack

	mov	primeflag, x0

	cmp	x0, 1
	b.ne	notprime\@
	str	number, [primes_ptr, word]!
	add	numprimes, numprimes, 1
notprime\@:
	mov	x2, primeflag
	mov	x1, number
	ldr	x0, =primestring

	caller_save_regs_on_stack
	bl	printf
	caller_restore_regs_from_stack
.endm

.section .bss
.lcomm primes_vector, numprimes8
#.lcomm primes_vector, 80

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
	str	number, [primes_ptr]

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
	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
