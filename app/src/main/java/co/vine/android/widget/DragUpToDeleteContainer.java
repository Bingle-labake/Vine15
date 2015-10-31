package co.vine.android.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import co.vine.android.animation.SmoothAnimator;

public class DragUpToDeleteContainer extends RelativeLayout
{
  private static final int ALPHA_AT_TOP = 77;
  private static final int DESTROY_TIME = 350;
  private static final int DROP_TIME = 150;
  private static final float SMOOTHNESS = 0.05F;
  private float mCurY;
  private boolean mDestroying;
  private float mDownX;
  private float mDownY;
  private Bitmap mDragBitmap;
  private DragUpListener mDragUpListener;
  private ImageView mDragView;
  private float mDragViewAlpha;
  private final DragViewDestroyAnimator mDragViewDestroyAnimator = new DragViewDestroyAnimator(0.05F, 350);
  private final DropAnimator mDragViewDropAnimator = new DropAnimator(0.05F, 150);
  private int mDragViewHeight;
  private int mDragViewWidth;
  private int mDragViewX;
  private int mDragViewY;
  private boolean mDropping;
  private boolean mLockAlpha = false;
  private final int mTouchSlop;
  private View mViewToPickUp;
  private float mYOffsetFromTouch;

  public DragUpToDeleteContainer(Context paramContext)
  {
    this(paramContext, null);
  }

  public DragUpToDeleteContainer(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public DragUpToDeleteContainer(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.mTouchSlop = ViewConfiguration.get(paramContext).getScaledTouchSlop();
  }

  private void createDragView()
  {
    if (this.mViewToPickUp == null)
      return;
    this.mViewToPickUp.setDrawingCacheQuality(1048576);
    this.mViewToPickUp.setDrawingCacheEnabled(true);
    this.mDragBitmap = this.mViewToPickUp.getDrawingCache();
    if (this.mDragView == null)
      this.mDragView = new ImageView(getContext());
    this.mDragViewAlpha = 255.0F;
    this.mDragView.setImageBitmap(this.mDragBitmap);
    this.mDragView.setLayoutParams(new ViewGroup.LayoutParams(this.mViewToPickUp.getWidth(), this.mViewToPickUp.getHeight()));
    int[] arrayOfInt1 = new int[2];
    int[] arrayOfInt2 = new int[2];
    getLocationInWindow(arrayOfInt1);
    this.mViewToPickUp.getLocationInWindow(arrayOfInt2);
    this.mYOffsetFromTouch = (this.mDownY - arrayOfInt2[1] + arrayOfInt1[1]);
    this.mDragViewWidth = this.mViewToPickUp.getWidth();
    this.mDragViewHeight = this.mViewToPickUp.getHeight();
    this.mDragViewY = ((int)(this.mCurY - this.mYOffsetFromTouch));
  }

  private void destroyDragView()
  {
    if (this.mDragView != null)
    {
      this.mDragView.setImageDrawable(null);
      this.mDragBitmap = null;
      this.mDragView = null;
    }
  }

  public void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    if (this.mDragView != null)
    {
      if ((!this.mDestroying) && (!this.mLockAlpha))
      {
        int i = (int)(this.mDownY - this.mYOffsetFromTouch);
        this.mDragViewAlpha = (77.0F + 178.0F * (1.0F * this.mDragViewY / i));
      }
      if (this.mDragViewAlpha < 0.0F)
        this.mDragViewAlpha = 0.0F;
      paramCanvas.save();
      paramCanvas.translate(this.mDragViewX, this.mDragViewY);
      paramCanvas.clipRect(0, 0, this.mDragViewWidth, this.mDragViewHeight);
      paramCanvas.saveLayerAlpha(0.0F, 0.0F, this.mDragViewWidth, this.mDragViewHeight, (int)this.mDragViewAlpha, 31);
      this.mDragView.layout(0, 0, this.mDragViewWidth, this.mDragViewHeight);
      this.mDragView.draw(paramCanvas);
      paramCanvas.restore();
      paramCanvas.restore();
    }
  }

  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction())
    {
    case 1:
    default:
    case 0:
    case 2:
    }
    do
    {
      return false;
      this.mDownY = paramMotionEvent.getY();
      this.mDownX = paramMotionEvent.getX();
      return false;
    }
    while ((this.mDownY - paramMotionEvent.getY() < this.mTouchSlop) || (Math.abs(paramMotionEvent.getX() - this.mDownX) >= this.mTouchSlop));
    this.mCurY = paramMotionEvent.getY();
    boolean bool = true;
    if (this.mDragUpListener != null)
      bool = this.mDragUpListener.prepareForPickup();
    if (bool)
    {
      createDragView();
      if (this.mDragUpListener != null)
        this.mDragUpListener.viewPickedUp();
      invalidate();
    }
    return true;
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction())
    {
    default:
      return false;
    case 2:
      this.mCurY = paramMotionEvent.getY();
      this.mDragViewY = ((int)(this.mCurY - this.mYOffsetFromTouch));
      int i = (int)(this.mDownY - this.mYOffsetFromTouch);
      if (this.mDragViewY > i);
      while (true)
      {
        this.mDragViewY = i;
        if (this.mDragUpListener != null)
          this.mLockAlpha = this.mDragUpListener.viewMoved(this.mDragViewY);
        invalidate();
        return true;
        i = this.mDragViewY;
      }
    case 1:
    }
    DragUpListener localDragUpListener = this.mDragUpListener;
    boolean bool = false;
    if (localDragUpListener != null)
      bool = this.mDragUpListener.viewDropped(this.mDragViewY);
    if (bool)
      this.mDragViewDestroyAnimator.start();
    while (true)
    {
      invalidate();
      return true;
      this.mDragViewDropAnimator.start();
    }
  }

  public void setInteractionListner(DragUpListener paramDragUpListener)
  {
    this.mDragUpListener = paramDragUpListener;
  }

  public void setView(View paramView, int paramInt)
  {
    this.mViewToPickUp = paramView;
    this.mDragViewX = paramInt;
  }

  public static abstract interface DragUpListener
  {
    public abstract boolean prepareForPickup();

    public abstract void viewDestroyFinished();

    public abstract boolean viewDropped(int paramInt);

    public abstract void viewLanded();

    public abstract boolean viewMoved(int paramInt);

    public abstract void viewPickedUp();
  }

  private class DragViewDestroyAnimator extends SmoothAnimator
  {
    private int mDeltaY;
    private int mStartY;

    public DragViewDestroyAnimator(float paramInt, int arg3)
    {
      super(paramInt, i);
    }

    public void onStart()
    {
      this.mStartY = DragUpToDeleteContainer.this.mDragViewY;
      this.mDeltaY = (DragUpToDeleteContainer.this.mDragViewY + DragUpToDeleteContainer.this.mDragViewHeight);
      DragUpToDeleteContainer.access$202(DragUpToDeleteContainer.this, true);
    }

    public void onStop()
    {
      DragUpToDeleteContainer.access$302(DragUpToDeleteContainer.this, 0.0F);
      DragUpToDeleteContainer.access$202(DragUpToDeleteContainer.this, false);
      DragUpToDeleteContainer.this.destroyDragView();
      if (DragUpToDeleteContainer.this.mDragUpListener != null)
        DragUpToDeleteContainer.this.mDragUpListener.viewDestroyFinished();
      DragUpToDeleteContainer.this.invalidate();
    }

    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      DragUpToDeleteContainer.access$002(DragUpToDeleteContainer.this, (int)(this.mStartY - paramFloat2 * this.mDeltaY));
      DragUpToDeleteContainer.this.invalidate();
    }
  }

  private class DropAnimator extends SmoothAnimator
  {
    private float mDeltaX;
    private float mDeltaY;
    private int mTargetX;
    private int mTargetY;

    public DropAnimator(float paramInt, int arg3)
    {
      super(paramInt, i);
    }

    public void onStart()
    {
      DragUpToDeleteContainer.access$602(DragUpToDeleteContainer.this, true);
      if (DragUpToDeleteContainer.this.mDragView != null)
        this.mTargetY = ((int)(DragUpToDeleteContainer.this.mDownY - DragUpToDeleteContainer.this.mYOffsetFromTouch));
      this.mTargetX = DragUpToDeleteContainer.this.mDragViewX;
      this.mDeltaX = (DragUpToDeleteContainer.this.mDragViewX - this.mTargetX);
      this.mDeltaY = (DragUpToDeleteContainer.this.mDragViewY - this.mTargetY);
    }

    public void onStop()
    {
      if (DragUpToDeleteContainer.this.mDragUpListener != null)
        DragUpToDeleteContainer.this.mDragUpListener.viewLanded();
      DragUpToDeleteContainer.this.destroyDragView();
      DragUpToDeleteContainer.this.invalidate();
    }

    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      float f = 1.0F - paramFloat2;
      DragUpToDeleteContainer.access$1002(DragUpToDeleteContainer.this, this.mTargetX + (int)(f * this.mDeltaX));
      DragUpToDeleteContainer.access$002(DragUpToDeleteContainer.this, this.mTargetY + (int)(f * this.mDeltaY));
      DragUpToDeleteContainer.this.invalidate();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.DragUpToDeleteContainer
 * JD-Core Version:    0.6.2
 */