.equ	sLENGTH,4
.equ	lLENGTH,5
.equ	ipLENGTH,lLENGTH+1
.equ	oLENGTH,lLENGTH+1
.equ	opLENGTH,oLENGTH+1

.macro add_strings a al b bl c
	ldr	x0, =\a
	ldr	x1, =\al
	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =print_vector
	ldr	x0, =instring
	bl	printf

	ldr	x0, =\b
	ldr	x1, =\bl
	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =print_vector
	ldr	x0, =instring
	bl	printf

        stp x20, x21, [sp, #-0x50]!
        stp x12, x13, [sp, #0x10]
        stp x14, x15, [sp, #0x20]
        stp x16, x17, [sp, #0x30]
        stp x18, x19, [sp, #0x40]

	ldr	x0, =\a
	ldr	x1, =\al
	ldr	x2, =\b
	ldr	x3, =\bl
	ldr	x4, =\c
	bl	add_digit_strings

        ldp x18, x19, [sp, #0x40]
        ldp x16, x17, [sp, #0x30]
        ldp x14, x15, [sp, #0x20]
        ldp x12, x13, [sp, #0x10]
        ldp x20, x21, [sp], #0x50

	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =print_vector
	ldr	x0, =outstring
	bl	printf
.endm

.section .data
.align	2
one_two_three:
.byte 1, 2, 3
one_two_three_zero:
.byte 1, 2, 3, 0
zeroes4:
.byte 0, 0, 0, 0
short:
.byte 4, 3, 2, 7
long:
.byte 6, 6, 6, 6, 6
nines2:
.byte 9, 9
nines4:
.byte 9, 9, 9, 9
nines6:
.byte 9, 9, 9, 9, 0, 9
nines7:
.byte 9, 0, 9, 0, 0, 9, 9
sevend1:
.byte 7, 2, 5, 7, 6, 0, 0
sevend2:
.byte 1, 0, 8, 8, 6, 4, 0
instring:
.asciz "input string is %s\n"
outstring:
.asciz "output string is %s\n"

.section .bss
.lcomm print_vector,ipLENGTH
.lcomm output,oLENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
	add_strings sevend1 7 sevend2 7 output
	add_strings one_two_three_zero 4 one_two_three 3 output
	add_strings one_two_three_zero sLENGTH zeroes4 sLENGTH output
	add_strings zeroes4 sLENGTH one_two_three_zero sLENGTH output
	add_strings short sLENGTH long lLENGTH output
	add_strings long lLENGTH short sLENGTH output
	add_strings nines2 2 nines4 4 output
	add_strings nines2 2 nines7 7 output
	add_strings nines6 6 nines4 4 output
	add_strings nines6 6 nines2 2 output
	add_strings nines7 7 nines2 2 output
	add_strings nines7 7 nines6 6 output
	add_strings nines7 7 nines4 4 output

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
