#I is 71 and DIVI is 8462696833
#I is 839 and DIVI is 716151937
#I is 1471 and DIVI is 408464633
#I is 6857 and DIVI is 87625999
#I is 59569 and DIVI is 10086647
#I is 104441 and DIVI is 5753023
#I is 486847 and DIVI is 1234169

.equ num0,6857
.equ num1,59569
.equ num2,104441
.equ num3,486847
.equ num4,4
.equ num5,4500

.equ numhi,139          /* 0x8b */
.equ numlo,3851020999   /* 0xe589eac7 */

tmp0	.req r4
tmp1	.req r5

.macro long_divide_m num
        ldr     r3, =numhi
        ldr     r2, =numlo
        ldr     r0, =numeratorstring
        bl      printf

        mov     r3, 0
        ldr     r2, =\num
        ldr     r0, =denominatorstring
        bl      printf

	ldr	r0, =numlo
	ldr	r1, =numhi
	ldr	r2, =\num
	mov	r3, 0
	bl	long_divide

	mov	r4, r2
	mov	r5, r3
        mov     r3, r1
        mov     r2, r0
        ldr     r0, =quotientstring
        bl      printf

	mov	r3, r5
	mov	r2, r4
        ldr     r0, =remainderstring
        bl      printf
.endm

.section .rodata
	.align	2
numeratorstring:
	.asciz "numerator is %llu\n"
denominatorstring:
	.asciz "denominator is %llu\n"
quotientstring:
	.asciz "quotient is %llu\n"
remainderstring:
	.asciz "remainder is %llu\n"
r0string:
	.asciz "r0 is %x\n"
r1string:
	.asciz "r1 is %x\n"
r2string:
	.asciz "r2 is %x\n"
r3string:
	.asciz "r3 is %x\n"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	long_divide_m  num0
	long_divide_m  num1
	long_divide_m  num2
	long_divide_m  num3
	long_divide_m  num4
	long_divide_m  num5

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

