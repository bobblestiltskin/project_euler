#.equ compare2,815518

number		.req r4

.macro compare_strings a b c d
	ldr	r0, =\a
	mov	r1, \b
	ldr	r2, =\c
	mov	r3, \d
	bl	compare

	ldr	r1, =\a
	ldr	r2, =\c
	mov	r3, r0
	ldr	r0, =comparestring
	bl	printf
.endm

.section .rodata
bob:
	.asciz "bob"
boob:
	.asciz "boob"
bobble:
	.asciz "bobble"
cat:
	.asciz "cat"
cattle:
	.asciz "cattle"
comparestring:
	.asciz "string1 is %s and string2 is %s comparison is %d\n"
linda:
	.asciz "LINDA"
lisa:
	.asciz "LISA"

.text
	.align	2
	.global	main
	.type	main, %function
main:
	compare_strings bob 3 boob 4
	compare_strings boob 4 bob 3 
	compare_strings bob 3 bobble 6
	compare_strings bobble 6 bob 3 
	compare_strings bobble 6 boob 4
	compare_strings boob 4 bobble 6 
	compare_strings bob 3 cat 3
	compare_strings cat 3 bob 3 
	compare_strings cattle 6 cat 3
	compare_strings cat 3 cattle 6 
	compare_strings bob 3 bob 3 
	compare_strings cat 3 cat 3
	compare_strings lisa 4 linda 5
	compare_strings linda 5 lisa 4 

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */

