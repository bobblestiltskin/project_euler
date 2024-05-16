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
	add	x0, x0, one
	add	x0, x0, two
	add	x0, x0, three
	add	x0, x0, four
	add	x0, x0, five
	add	x0, x0, six
	add	x0, x0, seven
	add	x0, x0, eight
	add	x0, x0, nine
.endm

.macro teens
	add	x0, x0, ten
	add	x0, x0, eleven
	add	x0, x0, twelve
	add	x0, x0, thirteen
	add	x0, x0, fourteen
	add	x0, x0, fifteen
	add	x0, x0, sixteen
	add	x0, x0, seventeen
	add	x0, x0, eighteen
	add	x0, x0, nineteen
.endm

.macro tens tenmul
	ldr	x1, =\tenmul
	mov	x2, 10
	mul	x1, x1, x2
	add	x0, x0, x1
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
	ldr	x1, =\hundredmul
	add	x1, x1, hundred
	mov	x2, 100
	mul	x1, x1, x2
	add	x0, x0, x1

	ldr	x1, =and
	mov	x2, 99
	mul	x1, x1, x2
	add	x0, x0, x1

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
	mov	x0, 0
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
	add	x0, x0, one
	add	x0, x0, thousand

	mov	x1, x0
	ldr	x0, =sum_string
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
