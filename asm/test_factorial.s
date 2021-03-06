.syntax unified

.macro dofac s
	mov	r3, 1
	ldr	r0, =input
	strb	r3, [r0]
	ldr	r0, =\s
	ldr	r1, =input
	ldr	r2, =output
	bl	factorial

	ldr	r2, =print_vector
	bl	printbytes

	ldr	r2, =print_vector
	ldr	r1, =\s
	ldr	r0, =outstring
	bl	printf

	ldr	r0, =output
	ldr	r1, =oLENGTH
	bl	clearbytes
.endm

.equ	iLENGTH,1
.equ	ipLENGTH,200
.equ	oLENGTH,200

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
.equ	scalar11,11
.equ	scalar12,12
.equ	scalar13,13
.equ	scalar14,14
.equ	scalar15,15
.equ	scalar16,16
.equ	scalar17,17
.equ	scalar18,18
.equ	scalar19,19
.equ	scalar20,20
.equ	scalar30,30
.equ	scalar40,40
.equ	scalar50,50
.equ	scalar60,60
.equ	scalar70,70
.equ	scalar80,80
.equ	scalar90,90
.equ	scalar100,100

.section .rodata
instring:
.asciz "input string is %s\n"
outstring:
.asciz "number is %d and factorial is %s\n"

.section bss
.align	2
.lcomm print_vector,ipLENGTH
.lcomm output,oLENGTH
.lcomm input,oLENGTH

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
	dofac scalar11
	dofac scalar12
	dofac scalar13
	dofac scalar14
	dofac scalar15
	dofac scalar16
	dofac scalar17
	dofac scalar18
	dofac scalar19
	dofac scalar20
	dofac scalar30
	dofac scalar40
	dofac scalar50
	dofac scalar60
	dofac scalar70
	dofac scalar80
	dofac scalar90
	dofac scalar100

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
