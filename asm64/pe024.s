# this computes projecteuler.net problem 024

# - see http://en.wikipedia.org/wiki/Factorial_number_system
# - and http://en.wikipedia.org/wiki/Permutation

.macro check_digit a
	ldr	r0, =vector
	mov	r1, VSIZE
	mov	r2, \a
	bl	contains
	teq	r0, 1
	bne	mloop
.endm

.macro copy_vector a b
	ldr	r0, =\a
	add	r0, r0, 1
	mov	r1, VSIZE
	ldr	r2, =\b
	bl	copybytes
.endm

# this macro lifted from test_add_digit_strings.s 
# the usage of add_digit_strings is tricky because
# the fifth parameter must be passed on the stack

.macro add_strings a al b bl c
#        stmfd   sp!, {r4}       /* stash r4 on the stack - we destroy it in add_digit_strings */
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

        ldr     r0, =\c
#        stmfd   sp!, {r0}       /* this is the fifth parameter for the subroutine */
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

        ldr     r0, =\a
        ldr     r1, =\al
        ldr     r2, =\b
        ldr     r3, =\bl
        bl      add_digit_strings
        add     sp, sp, 4       /* revert sp to before (1) */
#        ldmfd   sp!, {r4}      /* and get stashed r4 */
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40
.endm

.equ	datum_size, 2
.equ	SIZE, 2080
.equ	VSIZE, 10

.align 4

icount		.req r4

.section .data
.align  2
vector:
.byte 2, 7, 8, 0, 0, 0, 0, 0, 0, 0
increment:
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 1

.section .bss
.lcomm output, VSIZE
.lcomm print_vector, VSIZE

.section .rodata
outstring:
.asciz "%s\n"

.text
.align  2
.global main
.type   main, %function
main:
        #stmfd   sp!, {r4, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	ldr	icount, =SIZE
mloop:
	add_strings vector 10 increment 10 output
	copy_vector output vector
	check_digit 0
	check_digit 1
	check_digit 2
	check_digit 3
	check_digit 4
	check_digit 5
	check_digit 6
	check_digit 7
	check_digit 8
	check_digit 9
	subs	icount, icount, 1
	bne	mloop
printme:
	ldr	r0, =vector
	mov	r1, 10
        ldr     r2, =print_vector
        bl      printbytes

        ldr     r1, =print_vector
        ldr     r0, =outstring
        bl      printf

	mov	r0, 0
#        ldmfd   sp!, {r4, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

# contains takes a pointer to a byte vector in r0, and a size in r1 and a scalar in r2
# it returns 1 in r0 if the vector contains the scalar and 0 otherwise
.global contains
.type   contains, %function
contains:
#        stmfd   sp!, {r4, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	r4, r0
	mov	r0, 0
contains_start:
	ldrb	r3, [r4], 1
	cmp	r3, r2
	moveq	r0, 1
	beq	contains_end
	subs	r1, r1, 1
	bne	contains_start
contains_end:	
#        ldmfd   sp!, {r4, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40
