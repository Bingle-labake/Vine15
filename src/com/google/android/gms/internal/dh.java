package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.TileOverlayOptions;

public class dh
{
  public static void a(TileOverlayOptions paramTileOverlayOptions, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramTileOverlayOptions.u());
    ad.a(paramParcel, 2, paramTileOverlayOptions.ba(), false);
    ad.a(paramParcel, 3, paramTileOverlayOptions.isVisible());
    ad.a(paramParcel, 4, paramTileOverlayOptions.getZIndex());
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dh
 * JD-Core Version:    0.6.2
 */