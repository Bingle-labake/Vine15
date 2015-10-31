package com.google.android.gms.internal;

import android.database.CursorWindow;
import android.os.Parcel;
import android.os.Parcelable.Creator;

public class l
  implements Parcelable.Creator<k>
{
  static void a(k paramk, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.a(paramParcel, 1, paramk.U, false);
    ad.c(paramParcel, 1000, paramk.T);
    ad.a(paramParcel, 2, paramk.W, paramInt, false);
    ad.c(paramParcel, 3, paramk.p);
    ad.a(paramParcel, 4, paramk.X, false);
    ad.C(paramParcel, i);
  }

  public k a(Parcel paramParcel)
  {
    k localk = new k();
    int i = ac.c(paramParcel);
    while (paramParcel.dataPosition() < i)
    {
      int j = ac.b(paramParcel);
      switch (ac.j(j))
      {
      default:
        ac.b(paramParcel, j);
        break;
      case 1:
        localk.U = ac.w(paramParcel, j);
        break;
      case 1000:
        localk.T = ac.f(paramParcel, j);
        break;
      case 2:
        localk.W = ((CursorWindow[])ac.b(paramParcel, j, CursorWindow.CREATOR));
        break;
      case 3:
        localk.p = ac.f(paramParcel, j);
        break;
      case 4:
        localk.X = ac.n(paramParcel, j);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    localk.g();
    return localk;
  }

  public k[] f(int paramInt)
  {
    return new k[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.l
 * JD-Core Version:    0.6.2
 */