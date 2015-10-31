package org.scribe.builder.api;

import org.scribe.extractors.AccessTokenExtractor;
import org.scribe.extractors.JsonTokenExtractor;
import org.scribe.model.OAuthConfig;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class VkontakteApi extends DefaultApi20
{
  private static final String AUTHORIZE_URL = "https://api.vkontakte.ru/oauth/authorize?client_id=%s&redirect_uri=%s&response_type=code";
  private static final String SCOPED_AUTHORIZE_URL = String.format("%s&scope=%%s", new Object[] { "https://api.vkontakte.ru/oauth/authorize?client_id=%s&redirect_uri=%s&response_type=code" });

  public String getAccessTokenEndpoint()
  {
    return "https://api.vkontakte.ru/oauth/access_token";
  }

  public AccessTokenExtractor getAccessTokenExtractor()
  {
    return new JsonTokenExtractor();
  }

  public String getAuthorizationUrl(OAuthConfig paramOAuthConfig)
  {
    Preconditions.checkValidUrl(paramOAuthConfig.getCallback(), "Valid url is required for a callback. Vkontakte does not support OOB");
    if (paramOAuthConfig.hasScope())
    {
      String str = SCOPED_AUTHORIZE_URL;
      Object[] arrayOfObject2 = new Object[3];
      arrayOfObject2[0] = paramOAuthConfig.getApiKey();
      arrayOfObject2[1] = OAuthEncoder.encode(paramOAuthConfig.getCallback());
      arrayOfObject2[2] = OAuthEncoder.encode(paramOAuthConfig.getScope());
      return String.format(str, arrayOfObject2);
    }
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = paramOAuthConfig.getApiKey();
    arrayOfObject1[1] = OAuthEncoder.encode(paramOAuthConfig.getCallback());
    return String.format("https://api.vkontakte.ru/oauth/authorize?client_id=%s&redirect_uri=%s&response_type=code", arrayOfObject1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.VkontakteApi
 * JD-Core Version:    0.6.2
 */