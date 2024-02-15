//
// Created by daydreaminger on 2024/2/15.
//


#ifndef ANDROID_LOG_UTIL
#define ANDROID_LOG_UTIL
#include<android/log.h>
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, __VA_ARGS__) // 定义LOGD类型
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, __VA_ARGS__) // 定义LOGI类型
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN, __VA_ARGS__) // 定义LOGW类型
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, __VA_ARGS__) // 定义LOGE类型
#define LOGF(...) __android_log_print(ANDROID_LOG_FATAL, __VA_ARGS__) // 定义LOGF类型
#endif
