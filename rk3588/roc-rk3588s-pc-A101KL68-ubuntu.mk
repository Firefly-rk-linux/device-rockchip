CMD=`realpath $BASH_SOURCE`
CUR_DIR=`dirname $CMD`

source $CUR_DIR/roc-rk3588s-pc-ubuntu.mk

# Kernel dts
export RK_KERNEL_DTS=roc-rk3588s-pc-mipi101-BSD1218-A101KL68
