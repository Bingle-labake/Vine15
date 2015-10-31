package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.FloatMath;
import android.view.View;
import co.vine.android.R.styleable;
import co.vine.android.VineException;
import co.vine.android.util.CrashUtil;

public class ViewPagerScrollBar extends View
{
  private int[] mColorIds;
  private int mOffsetPixels;
  private final Paint mPaint = new Paint();
  private int mPosition;
  private int mRange = 1;
  private final RectF mTabBounds = new RectF();

  public ViewPagerScrollBar(Context paramContext)
  {
    this(paramContext, null, 2130772038);
  }

  public ViewPagerScrollBar(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 2130772038);
  }

  public ViewPagerScrollBar(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray1 = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ViewPagerScrollBar, paramInt, 0);
    int i = localTypedArray1.getResourceId(1, 0);
    if (i > 0)
    {
      TypedArray localTypedArray2 = paramContext.getResources().obtainTypedArray(i);
      this.mColorIds = new int[localTypedArray2.length()];
      for (int j = 0; j < localTypedArray2.length(); j++)
        this.mColorIds[j] = localTypedArray2.getColor(j, 0);
      localTypedArray2.recycle();
      this.mPaint.setColor(this.mColorIds[0]);
    }
    while (true)
    {
      localTypedArray1.recycle();
      return;
      this.mPaint.setColor(localTypedArray1.getColor(0, -1));
    }
  }

  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    paramCanvas.drawRect(this.mTabBounds, this.mPaint);
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    updateBounds();
  }

  public void scroll(int paramInt1, int paramInt2)
  {
    this.mPosition = paramInt1;
    this.mOffsetPixels = ((int)FloatMath.ceil(paramInt2 / this.mRange));
    updateBounds();
    invalidate();
  }

  public void setLineColor(int paramInt)
  {
    this.mPaint.setColor(paramInt);
  }

  public void setPageColor(int paramInt)
  {
    this.mPaint.setColor(this.mColorIds[paramInt]);
  }

  public void setPosition(int paramInt)
  {
    this.mPosition = paramInt;
    this.mOffsetPixels = 0;
    updateBounds();
    invalidate();
  }

  public void setRange(int paramInt)
  {
    this.mRange = paramInt;
    if (this.mRange == 0)
    {
      this.mRange = 1;
      CrashUtil.logException(new VineException("Someone is trying to set the range to be 0, defaulting back to 1."));
    }
    requestLayout();
    invalidate();
  }

  public void updateBounds()
  {
    float f1 = getWidth() / this.mRange;
    int i = this.mOffsetPixels;
    float f2 = f1 * this.mPosition + i;
    this.mTabBounds.set(f2, 0.0F, f2 + f1, getHeight());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.ViewPagerScrollBar
 * JD-Core Version:    0.6.2
 */