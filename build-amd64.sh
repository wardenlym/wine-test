#!/usr/bin/env bash

if [ ! -d "wine-7.8" ]; then
    wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
    xz -d wine-7.8.tar.xz
    tar xvf wine-7.8.tar
fi

mkdir build-wine7.8-amd64
cd build-wine7.8-amd64


# if use ubuntu22.04
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo mv winehq-jammy.sources /etc/apt/sources.list.d/

# * deal with build-dep err: You must put some 'deb-src' URIs in your sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list~
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update

apt-cache show wine-devel=7.8~jammy-1
sudo apt -y build-dep -y wine-devel
# sudo apt build-dep wine-devel:amd64=7.8~jammy-1

## complie tools
sudo apt install -y make gcc g++ flex bison gettext gcc-mingw-w64
# necessary x11
sudo apt install -y xserver-xorg-dev
# Generally necessary
sudo apt install -y libasound2-dev libpulse-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libgnutls28-dev libjpeg-dev libpng-dev libtiff-dev libgl-dev libunwind-dev libxml2-dev libxslt1-dev
# Needed for many applications
sudo apt install -y libfaudio-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmpg123-dev libosmesa6-dev libsdl2-dev libudev-dev libvkd3d-dev libvulkan-dev
# Rare or domain-specific
sudo apt install -y libcapi20-dev liblcms2-dev libcups2-dev libgphoto2-dev libsane-dev libgsm1-dev libkrb5-dev libldap2-dev samba-dev ocl-icd-opencl-dev libpcap-dev libusb-1.0-0-dev libv4l-dev
sudo apt install oss4-dev libxcomposite-dev libopenal-dev

../wine-7.8/configure --enable-win64
make -j4
