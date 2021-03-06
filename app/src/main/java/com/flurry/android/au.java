package com.flurry.android;

import android.util.Log;
import com.mobclix.android.sdk.MobclixFullScreenAdView;
import com.mobclix.android.sdk.MobclixFullScreenAdViewListener;
import java.util.Collections;

final class au
  implements MobclixFullScreenAdViewListener
{
  au(cg paramcg)
  {
  }

  public final String keywords()
  {
    Log.d(cg.d(), "Mobclix keyword callback.");
    return null;
  }

  public final void onDismissAd(MobclixFullScreenAdView paramMobclixFullScreenAdView)
  {
    this.bQ.onAdClosed(Collections.emptyMap());
    Log.d(cg.d(), "Mobclix Interstitial ad dismissed.");
  }

  public final void onFailedLoad(MobclixFullScreenAdView paramMobclixFullScreenAdView, int paramInt)
  {
    this.bQ.onRenderFailed(Collections.emptyMap());
    Log.d(cg.d(), "Mobclix Interstitial ad failed to load.");
  }

  public final void onFinishLoad(MobclixFullScreenAdView paramMobclixFullScreenAdView)
  {
    this.bQ.onAdFilled(Collections.emptyMap());
    Log.d(cg.d(), "Mobclix Interstitial ad successfully loaded.");
  }

  public final void onPresentAd(MobclixFullScreenAdView paramMobclixFullScreenAdView)
  {
    this.bQ.onAdShown(Collections.emptyMap());
    Log.d(cg.d(), "Mobclix Interstitial ad successfully shown.");
  }

  public final String query()
  {
    Log.d(cg.d(), "Mobclix query callback.");
    return null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.au
 * JD-Core Version:    0.6.2
 */