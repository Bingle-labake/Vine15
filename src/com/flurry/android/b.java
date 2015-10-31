package com.flurry.android;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;

final class b extends az
{
  private static final String d = b.class.getSimpleName();

  protected final Bundle a(Context paramContext)
  {
    Bundle localBundle = bp.p(paramContext);
    if (TextUtils.isEmpty(localBundle.getString("com.flurry.inmobi.MY_APP_ID")))
    {
      db.d(d, "The meta-data should include not empty value for com.flurry.inmobi.MY_APP_ID key in AndroidManifest.xml");
      localBundle = null;
    }
    return localBundle;
  }

  protected final ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit, Bundle paramBundle)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null) || (paramBundle == null))
      return null;
    return new u(paramContext, paramFlurryAds, paramcz, paramAdUnit, paramBundle);
  }

  protected final p a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdCreative == null) || (paramBundle == null))
      return null;
    return new an(paramContext, paramFlurryAds, paramcz, paramAdCreative, paramBundle);
  }

  protected final av b()
  {
    return new av("InMobiAndroidSDK", "3.5.0", "com.inmobi.androidsdk.IMAdInterstitial");
  }

  protected final av c()
  {
    return new av("InMobiAndroidSDK", "3.5.0", "com.inmobi.androidsdk.IMAdView");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.b
 * JD-Core Version:    0.6.2
 */