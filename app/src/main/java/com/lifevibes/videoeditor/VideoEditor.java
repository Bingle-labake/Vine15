package com.lifevibes.videoeditor;

import java.io.IOException;

public abstract interface VideoEditor
{
  public static final int DURATION_OF_STORYBOARD = -1;
  public static final long MAX_SUPPORTED_FILE_SIZE = 2147483648L;

  public abstract void addMediaItem(MediaItem paramMediaItem);

  public abstract void cancelExport(String paramString);

  public abstract void export(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, ExportProgressListener paramExportProgressListener)
    throws IOException, IllegalStateException;

  public abstract int getAspectRatio();

  public abstract String getPath();

  public abstract void release();

  public abstract void setAspectRatio(int paramInt);

  public static abstract interface ExportProgressListener
  {
    public abstract void onProgress(VideoEditor paramVideoEditor, String paramString, int paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.VideoEditor
 * JD-Core Version:    0.6.2
 */