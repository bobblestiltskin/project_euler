.syntax unified

.equ datum_size, 1
.equ digits, 6

# this subroutine returns 1 if the passed 6-digit number is palindromic; 0 if not
# the number is a product of 2 3-digit numbers so we assume the product has 6 digits
#
# inputs
#   r0 - integer to test
#
# outputs
#   r0 - palindromic boolean
#
# local
#
	left		.req r4
	right		.req r5
	counter		.req r6
	buffer_address	.req r7
	running		.req r8
	tmp		.req r9
#  
.section .bss
   .lcomm buffer, 6
#
.global is_palindromic
.type is_palindromic, %function
.global get_digits
.type get_digits, %function
.text
.align	2
#
is_palindromic:
	stmfd	sp!, {r4-r9, lr}
	bl	get_digits
	mov	counter, 3
	ldr	buffer_address, =buffer
ip_last:
	sub	left, buffer_address, counter
	ldrb	tmp, [left, 3]
	add	right, buffer_address, counter
	ldrb	running, [right, 2]
	teq	tmp, running
	bne	no
	subs	counter, counter, 1
	bgt	ip_last
	mov	r0, 1
	b 	last
no:
	mov	r0, 0
last:
	ldmfd	sp!, {r4-r9, pc}
#
get_digits:
	stmfd	sp!, {r7-r8, lr}
	ldr	running, =digits
	ldr	buffer_address, =buffer
gd_loop:
	subs	running, running, 1
	bl	divide_by_10_remainder
	strb	r1, [buffer_address], #datum_size
	bgt	gd_loop

gd_last:
	ldmfd	sp!, {r7-r8, pc}
