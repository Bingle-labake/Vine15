package co.vine.android.widget;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;

public class ConfigurableViewPager extends ViewPager
{
  private boolean mSwipingEnabled = true;

  public ConfigurableViewPager(Context paramContext)
  {
    this(paramContext, null);
  }

  public ConfigurableViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.mSwipingEnabled)
      return super.onInterceptTouchEvent(paramMotionEvent);
    return false;
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.mSwipingEnabled)
      return super.onTouchEvent(paramMotionEvent);
    return false;
  }

  public void setSwipingEnabled(boolean paramBoolean)
  {
    this.mSwipingEnabled = paramBoolean;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.ConfigurableViewPager
 * JD-Core Version:    0.6.2
 */