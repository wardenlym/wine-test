#!/usr/bin/env bash

if [ ! -d "wine-7.8" ]; then
    wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
    tar xf wine-7.8.tar.xz
fi

mkdir build-arm
cd build-arm

../wine-7.8/configure --host=arm-linux-gnueabi

# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/tools
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64
../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64 --without-freetype --enable-win64

../wine-7.8/configure --host=aarch64-linux-gnu host_alias=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/ --without-freetype --without-x --enable-win64

## --host=aarch64-linux

## 64位arm aarch64-linux-android
## 32位arm arm-linux-androideabi

## complie tools
sudo apt install -y make gcc g++ flex bison gettext gcc-mingw-w64 clang llvm
## cross complier
sudo apt install -y gcc-arm-linux-gnueabi gcc-aarch64-linux-gnu
## gcc-multilib
sudo apt install -y gcc-multilib g++-multilib

