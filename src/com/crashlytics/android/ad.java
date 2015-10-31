package com.crashlytics.android;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

final class ad
  implements ThreadFactory
{
  ad(String paramString, AtomicLong paramAtomicLong)
  {
  }

  public final Thread newThread(Runnable paramRunnable)
  {
    Thread localThread = Executors.defaultThreadFactory().newThread(paramRunnable);
    String str = this.a;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Long.valueOf(this.b.getAndIncrement());
    localThread.setName(String.format(str, arrayOfObject));
    return localThread;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.ad
 * JD-Core Version:    0.6.2
 */