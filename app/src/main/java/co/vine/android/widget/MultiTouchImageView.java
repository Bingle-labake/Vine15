package co.vine.android.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.FloatMath;
import android.view.MotionEvent;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;

public class MultiTouchImageView extends ImageView
{
  private static final int GESTURE_NONE = 0;
  private static final int GESTURE_PAN = 1;
  private static final int GESTURE_ZOOM = 2;
  private static final float MIN_SCALE_FACTOR = 1.0F;
  protected float mBitmapHeight;
  protected float mBitmapWidth;
  private float mCurrentMinScale = 1.0F;
  private int mGesture;
  private float mLastDownX;
  private float mLastDownY;
  private float mLastZoomDistance = 1.0F;
  protected final Matrix mMatrix = new Matrix();
  private final RectF mMatrixBounds = new RectF();
  private final float[] mMatrixValues = new float[9];
  private float mMidTouchX;
  private float mMidTouchY;
  private final RectF mStartBounds = new RectF();
  private float mTotalScaleFactor = 1.0F;
  protected RectF mTransformBounds;
  private float mViewHeight;
  private float mViewWidth;

  public MultiTouchImageView(Context paramContext)
  {
    super(paramContext);
    initMultiTouchImageView();
  }

  public MultiTouchImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initMultiTouchImageView();
  }

  public MultiTouchImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initMultiTouchImageView();
  }

  private float calculateScale(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, ImageView.ScaleType paramScaleType)
  {
    if (paramScaleType == ImageView.ScaleType.CENTER_CROP)
    {
      if (paramFloat1 > paramFloat3)
        return paramFloat4 / paramFloat3;
      return paramFloat2 / paramFloat1;
    }
    return Math.min(paramFloat2 / paramFloat1, paramFloat4 / paramFloat3);
  }

  private void resetGesture()
  {
    this.mGesture = 0;
    this.mLastDownX = 1.4E-45F;
    this.mLastDownY = 1.4E-45F;
    this.mMidTouchX = 1.4E-45F;
    this.mMidTouchY = 1.4E-45F;
  }

  private void resetScale()
  {
    RectF localRectF1 = updateBounds();
    RectF localRectF2 = this.mTransformBounds;
    if ((localRectF1.left > localRectF2.left) || (localRectF1.top > localRectF2.top) || (localRectF1.right < localRectF2.right) || (localRectF1.bottom < localRectF2.bottom))
    {
      float f1 = localRectF2.left + localRectF2.width() / 2.0F;
      float f2 = localRectF2.top + localRectF2.height() / 2.0F;
      float f3 = localRectF1.left + localRectF1.width() / 2.0F;
      float f4 = localRectF1.top + localRectF1.height() / 2.0F;
      float f5 = f1 - f3;
      float f6 = f2 - f4;
      if ((f5 != 0.0F) || (f6 != 0.0F))
      {
        this.mMatrix.postTranslate(f5, f6);
        this.mMatrixBounds.offset(f5, f6);
      }
      float f7 = this.mCurrentMinScale;
      if (this.mTotalScaleFactor < f7)
      {
        float f8 = f7 / this.mTotalScaleFactor;
        this.mTotalScaleFactor = f7;
        this.mMatrix.postScale(f8, f8, this.mViewWidth / 2.0F, this.mViewHeight / 2.0F);
        float f9 = this.mBitmapWidth;
        float f10 = this.mBitmapHeight;
        float f11 = this.mTransformBounds.width();
        float f12 = this.mTransformBounds.height();
        float f13 = calculateScale(f9, f11, f10, f12, ImageView.ScaleType.CENTER_CROP);
        RectF localRectF3 = new RectF(this.mTransformBounds);
        if ((int)(f9 * f13) > (int)f11)
        {
          float f15 = (f9 * f13 - f11) / 2.0F;
          localRectF3.left -= f15;
          localRectF3.right = (f15 + localRectF3.right);
        }
        if ((int)(f10 * f13) > (int)f12)
        {
          float f14 = (f10 * f13 - f12) / 2.0F;
          localRectF3.top -= f14;
          localRectF3.bottom = (f14 + localRectF3.bottom);
        }
        this.mMatrixBounds.set(localRectF3);
      }
      setImageMatrix(this.mMatrix);
    }
  }

  private float touchDistance(MotionEvent paramMotionEvent)
  {
    float f1 = paramMotionEvent.getX(0) - paramMotionEvent.getX(1);
    float f2 = paramMotionEvent.getY(0) - paramMotionEvent.getY(1);
    return FloatMath.sqrt(f1 * f1 + f2 * f2);
  }

  private RectF updateBounds()
  {
    float[] arrayOfFloat = this.mMatrixValues;
    this.mMatrix.getValues(arrayOfFloat);
    float f1 = arrayOfFloat[2];
    float f2 = arrayOfFloat[5];
    float f3 = this.mStartBounds.width() * this.mTotalScaleFactor;
    float f4 = this.mStartBounds.height() * this.mTotalScaleFactor;
    float f5 = f1 + f3;
    float f6 = f2 + f4;
    this.mMatrixBounds.set(f1, f2, f5, f6);
    return this.mMatrixBounds;
  }

  void initMultiTouchImageView()
  {
    this.mGesture = 0;
    setScaleType(ImageView.ScaleType.MATRIX);
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    this.mViewWidth = getMeasuredWidth();
    this.mViewHeight = getMeasuredHeight();
    if (paramBoolean)
      setTransformDimensions(this.mViewWidth, this.mViewHeight, ImageView.ScaleType.FIT_CENTER, true);
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (0xFF & paramMotionEvent.getAction())
    {
    case 4:
    default:
      return super.onTouchEvent(paramMotionEvent);
    case 0:
      if (this.mTotalScaleFactor > 1.0F)
      {
        getParent().requestDisallowInterceptTouchEvent(true);
        if (this.mGesture == 0)
        {
          this.mLastDownX = paramMotionEvent.getX();
          this.mLastDownY = paramMotionEvent.getY();
          this.mGesture = 1;
        }
      }
      break;
    case 5:
    case 2:
    case 1:
    case 3:
    case 6:
    }
    while (true)
    {
      return true;
      getParent().requestDisallowInterceptTouchEvent(false);
      break;
      if ((this.mGesture == 0) || (this.mGesture == 1))
      {
        this.mMidTouchX = ((paramMotionEvent.getX(0) + paramMotionEvent.getX(1)) / 2.0F);
        this.mMidTouchY = ((paramMotionEvent.getY(0) + paramMotionEvent.getY(1)) / 2.0F);
        this.mLastZoomDistance = touchDistance(paramMotionEvent);
        this.mGesture = 2;
        continue;
        if (this.mGesture == 1)
        {
          float f3 = paramMotionEvent.getX();
          float f4 = paramMotionEvent.getY();
          float f5 = f3 - this.mLastDownX;
          float f6 = f4 - this.mLastDownY;
          float f7 = this.mMatrixBounds.left;
          float f8 = this.mMatrixBounds.right;
          float f9 = this.mMatrixBounds.top;
          float f10 = this.mMatrixBounds.bottom;
          RectF localRectF2 = this.mTransformBounds;
          float f11 = localRectF2.left;
          float f12 = localRectF2.top;
          float f13 = localRectF2.right;
          float f14 = localRectF2.bottom;
          int i;
          label307: int j;
          if (this.mLastDownY > f4)
          {
            i = 1;
            if (this.mLastDownX <= f3)
              break label448;
            j = 1;
            label320: if (j == 0)
              break label478;
            if ((f8 <= f13) || (f8 + f5 >= f13))
              break label454;
            f5 = f13 - f8;
            label351: if (i == 0)
              break label545;
            if ((f10 <= f14) || (f10 + f6 >= f14))
              break label531;
            f6 = f14 - f10;
          }
          while (true)
          {
            if ((f5 != 0.0F) || (f6 != 0.0F))
            {
              this.mMatrix.postTranslate(f5, f6);
              this.mMatrixBounds.offset(f5, f6);
              setImageMatrix(this.mMatrix);
            }
            this.mLastDownX = f3;
            this.mLastDownY = f4;
            break;
            i = 0;
            break label307;
            label448: j = 0;
            break label320;
            label454: if (f8 > f13)
              break label351;
            getParent().requestDisallowInterceptTouchEvent(false);
            f5 = 0.0F;
            break label351;
            label478: if ((f7 < f11) && (f7 + f5 > f11))
            {
              f5 = f11 - f7;
              break label351;
            }
            if (f7 < f11)
              break label351;
            getParent().requestDisallowInterceptTouchEvent(false);
            f5 = 0.0F;
            break label351;
            label531: if (f10 <= f14)
            {
              f6 = 0.0F;
              continue;
              label545: if ((f9 < f12) && (f9 + f6 > f12))
                f6 = f12 - f9;
              else if (f9 >= f12)
                f6 = 0.0F;
            }
          }
        }
        if (this.mGesture == 2)
        {
          float f1 = touchDistance(paramMotionEvent);
          float f2 = f1 / this.mLastZoomDistance;
          this.mTotalScaleFactor = (f2 * this.mTotalScaleFactor);
          RectF localRectF1 = updateBounds();
          if ((localRectF1.left < 0.0F) && (localRectF1.top < 0.0F) && (localRectF1.right > this.mViewWidth) && (localRectF1.bottom > this.mViewHeight))
            this.mMatrix.postScale(f2, f2, this.mMidTouchX, this.mMidTouchY);
          while (true)
          {
            this.mLastZoomDistance = f1;
            setImageMatrix(this.mMatrix);
            break;
            this.mMatrix.postScale(f2, f2, this.mViewWidth / 2.0F, this.mViewHeight / 2.0F);
          }
        }
        return super.onTouchEvent(paramMotionEvent);
        if (this.mGesture == 1)
        {
          resetGesture();
          continue;
          if (this.mGesture == 2)
            resetScale();
          resetGesture();
          continue;
          if (this.mGesture == 2)
          {
            resetScale();
            resetGesture();
          }
        }
      }
    }
  }

  public void setImageBitmap(Bitmap paramBitmap)
  {
    super.setImageBitmap(paramBitmap);
    if (paramBitmap != null)
    {
      this.mBitmapWidth = paramBitmap.getWidth();
      this.mBitmapHeight = paramBitmap.getHeight();
      setTransformDimensions(this.mViewWidth, this.mViewHeight, ImageView.ScaleType.FIT_CENTER, true);
    }
  }

  public void setTransformDimensions(float paramFloat1, float paramFloat2, ImageView.ScaleType paramScaleType, boolean paramBoolean)
  {
    float f1 = this.mViewWidth;
    float f2 = (f1 - paramFloat1) / 2.0F;
    float f3 = this.mViewHeight;
    float f4 = (f3 - paramFloat2) / 2.0F;
    float f5 = this.mStartBounds.width();
    float f6 = this.mStartBounds.height();
    if (this.mTransformBounds == null)
      this.mTransformBounds = new RectF(f2, f4, f2 + paramFloat1, f4 + paramFloat2);
    while (true)
    {
      if ((f5 != 0.0F) && (f6 != 0.0F))
        this.mCurrentMinScale = calculateScale(f5, paramFloat1, f6, paramFloat2, paramScaleType);
      if ((paramBoolean) || (!this.mMatrixBounds.contains(this.mTransformBounds)))
        break;
      return;
      this.mTransformBounds.set(f2, f4, f2 + paramFloat1, f4 + paramFloat2);
    }
    float f7 = this.mBitmapWidth;
    float f8 = this.mBitmapHeight;
    boolean bool1 = f7 < 0.0F;
    float f9 = 0.0F;
    float f10 = 0.0F;
    if (bool1)
    {
      boolean bool2 = f8 < 0.0F;
      f9 = 0.0F;
      f10 = 0.0F;
      if (bool2)
      {
        float f13 = calculateScale(f7, paramFloat1, f8, paramFloat2, paramScaleType);
        f9 = (f1 - f13 * f7) / 2.0F;
        f10 = (f3 - f13 * f8) / 2.0F;
        Matrix localMatrix = this.mMatrix;
        localMatrix.setScale(f13, f13);
        localMatrix.postTranslate(f9, f10);
        setImageMatrix(localMatrix);
      }
    }
    RectF localRectF = this.mStartBounds;
    float f11 = f1 - f9;
    float f12 = f3 - f10;
    localRectF.set(f9, f10, f11, f12);
    this.mMatrixBounds.set(this.mStartBounds);
    this.mTotalScaleFactor = 1.0F;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.MultiTouchImageView
 * JD-Core Version:    0.6.2
 */