package android.support.v7.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.v4.app.ActionBarDrawerToggle.Delegate;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.bool;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.style;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.menu.ListMenuPresenter;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.internal.view.menu.MenuView;
import android.support.v7.internal.view.menu.MenuWrapperFactory;
import android.support.v7.internal.widget.ActionBarContainer;
import android.support.v7.internal.widget.ActionBarContextView;
import android.support.v7.internal.widget.ActionBarView;
import android.support.v7.internal.widget.ProgressBarICS;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.FrameLayout;

class ActionBarActivityDelegateBase extends ActionBarActivityDelegate
  implements MenuPresenter.Callback, MenuBuilder.Callback
{
  private static final int[] ACTION_BAR_DRAWABLE_TOGGLE_ATTRS = arrayOfInt;
  private static final String TAG = "ActionBarActivityDelegateBase";
  private ActionBarView mActionBarView;
  private ActionMode mActionMode;
  private boolean mFeatureIndeterminateProgress;
  private boolean mFeatureProgress;
  private boolean mInvalidateMenuPosted;
  private final Runnable mInvalidateMenuRunnable = new Runnable()
  {
    public void run()
    {
      MenuBuilder localMenuBuilder = ActionBarActivityDelegateBase.this.createMenu();
      if ((ActionBarActivityDelegateBase.this.mActivity.superOnCreatePanelMenu(0, localMenuBuilder)) && (ActionBarActivityDelegateBase.this.mActivity.superOnPreparePanel(0, null, localMenuBuilder)))
        ActionBarActivityDelegateBase.this.setMenu(localMenuBuilder);
      while (true)
      {
        ActionBarActivityDelegateBase.access$202(ActionBarActivityDelegateBase.this, false);
        return;
        ActionBarActivityDelegateBase.this.setMenu(null);
      }
    }
  };
  private ListMenuPresenter mListMenuPresenter;
  private MenuBuilder mMenu;
  private boolean mSubDecorInstalled;

  static
  {
    int[] arrayOfInt = new int[1];
    arrayOfInt[0] = R.attr.homeAsUpIndicator;
  }

  ActionBarActivityDelegateBase(ActionBarActivity paramActionBarActivity)
  {
    super(paramActionBarActivity);
  }

  private MenuBuilder createMenu()
  {
    MenuBuilder localMenuBuilder = new MenuBuilder(getActionBarThemedContext());
    localMenuBuilder.setCallback(this);
    return localMenuBuilder;
  }

  private ProgressBarICS getCircularProgressBar()
  {
    ProgressBarICS localProgressBarICS = (ProgressBarICS)this.mActionBarView.findViewById(R.id.progress_circular);
    if (localProgressBarICS != null)
      localProgressBarICS.setVisibility(4);
    return localProgressBarICS;
  }

  private ProgressBarICS getHorizontalProgressBar()
  {
    ProgressBarICS localProgressBarICS = (ProgressBarICS)this.mActionBarView.findViewById(R.id.progress_horizontal);
    if (localProgressBarICS != null)
      localProgressBarICS.setVisibility(4);
    return localProgressBarICS;
  }

  private MenuView getListMenuView(Context paramContext, MenuPresenter.Callback paramCallback)
  {
    if (this.mMenu == null)
      return null;
    if (this.mListMenuPresenter == null)
    {
      TypedArray localTypedArray = paramContext.obtainStyledAttributes(R.styleable.Theme);
      int i = localTypedArray.getResourceId(4, R.style.Theme_AppCompat_CompactMenu);
      localTypedArray.recycle();
      this.mListMenuPresenter = new ListMenuPresenter(R.layout.abc_list_menu_item_layout, i);
      this.mListMenuPresenter.setCallback(paramCallback);
      this.mMenu.addMenuPresenter(this.mListMenuPresenter);
    }
    while (true)
    {
      return this.mListMenuPresenter.getMenuView(new FrameLayout(paramContext));
      this.mListMenuPresenter.updateMenuView(false);
    }
  }

  private void hideProgressBars(ProgressBarICS paramProgressBarICS1, ProgressBarICS paramProgressBarICS2)
  {
    if ((this.mFeatureIndeterminateProgress) && (paramProgressBarICS2.getVisibility() == 0))
      paramProgressBarICS2.setVisibility(4);
    if ((this.mFeatureProgress) && (paramProgressBarICS1.getVisibility() == 0))
      paramProgressBarICS1.setVisibility(4);
  }

  private void reopenMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if ((this.mActionBarView != null) && (this.mActionBarView.isOverflowReserved()))
    {
      if ((!this.mActionBarView.isOverflowMenuShowing()) || (!paramBoolean))
      {
        if (this.mActionBarView.getVisibility() == 0)
          this.mActionBarView.showOverflowMenu();
        return;
      }
      this.mActionBarView.hideOverflowMenu();
      return;
    }
    paramMenuBuilder.close();
  }

  private void setMenu(MenuBuilder paramMenuBuilder)
  {
    if (paramMenuBuilder == this.mMenu);
    do
    {
      return;
      if (this.mMenu != null)
        this.mMenu.removeMenuPresenter(this.mListMenuPresenter);
      this.mMenu = paramMenuBuilder;
      if ((paramMenuBuilder != null) && (this.mListMenuPresenter != null))
        paramMenuBuilder.addMenuPresenter(this.mListMenuPresenter);
    }
    while (this.mActionBarView == null);
    this.mActionBarView.setMenu(paramMenuBuilder, this);
  }

  private void showProgressBars(ProgressBarICS paramProgressBarICS1, ProgressBarICS paramProgressBarICS2)
  {
    if ((this.mFeatureIndeterminateProgress) && (paramProgressBarICS2.getVisibility() == 4))
      paramProgressBarICS2.setVisibility(0);
    if ((this.mFeatureProgress) && (paramProgressBarICS1.getProgress() < 10000))
      paramProgressBarICS1.setVisibility(0);
  }

  private void updateProgressBars(int paramInt)
  {
    ProgressBarICS localProgressBarICS1 = getCircularProgressBar();
    ProgressBarICS localProgressBarICS2 = getHorizontalProgressBar();
    int j;
    if (paramInt == -1)
      if (this.mFeatureProgress)
      {
        int i = localProgressBarICS2.getProgress();
        if ((localProgressBarICS2.isIndeterminate()) || (i < 10000))
        {
          j = 0;
          localProgressBarICS2.setVisibility(j);
        }
      }
      else if (this.mFeatureIndeterminateProgress)
      {
        localProgressBarICS1.setVisibility(0);
      }
    label104: 
    do
    {
      do
      {
        return;
        j = 4;
        break;
        if (paramInt != -2)
          break label104;
        if (this.mFeatureProgress)
          localProgressBarICS2.setVisibility(8);
      }
      while (!this.mFeatureIndeterminateProgress);
      localProgressBarICS1.setVisibility(8);
      return;
      if (paramInt == -3)
      {
        localProgressBarICS2.setIndeterminate(true);
        return;
      }
      if (paramInt == -4)
      {
        localProgressBarICS2.setIndeterminate(false);
        return;
      }
    }
    while ((paramInt < 0) || (paramInt > 10000));
    localProgressBarICS2.setProgress(paramInt + 0);
    if (paramInt < 10000)
    {
      showProgressBars(localProgressBarICS2, localProgressBarICS1);
      return;
    }
    hideProgressBars(localProgressBarICS2, localProgressBarICS1);
  }

  public void addContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    if (this.mHasActionBar)
    {
      ((ViewGroup)this.mActivity.findViewById(R.id.action_bar_activity_content)).addView(paramView, paramLayoutParams);
      return;
    }
    this.mActivity.superSetContentView(paramView, paramLayoutParams);
  }

  public ActionBar createSupportActionBar()
  {
    ensureSubDecor();
    return new ActionBarImplBase(this.mActivity, this.mActivity);
  }

  final void ensureSubDecor()
  {
    boolean bool1;
    boolean bool2;
    if ((this.mHasActionBar) && (!this.mSubDecorInstalled))
    {
      if (!this.mOverlayActionBar)
        break label205;
      this.mActivity.superSetContentView(R.layout.abc_action_bar_decor_overlay);
      this.mActionBarView = ((ActionBarView)this.mActivity.findViewById(R.id.action_bar));
      this.mActionBarView.setWindowCallback(this.mActivity);
      if (this.mFeatureProgress)
        this.mActionBarView.initProgress();
      if (this.mFeatureIndeterminateProgress)
        this.mActionBarView.initIndeterminateProgress();
      bool1 = "splitActionBarWhenNarrow".equals(getUiOptionsFromMetadata());
      if (!bool1)
        break label218;
      bool2 = this.mActivity.getResources().getBoolean(R.bool.abc_split_action_bar_is_narrow);
    }
    while (true)
    {
      ActionBarContainer localActionBarContainer = (ActionBarContainer)this.mActivity.findViewById(R.id.split_action_bar);
      if (localActionBarContainer != null)
      {
        this.mActionBarView.setSplitView(localActionBarContainer);
        this.mActionBarView.setSplitActionBar(bool2);
        this.mActionBarView.setSplitWhenNarrow(bool1);
        ActionBarContextView localActionBarContextView = (ActionBarContextView)this.mActivity.findViewById(R.id.action_context_bar);
        localActionBarContextView.setSplitView(localActionBarContainer);
        localActionBarContextView.setSplitActionBar(bool2);
        localActionBarContextView.setSplitWhenNarrow(bool1);
      }
      this.mSubDecorInstalled = true;
      supportInvalidateOptionsMenu();
      return;
      label205: this.mActivity.superSetContentView(R.layout.abc_action_bar_decor);
      break;
      label218: TypedArray localTypedArray = this.mActivity.obtainStyledAttributes(R.styleable.ActionBarWindow);
      bool2 = localTypedArray.getBoolean(2, false);
      localTypedArray.recycle();
    }
  }

  ActionBarDrawerToggle.Delegate getDrawerToggleDelegate()
  {
    return new ActionBarDrawableToggleImpl(null);
  }

  public boolean onBackPressed()
  {
    if (this.mActionMode != null)
    {
      this.mActionMode.finish();
      return true;
    }
    if ((this.mActionBarView != null) && (this.mActionBarView.hasExpandedActionView()))
    {
      this.mActionBarView.collapseActionView();
      return true;
    }
    return false;
  }

  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    this.mActivity.closeOptionsMenu();
  }

  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if ((this.mHasActionBar) && (this.mSubDecorInstalled))
      ((ActionBarImplBase)getSupportActionBar()).onConfigurationChanged(paramConfiguration);
  }

  public boolean onCreatePanelMenu(int paramInt, Menu paramMenu)
  {
    if (paramInt != 0)
      return this.mActivity.superOnCreatePanelMenu(paramInt, paramMenu);
    return false;
  }

  public View onCreatePanelView(int paramInt)
  {
    View localView = null;
    if (paramInt == 0)
    {
      boolean bool = true;
      MenuBuilder localMenuBuilder = this.mMenu;
      if (this.mActionMode == null)
      {
        if (localMenuBuilder == null)
        {
          localMenuBuilder = createMenu();
          setMenu(localMenuBuilder);
          localMenuBuilder.stopDispatchingItemsChanged();
          bool = this.mActivity.superOnCreatePanelMenu(0, localMenuBuilder);
        }
        if (bool)
        {
          localMenuBuilder.stopDispatchingItemsChanged();
          bool = this.mActivity.superOnPreparePanel(0, null, localMenuBuilder);
        }
      }
      if (bool)
      {
        localView = (View)getListMenuView(this.mActivity, this);
        localMenuBuilder.startDispatchingItemsChanged();
      }
    }
    else
    {
      return localView;
    }
    setMenu(null);
    return null;
  }

  public boolean onMenuItemSelected(int paramInt, MenuItem paramMenuItem)
  {
    if (paramInt == 0)
      paramMenuItem = MenuWrapperFactory.createMenuItemWrapper(paramMenuItem);
    return this.mActivity.superOnMenuItemSelected(paramInt, paramMenuItem);
  }

  public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
  {
    return this.mActivity.onMenuItemSelected(0, paramMenuItem);
  }

  public void onMenuModeChange(MenuBuilder paramMenuBuilder)
  {
    reopenMenu(paramMenuBuilder, true);
  }

  public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
  {
    return false;
  }

  public void onPostResume()
  {
    ActionBarImplBase localActionBarImplBase = (ActionBarImplBase)getSupportActionBar();
    if (localActionBarImplBase != null)
      localActionBarImplBase.setShowHideAnimationEnabled(true);
  }

  public boolean onPreparePanel(int paramInt, View paramView, Menu paramMenu)
  {
    if (paramInt != 0)
      return this.mActivity.superOnPreparePanel(paramInt, paramView, paramMenu);
    return false;
  }

  public void onStop()
  {
    ActionBarImplBase localActionBarImplBase = (ActionBarImplBase)getSupportActionBar();
    if (localActionBarImplBase != null)
      localActionBarImplBase.setShowHideAnimationEnabled(false);
  }

  public void onTitleChanged(CharSequence paramCharSequence)
  {
    if (this.mActionBarView != null)
      this.mActionBarView.setWindowTitle(paramCharSequence);
  }

  public void setContentView(int paramInt)
  {
    ensureSubDecor();
    if (this.mHasActionBar)
    {
      ViewGroup localViewGroup = (ViewGroup)this.mActivity.findViewById(R.id.action_bar_activity_content);
      localViewGroup.removeAllViews();
      this.mActivity.getLayoutInflater().inflate(paramInt, localViewGroup);
      return;
    }
    this.mActivity.superSetContentView(paramInt);
  }

  public void setContentView(View paramView)
  {
    ensureSubDecor();
    if (this.mHasActionBar)
    {
      ViewGroup localViewGroup = (ViewGroup)this.mActivity.findViewById(R.id.action_bar_activity_content);
      localViewGroup.removeAllViews();
      localViewGroup.addView(paramView);
      return;
    }
    this.mActivity.superSetContentView(paramView);
  }

  public void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    if (this.mHasActionBar)
    {
      ViewGroup localViewGroup = (ViewGroup)this.mActivity.findViewById(R.id.action_bar_activity_content);
      localViewGroup.removeAllViews();
      localViewGroup.addView(paramView, paramLayoutParams);
      return;
    }
    this.mActivity.superSetContentView(paramView, paramLayoutParams);
  }

  void setSupportProgress(int paramInt)
  {
    updateProgressBars(paramInt + 0);
  }

  void setSupportProgressBarIndeterminate(boolean paramBoolean)
  {
    if (paramBoolean);
    for (int i = -3; ; i = -4)
    {
      updateProgressBars(i);
      return;
    }
  }

  void setSupportProgressBarIndeterminateVisibility(boolean paramBoolean)
  {
    if (paramBoolean);
    for (int i = -1; ; i = -2)
    {
      updateProgressBars(i);
      return;
    }
  }

  void setSupportProgressBarVisibility(boolean paramBoolean)
  {
    if (paramBoolean);
    for (int i = -1; ; i = -2)
    {
      updateProgressBars(i);
      return;
    }
  }

  public ActionMode startSupportActionMode(ActionMode.Callback paramCallback)
  {
    if (paramCallback == null)
      throw new IllegalArgumentException("ActionMode callback can not be null.");
    if (this.mActionMode != null)
      this.mActionMode.finish();
    ActionModeCallbackWrapper localActionModeCallbackWrapper = new ActionModeCallbackWrapper(paramCallback);
    ActionBarImplBase localActionBarImplBase = (ActionBarImplBase)getSupportActionBar();
    if (localActionBarImplBase != null)
      this.mActionMode = localActionBarImplBase.startActionMode(localActionModeCallbackWrapper);
    if (this.mActionMode != null)
      this.mActivity.onSupportActionModeStarted(this.mActionMode);
    return this.mActionMode;
  }

  public void supportInvalidateOptionsMenu()
  {
    if (!this.mInvalidateMenuPosted)
    {
      this.mInvalidateMenuPosted = true;
      this.mActivity.getWindow().getDecorView().post(this.mInvalidateMenuRunnable);
    }
  }

  public boolean supportRequestWindowFeature(int paramInt)
  {
    switch (paramInt)
    {
    case 3:
    case 4:
    case 6:
    case 7:
    default:
      return this.mActivity.requestWindowFeature(paramInt);
    case 8:
      this.mHasActionBar = true;
      return true;
    case 9:
      this.mOverlayActionBar = true;
      return true;
    case 2:
      this.mFeatureProgress = true;
      return true;
    case 5:
    }
    this.mFeatureIndeterminateProgress = true;
    return true;
  }

  private class ActionBarDrawableToggleImpl
    implements ActionBarDrawerToggle.Delegate
  {
    private ActionBarDrawableToggleImpl()
    {
    }

    public Drawable getThemeUpIndicator()
    {
      TypedArray localTypedArray = ActionBarActivityDelegateBase.this.mActivity.obtainStyledAttributes(ActionBarActivityDelegateBase.ACTION_BAR_DRAWABLE_TOGGLE_ATTRS);
      Drawable localDrawable = localTypedArray.getDrawable(0);
      localTypedArray.recycle();
      return localDrawable;
    }

    public void setActionBarDescription(int paramInt)
    {
    }

    public void setActionBarUpIndicator(Drawable paramDrawable, int paramInt)
    {
      if (ActionBarActivityDelegateBase.this.mActionBarView != null)
        ActionBarActivityDelegateBase.this.mActionBarView.setHomeAsUpIndicator(paramDrawable);
    }
  }

  private class ActionModeCallbackWrapper
    implements ActionMode.Callback
  {
    private ActionMode.Callback mWrapped;

    public ActionModeCallbackWrapper(ActionMode.Callback arg2)
    {
      Object localObject;
      this.mWrapped = localObject;
    }

    public boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem)
    {
      return this.mWrapped.onActionItemClicked(paramActionMode, paramMenuItem);
    }

    public boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return this.mWrapped.onCreateActionMode(paramActionMode, paramMenu);
    }

    public void onDestroyActionMode(ActionMode paramActionMode)
    {
      this.mWrapped.onDestroyActionMode(paramActionMode);
      ActionBarActivityDelegateBase.this.mActivity.onSupportActionModeFinished(paramActionMode);
      ActionBarActivityDelegateBase.access$402(ActionBarActivityDelegateBase.this, null);
    }

    public boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return this.mWrapped.onPrepareActionMode(paramActionMode, paramMenu);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v7.app.ActionBarActivityDelegateBase
 * JD-Core Version:    0.6.2
 */