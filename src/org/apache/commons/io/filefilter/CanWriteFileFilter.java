package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class CanWriteFileFilter extends AbstractFileFilter
  implements Serializable
{
  public static final IOFileFilter CANNOT_WRITE = new NotFileFilter(CAN_WRITE);
  public static final IOFileFilter CAN_WRITE = new CanWriteFileFilter();

  public boolean accept(File paramFile)
  {
    return paramFile.canWrite();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.filefilter.CanWriteFileFilter
 * JD-Core Version:    0.6.2
 */