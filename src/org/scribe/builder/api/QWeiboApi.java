package org.scribe.builder.api;

import org.scribe.model.Token;

public class QWeiboApi extends DefaultApi10a
{
  private static final String ACCESS_TOKEN_URL = "https://open.t.qq.com/cgi-bin/access_token";
  private static final String AUTHORIZE_URL = "https://open.t.qq.com/cgi-bin/authorize?oauth_token=%s";
  private static final String REQUEST_TOKEN_URL = "https://open.t.qq.com/cgi-bin/request_token";

  public String getAccessTokenEndpoint()
  {
    return "https://open.t.qq.com/cgi-bin/access_token";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramToken.getToken();
    return String.format("https://open.t.qq.com/cgi-bin/authorize?oauth_token=%s", arrayOfObject);
  }

  public String getRequestTokenEndpoint()
  {
    return "https://open.t.qq.com/cgi-bin/request_token";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.QWeiboApi
 * JD-Core Version:    0.6.2
 */