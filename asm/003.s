.syntax unified

@ 600851475143 is 8BE589EAC7 in hex

.align 4
.equ numhi,139		@ 0x8b
.equ numlo,3851020999	@ 0xe589eac7

num_hi		.req r4
num_lo		.req r5
maxdiv		.req r6
n		.req r7
tmp		.req r8

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"
tmpstring:
	.asciz "n : %u, tmp : %u and num_lo : %#x and num_hi is %#x\n"
numstring:
#	.asciz "n is %d and num : %#llx\n"
	.asciz "n is %d and num : %llu\n"
nstring:
	.asciz "n : %d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {r4-r8, lr}

	mov	maxdiv, 0
	mov	n, 3
	ldr	num_lo, =numlo
	ldr	num_hi, =numhi
loop:
        mov     r0, num_lo
        mov     r1, num_hi
        mov     r2, n
        mov     r3, 0
        bl      long_divide
	teq	r2, 0
	bne	nextn
	teq	r3, 0
	bne	nextn
	mov	num_lo, r0       @ only get here when we have no remainder
	mov	num_hi, r1       @ save the dividend as the new number
	mov	r0, n
	bl	isprime
	teq	r0, 1
	cmp	maxdiv, n
	movlt	maxdiv, n        @ save n as the largest divisor if it is larger
	mul	tmp, n, n

        ldr     r0, =tmpstring
        mov     r1, n
        mov     r2, tmp
	mov	r3, num_lo
	mov	r4, num_hi
	bl	printf
	ldr	r0, =numstring
	mov	r1, n
	mov	r2, num_lo
	mov	r3, num_hi
	bl	printf
	cmp	num_lo, 0
	blt	nextn
	cmp	num_lo, tmp
	blt	printme
nextn:
	add	n, n, 2
	b	loop
printme:
	mov	r0, num_lo
	bl	isprime
	teq	r0, 1
	cmp	maxdiv, num_lo
	movlt	maxdiv, num_lo
	mov	r1, maxdiv
	ldr	r0, =resstring	@ store address of start of string to r0
	bl	printf

	mov	r0, 0
	ldmfd	sp!, {r4-r8, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
