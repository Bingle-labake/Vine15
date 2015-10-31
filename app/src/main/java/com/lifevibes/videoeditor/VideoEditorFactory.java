package com.lifevibes.videoeditor;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class VideoEditorFactory
{
  public static VideoEditor create(String paramString)
    throws IOException
  {
    File localFile = new File(paramString);
    if (!localFile.exists())
    {
      if (!localFile.mkdirs())
        throw new FileNotFoundException("Cannot create project path: " + paramString);
      if (!new File(localFile, ".nomedia").createNewFile())
        throw new FileNotFoundException("Cannot create file .nomedia");
    }
    return new VideoEditorImpl(paramString);
  }

  public static VideoEditor create(String paramString1, String paramString2)
    throws IOException
  {
    File localFile = new File(paramString1);
    if (!localFile.exists())
    {
      if (!localFile.mkdirs())
        throw new FileNotFoundException("Cannot create project path: " + paramString1);
      if (!new File(localFile, ".nomedia").createNewFile())
        throw new FileNotFoundException("Cannot create file .nomedia");
    }
    return new VideoEditorImpl(paramString1, paramString2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.VideoEditorFactory
 * JD-Core Version:    0.6.2
 */