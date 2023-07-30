package com.daydreaminger.freetype;

public class FreetypeNative {
    private static final String TAG = "FreetypeNative";

    public static final String LIBRARY_NAME = "freetypeJni";

    static  {
        System.loadLibrary(LIBRARY_NAME);
    }
}
