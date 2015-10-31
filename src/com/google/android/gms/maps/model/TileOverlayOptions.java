package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.dh;
import com.google.android.gms.internal.dp;
import com.google.android.gms.internal.dp.a;

public final class TileOverlayOptions
  implements ae
{
  public static final TileOverlayOptionsCreator CREATOR = new TileOverlayOptionsCreator();
  private final int T;
  private float fU;
  private boolean fV = true;
  private dp gv;
  private TileProvider gw;

  public TileOverlayOptions()
  {
    this.T = 1;
  }

  TileOverlayOptions(int paramInt, IBinder paramIBinder, boolean paramBoolean, float paramFloat)
  {
    this.T = paramInt;
    this.gv = dp.a.Q(paramIBinder);
    if (this.gv == null);
    for (TileProvider local1 = null; ; local1 = new TileProvider()
    {
      private final dp gx = TileOverlayOptions.a(TileOverlayOptions.this);

      public Tile getTile(int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        try
        {
          Tile localTile = this.gx.getTile(paramAnonymousInt1, paramAnonymousInt2, paramAnonymousInt3);
          return localTile;
        }
        catch (RemoteException localRemoteException)
        {
        }
        return null;
      }
    })
    {
      this.gw = local1;
      this.fV = paramBoolean;
      this.fU = paramFloat;
      return;
    }
  }

  public IBinder ba()
  {
    return this.gv.asBinder();
  }

  public int describeContents()
  {
    return 0;
  }

  public TileProvider getTileProvider()
  {
    return this.gw;
  }

  public float getZIndex()
  {
    return this.fU;
  }

  public boolean isVisible()
  {
    return this.fV;
  }

  public TileOverlayOptions tileProvider(final TileProvider paramTileProvider)
  {
    this.gw = paramTileProvider;
    if (this.gw == null);
    for (dp.a local2 = null; ; local2 = new dp.a()
    {
      public Tile getTile(int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        return paramTileProvider.getTile(paramAnonymousInt1, paramAnonymousInt2, paramAnonymousInt3);
      }
    })
    {
      this.gv = local2;
      return this;
    }
  }

  public int u()
  {
    return this.T;
  }

  public TileOverlayOptions visible(boolean paramBoolean)
  {
    this.fV = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      dh.a(this, paramParcel, paramInt);
      return;
    }
    TileOverlayOptionsCreator.a(this, paramParcel, paramInt);
  }

  public TileOverlayOptions zIndex(float paramFloat)
  {
    this.fU = paramFloat;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.TileOverlayOptions
 * JD-Core Version:    0.6.2
 */