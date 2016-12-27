#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=kernel
PKG_FLAGS:=hold

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/packages
SCAN_DEPS=modules/*.mk $(TOPDIR)/target/linux/*/modules.mk $(TOPDIR)/include/netfilter.mk

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

export SHELL:=/bin/sh
.ONESHELL:
.SHELLFLAGS = -ec

include $(INCLUDE_DIR)/package.mk

ifeq ($(DUMP),)
  STAMP_BUILT:=$(STAMP_BUILT)_$(firstword $(shell $(SCRIPT_DIR)/kconfig.pl $(LINUX_DIR)/.config | md5sum))
  -include $(LINUX_DIR)/.config
endif

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define KernelPackage/depends
endef

CONFIG_PACKAGE_kernel=y
define Package/kernel
  SECTION:=sys
  CATEGORY:=Kernel
  DEFAULT:=y
  TITLE:=Virtual kernel package
  VERSION:=$(LINUX_VERSION)-$(LINUX_RELEASE)-$(LINUX_VERMAGIC)
  URL:=http://www.kernel.org/
  PKG_FLAGS:=nonshared
endef

ifdef CONFIG_TARGET_mvebu_Turris-Omnia
define Package/kernel/install
	$(INSTALL_DIR) $(1)/boot

	$(CP) \
		$(LINUX_DIR)/arch/$(ARCH)/boot/zImage \
		$(1)/boot/zImage-$(LINUX_VERSION)-$(LINUX_RELEASE)-$(LINUX_VERMAGIC)

	ln -sf zImage-$(LINUX_VERSION)-$(LINUX_RELEASE)-$(LINUX_VERMAGIC) $(1)/boot/zImage

	$(CP) \
		$(LINUX_DIR)/arch/$(ARCH)/boot/dts/armada-385-turris-omnia.dtb \
		$(1)/boot/dtb
endef
endif

define Package/kernel/extra_provides
	sed -e 's,.*/,,' $(LINUX_DIR)/modules.builtin;
endef

$(eval $(if $(DUMP),,$(call BuildPackage,kernel)))

include $(sort $(wildcard ./modules/*.mk))
-include $(TOPDIR)/target/linux/*/modules.mk
