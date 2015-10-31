package com.flurry.android;

import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;

final class bh
{
  private View dh;
  private int di;
  private BasicWebView.BasicWebViewFullScreenTransitionHandler.BasicWebViewFullScreenTransitionCallback dj;
  private FrameLayout dk;

  private bh(FlurryFullscreenTakeoverActivity paramFlurryFullscreenTakeoverActivity, byte paramByte)
  {
  }

  public final void Z()
  {
    if (this.dh == null)
      return;
    ((ViewGroup)this.h.getWindow().getDecorView()).removeView(this.dk);
    this.dk.removeView(this.dh);
    if (this.dj != null)
      this.dj.onBasicWebViewTransitionFromFullScreenFinished();
    this.h.setRequestedOrientation(this.di);
    this.dj = null;
    this.dk = null;
    this.dh = null;
  }

  public final void a(cl paramcl, View paramView, int paramInt, BasicWebView.BasicWebViewFullScreenTransitionHandler.BasicWebViewFullScreenTransitionCallback paramBasicWebViewFullScreenTransitionCallback)
  {
    if (this.dh != null)
      Z();
    this.dh = paramView;
    this.di = this.h.getRequestedOrientation();
    this.dj = paramBasicWebViewFullScreenTransitionCallback;
    this.dk = new FrameLayout(this.h);
    this.dk.setBackgroundColor(-16777216);
    this.dk.addView(this.dh, new FrameLayout.LayoutParams(-1, -1, 17));
    ((ViewGroup)this.h.getWindow().getDecorView()).addView(this.dk, -1, -1);
    this.h.setRequestedOrientation(paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bh
 * JD-Core Version:    0.6.2
 */