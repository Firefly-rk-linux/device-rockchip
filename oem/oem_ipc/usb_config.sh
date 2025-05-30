#!/bin/sh

ADB_EN=on
if ( echo $2 |grep -q "off" ); then
ADB_EN=off
fi
USB_FUNCTIONS_DIR=/sys/kernel/config/usb_gadget/rockchip/functions
USB_CONFIGS_DIR=/sys/kernel/config/usb_gadget/rockchip/configs/b.1
backup=/dev/block/by-name/backup
file=/tmp/tmp_mac
NETINTERFACE=eth0
DNS="8.8.8.8"
IP="172.16.110.6"
GW="172.16.110.1"

configure_uvc_resolution_yuyv()
{
    UVC_DISPLAY_W=$1
    UVC_DISPLAY_H=$2
    mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p
    echo $UVC_DISPLAY_W > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/wWidth
    echo $UVC_DISPLAY_H > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/wHeight
    echo 333333 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwDefaultFrameInterval
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwMinBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwMaxBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*2)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwMaxVideoFrameBufferSize
    echo -e "333333\n666666\n1000000\n2000000" > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwFrameInterval
}

configure_uvc_resolution_yuyv_720p()
{
    UVC_DISPLAY_W=$1
    UVC_DISPLAY_H=$2
    mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p
    echo $UVC_DISPLAY_W > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/wWidth
    echo $UVC_DISPLAY_H > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/wHeight
    echo 1000000 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwDefaultFrameInterval
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwMinBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwMaxBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*2)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwMaxVideoFrameBufferSize
    echo -e "1000000\n2000000" > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u/${UVC_DISPLAY_H}p/dwFrameInterval
}

configure_uvc_resolution_mjpeg()
{
    UVC_DISPLAY_W=$1
    UVC_DISPLAY_H=$2
    mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p
    echo $UVC_DISPLAY_W > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/wWidth
    echo $UVC_DISPLAY_H > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/wHeight
    echo 333333 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/dwDefaultFrameInterval
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/dwMinBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/dwMaxBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*2)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/dwMaxVideoFrameBufferSize
    echo -e "333333\n666666\n1000000\n2000000" > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m/${UVC_DISPLAY_H}p/dwFrameInterval
}
configure_uvc_resolution_h264()
{
    UVC_DISPLAY_W=$1
    UVC_DISPLAY_H=$2
	mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p
	echo $UVC_DISPLAY_W > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p/wWidth
	echo $UVC_DISPLAY_H > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p/wHeight
	echo 333333 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p/dwDefaultFrameInterval
	echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p/dwMinBitRate
	echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p/dwMaxBitRate
	echo -e "333333\n400000\n500000\n666666\n1000000\n2000000" > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/${UVC_DISPLAY_H}p/dwFrameInterval
        echo -ne \\x48\\x32\\x36\\x34\\x00\\x00\\x10\\x00\\x80\\x00\\x00\\xaa\\x00\\x38\\x9b\\x71 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1/guidFormat
}
configure_uvc_resolution_h265()
{
        UVC_DISPLAY_W=$1
        UVC_DISPLAY_H=$2
        mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p
        echo $UVC_DISPLAY_W > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p/wWidth
        echo $UVC_DISPLAY_H > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p/wHeight
        echo 333333 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p/dwDefaultFrameInterval
        echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p/dwMinBitRate
        echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p/dwMaxBitRate
        echo -e "333333\n400000\n500000" > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/${UVC_DISPLAY_H}p/dwFrameInterval
        echo -ne \\x48\\x32\\x36\\x35\\x00\\x00\\x10\\x00\\x80\\x00\\x00\\xaa\\x00\\x38\\x9b\\x71 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2/guidFormat
}
uvc_device_config()
{
  mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6
  echo 3072 > ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming_maxpacket
  echo 2 > ${USB_FUNCTIONS_DIR}/uvc.gs6/uvc_num_request
  #echo 1 > /sys/kernel/config/usb_gadget/rockchip/functions/uvc.gs6/streaming_bulk

  mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/control/header/h
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/control/header/h ${USB_FUNCTIONS_DIR}/uvc.gs6/control/class/fs/h
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/control/header/h ${USB_FUNCTIONS_DIR}/uvc.gs6/control/class/ss/h
  ##YUYV support config
  mkdir /sys/kernel/config/usb_gadget/rockchip/functions/uvc.gs6/streaming/uncompressed/u
  configure_uvc_resolution_yuyv 320 240
  configure_uvc_resolution_yuyv 640 480
  configure_uvc_resolution_yuyv_720p 1280 720

  ##mjpeg support config
  mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m
  configure_uvc_resolution_mjpeg 320 240
  configure_uvc_resolution_mjpeg 640 360
  configure_uvc_resolution_mjpeg 640 480
  configure_uvc_resolution_mjpeg 768 448
  configure_uvc_resolution_mjpeg 1280 720
  configure_uvc_resolution_mjpeg 1024 768
  configure_uvc_resolution_mjpeg 1920 1080
  configure_uvc_resolution_mjpeg 2560 1440
  #configure_uvc_resolution_mjpeg 2592 1944

  ## h.264 support config
  mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1
  configure_uvc_resolution_h264 640 480
  configure_uvc_resolution_h264 1280 720
  configure_uvc_resolution_h264 1920 1080
  configure_uvc_resolution_h264 2560 1440
  configure_uvc_resolution_h264 3840 2160

  ## h.265 support config
  mkdir ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2
  configure_uvc_resolution_h265 640 480
  configure_uvc_resolution_h265 1280 720
  configure_uvc_resolution_h265 1920 1080
  configure_uvc_resolution_h265 2560 1440
  configure_uvc_resolution_h265 3840 2160

  mkdir /sys/kernel/config/usb_gadget/rockchip/functions/uvc.gs6/streaming/header/h
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/uncompressed/u ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h/u
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/mjpeg/m ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h/m
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f1 ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h/f1
    ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/framebased/f2 ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h/f2
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/class/fs/h
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/class/hs/h
  ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/header/h ${USB_FUNCTIONS_DIR}/uvc.gs6/streaming/class/ss/h
}
uac_device_config()
{
  UAC=$1
  mkdir ${USB_FUNCTIONS_DIR}/${UAC}.gs0
  UAC_GS0=${USB_FUNCTIONS_DIR}/${UAC}.gs0
  echo 3 > ${UAC_GS0}/p_chmask
  echo 2 > ${UAC_GS0}/p_ssize
  echo 1 > ${UAC_GS0}/p_feature_unit
  echo 8000,16000,44100,48000 > ${UAC_GS0}/p_srate

  echo 3 > ${UAC_GS0}/c_chmask
  echo 2 > ${UAC_GS0}/c_ssize
  echo 1 > ${UAC_GS0}/c_feature_unit
  echo 8000,16000,44100,48000 > ${UAC_GS0}/c_srate

  ln -s ${UAC_GS0} ${USB_CONFIGS_DIR}/f2
}
pre_run_rndis()
{
  RNDIS_STR="rndis"
  if ( echo $1 |grep -q "rndis" ); then
   #sleep 1
   IP_FILE=/data/uvc_xu_ip_save
   echo "config eth0 IP..."
   if [ -f $IP_FILE ]; then
      for line in `cat $IP_FILE`
      do
        echo "save ip is: $line"
        ifconfig $NETINTERFACE $line
      done
   else
    ifconfig $NETINTERFACE $IP
    ifconfig $NETINTERFACE down
    ifconfig $NETINTERFACE up
    route add default gw $GW
    echo "nameserver $DNS" > /etc/resolv.conf

   fi
   ifconfig $NETINTERFACE up
  fi
}
pre_run_adb()
{
  if [ $ADB_EN = on ];then
    umount /dev/usb-ffs/adb
    mkdir -p /dev/usb-ffs/adb -m 0770
    mount -o uid=2000,gid=2000 -t functionfs adb /dev/usb-ffs/adb
    start-stop-daemon --start --quiet --background --exec /usr/bin/adbd
  fi
}

##main
#init usb config
/etc/init.d/S10udev stop
umount /sys/kernel/config
mkdir /dev/usb-ffs
mount -t configfs none /sys/kernel/config
mkdir -p /sys/kernel/config/usb_gadget/rockchip
mkdir -p /sys/kernel/config/usb_gadget/rockchip/strings/0x409
mkdir -p ${USB_CONFIGS_DIR}/strings/0x409
echo 0x2207 > /sys/kernel/config/usb_gadget/rockchip/idVendor
echo 0x0310 > /sys/kernel/config/usb_gadget/rockchip/bcdDevice
echo 0x0200 > /sys/kernel/config/usb_gadget/rockchip/bcdUSB
echo 239 > /sys/kernel/config/usb_gadget/rockchip/bDeviceClass
echo 2 > /sys/kernel/config/usb_gadget/rockchip/bDeviceSubClass
echo 1 > /sys/kernel/config/usb_gadget/rockchip/bDeviceProtocol

echo "2020" > /sys/kernel/config/usb_gadget/rockchip/strings/0x409/serialnumber
echo "rockchip" > /sys/kernel/config/usb_gadget/rockchip/strings/0x409/manufacturer
echo "UVC" > /sys/kernel/config/usb_gadget/rockchip/strings/0x409/product
echo 0x1 > /sys/kernel/config/usb_gadget/rockchip/os_desc/b_vendor_code
echo "MSFT100" > /sys/kernel/config/usb_gadget/rockchip/os_desc/qw_sign
echo 500 > /sys/kernel/config/usb_gadget/rockchip/configs/b.1/MaxPower
#ln -s /sys/kernel/config/usb_gadget/rockchip/configs/b.1 /sys/kernel/config/usb_gadget/rockchip/os_desc/b.1
echo 0x0020 > /sys/kernel/config/usb_gadget/rockchip/idProduct

#uvc config init
uvc_device_config
##reset config,del default adb config
if [ -e ${USB_CONFIGS_DIR}/ffs.adb ]; then
   #for rk1808 kernel 4.4
   rm -f ${USB_CONFIGS_DIR}/ffs.adb
else
   ls ${USB_CONFIGS_DIR} | grep f[0-9] | xargs -I {} rm ${USB_CONFIGS_DIR}/{}
fi

case "$1" in
rndis)
   # config rndis
   rndis_path="/sys/kernel/config/usb_gadget/rockchip/functions/rndis.gs0"
   mkdir $rndis_path
   # rndis Mac 地址写入 backup 分区，开机校验分区是否存在 Mac 地址
   HOST_MAC=$(cat $file  | cut -c1-100 | grep HOST_MAC | awk -F '=' '{print $2}')
   DEV_MAC=$(cat $file  | cut -c1-100 | grep DEV_MAC | awk -F '=' '{print $2}')
   if [ ! -n "$HOST_MAC" ] || [ ! -n "$DEV_MAC" ];then
            HOST_MAC=$(cat $rndis_path/host_addr)
            DEV_MAC=$(cat $rndis_path/dev_addr)
            echo "HOST_MAC=$HOST_MAC" > $file
            echo "DEV_MAC=$DEV_MAC" >> $file
            dd if=$file of=$backup
   else
	    echo "$HOST_MAC" > $rndis_path/host_addr
	    echo "$DEV_MAC" > $rndis_path/dev_addr
   fi
   echo "uvc_rndis" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
   ln -s ${USB_FUNCTIONS_DIR}/rndis.gs0 ${USB_CONFIGS_DIR}/f2
   echo "config uvc and rndis..."
   ;;
uac1)
   uac_device_config uac1
   echo "uvc_uac1" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
   echo "config uvc and uac1..."
   ;;
uac2)
   uac_device_config uac2
   echo "uvc_uac2" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
   echo "config uvc and uac2..."
   ;;
uac1_rndis)
   uac_device_config uac1
   mkdir /sys/kernel/config/usb_gadget/rockchip/functions/rndis.gs0
   ln -s ${USB_FUNCTIONS_DIR}/rndis.gs0 ${USB_CONFIGS_DIR}/f3
   echo "uvc_uac1_rndis" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
   echo "config uvc and uac1 rndis..."
   ;;
uac2_rndis)
   uac_device_config uac2
   mkdir /sys/kernel/config/usb_gadget/rockchip/functions/rndis.gs0
   ln -s ${USB_FUNCTIONS_DIR}/rndis.gs0 ${USB_CONFIGS_DIR}/f3
   echo "uvc_uac2_rndis" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
   echo "config uvc and uac2 rndis..."
   ;;
*)
   echo "uvc" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
   echo "config uvc ..."
esac

ln -s ${USB_FUNCTIONS_DIR}/uvc.gs6 ${USB_CONFIGS_DIR}/f1

if [ $ADB_EN = on ];then
  mkdir ${USB_FUNCTIONS_DIR}/ffs.adb
  CONFIG_STR=`cat /sys/kernel/config/usb_gadget/rockchip/configs/b.1/strings/0x409/configuration`
  STR=${CONFIG_STR}_adb
  echo $STR > ${USB_CONFIGS_DIR}/strings/0x409/configuration
  USB_CNT=`echo $STR | awk -F"_" '{print NF-1}'`
  let USB_CNT=USB_CNT+1
  echo "adb on++++++ ${USB_CNT}"
  ln -s ${USB_FUNCTIONS_DIR}/ffs.adb ${USB_CONFIGS_DIR}/f${USB_CNT}
  pre_run_adb
  sleep 1
fi

UDC=`ls /sys/class/udc/| awk '{print $1}'`
echo $UDC > /sys/kernel/config/usb_gadget/rockchip/UDC

if [ "$1" ]; then
  pre_run_rndis $1
fi
