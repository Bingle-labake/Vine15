package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.View;
import android.view.WindowManager;
import co.vine.android.R.styleable;
import co.vine.android.util.Util;

public class AnimatingCircle extends View
{
  private static final double COSINE_45_DEGREES = 0.0D;
  private static final int DEFAULT_DURATION = 250;
  private static final double FORTY_FIVE_DEGREES_IN_RADIANS = 0.8377580642700195D;
  private static final int STEP_LENGTH = 5;
  private int mBackgroundColor;
  private final Paint mClearPaint;
  private float mHypoteneuse;
  private boolean mIsAnimating;
  private AnimatingCircleListener mListener;
  private float mNewRadius;
  private final Paint mPaint;
  private final int mRadius;
  private Runnable mRunnable;
  private float mStepDistance;
  private int mXMargin;
  private final float mXOffset;

  public AnimatingCircle(Context paramContext)
  {
    this(paramContext, null);
  }

  public AnimatingCircle(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public AnimatingCircle(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    Resources localResources = paramContext.getResources();
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.AnimatingCircle, paramInt, 0);
    this.mBackgroundColor = localTypedArray.getColor(0, localResources.getColor(2131296309));
    this.mRadius = localTypedArray.getDimensionPixelOffset(1, localResources.getDimensionPixelOffset(2131427397));
    localTypedArray.recycle();
    this.mPaint = new Paint();
    this.mClearPaint = new Paint();
    this.mClearPaint.setAntiAlias(true);
    this.mClearPaint.setDither(true);
    this.mClearPaint.setFilterBitmap(true);
    this.mClearPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
    Point localPoint = Util.getDisplaySize(((WindowManager)paramContext.getSystemService("window")).getDefaultDisplay());
    float f = Math.max(localPoint.x, localPoint.y) / 2 / (float)COSINE_45_DEGREES;
    (f / this.mRadius);
    this.mHypoteneuse = f;
    this.mXOffset = localResources.getDimensionPixelOffset(2131427345);
    this.mXMargin = localResources.getDimensionPixelOffset(2131427361);
    this.mRunnable = new AnimationRunnable();
    this.mStepDistance = (5.0F * ((this.mHypoteneuse - this.mRadius) / 250.0F));
    this.mIsAnimating = false;
    setLayerType(1, null);
  }

  protected void onDraw(Canvas paramCanvas)
  {
    if (this.mNewRadius == 0.0F)
      this.mNewRadius = this.mRadius;
    this.mPaint.setColor(this.mBackgroundColor);
    paramCanvas.drawRect(0.0F, 0.0F, getMeasuredWidth() - this.mXMargin, getMeasuredHeight(), this.mPaint);
    paramCanvas.drawCircle(getMeasuredWidth() / 2 + this.mXOffset, getMeasuredHeight() / 2, this.mNewRadius, this.mClearPaint);
  }

  public void resetAnimation()
  {
    this.mNewRadius = 0.0F;
    this.mIsAnimating = false;
  }

  public void setAnimationListener(AnimatingCircleListener paramAnimatingCircleListener)
  {
    this.mListener = paramAnimatingCircleListener;
  }

  public void startDefaultAnimation()
  {
    if (!this.mIsAnimating)
    {
      this.mIsAnimating = true;
      this.mListener.onAnimationStart();
    }
    while (this.mNewRadius < this.mHypoteneuse)
    {
      Handler localHandler = getHandler();
      if (localHandler != null)
      {
        localHandler.removeCallbacks(this.mRunnable);
        localHandler.postDelayed(this.mRunnable, 5L);
      }
      return;
      this.mListener.onAnimationRepeat();
    }
    this.mIsAnimating = false;
    this.mListener.onAnimationEnd();
  }

  public static abstract interface AnimatingCircleListener
  {
    public abstract void onAnimationEnd();

    public abstract void onAnimationRepeat();

    public abstract void onAnimationStart();
  }

  public class AnimationRunnable
    implements Runnable
  {
    public AnimationRunnable()
    {
    }

    public void run()
    {
      AnimatingCircle.access$002(AnimatingCircle.this, AnimatingCircle.this.mNewRadius + AnimatingCircle.this.mStepDistance);
      AnimatingCircle.this.invalidate();
      AnimatingCircle.this.startDefaultAnimation();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.AnimatingCircle
 * JD-Core Version:    0.6.2
 */