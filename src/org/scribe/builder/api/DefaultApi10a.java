package org.scribe.builder.api;

import org.scribe.extractors.AccessTokenExtractor;
import org.scribe.extractors.BaseStringExtractor;
import org.scribe.extractors.BaseStringExtractorImpl;
import org.scribe.extractors.HeaderExtractor;
import org.scribe.extractors.HeaderExtractorImpl;
import org.scribe.extractors.RequestTokenExtractor;
import org.scribe.extractors.TokenExtractorImpl;
import org.scribe.model.OAuthConfig;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuth10aServiceImpl;
import org.scribe.oauth.OAuthService;
import org.scribe.services.HMACSha1SignatureService;
import org.scribe.services.SignatureService;
import org.scribe.services.TimestampService;
import org.scribe.services.TimestampServiceImpl;

public abstract class DefaultApi10a
  implements Api
{
  public OAuthService createService(OAuthConfig paramOAuthConfig)
  {
    return new OAuth10aServiceImpl(this, paramOAuthConfig);
  }

  public abstract String getAccessTokenEndpoint();

  public AccessTokenExtractor getAccessTokenExtractor()
  {
    return new TokenExtractorImpl();
  }

  public Verb getAccessTokenVerb()
  {
    return Verb.POST;
  }

  public abstract String getAuthorizationUrl(Token paramToken);

  public BaseStringExtractor getBaseStringExtractor()
  {
    return new BaseStringExtractorImpl();
  }

  public HeaderExtractor getHeaderExtractor()
  {
    return new HeaderExtractorImpl();
  }

  public abstract String getRequestTokenEndpoint();

  public RequestTokenExtractor getRequestTokenExtractor()
  {
    return new TokenExtractorImpl();
  }

  public Verb getRequestTokenVerb()
  {
    return Verb.POST;
  }

  public SignatureService getSignatureService()
  {
    return new HMACSha1SignatureService();
  }

  public TimestampService getTimestampService()
  {
    return new TimestampServiceImpl();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.DefaultApi10a
 * JD-Core Version:    0.6.2
 */