package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.LatLngBounds;

public class db
{
  public static void a(LatLngBounds paramLatLngBounds, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramLatLngBounds.u());
    ad.a(paramParcel, 2, paramLatLngBounds.southwest, paramInt, false);
    ad.a(paramParcel, 3, paramLatLngBounds.northeast, paramInt, false);
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.db
 * JD-Core Version:    0.6.2
 */