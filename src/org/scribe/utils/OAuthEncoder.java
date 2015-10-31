package org.scribe.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Pattern;
import org.scribe.exceptions.OAuthException;

public class OAuthEncoder
{
  private static String CHARSET = "UTF-8";
  private static final Map<String, String> ENCODING_RULES = Collections.unmodifiableMap(localHashMap);

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("*", "%2A");
    localHashMap.put("+", "%20");
    localHashMap.put("%7E", "~");
  }

  private static String applyRule(String paramString1, String paramString2, String paramString3)
  {
    return paramString1.replaceAll(Pattern.quote(paramString2), paramString3);
  }

  public static String decode(String paramString)
  {
    Preconditions.checkNotNull(paramString, "Cannot decode null object");
    try
    {
      String str = URLDecoder.decode(paramString, CHARSET);
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new OAuthException("Charset not found while decoding string: " + CHARSET, localUnsupportedEncodingException);
    }
  }

  public static String encode(String paramString)
  {
    Preconditions.checkNotNull(paramString, "Cannot encode null object");
    String str2;
    try
    {
      String str1 = URLEncoder.encode(paramString, CHARSET);
      str2 = str1;
      Iterator localIterator = ENCODING_RULES.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        str2 = applyRule(str2, (String)localEntry.getKey(), (String)localEntry.getValue());
      }
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new OAuthException("Charset not found while encoding string: " + CHARSET, localUnsupportedEncodingException);
    }
    return str2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.utils.OAuthEncoder
 * JD-Core Version:    0.6.2
 */