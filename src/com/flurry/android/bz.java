package com.flurry.android;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.Collections;
import java.util.List;
import java.util.Map;

final class bz extends WebViewClient
{
  private bz(bn parambn, byte paramByte)
  {
  }

  public final void onLoadResource(WebView paramWebView, String paramString)
  {
    new StringBuilder().append("onLoadResource: url = ").append(paramString).toString();
    super.onLoadResource(paramWebView, paramString);
    if ((paramString == null) || (paramWebView == null) || (paramWebView != bn.b(this.dW)));
    do
    {
      String str;
      do
      {
        do
        {
          return;
          if (!paramString.equalsIgnoreCase(bn.b(this.dW).getUrl()))
            bn.c(this.dW);
        }
        while (bn.d(this.dW));
        str = Uri.parse(paramString).getLastPathSegment();
      }
      while ((str == null) || (!str.equalsIgnoreCase("mraid.js")));
      bn.a(this.dW, true);
    }
    while (!bn.e(this.dW));
    bn.f(this.dW);
  }

  public final void onPageFinished(WebView paramWebView, String paramString)
  {
    new StringBuilder().append("onPageFinished: url = ").append(paramString).toString();
    if ((paramString == null) || (paramWebView == null) || (paramWebView != bn.b(this.dW)));
    do
    {
      return;
      bn.c(this.dW);
      bn.h(this.dW);
      if ((!this.dW.a(bn.b(this.dW))) && ((this.dW.ad() == 2) || (this.dW.ad() == 1)))
        this.dW.addView(bn.b(this.dW));
      bn.b(this.dW, true);
    }
    while (!bn.d(this.dW));
    bn.f(this.dW);
  }

  public final void onPageStarted(WebView paramWebView, String paramString, Bitmap paramBitmap)
  {
    new StringBuilder().append("onPageStarted: url = ").append(paramString).toString();
    if ((paramString == null) || (paramWebView == null) || (paramWebView != bn.b(this.dW)))
      return;
    bn.g(this.dW);
    bn.b(this.dW, false);
    bn.a(this.dW, false);
  }

  public final void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
  {
    this.dW.a("renderFailed", Collections.emptyMap(), this.dW.M, this.dW.L, this.dW.N, 0);
  }

  public final boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    new StringBuilder().append("shouldOverrideUrlLoading: url = ").append(paramString).toString();
    if ((paramString == null) || (paramWebView == null) || (paramWebView != bn.b(this.dW)))
      return false;
    Uri localUri = Uri.parse(paramString);
    if ((localUri.getScheme() != null) && (localUri.getScheme().equals("flurry")))
    {
      String str2 = localUri.getQueryParameter("event");
      Map localMap;
      if (str2 != null)
      {
        bn.i(this.dW).add(str2);
        localMap = bd.t(localUri.getEncodedQuery());
        if (!localMap.containsKey("guid"))
          break label190;
        AdUnit localAdUnit = bn.a(this.dW, (String)localMap.get("guid"));
        cz localcz = bn.b(this.dW, (String)localMap.get("guid"));
        if ((localAdUnit != null) && (localcz != null))
          this.dW.a(str2, localMap, localAdUnit, localcz, 0, 0);
      }
      while (true)
      {
        return true;
        label190: this.dW.a(str2, localMap, this.dW.M, this.dW.L, this.dW.N, 0);
      }
    }
    this.dW.a("clicked", Collections.emptyMap());
    if (this.dW.ag())
      return false;
    String str1 = this.dW.M.getAdSpace().toString();
    Intent localIntent = new Intent(bn.j(this.dW), FlurryFullscreenTakeoverActivity.class);
    localIntent.putExtra("url", paramString);
    if (!this.dW.K.a(bn.j(this.dW), localIntent, str1))
    {
      db.d(bn.a(this.dW), "Unable to launch FlurryFullscreenTakeoverActivity, falling back to browser. Fix by declaring this Activity in your AndroidManifest.xml");
      this.dW.K.b(bn.j(this.dW), paramString, str1);
    }
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bz
 * JD-Core Version:    0.6.2
 */