package org.scribe.builder.api;

import org.scribe.model.OAuthConfig;
import org.scribe.oauth.OAuthService;

public abstract interface Api
{
  public abstract OAuthService createService(OAuthConfig paramOAuthConfig);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.Api
 * JD-Core Version:    0.6.2
 */