package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import org.apache.commons.io.FileUtils;

public class AgeFileFilter extends AbstractFileFilter
  implements Serializable
{
  private final boolean acceptOlder;
  private final long cutoff;

  public AgeFileFilter(long paramLong)
  {
    this(paramLong, true);
  }

  public AgeFileFilter(long paramLong, boolean paramBoolean)
  {
    this.acceptOlder = paramBoolean;
    this.cutoff = paramLong;
  }

  public AgeFileFilter(File paramFile)
  {
    this(paramFile, true);
  }

  public AgeFileFilter(File paramFile, boolean paramBoolean)
  {
    this(paramFile.lastModified(), paramBoolean);
  }

  public AgeFileFilter(Date paramDate)
  {
    this(paramDate, true);
  }

  public AgeFileFilter(Date paramDate, boolean paramBoolean)
  {
    this(paramDate.getTime(), paramBoolean);
  }

  public boolean accept(File paramFile)
  {
    boolean bool = FileUtils.isFileNewer(paramFile, this.cutoff);
    if (this.acceptOlder)
    {
      if (!bool)
        bool = true;
    }
    else
      return bool;
    return false;
  }

  public String toString()
  {
    if (this.acceptOlder);
    for (String str = "<="; ; str = ">")
      return super.toString() + "(" + str + this.cutoff + ")";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.filefilter.AgeFileFilter
 * JD-Core Version:    0.6.2
 */