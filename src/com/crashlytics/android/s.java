package com.crashlytics.android;

final class s
  implements Runnable
{
  s(long paramLong, String paramString)
  {
  }

  public final void run()
  {
    Crashlytics.a(Crashlytics.s()).a(this.a, this.b);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.s
 * JD-Core Version:    0.6.2
 */