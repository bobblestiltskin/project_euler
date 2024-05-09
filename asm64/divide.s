.syntax unified
# divide takes value in r0, divisor in r1 and returns dividend in r0 and modulus in r1 
	.global	divide
	.type	divide, %function
divide:
        stmfd   sp!, {lr}
# see http://infocenter.arm.com/help/topic/com.arm.doc.ihi0043d/IHI0043D_rtabi.pdf
	bl	__aeabi_uidivmod
	ldmfd   sp!, {pc}
