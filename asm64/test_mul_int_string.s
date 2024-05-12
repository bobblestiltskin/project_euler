.macro multiplystring num
	ldr	r0, =input
	ldr	r1, =iLENGTH
	ldr	r2, =\num
	ldr	r3, =output
	bl	mul_int_string

	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =\num
	ldr	r2, =print_vector
	ldr	r0, =outstring
	bl	printf

	ldr	r0, =output
	ldr	r1, =oLENGTH
	bl	clearbytes
.endm

.equ	iLENGTH,10
.equ	ipLENGTH,iLENGTH+1
.equ	oLENGTH,iLENGTH+2
.equ	opLENGTH,oLENGTH+1

.equ	scalar1,1
.equ	scalar3,3
.equ	scalar14,14
.equ	scalar20,20
.equ	scalar31,31
.equ	scalar32,32
.equ	scalar87,87

.section .data
.align	2
input:
#.byte 4, 3, 2, 7
#.byte 1, 2, 3
#fact13:
.byte 6, 2, 2, 7, 0, 2, 0, 8, 0, 0
.section .rodata
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

	multiplystring scalar1
	multiplystring scalar3
	multiplystring scalar14
	multiplystring scalar31
	multiplystring scalar32
	multiplystring scalar87
	multiplystring scalar20

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
