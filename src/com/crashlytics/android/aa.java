package com.crashlytics.android;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class aa extends b
  implements Y
{
  public aa(String paramString1, String paramString2)
  {
    super(paramString1, paramString2, d.b);
  }

  public final boolean a(X paramX)
  {
    HttpRequest localHttpRequest1 = b().a("X-CRASHLYTICS-API-KEY", paramX.a()).a("X-CRASHLYTICS-CLIENT-TYPE", "android").a("X-CRASHLYTICS-API-CLIENT-VERSION", Crashlytics.getCrashlyticsVersion());
    Iterator localIterator = paramX.b().e().entrySet().iterator();
    for (HttpRequest localHttpRequest2 = localHttpRequest1; localIterator.hasNext(); localHttpRequest2 = localHttpRequest2.a((Map.Entry)localIterator.next()));
    ak localak = paramX.b();
    HttpRequest localHttpRequest3 = localHttpRequest2.a("report[file]", localak.b(), "application/octet-stream", localak.d()).b("report[identifier]", localak.c());
    av.b("Sending report to: " + a());
    int i = localHttpRequest3.b();
    av.b("Result was: " + i);
    return c.a(i) == 0;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.aa
 * JD-Core Version:    0.6.2
 */