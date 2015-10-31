package org.scribe.builder.api;

import org.scribe.extractors.AccessTokenExtractor;
import org.scribe.extractors.TokenExtractor20Impl;
import org.scribe.model.OAuthConfig;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuth20ServiceImpl;
import org.scribe.oauth.OAuthService;

public abstract class DefaultApi20
  implements Api
{
  public OAuthService createService(OAuthConfig paramOAuthConfig)
  {
    return new OAuth20ServiceImpl(this, paramOAuthConfig);
  }

  public abstract String getAccessTokenEndpoint();

  public AccessTokenExtractor getAccessTokenExtractor()
  {
    return new TokenExtractor20Impl();
  }

  public Verb getAccessTokenVerb()
  {
    return Verb.GET;
  }

  public abstract String getAuthorizationUrl(OAuthConfig paramOAuthConfig);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.DefaultApi20
 * JD-Core Version:    0.6.2
 */