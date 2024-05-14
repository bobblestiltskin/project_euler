# this computes projecteuler.net problem 018

.equ	maxij, 14
.equ	width, 2
.equ	logwidth, 1

.align 4

iptr		.req r0
tmp		.req r1
icount		.req r4
jcount		.req r5
maxc		.req r6
jptr		.req r7
cell		.req r8

.macro get_element i, j
	ldr	iptr, =last
	mov	r1, \i
	add	iptr, iptr, r1
	sub	iptr, iptr, 1
	ldrb	tmp, [iptr]

	ldr	jptr, =buffer
	add	jptr, jptr, tmp, asl logwidth
	mov	tmp, \j
	add	jptr, jptr, tmp, asl logwidth
	sub	jptr, jptr, width
	ldrh	cell, [jptr]
.endm

.macro update_element i, j
	mov	r2, \i
	add	r2, r2, 1
	mov	r3, \j
	add	r3, r3, 1
	get_element r2 r3
	sub	r3, r3, 1
	mov	maxc, cell
	get_element r2 r3
	cmp	maxc, cell
	movlt	maxc, cell
	sub	r2, r2, 1
	get_element r2 r3
	add	cell, cell, maxc
	strh	cell, [jptr]
.endm

.section .data
last:
.byte 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120

buffer:
.hword 75
.hword 95, 64
.hword 17, 47, 82
.hword 18, 35, 87, 10
.hword 20, 4, 82, 47, 65
.hword 19, 1, 23, 75, 3, 34
.hword 88, 2, 77, 73, 7, 63, 67
.hword 99, 65, 4, 28, 6, 16, 70, 92
.hword 41, 41, 26, 56, 83, 40, 80, 70, 33
.hword 41, 48, 72, 33, 47, 32, 37, 16, 94, 29
.hword 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14
.hword 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57
.hword 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48
.hword 63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31
.hword 4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23

.section .rodata
.align  2
resstring:
        .asciz "%d\n"

.text
.align  2
.global main
.type   main, %function
main:
#        stmfd   sp!, {r4-r8, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	ldr	icount, =maxij
iloop:
	mov	jcount, icount
jloop:
	update_element icount jcount
	subs	jcount, jcount, 1
	bne	jloop
	subs	icount, icount, 1
	bne	iloop
printme:
        mov     r1, cell
        ldr     w0, =resstring  /* store address of start of string to w0 */
        bl      printf

	mov	r0, 0
#        ldmfd   sp!, {r4-r8, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

