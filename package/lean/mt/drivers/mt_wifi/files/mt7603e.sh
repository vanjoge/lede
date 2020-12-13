#!/bin/sh
append DRIVERS "mt7603e"

. /lib/wifi/ralink_common.sh

prepare_mt7603e() {
	prepare_ralink_wifi mt7603e
}

scan_mt7603e() {
	scan_ralink_wifi mt7603e mt7603e
}

disable_mt7603e() {
	disable_ralink_wifi mt7603e
}

enable_mt7603e() {
	enable_ralink_wifi mt7603e mt7603e
}

detect_mt7603e() {
	cd /sys/module/
	[ -d $module ] || return
	[ -e /etc/config/wireless ] && return
	 cat <<EOF
config wifi-device      mt7603e
        option type     mt7603e
        option vendor   ralink
        option band     2.4G
        option channel  0
        option autoch   2

config wifi-iface
        option device   mt7603e
        option ifname   ra0
        option network  lan
        option mode     ap
        option ssid     OpenWrt
        option encryption none
        option hidden 0
        option disabled 0
EOF

}
