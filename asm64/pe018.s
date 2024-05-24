# this computes projecteuler.net problem 018

.equ	maxij, 14
.equ	width, 2
.equ	logwidth, 1

.align 4

iptr		.req x0
tmpw		.req w1
tmp		.req x1
icount		.req x4
jcount		.req x5
maxc		.req x6
jptr		.req x7
cellw		.req w8
cell		.req x8

.macro get_element i, j
	ldr	iptr, =last
	mov	x1, \i
	add	iptr, iptr, x1
	sub	iptr, iptr, 1
	ldrb	tmpw, [iptr]
	uxtw	tmp, tmpw

	ldr	jptr, =buffer
	add	jptr, jptr, tmp, lsl #logwidth
	mov	tmp, \j
	add	jptr, jptr, tmp, lsl #logwidth
	sub	jptr, jptr, width
	ldrh	cellw, [jptr]
	sxtw	cell, cellw
.endm

.macro update_element i, j
	mov	x2, \i
	add	x2, x2, 1
	mov	x3, \j
	add	x3, x3, 1
	get_element x2 x3
	sub	x3, x3, 1
	mov	maxc, cell
	get_element x2 x3
	cmp	maxc, cell
	b.ge	maxc_bigger
	mov	maxc, cell
maxc_bigger:
	sub	x2, x2, 1
	get_element x2 x3
	add	cell, cell, maxc
	strh	cellw, [jptr]
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
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp
	ldr	icount, =maxij
iloop:
	mov	jcount, icount
jloop:
	update_element icount jcount
	subs	jcount, jcount, 1
	b.ne	jloop
	subs	icount, icount, 1
	b.ne	iloop
printme:
        mov     x1, cell
        ldr     x0, =resstring  /* store address of start of string to w0 */
        bl      printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret
