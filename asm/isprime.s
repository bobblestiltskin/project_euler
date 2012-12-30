.syntax unified

# this subroutine returns 1 if the passed number is prime; 0 if not
#
# inputs
#   r0 - integer to test
#
# outputs
#   r0 - prime boolean
#
# local
#
	number		.req r4
	primeflag	.req r5
	tmp		.req r6
	divisor		.req r7
	running		.req r8
#  
.global isprime
.type isprime, %function
.text
.align	2
#
isprime:
	stmfd	sp!, {r4-r9, lr}
	mov	number, r0
	ands	tmp, number, 1
	bne	odd
	
	mov	r0, 0
	cmp	number, 2 	@ 2 is the only prime even number
	bne	last
	mov	r0, 1
	b	last

odd:
	cmp 	number, 8
	bgt	big
	mov	r0, 1
	cmp	number, 1	@ 1 is the only odd number < 8 not prime
	bne	last
	mov	r0, 0
	b	last

big:
	mov	divisor, 3
	mov	running, number
bigloop:
	subs	running, running, divisor
	bgt	bigloop
	beq	factor
	add	divisor, divisor, 2
	mov	running, number
	mul	tmp, divisor, divisor
	subs	tmp, tmp, number
	ble	bigloop

divide_end:
	mov	r0, 1
	b	last

factor:
	mov	r0, 0

last:
	ldmfd	sp!, {r4-r9, pc}
#	mov	r7, 1		@ set r7 to 1 - the syscall for exit
#	swi	0		@ then invoke the syscall from linux
