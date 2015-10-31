package co.vine.android.animation;

import android.os.SystemClock;
import android.view.View;

public class SmoothAnimator
  implements Runnable
{
  private float mA;
  private float mAlpha;
  private float mB;
  private float mC;
  private boolean mCanceled;
  private float mD;
  protected float mDurationF;
  private final View mPoster;
  protected long mStartTime;

  public SmoothAnimator(View paramView, float paramFloat, int paramInt)
  {
    this.mPoster = paramView;
    this.mAlpha = paramFloat;
    this.mDurationF = paramInt;
    float f = 1.0F / (2.0F * this.mAlpha * (1.0F - this.mAlpha));
    this.mD = f;
    this.mA = f;
    this.mB = (this.mAlpha / (2.0F * (this.mAlpha - 1.0F)));
    this.mC = (1.0F / (1.0F - this.mAlpha));
  }

  public void cancel()
  {
    this.mCanceled = true;
  }

  public void onCancel()
  {
  }

  public void onStart()
  {
  }

  public void onStop()
  {
  }

  public void onUpdate(float paramFloat1, float paramFloat2)
  {
  }

  public void run()
  {
    if (this.mCanceled)
    {
      onCancel();
      return;
    }
    float f = (float)(SystemClock.uptimeMillis() - this.mStartTime) / this.mDurationF;
    if (f >= 1.0F)
    {
      onUpdate(1.0F, 1.0F);
      onStop();
      return;
    }
    onUpdate(f, transform(f));
    this.mPoster.post(this);
  }

  public void start()
  {
    this.mStartTime = SystemClock.uptimeMillis();
    this.mCanceled = false;
    onStart();
    this.mPoster.post(this);
  }

  public float transform(float paramFloat)
  {
    if (paramFloat < this.mAlpha)
      return paramFloat * (paramFloat * this.mA);
    if (paramFloat < 1.0F - this.mAlpha)
      return this.mB + paramFloat * this.mC;
    return 1.0F - this.mD * (paramFloat - 1.0F) * (paramFloat - 1.0F);
  }

  public static abstract interface AnimationListener
  {
    public abstract void onAnimationFinish(int paramInt, Object paramObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.animation.SmoothAnimator
 * JD-Core Version:    0.6.2
 */