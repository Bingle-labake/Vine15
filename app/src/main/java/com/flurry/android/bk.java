package com.flurry.android;

abstract class bk
  implements Runnable
{
  public abstract void a();

  public final void run()
  {
    try
    {
      a();
      return;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      db.b("FlurryAgent", "", localThrowable);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bk
 * JD-Core Version:    0.6.2
 */