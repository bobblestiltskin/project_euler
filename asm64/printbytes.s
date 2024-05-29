/* printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null) */

.global printbytes
.type	printbytes, %function

printbytes:
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

printbytes_loopstart:
	ldrb	w3, [x0], 1
	add	x3, x3, 48
	strb	w3, [x2], 1
	subs	x1, x1, 1
	b.ne	printbytes_loopstart

	mov	x3, 0
	strb	w3, [x2], 1

        ldp	fp, lr, [sp], #0x10
	ret
