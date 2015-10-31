package com.flurry.android;

import android.util.Log;
import com.inmobi.androidsdk.IMAdInterstitial;
import com.inmobi.androidsdk.IMAdInterstitial.State;
import com.inmobi.androidsdk.IMAdInterstitialListener;
import com.inmobi.androidsdk.IMAdRequest.ErrorCode;
import java.util.Collections;

final class ca
  implements IMAdInterstitialListener
{
  ca(u paramu)
  {
  }

  public final void onAdRequestFailed(IMAdInterstitial paramIMAdInterstitial, IMAdRequest.ErrorCode paramErrorCode)
  {
    this.en.onRenderFailed(Collections.emptyMap());
    Log.d(u.d(), "InMobi imAdView ad request failed.");
  }

  public final void onAdRequestLoaded(IMAdInterstitial paramIMAdInterstitial)
  {
    this.en.onAdFilled(Collections.emptyMap());
    Log.d(u.d(), "InMobi Interstitial ad request completed.");
    if (IMAdInterstitial.State.READY.equals(paramIMAdInterstitial.getState()))
    {
      this.en.onAdShown(Collections.emptyMap());
      paramIMAdInterstitial.show();
    }
  }

  public final void onDismissAdScreen(IMAdInterstitial paramIMAdInterstitial)
  {
    this.en.onAdClosed(Collections.emptyMap());
    Log.d(u.d(), "InMobi Interstitial ad dismissed.");
  }

  public final void onLeaveApplication(IMAdInterstitial paramIMAdInterstitial)
  {
    Log.d(u.d(), "InMobi onLeaveApplication");
  }

  public final void onShowAdScreen(IMAdInterstitial paramIMAdInterstitial)
  {
    Log.d(u.d(), "InMobi Interstitial ad shown.");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ca
 * JD-Core Version:    0.6.2
 */