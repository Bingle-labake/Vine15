package org.scribe.extractors;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.scribe.exceptions.OAuthException;
import org.scribe.model.Token;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class TokenExtractor20Impl
  implements AccessTokenExtractor
{
  private static final String EMPTY_SECRET = "";
  private static final String TOKEN_REGEX = "access_token=([^&]+)";

  public Token extract(String paramString)
  {
    Preconditions.checkEmptyString(paramString, "Response body is incorrect. Can't extract a token from an empty string");
    Matcher localMatcher = Pattern.compile("access_token=([^&]+)").matcher(paramString);
    if (localMatcher.find())
      return new Token(OAuthEncoder.decode(localMatcher.group(1)), "", paramString);
    throw new OAuthException("Response body is incorrect. Can't extract a token from this: '" + paramString + "'", null);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.TokenExtractor20Impl
 * JD-Core Version:    0.6.2
 */