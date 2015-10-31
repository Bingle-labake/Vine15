package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.Context;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class cd
{
  private final ch<cc> eE;
  private ContentProviderClient eF = null;
  private HashMap<LocationListener, b> eG = new HashMap();
  private final ContentResolver mContentResolver;

  public cd(Context paramContext, ch<cc> paramch)
  {
    this.eE = paramch;
    this.mContentResolver = paramContext.getContentResolver();
  }

  public Location getLastLocation()
  {
    this.eE.n();
    try
    {
      Location localLocation = ((cc)this.eE.o()).ay();
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void removeAllListeners()
  {
    try
    {
      synchronized (this.eG)
      {
        Iterator localIterator = this.eG.values().iterator();
        while (localIterator.hasNext())
        {
          b localb = (b)localIterator.next();
          if (localb != null)
            ((cc)this.eE.o()).a(localb);
        }
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
    this.eG.clear();
  }

  public void removeLocationUpdates(PendingIntent paramPendingIntent)
  {
    this.eE.n();
    try
    {
      ((cc)this.eE.o()).a(paramPendingIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void removeLocationUpdates(LocationListener paramLocationListener)
  {
    this.eE.n();
    x.b(paramLocationListener, "Invalid null listener");
    synchronized (this.eG)
    {
      b localb = (b)this.eG.remove(paramLocationListener);
      if ((this.eF != null) && (this.eG.isEmpty()))
      {
        this.eF.release();
        this.eF = null;
      }
      if (localb != null);
      try
      {
        ((cc)this.eE.o()).a(localb);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new IllegalStateException(localRemoteException);
      }
    }
  }

  public void requestLocationUpdates(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
  {
    this.eE.n();
    try
    {
      ((cc)this.eE.o()).a(paramLocationRequest, paramPendingIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void requestLocationUpdates(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
  {
    this.eE.n();
    if (paramLooper == null)
      x.b(Looper.myLooper(), "Can't create handler inside thread that has not called Looper.prepare()");
    while (true)
    {
      b localb1;
      synchronized (this.eG)
      {
        localb1 = (b)this.eG.get(paramLocationListener);
        if (localb1 == null)
        {
          localb2 = new b(paramLocationListener, paramLooper);
          this.eG.put(paramLocationListener, localb2);
          try
          {
            ((cc)this.eE.o()).a(paramLocationRequest, localb2);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            throw new IllegalStateException(localRemoteException);
          }
        }
      }
      b localb2 = localb1;
    }
  }

  static class a extends Handler
  {
    private final LocationListener eH;

    public a(LocationListener paramLocationListener)
    {
      this.eH = paramLocationListener;
    }

    public a(LocationListener paramLocationListener, Looper paramLooper)
    {
      super();
      this.eH = paramLocationListener;
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default:
        Log.e("LocationClientHelper", "unknown message in LocationHandler.handleMessage");
        return;
      case 1:
      }
      Location localLocation = new Location((Location)paramMessage.obj);
      this.eH.onLocationChanged(localLocation);
    }
  }

  static class b extends ca.a
  {
    private final Handler eI;

    b(LocationListener paramLocationListener, Looper paramLooper)
    {
      if (paramLooper == null);
      for (cd.a locala = new cd.a(paramLocationListener); ; locala = new cd.a(paramLocationListener, paramLooper))
      {
        this.eI = locala;
        return;
      }
    }

    public void onLocationChanged(Location paramLocation)
    {
      Message localMessage = Message.obtain();
      localMessage.what = 1;
      localMessage.obj = paramLocation;
      this.eI.sendMessage(localMessage);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.cd
 * JD-Core Version:    0.6.2
 */