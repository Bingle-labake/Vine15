package co.vine.android.network.ssl;

import android.content.Context;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.util.HashSet;
import java.util.Set;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class PinningSSLSocketFactory extends org.apache.http.conn.ssl.SSLSocketFactory
{
  private static final Set<String> PINNING_HOSTS = new HashSet();
  private final javax.net.ssl.SSLSocketFactory mPinningSocketFactory;
  private final javax.net.ssl.SSLSocketFactory mSystemSocketFactory;

  static
  {
    PINNING_HOSTS.add("*.vineapp.com");
  }

  public PinningSSLSocketFactory(Context paramContext)
    throws UnrecoverableKeyException, KeyManagementException, NoSuchAlgorithmException, KeyStoreException
  {
    super(null);
    SystemKeyStore localSystemKeyStore = SystemKeyStore.getInstance(paramContext);
    SSLContext localSSLContext1 = SSLContext.getInstance("TLS");
    SSLContext localSSLContext2 = SSLContext.getInstance("TLS");
    TrustManager[] arrayOfTrustManager1 = initializePinningTrustManagers(localSystemKeyStore);
    TrustManager[] arrayOfTrustManager2 = initializeSystemTrustManagers(localSystemKeyStore);
    localSSLContext1.init(null, arrayOfTrustManager1, null);
    localSSLContext2.init(null, arrayOfTrustManager2, null);
    this.mPinningSocketFactory = localSSLContext1.getSocketFactory();
    this.mSystemSocketFactory = localSSLContext2.getSocketFactory();
  }

  private TrustManager[] initializePinningTrustManagers(SystemKeyStore paramSystemKeyStore)
  {
    TrustManager[] arrayOfTrustManager = new TrustManager[1];
    arrayOfTrustManager[0] = new PinningTrustManager(paramSystemKeyStore, VinePins.PINS);
    return arrayOfTrustManager;
  }

  private TrustManager[] initializeSystemTrustManagers(SystemKeyStore paramSystemKeyStore)
    throws NoSuchAlgorithmException, KeyStoreException
  {
    TrustManagerFactory localTrustManagerFactory = TrustManagerFactory.getInstance("X509");
    localTrustManagerFactory.init(paramSystemKeyStore.mTrustStore);
    return localTrustManagerFactory.getTrustManagers();
  }

  public Socket connectSocket(Socket paramSocket, String paramString, int paramInt1, InetAddress paramInetAddress, int paramInt2, HttpParams paramHttpParams)
    throws IOException
  {
    Socket localSocket;
    if (paramSocket != null)
      localSocket = paramSocket;
    SSLSocket localSSLSocket;
    while (true)
    {
      localSSLSocket = (SSLSocket)localSocket;
      if ((paramInetAddress != null) || (paramInt2 > 0))
      {
        if (paramInt2 < 0)
          paramInt2 = 0;
        localSSLSocket.bind(new InetSocketAddress(paramInetAddress, paramInt2));
      }
      int i = HttpConnectionParams.getConnectionTimeout(paramHttpParams);
      int j = HttpConnectionParams.getSoTimeout(paramHttpParams);
      localSSLSocket.connect(new InetSocketAddress(paramString, paramInt1), i);
      localSSLSocket.setSoTimeout(j);
      try
      {
        org.apache.http.conn.ssl.SSLSocketFactory.STRICT_HOSTNAME_VERIFIER.verify(paramString, localSSLSocket);
        return localSSLSocket;
        localSocket = createSocket();
      }
      catch (IOException localIOException)
      {
      }
    }
    try
    {
      localSSLSocket.close();
      label118: throw localIOException;
    }
    catch (Exception localException)
    {
      break label118;
    }
  }

  public Socket createSocket()
    throws IOException
  {
    return this.mSystemSocketFactory.createSocket();
  }

  public Socket createSocket(Socket paramSocket, String paramString, int paramInt, boolean paramBoolean)
    throws IOException
  {
    if (PINNING_HOSTS.contains(paramString));
    for (javax.net.ssl.SSLSocketFactory localSSLSocketFactory = this.mPinningSocketFactory; ; localSSLSocketFactory = this.mSystemSocketFactory)
    {
      if (paramInt == -1)
        paramInt = 443;
      SSLSocket localSSLSocket = (SSLSocket)localSSLSocketFactory.createSocket(paramSocket, paramString, paramInt, paramBoolean);
      org.apache.http.conn.ssl.SSLSocketFactory.STRICT_HOSTNAME_VERIFIER.verify(paramString, localSSLSocket);
      return localSSLSocket;
    }
  }

  public X509HostnameVerifier getHostnameVerifier()
  {
    return org.apache.http.conn.ssl.SSLSocketFactory.STRICT_HOSTNAME_VERIFIER;
  }

  public void setHostnameVerifier(X509HostnameVerifier paramX509HostnameVerifier)
  {
    throw new IllegalArgumentException("Only strict hostname verification (default)  is supported!");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.ssl.PinningSSLSocketFactory
 * JD-Core Version:    0.6.2
 */