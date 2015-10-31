package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.IBinder;
import android.os.Message;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public final class q
  implements Handler.Callback
{
  private static q aI;
  private final Context aJ;
  private final HashMap<String, a> aK = new HashMap();
  private final Handler mHandler = new Handler(paramContext.getMainLooper(), this);

  private q(Context paramContext)
  {
    this.aJ = paramContext.getApplicationContext();
  }

  public static q e(Context paramContext)
  {
    if (aI == null)
      aI = new q(paramContext.getApplicationContext());
    return aI;
  }

  public boolean a(String paramString, p<?>.e paramp)
  {
    while (true)
    {
      a locala;
      synchronized (this.aK)
      {
        locala = (a)this.aK.get(paramString);
        if (locala == null)
        {
          locala = new a(paramString);
          locala.a(paramp);
          locala.b(this.aJ.bindService(new Intent(paramString), locala.r(), 129));
          this.aK.put(paramString, locala);
          boolean bool = locala.isBound();
          return bool;
        }
        this.mHandler.removeMessages(0, locala);
        if (locala.c(paramp))
          throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  startServiceAction=" + paramString);
      }
      locala.a(paramp);
      switch (locala.getState())
      {
      case 1:
        paramp.onServiceConnected(locala.getComponentName(), locala.getBinder());
        break;
      case 2:
        Intent localIntent = new Intent(paramString);
        locala.b(this.aJ.bindService(localIntent, locala.r(), 129));
      }
    }
  }

  public void b(String paramString, p<?>.e paramp)
  {
    a locala;
    synchronized (this.aK)
    {
      locala = (a)this.aK.get(paramString);
      if (locala == null)
        throw new IllegalStateException("Nonexistent connection status for service action: " + paramString);
    }
    if (!locala.c(paramp))
      throw new IllegalStateException("Trying to unbind a GmsServiceConnection  that was not bound before.  startServiceAction=" + paramString);
    locala.b(paramp);
    if (locala.t())
    {
      Message localMessage = this.mHandler.obtainMessage(0, locala);
      this.mHandler.sendMessageDelayed(localMessage, 5000L);
    }
  }

  public boolean handleMessage(Message paramMessage)
  {
    switch (paramMessage.what)
    {
    default:
      return false;
    case 0:
    }
    a locala = (a)paramMessage.obj;
    synchronized (this.aK)
    {
      if (locala.t())
      {
        this.aJ.unbindService(locala.r());
        this.aK.remove(locala.s());
      }
      return true;
    }
  }

  final class a
  {
    private final String aL;
    private final a aM;
    private final HashSet<p<?>.e> aN;
    private boolean aO;
    private IBinder aP;
    private ComponentName aQ;
    private int mState;

    public a(String arg2)
    {
      Object localObject;
      this.aL = localObject;
      this.aM = new a();
      this.aN = new HashSet();
      this.mState = 0;
    }

    public void a(p<?>.e paramp)
    {
      this.aN.add(paramp);
    }

    public void b(p<?>.e paramp)
    {
      this.aN.remove(paramp);
    }

    public void b(boolean paramBoolean)
    {
      this.aO = paramBoolean;
    }

    public boolean c(p<?>.e paramp)
    {
      return this.aN.contains(paramp);
    }

    public IBinder getBinder()
    {
      return this.aP;
    }

    public ComponentName getComponentName()
    {
      return this.aQ;
    }

    public int getState()
    {
      return this.mState;
    }

    public boolean isBound()
    {
      return this.aO;
    }

    public a r()
    {
      return this.aM;
    }

    public String s()
    {
      return this.aL;
    }

    public boolean t()
    {
      return this.aN.isEmpty();
    }

    public class a
      implements ServiceConnection
    {
      public a()
      {
      }

      public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
      {
        synchronized (q.a(q.this))
        {
          q.a.a(q.a.this, paramIBinder);
          q.a.a(q.a.this, paramComponentName);
          Iterator localIterator = q.a.a(q.a.this).iterator();
          if (localIterator.hasNext())
            ((p.e)localIterator.next()).onServiceConnected(paramComponentName, paramIBinder);
        }
        q.a.a(q.a.this, 1);
      }

      public void onServiceDisconnected(ComponentName paramComponentName)
      {
        synchronized (q.a(q.this))
        {
          q.a.a(q.a.this, null);
          q.a.a(q.a.this, paramComponentName);
          Iterator localIterator = q.a.a(q.a.this).iterator();
          if (localIterator.hasNext())
            ((p.e)localIterator.next()).onServiceDisconnected(paramComponentName);
        }
        q.a.a(q.a.this, 2);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.q
 * JD-Core Version:    0.6.2
 */