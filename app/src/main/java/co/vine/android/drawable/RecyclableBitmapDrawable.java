package co.vine.android.drawable;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import java.io.InputStream;

public class RecyclableBitmapDrawable extends BitmapDrawable
{
  public RecyclableBitmapDrawable(Resources paramResources, Bitmap paramBitmap)
  {
    super(paramResources, paramBitmap);
  }

  public RecyclableBitmapDrawable(Resources paramResources, InputStream paramInputStream)
  {
    super(paramResources, paramInputStream);
  }

  public RecyclableBitmapDrawable(Resources paramResources, String paramString)
  {
    super(paramResources, paramString);
  }

  public void draw(Canvas paramCanvas)
  {
    Bitmap localBitmap = getBitmap();
    if ((localBitmap != null) && (!localBitmap.isRecycled()));
    try
    {
      super.draw(paramCanvas);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.drawable.RecyclableBitmapDrawable
 * JD-Core Version:    0.6.2
 */