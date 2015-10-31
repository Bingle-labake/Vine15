package com.lifevibes.videoeditor;

import java.io.File;
import java.io.IOException;

public abstract class BaseMediaItem
{
  protected final String mFilename;
  protected final MediaArtistNativeHelper mMANativeHelper;
  protected final String mUniqueId;

  protected BaseMediaItem(VideoEditor paramVideoEditor, String paramString1, String paramString2)
    throws IOException
  {
    if (paramString2 == null)
      throw new IllegalArgumentException("MediaItem : filename is null");
    if (!new File(paramString2).exists())
      throw new IOException(paramString2 + " not found ! ");
    this.mUniqueId = paramString1;
    this.mFilename = paramString2;
    this.mMANativeHelper = ((VideoEditorImpl)paramVideoEditor).getNativeContext();
  }

  public abstract long getDuration();

  public abstract int getFileType();

  public String getFilename()
  {
    return this.mFilename;
  }

  public String getId()
  {
    return this.mUniqueId;
  }

  MediaArtistNativeHelper getNativeContext()
  {
    return this.mMANativeHelper;
  }

  public abstract long getTimelineDuration();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.BaseMediaItem
 * JD-Core Version:    0.6.2
 */