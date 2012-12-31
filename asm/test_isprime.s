.syntax unified

number		.req r4
primeflag	.req r5
tmp		.req r6
divisor		.req r7
running		.req r8

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
resstring:
	.asciz "%d\n"
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
	num_is_prime 6
	num_is_prime 7
	num_is_prime 8
	num_is_prime 9
	num_is_prime 10
	num_is_prime 11
	num_is_prime 12
	num_is_prime 13
	num_is_prime 14
	num_is_prime 15
	num_is_prime 16
	num_is_prime 17
	num_is_prime 18
	num_is_prime 19
	num_is_prime 20
	num_is_prime 21
	num_is_prime 23
	num_is_prime 25
	num_is_prime 27
	num_is_prime 29
	num_is_prime 31
	num_is_prime 33
	num_is_prime 35
	num_is_prime 37
	num_is_prime 39
	num_is_prime 41
	num_is_prime 43
	num_is_prime 45
	num_is_prime 47
	num_is_prime 49
	num_is_prime 51
	num_is_prime 53
	num_is_prime 55
	num_is_prime 57
	num_is_prime 59
	num_is_prime 61
	num_is_prime 63
	num_is_prime 65
	num_is_prime 67
	num_is_prime 69
	num_is_prime 71
	num_is_prime 73
	num_is_prime 75
	num_is_prime 77
	num_is_prime 79
	num_is_prime 81
	num_is_prime 83
	num_is_prime 85
	num_is_prime 87
	num_is_prime 89
	num_is_prime 91
	num_is_prime 93
	num_is_prime 95
	num_is_prime 97
	num_is_prime 99
	num_is_prime 101
	num_is_prime 103
	num_is_prime 105
	num_is_prime 107
	num_is_prime 109
	num_is_prime 111
	num_is_prime 113
	num_is_prime 115
	num_is_prime 117
	num_is_prime 119
	num_is_prime 121
	num_is_prime 123
	num_is_prime 125
	num_is_prime 127
	num_is_prime 129
	num_is_prime 131
	num_is_prime 133
	num_is_prime 135
	num_is_prime 137
	num_is_prime 139

	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
