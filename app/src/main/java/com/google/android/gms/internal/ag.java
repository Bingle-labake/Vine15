package com.google.android.gms.internal;

import android.os.Parcel;

public final class ag
  implements ae
{
  public static final ah CREATOR = new ah();
  private final int T;
  private final int bi;
  private final int bj;
  private final String bk;
  private final String bl;
  private final String bm;
  private final String bn;

  public ag(int paramInt1, int paramInt2, int paramInt3, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    this.T = paramInt1;
    this.bi = paramInt2;
    this.bj = paramInt3;
    this.bk = paramString1;
    this.bl = paramString2;
    this.bm = paramString3;
    this.bn = paramString4;
  }

  public boolean A()
  {
    return this.bi == 2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ag));
    ag localag;
    do
    {
      return false;
      localag = (ag)paramObject;
    }
    while ((this.T != localag.T) || (this.bi != localag.bi) || (this.bj != localag.bj) || (!w.a(this.bk, localag.bk)) || (!w.a(this.bl, localag.bl)));
    return true;
  }

  public String getDisplayName()
  {
    return this.bm;
  }

  public int getType()
  {
    return this.bi;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = Integer.valueOf(this.T);
    arrayOfObject[1] = Integer.valueOf(this.bi);
    arrayOfObject[2] = Integer.valueOf(this.bj);
    arrayOfObject[3] = this.bk;
    arrayOfObject[4] = this.bl;
    return w.hashCode(arrayOfObject);
  }

  public String toString()
  {
    if (A())
    {
      Object[] arrayOfObject3 = new Object[2];
      arrayOfObject3[0] = x();
      arrayOfObject3[1] = getDisplayName();
      return String.format("Person [%s] %s", arrayOfObject3);
    }
    if (z())
    {
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = w();
      arrayOfObject2[1] = getDisplayName();
      return String.format("Circle [%s] %s", arrayOfObject2);
    }
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = w();
    arrayOfObject1[1] = getDisplayName();
    return String.format("Group [%s] %s", arrayOfObject1);
  }

  public int u()
  {
    return this.T;
  }

  public int v()
  {
    return this.bj;
  }

  public String w()
  {
    return this.bk;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ah.a(this, paramParcel, paramInt);
  }

  public String x()
  {
    return this.bl;
  }

  public String y()
  {
    return this.bn;
  }

  public boolean z()
  {
    return (this.bi == 1) && (this.bj == -1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ag
 * JD-Core Version:    0.6.2
 */