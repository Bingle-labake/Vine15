package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.jumptap.adtag.JtAdView;
import com.jumptap.adtag.JtAdWidgetSettings;
import com.jumptap.adtag.JtAdWidgetSettingsFactory;
import com.jumptap.adtag.utils.JtException;

class e extends AdNetworkView
{
  private static final String d = e.class.getSimpleName();
  private final String g;

  e(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle)
  {
    super(paramContext, paramFlurryAds, paramcz, paramAdCreative);
    this.g = paramBundle.getString("com.flurry.jumptap.PUBLISHER_ID");
    setFocusable(true);
  }

  public void initLayout(Context paramContext)
  {
    JtAdWidgetSettings localJtAdWidgetSettings = JtAdWidgetSettingsFactory.createWidgetSettings();
    localJtAdWidgetSettings.setPublisherId(this.g);
    localJtAdWidgetSettings.setRefreshPeriod(0);
    localJtAdWidgetSettings.setShouldSendLocation(false);
    setGravity(17);
    try
    {
      localJtAdView = new JtAdView((Activity)paramContext, localJtAdWidgetSettings);
      localJtAdView.setAdViewListener(new aa(this));
      addView(localJtAdView);
      return;
    }
    catch (JtException localJtException)
    {
      while (true)
      {
        Log.d(d, "Jumptap JtException when creating ad object.");
        JtAdView localJtAdView = null;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.e
 * JD-Core Version:    0.6.2
 */