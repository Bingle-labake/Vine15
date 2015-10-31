package org.scribe.oauth;

import org.scribe.builder.api.DefaultApi20;
import org.scribe.extractors.AccessTokenExtractor;
import org.scribe.model.OAuthConfig;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verifier;

public class OAuth20ServiceImpl
  implements OAuthService
{
  private static final String VERSION = "2.0";
  private final DefaultApi20 api;
  private final OAuthConfig config;

  public OAuth20ServiceImpl(DefaultApi20 paramDefaultApi20, OAuthConfig paramOAuthConfig)
  {
    this.api = paramDefaultApi20;
    this.config = paramOAuthConfig;
  }

  public Token getAccessToken(Token paramToken, Verifier paramVerifier)
  {
    OAuthRequest localOAuthRequest = new OAuthRequest(this.api.getAccessTokenVerb(), this.api.getAccessTokenEndpoint());
    localOAuthRequest.addQuerystringParameter("client_id", this.config.getApiKey());
    localOAuthRequest.addQuerystringParameter("client_secret", this.config.getApiSecret());
    localOAuthRequest.addQuerystringParameter("code", paramVerifier.getValue());
    localOAuthRequest.addQuerystringParameter("redirect_uri", this.config.getCallback());
    if (this.config.hasScope())
      localOAuthRequest.addQuerystringParameter("scope", this.config.getScope());
    Response localResponse = localOAuthRequest.send();
    return this.api.getAccessTokenExtractor().extract(localResponse.getBody());
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    return this.api.getAuthorizationUrl(this.config);
  }

  public Token getRequestToken()
  {
    throw new UnsupportedOperationException("Unsupported operation, please use 'getAuthorizationUrl' and redirect your users there");
  }

  public String getVersion()
  {
    return "2.0";
  }

  public void signRequest(Token paramToken, OAuthRequest paramOAuthRequest)
  {
    paramOAuthRequest.addQuerystringParameter("access_token", paramToken.getToken());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.oauth.OAuth20ServiceImpl
 * JD-Core Version:    0.6.2
 */