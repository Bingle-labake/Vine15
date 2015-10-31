package co.vine.android.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.text.style.StyleSpan;
import android.util.AttributeSet;
import android.widget.TextView.BufferType;
import co.vine.android.util.Util;

public class StyledTextView extends TypefacesTextView
{
  boolean init = false;
  private SpanClickListener mListener;
  private String mOriginalText;

  public StyledTextView(Context paramContext)
  {
    this(paramContext, null);
  }

  public StyledTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public StyledTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
  }

  public void setSpanClickListener(SpanClickListener paramSpanClickListener)
  {
    this.mListener = paramSpanClickListener;
  }

  public void setStyledText(String paramString, StyleSpan[] paramArrayOfStyleSpan)
  {
    this.mOriginalText = paramString;
    setText(Util.getSpannedText(paramArrayOfStyleSpan, paramString, '"'), TextView.BufferType.SPANNABLE);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.StyledTextView
 * JD-Core Version:    0.6.2
 */