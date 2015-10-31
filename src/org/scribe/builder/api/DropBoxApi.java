package org.scribe.builder.api;

import org.scribe.model.Token;

public class DropBoxApi extends DefaultApi10a
{
  public String getAccessTokenEndpoint()
  {
    return "https://api.dropbox.com/0/oauth/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    return "https://www.dropbox.com/0/oauth/authorize?oauth_token=" + paramToken.getToken();
  }

  public String getRequestTokenEndpoint()
  {
    return "https://api.dropbox.com/0/oauth/request_token";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.DropBoxApi
 * JD-Core Version:    0.6.2
 */