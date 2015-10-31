package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;

public class ap
  implements Parcelable.Creator<aq.b>
{
  static void a(aq.b paramb, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramb.versionCode);
    ad.a(paramParcel, 2, paramb.bI, false);
    ad.a(paramParcel, 3, paramb.bJ, paramInt, false);
    ad.C(paramParcel, i);
  }

  public aq.b j(Parcel paramParcel)
  {
    an.a locala = null;
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
        locala = (an.a)ac.a(paramParcel, k, an.a.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new aq.b(j, str, locala);
  }

  public aq.b[] p(int paramInt)
  {
    return new aq.b[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ap
 * JD-Core Version:    0.6.2
 */