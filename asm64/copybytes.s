# copybytes takes input pointer in x0, input length in x1 and writes to x2
.include "regs.s"
ptr	.req x19
len	.req x20
.global copybytes
.type	copybytes, %function
copybytes:
	callee_save_regs_on_stack
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
	callee_restore_regs_from_stack
	ret
