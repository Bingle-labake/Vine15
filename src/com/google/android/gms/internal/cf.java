package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.location.Geofence;

public class cf
  implements ae, Geofence
{
  public static final cg CREATOR = new cg();
  private final int T;
  private final long eQ;
  private final String es;
  private final int et;
  private final short ev;
  private final double ew;
  private final double ex;
  private final float ey;

  public cf(int paramInt1, String paramString, int paramInt2, short paramShort, double paramDouble1, double paramDouble2, float paramFloat, long paramLong)
  {
    w(paramString);
    b(paramFloat);
    a(paramDouble1, paramDouble2);
    int i = K(paramInt2);
    this.T = paramInt1;
    this.ev = paramShort;
    this.es = paramString;
    this.ew = paramDouble1;
    this.ex = paramDouble2;
    this.ey = paramFloat;
    this.eQ = paramLong;
    this.et = i;
  }

  public cf(String paramString, int paramInt, short paramShort, double paramDouble1, double paramDouble2, float paramFloat, long paramLong)
  {
    this(1, paramString, paramInt, paramShort, paramDouble1, paramDouble2, paramFloat, paramLong);
  }

  private static int K(int paramInt)
  {
    int i = paramInt & 0x3;
    if (i == 0)
      throw new IllegalArgumentException("No supported transition specified: " + paramInt);
    return i;
  }

  private static String L(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return null;
    case 1:
    }
    return "CIRCLE";
  }

  private static void a(double paramDouble1, double paramDouble2)
  {
    if ((paramDouble1 > 90.0D) || (paramDouble1 < -90.0D))
      throw new IllegalArgumentException("invalid latitude: " + paramDouble1);
    if ((paramDouble2 > 180.0D) || (paramDouble2 < -180.0D))
      throw new IllegalArgumentException("invalid longitude: " + paramDouble2);
  }

  private static void b(float paramFloat)
  {
    if (paramFloat <= 0.0F)
      throw new IllegalArgumentException("invalid radius: " + paramFloat);
  }

  public static cf c(byte[] paramArrayOfByte)
  {
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(paramArrayOfByte, 0, paramArrayOfByte.length);
    localParcel.setDataPosition(0);
    cf localcf = CREATOR.t(localParcel);
    localParcel.recycle();
    return localcf;
  }

  private static void w(String paramString)
  {
    if ((paramString == null) || (paramString.length() > 100))
      throw new IllegalArgumentException("requestId is null or too long: " + paramString);
  }

  public short aA()
  {
    return this.ev;
  }

  public float aB()
  {
    return this.ey;
  }

  public int aC()
  {
    return this.et;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    cf localcf;
    do
    {
      return true;
      if (paramObject == null)
        return false;
      if (!(paramObject instanceof cf))
        return false;
      localcf = (cf)paramObject;
      if (this.ey != localcf.ey)
        return false;
      if (this.ew != localcf.ew)
        return false;
      if (this.ex != localcf.ex)
        return false;
    }
    while (this.ev == localcf.ev);
    return false;
  }

  public long getExpirationTime()
  {
    return this.eQ;
  }

  public double getLatitude()
  {
    return this.ew;
  }

  public double getLongitude()
  {
    return this.ex;
  }

  public String getRequestId()
  {
    return this.es;
  }

  public int hashCode()
  {
    long l1 = Double.doubleToLongBits(this.ew);
    int i = 31 + (int)(l1 ^ l1 >>> 32);
    long l2 = Double.doubleToLongBits(this.ex);
    return 31 * (31 * (31 * (i * 31 + (int)(l2 ^ l2 >>> 32)) + Float.floatToIntBits(this.ey)) + this.ev) + this.et;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = L(this.ev);
    arrayOfObject[1] = this.es;
    arrayOfObject[2] = Integer.valueOf(this.et);
    arrayOfObject[3] = Double.valueOf(this.ew);
    arrayOfObject[4] = Double.valueOf(this.ex);
    arrayOfObject[5] = Float.valueOf(this.ey);
    arrayOfObject[6] = Long.valueOf(this.eQ);
    return String.format("Geofence[%s id:%s transitions:%d %.6f, %.6f %.0fm, @%d]", arrayOfObject);
  }

  public int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    cg.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.cf
 * JD-Core Version:    0.6.2
 */