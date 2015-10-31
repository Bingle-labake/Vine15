package co.vine.android.service;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.AsyncTask;
import android.os.IBinder;
import android.util.Log;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.util.BuildUtil;
import com.edisonwang.android.slog.SLog;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

public class GCMRegistrationService extends Service
{
  public static final String ACTION_REGISTER = "co.vine.android.gcm.REGISTER";
  public static final String ACTION_UNREGISTER = "co.vine.android.gcm.UNREGISTER";
  public static final String PREFS = "gcmPrefs";
  public static final String PREF_APP_VERSION = "registrationVersion";
  public static final String PREF_REG_EXPIRY_TIME = "registrationExpiryTime";
  public static final String PREF_REG_ID = "registrationId";
  public static final String PREF_REG_ID_SENT = "registrationIdSent";
  public static final long REGISTRATION_EXPIRY_TIME_MS = 604800000L;
  private static final String TAG = "GCMRegService";
  private static SharedPreferences sPrefs;
  private AppController mAppController;
  private GoogleCloudMessaging mGcm;
  private AppSessionListener mGcmRegistrationListener;
  private ArrayList<Integer> mStartIds;

  private int getAppVersion()
  {
    try
    {
      int i = getPackageManager().getPackageInfo(getPackageName(), 0).versionCode;
      return i;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return -1;
  }

  public static SharedPreferences getGCMPreferences(Context paramContext)
  {
    if (sPrefs == null)
      sPrefs = paramContext.getSharedPreferences("gcmPrefs", 0);
    return sPrefs;
  }

  public static Intent getRegisterIntent(Context paramContext, long paramLong)
  {
    Intent localIntent = new Intent(paramContext, GCMRegistrationService.class);
    localIntent.setAction("co.vine.android.gcm.REGISTER");
    localIntent.putExtra("user_id", paramLong);
    return localIntent;
  }

  private String getRegistrationId()
  {
    SharedPreferences localSharedPreferences = getGCMPreferences(this);
    String str = localSharedPreferences.getString("registrationId", null);
    if (str == null)
    {
      Log.d("GCMRegService", "Registration not found.");
      str = null;
    }
    while ((localSharedPreferences.getInt("registrationVersion", -2147483648) == getAppVersion()) && (!isRegistrationExpired()))
      return str;
    Log.d("GCMRegService", "App version changed or registration expired.");
    return null;
  }

  public static Intent getUnregisterIntent(Context paramContext, long paramLong, String paramString)
  {
    Intent localIntent = new Intent(paramContext, GCMRegistrationService.class);
    localIntent.setAction("co.vine.android.gcm.UNREGISTER");
    localIntent.putExtra("user_id", paramLong);
    localIntent.putExtra("s_key", paramString);
    return localIntent;
  }

  private boolean isRegistrationExpired()
  {
    long l = getGCMPreferences(this).getLong("registrationExpiryTime", -1L);
    return System.currentTimeMillis() > l;
  }

  private void setRegistrationId(String paramString)
  {
    SharedPreferences localSharedPreferences = getGCMPreferences(this);
    int i = getAppVersion();
    long l = 604800000L + System.currentTimeMillis();
    SharedPreferences.Editor localEditor = localSharedPreferences.edit();
    localEditor.putBoolean("registrationIdSent", false);
    localEditor.putInt("registrationVersion", i);
    localEditor.putLong("registrationExpiryTime", l);
    localEditor.putString("registrationId", paramString);
    localEditor.commit();
  }

  private void stopService()
  {
    Iterator localIterator = this.mStartIds.iterator();
    while (localIterator.hasNext())
    {
      int i = ((Integer)localIterator.next()).intValue();
      Log.d("GCMRegService", "Stopping service for startId=" + i);
      stopSelf(i);
    }
  }

  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }

  public void onCreate()
  {
    super.onCreate();
    this.mGcm = GoogleCloudMessaging.getInstance(this);
    this.mAppController = AppController.getInstance(this);
    this.mGcmRegistrationListener = new GCMRegistrationListener(null);
    if (this.mGcmRegistrationListener != null)
      this.mAppController.addListener(this.mGcmRegistrationListener);
    this.mStartIds = new ArrayList();
  }

  public void onDestroy()
  {
    super.onDestroy();
    if (this.mGcmRegistrationListener != null)
      this.mAppController.removeListener(this.mGcmRegistrationListener);
    this.mGcm.close();
  }

  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    Log.d("GCMRegService", "onStartCommand, startId=" + paramInt2 + ", startIds=" + this.mStartIds.toString());
    this.mStartIds.add(Integer.valueOf(paramInt2));
    if (paramIntent == null)
      return 2;
    String str1 = getRegistrationId();
    Log.d("GCMRegService", "Starting GCM registration service with regId=" + str1);
    long l = paramIntent.getLongExtra("user_id", 0L);
    String str2 = paramIntent.getAction();
    if ("co.vine.android.gcm.REGISTER".equals(str2))
    {
      if (str1 == null)
      {
        new GCMRegisterTask(l).execute(new Void[0]);
        return 2;
      }
      if (!getGCMPreferences(this).getBoolean("registrationIdSent", false))
      {
        this.mAppController.sendGcmRegId(str1, l);
        return 2;
      }
      stopService();
      return 2;
    }
    if ("co.vine.android.gcm.UNREGISTER".equals(str2))
    {
      new GCMUnregisterTask(str1, l, paramIntent.getStringExtra("s_key")).execute(new Void[0]);
      return 2;
    }
    stopService();
    return 2;
  }

  private class GCMRegisterTask extends AsyncTask<Void, Void, Void>
  {
    private long mUserId;

    public GCMRegisterTask(long arg2)
    {
      Object localObject;
      this.mUserId = localObject;
    }

    private Context getContext()
    {
      return GCMRegistrationService.this;
    }

    protected Void doInBackground(Void[] paramArrayOfVoid)
    {
      if (GCMRegistrationService.this.mGcm == null)
        GCMRegistrationService.access$102(GCMRegistrationService.this, GoogleCloudMessaging.getInstance(getContext()));
      String str1 = BuildUtil.get(getContext()).getSenderId();
      try
      {
        Log.d("GCMRegService", "Registering with senderId=" + str1);
        String str2 = GCMRegistrationService.this.mGcm.register(new String[] { str1 });
        SLog.d("GCM: Registration complete with regId={}", str2);
        GCMRegistrationService.this.setRegistrationId(str2);
        GCMRegistrationService.this.mAppController.sendGcmRegId(str2, this.mUserId);
        label114: return null;
      }
      catch (IOException localIOException)
      {
        while (true)
          Log.d("GCMRegService", "Failed to register with GCM service.");
      }
      catch (SecurityException localSecurityException)
      {
        break label114;
      }
    }

    protected void onPostExecute(Void paramVoid)
    {
      GCMRegistrationService.this.stopService();
    }
  }

  private class GCMRegistrationListener extends AppSessionListener
  {
    private GCMRegistrationListener()
    {
    }

    public void onGcmRegistrationComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((paramInt == 200) && (paramLong > 0L))
      {
        Log.d("GCMRegService", "GCM registration completed successfully; saving regId and stopping service now.");
        SharedPreferences.Editor localEditor = GCMRegistrationService.getGCMPreferences(GCMRegistrationService.this).edit();
        localEditor.putBoolean("registrationIdSent", true);
        localEditor.commit();
      }
      GCMRegistrationService.this.stopService();
    }
  }

  private class GCMUnregisterTask extends AsyncTask<Void, Void, Void>
  {
    private String mRegId;
    private String mSessionKey;
    private long mUserId;

    public GCMUnregisterTask(String paramLong, long arg3, String arg5)
    {
      this.mRegId = paramLong;
      this.mUserId = ???;
      Object localObject;
      this.mSessionKey = localObject;
    }

    private Context getContext()
    {
      return GCMRegistrationService.this;
    }

    protected Void doInBackground(Void[] paramArrayOfVoid)
    {
      if (GCMRegistrationService.this.mGcm == null)
        GCMRegistrationService.access$102(GCMRegistrationService.this, GoogleCloudMessaging.getInstance(getContext()));
      Log.d("GCMRegService", "Unregistering...");
      GCMRegistrationService.this.mAppController.clearGcmRegId(this.mRegId, this.mUserId, this.mSessionKey);
      GCMRegistrationService.getGCMPreferences(getContext()).edit().clear().commit();
      return null;
    }

    protected void onPostExecute(Void paramVoid)
    {
      GCMRegistrationService.this.startService(GCMNotificationService.getClearNotificationIntent(getContext()));
      GCMRegistrationService.this.stopService();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.GCMRegistrationService
 * JD-Core Version:    0.6.2
 */