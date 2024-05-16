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

#        stmfd   sp!, {r4}	/* stash r4 on the stack - we destroy it in add_digit_strings */
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

#	stmfd   sp!, {r0}       /* this is the fifth parameter for the subroutine */
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

	ldr	x0, =\a
	ldr	x1, =\al
	ldr	x2, =\b
	ldr	x3, =\bl
	ldr	x4, =\c
	bl	add_digit_strings
#	add     sp, sp, 4       /* revert sp to before (1) */
#        ldmfd   sp!, {r4}	/* and get stashed r4 */
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

	ldr	x2, =print_vector
	bl	printbytes

	ldr	x1, =print_vector
	ldr	x0, =outstring
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

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
