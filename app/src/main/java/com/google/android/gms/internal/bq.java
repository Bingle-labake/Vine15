package com.google.android.gms.internal;

public final class bq
{
  public static String B(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Unknown time span " + paramInt);
    case 0:
      return "DAILY";
    case 1:
      return "WEEKLY";
    case 2:
    }
    return "ALL_TIME";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bq
 * JD-Core Version:    0.6.2
 */