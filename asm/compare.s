# compare implements the same functionality as the forth word of the
# same name.

# Compare the string specified by c-addr1 (r0) and u1 (r1) to the string 
# specified by c-addr2 (r2) and u2 (r3) . The strings are compared, beginning
# at the given addresses, character by character up to the length of the 
# shorter string, or until a difference is found. If both strings are the same
# up to the length of the shorter string, then the longer string is greater 
# than the shorter string. n is -1 if the string specified by c-addr1 and u1 
# is less than the string specified by c-addr2 and u2. n is zero if the 
# strings are equal. n is 1 if the string specified by c-addr1 and u1 is 
# greater than the string specified by c-addr2 and u2.

.syntax unified

.text

minlen	.req r4
val1	.req r5
val2	.req r6
count	.req r7

	.global	compare
	.type	compare, %function
compare:
        stmfd   sp!, {r4-r8, lr}
	mov	minlen, r1
	cmp	minlen, r3
	movgt	minlen, r3
	mov	count, 0

loopstart:
	ldrb	val1, [r0], count
	ldrb	val2, [r2], count
	cmp	val1, val2
	movlt	r0, -1
	movgt	r0, 1
	bne	loopend
	add	count, count,1
	cmp	count, minlen
	bne	loopstart
	cmp	r1, r3
	moveq	r0, 0
	movlt	r0, -1
	movgt	r0, 1
loopend:
        ldmfd   sp!, {r4-r8, pc}

