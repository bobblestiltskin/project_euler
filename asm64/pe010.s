.equ    word,4
.equ    logword,2

.equ	limit,2000000
.equ	numprimes8,1191464

sum		.req x4
numprimes       .req x6
primes_ptr      .req x7
number		.req x8
limit		.req x9

.align 2

.section .bss
.lcomm primes_vector,numprimes8

.section .rodata
	.align	2
llustring:
	.asciz "%llu\n"

.text
.align	8
	.global	main
	.type	main, %function
main:
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp


        ldr     primes_ptr, =primes_vector
        mov     numprimes, 1
        mov     number, 2
        str	number, [primes_ptr]
	ldr	limit, =limit
	mov	sum, 2
        mov     number, 3
loop:
	cmp	number, limit
	bge	printme

	mov	x0, number
	ldr	x1, =primes_vector
	mov	x2, numprimes
	bl	prime_vector
	cmp	x0, 1
	bne	nexti
        str     number, [primes_ptr, #8]!
        add	numprimes, numprimes, 1
	add	sum, sum, number
nexti:
	add	number, number, 2
	b	loop
printme:
	mov	x1, sum
	ldr	x0, =llustring	/* store address of start of string to r0 */
	bl	printf

        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
