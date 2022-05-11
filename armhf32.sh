#!/usr/bin/env bash

if [ ! -d "wine-7.8" ]; then
    wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
    tar xf wine-7.8.tar.xz
fi

mkdir build-arm32
cd build-arm32

## 32位arm
## maybe add CFLAGS="-mcpu=yourcpu -g -O2" LDFLAGS="-mcpu=yourcpu"
../configure --host=arm-linux-gnueabihf host_alias=arm-linux-gnueabihf --with-wine-tools=../path/to/your/native/wine/build && make

# ../wine-7.8/configure --host=arm-linux-gnueabi
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/tools
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64
../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64 --without-freetype --enable-win64

../wine-7.8/configure --host=aarch64-linux-gnu host_alias=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/ --without-freetype --without-x --enable-win64

## --host=aarch64-linux

## 64位arm aarch64-linux-android
## 32位arm arm-linux-androideabi


sudo dpkg --add-architecture armhf


## complie tools
sudo apt install -y make gcc g++ flex bison gettext gcc-mingw-w64
  # ? configure: error: PE cross-compilation is required for ARM64, please install clang/llvm-dlltool/lld, or llvm-mingw.
sudo apt install clang llvm lld
# necessary x11
sudo apt install -y xserver-xorg-dev:armhf
# Generally necessary
sudo apt install -y libasound2-dev:armhf libpulse-dev:armhf libdbus-1-dev:armhf libfontconfig-dev:armhf libfreetype-dev:armhf libgnutls28-dev:armhf libjpeg-dev:armhf libpng-dev:armhf libtiff-dev:armhf libgl-dev:armhf libunwind-dev:armhf libxml2-dev:armhf libxslt1-dev:armhf
# Needed for many applications
sudo apt install -y libfaudio-dev:armhf libgstreamer1.0-dev:armhf libgstreamer-plugins-base1.0-dev:armhf libmpg123-dev:armhf libosmesa6-dev:armhf libsdl2-dev:armhf libudev-dev:armhf libvkd3d-dev:armhf libvulkan-dev:armhf
# Rare or domain-specific
sudo apt install -y libcapi20-dev:armhf liblcms2-dev:armhf libcups2-dev:armhf libgphoto2-dev:armhf libsane-dev:armhf libgsm1-dev:armhf libkrb5-dev:armhf libldap2-dev:armhf samba-dev:armhf ocl-icd-opencl-dev:armhf libpcap-dev:armhf libusb-1.0-0-dev:armhf libv4l-dev:armhf

sudo apt install oss4-dev:armhf libxcomposite-dev:armhf libopenal-dev:armhf


../wine-7.8/configure
make -j4

