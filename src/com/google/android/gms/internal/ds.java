package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.panorama.PanoramaClient.OnPanoramaInfoLoadedListener;
import com.google.android.gms.panorama.PanoramaClient.a;

public class ds extends p<dr>
{
  public ds(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, (String[])null);
  }

  public dr T(IBinder paramIBinder)
  {
    return dr.a.S(paramIBinder);
  }

  public void a(b paramb, Uri paramUri, Bundle paramBundle, boolean paramBoolean)
  {
    n();
    if (paramBoolean)
      getContext().grantUriPermission("com.google.android.gms", paramUri, 1);
    try
    {
      ((dr)o()).a(paramb, paramUri, paramBundle, paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      paramb.a(8, null, 0, null);
    }
  }

  protected void a(u paramu, p<dr>.d paramp)
    throws RemoteException
  {
    Bundle localBundle = new Bundle();
    paramu.a(paramp, 3136100, getContext().getPackageName(), localBundle);
  }

  public void a(PanoramaClient.OnPanoramaInfoLoadedListener paramOnPanoramaInfoLoadedListener, Uri paramUri, boolean paramBoolean)
  {
    if (paramBoolean);
    for (Uri localUri = paramUri; ; localUri = null)
    {
      a(new b(paramOnPanoramaInfoLoadedListener, localUri), paramUri, null, paramBoolean);
      return;
    }
  }

  protected String b()
  {
    return "com.google.android.gms.panorama.service.START";
  }

  protected String c()
  {
    return "com.google.android.gms.panorama.internal.IPanoramaService";
  }

  final class a extends p<dr>.b<PanoramaClient.a>
  {
    public final ConnectionResult gD;
    public final Intent gE;
    public final int type;

    public a(PanoramaClient.a paramConnectionResult, ConnectionResult paramInt, int paramIntent, Intent arg5)
    {
      super(paramConnectionResult);
      this.gD = paramInt;
      this.type = paramIntent;
      Object localObject;
      this.gE = localObject;
    }

    protected void a(PanoramaClient.a parama)
    {
      if (parama != null)
        parama.a(this.gD, this.type, this.gE);
    }
  }

  final class b extends dq.a
  {
    private final PanoramaClient.a gG = null;
    private final PanoramaClient.OnPanoramaInfoLoadedListener gH;
    private final Uri gI;

    public b(PanoramaClient.OnPanoramaInfoLoadedListener paramUri, Uri arg3)
    {
      this.gH = paramUri;
      Object localObject;
      this.gI = localObject;
    }

    public void a(int paramInt1, Bundle paramBundle, int paramInt2, Intent paramIntent)
    {
      if (this.gI != null)
        ds.this.getContext().revokeUriPermission(this.gI, 1);
      PendingIntent localPendingIntent = null;
      if (paramBundle != null)
        localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent");
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt1, localPendingIntent);
      if (this.gG != null)
      {
        ds.this.a(new ds.a(ds.this, this.gG, localConnectionResult, paramInt2, paramIntent));
        return;
      }
      ds.this.a(new ds.c(ds.this, this.gH, localConnectionResult, paramIntent));
    }
  }

  final class c extends p<dr>.b<PanoramaClient.OnPanoramaInfoLoadedListener>
  {
    private final ConnectionResult gD;
    private final Intent gE;

    public c(PanoramaClient.OnPanoramaInfoLoadedListener paramConnectionResult, ConnectionResult paramIntent, Intent arg4)
    {
      super(paramConnectionResult);
      this.gD = paramIntent;
      Object localObject;
      this.gE = localObject;
    }

    protected void a(PanoramaClient.OnPanoramaInfoLoadedListener paramOnPanoramaInfoLoadedListener)
    {
      if (paramOnPanoramaInfoLoadedListener != null)
        paramOnPanoramaInfoLoadedListener.onPanoramaInfoLoaded(this.gD, this.gE);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ds
 * JD-Core Version:    0.6.2
 */