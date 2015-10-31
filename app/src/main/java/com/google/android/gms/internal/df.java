package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.PolylineOptions;

public class df
{
  public static void a(PolylineOptions paramPolylineOptions, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramPolylineOptions.u());
    ad.b(paramParcel, 2, paramPolylineOptions.getPoints(), false);
    ad.a(paramParcel, 3, paramPolylineOptions.getWidth());
    ad.c(paramParcel, 4, paramPolylineOptions.getColor());
    ad.a(paramParcel, 5, paramPolylineOptions.getZIndex());
    ad.a(paramParcel, 6, paramPolylineOptions.isVisible());
    ad.a(paramParcel, 7, paramPolylineOptions.isGeodesic());
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.df
 * JD-Core Version:    0.6.2
 */