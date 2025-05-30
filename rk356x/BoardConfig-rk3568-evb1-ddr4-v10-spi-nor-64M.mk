#!/bin/bash

# Target arch
export RK_ARCH=arm64
# Uboot defconfig
export RK_UBOOT_DEFCONFIG=rk3568
# Uboot image format type: fit(flattened image tree)
export RK_UBOOT_FORMAT_TYPE=fit
# Kernel defconfig
export RK_KERNEL_DEFCONFIG=rockchip_linux_defconfig
# Kernel defconfig fragment
export RK_KERNEL_DEFCONFIG_FRAGMENT=rk356x_linux.config
# Kernel dts
export RK_KERNEL_DTS=rk3568-evb1-ddr4-v10-linux-spi-nor
# boot image type
export RK_BOOT_IMG=zboot.img
# kernel image path
export RK_KERNEL_ZIMG=kernel/arch/arm64/boot/Image.lz4
# kernel image format type: fit(flattened image tree)
export RK_KERNEL_FIT_ITS=zboot.its
# parameter for GPT table
export RK_PARAMETER=parameter-buildroot-spi-nor-64M.txt
# Buildroot config
export RK_CFG_BUILDROOT=rockchip_rk356x_libs
# Recovery config
export RK_CFG_RECOVERY=
# Recovery image format type: fit(flattened image tree)
export RK_RECOVERY_FIT_ITS=boot4recovery.its
# ramboot config
export RK_CFG_RAMBOOT=
# Pcba config
export RK_CFG_PCBA=
# Build jobs
export RK_JOBS=12
# target chip
export RK_TARGET_PRODUCT=rk356x
# Set rootfs type, including ext2 ext4 squashfs
export RK_ROOTFS_TYPE=squashfs
# Set debian version (debian10: buster, debian11: bullseye)
export RK_DEBIAN_VERSION=bullseye
# yocto machine
export RK_YOCTO_MACHINE=rockchip-rk3568-evb
# rootfs image path
export RK_ROOTFS_IMG=rockdev/rootfs.${RK_ROOTFS_TYPE}
# Set ramboot image type
export RK_RAMBOOT_TYPE=
# Set oem partition type, including ext2 squashfs
export RK_OEM_FS_TYPE=jffs2
# Set oem node
export RK_OEM_NODE=/dev/mtdblock4
# Set userdata partition type, including ext2, fat
export RK_USERDATA_FS_TYPE=jffs2
# Set userdata node
export RK_USERDATA_NODE=/dev/mtdblock5
#OEM config
export RK_OEM_DIR=oem_sample
# OEM build on buildroot
#export RK_OEM_BUILDIN_BUILDROOT=YES
#userdata config
export RK_USERDATA_DIR=userdata_normal
#misc image
export RK_MISC=
#choose enable distro module
export RK_DISTRO_MODULE=
# Define pre-build script for this board
export RK_BOARD_PRE_BUILD_SCRIPT=app-build.sh
# Define package-file
export RK_PACKAGE_FILE=rk356x-package-file-spi-nor
# Define WiFi BT chip
# Compatible with Realtek and AP6XXX WiFi : RK_WIFIBT_CHIP=ALL_AP
# Compatible with Realtek and CYWXXX WiFi : RK_WIFIBT_CHIP=ALL_CY
# Single WiFi configuration: AP6256 or CYW43455: RK_WIFIBT_CHIP=AP6256
export RK_WIFIBT_CHIP=AP6398S
# Define BT ttySX
export RK_WIFIBT_TTY=ttyS8
