#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mt_wifi
PKG_VERSION:=2
PKG_RELEASE:=1

PKG_CONFIG_DEPENDS := \
	CONFIG_MTK_CHIP_MT7603E_MT7612E \
	CONFIG_MTK_CHIP_MT7603E_MT7615E \
	CONFIG_MTK_CHIP_MT7615E \
	CONFIG_MTK_CHIP_MT7615E_DBDC

include $(INCLUDE_DIR)/package.mk

define Package/mt_wifi
  SECTION:=net
  CATEGORY:=Network
  TITLE:=MTK wifi AP config
  DEPENDS:=@TARGET_ramips +wireless-tools
  SUBMENU:=Wireless
endef

define Package/mt_wifi/config
	source "$(SOURCE)/config.in"
endef

define Package/mt_wifi/description
  MT_WiFi auto config for mt7603/mt7612/mt7615 chips
endef

define Package/mt_wifi/conffiles
/etc/wireless/
endef

define Build/Compile
endef

define Package/mt_wifi/install
	$(INSTALL_DIR) $(1)/lib/wifi/
ifeq ($(CONFIG_MTK_CHIP_MT7603E_MT7612E),y)
	$(INSTALL_DIR) $(1)/etc/wireless/mt7603/
	$(INSTALL_DIR) $(1)/etc/wireless/mt7612/
	$(INSTALL_BIN) ./files/7603_7612-l1profile.dat $(1)/etc/wireless/l1profile.dat
	$(INSTALL_BIN) ./files/mt7603e.dat $(1)/etc/wireless/mt7603e/
	$(INSTALL_BIN) ./files/mt7612e.dat $(1)/etc/wireless/mt7612e/
	$(INSTALL_BIN) ./files/mt7603e.sh $(1)/lib/wifi/
	$(INSTALL_BIN) ./files/mt7612e.sh $(1)/lib/wifi/
else ifeq ($(CONFIG_MTK_CHIP_MT7603E_MT7615E),y)
	$(INSTALL_DIR) $(1)/etc/wireless/mt7603e/
	$(INSTALL_DIR) $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/7603_7615-l1profile.dat $(1)/etc/wireless/l1profile.dat
	$(INSTALL_BIN) ./files/mt7603e.dat $(1)/etc/wireless/mt7603e/
	$(INSTALL_BIN) ./files/mt7615e.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/SingleSKU.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/SingleSKU_BF.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/mt7603e.sh $(1)/lib/wifi/
	$(INSTALL_BIN) ./files/mt7615e5.sh $(1)/lib/wifi/
else
ifeq ($(CONFIG_MTK_CHIP_MT7615E_DBDC),y)
	$(INSTALL_DIR) $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/dbdc.l1profile.dat $(1)/etc/wireless/l1profile.dat
	$(INSTALL_BIN) ./files/mt7615e.1.2G.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/mt7615e.1.5G.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/SingleSKU.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/SingleSKU_BF.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/mt7615d2.sh $(1)/lib/wifi/
	$(INSTALL_BIN) ./files/mt7615d5.sh $(1)/lib/wifi/
else
	$(INSTALL_DIR) $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/7615.l1profile.dat $(1)/etc/wireless/l1profile.dat
	$(INSTALL_BIN) ./files/mt7615e.2G.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/mt7615e.5G.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/SingleSKU.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/SingleSKU_BF.dat $(1)/etc/wireless/mt7615e/
	$(INSTALL_BIN) ./files/mt7615e2.sh $(1)/lib/wifi/
	$(INSTALL_BIN) ./files/mt7615e5.sh $(1)/lib/wifi/
endif
endif
	$(INSTALL_BIN) ./files/ralink_common.sh $(1)/lib/wifi/
endef

$(eval $(call BuildPackage,mt_wifi))
