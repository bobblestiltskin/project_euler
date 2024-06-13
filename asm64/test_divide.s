.equ num0,7830
.equ num3,783
.equ num7,7847
.equ num8,78
.equ num9,7

.macro remainder num
	ldr	x1, =\num
	mov	x2, 7
	ldr	x0, =numstring
	bl	printf

	ldr	x0, =\num
	mov	x1, 7
	bl	divide
	mov	x2, x0
	ldr	x0, =remainderstring
	bl	printf
.endm

.section .rodata
	.align	2
numstring:
	.asciz "num is %d, dividing by %d\n"
remainderstring:
	.asciz "remainder is %d and dividend is %d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	remainder  num0
	remainder  num7
	remainder  num3
	remainder  num8
	remainder  num9

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
