package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.jumptap.adtag.JtAdInterstitial;
import com.jumptap.adtag.JtAdWidgetSettings;
import com.jumptap.adtag.JtAdWidgetSettingsFactory;
import com.jumptap.adtag.utils.JtException;

final class bo extends m
{
  private static final String d = bo.class.getSimpleName();
  private final String g;

  public bo(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit, Bundle paramBundle)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdUnit);
    this.g = paramBundle.getString("com.flurry.jumptap.PUBLISHER_ID");
  }

  public final void f()
  {
    JtAdWidgetSettings localJtAdWidgetSettings = JtAdWidgetSettingsFactory.createWidgetSettings();
    localJtAdWidgetSettings.setPublisherId(this.g);
    localJtAdWidgetSettings.setRefreshPeriod(0);
    localJtAdWidgetSettings.setShouldSendLocation(false);
    try
    {
      JtAdInterstitial localJtAdInterstitial1 = new JtAdInterstitial((Activity)getContext(), localJtAdWidgetSettings);
      localJtAdInterstitial2 = localJtAdInterstitial1;
      localJtAdInterstitial2.setAdViewListener(new ah(this));
      localJtAdInterstitial2.showAsPopup();
      return;
    }
    catch (JtException localJtException)
    {
      while (true)
      {
        Log.d(d, "Jumptap JtException when creating ad object.");
        JtAdInterstitial localJtAdInterstitial2 = null;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bo
 * JD-Core Version:    0.6.2
 */