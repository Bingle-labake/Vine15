package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

final class dc
{
  private Map<String, bf> fj = new HashMap();
  private Map<String, WeakReference<ac>> fk = new HashMap();

  final ac A(String paramString)
  {
    try
    {
      if (this.fk.containsKey(paramString))
      {
        localac = (ac)((WeakReference)this.fk.get(paramString)).get();
        return localac;
      }
      ac localac = null;
    }
    finally
    {
    }
  }

  final void B(String paramString)
  {
    try
    {
      this.fk.remove(paramString);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  final ac a(FlurryAds paramFlurryAds, Context paramContext, ViewGroup paramViewGroup, String paramString)
  {
    try
    {
      WeakReference localWeakReference1 = (WeakReference)this.fk.get(paramString);
      ac localac;
      if (localWeakReference1 == null)
      {
        localac = new ac(paramFlurryAds, paramContext, paramString, paramViewGroup);
        WeakReference localWeakReference2 = new WeakReference(localac);
        this.fk.put(paramString, localWeakReference2);
      }
      while (true)
      {
        return localac;
        localac = (ac)localWeakReference1.get();
        if ((localac == null) || (paramContext != localac.getContext()))
        {
          localac = new ac(paramFlurryAds, paramContext, paramString, paramViewGroup);
          localWeakReference1.clear();
          WeakReference localWeakReference3 = new WeakReference(localac);
          this.fk.put(paramString, localWeakReference3);
        }
      }
    }
    finally
    {
    }
  }

  final void a(String paramString, bf parambf)
  {
    try
    {
      this.fj.put(paramString, parambf);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  final bf n(String paramString)
  {
    try
    {
      bf localbf = (bf)this.fj.get(paramString);
      return localbf;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  final void o(String paramString)
  {
    try
    {
      this.fj.remove(paramString);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.dc
 * JD-Core Version:    0.6.2
 */