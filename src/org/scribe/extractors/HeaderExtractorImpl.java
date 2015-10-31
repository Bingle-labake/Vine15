package org.scribe.extractors;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.scribe.exceptions.OAuthParametersMissingException;
import org.scribe.model.OAuthRequest;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class HeaderExtractorImpl
  implements HeaderExtractor
{
  private static final String PARAM_SEPARATOR = ", ";
  private static final String PREAMBLE = "OAuth ";

  private void checkPreconditions(OAuthRequest paramOAuthRequest)
  {
    Preconditions.checkNotNull(paramOAuthRequest, "Cannot extract a header from a null object");
    if ((paramOAuthRequest.getOauthParameters() == null) || (paramOAuthRequest.getOauthParameters().size() <= 0))
      throw new OAuthParametersMissingException(paramOAuthRequest);
  }

  public String extract(OAuthRequest paramOAuthRequest)
  {
    checkPreconditions(paramOAuthRequest);
    Map localMap = paramOAuthRequest.getOauthParameters();
    StringBuffer localStringBuffer = new StringBuffer(20 * localMap.size());
    localStringBuffer.append("OAuth ");
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (localStringBuffer.length() > "OAuth ".length())
        localStringBuffer.append(", ");
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = str;
      arrayOfObject[1] = OAuthEncoder.encode((String)localMap.get(str));
      localStringBuffer.append(String.format("%s=\"%s\"", arrayOfObject));
    }
    return localStringBuffer.toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.HeaderExtractorImpl
 * JD-Core Version:    0.6.2
 */