define Profile/Turris-Omnia
  NAME:=Turris Omnia
  PACKAGES:= \
	kmod-mmc kmod-mvsdio kmod-usb3 kmod-usb-storage \
	kmod-i2c-core kmod-i2c-mv64xxx \
	kmod-thermal-armada kmod-ath9k kmod-ath10k ath10k-firmware-qca988x \
	swconfig btrfs-progs turris-version updater \
	foris ucollect-config openssh-server wpad \
	-dropbear rainbow-omnia update_mac
endef

define Profile/Turris-Omnia/Description
 Package set for the Turris Omnia board.
endef

$(eval $(call Profile,Turris-Omnia))
