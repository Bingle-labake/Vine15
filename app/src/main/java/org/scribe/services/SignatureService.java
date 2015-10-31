package org.scribe.services;

public abstract interface SignatureService
{
  public abstract String getSignature(String paramString1, String paramString2, String paramString3);

  public abstract String getSignatureMethod();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.services.SignatureService
 * JD-Core Version:    0.6.2
 */