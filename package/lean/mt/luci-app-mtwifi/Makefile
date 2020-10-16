include $(TOPDIR)/rules.mk

PKG_LICENSE:=GPLv2
PKG_MAINTAINER:=Hua Shao <nossiac@163.com>

LUCI_TITLE:=LuCI support for mt wifi driver
LUCI_DEPENDS:=@TARGET_ramips +mt_wifi
LUCI_PKGARCH:=all
PKG_VERSION:=1
PKG_RELEASE:=16

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
