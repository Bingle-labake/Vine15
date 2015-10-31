package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.HashSet;
import java.util.Set;

public class ei
  implements Parcelable.Creator<eq.a>
{
  static void a(eq.a parama, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    Set localSet = parama.by();
    if (localSet.contains(Integer.valueOf(1)))
      ad.c(paramParcel, 1, parama.u());
    if (localSet.contains(Integer.valueOf(2)))
      ad.c(paramParcel, 2, parama.getMax());
    if (localSet.contains(Integer.valueOf(3)))
      ad.c(paramParcel, 3, parama.getMin());
    ad.C(paramParcel, i);
  }

  public eq.a[] R(int paramInt)
  {
    return new eq.a[paramInt];
  }

  public eq.a x(Parcel paramParcel)
  {
    int i = 0;
    int j = ac.c(paramParcel);
    HashSet localHashSet = new HashSet();
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = ac.b(paramParcel);
      switch (ac.j(n))
      {
      default:
        ac.b(paramParcel, n);
        break;
      case 1:
        m = ac.f(paramParcel, n);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        k = ac.f(paramParcel, n);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        i = ac.f(paramParcel, n);
        localHashSet.add(Integer.valueOf(3));
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new ac.a("Overread allowed size end=" + j, paramParcel);
    return new eq.a(localHashSet, m, k, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ei
 * JD-Core Version:    0.6.2
 */