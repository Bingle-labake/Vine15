package org.scribe.builder.api;

import org.scribe.model.Token;

public class PlurkApi extends DefaultApi10a
{
  private static final String ACCESS_TOKEN_URL = "http://www.plurk.com/OAuth/access_token";
  private static final String AUTHORIZATION_URL = "http://www.plurk.com/OAuth/authorize?oauth_token=%s";
  private static final String REQUEST_TOKEN_URL = "http://www.plurk.com/OAuth/request_token";

  public String getAccessTokenEndpoint()
  {
    return "http://www.plurk.com/OAuth/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("http://www.plurk.com/OAuth/authorize?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "http://www.plurk.com/OAuth/request_token";
  }

  public class Mobile extends PlurkApi
  {
    private static final String AUTHORIZATION_URL = "http://www.plurk.com/m/authorize?oauth_token=%s";

    public Mobile()
    {
    }

    public String getAuthorizationUrl(Token paramToken)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = paramToken.getToken();
      return String.format("http://www.plurk.com/m/authorize?oauth_token=%s", arrayOfObject);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.PlurkApi
 * JD-Core Version:    0.6.2
 */