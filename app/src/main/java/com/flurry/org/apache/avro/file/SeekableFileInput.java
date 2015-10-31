package com.flurry.org.apache.avro.file;

import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class SeekableFileInput extends FileInputStream
  implements SeekableInput
{
  public SeekableFileInput(File paramFile)
    throws IOException
  {
    super(paramFile);
  }

  public SeekableFileInput(FileDescriptor paramFileDescriptor)
    throws IOException
  {
    super(paramFileDescriptor);
  }

  public long length()
    throws IOException
  {
    return getChannel().size();
  }

  public void seek(long paramLong)
    throws IOException
  {
    getChannel().position(paramLong);
  }

  public long tell()
    throws IOException
  {
    return getChannel().position();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.SeekableFileInput
 * JD-Core Version:    0.6.2
 */