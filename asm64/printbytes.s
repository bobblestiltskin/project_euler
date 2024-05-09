/* .syntax unified */

/* printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null) */

.global printbytes
.type	printbytes, %function

printbytes:
        stp fp, lr, [sp, #-0x60]!
        stp x19, x20, [sp, #0x10]
        stp x21, x22, [sp, #0x20]
        stp x23, x24, [sp, #0x30]
        stp x25, x26, [sp, #0x40]
        stp x27, x28, [sp, #0x50]
        mov fp, sp

printbytes_loopstart:
	ldrb	w3, [x0], 1
	add	x3, x3, 48
	strb	w3, [x2], 1
	subs	x1, x1, 1
	bne	printbytes_loopstart

	mov	x3, 0
	strb	w3, [x2], 1

        ldp x27, x28, [sp, #0x50]
        ldp x25, x26, [sp, #0x40]
        ldp x23, x24, [sp, #0x30]
        ldp x21, x22, [sp, #0x20]
        ldp x19, x20, [sp, #0x10]
        ldp fp, lr, [sp], #0x60

