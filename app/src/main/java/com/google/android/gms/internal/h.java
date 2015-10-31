package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class h
  implements ServiceConnection
{
  boolean u = false;
  private final BlockingQueue<IBinder> v = new LinkedBlockingQueue();

  public IBinder d()
    throws InterruptedException
  {
    if (this.u)
      throw new IllegalStateException();
    this.u = true;
    return (IBinder)this.v.take();
  }

  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    try
    {
      this.v.put(paramIBinder);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
    }
  }

  public void onServiceDisconnected(ComponentName paramComponentName)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.h
 * JD-Core Version:    0.6.2
 */