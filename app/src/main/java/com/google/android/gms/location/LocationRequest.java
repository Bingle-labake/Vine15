package com.google.android.gms.location;

import android.os.Parcel;
import android.os.SystemClock;
import com.google.android.gms.internal.ae;

public final class LocationRequest
  implements ae
{
  public static final LocationRequestCreator CREATOR = new LocationRequestCreator();
  public static final int PRIORITY_BALANCED_POWER_ACCURACY = 102;
  public static final int PRIORITY_HIGH_ACCURACY = 100;
  public static final int PRIORITY_NO_POWER = 105;
  int T;
  long eA = ()(this.ez / 6.0D);
  boolean eB = false;
  int eC = 2147483647;
  float eD = 0.0F;
  long eu = 9223372036854775807L;
  long ez = 3600000L;
  int mPriority = 102;

  private static void H(int paramInt)
  {
    switch (paramInt)
    {
    case 101:
    case 103:
    default:
      throw new IllegalArgumentException("invalid quality: " + paramInt);
    case 100:
    case 102:
    case 104:
    case 105:
    }
  }

  public static String I(int paramInt)
  {
    switch (paramInt)
    {
    case 101:
    case 103:
    default:
      return "???";
    case 100:
      return "PRIORITY_HIGH_ACCURACY";
    case 102:
      return "PRIORITY_BALANCED_POWER_ACCURACY";
    case 104:
    }
    return "PRIORITY_LOW_POWER";
  }

  private static void a(float paramFloat)
  {
    if (paramFloat < 0.0F)
      throw new IllegalArgumentException("invalid displacement: " + paramFloat);
  }

  private static void c(long paramLong)
  {
    if (paramLong < 0L)
      throw new IllegalArgumentException("invalid interval: " + paramLong);
  }

  public static LocationRequest create()
  {
    return new LocationRequest();
  }

  public int describeContents()
  {
    return 0;
  }

  public long getExpirationTime()
  {
    return this.eu;
  }

  public long getFastestInterval()
  {
    return this.eA;
  }

  public long getInterval()
  {
    return this.ez;
  }

  public int getNumUpdates()
  {
    return this.eC;
  }

  public int getPriority()
  {
    return this.mPriority;
  }

  public float getSmallestDisplacement()
  {
    return this.eD;
  }

  public LocationRequest setExpirationDuration(long paramLong)
  {
    long l = SystemClock.elapsedRealtime();
    if (paramLong > 9223372036854775807L - l);
    for (this.eu = 9223372036854775807L; ; this.eu = (l + paramLong))
    {
      if (this.eu < 0L)
        this.eu = 0L;
      return this;
    }
  }

  public LocationRequest setExpirationTime(long paramLong)
  {
    this.eu = paramLong;
    if (this.eu < 0L)
      this.eu = 0L;
    return this;
  }

  public LocationRequest setFastestInterval(long paramLong)
  {
    c(paramLong);
    this.eB = true;
    this.eA = paramLong;
    return this;
  }

  public LocationRequest setInterval(long paramLong)
  {
    c(paramLong);
    this.ez = paramLong;
    if (!this.eB)
      this.eA = (()(this.ez / 6.0D));
    return this;
  }

  public LocationRequest setNumUpdates(int paramInt)
  {
    if (paramInt <= 0)
      throw new IllegalArgumentException("invalid numUpdates: " + paramInt);
    this.eC = paramInt;
    return this;
  }

  public LocationRequest setPriority(int paramInt)
  {
    H(paramInt);
    this.mPriority = paramInt;
    return this;
  }

  public LocationRequest setSmallestDisplacement(float paramFloat)
  {
    a(paramFloat);
    this.eD = paramFloat;
    return this;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Request[").append(I(this.mPriority));
    if (this.mPriority != 105)
    {
      localStringBuilder.append(" requested=");
      localStringBuilder.append(this.ez + "ms");
    }
    localStringBuilder.append(" fastest=");
    localStringBuilder.append(this.eA + "ms");
    if (this.eu != 9223372036854775807L)
    {
      long l = this.eu - SystemClock.elapsedRealtime();
      localStringBuilder.append(" expireIn=");
      localStringBuilder.append(l + "ms");
    }
    if (this.eC != 2147483647)
      localStringBuilder.append(" num=").append(this.eC);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    LocationRequestCreator.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.LocationRequest
 * JD-Core Version:    0.6.2
 */