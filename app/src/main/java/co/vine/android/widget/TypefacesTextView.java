package co.vine.android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;
import co.vine.android.R.styleable;

public class TypefacesTextView extends TextView
{
  private int mWeight;

  public TypefacesTextView(Context paramContext)
  {
    super(paramContext);
  }

  public TypefacesTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public TypefacesTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.VineTextView, paramInt, 0);
    int i = localTypedArray.getInt(1, 0);
    this.mWeight = localTypedArray.getInt(0, 2);
    localTypedArray.recycle();
    setTypeface(Typefaces.get(paramContext).getContentTypeface(i, this.mWeight), i);
  }

  public void setTypeface(Typeface paramTypeface, int paramInt)
  {
    super.setTypeface(Typefaces.get(getContext()).getContentTypeface(paramInt, this.mWeight));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.TypefacesTextView
 * JD-Core Version:    0.6.2
 */