# copybytes takes input pointer in x0, input length in x1 and writes to x2
ptr	.req x4
len	.req x5
.global copybytes
.type	copybytes, %function
copybytes:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	len, x1
	mov	ptr, x2
copybytesloopstart:
	ldrb	w3, [x0], 1
	strb	w3, [x2], 1
	subs	x1, x1, 1
	b.ne	copybytesloopstart

	mov	x0, ptr
	mov	x1, len

        ldp fp, lr, [sp], #0x10
	ret
