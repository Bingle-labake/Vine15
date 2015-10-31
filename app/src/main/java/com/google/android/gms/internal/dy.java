package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.plus.PlusClient.OnAccessRevokedListener;
import com.google.android.gms.plus.PlusClient.OnMomentsLoadedListener;
import com.google.android.gms.plus.PlusClient.OnPeopleLoadedListener;
import com.google.android.gms.plus.PlusClient.OnPersonLoadedListener;
import com.google.android.gms.plus.PlusClient.a;
import com.google.android.gms.plus.PlusClient.b;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.io.IOException;

public class dy extends p<dx>
{
  private final String g;
  private final String[] gN;
  private final String ha;
  private final String hb;
  private Person hc;
  private final String[] hd;

  public dy(Context paramContext, String paramString1, String paramString2, String paramString3, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, paramArrayOfString3);
    this.ha = paramString1;
    this.hb = paramString2;
    this.g = paramString3;
    this.hd = paramArrayOfString1;
    this.gN = paramArrayOfString2;
  }

  protected dx W(IBinder paramIBinder)
  {
    return dx.a.V(paramIBinder);
  }

  protected void a(u paramu, p<dx>.d paramp)
    throws RemoteException
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("skip_oob", false);
    localBundle.putStringArray("request_visible_actions", this.hd);
    if (this.gN != null)
      localBundle.putStringArray("required_features", this.gN);
    paramu.a(new i(paramp), 3136100, this.ha, this.hb, j(), this.g, localBundle);
  }

  public void a(PlusClient.a parama, Uri paramUri, int paramInt)
  {
    n();
    Bundle localBundle = new Bundle();
    localBundle.putInt("bounding_box", paramInt);
    c localc = new c(parama);
    try
    {
      ((dx)o()).a(localc, paramUri, localBundle);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localc.a(8, null, null);
    }
  }

  public void a(PlusClient.b paramb, String paramString)
  {
    n();
    j localj = new j(paramb);
    try
    {
      ((dx)o()).a(localj, paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localj.a(8, null, null);
    }
  }

  protected String b()
  {
    return "com.google.android.gms.plus.service.START";
  }

  protected String c()
  {
    return "com.google.android.gms.plus.internal.IPlusService";
  }

  public void clearDefaultAccount()
  {
    n();
    try
    {
      this.hc = null;
      ((dx)o()).clearDefaultAccount();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public String getAccountName()
  {
    n();
    try
    {
      String str = ((dx)o()).getAccountName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public Person getCurrentPerson()
  {
    n();
    return this.hc;
  }

  public void loadMoments(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
  {
    n();
    a locala = new a(paramOnMomentsLoadedListener);
    try
    {
      ((dx)o()).a(locala, paramInt, paramString1, paramUri, paramString2, paramString3);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      locala.a(k.e(8), null, null);
    }
  }

  public void loadPeople(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    n();
    e locale = new e(paramOnPeopleLoadedListener);
    try
    {
      ((dx)o()).a(locale, paramInt1, paramInt2, paramInt3, paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      locale.a(k.e(8), null);
    }
  }

  public void loadPerson(PlusClient.OnPersonLoadedListener paramOnPersonLoadedListener, String paramString)
  {
    n();
    g localg = new g(paramOnPersonLoadedListener);
    try
    {
      ((dx)o()).e(localg, paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localg.a(8, null, null);
    }
  }

  public void removeMoment(String paramString)
  {
    n();
    try
    {
      ((dx)o()).removeMoment(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void revokeAccessAndDisconnect(PlusClient.OnAccessRevokedListener paramOnAccessRevokedListener)
  {
    n();
    clearDefaultAccount();
    l locall = new l(paramOnAccessRevokedListener);
    try
    {
      ((dx)o()).c(locall);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void writeMoment(Moment paramMoment)
  {
    n();
    try
    {
      at localat = at.a((ef)paramMoment);
      ((dx)o()).a(localat);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  final class a extends dv
  {
    private final PlusClient.OnMomentsLoadedListener he;

    public a(PlusClient.OnMomentsLoadedListener arg2)
    {
      Object localObject;
      this.he = localObject;
    }

    public void a(k paramk, String paramString1, String paramString2)
    {
      if (paramk.h() != null)
        paramk.h().getParcelable("pendingIntent");
      ConnectionResult localConnectionResult = new ConnectionResult(paramk.getStatusCode(), null);
      dy.this.a(new dy.b(dy.this, this.he, localConnectionResult, paramk, paramString1, paramString2));
    }
  }

  final class b extends p<dx>.c<PlusClient.OnMomentsLoadedListener>
  {
    private final ConnectionResult hg;
    private final String hh;
    private final String hi;

    public b(PlusClient.OnMomentsLoadedListener paramConnectionResult, ConnectionResult paramk, k paramString1, String paramString2, String arg6)
    {
      super(paramConnectionResult, paramString1);
      this.hg = paramk;
      this.hh = paramString2;
      Object localObject;
      this.hi = localObject;
    }

    protected void a(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener)
    {
      if (paramOnMomentsLoadedListener != null)
        paramOnMomentsLoadedListener.onMomentsLoaded(this.hg, new MomentBuffer(this.O), this.hh, this.hi);
    }
  }

  final class c extends dv
  {
    private final PlusClient.a hj;

    public c(PlusClient.a arg2)
    {
      Object localObject;
      this.hj = localObject;
    }

    public void a(int paramInt, Bundle paramBundle, ParcelFileDescriptor paramParcelFileDescriptor)
    {
      PendingIntent localPendingIntent = null;
      if (paramBundle != null)
        localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent");
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent);
      dy.this.a(new dy.d(dy.this, this.hj, localConnectionResult, paramParcelFileDescriptor));
    }
  }

  final class d extends p<dx>.b<PlusClient.a>
  {
    private final ConnectionResult hg;
    private final ParcelFileDescriptor hk;

    public d(PlusClient.a paramConnectionResult, ConnectionResult paramParcelFileDescriptor, ParcelFileDescriptor arg4)
    {
      super(paramConnectionResult);
      this.hg = paramParcelFileDescriptor;
      Object localObject;
      this.hk = localObject;
    }

    public void a(PlusClient.a parama)
    {
      if (parama != null)
      {
        parama.a(this.hg, this.hk);
        return;
      }
      try
      {
        this.hk.close();
        return;
      }
      catch (IOException localIOException)
      {
        Log.e("PlusClientImpl", "failed close", localIOException);
      }
    }

    public void q()
    {
      super.q();
    }
  }

  final class e extends dv
  {
    private final PlusClient.OnPeopleLoadedListener hl;

    public e(PlusClient.OnPeopleLoadedListener arg2)
    {
      Object localObject;
      this.hl = localObject;
    }

    public void a(k paramk, String paramString)
    {
      if (paramk.h() != null)
        paramk.h().getParcelable("pendingIntent");
      ConnectionResult localConnectionResult = new ConnectionResult(paramk.getStatusCode(), null);
      dy.this.a(new dy.f(dy.this, this.hl, localConnectionResult, paramk, paramString));
    }
  }

  final class f extends p<dx>.c<PlusClient.OnPeopleLoadedListener>
  {
    private final ConnectionResult hg;
    private final String hh;

    public f(PlusClient.OnPeopleLoadedListener paramConnectionResult, ConnectionResult paramk, k paramString, String arg5)
    {
      super(paramConnectionResult, paramString);
      this.hg = paramk;
      Object localObject;
      this.hh = localObject;
    }

    protected void a(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener)
    {
      if (paramOnPeopleLoadedListener != null)
        paramOnPeopleLoadedListener.onPeopleLoaded(this.hg, new PersonBuffer(this.O), this.hh);
    }
  }

  final class g extends dv
  {
    private final PlusClient.OnPersonLoadedListener hm;

    public g(PlusClient.OnPersonLoadedListener arg2)
    {
      Object localObject;
      this.hm = localObject;
    }

    public void a(int paramInt, Bundle paramBundle, at paramat)
    {
      if (paramBundle != null);
      for (PendingIntent localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent);
        if (paramat == null)
        {
          dy.this.a(new dy.h(dy.this, this.hm, localConnectionResult, null));
          return;
        }
        eq localeq = (eq)paramat.a(eq.CREATOR);
        dy.this.a(new dy.h(dy.this, this.hm, localConnectionResult, localeq));
        return;
      }
    }
  }

  final class h extends p<dx>.b<PlusClient.OnPersonLoadedListener>
  {
    private final ConnectionResult hg;
    private final Person hn;

    public h(PlusClient.OnPersonLoadedListener paramConnectionResult, ConnectionResult paramPerson, Person arg4)
    {
      super(paramConnectionResult);
      this.hg = paramPerson;
      Object localObject;
      this.hn = localObject;
    }

    protected void a(PlusClient.OnPersonLoadedListener paramOnPersonLoadedListener)
    {
      if (paramOnPersonLoadedListener != null)
        paramOnPersonLoadedListener.onPersonLoaded(this.hg, this.hn);
    }
  }

  public final class i extends t.a
  {
    private p.d cL;

    public i(p.d arg2)
    {
      Object localObject;
      this.cL = localObject;
    }

    public void a(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      if ((paramInt == 0) && (paramBundle != null) && (paramBundle.containsKey("loaded_person")))
        dy.a(dy.this, eq.d(paramBundle.getByteArray("loaded_person")));
      this.cL.a(paramInt, paramIBinder, paramBundle);
    }
  }

  final class j extends dv
  {
    private final PlusClient.b ho;

    public j(PlusClient.b arg2)
    {
      Object localObject;
      this.ho = localObject;
    }

    public void a(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
    {
      if (paramBundle1 != null);
      for (PendingIntent localPendingIntent = (PendingIntent)paramBundle1.getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent);
        du localdu = null;
        if (paramBundle2 != null)
          localdu = new du(paramBundle2);
        dy.this.a(new dy.k(dy.this, this.ho, localConnectionResult, localdu));
        return;
      }
    }
  }

  final class k extends p<dx>.b<PlusClient.b>
  {
    public final ConnectionResult gD;
    public final du hp;

    public k(PlusClient.b paramConnectionResult, ConnectionResult paramdu, du arg4)
    {
      super(paramConnectionResult);
      this.gD = paramdu;
      Object localObject;
      this.hp = localObject;
    }

    protected void a(PlusClient.b paramb)
    {
      if (paramb != null)
        paramb.a(this.gD, this.hp);
    }
  }

  final class l extends dv
  {
    private final PlusClient.OnAccessRevokedListener hq;

    public l(PlusClient.OnAccessRevokedListener arg2)
    {
      Object localObject;
      this.hq = localObject;
    }

    public void b(int paramInt, Bundle paramBundle)
    {
      PendingIntent localPendingIntent = null;
      if (paramBundle != null)
        localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent");
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent);
      dy.this.a(new dy.m(dy.this, this.hq, localConnectionResult));
    }
  }

  final class m extends p<dx>.b<PlusClient.OnAccessRevokedListener>
  {
    private final ConnectionResult hg;

    public m(PlusClient.OnAccessRevokedListener paramConnectionResult, ConnectionResult arg3)
    {
      super(paramConnectionResult);
      Object localObject;
      this.hg = localObject;
    }

    protected void a(PlusClient.OnAccessRevokedListener paramOnAccessRevokedListener)
    {
      dy.this.disconnect();
      if (paramOnAccessRevokedListener != null)
        paramOnAccessRevokedListener.onAccessRevoked(this.hg);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dy
 * JD-Core Version:    0.6.2
 */