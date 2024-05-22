# this computes projecteuler.net problem 024

# - see http://en.wikipedia.org/wiki/Factorial_number_system
# - and http://en.wikipedia.org/wiki/Permutation

.macro save_regs_on_stack
        stp x20, x21, [sp, #-0x90]!
        stp x18, x19, [sp, #0x10]
        stp x16, x17, [sp, #0x20]
        stp x14, x15, [sp, #0x30]
        stp x12, x13, [sp, #0x40]
        stp x10, x11, [sp, #0x50]
        stp x8, x9,   [sp, #0x60]
        stp x6, x7,   [sp, #0x70]
        stp x4, x5,   [sp, #0x80]
.endm

.macro restore_regs_from_stack
        ldp x4, x5,   [sp, #0x80]
        ldp x6, x7,   [sp, #0x70]
        ldp x8, x9,   [sp, #0x60]
        ldp x10, x11, [sp, #0x50]
        ldp x12, x13, [sp, #0x40]
        ldp x14, x15, [sp, #0x30]
        ldp x16, x17, [sp, #0x20]
        ldp x18, x19, [sp, #0x10]
        ldp x20, x21, [sp], #0x90
.endm

.macro check_digit a
	ldr	x0, =vector
	mov	x1, VSIZE
	mov	x2, \a
	save_regs_on_stack
	bl	contains
	restore_regs_from_stack
	cmp	x0, 1
	bne	mloop
.endm

.macro copy_vector a b
	ldr	x0, =\a
	add	x0, x0, 1
	mov	x1, VSIZE
	ldr	x2, =\b
	save_regs_on_stack
	bl	copybytes
	restore_regs_from_stack
.endm

# this macro lifted from test_add_digit_strings.s 
# the usage of add_digit_strings is tricky because
# the fifth parameter must be passed on the stack

.macro add_strings a al b bl c
#        stmfd   sp!, {r4}       /* stash r4 on the stack - we destroy it in add_digit_strings */
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]

#        stp fp, lr, [sp, #-0x10]!
#        mov fp, sp

        ldr     x0, =\c
        ldr     x0, =\a
        ldr     x1, =\al
        ldr     x2, =\b
        ldr     x3, =\bl

	save_regs_on_stack
        bl      add_digit_strings
	restore_regs_from_stack

#        add     sp, sp, 4       /* revert sp to before (1) */
#        ldmfd   sp!, {r4}      /* and get stashed r4 */
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

#        ldp fp, lr, [sp], #0x10
.endm

.equ	datum_size, 2
.equ	SIZE, 2080
.equ	VSIZE, 10

.align 4

icount		.req x4

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
#        #stmfd   sp!, {r4, lr}
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]

        stp fp, lr, [sp, #-0x10]!
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
	ldr	x0, =vector
	mov	x1, 10
        ldr     x2, =print_vector
        bl      printbytes

        ldr     x1, =print_vector
        ldr     x0, =outstring
        bl      printf

#        ldmfd   sp!, {r4, pc}
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

        ldp fp, lr, [sp], #0x10

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

# contains takes a pointer to a byte vector in r0, and a size in r1 and a scalar in r2
# it returns 1 in r0 if the vector contains the scalar and 0 otherwise
.global contains
.type   contains, %function
contains:
#        stmfd   sp!, {r4, lr}
#        stp fp, lr, [sp, #-0x40]!
#        stp x4, x5, [sp, #0x10]
#        stp x6, x7, [sp, #0x20]
#        stp x8, x9, [sp, #0x30]
#        mov fp, sp

        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	x4, x0
	mov	x0, 0
contains_start:
	ldrb	w3, [x4], 1
	cmp	w3, w2
	b.ne	decrement_size
	mov	x0, 1
	b	contains_end
decrement_size:
	subs	x1, x1, 1
	bne	contains_start
contains_end:	
#        ldmfd   sp!, {r4, pc}
#        ldp x8, x9, [sp, #0x30]
#        ldp x6, x7, [sp, #0x20]
#        ldp x4, x5, [sp, #0x10]
#        ldp fp, lr, [sp], #0x40

        ldp fp, lr, [sp], #0x10
	ret
