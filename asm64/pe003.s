/* 600851475143 is 8BE589EAC7 in hex */

.equ numhi,0x8b
.equ nummid,0xe589
.equ numlo,0xeac7

tmp_div    .req x0
tmp_mul    .req x1

running    .req x4
remainder  .req x5
maxprime   .req x6
count      .req x7

.section .rodata
        .align 2
resstring:
        .asciz "%d\n"
.text
        .align 2
        .global main
        .type main, %function
main:
# stmfd sp!, {r4-r7, lr}
        stp fp, lr, [sp, #-0x30]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        mov fp, sp

        mov maxprime, 0
        mov count, 1
        movz running, numlo
        movk running, nummid, lsl #16
        movk running, numhi, lsl #32
loop:
        add count, count, 2           /* start at 3 and increment by 2 */
loop1:
        udiv tmp_div, running, count
        mul  tmp_mul, tmp_div, count
        sub remainder, running, tmp_mul
        cmp remainder, 0
        b.ne loop
/* save the divisor as the new number */
        mov maxprime, count
        udiv running, running, count
        cmp running, 1
        b.ne loop
printme:
        mov x1, maxprime
        ldr x0, =resstring     /* store address of start of string to r0 */
        bl printf

 mov x0, 0
# ldmfd sp!, {r4-r7, pc}
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x30

	mov	x0, #0		/* exit code to 0 */
	mov     w8, #93		/* set w8 to 93 - the syscall for exit */
        svc	#0		/* then invoke the syscall from linux */
