package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class DirectoryFileFilter extends AbstractFileFilter
  implements Serializable
{
  public static final IOFileFilter DIRECTORY = new DirectoryFileFilter();
  public static final IOFileFilter INSTANCE = DIRECTORY;

  public boolean accept(File paramFile)
  {
    return paramFile.isDirectory();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.filefilter.DirectoryFileFilter
 * JD-Core Version:    0.6.2
 */