package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.widget.RelativeLayout.LayoutParams;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

final class ai extends AdNetworkView
{
  private static final String bA = ai.class.getSimpleName();
  private static final int bB = AdSize.BANNER.getWidth();
  private static final Map<AdSize, AdSize> bC = Collections.unmodifiableMap(localHashMap);
  private final boolean P;
  private final String bD;
  private final String g;

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put(new AdSize(bB, AdSize.IAB_LEADERBOARD.getHeight()), AdSize.IAB_LEADERBOARD);
    localHashMap.put(new AdSize(bB, AdSize.IAB_BANNER.getHeight()), AdSize.IAB_BANNER);
    localHashMap.put(new AdSize(bB, AdSize.BANNER.getHeight()), AdSize.BANNER);
    localHashMap.put(new AdSize(bB, AdSize.IAB_MRECT.getHeight()), AdSize.IAB_MRECT);
  }

  public ai(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdCreative);
    this.g = paramBundle.getString("com.flurry.admob.MY_AD_UNIT_ID");
    this.bD = paramBundle.getString("com.flurry.admob.MYTEST_AD_DEVICE_ID");
    this.P = paramBundle.getBoolean("com.flurry.admob.test");
    setFocusable(true);
  }

  private static AdSize a(int paramInt)
  {
    Set localSet = bC.keySet();
    AdSize localAdSize = new AdSize(bB, paramInt).findBestSize((AdSize[])localSet.toArray(new AdSize[localSet.size()]));
    return (AdSize)bC.get(localAdSize);
  }

  public final void initLayout(Context paramContext)
  {
    int i = getAdCreative().getWidth();
    int j = getAdCreative().getHeight();
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    int k = (int)(localDisplayMetrics.heightPixels / localDisplayMetrics.density);
    int m = (int)(localDisplayMetrics.widthPixels / localDisplayMetrics.density);
    label75: AdSize localAdSize2;
    if ((i <= 0) || (i > m))
    {
      if ((j > 0) && (j <= k))
        break label379;
      AdSize localAdSize1 = new AdSize(m, k);
      AdSize[] arrayOfAdSize = new AdSize[4];
      arrayOfAdSize[0] = AdSize.IAB_LEADERBOARD;
      arrayOfAdSize[1] = AdSize.IAB_BANNER;
      arrayOfAdSize[2] = AdSize.BANNER;
      arrayOfAdSize[3] = AdSize.IAB_MRECT;
      localAdSize2 = localAdSize1.findBestSize(arrayOfAdSize);
      if ((localAdSize2 == null) && (i == 0) && (j != 0))
        localAdSize2 = a(j);
      if (localAdSize2 != null)
        break label385;
      db.d(bA, "Could not find Admob AdSize that matches {width = " + i + ", height " + j + "}");
    }
    label385: for (AdSize localAdSize3 = a(j); ; localAdSize3 = localAdSize2)
    {
      db.c(bA, "Determined Admob AdSize as " + localAdSize3 + " that best matches {width = " + i + ", height = " + j + "}");
      AdView localAdView = new AdView((Activity)paramContext, localAdSize3, this.g);
      localAdView.setAdListener(new ae(this));
      setGravity(17);
      addView(localAdView, new RelativeLayout.LayoutParams(localAdSize3.getWidthInPixels(paramContext), localAdSize3.getHeightInPixels(paramContext)));
      AdRequest localAdRequest = new AdRequest();
      if (this.P)
      {
        db.c(bA, "Admob AdView set to Test Mode.");
        localAdRequest.addTestDevice(AdRequest.TEST_EMULATOR);
        if (!TextUtils.isEmpty(this.bD))
          localAdRequest.addTestDevice(this.bD);
      }
      localAdView.loadAd(localAdRequest);
      return;
      m = i;
      break;
      label379: k = j;
      break label75;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ai
 * JD-Core Version:    0.6.2
 */