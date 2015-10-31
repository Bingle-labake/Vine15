package com.flurry.android;

public class FlurryAgent$FlurryDefaultExceptionHandler
  implements Thread.UncaughtExceptionHandler
{
  private Thread.UncaughtExceptionHandler bH = Thread.getDefaultUncaughtExceptionHandler();

  public void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    try
    {
      FlurryAgent.az.a(paramThrowable);
      if (this.bH != null)
        this.bH.uncaughtException(paramThread, paramThrowable);
      return;
    }
    catch (Throwable localThrowable)
    {
      while (true)
        db.b("FlurryAgent", "", localThrowable);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FlurryAgent.FlurryDefaultExceptionHandler
 * JD-Core Version:    0.6.2
 */