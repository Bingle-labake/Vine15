package com.crashlytics.android;

import java.security.KeyStoreException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

final class ai
  implements X509TrustManager
{
  private final TrustManager[] a;
  private final at b;
  private final List<byte[]> c = new LinkedList();
  private final Set<X509Certificate> d = Collections.synchronizedSet(new HashSet());

  public ai(at paramat, String[] paramArrayOfString)
  {
    this.a = a(paramat);
    this.b = paramat;
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
    {
      String str = paramArrayOfString[j];
      this.c.add(a(str));
    }
  }

  private boolean a(X509Certificate paramX509Certificate)
    throws CertificateException
  {
    try
    {
      byte[] arrayOfByte = MessageDigest.getInstance("SHA1").digest(paramX509Certificate.getPublicKey().getEncoded());
      Iterator localIterator = this.c.iterator();
      while (localIterator.hasNext())
      {
        boolean bool = Arrays.equals((byte[])localIterator.next(), arrayOfByte);
        if (bool)
          return true;
      }
      return false;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new CertificateException(localNoSuchAlgorithmException);
    }
  }

  private static byte[] a(String paramString)
  {
    int i = paramString.length();
    byte[] arrayOfByte = new byte[i / 2];
    for (int j = 0; j < i; j += 2)
      arrayOfByte[(j / 2)] = ((byte)((Character.digit(paramString.charAt(j), 16) << 4) + Character.digit(paramString.charAt(j + 1), 16)));
    return arrayOfByte;
  }

  private static TrustManager[] a(at paramat)
  {
    try
    {
      TrustManagerFactory localTrustManagerFactory = TrustManagerFactory.getInstance("X509");
      localTrustManagerFactory.init(paramat.a);
      TrustManager[] arrayOfTrustManager = localTrustManagerFactory.getTrustManagers();
      return arrayOfTrustManager;
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

  public final void checkClientTrusted(X509Certificate[] paramArrayOfX509Certificate, String paramString)
    throws CertificateException
  {
    throw new CertificateException("Client certificates not supported!");
  }

  public final void checkServerTrusted(X509Certificate[] paramArrayOfX509Certificate, String paramString)
    throws CertificateException
  {
    if (this.d.contains(paramArrayOfX509Certificate[0]))
      return;
    TrustManager[] arrayOfTrustManager = this.a;
    int i = arrayOfTrustManager.length;
    for (int j = 0; j < i; j++)
      ((X509TrustManager)arrayOfTrustManager[j]).checkServerTrusted(paramArrayOfX509Certificate, paramString);
    X509Certificate[] arrayOfX509Certificate = c.a(paramArrayOfX509Certificate, this.b);
    int k = arrayOfX509Certificate.length;
    for (int m = 0; m < k; m++)
      if (a(arrayOfX509Certificate[m]))
        break label108;
    throw new CertificateException("No valid pins found in chain!");
    label108: this.d.add(paramArrayOfX509Certificate[0]);
  }

  public final X509Certificate[] getAcceptedIssuers()
  {
    return null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.ai
 * JD-Core Version:    0.6.2
 */