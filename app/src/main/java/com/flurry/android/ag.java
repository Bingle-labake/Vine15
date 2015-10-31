package com.flurry.android;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

final class ag
{
  private FlurryAds by;

  ag(FlurryAds paramFlurryAds)
  {
    this.by = paramFlurryAds;
  }

  final List<SdkAdLog> a(List<cz> paramList)
  {
    CopyOnWriteArrayList localCopyOnWriteArrayList1 = new CopyOnWriteArrayList();
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext())
    {
      cz localcz = (cz)localIterator1.next();
      SdkAdLog localSdkAdLog = new SdkAdLog();
      localSdkAdLog.b(Long.valueOf(localcz.au()));
      localSdkAdLog.c(localcz.at());
      CopyOnWriteArrayList localCopyOnWriteArrayList2 = new CopyOnWriteArrayList();
      while (true)
      {
        SdkAdEvent localSdkAdEvent;
        HashMap localHashMap;
        try
        {
          Iterator localIterator2 = localcz.av().iterator();
          if (!localIterator2.hasNext())
            break;
          bu localbu = (bu)localIterator2.next();
          if (!localbu.ai())
            continue;
          localSdkAdEvent = new SdkAdEvent();
          localSdkAdEvent.a(localbu.getType());
          localSdkAdEvent.a(Long.valueOf(localbu.M()));
          Map localMap = localbu.getParams();
          localHashMap = new HashMap();
          Iterator localIterator3 = localMap.entrySet().iterator();
          if (localIterator3.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator3.next();
            localHashMap.put(localEntry.getKey(), localEntry.getValue());
            continue;
          }
        }
        finally
        {
        }
        localSdkAdEvent.a(localHashMap);
        localCopyOnWriteArrayList2.add(localSdkAdEvent);
      }
      localSdkAdLog.g(localCopyOnWriteArrayList2);
      localCopyOnWriteArrayList1.add(localSdkAdLog);
    }
    this.by.d(paramList);
    return localCopyOnWriteArrayList1;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ag
 * JD-Core Version:    0.6.2
 */