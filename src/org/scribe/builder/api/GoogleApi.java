package org.scribe.builder.api;

import org.scribe.model.Token;
import org.scribe.model.Verb;

public class GoogleApi extends DefaultApi10a
{
  private static final String AUTHORIZATION_URL = "https://www.google.com/accounts/OAuthAuthorizeToken?oauth_token=%s";

  public String getAccessTokenEndpoint()
  {
    return "https://www.google.com/accounts/OAuthGetAccessToken";
  }

  public Verb getAccessTokenVerb()
  {
    return Verb.GET;
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("https://www.google.com/accounts/OAuthAuthorizeToken?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "https://www.google.com/accounts/OAuthGetRequestToken";
  }

  public Verb getRequestTokenVerb()
  {
    return Verb.GET;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.GoogleApi
 * JD-Core Version:    0.6.2
 */