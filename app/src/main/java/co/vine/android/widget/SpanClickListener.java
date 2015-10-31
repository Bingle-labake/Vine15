package co.vine.android.widget;

import android.view.View;

public abstract interface SpanClickListener
{
  public static final int COMMENT_SPAN = 2;
  public static final int TAG_SPAN = 3;
  public static final int USERNAME_SPAN = 1;

  public abstract void onSpanClicked(View paramView, int paramInt, Object paramObject);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.SpanClickListener
 * JD-Core Version:    0.6.2
 */