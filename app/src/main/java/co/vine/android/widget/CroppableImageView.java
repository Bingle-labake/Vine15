package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.widget.ImageView.ScaleType;
import co.vine.android.R.styleable;

public class CroppableImageView extends MultiTouchImageView
{
  public static final String CROP_NAME_ORIGINAL_ASPECT_RATION = "original_aspect";
  public static final String CROP_NAME_SQUARE = "square_aspect";
  public static final int CROP_TYPE_EDIT_PROFILE = 0;
  public static final int CROP_TYPE_ORIGINAL_ASPECT_RATIO = 1;
  public static final int CROP_TYPE_SQUARE = 2;
  private int mCropRectPadding;
  private int mCropType;
  private Paint mShadowPaint;
  private RectF mShadowRect;
  private Paint mStrokePaint;

  public CroppableImageView(Context paramContext)
  {
    super(paramContext);
    Resources localResources = getResources();
    init(localResources.getColor(2131296358), localResources.getColor(2131296369));
  }

  public CroppableImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 2130771997);
  }

  public CroppableImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.CroppableImageView, paramInt, 0);
    int i = localTypedArray.getDimensionPixelSize(0, 0);
    if (i > 0)
      this.mCropRectPadding = i;
    Resources localResources = getResources();
    int j = localTypedArray.getColor(1, localResources.getColor(2131296358));
    int k = localTypedArray.getColor(2, localResources.getColor(2131296369));
    localTypedArray.recycle();
    init(j, k);
  }

  private void init(int paramInt1, int paramInt2)
  {
    Paint localPaint1 = new Paint();
    localPaint1.setColor(paramInt1);
    localPaint1.setStyle(Paint.Style.STROKE);
    this.mStrokePaint = localPaint1;
    Paint localPaint2 = new Paint();
    localPaint2.setColor(paramInt2);
    this.mShadowPaint = localPaint2;
    this.mShadowRect = new RectF();
    this.mCropType = 0;
  }

  public RectF getCropRect()
  {
    RectF localRectF = new RectF(this.mTransformBounds);
    Matrix localMatrix = new Matrix();
    this.mMatrix.invert(localMatrix);
    localMatrix.mapRect(localRectF);
    return localRectF;
  }

  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    RectF localRectF1 = this.mTransformBounds;
    paramCanvas.drawRect(localRectF1, this.mStrokePaint);
    int i = paramCanvas.getWidth();
    int j = paramCanvas.getHeight();
    Paint localPaint = this.mShadowPaint;
    RectF localRectF2 = this.mShadowRect;
    localRectF2.set(0.0F, localRectF1.top, localRectF1.left, localRectF1.bottom);
    paramCanvas.drawRect(localRectF2, localPaint);
    localRectF2.set(0.0F, 0.0F, i, localRectF1.top);
    paramCanvas.drawRect(localRectF2, localPaint);
    localRectF2.set(localRectF1.right, localRectF1.top, i, localRectF1.bottom);
    paramCanvas.drawRect(localRectF2, localPaint);
    localRectF2.set(0.0F, localRectF1.bottom, i, j);
    paramCanvas.drawRect(localRectF2, localPaint);
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    setCropPadding(this.mCropRectPadding, this.mCropType);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
  }

  public void setCropPadding(int paramInt1, int paramInt2)
  {
    this.mCropType = paramInt2;
    this.mCropRectPadding = paramInt1;
    int i = getMeasuredWidth();
    int j = getMeasuredHeight();
    float f1 = this.mBitmapWidth / this.mBitmapHeight;
    int m;
    int k;
    if (i / j > f1)
    {
      m = j - (int)(paramInt1 / f1);
      float f3 = this.mBitmapHeight / j;
      k = (int)(this.mBitmapWidth / f3) - paramInt1;
      if (paramInt2 != 0)
        break label136;
      m = k / 2;
    }
    while (true)
    {
      setTransformDimensions(k, m, ImageView.ScaleType.CENTER_CROP, false);
      return;
      k = i - paramInt1;
      float f2 = this.mBitmapWidth / i;
      m = (int)(this.mBitmapHeight / f2) - (int)(paramInt1 / f1);
      break;
      label136: if (paramInt2 == 2)
        if (m < k)
          k = m;
        else
          m = k;
    }
  }

  public void setCropType(int paramInt)
  {
    if (this.mCropType != paramInt)
    {
      this.mCropType = paramInt;
      invalidate();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.CroppableImageView
 * JD-Core Version:    0.6.2
 */