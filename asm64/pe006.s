# this computes projecteuler.net problem 006

.equ limit,100

number	.req x4
sumsq	.req x5
sqsum	.req x6
tmp	.req x7

.section .rodata
	.align	2
string:
	.asciz "%d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	mov	sqsum, 0
	mov	sumsq, 0
	ldr	number, =limit
loop:
	mul	tmp, number, number
	add	sqsum, sqsum, tmp
# decrement number and loop or exit
	subs	number, number, 1
	beq	end_loop
	b	loop
end_loop:
	ldr	number, =limit
	add	number, number, 1
	ldr	sumsq, =limit
	mul	sumsq, sumsq, number
	lsr	sumsq, sumsq, 1
	mul	sumsq, sumsq, sumsq
last:
	sub	tmp, sumsq, sqsum 
	mov	x1, tmp
	ldr	x0, =string	/* store address of start of string to r0 */
	bl	printf

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
