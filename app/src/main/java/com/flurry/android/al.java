package com.flurry.android;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;

final class al extends az
{
  private static final String d = be.class.getSimpleName();

  protected final Bundle a(Context paramContext)
  {
    Bundle localBundle = bp.p(paramContext);
    if (TextUtils.isEmpty(localBundle.getString("com.mobclix.APPLICATION_ID")))
    {
      db.d(d, "The meta-data should include not empty value for com.mobclix.APPLICATION_ID key in AndroidManifest.xml");
      localBundle = null;
    }
    return localBundle;
  }

  protected final ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit, Bundle paramBundle)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null) || (paramBundle == null))
      return null;
    return new cg(paramContext, paramFlurryAds, paramcz, paramAdUnit);
  }

  protected final p a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdCreative == null) || (paramBundle == null))
      return null;
    return new aw(paramContext, paramFlurryAds, paramcz, paramAdCreative);
  }

  protected final av b()
  {
    return new av("mobclix", "3.2.0", "com.mobclix.android.sdk.MobclixFullScreenAdView");
  }

  protected final av c()
  {
    return new av("mobclix", "3.2.0", "com.mobclix.android.sdk.MobclixAdView");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.al
 * JD-Core Version:    0.6.2
 */