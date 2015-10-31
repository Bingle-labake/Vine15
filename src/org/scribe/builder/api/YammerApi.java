package org.scribe.builder.api;

import org.scribe.model.Token;
import org.scribe.services.PlaintextSignatureService;
import org.scribe.services.SignatureService;

public class YammerApi extends DefaultApi10a
{
  private static final String AUTHORIZATION_URL = "'https://www.yammer.com/oauth/authorize?oauth_token=%s'";

  public String getAccessTokenEndpoint()
  {
    return "https://www.yammer.com/oauth/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("'https://www.yammer.com/oauth/authorize?oauth_token=%s'", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "https://www.yammer.com/oauth/request_token";
  }

  public SignatureService getSignatureService()
  {
    return new PlaintextSignatureService();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.YammerApi
 * JD-Core Version:    0.6.2
 */