# clearbytes takes pointer in r0, input length in r1 
# and sets all vector elements to 0

.global clearbytes
.type	clearbytes, %function
clearbytes:
#	stmfd	sp!, {lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	r3, 0
clearbytesloopstart:
	strb	r3, [r0], 1
	subs	r1, r1, 1
	bne	clearbytesloopstart

#	ldmfd	sp!, {pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
