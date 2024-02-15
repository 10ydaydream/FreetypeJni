#include <jni.h>
#include <string>

#ifndef LOG_TAG
#define LOG_TAG "JNI_DEBUG"
#endif

#include <jni.h>
#include <android/log.h>
#include "android_log_util.h"

// JNI桥接层加载

#include <ft2build.h>
#include FT_FREETYPE_H

FT_Library library;

//JNINativeMethod methods[] = {};

//jint JNI_OnLoad(JavaVM *vm, void *reserved) {
//    JNIEnv *env = nullptr;
//    //获取JniEnv
//    if (vm->GetEnv((void **) &env, JNI_VERSION_1_6) != JNI_OK) {
//        return JNI_ERR;
//    }
//
//    // TODO 通过env->RegisterNatives()注册方法映射表JNINativeMethod
//
//    //返回jni 的版本
//    return JNI_VERSION_1_6;
//}

extern "C"
JNIEXPORT void JNICALL
Java_com_daydreaminger_freetype_FreetypeNative_loadFreetype(JNIEnv *env, jclass clazz) {
    long error = FT_Init_FreeType(&library);
    if (error) {
        LOGD(LOG_TAG, "error");
    }
    LOGD(LOG_TAG, "complete.");

    int amajor = 0;
    int aminor = 0;
    int apatch = 0;
    FT_Library_Version(library, &amajor, & aminor,&apatch);
    LOGD(LOG_TAG, ">>> amajor = %d, aminor = %d, apatch = %d", amajor, aminor, apatch);
}