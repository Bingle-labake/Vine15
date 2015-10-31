package org.scribe.extractors;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.scribe.exceptions.OAuthException;
import org.scribe.model.Token;
import org.scribe.utils.Preconditions;

public class JsonTokenExtractor
  implements AccessTokenExtractor
{
  private Pattern accessTokenPattern = Pattern.compile("\"access_token\":\\s*\"(\\S*?)\"");

  public Token extract(String paramString)
  {
    Preconditions.checkEmptyString(paramString, "Cannot extract a token from a null or empty String");
    Matcher localMatcher = this.accessTokenPattern.matcher(paramString);
    if (localMatcher.find())
      return new Token(localMatcher.group(1), "", paramString);
    throw new OAuthException("Cannot extract an acces token. Response was: " + paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.JsonTokenExtractor
 * JD-Core Version:    0.6.2
 */