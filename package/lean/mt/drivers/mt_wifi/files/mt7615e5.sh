#!/bin/sh
append DRIVERS "mt7615e5"

. /lib/wifi/ralink_common.sh

prepare_mt7615e5() {
	prepare_ralink_wifi mt7615e5
}

scan_mt7615e5() {
	scan_ralink_wifi mt7615e5 mt_wifi
}

disable_mt7615e5() {
	disable_ralink_wifi mt7615e5
}

enable_mt7615e5() {
	enable_ralink_wifi mt7615e5 mt_wifi
}

detect_mt7615e5() {
	ssid=OpenWrt-5G
	cd /sys/module/
	[ -d $module ] || return
	[ -e /etc/config/wireless ] && return
	 cat <<EOF
config wifi-device      mt7615e5
        option type     mt7615e5
        option vendor   ralink
        option band     5G
        option channel  0
        option autoch   2
        option autoch_skip "52;56;60;64"
        option aregion 0
        option country CN
        option wifimode 14
        option bw 2
        option ht_bsscoexist 0
        option g256qam  1
        option noforward 0
        option ApCliEnable 0

config wifi-iface
        option device   mt7615e5
        option ifname   rai0
        option network  lan
        option mode     ap
        option ssid     $ssid
        option encryption none
        option hidden 0
        option disabled 0
        option txbf 0

EOF

}
