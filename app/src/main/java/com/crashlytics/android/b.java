package com.crashlytics.android;

import java.util.Collections;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;

abstract class b
{
  private static String a = "Crashlytics Android SDK/" + Crashlytics.getCrashlyticsVersion();
  private static final Pattern b = Pattern.compile("http(s?)://[^\\/]+", 2);
  private final String c;
  private final ag d;
  private final String e;

  public b(String paramString1, String paramString2, ag paramag)
  {
    if (paramString2 == null)
      throw new IllegalArgumentException("url must not be null.");
    if (paramag == null)
      throw new IllegalArgumentException("requestBuilder must not be null.");
    this.e = paramString1;
    if (!av.c(this.e))
      paramString2 = b.matcher(paramString2).replaceFirst(this.e);
    this.c = paramString2;
    this.d = paramag;
  }

  protected final HttpRequest a(Map<String, String> paramMap)
  {
    HttpRequest localHttpRequest = this.d.a(this.c, paramMap);
    if (this.c.toLowerCase().startsWith("https"))
    {
      PinningInfoProvider localPinningInfoProvider = Crashlytics.getPinningInfoProvider();
      if (localPinningInfoProvider != null)
      {
        SSLSocketFactory localSSLSocketFactory = av.a(localPinningInfoProvider);
        ((HttpsURLConnection)localHttpRequest.a()).setSSLSocketFactory(localSSLSocketFactory);
      }
    }
    return localHttpRequest.a(false).a(10000).a("User-Agent", a).a("X-CRASHLYTICS-DEVELOPER-TOKEN", "bca6990fc3c15a8105800c0673517a4b579634a1");
  }

  protected final String a()
  {
    return this.c;
  }

  protected final HttpRequest b()
  {
    return a(Collections.emptyMap());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.b
 * JD-Core Version:    0.6.2
 */