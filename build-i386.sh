#!/usr/bin/env bash

if [ ! -d "wine-7.8" ]; then
    wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
    xz -d wine-7.8.tar.xz
    tar xvf wine-7.8.tar
fi

mkdir build-wine7.8-i386
cd build-wine7.8-i386

# if use ubuntu22.04
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo mv winehq-jammy.sources /etc/apt/sources.list.d/

# * deal with build-dep err: You must put some 'deb-src' URIs in your sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list~
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update

apt-cache show wine-devel:i386=7.8~jammy-1
sudo apt -y build-dep -y wine-devel
# sudo apt build-dep wine-devel:i386=7.8~jammy-1

## complie tools
sudo apt install -y make gcc g++ flex bison gettext gcc-mingw-w64
# necessary i386
sudo apt install -y gcc-multilib g++-multilib xserver-xorg-dev:i386
# Generally necessary
sudo apt install -y libasound2-dev:i386 libpulse-dev:i386 libdbus-1-dev:i386 libfontconfig-dev:i386 libfreetype-dev:i386 libgnutls28-dev:i386 libjpeg-dev:i386 libpng-dev:i386 libtiff-dev:i386 libgl-dev:i386 libunwind-dev:i386 libxml2-dev:i386 libxslt1-dev:i386
# Needed for many applications
sudo apt install -y libfaudio-dev:i386 libgstreamer1.0-dev:i386 libgstreamer-plugins-base1.0-dev:i386 libmpg123-dev:i386 libosmesa6-dev:i386 libsdl2-dev:i386 libudev-dev:i386 libvkd3d-dev:i386 libvulkan-dev:i386
# Rare or domain-specific
sudo apt install -y libcapi20-dev:i386 liblcms2-dev:i386 libcups2-dev:i386 libgphoto2-dev:i386 libsane-dev:i386 libgsm1-dev:i386 libkrb5-dev:i386 libldap2-dev:i386 samba-dev:i386 ocl-icd-opencl-dev:i386 libpcap-dev:i386 libusb-1.0-0-dev:i386 libv4l-dev:i386


../wine-7.8/configure
make -j4
