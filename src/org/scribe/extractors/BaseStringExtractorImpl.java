package org.scribe.extractors;

import java.util.Map;
import org.scribe.exceptions.OAuthParametersMissingException;
import org.scribe.model.OAuthRequest;
import org.scribe.model.ParameterList;
import org.scribe.model.Verb;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class BaseStringExtractorImpl
  implements BaseStringExtractor
{
  private static final String AMPERSAND_SEPARATED_STRING = "%s&%s&%s";

  private void checkPreconditions(OAuthRequest paramOAuthRequest)
  {
    Preconditions.checkNotNull(paramOAuthRequest, "Cannot extract base string from null object");
    if ((paramOAuthRequest.getOauthParameters() == null) || (paramOAuthRequest.getOauthParameters().size() <= 0))
      throw new OAuthParametersMissingException(paramOAuthRequest);
  }

  private String getSortedAndEncodedParams(OAuthRequest paramOAuthRequest)
  {
    ParameterList localParameterList = new ParameterList();
    localParameterList.addAll(paramOAuthRequest.getQueryStringParams());
    localParameterList.addAll(paramOAuthRequest.getBodyParams());
    localParameterList.addAll(new ParameterList(paramOAuthRequest.getOauthParameters()));
    return localParameterList.sort().asOauthBaseString();
  }

  public String extract(OAuthRequest paramOAuthRequest)
  {
    checkPreconditions(paramOAuthRequest);
    return String.format("%s&%s&%s", new Object[] { OAuthEncoder.encode(paramOAuthRequest.getVerb().name()), OAuthEncoder.encode(paramOAuthRequest.getSanitizedUrl()), getSortedAndEncodedParams(paramOAuthRequest) });
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.BaseStringExtractorImpl
 * JD-Core Version:    0.6.2
 */