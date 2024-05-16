.macro multiplystring num
	ldr	x0, =input
	ldr	x1, =iLENGTH
	ldr	x2, =\num
	ldr	x3, =output
	bl	mul_digit_string

	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =\num
	ldr	x2, =print_vector
	ldr	x0, =outstring
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
	ldr	x0, =input
	ldr	x1, =iLENGTH
	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =print_vector
	ldr	x0, =instring
	bl	printf

	multiplystring scalar0
	multiplystring scalar1
	multiplystring scalar2
	multiplystring scalar3
	multiplystring scalar8

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
