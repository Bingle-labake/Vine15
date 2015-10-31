package org.scribe.builder.api;

import org.scribe.model.Token;

public class YahooApi extends DefaultApi10a
{
  private static final String AUTHORIZE_URL = "https://api.login.yahoo.com/oauth/v2/request_auth?oauth_token=%s";

  public String getAccessTokenEndpoint()
  {
    return "https://api.login.yahoo.com/oauth/v2/get_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("https://api.login.yahoo.com/oauth/v2/request_auth?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "https://api.login.yahoo.com/oauth/v2/get_request_token";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.YahooApi
 * JD-Core Version:    0.6.2
 */