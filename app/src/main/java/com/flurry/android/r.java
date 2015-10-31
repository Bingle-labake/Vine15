package com.flurry.android;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.view.MotionEvent;

final class r extends Dialog
{
  r(cs paramcs, Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
  }

  public final boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    Activity localActivity = bn.k(this.I.dW);
    boolean bool = false;
    if (localActivity != null)
      bool = bn.k(this.I.dW).dispatchTouchEvent(paramMotionEvent);
    return bool;
  }

  public final boolean dispatchTrackballEvent(MotionEvent paramMotionEvent)
  {
    Activity localActivity = bn.k(this.I.dW);
    boolean bool = false;
    if (localActivity != null)
      bool = bn.k(this.I.dW).dispatchTrackballEvent(paramMotionEvent);
    return bool;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.r
 * JD-Core Version:    0.6.2
 */