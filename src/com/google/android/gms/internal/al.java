package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.ArrayList;

public class al
  implements Parcelable.Creator<ak>
{
  static void a(ak paramak, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramak.u());
    ad.b(paramParcel, 2, paramak.D(), false);
    ad.C(paramParcel, i);
  }

  public ak g(Parcel paramParcel)
  {
    int i = ac.c(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
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
        localArrayList = ac.c(paramParcel, k, ak.a.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new ak(j, localArrayList);
  }

  public ak[] m(int paramInt)
  {
    return new ak[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.al
 * JD-Core Version:    0.6.2
 */