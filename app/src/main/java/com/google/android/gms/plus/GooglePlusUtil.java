package com.google.android.gms.plus;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.util.Log;
import com.google.android.gms.internal.o;
import com.google.android.gms.internal.r;

public class GooglePlusUtil
{
  public static final int APP_DISABLED = 3;
  public static final int APP_MISSING = 1;
  public static final int APP_UPDATE_REQUIRED = 2;
  public static final String GOOGLE_PLUS_PACKAGE = "com.google.android.apps.plus";
  public static final String PLATFORM_LOGGING_TAG = "GooglePlusPlatform";
  public static final int SUCCESS;

  private GooglePlusUtil()
  {
    throw new AssertionError("Cannot instantiate GooglePlusUtil");
  }

  static Dialog a(AlertDialog.Builder paramBuilder, int paramInt1, Activity paramActivity, int paramInt2)
  {
    if (paramInt2 < 0)
      throw new IllegalArgumentException("Request code must not be negative.");
    switch (paramInt1)
    {
    default:
      throw new IllegalArgumentException("Unexpected errorCode " + paramInt1);
    case 0:
      return null;
    case 1:
      return paramBuilder.setTitle(a(paramActivity, "install_google_plus_title", "Get Google+")).setMessage(a(paramActivity, "install_google_plus_text", "Download Google+ from Google Play so you can share this?")).setPositiveButton(a(paramActivity, "install_google_plus_button", "Get Google+"), new o(paramActivity, r.g("com.google.android.apps.plus"), paramInt2)).create();
    case 3:
      return paramBuilder.setTitle(a(paramActivity, "enable_google_plus_title", "Enable Google+")).setMessage(a(paramActivity, "enable_google_plus_text", "Enable Google+ from Google Play so you can share this?")).setPositiveButton(a(paramActivity, "enable_google_plus_button", "Enable Google+"), new o(paramActivity, r.e("com.google.android.apps.plus"), paramInt2)).create();
    case 2:
    }
    return paramBuilder.setTitle(a(paramActivity, "update_google_plus_title", "Update Google+")).setMessage(a(paramActivity, "update_google_plus_text", "Update Google+ from Google Play so you can share this?")).setPositiveButton(a(paramActivity, "update_google_plus_button", "Update"), new o(paramActivity, r.g("com.google.android.apps.plus"), paramInt2)).create();
  }

  static String a(Context paramContext, String paramString1, String paramString2)
  {
    try
    {
      Resources localResources = paramContext.createPackageContext("com.google.android.gms", 0).getResources();
      String str = localResources.getString(localResources.getIdentifier(paramString1, "string", "com.google.android.gms"));
      return str;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      Log.e("GooglePlusUtil", "Unable to load resources from GMS: GMS not installed.", localNameNotFoundException);
      return paramString2;
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      Log.e("GooglePlusUtil", "Unable to load resources from GMS: Resource \"" + paramString1 + "\" not found.", localNotFoundException);
      return paramString2;
    }
    catch (SecurityException localSecurityException)
    {
      Log.e("GooglePlusUtil", "Unable to load resources from GMS.", localSecurityException);
    }
    return paramString2;
  }

  private static int b(Context paramContext, int paramInt)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    int i;
    try
    {
      PackageInfo localPackageInfo = localPackageManager.getPackageInfo("com.google.android.apps.plus", 0);
      ApplicationInfo localApplicationInfo = localPackageManager.getApplicationInfo("com.google.android.apps.plus", 0);
      if (localPackageInfo.versionCode < paramInt)
        return 2;
      boolean bool = localApplicationInfo.enabled;
      i = 0;
      if (!bool)
        return 3;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      i = 1;
    }
    return i;
  }

  public static int checkGooglePlusApp(Context paramContext)
  {
    return b(paramContext, 330000000);
  }

  public static Dialog getErrorDialog(int paramInt1, Activity paramActivity, int paramInt2)
  {
    return a(new AlertDialog.Builder(paramActivity), paramInt1, paramActivity, paramInt2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.GooglePlusUtil
 * JD-Core Version:    0.6.2
 */