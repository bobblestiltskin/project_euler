/* printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null) */

.global printbytes
.type	printbytes, %function

printbytes:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

#	mov	x4, x2
#	mov	x5, x1
printbytes_loopstart:
	ldrb	w3, [x0], 1
	add	x3, x3, 48
	strb	w3, [x2], 1
	subs	x1, x1, 1
	bne	printbytes_loopstart

	mov	x3, 0
	strb	w3, [x2], 1

#	mov	x0, x4
#	mov	x1, x5

        ldp fp, lr, [sp], #0x10

	ret
