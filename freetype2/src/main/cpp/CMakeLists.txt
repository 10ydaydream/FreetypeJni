cmake_minimum_required(VERSION 3.4.1)
project("freetypeJni")

#[[
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
]]

####################################################################################################
# 这里使用添加add_subdirectory()的方式，也就是修改项目自带的CMakeLists.txt来完成依赖库的编译

# zlib，NDK也提供了编译后的动态库、静态库，可以直接引用， 名字就是z
#[[find_library(
        zlib
        z
)]]
add_subdirectory(3rdparty/zlib)
add_subdirectory(3rdparty/libpng)
add_subdirectory(3rdparty/freetype)


# test
if (ANDROID)
    message("ANDROID")
endif ()
if (UNIX)
    message("UNIX")
elseif (WIN32)
    message("WIN32")
else ()
    message("...")
endif ()

add_library(
        ${PROJECT_NAME}
        SHARED

        freetype_jni.cpp
)

find_library(
        log-lib
        log
)

target_link_libraries(
        ${PROJECT_NAME}
        ${log-lib}
)