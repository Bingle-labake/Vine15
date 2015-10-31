package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.cz;

public final class CircleOptions
  implements ae
{
  public static final CircleOptionsCreator CREATOR = new CircleOptionsCreator();
  private final int T;
  private LatLng fP = null;
  private double fQ = 0.0D;
  private float fR = 10.0F;
  private int fS = -16777216;
  private int fT = 0;
  private float fU = 0.0F;
  private boolean fV = true;

  public CircleOptions()
  {
    this.T = 1;
  }

  CircleOptions(int paramInt1, LatLng paramLatLng, double paramDouble, float paramFloat1, int paramInt2, int paramInt3, float paramFloat2, boolean paramBoolean)
  {
    this.T = paramInt1;
    this.fP = paramLatLng;
    this.fQ = paramDouble;
    this.fR = paramFloat1;
    this.fS = paramInt2;
    this.fT = paramInt3;
    this.fU = paramFloat2;
    this.fV = paramBoolean;
  }

  public CircleOptions center(LatLng paramLatLng)
  {
    this.fP = paramLatLng;
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public CircleOptions fillColor(int paramInt)
  {
    this.fT = paramInt;
    return this;
  }

  public LatLng getCenter()
  {
    return this.fP;
  }

  public int getFillColor()
  {
    return this.fT;
  }

  public double getRadius()
  {
    return this.fQ;
  }

  public int getStrokeColor()
  {
    return this.fS;
  }

  public float getStrokeWidth()
  {
    return this.fR;
  }

  public float getZIndex()
  {
    return this.fU;
  }

  public boolean isVisible()
  {
    return this.fV;
  }

  public CircleOptions radius(double paramDouble)
  {
    this.fQ = paramDouble;
    return this;
  }

  public CircleOptions strokeColor(int paramInt)
  {
    this.fS = paramInt;
    return this;
  }

  public CircleOptions strokeWidth(float paramFloat)
  {
    this.fR = paramFloat;
    return this;
  }

  public int u()
  {
    return this.T;
  }

  public CircleOptions visible(boolean paramBoolean)
  {
    this.fV = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      cz.a(this, paramParcel, paramInt);
      return;
    }
    CircleOptionsCreator.a(this, paramParcel, paramInt);
  }

  public CircleOptions zIndex(float paramFloat)
  {
    this.fU = paramFloat;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.CircleOptions
 * JD-Core Version:    0.6.2
 */