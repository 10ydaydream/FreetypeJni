# Freetype2 for Android

Freetype2内部提供有CMakeLists.txt文件用于编译，移植主要是在该文件的基础上进行删减、调整，以便于可以通过NDK的cmake来进行编译

## freetype2的CMakeLists.txt文件分析

Freetype2内部提供有CMakeLists.txt文件包含了完整的编译流程控制，可以通读一遍，移植的时候需要注意（也是后面调整）的有几点

* 对于依赖库的查找路径：是通过find_package()方法进行查找，这个方法依赖于当前编译平台的相关库安装情况；
* 根据不同目标平台对源文件的修改处理：根据不同平台，会生成不同的源文件；
    * include引入应该不需要处理，因为在编译过程中修改的头文件后，然后再进行编译，但是在使用的时候需要注意引用报错的问题；
    * 影响文件有：
        * /include/freetype/config/ftoption.h
        * /include/freetype/config/ftconfig.h

## Freetype交叉编译处理

有两种方式处理吧：

1. 手动交叉编译Freetype以及其依赖库的so文件，最终分成多个不同的动态库

* 这样编译出来的动态库可以复用
* 需要小部分调整项目自带的CMakeLists.txt文件之后再进行交叉编译

2. 引入源码，通过Android项目的cmake进行编译，生成一个整合的动态库

* 编译出来的动态库文件会相对来说比较大
* 需要手动引入源码，然后根据项目自带的CMakeLists.txt文件，进行一些相关的配置、调整

难点

* 需要熟悉项目本身提供的CMakeLists.txt的编译配置过程，才能在其基础上来自定义编译过程
* CMakeLists.txt文件中涉及一些目标平台相关的配置，以及对源码文件的一些特殊处理
  -- 基本上都是对已有CMakeLists.txt的改造；
  -- 也就是主要的移植难点吧，需要针对不同平台的特殊处理；

交叉编译脚本，详细参考[脚本文件](./deps/ndk_build.sh)

```shell
# 清理编辑结果文件
make clean
# 声明交叉编译用到的NDK工具链
# SDK的NDK对应版本目录
NDK=/data/android/sdk/ndk/23.2.8568313
# 工具链
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot
TARGET_PLATFORM=aarch64-none-linux-android21

export CC=$TOOLCHAIN/bin/aarch64-linux-android21-clang
export CFLAGS="-g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security  -O2 -DNDEBUG  -fPIC  --target=$TARGET_PLATFORM --gcc-toolchain=$TOOLCHAIN "

# cpu架构名称，也就是声明结果保存路径
CPU=arm64-v8a
PREFIX=$(pwd)/android/$CPU

function build
{
  #configure命令参数配置
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
```

## 交叉编译结果

[交叉编译结果](./deps/freetype-2.13.2)