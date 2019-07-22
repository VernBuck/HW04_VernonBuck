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
	.file	"main.c"
	.text
	.align	2
	.global	sketch
	.type	sketch, %function
sketch:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r0, .L5
	ldr	r7, .L5+4
	mov	lr, pc
	bx	r7
	ldr	r6, .L5+8
	ldr	r5, .L5+12
	mov	r4, #0
.L2:
	add	r0, r4, r4, asl #1
	add	r0, r6, r0, asl #3
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #25
	bne	.L2
	ldr	r0, .L5+16
	mov	lr, pc
	bx	r7
	ldr	r3, .L5+20
	ldr	r1, .L5+24
	ldr	r2, [r3, #0]
	ldr	r0, .L5+28
	ldr	r3, .L5+32
	mov	lr, pc
	bx	r3
	mov	r0, #100
	mov	r1, #50
	ldr	r2, .L5+28
	mov	r3, #31
	ldr	ip, .L5+36
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	paddle
	.word	drawPlayer
	.word	targets
	.word	drawTarget
	.word	ball
	.word	.LANCHOR0
	.word	.LC0
	.word	buffer
	.word	sprintf
	.word	drawString
	.size	sketch, .-sketch
	.align	2
	.global	blockCount
	.type	blockCount, %function
blockCount:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L9
	ldr	ip, .L9+4
	sub	sp, sp, #8
	ldr	r4, [r3, #0]
	ldr	r3, [ip, #0]
	cmp	r3, r4
	beq	.L7
	str	r4, [ip, #0]
	mov	r2, #20
	mov	ip, #0
	str	ip, [sp, #0]
	mov	r0, #100
	mov	r1, #130
	mov	r3, r2
	ldr	ip, .L9+8
	mov	lr, pc
	bx	ip
.L7:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	oldBlocks
	.word	drawRect
	.size	blockCount, .-blockCount
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r0, .L16
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L16+8
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L16+8
	ldr	r1, .L16
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L16+20
	ldr	r5, .L16+24
	ldr	r7, .L16+28
	mov	r4, #0
	b	.L13
.L12:
	cmp	r4, #25
	beq	.L15
.L13:
	add	r1, r4, r4, asl #1
	add	r1, r6, r1, asl #3
	ldr	r0, .L16+8
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	add	r4, r4, #1
	bne	.L12
	ldr	r3, [r7, #0]
	sub	r3, r3, #1
	str	r3, [r7, #0]
	bl	blockCount
	cmp	r4, #25
	bne	.L13
.L15:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	paddle
	.word	updatePlayer
	.word	ball
	.word	updateBox
	.word	collisionCheckObstaclePlayer
	.word	targets
	.word	collisionCheckObstacleTarget
	.word	.LANCHOR0
	.size	update, .-update
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31744
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	fillScreen
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #0
	ldr	r3, .L22
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+4
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	mov	r2, #4
	str	r2, [r3, #0]
	bx	lr
.L26:
	.align	2
.L25:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L32
	mov	r0, #80
	mov	r1, #60
	mov	r2, r4
	mov	r3, #992
	ldr	ip, .L32+4
	mov	lr, pc
	bx	ip
	ldr	ip, .L32+8
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r6, r4
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r5, .L32+12
	ldmia	ip, {r0, r1}
	ldr	r3, [r5, #0]
	mov	r2, r1, lsr #16
	tst	r3, #8
	str	r0, [r6, #0]
	strh	r1, [r4, #20]	@ movhi
	strb	r2, [r4, #22]
	beq	.L28
	ldr	r2, .L32+16
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L30
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L32+16
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L31
.L27:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L31:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToStart
.L30:
	bl	goToGame
	ldr	r3, [r5, #0]
	b	.L28
.L33:
	.align	2
.L32:
	.word	buffer4
	.word	drawString
	.word	.LC1
	.word	oldButtons
	.word	buttons
	.size	updatePause, .-updatePause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	fillScreen
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L40
	mov	r0, #100
	mov	r2, r4
	mov	r1, #80
	mov	r3, #0
	ldr	ip, .L40+4
	mov	lr, pc
	bx	ip
	ldr	r3, .L40+8
	ldmia	r3, {r0, r1, r2}
	ldr	r3, .L40+12
	stmia	r4!, {r0, r1}
	ldr	r3, [r3, #0]
	tst	r3, #8
	strh	r2, [r4, #0]	@ movhi
	beq	.L37
	ldr	r3, .L40+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L39
.L37:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L41:
	.align	2
.L40:
	.word	buffer5
	.word	drawString
	.word	.LC2
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1020
	stmfd	sp!, {r3, lr}
	add	r0, r0, #3
	ldr	r3, .L43
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+4
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	fillScreen
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	update
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	bl	sketch
	ldr	r3, .L49+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L46
	ldr	r3, .L49+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	ldreq	r3, .L49+12
	moveq	r2, #4
	streq	r2, [r3, #0]
.L46:
	ldr	r3, .L49+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L48
	ldmfd	sp!, {r4, lr}
	bx	lr
.L48:
	ldmfd	sp!, {r4, lr}
	b	goToWin
.L50:
	.align	2
.L49:
	.word	waitForVblank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LANCHOR0
	.size	updateGame, .-updateGame
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L52
	mov	r0, #80
	mov	r1, #100
	mov	r2, r4
	mov	r3, #992
	ldr	ip, .L52+4
	mov	lr, pc
	bx	ip
	ldr	r3, .L52+8
	ldmia	r3, {r0, r1, r2}
	mov	r3, r4
	stmia	r3!, {r0, r1}
	strb	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	buffer2
	.word	drawString
	.word	.LC3
	.size	updateWin, .-updateWin
	.align	2
	.global	buildGame
	.type	buildGame, %function
buildGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r0, #1024
	ldr	r3, .L65
	mov	r1, #0
	add	r0, r0, #3
	mov	r7, #67108864
	strh	r0, [r7, #0]	@ movhi
	ldr	r2, .L65+4
	mov	r5, r1
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	mov	r1, #8
	mov	r4, #1
	mov	ip, #120
	mov	lr, #10
	mov	r0, #100
	str	r1, [r3, #24]
	mov	r1, #992	@ movhi
	str	r0, [r2, #0]
	str	r4, [r2, #16]
	str	r4, [r2, #20]
	mov	r8, #30
	mov	r6, #-1258291200
	str	ip, [r2, #8]
	str	lr, [r2, #28]
	str	lr, [r2, #24]
	mov	r0, #150
	strh	r1, [r2, #36]	@ movhi
	mov	r2, #31744	@ movhi
	str	r0, [r3, #0]
	str	ip, [r3, #8]
	str	r8, [r3, #28]
	ldr	r4, .L65+8
	ldr	fp, .L65+12
	ldr	r9, .L65+16
	ldr	sl, .L65+20
	strh	r2, [r3, #36]	@ movhi
	mov	r6, r6, asr #22
	mov	r7, #5
	b	.L60
.L57:
	cmp	r5, #15
	movle	r1, #40
	strle	r1, [r4, #-20]
	strle	r6, [r4, #-16]
	ble	.L63
	cmp	r5, #20
	suble	r3, r6, #150
	movle	r1, #60
	subgt	r3, r6, #300
	movgt	r1, #80
.L62:
	str	r1, [r4, #-20]
	str	r3, [r4, #-16]
.L63:
	str	r8, [r4, #-8]
	str	r7, [r4, #-12]
	mov	lr, pc
	bx	fp
	smull	r3, r2, sl, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	add	r0, r9, r0, asl #1
	ldrh	r0, [r0, #4]
	add	r5, r5, #1
	cmp	r5, #26
	strh	r0, [r4, #0]	@ movhi
	add	r6, r6, #30
	add	r4, r4, #24
	beq	.L64
.L60:
	cmp	r5, #5
	addle	r3, r6, #300
	movle	r1, #0
	ble	.L62
	cmp	r5, #10
	bgt	.L57
	add	r3, r6, #150
	mov	r1, #20
	str	r1, [r4, #-20]
	str	r3, [r4, #-16]
	b	.L63
.L64:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	paddle
	.word	ball
	.word	targets+20
	.word	rand
	.word	.LANCHOR0
	.word	1717986919
	.size	buildGame, .-buildGame
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L70
	mov	r0, #80
	mov	r1, #60
	mov	r2, r4
	mov	r3, #992
	ldr	ip, .L70+4
	mov	lr, pc
	bx	ip
	ldr	ip, .L70+8
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r5, r4
	stmia	r5!, {r0, r1, r2, r3}
	ldr	r2, .L70+12
	ldr	r2, [r2, #0]
	ldmia	ip, {r0, r1}
	tst	r2, #8
	str	r0, [r5, #0]
	strb	r1, [r4, #20]
	beq	.L67
	ldr	r3, .L70+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L69
.L67:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L69:
	bl	buildGame
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToGame
.L71:
	.align	2
.L70:
	.word	buffer3
	.word	drawString
	.word	.LC4
	.word	oldButtons
	.word	buttons
	.size	updateStart, .-updateStart
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	buildGame
	bl	goToStart
	ldr	r4, .L84
	ldr	r7, .L84+4
	ldr	r6, .L84+8
	mov	r5, #67108864
.L83:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L74:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L74
.L80:
	.word	.L75
	.word	.L76
	.word	.L77
	.word	.L78
	.word	.L79
.L79:
	bl	updatePause
	b	.L83
.L78:
	bl	updateWin
	b	.L83
.L77:
	bl	updateLose
	b	.L83
.L76:
	bl	updateGame
	b	.L83
.L75:
	bl	updateStart
	b	.L83
.L85:
	.align	2
.L84:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	color
	.global	numBlocks
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	paddle,40,4
	.comm	ball,40,4
	.comm	targets,600,4
	.comm	buffer,41,4
	.comm	buffer2,41,4
	.comm	buffer3,41,4
	.comm	buffer4,41,4
	.comm	buffer5,41,4
	.comm	oldBlocks,4,4
	.comm	state,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	numBlocks, %object
	.size	numBlocks, 4
numBlocks:
	.word	25
	.type	color, %object
	.size	color, 10
color:
	.short	31
	.short	31744
	.short	992
	.short	32767
	.short	1023
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"# of blocks:  %d\000"
	.space	3
.LC1:
	.ascii	"PRESS START TO RESUME!\000"
	.space	1
.LC2:
	.ascii	"YOU LOSE!\000"
	.space	2
.LC3:
	.ascii	"YOU WIN!\000"
	.space	3
.LC4:
	.ascii	"PRESS START TO PLAY!\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
