package co.vine.android.widget;

import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;

public class StyledClickableSpan extends ClickableSpan
{
  private int mColor;
  private final SpanClickListener mListener;
  private boolean mSelected;
  private boolean mSetColor;
  private final Object mTag;
  private final int mType;

  public StyledClickableSpan(int paramInt, Object paramObject, SpanClickListener paramSpanClickListener)
  {
    this.mType = paramInt;
    this.mTag = paramObject;
    this.mListener = paramSpanClickListener;
  }

  public boolean isSelected()
  {
    return this.mSelected;
  }

  public void onClick(View paramView)
  {
    if (this.mListener != null)
      this.mListener.onSpanClicked(paramView, this.mType, this.mTag);
  }

  public void select(boolean paramBoolean)
  {
    this.mSelected = paramBoolean;
  }

  public void setColor(int paramInt)
  {
    this.mColor = paramInt;
    this.mSetColor = true;
  }

  public void updateDrawState(TextPaint paramTextPaint)
  {
    if (this.mSetColor)
      paramTextPaint.setColor(this.mColor);
    paramTextPaint.setUnderlineText(false);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.StyledClickableSpan
 * JD-Core Version:    0.6.2
 */