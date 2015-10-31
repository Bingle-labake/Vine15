package org.scribe.model;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import org.scribe.exceptions.OAuthException;

class Request
{
  private static final String CONTENT_LENGTH = "Content-Length";
  private static final String CONTENT_TYPE = "Content-Type";
  public static final String DEFAULT_CONTENT_TYPE = "application/x-www-form-urlencoded";
  private ParameterList bodyParams;
  private byte[] bytePayload = null;
  private String charset;
  private Long connectTimeout = null;
  private HttpURLConnection connection;
  private boolean connectionKeepAlive = false;
  private Map<String, String> headers;
  private String payload = null;
  private ParameterList querystringParams;
  private Long readTimeout = null;
  private String url;
  private Verb verb;

  public Request(Verb paramVerb, String paramString)
  {
    this.verb = paramVerb;
    this.url = paramString;
    this.querystringParams = new ParameterList();
    this.bodyParams = new ParameterList();
    this.headers = new HashMap();
  }

  private void createConnection()
    throws IOException
  {
    String str1 = getCompleteUrl();
    if (this.connection == null)
      if (!this.connectionKeepAlive)
        break label48;
    label48: for (String str2 = "true"; ; str2 = "false")
    {
      System.setProperty("http.keepAlive", str2);
      this.connection = ((HttpURLConnection)new URL(str1).openConnection());
      return;
    }
  }

  void addBody(HttpURLConnection paramHttpURLConnection, byte[] paramArrayOfByte)
    throws IOException
  {
    paramHttpURLConnection.setRequestProperty("Content-Length", String.valueOf(paramArrayOfByte.length));
    if (paramHttpURLConnection.getRequestProperty("Content-Type") == null)
      paramHttpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
    paramHttpURLConnection.setDoOutput(true);
    paramHttpURLConnection.getOutputStream().write(paramArrayOfByte);
  }

  public void addBodyParameter(String paramString1, String paramString2)
  {
    this.bodyParams.add(paramString1, paramString2);
  }

  public void addHeader(String paramString1, String paramString2)
  {
    this.headers.put(paramString1, paramString2);
  }

  void addHeaders(HttpURLConnection paramHttpURLConnection)
  {
    Iterator localIterator = this.headers.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      paramHttpURLConnection.setRequestProperty(str, (String)this.headers.get(str));
    }
  }

  public void addPayload(String paramString)
  {
    this.payload = paramString;
  }

  public void addPayload(byte[] paramArrayOfByte)
  {
    this.bytePayload = paramArrayOfByte;
  }

  public void addQuerystringParameter(String paramString1, String paramString2)
  {
    this.querystringParams.add(paramString1, paramString2);
  }

  Response doSend()
    throws IOException
  {
    this.connection.setRequestMethod(this.verb.name());
    if (this.connectTimeout != null)
      this.connection.setConnectTimeout(this.connectTimeout.intValue());
    if (this.readTimeout != null)
      this.connection.setReadTimeout(this.readTimeout.intValue());
    addHeaders(this.connection);
    if ((this.verb.equals(Verb.PUT)) || (this.verb.equals(Verb.POST)))
      addBody(this.connection, getByteBodyContents());
    return new Response(this.connection);
  }

  public String getBodyContents()
  {
    try
    {
      String str = new String(getByteBodyContents(), getCharset());
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new OAuthException("Unsupported Charset: " + this.charset, localUnsupportedEncodingException);
    }
  }

  public ParameterList getBodyParams()
  {
    return this.bodyParams;
  }

  byte[] getByteBodyContents()
  {
    if (this.bytePayload != null)
      return this.bytePayload;
    String str;
    if (this.payload != null)
      str = this.payload;
    try
    {
      while (true)
      {
        byte[] arrayOfByte = str.getBytes(getCharset());
        return arrayOfByte;
        str = this.bodyParams.asFormUrlEncodedString();
      }
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new OAuthException("Unsupported Charset: " + getCharset(), localUnsupportedEncodingException);
    }
  }

  public String getCharset()
  {
    if (this.charset == null)
      return Charset.defaultCharset().name();
    return this.charset;
  }

  public String getCompleteUrl()
  {
    return this.querystringParams.appendTo(this.url);
  }

  public Map<String, String> getHeaders()
  {
    return this.headers;
  }

  public ParameterList getQueryStringParams()
  {
    try
    {
      ParameterList localParameterList = new ParameterList();
      localParameterList.addQuerystring(new URL(this.url).getQuery());
      localParameterList.addAll(this.querystringParams);
      return localParameterList;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      throw new OAuthException("Malformed URL", localMalformedURLException);
    }
  }

  public String getSanitizedUrl()
  {
    return this.url.replaceAll("\\?.*", "").replace("\\:\\d{4}", "");
  }

  public String getUrl()
  {
    return this.url;
  }

  public Verb getVerb()
  {
    return this.verb;
  }

  public Response send()
  {
    try
    {
      createConnection();
      Response localResponse = doSend();
      return localResponse;
    }
    catch (UnknownHostException localUnknownHostException)
    {
      throw new OAuthException("Could not reach the desired host. Check your network connection.", localUnknownHostException);
    }
    catch (IOException localIOException)
    {
      throw new OAuthException("Problems while creating connection.", localIOException);
    }
  }

  public void setCharset(String paramString)
  {
    this.charset = paramString;
  }

  public void setConnectTimeout(int paramInt, TimeUnit paramTimeUnit)
  {
    this.connectTimeout = Long.valueOf(paramTimeUnit.toMillis(paramInt));
  }

  void setConnection(HttpURLConnection paramHttpURLConnection)
  {
    this.connection = paramHttpURLConnection;
  }

  public void setConnectionKeepAlive(boolean paramBoolean)
  {
    this.connectionKeepAlive = paramBoolean;
  }

  public void setReadTimeout(int paramInt, TimeUnit paramTimeUnit)
  {
    this.readTimeout = Long.valueOf(paramTimeUnit.toMillis(paramInt));
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = getVerb();
    arrayOfObject[1] = getUrl();
    return String.format("@Request(%s %s)", arrayOfObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.Request
 * JD-Core Version:    0.6.2
 */