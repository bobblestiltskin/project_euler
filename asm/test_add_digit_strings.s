.syntax unified

.equ	sLENGTH,4
.equ	lLENGTH,5
.equ	ipLENGTH,lLENGTH+1
.equ	oLENGTH,lLENGTH+1
.equ	opLENGTH,oLENGTH+1

.section .data
.align	2
short:
.byte 4, 3, 2, 7
long:
.byte 6, 6, 6, 6, 6
instring:
.asciz "input string is %s\n"
outstring:
.asciz "output string is %s\n"

.section bss
.lcomm print_vector,ipLENGTH
.lcomm output,oLENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
	ldr	r0, =short
	ldr	r1, =sLENGTH
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

	ldr	r0, =long
	ldr	r1, =lLENGTH
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

	ldr	r0, =short
	ldr	r1, =sLENGTH
	ldr	r2, =long
	ldr	r3, =lLENGTH
	bl	add_digit_strings

	ldr	r0, =long
	ldr	r1, =lLENGTH
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux

# printbytes takes input pointer in r0, input length in r1 and writes printable vector to r2 (with trailing null)
	.global printbytes
	.type	printbytes, %function
printbytes:
	stmfd	sp!, {lr}
loopstart:
	ldrb	r3, [r0], 1
	add	r3, r3, 48
	strb	r3, [r2], 1
	subs	r1, r1, 1
	bne	loopstart

	mov	r3, 0
	strb	r3, [r2], 1
	ldmfd	sp!, {pc}
