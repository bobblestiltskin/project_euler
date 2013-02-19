.syntax unified

.macro multiplystring num
	ldr	r0, =input
	ldr	r1, =iLENGTH
	ldr	r2, =\num
	ldr	r3, =output
	bl	mul_digit_string

	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =\num
	ldr	r2, =print_vector
	ldr	r0, =outstring
	bl	printf
.endm

.equ	iLENGTH,4
.equ	ipLENGTH,iLENGTH+1
.equ	oLENGTH,iLENGTH+1
.equ	opLENGTH,oLENGTH+1

.equ	scalar0,0
.equ	scalar1,1
.equ	scalar2,2
.equ	scalar3,3
.equ	scalar8,8

number	.req r4

.section .rodata
.align	2
input:
.byte 4, 3, 2, 7
instring:
.asciz "input string is %s\n"
outstring:
.asciz "scalar is %d and output string is %s\n"

.section bss
.lcomm print_vector,ipLENGTH
.lcomm output,oLENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
	ldr	r0, =input
	ldr	r1, =iLENGTH
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

	multiplystring scalar3
	multiplystring scalar0
	multiplystring scalar1
	multiplystring scalar8
	multiplystring scalar2

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
