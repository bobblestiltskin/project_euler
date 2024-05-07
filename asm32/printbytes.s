.syntax unified

# printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null)
	.global printbytes
	.type	printbytes, %function
printbytes:
	stmfd	sp!, {lr}
printbytes_loopstart:
	ldrb	r3, [r0], 1
	add	r3, r3, 48
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	printbytes_loopstart

	mov	r3, 0
	strb	r3, [r2], 1
	ldmfd	sp!, {pc}
