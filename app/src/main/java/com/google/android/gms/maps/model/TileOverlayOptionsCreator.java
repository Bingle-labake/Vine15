package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ac.a;
import com.google.android.gms.internal.ad;

public class TileOverlayOptionsCreator
  implements Parcelable.Creator<TileOverlayOptions>
{
  public static final int CONTENT_DESCRIPTION;

  static void a(TileOverlayOptions paramTileOverlayOptions, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramTileOverlayOptions.u());
    ad.a(paramParcel, 2, paramTileOverlayOptions.ba(), false);
    ad.a(paramParcel, 3, paramTileOverlayOptions.isVisible());
    ad.a(paramParcel, 4, paramTileOverlayOptions.getZIndex());
    ad.C(paramParcel, i);
  }

  public TileOverlayOptions createFromParcel(Parcel paramParcel)
  {
    boolean bool = false;
    int i = ac.c(paramParcel);
    IBinder localIBinder = null;
    float f = 0.0F;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = ac.b(paramParcel);
      switch (ac.j(k))
      {
      default:
        ac.b(paramParcel, k);
        break;
      case 1:
        j = ac.f(paramParcel, k);
        break;
      case 2:
        localIBinder = ac.m(paramParcel, k);
        break;
      case 3:
        bool = ac.c(paramParcel, k);
        break;
      case 4:
        f = ac.i(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return new TileOverlayOptions(j, localIBinder, bool, f);
  }

  public TileOverlayOptions[] newArray(int paramInt)
  {
    return new TileOverlayOptions[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.TileOverlayOptionsCreator
 * JD-Core Version:    0.6.2
 */