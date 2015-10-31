package com.google.android.gms.internal;

public final class bp
{
  public static String B(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Unknown leaderboard collection: " + paramInt);
    case 0:
      return "PUBLIC";
    case 1:
    }
    return "SOCIAL";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bp
 * JD-Core Version:    0.6.2
 */