	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	sketch
	.type	sketch, %function
sketch:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L2
	ldr	r4, .L2+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L2+8
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	paddle
	.word	drawPlayer
	.word	ball
	.size	sketch, .-sketch
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L5
	ldr	r5, .L5+4
	mov	r0, r4
	ldr	r3, .L5+8
	mov	lr, pc
	bx	r3
	mov	r0, r5
	ldr	r3, .L5+12
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	r1, r4
	ldr	r3, .L5+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	paddle
	.word	ball
	.word	updatePlayer
	.word	updateBox
	.word	collisionCheckObstaclePlayer
	.size	update, .-update
	.align	2
	.global	buildGame
	.type	buildGame, %function
buildGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1024
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r3, .L8
	add	r1, r1, #3
	mov	r7, #67108864
	strh	r1, [r7, #0]	@ movhi
	mov	r1, #150
	ldr	r2, .L8+4
	str	r1, [r3, #0]
	mov	r1, #8
	mov	r0, #30
	mov	r4, #120
	mvn	r6, #0
	mov	r5, #5
	str	r1, [r3, #24]
	mov	r1, #992	@ movhi
	mov	ip, #0
	str	r0, [r2, #0]
	str	r4, [r2, #8]
	str	r6, [r2, #16]
	str	r6, [r2, #20]
	str	r5, [r2, #28]
	str	r5, [r2, #24]
	strh	r1, [r2, #36]	@ movhi
	mov	r2, #31744	@ movhi
	str	r4, [r3, #8]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #28]
	strh	r2, [r3, #36]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L9:
	.align	2
.L8:
	.word	paddle
	.word	ball
	.size	buildGame, .-buildGame
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	buildGame
	ldr	r6, .L13
	ldr	r5, .L13+4
	ldr	r4, .L13+8
.L11:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	b	.L11
.L14:
	.align	2
.L13:
	.word	update
	.word	sketch
	.word	waitForVblank
	.size	game, .-game
	.global	colars
	.comm	paddle,40,4
	.comm	ball,40,4
	.comm	target,24,4
	.data
	.align	2
	.type	colars, %object
	.size	colars, 10
colars:
	.short	31
	.short	992
	.short	31744
	.short	32767
	.short	1023
	.ident	"GCC: (devkitARM release 31) 4.5.0"
