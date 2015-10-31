package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.df;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public final class PolylineOptions
  implements ae
{
  public static final PolylineOptionsCreator CREATOR = new PolylineOptionsCreator();
  private int L = -16777216;
  private final int T;
  private float fU = 0.0F;
  private boolean fV = true;
  private float fZ = 10.0F;
  private final List<LatLng> gq;
  private boolean gs = false;

  public PolylineOptions()
  {
    this.T = 1;
    this.gq = new ArrayList();
  }

  PolylineOptions(int paramInt1, List paramList, float paramFloat1, int paramInt2, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.T = paramInt1;
    this.gq = paramList;
    this.fZ = paramFloat1;
    this.L = paramInt2;
    this.fU = paramFloat2;
    this.fV = paramBoolean1;
    this.gs = paramBoolean2;
  }

  public PolylineOptions add(LatLng paramLatLng)
  {
    this.gq.add(paramLatLng);
    return this;
  }

  public PolylineOptions add(LatLng[] paramArrayOfLatLng)
  {
    this.gq.addAll(Arrays.asList(paramArrayOfLatLng));
    return this;
  }

  public PolylineOptions addAll(Iterable<LatLng> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      LatLng localLatLng = (LatLng)localIterator.next();
      this.gq.add(localLatLng);
    }
    return this;
  }

  public PolylineOptions color(int paramInt)
  {
    this.L = paramInt;
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public PolylineOptions geodesic(boolean paramBoolean)
  {
    this.gs = paramBoolean;
    return this;
  }

  public int getColor()
  {
    return this.L;
  }

  public List<LatLng> getPoints()
  {
    return this.gq;
  }

  public float getWidth()
  {
    return this.fZ;
  }

  public float getZIndex()
  {
    return this.fU;
  }

  public boolean isGeodesic()
  {
    return this.gs;
  }

  public boolean isVisible()
  {
    return this.fV;
  }

  public int u()
  {
    return this.T;
  }

  public PolylineOptions visible(boolean paramBoolean)
  {
    this.fV = paramBoolean;
    return this;
  }

  public PolylineOptions width(float paramFloat)
  {
    this.fZ = paramFloat;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      df.a(this, paramParcel, paramInt);
      return;
    }
    PolylineOptionsCreator.a(this, paramParcel, paramInt);
  }

  public PolylineOptions zIndex(float paramFloat)
  {
    this.fU = paramFloat;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.PolylineOptions
 * JD-Core Version:    0.6.2
 */