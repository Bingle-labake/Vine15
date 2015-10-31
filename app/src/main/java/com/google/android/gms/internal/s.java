package com.google.android.gms.internal;

import android.util.Log;

public final class s
{
  private final String aV;

  public s(String paramString)
  {
    this.aV = ((String)x.d(paramString));
  }

  public void a(String paramString1, String paramString2)
  {
    if (i(3))
      Log.d(paramString1, paramString2);
  }

  public void a(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (i(6))
      Log.e(paramString1, paramString2, paramThrowable);
  }

  public void b(String paramString1, String paramString2)
  {
    if (i(5))
      Log.w(paramString1, paramString2);
  }

  public void c(String paramString1, String paramString2)
  {
    if (i(6))
      Log.e(paramString1, paramString2);
  }

  public void d(String paramString1, String paramString2)
  {
    if (i(4));
  }

  public boolean i(int paramInt)
  {
    return Log.isLoggable(this.aV, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.s
 * JD-Core Version:    0.6.2
 */