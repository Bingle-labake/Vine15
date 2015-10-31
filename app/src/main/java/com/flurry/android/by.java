package com.flurry.android;

import android.webkit.WebChromeClient.CustomViewCallback;

final class by
  implements BasicWebView.BasicWebViewFullScreenTransitionHandler.BasicWebViewFullScreenTransitionCallback
{
  private WebChromeClient.CustomViewCallback em;

  public by(WebChromeClient.CustomViewCallback paramCustomViewCallback)
  {
    this.em = paramCustomViewCallback;
  }

  public final void onBasicWebViewTransitionFromFullScreenFinished()
  {
    if (this.em != null)
      this.em.onCustomViewHidden();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.by
 * JD-Core Version:    0.6.2
 */