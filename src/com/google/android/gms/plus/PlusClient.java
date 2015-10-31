package com.google.android.gms.plus;

import android.content.Context;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.av;
import com.google.android.gms.internal.du;
import com.google.android.gms.internal.dy;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.ArrayList;
import java.util.Arrays;

public class PlusClient
  implements GooglePlayServicesClient
{
  public static final String KEY_REQUEST_VISIBLE_ACTIVITIES = "request_visible_actions";
  final dy gJ;

  PlusClient(Context paramContext, String paramString1, String paramString2, String paramString3, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3)
  {
    this.gJ = new dy(paramContext, paramString1, paramString2, paramString3, paramConnectionCallbacks, paramOnConnectionFailedListener, paramArrayOfString1, paramArrayOfString2, paramArrayOfString3);
  }

  public boolean A(String paramString)
  {
    return av.a(this.gJ.j(), paramString);
  }

  public void a(a parama, Uri paramUri, int paramInt)
  {
    this.gJ.a(parama, paramUri, paramInt);
  }

  public void a(b paramb, String paramString)
  {
    this.gJ.a(paramb, paramString);
  }

  public void clearDefaultAccount()
  {
    this.gJ.clearDefaultAccount();
  }

  public void connect()
  {
    this.gJ.connect();
  }

  public void disconnect()
  {
    this.gJ.disconnect();
  }

  public String getAccountName()
  {
    return this.gJ.getAccountName();
  }

  public Person getCurrentPerson()
  {
    return this.gJ.getCurrentPerson();
  }

  public boolean isConnected()
  {
    return this.gJ.isConnected();
  }

  public boolean isConnecting()
  {
    return this.gJ.isConnecting();
  }

  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.gJ.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }

  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.gJ.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }

  public void loadMoments(OnMomentsLoadedListener paramOnMomentsLoadedListener)
  {
    this.gJ.loadMoments(paramOnMomentsLoadedListener, 20, null, null, null, "me");
  }

  public void loadMoments(OnMomentsLoadedListener paramOnMomentsLoadedListener, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
  {
    this.gJ.loadMoments(paramOnMomentsLoadedListener, paramInt, paramString1, paramUri, paramString2, paramString3);
  }

  public void loadPeople(OnPeopleLoadedListener paramOnPeopleLoadedListener, int paramInt)
  {
    this.gJ.loadPeople(paramOnPeopleLoadedListener, paramInt, 0, 100, null);
  }

  public void loadPeople(OnPeopleLoadedListener paramOnPeopleLoadedListener, int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    this.gJ.loadPeople(paramOnPeopleLoadedListener, paramInt1, paramInt2, paramInt3, paramString);
  }

  public void loadPerson(OnPersonLoadedListener paramOnPersonLoadedListener, String paramString)
  {
    this.gJ.loadPerson(paramOnPersonLoadedListener, paramString);
  }

  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.gJ.registerConnectionCallbacks(paramConnectionCallbacks);
  }

  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.gJ.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }

  public void removeMoment(String paramString)
  {
    this.gJ.removeMoment(paramString);
  }

  public void revokeAccessAndDisconnect(OnAccessRevokedListener paramOnAccessRevokedListener)
  {
    this.gJ.revokeAccessAndDisconnect(paramOnAccessRevokedListener);
  }

  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.gJ.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }

  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.gJ.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }

  public void writeMoment(Moment paramMoment)
  {
    this.gJ.writeMoment(paramMoment);
  }

  public static class Builder
  {
    private GooglePlayServicesClient.OnConnectionFailedListener e;
    private String g;
    private GooglePlayServicesClient.ConnectionCallbacks gK;
    private ArrayList<String> gL;
    private String[] gM;
    private String[] gN;
    private String gO;
    private String gP;
    private Context mContext;

    public Builder(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this.mContext = paramContext;
      this.gK = paramConnectionCallbacks;
      this.e = paramOnConnectionFailedListener;
      this.gL = new ArrayList();
      this.gP = this.mContext.getPackageName();
      this.gO = this.mContext.getPackageName();
      this.gL.add("https://www.googleapis.com/auth/plus.login");
    }

    public PlusClient build()
    {
      if (this.g == null)
        this.g = "<<default account>>";
      String[] arrayOfString = (String[])this.gL.toArray(new String[this.gL.size()]);
      return new PlusClient(this.mContext, this.gP, this.gO, this.g, this.gK, this.e, this.gM, this.gN, arrayOfString);
    }

    public Builder clearScopes()
    {
      this.gL.clear();
      return this;
    }

    public Builder setAccountName(String paramString)
    {
      this.g = paramString;
      return this;
    }

    public Builder setScopes(String[] paramArrayOfString)
    {
      this.gL.clear();
      this.gL.addAll(Arrays.asList(paramArrayOfString));
      return this;
    }

    public Builder setVisibleActivities(String[] paramArrayOfString)
    {
      this.gM = paramArrayOfString;
      return this;
    }
  }

  public static abstract interface OnAccessRevokedListener
  {
    public abstract void onAccessRevoked(ConnectionResult paramConnectionResult);
  }

  public static abstract interface OnMomentsLoadedListener
  {
    public abstract void onMomentsLoaded(ConnectionResult paramConnectionResult, MomentBuffer paramMomentBuffer, String paramString1, String paramString2);
  }

  public static abstract interface OnPeopleLoadedListener
  {
    public abstract void onPeopleLoaded(ConnectionResult paramConnectionResult, PersonBuffer paramPersonBuffer, String paramString);
  }

  public static abstract interface OnPersonLoadedListener
  {
    public abstract void onPersonLoaded(ConnectionResult paramConnectionResult, Person paramPerson);
  }

  public static abstract interface a
  {
    public abstract void a(ConnectionResult paramConnectionResult, ParcelFileDescriptor paramParcelFileDescriptor);
  }

  public static abstract interface b
  {
    public abstract void a(ConnectionResult paramConnectionResult, du paramdu);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.PlusClient
 * JD-Core Version:    0.6.2
 */