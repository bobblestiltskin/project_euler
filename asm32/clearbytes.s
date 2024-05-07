.syntax unified

# clearbytes takes pointer in r0, input length in r1 
# and sets all vector elements to 0

.global clearbytes
.type	clearbytes, %function
clearbytes:
	stmfd	sp!, {lr}
	mov	r3, 0
clearbytesloopstart:
	strb	r3, [r0], 1
	subs	r1, r1, 1
	bne	clearbytesloopstart

	ldmfd	sp!, {pc}
