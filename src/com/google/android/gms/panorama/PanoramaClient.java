package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.ds;

public class PanoramaClient
  implements GooglePlayServicesClient
{
  private final ds gC;

  public PanoramaClient(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.gC = new ds(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }

  public void connect()
  {
    this.gC.connect();
  }

  public void disconnect()
  {
    this.gC.disconnect();
  }

  public boolean isConnected()
  {
    return this.gC.isConnected();
  }

  public boolean isConnecting()
  {
    return this.gC.isConnecting();
  }

  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.gC.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }

  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.gC.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }

  public void loadPanoramaInfo(OnPanoramaInfoLoadedListener paramOnPanoramaInfoLoadedListener, Uri paramUri)
  {
    this.gC.a(paramOnPanoramaInfoLoadedListener, paramUri, false);
  }

  public void loadPanoramaInfoAndGrantAccess(OnPanoramaInfoLoadedListener paramOnPanoramaInfoLoadedListener, Uri paramUri)
  {
    this.gC.a(paramOnPanoramaInfoLoadedListener, paramUri, true);
  }

  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.gC.registerConnectionCallbacks(paramConnectionCallbacks);
  }

  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.gC.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }

  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.gC.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }

  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.gC.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }

  public static abstract interface OnPanoramaInfoLoadedListener
  {
    public abstract void onPanoramaInfoLoaded(ConnectionResult paramConnectionResult, Intent paramIntent);
  }

  public static abstract interface a
  {
    public abstract void a(ConnectionResult paramConnectionResult, int paramInt, Intent paramIntent);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.panorama.PanoramaClient
 * JD-Core Version:    0.6.2
 */