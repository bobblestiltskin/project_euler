# this computes projecteuler.net problem 017

.equ	one,3
.equ	two,3
.equ	three,5
.equ	four,4
.equ	five,4
.equ	six,3
.equ	seven,5
.equ	eight,5
.equ	nine,4
.equ	ten,3
.equ	eleven,6
.equ	twelve,6
.equ	thirteen,8
.equ	fourteen,8
.equ	fifteen,7
.equ	sixteen,7
.equ	seventeen,9
.equ	eighteen,8
.equ	nineteen,8
.equ	twenty,6
.equ	thirty,6
.equ	forty,5
.equ	fifty,5
.equ	sixty,5
.equ	seventy,7
.equ	eighty,6
.equ	ninety,6
.equ	hundred,7
.equ	thousand,8
.equ	and,3

.macro units
	add	r0, r0, one
	add	r0, r0, two
	add	r0, r0, three
	add	r0, r0, four
	add	r0, r0, five
	add	r0, r0, six
	add	r0, r0, seven
	add	r0, r0, eight
	add	r0, r0, nine
.endm

.macro teens
	add	r0, r0, ten
	add	r0, r0, eleven
	add	r0, r0, twelve
	add	r0, r0, thirteen
	add	r0, r0, fourteen
	add	r0, r0, fifteen
	add	r0, r0, sixteen
	add	r0, r0, seventeen
	add	r0, r0, eighteen
	add	r0, r0, nineteen
.endm

.macro tens tenmul
	ldr	r1, =\tenmul
	mov	r2, 10
	mul	r1, r1, r2
	add	r0, r0, r1
	units
.endm

.macro alltens
	teens
	tens	twenty
	tens	thirty
	tens	forty
	tens	fifty
	tens	sixty
	tens	seventy
	tens	eighty
	tens	ninety
.endm

.macro hundreds hundredmul
	ldr	r1, =\hundredmul
	add	r1, r1, hundred
	mov	r2, 100
	mul	r1, r1, r2
	add	r0, r0, r1

	ldr	r1, =and
	mov	r2, 99
	mul	r1, r1, r2
	add	r0, r0, r1

	units
	alltens
.endm

.section .rodata
sum_string:
.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
#	stmfd   sp!, {r4, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	r0, 0
	units
	alltens
	hundreds	one
	hundreds	two
	hundreds	three
	hundreds	four
	hundreds	five
	hundreds	six
	hundreds	seven
	hundreds	eight
	hundreds	nine
	add	r0, r0, one
	add	r0, r0, thousand

	mov	r1, r0
	ldr	r0, =sum_string
	bl	printf

	mov	r0, 0
#	ldmfd   sp!, {r4, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
