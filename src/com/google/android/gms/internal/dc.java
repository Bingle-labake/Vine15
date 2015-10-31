package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.LatLng;

public class dc
{
  public static void a(LatLng paramLatLng, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramLatLng.u());
    ad.a(paramParcel, 2, paramLatLng.latitude);
    ad.a(paramParcel, 3, paramLatLng.longitude);
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dc
 * JD-Core Version:    0.6.2
 */