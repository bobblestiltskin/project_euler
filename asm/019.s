.syntax unified

.equ	months,48
.equ	cycles,25

tmp             .req r1
scount          .req r4
ccount          .req r5
mcount          .req r6
dow		.req r7
cptr		.req r8

.section .rodata
cycle:
.byte 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

resstring:
.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
        stmfd   sp!, {r4-r8, lr}
	mov	scount, 0
	mov	dow, 2
	ldr	ccount, =cycles
cstart:
	mov	mcount, 0
	ldr	cptr, =cycle
mstart:
	teq	dow, 0
	addeq	scount, scount, 1

	ldrb	tmp, [cptr], 1
	add	r0, dow, tmp
	mov	r1, 7
	bl	divide
	mov	dow, r2

	add	mcount, mcount, 1
	cmp	mcount, months
	blt	mstart
	subs	ccount, ccount, 1
	bne	cstart
last:
	mov	r1, scount
	ldr	r0, =resstring
	bl	printf

        mov     r0, 0
        ldmfd   sp!, {r4-r8, pc}
        mov     r7, 1           @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

# divide takes value in r0, divisor in r1 and returns modulus in r2 and dividend in r3
	.global	divide
	.type	divide, %function
divide:
	mov	r3, 0
divideloop:
	subs	r0, r0, r1
	addge	r3, r3, 1
	bge	divideloop
	add	r2, r0, r1
