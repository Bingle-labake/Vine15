package com.flurry.android;

import android.util.Log;
import com.inmobi.androidsdk.IMAdListener;
import com.inmobi.androidsdk.IMAdRequest.ErrorCode;
import com.inmobi.androidsdk.IMAdView;
import java.util.Collections;

final class as
  implements IMAdListener
{
  as(an paraman)
  {
  }

  public final void onAdRequestCompleted(IMAdView paramIMAdView)
  {
    this.bM.onAdFilled(Collections.emptyMap());
    this.bM.onAdShown(Collections.emptyMap());
    Log.d(an.d(), "InMobi imAdView ad request completed.");
  }

  public final void onAdRequestFailed(IMAdView paramIMAdView, IMAdRequest.ErrorCode paramErrorCode)
  {
    this.bM.onRenderFailed(Collections.emptyMap());
    Log.d(an.d(), "InMobi imAdView ad request failed.");
  }

  public final void onDismissAdScreen(IMAdView paramIMAdView)
  {
    this.bM.onAdClosed(Collections.emptyMap());
    Log.d(an.d(), "InMobi imAdView dismiss ad.");
  }

  public final void onLeaveApplication(IMAdView paramIMAdView)
  {
    Log.d(an.d(), "InMobi onLeaveApplication");
  }

  public final void onShowAdScreen(IMAdView paramIMAdView)
  {
    this.bM.onAdClicked(Collections.emptyMap());
    Log.d(an.d(), "InMobi imAdView ad shown.");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.as
 * JD-Core Version:    0.6.2
 */