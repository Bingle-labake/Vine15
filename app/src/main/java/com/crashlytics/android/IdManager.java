package com.crashlytics.android;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Build.VERSION;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class IdManager
{
  private static final Pattern a = Pattern.compile("[^\\p{Alnum}]");
  private static final String b = Pattern.quote("/");
  private final ReentrantLock c = new ReentrantLock();
  private final boolean d;
  private final boolean e;
  private final Context f;

  public IdManager(Context paramContext)
  {
    if (paramContext == null)
      throw new IllegalArgumentException("appContext must not be null");
    this.f = paramContext;
    this.d = av.a(paramContext, "com.crashlytics.CollectDeviceIdentifiers", true);
    if (!this.d)
      av.b("Device ID collection disabled for " + Crashlytics.d());
    this.e = av.a(paramContext, "com.crashlytics.CollectUserIdentifiers", true);
    if (!this.e)
      av.b("User information collection disabled for " + Crashlytics.d());
  }

  private String a(SharedPreferences paramSharedPreferences)
  {
    this.c.lock();
    try
    {
      String str = paramSharedPreferences.getString("crashlytics.installation.id", null);
      if (str == null)
      {
        str = b(UUID.randomUUID().toString());
        paramSharedPreferences.edit().putString("crashlytics.installation.id", str).commit();
      }
      return str;
    }
    finally
    {
      this.c.unlock();
    }
  }

  private static void a(Map<IdManager.DeviceIdentifierType, String> paramMap, IdManager.DeviceIdentifierType paramDeviceIdentifierType, String paramString)
  {
    if (paramString != null)
      paramMap.put(paramDeviceIdentifierType, paramString);
  }

  private boolean a(String paramString)
  {
    return this.f.checkCallingPermission(paramString) == 0;
  }

  private static String b(String paramString)
  {
    if (paramString == null)
      return null;
    return a.matcher(paramString).replaceAll("").toLowerCase();
  }

  private static String c(String paramString)
  {
    return paramString.replaceAll(b, "");
  }

  private String h()
  {
    boolean bool1 = this.d;
    String str1 = null;
    if (bool1)
    {
      String str2 = Settings.Secure.getString(this.f.getContentResolver(), "android_id");
      boolean bool2 = "9774d56d682e549c".equals(str2);
      str1 = null;
      if (!bool2)
        str1 = b(str2);
    }
    return str1;
  }

  private String i()
  {
    if ((this.d) && (Build.VERSION.SDK_INT >= 9))
      try
      {
        String str = b((String)Build.class.getField("SERIAL").get(null));
        return str;
      }
      catch (Exception localException)
      {
        av.a("Could not retrieve android.os.Build.SERIAL value", localException);
      }
    return null;
  }

  public final boolean a()
  {
    return this.e;
  }

  public final String b()
  {
    String str = Crashlytics.getInstance().a;
    if (str == null)
    {
      SharedPreferences localSharedPreferences = av.a();
      str = localSharedPreferences.getString("crashlytics.installation.id", null);
      if (str == null)
        str = a(localSharedPreferences);
    }
    return str;
  }

  public final String c()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = c(Build.VERSION.RELEASE);
    arrayOfObject[1] = c(Build.VERSION.INCREMENTAL);
    return String.format("%s/%s", arrayOfObject);
  }

  public final String d()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = c(Build.MANUFACTURER);
    arrayOfObject[1] = c(Build.MODEL);
    return String.format("%s/%s", arrayOfObject);
  }

  public final String e()
  {
    String str = "";
    if (this.d)
    {
      str = h();
      if (str == null)
      {
        SharedPreferences localSharedPreferences = av.a();
        str = localSharedPreferences.getString("crashlytics.installation.id", null);
        if (str == null)
          str = a(localSharedPreferences);
      }
    }
    return str;
  }

  public final Map<IdManager.DeviceIdentifierType, String> f()
  {
    HashMap localHashMap = new HashMap();
    a(localHashMap, IdManager.DeviceIdentifierType.ANDROID_ID, h());
    IdManager.DeviceIdentifierType localDeviceIdentifierType1 = IdManager.DeviceIdentifierType.ANDROID_DEVICE_ID;
    TelephonyManager localTelephonyManager;
    if ((this.d) && (a("android.permission.READ_PHONE_STATE")))
    {
      localTelephonyManager = (TelephonyManager)this.f.getSystemService("phone");
      if (localTelephonyManager == null);
    }
    for (String str1 = b(localTelephonyManager.getDeviceId()); ; str1 = null)
    {
      a(localHashMap, localDeviceIdentifierType1, str1);
      a(localHashMap, IdManager.DeviceIdentifierType.ANDROID_SERIAL, i());
      IdManager.DeviceIdentifierType localDeviceIdentifierType2 = IdManager.DeviceIdentifierType.WIFI_MAC_ADDRESS;
      boolean bool1 = this.d;
      String str2 = null;
      if (bool1)
      {
        boolean bool2 = a("android.permission.ACCESS_WIFI_STATE");
        str2 = null;
        if (bool2)
        {
          WifiManager localWifiManager = (WifiManager)this.f.getSystemService("wifi");
          str2 = null;
          if (localWifiManager != null)
          {
            WifiInfo localWifiInfo = localWifiManager.getConnectionInfo();
            str2 = null;
            if (localWifiInfo != null)
              str2 = b(localWifiInfo.getMacAddress());
          }
        }
      }
      a(localHashMap, localDeviceIdentifierType2, str2);
      a(localHashMap, IdManager.DeviceIdentifierType.BLUETOOTH_MAC_ADDRESS, g());
      return Collections.unmodifiableMap(localHashMap);
    }
  }

  public final String g()
  {
    if ((this.d) && (a("android.permission.BLUETOOTH")));
    try
    {
      BluetoothAdapter localBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
      if (localBluetoothAdapter != null)
        b(localBluetoothAdapter.getAddress());
      return null;
    }
    catch (Exception localException)
    {
      while (true)
        av.a("Utils#getBluetoothMacAddress failed, returning null. Requires prior call to BluetoothAdatpter.getDefaultAdapter() on thread that has called Looper.prepare()", localException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.IdManager
 * JD-Core Version:    0.6.2
 */