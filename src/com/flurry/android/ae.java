package com.flurry.android;

import com.google.ads.Ad;
import com.google.ads.AdListener;
import com.google.ads.AdRequest.ErrorCode;
import java.util.Collections;

final class ae
  implements AdListener
{
  private ae(ai paramai, byte paramByte)
  {
  }

  public final void onDismissScreen(Ad paramAd)
  {
    this.au.onAdClosed(Collections.emptyMap());
    db.e(ai.z(), "Admob AdView dismissed from screen.");
  }

  public final void onFailedToReceiveAd(Ad paramAd, AdRequest.ErrorCode paramErrorCode)
  {
    this.au.onRenderFailed(Collections.emptyMap());
    db.g(ai.z(), "Admob AdView failed to receive ad.");
  }

  public final void onLeaveApplication(Ad paramAd)
  {
    this.au.onAdClicked(Collections.emptyMap());
    db.e(ai.z(), "Admob AdView leave application.");
  }

  public final void onPresentScreen(Ad paramAd)
  {
    db.e(ai.z(), "Admob AdView present on screen.");
  }

  public final void onReceiveAd(Ad paramAd)
  {
    this.au.onAdFilled(Collections.emptyMap());
    this.au.onAdShown(Collections.emptyMap());
    db.e(ai.z(), "Admob AdView received ad.");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ae
 * JD-Core Version:    0.6.2
 */