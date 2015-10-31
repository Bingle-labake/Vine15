package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.util.ArrayList;

public abstract class p<T extends IInterface>
  implements GooglePlayServicesClient
{
  public static final String[] aE = { "service_esmobile", "service_googleme" };
  private p<T>.e aA;
  boolean aB = false;
  boolean aC = false;
  private final Object aD = new Object();
  private T at;
  private ArrayList<GooglePlayServicesClient.ConnectionCallbacks> au;
  final ArrayList<GooglePlayServicesClient.ConnectionCallbacks> av = new ArrayList();
  private boolean aw = false;
  private ArrayList<GooglePlayServicesClient.OnConnectionFailedListener> ax;
  private boolean ay = false;
  private final ArrayList<p<T>.b<?>> az = new ArrayList();
  private final String[] f;
  private final Context mContext;
  final Handler mHandler;

  protected p(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String[] paramArrayOfString)
  {
    this.mContext = ((Context)x.d(paramContext));
    this.au = new ArrayList();
    this.au.add(x.d(paramConnectionCallbacks));
    this.ax = new ArrayList();
    this.ax.add(x.d(paramOnConnectionFailedListener));
    this.mHandler = new a(paramContext.getMainLooper());
    a(paramArrayOfString);
    this.f = paramArrayOfString;
  }

  protected void a(ConnectionResult paramConnectionResult)
  {
    this.mHandler.removeMessages(4);
    while (true)
    {
      int j;
      synchronized (this.ax)
      {
        this.ay = true;
        ArrayList localArrayList2 = this.ax;
        int i = localArrayList2.size();
        j = 0;
        if (j < i)
        {
          if (!this.aB)
            return;
          if (this.ax.contains(localArrayList2.get(j)))
            ((GooglePlayServicesClient.OnConnectionFailedListener)localArrayList2.get(j)).onConnectionFailed(paramConnectionResult);
        }
        else
        {
          this.ay = false;
          return;
        }
      }
      j++;
    }
  }

  public final void a(p<T>.b<?> paramp)
  {
    this.mHandler.sendMessage(this.mHandler.obtainMessage(2, paramp));
  }

  protected abstract void a(u paramu, p<T>.d paramp)
    throws RemoteException;

  protected void a(String[] paramArrayOfString)
  {
  }

  protected abstract String b();

  protected abstract T c(IBinder paramIBinder);

  protected abstract String c();

  public void connect()
  {
    this.aB = true;
    do
    {
      synchronized (this.aD)
      {
        this.aC = true;
        int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.mContext);
        if (i != 0)
        {
          this.mHandler.sendMessage(this.mHandler.obtainMessage(3, Integer.valueOf(i)));
          return;
        }
      }
      if (this.aA != null)
      {
        Log.e("GmsClient", "Calling connect() while still connected, missing disconnect().");
        this.at = null;
        q.e(this.mContext).b(b(), this.aA);
      }
      this.aA = new e();
    }
    while (q.e(this.mContext).a(b(), this.aA));
    Log.e("GmsClient", "unable to connect to service: " + b());
    this.mHandler.sendMessage(this.mHandler.obtainMessage(3, Integer.valueOf(9)));
  }

  public void disconnect()
  {
    this.aB = false;
    synchronized (this.aD)
    {
      this.aC = false;
    }
    synchronized (this.az)
    {
      int i = this.az.size();
      int j = 0;
      while (j < i)
      {
        ((b)this.az.get(j)).q();
        j++;
        continue;
        localObject2 = finally;
        throw localObject2;
      }
      this.az.clear();
      this.at = null;
      if (this.aA != null)
      {
        q.e(this.mContext).b(b(), this.aA);
        this.aA = null;
      }
      return;
    }
  }

  protected final void f(IBinder paramIBinder)
  {
    try
    {
      a(u.a.h(paramIBinder), new d());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("GmsClient", "service died");
    }
  }

  public final Context getContext()
  {
    return this.mContext;
  }

  public boolean isConnected()
  {
    return this.at != null;
  }

  public boolean isConnecting()
  {
    synchronized (this.aD)
    {
      boolean bool = this.aC;
      return bool;
    }
  }

  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    x.d(paramConnectionCallbacks);
    synchronized (this.au)
    {
      boolean bool = this.au.contains(paramConnectionCallbacks);
      return bool;
    }
  }

  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    x.d(paramOnConnectionFailedListener);
    synchronized (this.ax)
    {
      boolean bool = this.ax.contains(paramOnConnectionFailedListener);
      return bool;
    }
  }

  public final String[] j()
  {
    return this.f;
  }

  protected void k()
  {
    boolean bool1 = true;
    while (true)
    {
      int j;
      synchronized (this.au)
      {
        if (!this.aw)
        {
          bool2 = bool1;
          x.a(bool2);
          this.mHandler.removeMessages(4);
          this.aw = true;
          if (this.av.size() != 0)
            break label165;
          x.a(bool1);
          Bundle localBundle = l();
          ArrayList localArrayList2 = this.au;
          int i = localArrayList2.size();
          j = 0;
          if ((j >= i) || (!this.aB) || (!isConnected()))
          {
            this.av.clear();
            this.aw = false;
            return;
          }
          this.av.size();
          if (this.av.contains(localArrayList2.get(j)))
            break label170;
          ((GooglePlayServicesClient.ConnectionCallbacks)localArrayList2.get(j)).onConnected(localBundle);
        }
      }
      boolean bool2 = false;
      continue;
      label165: bool1 = false;
      continue;
      label170: j++;
    }
  }

  protected Bundle l()
  {
    return null;
  }

  protected final void m()
  {
    this.mHandler.removeMessages(4);
    while (true)
    {
      int j;
      synchronized (this.au)
      {
        this.aw = true;
        ArrayList localArrayList2 = this.au;
        int i = localArrayList2.size();
        j = 0;
        if ((j >= i) || (!this.aB))
        {
          this.aw = false;
          return;
        }
        if (this.au.contains(localArrayList2.get(j)))
          ((GooglePlayServicesClient.ConnectionCallbacks)localArrayList2.get(j)).onDisconnected();
      }
      j++;
    }
  }

  protected final void n()
  {
    if (!isConnected())
      throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
  }

  protected final T o()
  {
    n();
    return this.at;
  }

  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    x.d(paramConnectionCallbacks);
    synchronized (this.au)
    {
      if (this.au.contains(paramConnectionCallbacks))
      {
        Log.w("GmsClient", "registerConnectionCallbacks(): listener " + paramConnectionCallbacks + " is already registered");
        if (isConnected())
          this.mHandler.sendMessage(this.mHandler.obtainMessage(4, paramConnectionCallbacks));
        return;
      }
      if (this.aw)
        this.au = new ArrayList(this.au);
      this.au.add(paramConnectionCallbacks);
    }
  }

  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    x.d(paramOnConnectionFailedListener);
    synchronized (this.ax)
    {
      if (this.ax.contains(paramOnConnectionFailedListener))
      {
        Log.w("GmsClient", "registerConnectionFailedListener(): listener " + paramOnConnectionFailedListener + " is already registered");
        return;
      }
      if (this.ay)
        this.ax = new ArrayList(this.ax);
      this.ax.add(paramOnConnectionFailedListener);
    }
  }

  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    x.d(paramConnectionCallbacks);
    synchronized (this.au)
    {
      if (this.au != null)
      {
        if (this.aw)
          this.au = new ArrayList(this.au);
        if (this.au.remove(paramConnectionCallbacks))
          break label87;
        Log.w("GmsClient", "unregisterConnectionCallbacks(): listener " + paramConnectionCallbacks + " not found");
      }
      label87: 
      while ((!this.aw) || (this.av.contains(paramConnectionCallbacks)))
        return;
      this.av.add(paramConnectionCallbacks);
    }
  }

  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    x.d(paramOnConnectionFailedListener);
    synchronized (this.ax)
    {
      if (this.ax != null)
      {
        if (this.ay)
          this.ax = new ArrayList(this.ax);
        if (!this.ax.remove(paramOnConnectionFailedListener))
          Log.w("GmsClient", "unregisterConnectionFailedListener(): listener " + paramOnConnectionFailedListener + " not found");
      }
      return;
    }
  }

  final class a extends Handler
  {
    public a(Looper arg2)
    {
      super();
    }

    public void handleMessage(Message paramMessage)
    {
      do
      {
        synchronized (p.a(p.this))
        {
          p.this.aC = false;
          if (paramMessage.what == 3)
          {
            p.this.a(new ConnectionResult(((Integer)paramMessage.obj).intValue(), null));
            return;
          }
        }
        if (paramMessage.what == 4)
          synchronized (p.b(p.this))
          {
            if ((p.this.aB) && (p.this.isConnected()) && (p.b(p.this).contains(paramMessage.obj)))
              ((GooglePlayServicesClient.ConnectionCallbacks)paramMessage.obj).onConnected(p.this.l());
            return;
          }
      }
      while (((paramMessage.what == 2) && (!p.this.isConnected())) || ((paramMessage.what != 2) && (paramMessage.what != 1)));
      ((p.b)paramMessage.obj).p();
    }
  }

  public abstract class b<TListener>
  {
    private TListener mListener;

    public b()
    {
      Object localObject1;
      this.mListener = localObject1;
      synchronized (p.c(p.this))
      {
        p.c(p.this).add(this);
        return;
      }
    }

    protected abstract void a(TListener paramTListener);

    public void p()
    {
      try
      {
        Object localObject2 = this.mListener;
        a(localObject2);
        return;
      }
      finally
      {
      }
    }

    public void q()
    {
      try
      {
        this.mListener = null;
        return;
      }
      finally
      {
      }
    }
  }

  public abstract class c<TListener> extends p<T>.b<TListener>
  {
    protected final k O;

    public c(k arg2)
    {
      super(localObject1);
      Object localObject2;
      this.O = localObject2;
    }

    protected abstract void a(TListener paramTListener);
  }

  public final class d extends t.a
  {
    protected d()
    {
    }

    public void a(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      p.this.mHandler.sendMessage(p.this.mHandler.obtainMessage(1, new p.f(p.this, paramInt, paramIBinder, paramBundle)));
    }
  }

  final class e
    implements ServiceConnection
  {
    e()
    {
    }

    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      p.this.f(paramIBinder);
    }

    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      p.a(p.this, null);
      p.this.m();
    }
  }

  public final class f extends p<T>.b<Boolean>
  {
    public final Bundle aG;
    public final IBinder aH;
    public final int statusCode;

    public f(int paramIBinder, IBinder paramBundle, Bundle arg4)
    {
      super(Boolean.valueOf(true));
      this.statusCode = paramIBinder;
      this.aH = paramBundle;
      Object localObject;
      this.aG = localObject;
    }

    protected void a(Boolean paramBoolean)
    {
      if (paramBoolean == null)
        return;
      switch (this.statusCode)
      {
      default:
        Bundle localBundle = this.aG;
        PendingIntent localPendingIntent = null;
        if (localBundle != null)
          localPendingIntent = (PendingIntent)this.aG.getParcelable("pendingIntent");
        p.this.a(new ConnectionResult(this.statusCode, localPendingIntent));
        return;
      case 0:
        try
        {
          String str = this.aH.getInterfaceDescriptor();
          if (p.this.c().equals(str))
          {
            p.a(p.this, p.this.c(this.aH));
            if (p.d(p.this) != null)
            {
              p.this.k();
              return;
            }
          }
        }
        catch (RemoteException localRemoteException)
        {
          q.e(p.f(p.this)).b(p.this.b(), p.e(p.this));
          p.a(p.this, null);
          p.a(p.this, null);
          p.this.a(new ConnectionResult(8, null));
          return;
        }
      case 10:
      }
      throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.p
 * JD-Core Version:    0.6.2
 */