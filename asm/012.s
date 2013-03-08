.syntax unified

.align 2

.section .rodata
resstring:
        .asciz "%d\n"

.equ    last, 250

icount		.req r4
jcount		.req r5
tmp		.req r6
num		.req r7

.text
        .align  2
        .global get_num_divisors
        .type   get_num_divisors, %function
get_num_divisors:
        stmfd   sp!, {r4-r7, lr}
	mov	num, r0
	mov	icount, 0
	mov	jcount, 1
jstart:
	mov	r0, num
	mov	r1, jcount
	bl	divide
	teq	r1, 0
	beq	factor
	b	nextj
factor:
	add	icount, icount, 1
nextj:
	add	jcount, jcount, 1
	mul	tmp, jcount, jcount
	cmp	num, tmp
	bgt	jstart
	mov	r0, icount
        ldmfd   sp!, {r4-r7, pc}

        .align  2
        .global main
        .type   main, %function
main:
        stmfd   sp!, {r4-r7, lr}
	mov	num, 0
	mov	icount, 0
	mov	jcount, 1
loop:
	cmp	num, #last
	bge	printme
	add	icount, icount, jcount
	mov	r0, icount
	bl	get_num_divisors
	mov	num, r0

	add	jcount, jcount, 1
	b	loop

printme:
        mov     r1, icount
        ldr     r0, =resstring  @ store address of start of string to r0
        bl      printf

	mov	r0, 0
        ldmfd   sp!, {r4-r7, pc}
        mov     r7, 1		@ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux
