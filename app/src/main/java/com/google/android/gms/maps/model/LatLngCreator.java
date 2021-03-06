package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ac.a;
import com.google.android.gms.internal.ad;

public class LatLngCreator
  implements Parcelable.Creator<LatLng>
{
  public static final int CONTENT_DESCRIPTION;

  static void a(LatLng paramLatLng, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramLatLng.u());
    ad.a(paramParcel, 2, paramLatLng.latitude);
    ad.a(paramParcel, 3, paramLatLng.longitude);
    ad.C(paramParcel, i);
  }

  public LatLng createFromParcel(Parcel paramParcel)
  {
    double d1 = 0.0D;
    int i = ac.c(paramParcel);
    int j = 0;
    double d2 = d1;
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
        d2 = ac.j(paramParcel, k);
        break;
      case 3:
        d1 = ac.j(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new LatLng(j, d2, d1);
  }

  public LatLng[] newArray(int paramInt)
  {
    return new LatLng[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.LatLngCreator
 * JD-Core Version:    0.6.2
 */