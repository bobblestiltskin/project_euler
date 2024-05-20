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

.text

minlen	.req x4
val1	.req w5
val2	.req w6
count	.req x7

	.global	compare
	.type	compare, %function
compare:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	minlen, x1
	cmp	minlen, x3
	b.le	no_set_min_len
	mov	minlen, x3
no_set_min_len:
	mov	count, 0
loopstart:
	ldrb	val1, [x0, count]
	ldrb	val2, [x2, count]
	cmp	val1, val2
	b.eq    eq_val_1
	b.gt	gt_val_1
	mov	x0, -1
	b	eq_val_1
gt_val_1:
	mov	x0, 1
eq_val_1:
	bne	loopend
	add	count, count,1
	cmp	count, minlen
	bne	loopstart
	cmp	x1, x3
	b.gt	gt_x
	b.lt	lt_x
	mov	x0, 0
	b	loopend
lt_x:
	mov	x0, -1
	b	loopend
gt_x:
	mov	x0, 1
loopend:
        ldp fp, lr, [sp], #0x10
	ret

