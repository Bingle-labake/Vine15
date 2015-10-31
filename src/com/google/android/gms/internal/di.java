package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.VisibleRegion;

public class di
{
  public static void a(VisibleRegion paramVisibleRegion, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramVisibleRegion.u());
    ad.a(paramParcel, 2, paramVisibleRegion.nearLeft, paramInt, false);
    ad.a(paramParcel, 3, paramVisibleRegion.nearRight, paramInt, false);
    ad.a(paramParcel, 4, paramVisibleRegion.farLeft, paramInt, false);
    ad.a(paramParcel, 5, paramVisibleRegion.farRight, paramInt, false);
    ad.a(paramParcel, 6, paramVisibleRegion.latLngBounds, paramInt, false);
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.di
 * JD-Core Version:    0.6.2
 */