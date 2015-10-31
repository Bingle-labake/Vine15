package com.flurry.android;

import android.content.Context;
import android.content.Intent;

final class aq extends ao
{
  public aq(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdUnit);
  }

  public final void f()
  {
    Intent localIntent = new Intent(getContext(), FlurryFullscreenTakeoverActivity.class);
    if (!C().a(getContext(), localIntent, E().getAdSpace().toString()))
      db.d(d, "Unable to launch FlurryFullscreenTakeoverActivity. Fix by declaring this Activity in your AndroidManifest.xml");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.aq
 * JD-Core Version:    0.6.2
 */