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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, asl #1
	mov	r0, r0, asl #2
	add	r0, r0, #67108864
	add	ip, r0, #176
	orr	r3, r3, #-2147483648
	str	r1, [r0, #176]
	str	r2, [ip, #4]
	str	r3, [ip, #8]
	bx	lr
	.size	DMANow, .-DMANow
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L5
	ldr	ip, .L10
	rsb	r0, r0, r0, asl #4
	ldr	ip, [ip, #0]
	add	r1, r1, r0, asl #4
	orr	r4, r3, #-2130706432
	add	r1, ip, r1, asl #1
	mov	r0, #0
	add	r3, sp, #16
	mov	ip, #67108864
.L7:
	add	r0, r0, #1
	cmp	r0, r2
	str	r3, [ip, #212]
	str	r1, [ip, #216]
	str	r4, [ip, #220]
	add	r1, r1, #480
	bne	.L7
.L5:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	strh	r0, [sp, #6]	@ movhi
	ldr	r3, .L13
	ldrh	r0, [sp, #6]
	ldr	r1, [r3, #0]
	mov	r2, #-2130706432
	strh	r0, [sp, #14]	@ movhi
	mov	r3, #67108864
	add	r2, r2, #38400
	add	r0, sp, #6
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	add	sp, sp, #16
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L16:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L16
	mov	r2, #67108864
.L18:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L18
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
