package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.MarkerOptions;

public class dd
{
  public static void a(MarkerOptions paramMarkerOptions, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramMarkerOptions.u());
    ad.a(paramParcel, 2, paramMarkerOptions.getPosition(), paramInt, false);
    ad.a(paramParcel, 3, paramMarkerOptions.getTitle(), false);
    ad.a(paramParcel, 4, paramMarkerOptions.getSnippet(), false);
    ad.a(paramParcel, 5, paramMarkerOptions.aY(), false);
    ad.a(paramParcel, 6, paramMarkerOptions.getAnchorU());
    ad.a(paramParcel, 7, paramMarkerOptions.getAnchorV());
    ad.a(paramParcel, 8, paramMarkerOptions.isDraggable());
    ad.a(paramParcel, 9, paramMarkerOptions.isVisible());
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dd
 * JD-Core Version:    0.6.2
 */