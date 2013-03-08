.syntax unified

@ 600851475143 is 8BE589EAC7 in hex
@ root 600851475143 is 775146.099

.align 4
.equ numhi,139		@ 0x8b
.equ numlo,3851020999	@ 0xe589eac7
.equ root,775147

num_hi		.req r4
num_lo		.req r5
maxdiv		.req r6
n		.req r7
tmp		.req r8

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4-r8, lr}

	mov	maxdiv, 0
	ldr	n, =root
	ldr	num_lo, =numlo
	ldr	num_hi, =numhi
loop:
        ldr     r0, =numlo
        ldr     r1, =numhi
        mov     r2, n
        mov     r3, 0
        bl      long_divide
	mov	tmp, r0
	teq	r2, 0
	bne	nextn
	teq	r3, 0
	bne	nextn
	bl	isprime
	teq	r0, 1
	bne	testn
	cmp	maxdiv, tmp
	movlt	maxdiv, tmp
testn:
	mov	r0, n
	bl	isprime
	teq	r0, 1
	bne	nextn
	cmp	maxdiv, n
	movlt	maxdiv, n
nextn:
	sub	n, n, 2
	teq	n, 1
	beq	printme
	b	loop
printme:
	mov	r1, maxdiv
	ldr	r0, =resstring	@ store address of start of string to r0
	bl	printf

	mov	r0, 0
	ldmfd	sp!, {r4-r8, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
