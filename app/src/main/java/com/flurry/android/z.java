package com.flurry.android;

import android.content.Context;
import android.text.TextUtils;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

final class z
  implements k
{
  private static final Map<String, k> ac = Collections.unmodifiableMap(localHashMap);
  private static final String d = z.class.getSimpleName();

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("Admob".toUpperCase(Locale.US), new da());
    localHashMap.put("Millennial Media".toUpperCase(Locale.US), new cd());
    localHashMap.put("InMobi".toUpperCase(Locale.US), new b());
    localHashMap.put("Mobclix".toUpperCase(Locale.US), new al());
    localHashMap.put("Jumptap".toUpperCase(Locale.US), new be());
  }

  public final p b(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    p localp;
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null))
      localp = null;
    do
    {
      return localp;
      List localList = paramAdUnit.getAdFrames();
      if ((localList == null) || (localList.isEmpty()))
        return null;
      AdFrame localAdFrame = (AdFrame)localList.get(0);
      if (localAdFrame == null)
        return null;
      String str1 = localAdFrame.getContent().toString();
      if (TextUtils.isEmpty(str1))
        return null;
      String str2 = str1.toUpperCase(Locale.US);
      k localk = (k)ac.get(str2);
      if (localk == null)
      {
        db.g(d, "Cannot create ad network view for type: " + str1);
        return null;
      }
      new StringBuilder().append("Creating ad network view for type: ").append(str1).toString();
      localp = localk.b(paramContext, paramFlurryAds, paramcz, paramAdUnit);
      if (localp == null)
      {
        db.d(d, "Cannot create ad network view for type: " + str1);
        return null;
      }
    }
    while (localp == null);
    localp.M = paramAdUnit;
    return localp;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.z
 * JD-Core Version:    0.6.2
 */