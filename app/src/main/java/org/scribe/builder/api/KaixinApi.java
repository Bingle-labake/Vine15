package org.scribe.builder.api;

import org.scribe.model.Token;
import org.scribe.model.Verb;

public class KaixinApi extends DefaultApi10a
{
  private static final String ACCESS_TOKEN_URL = "http://api.kaixin001.com/oauth/access_token";
  private static final String AUTHORIZE_URL = "http://api.kaixin001.com/oauth/authorize?oauth_token=%s";
  private static final String REQUEST_TOKEN_URL = "http://api.kaixin001.com/oauth/request_token";

  public String getAccessTokenEndpoint()
  {
    return "http://api.kaixin001.com/oauth/access_token";
  }

  public Verb getAccessTokenVerb()
  {
    return Verb.GET;
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("http://api.kaixin001.com/oauth/authorize?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "http://api.kaixin001.com/oauth/request_token";
  }

  public Verb getRequestTokenVerb()
  {
    return Verb.GET;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.KaixinApi
 * JD-Core Version:    0.6.2
 */