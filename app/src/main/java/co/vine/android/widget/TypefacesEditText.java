package co.vine.android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.EditText;
import co.vine.android.R.styleable;

public class TypefacesEditText extends EditText
{
  private int mWeight;

  public TypefacesEditText(Context paramContext)
  {
    super(paramContext);
  }

  public TypefacesEditText(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }

  public TypefacesEditText(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }

  public void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.VineTextView, 2130772039, 0);
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
 * Qualified Name:     co.vine.android.widget.TypefacesEditText
 * JD-Core Version:    0.6.2
 */