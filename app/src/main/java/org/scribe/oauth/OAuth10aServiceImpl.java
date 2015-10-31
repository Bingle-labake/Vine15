package org.scribe.oauth;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.scribe.builder.api.DefaultApi10a;
import org.scribe.extractors.AccessTokenExtractor;
import org.scribe.extractors.BaseStringExtractor;
import org.scribe.extractors.HeaderExtractor;
import org.scribe.extractors.RequestTokenExtractor;
import org.scribe.model.OAuthConfig;
import org.scribe.model.OAuthConstants;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verifier;
import org.scribe.services.SignatureService;
import org.scribe.services.TimestampService;
import org.scribe.utils.MapUtils;

public class OAuth10aServiceImpl
  implements OAuthService
{
  private static final String VERSION = "1.0";
  private DefaultApi10a api;
  private OAuthConfig config;

  public OAuth10aServiceImpl(DefaultApi10a paramDefaultApi10a, OAuthConfig paramOAuthConfig)
  {
    this.api = paramDefaultApi10a;
    this.config = paramOAuthConfig;
  }

  private void addOAuthParams(OAuthRequest paramOAuthRequest, Token paramToken)
  {
    paramOAuthRequest.addOAuthParameter("oauth_timestamp", this.api.getTimestampService().getTimestampInSeconds());
    paramOAuthRequest.addOAuthParameter("oauth_nonce", this.api.getTimestampService().getNonce());
    paramOAuthRequest.addOAuthParameter("oauth_consumer_key", this.config.getApiKey());
    paramOAuthRequest.addOAuthParameter("oauth_signature_method", this.api.getSignatureService().getSignatureMethod());
    paramOAuthRequest.addOAuthParameter("oauth_version", getVersion());
    if (this.config.hasScope())
      paramOAuthRequest.addOAuthParameter("scope", this.config.getScope());
    paramOAuthRequest.addOAuthParameter("oauth_signature", getSignature(paramOAuthRequest, paramToken));
    this.config.log("appended additional OAuth parameters: " + MapUtils.toString(paramOAuthRequest.getOauthParameters()));
  }

  private void appendSignature(OAuthRequest paramOAuthRequest)
  {
    switch (1.$SwitchMap$org$scribe$model$SignatureType[this.config.getSignatureType().ordinal()])
    {
    default:
    case 1:
    case 2:
    }
    while (true)
    {
      return;
      this.config.log("using Http Header signature");
      paramOAuthRequest.addHeader("Authorization", this.api.getHeaderExtractor().extract(paramOAuthRequest));
      return;
      this.config.log("using Querystring signature");
      Iterator localIterator = paramOAuthRequest.getOauthParameters().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        paramOAuthRequest.addQuerystringParameter((String)localEntry.getKey(), (String)localEntry.getValue());
      }
    }
  }

  private String getSignature(OAuthRequest paramOAuthRequest, Token paramToken)
  {
    this.config.log("generating signature...");
    String str1 = this.api.getBaseStringExtractor().extract(paramOAuthRequest);
    String str2 = this.api.getSignatureService().getSignature(str1, this.config.getApiSecret(), paramToken.getSecret());
    this.config.log("base string is: " + str1);
    this.config.log("signature is: " + str2);
    return str2;
  }

  public Token getAccessToken(Token paramToken, Verifier paramVerifier)
  {
    this.config.log("obtaining access token from " + this.api.getAccessTokenEndpoint());
    OAuthRequest localOAuthRequest = new OAuthRequest(this.api.getAccessTokenVerb(), this.api.getAccessTokenEndpoint());
    localOAuthRequest.addOAuthParameter("oauth_token", paramToken.getToken());
    localOAuthRequest.addOAuthParameter("oauth_verifier", paramVerifier.getValue());
    this.config.log("setting token to: " + paramToken + " and verifier to: " + paramVerifier);
    addOAuthParams(localOAuthRequest, paramToken);
    appendSignature(localOAuthRequest);
    Response localResponse = localOAuthRequest.send();
    return this.api.getAccessTokenExtractor().extract(localResponse.getBody());
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    return this.api.getAuthorizationUrl(paramToken);
  }

  public Token getRequestToken()
  {
    this.config.log("obtaining request token from " + this.api.getRequestTokenEndpoint());
    OAuthRequest localOAuthRequest = new OAuthRequest(this.api.getRequestTokenVerb(), this.api.getRequestTokenEndpoint());
    this.config.log("setting oauth_callback to " + this.config.getCallback());
    localOAuthRequest.addOAuthParameter("oauth_callback", this.config.getCallback());
    addOAuthParams(localOAuthRequest, OAuthConstants.EMPTY_TOKEN);
    appendSignature(localOAuthRequest);
    this.config.log("sending request...");
    Response localResponse = localOAuthRequest.send();
    String str = localResponse.getBody();
    this.config.log("response status code: " + localResponse.getCode());
    this.config.log("response body: " + str);
    return this.api.getRequestTokenExtractor().extract(str);
  }

  public String getVersion()
  {
    return "1.0";
  }

  public void signRequest(Token paramToken, OAuthRequest paramOAuthRequest)
  {
    this.config.log("signing request: " + paramOAuthRequest.getCompleteUrl());
    paramOAuthRequest.addOAuthParameter("oauth_token", paramToken.getToken());
    this.config.log("setting token to: " + paramToken);
    addOAuthParams(paramOAuthRequest, paramToken);
    appendSignature(paramOAuthRequest);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.oauth.OAuth10aServiceImpl
 * JD-Core Version:    0.6.2
 */