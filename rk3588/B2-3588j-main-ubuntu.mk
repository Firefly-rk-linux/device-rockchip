CMD=`realpath $BASH_SOURCE`
CUR_DIR=`dirname $CMD`

source $CUR_DIR/itx-3588j-buildroot.mk

# Kernel defconfig fragment
export RK_KERNEL_DEFCONFIG_FRAGMENT="$RK_KERNEL_DEFCONFIG_FRAGMENT  firefly-cs-main.config"

export FF_EXTBOOT_SIZE=256M

# Kernel dts
export RK_KERNEL_DTS=B2-3588j-main

# Set rootfs type, including ext2 ext4 squashfs
export RK_ROOTFS_TYPE=ext4
# rootfs image path
export RK_ROOTFS_IMG=ubuntu_rootfs/rootfs.img

# Buildroot config
export RK_CFG_BUILDROOT=

#OEM config
export RK_OEM_DIR=

#userdata config
export RK_USERDATA_DIR=

# rootfs_system
export RK_ROOTFS_SYSTEM=ubuntu

# packagefile for make update image
export RK_PACKAGE_FILE=rk3588-ubuntu-package-file

#SPL_CONFIG
export RK_SPL_INI_CONFIG=RK3588_115200MINIALL.ini
