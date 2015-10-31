package co.vine.android.util.image;

import android.graphics.Bitmap;
import co.vine.android.util.UrlResource;

public class UrlImage extends UrlResource<ImageUtils.BitmapInfo>
{
  public Bitmap bitmap;

  public UrlImage(String paramString, ImageUtils.BitmapInfo paramBitmapInfo)
  {
    super(paramString);
    this.value = paramBitmapInfo;
    if (paramBitmapInfo != null)
      this.bitmap = paramBitmapInfo.bitmap;
  }

  public int originalSize()
  {
    if (this.value != null)
      return ((ImageUtils.BitmapInfo)this.value).origWidth * ((ImageUtils.BitmapInfo)this.value).origHeight;
    return 0;
  }

  public int size()
  {
    if (this.bitmap != null)
      return this.bitmap.getRowBytes() * this.bitmap.getHeight();
    return 0;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.image.UrlImage
 * JD-Core Version:    0.6.2
 */