package com.flurry.android;

import android.content.Context;
import android.os.AsyncTask.Status;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

final class aj
{
  Context bE;
  private Map<String, List<AdUnit>> bF = new HashMap();
  private bw bG;

  private void c(String paramString, int paramInt)
  {
    while (true)
    {
      FlurryAdSize localFlurryAdSize1;
      try
      {
        List localList = (List)this.bF.get(paramString);
        localFlurryAdSize1 = FlurryAdSize.BANNER_BOTTOM;
        if ((localList != null) && (localList.size() > 0) && (((AdUnit)localList.get(0)).getAdFrames().size() > 0) && (((AdFrame)((AdUnit)localList.get(0)).getAdFrames().get(0)).getAdSpaceLayout() != null))
        {
          localFlurryAdSize2 = FlurryAdSize.a(((AdFrame)((AdUnit)localList.get(0)).getAdFrames().get(0)).getAdSpaceLayout());
          if (c(localList))
          {
            StringBuilder localStringBuilder = new StringBuilder().append("Starting AsyncAdTask from EnsureCacheNotEmpty size: ");
            if (localList != null)
            {
              str = Integer.toString(localList.size());
              localStringBuilder.append(str).append(" wait: ").append(Integer.toString(0)).toString();
              FlurryAds localFlurryAds = FlurryAds.getInstance();
              localFlurryAds.getClass();
              this.bG = new bw(localFlurryAds, this.bE, paramString, localFlurryAdSize2);
              this.bG.execute(new Void[0]);
            }
          }
          else
          {
            return;
          }
          String str = "";
          continue;
        }
      }
      finally
      {
      }
      FlurryAdSize localFlurryAdSize2 = localFlurryAdSize1;
    }
  }

  private boolean c(List<AdUnit> paramList)
  {
    if (paramList != null);
    try
    {
      if (paramList.size() < 2)
        if (this.bG != null)
        {
          boolean bool2 = this.bG.getStatus().equals(AsyncTask.Status.FINISHED);
          if (!bool2)
            break label49;
        }
      for (boolean bool1 = true; ; bool1 = false)
      {
        return bool1;
        label49: if (this.bG != null)
          this.bG.getStatus().equals(AsyncTask.Status.FINISHED);
      }
    }
    finally
    {
    }
  }

  final void a(String paramString, int paramInt)
  {
    try
    {
      List localList = (List)this.bF.get(paramString);
      if (localList != null)
      {
        if ((paramInt > -1) && (paramInt <= localList.size()))
          break label65;
        this.bF.put(paramString, new ArrayList());
      }
      while (true)
      {
        c(paramString, 0);
        return;
        label65: if (paramInt > 0)
        {
          localList.subList(0, paramInt).clear();
          this.bF.put(paramString, localList);
        }
      }
    }
    finally
    {
    }
  }

  final List<AdUnit> b(String paramString, int paramInt)
  {
    ArrayList localArrayList;
    try
    {
      localArrayList = new ArrayList();
      List localList = (List)this.bF.get(paramString);
      if (localList != null)
      {
        Iterator localIterator = localList.iterator();
        while ((localIterator.hasNext()) && (localArrayList.size() <= paramInt))
        {
          AdUnit localAdUnit = (AdUnit)localIterator.next();
          if ((bd.b(localAdUnit.getExpiration().longValue())) && (localAdUnit.getCombinable().intValue() == 1) && (localAdUnit.getAdFrames().size() > 0))
          {
            localArrayList.add(localAdUnit);
            localIterator.remove();
          }
        }
      }
    }
    finally
    {
    }
    c(paramString, 0);
    return localArrayList;
  }

  final void b(String paramString1, String paramString2)
  {
    try
    {
      List localList = (List)this.bF.get(paramString1);
      if (localList != null)
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
          if (((AdUnit)localIterator.next()).getGroupId().toString().equals(paramString2))
            localIterator.remove();
      }
    }
    finally
    {
    }
    c(paramString1, 0);
  }

  final void b(List<AdUnit> paramList)
  {
    synchronized (this.bF)
    {
      Iterator localIterator = paramList.iterator();
      if (localIterator.hasNext())
      {
        AdUnit localAdUnit = (AdUnit)localIterator.next();
        if (localAdUnit.getIdHash().length() > 0)
        {
          FlurryFreqCapInfo localFlurryFreqCapInfo = new FlurryFreqCapInfo(localAdUnit.getIdHash().toString(), localAdUnit.getServeTime().longValue(), localAdUnit.getExpirationTime().longValue(), localAdUnit.getNewCap().intValue(), localAdUnit.getPreviousCap().intValue(), localAdUnit.getPreviousCapType().intValue());
          FlurryFreqCapManager.an().a(localFlurryFreqCapInfo);
        }
        String str = localAdUnit.getAdSpace().toString();
        Object localObject2 = (List)this.bF.get(str);
        if (localObject2 == null)
          localObject2 = new ArrayList();
        ((List)localObject2).add(localAdUnit);
        this.bF.put(str, localObject2);
      }
    }
  }

  final AdUnit h(String paramString)
  {
    try
    {
      List localList = (List)this.bF.get(paramString);
      AdUnit localAdUnit;
      if (localList != null)
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          localAdUnit = (AdUnit)localIterator.next();
          if ((bd.b(localAdUnit.getExpiration().longValue())) && (localAdUnit.getAdFrames().size() > 0))
          {
            localIterator.remove();
            c(paramString, 0);
          }
        }
      }
      while (true)
      {
        return localAdUnit;
        c(paramString, 0);
        localAdUnit = null;
      }
    }
    finally
    {
    }
  }

  final boolean i(String paramString)
  {
    try
    {
      List localList = (List)this.bF.get(paramString);
      if ((localList != null) && (!localList.isEmpty()))
      {
        Iterator localIterator = localList.iterator();
        boolean bool2;
        do
        {
          if (!localIterator.hasNext())
            break;
          bool2 = bd.b(((AdUnit)localIterator.next()).getExpiration().longValue());
        }
        while (!bool2);
      }
      for (boolean bool1 = true; ; bool1 = false)
        return bool1;
    }
    finally
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.aj
 * JD-Core Version:    0.6.2
 */