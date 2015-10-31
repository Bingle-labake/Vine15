package com.google.android.gms.internal;

import android.net.Uri;
import android.net.Uri.Builder;

public final class y
{
  private static final Uri aY = new Uri.Builder().scheme("android.resource").authority("com.google.android.gms").appendPath("drawable").build();

  public static Uri i(String paramString)
  {
    x.b(paramString, "Resource name must not be null.");
    return aY.buildUpon().appendPath(paramString).build();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.y
 * JD-Core Version:    0.6.2
 */