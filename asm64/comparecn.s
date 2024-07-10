# comparecn implements the same functionality as the forth word of the
# same name.

# Compare the string specified by c-addr1 (x0 + 1) and u1 ([x0[0]]) to the string
# specified by c-addr2 (x1 + 1) and u2 ([x1[0]]).

# The strings are compared, beginning at the given addresses, character by
# character up to the length of the shorter string, or until a difference is found.

# If both strings are the same up to the length of the shorter string, then
# the longer string is greater than the shorter string.

# return value, x0, is 0 if the strings are equal.
# return value, x0, is -1 if the string specified by c-addr1 and u1 is less than the string specified by c-addr2 and u2.
# return value, x0, is 1 if the string specified by c-addr1 and u1 is greater than the string specified by c-addr2 and u2.

.text

.include "regs.s"

minlen	.req x19
val0	.req w20
val1	.req w21
count	.req x22
x0len   .req x23
x1len   .req x24

	.global	compare
	.type	compare, %function
compare:
	callee_save_regs_on_stack
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	ldrb	w2, [x0], 1
	ldrb	w3, [x1], 1

	mov	minlen, x2
	cmp	minlen, x3
	b.le	no_set_min_len
	mov	minlen, x3
no_set_min_len:
	mov	count, 0
# our pointers now have integer count before data bytes, so we skip the first
#	add	x0, x0, 1
#	add	x2, x2, 1
loopstart:
#	ldrb	val0, [x0]
#	ldrb	val1, [x1]
	ldrb	val0, [x0, count]
	ldrb	val1, [x1, count]
#	add	x0, x0, 1
#	add	x1, x1, 1
	cmp	val0, val1
	b.eq    eq_val_1
	b.gt	gt_val_1
	mov	x0, -1
	b	eq_val_1
gt_val_1:
	mov	x0, 1
eq_val_1:
	b.ne	loopend
	add	count, count,1
	cmp	count, minlen
	b.ne	loopstart
	cmp	w2, w3
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
        ldp	fp, lr, [sp], #0x10
	callee_restore_regs_from_stack
	ret
