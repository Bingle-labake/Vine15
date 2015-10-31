package org.scribe.services;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
import org.scribe.exceptions.OAuthSignatureException;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class HMACSha1SignatureService
  implements SignatureService
{
  private static final String CARRIAGE_RETURN = "\r\n";
  private static final String EMPTY_STRING = "";
  private static final String HMAC_SHA1 = "HmacSHA1";
  private static final String METHOD = "HMAC-SHA1";
  private static final String UTF8 = "UTF-8";

  private String doSign(String paramString1, String paramString2)
    throws Exception
  {
    SecretKeySpec localSecretKeySpec = new SecretKeySpec(paramString2.getBytes("UTF-8"), "HmacSHA1");
    Mac localMac = Mac.getInstance("HmacSHA1");
    localMac.init(localSecretKeySpec);
    return new String(Base64.encodeBase64(localMac.doFinal(paramString1.getBytes("UTF-8")))).replace("\r\n", "");
  }

  public String getSignature(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      Preconditions.checkEmptyString(paramString1, "Base string cant be null or empty string");
      Preconditions.checkEmptyString(paramString2, "Api secret cant be null or empty string");
      String str = doSign(paramString1, OAuthEncoder.encode(paramString2) + '&' + OAuthEncoder.encode(paramString3));
      return str;
    }
    catch (Exception localException)
    {
      throw new OAuthSignatureException(paramString1, localException);
    }
  }

  public String getSignatureMethod()
  {
    return "HMAC-SHA1";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.services.HMACSha1SignatureService
 * JD-Core Version:    0.6.2
 */