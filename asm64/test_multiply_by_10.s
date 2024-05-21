.macro multiply_by_tens num
        ldr     x0, =input
        ldr     x1, =iLENGTH
        ldr     x2, =\num
#        ldr     x3, =output

        stp x18, x19, [sp, #-0x50]!
        stp x10, x11, [sp, #0x10]
        stp x12, x13, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x16, x17, [sp, #0x40]

        bl      mul_tens_string

        ldp x16, x17, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x12, x13, [sp, #0x20]
        ldp x10, x11, [sp, #0x10]
        ldp x18, x19, [sp], #0x50

        ldr     x2, =print_vector
        bl      printbytes

        ldr     x1, =\num
        ldr     x2, =print_vector
        ldr     x0, =outstring
        bl      printf

        ldr     x0, =output
        ldr     x1, =oLENGTH
        bl      clearbytes
.endm

.equ    iLENGTH,3
#.equ   iLENGTH,10
.equ    ipLENGTH,iLENGTH+1
.equ    oLENGTH,iLENGTH+2
.equ    opLENGTH,oLENGTH+1

.equ zero,0
.equ one,1
.equ two,2
.equ four,4
.equ six,6

thisbyte	.req x4
tmp		.req x4
iptr		.req x5

.section .data
.align  2
input:
#.byte 4, 3, 2, 7
.byte 1, 2, 3
#fact13:
#.byte 6, 2, 2, 7, 0, 2, 0, 8, 0, 0
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
	multiply_by_tens zero
	multiply_by_tens one
	multiply_by_tens two
	multiply_by_tens four

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
