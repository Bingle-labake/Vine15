package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ac.a;
import com.google.android.gms.internal.ad;

public class TileCreator
  implements Parcelable.Creator<Tile>
{
  public static final int CONTENT_DESCRIPTION;

  static void a(Tile paramTile, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramTile.u());
    ad.c(paramParcel, 2, paramTile.width);
    ad.c(paramParcel, 3, paramTile.height);
    ad.a(paramParcel, 4, paramTile.data, false);
    ad.C(paramParcel, i);
  }

  public Tile createFromParcel(Parcel paramParcel)
  {
    int i = 0;
    int j = ac.c(paramParcel);
    byte[] arrayOfByte = null;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = ac.b(paramParcel);
      switch (ac.j(n))
      {
      default:
        ac.b(paramParcel, n);
        break;
      case 1:
        m = ac.f(paramParcel, n);
        break;
      case 2:
        k = ac.f(paramParcel, n);
        break;
      case 3:
        i = ac.f(paramParcel, n);
        break;
      case 4:
        arrayOfByte = ac.o(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new ac.a("Overread allowed size end=" + j, paramParcel);
    return new Tile(m, k, i, arrayOfByte);
  }

  public Tile[] newArray(int paramInt)
  {
    return new Tile[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.TileCreator
 * JD-Core Version:    0.6.2
 */