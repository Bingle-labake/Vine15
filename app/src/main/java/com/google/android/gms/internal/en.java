package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.HashSet;
import java.util.Set;

public class en
  implements Parcelable.Creator<eq.d>
{
  static void a(eq.d paramd, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    Set localSet = paramd.by();
    if (localSet.contains(Integer.valueOf(1)))
      ad.c(paramParcel, 1, paramd.u());
    if (localSet.contains(Integer.valueOf(2)))
      ad.a(paramParcel, 2, paramd.getUrl(), true);
    ad.C(paramParcel, i);
  }

  public eq.d C(Parcel paramParcel)
  {
    int i = ac.c(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = ac.b(paramParcel);
      switch (ac.j(k))
      {
      default:
        ac.b(paramParcel, k);
        break;
      case 1:
        j = ac.f(paramParcel, k);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        str = ac.l(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new eq.d(localHashSet, j, str);
  }

  public eq.d[] W(int paramInt)
  {
    return new eq.d[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.en
 * JD-Core Version:    0.6.2
 */