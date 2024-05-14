# this computes projecteuler.net problem 021

.equ	SIZE, 10000
.equ	SIZEB, 40000

.align 4

aptr		.req r4
number		.req r4
sum		.req r5
tmp		.req r5
icount		.req r6
total		.req r7

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
#        stmfd   sp!, {r4-r8, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	icount, 0
	ldr	aptr, =array
array_loop:
	mov	r0, icount
	bl	sum_factors
	str	r0, [aptr], 4
	add	icount, icount, 1
	ldr	tmp, =SIZE
	cmp	icount, tmp
	blt	array_loop

	ldr 	aptr, =array
	mov	tmp, 0
	ldr	icount, =SIZE
	mov	total, 0
ploop:
	ldr	r2, [aptr, tmp, lsl 2]
	cmp	r2, icount
	bge	pnext
	teq	tmp, r2
	beq	pnext
	ldr	r3, [aptr, r2, lsl 2]
	teq	tmp, r3
	bne	pnext
	add	total, total, tmp
pnext:
	add	tmp, tmp, 1
	cmp	tmp, icount
	bne	ploop
printme:
        mov     r1, total
        ldr     r0, =resstring  /* store address of start of string to r0 */
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

.global sum_factors
.type   sum_factors, %function
sum_factors:
#        stmfd   sp!, {r4-r6, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

	mov	number, r0
	mov	sum, 1
	mov	icount, 2
sf_loop:
	mul	r0, icount, icount
	cmp	r0, number
	bgt	sf_end
	mov	r0, number
	mov	r1, icount
	bl	divide
	teq	r1, 0
	bne	sf_next
	add	sum, sum, r0
	add	sum, sum, icount
sf_next:
	add	icount, icount, 1
	b	sf_loop
sf_end:	
	mov	r0, sum
#        ldmfd   sp!, {r4-r6, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

#	mov	x0, #0		/* exit code to 0 */
#	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
#        svc	#0		/* then invoke the syscall from linux */
`
