package com.crashlytics.android;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class HttpRequest
{
  private final HttpURLConnection a;
  private HttpRequest.RequestOutputStream b;
  private boolean c;
  private boolean d = true;
  private boolean e = false;
  private int f = 8192;

  private HttpRequest(CharSequence paramCharSequence, String paramString)
    throws HttpRequest.HttpRequestException
  {
    try
    {
      this.a = ((HttpURLConnection)new URL(paramCharSequence.toString()).openConnection());
      this.a.setRequestMethod(paramString);
      return;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  private HttpRequest(URL paramURL, String paramString)
    throws HttpRequest.HttpRequestException
  {
    try
    {
      this.a = ((HttpURLConnection)paramURL.openConnection());
      this.a.setRequestMethod(paramString);
      return;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  private HttpRequest a(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    return (HttpRequest)new af(this, paramInputStream, this.d, paramInputStream, paramOutputStream).call();
  }

  public static HttpRequest a(CharSequence paramCharSequence)
    throws HttpRequest.HttpRequestException
  {
    return new HttpRequest(paramCharSequence, "POST");
  }

  public static HttpRequest a(CharSequence paramCharSequence, Map<?, ?> paramMap, boolean paramBoolean)
  {
    String str = paramCharSequence.toString();
    if ((paramMap == null) || (paramMap.isEmpty()));
    while (true)
    {
      return new HttpRequest(c(str), "GET");
      StringBuilder localStringBuilder = new StringBuilder(str);
      if (2 + str.indexOf(':') == str.lastIndexOf('/'))
        localStringBuilder.append('/');
      int i = str.indexOf('?');
      int j = -1 + localStringBuilder.length();
      if (i == -1)
        localStringBuilder.append('?');
      while (true)
      {
        Iterator localIterator = paramMap.entrySet().iterator();
        Map.Entry localEntry1 = (Map.Entry)localIterator.next();
        localStringBuilder.append(localEntry1.getKey().toString());
        localStringBuilder.append('=');
        Object localObject1 = localEntry1.getValue();
        if (localObject1 != null)
          localStringBuilder.append(localObject1);
        while (localIterator.hasNext())
        {
          localStringBuilder.append('&');
          Map.Entry localEntry2 = (Map.Entry)localIterator.next();
          localStringBuilder.append(localEntry2.getKey().toString());
          localStringBuilder.append('=');
          Object localObject2 = localEntry2.getValue();
          if (localObject2 != null)
            localStringBuilder.append(localObject2);
        }
        if ((i < j) && (str.charAt(j) != '&'))
          localStringBuilder.append('&');
      }
      str = localStringBuilder.toString();
    }
  }

  private HttpRequest a(String paramString1, String paramString2, String paramString3)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("form-data; name=\"").append(paramString1);
    if (paramString2 != null)
      localStringBuilder.append("\"; filename=\"").append(paramString2);
    localStringBuilder.append('"');
    d("Content-Disposition", localStringBuilder.toString());
    if (paramString3 != null)
      d("Content-Type", paramString3);
    return d("\r\n");
  }

  private HttpRequest a(String paramString1, String paramString2, String paramString3, String paramString4)
    throws HttpRequest.HttpRequestException
  {
    try
    {
      h();
      a(paramString1, paramString2, null);
      this.b.write(paramString4);
      return this;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  public static HttpRequest a(URL paramURL)
    throws HttpRequest.HttpRequestException
  {
    return new HttpRequest(paramURL, "GET");
  }

  public static HttpRequest b(CharSequence paramCharSequence)
    throws HttpRequest.HttpRequestException
  {
    return new HttpRequest(paramCharSequence, "PUT");
  }

  private HttpRequest b(String paramString1, String paramString2, String paramString3)
    throws HttpRequest.HttpRequestException
  {
    return a(paramString1, paramString2, null, paramString3);
  }

  private static String b(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0))
      return paramString;
    return "UTF-8";
  }

  // ERROR //
  private static String c(CharSequence paramCharSequence)
    throws HttpRequest.HttpRequestException
  {
    // Byte code:
    //   0: new 31	java/net/URL
    //   3: dup
    //   4: aload_0
    //   5: invokevirtual 35	java/lang/Object:toString	()Ljava/lang/String;
    //   8: invokespecial 38	java/net/URL:<init>	(Ljava/lang/String;)V
    //   11: astore_1
    //   12: aload_1
    //   13: invokevirtual 188	java/net/URL:getHost	()Ljava/lang/String;
    //   16: astore_2
    //   17: aload_1
    //   18: invokevirtual 191	java/net/URL:getPort	()I
    //   21: istore_3
    //   22: iload_3
    //   23: iconst_m1
    //   24: if_icmpeq +30 -> 54
    //   27: new 83	java/lang/StringBuilder
    //   30: dup
    //   31: invokespecial 140	java/lang/StringBuilder:<init>	()V
    //   34: aload_2
    //   35: invokevirtual 124	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: bipush 58
    //   40: invokevirtual 97	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   43: iload_3
    //   44: invokestatic 196	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   47: invokevirtual 124	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   53: astore_2
    //   54: new 198	java/net/URI
    //   57: dup
    //   58: aload_1
    //   59: invokevirtual 201	java/net/URL:getProtocol	()Ljava/lang/String;
    //   62: aload_2
    //   63: aload_1
    //   64: invokevirtual 204	java/net/URL:getPath	()Ljava/lang/String;
    //   67: aload_1
    //   68: invokevirtual 207	java/net/URL:getQuery	()Ljava/lang/String;
    //   71: aconst_null
    //   72: invokespecial 210	java/net/URI:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   75: invokevirtual 213	java/net/URI:toASCIIString	()Ljava/lang/String;
    //   78: astore 7
    //   80: aload 7
    //   82: areturn
    //   83: astore 8
    //   85: new 18	com/crashlytics/android/HttpRequest$HttpRequestException
    //   88: dup
    //   89: aload 8
    //   91: invokespecial 52	com/crashlytics/android/HttpRequest$HttpRequestException:<init>	(Ljava/io/IOException;)V
    //   94: athrow
    //   95: astore 4
    //   97: new 20	java/io/IOException
    //   100: dup
    //   101: ldc 215
    //   103: invokespecial 216	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   106: astore 5
    //   108: aload 5
    //   110: aload 4
    //   112: invokevirtual 220	java/io/IOException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   115: pop
    //   116: new 18	com/crashlytics/android/HttpRequest$HttpRequestException
    //   119: dup
    //   120: aload 5
    //   122: invokespecial 52	com/crashlytics/android/HttpRequest$HttpRequestException:<init>	(Ljava/io/IOException;)V
    //   125: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   0	12	83	java/io/IOException
    //   54	80	95	java/net/URISyntaxException
  }

  private String c(String paramString)
    throws HttpRequest.HttpRequestException
  {
    f();
    int i = this.a.getHeaderFieldInt("Content-Length", -1);
    ByteArrayOutputStream localByteArrayOutputStream;
    if (i > 0)
      localByteArrayOutputStream = new ByteArrayOutputStream(i);
    try
    {
      while (true)
      {
        a(new BufferedInputStream(d(), this.f), localByteArrayOutputStream);
        String str = localByteArrayOutputStream.toString(b(paramString));
        return str;
        localByteArrayOutputStream = new ByteArrayOutputStream();
      }
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  private static String c(String paramString1, String paramString2)
  {
    String str;
    if ((paramString1 == null) || (paramString1.length() == 0))
    {
      str = null;
      return str;
    }
    int i = paramString1.length();
    int j = 1 + paramString1.indexOf(';');
    if ((j == 0) || (j == i))
      return null;
    int k = paramString1.indexOf(';', j);
    int m;
    int n;
    if (k == -1)
    {
      m = j;
      n = i;
    }
    while (true)
    {
      if (m < n)
      {
        int i1 = paramString1.indexOf('=', m);
        if ((i1 != -1) && (i1 < n) && (paramString2.equals(paramString1.substring(m, i1).trim())))
        {
          str = paramString1.substring(i1 + 1, n).trim();
          int i5 = str.length();
          if (i5 != 0)
          {
            if ((i5 <= 2) || ('"' != str.charAt(0)) || ('"' != str.charAt(i5 - 1)))
              break;
            return str.substring(1, i5 - 1);
          }
        }
        int i2 = n + 1;
        int i3 = paramString1.indexOf(';', i2);
        if (i3 == -1)
          i3 = i;
        int i4 = i3;
        m = i2;
        n = i4;
        continue;
      }
      return null;
      m = j;
      n = k;
    }
  }

  private HttpRequest d(CharSequence paramCharSequence)
    throws HttpRequest.HttpRequestException
  {
    try
    {
      g();
      this.b.write(paramCharSequence.toString());
      return this;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  private HttpRequest d(String paramString1, String paramString2)
    throws HttpRequest.HttpRequestException
  {
    return d(paramString1).d(": ").d(paramString2).d("\r\n");
  }

  private InputStream d()
    throws HttpRequest.HttpRequestException
  {
    if (b() < 400);
    InputStream localInputStream1;
    do
    {
      try
      {
        InputStream localInputStream3 = this.a.getInputStream();
        localInputStream1 = localInputStream3;
        return localInputStream1;
      }
      catch (IOException localIOException2)
      {
        throw new HttpRequest.HttpRequestException(localIOException2);
      }
      localInputStream1 = this.a.getErrorStream();
    }
    while (localInputStream1 != null);
    try
    {
      InputStream localInputStream2 = this.a.getInputStream();
      return localInputStream2;
    }
    catch (IOException localIOException1)
    {
      throw new HttpRequest.HttpRequestException(localIOException1);
    }
  }

  private String d(String paramString)
    throws HttpRequest.HttpRequestException
  {
    f();
    return this.a.getHeaderField(paramString);
  }

  private HttpRequest e()
    throws IOException
  {
    if (this.b == null)
      return this;
    if (this.c)
      this.b.write("\r\n--00content0boundary00--\r\n");
    if (this.d);
    try
    {
      this.b.close();
      while (true)
      {
        label41: this.b = null;
        return this;
        this.b.close();
      }
    }
    catch (IOException localIOException)
    {
      break label41;
    }
  }

  private HttpRequest f()
    throws HttpRequest.HttpRequestException
  {
    try
    {
      HttpRequest localHttpRequest = e();
      return localHttpRequest;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  private HttpRequest g()
    throws IOException
  {
    if (this.b != null)
      return this;
    this.a.setDoOutput(true);
    String str = c(this.a.getRequestProperty("Content-Type"), "charset");
    this.b = new HttpRequest.RequestOutputStream(this.a.getOutputStream(), str, this.f);
    return this;
  }

  private HttpRequest h()
    throws IOException
  {
    if (!this.c)
    {
      this.c = true;
      a("Content-Type", "multipart/form-data; boundary=00content0boundary00").g();
      this.b.write("--00content0boundary00\r\n");
      return this;
    }
    this.b.write("\r\n--00content0boundary00\r\n");
    return this;
  }

  public final HttpRequest a(int paramInt)
  {
    this.a.setConnectTimeout(10000);
    return this;
  }

  public final HttpRequest a(String paramString, Number paramNumber)
    throws HttpRequest.HttpRequestException
  {
    if (paramNumber != null);
    for (String str = paramNumber.toString(); ; str = null)
      return b(paramString, null, str);
  }

  public final HttpRequest a(String paramString1, String paramString2)
  {
    this.a.setRequestProperty(paramString1, paramString2);
    return this;
  }

  public final HttpRequest a(String paramString1, String paramString2, String paramString3, File paramFile)
    throws HttpRequest.HttpRequestException
  {
    try
    {
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(new FileInputStream(paramFile));
      return a(paramString1, paramString2, paramString3, localBufferedInputStream);
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  public final HttpRequest a(String paramString1, String paramString2, String paramString3, InputStream paramInputStream)
    throws HttpRequest.HttpRequestException
  {
    try
    {
      h();
      a(paramString1, paramString2, paramString3);
      a(paramInputStream, this.b);
      return this;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  public final HttpRequest a(Map.Entry<String, String> paramEntry)
  {
    return a((String)paramEntry.getKey(), (String)paramEntry.getValue());
  }

  public final HttpRequest a(boolean paramBoolean)
  {
    this.a.setUseCaches(false);
    return this;
  }

  public final HttpURLConnection a()
  {
    return this.a;
  }

  public final int b()
    throws HttpRequest.HttpRequestException
  {
    try
    {
      e();
      int i = this.a.getResponseCode();
      return i;
    }
    catch (IOException localIOException)
    {
      throw new HttpRequest.HttpRequestException(localIOException);
    }
  }

  public final HttpRequest b(String paramString1, String paramString2)
  {
    return b(paramString1, null, paramString2);
  }

  public final String c()
    throws HttpRequest.HttpRequestException
  {
    return c(c(d("Content-Type"), "charset"));
  }

  public final String toString()
  {
    return this.a.getRequestMethod() + ' ' + this.a.getURL();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.HttpRequest
 * JD-Core Version:    0.6.2
 */