package co.vine.android.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;

public class DotIndicators extends View
{
  private int mActivePos;
  private Bitmap mCameraIconOff;
  private Bitmap mCameraIconOn;
  private int mCameraIconWidth;
  private int mDotHeight;
  private int mDotWidth;
  private int mHeight;
  private int mNum;
  private Bitmap mOff;
  private Bitmap mOn;
  private int mWidth;

  public DotIndicators(Context paramContext)
  {
    this(paramContext, null);
  }

  public DotIndicators(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public DotIndicators(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.mOff = BitmapFactory.decodeResource(paramContext.getResources(), 2130837935);
    this.mOn = BitmapFactory.decodeResource(paramContext.getResources(), 2130837936);
    this.mCameraIconOn = BitmapFactory.decodeResource(paramContext.getResources(), 2130837934);
    this.mCameraIconOff = BitmapFactory.decodeResource(paramContext.getResources(), 2130837933);
    this.mCameraIconWidth = this.mCameraIconOff.getWidth();
    this.mDotWidth = this.mOn.getWidth();
    this.mDotHeight = this.mOn.getHeight();
  }

  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if ((this.mHeight == 0) || (this.mWidth == 0) || (this.mNum == 0))
      return;
    int i = (int)Math.floor(this.mNum / 2);
    int j = this.mWidth / 2 - i * this.mDotWidth - this.mCameraIconWidth / 2;
    if (this.mNum % 2 != 0)
      j -= this.mDotWidth / 2;
    int k = this.mHeight / 2 - this.mDotHeight;
    int m = 0;
    if (m < this.mNum)
    {
      if (this.mActivePos == m)
        paramCanvas.drawBitmap(this.mOn, j, k, null);
      while (true)
      {
        j += this.mDotWidth;
        m++;
        break;
        paramCanvas.drawBitmap(this.mOff, j, k, null);
      }
    }
    if (this.mActivePos == this.mNum)
    {
      paramCanvas.drawBitmap(this.mCameraIconOn, j, k, null);
      return;
    }
    paramCanvas.drawBitmap(this.mCameraIconOff, j, k, null);
  }

  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
  }

  public void setActiveDot(int paramInt)
  {
    this.mActivePos = paramInt;
    invalidate();
  }

  public void setNumberOfDots(int paramInt)
  {
    this.mNum = paramInt;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.DotIndicators
 * JD-Core Version:    0.6.2
 */