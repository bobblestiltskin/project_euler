# this computes projecteuler.net problem 003

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
	stp     fp, lr, [sp, #-0x10]!
	mov     fp, sp

        mov maxprime, 0
        mov count, 1
        movz running, numlo /* jiggery-pokery to load a 64 bit constant or 2^40 as here specifically */
        movk running, nummid, lsl #16
        movk running, numhi, lsl #32
loop:
        add count, count, 2           /* start at 3 and increment by 2 */
loop1:
        udiv tmp_div, running, count /* this divide is done to find the remainder */
        mul  tmp_mul, tmp_div, count
        sub remainder, running, tmp_mul
        cmp remainder, 0
        b.ne loop
        mov maxprime, count
        udiv running, running, count
        cmp running, 1
        b.ne loop
printme:
        mov x1, maxprime
        ldr x0, =resstring     /* store address of start of string to x0 */
        bl printf

	ldp     fp, lr, [sp], #0x10
        mov     x0, #0          /* exit code to 0 */
	ret
