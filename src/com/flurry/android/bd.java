package com.flurry.android;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import java.io.Closeable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

final class bd
{
  static int a(Context paramContext, int paramInt)
  {
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    return Math.round(paramInt / localDisplayMetrics.density);
  }

  static HttpResponse a(String paramString, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    try
    {
      HttpGet localHttpGet = new HttpGet(paramString);
      BasicHttpParams localBasicHttpParams = new BasicHttpParams();
      HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 10000);
      HttpConnectionParams.setSoTimeout(localBasicHttpParams, 15000);
      localBasicHttpParams.setParameter("http.protocol.handle-redirects", Boolean.valueOf(paramBoolean));
      HttpResponse localHttpResponse = cn.a(localBasicHttpParams).execute(localHttpGet);
      return localHttpResponse;
    }
    catch (UnknownHostException localUnknownHostException)
    {
      db.c("FlurryAgent", "Unknown host: " + localUnknownHostException.getMessage());
      return null;
    }
    catch (Exception localException)
    {
      db.a("FlurryAgent", "Failed to hit URL: " + paramString, localException);
    }
    return null;
  }

  static void a(Closeable paramCloseable)
  {
    if (paramCloseable != null);
    try
    {
      paramCloseable.close();
      return;
    }
    catch (Throwable localThrowable)
    {
    }
  }

  static boolean a(Context paramContext, Intent paramIntent)
  {
    return paramContext.getPackageManager().queryIntentActivities(paramIntent, 65536).size() > 0;
  }

  static int b(Context paramContext, int paramInt)
  {
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    return Math.round(paramInt * localDisplayMetrics.density);
  }

  static boolean b(long paramLong)
  {
    boolean bool1 = System.currentTimeMillis() < paramLong;
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
    return bool2;
  }

  static int l(Context paramContext)
  {
    return paramContext.getResources().getDisplayMetrics().widthPixels;
  }

  static int m(Context paramContext)
  {
    return paramContext.getResources().getDisplayMetrics().heightPixels;
  }

  static int n(Context paramContext)
  {
    return a(paramContext, l(paramContext));
  }

  static int o(Context paramContext)
  {
    return a(paramContext, m(paramContext));
  }

  static String p(String paramString)
  {
    try
    {
      String str = URLEncoder.encode(paramString, "UTF-8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      db.g("FlurryAgent", "Cannot encode '" + paramString + "'");
    }
    return "";
  }

  private static String q(String paramString)
  {
    try
    {
      String str = URLDecoder.decode(paramString, "UTF-8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      db.g("FlurryAgent", "Cannot decode '" + paramString + "'");
    }
    return "";
  }

  static byte[] r(String paramString)
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("SHA-1");
      localMessageDigest.update(paramString.getBytes(), 0, paramString.length());
      byte[] arrayOfByte = localMessageDigest.digest();
      return arrayOfByte;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      db.d("FlurryAgent", "Unsupported SHA1: " + localNoSuchAlgorithmException.getMessage());
    }
    return null;
  }

  static String s(String paramString)
  {
    return paramString.replace("'", "\\'").replace("\\n", "").replace("\\r", "").replace("\\t", "");
  }

  static String sanitize(String paramString)
  {
    if (paramString == null)
      paramString = "";
    while (paramString.length() <= 255)
      return paramString;
    return paramString.substring(0, 255);
  }

  static Map<String, String> t(String paramString)
  {
    HashMap localHashMap = new HashMap();
    if (!TextUtils.isEmpty(paramString))
    {
      String[] arrayOfString1 = paramString.split("&");
      int i = arrayOfString1.length;
      for (int j = 0; j < i; j++)
      {
        String[] arrayOfString2 = arrayOfString1[j].split("=");
        if (!arrayOfString2[0].equals("event"))
          localHashMap.put(q(arrayOfString2[0]), q(arrayOfString2[1]));
      }
    }
    return localHashMap;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bd
 * JD-Core Version:    0.6.2
 */