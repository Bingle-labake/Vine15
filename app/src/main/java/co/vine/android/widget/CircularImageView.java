package co.vine.android.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ImageView;

public class CircularImageView extends ImageView
{
  public CircularImageView(Context paramContext)
  {
    super(paramContext);
  }

  public CircularImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public CircularImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  public static Bitmap getCroppedBitmap(Bitmap paramBitmap, int paramInt)
  {
    Bitmap localBitmap1 = Bitmap.createScaledBitmap(paramBitmap, paramInt, paramInt, false);
    Bitmap localBitmap2 = Bitmap.createBitmap(localBitmap1.getWidth(), localBitmap1.getHeight(), Bitmap.Config.ARGB_8888);
    Canvas localCanvas = new Canvas(localBitmap2);
    Paint localPaint = new Paint();
    Rect localRect = new Rect(0, 0, localBitmap1.getWidth(), localBitmap1.getHeight());
    localPaint.setAntiAlias(true);
    localPaint.setFilterBitmap(true);
    localPaint.setDither(true);
    localCanvas.drawARGB(0, 0, 0, 0);
    localCanvas.drawCircle(localBitmap1.getWidth() / 2, localBitmap1.getHeight() / 2, localBitmap1.getWidth() / 2, localPaint);
    localPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
    localCanvas.drawBitmap(localBitmap1, localRect, localRect, localPaint);
    return localBitmap2;
  }

  protected void onDraw(Canvas paramCanvas)
  {
    Drawable localDrawable = getDrawable();
    if (localDrawable == null);
    while ((getWidth() == 0) || (getHeight() == 0))
      return;
    if ((localDrawable instanceof BitmapDrawable))
    {
      Bitmap localBitmap = ((BitmapDrawable)localDrawable).getBitmap().copy(Bitmap.Config.ARGB_8888, true);
      int i = getWidth();
      int j = getHeight();
      if (i < j);
      for (int k = i; ; k = j)
      {
        paramCanvas.drawBitmap(getCroppedBitmap(localBitmap, k), 0.0F, 0.0F, null);
        return;
      }
    }
    super.onDraw(paramCanvas);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.CircularImageView
 * JD-Core Version:    0.6.2
 */