package com.flurry.android;

import android.content.Context;
import android.widget.RelativeLayout;
import java.util.List;
import java.util.Map;

abstract class p extends RelativeLayout
{
  private Context J;
  FlurryAds K;
  cz L;
  AdUnit M;
  int N;

  p(Context paramContext, FlurryAds paramFlurryAds, cz paramcz)
  {
    super(paramContext);
    this.J = paramContext;
    this.K = paramFlurryAds;
    this.L = paramcz;
  }

  final void a(String paramString, Map<String, String> paramMap)
  {
    new StringBuilder().append("AppSpotBannerView.onEvent ").append(paramString).toString();
    this.K.a(this.L, paramString, true, paramMap);
    if (this.M != null)
      this.K.onEvent(new cw(paramString, paramMap, this.J, this.M, this.L, this.N), this.K, 0);
  }

  public abstract void initLayout(Context paramContext);

  boolean shouldRotate()
  {
    return !((AdFrame)this.M.getAdFrames().get(this.N)).getAdSpaceLayout().getFormat().toString().equals("takeover");
  }

  public void stop()
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.p
 * JD-Core Version:    0.6.2
 */