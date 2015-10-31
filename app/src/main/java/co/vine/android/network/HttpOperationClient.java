package co.vine.android.network;

import android.content.Context;
import android.content.SharedPreferences;
import co.vine.android.network.ssl.PinningSSLSocketFactory;
import co.vine.android.util.Util;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import org.apache.http.HttpHost;
import org.apache.http.client.HttpClient;
import org.apache.http.client.protocol.RequestAddCookies;
import org.apache.http.client.protocol.ResponseProcessCookies;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public abstract class HttpOperationClient
{
  private static final int CONNECT_TIMEOUT = 20000;
  public static final String PREF_PROXY_ENABLED = "proxy_enabled";
  public static final String PREF_PROXY_HOST = "proxy_host";
  public static final String PREF_PROXY_PORT = "proxy_port";
  private static final int READ_TIMEOUT = 90000;

  private HttpProxyInfo getProxyInfo(Context paramContext)
  {
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(paramContext);
    return new HttpProxyInfo(localSharedPreferences.getBoolean("proxy_enabled", false), localSharedPreferences.getString("proxy_host", ""), localSharedPreferences.getString("proxy_port", ""));
  }

  public abstract HttpClient getHttpClient();

  protected HttpClient initializeHttpClient(Context paramContext, ClientConnectionManager paramClientConnectionManager, HttpParams paramHttpParams)
  {
    DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient(paramClientConnectionManager, paramHttpParams);
    localDefaultHttpClient.removeRequestInterceptorByClass(RequestAddCookies.class);
    localDefaultHttpClient.removeResponseInterceptorByClass(ResponseProcessCookies.class);
    localDefaultHttpClient.setKeepAliveStrategy(new ShortKeepAliveStrategy());
    HttpProxyInfo localHttpProxyInfo = getProxyInfo(paramContext);
    if (localHttpProxyInfo.enabled)
      localDefaultHttpClient.getParams().setParameter("http.route.default-proxy", localHttpProxyInfo.httpHost);
    return localDefaultHttpClient;
  }

  protected HttpParams initializeHttpParams()
  {
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    HttpConnectionParams.setSoTimeout(localBasicHttpParams, 90000);
    HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 20000);
    HttpConnectionParams.setSocketBufferSize(localBasicHttpParams, 8192);
    return localBasicHttpParams;
  }

  protected SchemeRegistry initializeSchemeRegistry(Context paramContext)
  {
    try
    {
      SchemeRegistry localSchemeRegistry = new SchemeRegistry();
      localSchemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
      localSchemeRegistry.register(new Scheme("https", new PinningSSLSocketFactory(paramContext), 443));
      return localSchemeRegistry;
    }
    catch (KeyManagementException localKeyManagementException)
    {
      throw new AssertionError(localKeyManagementException);
    }
    catch (UnrecoverableKeyException localUnrecoverableKeyException)
    {
      throw new AssertionError(localUnrecoverableKeyException);
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new AssertionError(localNoSuchAlgorithmException);
    }
    catch (KeyStoreException localKeyStoreException)
    {
      throw new AssertionError(localKeyStoreException);
    }
  }

  public abstract void restart();

  public abstract void shutdown();

  private static class HttpProxyInfo
  {
    public final boolean enabled;
    public final HttpHost httpHost;

    public HttpProxyInfo(boolean paramBoolean, String paramString1, String paramString2)
    {
      String str = paramString1.trim();
      if (str.length() == 0)
        paramBoolean = false;
      try
      {
        int j = Integer.parseInt(paramString2);
        i = j;
        this.httpHost = new HttpHost(str, i, "http");
        this.enabled = paramBoolean;
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        while (true)
        {
          int i = -1;
          paramBoolean = false;
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.HttpOperationClient
 * JD-Core Version:    0.6.2
 */