package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.PolygonOptions;

public class de
{
  public static void a(PolygonOptions paramPolygonOptions, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramPolygonOptions.u());
    ad.b(paramParcel, 2, paramPolygonOptions.getPoints(), false);
    ad.c(paramParcel, 3, paramPolygonOptions.aZ(), false);
    ad.a(paramParcel, 4, paramPolygonOptions.getStrokeWidth());
    ad.c(paramParcel, 5, paramPolygonOptions.getStrokeColor());
    ad.c(paramParcel, 6, paramPolygonOptions.getFillColor());
    ad.a(paramParcel, 7, paramPolygonOptions.getZIndex());
    ad.a(paramParcel, 8, paramPolygonOptions.isVisible());
    ad.a(paramParcel, 9, paramPolygonOptions.isGeodesic());
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.de
 * JD-Core Version:    0.6.2
 */