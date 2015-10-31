package org.scribe.builder.api;

import org.scribe.extractors.AccessTokenExtractor;
import org.scribe.extractors.JsonTokenExtractor;
import org.scribe.model.OAuthConfig;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class Foursquare2Api extends DefaultApi20
{
  private static final String AUTHORIZATION_URL = "https://foursquare.com/oauth2/authenticate?client_id=%s&response_type=code&redirect_uri=%s";

  public String getAccessTokenEndpoint()
  {
    return "https://foursquare.com/oauth2/access_token?grant_type=authorization_code";
  }

  public AccessTokenExtractor getAccessTokenExtractor()
  {
    return new JsonTokenExtractor();
  }

  public String getAuthorizationUrl(OAuthConfig paramOAuthConfig)
  {
    Preconditions.checkValidUrl(paramOAuthConfig.getCallback(), "Must provide a valid url as callback. Foursquare2 does not support OOB");
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramOAuthConfig.getApiKey();
    arrayOfObject[1] = OAuthEncoder.encode(paramOAuthConfig.getCallback());
    return String.format("https://foursquare.com/oauth2/authenticate?client_id=%s&response_type=code&redirect_uri=%s", arrayOfObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.Foursquare2Api
 * JD-Core Version:    0.6.2
 */