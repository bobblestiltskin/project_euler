# this computes projecteuler.net problem 016

.equ	power,1000
.equ	iLENGTH,302
.equ	scalar2,2

.section .rodata
sum_string:
.asciz "%d\n"

.section .data
input:
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1

.section bss
.lcomm output,iLENGTH

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

	ldr	r4, =power
next:
	ldr	r0, =input
	ldr	r1, =iLENGTH
	ldr	r2, =scalar2
	ldr	r3, =output
	bl	mul_digit_string

	ldr	r0, =output
	ldr	r1, =iLENGTH
	ldr	r2, =input
	bl	copybytes

	subs	r4, r4, 1
	bne	next

	ldr	r0, =output
	ldr	r1, =iLENGTH
	bl	sum_output

	mov	r1, r0
	ldr	r0, =sum_string
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

# printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null)
printbytes:
#	stmfd	sp!, {lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

printloop:
	ldrb	r3, [r0], 1
	add	r3, r3, 48
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	printloop

	mov	r3, 0
	strb	r3, [r2], 1
#	ldmfd	sp!, {pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

#	mov	x0, #0		/* exit code to 0 */
#	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
#        svc	#0		/* then invoke the syscall from linux */

# copybytes takes input pointer in r0, input length in r1 and copies vector to r2
copybytes:
#	stmfd	sp!, {lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

copyloop:
	ldrb	r3, [r0], 1
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	copyloop

#	ldmfd	sp!, {pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

#	mov	x0, #0		/* exit code to 0 */
#	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
#        svc	#0		/* then invoke the syscall from linux */


# sum_output sums the elements of the r1 elements of the vector passed in r0 and returns the sum in r0
sum_output:
#        stmfd   sp!, {lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

        mov     r2, 0
sumloop:
        ldrb    r3, [r0], 1
        add     r2, r2, r3
        subs    r1, r1, 1
        bne     sumloop

        mov     r0, r2
#        ldmfd   sp!, {pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

