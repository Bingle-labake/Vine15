package com.crashlytics.android;

import java.io.ByteArrayInputStream;

abstract class a extends b
{
  public a(String paramString1, String paramString2, ag paramag)
  {
    super(paramString1, paramString2, paramag);
  }

  public final boolean a(h paramh)
  {
    HttpRequest localHttpRequest1 = b().a("X-CRASHLYTICS-API-KEY", paramh.a()).a("X-CRASHLYTICS-CLIENT-TYPE", "android").a("X-CRASHLYTICS-API-CLIENT-VERSION", Crashlytics.getCrashlyticsVersion());
    ah localah = paramh.j();
    HttpRequest localHttpRequest2 = localHttpRequest1.b("app[identifier]", paramh.b()).b("app[name]", paramh.f()).b("app[display_version]", paramh.c()).b("app[build_version]", paramh.d()).a("app[source]", Integer.valueOf(paramh.g())).b("app[minimum_sdk_version]", paramh.h()).b("app[built_sdk_version]", paramh.i());
    if (!av.c(paramh.e()))
      localHttpRequest2.b("app[instance_identifier]", paramh.e());
    if (localah != null)
    {
      ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(localah.b());
      localHttpRequest2.b("app[icon][hash]", localah.a()).a("app[icon][data]", "icon.png", "application/octet-stream", localByteArrayInputStream).a("app[icon][width]", Integer.valueOf(localah.c())).a("app[icon][height]", Integer.valueOf(localah.d()));
    }
    av.b("Sending app info to " + a());
    int i = localHttpRequest2.b();
    av.b("Result was " + i);
    return c.a(i) == 0;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.a
 * JD-Core Version:    0.6.2
 */