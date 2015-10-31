package co.vine.android.util.video;

import co.vine.android.util.UrlResource;
import java.io.File;

public class UrlVideo extends UrlResource<File>
{
  private static final long LONG_HIGH_BITS = -2147483648L;
  private File mFile;
  private Integer mSize;

  public UrlVideo(String paramString, File paramFile)
  {
    super(paramString);
    this.value = paramFile;
    if (paramFile != null)
      this.mFile = paramFile;
  }

  private int getSize()
  {
    if ((this.mSize == null) || (this.mSize.intValue() == 0))
      if (this.value == null)
        break label52;
    label52: for (this.mSize = Integer.valueOf(safeLongToInt(((File)this.value).length())); ; this.mSize = Integer.valueOf(0))
      return this.mSize.intValue();
  }

  private static int safeLongToInt(long paramLong)
  {
    if (((paramLong & 0x80000000) == 0L) || ((paramLong & 0x80000000) == -2147483648L))
      return (int)paramLong;
    throw new IllegalArgumentException("File is too large to store in cache.");
  }

  public String getAbsolutePath()
  {
    return this.mFile.getAbsolutePath();
  }

  public int originalSize()
  {
    return getSize();
  }

  public int size()
  {
    return getSize();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.video.UrlVideo
 * JD-Core Version:    0.6.2
 */