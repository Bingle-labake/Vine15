package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.de;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public final class PolygonOptions
  implements ae
{
  public static final PolygonOptionsCreator CREATOR = new PolygonOptionsCreator();
  private final int T;
  private float fR = 10.0F;
  private int fS = -16777216;
  private int fT = 0;
  private float fU = 0.0F;
  private boolean fV = true;
  private final List<LatLng> gq;
  private final List<List<LatLng>> gr;
  private boolean gs = false;

  public PolygonOptions()
  {
    this.T = 1;
    this.gq = new ArrayList();
    this.gr = new ArrayList();
  }

  PolygonOptions(int paramInt1, List<LatLng> paramList, List paramList1, float paramFloat1, int paramInt2, int paramInt3, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.T = paramInt1;
    this.gq = paramList;
    this.gr = paramList1;
    this.fR = paramFloat1;
    this.fS = paramInt2;
    this.fT = paramInt3;
    this.fU = paramFloat2;
    this.fV = paramBoolean1;
    this.gs = paramBoolean2;
  }

  public List aZ()
  {
    return this.gr;
  }

  public PolygonOptions add(LatLng paramLatLng)
  {
    this.gq.add(paramLatLng);
    return this;
  }

  public PolygonOptions add(LatLng[] paramArrayOfLatLng)
  {
    this.gq.addAll(Arrays.asList(paramArrayOfLatLng));
    return this;
  }

  public PolygonOptions addAll(Iterable<LatLng> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      LatLng localLatLng = (LatLng)localIterator.next();
      this.gq.add(localLatLng);
    }
    return this;
  }

  public PolygonOptions addHole(Iterable<LatLng> paramIterable)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
      localArrayList.add((LatLng)localIterator.next());
    this.gr.add(localArrayList);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public PolygonOptions fillColor(int paramInt)
  {
    this.fT = paramInt;
    return this;
  }

  public PolygonOptions geodesic(boolean paramBoolean)
  {
    this.gs = paramBoolean;
    return this;
  }

  public int getFillColor()
  {
    return this.fT;
  }

  public List<List<LatLng>> getHoles()
  {
    return this.gr;
  }

  public List<LatLng> getPoints()
  {
    return this.gq;
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

  public boolean isGeodesic()
  {
    return this.gs;
  }

  public boolean isVisible()
  {
    return this.fV;
  }

  public PolygonOptions strokeColor(int paramInt)
  {
    this.fS = paramInt;
    return this;
  }

  public PolygonOptions strokeWidth(float paramFloat)
  {
    this.fR = paramFloat;
    return this;
  }

  public int u()
  {
    return this.T;
  }

  public PolygonOptions visible(boolean paramBoolean)
  {
    this.fV = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      de.a(this, paramParcel, paramInt);
      return;
    }
    PolygonOptionsCreator.a(this, paramParcel, paramInt);
  }

  public PolygonOptions zIndex(float paramFloat)
  {
    this.fU = paramFloat;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.PolygonOptions
 * JD-Core Version:    0.6.2
 */