# this computes projecteuler.net problem 019

.equ	months,48
.equ	cycles,25

tmp             .req w1
scount          .req w4
ccount          .req w5
mcount          .req w6
dow		.req w7
cptr		.req x8 /* 64bit pointer */

.section .rodata
cycle:
.byte 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

resstring:
.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	mov	scount, 0
	mov	dow, 2
	ldr	ccount, =cycles
cstart:
	mov	mcount, 0
	ldr	cptr, =cycle
mstart:
	cmp	dow, 0
	b.ne	not_sunday
	add	scount, scount, 1

not_sunday:
	ldrb	tmp, [cptr], 1
	add	w0, dow, tmp
	mov	w1, 7
	bl	divide
	mov	dow, w1

	add	mcount, mcount, 1
	cmp	mcount, months
	b.lt	mstart
	subs	ccount, ccount, 1
	b.ne	cstart
last:
	mov	w1, scount
	ldr	x0, =resstring
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
