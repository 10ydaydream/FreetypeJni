package com.daydreaminger.freetype;

public class FreetypeNative {
    private static final String TAG = "FreetypeNative";

    public static final String LIBRARY_NAME = "FreetypeWrapper";

    static  {
        System.loadLibrary(LIBRARY_NAME);
    }

    public native static void loadFreetype();

}
