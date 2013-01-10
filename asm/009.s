.syntax unified

.equ    limit,1000

.align 4

icount	.req r4
jcount	.req r5
kcount	.req r6
tmp	.req r8
jksum	.req r9

.section .rodata
        .align  2
resstring:
        .asciz "%d\n"
.text
        .align  2
        .global main
        .type   main, %function
main:
        stmfd   sp!, {r4-r9, lr}
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
        mov     r1, tmp
        ldr     r0, =resstring  @ store address of start of string to r0
        bl      printf

	mov	r0, 0
        ldmfd   sp!, {r4-r9, pc}
        mov     r7, 1           @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

