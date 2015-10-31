package com.flurry.android;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class FlurryFreqCapManager
{
  private static FlurryFreqCapManager eC;
  private HashMap<String, FlurryFreqCapInfo> eD = new HashMap();

  static FlurryFreqCapManager an()
  {
    if (eC == null)
      eC = new FlurryFreqCapManager();
    return eC;
  }

  static boolean d(long paramLong)
  {
    return paramLong <= System.currentTimeMillis();
  }

  final void a(FlurryFreqCapInfo paramFlurryFreqCapInfo)
  {
    while (true)
    {
      try
      {
        if (paramFlurryFreqCapInfo.getIdHash().length() == 0)
          return;
        try
        {
          if (this.eD.containsKey(paramFlurryFreqCapInfo.getIdHash()))
          {
            this.eD.remove(paramFlurryFreqCapInfo.getIdHash());
            if (paramFlurryFreqCapInfo.getNewCap() != -1)
              this.eD.put(paramFlurryFreqCapInfo.getIdHash(), paramFlurryFreqCapInfo);
            return;
          }
        }
        finally
        {
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
      this.eD.put(paramFlurryFreqCapInfo.getIdHash(), paramFlurryFreqCapInfo);
    }
  }

  final List<FlurryFreqCapInfo> ao()
  {
    ArrayList localArrayList;
    try
    {
      try
      {
        localArrayList = new ArrayList();
        Iterator localIterator = getFreqCapInfoMap().values().iterator();
        while (localIterator.hasNext())
          localArrayList.add(((FlurryFreqCapInfo)localIterator.next()).getCopy());
      }
      finally
      {
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return null;
    }
    return localArrayList;
  }

  final void ap()
  {
    try
    {
      try
      {
        Iterator localIterator = ao().iterator();
        while (localIterator.hasNext())
        {
          FlurryFreqCapInfo localFlurryFreqCapInfo = (FlurryFreqCapInfo)localIterator.next();
          if (d(localFlurryFreqCapInfo.getExpirationTime()))
          {
            new StringBuilder().append("expiring adunit freq cap for idHash: ").append(localFlurryFreqCapInfo.getIdHash()).append(" adunit exp: ").append(localFlurryFreqCapInfo.getExpirationTime()).append(" device epoch").append(System.currentTimeMillis()).toString();
            z(localFlurryFreqCapInfo.getIdHash());
          }
        }
      }
      finally
      {
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return;
    }
  }

  public HashMap<String, FlurryFreqCapInfo> getFreqCapInfoMap()
  {
    return this.eD;
  }

  final FlurryFreqCapInfo y(String paramString)
  {
    try
    {
      try
      {
        if (this.eD.containsKey(paramString))
        {
          FlurryFreqCapInfo localFlurryFreqCapInfo = (FlurryFreqCapInfo)this.eD.get(paramString);
          return localFlurryFreqCapInfo;
        }
        return null;
      }
      finally
      {
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }

  final void z(String paramString)
  {
    try
    {
      try
      {
        if (this.eD.containsKey(paramString))
          this.eD.remove(paramString);
        return;
      }
      finally
      {
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FlurryFreqCapManager
 * JD-Core Version:    0.6.2
 */