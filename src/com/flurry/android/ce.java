package com.flurry.android;

import android.content.Context;
import android.widget.VideoView;

final class ce extends VideoView
{
  public ce(Context paramContext)
  {
    super(paramContext);
    setFocusable(true);
    setFocusableInTouchMode(true);
  }

  public final void seekTo(int paramInt)
  {
    if (paramInt < getCurrentPosition())
      super.seekTo(paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ce
 * JD-Core Version:    0.6.2
 */