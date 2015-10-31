package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout.LayoutParams;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

final class ad extends ck
{
  private static final Map<String, Integer> at = Collections.unmodifiableMap(localHashMap);

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("b", Integer.valueOf(12));
    localHashMap.put("t", Integer.valueOf(10));
    localHashMap.put("m", Integer.valueOf(15));
    localHashMap.put("c", Integer.valueOf(14));
    localHashMap.put("l", Integer.valueOf(9));
    localHashMap.put("r", Integer.valueOf(11));
  }

  private static Integer d(String paramString)
  {
    return (Integer)at.get(paramString);
  }

  public final ViewGroup.LayoutParams a(Context paramContext, AdSpaceLayout paramAdSpaceLayout)
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(b(paramContext, paramAdSpaceLayout), c(paramContext, paramAdSpaceLayout));
    String[] arrayOfString = paramAdSpaceLayout.getAlignment().toString().split("-");
    if (arrayOfString.length == 2)
    {
      Integer localInteger1 = d(arrayOfString[0]);
      if (localInteger1 != null)
        localLayoutParams.addRule(localInteger1.intValue());
      Integer localInteger2 = d(arrayOfString[1]);
      if (localInteger2 != null)
        localLayoutParams.addRule(localInteger2.intValue());
    }
    return localLayoutParams;
  }

  public final int l()
  {
    return -1;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ad
 * JD-Core Version:    0.6.2
 */