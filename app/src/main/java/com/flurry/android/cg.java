package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import com.mobclix.android.sdk.MobclixFullScreenAdView;

final class cg extends m
{
  private static final String d = cg.class.getSimpleName();

  public cg(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdUnit);
  }

  public final void f()
  {
    MobclixFullScreenAdView localMobclixFullScreenAdView = new MobclixFullScreenAdView((Activity)getContext());
    localMobclixFullScreenAdView.addMobclixAdViewListener(new au(this));
    localMobclixFullScreenAdView.requestAndDisplayAd();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.cg
 * JD-Core Version:    0.6.2
 */