package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class at extends an
  implements ae
{
  public static final au CREATOR = new au();
  private final int T;
  private final aq bC;
  private final Parcel bK;
  private final int bL;
  private int bM;
  private int bN;
  private final String mClassName;

  at(int paramInt, Parcel paramParcel, aq paramaq)
  {
    this.T = paramInt;
    this.bK = ((Parcel)x.d(paramParcel));
    this.bL = 2;
    this.bC = paramaq;
    if (this.bC == null);
    for (this.mClassName = null; ; this.mClassName = this.bC.W())
    {
      this.bM = 2;
      return;
    }
  }

  private at(ae paramae, aq paramaq, String paramString)
  {
    this.T = 1;
    this.bK = Parcel.obtain();
    paramae.writeToParcel(this.bK, 0);
    this.bL = 1;
    this.bC = ((aq)x.d(paramaq));
    this.mClassName = ((String)x.d(paramString));
    this.bM = 2;
  }

  public static <T extends an,  extends ae> at a(T paramT)
  {
    String str = paramT.getClass().getCanonicalName();
    aq localaq = b(paramT);
    return new at((ae)paramT, localaq, str);
  }

  public static HashMap<String, String> a(Bundle paramBundle)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramBundle.getString(str));
    }
    return localHashMap;
  }

  private static void a(aq paramaq, an paraman)
  {
    Class localClass1 = paraman.getClass();
    if (!paramaq.a(localClass1))
    {
      HashMap localHashMap = paraman.G();
      paramaq.a(localClass1, paraman.G());
      Iterator localIterator = localHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localHashMap.get((String)localIterator.next());
        Class localClass2 = locala.O();
        if (localClass2 != null)
          try
          {
            a(paramaq, (an)localClass2.newInstance());
          }
          catch (InstantiationException localInstantiationException)
          {
            throw new IllegalStateException("Could not instantiate an object of type " + locala.O().getCanonicalName(), localInstantiationException);
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            throw new IllegalStateException("Could not access object of type " + locala.O().getCanonicalName(), localIllegalAccessException);
          }
      }
    }
  }

  private void a(StringBuilder paramStringBuilder, int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Unknown type = " + paramInt);
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      paramStringBuilder.append(paramObject);
      return;
    case 7:
      paramStringBuilder.append("\"").append(ay.o(paramObject.toString())).append("\"");
      return;
    case 8:
      paramStringBuilder.append("\"").append(aw.a((byte[])paramObject)).append("\"");
      return;
    case 9:
      paramStringBuilder.append("\"").append(aw.b((byte[])paramObject));
      paramStringBuilder.append("\"");
      return;
    case 10:
      az.a(paramStringBuilder, (HashMap)paramObject);
      return;
    case 11:
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }

  private void a(StringBuilder paramStringBuilder, an.a<?, ?> parama, Parcel paramParcel, int paramInt)
  {
    switch (parama.F())
    {
    default:
      throw new IllegalArgumentException("Unknown field out type = " + parama.F());
    case 0:
      b(paramStringBuilder, parama, a(parama, Integer.valueOf(ac.f(paramParcel, paramInt))));
      return;
    case 1:
      b(paramStringBuilder, parama, a(parama, ac.h(paramParcel, paramInt)));
      return;
    case 2:
      b(paramStringBuilder, parama, a(parama, Long.valueOf(ac.g(paramParcel, paramInt))));
      return;
    case 3:
      b(paramStringBuilder, parama, a(parama, Float.valueOf(ac.i(paramParcel, paramInt))));
      return;
    case 4:
      b(paramStringBuilder, parama, a(parama, Double.valueOf(ac.j(paramParcel, paramInt))));
      return;
    case 5:
      b(paramStringBuilder, parama, a(parama, ac.k(paramParcel, paramInt)));
      return;
    case 6:
      b(paramStringBuilder, parama, a(parama, Boolean.valueOf(ac.c(paramParcel, paramInt))));
      return;
    case 7:
      b(paramStringBuilder, parama, a(parama, ac.l(paramParcel, paramInt)));
      return;
    case 8:
    case 9:
      b(paramStringBuilder, parama, a(parama, ac.o(paramParcel, paramInt)));
      return;
    case 10:
      b(paramStringBuilder, parama, a(parama, a(ac.n(paramParcel, paramInt))));
      return;
    case 11:
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }

  private void a(StringBuilder paramStringBuilder, String paramString, an.a<?, ?> parama, Parcel paramParcel, int paramInt)
  {
    paramStringBuilder.append("\"").append(paramString).append("\":");
    if (parama.Q())
    {
      a(paramStringBuilder, parama, paramParcel, paramInt);
      return;
    }
    b(paramStringBuilder, parama, paramParcel, paramInt);
  }

  private void a(StringBuilder paramStringBuilder, HashMap<String, an.a<?, ?>> paramHashMap, Parcel paramParcel)
  {
    HashMap localHashMap = b(paramHashMap);
    paramStringBuilder.append('{');
    int i = ac.c(paramParcel);
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = ac.b(paramParcel);
      Map.Entry localEntry = (Map.Entry)localHashMap.get(Integer.valueOf(ac.j(k)));
      if (localEntry != null)
      {
        if (j != 0)
          paramStringBuilder.append(",");
        a(paramStringBuilder, (String)localEntry.getKey(), (an.a)localEntry.getValue(), paramParcel, k);
        j = 1;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    paramStringBuilder.append('}');
  }

  private static aq b(an paraman)
  {
    aq localaq = new aq(paraman.getClass());
    a(localaq, paraman);
    localaq.U();
    localaq.T();
    return localaq;
  }

  private static HashMap<Integer, Map.Entry<String, an.a<?, ?>>> b(HashMap<String, an.a<?, ?>> paramHashMap)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localHashMap.put(Integer.valueOf(((an.a)localEntry.getValue()).N()), localEntry);
    }
    return localHashMap;
  }

  private void b(StringBuilder paramStringBuilder, an.a<?, ?> parama, Parcel paramParcel, int paramInt)
  {
    if (parama.L())
    {
      paramStringBuilder.append("[");
      switch (parama.F())
      {
      default:
        throw new IllegalStateException("Unknown field type out.");
      case 0:
        av.a(paramStringBuilder, ac.q(paramParcel, paramInt));
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      }
      while (true)
      {
        paramStringBuilder.append("]");
        return;
        av.a(paramStringBuilder, ac.s(paramParcel, paramInt));
        continue;
        av.a(paramStringBuilder, ac.r(paramParcel, paramInt));
        continue;
        av.a(paramStringBuilder, ac.t(paramParcel, paramInt));
        continue;
        av.a(paramStringBuilder, ac.u(paramParcel, paramInt));
        continue;
        av.a(paramStringBuilder, ac.v(paramParcel, paramInt));
        continue;
        av.a(paramStringBuilder, ac.p(paramParcel, paramInt));
        continue;
        av.a(paramStringBuilder, ac.w(paramParcel, paramInt));
        continue;
        throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
        Parcel[] arrayOfParcel = ac.z(paramParcel, paramInt);
        int j = arrayOfParcel.length;
        for (int k = 0; k < j; k++)
        {
          if (k > 0)
            paramStringBuilder.append(",");
          arrayOfParcel[k].setDataPosition(0);
          a(paramStringBuilder, parama.S(), arrayOfParcel[k]);
        }
      }
    }
    switch (parama.F())
    {
    default:
      throw new IllegalStateException("Unknown field type out");
    case 0:
      paramStringBuilder.append(ac.f(paramParcel, paramInt));
      return;
    case 1:
      paramStringBuilder.append(ac.h(paramParcel, paramInt));
      return;
    case 2:
      paramStringBuilder.append(ac.g(paramParcel, paramInt));
      return;
    case 3:
      paramStringBuilder.append(ac.i(paramParcel, paramInt));
      return;
    case 4:
      paramStringBuilder.append(ac.j(paramParcel, paramInt));
      return;
    case 5:
      paramStringBuilder.append(ac.k(paramParcel, paramInt));
      return;
    case 6:
      paramStringBuilder.append(ac.c(paramParcel, paramInt));
      return;
    case 7:
      String str2 = ac.l(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(ay.o(str2)).append("\"");
      return;
    case 8:
      byte[] arrayOfByte2 = ac.o(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(aw.a(arrayOfByte2)).append("\"");
      return;
    case 9:
      byte[] arrayOfByte1 = ac.o(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(aw.b(arrayOfByte1));
      paramStringBuilder.append("\"");
      return;
    case 10:
      Bundle localBundle = ac.n(paramParcel, paramInt);
      Set localSet = localBundle.keySet();
      localSet.size();
      paramStringBuilder.append("{");
      Iterator localIterator = localSet.iterator();
      for (int i = 1; localIterator.hasNext(); i = 0)
      {
        String str1 = (String)localIterator.next();
        if (i == 0)
          paramStringBuilder.append(",");
        paramStringBuilder.append("\"").append(str1).append("\"");
        paramStringBuilder.append(":");
        paramStringBuilder.append("\"").append(ay.o(localBundle.getString(str1))).append("\"");
      }
      paramStringBuilder.append("}");
      return;
    case 11:
    }
    Parcel localParcel = ac.y(paramParcel, paramInt);
    localParcel.setDataPosition(0);
    a(paramStringBuilder, parama.S(), localParcel);
  }

  private void b(StringBuilder paramStringBuilder, an.a<?, ?> parama, Object paramObject)
  {
    if (parama.K())
    {
      b(paramStringBuilder, parama, (ArrayList)paramObject);
      return;
    }
    a(paramStringBuilder, parama.E(), paramObject);
  }

  private void b(StringBuilder paramStringBuilder, an.a<?, ?> parama, ArrayList<?> paramArrayList)
  {
    paramStringBuilder.append("[");
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      if (j != 0)
        paramStringBuilder.append(",");
      a(paramStringBuilder, parama.E(), paramArrayList.get(j));
    }
    paramStringBuilder.append("]");
  }

  public HashMap<String, an.a<?, ?>> G()
  {
    if (this.bC == null)
      return null;
    return this.bC.n(this.mClassName);
  }

  public Parcel Y()
  {
    switch (this.bM)
    {
    default:
    case 0:
    case 1:
    }
    while (true)
    {
      return this.bK;
      this.bN = ad.d(this.bK);
      ad.C(this.bK, this.bN);
      this.bM = 2;
      continue;
      ad.C(this.bK, this.bN);
      this.bM = 2;
    }
  }

  aq Z()
  {
    switch (this.bL)
    {
    default:
      throw new IllegalStateException("Invalid creation type: " + this.bL);
    case 0:
      return null;
    case 1:
      return this.bC;
    case 2:
    }
    return this.bC;
  }

  public <T extends ae> T a(Parcelable.Creator<T> paramCreator)
  {
    Parcel localParcel = Y();
    localParcel.setDataPosition(0);
    return (ae)paramCreator.createFromParcel(localParcel);
  }

  public int describeContents()
  {
    return 0;
  }

  protected Object j(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }

  protected boolean k(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }

  public String toString()
  {
    x.b(this.bC, "Cannot convert to JSON on client side.");
    Parcel localParcel = Y();
    localParcel.setDataPosition(0);
    StringBuilder localStringBuilder = new StringBuilder(100);
    a(localStringBuilder, this.bC.n(this.mClassName), localParcel);
    return localStringBuilder.toString();
  }

  public int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    au.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.at
 * JD-Core Version:    0.6.2
 */