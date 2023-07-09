package com.daydreaminger.freetypejni.widget;

import android.content.Context;
import android.util.AttributeSet;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.widget.AppCompatEditText;

import com.daydreaminger.freetypejni.R;

public class DrawEditText extends AppCompatEditText {
    private static final String TAG = "DrawEditText";

    public DrawEditText(@NonNull Context context) {
        this(context, null);
    }

    public DrawEditText(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public DrawEditText(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    private void init(Context context) {
        int textColor = getResources().getColor(R.color.textColor);
        setTextColor(textColor);
    }
}
