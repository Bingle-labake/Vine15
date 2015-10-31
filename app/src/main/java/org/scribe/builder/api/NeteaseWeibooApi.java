package org.scribe.builder.api;

import org.scribe.model.Token;

public class NeteaseWeibooApi extends DefaultApi10a
{
  private static final String ACCESS_TOKEN_URL = "http://api.t.163.com/oauth/access_token";
  private static final String AUTHENTICATE_URL = "http://api.t.163.com/oauth/authenticate?oauth_token=%s";
  private static final String AUTHORIZE_URL = "http://api.t.163.com/oauth/authorize?oauth_token=%s";
  private static final String REQUEST_TOKEN_URL = "http://api.t.163.com/oauth/request_token";

  public String getAccessTokenEndpoint()
  {
    return "http://api.t.163.com/oauth/access_token";
  }

  public String getAuthenticateUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("http://api.t.163.com/oauth/authenticate?oauth_token=%s", arrayOfObject);
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("http://api.t.163.com/oauth/authorize?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "http://api.t.163.com/oauth/request_token";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.NeteaseWeibooApi
 * JD-Core Version:    0.6.2
 */