#!/usr/bin/env bash

if [ ! -d "wine-7.8" ]; then
    wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
    tar xf wine-7.8.tar.xz
fi

mkdir build-arm32
cd build-arm32

sudo dpkg --add-architecture armhf

## complie tools
sudo apt install -y make gcc g++ flex bison gettext gcc-mingw-w64 build-essential
  # ? configure: error: PE cross-compilation is required for ARM64, please install clang/llvm-dlltool/lld, or llvm-mingw.
sudo apt install clang llvm lld
# necessary x11
sudo apt install -y xserver-xorg-dev:armhf
# Generally necessary
sudo apt install -y libasound2-dev:armhf libpulse-dev:armhf libdbus-1-dev:armhf libfontconfig-dev:armhf libfreetype-dev:armhf libgnutls28-dev:armhf libjpeg-dev:armhf libpng-dev:armhf libtiff-dev:armhf libgl-dev:armhf libunwind-dev:armhf libxml2-dev:armhf libxslt1-dev:armhf
# Needed for many applications
sudo apt install -y libfaudio-dev:armhf libgstreamer1.0-dev:armhf libgstreamer-plugins-base1.0-dev:armhf libmpg123-dev:armhf libosmesa6-dev:armhf libsdl2-dev:armhf libudev-dev:armhf libvkd3d-dev:armhf libvulkan-dev:armhf
# Rare or domain-specific
sudo apt install -y libcapi20-dev:armhf liblcms2-dev:armhf libcups2-dev:armhf libgphoto2-dev:armhf libsane-dev:armhf libgsm1-dev:armhf libkrb5-dev:armhf libldap2-dev:armhf ocl-icd-opencl-dev:armhf libpcap-dev:armhf libusb-1.0-0-dev:armhf libv4l-dev:armhf

sudo apt install -y libxcomposite-dev:armhf libopenal-dev:armhf

# ../wine-7.8/configure
PKG_CONFIG_PATH=/usr/x86_64-w64-mingw32/lib ../wine-7.8/configure --with-wine64=../build-arm64
PKG_CONFIG_PATH=/usr/lib ../wine-7.8/configure --with-wine64=../build-arm64
make -j4

../wine-7.8/configure --host=arm-linux-gnueabihf host_alias=arm-linux-gnueabihf

# ???
../wine-7.8/configure --host=armhf-linux-gnu host_alias=armhf-linux-gnu

# 交叉编译器
sudo apt-get install libc6-armhf-cross libc6-dev-armhf-cross binutils-arm-linux-gnueabihf libncurses5-dev libssl-dev bc gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf


../wine-7.8/configure --host=arm-linux-gnueabihf

../wine-7.8/configure --host=arm-linux-gnueabihf host_alias=arm-linux-gnueabihf --without-pthread --without-x --without-freetype --with-wine-tools=../build-arm32


./configure --host=arm-linux-gnueabi --with-wine-tools=../build-arm64 --without-freetype
