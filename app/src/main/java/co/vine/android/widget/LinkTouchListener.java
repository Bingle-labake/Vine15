package co.vine.android.widget;

import android.graphics.Rect;
import android.text.Layout;
import android.text.Spannable;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.TextView;

public class LinkTouchListener
  implements View.OnTouchListener
{
  private final Rect mContentRect;
  private int mLastUrlDownX;
  private int mLastUrlDownY;
  private final Layout mLayout;
  private StyledClickableSpan mSpan;
  private Spannable mSpannable;
  private TextView mTextView;
  private final int mTouchSlop;

  public LinkTouchListener(TextView paramTextView, int paramInt, Spannable paramSpannable)
  {
    Log.v("s", "rectangle is " + paramTextView.getLeft() + " | " + paramTextView.getTop() + " | " + paramTextView.getRight() + " | " + paramTextView.getBottom());
    this.mContentRect = new Rect(paramTextView.getLeft(), paramTextView.getTop(), paramTextView.getRight(), paramTextView.getBottom());
    this.mLayout = paramTextView.getLayout();
    this.mTextView = paramTextView;
    this.mTouchSlop = paramInt;
    this.mSpannable = paramSpannable;
  }

  private void deselectSpan()
  {
    if ((this.mSpan != null) && (this.mSpan.isSelected()))
    {
      Log.v("s", "deselecting span");
      this.mSpan.select(false);
      this.mLastUrlDownX = 0;
      this.mLastUrlDownY = 0;
      this.mTextView.invalidate();
    }
  }

  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    int i = 0xFF & paramMotionEvent.getAction();
    int j = (int)paramMotionEvent.getX();
    int k = (int)paramMotionEvent.getY();
    Log.v("s", "on touch, action: " + i + " |x: " + j + " |y: " + k);
    Log.v("s", "on touch, view:  |left: " + paramView.getLeft() + " |right: " + paramView.getRight());
    Rect localRect = this.mContentRect;
    Layout localLayout = this.mLayout;
    int m = j + localRect.left;
    int n = k + localRect.top;
    int i1 = localLayout.getLineForVertical(n);
    Log.v("s", "translated x: " + m + " | " + n);
    if (m > (int)localLayout.getLineMax(i1))
    {
      deselectSpan();
      return false;
    }
    if (i == 0)
    {
      this.mLastUrlDownX = j;
      this.mLastUrlDownY = k;
    }
    int i2 = localLayout.getOffsetForHorizontal(i1, m);
    StyledClickableSpan[] arrayOfStyledClickableSpan = (StyledClickableSpan[])this.mSpannable.getSpans(i2, i2, StyledClickableSpan.class);
    Log.v("s", "size is " + arrayOfStyledClickableSpan.length);
    StyledClickableSpan localStyledClickableSpan = this.mSpan;
    TextView localTextView = this.mTextView;
    Log.v("s", "contains?" + localRect.contains(m, n));
    if ((localRect.contains(m, n)) && ((i == 1) || (i == 0)))
    {
      if (i == 1)
        if (localStyledClickableSpan != null)
        {
          localStyledClickableSpan.onClick(localTextView);
          deselectSpan();
        }
      while (true)
      {
        return true;
        Log.v("s", "selecting span");
        localStyledClickableSpan.select(true);
        this.mSpan = arrayOfStyledClickableSpan[0];
        localTextView.invalidate();
      }
    }
    if ((localStyledClickableSpan != null) && ((Math.abs(j - this.mLastUrlDownX) > this.mTouchSlop) || (Math.abs(k - this.mLastUrlDownY) > this.mTouchSlop)))
    {
      Log.v("s", "deselecting due to slop");
      deselectSpan();
    }
    return false;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.LinkTouchListener
 * JD-Core Version:    0.6.2
 */