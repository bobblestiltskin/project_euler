.syntax unified

# divide takes value in r0, divisor in r1 and returns modulus in r2 and dividend in r3
	.global	divide
	.type	divide, %function
divide:
	mov	r3, 0
divideloop:
	subs	r0, r0, r1
	addge	r3, r3, 1
	bge	divideloop
	add	r2, r0, r1
