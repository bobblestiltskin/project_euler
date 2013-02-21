.syntax unified

.equ	LENGTH,200
.equ	scalar100,100

.section .rodata
sumstring:
.asciz "%d\n"


.section bss
.align	2
.lcomm input,LENGTH
.lcomm output,LENGTH

.text
	.align	2
	.global	main
	.type	main, %function
main:
	mov	r3, 1
	ldr	r0, =input
	strb	r3, [r0]

	ldr	r0, =scalar100
	ldr	r1, =input
	ldr	r2, =output
	bl	factorial

	mov	r2, 0
lstart:
	ldrb	r3, [r0], 1
	add	r2, r2, r3
	subs	r1, r1, 1
	bne	lstart
	
	mov	r1, r2
	ldr	r0, =sumstring
	bl	printf
	
	mov	r0, 0
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
