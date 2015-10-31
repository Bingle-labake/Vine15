package com.flurry.android;

import android.util.Log;
import com.jumptap.adtag.JtAdView;
import com.jumptap.adtag.JtAdViewListener;
import java.util.Collections;

final class ah
  implements JtAdViewListener
{
  ah(bo parambo)
  {
  }

  public final void onAdError(JtAdView paramJtAdView, int paramInt1, int paramInt2)
  {
    Log.d(bo.d(), "Jumptap Interstitial error.");
  }

  public final void onFocusChange(JtAdView paramJtAdView, int paramInt, boolean paramBoolean)
  {
    Log.d(bo.d(), "Jumptap Interstitial focus changed.");
  }

  public final void onInterstitialDismissed(JtAdView paramJtAdView, int paramInt)
  {
    this.bz.onAdClosed(Collections.emptyMap());
    Log.d(bo.d(), "Jumptap Interstitial dismissed.");
  }

  public final void onNewAd(JtAdView paramJtAdView, int paramInt, String paramString)
  {
    this.bz.onAdFilled(Collections.emptyMap());
    this.bz.onAdShown(Collections.emptyMap());
    Log.d(bo.d(), "Jumptap Interstitial new ad.");
  }

  public final void onNoAdFound(JtAdView paramJtAdView, int paramInt)
  {
    this.bz.onRenderFailed(Collections.emptyMap());
    Log.d(bo.d(), "Jumptap Interstitial no ad found.");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ah
 * JD-Core Version:    0.6.2
 */