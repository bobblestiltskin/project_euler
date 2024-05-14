# this computes projecteuler.net problem 009

.equ    limit,1000

.align 4

icount	.req x4
jcount	.req x5
kcount	.req x6
tmp	.req x8
jksum	.req x9

.section .rodata
        .align  2
resstring:
        .asciz "%d\n"
.text
        .align  2
        .global main
        .type   main, %function
main:
	ldr	icount, =limit
istart:
	subs	jcount, icount, 1
	beq	nexti
jstart:
	subs	kcount, jcount, 1
	beq	nextj
	add	tmp, icount, jcount
kstart:
	add	tmp, tmp, kcount
	cmp	tmp, #limit
	bne	nextk
	mul	jksum, kcount, kcount
	mul	tmp, jcount, jcount
	add	jksum, jksum, tmp
	mul	tmp, icount, icount
	cmp	jksum, tmp
	beq	printme
nextk:
	add	tmp, icount, jcount
	subs	kcount, kcount, 1
	bne	kstart
nextj:
	subs	jcount, jcount, 1
	bne	jstart
nexti:
	subs	icount, icount, 1
	bne	istart
printme:
	mul	tmp, icount, jcount
	mul	tmp, tmp, kcount
        mov     x1, tmp
        ldr     x0, =resstring  /* store address of start of string to x0 */
        bl      printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
