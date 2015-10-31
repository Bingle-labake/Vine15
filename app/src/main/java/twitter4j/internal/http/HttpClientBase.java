package twitter4j.internal.http;

import android.util.Log;
import co.vine.android.util.BuildUtil;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.Serializable;

public abstract class HttpClientBase
  implements HttpClient, Serializable
{
  private static final boolean LOGGABLE = false;
  private static final String TAG = "t4jHttpClientBase";
  private static final long serialVersionUID = 6944924907755685265L;
  protected final HttpClientConfiguration CONF;

  public HttpClientBase(HttpClientConfiguration paramHttpClientConfiguration)
  {
    this.CONF = paramHttpClientConfiguration;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    HttpClientBase localHttpClientBase;
    do
    {
      return true;
      if (!(paramObject instanceof HttpClientBase))
        return false;
      localHttpClientBase = (HttpClientBase)paramObject;
    }
    while (this.CONF.equals(localHttpClientBase.CONF));
    return false;
  }

  public int hashCode()
  {
    return this.CONF.hashCode();
  }

  protected boolean isProxyConfigured()
  {
    return (this.CONF.getHttpProxyHost() != null) && (!this.CONF.getHttpProxyHost().equals(""));
  }

  public void shutdown()
  {
  }

  public String toString()
  {
    return "HttpClientBase{CONF=" + this.CONF + '}';
  }

  public void write(DataOutputStream paramDataOutputStream, String paramString)
    throws IOException
  {
    paramDataOutputStream.writeBytes(paramString);
    if (LOGGABLE)
      Log.v("t4jHttpClientBase", paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.internal.http.HttpClientBase
 * JD-Core Version:    0.6.2
 */