package com.google.android.gms.internal;

import android.os.Parcel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public final class ak
  implements ae, an.b<String, Integer>
{
  public static final al CREATOR = new al();
  private final int T;
  private final HashMap<String, Integer> bp;
  private final HashMap<Integer, String> bq;
  private final ArrayList<a> br;

  public ak()
  {
    this.T = 1;
    this.bp = new HashMap();
    this.bq = new HashMap();
    this.br = null;
  }

  ak(int paramInt, ArrayList<a> paramArrayList)
  {
    this.T = paramInt;
    this.bp = new HashMap();
    this.bq = new HashMap();
    this.br = null;
    a(paramArrayList);
  }

  private void a(ArrayList<a> paramArrayList)
  {
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      a locala = (a)localIterator.next();
      b(locala.bs, locala.bt);
    }
  }

  ArrayList<a> D()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.bp.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new a(str, ((Integer)this.bp.get(str)).intValue()));
    }
    return localArrayList;
  }

  public int E()
  {
    return 7;
  }

  public int F()
  {
    return 0;
  }

  public String a(Integer paramInteger)
  {
    return (String)this.bq.get(paramInteger);
  }

  public ak b(String paramString, int paramInt)
  {
    this.bp.put(paramString, Integer.valueOf(paramInt));
    this.bq.put(Integer.valueOf(paramInt), paramString);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    al.a(this, paramParcel, paramInt);
  }

  public static final class a
    implements ae
  {
    public static final am CREATOR = new am();
    final String bs;
    final int bt;
    final int versionCode;

    a(int paramInt1, String paramString, int paramInt2)
    {
      this.versionCode = paramInt1;
      this.bs = paramString;
      this.bt = paramInt2;
    }

    a(String paramString, int paramInt)
    {
      this.versionCode = 1;
      this.bs = paramString;
      this.bt = paramInt;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      am.a(this, paramParcel, paramInt);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ak
 * JD-Core Version:    0.6.2
 */