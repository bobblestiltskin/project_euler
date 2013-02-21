.syntax unified

.macro dofac s
	mov	r3, 1
	ldr	r0, =input
	strb	r3, [r0]
	ldr	r1, =iLENGTH
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

	ldr	r0, =\s
	ldr	r1, =input
	ldr	r2, =output
	bl	factorial

	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =outstring
	bl	printf

	ldr	r0, =output
	ldr	r1, =oLENGTH
	bl	clearbytes
.endm

.equ	iLENGTH,1
.equ	ipLENGTH,10
.equ	oLENGTH,10

.equ	scalar1,1
.equ	scalar2,2
.equ	scalar3,3
.equ	scalar4,4
.equ	scalar5,5
.equ	scalar6,6
.equ	scalar7,7
.equ	scalar8,8
.equ	scalar9,9
.equ	scalar10,10

.section .data
.align	2
input:
.byte 1
.section .rodata
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
	dofac scalar1
	dofac scalar2
	dofac scalar3
	dofac scalar4
	dofac scalar5
	dofac scalar6
	dofac scalar7
	dofac scalar8
	dofac scalar9
	dofac scalar10

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
