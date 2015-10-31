package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public final class ef extends an
  implements ae, Moment
{
  public static final eg CREATOR = new eg();
  private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
  private final int T;
  private final Set<Integer> hS;
  private String iH;
  private String iN;
  private ed iQ;
  private ed iR;
  private String iw;

  static
  {
    hR.put("id", an.a.f("id", 2));
    hR.put("result", an.a.a("result", 4, ed.class));
    hR.put("startDate", an.a.f("startDate", 5));
    hR.put("target", an.a.a("target", 6, ed.class));
    hR.put("type", an.a.f("type", 7));
  }

  public ef()
  {
    this.T = 1;
    this.hS = new HashSet();
  }

  ef(Set<Integer> paramSet, int paramInt, String paramString1, ed paramed1, String paramString2, ed paramed2, String paramString3)
  {
    this.hS = paramSet;
    this.T = paramInt;
    this.iw = paramString1;
    this.iQ = paramed1;
    this.iH = paramString2;
    this.iR = paramed2;
    this.iN = paramString3;
  }

  public ef(Set<Integer> paramSet, String paramString1, ed paramed1, String paramString2, ed paramed2, String paramString3)
  {
    this.hS = paramSet;
    this.T = 1;
    this.iw = paramString1;
    this.iQ = paramed1;
    this.iH = paramString2;
    this.iR = paramed2;
    this.iN = paramString3;
  }

  public HashMap<String, an.a<?, ?>> G()
  {
    return hR;
  }

  protected boolean a(an.a parama)
  {
    return this.hS.contains(Integer.valueOf(parama.N()));
  }

  protected Object b(an.a parama)
  {
    switch (parama.N())
    {
    case 3:
    default:
      throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
    case 2:
      return this.iw;
    case 4:
      return this.iQ;
    case 5:
      return this.iH;
    case 6:
      return this.iR;
    case 7:
    }
    return this.iN;
  }

  ed bP()
  {
    return this.iQ;
  }

  ed bQ()
  {
    return this.iR;
  }

  public ef bR()
  {
    return this;
  }

  Set<Integer> by()
  {
    return this.hS;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ef))
      return false;
    if (this == paramObject)
      return true;
    ef localef = (ef)paramObject;
    Iterator localIterator = hR.values().iterator();
    while (localIterator.hasNext())
    {
      an.a locala = (an.a)localIterator.next();
      if (a(locala))
      {
        if (localef.a(locala))
        {
          if (!b(locala).equals(localef.b(locala)))
            return false;
        }
        else
          return false;
      }
      else if (localef.a(locala))
        return false;
    }
    return true;
  }

  public String getId()
  {
    return this.iw;
  }

  public ItemScope getResult()
  {
    return this.iQ;
  }

  public String getStartDate()
  {
    return this.iH;
  }

  public ItemScope getTarget()
  {
    return this.iR;
  }

  public String getType()
  {
    return this.iN;
  }

  public boolean hasId()
  {
    return this.hS.contains(Integer.valueOf(2));
  }

  public boolean hasResult()
  {
    return this.hS.contains(Integer.valueOf(4));
  }

  public boolean hasStartDate()
  {
    return this.hS.contains(Integer.valueOf(5));
  }

  public boolean hasTarget()
  {
    return this.hS.contains(Integer.valueOf(6));
  }

  public boolean hasType()
  {
    return this.hS.contains(Integer.valueOf(7));
  }

  public int hashCode()
  {
    Iterator localIterator = hR.values().iterator();
    int i = 0;
    an.a locala;
    if (localIterator.hasNext())
    {
      locala = (an.a)localIterator.next();
      if (!a(locala))
        break label66;
    }
    label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
    {
      i = j;
      break;
      return i;
    }
  }

  protected Object j(String paramString)
  {
    return null;
  }

  protected boolean k(String paramString)
  {
    return false;
  }

  int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    eg.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ef
 * JD-Core Version:    0.6.2
 */