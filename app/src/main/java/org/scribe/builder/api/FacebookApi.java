package org.scribe.builder.api;

import org.scribe.model.OAuthConfig;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class FacebookApi extends DefaultApi20
{
  private static final String AUTHORIZE_URL = "https://www.facebook.com/dialog/oauth?client_id=%s&redirect_uri=%s";
  private static final String SCOPED_AUTHORIZE_URL = "https://www.facebook.com/dialog/oauth?client_id=%s&redirect_uri=%s&scope=%s";

  public String getAccessTokenEndpoint()
  {
    return "https://graph.facebook.com/oauth/access_token";
  }

  public String getAuthorizationUrl(OAuthConfig paramOAuthConfig)
  {
    Preconditions.checkValidUrl(paramOAuthConfig.getCallback(), "Must provide a valid url as callback. Facebook does not support OOB");
    if (paramOAuthConfig.hasScope())
    {
      Object[] arrayOfObject2 = new Object[3];
      arrayOfObject2[0] = paramOAuthConfig.getApiKey();
      arrayOfObject2[1] = OAuthEncoder.encode(paramOAuthConfig.getCallback());
      arrayOfObject2[2] = OAuthEncoder.encode(paramOAuthConfig.getScope());
      return String.format("https://www.facebook.com/dialog/oauth?client_id=%s&redirect_uri=%s&scope=%s", arrayOfObject2);
    }
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = paramOAuthConfig.getApiKey();
    arrayOfObject1[1] = OAuthEncoder.encode(paramOAuthConfig.getCallback());
    return String.format("https://www.facebook.com/dialog/oauth?client_id=%s&redirect_uri=%s", arrayOfObject1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.FacebookApi
 * JD-Core Version:    0.6.2
 */