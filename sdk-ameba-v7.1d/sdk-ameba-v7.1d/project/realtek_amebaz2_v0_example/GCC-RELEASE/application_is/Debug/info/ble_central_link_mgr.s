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
	.file	"ble_central_link_mgr.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	ble_central_app_link_table,8,1
.Letext0:
	.file 1 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/machine/_default_types.h"
	.file 2 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/lock.h"
	.file 3 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/_types.h"
	.file 4 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/lib/gcc/arm-none-eabi/6.5.0/include/stddef.h"
	.file 5 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/reent.h"
	.file 6 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/sys/_stdint.h"
	.file 7 "/home/ls/samba_share/sdk-ameba-v7.1d/tools/arm-none-eabi-gcc/asdk/linux/newlib/arm-none-eabi/include/time.h"
	.file 8 "../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/gap/gap.h"
	.file 9 "../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/gap/gap_storage_le.h"
	.file 10 "../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/gap/gap_msg.h"
	.file 11 "../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_link_mgr.h"
	.file 12 "../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_link_mgr.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x9b8
	.2byte	0x3
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF140
	.byte	0xc
	.4byte	.LASF141
	.4byte	.LASF142
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x1
	.byte	0x2b
	.4byte	0x2f
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
	.uleb128 0x4
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
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x7
	.4byte	0x60
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x2c
	.4byte	0x44
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x72
	.4byte	0x44
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x165
	.4byte	0x67
	.uleb128 0x6
	.byte	0x4
	.byte	0x3
	.byte	0xa6
	.4byte	0xc1
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x3
	.byte	0xa8
	.4byte	0x96
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x3
	.byte	0xa9
	.4byte	0xc1
	.byte	0
	.uleb128 0x8
	.4byte	0x2f
	.4byte	0xd1
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0xa
	.byte	0x8
	.byte	0x3
	.byte	0xa3
	.4byte	0xf9
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.byte	0xa5
	.4byte	0x60
	.byte	0
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.byte	0xaa
	.4byte	0xa2
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x3
	.byte	0xab
	.4byte	0xd8
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x3
	.byte	0xaf
	.4byte	0x75
	.uleb128 0xc
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x5
	.byte	0x16
	.4byte	0x4b
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x18
	.byte	0x5
	.byte	0x2f
	.4byte	0x16f
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x31
	.4byte	0x16f
	.byte	0
	.uleb128 0xe
	.ascii	"_k\000"
	.byte	0x5
	.byte	0x32
	.4byte	0x60
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x32
	.4byte	0x60
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0x32
	.4byte	0x60
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x5
	.byte	0x32
	.4byte	0x60
	.byte	0x10
	.uleb128 0xe
	.ascii	"_x\000"
	.byte	0x5
	.byte	0x33
	.4byte	0x175
	.byte	0x14
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x11c
	.uleb128 0x8
	.4byte	0x111
	.4byte	0x185
	.uleb128 0x9
	.4byte	0xd1
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x24
	.byte	0x5
	.byte	0x37
	.4byte	0x1fe
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x5
	.byte	0x39
	.4byte	0x60
	.byte	0
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x5
	.byte	0x3a
	.4byte	0x60
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x5
	.byte	0x3b
	.4byte	0x60
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x5
	.byte	0x3c
	.4byte	0x60
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3d
	.4byte	0x60
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3e
	.4byte	0x60
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x5
	.byte	0x3f
	.4byte	0x60
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x5
	.byte	0x40
	.4byte	0x60
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x5
	.byte	0x41
	.4byte	0x60
	.byte	0x20
	.byte	0
	.uleb128 0x10
	.4byte	.LASF38
	.2byte	0x108
	.byte	0x5
	.byte	0x4a
	.4byte	0x23e
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4b
	.4byte	0x23e
	.byte	0
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4c
	.4byte	0x23e
	.byte	0x80
	.uleb128 0x11
	.4byte	.LASF41
	.byte	0x5
	.byte	0x4e
	.4byte	0x111
	.2byte	0x100
	.uleb128 0x11
	.4byte	.LASF42
	.byte	0x5
	.byte	0x51
	.4byte	0x111
	.2byte	0x104
	.byte	0
	.uleb128 0x8
	.4byte	0x10f
	.4byte	0x24e
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x1f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF43
	.2byte	0x190
	.byte	0x5
	.byte	0x5d
	.4byte	0x28c
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x5e
	.4byte	0x28c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x5
	.byte	0x5f
	.4byte	0x60
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x5
	.byte	0x61
	.4byte	0x292
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x5
	.byte	0x62
	.4byte	0x1fe
	.byte	0x88
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x24e
	.uleb128 0x8
	.4byte	0x2a2
	.4byte	0x2a2
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x1f
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x2a8
	.uleb128 0x12
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x8
	.byte	0x5
	.byte	0x75
	.4byte	0x2cf
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x5
	.byte	0x76
	.4byte	0x2cf
	.byte	0
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x5
	.byte	0x77
	.4byte	0x60
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x2f
	.uleb128 0xd
	.4byte	.LASF49
	.byte	0x68
	.byte	0x5
	.byte	0xb5
	.4byte	0x3ff
	.uleb128 0xe
	.ascii	"_p\000"
	.byte	0x5
	.byte	0xb6
	.4byte	0x2cf
	.byte	0
	.uleb128 0xe
	.ascii	"_r\000"
	.byte	0x5
	.byte	0xb7
	.4byte	0x60
	.byte	0x4
	.uleb128 0xe
	.ascii	"_w\000"
	.byte	0x5
	.byte	0xb8
	.4byte	0x60
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x5
	.byte	0xb9
	.4byte	0x36
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x5
	.byte	0xba
	.4byte	0x36
	.byte	0xe
	.uleb128 0xe
	.ascii	"_bf\000"
	.byte	0x5
	.byte	0xbb
	.4byte	0x2aa
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x5
	.byte	0xbc
	.4byte	0x60
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x5
	.byte	0xc3
	.4byte	0x10f
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x5
	.byte	0xc5
	.4byte	0x56d
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x5
	.byte	0xc7
	.4byte	0x598
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x5
	.byte	0xca
	.4byte	0x5bd
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x5
	.byte	0xcb
	.4byte	0x5d8
	.byte	0x2c
	.uleb128 0xe
	.ascii	"_ub\000"
	.byte	0x5
	.byte	0xce
	.4byte	0x2aa
	.byte	0x30
	.uleb128 0xe
	.ascii	"_up\000"
	.byte	0x5
	.byte	0xcf
	.4byte	0x2cf
	.byte	0x38
	.uleb128 0xe
	.ascii	"_ur\000"
	.byte	0x5
	.byte	0xd0
	.4byte	0x60
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x5
	.byte	0xd3
	.4byte	0x5de
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x5
	.byte	0xd4
	.4byte	0x5ee
	.byte	0x43
	.uleb128 0xe
	.ascii	"_lb\000"
	.byte	0x5
	.byte	0xd7
	.4byte	0x2aa
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x5
	.byte	0xda
	.4byte	0x60
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x5
	.byte	0xdb
	.4byte	0x80
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF62
	.byte	0x5
	.byte	0xde
	.4byte	0x41e
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF63
	.byte	0x5
	.byte	0xe2
	.4byte	0x104
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF64
	.byte	0x5
	.byte	0xe4
	.4byte	0xf9
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF65
	.byte	0x5
	.byte	0xe5
	.4byte	0x60
	.byte	0x64
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.4byte	0x60
	.4byte	0x41e
	.uleb128 0x14
	.4byte	0x41e
	.uleb128 0x14
	.4byte	0x10f
	.uleb128 0x14
	.4byte	0x55b
	.uleb128 0x14
	.4byte	0x60
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x429
	.uleb128 0x15
	.4byte	0x41e
	.uleb128 0x16
	.4byte	.LASF66
	.2byte	0x428
	.byte	0x5
	.2byte	0x239
	.4byte	0x55b
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x23b
	.4byte	0x60
	.byte	0
	.uleb128 0x17
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x240
	.4byte	0x645
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x240
	.4byte	0x645
	.byte	0x8
	.uleb128 0x17
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x240
	.4byte	0x645
	.byte	0xc
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x242
	.4byte	0x60
	.byte	0x10
	.uleb128 0x17
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x243
	.4byte	0x827
	.byte	0x14
	.uleb128 0x17
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x246
	.4byte	0x60
	.byte	0x30
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x247
	.4byte	0x83d
	.byte	0x34
	.uleb128 0x17
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x249
	.4byte	0x60
	.byte	0x38
	.uleb128 0x17
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x24b
	.4byte	0x84f
	.byte	0x3c
	.uleb128 0x17
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x24e
	.4byte	0x16f
	.byte	0x40
	.uleb128 0x17
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x24f
	.4byte	0x60
	.byte	0x44
	.uleb128 0x17
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x250
	.4byte	0x16f
	.byte	0x48
	.uleb128 0x17
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x251
	.4byte	0x855
	.byte	0x4c
	.uleb128 0x17
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x254
	.4byte	0x60
	.byte	0x50
	.uleb128 0x17
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x255
	.4byte	0x55b
	.byte	0x54
	.uleb128 0x17
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x278
	.4byte	0x805
	.byte	0x58
	.uleb128 0x18
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x27c
	.4byte	0x28c
	.2byte	0x148
	.uleb128 0x18
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x27d
	.4byte	0x24e
	.2byte	0x14c
	.uleb128 0x18
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x281
	.4byte	0x867
	.2byte	0x2dc
	.uleb128 0x18
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x286
	.4byte	0x60a
	.2byte	0x2e0
	.uleb128 0x18
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x287
	.4byte	0x873
	.2byte	0x2ec
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x561
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF88
	.uleb128 0x15
	.4byte	0x561
	.uleb128 0xf
	.byte	0x4
	.4byte	0x3ff
	.uleb128 0x13
	.byte	0x1
	.4byte	0x60
	.4byte	0x592
	.uleb128 0x14
	.4byte	0x41e
	.uleb128 0x14
	.4byte	0x10f
	.uleb128 0x14
	.4byte	0x592
	.uleb128 0x14
	.4byte	0x60
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x568
	.uleb128 0xf
	.byte	0x4
	.4byte	0x573
	.uleb128 0x13
	.byte	0x1
	.4byte	0x8b
	.4byte	0x5bd
	.uleb128 0x14
	.4byte	0x41e
	.uleb128 0x14
	.4byte	0x10f
	.uleb128 0x14
	.4byte	0x8b
	.uleb128 0x14
	.4byte	0x60
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x59e
	.uleb128 0x13
	.byte	0x1
	.4byte	0x60
	.4byte	0x5d8
	.uleb128 0x14
	.4byte	0x41e
	.uleb128 0x14
	.4byte	0x10f
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x5c3
	.uleb128 0x8
	.4byte	0x2f
	.4byte	0x5ee
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	0x2f
	.4byte	0x5fe
	.uleb128 0x9
	.4byte	0xd1
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF89
	.byte	0x5
	.2byte	0x11f
	.4byte	0x2d5
	.uleb128 0x19
	.4byte	.LASF90
	.byte	0xc
	.byte	0x5
	.2byte	0x123
	.4byte	0x63f
	.uleb128 0x17
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x125
	.4byte	0x63f
	.byte	0
	.uleb128 0x17
	.4byte	.LASF91
	.byte	0x5
	.2byte	0x126
	.4byte	0x60
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF92
	.byte	0x5
	.2byte	0x127
	.4byte	0x645
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x60a
	.uleb128 0xf
	.byte	0x4
	.4byte	0x5fe
	.uleb128 0x19
	.4byte	.LASF93
	.byte	0xe
	.byte	0x5
	.2byte	0x13f
	.4byte	0x680
	.uleb128 0x17
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x140
	.4byte	0x680
	.byte	0
	.uleb128 0x17
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x141
	.4byte	0x680
	.byte	0x6
	.uleb128 0x17
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x142
	.4byte	0x3d
	.byte	0xc
	.byte	0
	.uleb128 0x8
	.4byte	0x3d
	.4byte	0x690
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.byte	0xd0
	.byte	0x5
	.2byte	0x259
	.4byte	0x791
	.uleb128 0x17
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x25b
	.4byte	0x67
	.byte	0
	.uleb128 0x17
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x25c
	.4byte	0x55b
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x25d
	.4byte	0x791
	.byte	0x8
	.uleb128 0x17
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x25e
	.4byte	0x185
	.byte	0x24
	.uleb128 0x17
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x25f
	.4byte	0x60
	.byte	0x48
	.uleb128 0x17
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x260
	.4byte	0x59
	.byte	0x50
	.uleb128 0x17
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x261
	.4byte	0x64b
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x262
	.4byte	0xf9
	.byte	0x68
	.uleb128 0x17
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x263
	.4byte	0xf9
	.byte	0x70
	.uleb128 0x17
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x264
	.4byte	0xf9
	.byte	0x78
	.uleb128 0x17
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x265
	.4byte	0x7a1
	.byte	0x80
	.uleb128 0x17
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x266
	.4byte	0x7b1
	.byte	0x88
	.uleb128 0x17
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x267
	.4byte	0x60
	.byte	0xa0
	.uleb128 0x17
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x268
	.4byte	0xf9
	.byte	0xa4
	.uleb128 0x17
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x269
	.4byte	0xf9
	.byte	0xac
	.uleb128 0x17
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x26a
	.4byte	0xf9
	.byte	0xb4
	.uleb128 0x17
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x26b
	.4byte	0xf9
	.byte	0xbc
	.uleb128 0x17
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x26c
	.4byte	0xf9
	.byte	0xc4
	.uleb128 0x17
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x26d
	.4byte	0x60
	.byte	0xcc
	.byte	0
	.uleb128 0x8
	.4byte	0x561
	.4byte	0x7a1
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x19
	.byte	0
	.uleb128 0x8
	.4byte	0x561
	.4byte	0x7b1
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	0x561
	.4byte	0x7c1
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x17
	.byte	0
	.uleb128 0x1a
	.byte	0xf0
	.byte	0x5
	.2byte	0x272
	.4byte	0x7e5
	.uleb128 0x17
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x275
	.4byte	0x7e5
	.byte	0
	.uleb128 0x17
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x276
	.4byte	0x7f5
	.byte	0x78
	.byte	0
	.uleb128 0x8
	.4byte	0x2cf
	.4byte	0x7f5
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x1d
	.byte	0
	.uleb128 0x8
	.4byte	0x67
	.4byte	0x805
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x1d
	.byte	0
	.uleb128 0x1b
	.byte	0xf0
	.byte	0x5
	.2byte	0x257
	.4byte	0x827
	.uleb128 0x1c
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x26e
	.4byte	0x690
	.uleb128 0x1c
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x277
	.4byte	0x7c1
	.byte	0
	.uleb128 0x8
	.4byte	0x561
	.4byte	0x837
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x18
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF143
	.byte	0x1
	.uleb128 0xf
	.byte	0x4
	.4byte	0x837
	.uleb128 0x1e
	.byte	0x1
	.4byte	0x84f
	.uleb128 0x14
	.4byte	0x41e
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x843
	.uleb128 0xf
	.byte	0x4
	.4byte	0x16f
	.uleb128 0x1e
	.byte	0x1
	.4byte	0x867
	.uleb128 0x14
	.4byte	0x60
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x86d
	.uleb128 0xf
	.byte	0x4
	.4byte	0x85b
	.uleb128 0x8
	.4byte	0x5fe
	.4byte	0x883
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x2
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x2fe
	.4byte	0x41e
	.byte	0x1
	.byte	0x1
	.uleb128 0x1f
	.4byte	.LASF120
	.byte	0x5
	.2byte	0x2ff
	.4byte	0x424
	.byte	0x1
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF121
	.byte	0x6
	.byte	0x18
	.4byte	0x24
	.uleb128 0x20
	.4byte	.LASF122
	.byte	0x7
	.byte	0x9a
	.4byte	0x44
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.4byte	.LASF123
	.byte	0x7
	.byte	0x9b
	.4byte	0x60
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.4byte	0x55b
	.4byte	0x8d4
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x1
	.byte	0
	.uleb128 0x20
	.4byte	.LASF124
	.byte	0x7
	.byte	0x9e
	.4byte	0x8c4
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.byte	0x1
	.4byte	0x2f
	.byte	0x8
	.byte	0x8a
	.4byte	0x8fa
	.uleb128 0x22
	.4byte	.LASF125
	.byte	0
	.uleb128 0x22
	.4byte	.LASF126
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF127
	.byte	0x8
	.byte	0x91
	.4byte	0x8e1
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF128
	.uleb128 0x8
	.4byte	0x89f
	.4byte	0x91c
	.uleb128 0x9
	.4byte	0xd1
	.byte	0x5
	.byte	0
	.uleb128 0x20
	.4byte	.LASF129
	.byte	0x9
	.byte	0x89
	.4byte	0x89f
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.byte	0x1
	.4byte	0x2f
	.byte	0xa
	.byte	0x7d
	.4byte	0x94e
	.uleb128 0x22
	.4byte	.LASF130
	.byte	0
	.uleb128 0x22
	.4byte	.LASF131
	.byte	0x1
	.uleb128 0x22
	.4byte	.LASF132
	.byte	0x2
	.uleb128 0x22
	.4byte	.LASF133
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF134
	.byte	0xa
	.byte	0x82
	.4byte	0x929
	.uleb128 0xa
	.byte	0x8
	.byte	0xb
	.byte	0x21
	.4byte	0x986
	.uleb128 0xb
	.4byte	.LASF135
	.byte	0xb
	.byte	0x23
	.4byte	0x94e
	.byte	0
	.uleb128 0xb
	.4byte	.LASF136
	.byte	0xb
	.byte	0x24
	.4byte	0x8fa
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF137
	.byte	0xb
	.byte	0x25
	.4byte	0x90c
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF138
	.byte	0xb
	.byte	0x26
	.4byte	0x959
	.uleb128 0x8
	.4byte	0x986
	.4byte	0x9a1
	.uleb128 0x9
	.4byte	0xd1
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF139
	.byte	0xb
	.byte	0x38
	.4byte	0x991
	.byte	0x1
	.byte	0x1
	.uleb128 0x23
	.4byte	0x9a1
	.byte	0xc
	.byte	0x24
	.byte	0x5
	.byte	0x3
	.4byte	ble_central_app_link_table
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
	.uleb128 0x4
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
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x14
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF142:
	.ascii	"/home/ls/samba_share/sdk-ameba-v7.1d/project/realte"
	.ascii	"k_amebaz2_v0_example/GCC-RELEASE\000"
.LASF127:
	.ascii	"T_GAP_REMOTE_ADDR_TYPE\000"
.LASF38:
	.ascii	"_on_exit_args\000"
.LASF123:
	.ascii	"_daylight\000"
.LASF106:
	.ascii	"_wctomb_state\000"
.LASF103:
	.ascii	"_r48\000"
.LASF108:
	.ascii	"_signal_buf\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF52:
	.ascii	"_lbfsize\000"
.LASF50:
	.ascii	"_flags\000"
.LASF67:
	.ascii	"_errno\000"
.LASF11:
	.ascii	"_LOCK_RECURSIVE_T\000"
.LASF54:
	.ascii	"_read\000"
.LASF110:
	.ascii	"_mbrlen_state\000"
.LASF69:
	.ascii	"_stdout\000"
.LASF13:
	.ascii	"_fpos_t\000"
.LASF45:
	.ascii	"_fns\000"
.LASF53:
	.ascii	"_cookie\000"
.LASF27:
	.ascii	"_Bigint\000"
.LASF35:
	.ascii	"__tm_wday\000"
.LASF126:
	.ascii	"GAP_REMOTE_ADDR_LE_RANDOM\000"
.LASF77:
	.ascii	"_result\000"
.LASF139:
	.ascii	"ble_central_app_link_table\000"
.LASF31:
	.ascii	"__tm_hour\000"
.LASF18:
	.ascii	"__count\000"
.LASF30:
	.ascii	"__tm_min\000"
.LASF119:
	.ascii	"_impure_ptr\000"
.LASF116:
	.ascii	"_nextf\000"
.LASF93:
	.ascii	"_rand48\000"
.LASF78:
	.ascii	"_result_k\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF99:
	.ascii	"_asctime_buf\000"
.LASF49:
	.ascii	"__sFILE\000"
.LASF26:
	.ascii	"_wds\000"
.LASF89:
	.ascii	"__FILE\000"
.LASF61:
	.ascii	"_offset\000"
.LASF72:
	.ascii	"_emergency\000"
.LASF140:
	.ascii	"GNU C11 6.5.0 -march=armv8-m.main+dsp -mthumb -mcms"
	.ascii	"e -mfloat-abi=soft -mabi=aapcs -g -gdwarf-3 -gdwarf"
	.ascii	"-3 -Os -fstack-usage -fdata-sections -ffunction-sec"
	.ascii	"tions\000"
.LASF29:
	.ascii	"__tm_sec\000"
.LASF135:
	.ascii	"conn_state\000"
.LASF36:
	.ascii	"__tm_yday\000"
.LASF71:
	.ascii	"_inc\000"
.LASF44:
	.ascii	"_ind\000"
.LASF23:
	.ascii	"_next\000"
.LASF112:
	.ascii	"_mbsrtowcs_state\000"
.LASF124:
	.ascii	"_tzname\000"
.LASF19:
	.ascii	"__value\000"
.LASF79:
	.ascii	"_p5s\000"
.LASF114:
	.ascii	"_wcsrtombs_state\000"
.LASF104:
	.ascii	"_mblen_state\000"
.LASF88:
	.ascii	"char\000"
.LASF32:
	.ascii	"__tm_mday\000"
.LASF85:
	.ascii	"_sig_func\000"
.LASF111:
	.ascii	"_mbrtowc_state\000"
.LASF84:
	.ascii	"_atexit0\000"
.LASF130:
	.ascii	"GAP_CONN_STATE_DISCONNECTED\000"
.LASF21:
	.ascii	"_flock_t\000"
.LASF15:
	.ascii	"__wch\000"
.LASF92:
	.ascii	"_iobs\000"
.LASF121:
	.ascii	"uint8_t\000"
.LASF57:
	.ascii	"_close\000"
.LASF75:
	.ascii	"__sdidinit\000"
.LASF122:
	.ascii	"_timezone\000"
.LASF68:
	.ascii	"_stdin\000"
.LASF101:
	.ascii	"_gamma_signgam\000"
.LASF6:
	.ascii	"long long int\000"
.LASF47:
	.ascii	"_base\000"
.LASF80:
	.ascii	"_freelist\000"
.LASF95:
	.ascii	"_mult\000"
.LASF22:
	.ascii	"__ULong\000"
.LASF113:
	.ascii	"_wcrtomb_state\000"
.LASF51:
	.ascii	"_file\000"
.LASF131:
	.ascii	"GAP_CONN_STATE_CONNECTING\000"
.LASF76:
	.ascii	"__cleanup\000"
.LASF20:
	.ascii	"_mbstate_t\000"
.LASF37:
	.ascii	"__tm_isdst\000"
.LASF115:
	.ascii	"_h_errno\000"
.LASF128:
	.ascii	"_Bool\000"
.LASF33:
	.ascii	"__tm_mon\000"
.LASF9:
	.ascii	"long double\000"
.LASF55:
	.ascii	"_write\000"
.LASF43:
	.ascii	"_atexit\000"
.LASF64:
	.ascii	"_mbstate\000"
.LASF2:
	.ascii	"short int\000"
.LASF134:
	.ascii	"T_GAP_CONN_STATE\000"
.LASF4:
	.ascii	"long int\000"
.LASF87:
	.ascii	"__sf\000"
.LASF25:
	.ascii	"_sign\000"
.LASF62:
	.ascii	"_data\000"
.LASF16:
	.ascii	"__wchb\000"
.LASF120:
	.ascii	"_global_impure_ptr\000"
.LASF34:
	.ascii	"__tm_year\000"
.LASF100:
	.ascii	"_localtime_buf\000"
.LASF118:
	.ascii	"_unused\000"
.LASF10:
	.ascii	"__uint8_t\000"
.LASF83:
	.ascii	"_new\000"
.LASF81:
	.ascii	"_cvtlen\000"
.LASF24:
	.ascii	"_maxwds\000"
.LASF107:
	.ascii	"_l64a_buf\000"
.LASF60:
	.ascii	"_blksize\000"
.LASF28:
	.ascii	"__tm\000"
.LASF63:
	.ascii	"_lock\000"
.LASF125:
	.ascii	"GAP_REMOTE_ADDR_LE_PUBLIC\000"
.LASF133:
	.ascii	"GAP_CONN_STATE_DISCONNECTING\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF91:
	.ascii	"_niobs\000"
.LASF14:
	.ascii	"wint_t\000"
.LASF137:
	.ascii	"bd_addr\000"
.LASF40:
	.ascii	"_dso_handle\000"
.LASF82:
	.ascii	"_cvtbuf\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF109:
	.ascii	"_getdate_err\000"
.LASF141:
	.ascii	"../../../component/common/bluetooth/realtek/sdk/exa"
	.ascii	"mple/ble_central/ble_central_link_mgr.c\000"
.LASF96:
	.ascii	"_add\000"
.LASF46:
	.ascii	"__sbuf\000"
.LASF90:
	.ascii	"_glue\000"
.LASF132:
	.ascii	"GAP_CONN_STATE_CONNECTED\000"
.LASF129:
	.ascii	"bond_storage_num\000"
.LASF86:
	.ascii	"__sglue\000"
.LASF98:
	.ascii	"_strtok_last\000"
.LASF105:
	.ascii	"_mbtowc_state\000"
.LASF74:
	.ascii	"_locale\000"
.LASF39:
	.ascii	"_fnargs\000"
.LASF0:
	.ascii	"signed char\000"
.LASF66:
	.ascii	"_reent\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF41:
	.ascii	"_fntypes\000"
.LASF48:
	.ascii	"_size\000"
.LASF12:
	.ascii	"_off_t\000"
.LASF59:
	.ascii	"_nbuf\000"
.LASF97:
	.ascii	"_unused_rand\000"
.LASF73:
	.ascii	"_unspecified_locale_info\000"
.LASF65:
	.ascii	"_flags2\000"
.LASF42:
	.ascii	"_is_cxa\000"
.LASF138:
	.ascii	"T_APP_LINK\000"
.LASF136:
	.ascii	"bd_type\000"
.LASF94:
	.ascii	"_seed\000"
.LASF102:
	.ascii	"_rand_next\000"
.LASF143:
	.ascii	"__locale_t\000"
.LASF56:
	.ascii	"_seek\000"
.LASF70:
	.ascii	"_stderr\000"
.LASF117:
	.ascii	"_nmalloc\000"
.LASF58:
	.ascii	"_ubuf\000"
	.ident	"GCC: (Realtek ASDK-6.5.0 Build 3215) 6.5.0"
