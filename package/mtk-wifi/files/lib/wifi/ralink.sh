#!/bin/sh
append DRIVERS "ralink"

devidx=0

write_ralink() {
	local dir=$1
	local devtype=$2
	local dev=$3
	local mode=$4
#	local channel=$5
	local sta=apcli0

	[ -d /sys/module/$dir ] || return
	[ -d "/sys/class/net/$dev" ] || return
	MAC=$(dd bs=1 skip=7 count=3 if=/dev/mtd2 2>/dev/null | hexdump -v -n 3 -e '3/1 "%02X"')
	SSID=hlk7688a_${MAC}

        uci -q batch <<EOF

        set wireless.radio${devidx}=wifi-device
		set wireless.radio${devidx}.type='ralink'
		set wireless.radio${devidx}.variant='mt7628'
		set wireless.radio${devidx}.country='CN'
		set wireless.radio${devidx}.hwmode='11g'
		set wireless.radio${devidx}.htmode='HT20'
		set wireless.radio${devidx}.region='1'
		set wireless.radio${devidx}.channel='6'
		set wireless.radio${devidx}.disabled='0'
		set wireless.radio${devidx}.linkit_mode='apsta'
		
		set wireless.ap=wifi-iface
		set wireless.ap.device='radio${devidx}'
		set wireless.ap.mode='ap'
		set wireless.ap.network='lan'
		set wireless.ap.ifname='ra0'
		set wireless.ap.ssid="$SSID"
		set wireless.ap.encryption='psk2'
	    set wireless.ap.key="testpass"
EOF

#		set wireless.sta=wifi-iface
#		set wireless.sta.device='radio${devidx}'
#		set wireless.sta.mode='sta'
#		set wireless.sta.network='wan'
#		set wireless.sta.ifname='apcli0'
#		set wireless.sta.led='hlk7688a:green:wifi'
#		set wireless.sta.ssid='hlk7688a'
#		set wireless.sta.key='testpass'
#		set wireless.sta.encryption='psk2'
# добавить поле disabled
#EOF

        uci -q commit wireless
}

detect_ralink() {
	[ -z "$(uci get wireless.@wifi-device[-1].type 2> /dev/null)" ] || return 0

	cpu=$(awk 'BEGIN{FS="[ \t]+: MediaTek[ \t]"} /system type/ {print $2}' /proc/cpuinfo | cut -d" " -f1)
	case $cpu in
	MT7688)
		write_ralink mt_wifi mt7628 ra0 11g
		;;
	esac

	return 0
}
