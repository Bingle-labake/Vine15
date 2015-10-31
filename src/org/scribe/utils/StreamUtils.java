package org.scribe.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public class StreamUtils
{
  public static String getStreamContents(InputStream paramInputStream)
  {
    Preconditions.checkNotNull(paramInputStream, "Cannot get String from a null object");
    try
    {
      char[] arrayOfChar = new char[65536];
      StringBuilder localStringBuilder = new StringBuilder();
      InputStreamReader localInputStreamReader = new InputStreamReader(paramInputStream, "UTF-8");
      int i;
      do
      {
        i = localInputStreamReader.read(arrayOfChar, 0, arrayOfChar.length);
        if (i > 0)
          localStringBuilder.append(arrayOfChar, 0, i);
      }
      while (i >= 0);
      localInputStreamReader.close();
      String str = localStringBuilder.toString();
      return str;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException("Error while reading response body", localIOException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.utils.StreamUtils
 * JD-Core Version:    0.6.2
 */