#
# Copyright (C) 2015 OpenWrt.org
#

SUBTARGET:=mt7688_hlk7688a
BOARDNAME:=HLK7688A based boards
FEATURES+=usb
CPU_TYPE:=24kc

DEFAULT_PACKAGES += kmod-mt76

define Target/Description
	Build firmware images for HLK7688A module based boards.
endef

