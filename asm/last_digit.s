.syntax unified

# this subroutine divides the passed number by 10
#
# inputs
#   r0 - integer to divide
#
# outputs
#   r0 - the remainder 
#   r1 - the dividend 

.equ const,-0x33333333
.text
.align	2
.global	get_last_digit
.type	get_last_digit, %function
get_last_digit:
	stmfd	sp!, {lr}
	ldr	r1, =const
	umull	r2, r3, r1, r0
	mov	r2, r3, lsr #3	@ r2 = r3 / 8 == r0 / 10
	mov	r3, r2		@ r3 = r2
	mov	r3, r3, asl #2	@ r3 = 4 * r3
	add	r3, r3, r2	@ r3 = r3 + r2
	mov	r3, r3, asl #1	@ r3 = 2 * r3
	rsb	r3, r3, r0	@ r3 = r0 - r3
	mov	r1, r3
	mov	r0, r2
	ldmfd	sp!, {pc}
