# copybytes takes input pointer in r0, input length in r1 and writes to r2
ptr	.req r4
len	.req r5
.global copybytes
.type	copybytes, %function
copybytes:
#	stmfd	sp!, {ptr, len, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	len, r1
	mov	ptr, r2
copybytesloopstart:
	ldrb	r3, [r0], 1
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	copybytesloopstart

	mov	r0, ptr
	mov	r1, len
#	ldmfd	sp!, {ptr, len, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
