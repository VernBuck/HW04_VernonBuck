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
	.file	"update.c"
	.text
	.align	2
	.global	gbaCollision
	.type	gbaCollision, %function
gbaCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #16]
	add	r2, r3, r2
	add	r2, r2, r1
	cmp	r2, #160
	movgt	r0, #2
	bxgt	lr
	ldr	r2, [r0, #8]
	cmp	r2, #0
	movlt	r0, #3
	bxlt	lr
	ldr	ip, [r0, #28]
	ldr	r1, [r0, #20]
	add	r2, r2, ip
	add	r2, r2, r1
	cmp	r2, #240
	bgt	.L5
	cmp	r3, #0
	mvnge	r0, #0
	movlt	r0, #0
	bx	lr
.L5:
	mov	r0, #1
	bx	lr
	.size	gbaCollision, .-gbaCollision
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #8]
	str	r2, [r0, #4]
	str	r3, [r0, #12]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L9
	ldr	r2, [r0, #28]
	rsb	r2, r2, #240
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r0, #8]
.L9:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bxne	lr
	ldr	r3, [r0, #8]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, #8]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	collisionCheckObstaclePlayer
	.type	collisionCheckObstaclePlayer, %function
collisionCheckObstaclePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #8]
	ldr	ip, [r1, #28]
	ldr	r2, [r0, #8]
	add	ip, r3, ip
	cmp	r2, ip
	bxgt	lr
	ldr	ip, [r0, #28]
	add	r2, r2, ip
	cmp	r3, r2
	bxgt	lr
	ldr	ip, [r0, #24]
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	add	r2, ip, r2
	cmp	r2, r3
	ldrge	r3, [r0, #16]
	rsbge	r3, r3, #0
	strge	r3, [r0, #16]
	bx	lr
	.size	collisionCheckObstaclePlayer, .-collisionCheckObstaclePlayer
	.align	2
	.global	collisionCheckObstacleTarget
	.type	collisionCheckObstacleTarget, %function
collisionCheckObstacleTarget:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #16]
	cmp	r3, #1
	beq	.L18
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #12]
	ldr	r2, [r0, #8]
	add	ip, r3, ip
	cmp	r2, ip
	bgt	.L18
	ldr	ip, [r0, #28]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L18
	ldr	r3, [r0, #0]
	ldr	ip, [r0, #24]
	ldr	r2, [r1, #0]
	add	ip, r3, ip
	cmp	ip, r2
	blt	.L18
	ldr	ip, [r1, #8]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L19
	ldr	ip, [r0, #16]
	ldr	r2, [r0, #20]
	mov	r3, #1
	rsb	ip, ip, #0
	rsb	r2, r2, #0
	str	ip, [r0, #16]
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [r1, #16]
	bx	lr
.L18:
	mov	r0, #0
	bx	lr
.L19:
	mov	r0, #0
	bx	lr
	.size	collisionCheckObstacleTarget, .-collisionCheckObstacleTarget
	.align	2
	.global	updateBox
	.type	updateBox, %function
updateBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #0]
	add	r5, r0, #16
	ldmia	r5, {r5, r6}	@ phole ldm
	add	ip, r5, r2
	add	r1, r6, r3
	str	r3, [r0, #12]
	str	r2, [r0, #4]
	str	ip, [r0, #0]
	str	r1, [r0, #8]
	mov	r4, r0
	bl	gbaCollision
	cmp	r0, #2
	movne	r3, #0
	moveq	r3, #1
	cmp	r0, #2
	cmpne	r0, #0
	bne	.L21
	rsb	r5, r5, #0
	cmp	r3, #0
	str	r5, [r4, #16]
	bne	.L23
.L22:
	mov	r3, #0
	str	r3, [r4, #32]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L21:
	cmp	r0, #1
	cmpne	r0, #3
	rsbeq	r6, r6, #0
	streq	r6, [r4, #20]
	b	.L22
.L23:
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	b	.L22
.L25:
	.align	2
.L24:
	.word	goToLose
	.size	updateBox, .-updateBox
	.ident	"GCC: (devkitARM release 31) 4.5.0"
