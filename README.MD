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

## 