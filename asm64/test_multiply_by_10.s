.macro multiply_by_tens num
        ldr     x0, =input
        ldr     x1, =iLENGTH
        ldr     x2, =\num

        bl      mul_tens_string

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
