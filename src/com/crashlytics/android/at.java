package com.crashlytics.android;

import android.content.res.Resources.NotFoundException;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Enumeration;
import java.util.HashMap;
import javax.security.auth.x500.X500Principal;

final class at
{
  final KeyStore a;
  private final HashMap<Principal, X509Certificate> b;

  public at(InputStream paramInputStream, String paramString)
  {
    KeyStore localKeyStore = a(paramInputStream, paramString);
    this.b = a(localKeyStore);
    this.a = localKeyStore;
  }

  private static KeyStore a(InputStream paramInputStream, String paramString)
  {
    try
    {
      KeyStore localKeyStore = KeyStore.getInstance("BKS");
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(paramInputStream);
      try
      {
        localKeyStore.load(localBufferedInputStream, paramString.toCharArray());
        return localKeyStore;
      }
      finally
      {
        localBufferedInputStream.close();
      }
    }
    catch (KeyStoreException localKeyStoreException)
    {
      throw new AssertionError(localKeyStoreException);
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new AssertionError(localNoSuchAlgorithmException);
    }
    catch (CertificateException localCertificateException)
    {
      throw new AssertionError(localCertificateException);
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      throw new AssertionError(localNotFoundException);
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }

  private static HashMap<Principal, X509Certificate> a(KeyStore paramKeyStore)
  {
    HashMap localHashMap;
    try
    {
      localHashMap = new HashMap();
      Enumeration localEnumeration = paramKeyStore.aliases();
      while (localEnumeration.hasMoreElements())
      {
        X509Certificate localX509Certificate = (X509Certificate)paramKeyStore.getCertificate((String)localEnumeration.nextElement());
        if (localX509Certificate != null)
          localHashMap.put(localX509Certificate.getSubjectX500Principal(), localX509Certificate);
      }
    }
    catch (KeyStoreException localKeyStoreException)
    {
      throw new AssertionError(localKeyStoreException);
    }
    return localHashMap;
  }

  public final boolean a(X509Certificate paramX509Certificate)
  {
    X509Certificate localX509Certificate = (X509Certificate)this.b.get(paramX509Certificate.getSubjectX500Principal());
    return (localX509Certificate != null) && (localX509Certificate.getPublicKey().equals(paramX509Certificate.getPublicKey()));
  }

  public final X509Certificate b(X509Certificate paramX509Certificate)
  {
    X509Certificate localX509Certificate = (X509Certificate)this.b.get(paramX509Certificate.getIssuerX500Principal());
    if (localX509Certificate == null)
      return null;
    if (localX509Certificate.getSubjectX500Principal().equals(paramX509Certificate.getSubjectX500Principal()))
      return null;
    try
    {
      paramX509Certificate.verify(localX509Certificate.getPublicKey());
      return localX509Certificate;
    }
    catch (GeneralSecurityException localGeneralSecurityException)
    {
    }
    return null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.at
 * JD-Core Version:    0.6.2
 */