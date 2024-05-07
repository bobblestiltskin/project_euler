.syntax unified

# this subroutine divides the passed number by 10 and
# returns the dividend and remainder
# 
# The const -0x33333333 is 0xccccccd (2s complement)
# 0xcccccccc is 12/15th (0.8) of 0xffffffff and we use this as
# a multiplier, then shift right by 3 bits (divide by 8) to 
# effect a multiplication by 0.1
#
# We multiply this number by 10 (multiply by 4, add 1 then multiply by 2)
# and subtract from the original number to give the remainder on division
# by 10.
#
# inputs
#   r0 - integer to divide
#
# outputs
#   r0 - the dividend 
#   r1 - the remainder 

.equ const,-0x33333333
#.equ const,0xcccccccd
.text
.align	2
.global	divide_by_10_remainder
.type	divide_by_10_remainder, %function
divide_by_10_remainder:
	stmfd	sp!, {lr}
	cmp	r0, 10
	blt	rsmall
	ldr	r1, =const
	umull	r2, r3, r1, r0
	mov	r2, r3, lsr #3	@ r2 = r3 / 8 == r0 / 10
	mov	r3, r2		@ r3 = r2
	mov	r3, r3, asl #2	@ r3 = 4 * r3
	add	r3, r3, r2	@ r3 = r3 + r2
	mov	r3, r3, asl #1	@ r3 = 2 * r3 
	rsb	r3, r3, r0	@ r3 = r0 - r3 = r0 - 10*int(r0/10)
	mov	r1, r3		@ the remainder
	mov	r0, r2		@ the dividend
	b	rlast
rsmall:
	mov	r1, r0
	mov	r0, 0
rlast:
	ldmfd	sp!, {pc}


# this subroutine divides the passed number by 10
# returns the dividend
# 
# The const -0x33333333 is 0xccccccd (2s complement)
# 0xcccccccc is 12/15th (0.8) of 0xffffffff and we use this as
# a multiplier, then shift right by 3 bits (divide by 8) to 
# effect a multiplication by 0.1
#
# We multiply this number by 10 (multiply by 4, add 1 then multiply by 2)
#
# inputs
#   r0 - integer to divide
#
# outputs
#   r0 - the dividend 

.align	2
.global	divide_by_10
.type	divide_by_10, %function
divide_by_10:
	stmfd	sp!, {lr}
	cmp	r0, 10
	blt	small
	ldr	r1, =const
	umull	r2, r3, r1, r0
	mov	r2, r3, lsr #3	@ r2 = r3 / 8 == r0 / 10
	mov	r0, r2		@ the dividend
	b	last
small:
	mov	r0, 0
last:
	ldmfd	sp!, {pc}
