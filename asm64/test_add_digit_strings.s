.syntax unified

.equ	sLENGTH,4
.equ	lLENGTH,5
.equ	ipLENGTH,lLENGTH+1
.equ	oLENGTH,lLENGTH+1
.equ	opLENGTH,oLENGTH+1

.macro add_strings a al b bl c
	ldr	r0, =\a
	ldr	r1, =\al
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

	ldr	r0, =\b
	ldr	r1, =\bl
	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =instring
	bl	printf

        stmfd   sp!, {r4}	@ stash r4 on the stack - we destroy it in add_digit_strings
	ldr	r0, =\c
	stmfd   sp!, {r0}       @ this is the fifth parameter for the subroutine
	ldr	r0, =\a
	ldr	r1, =\al
	ldr	r2, =\b
	ldr	r3, =\bl
	bl	add_digit_strings
	add     sp, sp, 4       @ revert sp to before (1)
        ldmfd   sp!, {r4}	@ and get stashed r4

	ldr	r2, =print_vector
	bl	printbytes

	ldr	r1, =print_vector
	ldr	r0, =outstring
	bl	printf
.endm

.section .data
.align	2
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
	add_strings short sLENGTH long lLENGTH output
	add_strings long lLENGTH short sLENGTH output
	add_strings nines2 2 nines4 4 output
	add_strings nines6 6 nines4 4 output
	add_strings nines6 6 nines2 2 output
	add_strings nines7 7 nines2 2 output
	add_strings nines7 7 nines6 6 output
	add_strings nines7 7 nines4 4 output

	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
