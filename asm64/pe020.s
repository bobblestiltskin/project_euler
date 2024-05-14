# this computes projecteuler.net problem 020

.equ	LENGTH,200
.equ	scalar100,100

.section .rodata
sumstring:
.asciz "%d\n"

.section bss
.align	2
.lcomm input,LENGTH
.lcomm output,LENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
#        stmfd   sp!, {r4, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	r3, 1
	ldr	r0, =input
	strb	r3, [r0]

	ldr	r0, =scalar100
	ldr	r1, =input
	ldr	r2, =output
	bl	factorial

	mov	r2, 0
lstart:
	ldrb	r3, [r0], 1
	add	r2, r2, r3
	subs	r1, r1, 1
	bne	lstart
	
	mov	r1, r2
	ldr	r0, =sumstring
	bl	printf
	
	mov	r0, 0
#        ldmfd   sp!, {r4, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
