package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.cx;
import com.google.android.gms.internal.db;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;
import com.google.android.gms.internal.x;

public final class LatLngBounds
  implements ae
{
  public static final LatLngBoundsCreator CREATOR = new LatLngBoundsCreator();
  private final int T;
  public final LatLng northeast;
  public final LatLng southwest;

  LatLngBounds(int paramInt, LatLng paramLatLng1, LatLng paramLatLng2)
  {
    x.b(paramLatLng1, "null southwest");
    x.b(paramLatLng2, "null northeast");
    if (paramLatLng2.latitude >= paramLatLng1.latitude);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Double.valueOf(paramLatLng1.latitude);
      arrayOfObject[1] = Double.valueOf(paramLatLng2.latitude);
      x.a(bool, "southern latitude exceeds northern latitude (%s > %s)", arrayOfObject);
      this.T = paramInt;
      this.southwest = paramLatLng1;
      this.northeast = paramLatLng2;
      return;
    }
  }

  public LatLngBounds(LatLng paramLatLng1, LatLng paramLatLng2)
  {
    this(1, paramLatLng1, paramLatLng2);
  }

  private boolean a(double paramDouble)
  {
    return (this.southwest.latitude <= paramDouble) && (paramDouble <= this.northeast.latitude);
  }

  private static double b(double paramDouble1, double paramDouble2)
  {
    return (360.0D + (paramDouble1 - paramDouble2)) % 360.0D;
  }

  private boolean b(double paramDouble)
  {
    if (this.southwest.longitude <= this.northeast.longitude)
      return (this.southwest.longitude <= paramDouble) && (paramDouble <= this.northeast.longitude);
    boolean bool1;
    if (this.southwest.longitude > paramDouble)
    {
      boolean bool2 = paramDouble < this.northeast.longitude;
      bool1 = false;
      if (bool2);
    }
    else
    {
      bool1 = true;
    }
    return bool1;
  }

  public static Builder builder()
  {
    return new Builder();
  }

  private static double c(double paramDouble1, double paramDouble2)
  {
    return (360.0D + (paramDouble2 - paramDouble1)) % 360.0D;
  }

  public boolean contains(LatLng paramLatLng)
  {
    return (a(paramLatLng.latitude)) && (b(paramLatLng.longitude));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    LatLngBounds localLatLngBounds;
    do
    {
      return true;
      if (!(paramObject instanceof LatLngBounds))
        return false;
      localLatLngBounds = (LatLngBounds)paramObject;
    }
    while ((this.southwest.equals(localLatLngBounds.southwest)) && (this.northeast.equals(localLatLngBounds.northeast)));
    return false;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.southwest;
    arrayOfObject[1] = this.northeast;
    return w.hashCode(arrayOfObject);
  }

  public LatLngBounds including(LatLng paramLatLng)
  {
    double d1 = Math.min(this.southwest.latitude, paramLatLng.latitude);
    double d2 = Math.max(this.northeast.latitude, paramLatLng.latitude);
    double d3 = this.northeast.longitude;
    double d4 = this.southwest.longitude;
    double d5 = paramLatLng.longitude;
    double d6;
    if (!b(d5))
      if (b(d4, d5) < c(d3, d5))
        d6 = d3;
    while (true)
    {
      return new LatLngBounds(new LatLng(d1, d5), new LatLng(d2, d6));
      d6 = d5;
      d5 = d4;
      continue;
      d5 = d4;
      d6 = d3;
    }
  }

  public String toString()
  {
    return w.c(this).a("southwest", this.southwest).a("northeast", this.northeast).toString();
  }

  public int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      db.a(this, paramParcel, paramInt);
      return;
    }
    LatLngBoundsCreator.a(this, paramParcel, paramInt);
  }

  public static final class Builder
  {
    private double gf = (1.0D / 0.0D);
    private double gg = (-1.0D / 0.0D);
    private double gh = (0.0D / 0.0D);
    private double gi = (0.0D / 0.0D);

    private boolean b(double paramDouble)
    {
      if (this.gh <= this.gi)
        return (this.gh <= paramDouble) && (paramDouble <= this.gi);
      boolean bool1;
      if (this.gh > paramDouble)
      {
        boolean bool2 = paramDouble < this.gi;
        bool1 = false;
        if (bool2);
      }
      else
      {
        bool1 = true;
      }
      return bool1;
    }

    public LatLngBounds build()
    {
      if (!Double.isNaN(this.gh));
      for (boolean bool = true; ; bool = false)
      {
        x.a(bool, "no included points");
        return new LatLngBounds(new LatLng(this.gf, this.gh), new LatLng(this.gg, this.gi));
      }
    }

    public Builder include(LatLng paramLatLng)
    {
      this.gf = Math.min(this.gf, paramLatLng.latitude);
      this.gg = Math.max(this.gg, paramLatLng.latitude);
      double d = paramLatLng.longitude;
      if (Double.isNaN(this.gh))
      {
        this.gh = d;
        this.gi = d;
      }
      while (b(d))
        return this;
      if (LatLngBounds.d(this.gh, d) < LatLngBounds.e(this.gi, d))
      {
        this.gh = d;
        return this;
      }
      this.gi = d;
      return this;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.LatLngBounds
 * JD-Core Version:    0.6.2
 */