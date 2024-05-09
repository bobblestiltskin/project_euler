.syntax unified

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
	stmfd	sp!, {r4-r7, lr}

        ldr     primes_ptr, =primes_vector
        mov     numprimes, 1
        mov     number, 2
        str     number, [primes_ptr]

	ldr	count, =limit
	mov	number, 3	@ 2 is the first prime
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
	ldr	r0, =resstring	@ store address of start of string to r0
	bl	printf

	mov	r0, 0
	ldmfd	sp!, {r4-r7, pc}
	mov	r7, 1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
