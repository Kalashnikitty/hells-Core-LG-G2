#!/bin/bash
export ARCH=arm
config=hells_g2_defconfig

if [ ! -f out/zImage ]
then
    if [ ! -f out/kernel/noclean ]
    then
	echo "--- Cleaning up ---"
	rm -rf out
	make mrproper
    fi

	mkdir -p out/kernel
	echo "--- Making defconfig ---"
	make O=out/kernel $config
	echo "--- Building kernel ---"
	make -j8 O=out/kernel
	touch out/kernel/noclean

  if [ -f out/kernel/arch/arm/boot/zImage ]
  then
	echo "--- Installing modules ---"
	make -C out/kernel INSTALL_MOD_PATH=.. modules_install
	mdpath=`find out/lib/modules -type f -name modules.order`

	  if [ "$mdpath" != "" ]
	  then
		mpath=`dirname $mdpath`
		ko=`find $mpath/kernel -type f -name *.ko`
		for i in $ko
		do "$CROSS_COMPILE"strip --strip-unneeded $i
		mkdir -p out/system/lib/modules
		mv $i out/system/lib/modules
		done
	  else
	  echo "--- No modules found ---"
	  fi

	cp out/kernel/arch/arm/boot/zImage out
	rm -f out/kernel/noclean
	rm -rf out/lib
  else
	exit 0
  fi
fi

if [ -d ramdisk ]
then
	mkdir -p out/boot
	mv out/zImage out/boot
	cp scripts/mkbootimg out/boot
	./scripts/mkbootfs ramdisk | gzip > ramdisk.gz
	mv ramdisk.gz out/boot
	./scripts/dtbTool -v -s 2048 -o out/boot/dt.img out/kernel/arch/arm/boot/
	cd out/boot

	base=0x00000000
	offset=0x05000000
	tags_addr=0x04800000
	cmd_line="console=ttyHSL0,115200,n8 androidboot.hardware=g2 user_debug=31 msm_rtb.filter=0x0"
	
	echo "--- Creating boot.img ---"
	./mkbootimg --kernel zImage --ramdisk ramdisk.gz --cmdline "$cmd_line" --base $base --offset $offset --tags-addr $tags_addr --pagesize 2048 --dt dt.img -o newboot.img
	cd ../..
	mv out/boot/newboot.img out/boot.img
	rm -rf out/boot
	echo "--- Done! ---"
else
	echo "--- No ramdisk found ---"
	exit 0
fi
