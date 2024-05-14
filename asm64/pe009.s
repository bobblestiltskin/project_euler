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
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

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
        ldr     x0, =resstring  /* store address of start of string to r0 */
        bl      printf

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
