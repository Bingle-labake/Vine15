package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.IOCase;

public class RegexFileFilter extends AbstractFileFilter
  implements Serializable
{
  private final Pattern pattern;

  public RegexFileFilter(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Pattern is missing");
    this.pattern = Pattern.compile(paramString);
  }

  public RegexFileFilter(String paramString, int paramInt)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Pattern is missing");
    this.pattern = Pattern.compile(paramString, paramInt);
  }

  public RegexFileFilter(String paramString, IOCase paramIOCase)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Pattern is missing");
    int i = 0;
    if (paramIOCase != null)
    {
      boolean bool = paramIOCase.isCaseSensitive();
      i = 0;
      if (!bool)
        i = 2;
    }
    this.pattern = Pattern.compile(paramString, i);
  }

  public RegexFileFilter(Pattern paramPattern)
  {
    if (paramPattern == null)
      throw new IllegalArgumentException("Pattern is missing");
    this.pattern = paramPattern;
  }

  public boolean accept(File paramFile, String paramString)
  {
    return this.pattern.matcher(paramString).matches();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.filefilter.RegexFileFilter
 * JD-Core Version:    0.6.2
 */