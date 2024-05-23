# this computes projecteuler.net problem 024

# - see http://en.wikipedia.org/wiki/Factorial_number_system
# - and http://en.wikipedia.org/wiki/Permutation

.macro check_digit a
	ldr	x0, =vector
	mov	x1, VSIZE
	mov	x2, \a
	bl	contains
	cmp	x0, 1
	bne	mloop
.endm

.macro copy_vector a b
	ldr	x0, =\a
	add	x0, x0, 1
	mov	x1, VSIZE
	ldr	x2, =\b
	bl	copybytes
.endm

.macro add_strings a al b bl c
        ldr     x0, =\a
        ldr     x1, =\al
        ldr     x2, =\b
        ldr     x3, =\bl
        ldr     x4, =\c

        bl      add_digit_strings
.endm

.equ	datum_size, 2
.equ	SIZE, 2080
.equ	VSIZE, 10

.align 4

icount		.req x19

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

        ldp fp, lr, [sp], #0x10

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

# contains takes a pointer to a byte vector in r0, and a size in r1 and a scalar in r2
# it returns 1 in r0 if the vector contains the scalar and 0 otherwise
.global contains
.type   contains, %function
contains:
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

        ldp fp, lr, [sp], #0x10
	ret
