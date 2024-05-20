# this computes projecteuler.net problem 021

.equ	SIZE, 10000
.equ	SIZEB, 40000

.align 4

aptr		.req x4
number		.req x4
sum		.req x5
tmp		.req x5
icount		.req x6
total		.req x7
tmp4		.req x8

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
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	icount, 0
	ldr	aptr, =array
array_loop:
	mov	x0, icount
	bl	sum_factors
	str	x0, [aptr], 4
	add	icount, icount, 1
	ldr	tmp, =SIZE
	cmp	icount, tmp
	blt	array_loop

	ldr 	aptr, =array
	mov	tmp, 0
	ldr	icount, =SIZE
	mov	total, 0
ploop:
	add	tmp4, tmp, tmp
	add	tmp4, tmp4, tmp4 /* multiply tmp by 4 */
	ldr	x2, [aptr, tmp4]
#	ldr	x2, [aptr, tmp, lsl 2]
	cmp	x2, icount
	b.ge	pnext
	cmp	tmp, x2
	b.eq	pnext
	add	tmp4, x2, x2
	add	tmp4, tmp4, tmp4 /* multiply x2 by 4 */
#	ldr	x3, [aptr, x2, lsl 2]
	ldr	x3, [aptr, tmp4]
	cmp	tmp, x3
	b.ne	pnext
	add	total, total, tmp
pnext:
	add	tmp, tmp, 1
	cmp	tmp, icount
	bne	ploop
printme:
        mov     x1, total
        ldr     x0, =resstring  /* store address of start of string to r0 */
        bl      printf

        ldp fp, lr, [sp], #0x10

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

.global sum_factors
.type   sum_factors, %function
sum_factors:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

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

        ldp fp, lr, [sp], #0x10
	ret
