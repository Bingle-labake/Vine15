package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import java.util.ArrayList;

public class ec
  implements Parcelable.Creator<eb>
{
  static void a(eb parameb, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.a(paramParcel, 1, parameb.getDescription(), false);
    ad.c(paramParcel, 1000, parameb.u());
    ad.b(paramParcel, 2, parameb.bv(), false);
    ad.b(paramParcel, 3, parameb.bw(), false);
    ad.a(paramParcel, 4, parameb.bx());
    ad.C(paramParcel, i);
  }

  public eb[] O(int paramInt)
  {
    return new eb[paramInt];
  }

  public eb u(Parcel paramParcel)
  {
    boolean bool = false;
    ArrayList localArrayList1 = null;
    int i = ac.c(paramParcel);
    ArrayList localArrayList2 = null;
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
        str = ac.l(paramParcel, k);
        break;
      case 1000:
        j = ac.f(paramParcel, k);
        break;
      case 2:
        localArrayList2 = ac.c(paramParcel, k, ag.CREATOR);
        break;
      case 3:
        localArrayList1 = ac.c(paramParcel, k, ag.CREATOR);
        break;
      case 4:
        bool = ac.c(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new eb(j, str, localArrayList2, localArrayList1, bool);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ec
 * JD-Core Version:    0.6.2
 */