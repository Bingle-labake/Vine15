package com.fasterxml.jackson.core;

public final class Base64Variants
{
  public static final Base64Variant MIME = new Base64Variant("MIME", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", true, '=', 76);
  public static final Base64Variant MIME_NO_LINEFEEDS = new Base64Variant(MIME, "MIME-NO-LINEFEEDS", 2147483647);
  public static final Base64Variant MODIFIED_FOR_URL = new Base64Variant("MODIFIED-FOR-URL", localStringBuffer.toString(), false, '\000', 2147483647);
  public static final Base64Variant PEM = new Base64Variant(MIME, "PEM", true, '=', 64);
  static final String STD_BASE64_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

  static
  {
    StringBuffer localStringBuffer = new StringBuffer("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
    localStringBuffer.setCharAt(localStringBuffer.indexOf("+"), '-');
    localStringBuffer.setCharAt(localStringBuffer.indexOf("/"), '_');
  }

  public static Base64Variant getDefaultVariant()
  {
    return MIME_NO_LINEFEEDS;
  }

  public static Base64Variant valueOf(String paramString)
    throws IllegalArgumentException
  {
    if (MIME._name.equals(paramString))
      return MIME;
    if (MIME_NO_LINEFEEDS._name.equals(paramString))
      return MIME_NO_LINEFEEDS;
    if (PEM._name.equals(paramString))
      return PEM;
    if (MODIFIED_FOR_URL._name.equals(paramString))
      return MODIFIED_FOR_URL;
    if (paramString == null);
    for (String str = "<null>"; ; str = "'" + paramString + "'")
      throw new IllegalArgumentException("No Base64Variant with name " + str);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.Base64Variants
 * JD-Core Version:    0.6.2
 */