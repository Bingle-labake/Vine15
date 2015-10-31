package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.widget.LinearLayout.LayoutParams;
import com.inmobi.androidsdk.IMAdRequest;
import com.inmobi.androidsdk.IMAdView;

final class an extends AdNetworkView
{
  private static final String d = an.class.getSimpleName();
  private final boolean P;
  private final String g;

  an(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdCreative);
    this.g = paramBundle.getString("com.flurry.inmobi.MY_APP_ID");
    this.P = paramBundle.getBoolean("com.flurry.inmobi.test");
    setFocusable(true);
  }

  public final void initLayout(Context paramContext)
  {
    int i = 320;
    int j = 50;
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    int k = (int)(localDisplayMetrics.heightPixels / localDisplayMetrics.density);
    int m = (int)(localDisplayMetrics.widthPixels / localDisplayMetrics.density);
    int n;
    if ((m >= 728) && (k >= 90))
    {
      Log.d(d, "Determined InMobi AdSize as 728x90");
      n = 11;
    }
    while (n != -1)
    {
      IMAdView localIMAdView = new IMAdView((Activity)paramContext, n, this.g);
      if ((n != 15) || (n == 11))
      {
        i = 728;
        j = 90;
      }
      if (n == 12)
      {
        i = 468;
        j = 60;
      }
      if (n == 10)
      {
        i = 300;
        j = 250;
      }
      if (n == 13)
      {
        i = 120;
        j = 600;
      }
      float f = getResources().getDisplayMetrics().density;
      localIMAdView.setLayoutParams(new LinearLayout.LayoutParams((int)(0.5F + f * i), (int)(0.5F + f * j)));
      localIMAdView.setIMAdListener(new as(this));
      setGravity(17);
      addView(localIMAdView);
      IMAdRequest localIMAdRequest = new IMAdRequest();
      if (this.P)
      {
        Log.d(d, "InMobi AdView set to Test Mode.");
        localIMAdRequest.setTestMode(true);
      }
      localIMAdView.setIMAdRequest(localIMAdRequest);
      localIMAdView.setRefreshInterval(-1);
      localIMAdView.loadNewAd();
      return;
      if ((m >= 468) && (k >= 60))
      {
        Log.d(d, "Determined InMobi AdSize as 468x60");
        n = 12;
      }
      else if ((m >= i) && (k >= j))
      {
        Log.d(d, "Determined InMobi AdSize as 320x50");
        n = 15;
      }
      else if ((m >= 300) && (k >= 250))
      {
        Log.d(d, "Determined InMobi AdSize as 300x250");
        n = 10;
      }
      else if ((m >= 120) && (k >= 600))
      {
        Log.d(d, "Determined InMobi AdSize as 120x600");
        n = 13;
      }
      else
      {
        Log.d(d, "Could not find InMobi AdSize that matches size");
        n = -1;
      }
    }
    Log.d(d, "**********Could not load InMobi Ad");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.an
 * JD-Core Version:    0.6.2
 */