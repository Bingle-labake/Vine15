package com.flurry.android;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;

final class cv extends org.apache.http.conn.ssl.SSLSocketFactory
{
  private SSLContext eV = SSLContext.getInstance("TLS");

  public cv(KeyStore paramKeyStore)
    throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException
  {
    super(paramKeyStore);
    n localn = new n();
    this.eV.init(null, new TrustManager[] { localn }, null);
  }

  public final Socket createSocket()
    throws IOException
  {
    return this.eV.getSocketFactory().createSocket();
  }

  public final Socket createSocket(Socket paramSocket, String paramString, int paramInt, boolean paramBoolean)
    throws IOException, UnknownHostException
  {
    return this.eV.getSocketFactory().createSocket(paramSocket, paramString, paramInt, paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.cv
 * JD-Core Version:    0.6.2
 */