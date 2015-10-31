package org.scribe.builder.api;

import org.scribe.model.Token;

public class ConstantContactApi extends DefaultApi10a
{
  private static final String AUTHORIZE_URL = "https://oauth.constantcontact.com/ws/oauth/confirm_access?oauth_token=%s";

  public String getAccessTokenEndpoint()
  {
    return "https://oauth.constantcontact.com/ws/oauth/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("https://oauth.constantcontact.com/ws/oauth/confirm_access?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "https://oauth.constantcontact.com/ws/oauth/request_token";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.ConstantContactApi
 * JD-Core Version:    0.6.2
 */