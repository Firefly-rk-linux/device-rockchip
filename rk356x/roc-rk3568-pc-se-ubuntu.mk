#!/bin/bash

CMD=`realpath $BASH_SOURCE`
CUR_DIR=`dirname $CMD`

source $CUR_DIR/firefly-rk3568-ubuntu.mk

# Kernel dts
export RK_KERNEL_DTS=rk3568-firefly-roc-pc-se
# PRODUCT MODEL
export RK_PRODUCT_MODEL=ROC_RK3568_PC_SE
