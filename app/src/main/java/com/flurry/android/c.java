package com.flurry.android;

import android.graphics.Bitmap;
import android.webkit.WebView;
import android.webkit.WebViewClient;

final class c extends WebViewClient
{
  private c(cl paramcl, byte paramByte)
  {
  }

  public final void onPageFinished(WebView paramWebView, String paramString)
  {
    new StringBuilder().append("onPageFinished: url = ").append(paramString).toString();
    if ((paramString == null) || (paramWebView == null) || (paramWebView != cl.a(this.e)))
      return;
    cl.a(this.e, false);
  }

  public final void onPageStarted(WebView paramWebView, String paramString, Bitmap paramBitmap)
  {
    new StringBuilder().append("onPageStarted: url = ").append(paramString).toString();
    if ((paramString == null) || (paramWebView == null) || (paramWebView != cl.a(this.e)))
      return;
    if (cl.c(this.e))
    {
      f localf = cl.b(this.e);
      boolean bool = false;
      if (localf != null)
        bool = cl.b(this.e).a(paramString, cl.c(this.e));
      if (bool)
        paramWebView.stopLoading();
    }
    cl.a(this.e, true);
  }

  public final boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    new StringBuilder().append("shouldOverrideUrlLoading: url = ").append(paramString).toString();
    if ((paramString == null) || (paramWebView == null) || (paramWebView != cl.a(this.e)))
      return false;
    if (cl.b(this.e) != null);
    for (boolean bool = cl.b(this.e).a(paramString, cl.c(this.e)); ; bool = false)
    {
      cl.a(this.e, false);
      return bool;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.c
 * JD-Core Version:    0.6.2
 */