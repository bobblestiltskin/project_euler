.macro multiplystring num
	ldr	x0, =input
	ldr	x1, =iLENGTH
	ldr	x2, =\num
	ldr	x3, =output

        stp x18, x19, [sp, #-0x50]!
        stp x10, x11, [sp, #0x10]
        stp x12, x13, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x16, x17, [sp, #0x40]

	bl	mul_int_string

        ldp x16, x17, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x12, x13, [sp, #0x20]
        ldp x10, x11, [sp, #0x10]
        ldp x18, x19, [sp], #0x50

	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =\num
	ldr	x2, =print_vector
	ldr	x0, =outstring
	bl	printf

	ldr	x0, =output
	ldr	x1, =oLENGTH
	bl	clearbytes
.endm

.equ	iLENGTH,3
#.equ	iLENGTH,10
.equ	ipLENGTH,iLENGTH+1
.equ	oLENGTH,iLENGTH+2
.equ	opLENGTH,oLENGTH+1

.equ	scalar0,0
.equ	scalar1,1
.equ	scalar3,3
.equ	scalar7,7
.equ	scalar10,10
.equ	scalar11,11
.equ	scalar12,12
.equ	scalar14,14
.equ	scalar20,20
.equ	scalar31,31
.equ	scalar32,32
.equ	scalar87,87
.equ	scalar100,100
.equ	scalar101,101
.equ	scalar321,321
.equ	scalar1000,1000
.equ	scalar1001,1001

.section .data
.align	2
input:
.byte 1, 2, 3
#.byte 4, 3, 2, 7
#.byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 1
#.byte 6, 2, 2, 7, 0, 2, 0, 8, 0, 0
.section .rodata
instring:
.asciz "input string is 123\n"
#.asciz "input string is 1234567891\n"
#.asciz "input string is 6227020800\n"
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
	ldr	x0, =instring
	bl	printf

	multiplystring scalar321
	multiplystring scalar0
	multiplystring scalar1
	multiplystring scalar3
	multiplystring scalar7
	multiplystring scalar10
	multiplystring scalar11
	multiplystring scalar12
	multiplystring scalar14
	multiplystring scalar20
	multiplystring scalar31
	multiplystring scalar32
	multiplystring scalar87
	multiplystring scalar100
	multiplystring scalar101
	multiplystring scalar321
	multiplystring scalar1000
	multiplystring scalar1001

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
