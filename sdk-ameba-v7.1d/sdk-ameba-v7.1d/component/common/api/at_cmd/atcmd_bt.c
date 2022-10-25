#include "log_service.h"
#include "atcmd_bt.h"
#include <platform/platform_stdlib.h>
#include <platform_opts.h>
#if defined(CONFIG_PLATFORM_8710C)
#include <platform_opts_bt.h>
#endif

#if defined(CONFIG_BT) && CONFIG_BT
#include "os_msg.h"
#include "app_msg.h"

#if defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL
#include "app_flags.h"
#include "ble_peripheral_at_cmd.h"
extern void *evt_queue_handle;
extern void *io_queue_handle;
#endif
#if defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL
#include "ble_central_app_flags.h"
#include "ble_central_at_cmd.h"
extern void *ble_central_evt_queue_handle;
extern void *ble_central_io_queue_handle;
#endif
#if ((defined(CONFIG_BT_MESH_PERIPHERAL) && CONFIG_BT_MESH_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
#include "ble_peripheral_at_cmd.h"
#endif
#if ((defined(CONFIG_BT_MESH_CENTRAL) && CONFIG_BT_MESH_CENTRAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
#include "ble_central_at_cmd.h"
#endif
#if defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET
#include "ble_scatternet_app_flags.h"
extern void *ble_scatternet_evt_queue_handle;
extern void *ble_scatternet_io_queue_handle;
#endif
#if defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE
extern void *bt_mesh_device_multiple_profile_evt_queue_handle;
extern void *bt_mesh_device_multiple_profile_io_queue_handle;
#elif defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE
extern void *bt_mesh_provisioner_multiple_profile_evt_queue_handle;
extern void *bt_mesh_provisioner_multiple_profile_io_queue_handle;
#endif
#if defined(CONFIG_BT_BREEZE) && CONFIG_BT_BREEZE
#include "breeze_hal_ble.h"
#endif
#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
	(defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
	(defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET) || \
	(defined(CONFIG_BT_MESH_CENTRAL) && CONFIG_BT_MESH_CENTRAL) || \
	(defined(CONFIG_BT_MESH_PERIPHERAL) && CONFIG_BT_MESH_PERIPHERAL) || \
	(defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
char bt_at_cmd_buf[256] = {0};
void bt_at_cmd_send_msg(uint16_t subtype, void *arg)
{
	uint8_t event = EVENT_IO_TO_APP;

	T_IO_MSG io_msg;

	io_msg.type = IO_MSG_TYPE_AT_CMD;
	io_msg.subtype = subtype;
	io_msg.u.buf = arg;

#if defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL
	if (evt_queue_handle != NULL && io_queue_handle != NULL) {
		if (os_msg_send(io_queue_handle, &io_msg, 0) == false) {
			AT_PRINTK("bt at cmd send msg fail: subtype 0x%x", io_msg.subtype);
		} else if (os_msg_send(evt_queue_handle, &event, 0) == false) {
			AT_PRINTK("bt at cmd send event fail: subtype 0x%x", io_msg.subtype);
		}
	}
#endif
#if defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL
	if (ble_central_evt_queue_handle != NULL && ble_central_io_queue_handle != NULL) {
		if (os_msg_send(ble_central_io_queue_handle, &io_msg, 0) == false) {
			AT_PRINTK("bt at cmd send msg fail: subtype 0x%x", io_msg.subtype);
		} else if (os_msg_send(ble_central_evt_queue_handle, &event, 0) == false) {
			AT_PRINTK("bt at cmd send event fail: subtype 0x%x", io_msg.subtype);
		}
	}
#endif
#if defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET
	if (ble_scatternet_evt_queue_handle != NULL && ble_scatternet_io_queue_handle != NULL) {
		if (os_msg_send(ble_scatternet_io_queue_handle, &io_msg, 0) == false) {
			AT_PRINTK("bt at cmd send msg fail: subtype 0x%x", io_msg.subtype);
		} else if (os_msg_send(ble_scatternet_evt_queue_handle, &event, 0) == false) {
			AT_PRINTK("bt at cmd send event fail: subtype 0x%x", io_msg.subtype);
		}
	}
#endif
#if defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE
    if (bt_mesh_device_multiple_profile_evt_queue_handle != NULL && bt_mesh_device_multiple_profile_io_queue_handle != NULL) {
		if (os_msg_send(bt_mesh_device_multiple_profile_io_queue_handle, &io_msg, 0) == false) {
			AT_PRINTK("bt at cmd send msg fail: subtype 0x%x", io_msg.subtype);
		} else if (os_msg_send(bt_mesh_device_multiple_profile_evt_queue_handle, &event, 0) == false) {
			AT_PRINTK("bt at cmd send event fail: subtype 0x%x", io_msg.subtype);
		}
	}
#endif
#if defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE
    if (bt_mesh_provisioner_multiple_profile_evt_queue_handle != NULL && bt_mesh_provisioner_multiple_profile_io_queue_handle != NULL) {
		if (os_msg_send(bt_mesh_provisioner_multiple_profile_io_queue_handle, &io_msg, 0) == false) {
			AT_PRINTK("bt at cmd send msg fail: subtype 0x%x", io_msg.subtype);
		} else if (os_msg_send(bt_mesh_provisioner_multiple_profile_evt_queue_handle, &event, 0) == false) {
			AT_PRINTK("bt at cmd send event fail: subtype 0x%x", io_msg.subtype);
		}
	}
#endif
}
#endif

#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
    (defined(CONFIG_BT_MESH_CENTRAL) && CONFIG_BT_MESH_CENTRAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
extern int ble_central_app_init(void);
extern void ble_central_app_deinit(void);
#if defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL
void fATBc(void *arg)
{
	int argc = 0;
	int param = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1) {
		AT_PRINTK("[ATBc]:_AT_BLE_CENTRAL_[ON]\n\r");
		ble_central_app_init();
	} else if (param == 0) {
		AT_PRINTK("[ATBc]:_AT_BLE_CENTRAL_[OFF]\n\r");
		ble_central_app_deinit();
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBc] Start BLE Central: ATBc=1");
	AT_PRINTK("[ATBc] Stop  BLE Central: ATBc=0");
}
#endif

void fATBC(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 3) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_CONNECT, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBC] Connect to remote device: ATBC=P/R,BLE_BD_ADDR");
	AT_PRINTK("[ATBC] P=public, R=random");
	AT_PRINTK("[ATBS] eg:ATBC=P,001122334455");
}

void fATBD(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_DISCONNECT, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBD] Disconnect to remote device: ATBD=connect_id");
	AT_PRINTK("[ATBD] eg:ATBD=0");
}

void fATBI(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	}

	if (argc != 0){
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_GET_COON_INFO, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBI] Get all connected device information, ATBI");
	AT_PRINTK("[ATBI] eg:ATBI");
}

void fATBG(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc < 3) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_GET, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBG] Get all services: ATBG=ALL,connect_id");
	AT_PRINTK("[ATBG] Discover services by uuid: ATBG=SRV,connect_id,uuid_type,uuid");
	AT_PRINTK("[ATBG] Discover characteristic: ATBG=CHARDIS,connect_id,start_handle,end_handle");
	AT_PRINTK("[ATBG] Discover characteristic by uuid: ATBG=CHARUUID,connect_id,start_handle,end_handle, type, uuid");
	AT_PRINTK("[ATBG] Discover characteristic descriptor: ATBG=CHARDDIS,connect_id,start_handle,end_handle");
	AT_PRINTK("[ATBG] eg:ATBG=ALL,0");
	AT_PRINTK("[ATBG] eg(uuid16):ATBG=SRV,0,0,1803");
	AT_PRINTK("[ATBG] eg(uuid128):ATBG=SRV,0,1,00112233445566778899aabbccddeeff");
	AT_PRINTK("[ATBG] eg:ATBG=CHARDIS,0,0x8,0xFF");
	AT_PRINTK("[ATBG] eg(uuid16):ATBG=CHARUUID,0,0x1,0xFFFF,0,B001");
	AT_PRINTK("[ATBG] eg(uuid128):ATBG=CHARUUID,0,0x1,0xFFFF,1,00112233445566778899aabbccddeeff");
	AT_PRINTK("[ATBG] eg:ATBG=CHARDDIS,0,0xe,0x10");
}

void fATBS(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if ((argc != 2) && (argc != 3) && (argc != 4)) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_SCAN, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBS] Scan:ATBS=scan_enable,filter_policy,filter_duplicate");
	AT_PRINTK("[ATBS] [scan_enable]:0-(start scan),1(stop scan)");
	AT_PRINTK("[ATBS] [filter_policy]: 0-(any), 1-(whitelist), 2-(any RPA), 3-(whitelist RPA)");
	AT_PRINTK("[ATBS] [filter_duplicate]: 0-(disable), 1-(enable)");
	AT_PRINTK("[ATBS] eg:ATBS=1");
	AT_PRINTK("[ATBS] eg:ATBS=1,0");
	AT_PRINTK("[ATBS] eg:ATBS=1,0,1");
	AT_PRINTK("[ATBS] eg:ATBS=0");
}

void fATBR(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if ((argc != 3) && (argc != 6)) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_READ, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBR] Read characteristic: ATBR=conn_id,handle");
	AT_PRINTK("[ATBR] Read characterristic value by uuid: ATBR=conn_id,start_handle,end_handle,uuid_type,uuid");
	AT_PRINTK("[ATBR] eg(uuid16):ATBR=0,0xa");
	AT_PRINTK("[ATBR] eg(uuid16):ATBR=0,0x1,0xFFFF,0,B001");
	AT_PRINTK("[ATBR] eg(uuid128):ATBR=0,0x1,0xFFFF,1,00112233445566778899aabbccddeeff");
}

void fATBW(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc < 5) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_WRITE, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBW] Write data to service: ATBW=conn_id,type,handle,length,value");
	AT_PRINTK("[ATBW] [type]: write type: 1-(write request), 2-(write command)");
	AT_PRINTK("[ATBW] [handle]: attribute handle");
	AT_PRINTK("[ATBW] [length]: value length");
	AT_PRINTK("[ATBW] [lvalue]: overwrite the value");
	AT_PRINTK("[ATBW] eg:ATBW=0,1,0xc,0x1,02");
	AT_PRINTK("[ATBW] eg:ATBW=0,2,0x19,10");
}

void fATBn(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if ((argc != 2) && (argc != 4)) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_MODIFY_WHITELIST, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBn] Clear white list: ATBn=0");
	AT_PRINTK("[ATBn] Add a device to the white list: ATBn=1,P/R,addr");
	AT_PRINTK("[ATBn] Remove a device from the white list: ATBn=2,P/R,addr");
}

void fATBa(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 3) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_SET_SCAN_PARAM, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBa] Modify scan interval:ATBa=1,scan_interval");
	AT_PRINTK("[ATBa] Modify scan window:ATBa=2,scan_window");
	AT_PRINTK("[ATBa] Modify scan interval:ATBa=1,0x190");
	AT_PRINTK("[ATBa] Modify scan window:ATBa=2,0xC8");
}

#if F_BT_LE_5_0_SET_PHY_SUPPORT
void fATBg(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 3) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_SET_PHY, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBg] Set BLE PHY(2M): ATBg=conn_id,phy");
	AT_PRINTK("[ATBg] Set BLE PHY(2M): ATBg=0,1");
}
#endif
#endif

#if ((defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_PERIPHERAL) && CONFIG_BT_MESH_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
#if defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL
extern int ble_app_init(void);
extern void ble_app_deinit(void);
void fATBp(void *arg)
{
	int argc = 0;
	int param = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1) {
		AT_PRINTK("[ATBp]:_AT_BLE_PERIPHERAL_[ON]\n\r");
		ble_app_init();
	} else if (param == 0) {
		AT_PRINTK("[ATBp]:_AT_BLE_PERIPHERAL_[OFF]\n\r");
		ble_app_deinit();
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBp] Start BLE Peripheral: ATBp=1");
	AT_PRINTK("[ATBp] Stop  BLE Peripheral: ATBp=0");
}
#endif

void fATBA(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg) {
		argc = parse_param(arg, argv);
	} else
		goto exit;

	if (argc != 3) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	ble_peripheral_at_cmd_set_adv_int(argc, argv);
	return;

exit:
	AT_PRINTK("[ATBA] Modify adv interval:ATBA=adv_interval_max,adv_interval_min");
	AT_PRINTK("[ATBA] Modify adv interval:ATBA=1600,1600");
}
#endif

#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
    (defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_CENTRAL) && CONFIG_BT_MESH_CENTRAL) || \
    (defined(CONFIG_BT_MESH_PERIPHERAL) && CONFIG_BT_MESH_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
void fATBK(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if ((argc != 3) && (argc != 4) && (argc != 6)) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_AUTH, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBK] Config and Set authentication information");
	AT_PRINTK("[ATBK] ATBK=SEND,conn_id");
	AT_PRINTK("[ATBK] ATBK=KEY,conn_id,passcode");
	AT_PRINTK("[ATBK] ATBK=MODE,auth_flags,io_cap,sec_enable,oob_enable");
	AT_PRINTK("[ATBK] eg:ATBK=SEND,0");
	AT_PRINTK("[ATBK] eg:ATBK=KEY,0,123456");
	AT_PRINTK("[ATBK] eg:ATBK=MODE,0x5,2,1,0");
}

void fATBY(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 3) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_SEND_USERCONF, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBY] Send user confirmation when show GAP_MSG_LE_BOND_USER_CONFIRMATION");
	AT_PRINTK("[ATBY] ATBY=[conn_id],[conf]");
	AT_PRINTK("[ATBY] [conf]=0-(Reject),1(Accept)");
	AT_PRINTK("[ATBY] eg:ATBY=0,1");
}

void fATBU(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 6) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_UPDATE_CONN_REQUEST, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBU] Connection param update request: ATBU=conn_id,interval_min,interval_max,latency,supervision_timeout");
	AT_PRINTK("[ATBU] eg:ATBU=0,0x30,0x40,0x0,0x1F4");
}

void fATBO(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	memset(bt_at_cmd_buf, 0, 256);

	if (arg) {
		strcpy(bt_at_cmd_buf, arg);
		argc = parse_param(bt_at_cmd_buf, argv);
	} else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_at_cmd_send_msg(BT_ATCMD_BOND_INFORMATION, bt_at_cmd_buf);
	return;

exit:
	AT_PRINTK("[ATBO] Clear bond information: ATBO=CLEAR");
	AT_PRINTK("[ATBO] Get bond information: ATBO=INFO");
}
#endif

#if defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET
extern int ble_scatternet_app_init(void);
extern void ble_scatternet_app_deinit(void);
void fATBf(void *arg)
{
	int argc = 0;
	int param = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1) {
		AT_PRINTK("[ATBf]:_AT_BLE_SCATTERNET_[ON]\n\r");
		ble_scatternet_app_init();
	} else if (param == 0) {
		AT_PRINTK("[ATBf]:_AT_BLE_SCATTERNET_[OFF]\n\r");
		ble_scatternet_app_deinit();
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBf] Start BLE Scatternet: ATBf=1");
	AT_PRINTK("[ATBf] Stop  BLE Scatternet: ATBf=0");
}

#if defined(CONFIG_BT_CENTRAL_CONFIG) && CONFIG_BT_CENTRAL_CONFIG
extern void ble_scatternet_config_at_cmd_config(void);
void fATBs(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	if(arg){
		argc = parse_param(arg, argv);
	}

	if (argc != 0){
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	ble_scatternet_config_at_cmd_config();
	return;
exit:
	AT_PRINTK("[ATBf] reconfig wifi: ATBs");
}
#endif
#elif defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET
#if defined(CONFIG_BT_CENTRAL_CONFIG) && CONFIG_BT_CENTRAL_CONFIG
extern void bt_mesh_scatternet_config_at_cmd_config(void);
void fATBs(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};

	if(arg){
		argc = parse_param(arg, argv);
	}

	if (argc != 0){
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	bt_mesh_scatternet_config_at_cmd_config();
	return;
exit:
	AT_PRINTK("[ATBf] reconfig wifi: ATBs");
}  
#endif
#endif

#if defined(CONFIG_BT_BEACON) && CONFIG_BT_BEACON
extern int bt_beacon_app_init(int type);
extern void bt_beacon_app_deinit(void);
void fATBJ(void *arg)
{
	int argc = 0;
	int param = 0;
	int type = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if ((argc != 2) && (argc != 3)) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1 && argc == 3) {
		type = atoi(argv[2]);
		if(type == 1)
			AT_PRINTK("[ATBJ]:_AT_BT_I_BEACON_[ON]\n\r");
		else if(type == 2)
			AT_PRINTK("[ATBJ]:_AT_BT_ALT_BEACON_[ON]\n\r");
		else
			goto exit;
		bt_beacon_app_init(type);
	} else if (param == 0 && argc == 2) {
		AT_PRINTK("[ATBJ]:_AT_BT_BEACON_[OFF]\n\r");
		bt_beacon_app_deinit();
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBJ] Start BT I_Beacon: ATBJ=1,1");
	AT_PRINTK("[ATBJ] Start BT Alt_Beacon: ATBJ=1,2");
	AT_PRINTK("[ATBJ] Stop  BT Beacon: ATBJ=0");
}
#endif

#if defined(CONFIG_BT_CONFIG) && CONFIG_BT_CONFIG
extern int bt_config_app_init(void);
extern void bt_config_app_deinit(void);
void fATBB(void *arg)
{
	int argc = 0;
	int param = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1) {
		AT_PRINTK("[ATBB]:_AT_BT_CONFIG_[ON]\n\r");
		bt_config_app_init();
	} else if (param == 0) {
		AT_PRINTK("[ATBB]:_AT_BT_CONFIG_[OFF]\n\r");
		bt_config_app_deinit();
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBB] Start BT Config: ATBB=1");
	AT_PRINTK("[ATBB] Stop  BT Config: ATBB=0");
}
#endif

#if defined(CONFIG_BT_AIRSYNC_CONFIG) && CONFIG_BT_AIRSYNC_CONFIG
extern int bt_airsync_config_app_init(void);
extern void bt_airsync_config_app_deinit(void);
void fATBb(void *arg)
{
	int argc = 0;
	int param = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1) {
		AT_PRINTK("[ATBb]:_AT_BT_AIRSYNC_CONFIG_[ON]\n\r");
		bt_airsync_config_app_init();
	} else if (param == 0) {
		AT_PRINTK("[ATBb]:_AT_BT_AIRSYNC_CONFIG_[OFF]\n\r");
		bt_airsync_config_app_deinit();
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBb] Start BT Airsync Config: ATBb=1");
	AT_PRINTK("[ATBb] Stop  BT Airsync Config: ATBb=0");
}
#endif

#if defined(CONFIG_BT_BREEZE) && CONFIG_BT_BREEZE
ais_adv_init_t adv_data = {
	.flag = AIS_AD_GENERAL | AIS_AD_NO_BREDR,
	.name = { .ntype = AIS_ADV_NAME_FULL, .name = "AZ" },
};

void init_done_cb(uint8_t res)
{
	if (!res)
		printf("\r\nBreeze has initialized\r\n");
}

void connect_cb(void)
{
	printf("\r\nBreeze has connected\r\n");
}

void disconnect_cb(void)
{
	printf("\r\nBreeze has disconnected\r\n");
}

ais_bt_init_t attr_info = {
    /* service */
    AIS_UUID_DECLARE_16(BLE_UUID_AIS_SERVICE),
    /* rc */
    { .uuid          = AIS_UUID_DECLARE_16(BLE_UUID_AIS_RC),
      .prop          = AIS_GATT_CHRC_READ,
      .perm          = AIS_GATT_PERM_READ | AIS_GATT_PERM_READ_AUTHEN,
      .on_read       = NULL,
      .on_write      = NULL,
      .on_ccc_change = NULL },
    /* wc */
    { .uuid          = AIS_UUID_DECLARE_16(BLE_UUID_AIS_WC),
      .prop          = AIS_GATT_CHRC_READ | AIS_GATT_CHRC_WRITE,
      .perm          = AIS_GATT_PERM_READ | AIS_GATT_PERM_WRITE,
      .on_read       = NULL,
      .on_write      = NULL,//wc_write_handler,
      .on_ccc_change = NULL },
    /* ic */
    { .uuid          = AIS_UUID_DECLARE_16(BLE_UUID_AIS_IC),
      .prop          = AIS_GATT_CHRC_READ | AIS_GATT_CHRC_INDICATE,
      .perm          = AIS_GATT_PERM_READ,
      .on_read       = NULL,
      .on_write      = NULL,
      .on_ccc_change = NULL },//ic_ccc_handler },
    /* wwnrc */
    { .uuid          = AIS_UUID_DECLARE_16(BLE_UUID_AIS_WWNRC),
      .prop          = AIS_GATT_CHRC_READ | AIS_GATT_CHRC_WRITE_WITHOUT_RESP,
      .perm          = AIS_GATT_PERM_READ | AIS_GATT_PERM_WRITE,
      .on_read       = NULL,
      .on_write      = NULL,//wwnrc_write_handler,
      .on_ccc_change = NULL },
    /* nc */
    { .uuid          = AIS_UUID_DECLARE_16(BLE_UUID_AIS_NC),
      .prop          = AIS_GATT_CHRC_READ | AIS_GATT_CHRC_NOTIFY,
      .perm          = AIS_GATT_PERM_READ,
      .on_read       = NULL,
      .on_write      = NULL,
      .on_ccc_change = NULL },//nc_ccc_handler },
    connect_cb,//connected,
    disconnect_cb//disconnected
};

void fATBi(void *arg)
{
	int argc = 0;
	int param = 0;
	char *argv[MAX_ARGC] = {0};

	if (arg)
		argc = parse_param(arg, argv);
	else
		goto exit;

	if (argc != 2) {
		AT_PRINTK("[AT_PRINTK] ERROR: input parameter error!\n\r");
		goto exit;
	}

	param = atoi(argv[1]);
	if (param == 1) {
		AT_PRINTK("[ATBi]:_AT_BT_BREEZE_[ON]\n\r");
		ble_stack_init(&attr_info, init_done_cb);
	} else if (param == 0) {
		AT_PRINTK("[ATBi]:_AT_BT_BREEZE_[OFF]\n\r");
		ble_stack_deinit();
	} else if (param == 2) {
		AT_PRINTK("[ATBi]:_AT_BT_BREEZE_ADV_[ON]\n\r");
		ble_advertising_start(&adv_data);
	} else
		goto exit;

	return;

exit:
	AT_PRINTK("[ATBi] Start BT Breeze:  ATBi=1");
	AT_PRINTK("[ATBi] Stop  BT Breeze:  ATBi=0");
	AT_PRINTK("[ATBi] Start Breeze ADV: ATBi=2");
}
#endif

#if ((defined(CONFIG_BT_MESH_PROVISIONER) && CONFIG_BT_MESH_PROVISIONER) || \
	(defined(CONFIG_BT_MESH_DEVICE) && CONFIG_BT_MESH_DEVICE) || \
	(defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) || \
	(defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) || \
	(defined(CONFIG_EXAMPLE_BT_MESH_DEMO) && CONFIG_EXAMPLE_BT_MESH_DEMO))
extern void app_send_uart_msg(uint8_t data);
extern void bt_mesh_param_user_cmd(unsigned int argc, char **argv);
static void bt_mesh_set_cmd(unsigned int argc, char *argv[])
{
	unsigned int i = 0, j = 0;
	for (i = 0; i < argc; i++) {
		for (j = 0; j < (strlen(argv[i])); j++) {
			app_send_uart_msg(argv[i][j]);
		}
		if ((i + 1) == argc)
			app_send_uart_msg('\r');
		else
			app_send_uart_msg(' ');
	}
}

void fATBM(void *arg)
{
	unsigned int argc = 0;
	char *argv[MAX_ARGC] = {0};

	if(arg){
		argc = parse_param(arg, argv);
	}

	if((argc == 2) && (strcmp(argv[1], "?") == 0)){
		AT_PRINTK("provision cmd example: ATBM=pro,cmd,parameter \n");
		AT_PRINTK("device cmd example: ATBM=dev,cmd,parameter \n");
		goto exit;
	}

	if(argc < 3){
		AT_PRINTK("[ATBM]:not enough number of parameter, please use ATBM=? for help \n");
		goto exit;
	}

    if(strcmp(argv[1], "dbg") == 0){
        if(strcmp(argv[2], "pro") == 0){
		AT_PRINTK("[ATBM]:DBG Provisioner Cmd \n");
    	}else if(strcmp(argv[2], "dev") == 0){
    		AT_PRINTK("[ATBM]:DBG Device Cmd \n");
    	}else{
    		AT_PRINTK("[ATBM]:It must be dev or pro\n");
    		goto exit;
    	}
        bt_mesh_set_cmd((argc-3), &argv[3]);
        return;
    }
#if defined(CONFIG_BT_MESH_USER_API) && CONFIG_BT_MESH_USER_API
#if ((defined(CONFIG_BT_MESH_PROVISIONER) && CONFIG_BT_MESH_PROVISIONER) || \
    (defined(CONFIG_BT_MESH_DEVICE) && CONFIG_BT_MESH_DEVICE) || \
    (defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) || \
    (defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE))
    else if(strcmp(argv[1], "pro") == 0){
		AT_PRINTK("[ATBM]:Provisioner Cmd \n");
	}else if(strcmp(argv[1], "dev") == 0){
		AT_PRINTK("[ATBM]:Device Cmd \n");
	}else{
		AT_PRINTK("[ATBM]:It must be dev or pro, please use ATBM=? to help \n");
		goto exit;
	}

    bt_mesh_param_user_cmd((argc-1), &argv[1]);	
#endif
#endif

exit:
	return;
}

extern int bt_mesh_provisioner_app_init(void);
extern void bt_mesh_provisioner_app_deinit(void);
extern int bt_mesh_device_app_init(void);
extern void bt_mesh_device_app_deinit(void);
extern int bt_mesh_device_multiple_profile_app_init(void);
extern int bt_mesh_device_multiple_profile_app_deinit(void);
extern int bt_mesh_provisioner_multiple_profile_app_init(void);
extern int bt_mesh_provisioner_multiple_profile_app_deinit(void);

void fATBm(void *arg)
{
	int argc = 0;
	char *argv[MAX_ARGC] = {0};
	if (!arg)
		goto exit;

	argc = parse_param(arg, argv);

	if (argc < 2)
		goto exit;

#if defined(CONFIG_BT_MESH_PROVISIONER) && CONFIG_BT_MESH_PROVISIONER
	if (strcmp(argv[1], "1") == 0) {
		AT_PRINTK("[ATBm]:_AT_BT_MESH_PROVISIONER_[ON]\n\r");
		if (bt_mesh_provisioner_app_init()) {
            AT_PRINTK("[ATBm]:_AT_BT_MESH_PROVISIONER_[ON] FAIL !!! \n\r");
        }
	}
	else if (strcmp(argv[1], "0") == 0) {
		AT_PRINTK("[ATBm]:_AT_BT_MESH_PROVISIONER_[OFF]\n\r");
		bt_mesh_provisioner_app_deinit();
	}
	else
		goto exit;
#elif defined(CONFIG_BT_MESH_DEVICE) && CONFIG_BT_MESH_DEVICE
	if (strcmp(argv[1], "1") == 0) {
		AT_PRINTK("[ATBm]:_AT_BT_MESH_DEVICE_[ON]\n\r");
        if (bt_mesh_device_app_init()) {
            AT_PRINTK("[ATBm]:_AT_BT_MESH_DEVICE_[ON] FAIL !!! \n\r");
        }
	}
	else if (strcmp(argv[1], "0") == 0) {
		AT_PRINTK("[ATBm]:_AT_BT_MESH_DEVICE_[OFF]\n\r");
		bt_mesh_device_app_deinit();
	}
	else
		goto exit;
#elif defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE
    if (strcmp(argv[1], "1") == 0) {
        AT_PRINTK("[ATBm]:_AT_BT_MESH_DEVICE_MULTIPLE_PROFILE_[ON]\n\r");
        if (bt_mesh_device_multiple_profile_app_init()) {
            AT_PRINTK("[ATBm]:_AT_BT_MESH_DEVICE_MULTIPLE_PROFILE_[ON] FAIL !!! \n\r");
        }
    }
    else if (strcmp(argv[1], "0") == 0) {
        AT_PRINTK("[ATBm]:_AT_BT_MESH_DEVICE_MULTIPLE_PROFILE_[OFF]\n\r");
        bt_mesh_device_multiple_profile_app_deinit();
    }
    else
        goto exit;
#elif defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE
    if (strcmp(argv[1], "1") == 0) {
        AT_PRINTK("[ATBm]:_AT_BT_MESH_PROVISIONER_MULTIPLE_PROFILE_[ON]\n\r");
        if (bt_mesh_provisioner_multiple_profile_app_init()) {
            AT_PRINTK("[ATBm]:_AT_BT_MESH_PROVISIONER_MULTIPLE_PROFILE_[ON] FAIL !!! \n\r");
        }
    }
    else if (strcmp(argv[1], "0") == 0) {
        AT_PRINTK("[ATBm]:_AT_BT_MESH_PROVISIONER_MULTIPLE_PROFILE_[OFF]\n\r");
        bt_mesh_provisioner_multiple_profile_app_deinit();
    }
    else
        goto exit;
#endif
	return;
exit:
#if ((defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) || \
    (defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE))
	AT_PRINTK("[ATBm] Start BT Mesh Mulitple Profile: ATBm=1");
	AT_PRINTK("[ATBm] Stop  BT Mesh Mulitple Profile: ATBm=0");
#else
    AT_PRINTK("[ATBm] Start BT Mesh Mulitple Profile: ATBm=1");
	AT_PRINTK("[ATBm] Stop  BT Mesh Mulitple Profile: ATBm=0");
#endif
}
#endif

#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
	(defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
	(defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET) || \
	(defined(CONFIG_BT_BEACON) && CONFIG_BT_BEACON) || \
	(defined(CONFIG_BT_CONFIG) && CONFIG_BT_CONFIG)	|| \
	(defined(CONFIG_BT_AIRSYNC_CONFIG) && CONFIG_BT_AIRSYNC_CONFIG) || \
	(defined(CONFIG_BT_BREEZE) && CONFIG_BT_BREEZE) || \
	(defined(CONFIG_BT_MESH_PROVISIONER) && CONFIG_BT_MESH_PROVISIONER) || \
	(defined(CONFIG_BT_MESH_DEVICE) && CONFIG_BT_MESH_DEVICE) || \
	(defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) || \
    (defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) || \
	(defined(CONFIG_EXAMPLE_BT_MESH_DEMO) && CONFIG_EXAMPLE_BT_MESH_DEMO))
log_item_t at_bt_items[ ] = {
#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
    (defined(CONFIG_BT_MESH_CENTRAL) && CONFIG_BT_MESH_CENTRAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
#if defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL
	{"ATBc", fATBc,{NULL,NULL}}, // Start/stop BLE central
#endif
	{"ATBC", fATBC,{NULL,NULL}}, // Create a GATT connection
	{"ATBD", fATBD,{NULL,NULL}}, // Disconnect GATT Connection
	{"ATBG", fATBG,{NULL,NULL}}, // Get peripheral information
	{"ATBI", fATBI,{NULL,NULL}}, // Get information of connected device
	{"ATBS", fATBS,{NULL,NULL}}, // Scan BT device
	{"ATBR", fATBR,{NULL,NULL}}, // GATT client read
	{"ATBW", fATBW,{NULL,NULL}}, // GATT client write
	{"ATBn", fATBn,{NULL,NULL}}, // Modify whitelist
	{"ATBa", fATBa,{NULL,NULL}}, // Modify scan interval/scan window
#if F_BT_LE_5_0_SET_PHY_SUPPORT
	{"ATBg", fATBg,{NULL,NULL}}, // Set PHY 2M
#endif
#endif
#if ((defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_PERIPHERAL) && CONFIG_BT_MESH_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
#if defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL
	{"ATBp", fATBp,{NULL,NULL}}, // Start/stop BLE peripheral
#endif
	{"ATBA", fATBA,{NULL,NULL}}, // Modify adv interval
#endif
#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
    (defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_CENTRAL) && CONFIG_BT_MESH_CENTRAL) || \
    (defined(CONFIG_BT_MESH_PERIPHERAL) && CONFIG_BT_MESH_PERIPHERAL) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
	{"ATBK", fATBK,{NULL,NULL}}, // Reply GAP passkey
	{"ATBY", fATBY,{NULL,NULL}}, // Reply GAP user confirm
	{"ATBU", fATBU,{NULL,NULL}}, // Update connection request
	{"ATBO", fATBO,{NULL,NULL}}, // Get/clear bond information
#endif
#if ((defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET) || \
    (defined(CONFIG_BT_MESH_SCATTERNET) && CONFIG_BT_MESH_SCATTERNET))
#if defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET
	{"ATBf", fATBf,{NULL,NULL}}, // Start/stop BLE scatternet
#endif
#if defined(CONFIG_BT_CENTRAL_CONFIG) && CONFIG_BT_CENTRAL_CONFIG
	{"ATBs", fATBs,{NULL,NULL}}, // Restart BT config when scatternet open
#endif
#endif
#if defined(CONFIG_BT_BEACON) && CONFIG_BT_BEACON
	{"ATBJ", fATBJ,{NULL,NULL}}, // Start/stop BT beacon
#endif
#if defined(CONFIG_BT_CONFIG) && CONFIG_BT_CONFIG
	{"ATBB", fATBB,{NULL,NULL}}, // Start/stop BT config
#endif
#if defined(CONFIG_BT_AIRSYNC_CONFIG) && CONFIG_BT_AIRSYNC_CONFIG
	{"ATBb", fATBb,{NULL,NULL}}, // Start/stop BT airsync config
#endif
#if defined(CONFIG_BT_BREEZE) && CONFIG_BT_BREEZE
	{"ATBi", fATBi,{NULL,NULL}}, // BT breeze
#endif

#if ((defined(CONFIG_BT_MESH_PROVISIONER) && CONFIG_BT_MESH_PROVISIONER) || \
	(defined(CONFIG_BT_MESH_DEVICE) && CONFIG_BT_MESH_DEVICE) || \
	(defined(CONFIG_EXAMPLE_BT_MESH_DEMO) && CONFIG_EXAMPLE_BT_MESH_DEMO) || \
	(defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) || \
    (defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE))
	{"ATBM", fATBM,{NULL,NULL}},
	{"ATBm", fATBm,{NULL,NULL}},  //start/stop BLE mesh
#endif
};
#endif

void at_bt_init(void)
{
#if ((defined(CONFIG_BT_CENTRAL) && CONFIG_BT_CENTRAL) || \
	(defined(CONFIG_BT_PERIPHERAL) && CONFIG_BT_PERIPHERAL) || \
	(defined(CONFIG_BT_SCATTERNET) && CONFIG_BT_SCATTERNET) || \
	(defined(CONFIG_BT_BEACON) && CONFIG_BT_BEACON) || \
	(defined(CONFIG_BT_CONFIG) && CONFIG_BT_CONFIG) || \
	(defined(CONFIG_BT_AIRSYNC_CONFIG) && CONFIG_BT_AIRSYNC_CONFIG) || \
	(defined(CONFIG_BT_BREEZE) && CONFIG_BT_BREEZE) || \
	(defined(CONFIG_BT_MESH_PROVISIONER) && CONFIG_BT_MESH_PROVISIONER) || \
	(defined(CONFIG_BT_MESH_DEVICE) && CONFIG_BT_MESH_DEVICE) || \
	(defined(CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) && CONFIG_BT_MESH_PROVISIONER_MULTIPLE_PROFILE) || \
    (defined(CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) && CONFIG_BT_MESH_DEVICE_MULTIPLE_PROFILE) || \
	(defined(CONFIG_EXAMPLE_BT_MESH_DEMO) && CONFIG_EXAMPLE_BT_MESH_DEMO))
	log_service_add_table(at_bt_items, sizeof(at_bt_items)/sizeof(at_bt_items[0]));
#endif
}

#if SUPPORT_LOG_SERVICE
log_module_init(at_bt_init);
#endif

#endif

