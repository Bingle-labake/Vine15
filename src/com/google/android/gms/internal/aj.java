package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;

public class aj
  implements Parcelable.Creator<ai>
{
  static void a(ai paramai, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramai.u());
    ad.a(paramParcel, 2, paramai.B(), paramInt, false);
    ad.C(paramParcel, i);
  }

  public ai f(Parcel paramParcel)
  {
    int i = ac.c(paramParcel);
    int j = 0;
    ak localak = null;
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
        localak = (ak)ac.a(paramParcel, k, ak.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new ai(j, localak);
  }

  public ai[] l(int paramInt)
  {
    return new ai[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.aj
 * JD-Core Version:    0.6.2
 */