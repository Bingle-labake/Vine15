package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.internal.ae;

public class DetectedActivity
  implements ae
{
  public static final DetectedActivityCreator CREATOR = new DetectedActivityCreator();
  public static final int IN_VEHICLE = 0;
  public static final int ON_BICYCLE = 1;
  public static final int ON_FOOT = 2;
  public static final int STILL = 3;
  public static final int TILTING = 5;
  public static final int UNKNOWN = 4;
  int T = 1;
  int eq;
  int er;

  public DetectedActivity()
  {
  }

  public DetectedActivity(int paramInt1, int paramInt2)
  {
    this();
    this.eq = paramInt1;
    this.er = paramInt2;
  }

  private int G(int paramInt)
  {
    if (paramInt > 5)
      paramInt = 4;
    return paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getConfidence()
  {
    return this.er;
  }

  public int getType()
  {
    return G(this.eq);
  }

  public String toString()
  {
    return "DetectedActivity [type=" + getType() + ", confidence=" + this.er + "]";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    DetectedActivityCreator.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.DetectedActivity
 * JD-Core Version:    0.6.2
 */