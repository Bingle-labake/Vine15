package com.flurry.android;

import android.util.Log;
import com.mobclix.android.sdk.MobclixAdView;
import com.mobclix.android.sdk.MobclixAdViewListener;
import java.util.Collections;

final class bj
  implements MobclixAdViewListener
{
  bj(aw paramaw)
  {
  }

  public final String keywords()
  {
    Log.d(aw.d(), "Mobclix keyword callback.");
    return null;
  }

  public final void onAdClick(MobclixAdView paramMobclixAdView)
  {
    this.dn.onAdClicked(Collections.emptyMap());
    Log.d(aw.d(), "Mobclix AdView ad clicked.");
  }

  public final void onCustomAdTouchThrough(MobclixAdView paramMobclixAdView, String paramString)
  {
    this.dn.onAdClicked(Collections.emptyMap());
    Log.d(aw.d(), "Mobclix AdView custom ad clicked.");
  }

  public final void onFailedLoad(MobclixAdView paramMobclixAdView, int paramInt)
  {
    this.dn.onRenderFailed(Collections.emptyMap());
    Log.d(aw.d(), "Mobclix AdView ad failed to load.");
  }

  public final boolean onOpenAllocationLoad(MobclixAdView paramMobclixAdView, int paramInt)
  {
    Log.d(aw.d(), "Mobclix AdView loaded an open allocation ad.");
    return true;
  }

  public final void onSuccessfulLoad(MobclixAdView paramMobclixAdView)
  {
    this.dn.onAdFilled(Collections.emptyMap());
    this.dn.onAdShown(Collections.emptyMap());
    Log.d(aw.d(), "Mobclix AdView ad successfully loaded.");
  }

  public final String query()
  {
    Log.d(aw.d(), "Mobclix query callback.");
    return null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bj
 * JD-Core Version:    0.6.2
 */