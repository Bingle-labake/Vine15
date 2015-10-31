package com.flurry.android;

import android.util.Log;
import com.jumptap.adtag.JtAdView;
import com.jumptap.adtag.JtAdViewListener;
import java.util.Collections;

final class aa
  implements JtAdViewListener
{
  aa(e parame)
  {
  }

  public final void onAdError(JtAdView paramJtAdView, int paramInt1, int paramInt2)
  {
    Log.d(e.d(), "Jumptap AdView error.");
    this.ad.onRenderFailed(Collections.emptyMap());
  }

  public final void onFocusChange(JtAdView paramJtAdView, int paramInt, boolean paramBoolean)
  {
    Log.d(e.d(), "Jumptap AdView focus changed.");
  }

  public final void onInterstitialDismissed(JtAdView paramJtAdView, int paramInt)
  {
    this.ad.onAdClosed(Collections.emptyMap());
    Log.d(e.d(), "Jumptap AdView dismissed.");
  }

  public final void onNewAd(JtAdView paramJtAdView, int paramInt, String paramString)
  {
    this.ad.onAdFilled(Collections.emptyMap());
    this.ad.onAdShown(Collections.emptyMap());
    Log.d(e.d(), "Jumptap AdView new ad.");
  }

  public final void onNoAdFound(JtAdView paramJtAdView, int paramInt)
  {
    this.ad.onRenderFailed(Collections.emptyMap());
    Log.d(e.d(), "Jumptap AdView no ad found.");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.aa
 * JD-Core Version:    0.6.2
 */