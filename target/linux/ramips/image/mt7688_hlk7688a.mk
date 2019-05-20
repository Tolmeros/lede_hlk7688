#
# MT7688 HLK7688A based boards Profiles
#



define Device/HLK7688A_router_wllll
  DTS := HLK7688A_router_wllll
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  SUPPORTED_DEVICES := hlk7688a_router_wllll hlk7688a
  DEVICE_TITLE := HLK-7688A Router mode eth WLLLL
  DEVICE_DESCRIPTION := Router based on Hi-Link HLK-7688A \
  Required routed mode from u-boot \
  MDI 0: WAN, MDI 1..4: LAN
  DEVICE_PACKAGES:= kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
                uboot-envtools kmod-ledtrig-netdev mountd \
                coreutils coreutils-stty \
                spi-tools \
                kmod-fs-btrfs kmod-fs-nfs \
                kmod-fs-vfat kmod-fs-exfat kmod-fs-ext4 block-mount e2fsprogs \
                kmod-i2c-core kmod-i2c-ralink \
                kmod-nls-base kmod-nls-cp437 kmod-nls-iso8859-1 kmod-nls-utf8 \
                kmod-usb-storage kmod-usb-acm kmod-usb-serial \
                kmod-usb-serial-ch341 kmod-usb-serial-ftdi \
                kmod-usb-serial-pl2303 kmod-usb-serial-wwan \
                luci btrfs-progs dosfsck mkdosfs \
                mtk-wifi
                
endef
TARGET_DEVICES += HLK7688A_router_wllll


define Device/HLK7688A
  DTS := HLK7688A
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  SUPPORTED_DEVICES := hlk7688a
  DEVICE_TITLE := Hi-Link HLK-7688A
  DEVICE_PACKAGES:= kmod-usb2 kmod-usb-ohci \
                uboot-envtools kmod-ledtrig-netdev \
                curl strace coreutils coreutils-stty \
                avahi-nodbus-daemon mountd \
                uhttpd rpcd rpcd-mod-iwinfo \
                python python-pyserial picocom usbutils zile tmux wget \
                openssh-sftp-avahi-service openssh-sftp-client openssh-sftp-server \
                rpcd-mod-rpcsys cgi-io spi-tools \
                kmod-fs-btrfs kmod-fs-nfs \
                kmod-fs-vfat kmod-fs-exfat kmod-fs-ext4 block-mount e2fsprogs \
                kmod-i2c-core kmod-i2c-ralink \
                kmod-nls-base kmod-nls-cp437 kmod-nls-cp936 kmod-nls-cp950 kmod-nls-iso8859-1 kmod-nls-utf8 \
                kmod-usb-storage kmod-usb-acm kmod-usb-serial kmod-usb-serial-ch341 \
                kmod-usb-serial-ftdi kmod-usb-serial-pl2303 kmod-usb-serial-wwan \
                maccalc reg mtk-wifi iperf3 lftp htop\
                luci luci-i18n-base-zh-cn luci-proto-3g \
                btrfs-progs dosfsck mkdosfs
endef
TARGET_DEVICES += HLK7688A
