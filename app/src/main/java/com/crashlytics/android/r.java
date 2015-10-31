package com.crashlytics.android;

import android.os.AsyncTask;

final class r extends AsyncTask<Void, Void, Void>
{
  r(CrashTest paramCrashTest, long paramLong)
  {
  }

  private Void a()
  {
    try
    {
      Thread.sleep(this.a);
      label7: this.b.throwRuntimeException("Background thread crash");
      return null;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label7;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.r
 * JD-Core Version:    0.6.2
 */