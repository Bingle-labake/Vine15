package co.vine.android.service;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import co.vine.android.VineAccountAuthenticator;

public class VineAuthenticationService extends Service
{
  private VineAccountAuthenticator mAuthenticator;

  public IBinder onBind(Intent paramIntent)
  {
    return this.mAuthenticator.getIBinder();
  }

  public void onCreate()
  {
    super.onCreate();
    this.mAuthenticator = new VineAccountAuthenticator(this);
  }

  public void onDestroy()
  {
    super.onDestroy();
    this.mAuthenticator = null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.VineAuthenticationService
 * JD-Core Version:    0.6.2
 */