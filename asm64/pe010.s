.equ    word,4
.equ    logword,2

.equ	limit,2000000
.equ	numprimes4,595732

sum_hi		.req r4
sum_lo		.req r5
numprimes       .req r6
primes_ptr      .req r7
number		.req r8
limit		.req r9

.align 2

.section .bss
.lcomm primes_vector,numprimes4

.section .rodata
	.align	2
llustring:
	.asciz "%llu\n"

.text
.align	8
	.global	main
	.type	main, %function
main:
#	stmfd	sp!, {r4-r9, fp, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp


        ldr     primes_ptr, =primes_vector
        mov     numprimes, 1
        mov     number, 2
        strb    number, [primes_ptr]
	ldr	limit, =limit
        mov	sum_hi, 0
	mov	sum_lo, 2
        mov     number, 3
loop:
	cmp	number, limit
	bge	printme

	mov	r0, number
	ldr	r1, =primes_vector
	mov	r2, numprimes
	bl	prime_vector
	teq	r0, 1
	bne	nexti
        str	number, [primes_ptr, numprimes, lsl 2]
        add	numprimes, numprimes, 1
	adds	sum_lo, sum_lo, number
	adc	sum_hi, sum_hi, 0
nexti:
	add	number, number, 2
	b	loop
printme:
	mov	r2, sum_lo
	mov	r3, sum_hi
	ldr	r0, =llustring	/* store address of start of string to r0 */
	bl	printf

	mov	r0, 0
#	ldmfd	sp!, {r4-r9, fp, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
