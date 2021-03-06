package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.support.v7.app.ActionBar;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.id;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;

public class ActionBarOverlayLayout extends FrameLayout
{
  static final int[] mActionBarSizeAttr = arrayOfInt;
  private ActionBar mActionBar;
  private View mActionBarBottom;
  private int mActionBarHeight;
  private View mActionBarTop;
  private ActionBarView mActionView;
  private ActionBarContainer mContainerView;
  private View mContent;
  private final Rect mZeroRect = new Rect(0, 0, 0, 0);

  static
  {
    int[] arrayOfInt = new int[1];
    arrayOfInt[0] = R.attr.actionBarSize;
  }

  public ActionBarOverlayLayout(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }

  public ActionBarOverlayLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext);
  }

  private boolean applyInsets(View paramView, Rect paramRect, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
  {
    FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)paramView.getLayoutParams();
    boolean bool = false;
    if (paramBoolean1)
    {
      int i = localLayoutParams.leftMargin;
      int j = paramRect.left;
      bool = false;
      if (i != j)
      {
        bool = true;
        localLayoutParams.leftMargin = paramRect.left;
      }
    }
    if ((paramBoolean2) && (localLayoutParams.topMargin != paramRect.top))
    {
      bool = true;
      localLayoutParams.topMargin = paramRect.top;
    }
    if ((paramBoolean4) && (localLayoutParams.rightMargin != paramRect.right))
    {
      bool = true;
      localLayoutParams.rightMargin = paramRect.right;
    }
    if ((paramBoolean3) && (localLayoutParams.bottomMargin != paramRect.bottom))
    {
      bool = true;
      localLayoutParams.bottomMargin = paramRect.bottom;
    }
    return bool;
  }

  private void init(Context paramContext)
  {
    TypedArray localTypedArray = getContext().getTheme().obtainStyledAttributes(mActionBarSizeAttr);
    this.mActionBarHeight = localTypedArray.getDimensionPixelSize(0, 0);
    localTypedArray.recycle();
  }

  void pullChildren()
  {
    if (this.mContent == null)
    {
      this.mContent = findViewById(R.id.action_bar_activity_content);
      this.mActionBarTop = findViewById(R.id.top_action_bar);
      this.mContainerView = ((ActionBarContainer)findViewById(R.id.action_bar_container));
      this.mActionView = ((ActionBarView)findViewById(R.id.action_bar));
      this.mActionBarBottom = findViewById(R.id.split_action_bar);
    }
  }

  public void setActionBar(ActionBar paramActionBar)
  {
    this.mActionBar = paramActionBar;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v7.internal.widget.ActionBarOverlayLayout
 * JD-Core Version:    0.6.2
 */