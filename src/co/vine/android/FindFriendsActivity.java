package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TabHost;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabContentFactory;
import android.widget.TabHost.TabSpec;
import android.widget.TabWidget;
import co.vine.android.client.AppSessionListener;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.widget.IconTabHost;
import co.vine.android.widget.IconTabHost.OnTabClickedListener;
import co.vine.android.widget.OnTabChangedListener;
import co.vine.android.widget.TabIndicator;
import co.vine.android.widget.ViewPagerScrollBar;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

public class FindFriendsActivity extends BaseControllerActionBarActivity
  implements TabHost.OnTabChangeListener, IconTabHost.OnTabClickedListener
{
  private static final String STATE_CURRENT_TAB = "currentTab";
  public static final String TAG_ADDRESS_BOOK = "address";
  public static final String TAG_SEARCH = "search";
  public static final String TAG_TWITTER = "twitter";
  private ViewPagerScrollBar mScrollBar;
  private IconTabHost mTabHost;
  private TabsAdapter mTabsAdapter;
  private ViewPager mViewPager;

  private void setupTabs()
  {
    this.mTabHost = ((IconTabHost)findViewById(16908306));
    if (this.mTabHost == null)
      throw new RuntimeException("Your content must have a TabHost whose id attribute is 'android.R.id.tabhost'");
    this.mTabHost.setup();
    this.mViewPager = ((ViewPager)findViewById(2131361926));
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 1:
    case 2:
    }
    this.mTabsAdapter.getTab(1).fragment().onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onContentChanged()
  {
    super.onContentChanged();
    if (!BuildUtil.isExplore())
      setupTabs();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903105, true);
    if (BuildUtil.isExplore())
      setupTabs();
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624111), Boolean.valueOf(true));
    IconTabHost localIconTabHost = this.mTabHost;
    this.mScrollBar = ((ViewPagerScrollBar)findViewById(2131361970));
    this.mScrollBar.setRange(3);
    this.mViewPager = ((ViewPager)findViewById(2131361926));
    this.mViewPager.setPageMargin(getResources().getDimensionPixelSize(2131427385));
    this.mViewPager.setPageMarginDrawable(2131296265);
    this.mViewPager.setOffscreenPageLimit(2);
    this.mTabsAdapter = new TabsAdapter(this, localIconTabHost, this.mViewPager, this.mScrollBar);
    this.mAppSessionListener = new FindFriendsListener(null);
    LayoutInflater localLayoutInflater = LayoutInflater.from(this);
    localIconTabHost.setOnTabChangedListener(this);
    localIconTabHost.setOnTabClickedListener(this);
    Bundle localBundle1 = new Bundle();
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("address").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903090, localIconTabHost, 2130837757, 0)), FindFriendsAddressFragment.class, localBundle1);
    Bundle localBundle2 = new Bundle();
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("twitter").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903090, localIconTabHost, 2130837759, 0)), FindFriendsTwitterFragment.class, localBundle2);
    Bundle localBundle3 = new Bundle();
    localBundle3.putInt("layout", 2130903089);
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("search").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903090, localIconTabHost, 2130837758, 0)), FindFriendsSearchFragment.class, localBundle3);
  }

  public void onCurrentTabClicked()
  {
  }

  protected void onDestroy()
  {
    super.onDestroy();
    int i = this.mTabHost.getCurrentTab();
    Fragment localFragment = ((TabInfo)this.mTabsAdapter.mTabs.get(i)).fragment();
    if ((localFragment instanceof OnTabChangedListener))
      ((OnTabChangedListener)localFragment).onMoveAway(i);
  }

  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
    String str = paramBundle.getString("currentTab");
    if (str != null)
      setCurrentTabByTag(str);
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    String str = this.mTabHost.getCurrentTabTag();
    if (str != null)
      paramBundle.putString("currentTab", str);
  }

  public void onTabChanged(String paramString)
  {
    this.mViewPager.setCurrentItem(this.mTabHost.getCurrentTab());
  }

  void setCurrentTabByTag(String paramString)
  {
    IconTabHost localIconTabHost = this.mTabHost;
    if (!paramString.equals(localIconTabHost.getCurrentTabTag()))
      localIconTabHost.setCurrentTabByTag(paramString);
    this.mScrollBar.setPosition(this.mViewPager.getCurrentItem());
  }

  static class DummyTabFactory
    implements TabHost.TabContentFactory
  {
    private final Context mContext;

    public DummyTabFactory(Context paramContext)
    {
      this.mContext = paramContext;
    }

    public View createTabContent(String paramString)
    {
      View localView = new View(this.mContext);
      localView.setMinimumWidth(0);
      localView.setMinimumHeight(0);
      return localView;
    }
  }

  private class FindFriendsListener extends AppSessionListener
  {
    private FindFriendsListener()
    {
    }
  }

  static class TabInfo
  {
    final Bundle bundle;
    final Class<?> clss;
    private WeakReference<Fragment> mRef;
    private String mTag;
    final String tab;

    TabInfo(Class<?> paramClass, Bundle paramBundle, String paramString)
    {
      this.clss = paramClass;
      this.bundle = paramBundle;
      this.tab = paramString;
    }

    Fragment fragment()
    {
      if (this.mRef != null)
        return (Fragment)this.mRef.get();
      return null;
    }

    public String getTag()
    {
      return this.mTag;
    }

    void setFragment(Fragment paramFragment)
    {
      this.mRef = new WeakReference(paramFragment);
      this.mTag = paramFragment.getTag();
    }
  }

  private static class TabSavedState
    implements Parcelable
  {
    public static final Parcelable.Creator<TabSavedState> CREATOR = new Parcelable.Creator()
    {
      public FindFriendsActivity.TabSavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new FindFriendsActivity.TabSavedState(paramAnonymousParcel);
      }

      public FindFriendsActivity.TabSavedState[] newArray(int paramAnonymousInt)
      {
        return new FindFriendsActivity.TabSavedState[paramAnonymousInt];
      }
    };
    public final String[] tags;

    public TabSavedState(Parcel paramParcel)
    {
      this.tags = paramParcel.createStringArray();
    }

    public TabSavedState(ArrayList<FindFriendsActivity.TabInfo> paramArrayList)
    {
      int i = paramArrayList.size();
      String[] arrayOfString = new String[i];
      for (int j = 0; j < i; j++)
        arrayOfString[j] = ((FindFriendsActivity.TabInfo)paramArrayList.get(j)).getTag();
      this.tags = arrayOfString;
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeStringArray(this.tags);
    }
  }

  static class TabsAdapter extends FragmentPagerAdapter
    implements ViewPager.OnPageChangeListener
  {
    private final BaseControllerActionBarActivity mActivity;
    private final ViewPagerScrollBar mScrollBar;
    private final FindFriendsActivity.DummyTabFactory mTabFactory;
    private final TabHost mTabHost;
    private final ArrayList<FindFriendsActivity.TabInfo> mTabs = new ArrayList();
    private final ViewPager mViewPager;
    public int previousTab;

    public TabsAdapter(BaseControllerActionBarActivity paramBaseControllerActionBarActivity, TabHost paramTabHost, ViewPager paramViewPager, ViewPagerScrollBar paramViewPagerScrollBar)
    {
      super();
      this.mActivity = paramBaseControllerActionBarActivity;
      this.mTabHost = paramTabHost;
      this.mViewPager = paramViewPager;
      this.mViewPager.setAdapter(this);
      this.mViewPager.setOnPageChangeListener(this);
      this.mScrollBar = paramViewPagerScrollBar;
      this.mTabFactory = new FindFriendsActivity.DummyTabFactory(this.mActivity);
    }

    public void addTab(TabHost.TabSpec paramTabSpec, Class<?> paramClass, Bundle paramBundle)
    {
      FindFriendsActivity.TabInfo localTabInfo = new FindFriendsActivity.TabInfo(paramClass, paramBundle, paramTabSpec.getTag());
      paramTabSpec.setContent(this.mTabFactory);
      this.mTabs.add(localTabInfo);
      this.mTabHost.addTab(paramTabSpec);
      notifyDataSetChanged();
    }

    public int getCount()
    {
      return this.mTabs.size();
    }

    public Fragment getItem(int paramInt)
    {
      return Fragment.instantiate(this.mActivity, ((FindFriendsActivity.TabInfo)this.mTabs.get(paramInt)).clss.getName(), ((FindFriendsActivity.TabInfo)this.mTabs.get(paramInt)).bundle);
    }

    public int getItemPosition(Object paramObject)
    {
      Iterator localIterator = this.mTabs.iterator();
      do
      {
        boolean bool = localIterator.hasNext();
        i = 0;
        if (!bool)
          break;
      }
      while (((FindFriendsActivity.TabInfo)localIterator.next()).fragment() != paramObject);
      int i = 1;
      if (i != 0)
        return -1;
      return -2;
    }

    public FindFriendsActivity.TabInfo getTab(int paramInt)
    {
      return (FindFriendsActivity.TabInfo)this.mTabs.get(paramInt);
    }

    public Object instantiateItem(ViewGroup paramViewGroup, int paramInt)
    {
      Fragment localFragment = (Fragment)super.instantiateItem(paramViewGroup, paramInt);
      ((FindFriendsActivity.TabInfo)this.mTabs.get(paramInt)).setFragment(localFragment);
      return localFragment;
    }

    public void onPageScrollStateChanged(int paramInt)
    {
    }

    public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
    {
      if (this.mViewPager.getCurrentItem() < paramInt1)
      {
        this.mScrollBar.scroll(paramInt1, -paramInt2);
        return;
      }
      this.mScrollBar.scroll(paramInt1, paramInt2);
    }

    public void onPageSelected(int paramInt)
    {
      TabWidget localTabWidget = this.mTabHost.getTabWidget();
      int i = localTabWidget.getDescendantFocusability();
      localTabWidget.setDescendantFocusability(393216);
      if (paramInt != this.previousTab)
      {
        ((IconTabHost)this.mTabHost).setTabExplicit(paramInt);
        Fragment localFragment1 = ((FindFriendsActivity.TabInfo)this.mTabs.get(this.previousTab)).fragment();
        if ((localFragment1 != null) && ((localFragment1 instanceof OnTabChangedListener)))
          ((OnTabChangedListener)localFragment1).onMoveAway(paramInt);
        Fragment localFragment2 = ((FindFriendsActivity.TabInfo)this.mTabs.get(paramInt)).fragment();
        if ((localFragment2 != null) && ((localFragment2 instanceof OnTabChangedListener)))
          ((OnTabChangedListener)localFragment2).onMoveTo(this.previousTab);
      }
      this.previousTab = this.mTabHost.getCurrentTab();
      FlurryUtils.trackFindFriendsTabSelect(paramInt);
      this.mScrollBar.setPageColor(paramInt);
      localTabWidget.setDescendantFocusability(i);
    }

    public void restoreState(Parcelable paramParcelable, ClassLoader paramClassLoader)
    {
      String[] arrayOfString = ((FindFriendsActivity.TabSavedState)paramParcelable).tags;
      for (int i = 0; i < arrayOfString.length; i++)
      {
        String str = arrayOfString[i];
        Fragment localFragment = this.mActivity.getSupportFragmentManager().findFragmentByTag(str);
        if (localFragment != null)
          ((FindFriendsActivity.TabInfo)this.mTabs.get(i)).setFragment(localFragment);
      }
    }

    public Parcelable saveState()
    {
      return new FindFriendsActivity.TabSavedState(this.mTabs);
    }

    public ArrayList<FindFriendsActivity.TabInfo> tabs()
    {
      return this.mTabs;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.FindFriendsActivity
 * JD-Core Version:    0.6.2
 */