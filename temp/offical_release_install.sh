#!/bin/bash

read -p "please input the build num of Jenkins--https://fem101-eiffel046.lmera.ericsson.se:8443/jenkins/job/tblinux-distr-deb-rootfs-arm64/:" build_num
read -p "please input the dus host name like 'dus012':" dus_name
read -p "please input the serial port num:" serial_port_num

dus_num=`echo $dus_name|sed 's/dus0*//'`
#echo dus num is $dus_num

len=$(echo -n $serial_port_num | wc -m)
#echo length is :$len
if [ $len -eq 2 ]; then
	port_num=20${serial_port_num}
elif [ $len -eq 1 ]; then
	port_num=200${serial_port_num}
else
	echo serial port num is wrong
	exit 1
fi

if [ $dus_num -gt 16 ]; then
	serial_server=ts2
else
	serial_server=ts
fi

echo serial port num: $port_num

if [ -d Install_${build_num} ]; then
	cd  Install_${build_num}
else

mkdir Install_${build_num}
cd  Install_${build_num}
path=`pwd`
wget https://fem101-eiffel046.lmera.ericsson.se:8443/jenkins/job/tblinux-distr-deb-rootfs-arm64/${build_num}/artifact/bsp/bb6630/install/arm64_install_scripts.tgz
wget https://fem101-eiffel046.lmera.ericsson.se:8443/jenkins/job/tblinux-distr-deb-rootfs-arm64/${build_num}/artifact/build-artifacts/arm64/images/*zip*/images.zip
tar zxf arm64_install_scripts.tgz
unzip images.zip
git clone ssh://${USER}@gerrit.ericsson.se:29418/tb-linux/bsp && scp -p -P 29418 ${USER}@gerrit.ericsson.se:hooks/commit-msg bsp/.git/hooks/
icm_io_path=`find -name icm_io.bin`
cp ${icm_io_path} ./scripts/

fi

if [ -d /tftpboot/${dus_name} ]; then 
    rm -rf /tftpboot/${dus_name}
fi

cd ./images
kernel_image=$(find `pwd` -name tb-linux.img)
#echo $kernel_image

rootfs=$(find `pwd` -name tblinux-xenial-development*.tar.gz)
#echo $rootfs

initrd=$(find `pwd` -name initrd.img-*)
#echo $initrd
cd ..


sed -i 's/timeout[[:space:]]*5/timeout 15/' ./scripts/lib.tcl

make install dusIp=192.168.0.${dus_num} dusId=${dus_name} bladeIp=192.168.0.254 tftpDir=/tftpboot/${dus_name} BOARDTYPE=DUS53 serial="${serial_server} ${port_num}" OWN_KERNEL_IMG=${kernel_image} OWN_ROOTFS_IMG=${rootfs} OWN_INITRD_IMG=${initrd}


cd ..
#rm -rf  Install_${build_num}
