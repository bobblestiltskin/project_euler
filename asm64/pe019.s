# this computes projecteuler.net problem 019

.equ	months,48
.equ	cycles,25

tmp             .req r1
scount          .req r4
ccount          .req r5
mcount          .req r6
dow		.req r7
cptr		.req r8

.section .rodata
cycle:
.byte 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

resstring:
.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
#        stmfd   sp!, {r4-r8, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	scount, 0
	mov	dow, 2
	ldr	ccount, =cycles
cstart:
	mov	mcount, 0
	ldr	cptr, =cycle
mstart:
	teq	dow, 0
	addeq	scount, scount, 1

	ldrb	tmp, [cptr], 1
	add	r0, dow, tmp
	mov	r1, 7
	bl	divide
	mov	dow, r1

	add	mcount, mcount, 1
	cmp	mcount, months
	blt	mstart
	subs	ccount, ccount, 1
	bne	cstart
last:
	mov	r1, scount
	ldr	r0, =resstring
	bl	printf

        mov     r0, 0
#        ldmfd   sp!, {r4-r8, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
