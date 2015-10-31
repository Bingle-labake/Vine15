package co.vine.android.network;

import android.content.Context;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.HttpParams;

public class ThreadedHttpOperationClient extends HttpOperationClient
{
  private static ThreadedHttpOperationClient sInstance = null;
  private ClientConnectionManager mConnectionManager;
  private final Context mContext;
  private HttpClient mHttpClient;

  private ThreadedHttpOperationClient(Context paramContext)
  {
    this.mContext = paramContext.getApplicationContext();
    initialize();
  }

  public static ThreadedHttpOperationClient getInstance(Context paramContext)
  {
    try
    {
      if (sInstance == null)
        sInstance = new ThreadedHttpOperationClient(paramContext.getApplicationContext());
      ThreadedHttpOperationClient localThreadedHttpOperationClient = sInstance;
      return localThreadedHttpOperationClient;
    }
    finally
    {
    }
  }

  private void initialize()
  {
    HttpParams localHttpParams = initializeHttpParams();
    this.mConnectionManager = initializeConnectionManager(localHttpParams, initializeSchemeRegistry(this.mContext));
    this.mHttpClient = initializeHttpClient(this.mContext, this.mConnectionManager, localHttpParams);
  }

  private ClientConnectionManager initializeConnectionManager(HttpParams paramHttpParams, SchemeRegistry paramSchemeRegistry)
  {
    return new ThreadSafeClientConnManager(paramHttpParams, paramSchemeRegistry);
  }

  public HttpClient getHttpClient()
  {
    return this.mHttpClient;
  }

  public void restart()
  {
    this.mConnectionManager.shutdown();
    initialize();
  }

  public void shutdown()
  {
    this.mConnectionManager.shutdown();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.ThreadedHttpOperationClient
 * JD-Core Version:    0.6.2
 */