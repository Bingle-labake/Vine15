package org.scribe.builder.api;

import org.scribe.model.Token;
import org.scribe.model.Verb;

public class EvernoteApi extends DefaultApi10a
{
  private static final String AUTHORIZATION_URL = "https://www.evernote.com/OAuth.action?oauth_token=%s";

  public String getAccessTokenEndpoint()
  {
    return "https://www.evernote.com/oauth";
  }

  public Verb getAccessTokenVerb()
  {
    return Verb.GET;
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("https://www.evernote.com/OAuth.action?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "https://www.evernote.com/oauth";
  }

  public Verb getRequestTokenVerb()
  {
    return Verb.GET;
  }

  public static class Sandbox extends EvernoteApi
  {
    private static final String SANDBOX_URL = "https://sandbox.evernote.com/oauth";

    public String getAccessTokenEndpoint()
    {
      return "https://sandbox.evernote.com/oauth";
    }

    public String getAuthorizationUrl(Token paramToken)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = paramToken.getToken();
      return String.format("https://sandbox.evernote.com/oauth?oauth_token=%s", arrayOfObject);
    }

    public String getRequestTokenEndpoint()
    {
      return "https://sandbox.evernote.com/oauth";
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.EvernoteApi
 * JD-Core Version:    0.6.2
 */