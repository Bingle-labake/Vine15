package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.widget.Button;

public class TabButton extends Button
{
  private static final int[] TAB_SELECTED_STATE_SET = { 2130772029 };
  private final int mDeselectedColor;
  private boolean mSelected;
  private final int mSelectedColor;

  public TabButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public TabButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public TabButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.mSelectedColor = paramContext.getResources().getColor(2131296332);
    this.mDeselectedColor = paramContext.getResources().getColor(2131296333);
  }

  protected int[] onCreateDrawableState(int paramInt)
  {
    int[] arrayOfInt = super.onCreateDrawableState(paramInt + 1);
    if (this.mSelected)
      mergeDrawableStates(arrayOfInt, TAB_SELECTED_STATE_SET);
    return arrayOfInt;
  }

  public void setSelected(boolean paramBoolean)
  {
    if (paramBoolean)
      setTextColor(this.mSelectedColor);
    while (true)
    {
      this.mSelected = paramBoolean;
      refreshDrawableState();
      return;
      setTextColor(this.mDeselectedColor);
    }
  }

  public static abstract interface TabChanger
  {
    public abstract void changeTab(Button paramButton);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.TabButton
 * JD-Core Version:    0.6.2
 */