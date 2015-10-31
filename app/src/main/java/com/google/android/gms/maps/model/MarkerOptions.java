package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.bc;
import com.google.android.gms.internal.bc.a;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.dd;

public final class MarkerOptions
  implements ae
{
  public static final MarkerOptionsCreator CREATOR = new MarkerOptionsCreator();
  private final int T;
  private boolean fV = true;
  private float gd = 0.5F;
  private float ge = 1.0F;
  private LatLng gk;
  private String gl;
  private String gm;
  private BitmapDescriptor gn;
  private boolean go;

  public MarkerOptions()
  {
    this.T = 1;
  }

  MarkerOptions(int paramInt, LatLng paramLatLng, String paramString1, String paramString2, IBinder paramIBinder, float paramFloat1, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.T = paramInt;
    this.gk = paramLatLng;
    this.gl = paramString1;
    this.gm = paramString2;
    if (paramIBinder == null);
    for (BitmapDescriptor localBitmapDescriptor = null; ; localBitmapDescriptor = new BitmapDescriptor(bc.a.j(paramIBinder)))
    {
      this.gn = localBitmapDescriptor;
      this.gd = paramFloat1;
      this.ge = paramFloat2;
      this.go = paramBoolean1;
      this.fV = paramBoolean2;
      return;
    }
  }

  public IBinder aY()
  {
    if (this.gn == null)
      return null;
    return this.gn.aD().asBinder();
  }

  public MarkerOptions anchor(float paramFloat1, float paramFloat2)
  {
    this.gd = paramFloat1;
    this.ge = paramFloat2;
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public MarkerOptions draggable(boolean paramBoolean)
  {
    this.go = paramBoolean;
    return this;
  }

  public float getAnchorU()
  {
    return this.gd;
  }

  public float getAnchorV()
  {
    return this.ge;
  }

  public BitmapDescriptor getIcon()
  {
    return this.gn;
  }

  public LatLng getPosition()
  {
    return this.gk;
  }

  public String getSnippet()
  {
    return this.gm;
  }

  public String getTitle()
  {
    return this.gl;
  }

  public MarkerOptions icon(BitmapDescriptor paramBitmapDescriptor)
  {
    this.gn = paramBitmapDescriptor;
    return this;
  }

  public boolean isDraggable()
  {
    return this.go;
  }

  public boolean isVisible()
  {
    return this.fV;
  }

  public MarkerOptions position(LatLng paramLatLng)
  {
    this.gk = paramLatLng;
    return this;
  }

  public MarkerOptions snippet(String paramString)
  {
    this.gm = paramString;
    return this;
  }

  public MarkerOptions title(String paramString)
  {
    this.gl = paramString;
    return this;
  }

  public int u()
  {
    return this.T;
  }

  public MarkerOptions visible(boolean paramBoolean)
  {
    this.fV = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      dd.a(this, paramParcel, paramInt);
      return;
    }
    MarkerOptionsCreator.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.MarkerOptions
 * JD-Core Version:    0.6.2
 */