.macro long_mul_and_keep val
	ldr	thisbyte, =\val
        umull   tmp_lo, tmp_hi, input_lo, thisbyte /* multiply 64 bit tmp */
        mla     tmp_hi, input_hi, thisbyte, tmp_hi /* by thisbyte */

        mov     r2, tmp_lo
        mov     r3, tmp_hi
        ldr     r0, =llustring  /* store address of start of string to r0 */
        bl      printf

        cmp     maxv_lo, tmp_lo                 /* compare 2 64 bit numbers */
        sbcs    tmp, maxv_hi, tmp_hi            /* low then high halves */
        movlt   maxv_lo, tmp_lo
        movlt   maxv_hi, tmp_hi

        mov     r2, maxv_lo
        mov     r3, maxv_hi
        ldr     r0, =maxvstring  /* store address of start of string to r0 */
        bl      printf
.endm

.equ four,4
.equ one,1
.equ six,6
.equ two,2

.equ numhi,139          /* 0x8b
.equ numlo,3851020999   /* 0xe589eac7

thisbyte	.req r4
tmp		.req r4
maxv_lo		.req r5
maxv_hi		.req r6
input_lo	.req r7
input_hi	.req r8
tmp_lo	.req r9
tmp_hi	.req r10

.section .rodata
	.align	2
llustring:
	.asciz "llu is %llu\n"
inputstring:
	.asciz "input is %llu\n"
maxvstring:
	.asciz "maxv is %llu\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
#        stmfd   sp!, {r4-r10, lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp


	ldr	input_lo, =numlo
	ldr	input_hi, =numhi
	ldr	tmp_lo, =one
	mov	tmp_hi, 0
	mov	maxv_lo, 0
	mov	maxv_hi, 0
	
        mov     r2, input_lo
        mov     r3, input_hi
        ldr     r0, =inputstring  /* store address of start of string to r0 */
        bl      printf

	long_mul_and_keep four
	long_mul_and_keep one
	long_mul_and_keep six
	long_mul_and_keep two

        mov     r2, maxv_lo
        mov     r3, maxv_hi
        ldr     r0, =maxvstring  /* store address of start of string to r0 */
        bl      printf

        mov     r0, 0
#        ldmfd   sp!, {r4-r10, pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
