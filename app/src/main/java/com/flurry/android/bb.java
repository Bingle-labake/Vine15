package com.flurry.android;

import android.content.Context;
import android.text.TextUtils;
import java.util.List;
import java.util.Locale;
import java.util.Map;

final class bb
  implements bq
{
  private static final String d = bb.class.getSimpleName();
  private final Map<String, bq> cq;

  public bb(Map<String, bq> paramMap)
  {
    this.cq = paramMap;
  }

  public final ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    ao localao;
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null))
    {
      localao = null;
      return localao;
    }
    List localList = paramAdUnit.getAdFrames();
    if ((localList == null) || (localList.isEmpty()))
      return null;
    AdFrame localAdFrame = (AdFrame)localList.get(0);
    if (localAdFrame == null)
      return null;
    String str = localAdFrame.getContent().toString();
    if (TextUtils.isEmpty(str))
      return null;
    if (this.cq != null);
    for (bq localbq = (bq)this.cq.get(str.toUpperCase(Locale.US)); ; localbq = null)
    {
      if (localbq == null)
        return null;
      new StringBuilder().append("Creating ad network takeover launcher: ").append(localbq.getClass().getSimpleName()).append(" for type: ").append(str).toString();
      localao = localbq.a(paramContext, paramFlurryAds, paramcz, paramAdUnit);
      if (localao != null)
        break;
      db.d(d, "Cannot create ad network takeover launcher for type: " + str);
      return localao;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bb
 * JD-Core Version:    0.6.2
 */