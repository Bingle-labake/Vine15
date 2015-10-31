package com.flurry.android;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;

class da extends az
{
  private static final String d = da.class.getSimpleName();

  protected final Bundle a(Context paramContext)
  {
    Bundle localBundle = bp.p(paramContext);
    if (TextUtils.isEmpty(localBundle.getString("com.flurry.admob.MY_AD_UNIT_ID")))
    {
      db.d(d, "The meta-data should include not empty value for com.flurry.admob.MY_AD_UNIT_ID key in AndroidManifest.xml");
      localBundle = null;
    }
    return localBundle;
  }

  protected final ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit, Bundle paramBundle)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null) || (paramBundle == null))
      return null;
    return new ak(paramContext, paramFlurryAds, paramcz, paramAdUnit, paramBundle);
  }

  protected final p a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdCreative == null) || (paramBundle == null))
      return null;
    return new ai(paramContext, paramFlurryAds, paramcz, paramAdCreative, paramBundle);
  }

  protected final av b()
  {
    return new av("GoogleAdMobAdsSdk", "6.2.1", "com.google.ads.InterstitialAd");
  }

  protected final av c()
  {
    return new av("GoogleAdMobAdsSdk", "6.2.1", "com.google.ads.AdView");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.da
 * JD-Core Version:    0.6.2
 */