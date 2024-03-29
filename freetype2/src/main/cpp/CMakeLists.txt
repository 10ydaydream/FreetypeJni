# bridge native freetype
cmake_minimum_required(VERSION 3.4.1)
project("FreetypeWrapper")

# 引入freetype的头文件
include_directories(3rdparty/freetype/include)

# cmake文档描述说尽量不要使用link_directories()方法
# link_directories()指令要放在add_library指令之前
# link_directories(../jniLibs/${ANDROID_ABI}/)

# jni的桥接文件
# file语法 GLOB_RECURSE  表示递归遍历获取该目录下所有的文件，包含子目录
# file(GLOB FT_HEADERS "include/")
file(GLOB_RECURSE JNI_ROOT_SRC "include/")
file(GLOB_RECURSE JNI_SDK_SRC "src/")

# 3、Jni层cpp源码
set(JNI_SOURCE_FILE
        ${JNI_ROOT_SRC}
        ${JNI_SDK_SRC}
)

add_library(
        ${PROJECT_NAME}
        SHARED
        android_log_util.h
        ${JNI_SOURCE_FILE}
        freetype_bridge.cpp
)

find_library(
        log-lib
        log
)

### 和上面的link_directories()方法一样，不过这里会指定具体的库名称
# 添加共享库
add_library(freetypeLib STATIC IMPORTED)
# 设置共享库的路径
set_target_properties(freetypeLib PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libfreetype.a)

target_link_libraries(
        ${PROJECT_NAME}

        freetypeLib
        # libfreetype.a # 配合link_directories()方法使用
        ${log-lib}
)