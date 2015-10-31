package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ImageView;
import co.vine.android.R.styleable;

public class OverlayImageView extends ImageView
{
  private boolean mFramed;
  private int mImageHeight;
  private int mImageWidth;
  private Drawable mOverlayDrawable;

  public OverlayImageView(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null);
  }

  public OverlayImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }

  public OverlayImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }

  private void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
      return;
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.OverlayImageView);
    Drawable localDrawable = localTypedArray.getDrawable(0);
    if (localDrawable != null)
      setOverlayDrawable(localDrawable);
    localTypedArray.recycle();
  }

  private void setDrawableBounds(Drawable paramDrawable)
  {
    if ((this.mFramed) && (paramDrawable != null))
    {
      paramDrawable.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
      invalidate();
    }
  }

  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    Drawable localDrawable = this.mOverlayDrawable;
    if ((localDrawable != null) && (localDrawable.isStateful()))
      localDrawable.setState(getDrawableState());
  }

  public void invalidateDrawable(Drawable paramDrawable)
  {
    if (paramDrawable == this.mOverlayDrawable)
    {
      invalidate();
      return;
    }
    super.invalidateDrawable(paramDrawable);
  }

  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    Drawable localDrawable = this.mOverlayDrawable;
    if (localDrawable != null)
      localDrawable.draw(paramCanvas);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = this.mImageWidth;
    int j = this.mImageHeight;
    int k;
    int n;
    int i1;
    if ((i > 0) && (j > 0))
    {
      k = getDefaultSize(i, paramInt1);
      int m = getDefaultSize(j, paramInt2);
      n = i * m;
      i1 = j * k;
      if (n > i1)
      {
        m = i1 / i;
        setMeasuredDimension(k, m);
      }
    }
    while (true)
    {
      setDrawableBounds(this.mOverlayDrawable);
      return;
      if (n >= i1)
        break;
      k = n / j;
      break;
      super.onMeasure(paramInt1, paramInt2);
    }
  }

  protected boolean setFrame(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool = super.setFrame(paramInt1, paramInt2, paramInt3, paramInt4);
    this.mFramed = true;
    setDrawableBounds(this.mOverlayDrawable);
    return bool;
  }

  public void setImageSize(int paramInt1, int paramInt2)
  {
    int i = this.mImageWidth;
    int j = this.mImageHeight;
    if ((i != paramInt1) || (j != paramInt2))
    {
      this.mImageWidth = paramInt1;
      this.mImageHeight = paramInt2;
      requestLayout();
    }
  }

  public void setOverlayDrawable(int paramInt)
  {
    setOverlayDrawable(getResources().getDrawable(paramInt));
  }

  public void setOverlayDrawable(Drawable paramDrawable)
  {
    if (this.mOverlayDrawable != paramDrawable)
    {
      if (this.mOverlayDrawable != null)
      {
        this.mOverlayDrawable.setCallback(null);
        unscheduleDrawable(this.mOverlayDrawable);
      }
      this.mOverlayDrawable = paramDrawable;
      if (paramDrawable != null)
      {
        paramDrawable.setCallback(this);
        if (paramDrawable.isStateful())
          paramDrawable.setState(getDrawableState());
      }
      requestLayout();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.OverlayImageView
 * JD-Core Version:    0.6.2
 */