package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout.LayoutParams;
import com.mobclix.android.sdk.MobclixAdView;
import com.mobclix.android.sdk.MobclixIABRectangleMAdView;
import com.mobclix.android.sdk.MobclixMMABannerXLAdView;

class aw extends AdNetworkView
{
  private static final String d = aw.class.getSimpleName();

  aw(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdCreative);
    setFocusable(true);
  }

  public void initLayout(Context paramContext)
  {
    int i = 320;
    int j = getAdCreative().getHeight();
    int k = getAdCreative().getWidth();
    Object localObject;
    if ((k >= i) && (j >= 50))
    {
      Log.d(d, "Determined Mobclix AdSize as BANNER");
      localObject = new MobclixMMABannerXLAdView((Activity)paramContext);
      ((MobclixAdView)localObject).addMobclixAdViewListener(new bj(this));
      if (((localObject instanceof MobclixMMABannerXLAdView)) && (!(localObject instanceof MobclixIABRectangleMAdView)))
        break label209;
    }
    for (int m = 250; ; m = 50)
    {
      float f = getResources().getDisplayMetrics().density;
      ((MobclixAdView)localObject).setLayoutParams(new LinearLayout.LayoutParams((int)(0.5F + f * i), (int)(0.5F + f * m)));
      setGravity(17);
      addView((View)localObject);
      ((MobclixAdView)localObject).setRefreshTime(-1L);
      return;
      if ((k >= 300) && (j >= 250))
      {
        Log.d(d, "Determined Mobclix AdSize as IAB_RECT");
        localObject = new MobclixIABRectangleMAdView((Activity)paramContext);
        break;
      }
      Log.d(d, "Could not find Mobclix AdSize that matches size");
      localObject = null;
      break;
      label209: i = 300;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.aw
 * JD-Core Version:    0.6.2
 */