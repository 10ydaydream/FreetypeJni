# bridge native freetype
cmake_minimum_required(VERSION 3.4.1)
project("FreetypeWrapper")

# 引入freetype的头文件
include_directories(3rdparty/freetype/include)
link_directories(../jniLibs/${ANDROID_ABI}/)

# jni的桥接文件
file(GLOB FT_HEADERS "include/")
file(GLOB FT_SRCS "src/")

add_library(
        ${PROJECT_NAME}
        SHARED
        ${FT_HEADERS}
        ${FT_SRCS}
        freetype_bridge.cpp
)

find_library(
        log-lib
        log
)

# 引入本地所需的动态库或静态库
# 设置变量
# CMAKE_CXX_FLAGS 表示会将 C++ 的参数传给编译器
# CMAKE_C_FLAGS 表示会将 C 参数传给编译器
# 参数设置 : 传递 CMAKE_CXX_FLAGS C+= 参数给编译器时 , 在 该参数后面指定库的路径
#   CMAKE_SOURCE_DIR 指的是当前的文件地址
#   -L 参数指定动态库的查找路径
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -L${CMAKE_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}")
# 引入动态库或静态库
#add_library(add STATIC IMPORTED)
# 设置函数库的导入路径
#set_target_properties(add PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/../jniLibs/armeabi-v7a/libfreetype.a)

target_link_libraries(
        ${PROJECT_NAME}

        ${log-lib}
        libfreetype.a
)