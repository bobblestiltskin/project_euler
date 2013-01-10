.syntax unified

@ 600851475143 is 8BE589EAC7 in hex
@ root 600851475143 is 775146.099

.align 4
.equ numhi,139		@ 0x8b
.equ numlo,3851020999	@ 0xe589eac7
.equ root,775146

@ factorisation algorithm 
@ initialise m and n to 775146 then increment n until m*n >= x
@ if m*n == x then we have found 2 factors - both m and n so we
@ can check if either is prime 
@ else we decrement m and n and then start to increment n until
@ our termination condition is met.

num_hi		.req r4
num_lo		.req r5
m		.req r6
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
	stmfd	sp!, {r4-r9, lr}

	ldr	m, =root
	ldr	n, =root
	ldr	tmp, =numlo
loop:
	umull	num_lo, num_hi, m, n
	cmp	num_hi, #numhi
	bgt	decrement_m
	blt	increment_n
	cmp	num_lo, tmp
	blt	increment_n
	bgt	decrement_m

	mov	r0, n
	bl	isprime
	teq	r0, 1
	moveq	r1, n
	beq	printme

	mov	r0, m
	bl	isprime
	teq	r0, 1
	moveq	r1, m
	beq	printme

increment_n:
	add	n,n,1
	b	loop

decrement_m:
	subs	m,m,1
	subgt	n,n,1
	b	loop
	
printme:
	ldr	r0, =resstring	@ store address of start of string to r0
	bl	printf

	mov	r0, 0
	ldmfd	sp!, {r4-r9, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
