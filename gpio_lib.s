	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"gpio_lib.c"
	.global	SUNXI_PIO_BASE
	.bss
	.align	2
	.type	SUNXI_PIO_BASE, %object
	.size	SUNXI_PIO_BASE, 4
SUNXI_PIO_BASE:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"/dev/mem\000"
	.text
	.align	2
	.global	sunxi_gpio_init
	.thumb
	.thumb_func
	.type	sunxi_gpio_init, %function
sunxi_gpio_init:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #8
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	movs	r1, #2
	bl	open
	str	r0, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bge	.L2
	mov	r3, #-1
	b	.L3
.L2:
	movs	r0, #30
	bl	sysconf
	mov	r3, r0
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	negs	r3, r3
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	mov	r3, #2048
	movt	r3, 450
	ands	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	mvns	r2, r3
	mov	r3, #2048
	movt	r3, 450
	ands	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #16]
	lsls	r1, r3, #1
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #20]
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r0, #0
	movs	r2, #3
	movs	r3, #1
	bl	mmap
	str	r0, [r7]
	ldr	r3, [r7]
	cmp	r3, #-1
	bne	.L4
	mov	r3, #-1
	b	.L3
.L4:
	ldr	r2, [r7]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	str	r2, [r3]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	add	r2, r2, r3
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	str	r2, [r3]
	ldr	r0, [r7, #20]
	bl	close
	movs	r3, #0
.L3:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	sunxi_gpio_init, .-sunxi_gpio_init
	.align	2
	.global	sunxi_gpio_set_cfgpin
	.thumb
	.thumb_func
	.type	sunxi_gpio_set_cfgpin, %function
sunxi_gpio_set_cfgpin:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #36
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #5
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	and	r3, r3, #31
	lsrs	r3, r3, #3
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	and	r3, r3, #7
	lsls	r3, r3, #2
	str	r3, [r7, #20]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L6
	mov	r3, #-1
	b	.L7
.L6:
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r2, [r7, #28]
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #24]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	movs	r2, #15
	lsl	r3, r2, r3
	mvns	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldr	r2, [r7]
	lsl	r3, r2, r3
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #12]
	str	r1, [r3, r2, lsl #2]
	movs	r3, #0
.L7:
	mov	r0, r3
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	sunxi_gpio_set_cfgpin, .-sunxi_gpio_set_cfgpin
	.align	2
	.global	sunxi_gpio_get_cfgpin
	.thumb
	.thumb_func
	.type	sunxi_gpio_get_cfgpin, %function
sunxi_gpio_get_cfgpin:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #36
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #5
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	and	r3, r3, #31
	lsrs	r3, r3, #3
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	and	r3, r3, #7
	lsls	r3, r3, #2
	str	r3, [r7, #20]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L9
	mov	r3, #-1
	b	.L10
.L9:
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r2, [r7, #28]
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #24]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	lsr	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	and	r3, r3, #15
.L10:
	mov	r0, r3
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	sunxi_gpio_get_cfgpin, .-sunxi_gpio_get_cfgpin
	.align	2
	.global	sunxi_gpio_output
	.thumb
	.thumb_func
	.type	sunxi_gpio_output, %function
sunxi_gpio_output:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #5
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	and	r3, r3, #31
	str	r3, [r7, #16]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L12
	mov	r3, #-1
	b	.L13
.L12:
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r2, [r7, #20]
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r7, #12]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	ldr	r2, [r7, #16]
	movs	r1, #1
	lsl	r2, r1, r2
	orrs	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #16]
	b	.L15
.L14:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	ldr	r2, [r7, #16]
	movs	r1, #1
	lsl	r2, r1, r2
	mvns	r2, r2
	ands	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #16]
.L15:
	movs	r3, #0
.L13:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	sunxi_gpio_output, .-sunxi_gpio_output
	.align	2
	.global	sunxi_gpio_pullup
	.thumb
	.thumb_func
	.type	sunxi_gpio_pullup, %function
sunxi_gpio_pullup:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #36
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #5
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	and	r3, r3, #31
	lsrs	r3, r3, #4
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	and	r3, r3, #15
	lsls	r3, r3, #1
	str	r3, [r7, #20]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L17
	mov	r3, #-1
	b	.L18
.L17:
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r2, [r7, #28]
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r7, #16]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #24]
	adds	r3, r3, #6
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	movs	r2, #3
	lsl	r3, r2, r3
	mvns	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldr	r2, [r7]
	lsl	r3, r2, r3
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #24]
	adds	r3, r3, #6
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	movs	r3, #0
.L18:
	mov	r0, r3
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	sunxi_gpio_pullup, .-sunxi_gpio_pullup
	.align	2
	.global	sunxi_gpio_input
	.thumb
	.thumb_func
	.type	sunxi_gpio_input, %function
sunxi_gpio_input:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #5
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	and	r3, r3, #31
	str	r3, [r7, #16]
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L20
	mov	r3, #-1
	b	.L21
.L20:
	movw	r3, #:lower16:SUNXI_PIO_BASE
	movt	r3, #:upper16:SUNXI_PIO_BASE
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r2, [r7, #20]
	mov	r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	str	r3, [r7, #8]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #8]
	lsr	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	and	r3, r3, #1
.L21:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	sunxi_gpio_input, .-sunxi_gpio_input
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
