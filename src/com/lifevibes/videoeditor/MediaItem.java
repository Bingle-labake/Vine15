package com.lifevibes.videoeditor;

import android.graphics.Bitmap;
import java.io.IOException;

public abstract class MediaItem extends BaseMediaItem
{
  public static final int END_OF_FILE = -1;
  public static final int RENDERING_MODE_BLACK_BORDER = 0;
  public static final int RENDERING_MODE_CROPPING = 2;
  public static final int RENDERING_MODE_STRETCH = 1;
  private final String mProjectPath;
  private int mRenderingMode;

  protected MediaItem(VideoEditor paramVideoEditor, String paramString1, String paramString2, int paramInt)
    throws IOException
  {
    super(paramVideoEditor, paramString1, paramString2);
    this.mRenderingMode = paramInt;
    this.mProjectPath = paramVideoEditor.getPath();
  }

  public abstract int getAspectRatio();

  public abstract int getHeight();

  public int getRenderingMode()
  {
    return this.mRenderingMode;
  }

  public abstract int getWidth();

  public void setRenderingMode(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Invalid Rendering Mode");
    case 0:
    case 1:
    case 2:
    }
    this.mRenderingMode = paramInt;
  }

  public static abstract interface GetThumbnailListCallback
  {
    public abstract void onThumbnail(Bitmap paramBitmap, int paramInt1, int paramInt2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.MediaItem
 * JD-Core Version:    0.6.2
 */