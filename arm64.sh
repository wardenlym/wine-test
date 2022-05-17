#!/usr/bin/env bash

if [ ! -d "wine-7.8" ]; then
    wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
    tar xf wine-7.8.tar.xz
fi

mkdir build-arm64
cd build-arm64



## complie tools
sudo apt install -y make gcc g++ flex bison gettext gcc-mingw-w64
  # ? configure: error: PE cross-compilation is required for ARM64, please install clang/llvm-dlltool/lld, or llvm-mingw.
sudo apt install -y clang llvm lld
# necessary x11
sudo apt install -y xserver-xorg-dev
# Generally necessary
sudo apt install -y libasound2-dev libpulse-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libgnutls28-dev libjpeg-dev libpng-dev libtiff-dev libgl-dev libunwind-dev libxml2-dev libxslt1-dev
# Needed for many applications
sudo apt install -y libfaudio-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmpg123-dev libosmesa6-dev libsdl2-dev libudev-dev libvkd3d-dev libvulkan-dev
# Rare or domain-specific
sudo apt install -y libcapi20-dev liblcms2-dev libcups2-dev libgphoto2-dev libsane-dev libgsm1-dev libkrb5-dev libldap2-dev samba-dev ocl-icd-opencl-dev libpcap-dev libusb-1.0-0-dev libv4l-dev

sudo apt install -y oss4-dev libxcomposite-dev libopenal-dev


../wine-7.8/configure --enable-win64
make -j4

