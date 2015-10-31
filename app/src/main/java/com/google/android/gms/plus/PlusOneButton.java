package com.google.android.gms.plus;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.internal.dz;
import com.google.android.gms.internal.x;

public final class PlusOneButton extends ViewGroup
{
  public static final int ANNOTATION_BUBBLE = 1;
  public static final int ANNOTATION_INLINE = 2;
  public static final int ANNOTATION_NONE = 0;
  public static final int SIZE_MEDIUM = 1;
  public static final int SIZE_SMALL = 0;
  public static final int SIZE_STANDARD = 3;
  public static final int SIZE_TALL = 2;
  private final dz gQ;

  public PlusOneButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public PlusOneButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.gQ = new dz(paramContext, paramAttributeSet);
    addView(this.gQ);
    if (isInEditMode())
      return;
    setOnPlusOneClickListener(null);
  }

  public void initialize(PlusClient paramPlusClient, String paramString, int paramInt)
  {
    x.a(getContext() instanceof Activity, "To use this method, the PlusOneButton must be placed in an Activity. Use initialize(PlusClient, String, OnPlusOneClickListener).");
    this.gQ.initialize(paramPlusClient, paramString, paramInt);
  }

  public void initialize(PlusClient paramPlusClient, String paramString, OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    this.gQ.initialize(paramPlusClient, paramString, 0);
    this.gQ.setOnPlusOneClickListener(paramOnPlusOneClickListener);
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.gQ.layout(0, 0, paramInt3 - paramInt1, paramInt4 - paramInt2);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    dz localdz = this.gQ;
    measureChild(localdz, paramInt1, paramInt2);
    setMeasuredDimension(localdz.getMeasuredWidth(), localdz.getMeasuredHeight());
  }

  public void setAnnotation(int paramInt)
  {
    this.gQ.setAnnotation(paramInt);
  }

  public void setOnPlusOneClickListener(OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    this.gQ.setOnPlusOneClickListener(paramOnPlusOneClickListener);
  }

  public void setSize(int paramInt)
  {
    this.gQ.setSize(paramInt);
  }

  public static abstract interface OnPlusOneClickListener
  {
    public abstract void onPlusOneClick(Intent paramIntent);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.PlusOneButton
 * JD-Core Version:    0.6.2
 */