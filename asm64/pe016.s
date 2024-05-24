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
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp
	ldr	x4, =power
next:
	ldr	x0, =input
	ldr	x1, =iLENGTH
	ldr	x2, =scalar2
	ldr	x3, =output

        stp x10, x11, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]

	bl	mul_digit_string

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp x10, x11, [sp], #0x40

	ldr	x0, =output
	ldr	x1, =iLENGTH
	ldr	x2, =input
	bl	copybytes

	subs	x4, x4, 1
	b.ne	next

	ldr	x0, =output
	ldr	x1, =iLENGTH
	bl	sum_output

	mov	x1, x0
	ldr	x0, =sum_string
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret

# printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null)
printbytes:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

printloop:
	ldrb	w3, [x0], 1
	add	w3, w3, 48
	strb	w3, [x2], 1
	subs	x1, x1, 1
	b.ne	printloop

	mov	w3, 0
	strb	w3, [x2], 1

        ldp fp, lr, [sp], #0x10
        ret

# copybytes takes input pointer in r0, input length in r1 and copies vector to r2
copybytes:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

copyloop:
	ldrb	w3, [x0], 1
	strb	w3, [x2], 1
	subs	x1, x1, 1
	b.ne	copyloop

        ldp fp, lr, [sp], #0x10
        ret

# sum_output sums the elements of the r1 elements of the vector passed in r0 and returns the sum in r0
sum_output:
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

        mov     x2, 0
sumloop:
        ldrb    w3, [x0], 1
        add     x2, x2, x3, uxtw
        subs    x1, x1, 1
        b.ne     sumloop

        mov     x0, x2

        ldp	fp, lr, [sp], #0x10
        ret
