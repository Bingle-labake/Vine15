package co.vine.android.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TabHost;

public class IconTabHost extends TabHost
{
  private OnTabClickedListener mOnTabClickedListener;

  public IconTabHost(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public void dispatchWindowFocusChanged(boolean paramBoolean)
  {
    if (getCurrentView() != null)
      super.dispatchWindowFocusChanged(paramBoolean);
  }

  public void setCurrentTab(int paramInt)
  {
    if (paramInt == getCurrentTab())
    {
      if (this.mOnTabClickedListener != null)
        this.mOnTabClickedListener.onCurrentTabClicked();
      return;
    }
    super.setCurrentTab(paramInt);
  }

  public void setOnTabClickedListener(OnTabClickedListener paramOnTabClickedListener)
  {
    this.mOnTabClickedListener = paramOnTabClickedListener;
  }

  public void setTabExplicit(int paramInt)
  {
    super.setCurrentTab(paramInt);
  }

  public static abstract interface OnTabClickedListener
  {
    public abstract void onCurrentTabClicked();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.IconTabHost
 * JD-Core Version:    0.6.2
 */