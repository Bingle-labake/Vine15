package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsoluteLayout;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

final class at extends bf
{
  private static final Map<Class<? extends ViewGroup>, ck> bO = Collections.unmodifiableMap(localHashMap);
  private static final String d = at.class.getSimpleName();
  private final p bP;

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put(LinearLayout.class, new cf());
    localHashMap.put(AbsoluteLayout.class, new bl());
    localHashMap.put(FrameLayout.class, new ap());
    localHashMap.put(RelativeLayout.class, new ad());
  }

  public at(p paramp, AdUnit paramAdUnit)
  {
    super(paramAdUnit);
    this.bP = paramp;
  }

  public final void a(Context paramContext, ViewGroup paramViewGroup)
  {
    new StringBuilder().append("render(").append(paramContext).append(", ").append(paramViewGroup).append(")").toString();
    if ((this.bP == null) || (paramContext == null) || (paramViewGroup == null))
    {
      new StringBuilder().append("failed to render banner ad for bannerView = ").append(this.bP).append(" for context = ").append(paramContext).append(" for viewGroup = ").append(paramViewGroup).toString();
      return;
    }
    FlurryAds localFlurryAds = FlurryAds.getInstance();
    ac localac = localFlurryAds.cL.a(localFlurryAds, paramContext, paramViewGroup, Y());
    if (localac == null)
    {
      new StringBuilder().append("failed to render banner ad for holder = ").append(localac).append(" for adSpaceName = ").append(Y()).toString();
      return;
    }
    ViewGroup localViewGroup1 = (ViewGroup)localac.getParent();
    if (localViewGroup1 != null)
      localViewGroup1.removeView(localac);
    localac.stop();
    localac.removeAllViews();
    ViewGroup localViewGroup2 = (ViewGroup)this.bP.getParent();
    if (localViewGroup2 != null)
      localViewGroup2.removeView(this.bP);
    localac.addView(this.bP, new RelativeLayout.LayoutParams(-1, -1));
    this.bP.initLayout(paramContext);
    ViewGroup.LayoutParams localLayoutParams;
    int i;
    int j;
    if ((E() == null) || (E().getAdFrames().size() < 1))
    {
      localLayoutParams = null;
      if (localLayoutParams != null)
      {
        localac.setLayoutParams(localLayoutParams);
        new StringBuilder().append("banner ad holder layout params = ").append(localLayoutParams.getClass().getName()).append(" {width = ").append(localLayoutParams.width).append(", height = ").append(localLayoutParams.height).append("} for banner ad with adSpaceName = ").append(Y()).toString();
      }
      i = paramViewGroup.getChildCount();
      if ((E() != null) && (E().getAdFrames().size() >= 1))
        break label512;
      j = i;
    }
    while (true)
    {
      paramViewGroup.addView(localac, j);
      return;
      AdSpaceLayout localAdSpaceLayout2 = ((AdFrame)E().getAdFrames().get(0)).getAdSpaceLayout();
      if (localAdSpaceLayout2 == null)
      {
        localLayoutParams = null;
        break;
      }
      ck localck = (ck)bO.get(paramViewGroup.getClass());
      if (localck == null)
      {
        new StringBuilder().append("Ad space layout and alignment from the server is being ignored for ViewGroup subclass ").append(paramViewGroup.getClass().getSimpleName()).toString();
        localLayoutParams = null;
        break;
      }
      localLayoutParams = localck.a(paramContext, localAdSpaceLayout2);
      if (localLayoutParams != null)
        break;
      new StringBuilder().append("Ad space layout and alignment from the server is being ignored for ViewGroup subclass ").append(paramViewGroup.getClass().getSimpleName()).toString();
      break;
      label512: AdSpaceLayout localAdSpaceLayout1 = ((AdFrame)E().getAdFrames().get(0)).getAdSpaceLayout();
      if (localAdSpaceLayout1 != null)
      {
        String[] arrayOfString = localAdSpaceLayout1.getAlignment().toString().split("-");
        if ((arrayOfString.length == 2) && ("t".equals(arrayOfString[0])))
          j = 0;
      }
      else
      {
        j = i;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.at
 * JD-Core Version:    0.6.2
 */