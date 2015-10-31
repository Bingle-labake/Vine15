package com.flurry.android;

import android.content.Context;
import android.util.Log;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

final class j
  implements k
{
  private static String d = j.class.getSimpleName();
  private static final Map<String, k> v = Collections.unmodifiableMap(localHashMap);

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("FLURRY", new t());
    localHashMap.put("THIRD_PARTY", new z());
  }

  public final p b(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null))
      return null;
    List localList;
    String str;
    if (paramAdUnit != null)
    {
      localList = paramAdUnit.getAdFrames();
      if ((localList == null) || (localList.isEmpty()))
        str = null;
    }
    while (str == null)
    {
      return null;
      AdFrame localAdFrame = (AdFrame)localList.get(0);
      if (localAdFrame != null)
      {
        int i = localAdFrame.getBinding().intValue();
        if ((paramAdUnit.getCombinable().intValue() == 1) || (i == 2) || (i == 1) || (i == 3))
          str = "FLURRY";
        else if (i == 4)
          str = "THIRD_PARTY";
      }
      else
      {
        str = null;
      }
    }
    k localk = (k)v.get(str);
    if (localk == null)
    {
      Log.w(d, "Cannot create ad banner for type: " + str);
      return null;
    }
    new StringBuilder().append("Creating ad banner for type: ").append(str).toString();
    return localk.b(paramContext, paramFlurryAds, paramcz, paramAdUnit);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.j
 * JD-Core Version:    0.6.2
 */