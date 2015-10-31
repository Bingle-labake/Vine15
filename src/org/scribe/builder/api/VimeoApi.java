package org.scribe.builder.api;

import org.scribe.model.Token;

public class VimeoApi extends DefaultApi10a
{
  private static final String AUTHORIZATION_URL = "http://vimeo.com/oauth/authorize?oauth_token=%s";

  public String getAccessTokenEndpoint()
  {
    return "http://vimeo.com/oauth/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("http://vimeo.com/oauth/authorize?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "http://vimeo.com/oauth/request_token";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.VimeoApi
 * JD-Core Version:    0.6.2
 */