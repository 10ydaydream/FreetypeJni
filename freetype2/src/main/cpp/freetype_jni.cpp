#include <jni.h>
#include <string>



//JNINativeMethod methods[] = {};

jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    JNIEnv *env = nullptr;
    //获取JniEnv
    if (vm->GetEnv((void **) &env, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    // TODO 通过env->RegisterNatives()注册方法映射表JNINativeMethod

    //返回jni 的版本
    return JNI_VERSION_1_6;
}