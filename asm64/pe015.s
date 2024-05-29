# this computes projecteuler.net problem 015

.align 4

.macro factor2 d n
	ldr	i, =start_offset
inext\@:
	ldr	i_ptr, =\d
	add	i_ptr, i_ptr, i
	ldrb	dtmp, [i_ptr], -1
	ldr	j, =start_offset
jnext\@:
	cmp	dtmp, 1
	b.eq	nexti\@
	ldr	j_ptr, =\n
	add	j_ptr, j_ptr, j
	ldrb	ntmp, [j_ptr], -1
	
	cmp	ntmp, dtmp	/* if numerator < denominator use next numerator element */
	b.lt	nextj\@
	mov	tmpw, 0
	mov	w0, 0
mod_start\@:
	add	w0, w0, 1
	add	tmpw, tmpw, dtmp
	cmp	ntmp, tmpw
	b.gt	mod_start\@
	b.lt	nextj\@
	strb	w0, [j_ptr, 1]
	mov	dtmp, 1
	strb	dtmp, [i_ptr, 1]
nextj\@:
	subs	j, j, 1
	b.gt	jnext\@
nexti\@:
	subs	i, i, 1
	b.gt	inext\@
.endm
 
.equ num, 20
.equ start_offset, 19

i		.req x4
j		.req x5
i_ptr		.req x6
j_ptr		.req x7
res		.req x6
tmp		.req x8
tmpw		.req w8
dtmp		.req w9
ntmp		.req w10

.section .data
numerator:
  .byte 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40
denominator:
  .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
.section .rodata
        .align  2
llustring:
        .asciz "%llu\n"
.text
        .align  2
        .global main
        .type   main, %function
main:
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp

	factor2	denominator numerator
nloop:
	ldr	x0, =numerator
	bl	needs_factor
	cmp	x0, 0
	b.eq	printme
	factor2	numerator denominator
	ldr	x0, =denominator
	bl	needs_factor
	cmp	x0, 0
	b.eq	printme
	factor2	denominator numerator
	b	nloop

printme:
	ldr	j, =start_offset
	ldr	j_ptr, =numerator
	add	j_ptr, j_ptr, j
	mov	x0, 1
	mov	x1, 0
mnumerator:
	ldrb	ntmp, [j_ptr], -1
	uxtw	x2, ntmp
	mov	x3, 0
        mul	x0, x0, x2
	subs	j, j, 1
	b.ge	mnumerator
	
        mov     x1, x0
        ldr     x0, =llustring  /* store address of start of string to r0 */
        bl      printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret

        .align  2
        .global needs_factor
        .type   needs_factor, %function
needs_factor:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	ldr	x1, =start_offset
	add	x2, x0, x1
next_byte:
	ldrb	w3, [x2], -1
	cmp	w3, 1
	b.ne	ret1
	subs	x1, x1, 1
	b.ne	next_byte
	mov	x0, 0
	b	leave
ret1:
	mov	x0, 1
leave:
        ldp fp, lr, [sp], #0x10

        ret
