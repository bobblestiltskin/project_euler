.syntax unified

@ 600851475143 is 8BE589EAC7 in hex

.equ numhi,139        @ 0x8b
.equ numlo,3851020999 @ 0xe589eac7

num_hi  .req r4
num_lo  .req r5
maxdiv  .req r6
n       .req r7

.section .rodata
 .align 2
resstring:
 .asciz "%d\n"
.text
 .align 2
 .global main
 .type main, %function
main:
 stmfd sp!, {r4-r7, lr}

 mov maxdiv, 0
 mov n, 1
 ldr num_lo, =numlo
 ldr num_hi, =numhi
loop:
 add n, n, 2           @ start at 3 and increment by 2
loop1:
 mov r0, num_lo
 mov r1, num_hi
 mov r2, n
 mov r3, 0
 bl  long_divide
 teq r2, 0
 bne loop
 teq r3, 0
 bne loop
 mov num_lo, r0         @ only get here when we have no remainder
 mov num_hi, r1         @ save the divisor as the new number
 mov r0, n
 bl isprime
 teq r0, 1
 bne loop               @ increment n if n is non-prime
 cmp maxdiv, n
 movlt maxdiv, n        @ save n as the largest divisor if it is larger
 teq num_lo, 1          @ we know it has prime factors
 beq printme
 b loop1
printme:
 mov r1, maxdiv
 ldr r0, =resstring     @ store address of start of string to r0
 bl printf

 mov r0, 0
 ldmfd sp!, {r4-r7, pc}
 mov r7, 1              @ set r7 to 1 - the syscall for exit
 swi 0                  @ then invoke the syscall from linux
