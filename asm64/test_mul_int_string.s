.macro multiplystring num start
	ldr	x0, =input
	ldr	x1, =iLENGTH
	ldr	x2, =\num
	ldr	x3, =output

        stp x22, x23, [sp, #-0x70]!
        stp x10, x11, [sp, #0x10]
        stp x12, x13, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x16, x17, [sp, #0x40]
        stp x18, x19, [sp, #0x50]
        stp x20, x21, [sp, #0x60]

	bl	mul_int_string

        ldp x20, x21, [sp, #0x60]
        ldp x18, x19, [sp, #0x50]
        ldp x16, x17, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x12, x13, [sp, #0x20]
        ldp x10, x11, [sp, #0x10]
        ldp x22, x23, [sp], #0x70

	ldr	x2, =print_vector
	bl	printbytes

	ldr	x2, =\start
	ldr     x4, =\num
	mul	x4, x2, x4
	ldr	x1, =\num
	ldr	x3, =print_vector
	ldr	x0, =outstring
	bl	printf

	ldr	x0, =output
	ldr	x1, =oLENGTH
	bl	clearbytes
.endm

#.equ	iLENGTH,3
#.equ	iLENGTH,4
.equ	iLENGTH,6
#.equ	iLENGTH,10
.equ	ipLENGTH,iLENGTH+1
.equ	oLENGTH,iLENGTH+2
.equ	opLENGTH,oLENGTH+1

.equ	scalar0,0
.equ	scalar1,1
.equ	scalar2,2
.equ	scalar3,3
.equ	scalar7,7
.equ	scalar10,10
.equ	scalar11,11
.equ	scalar12,12
.equ	scalar14,14
.equ	scalar20,20
.equ	scalar21,21
.equ	scalar22,22
.equ	scalar23,23
.equ	scalar30,30
.equ	scalar31,31
.equ	scalar32,32
.equ	scalar87,87
.equ	scalar100,100
.equ	scalar101,101
.equ	scalar111,111
.equ	scalar121,121
.equ	scalar300,300
.equ	scalar321,321
.equ	scalar1000,1000
.equ	scalar1001,1001
.equ	scalar10000,10000
.equ	scalar10001,10001

.section .data
.align	2
input:
#.byte 1, 2, 3
#.byte 4, 3, 2, 7
#.byte 1, 2, 3, 4
.byte 1, 2, 3, 4, 5, 6
#byte 6, 5, 4, 3, 2, 1
#.byte 3, 6, 2, 8, 8, 0
#.byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 1
#.byte 6, 2, 2, 7, 0, 2, 0, 8, 0, 0
.section .rodata
outstring:
.asciz "scalar is %d and base is %d, output string is %s - should be %d\n"

.section bss
.lcomm print_vector,ipLENGTH
.lcomm output,oLENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
	multiplystring scalar101 123456
	multiplystring scalar111 123456
	multiplystring scalar321 123456
	multiplystring scalar0 123456
	multiplystring scalar1 123456
	multiplystring scalar2 123456
	multiplystring scalar3 123456
	multiplystring scalar7 123456
	multiplystring scalar10 123456
	multiplystring scalar11 123456
	multiplystring scalar12 123456
	multiplystring scalar14 123456
	multiplystring scalar20 123456
	multiplystring scalar21 123456
	multiplystring scalar22 123456
	multiplystring scalar23 123456
	multiplystring scalar30 123456
	multiplystring scalar31 123456
	multiplystring scalar32 123456
	multiplystring scalar87 123456
	multiplystring scalar100 123456
	multiplystring scalar101 123456
	multiplystring scalar111 123456
	multiplystring scalar121 123456
	multiplystring scalar300 123456
	multiplystring scalar321 123456
	multiplystring scalar1000 123456
	multiplystring scalar1001 123456
	multiplystring scalar10000 123456
	multiplystring scalar10001 123456

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
