package org.scribe.services;

import org.scribe.exceptions.OAuthSignatureException;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class PlaintextSignatureService
  implements SignatureService
{
  private static final String METHOD = "plaintext";

  public String getSignature(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      Preconditions.checkEmptyString(paramString2, "Api secret cant be null or empty string");
      String str = OAuthEncoder.encode(paramString2) + '&' + OAuthEncoder.encode(paramString3);
      return str;
    }
    catch (Exception localException)
    {
      throw new OAuthSignatureException(paramString1, localException);
    }
  }

  public String getSignatureMethod()
  {
    return "plaintext";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.services.PlaintextSignatureService
 * JD-Core Version:    0.6.2
 */