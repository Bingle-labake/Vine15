package co.vine.android.recorder;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.util.AttributeSet;
import android.view.View;

public class ProgressView extends View
{
  private final Paint mPaint = new Paint();
  public int shouldBeWidth;

  public ProgressView(Context paramContext)
  {
    super(paramContext);
    init();
  }

  public ProgressView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }

  public ProgressView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }

  private void init()
  {
    this.mPaint.setStyle(Paint.Style.FILL);
    this.mPaint.setColor(getResources().getColor(R.color.vine_green));
  }

  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (this.shouldBeWidth > 0)
      paramCanvas.drawRect(0.0F, 0.0F, this.shouldBeWidth, getMeasuredHeight(), this.mPaint);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.ProgressView
 * JD-Core Version:    0.6.2
 */