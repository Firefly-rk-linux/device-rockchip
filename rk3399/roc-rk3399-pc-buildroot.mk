#!/bin/bash

CMD=`realpath $BASH_SOURCE`
CUR_DIR=`dirname $CMD`

source $CUR_DIR/firefly-rk3399-buildroot.mk

# Uboot defconfig
export RK_UBOOT_DEFCONFIG=roc-rk3399-pc

# Kernel dts
export RK_KERNEL_DTS=rk3399-roc-pc
# DRM version
export RK_DRM_VERSION=2
# DRM version
export RK_DRM_VERSION=2

# PRODUCT MODEL
export RK_PRODUCT_MODEL=ROC_3399_PC
