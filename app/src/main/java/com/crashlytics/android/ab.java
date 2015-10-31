package com.crashlytics.android;

import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

final class ab extends b
  implements as
{
  public ab(String paramString1, String paramString2)
  {
    super(paramString1, paramString2, d.a);
  }

  public final JSONObject a(aq paramaq)
  {
    try
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("build_version", paramaq.e());
      localHashMap.put("display_version", paramaq.d());
      String str = paramaq.c();
      if (!av.c(str))
        localHashMap.put("instance", str);
      HttpRequest localHttpRequest = a(localHashMap).a("X-CRASHLYTICS-API-KEY", paramaq.a()).a("X-CRASHLYTICS-CLIENT-TYPE", "android").a("X-CRASHLYTICS-D", paramaq.b()).a("X-CRASHLYTICS-API-CLIENT-VERSION", Crashlytics.getCrashlyticsVersion()).a("Accept", "application/json");
      av.b("Requesting settings from " + a());
      av.b("Settings query params were: " + localHashMap);
      JSONObject localJSONObject = new JSONObject(localHttpRequest.c());
      return localJSONObject;
    }
    catch (Exception localException)
    {
      av.a("Failed to retrieve settings from " + a(), localException);
    }
    return null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.ab
 * JD-Core Version:    0.6.2
 */