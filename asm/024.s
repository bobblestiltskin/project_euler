.syntax unified

# more reading shows my intuition was ok
# - see http://en.wikipedia.org/wiki/Factorial_number_system
# - and http://en.wikipedia.org/wiki/Permutation

# this macro lifted from test_add_digit_strings.s 
# the usage of add_digit_strings is tricky because
# the fifth parameter must be passed on the stack

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

.macro add_strings a al b bl c
        stmfd   sp!, {r4}       @ stash r4 on the stack - we destroy it in add_digit_strings
        ldr     r0, =\c
        stmfd   sp!, {r0}       @ this is the fifth parameter for the subroutine
        ldr     r0, =\a
        ldr     r1, =\al
        ldr     r2, =\b
        ldr     r3, =\bl
        bl      add_digit_strings
        add     sp, sp, 4       @ revert sp to before (1)
        ldmfd   sp!, {r4}       @ and get stashed r4
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
        stmfd   sp!, {r4, lr}
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
        ldmfd   sp!, {r4, pc}
        mov     r7, 1           @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

# contains takes a pointer to a byte vector in r0, and a size in r1 and a scalar in r2
# it returns 1 in r0 if the vector contains the scalar and 0 otherwise
.global contains
.type   contains, %function
contains:
        stmfd   sp!, {r4, lr}
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
        ldmfd   sp!, {r4, pc}
