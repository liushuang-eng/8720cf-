#ifndef __ATCMD_BT_H__
#define __ATCMD_BT_H__

typedef enum
{
	BT_ATCMD_SCAN,
	BT_ATCMD_CONNECT,
	BT_ATCMD_DISCONNECT,
	BT_ATCMD_AUTH,
	BT_ATCMD_GET,
	BT_ATCMD_GET_COON_INFO,
	BT_ATCMD_SEND_USERCONF,
	BT_ATCMD_UPDATE_CONN_REQUEST,
	BT_ATCMD_BOND_INFORMATION,
	BT_ATCMD_READ,
	BT_ATCMD_WRITE,
	BT_ATCMD_MODIFY_WHITELIST,
	BT_ATCMD_SET_SCAN_PARAM,
	BT_ATCMD_SET_PHY,	
	BT_ATCMD_BREEZE_APP,
	BT_ATCMD_BREEZE_ADV,
	BT_ATCMD_BREEZE_DISCONNECT,
	BT_ATCMD_BREEZE_MAC,
	BT_ATCMD_BREEZE_NOTIFY,
	BT_ATCMD_BREEZE_INDICATE,
	BT_ATCMD_BREEZE_STACK,
	BT_ATCMD_MAX
} BT_AT_CMD_TYPE;

#endif  /* __ATCMD_BT_H__ */

