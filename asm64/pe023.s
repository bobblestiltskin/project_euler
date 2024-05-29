# this computes projecteuler.net problem 023

.equ	datum_size, 2
.equ	SIZE, 28123

.align 4

.include "regs.s"

aptr		.req x9
wsfcount	.req w9
wsum		.req w10
bptr		.req x10
wnumber		.req w11
wtotal		.req w12
wlast		.req w13
addi		.req x14
wicount		.req w14
wtmp		.req w15

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
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

# store the abundant numbers to the vector array and set the elements corresponding 
# to the sum of the factors in the bit vector abundantbit

	mov	wicount, 1
	mov	wnumber, 0
	ldr	aptr, =array
	ldr	bptr, =bitarray
	ldr	wlast, =SIZE
array_loop:
	mov	w0, wicount

	caller_save_regs_on_stack
	bl	sum_factors
	caller_restore_regs_from_stack

	cmp	w0, wicount
	b.le	array_next
	strh	wicount, [aptr], #datum_size
	add	wnumber, wnumber, 1
	cmp	w0, wlast
	b.ge	array_next
	mov	w1, 1
	strb	w1, [bptr, wicount, uxtw]
array_next:
	add	wicount, wicount, 1
	cmp	wicount, wlast
	b.lt	array_loop

	mov	wtotal, 0
# add all of the integers until we reach the first abundant number
	ldr 	aptr, =array
	ldrh	wtmp, [aptr]

sloop:
	subs	wtmp, wtmp, 1
	add	wtotal, wtotal, wtmp, uxtw
	b.ne	sloop


	ldr	aptr, =array
	ldrh	w0, [aptr]	/* w0 is the index of the outer loop */
ploop:
	ldr	aptr, =array
	ldr	bptr, =bitarray
        mov	addi, 1
	mov	w3, 0		/* w3 is the index of the inner loop */
iloop:
	ldrh	wtmp, [aptr], #datum_size
	cmp	w0, wtmp
	b.lt	ilast
	sub	w1, w0, wtmp
	ldrb	w2, [bptr, w1, uxtw]
	cmp	w2, 1
	b.ne    increment_inner_index
	mov	addi, 0
	b	ilast
increment_inner_index:
	add	w3, w3, 1
	cmp	wnumber, w3
	b.ne	iloop
ilast:
	cmp	addi, 1
	b.ne	no_total_update
	add	wtotal, wtotal, w0
no_total_update:
	add	w0, w0, 1
	cmp	w0, wlast
	b.ne	ploop
printme:
        mov     w1, wtotal
        ldr     x0, =resstring  /* store address of start of string to x0 */
        bl      printf


	mov	x0, #0		/* exit code to 0 */
        ldp	fp, lr, [sp], #0x10
	ret

.global sum_factors
.type   sum_factors, %function
sum_factors:
        stp fp, lr, [sp, #-0x10]!
        mov fp, sp

	mov	wnumber, w0
	mov	wsum, 1
	mov	wsfcount, 2
sf_loop:
	mul	w0, wsfcount, wsfcount
	cmp	w0, wnumber
	b.gt	sf_end
	mov	w0, wnumber
	mov	w1, wsfcount
	bl	divide
	cmp	w1, 0
	b.ne	sf_next
	add	wsum, wsum, w0
	cmp	w0, wsfcount
	b.eq	sf_next
	add	wsum, wsum, wsfcount
sf_next:
	add	wsfcount, wsfcount, 1
	b	sf_loop
sf_end:	
	mov	w0, wsum

        ldp fp, lr, [sp], #0x10
	ret
