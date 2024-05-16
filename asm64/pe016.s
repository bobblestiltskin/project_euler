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
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

	ldr	x4, =power
next:
	ldr	x0, =input
	ldr	x1, =iLENGTH
	ldr	x2, =scalar2
	ldr	x3, =output
	bl	mul_digit_string

	ldr	x0, =output
	ldr	x1, =iLENGTH
	ldr	x2, =input
	bl	copybytes

	subs	x4, x4, 1
	bne	next

	ldr	x0, =output
	ldr	x1, =iLENGTH
	bl	sum_output

	mov	x1, x0
	ldr	x0, =sum_string
	bl	printf

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
	ldrb	w3, [x0], 1
	add	w3, w3, 48
	strb	w3, [x2], 1
	subs	x1, x1, 1
	bne	printloop

	mov	w3, 0
	strb	w3, [x2], 1
#	ldmfd	sp!, {pc}
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

	ret

# copybytes takes input pointer in r0, input length in r1 and copies vector to r2
copybytes:
#	stmfd	sp!, {lr}
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

copyloop:
	ldrb	w3, [x0], 1
	strb	w3, [x2], 1
	subs	x1, x1, 1
	bne	copyloop

#	ldmfd	sp!, {pc}
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

	ret


# sum_output sums the elements of the r1 elements of the vector passed in r0 and returns the sum in r0
sum_output:
#        stmfd   sp!, {lr}
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

        mov     x2, 0
sumloop:
        ldrb    w3, [x0], 1
	sxtw	x3, w3
        add     x2, x2, x3
        subs    x1, x1, 1
        bne     sumloop

        mov     x0, x2

#        ldmfd   sp!, {pc}
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

	ret
