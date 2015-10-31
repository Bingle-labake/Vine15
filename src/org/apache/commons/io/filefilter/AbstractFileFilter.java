package org.apache.commons.io.filefilter;

import java.io.File;

public abstract class AbstractFileFilter
  implements IOFileFilter
{
  public boolean accept(File paramFile)
  {
    return accept(paramFile.getParentFile(), paramFile.getName());
  }

  public boolean accept(File paramFile, String paramString)
  {
    return accept(new File(paramFile, paramString));
  }

  public String toString()
  {
    return getClass().getSimpleName();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.filefilter.AbstractFileFilter
 * JD-Core Version:    0.6.2
 */