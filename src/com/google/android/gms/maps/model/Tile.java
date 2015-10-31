package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.dg;

public final class Tile
  implements ae
{
  public static final TileCreator CREATOR = new TileCreator();
  private final int T;
  public final byte[] data;
  public final int height;
  public final int width;

  Tile(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte)
  {
    this.T = paramInt1;
    this.width = paramInt2;
    this.height = paramInt3;
    this.data = paramArrayOfByte;
  }

  public Tile(int paramInt1, int paramInt2, byte[] paramArrayOfByte)
  {
    this(1, paramInt1, paramInt2, paramArrayOfByte);
  }

  public int describeContents()
  {
    return 0;
  }

  public int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      dg.a(this, paramParcel, paramInt);
      return;
    }
    TileCreator.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.Tile
 * JD-Core Version:    0.6.2
 */