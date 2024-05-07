# long long mul_64to64 (long long b, long long c)

b_0 .req r0	@ b bits [31:00]  (b low)
b_1 .req r1	@ b bits [63:32]  (b high)
c_0 .req r2	@ c bits [31:00]  (c low)
c_1 .req r3	@ c bits [63:32]  (c high)
a_0 .req r4	@ a bits [31:00]  (a low-low)
a_1 .req r5	@ a bits [63:32]  (a low-high)

.globl mul_64to64
.align 2
	.text
mul_64to64:

	nop
	stmfd sp!, {r4, r5, lr}		@ 64-bit a = 64-bit b * 64-bit c

	umull a_0, a_1, b_0, c_0	@ low*low
	mla a_1, b_0, c_1, a_1		@ low*high
	mla a_1, b_1, c_0, a_1 		@ high*low
					@ return wrapper
	mov r0, a_0
	mov r1, a_1

	ldmfd sp!, {r4, r5, pc}
