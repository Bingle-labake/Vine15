package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.maps.model.Tile;

public class dg
{
  public static void a(Tile paramTile, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramTile.u());
    ad.c(paramParcel, 2, paramTile.width);
    ad.c(paramParcel, 3, paramTile.height);
    ad.a(paramParcel, 4, paramTile.data, false);
    ad.C(paramParcel, i);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dg
 * JD-Core Version:    0.6.2
 */