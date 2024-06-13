# this computes projecteuler.net problem 021

.equ	WORDSIZE, 8
.equ	LOGWORDSIZE, 3
.equ	SIZEB, 80000
.equ	SIZE, 10000

.include "regs.s"

.align 4

aptr		.req x9
number		.req x9
sum		.req x10
tmp		.req x10
icount		.req x11
total		.req x12

.section .bss
.lcomm array,SIZEB

.section .rodata
resstring:
        .asciz "%d\n"

.text
.align  2
.global main
.type   main, %function
main:
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	mov	icount, 0
	ldr	aptr, =array
array_loop:
	mov	x0, icount

	caller_save_regs_on_stack
	bl	sum_factors
	caller_restore_regs_from_stack

	str	x0, [aptr], WORDSIZE
	add	icount, icount, 1
	ldr	tmp, =SIZE
	cmp	icount, tmp
	b.lt	array_loop

	ldr 	aptr, =array
	mov	tmp, 0
	ldr	icount, =SIZE
	mov	total, 0
ploop:
	ldr	x2, [aptr, tmp, lsl LOGWORDSIZE]
	cmp	x2, icount
	b.ge	pnext
	cmp	tmp, x2
	b.eq	pnext
	ldr	x3, [aptr, x2, lsl LOGWORDSIZE]
	cmp	tmp, x3
	b.ne	pnext
	add	total, total, tmp
pnext:
	add	tmp, tmp, 1
	cmp	tmp, icount
	b.ne	ploop
printme:
        mov     x1, total
        ldr     x0, =resstring  /* store address of start of string to r0 */
        bl      printf

	mov	x0, #0		/* exit code to 0 */
        ldp	fp, lr, [sp], #0x10
	ret

.global sum_factors
.type   sum_factors, %function
sum_factors:
        stp	fp, lr, [sp, #-0x10]!
        mov	fp, sp

	mov	number, x0
	mov	sum, 1
	mov	icount, 2
sf_loop:
	mul	x0, icount, icount
	cmp	x0, number
	b.gt	sf_end
	mov	x0, number
	mov	x1, icount
	bl	divide
	cmp	x1, 0
	b.ne	sf_next
	add	sum, sum, x0
	add	sum, sum, icount
sf_next:
	add	icount, icount, 1
	b	sf_loop
sf_end:	
	mov	x0, sum

        ldp	fp, lr, [sp], #0x10
	ret
