CMD=`realpath $BASH_SOURCE`
CUR_DIR=`dirname $CMD`

source $CUR_DIR/itx-3588j-buildroot.mk

# Kernel dts
export RK_KERNEL_DTS=aio-3588jd4

# PRODUCT MODEL
export RK_PRODUCT_MODEL=AIO-3588JD4

#SPL_CONFIG
export RK_SPL_INI_CONFIG=RK3588_115200MINIALL.ini
