
# Initialize tool chain
# -------------------------------------------------------------------

AMEBAZ2_TOOLDIR	= ../../../component/soc/realtek/8710c/misc/iar_utility
AMEBAZ2_GCCTOOLDIR	= ../../../component/soc/realtek/8710c/misc/gcc_utility
AMEBAZ2_BSPDIR = ../../../component/soc/realtek/8710c/misc/bsp
AMEBAZ2_BOOTLOADERDIR = $(AMEBAZ2_BSPDIR)/image
AMEBAZ2_ROMSYMDIR = $(AMEBAZ2_BSPDIR)/ROM

OS := $(shell uname)

CROSS_COMPILE = $(ARM_GCC_TOOLCHAIN)/arm-none-eabi-

# Compilation tools
AR = $(CROSS_COMPILE)ar
CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
NM = $(CROSS_COMPILE)nm
LD = $(CROSS_COMPILE)gcc
GDB = $(CROSS_COMPILE)gdb
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

OS := $(shell uname)

LDSCRIPT := ./rtl8710c_ram_ns.ld

# Initialize target name and target object files
# -------------------------------------------------------------------

all: build_info application_ns manipulate_images

mp: build_info application_ns manipulate_images

TARGET=application_ns

OBJ_DIR=$(TARGET)/Debug/obj
BIN_DIR=$(TARGET)/Debug/bin
INFO_DIR=$(TARGET)/Debug/info


ROMIMG = 
# Include folder list
# -------------------------------------------------------------------

INCLUDES =
INCLUDES += -I../inc

INCLUDES += -I../../../component/common/api
INCLUDES += -I../../../component/common/api/at_cmd
INCLUDES += -I../../../component/common/api/platform
INCLUDES += -I../../../component/common/api/wifi
INCLUDES += -I../../../component/common/api/wifi/rtw_wpa_supplicant/src
INCLUDES += -I../../../component/common/api/network/include
INCLUDES += -I../../../component/common/application
INCLUDES += -I../../../component/common/application/mqtt/MQTTClient
INCLUDES += -I../../../component/common/example
INCLUDES += -I../../../component/common/file_system
INCLUDES += -I../../../component/common/file_system/dct
INCLUDES += -I../../../component/common/file_system/fatfs
INCLUDES += -I../../../component/common/file_system/fatfs/r0.10c/include
INCLUDES += -I../../../component/common/file_system/ftl
INCLUDES += -I../../../component/common/utilities
INCLUDES += -I../../../component/common/mbed/hal
INCLUDES += -I../../../component/common/mbed/hal_ext
INCLUDES += -I../../../component/common/mbed/targets/hal/rtl8710c
INCLUDES += -I../../../component/common/network
INCLUDES += -I../../../component/common/network/coap/include
INCLUDES += -I../../../component/common/network/libcoap/include
INCLUDES += -I../../../component/common/network/http2/nghttp2-1.31.0/includes
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/src/include
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/src/include/lwip
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/port/realtek
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/port/realtek/freertos
INCLUDES += -I../../../component/common/network/ssl/mbedtls-2.4.0/include
INCLUDES += -I../../../component/common/network/ssl/ssl_ram_map/rom
INCLUDES += -I../../../component/common/drivers/wlan/realtek/include
INCLUDES += -I../../../component/common/drivers/wlan/realtek/src/osdep
INCLUDES += -I../../../component/common/test
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/app
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/gap
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/profile
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/profile/client
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/bluetooth/profile/server
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/os
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/platform
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/inc/stack
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/amebaz2/lib
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/data_uart
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/hci
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/os
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/vendor_cmd
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_config
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/ble_central
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/ble_peripheral
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/ble_scatternet
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/gap
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/inc
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/inc/amebaz2
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/platform
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/utility
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/provisioner
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/device
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/common
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/provisioner
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/device
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo/inc
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_device_rtk_demo
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/device_multiple_profile
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/provisioner_multiple_profile
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/src/mcu/module/data_uart_cmd
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/board/common/inc
INCLUDES += -I../../../component/common/bluetooth/realtek/sdk/example/bt_airsync_config
INCLUDES += -I../../../component/common/media/rtp_codec
INCLUDES += -I../../../component/common/media/mmfv2
INCLUDES += -I../../../component/common/application/airsync/1.0.4

INCLUDES += -I../../../component/soc/realtek/8710c/cmsis/rtl8710c/include
INCLUDES += -I../../../component/soc/realtek/8710c/cmsis/rtl8710c/lib/include
INCLUDES += -I../../../component/soc/realtek/8710c/fwlib/include
INCLUDES += -I../../../component/soc/realtek/8710c/fwlib/lib/include
INCLUDES += -I../../../component/soc/realtek/8710c/cmsis/cmsis-core/include
INCLUDES += -I../../../component/soc/realtek/8710c/app/rtl_printf/include
INCLUDES += -I../../../component/soc/realtek/8710c/app/shell
INCLUDES += -I../../../component/soc/realtek/8710c/app/stdio_port
INCLUDES += -I../../../component/soc/realtek/8710c/misc/utilities/include
INCLUDES += -I../../../component/soc/realtek/8710c/mbed-drivers/include
INCLUDES += -I../../../component/soc/realtek/8710c/misc/platform
INCLUDES += -I../../../component/soc/realtek/8710c/misc/driver
INCLUDES += -I../../../component/soc/realtek/8710c/misc/os

INCLUDES += -I../../../component/os/freertos
INCLUDES += -I../../../component/os/freertos/freertos_v10.2.0/Source/include
INCLUDES += -I../../../component/os/freertos/freertos_v10.2.0/Source/portable/GCC/RTL8710C/secure
INCLUDES += -I../../../component/os/freertos/freertos_v10.2.0/Source/portable/GCC/RTL8710C/non_secure
INCLUDES += -I../../../component/os/os_dep/include

# Source file list
# -------------------------------------------------------------------

SRC_C =
SRAM_C =
ERAM_C =

#bluetooth - board
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/hci/bt_fwconfig.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/hci/bt_mp_patch.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/hci/bt_normal_patch.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/common/src/cycle_queue.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/data_uart/data_uart.c
SRC_C += ../../../component/common/file_system/ftl/ftl.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/hci/hci_board.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/hci/hci_uart.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/common/os/freertos/osif_freertos.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/platform_utils.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/rtk_coex.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/trace_uart.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/src/vendor_cmd/vendor_cmd.c

#bluetooth - common
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/client/ancs_client.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/server/bas.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/client/bas_client.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/common/src/bt_uart_bridge.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/server/dis.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/client/gaps_client.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/common/src/hci_adapter.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/common/src/hci_process.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/server/hids.c
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/server/hids_kb.c
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/server/hids_rmc.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/client/simple_ble_client.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/server/simple_ble_service.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/board/common/src/trace_task.c

#bluetooth - example - ble_central
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_app_main.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_app_task.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_at_cmd.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_client_app.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_central/ble_central_link_mgr.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_central/user_cmd.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/ble/profile/client/gcs_client.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/src/mcu/module/data_uart_cmd/user_cmd_parse.c

#bluetooth - example - ble_peripheral
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_peripheral/app_task.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_peripheral/ble_app_main.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_peripheral/ble_peripheral_at_cmd.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_peripheral/peripheral_app.c

#bluetooth - example - ble_scatternet
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_scatternet/ble_scatternet_app.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_scatternet/ble_scatternet_app_main.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_scatternet/ble_scatternet_app_task.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_scatternet/ble_scatternet_link_mgr.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/ble_scatternet/ble_scatternet_user_cmd.c

#bluetooth - example - bt_beacon
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_beacon/bt_beacon_app.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_beacon/bt_beacon_app_main.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_beacon/bt_beacon_app_task.c

#bluetooth - example - bt_config
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_config/bt_config_app_main.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_config/bt_config_app_task.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_config/bt_config_peripheral_app.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_config/bt_config_service.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_config/bt_config_wifi.c

#bluetooth - example - bt_airsync_config
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_airsync_config/bt_airsync_config_app_main.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_airsync_config/bt_airsync_config_app_task.c
SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_airsync_config/bt_airsync_config_peripheral_app.c
SRC_C += ../../../component/common/application/airsync/1.0.4/airsync_ble_service.c
SRC_C += ../../../component/common/application/airsync/1.0.4/check_endian.c
SRC_C += ../../../component/common/application/airsync/1.0.4/epb.c
SRC_C += ../../../component/common/application/airsync/1.0.4/epb_MmBp.c
SRC_C += ../../../component/common/application/airsync/1.0.4/epb_WristBand.c
SRC_C += ../../../component/common/application/airsync/1.0.4/wechat_airsync_protocol.c

#bluetooth - example - bt_mesh_provisioner 
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_data_uart.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_user_cmd_parse.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_service.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/configuration_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/health_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/ping_control.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/datatrans_model.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/tp_control.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/light_cwrgb_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_on_off_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_default_transition_time_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_level_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_location_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_power_on_off_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_property_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_lightness_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_xyl_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_power_level_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_battery_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/time_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scene_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/sensor_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scheduler_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/provisioner/bt_mesh_provisioner_app_task.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/provisioner/provisioner_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/datatrans_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/ping_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/generic_client_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/light_client_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/client_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/test_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/provisioner/provisioner_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/provisioner/bt_mesh_provisioner_app_main.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/provisioner/bt_mesh_provisioner_api.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/bt_mesh_user_api.c 

#bluetooth - example - bt_mesh_device 
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_data_uart.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_user_cmd_parse.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_server.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_service.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_temperature_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_hue_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_saturation_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_lightness_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_lightness_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_xyl_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_xyl_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/time_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/time_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_on_off_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/delay_execution.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_transition_time.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/ping_control.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/datatrans_model.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/tp_control.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/health_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scene_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scene_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scheduler_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scheduler_setup_server.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/device/bt_mesh_device_app_task.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/device/device_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/datatrans_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/ping_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/light_server_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/time_server_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/scene_server_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/scheduler_server_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/test_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/device/device_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/device/bt_mesh_device_app_main.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/device/bt_mesh_device_api.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/bt_mesh_user_api.c 

#bluetooth - example - bt_mesh_provisioner_rtk_demo 
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo/example_bt_mesh_provisioner_rtk_demo.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo/src/bt_mesh_app_http_intf.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo/src/bt_mesh_app_lib_intf.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo/src/bt_mesh_app_list_intf.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_provisioner_rtk_demo/src/bt_mesh_broadcast_demo.c

#bluetooth - example - provisioner_multiple_profile
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_data_uart.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_user_cmd_parse.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_service.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/configuration_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/health_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/ping_control.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/datatrans_model.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/tp_control.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/light_cwrgb_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_on_off_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_default_transition_time_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_level_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_location_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_power_on_off_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_property_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_lightness_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_xyl_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_power_level_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_battery_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/time_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scene_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/sensor_client.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scheduler_client.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/datatrans_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/ping_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/generic_client_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/light_client_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/client_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/test_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/provisioner/bt_mesh_provisioner_api.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/bt_mesh_user_api.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/provisioner_multiple_profile/bt_mesh_provisioner_multiple_profile_app_main.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/provisioner_multiple_profile/bt_mesh_provisioner_multiple_profile_app_task.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/provisioner_multiple_profile/provisioner_multiple_profile_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/provisioner_multiple_profile/provisioner_multiple_profile_cmd.c

#bluetooth - example - device_multiple_profile
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_data_uart.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_user_cmd_parse.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_server.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/profile/datatrans_service.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_ctl_temperature_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_hue_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_saturation_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_hsl_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_lightness_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_lightness_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_xyl_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/light_xyl_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/time_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/time_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_on_off_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/delay_execution.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/generic_transition_time.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/ping_control.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/datatrans_model.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/realtek/tp_control.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/health_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scene_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scene_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scheduler_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/model/scheduler_setup_server.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/datatrans_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/ping_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/light_server_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/time_server_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/scene_server_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/common/scheduler_server_app.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/mesh_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/cmd/test_cmd.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/device/bt_mesh_device_api.c \
    ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/api/bt_mesh_user_api.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/device_multiple_profile/bt_mesh_device_multiple_profile_app_main.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/device_multiple_profile/bt_mesh_device_multiple_profile_app_task.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/device_multiple_profile/device_multiple_profile_app.c \
	../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_multiple_profile/device_multiple_profile/device_multiple_profile_cmd.c

#bluetooth - example - bt_mesh_device_rtk_demo 
#SRC_C += ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh_device_rtk_demo/example_bt_mesh_device_rtk_demo.c 

#bluetooth - example
SRC_C += ../../../component/common/bluetooth/realtek/sdk/bt_example_entry.c

#cmsis
SRC_C += ../../../component/soc/realtek/8710c/cmsis/rtl8710c/source/ram_ns/app_start.c
SRC_C += ../../../component/soc/realtek/8710c/cmsis/rtl8710c/source/ram/sys_irq.c
SRC_C += ../../../component/soc/realtek/8710c/cmsis/rtl8710c/source/ram/mpu_config.c
SRC_C += ../../../component/soc/realtek/8710c/cmsis/rtl8710c/source/ram_ns/system_rtl8710c_ns.c

#libc api wrapper
SRC_C += ../../../component/soc/realtek/8710c/misc/utilities/source/ram/libc_wrap.c

#console
SRC_C += ../../../component/common/api/at_cmd/atcmd_bt.c
SRC_C += ../../../component/common/api/at_cmd/atcmd_lwip.c
SRC_C += ../../../component/common/api/at_cmd/atcmd_mp.c
SRC_C += ../../../component/common/api/at_cmd/atcmd_mp_ext2.c
SRC_C += ../../../component/common/api/at_cmd/atcmd_sys.c
SRC_C += ../../../component/common/api/at_cmd/atcmd_wifi.c
SRC_C += ../../../component/soc/realtek/8710c/app/shell/cmd_shell.c
SRC_C += ../../../component/common/api/at_cmd/log_service.c
SRC_C += ../../../component/soc/realtek/8710c/misc/driver/rtl_console.c

# network - api
SRC_C += ../../../component/common/api/lwip_netconf.c

#network - api - wifi
SRC_C += ../../../component/common/api/wifi/wifi_conf.c
SRC_C += ../../../component/common/api/wifi/wifi_ind.c
SRC_C += ../../../component/common/api/wifi/wifi_promisc.c
SRC_C += ../../../component/common/api/wifi/wifi_simple_config.c
SRC_C += ../../../component/common/api/wifi/wifi_util.c

#network - api - wifi - rtw_wpa_supplicant
SRC_C += ../../../component/common/api/wifi/rtw_wpa_supplicant/src/crypto/tls_polarssl.c
SRC_C += ../../../component/common/api/wifi/rtw_wpa_supplicant/wpa_supplicant/wifi_eap_config.c
SRC_C += ../../../component/common/api/wifi/rtw_wpa_supplicant/wpa_supplicant/wifi_p2p_config.c
SRC_C += ../../../component/common/api/wifi/rtw_wpa_supplicant/wpa_supplicant/wifi_wps_config.c

#network - app
SRC_C += ../../../component/soc/realtek/8710c/misc/platform/ota_8710c.c
SRC_C += ../../../component/common/api/network/src/ping_test.c
SRC_C += ../../../component/common/utilities/ssl_client.c
SRC_C += ../../../component/common/utilities/ssl_client_ext.c
# SRC_C += ../../../component/common/utilities/ssl_client_ns.c
# SRC_C += ../../../component/common/utilities/ssl_client_ext_ns.c
SRC_C += ../../../component/common/utilities/tcptest.c
SRC_C += ../../../component/common/api/network/src/wlan_network.c

#utilities
SRC_C += ../../../component/common/utilities/cJSON.c
SRC_C += ../../../component/common/utilities/http_client.c
SRC_C += ../../../component/common/utilities/xml.c

#network - app - mqtt
SRC_C += ../../../component/common/application/mqtt/MQTTClient/MQTTClient.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTConnectClient.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTConnectServer.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTDeserializePublish.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTFormat.c
SRC_C += ../../../component/common/application/mqtt/MQTTClient/MQTTFreertos.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTPacket.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTSerializePublish.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTSubscribeClient.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTSubscribeServer.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTUnsubscribeClient.c
SRC_C += ../../../component/common/application/mqtt/MQTTPacket/MQTTUnsubscribeServer.c

#network - coap
SRC_C += ../../../component/common/network/coap/sn_coap_ameba_port.c
SRC_C += ../../../component/common/network/coap/sn_coap_builder.c
SRC_C += ../../../component/common/network/coap/sn_coap_header_check.c
SRC_C += ../../../component/common/network/coap/sn_coap_parser.c
SRC_C += ../../../component/common/network/coap/sn_coap_protocol.c

#network - http
SRC_C += ../../../component/common/network/httpc/httpc_tls.c
SRC_C += ../../../component/common/network/httpd/httpd_tls.c

#network
SRC_C += ../../../component/common/network/dhcp/dhcps.c
SRC_C += ../../../component/common/network/sntp/sntp.c

#network - lwip
#network - lwip - api
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/api_lib.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/api_msg.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/err.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/netbuf.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/netdb.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/netifapi.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/sockets.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/api/tcpip.c

#network - lwip - core
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/def.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/dns.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/inet_chksum.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/init.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ip.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/mem.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/memp.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/netif.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/pbuf.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/raw.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/stats.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/sys.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/tcp.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/tcp_in.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/tcp_out.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/timeouts.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/udp.c

#network - lwip - core - ipv4
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/autoip.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/dhcp.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/etharp.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/icmp.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/igmp.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/ip4.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/ip4_addr.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv4/ip4_frag.c

#network - lwip - core - ipv6
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/dhcp6.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/ethip6.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/icmp6.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/inet6.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/ip6.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/ip6_addr.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/ip6_frag.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/mld6.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/core/ipv6/nd6.c

#network - lwip - netif
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/src/netif/ethernet.c

#network - lwip - port
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/port/realtek/freertos/ethernetif.c
SRC_C += ../../../component/common/drivers/wlan/realtek/src/osdep/lwip_intf.c
SRC_C += ../../../component/common/network/lwip/lwip_v2.0.2/port/realtek/freertos/sys_arch.c

#network - mdns
SRC_C += ../../../component/common/network/mDNS/mDNSPlatform.c

#network - ssl - mbedtls
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/aesni.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/blowfish.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/camellia.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ccm.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/certs.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/cipher.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/cipher_wrap.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/cmac.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/debug.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/error.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/gcm.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/havege.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/md.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/md2.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/md4.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/md_wrap.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/memory_buffer_alloc.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/net_sockets.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/padlock.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/pkcs11.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/pkcs12.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/pkcs5.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/pkparse.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/platform.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ripemd160.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/sha256.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_cache.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_ciphersuites.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_cli.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_cookie.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_srv.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_ticket.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/ssl_tls.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/threading.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/timing.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/version.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/version_features.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509_create.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509_crl.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509_crt.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509_csr.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509write_crt.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/x509write_csr.c
SRC_C += ../../../component/common/network/ssl/mbedtls-2.4.0/library/xtea.c

#network - ssl - ssl_ram_map
SRC_C += ../../../component/common/network/ssl/ssl_ram_map/rom/rom_ssl_ram_map.c
SRC_C += ../../../component/common/network/ssl/ssl_func_stubs/ssl_func_stubs.c

#network - websocket
SRC_C += ../../../component/common/network/websocket/wsclient_tls.c
SRC_C += ../../../component/common/network/websocket/wsserver_tls.c

#os
SRC_C += ../../../component/os/freertos/cmsis_os.c
SRC_C += ../../../component/os/os_dep/device_lock.c
SRC_C += ../../../component/os/freertos/freertos_cb.c
SRC_C += ../../../component/os/freertos/freertos_service.c
SRC_C += ../../../component/os/freertos/freertos_heap5_config.c
SRC_C += ../../../component/os/freertos/freertos_heap_rtk.c
SRC_C += ../../../component/os/os_dep/osdep_service.c
SRC_C += ../../../component/os/freertos/freertos_pmu.c

#os - freertos
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/croutine.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/event_groups.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/list.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/queue.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/stream_buffer.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/tasks.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/timers.c

#os - freertos - portable
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/portable/GCC/RTL8710C/non_secure/port.c
SRC_C += ../../../component/os/freertos/freertos_v10.2.0/Source/portable/GCC/RTL8710C/non_secure/portasm.c

#peripheral-api
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/crypto_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/dma_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/efuse_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/gpio_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/gpio_irq_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/i2c_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/pinmap.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/pinmap_common.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/port_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/pwmout_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/rtc_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/serial_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/spdio_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/spi_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/sys_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/timer_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/us_ticker.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/us_ticker_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/wait_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/wdt_api.c
SRC_C += ../../../component/common/mbed/targets/hal/rtl8710c/reset_reason_api.c

#peripheral - hal
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram/hal_gdma.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram/hal_gpio.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram_ns/hal_i2c.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram/hal_misc.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram_ns/hal_pwm.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram_ns/hal_sdio_dev.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram_ns/hal_ssi.c
SRC_C += ../../../component/soc/realtek/8710c/fwlib/source/ram/hal_uart.c

#file_system - fatfs
SRC_C += ../../../component/common/file_system/fatfs/fatfs_ext/src/ff_driver.c
SRC_C += ../../../component/common/file_system/fatfs/r0.10c/src/diskio.c
SRC_C += ../../../component/common/file_system/fatfs/r0.10c/src/ff.c
SRC_C += ../../../component/common/file_system/fatfs/r0.10c/src/option/ccsbcs.c
SRC_C += ../../../component/common/file_system/fatfs/disk_if/src/flash_fatfs.c 

#utilities - example
#SRC_C += ../../../component/common/example/amazon_awsiot/example_amazon_awsiot.c
SRC_C += ../../../component/common/example/bcast/example_bcast.c
SRC_C += ../../../component/common/example/cJSON/example_cJSON.c
SRC_C += ../../../component/common/example/coap/example_coap.c
SRC_C += ../../../component/common/example/coap_client/example_coap_client.c
SRC_C += ../../../component/common/example/coap_server/example_coap_server.c
SRC_C += ../../../component/common/example/dct/example_dct.c
#SRC_C += ../../../component/common/example/eap/example_eap.c
SRC_C += ../../../component/common/example/example_entry.c
SRC_C += ../../../component/common/example/get_beacon_frame/example_get_beacon_frame.c
#SRC_C += ../../../component/common/example/googlenest/example_google.c
SRC_C += ../../../component/common/example/high_load_memory_use/example_high_load_memory_use.c
SRC_C += ../../../component/common/example/http_client/example_http_client.c
SRC_C += ../../../component/common/example/http_download/example_http_download.c
SRC_C += ../../../component/common/example/httpc/example_httpc.c
SRC_C += ../../../component/common/example/httpd/example_httpd.c
SRC_C += ../../../component/common/example/mcast/example_mcast.c
SRC_C += ../../../component/common/example/mqtt/example_mqtt.c
SRC_C += ../../../component/common/example/nonblock_connect/example_nonblock_connect.c
SRC_C += ../../../component/common/example/ota_http/example_ota_http.c
SRC_C += ../../../component/common/example/rarp/example_rarp.c
SRC_C += ../../../component/common/example/secure_boot/example_secure_boot.c
SRC_C += ../../../component/common/example/secure_storage/example_secure_storage_ns.c
SRC_C += ../../../component/common/example/sntp_showtime/example_sntp_showtime.c
SRC_C += ../../../component/common/example/socket_select/example_socket_select.c
SRC_C += ../../../component/common/example/socket_tcp_trx/example_socket_tcp_trx_1.c
SRC_C += ../../../component/common/example/socket_tcp_trx/example_socket_tcp_trx_2.c
SRC_C += ../../../component/common/example/ssl_download/example_ssl_download.c
SRC_C += ../../../component/common/example/ssl_server/example_ssl_server.c
SRC_C += ../../../component/common/example/tcp_keepalive/example_tcp_keepalive.c
SRC_C += ../../../component/common/example/trust_zone/example_trust_zone.c
SRC_C += ../../../component/common/example/uart_atcmd/example_uart_atcmd.c
SRC_C += ../../../component/common/example/wifi_mac_monitor/example_wifi_mac_monitor.c
SRC_C += ../../../component/common/example/wifi_roaming/example_wifi_roaming.c
SRC_C += ../../../component/common/example/wlan_fast_connect/example_wlan_fast_connect.c
SRC_C += ../../../component/common/example/wlan_scenario/example_wlan_scenario.c
SRC_C += ../../../component/common/example/websocket_client/example_wsclient.c
SRC_C += ../../../component/common/example/xml/example_xml.c
SRC_C += ../../../component/common/example/fatfs/example_fatfs.c

#user
SRC_C += ../src/main.c

#SRAM
# -------------------------------------------------------------------
#@SRAM
SRAM_C += ../../../component/common/mbed/targets/hal/rtl8710c/flash_api.c
SRAM_C += ../../../component/soc/realtek/8710c/misc/driver/flash_api_ext.c
SRAM_C += ../../../component/soc/realtek/8710c/fwlib/source/ram_ns/hal_flash.c
SRAM_C += ../../../component/soc/realtek/8710c/fwlib/source/ram_ns/hal_spic.c
SRAM_C += ../../../component/common/mbed/targets/hal/rtl8710c/power_mode_api.c

# Generate obj list
# -------------------------------------------------------------------

SRC_O = $(patsubst %.c,%_$(TARGET).o,$(SRC_C))
SRAM_O = $(patsubst %.c,%_$(TARGET).o,$(SRAM_C))
ERAM_O = $(patsubst %.c,%_$(TARGET).o,$(ERAM_C))

SRC_C_LIST = $(notdir $(SRC_C)) $(notdir $(SRAM_C)) $(notdir $(ERAM_C))
OBJ_LIST = $(addprefix $(OBJ_DIR)/,$(patsubst %.c,%_$(TARGET).o,$(SRC_C_LIST)))
DEPENDENCY_LIST = $(addprefix $(OBJ_DIR)/,$(patsubst %.c,%_$(TARGET).d,$(SRC_C_LIST)))

# Compile options
# -------------------------------------------------------------------

CFLAGS =
CFLAGS += -march=armv8-m.main+dsp -mthumb -mcmse -mfloat-abi=soft -D__thumb2__ -g -gdwarf-3 -Os
CFLAGS += -D__ARM_ARCH_8M_MAIN__=1 -gdwarf-3 -fstack-usage -fdata-sections -ffunction-sections 
CFLAGS += -fdiagnostics-color=always -Wall -Wpointer-arith -Wstrict-prototypes -Wundef -Wno-write-strings 
CFLAGS += -Wno-maybe-uninitialized --save-temps -c -MMD
CFLAGS += -DCONFIG_PLATFORM_8710C -DCONFIG_BUILD_RAM=1
CFLAGS += -DV8M_STKOVF
CFLAGS += -DV8M_SECURE
CFLAGS += -DCONFIG_BUILD_NONSECURE=1
CFLAGS += -DENABLE_SECCALL_PATCH
CFLAGS += -include time64.h

LFLAGS = 
LFLAGS += -Os -march=armv8-m.main+dsp -mthumb -mcmse -mfloat-abi=soft -nostartfiles -nodefaultlibs -nostdlib -specs=nosys.specs
LFLAGS += -Wl,--gc-sections -Wl,--warn-section-align -Wl,--cref -Wl,--build-id=none -Wl,--use-blx
LFLAGS += -Wl,-Map=$(BIN_DIR)/$(TARGET).map
# libc api wrapper
LFLAGS += -Wl,-wrap,strcat  -Wl,-wrap,strchr   -Wl,-wrap,strcmp
LFLAGS += -Wl,-wrap,strncmp -Wl,-wrap,strnicmp -Wl,-wrap,strcpy
LFLAGS += -Wl,-wrap,strncpy -Wl,-wrap,strlcpy  -Wl,-wrap,strlen
LFLAGS += -Wl,-wrap,strnlen -Wl,-wrap,strncat  -Wl,-wrap,strpbrk
LFLAGS += -Wl,-wrap,strspn  -Wl,-wrap,strstr   -Wl,-wrap,strtok
LFLAGS += -Wl,-wrap,strxfrm -Wl,-wrap,strsep   -Wl,-wrap,strtod
LFLAGS += -Wl,-wrap,strtof  -Wl,-wrap,strtold  -Wl,-wrap,strtoll
LFLAGS += -Wl,-wrap,strtoul -Wl,-wrap,strtoull -Wl,-wrap,atoi
LFLAGS += -Wl,-wrap,atoui   -Wl,-wrap,atol     -Wl,-wrap,atoul
LFLAGS += -Wl,-wrap,atoull  -Wl,-wrap,atof
LFLAGS += -Wl,-wrap,malloc  -Wl,-wrap,realloc
LFLAGS += -Wl,-wrap,calloc  -Wl,-wrap,free
LFLAGS += -Wl,-wrap,_malloc_r  -Wl,-wrap,_calloc_r
LFLAGS += -Wl,-wrap,memcmp  -Wl,-wrap,memcpy
LFLAGS += -Wl,-wrap,memmove -Wl,-wrap,memset
LFLAGS += -Wl,-wrap,printf  -Wl,-wrap,sprintf
LFLAGS += -Wl,-wrap,puts  -Wl,-wrap,putc -Wl,-wrap,putchar
LFLAGS += -Wl,-wrap,snprintf  -Wl,-wrap,vsnprintf
LFLAGS += -Wl,-wrap,localtime -Wl,-wrap,mktime

LFLAGS += -Wl,-wrap,hal_crypto_engine_init_platform  -Wl,-wrap,hal_pinmux_register
LFLAGS += -Wl,-wrap,hal_pinmux_unregister  -Wl,-wrap,hal_xip_get_phy
#LFLAGS += -Wl,-wrap,crypto_random_generate
LFLAGS += -Wl,-wrap,hal_efuse_autoload_en
LFLAGS += -Wl,-wrap,hal_efuse_hci_autoload_en
LFLAGS += -Wl,-wrap,hal_efuse_read
LFLAGS += -Wl,-wrap,hal_efuse_write
LFLAGS += -Wl,-wrap,hal_sec_efuse_read
LFLAGS += -Wl,-wrap,hal_sec_efuse_write
LFLAGS += -Wl,-wrap,hal_sec_key_get
LFLAGS += -Wl,-wrap,hal_sec_key_write
LFLAGS += -Wl,-wrap,hal_susec_key_get
LFLAGS += -Wl,-wrap,hal_susec_key_write
LFLAGS += -Wl,-wrap,hal_s_jtag_key_write
LFLAGS += -Wl,-wrap,hal_ns_jtag_key_write
LFLAGS += -Wl,-wrap,hal_user_otp_get
LFLAGS += -Wl,-wrap,hal_user_otp_set
LFLAGS += -Wl,-wrap,hal_efuse_disable_sec_jtag

LFLAGS += ./gateway_ns.o
LFLAGS += ../../../component/common/file_system/ftl/ftl_crypto_plugin_gcc.o

LIBFLAGS =
LIBFLAGS += -L$(AMEBAZ2_ROMSYMDIR)
LIBFLAGS += -Wl,--start-group ../../../component/soc/realtek/8710c/fwlib/lib/lib/hal_pmc.a -Wl,--end-group
LIBFLAGS += -Wl,--start-group ../../../component/common/bluetooth/realtek/sdk/board/amebaz2/lib/btgap.a -Wl,--end-group
#LIBFLAGS += -Wl,--start-group ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/lib/amebaz2/btmesh_prov.a -Wl,--end-group
#LIBFLAGS += -Wl,--start-group ../../../component/common/bluetooth/realtek/sdk/example/bt_mesh/lib/lib/amebaz2/btmesh_dev.a -Wl,--end-group
LIBFLAGS += -L../../../component/soc/realtek/8710c/misc/bsp/lib/common/GCC -l_soc_ns -l_dct_ns -l_eap_ns -l_http_ns -l_p2p_ns -l_websocket_ns -l_wlan_ns -l_wps_ns
#LIBFLAGS += -L../../../component/soc/realtek/8710c/misc/bsp/lib/common/GCC -l_coap_ns

all: LIBFLAGS += -l_wlan_ns
mp: LIBFLAGS += -l_wlan_mp_ns

RAMALL_BIN =
OTA_BIN = 

include toolchain.mk

# Compile
# -------------------------------------------------------------------

.PHONY: application_ns
application_ns: prerequirement $(SRC_O) $(SRAM_O) $(ERAM_O)
	$(LD) $(LFLAGS) -o $(BIN_DIR)/$(TARGET).axf  $(OBJ_LIST) $(ROMIMG) $(LIBFLAGS) -T$(LDSCRIPT)  
	$(OBJDUMP) -d $(BIN_DIR)/$(TARGET).axf > $(BIN_DIR)/$(TARGET).asm

# Manipulate Image
# -------------------------------------------------------------------
	
.PHONY: manipulate_images
manipulate_images: | application_ns
	@echo ===========================================================
	@echo Image manipulating
	@echo ===========================================================
	# cp $(AMEBAZ2_BOOTLOADERDIR)/bootloader.bin $(BIN_DIR)/bootloader.bin
# ifeq ($(findstring Linux, $(OS)), Linux)
#	chmod 0774 $(ELF2BIN)
# endif
	# $(ELF2BIN) keygen keycfg.json
	# $(ELF2BIN) convert amebaz2_bootloader.json PARTITIONTABLE
	# $(ELF2BIN) convert amebaz2_firmware_is.json FIRMWARE
	# $(ELF2BIN) combine $(BIN_DIR)/flash_is.bin PTAB=partition.bin,BOOT=$(BIN_DIR)/bootloader.bin,FW1=$(BIN_DIR)/firmware_is.bin

# Generate build info
# -------------------------------------------------------------------	

.PHONY: build_info
build_info:
	@echo \#define RTL_FW_COMPILE_TIME RTL8710CFW_COMPILE_TIME\ > .ver
	@echo \#define RTL_FW_COMPILE_DATE RTL8710CFW_COMPILE_DATE\ >> .ver
	@echo \#define UTS_VERSION \"`date +%Y/%m/%d-%T`\" >> .ver
	@echo \#define RTL8710CFW_COMPILE_TIME \"`date +%Y/%m/%d-%T`\" >> .ver
	@echo \#define RTL8710CFW_COMPILE_DATE \"`date +%Y%m%d`\" >> .ver
	@echo \#define RTL8710CFW_COMPILE_BY \"`id -u -n`\" >> .ver
	@echo \#define RTL8710CFW_COMPILE_HOST \"`$(HOSTNAME_APP)`\" >> .ver
	@if [ -x /bin/dnsdomainname ]; then \
		echo \#define RTL8710CFW_COMPILE_DOMAIN \"`dnsdomainname`\"; \
	elif [ -x /bin/domainname ]; then \
		echo \#define RTL8710CFW_COMPILE_DOMAIN \"`domainname`\"; \
	else \
		echo \#define RTL8710CFW_COMPILE_DOMAIN ; \
	fi >> .ver

	@echo \#define RTL8710CFW_COMPILER \"gcc `$(CC) $(CFLAGS) -dumpversion | tr --delete '\r'`\" >> .ver
	@mv -f .ver ../inc/$@.h

.PHONY: prerequirement
prerequirement:
	@if [ ! -d $(ARM_GCC_TOOLCHAIN) ]; then \
		echo ===========================================================; \
		echo Toolchain not found, \"make toolchain\" first!; \
		echo ===========================================================; \
		exit -1; \
	fi
	@echo ===========================================================
	@echo Build $(TARGET)
	@echo ===========================================================
	mkdir -p $(OBJ_DIR)
	mkdir -p $(BIN_DIR)
	mkdir -p $(INFO_DIR)

$(SRC_O): %_$(TARGET).o : %.c | prerequirement
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(OBJ_DIR)/$(notdir $(patsubst %.o,%.d,$@))
	cp $@ $(OBJ_DIR)/$(notdir $@)
	mv $(notdir $*.i) $(INFO_DIR)
	mv $(notdir $*.s) $(INFO_DIR)
	chmod 777 $(OBJ_DIR)/$(notdir $@)

$(SRAM_O): %_$(TARGET).o : %.c | prerequirement
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	$(OBJCOPY) --prefix-alloc-sections .sram $@
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(OBJ_DIR)/$(notdir $(patsubst %.o,%.d,$@))
	cp $@ $(OBJ_DIR)/$(notdir $@)
	mv $(notdir $*.i) $(INFO_DIR)
	mv $(notdir $*.s) $(INFO_DIR)
	chmod 777 $(OBJ_DIR)/$(notdir $@)

$(ERAM_O): %_$(TARGET).o : %.c | prerequirement
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	$(OBJCOPY) --prefix-alloc-sections .psram $@
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(OBJ_DIR)/$(notdir $(patsubst %.o,%.d,$@))
	cp $@ $(OBJ_DIR)/$(notdir $@)
	mv $(notdir $*.i) $(INFO_DIR)
	mv $(notdir $*.s) $(INFO_DIR)
	chmod 777 $(OBJ_DIR)/$(notdir $@)

-include $(DEPENDENCY_LIST)

# Only needed for FPGA phase
.PHONY: romdebug
romdebug:
ifeq ($(findstring CYGWIN, $(OS)), CYGWIN) 
#	$(FLASH_TOOLDIR)/Check_Jtag.sh
	cmd /c start $(GDB) -x ./rtl_gdb_debug_jlink.txt	
else
	$(GDB) -x ./rtl_gdb_debug_jlink.txt	
endif

.PHONY: flash
flash:
#	@if [ ! -f $(FLASH_TOOLDIR)/rtl_gdb_flash_write.txt ] ; then echo Please do /"make setup GDB_SERVER=[jlink or openocd]/" first; echo && false ; fi
#ifeq ($(findstring CYGWIN, $(OS)), CYGWIN) 
#	$(FLASH_TOOLDIR)/Check_Jtag.sh
#endif
	# chmod +rx $(AMEBAZ2_GCCTOOLDIR)/flashloader.sh
	# $(AMEBAZ2_GCCTOOLDIR)/flashloader.sh application_ns/Debug/bin/flash_is.bin
	# $(GDB) -x $(AMEBAZ2_GCCTOOLDIR)/rtl_gdb_flashloader_jlink.txt

.PHONY: debug
debug:
	chmod +rx $(AMEBAZ2_GCCTOOLDIR)/debug.sh
	$(AMEBAZ2_GCCTOOLDIR)/debug.sh $(BIN_DIR)/$(TARGET).axf
	#$(GDB) -x $(AMEBAZ2_GCCTOOLDIR)/rtl_gdb_debug_jlink.txt

.PHONY: clean
clean:
	rm -rf $(TARGET)
	rm -f $(SRC_O) $(SRAM_O) $(ERAM_O)
	rm -f $(patsubst %.o,%.d,$(SRC_O)) $(patsubst %.o,%.d,$(SRAM_O)) $(patsubst %.o,%.d,$(ERAM_O))
	rm -f $(patsubst %.o,%.su,$(SRC_O)) $(patsubst %.o,%.su,$(SRAM_O)) $(patsubst %.o,%.su,$(ERAM_O))
	rm -f *.i
	rm -f *.s

