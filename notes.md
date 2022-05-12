# wine-test

## download wine7.8 source code
wget https://dl.winehq.org/wine/source/7.x/wine-7.8.tar.xz
## or
git clone -b wine-7.8 git://source.winehq.org/git/wine.git ~/wine-dirs/wine-source


## android 包下载
https://dl.winehq.org/wine-builds/android/

--host=aarch64-linux
64位arm aarch64-linux-android
32位arm arm-linux-androideabi

## TODO 升级OSS
OSS sound system found but too old (OSSv4 needed), OSS won't be supported.

## arm 编译
https://users.openoffice.narkive.com/cmZLviUZ/wine-re-how-to-recompile-wine-on-arm

## 可能的交叉编译方式（未成功）

```bash
# ? configure: error: PE cross-compilation is required for ARM64, please install clang/llvm-dlltool/lld, or llvm-mingw.
sudo apt install clang llvm lld

## maybe add CFLAGS="-mcpu=yourcpu -g -O2" LDFLAGS="-mcpu=yourcpu"
../configure --host=arm-linux-gnueabihf host_alias=arm-linux-gnueabihf --with-wine-tools=../path/to/your/native/wine/build && make
 
# ../wine-7.8/configure --host=arm-linux-gnueabi
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/tools
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64
../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64 --without-freetype --enable-win64
 
../wine-7.8/configure --host=aarch64-linux-gnu host_alias=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/ --without-freetype --w
cd build-arm32

## 32位arm
## maybe add CFLAGS="-mcpu=yourcpu -g -O2" LDFLAGS="-mcpu=yourcpu"
../configure --host=arm-linux-gnueabihf host_alias=arm-linux-gnueabihf --with-wine-tools=../path/to/your/native/wine/build && make
 
# ../wine-7.8/configure --host=arm-linux-gnueabi
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/tools
# ../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64
../wine-7.8/configure --host=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64 --without-freetype --enable-win64
 
../wine-7.8/configure --host=aarch64-linux-gnu host_alias=aarch64-linux-gnu --with-wine-tools=../build-wine7.8-amd64/ --without-freetype --without-x --enable-win64
```