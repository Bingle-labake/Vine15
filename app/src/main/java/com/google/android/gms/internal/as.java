package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.ArrayList;

public class as
  implements Parcelable.Creator<aq.a>
{
  static void a(aq.a parama, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, parama.versionCode);
    ad.a(paramParcel, 2, parama.className, false);
    ad.b(paramParcel, 3, parama.bH, false);
    ad.C(paramParcel, i);
  }

  public aq.a l(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int i = ac.c(paramParcel);
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
        break;
      case 2:
        str = ac.l(paramParcel, k);
        break;
      case 3:
        localArrayList = ac.c(paramParcel, k, aq.b.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new aq.a(j, str, localArrayList);
  }

  public aq.a[] r(int paramInt)
  {
    return new aq.a[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.as
 * JD-Core Version:    0.6.2
 */