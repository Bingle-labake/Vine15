package org.scribe.extractors;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.scribe.exceptions.OAuthException;
import org.scribe.model.Token;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class TokenExtractorImpl
  implements RequestTokenExtractor, AccessTokenExtractor
{
  private static final Pattern SECRET_REGEX = Pattern.compile("oauth_token_secret=([^&]+)");
  private static final Pattern TOKEN_REGEX = Pattern.compile("oauth_token=([^&]+)");

  private String extract(String paramString, Pattern paramPattern)
  {
    Matcher localMatcher = paramPattern.matcher(paramString);
    if ((localMatcher.find()) && (localMatcher.groupCount() >= 1))
      return OAuthEncoder.decode(localMatcher.group(1));
    throw new OAuthException("Response body is incorrect. Can't extract token and secret from this: '" + paramString + "'", null);
  }

  public Token extract(String paramString)
  {
    Preconditions.checkEmptyString(paramString, "Response body is incorrect. Can't extract a token from an empty string");
    return new Token(extract(paramString, TOKEN_REGEX), extract(paramString, SECRET_REGEX), paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.TokenExtractorImpl
 * JD-Core Version:    0.6.2
 */