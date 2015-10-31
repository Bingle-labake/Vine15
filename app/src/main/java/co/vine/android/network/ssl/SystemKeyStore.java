package co.vine.android.network.ssl;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import co.vine.android.util.Util;
import java.io.BufferedInputStream;
import java.io.IOException;
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

public class SystemKeyStore
{
  private static final int CACERTS_FILE_SIZE = 143360;
  private static SystemKeyStore sInstance;
  private final HashMap<Principal, X509Certificate> mTrustRoots;
  final KeyStore mTrustStore;

  private SystemKeyStore(Context paramContext)
  {
    KeyStore localKeyStore = getTrustStore(paramContext);
    this.mTrustRoots = initializeTrustedRoots(localKeyStore);
    this.mTrustStore = localKeyStore;
  }

  public static SystemKeyStore getInstance(Context paramContext)
  {
    try
    {
      if (sInstance == null)
        sInstance = new SystemKeyStore(paramContext);
      SystemKeyStore localSystemKeyStore = sInstance;
      return localSystemKeyStore;
    }
    finally
    {
    }
  }

  private KeyStore getTrustStore(Context paramContext)
  {
    try
    {
      KeyStore localKeyStore = KeyStore.getInstance("BKS");
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(paramContext.getResources().openRawResource(2131099648), 143360);
      try
      {
        localKeyStore.load(localBufferedInputStream, "changeit".toCharArray());
        return localKeyStore;
      }
      finally
      {
        Util.closeSilently(localBufferedInputStream);
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

  private HashMap<Principal, X509Certificate> initializeTrustedRoots(KeyStore paramKeyStore)
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

  public X509Certificate getTrustRootFor(X509Certificate paramX509Certificate)
  {
    X509Certificate localX509Certificate = (X509Certificate)this.mTrustRoots.get(paramX509Certificate.getIssuerX500Principal());
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

  public boolean isTrustRoot(X509Certificate paramX509Certificate)
  {
    X509Certificate localX509Certificate = (X509Certificate)this.mTrustRoots.get(paramX509Certificate.getSubjectX500Principal());
    return (localX509Certificate != null) && (localX509Certificate.getPublicKey().equals(paramX509Certificate.getPublicKey()));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.ssl.SystemKeyStore
 * JD-Core Version:    0.6.2
 */