# this computes projecteuler.net problem 023

.equ	datum_size, 2
.equ	SIZE, 28123

.align 4

aptr		.req r4
sfcount		.req r4
sum		.req r5
bptr		.req r5
number		.req r6
total		.req r7
last		.req r8
addi		.req r9
icount		.req r9
tmp		.req r10

.section .bss
.lcomm array,SIZE<<1	/* use 16-bit ints for the list */
.lcomm bitarray,SIZE

.section .rodata
resstring:
        .asciz "%d\n"

.text
.align  2
.global main
.type   main, %function
main:
#        stmfd   sp!, {r4-r10, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

# store the abundant numbers to the vector array and set the elements corresponding 
# to the sum of the factors in the bit vector abundantbit
	mov	icount, 1
	mov	number, 0
	ldr	aptr, =array
	ldr	bptr, =bitarray
	ldr	last, =SIZE
array_loop:
	mov	r0, icount
	bl	sum_factors

	cmp	icount, r0
	bge	array_next
	strhlt	icount, [aptr], #datum_size
	addlt	number, number, 1
	cmp	r0, last
	movlt	r1, 1
	strblt	r1, [bptr, icount]
array_next:
	add	icount, icount, 1
	cmp	icount, last
	blt	array_loop

	mov	total, 0
# add all of the integers until we reach the first abundant number
	ldr 	aptr, =array
	ldrh	tmp, [aptr]
sloop:
	subs	tmp, tmp, 1
	add	total, total, tmp
	bne	sloop

	ldr	aptr, =array
	ldrh	r0, [aptr]	/* r0 is the index of the outer loop */
ploop:
	ldr	aptr, =array
	ldr	bptr, =bitarray
        mov	addi, 1
	mov	r3, 0		/* r3 is the index of the inner loop */
iloop:
	ldrh	tmp, [aptr], #datum_size
	cmp	r0, tmp
	blt	ilast
	sub	r1, r0, tmp
	ldrb	r2, [bptr, r1]
	teq	r2, 1
	moveq	addi, 0
	beq	ilast
	add	r3, r3, 1
	cmp	number, r3
	bne	iloop
ilast:
	teq	addi, 1
	addeq	total, total, r0
	add	r0, r0, 1
	cmp	r0, last
	bne	ploop
printme:
        mov     r1, total
        ldr     r0, =resstring  /* store address of start of string to r0 */
        bl      printf

	mov	r0, 0
#        ldmfd   sp!, {r4-r10, pc}
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
	mov	sfcount, 2
sf_loop:
	mul	r0, sfcount, sfcount
	cmp	r0, number
	bgt	sf_end
	mov	r0, number
	mov	r1, sfcount
	bl	divide
	teq	r1, 0
	bne	sf_next
	add	sum, sum, r0
	cmp	r0, sfcount
	addne	sum, sum, sfcount
sf_next:
	add	sfcount, sfcount, 1
	b	sf_loop
sf_end:	
	mov	r0, sum
#        ldmfd   sp!, {r4-r6, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40
