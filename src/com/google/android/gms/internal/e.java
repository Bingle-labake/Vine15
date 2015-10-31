package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.appstate.AppState;
import com.google.android.gms.appstate.AppStateBuffer;
import com.google.android.gms.appstate.OnSignOutCompleteListener;
import com.google.android.gms.appstate.OnStateDeletedListener;
import com.google.android.gms.appstate.OnStateListLoadedListener;
import com.google.android.gms.appstate.OnStateLoadedListener;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;

public final class e extends p<g>
{
  private final String g;

  public e(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString, String[] paramArrayOfString)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, paramArrayOfString);
    this.g = ((String)x.d(paramString));
  }

  public void a(OnStateLoadedListener paramOnStateLoadedListener, int paramInt, byte[] paramArrayOfByte)
  {
    Object localObject;
    if (paramOnStateLoadedListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((g)o()).a((f)localObject, paramInt, paramArrayOfByte);
        return;
        e locale = new e(paramOnStateLoadedListener);
        localObject = locale;
      }
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
  }

  protected void a(u paramu, p<g>.d paramp)
    throws RemoteException
  {
    paramu.a(paramp, 3136100, getContext().getPackageName(), this.g, j());
  }

  protected void a(String[] paramArrayOfString)
  {
    int i = 0;
    boolean bool = false;
    while (i < paramArrayOfString.length)
    {
      if (paramArrayOfString[i].equals("https://www.googleapis.com/auth/appstate"))
        bool = true;
      i++;
    }
    x.a(bool, String.format("AppStateClient requires %s to function.", new Object[] { "https://www.googleapis.com/auth/appstate" }));
  }

  protected g b(IBinder paramIBinder)
  {
    return g.a.e(paramIBinder);
  }

  protected String b()
  {
    return "com.google.android.gms.appstate.service.START";
  }

  protected String c()
  {
    return "com.google.android.gms.appstate.internal.IAppStateService";
  }

  public void deleteState(OnStateDeletedListener paramOnStateDeletedListener, int paramInt)
  {
    try
    {
      ((g)o()).b(new a(paramOnStateDeletedListener), paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
  }

  public int getMaxNumKeys()
  {
    try
    {
      int i = ((g)o()).getMaxNumKeys();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
    return 2;
  }

  public int getMaxStateSize()
  {
    try
    {
      int i = ((g)o()).getMaxStateSize();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
    return 2;
  }

  public void listStates(OnStateListLoadedListener paramOnStateListLoadedListener)
  {
    try
    {
      ((g)o()).a(new c(paramOnStateListLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
  }

  public void loadState(OnStateLoadedListener paramOnStateLoadedListener, int paramInt)
  {
    try
    {
      ((g)o()).a(new e(paramOnStateLoadedListener), paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
  }

  public void resolveState(OnStateLoadedListener paramOnStateLoadedListener, int paramInt, String paramString, byte[] paramArrayOfByte)
  {
    try
    {
      ((g)o()).a(new e(paramOnStateLoadedListener), paramInt, paramString, paramArrayOfByte);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
  }

  public void signOut(OnSignOutCompleteListener paramOnSignOutCompleteListener)
  {
    Object localObject;
    if (paramOnSignOutCompleteListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((g)o()).b((f)localObject);
        return;
        g localg = new g(paramOnSignOutCompleteListener);
        localObject = localg;
      }
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AppStateClient", "service died");
    }
  }

  final class a extends d
  {
    private final OnStateDeletedListener n;

    public a(OnStateDeletedListener arg2)
    {
      Object localObject;
      this.n = ((OnStateDeletedListener)x.b(localObject, "Listener must not be null"));
    }

    public void onStateDeleted(int paramInt1, int paramInt2)
    {
      e.this.a(new e.b(e.this, this.n, paramInt1, paramInt2));
    }
  }

  final class b extends p<g>.b<OnStateDeletedListener>
  {
    private final int p;
    private final int q;

    public b(OnStateDeletedListener paramInt1, int paramInt2, int arg4)
    {
      super(paramInt1);
      this.p = paramInt2;
      int i;
      this.q = i;
    }

    public void a(OnStateDeletedListener paramOnStateDeletedListener)
    {
      paramOnStateDeletedListener.onStateDeleted(this.p, this.q);
    }
  }

  final class c extends d
  {
    private final OnStateListLoadedListener r;

    public c(OnStateListLoadedListener arg2)
    {
      Object localObject;
      this.r = ((OnStateListLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void a(k paramk)
    {
      e.this.a(new e.d(e.this, this.r, paramk));
    }
  }

  final class d extends p<g>.c<OnStateListLoadedListener>
  {
    public d(OnStateListLoadedListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(OnStateListLoadedListener paramOnStateListLoadedListener)
    {
      paramOnStateListLoadedListener.onStateListLoaded(this.O.getStatusCode(), new AppStateBuffer(this.O));
    }
  }

  final class e extends d
  {
    private final OnStateLoadedListener s;

    public e(OnStateLoadedListener arg2)
    {
      Object localObject;
      this.s = ((OnStateLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void a(int paramInt, k paramk)
    {
      e.this.a(new e.f(e.this, this.s, paramInt, paramk));
    }
  }

  final class f extends p<g>.c<OnStateLoadedListener>
  {
    private final int q;

    public f(OnStateLoadedListener paramInt, int paramk, k arg4)
    {
      super(paramInt, localk);
      this.q = paramk;
    }

    public void a(OnStateLoadedListener paramOnStateLoadedListener)
    {
      AppStateBuffer localAppStateBuffer = new AppStateBuffer(this.O);
      while (true)
      {
        int i;
        try
        {
          if (localAppStateBuffer.getCount() <= 0)
            break label117;
          AppState localAppState = localAppStateBuffer.get(0);
          str = localAppState.getConflictVersion();
          arrayOfByte2 = localAppState.getLocalData();
          byte[] arrayOfByte3 = localAppState.getConflictData();
          arrayOfByte1 = arrayOfByte3;
          localAppStateBuffer.close();
          i = this.O.getStatusCode();
          if (i == 2000)
          {
            paramOnStateLoadedListener.onStateConflict(this.q, str, arrayOfByte2, arrayOfByte1);
            return;
          }
        }
        finally
        {
          localAppStateBuffer.close();
        }
        paramOnStateLoadedListener.onStateLoaded(i, this.q, arrayOfByte2);
        return;
        label117: byte[] arrayOfByte1 = null;
        byte[] arrayOfByte2 = null;
        String str = null;
      }
    }
  }

  final class g extends d
  {
    private final OnSignOutCompleteListener t;

    public g(OnSignOutCompleteListener arg2)
    {
      Object localObject;
      this.t = ((OnSignOutCompleteListener)x.b(localObject, "Listener must not be null"));
    }

    public void onSignOutComplete()
    {
      e.this.a(new e.h(e.this, this.t));
    }
  }

  final class h extends p<g>.b<OnSignOutCompleteListener>
  {
    public h(OnSignOutCompleteListener arg2)
    {
      super(localObject);
    }

    public void a(OnSignOutCompleteListener paramOnSignOutCompleteListener)
    {
      paramOnSignOutCompleteListener.onSignOutComplete();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.e
 * JD-Core Version:    0.6.2
 */