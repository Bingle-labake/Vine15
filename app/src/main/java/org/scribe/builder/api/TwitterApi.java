package org.scribe.builder.api;

import org.scribe.model.Token;

public class TwitterApi extends DefaultApi10a
{
  private static final String ACCESS_TOKEN_RESOURCE = "api.twitter.com/oauth/access_token";
  private static final String AUTHORIZE_URL = "https://api.twitter.com/oauth/authorize?oauth_token=%s";
  private static final String REQUEST_TOKEN_RESOURCE = "api.twitter.com/oauth/request_token";

  public String getAccessTokenEndpoint()
  {
    return "http://api.twitter.com/oauth/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("https://api.twitter.com/oauth/authorize?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "http://api.twitter.com/oauth/request_token";
  }

  public static class Authenticate extends TwitterApi.SSL
  {
    private static final String AUTHENTICATE_URL = "https://api.twitter.com/oauth/authenticate?oauth_token=%s";

    public String getAuthorizationUrl(Token paramToken)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = paramToken.getToken();
      return String.format("https://api.twitter.com/oauth/authenticate?oauth_token=%s", arrayOfObject);
    }
  }

  public static class Authorize extends TwitterApi.SSL
  {
  }

  public static class SSL extends TwitterApi
  {
    public String getAccessTokenEndpoint()
    {
      return "https://api.twitter.com/oauth/access_token";
    }

    public String getRequestTokenEndpoint()
    {
      return "https://api.twitter.com/oauth/request_token";
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.TwitterApi
 * JD-Core Version:    0.6.2
 */