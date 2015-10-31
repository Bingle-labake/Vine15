package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import co.vine.android.drawable.RecyclableBitmapDrawable;

public class ImagePreference extends Preference
{
  private ImageView mBorder;
  private Context mContext;
  private ImageView mImage;
  private OnImagePreferenceBoundListener mListener;

  public ImagePreference(Context paramContext)
  {
    this(paramContext, null);
  }

  public ImagePreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public ImagePreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setLayoutResource(2130903098);
    setSelectable(false);
    this.mContext = paramContext;
  }

  protected void onBindView(View paramView)
  {
    super.onBindView(paramView);
    this.mImage = ((ImageView)paramView.findViewById(2131361873));
    this.mBorder = ((ImageView)paramView.findViewById(2131362128));
    this.mListener.onImagePeferenceBound(this);
  }

  protected View onCreateView(ViewGroup paramViewGroup)
  {
    View localView = super.onCreateView(paramViewGroup);
    ViewGroup.LayoutParams localLayoutParams = localView.getLayoutParams();
    localLayoutParams.height = ((int)this.mContext.getResources().getDimension(2131427386));
    localView.setLayoutParams(localLayoutParams);
    return localView;
  }

  public void setBitmap(Bitmap paramBitmap)
  {
    if (this.mImage != null)
      this.mImage.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
  }

  public void setBorderDrawable(Drawable paramDrawable)
  {
    if (this.mBorder != null)
      this.mBorder.setImageDrawable(paramDrawable);
  }

  public void setDrawable(Drawable paramDrawable)
  {
    if (this.mImage != null)
      this.mImage.setImageDrawable(paramDrawable);
  }

  public void setImageClickListener(View.OnClickListener paramOnClickListener)
  {
    if (this.mImage != null)
      this.mImage.setOnClickListener(paramOnClickListener);
  }

  public void setPreferenceBoundListener(OnImagePreferenceBoundListener paramOnImagePreferenceBoundListener)
  {
    this.mListener = paramOnImagePreferenceBoundListener;
  }

  public static abstract interface OnImagePreferenceBoundListener
  {
    public abstract void onImagePeferenceBound(ImagePreference paramImagePreference);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.ImagePreference
 * JD-Core Version:    0.6.2
 */