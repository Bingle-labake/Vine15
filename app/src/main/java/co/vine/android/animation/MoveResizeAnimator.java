package co.vine.android.animation;

import android.view.View;
import android.widget.RelativeLayout.LayoutParams;
import com.edisonwang.android.slog.SLog;

public class MoveResizeAnimator extends SmoothAnimator
{
  private final int mDeltaHeight;
  private final int mDeltaWidth;
  private final float mDeltaX;
  private final float mDeltaY;
  private int mId;
  private SmoothAnimator.AnimationListener mListener;
  private final int mOriginalHeight;
  private final int mOriginalWidth;
  private final int mOriginalX;
  private final int mOriginalY;
  private final RelativeLayout.LayoutParams mParam;
  private Object mTag;
  private final View mTarget;
  private final int mTargetHeight;
  private final int mTargetWidth;

  public MoveResizeAnimator(int paramInt1, View paramView, int paramInt2, double paramDouble1, double paramDouble2, int paramInt3, SmoothAnimator.AnimationListener paramAnimationListener, Object paramObject)
  {
    this(paramInt1, paramView, paramView, 0, paramInt2, paramDouble1, paramDouble2, paramInt3, paramAnimationListener, paramObject);
  }

  public MoveResizeAnimator(int paramInt1, View paramView1, View paramView2, int paramInt2, int paramInt3, double paramDouble1, double paramDouble2, int paramInt4, SmoothAnimator.AnimationListener paramAnimationListener, Object paramObject)
  {
    super(paramView1, 0.05F, paramInt4);
    this.mTarget = paramView1;
    this.mParam = ((RelativeLayout.LayoutParams)paramView1.getLayoutParams());
    this.mDeltaX = (this.mParam.leftMargin - paramInt2);
    this.mDeltaY = (this.mParam.topMargin - paramInt3);
    this.mOriginalX = this.mParam.leftMargin;
    this.mOriginalY = this.mParam.topMargin;
    if (this.mParam.width < 3)
      this.mParam.width = paramView2.getMeasuredWidth();
    if (this.mParam.height < 3)
      this.mParam.height = paramView2.getMeasuredHeight();
    this.mTargetWidth = ((int)(paramDouble1 * this.mParam.width));
    this.mTargetHeight = ((int)(paramDouble2 * this.mParam.height));
    this.mOriginalWidth = this.mParam.width;
    this.mOriginalHeight = this.mParam.height;
    this.mDeltaWidth = (this.mTargetWidth - this.mParam.width);
    this.mDeltaHeight = (this.mTargetHeight - this.mParam.height);
    this.mListener = paramAnimationListener;
    this.mTag = paramObject;
    this.mId = paramInt1;
  }

  public void onStop()
  {
    if (this.mListener != null)
      this.mListener.onAnimationFinish(this.mId, this.mTag);
  }

  public void onUpdate(float paramFloat1, float paramFloat2)
  {
    (1.0F - paramFloat2);
    this.mParam.leftMargin = (this.mOriginalX - (int)(paramFloat2 * this.mDeltaX));
    this.mParam.topMargin = (this.mOriginalY - (int)(paramFloat2 * this.mDeltaY));
    if (this.mTargetWidth != this.mParam.width)
      this.mParam.width = ((int)(this.mOriginalWidth + paramFloat2 * this.mDeltaWidth));
    if (this.mTargetHeight != this.mParam.height)
      this.mParam.height = ((int)(this.mOriginalHeight + paramFloat2 * this.mDeltaHeight));
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.mTarget;
    arrayOfObject[1] = Integer.valueOf(this.mParam.leftMargin);
    arrayOfObject[2] = Integer.valueOf(this.mParam.topMargin);
    arrayOfObject[3] = Integer.valueOf(this.mParam.width);
    arrayOfObject[4] = Integer.valueOf(this.mParam.height);
    SLog.d("Modifying {}: {} {} {} {}", arrayOfObject);
    this.mTarget.setLayoutParams(this.mParam);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.animation.MoveResizeAnimator
 * JD-Core Version:    0.6.2
 */