package com.google.android.gms.location;

import android.os.SystemClock;
import com.google.android.gms.internal.cf;

public abstract interface Geofence
{
  public static final int GEOFENCE_TRANSITION_ENTER = 1;
  public static final int GEOFENCE_TRANSITION_EXIT = 2;
  public static final long NEVER_EXPIRE = -1L;

  public abstract String getRequestId();

  public static final class Builder
  {
    private String es = null;
    private int et = 0;
    private long eu = -9223372036854775808L;
    private short ev = -1;
    private double ew;
    private double ex;
    private float ey;

    public Geofence build()
    {
      if (this.es == null)
        throw new IllegalArgumentException("Request ID not set.");
      if (this.et == 0)
        throw new IllegalArgumentException("Transitions types not set.");
      if (this.eu == -9223372036854775808L)
        throw new IllegalArgumentException("Expiration not set.");
      if (this.ev == -1)
        throw new IllegalArgumentException("Geofence region not set.");
      return new cf(this.es, this.et, (short)1, this.ew, this.ex, this.ey, this.eu);
    }

    public Builder setCircularRegion(double paramDouble1, double paramDouble2, float paramFloat)
    {
      this.ev = 1;
      this.ew = paramDouble1;
      this.ex = paramDouble2;
      this.ey = paramFloat;
      return this;
    }

    public Builder setExpirationDuration(long paramLong)
    {
      if (paramLong < 0L)
      {
        this.eu = -1L;
        return this;
      }
      this.eu = (paramLong + SystemClock.elapsedRealtime());
      return this;
    }

    public Builder setRequestId(String paramString)
    {
      this.es = paramString;
      return this;
    }

    public Builder setTransitionTypes(int paramInt)
    {
      this.et = paramInt;
      return this;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.Geofence
 * JD-Core Version:    0.6.2
 */