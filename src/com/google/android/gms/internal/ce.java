package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.location.LocationClient.OnAddGeofencesResultListener;
import com.google.android.gms.location.LocationClient.OnRemoveGeofencesResultListener;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationStatusCodes;
import java.util.List;

public class ce extends p<cc>
{
  private final ch<cc> eE = new c(null);
  private final cd eJ = new cd(paramContext, this.eE);
  private final String eK;

  public ce(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, new String[0]);
    this.eK = paramString;
  }

  protected void a(u paramu, p<cc>.d paramp)
    throws RemoteException
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("client_name", this.eK);
    paramu.e(paramp, 3136100, getContext().getPackageName(), localBundle);
  }

  public void addGeofences(List<cf> paramList, PendingIntent paramPendingIntent, LocationClient.OnAddGeofencesResultListener paramOnAddGeofencesResultListener)
  {
    n();
    if ((paramList != null) && (paramList.size() > 0));
    for (boolean bool = true; ; bool = false)
    {
      x.b(bool, "At least one geofence must be specified.");
      x.b(paramPendingIntent, "PendingIntent must be specified.");
      x.b(paramOnAddGeofencesResultListener, "OnAddGeofencesResultListener not provided.");
      Object localObject;
      if (paramOnAddGeofencesResultListener == null)
        localObject = null;
      try
      {
        while (true)
        {
          ((cc)o()).a(paramList, paramPendingIntent, (cb)localObject, getContext().getPackageName());
          return;
          b localb = new b(paramOnAddGeofencesResultListener);
          localObject = localb;
        }
      }
      catch (RemoteException localRemoteException)
      {
        throw new IllegalStateException(localRemoteException);
      }
    }
  }

  protected String b()
  {
    return "com.google.android.location.internal.GoogleLocationManagerService.START";
  }

  protected String c()
  {
    return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
  }

  public void disconnect()
  {
    synchronized (this.eJ)
    {
      if (isConnected())
        this.eJ.removeAllListeners();
      super.disconnect();
      return;
    }
  }

  public Location getLastLocation()
  {
    return this.eJ.getLastLocation();
  }

  protected cc q(IBinder paramIBinder)
  {
    return cc.a.p(paramIBinder);
  }

  public void removeActivityUpdates(PendingIntent paramPendingIntent)
  {
    n();
    x.d(paramPendingIntent);
    try
    {
      ((cc)o()).removeActivityUpdates(paramPendingIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void removeGeofences(PendingIntent paramPendingIntent, LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener)
  {
    n();
    x.b(paramPendingIntent, "PendingIntent must be specified.");
    x.b(paramOnRemoveGeofencesResultListener, "OnRemoveGeofencesResultListener not provided.");
    Object localObject;
    if (paramOnRemoveGeofencesResultListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((cc)o()).a(paramPendingIntent, (cb)localObject, getContext().getPackageName());
        return;
        b localb = new b(paramOnRemoveGeofencesResultListener);
        localObject = localb;
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void removeGeofences(List<String> paramList, LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener)
  {
    n();
    if ((paramList != null) && (paramList.size() > 0));
    for (boolean bool = true; ; bool = false)
    {
      x.b(bool, "geofenceRequestIds can't be null nor empty.");
      x.b(paramOnRemoveGeofencesResultListener, "OnRemoveGeofencesResultListener not provided.");
      String[] arrayOfString = (String[])paramList.toArray(new String[0]);
      Object localObject;
      if (paramOnRemoveGeofencesResultListener == null)
        localObject = null;
      try
      {
        while (true)
        {
          ((cc)o()).a(arrayOfString, (cb)localObject, getContext().getPackageName());
          return;
          b localb = new b(paramOnRemoveGeofencesResultListener);
          localObject = localb;
        }
      }
      catch (RemoteException localRemoteException)
      {
        throw new IllegalStateException(localRemoteException);
      }
    }
  }

  public void removeLocationUpdates(PendingIntent paramPendingIntent)
  {
    this.eJ.removeLocationUpdates(paramPendingIntent);
  }

  public void removeLocationUpdates(LocationListener paramLocationListener)
  {
    this.eJ.removeLocationUpdates(paramLocationListener);
  }

  public void requestActivityUpdates(long paramLong, PendingIntent paramPendingIntent)
  {
    boolean bool = true;
    n();
    x.d(paramPendingIntent);
    if (paramLong >= 0L);
    while (true)
    {
      x.b(bool, "detectionIntervalMillis must be >= 0");
      try
      {
        ((cc)o()).a(paramLong, true, paramPendingIntent);
        return;
        bool = false;
      }
      catch (RemoteException localRemoteException)
      {
        throw new IllegalStateException(localRemoteException);
      }
    }
  }

  public void requestLocationUpdates(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
  {
    this.eJ.requestLocationUpdates(paramLocationRequest, paramPendingIntent);
  }

  public void requestLocationUpdates(LocationRequest paramLocationRequest, LocationListener paramLocationListener)
  {
    requestLocationUpdates(paramLocationRequest, paramLocationListener, null);
  }

  public void requestLocationUpdates(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
  {
    synchronized (this.eJ)
    {
      this.eJ.requestLocationUpdates(paramLocationRequest, paramLocationListener, paramLooper);
      return;
    }
  }

  final class a extends p<cc>.b<LocationClient.OnAddGeofencesResultListener>
  {
    private final String[] eL;
    private final int p;

    public a(LocationClient.OnAddGeofencesResultListener paramInt, int paramArrayOfString, String[] arg4)
    {
      super(paramInt);
      this.p = LocationStatusCodes.J(paramArrayOfString);
      Object localObject;
      this.eL = localObject;
    }

    protected void a(LocationClient.OnAddGeofencesResultListener paramOnAddGeofencesResultListener)
    {
      if (paramOnAddGeofencesResultListener != null)
        paramOnAddGeofencesResultListener.onAddGeofencesResult(this.p, this.eL);
    }
  }

  final class b extends cb.a
  {
    private final LocationClient.OnAddGeofencesResultListener eN;
    private final LocationClient.OnRemoveGeofencesResultListener eO;

    public b(LocationClient.OnAddGeofencesResultListener arg2)
    {
      Object localObject;
      this.eN = localObject;
      this.eO = null;
    }

    public b(LocationClient.OnRemoveGeofencesResultListener arg2)
    {
      Object localObject;
      this.eO = localObject;
      this.eN = null;
    }

    public void onAddGeofencesResult(int paramInt, String[] paramArrayOfString)
      throws RemoteException
    {
      ce.this.a(new ce.a(ce.this, this.eN, paramInt, paramArrayOfString));
    }

    public void onRemoveGeofencesByPendingIntentResult(int paramInt, PendingIntent paramPendingIntent)
    {
      ce.this.a(new ce.d(ce.this, 1, this.eO, paramInt, paramPendingIntent));
    }

    public void onRemoveGeofencesByRequestIdsResult(int paramInt, String[] paramArrayOfString)
    {
      ce.this.a(new ce.d(ce.this, 2, this.eO, paramInt, paramArrayOfString));
    }
  }

  final class c
    implements ch<cc>
  {
    private c()
    {
    }

    public cc az()
    {
      return (cc)ce.b(ce.this);
    }

    public void n()
    {
      ce.a(ce.this);
    }
  }

  final class d extends p<cc>.b<LocationClient.OnRemoveGeofencesResultListener>
  {
    private final String[] eL;
    private final int eP;
    private final PendingIntent mPendingIntent;
    private final int p;

    public d(int paramOnRemoveGeofencesResultListener, LocationClient.OnRemoveGeofencesResultListener paramInt1, int paramPendingIntent, PendingIntent arg5)
    {
      super(paramInt1);
      if (paramOnRemoveGeofencesResultListener == localOnRemoveGeofencesResultListener);
      while (true)
      {
        n.a(localOnRemoveGeofencesResultListener);
        this.eP = paramOnRemoveGeofencesResultListener;
        this.p = LocationStatusCodes.J(paramPendingIntent);
        Object localObject;
        this.mPendingIntent = localObject;
        this.eL = null;
        return;
        int i = 0;
      }
    }

    public d(int paramOnRemoveGeofencesResultListener, LocationClient.OnRemoveGeofencesResultListener paramInt1, int paramArrayOfString, String[] arg5)
    {
      super(paramInt1);
      if (paramOnRemoveGeofencesResultListener == 2);
      for (boolean bool = true; ; bool = false)
      {
        n.a(bool);
        this.eP = paramOnRemoveGeofencesResultListener;
        this.p = LocationStatusCodes.J(paramArrayOfString);
        Object localObject;
        this.eL = localObject;
        this.mPendingIntent = null;
        return;
      }
    }

    protected void a(LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener)
    {
      if (paramOnRemoveGeofencesResultListener != null);
      switch (this.eP)
      {
      default:
        Log.wtf("LocationClientImpl", "Unsupported action: " + this.eP);
        return;
      case 1:
        paramOnRemoveGeofencesResultListener.onRemoveGeofencesByPendingIntentResult(this.p, this.mPendingIntent);
        return;
      case 2:
      }
      paramOnRemoveGeofencesResultListener.onRemoveGeofencesByRequestIdsResult(this.p, this.eL);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ce
 * JD-Core Version:    0.6.2
 */