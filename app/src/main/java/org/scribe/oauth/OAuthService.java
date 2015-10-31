package org.scribe.oauth;

import org.scribe.model.OAuthRequest;
import org.scribe.model.Token;
import org.scribe.model.Verifier;

public abstract interface OAuthService
{
  public abstract Token getAccessToken(Token paramToken, Verifier paramVerifier);

  public abstract String getAuthorizationUrl(Token paramToken);

  public abstract Token getRequestToken();

  public abstract String getVersion();

  public abstract void signRequest(Token paramToken, OAuthRequest paramOAuthRequest);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.oauth.OAuthService
 * JD-Core Version:    0.6.2
 */