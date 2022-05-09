#!/usr/bin/env bash

# download wine7.8 source code
wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
# or
git clone -b wine-7.8 git://source.winehq.org/git/wine.git ~/wine-dirs/wine-source


mkdir build-amd32 build-amd64 build-arm32 build-arm64

sudo apt install xz
xz -d wine-7.8.tar.xz
tar xvf wine-7.8.tar

sudo dpkg --add-architecture i386 
# if ubuntu22.04
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo mv winehq-jammy.sources /etc/apt/sources.list.d/

sudo apt update

# tools
sudo apt install -y make gcc g++ flex bison gettext 

# necessary amd64
sudo apt install -y gcc-mingw-w64 libasound2-dev libpulse-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libgnutls28-dev libpng-dev  libjpeg-dev libgl-dev libunwind-dev libxml2-dev libxslt1-dev
sudo apt install -y libfaudio-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmpg123-dev libosmesa6-dev libsdl2-dev libudev-dev libvkd3d-dev libvulkan-dev

# necessary amd32
sudo apt install gcc-multilib g++-multilib xserver-xorg-dev:i386 libfreetype6-dev:i386
sudo apt-get install gcc-multilib libasound2-dev:i386 libgsm1-dev:i386 libjpeg8-dev:i386 liblcms2-dev:i386 libldap2-dev:i386 libmpg123-dev:i386 libopenal-dev:i386 libv4l-dev:i386 libx11-dev:i386 libxinerama-dev:i386 libxml2-dev:i386 zlib1g-dev:i386 
sudo apt-get install libcapi20-dev:i386 libcups2:i386 libdbus-1-3:i386 libfontconfig:i386 libfreetype6:i386 libglu1-mesa:i386 libncurses5:i386 libosmesa6:i386 libsane:i386 libxcomposite1:i386 libxcursor1:i386 libxi6:i386 libxrandr2:i386 libxslt1.1:i386 ocl-icd-libopencl1:i386
sudo apt-get install libvkd3d-dev:i386 libvulkan-dev:i386

# build amd32
cd build-amd32
../wine-source/configure
make
## 需要x11？

## build amd64
cd build-amd64
../wine-source/configure --enable-win64
make


