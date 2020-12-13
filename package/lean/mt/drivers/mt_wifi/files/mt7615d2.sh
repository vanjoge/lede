#!/bin/sh
append DRIVERS "mt7615d2"

. /lib/wifi/ralink_common.sh

prepare_mt7615d2() {
	prepare_ralink_wifi mt7615d2
}

scan_mt7615d2() {
	scan_ralink_wifi mt7615d2 mt_wifi
}

disable_mt7615d2() {
	disable_ralink_wifi mt7615d2
}

enable_mt7615d2() {
	enable_ralink_wifi mt7615d2 mt_wifi
}

detect_mt7615d2() {
	ssid=OpenWrt-2G
	cd  /sys/module/
	[ -d $module ] || return
	[ -e /etc/config/wireless ] && return
	cat <<EOF
config wifi-device      mt7615d2
        option type     mt7615d2
        option vendor   ralink
        option band     2.4G
        option channel  0
        option autoch   2
        option autoch_skip "12;13"
        option region 1
        option country CN
        option wifimode 9
        option bw 1
        option ht_bsscoexist 0
        option g256qam  1
        option noforward 0
        option ApCliEnable 0

config wifi-iface
        option device   mt7615d2
        option ifname   rax0
        option network  lan
        option mode     ap
        option ssid     $ssid
        option encryption none
        option hidden 0
        option disabled 0
        option txbf 0

EOF

}
