package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.HashSet;
import java.util.Set;

public class et
  implements Parcelable.Creator<eq.h>
{
  static void a(eq.h paramh, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    Set localSet = paramh.by();
    if (localSet.contains(Integer.valueOf(1)))
      ad.c(paramParcel, 1, paramh.u());
    if (localSet.contains(Integer.valueOf(2)))
      ad.a(paramParcel, 2, paramh.isPrimary());
    if (localSet.contains(Integer.valueOf(3)))
      ad.a(paramParcel, 3, paramh.getValue(), true);
    ad.C(paramParcel, i);
  }

  public eq.h G(Parcel paramParcel)
  {
    boolean bool = false;
    int i = ac.c(paramParcel);
    HashSet localHashSet = new HashSet();
    String str = null;
    int j = 0;
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
        bool = ac.c(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        str = ac.l(paramParcel, k);
        localHashSet.add(Integer.valueOf(3));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new eq.h(localHashSet, j, bool, str);
  }

  public eq.h[] aa(int paramInt)
  {
    return new eq.h[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.et
 * JD-Core Version:    0.6.2
 */