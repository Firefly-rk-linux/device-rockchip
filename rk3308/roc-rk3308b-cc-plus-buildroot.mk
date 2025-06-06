#!/bin/bash

CMD=`realpath $BASH_SOURCE`
CUR_DIR=`dirname $CMD`

source $CUR_DIR/BoardConfig_RK3308B_firefly.mk

# Uboot defconfig
export RK_UBOOT_DEFCONFIG=firefly-rk3308-debug-uart4
# Kernel defconfig
export RK_KERNEL_DEFCONFIG=firefly-rk3308b_linux_defconfig
# Kernel dts
export RK_KERNEL_DTS=rk3308b-roc-cc-plus-amic_emmc
# parameter for GPT table
export RK_PARAMETER=parameter-64bit-emmc.txt
# packagefile for make update image
export RK_PACKAGE_FILE=rk3308-package-file
# Buildroot config
export RK_CFG_BUILDROOT=firefly_rk3308_release
# Recovery config
export RK_CFG_RECOVERY=firefly_rk3308_recovery
# PRODUCT MODEL
export RK_PRODUCT_MODEL=ROC_RK3308B_CC_PLUS
