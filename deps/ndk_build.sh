#!/bin/bash

# 交叉编译脚本
# 需要NDK编译工具链来交叉编译Android平台的静态库或者动态库

### aarch64 arm64位
make clean

NDK=/data/android/sdk/ndk/23.2.8568313
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot
TARGET_PLATFORM=aarch64-none-linux-android21

export CC=$TOOLCHAIN/bin/aarch64-linux-android21-clang
export CFLAGS="-g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security  -O2 -DNDEBUG  -fPIC  --target=$TARGET_PLATFORM --gcc-toolchain=$TOOLCHAIN "

CPU=arm64-v8a
PREFIX=$(pwd)/android/$CPU

function build
{
./configure \
--host=aarch64-linux-android \
--prefix=$PREFIX \
--enable-shared \
--enable-static \
--with-zlib=no \
--with-bzip2=no \
--with-png=no \
--with-harfbuzz=no \
--with-sysroot=$SYSROOT \

make -j8
make install
}

build


### arm32位
make clean

NDK=/data/android/sdk/ndk/23.2.8568313
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot
TARGET_PLATFORM=arm-linux-android21

export CC=$TOOLCHAIN/bin/armv7a-linux-androideabi21-clang
export CFLAGS="-g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security  -O2 -DNDEBUG  -fPIC  --target=$TARGET_PLATFORM --gcc-toolchain=$TOOLCHAIN "

CPU=armeabi-v7a
PREFIX=$(pwd)/android/$CPU

function build
{
./configure \
--host=arm-linux-androideabi \
--prefix=$PREFIX \
--enable-shared \
--enable-static \
--with-zlib=no \
--with-bzip2=no \
--with-png=no \
--with-harfbuzz=no \
--with-sysroot=$SYSROOT \

make -j8
make install
}

build

### x86
make clean

NDK=/data/android/sdk/ndk/23.2.8568313
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot
TARGET_PLATFORM=i686-linux-android21

export CC=$TOOLCHAIN/bin/i686-linux-android21-clang
export CFLAGS="-g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security  -O2 -DNDEBUG  -fPIC  --target=$TARGET_PLATFORM --gcc-toolchain=$TOOLCHAIN "

CPU=x86
PREFIX=$(pwd)/android/$CPU

function build
{
./configure \
--host=i686-linux-android21 \
--prefix=$PREFIX \
--enable-shared \
--enable-static \
--with-zlib=no \
--with-bzip2=no \
--with-png=no \
--with-harfbuzz=no \
--with-sysroot=$SYSROOT \

make -j8
make install
}

build

### x86_64
make clean

NDK=/data/android/sdk/ndk/23.2.8568313
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot
TARGET_PLATFORM=x86_64-linux-android21

export CC=$TOOLCHAIN/bin/x86_64-linux-android21-clang
export CFLAGS="-g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security  -O2 -DNDEBUG  -fPIC  --target=$TARGET_PLATFORM --gcc-toolchain=$TOOLCHAIN "

CPU=x86_64
PREFIX=$(pwd)/android/$CPU

function build
{
./configure \
--host=x86_64-linux-android21 \
--prefix=$PREFIX \
--enable-shared \
--enable-static \
--with-zlib=no \
--with-bzip2=no \
--with-png=no \
--with-harfbuzz=no \
--with-sysroot=$SYSROOT \

make -j8
make install
}

build

