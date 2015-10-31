package com.google.android.gms.location;

import android.app.PendingIntent;
import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.ce;

public class ActivityRecognitionClient
  implements GooglePlayServicesClient
{
  private final ce em;

  public ActivityRecognitionClient(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.em = new ce(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, "activity_recognition");
  }

  public void connect()
  {
    this.em.connect();
  }

  public void disconnect()
  {
    this.em.disconnect();
  }

  public boolean isConnected()
  {
    return this.em.isConnected();
  }

  public boolean isConnecting()
  {
    return this.em.isConnecting();
  }

  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.em.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }

  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.em.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }

  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.em.registerConnectionCallbacks(paramConnectionCallbacks);
  }

  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.em.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }

  public void removeActivityUpdates(PendingIntent paramPendingIntent)
  {
    this.em.removeActivityUpdates(paramPendingIntent);
  }

  public void requestActivityUpdates(long paramLong, PendingIntent paramPendingIntent)
  {
    this.em.requestActivityUpdates(paramLong, paramPendingIntent);
  }

  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.em.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }

  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.em.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.ActivityRecognitionClient
 * JD-Core Version:    0.6.2
 */