.syntax unified

# copybytes takes input pointer in r0, input length in r1 and writes to r2
ptr	.req r4
len	.req r5
.global copybytes
.type	copybytes, %function
copybytes:
	stmfd	sp!, {ptr, len, lr}
	mov	len, r1
	mov	ptr, r2
copybytesloopstart:
	ldrb	r3, [r0], 1
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	copybytesloopstart

	mov	r0, ptr
	mov	r1, len
	ldmfd	sp!, {ptr, len, pc}
