package com.google.android.gms.internal;

import android.os.Parcel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class aq
  implements ae
{
  public static final ar CREATOR = new ar();
  private final int T;
  private final HashMap<String, HashMap<String, an.a<?, ?>>> bE;
  private final ArrayList<a> bF;
  private final String bG;

  aq(int paramInt, ArrayList<a> paramArrayList, String paramString)
  {
    this.T = paramInt;
    this.bF = null;
    this.bE = b(paramArrayList);
    this.bG = ((String)x.d(paramString));
    T();
  }

  public aq(Class<? extends an> paramClass)
  {
    this.T = 1;
    this.bF = null;
    this.bE = new HashMap();
    this.bG = paramClass.getCanonicalName();
  }

  private static HashMap<String, HashMap<String, an.a<?, ?>>> b(ArrayList<a> paramArrayList)
  {
    HashMap localHashMap = new HashMap();
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      a locala = (a)paramArrayList.get(j);
      localHashMap.put(locala.className, locala.X());
    }
    return localHashMap;
  }

  public void T()
  {
    Iterator localIterator1 = this.bE.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str = (String)localIterator1.next();
      HashMap localHashMap = (HashMap)this.bE.get(str);
      Iterator localIterator2 = localHashMap.keySet().iterator();
      while (localIterator2.hasNext())
        ((an.a)localHashMap.get((String)localIterator2.next())).a(this);
    }
  }

  public void U()
  {
    Iterator localIterator1 = this.bE.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      HashMap localHashMap1 = (HashMap)this.bE.get(str1);
      HashMap localHashMap2 = new HashMap();
      Iterator localIterator2 = localHashMap1.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localHashMap2.put(str2, ((an.a)localHashMap1.get(str2)).J());
      }
      this.bE.put(str1, localHashMap2);
    }
  }

  ArrayList<a> V()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.bE.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new a(str, (HashMap)this.bE.get(str)));
    }
    return localArrayList;
  }

  public String W()
  {
    return this.bG;
  }

  public void a(Class<? extends an> paramClass, HashMap<String, an.a<?, ?>> paramHashMap)
  {
    this.bE.put(paramClass.getCanonicalName(), paramHashMap);
  }

  public boolean a(Class<? extends an> paramClass)
  {
    return this.bE.containsKey(paramClass.getCanonicalName());
  }

  public int describeContents()
  {
    return 0;
  }

  public HashMap<String, an.a<?, ?>> n(String paramString)
  {
    return (HashMap)this.bE.get(paramString);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator1 = this.bE.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      localStringBuilder.append(str1).append(":\n");
      HashMap localHashMap = (HashMap)this.bE.get(str1);
      Iterator localIterator2 = localHashMap.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localStringBuilder.append("  ").append(str2).append(": ");
        localStringBuilder.append(localHashMap.get(str2));
      }
    }
    return localStringBuilder.toString();
  }

  int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ar.a(this, paramParcel, paramInt);
  }

  public static class a
    implements ae
  {
    public static final as CREATOR = new as();
    final ArrayList<aq.b> bH;
    final String className;
    final int versionCode;

    a(int paramInt, String paramString, ArrayList<aq.b> paramArrayList)
    {
      this.versionCode = paramInt;
      this.className = paramString;
      this.bH = paramArrayList;
    }

    a(String paramString, HashMap<String, an.a<?, ?>> paramHashMap)
    {
      this.versionCode = 1;
      this.className = paramString;
      this.bH = a(paramHashMap);
    }

    private static ArrayList<aq.b> a(HashMap<String, an.a<?, ?>> paramHashMap)
    {
      if (paramHashMap == null)
        return null;
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localArrayList.add(new aq.b(str, (an.a)paramHashMap.get(str)));
      }
      return localArrayList;
    }

    HashMap<String, an.a<?, ?>> X()
    {
      HashMap localHashMap = new HashMap();
      int i = this.bH.size();
      for (int j = 0; j < i; j++)
      {
        aq.b localb = (aq.b)this.bH.get(j);
        localHashMap.put(localb.bI, localb.bJ);
      }
      return localHashMap;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      as.a(this, paramParcel, paramInt);
    }
  }

  public static class b
    implements ae
  {
    public static final ap CREATOR = new ap();
    final String bI;
    final an.a<?, ?> bJ;
    final int versionCode;

    b(int paramInt, String paramString, an.a<?, ?> parama)
    {
      this.versionCode = paramInt;
      this.bI = paramString;
      this.bJ = parama;
    }

    b(String paramString, an.a<?, ?> parama)
    {
      this.versionCode = 1;
      this.bI = paramString;
      this.bJ = parama;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      ap.a(this, paramParcel, paramInt);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.aq
 * JD-Core Version:    0.6.2
 */