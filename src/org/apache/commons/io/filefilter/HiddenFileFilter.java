package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class HiddenFileFilter extends AbstractFileFilter
  implements Serializable
{
  public static final IOFileFilter HIDDEN = new HiddenFileFilter();
  public static final IOFileFilter VISIBLE = new NotFileFilter(HIDDEN);

  public boolean accept(File paramFile)
  {
    return paramFile.isHidden();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.filefilter.HiddenFileFilter
 * JD-Core Version:    0.6.2
 */