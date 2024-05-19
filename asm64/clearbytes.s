# clearbytes takes pointer in r0, input length in r1 
# and sets all vector elements to 0

.global clearbytes
.type	clearbytes, %function
clearbytes:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	w3, 0
clearbytesloopstart:
	strb	w3, [x0], 1
	subs	x1, x1, 1
	b.ne	clearbytesloopstart

        ldp fp, lr, [sp], #0x10
	ret
