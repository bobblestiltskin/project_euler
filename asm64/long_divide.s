.syntax unified
# long_divide takes low numerator in r0, high numerator in r1, low denominator in r2 and high denominator in r3
# returns low quotient in r0, high quotient in r1, low remainder in r2 and high remainder in r3
.global	long_divide
.type	long_divide, %function
long_divide:
        stmfd   sp!, {lr}
# see https://codereview.chromium.org/5302007/diff/12001/arch/arm/lib/_uldivmod.S
	bl	__aeabi_uldivmod
	ldmfd   sp!, {pc}
