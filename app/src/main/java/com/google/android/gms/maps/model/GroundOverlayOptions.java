package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.bc;
import com.google.android.gms.internal.bc.a;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.da;
import com.google.android.gms.internal.x;

public final class GroundOverlayOptions
  implements ae
{
  public static final GroundOverlayOptionsCreator CREATOR = new GroundOverlayOptionsCreator();
  public static final float NO_DIMENSION = -1.0F;
  private final int T;
  private float fN;
  private float fU;
  private boolean fV = true;
  private BitmapDescriptor fX;
  private LatLng fY;
  private float fZ;
  private float ga;
  private LatLngBounds gb;
  private float gc = 0.0F;
  private float gd = 0.5F;
  private float ge = 0.5F;

  public GroundOverlayOptions()
  {
    this.T = 1;
  }

  GroundOverlayOptions(int paramInt, IBinder paramIBinder, LatLng paramLatLng, float paramFloat1, float paramFloat2, LatLngBounds paramLatLngBounds, float paramFloat3, float paramFloat4, boolean paramBoolean, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    this.T = paramInt;
    this.fX = new BitmapDescriptor(bc.a.j(paramIBinder));
    this.fY = paramLatLng;
    this.fZ = paramFloat1;
    this.ga = paramFloat2;
    this.gb = paramLatLngBounds;
    this.fN = paramFloat3;
    this.fU = paramFloat4;
    this.fV = paramBoolean;
    this.gc = paramFloat5;
    this.gd = paramFloat6;
    this.ge = paramFloat7;
  }

  private GroundOverlayOptions a(LatLng paramLatLng, float paramFloat1, float paramFloat2)
  {
    this.fY = paramLatLng;
    this.fZ = paramFloat1;
    this.ga = paramFloat2;
    return this;
  }

  public IBinder aX()
  {
    return this.fX.aD().asBinder();
  }

  public GroundOverlayOptions anchor(float paramFloat1, float paramFloat2)
  {
    this.gd = paramFloat1;
    this.ge = paramFloat2;
    return this;
  }

  public GroundOverlayOptions bearing(float paramFloat)
  {
    this.fN = ((360.0F + paramFloat % 360.0F) % 360.0F);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public float getAnchorU()
  {
    return this.gd;
  }

  public float getAnchorV()
  {
    return this.ge;
  }

  public float getBearing()
  {
    return this.fN;
  }

  public LatLngBounds getBounds()
  {
    return this.gb;
  }

  public float getHeight()
  {
    return this.ga;
  }

  public BitmapDescriptor getImage()
  {
    return this.fX;
  }

  public LatLng getLocation()
  {
    return this.fY;
  }

  public float getTransparency()
  {
    return this.gc;
  }

  public float getWidth()
  {
    return this.fZ;
  }

  public float getZIndex()
  {
    return this.fU;
  }

  public GroundOverlayOptions image(BitmapDescriptor paramBitmapDescriptor)
  {
    this.fX = paramBitmapDescriptor;
    return this;
  }

  public boolean isVisible()
  {
    return this.fV;
  }

  public GroundOverlayOptions position(LatLng paramLatLng, float paramFloat)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    if (this.gb == null)
    {
      bool2 = bool1;
      x.a(bool2, "Position has already been set using positionFromBounds");
      if (paramLatLng == null)
        break label60;
      bool3 = bool1;
      label26: x.b(bool3, "Location must be specified");
      if (paramFloat < 0.0F)
        break label66;
    }
    while (true)
    {
      x.b(bool1, "Width must be non-negative");
      return a(paramLatLng, paramFloat, -1.0F);
      bool2 = false;
      break;
      label60: bool3 = false;
      break label26;
      label66: bool1 = false;
    }
  }

  public GroundOverlayOptions position(LatLng paramLatLng, float paramFloat1, float paramFloat2)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    label29: boolean bool4;
    if (this.gb == null)
    {
      bool2 = bool1;
      x.a(bool2, "Position has already been set using positionFromBounds");
      if (paramLatLng == null)
        break label80;
      bool3 = bool1;
      x.b(bool3, "Location must be specified");
      if (paramFloat1 < 0.0F)
        break label86;
      bool4 = bool1;
      label46: x.b(bool4, "Width must be non-negative");
      if (paramFloat2 < 0.0F)
        break label92;
    }
    while (true)
    {
      x.b(bool1, "Height must be non-negative");
      return a(paramLatLng, paramFloat1, paramFloat2);
      bool2 = false;
      break;
      label80: bool3 = false;
      break label29;
      label86: bool4 = false;
      break label46;
      label92: bool1 = false;
    }
  }

  public GroundOverlayOptions positionFromBounds(LatLngBounds paramLatLngBounds)
  {
    if (this.fY == null);
    for (boolean bool = true; ; bool = false)
    {
      x.a(bool, "Position has already been set using position: " + this.fY);
      this.gb = paramLatLngBounds;
      return this;
    }
  }

  public GroundOverlayOptions transparency(float paramFloat)
  {
    if ((paramFloat >= 0.0F) && (paramFloat <= 1.0F));
    for (boolean bool = true; ; bool = false)
    {
      x.b(bool, "Transparency must be in the range [0..1]");
      this.gc = paramFloat;
      return this;
    }
  }

  public int u()
  {
    return this.T;
  }

  public GroundOverlayOptions visible(boolean paramBoolean)
  {
    this.fV = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      da.a(this, paramParcel, paramInt);
      return;
    }
    GroundOverlayOptionsCreator.a(this, paramParcel, paramInt);
  }

  public GroundOverlayOptions zIndex(float paramFloat)
  {
    this.fU = paramFloat;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.GroundOverlayOptions
 * JD-Core Version:    0.6.2
 */