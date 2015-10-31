package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ac.a;
import com.google.android.gms.internal.ad;

public class LocationRequestCreator
  implements Parcelable.Creator<LocationRequest>
{
  public static final int CONTENT_DESCRIPTION;

  static void a(LocationRequest paramLocationRequest, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramLocationRequest.mPriority);
    ad.c(paramParcel, 1000, paramLocationRequest.T);
    ad.a(paramParcel, 2, paramLocationRequest.ez);
    ad.a(paramParcel, 3, paramLocationRequest.eA);
    ad.a(paramParcel, 4, paramLocationRequest.eB);
    ad.a(paramParcel, 5, paramLocationRequest.eu);
    ad.c(paramParcel, 6, paramLocationRequest.eC);
    ad.a(paramParcel, 7, paramLocationRequest.eD);
    ad.C(paramParcel, i);
  }

  public LocationRequest createFromParcel(Parcel paramParcel)
  {
    LocationRequest localLocationRequest = new LocationRequest();
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
        localLocationRequest.mPriority = ac.f(paramParcel, j);
        break;
      case 1000:
        localLocationRequest.T = ac.f(paramParcel, j);
        break;
      case 2:
        localLocationRequest.ez = ac.g(paramParcel, j);
        break;
      case 3:
        localLocationRequest.eA = ac.g(paramParcel, j);
        break;
      case 4:
        localLocationRequest.eB = ac.c(paramParcel, j);
        break;
      case 5:
        localLocationRequest.eu = ac.g(paramParcel, j);
        break;
      case 6:
        localLocationRequest.eC = ac.f(paramParcel, j);
        break;
      case 7:
        localLocationRequest.eD = ac.i(paramParcel, j);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return localLocationRequest;
  }

  public LocationRequest[] newArray(int paramInt)
  {
    return new LocationRequest[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.LocationRequestCreator
 * JD-Core Version:    0.6.2
 */