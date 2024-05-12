# long_divide takes low numerator in r0, high numerator in r1, low denominator in r2 and high denominator in r3
# returns low quotient in r0, high quotient in r1, low remainder in r2 and high remainder in r3
.global	long_divide
.type	long_divide, %function
long_divide:
#        stmfd   sp!, {lr}
        stp fp, lr, [sp, #-0x40]!
        stp x4, x5, [sp, #0x10]
        stp x6, x7, [sp, #0x20]
        stp x8, x9, [sp, #0x30]
        mov fp, sp

# see https://codereview.chromium.org/5302007/diff/12001/arch/arm/lib/_uldivmod.S
	bl	__aeabi_uldivmod
#	ldmfd   sp!, {pc}
        ldp x8, x9, [sp, #0x30]
        ldp x6, x7, [sp, #0x20]
        ldp x4, x5, [sp, #0x10]
        ldp fp, lr, [sp], #0x40

	ret
