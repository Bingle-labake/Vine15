package org.apache.commons.io;

class ThreadMonitor
  implements Runnable
{
  private final Thread thread;
  private final long timeout;

  private ThreadMonitor(Thread paramThread, long paramLong)
  {
    this.thread = paramThread;
    this.timeout = paramLong;
  }

  public static Thread start(long paramLong)
  {
    return start(Thread.currentThread(), paramLong);
  }

  public static Thread start(Thread paramThread, long paramLong)
  {
    boolean bool = paramLong < 0L;
    Thread localThread = null;
    if (bool)
    {
      localThread = new Thread(new ThreadMonitor(paramThread, paramLong), ThreadMonitor.class.getSimpleName());
      localThread.setDaemon(true);
      localThread.start();
    }
    return localThread;
  }

  public static void stop(Thread paramThread)
  {
    if (paramThread != null)
      paramThread.interrupt();
  }

  public void run()
  {
    try
    {
      Thread.sleep(this.timeout);
      this.thread.interrupt();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.ThreadMonitor
 * JD-Core Version:    0.6.2
 */