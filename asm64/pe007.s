# this computes projecteuler.net problem 007

.equ	limit,10000
.equ	limit8,80000

.align 4

number		.req x20
count		.req x21
numprimes	.req x22
primes_ptr	.req x23
new_ptr		.req x24

.section .bss
.lcomm primes_vector,limit8

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp
        ldr     primes_ptr, =primes_vector
        mov     numprimes, 1
        mov     number, 2
        str     number, [primes_ptr]

	ldr	count, =limit
	mov	number, 3	/* 2 is the first prime */
loop:
        mov     x0, number
        ldr     x1, =primes_vector
        mov     x2, numprimes
        bl      prime_vector
        cmp     x0, 1
        bne     nexti

        str     number, [primes_ptr, #8]!
        add     numprimes, numprimes, 1

	subs	count, count, 1
	beq	printme
nexti:
	add	number, number, 2
	b	loop
	
printme:
	mov	x1, number
	ldr	x0, =resstring	/* store address of start of string to x0 */
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	ldp     fp, lr, [sp], #0x10
	ret
