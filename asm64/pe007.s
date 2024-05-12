.equ	limit,10000
.equ	limit4,40000

.align 4

number		.req r4
count		.req r5
numprimes	.req r6
primes_ptr	.req r7

.section .bss
.lcomm primes_vector,limit4

.section .rodata
	.align	2
resstring:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
#	stmfd	sp!, {r4-r7, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

        ldr     primes_ptr, =primes_vector
        mov     numprimes, 1
        mov     number, 2
        str     number, [primes_ptr]

	ldr	count, =limit
	mov	number, 3	/* 2 is the first prime */
loop:
        mov     r0, number
        ldr     r1, =primes_vector
        mov     r2, numprimes
        bl      prime_vector
        teq     r0, 1
        bne     nexti
        str     number, [primes_ptr, numprimes, lsl 2]
        add     numprimes, numprimes, 1
	subs	count, count, 1
	beq	printme
nexti:
	add	number, number, 2
	b	loop
	
printme:
	mov	r1, number
	ldr	r0, =resstring	/* store address of start of string to r0 */
	bl	printf

	mov	r0, 0
#	ldmfd	sp!, {r4-r7, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
