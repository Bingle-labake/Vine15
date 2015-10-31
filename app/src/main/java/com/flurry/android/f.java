package com.flurry.android;

import android.widget.VideoView;

final class f
{
  private f(FlurryFullscreenTakeoverActivity paramFlurryFullscreenTakeoverActivity, byte paramByte)
  {
  }

  public final boolean a(String paramString, boolean paramBoolean)
  {
    if (FlurryFullscreenTakeoverActivity.c(paramString))
    {
      FlurryFullscreenTakeoverActivity.a(this.h, new VideoView(this.h));
      FlurryFullscreenTakeoverActivity.a(this.h).setFocusable(true);
      FlurryFullscreenTakeoverActivity.a(this.h).setFocusableInTouchMode(true);
      FlurryFullscreenTakeoverActivity.a(this.h, paramBoolean);
      FlurryFullscreenTakeoverActivity.a(this.h, paramString);
      return true;
    }
    return false;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.f
 * JD-Core Version:    0.6.2
 */