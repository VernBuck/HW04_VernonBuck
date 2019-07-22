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
	.file	"sketch.c"
	.text
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	ip, #0
	ldr	r1, [r4, #12]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r0, #4]
	ldr	r5, .L2
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #36]
	ldr	r0, [r4, #0]
	ldr	r1, [r4, #8]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawTarget
	.type	drawTarget, %function
drawTarget:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L8
	ldrh	ip, [r0, #20]
	ldr	lr, [r0, #0]
	ldmib	r0, {r1, r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L9
	mov	lr, pc
	bx	ip
.L4:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L8:
	ldr	ip, [r0, #0]
	ldmib	r0, {r1, r2, r3}	@ phole ldm
	mov	r0, ip
	mov	ip, #0
	str	ip, [sp, #0]
	ldr	ip, .L9
	mov	lr, pc
	bx	ip
	b	.L4
.L10:
	.align	2
.L9:
	.word	drawRect
	.size	drawTarget, .-drawTarget
	.ident	"GCC: (devkitARM release 31) 4.5.0"
