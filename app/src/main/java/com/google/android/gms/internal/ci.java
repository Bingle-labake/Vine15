package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.GoogleMapOptions;

public class ci
{
  public static void a(GoogleMapOptions paramGoogleMapOptions, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramGoogleMapOptions.u());
    ad.a(paramParcel, 2, paramGoogleMapOptions.aG());
    ad.a(paramParcel, 3, paramGoogleMapOptions.aH());
    ad.c(paramParcel, 4, paramGoogleMapOptions.getMapType());
    ad.a(paramParcel, 5, paramGoogleMapOptions.getCamera(), paramInt, false);
    ad.a(paramParcel, 6, paramGoogleMapOptions.aI());
    ad.a(paramParcel, 7, paramGoogleMapOptions.aJ());
    ad.a(paramParcel, 8, paramGoogleMapOptions.aK());
    ad.a(paramParcel, 9, paramGoogleMapOptions.aL());
    ad.a(paramParcel, 10, paramGoogleMapOptions.aM());
    ad.a(paramParcel, 11, paramGoogleMapOptions.aN());
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ci
 * JD-Core Version:    0.6.2
 */