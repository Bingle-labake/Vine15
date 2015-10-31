package com.flurry.android;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

final class br
  implements bq
{
  private final List<bq> dN;

  public br()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new cy());
    this.dN = Collections.unmodifiableList(localArrayList);
  }

  public final ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    ao localao = null;
    Iterator localIterator = this.dN.iterator();
    do
    {
      if (!localIterator.hasNext())
        break;
      localao = ((bq)localIterator.next()).a(paramContext, paramFlurryAds, paramcz, paramAdUnit);
    }
    while (localao == null);
    return localao;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.br
 * JD-Core Version:    0.6.2
 */