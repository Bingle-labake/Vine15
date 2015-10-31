package com.crashlytics.android;

import java.security.GeneralSecurityException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.LinkedList;
import javax.security.auth.x500.X500Principal;

class c
{
  private final String a;
  private final int b;
  private final int c;

  public c(String paramString, int paramInt1, int paramInt2)
  {
    this.a = paramString;
    this.b = paramInt1;
    this.c = paramInt2;
  }

  public static int a(int paramInt)
  {
    if ((paramInt >= 200) && (paramInt <= 299));
    do
    {
      return 0;
      if ((paramInt >= 300) && (paramInt <= 399))
        return 1;
    }
    while ((paramInt >= 400) && (paramInt <= 499));
    if (paramInt >= 500)
      return 1;
    return 1;
  }

  private static boolean a(X509Certificate paramX509Certificate1, X509Certificate paramX509Certificate2)
  {
    if (!paramX509Certificate1.getSubjectX500Principal().equals(paramX509Certificate2.getIssuerX500Principal()))
      return false;
    try
    {
      paramX509Certificate2.verify(paramX509Certificate1.getPublicKey());
      return true;
    }
    catch (GeneralSecurityException localGeneralSecurityException)
    {
    }
    return false;
  }

  public static X509Certificate[] a(X509Certificate[] paramArrayOfX509Certificate, at paramat)
    throws CertificateException
  {
    int i = 1;
    LinkedList localLinkedList = new LinkedList();
    if (paramat.a(paramArrayOfX509Certificate[0]));
    for (int j = i; ; j = 0)
    {
      localLinkedList.add(paramArrayOfX509Certificate[0]);
      int k = j;
      for (int m = i; m < paramArrayOfX509Certificate.length; m++)
      {
        if (paramat.a(paramArrayOfX509Certificate[m]))
          k = i;
        if (!a(paramArrayOfX509Certificate[m], paramArrayOfX509Certificate[(m - 1)]))
          break;
        localLinkedList.add(paramArrayOfX509Certificate[m]);
      }
      X509Certificate localX509Certificate = paramat.b(paramArrayOfX509Certificate[(m - 1)]);
      if (localX509Certificate != null)
        localLinkedList.add(localX509Certificate);
      while (true)
      {
        if (i != 0)
          return (X509Certificate[])localLinkedList.toArray(new X509Certificate[localLinkedList.size()]);
        throw new CertificateException("Didn't find a trust anchor in chain cleanup!");
        i = k;
      }
    }
  }

  public String a()
  {
    return this.a;
  }

  public int b()
  {
    return this.b;
  }

  public int c()
  {
    return this.c;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.c
 * JD-Core Version:    0.6.2
 */