package org.scribe.model;

import java.io.OutputStream;

public class OAuthConfig
{
  private final String apiKey;
  private final String apiSecret;
  private final String callback;
  private final OutputStream debugStream;
  private final String scope;
  private final SignatureType signatureType;

  public OAuthConfig(String paramString1, String paramString2)
  {
    this(paramString1, paramString2, null, null, null, null);
  }

  public OAuthConfig(String paramString1, String paramString2, String paramString3, SignatureType paramSignatureType, String paramString4, OutputStream paramOutputStream)
  {
    this.apiKey = paramString1;
    this.apiSecret = paramString2;
    this.callback = paramString3;
    this.signatureType = paramSignatureType;
    this.scope = paramString4;
    this.debugStream = paramOutputStream;
  }

  public String getApiKey()
  {
    return this.apiKey;
  }

  public String getApiSecret()
  {
    return this.apiSecret;
  }

  public String getCallback()
  {
    return this.callback;
  }

  public String getScope()
  {
    return this.scope;
  }

  public SignatureType getSignatureType()
  {
    return this.signatureType;
  }

  public boolean hasScope()
  {
    return this.scope != null;
  }

  public void log(String paramString)
  {
    String str;
    if (this.debugStream != null)
      str = paramString + "\n";
    try
    {
      this.debugStream.write(str.getBytes("UTF8"));
      return;
    }
    catch (Exception localException)
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.OAuthConfig
 * JD-Core Version:    0.6.2
 */