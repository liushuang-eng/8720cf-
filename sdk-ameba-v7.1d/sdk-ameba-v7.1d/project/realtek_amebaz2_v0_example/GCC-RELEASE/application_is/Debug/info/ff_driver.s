	.arch armv8-m.main
	.arch_extension dsp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"ff_driver.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.FATFS_RegisterDiskDriver,"ax",%progbits
	.align	1
	.global	FATFS_RegisterDiskDriver
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	FATFS_RegisterDiskDriver, %function
FATFS_RegisterDiskDriver:
.LFB1:
	.file 1 "../../../component/common/file_system/fatfs/fatfs_ext/src/ff_driver.c"
	.loc 1 7 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	.loc 1 10 0
	ldr	r3, .L4
	.loc 1 7 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 10 0
	ldr	r4, [r3, #4]
	cbnz	r4, .L3
	.loc 1 14 0
	movs	r2, #1
	.loc 1 12 0
	strb	r4, [r0, #28]
	.loc 1 13 0
	str	r0, [r3]
	.loc 1 14 0
	str	r2, [r3, #4]
.LVL1:
.L2:
	.loc 1 17 0
	mov	r1, r4
	ldr	r0, .L4+4
.LVL2:
	bl	__wrap_printf
.LVL3:
	.loc 1 19 0
	mov	r0, r4
	pop	{r4, pc}
.LVL4:
.L3:
	.loc 1 8 0
	movs	r4, #255
	b	.L2
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	.LC0
	.cfi_endproc
.LFE1:
	.size	FATFS_RegisterDiskDriver, .-FATFS_RegisterDiskDriver
	.section	.text.FATFS_UnRegisterDiskDriver,"ax",%progbits
	.align	1
	.global	FATFS_UnRegisterDiskDriver
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	FATFS_UnRegisterDiskDriver, %function
FATFS_UnRegisterDiskDriver:
.LFB2:
	.loc 1 21 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 24 0
	ldr	r3, .L10
	ldr	r2, [r3, #4]
	cbz	r2, .L9
.LVL6:
	.loc 1 27 0 discriminator 1
	ldr	r1, [r3]
	ldrb	r1, [r1, #28]	@ zero_extendqisi2
	cmp	r1, r0
	bne	.L9
	.loc 1 28 0
	movs	r0, #0
.LVL7:
	.loc 1 29 0
	subs	r2, r2, #1
	.loc 1 28 0
	str	r0, [r3]
	.loc 1 29 0
	str	r2, [r3, #4]
	.loc 1 30 0
	bx	lr
.LVL8:
.L9:
	.loc 1 35 0
	mov	r0, #-1
.LVL9:
	.loc 1 36 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.cfi_endproc
.LFE2:
	.size	FATFS_UnRegisterDiskDriver, .-FATFS_UnRegisterDiskDriver
	.section	.text.FATFS_getDrivernum,"ax",%progbits
	.align	1
	.global	FATFS_getDrivernum
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	FATFS_getDrivernum, %function
FATFS_getDrivernum:
.LFB3:
	.loc 1 45 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	.loc 1 45 0
	mov	r8, r0
	.loc 1 49 0
	movs	r4, #0
	ldr	r5, .L17
	ldr	r7, [r5, #4]
.LVL11:
.L13:
	.loc 1 49 0 is_stmt 0 discriminator 1
	cmp	r4, r7
	bne	.L16
	.loc 1 55 0 is_stmt 1
	mov	r0, #-1
	.loc 1 56 0
	pop	{r4, r5, r6, r7, r8, pc}
.LVL12:
.L16:
	.loc 1 50 0
	ldr	r6, [r5, r4, lsl #2]
.LVL13:
	.loc 1 51 0
	mov	r1, r8
	ldr	r0, [r6, #24]
	bl	strcmp
.LVL14:
	cbnz	r0, .L14
	.loc 1 52 0
	ldrb	r0, [r6, #28]	@ zero_extendqisi2
	pop	{r4, r5, r6, r7, r8, pc}
.LVL15:
.L14:
	.loc 1 49 0 discriminator 2
	adds	r4, r4, #1
.LVL16:
	b	.L13
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.cfi_endproc
.LFE3:
	.size	FATFS_getDrivernum, .-FATFS_getDrivernum
	.global	disk
	.section	.bss.disk,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	disk, %object
	.size	disk, 8
disk:
	.space	8
	.section	.rodata.FATFS_RegisterDiskDriver.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"FATFS Register: disk driver %d\012\015\000"
	.text
.Letext0:
	.file 2 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/lock.h"
	.file 3 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/_types.h"
	.file 4 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/lib/gcc/arm-none-eabi/6.5.0/include/stddef.h"
	.file 5 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/reent.h"
	.file 6 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/time.h"
	.file 7 "../../../component/common/file_system/fatfs/r0.10c/include/integer.h"
	.file 8 "../../../component/common/file_system/fatfs/r0.10c/include/diskio.h"
	.file 9 "../../../component/common/file_system/fatfs/fatfs_ext/inc/ff_driver.h"
	.file 10 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/stdlib.h"
	.file 11 "/home/ls/8720cf/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/string.h"
	.file 12 "../../../component/common/api/platform/platform_stdlib_rtl8710c.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xb8c
	.2byte	0x3
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF150
	.byte	0xc
	.4byte	.LASF151
	.4byte	.LASF152
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x7
	.4byte	0x61
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x2c
	.4byte	0x45
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x72
	.4byte	0x45
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x4
	.2byte	0x165
	.4byte	0x68
	.uleb128 0x6
	.byte	0x4
	.byte	0x3
	.byte	0xa6
	.4byte	0xc2
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0xa8
	.4byte	0x97
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x3
	.byte	0xa9
	.4byte	0xc2
	.byte	0
	.uleb128 0x8
	.4byte	0x30
	.4byte	0xd2
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0xa
	.byte	0x8
	.byte	0x3
	.byte	0xa3
	.4byte	0xfa
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.byte	0xa5
	.4byte	0x61
	.byte	0
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.byte	0xaa
	.4byte	0xa3
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x3
	.byte	0xab
	.4byte	0xd9
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x3
	.byte	0xaf
	.4byte	0x76
	.uleb128 0xc
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x5
	.byte	0x16
	.4byte	0x4c
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x18
	.byte	0x5
	.byte	0x2f
	.4byte	0x170
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x31
	.4byte	0x170
	.byte	0
	.uleb128 0xe
	.ascii	"_k\000"
	.byte	0x5
	.byte	0x32
	.4byte	0x61
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x32
	.4byte	0x61
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x32
	.4byte	0x61
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0x32
	.4byte	0x61
	.byte	0x10
	.uleb128 0xe
	.ascii	"_x\000"
	.byte	0x5
	.byte	0x33
	.4byte	0x176
	.byte	0x14
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x11d
	.uleb128 0x8
	.4byte	0x112
	.4byte	0x186
	.uleb128 0x9
	.4byte	0xd2
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x24
	.byte	0x5
	.byte	0x37
	.4byte	0x1ff
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x5
	.byte	0x39
	.4byte	0x61
	.byte	0
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x5
	.byte	0x3a
	.4byte	0x61
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x5
	.byte	0x3b
	.4byte	0x61
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x5
	.byte	0x3c
	.4byte	0x61
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x5
	.byte	0x3d
	.4byte	0x61
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3e
	.4byte	0x61
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3f
	.4byte	0x61
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x5
	.byte	0x40
	.4byte	0x61
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x5
	.byte	0x41
	.4byte	0x61
	.byte	0x20
	.byte	0
	.uleb128 0x10
	.4byte	.LASF37
	.2byte	0x108
	.byte	0x5
	.byte	0x4a
	.4byte	0x23f
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x5
	.byte	0x4b
	.4byte	0x23f
	.byte	0
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4c
	.4byte	0x23f
	.byte	0x80
	.uleb128 0x11
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4e
	.4byte	0x112
	.2byte	0x100
	.uleb128 0x11
	.4byte	.LASF41
	.byte	0x5
	.byte	0x51
	.4byte	0x112
	.2byte	0x104
	.byte	0
	.uleb128 0x8
	.4byte	0x110
	.4byte	0x24f
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x1f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF42
	.2byte	0x190
	.byte	0x5
	.byte	0x5d
	.4byte	0x28d
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x5e
	.4byte	0x28d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x5
	.byte	0x5f
	.4byte	0x61
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x5
	.byte	0x61
	.4byte	0x293
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x5
	.byte	0x62
	.4byte	0x1ff
	.byte	0x88
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x24f
	.uleb128 0x8
	.4byte	0x2a3
	.4byte	0x2a3
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x1f
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x2a9
	.uleb128 0x12
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x8
	.byte	0x5
	.byte	0x75
	.4byte	0x2d0
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x5
	.byte	0x76
	.4byte	0x2d0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x5
	.byte	0x77
	.4byte	0x61
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x30
	.uleb128 0xd
	.4byte	.LASF48
	.byte	0x68
	.byte	0x5
	.byte	0xb5
	.4byte	0x400
	.uleb128 0xe
	.ascii	"_p\000"
	.byte	0x5
	.byte	0xb6
	.4byte	0x2d0
	.byte	0
	.uleb128 0xe
	.ascii	"_r\000"
	.byte	0x5
	.byte	0xb7
	.4byte	0x61
	.byte	0x4
	.uleb128 0xe
	.ascii	"_w\000"
	.byte	0x5
	.byte	0xb8
	.4byte	0x61
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x5
	.byte	0xb9
	.4byte	0x37
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x5
	.byte	0xba
	.4byte	0x37
	.byte	0xe
	.uleb128 0xe
	.ascii	"_bf\000"
	.byte	0x5
	.byte	0xbb
	.4byte	0x2ab
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x5
	.byte	0xbc
	.4byte	0x61
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x5
	.byte	0xc3
	.4byte	0x110
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x5
	.byte	0xc5
	.4byte	0x56e
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x5
	.byte	0xc7
	.4byte	0x599
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x5
	.byte	0xca
	.4byte	0x5be
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x5
	.byte	0xcb
	.4byte	0x5d9
	.byte	0x2c
	.uleb128 0xe
	.ascii	"_ub\000"
	.byte	0x5
	.byte	0xce
	.4byte	0x2ab
	.byte	0x30
	.uleb128 0xe
	.ascii	"_up\000"
	.byte	0x5
	.byte	0xcf
	.4byte	0x2d0
	.byte	0x38
	.uleb128 0xe
	.ascii	"_ur\000"
	.byte	0x5
	.byte	0xd0
	.4byte	0x61
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x5
	.byte	0xd3
	.4byte	0x5df
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x5
	.byte	0xd4
	.4byte	0x5ef
	.byte	0x43
	.uleb128 0xe
	.ascii	"_lb\000"
	.byte	0x5
	.byte	0xd7
	.4byte	0x2ab
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x5
	.byte	0xda
	.4byte	0x61
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x5
	.byte	0xdb
	.4byte	0x81
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x5
	.byte	0xde
	.4byte	0x41f
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF62
	.byte	0x5
	.byte	0xe2
	.4byte	0x105
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF63
	.byte	0x5
	.byte	0xe4
	.4byte	0xfa
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF64
	.byte	0x5
	.byte	0xe5
	.4byte	0x61
	.byte	0x64
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.4byte	0x61
	.4byte	0x41f
	.uleb128 0x14
	.4byte	0x41f
	.uleb128 0x14
	.4byte	0x110
	.uleb128 0x14
	.4byte	0x55c
	.uleb128 0x14
	.4byte	0x61
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x42a
	.uleb128 0x15
	.4byte	0x41f
	.uleb128 0x16
	.4byte	.LASF65
	.2byte	0x428
	.byte	0x5
	.2byte	0x239
	.4byte	0x55c
	.uleb128 0x17
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x23b
	.4byte	0x61
	.byte	0
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x240
	.4byte	0x646
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x240
	.4byte	0x646
	.byte	0x8
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x240
	.4byte	0x646
	.byte	0xc
	.uleb128 0x17
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x242
	.4byte	0x61
	.byte	0x10
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x243
	.4byte	0x828
	.byte	0x14
	.uleb128 0x17
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x246
	.4byte	0x61
	.byte	0x30
	.uleb128 0x17
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x247
	.4byte	0x83e
	.byte	0x34
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x249
	.4byte	0x61
	.byte	0x38
	.uleb128 0x17
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x24b
	.4byte	0x850
	.byte	0x3c
	.uleb128 0x17
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x24e
	.4byte	0x170
	.byte	0x40
	.uleb128 0x17
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x24f
	.4byte	0x61
	.byte	0x44
	.uleb128 0x17
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x250
	.4byte	0x170
	.byte	0x48
	.uleb128 0x17
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x251
	.4byte	0x856
	.byte	0x4c
	.uleb128 0x17
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x254
	.4byte	0x61
	.byte	0x50
	.uleb128 0x17
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x255
	.4byte	0x55c
	.byte	0x54
	.uleb128 0x17
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x278
	.4byte	0x806
	.byte	0x58
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x27c
	.4byte	0x28d
	.2byte	0x148
	.uleb128 0x18
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x27d
	.4byte	0x24f
	.2byte	0x14c
	.uleb128 0x18
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x281
	.4byte	0x868
	.2byte	0x2dc
	.uleb128 0x18
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x286
	.4byte	0x60b
	.2byte	0x2e0
	.uleb128 0x18
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x287
	.4byte	0x874
	.2byte	0x2ec
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x562
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF87
	.uleb128 0x15
	.4byte	0x562
	.uleb128 0xf
	.byte	0x4
	.4byte	0x400
	.uleb128 0x13
	.byte	0x1
	.4byte	0x61
	.4byte	0x593
	.uleb128 0x14
	.4byte	0x41f
	.uleb128 0x14
	.4byte	0x110
	.uleb128 0x14
	.4byte	0x593
	.uleb128 0x14
	.4byte	0x61
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x569
	.uleb128 0xf
	.byte	0x4
	.4byte	0x574
	.uleb128 0x13
	.byte	0x1
	.4byte	0x8c
	.4byte	0x5be
	.uleb128 0x14
	.4byte	0x41f
	.uleb128 0x14
	.4byte	0x110
	.uleb128 0x14
	.4byte	0x8c
	.uleb128 0x14
	.4byte	0x61
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x59f
	.uleb128 0x13
	.byte	0x1
	.4byte	0x61
	.4byte	0x5d9
	.uleb128 0x14
	.4byte	0x41f
	.uleb128 0x14
	.4byte	0x110
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x5c4
	.uleb128 0x8
	.4byte	0x30
	.4byte	0x5ef
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	0x30
	.4byte	0x5ff
	.uleb128 0x9
	.4byte	0xd2
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x11f
	.4byte	0x2d6
	.uleb128 0x19
	.4byte	.LASF89
	.byte	0xc
	.byte	0x5
	.2byte	0x123
	.4byte	0x640
	.uleb128 0x17
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x125
	.4byte	0x640
	.byte	0
	.uleb128 0x17
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x126
	.4byte	0x61
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF91
	.byte	0x5
	.2byte	0x127
	.4byte	0x646
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x60b
	.uleb128 0xf
	.byte	0x4
	.4byte	0x5ff
	.uleb128 0x19
	.4byte	.LASF92
	.byte	0xe
	.byte	0x5
	.2byte	0x13f
	.4byte	0x681
	.uleb128 0x17
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x140
	.4byte	0x681
	.byte	0
	.uleb128 0x17
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x141
	.4byte	0x681
	.byte	0x6
	.uleb128 0x17
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x142
	.4byte	0x3e
	.byte	0xc
	.byte	0
	.uleb128 0x8
	.4byte	0x3e
	.4byte	0x691
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.byte	0xd0
	.byte	0x5
	.2byte	0x259
	.4byte	0x792
	.uleb128 0x17
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x25b
	.4byte	0x68
	.byte	0
	.uleb128 0x17
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x25c
	.4byte	0x55c
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x25d
	.4byte	0x792
	.byte	0x8
	.uleb128 0x17
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x25e
	.4byte	0x186
	.byte	0x24
	.uleb128 0x17
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x25f
	.4byte	0x61
	.byte	0x48
	.uleb128 0x17
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x260
	.4byte	0x5a
	.byte	0x50
	.uleb128 0x17
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x261
	.4byte	0x64c
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x262
	.4byte	0xfa
	.byte	0x68
	.uleb128 0x17
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x263
	.4byte	0xfa
	.byte	0x70
	.uleb128 0x17
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x264
	.4byte	0xfa
	.byte	0x78
	.uleb128 0x17
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x265
	.4byte	0x7a2
	.byte	0x80
	.uleb128 0x17
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x266
	.4byte	0x7b2
	.byte	0x88
	.uleb128 0x17
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x267
	.4byte	0x61
	.byte	0xa0
	.uleb128 0x17
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x268
	.4byte	0xfa
	.byte	0xa4
	.uleb128 0x17
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x269
	.4byte	0xfa
	.byte	0xac
	.uleb128 0x17
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x26a
	.4byte	0xfa
	.byte	0xb4
	.uleb128 0x17
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x26b
	.4byte	0xfa
	.byte	0xbc
	.uleb128 0x17
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x26c
	.4byte	0xfa
	.byte	0xc4
	.uleb128 0x17
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x26d
	.4byte	0x61
	.byte	0xcc
	.byte	0
	.uleb128 0x8
	.4byte	0x562
	.4byte	0x7a2
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x19
	.byte	0
	.uleb128 0x8
	.4byte	0x562
	.4byte	0x7b2
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	0x562
	.4byte	0x7c2
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x17
	.byte	0
	.uleb128 0x1a
	.byte	0xf0
	.byte	0x5
	.2byte	0x272
	.4byte	0x7e6
	.uleb128 0x17
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x275
	.4byte	0x7e6
	.byte	0
	.uleb128 0x17
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x276
	.4byte	0x7f6
	.byte	0x78
	.byte	0
	.uleb128 0x8
	.4byte	0x2d0
	.4byte	0x7f6
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x1d
	.byte	0
	.uleb128 0x8
	.4byte	0x68
	.4byte	0x806
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x1d
	.byte	0
	.uleb128 0x1b
	.byte	0xf0
	.byte	0x5
	.2byte	0x257
	.4byte	0x828
	.uleb128 0x1c
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x26e
	.4byte	0x691
	.uleb128 0x1c
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x277
	.4byte	0x7c2
	.byte	0
	.uleb128 0x8
	.4byte	0x562
	.4byte	0x838
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x18
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF153
	.byte	0x1
	.uleb128 0xf
	.byte	0x4
	.4byte	0x838
	.uleb128 0x1e
	.byte	0x1
	.4byte	0x850
	.uleb128 0x14
	.4byte	0x41f
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x844
	.uleb128 0xf
	.byte	0x4
	.4byte	0x170
	.uleb128 0x1e
	.byte	0x1
	.4byte	0x868
	.uleb128 0x14
	.4byte	0x61
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x86e
	.uleb128 0xf
	.byte	0x4
	.4byte	0x85c
	.uleb128 0x8
	.4byte	0x5ff
	.4byte	0x884
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x2
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x2fe
	.4byte	0x41f
	.byte	0x1
	.byte	0x1
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x2ff
	.4byte	0x425
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.4byte	.LASF120
	.byte	0x6
	.byte	0x9a
	.4byte	0x45
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.4byte	.LASF121
	.byte	0x6
	.byte	0x9b
	.4byte	0x61
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.4byte	0x55c
	.4byte	0x8ca
	.uleb128 0x9
	.4byte	0xd2
	.byte	0x1
	.byte	0
	.uleb128 0x20
	.4byte	.LASF122
	.byte	0x6
	.byte	0x9e
	.4byte	0x8ba
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF123
	.byte	0x7
	.byte	0x10
	.4byte	0x30
	.uleb128 0x15
	.4byte	0x8d7
	.uleb128 0x4
	.4byte	.LASF124
	.byte	0x7
	.byte	0x1a
	.4byte	0x68
	.uleb128 0x4
	.4byte	.LASF125
	.byte	0x7
	.byte	0x1e
	.4byte	0x4c
	.uleb128 0x4
	.4byte	.LASF126
	.byte	0x8
	.byte	0x13
	.4byte	0x8d7
	.uleb128 0x21
	.byte	0x1
	.4byte	0x30
	.byte	0x8
	.byte	0x16
	.4byte	0x933
	.uleb128 0x22
	.4byte	.LASF127
	.byte	0
	.uleb128 0x22
	.4byte	.LASF128
	.byte	0x1
	.uleb128 0x22
	.4byte	.LASF129
	.byte	0x2
	.uleb128 0x22
	.4byte	.LASF130
	.byte	0x3
	.uleb128 0x22
	.4byte	.LASF131
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF132
	.byte	0x8
	.byte	0x1c
	.4byte	0x908
	.uleb128 0xf
	.byte	0x4
	.4byte	0x8d7
	.uleb128 0xa
	.byte	0x20
	.byte	0x9
	.byte	0xb
	.4byte	0x9ad
	.uleb128 0xb
	.4byte	.LASF133
	.byte	0x9
	.byte	0xc
	.4byte	0x9b3
	.byte	0
	.uleb128 0xb
	.4byte	.LASF134
	.byte	0x9
	.byte	0xd
	.4byte	0x9b3
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF135
	.byte	0x9
	.byte	0xe
	.4byte	0x9b3
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF136
	.byte	0x9
	.byte	0xf
	.4byte	0x9d3
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF137
	.byte	0x9
	.byte	0x11
	.4byte	0x9f9
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF138
	.byte	0x9
	.byte	0x14
	.4byte	0xa14
	.byte	0x14
	.uleb128 0xe
	.ascii	"TAG\000"
	.byte	0x9
	.byte	0x16
	.4byte	0x2d0
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF139
	.byte	0x9
	.byte	0x17
	.4byte	0x30
	.byte	0x1c
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.4byte	0x8fd
	.uleb128 0xf
	.byte	0x4
	.4byte	0x9ad
	.uleb128 0x13
	.byte	0x1
	.4byte	0x933
	.4byte	0x9d3
	.uleb128 0x14
	.4byte	0x93e
	.uleb128 0x14
	.4byte	0x8f2
	.uleb128 0x14
	.4byte	0x8e7
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x9b9
	.uleb128 0x13
	.byte	0x1
	.4byte	0x933
	.4byte	0x9f3
	.uleb128 0x14
	.4byte	0x9f3
	.uleb128 0x14
	.4byte	0x8f2
	.uleb128 0x14
	.4byte	0x8e7
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x8e2
	.uleb128 0xf
	.byte	0x4
	.4byte	0x9d9
	.uleb128 0x13
	.byte	0x1
	.4byte	0x933
	.4byte	0xa14
	.uleb128 0x14
	.4byte	0x8d7
	.uleb128 0x14
	.4byte	0x110
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x9ff
	.uleb128 0x4
	.4byte	.LASF140
	.byte	0x9
	.byte	0x18
	.4byte	0x944
	.uleb128 0xa
	.byte	0x8
	.byte	0x9
	.byte	0x1a
	.4byte	0xa46
	.uleb128 0xe
	.ascii	"drv\000"
	.byte	0x9
	.byte	0x1b
	.4byte	0xa46
	.byte	0
	.uleb128 0xe
	.ascii	"nbr\000"
	.byte	0x9
	.byte	0x1c
	.4byte	0x68
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	0xa56
	.4byte	0xa56
	.uleb128 0x9
	.4byte	0xd2
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0xa1a
	.uleb128 0x4
	.4byte	.LASF141
	.byte	0x9
	.byte	0x1d
	.4byte	0xa25
	.uleb128 0x20
	.4byte	.LASF142
	.byte	0x9
	.byte	0x1e
	.4byte	0xa5c
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.4byte	.LASF143
	.byte	0xa
	.byte	0x63
	.4byte	0x55c
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.4byte	0xa67
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.byte	0x3
	.4byte	disk
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF145
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.4byte	0x61
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.4byte	0xae6
	.uleb128 0x26
	.ascii	"TAG\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x2d0
	.4byte	.LLST4
	.uleb128 0x27
	.ascii	"drv\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0xa56
	.byte	0x1
	.byte	0x56
	.uleb128 0x28
	.4byte	.LASF144
	.byte	0x1
	.byte	0x2f
	.4byte	0x68
	.4byte	.LLST5
	.uleb128 0x29
	.4byte	.LVL14
	.4byte	0xb75
	.uleb128 0x2a
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF146
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.4byte	0x61
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.4byte	0xb21
	.uleb128 0x2b
	.4byte	.LASF139
	.byte	0x1
	.byte	0x15
	.4byte	0x30
	.4byte	.LLST2
	.uleb128 0x28
	.4byte	.LASF144
	.byte	0x1
	.byte	0x16
	.4byte	0x61
	.4byte	.LLST3
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF147
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.4byte	0x61
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.4byte	0xb75
	.uleb128 0x26
	.ascii	"drv\000"
	.byte	0x1
	.byte	0x7
	.4byte	0xa56
	.4byte	.LLST0
	.uleb128 0x28
	.4byte	.LASF139
	.byte	0x1
	.byte	0x8
	.4byte	0x30
	.4byte	.LLST1
	.uleb128 0x29
	.4byte	.LVL3
	.4byte	0xb82
	.uleb128 0x2a
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.uleb128 0x2a
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.byte	0x1
	.byte	0x1
	.4byte	.LASF148
	.4byte	.LASF148
	.byte	0xb
	.byte	0x20
	.uleb128 0x2c
	.byte	0x1
	.byte	0x1
	.4byte	.LASF149
	.4byte	.LASF149
	.byte	0xc
	.byte	0x1a
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST4:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE3
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LFE3
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LFE1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL4
	.4byte	.LFE1
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"_on_exit_args\000"
.LASF121:
	.ascii	"_daylight\000"
.LASF105:
	.ascii	"_wctomb_state\000"
.LASF102:
	.ascii	"_r48\000"
.LASF107:
	.ascii	"_signal_buf\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF51:
	.ascii	"_lbfsize\000"
.LASF49:
	.ascii	"_flags\000"
.LASF144:
	.ascii	"index\000"
.LASF66:
	.ascii	"_errno\000"
.LASF10:
	.ascii	"_LOCK_RECURSIVE_T\000"
.LASF53:
	.ascii	"_read\000"
.LASF109:
	.ascii	"_mbrlen_state\000"
.LASF151:
	.ascii	"../../../component/common/file_system/fatfs/fatfs_e"
	.ascii	"xt/src/ff_driver.c\000"
.LASF68:
	.ascii	"_stdout\000"
.LASF12:
	.ascii	"_fpos_t\000"
.LASF44:
	.ascii	"_fns\000"
.LASF52:
	.ascii	"_cookie\000"
.LASF135:
	.ascii	"disk_status\000"
.LASF26:
	.ascii	"_Bigint\000"
.LASF34:
	.ascii	"__tm_wday\000"
.LASF76:
	.ascii	"_result\000"
.LASF30:
	.ascii	"__tm_hour\000"
.LASF95:
	.ascii	"_add\000"
.LASF17:
	.ascii	"__count\000"
.LASF29:
	.ascii	"__tm_min\000"
.LASF118:
	.ascii	"_impure_ptr\000"
.LASF115:
	.ascii	"_nextf\000"
.LASF125:
	.ascii	"DWORD\000"
.LASF92:
	.ascii	"_rand48\000"
.LASF77:
	.ascii	"_result_k\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF98:
	.ascii	"_asctime_buf\000"
.LASF149:
	.ascii	"__wrap_printf\000"
.LASF48:
	.ascii	"__sFILE\000"
.LASF25:
	.ascii	"_wds\000"
.LASF133:
	.ascii	"disk_initialize\000"
.LASF88:
	.ascii	"__FILE\000"
.LASF60:
	.ascii	"_offset\000"
.LASF71:
	.ascii	"_emergency\000"
.LASF140:
	.ascii	"ll_diskio_drv\000"
.LASF150:
	.ascii	"GNU C11 6.5.0 -march=armv8-m.main+dsp -mthumb -mcms"
	.ascii	"e -mfloat-abi=soft -mabi=aapcs -g -gdwarf-3 -gdwarf"
	.ascii	"-3 -Os -fstack-usage -fdata-sections -ffunction-sec"
	.ascii	"tions\000"
.LASF28:
	.ascii	"__tm_sec\000"
.LASF143:
	.ascii	"suboptarg\000"
.LASF35:
	.ascii	"__tm_yday\000"
.LASF70:
	.ascii	"_inc\000"
.LASF43:
	.ascii	"_ind\000"
.LASF139:
	.ascii	"drv_num\000"
.LASF22:
	.ascii	"_next\000"
.LASF111:
	.ascii	"_mbsrtowcs_state\000"
.LASF122:
	.ascii	"_tzname\000"
.LASF18:
	.ascii	"__value\000"
.LASF78:
	.ascii	"_p5s\000"
.LASF113:
	.ascii	"_wcsrtombs_state\000"
.LASF103:
	.ascii	"_mblen_state\000"
.LASF87:
	.ascii	"char\000"
.LASF31:
	.ascii	"__tm_mday\000"
.LASF84:
	.ascii	"_sig_func\000"
.LASF110:
	.ascii	"_mbrtowc_state\000"
.LASF83:
	.ascii	"_atexit0\000"
.LASF138:
	.ascii	"disk_ioctl\000"
.LASF20:
	.ascii	"_flock_t\000"
.LASF148:
	.ascii	"strcmp\000"
.LASF14:
	.ascii	"__wch\000"
.LASF91:
	.ascii	"_iobs\000"
.LASF128:
	.ascii	"RES_ERROR\000"
.LASF147:
	.ascii	"FATFS_RegisterDiskDriver\000"
.LASF56:
	.ascii	"_close\000"
.LASF74:
	.ascii	"__sdidinit\000"
.LASF120:
	.ascii	"_timezone\000"
.LASF67:
	.ascii	"_stdin\000"
.LASF100:
	.ascii	"_gamma_signgam\000"
.LASF6:
	.ascii	"long long int\000"
.LASF46:
	.ascii	"_base\000"
.LASF79:
	.ascii	"_freelist\000"
.LASF94:
	.ascii	"_mult\000"
.LASF21:
	.ascii	"__ULong\000"
.LASF112:
	.ascii	"_wcrtomb_state\000"
.LASF50:
	.ascii	"_file\000"
.LASF123:
	.ascii	"BYTE\000"
.LASF75:
	.ascii	"__cleanup\000"
.LASF19:
	.ascii	"_mbstate_t\000"
.LASF131:
	.ascii	"RES_PARERR\000"
.LASF142:
	.ascii	"disk\000"
.LASF36:
	.ascii	"__tm_isdst\000"
.LASF129:
	.ascii	"RES_WRPRT\000"
.LASF114:
	.ascii	"_h_errno\000"
.LASF145:
	.ascii	"FATFS_getDrivernum\000"
.LASF32:
	.ascii	"__tm_mon\000"
.LASF9:
	.ascii	"long double\000"
.LASF54:
	.ascii	"_write\000"
.LASF137:
	.ascii	"disk_write\000"
.LASF42:
	.ascii	"_atexit\000"
.LASF63:
	.ascii	"_mbstate\000"
.LASF132:
	.ascii	"DRESULT\000"
.LASF2:
	.ascii	"short int\000"
.LASF4:
	.ascii	"long int\000"
.LASF86:
	.ascii	"__sf\000"
.LASF24:
	.ascii	"_sign\000"
.LASF61:
	.ascii	"_data\000"
.LASF15:
	.ascii	"__wchb\000"
.LASF119:
	.ascii	"_global_impure_ptr\000"
.LASF134:
	.ascii	"disk_deinitialize\000"
.LASF33:
	.ascii	"__tm_year\000"
.LASF146:
	.ascii	"FATFS_UnRegisterDiskDriver\000"
.LASF99:
	.ascii	"_localtime_buf\000"
.LASF117:
	.ascii	"_unused\000"
.LASF82:
	.ascii	"_new\000"
.LASF80:
	.ascii	"_cvtlen\000"
.LASF23:
	.ascii	"_maxwds\000"
.LASF106:
	.ascii	"_l64a_buf\000"
.LASF124:
	.ascii	"UINT\000"
.LASF59:
	.ascii	"_blksize\000"
.LASF27:
	.ascii	"__tm\000"
.LASF62:
	.ascii	"_lock\000"
.LASF16:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF90:
	.ascii	"_niobs\000"
.LASF13:
	.ascii	"wint_t\000"
.LASF39:
	.ascii	"_dso_handle\000"
.LASF141:
	.ascii	"ff_disk_drv\000"
.LASF81:
	.ascii	"_cvtbuf\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF108:
	.ascii	"_getdate_err\000"
.LASF152:
	.ascii	"/home/ls/8720cf/sdk-ameba-v7.1d/project/realtek_ame"
	.ascii	"baz2_v0_example/GCC-RELEASE\000"
.LASF45:
	.ascii	"__sbuf\000"
.LASF89:
	.ascii	"_glue\000"
.LASF126:
	.ascii	"DSTATUS\000"
.LASF127:
	.ascii	"RES_OK\000"
.LASF85:
	.ascii	"__sglue\000"
.LASF97:
	.ascii	"_strtok_last\000"
.LASF104:
	.ascii	"_mbtowc_state\000"
.LASF130:
	.ascii	"RES_NOTRDY\000"
.LASF73:
	.ascii	"_locale\000"
.LASF38:
	.ascii	"_fnargs\000"
.LASF0:
	.ascii	"signed char\000"
.LASF136:
	.ascii	"disk_read\000"
.LASF65:
	.ascii	"_reent\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF40:
	.ascii	"_fntypes\000"
.LASF47:
	.ascii	"_size\000"
.LASF11:
	.ascii	"_off_t\000"
.LASF58:
	.ascii	"_nbuf\000"
.LASF96:
	.ascii	"_unused_rand\000"
.LASF72:
	.ascii	"_unspecified_locale_info\000"
.LASF64:
	.ascii	"_flags2\000"
.LASF41:
	.ascii	"_is_cxa\000"
.LASF93:
	.ascii	"_seed\000"
.LASF101:
	.ascii	"_rand_next\000"
.LASF153:
	.ascii	"__locale_t\000"
.LASF55:
	.ascii	"_seek\000"
.LASF69:
	.ascii	"_stderr\000"
.LASF116:
	.ascii	"_nmalloc\000"
.LASF57:
	.ascii	"_ubuf\000"
	.ident	"GCC: (Realtek ASDK-6.5.0 Build 3215) 6.5.0"