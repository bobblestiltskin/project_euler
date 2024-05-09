.syntax unified

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
        stmfd   sp!, {r4, lr}
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
        ldmfd   sp!, {r4, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux

# printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null)
printbytes:
	stmfd	sp!, {lr}
printloop:
	ldrb	r3, [r0], 1
	add	r3, r3, 48
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	printloop

	mov	r3, 0
	strb	r3, [r2], 1
	ldmfd	sp!, {pc}

# copybytes takes input pointer in r0, input length in r1 and copies vector to r2
copybytes:
	stmfd	sp!, {lr}
copyloop:
	ldrb	r3, [r0], 1
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	copyloop

	ldmfd	sp!, {pc}

# sum_output sums the elements of the r1 elements of the vector passed in r0 and returns the sum in r0
sum_output:
        stmfd   sp!, {lr}
        mov     r2, 0
sumloop:
        ldrb    r3, [r0], 1
        add     r2, r2, r3
        subs    r1, r1, 1
        bne     sumloop

        mov     r0, r2
        ldmfd   sp!, {pc}
