.syntax unified
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
	beq	nexti\@
	ldr	j_ptr, =\n
	add	j_ptr, j_ptr, j
	ldrb	ntmp, [j_ptr], -1
	
	cmp	ntmp, dtmp	@ if numerator < denominator use next numerator element
	blt	nextj\@
	mov	tmp, 0
	mov	r0, 0
mod_start\@:
	add	r0, r0, 1
	add	tmp, tmp, dtmp
	cmp	ntmp, tmp
	bgt	mod_start\@
	blt	nextj\@
	strb	r0, [j_ptr, 1]
	mov	dtmp, 1
	strb	dtmp, [i_ptr, 1]
nextj\@:
	subs	j, j, 1
	bgt	jnext\@
nexti\@:
	subs	i, i, 1
	bgt	inext\@
.endm
 
.equ num, 20
.equ start_offset, 19

i		.req r4
j		.req r5
i_ptr		.req r6
j_ptr		.req r7
res_hi		.req r6
res_lo		.req r7
tmp		.req r8
dtmp		.req r9
ntmp		.req r10

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
        stmfd   sp!, {r4-r10, lr}

	factor2	denominator numerator
nloop:
	ldr	r0, =numerator
	bl	needs_factor
	cmp	r0, 0
	beq	printme
	factor2	numerator denominator
	ldr	r0, =denominator
	bl	needs_factor
	cmp	r0, 0
	beq	printme
	factor2	denominator numerator
	b	nloop

printme:
	ldr	j, =start_offset
	ldr	j_ptr, =numerator
	add	j_ptr, j_ptr, j
	mov	r0, 1
	mov	r1, 0
mnumerator:
	ldrb	ntmp, [j_ptr], -1
	mov	r2, ntmp
	mov	r3, 0
	bl	mul_64to64
	subs	j, j, 1
	bge	mnumerator
	
        mov     r2, r0
        mov     r3, r1
        ldr     r0, =llustring  @ store address of start of string to r0
        bl      printf

        mov     r0, 0
        ldmfd   sp!, {r4-r10, pc}
        mov     r7, 1           @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

        .align  2
        .global needs_factor
        .type   needs_factor, %function
needs_factor:
        stmfd   sp!, {lr}
	ldr	r1, =start_offset
	add	r2, r0, r1
next_byte:
	ldrb	r3, [r2], -1
	cmp	r3, 1
	bne	ret1
	subs	r1, r1, 1
	bne	next_byte
	mov	r0, 0
	b	leave
ret1:
	mov	r0, 1
leave:
        ldmfd   sp!, {pc}
