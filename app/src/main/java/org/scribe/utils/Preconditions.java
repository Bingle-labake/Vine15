package org.scribe.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Preconditions
{
  private static final String DEFAULT_MESSAGE = "Received an invalid parameter";
  private static final Pattern URL_PATTERN = Pattern.compile("[a-zA-Z_-]+://\\S+");

  private static void check(boolean paramBoolean, String paramString)
  {
    if ((paramString == null) || (paramString.trim().length() <= 0));
    for (String str = "Received an invalid parameter"; !paramBoolean; str = paramString)
      throw new IllegalArgumentException(str);
  }

  public static void checkEmptyString(String paramString1, String paramString2)
  {
    if ((paramString1 != null) && (!paramString1.trim().equals("")));
    for (boolean bool = true; ; bool = false)
    {
      check(bool, paramString2);
      return;
    }
  }

  public static void checkNotNull(Object paramObject, String paramString)
  {
    if (paramObject != null);
    for (boolean bool = true; ; bool = false)
    {
      check(bool, paramString);
      return;
    }
  }

  public static void checkValidOAuthCallback(String paramString1, String paramString2)
  {
    checkEmptyString(paramString1, paramString2);
    if (paramString1.toLowerCase().compareToIgnoreCase("oob") != 0)
      check(isUrl(paramString1), paramString2);
  }

  public static void checkValidUrl(String paramString1, String paramString2)
  {
    checkEmptyString(paramString1, paramString2);
    check(isUrl(paramString1), paramString2);
  }

  private static boolean isUrl(String paramString)
  {
    return URL_PATTERN.matcher(paramString).matches();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.utils.Preconditions
 * JD-Core Version:    0.6.2
 */