package co.vine.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.Process;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.TabHost;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabContentFactory;
import android.widget.TabHost.TabSpec;
import android.widget.TabWidget;
import android.widget.Toast;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.service.GCMRegistrationService;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.widget.IconTabHost;
import co.vine.android.widget.IconTabHost.OnTabClickedListener;
import co.vine.android.widget.OnTabChangedListener;
import co.vine.android.widget.TabIndicator;
import co.vine.android.widget.ViewPagerScrollBar;
import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.SLog;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.twitter.android.widget.TopScrollable;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

public class HomeTabActivity extends BaseTimelineActivity
  implements TabHost.OnTabChangeListener, IconTabHost.OnTabClickedListener, View.OnLongClickListener
{
  public static final String HOST_POST = "post";
  public static final String HOST_TIMELINES = "timelines";
  public static final String HOST_VINE = "vine.co";
  public static final String HOST_VINE_DEV = "plant.vine.co";
  public static final int INDEX_ACTIVITY_TAB = 1;
  public static final String PREFIX_SHARED_VIDEO = "v";
  public static final String PREFIX_USER_ID = "u";
  public static final int REQUEST_CODE_VIEW_NOTIF = 1;
  public static final String SCHEME_VINE = "vine";
  public static final String TAB_PROFILE = "profile";
  public static final String TAG_ACTIVITY = "activity";
  public static final String TAG_EXPLORE = "explore";
  public static final String TAG_HOME = "home";
  private Menu mMenu;
  private IconTabHost mTabHost;
  private TabsAdapter mTabsAdapter;
  private ViewPager mViewPager;

  private void logTabChange(String paramString)
  {
    Crashlytics.setString("Current Tab", paramString);
    if ((paramString != null) && (!paramString.contains("switcher")))
      FlurryUtils.trackTabChange(paramString);
  }

  private void setupTabs()
  {
    this.mTabHost = ((IconTabHost)findViewById(16908306));
    if (this.mTabHost == null)
      throw new RuntimeException("Your content must have a TabHost whose id attribute is 'android.R.id.tabhost'");
    this.mTabHost.setup();
    this.mViewPager = ((ViewPager)findViewById(2131361926));
  }

  public static void start(Activity paramActivity, String paramString)
  {
    paramActivity.startActivity(new Intent(paramActivity, HomeTabActivity.class).addFlags(67108864));
    paramActivity.finish();
  }

  private String trimSegment(String paramString)
  {
    return paramString.replaceAll("\\s+", "").replace("\\", "");
  }

  protected BaseTimelineFragment getCurrentTimeLineFragment()
  {
    try
    {
      String str = ((TabInfo)TabsAdapter.access$000(this.mTabsAdapter).get(this.mTabHost.getCurrentTab())).mTag;
      Fragment localFragment = getSupportFragmentManager().findFragmentByTag(str);
      if ((localFragment instanceof BaseTimelineFragment))
      {
        BaseTimelineFragment localBaseTimelineFragment = (BaseTimelineFragment)localFragment;
        return localBaseTimelineFragment;
      }
      return null;
    }
    catch (Exception localException)
    {
    }
    return null;
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    ArrayList localArrayList;
    if (this.mTabsAdapter != null)
    {
      localArrayList = this.mTabsAdapter.mTabs;
      if (paramInt1 != 0)
        break label91;
      Util.getDefaultSharedPrefs(this).edit().putBoolean("inviteBannerWasClicked", true).commit();
      String str2 = ((TabInfo)localArrayList.get(this.mTabHost.getCurrentTab())).mTag;
      Fragment localFragment3 = getSupportFragmentManager().findFragmentByTag(str2);
      if ((localFragment3 instanceof HomeTimelineFragment))
        ((HomeTimelineFragment)localFragment3).removeHeader();
    }
    label91: Fragment localFragment1;
    do
    {
      do
      {
        while (true)
        {
          return;
          if ((paramInt1 != 1) || (paramInt2 != 1))
            break;
          Iterator localIterator = localArrayList.iterator();
          while (localIterator.hasNext())
          {
            TabInfo localTabInfo = (TabInfo)localIterator.next();
            Fragment localFragment2 = getSupportFragmentManager().findFragmentByTag(localTabInfo.mTag);
            if ((localFragment2 instanceof BaseTimelineFragment))
              localFragment2.onActivityResult(paramInt1, paramInt2, paramIntent);
          }
        }
        if ((paramInt1 != 1) || (paramInt2 != -1))
          break;
      }
      while ((!BuildUtil.isExplore()) || (this.mMenu == null));
      this.mMenu.removeItem(2131362193);
      return;
      String str1 = ((TabInfo)localArrayList.get(this.mTabHost.getCurrentTab())).mTag;
      localFragment1 = getSupportFragmentManager().findFragmentByTag(str1);
    }
    while (localFragment1 == null);
    localFragment1.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onContentChanged()
  {
    super.onContentChanged();
    if (!BuildUtil.isExplore())
      setupTabs();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903104, true);
    if (BuildUtil.isExplore())
      setupTabs();
    SLog.i("HomeTabActivity pid: {}", Integer.valueOf(Process.myPid()));
    setRequestedOrientation(1);
    setupActionBar(Boolean.valueOf(false), null, null, null);
    ChangesListener localChangesListener = new ChangesListener();
    this.mAppSessionListener = localChangesListener;
    Intent localIntent = getIntent();
    if (this.mAppController == null)
      this.mAppController = AppController.getInstance(this);
    AppController localAppController = this.mAppController;
    if (!localAppController.isLoggedIn())
      return;
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(this);
    IconTabHost localIconTabHost = this.mTabHost;
    this.mViewPager = ((ViewPager)findViewById(2131361926));
    this.mViewPager.setPageMargin(getResources().getDimensionPixelSize(2131427385));
    this.mViewPager.setPageMarginDrawable(2131296265);
    this.mViewPager.setOffscreenPageLimit(3);
    TabsAdapter localTabsAdapter1 = new TabsAdapter(this, localIconTabHost, this.mViewPager, null);
    this.mTabsAdapter = localTabsAdapter1;
    LayoutInflater localLayoutInflater = LayoutInflater.from(this);
    localIconTabHost.setOnTabChangedListener(this);
    localIconTabHost.setOnTabClickedListener(this);
    Bundle localBundle1 = new Bundle();
    localBundle1.putInt("empty_desc", 2131624383);
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("home").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903096, localIconTabHost, 2130837837, 0)), HomeTimelineFragment.class, localBundle1);
    Bundle localBundle2 = new Bundle();
    localBundle2.putInt("empty_desc", 2131623995);
    if ("co.vine.android.NOTIFICATION_PRESSED".equals(localIntent.getAction()))
      localBundle2.putBoolean("take_focus", true);
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("activity").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903096, localIconTabHost, 2130837786, 2130837787)), ActivityFragment.class, localBundle2);
    Bundle localBundle3 = new Bundle();
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("explore").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903096, localIconTabHost, 2130837806, 0)), ExploreFragment.class, localBundle3);
    Bundle localBundle4 = new Bundle();
    localBundle4.putLong("user_id", localAppController.getActiveId());
    localBundle4.putBoolean("refresh", true);
    this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("profile").setIndicator(TabIndicator.newIconIndicator(localLayoutInflater, 2130903096, localIconTabHost, 2130837876, 0)), ProfileFragment.class, localBundle4);
    Session localSession = this.mAppController.getActiveSession();
    this.mAppController.determineCleanup(localSession);
    TabsAdapter localTabsAdapter2 = this.mTabsAdapter;
    boolean bool;
    label485: Uri localUri;
    String str1;
    ArrayList localArrayList;
    String str2;
    String str3;
    String str4;
    if (localSharedPreferences.getInt("unread_notification_count", 0) > 0)
    {
      bool = true;
      localTabsAdapter2.setNew(1, bool);
      this.mAppController.fetchPendingNotificationCount(localSession);
      localUri = localIntent.getData();
      str1 = localIntent.getAction();
      if ((!"android.intent.action.VIEW".equals(str1)) || (localUri == null))
        break label894;
      localArrayList = new ArrayList(localUri.getPathSegments());
      str2 = localUri.getScheme();
      str3 = localUri.getHost();
      if ((str3 != null) && (!localArrayList.isEmpty()))
      {
        if ((!str3.contains("vine.co")) && (!str3.contains("plant.vine.co")))
          break label840;
        str4 = (String)localArrayList.get(0);
        if ((!"v".equals(str4)) || (localArrayList.size() <= 1))
          break label796;
        SingleActivity.start(this, trimSegment((String)localArrayList.get(1)));
      }
    }
    while (true)
    {
      while (true)
      {
        DelayHandler localDelayHandler = new DelayHandler(this);
        if (localDelayHandler.hasMessages(1))
          localDelayHandler.removeMessages(1);
        if (localDelayHandler.hasMessages(2))
          localDelayHandler.removeMessages(2);
        localDelayHandler.sendMessage(localDelayHandler.obtainMessage(4, null));
        localDelayHandler.sendMessageDelayed(localDelayHandler.obtainMessage(1, null), 60000L);
        localDelayHandler.sendMessageDelayed(localDelayHandler.obtainMessage(2, null), 60000L);
        localDelayHandler.sendMessageDelayed(localDelayHandler.obtainMessage(3, null), 60000L);
        AppImpl.getInstance().startCameraService(this);
        VineAccountHelper.syncNormalVideoPlayable(this);
        try
        {
          if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(this) != 0)
            break;
          startService(GCMRegistrationService.getRegisterIntent(this, this.mAppController.getActiveId()));
          return;
        }
        catch (Throwable localThrowable)
        {
          CrashUtil.logException(localThrowable, "Failed to validate Google Player Service status.", new Object[0]);
          return;
        }
      }
      bool = false;
      break label485;
      label796: if ("u".equals(str4))
      {
        ProfileActivity.start(this, Long.parseLong(trimSegment(localUri.getLastPathSegment())), "Deep Link: /u/<userId>");
      }
      else
      {
        ProfileActivity.start(this, localArrayList, "Deep Link: Vanity URL");
        continue;
        label840: if ("vine".equals(str2))
          if ("post".equals(str3))
          {
            SingleActivity.start(this, Long.parseLong(localUri.getLastPathSegment()));
          }
          else if ("timelines".equals(str3))
          {
            ExploreVideoListActivity.start(this, localUri);
            continue;
            label894: if ("co.vine.android.UPLOAD_LIST".equals(str1))
              AppImpl.getInstance().startUploadsListActivity(this);
          }
      }
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755013, paramMenu);
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(this);
    if ((BuildUtil.isExplore()) && (localSharedPreferences.getBoolean("pref_gb_notif_dismissed", false)))
      paramMenu.removeItem(2131362193);
    this.mMenu = paramMenu;
    return super.onCreateOptionsMenu(paramMenu);
  }

  public void onCurrentTabClicked()
  {
    scrollTop();
  }

  public boolean onLongClick(View paramView)
  {
    int i = -1;
    switch (((Integer)paramView.getTag()).intValue())
    {
    default:
    case 1:
    case 2:
    case 3:
    case 4:
    }
    while (true)
    {
      if (i > 0)
      {
        int j = paramView.getLeft();
        int k = paramView.getBottom() + paramView.getMeasuredHeight();
        Toast localToast = Toast.makeText(this, i, 0);
        localToast.setGravity(51, j, k);
        localToast.show();
      }
      if (paramView.getClass().equals(TabIndicator.class))
        paramView.performHapticFeedback(0);
      return true;
      i = 2131624376;
      continue;
      i = 2131624371;
      continue;
      i = 2131624372;
      continue;
      i = 2131624374;
    }
  }

  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    if ("co.vine.android.NOTIFICATION_PRESSED".equals(paramIntent.getAction()))
    {
      String str = ((TabInfo)TabsAdapter.access$000(this.mTabsAdapter).get(1)).mTag;
      Fragment localFragment = getSupportFragmentManager().findFragmentByTag(str);
      if ((localFragment instanceof BaseListFragment))
        showPage(1, localFragment);
    }
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362137:
      FlurryUtils.trackVisitFindFriends("Menu");
      startActivity(new Intent(this, FindFriendsActivity.class));
      return true;
    case 2131362194:
      FlurryUtils.trackVisitSettings("Menu");
      startActivityForResult(new Intent(this, SettingsActivity.class), 1);
      return true;
    case 2131362192:
      FlurryUtils.trackVisitSearch("Menu");
      startActivity(new Intent(this, SearchActivity.class));
      return true;
    case 2131362193:
    }
    if (BuildUtil.isExplore())
    {
      startActivityForResult(new Intent(this, ViewOnlyNotifActivity.class), 1);
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }

  protected void onResume()
  {
    super.onResume();
    if ((this.mTabsAdapter != null) && (this.mTabHost != null))
      this.mTabsAdapter.previousTab = this.mTabHost.getCurrentTab();
    Intent localIntent = AppImpl.getInstance().getNotifyFailedIntent(this);
    if (localIntent != null)
      startService(localIntent);
    TabWidget localTabWidget = this.mTabHost.getTabWidget();
    if (localTabWidget == null);
    for (int i = 0; ; i = localTabWidget.getTabCount())
      for (int j = 0; j < i; j++)
      {
        View localView = localTabWidget.getChildAt(j);
        if (localView != null)
        {
          localView.setTag(Integer.valueOf(j + 1));
          localView.setOnLongClickListener(this);
        }
      }
  }

  public void onTabChanged(String paramString)
  {
    this.mViewPager.setCurrentItem(this.mTabHost.getCurrentTab());
    if ("activity".equals(paramString))
    {
      Util.getDefaultSharedPrefs(this).edit().putInt("unread_notification_count", 0).commit();
      this.mTabsAdapter.setNew(1, false);
    }
    logTabChange(paramString);
  }

  public void scrollTop()
  {
    Fragment localFragment = this.mTabsAdapter.getTab(this.mViewPager.getCurrentItem()).fragment();
    if ((localFragment instanceof BaseListFragment))
    {
      localView = localFragment.getView();
      if (localView != null);
    }
    while (!(localFragment instanceof TopScrollable))
    {
      TopScrollable localTopScrollable;
      do
      {
        View localView;
        return;
        localTopScrollable = (TopScrollable)localView.findViewById(16908298);
      }
      while ((localTopScrollable == null) || (localTopScrollable.scrollTop()));
      ((BaseListFragment)localFragment).invokeScrollFirstItem();
      return;
    }
    ((TopScrollable)localFragment).scrollTop();
  }

  public void showPage(int paramInt, Fragment paramFragment)
  {
    this.mViewPager.setCurrentItem(paramInt);
    if ((paramFragment instanceof BaseListFragment))
      ((BaseListFragment)paramFragment).onMoveTo(1);
    Fragment localFragment = this.mTabsAdapter.getTab(this.mViewPager.getCurrentItem()).fragment();
    if ((localFragment instanceof BaseListFragment))
      ((BaseListFragment)localFragment).onMoveAway(-1);
    logTabChange(paramFragment.getTag());
  }

  class ChangesListener extends AppSessionListener
  {
    ChangesListener()
    {
    }

    public void onGetPendingNotificationCountComplete(String paramString1, int paramInt1, String paramString2, int paramInt2)
    {
      HomeTabActivity.TabsAdapter localTabsAdapter;
      if (paramInt1 == 200)
      {
        localTabsAdapter = HomeTabActivity.this.mTabsAdapter;
        if (paramInt2 <= 0)
          break label33;
      }
      label33: for (boolean bool = true; ; bool = false)
      {
        localTabsAdapter.setNew(1, bool);
        return;
      }
    }
  }

  public static final class DelayHandler extends Handler
  {
    public static final int DETERMINE_SERVER_STATUS = 3;
    public static final int FETCH_FOLLOWERS = 2;
    public static final int FETCH_ME = 1;
    public static final int SEND_LOOP_COUNTS = 4;
    private final WeakReference<Context> mContextRef;

    public DelayHandler(Context paramContext)
    {
      this.mContextRef = new WeakReference(paramContext.getApplicationContext());
    }

    public void handleMessage(Message paramMessage)
    {
      Context localContext = (Context)this.mContextRef.get();
      if (localContext == null)
        return;
      AppController localAppController = AppController.getInstance(localContext);
      switch (paramMessage.what)
      {
      default:
        return;
      case 1:
        localAppController.fetchUsersMe(localAppController.getActiveId());
        return;
      case 2:
        localAppController.fetchFollowing(localAppController.getActiveId(), 1);
        return;
      case 3:
        localAppController.determineServerStatus();
        return;
      case 4:
      }
      localAppController.sendLoopCounts();
    }
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
      public HomeTabActivity.TabSavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new HomeTabActivity.TabSavedState(paramAnonymousParcel);
      }

      public HomeTabActivity.TabSavedState[] newArray(int paramAnonymousInt)
      {
        return new HomeTabActivity.TabSavedState[paramAnonymousInt];
      }
    };
    public final String[] tags;

    public TabSavedState(Parcel paramParcel)
    {
      this.tags = paramParcel.createStringArray();
    }

    public TabSavedState(ArrayList<HomeTabActivity.TabInfo> paramArrayList)
    {
      int i = paramArrayList.size();
      String[] arrayOfString = new String[i];
      for (int j = 0; j < i; j++)
        arrayOfString[j] = ((HomeTabActivity.TabInfo)paramArrayList.get(j)).getTag();
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

  private static class TabScrollListener
    implements BaseListFragment.OnScrollListener
  {
    private final BaseControllerActionBarActivity mActivity;
    private final int mTabIndex;

    public TabScrollListener(BaseControllerActionBarActivity paramBaseControllerActionBarActivity, int paramInt)
    {
      this.mTabIndex = paramInt;
      this.mActivity = paramBaseControllerActionBarActivity;
    }

    public void onScrollFirstItem()
    {
    }
  }

  static class TabsAdapter extends FragmentPagerAdapter
    implements ViewPager.OnPageChangeListener
  {
    private final BaseControllerActionBarActivity mActivity;
    private final ViewPagerScrollBar mScrollBar;
    private final HomeTabActivity.DummyTabFactory mTabFactory;
    private final TabHost mTabHost;
    private final ArrayList<HomeTabActivity.TabInfo> mTabs = new ArrayList();
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
      this.mTabFactory = new HomeTabActivity.DummyTabFactory(this.mActivity);
    }

    public void addTab(TabHost.TabSpec paramTabSpec, Class<?> paramClass, Bundle paramBundle)
    {
      HomeTabActivity.TabInfo localTabInfo = new HomeTabActivity.TabInfo(paramClass, paramBundle, paramTabSpec.getTag());
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
      return Fragment.instantiate(this.mActivity, ((HomeTabActivity.TabInfo)this.mTabs.get(paramInt)).clss.getName(), ((HomeTabActivity.TabInfo)this.mTabs.get(paramInt)).bundle);
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
      while (((HomeTabActivity.TabInfo)localIterator.next()).fragment() != paramObject);
      int i = 1;
      if (i != 0)
        return -1;
      return -2;
    }

    public HomeTabActivity.TabInfo getTab(int paramInt)
    {
      return (HomeTabActivity.TabInfo)this.mTabs.get(paramInt);
    }

    public Object instantiateItem(ViewGroup paramViewGroup, int paramInt)
    {
      Fragment localFragment = (Fragment)super.instantiateItem(paramViewGroup, paramInt);
      ((HomeTabActivity.TabInfo)this.mTabs.get(paramInt)).setFragment(localFragment);
      if ((localFragment instanceof BaseListFragment))
      {
        ((BaseListFragment)localFragment).setScrollListener(new HomeTabActivity.TabScrollListener(this.mActivity, paramInt));
        if (paramInt != this.mViewPager.getCurrentItem());
      }
      return localFragment;
    }

    public void onPageScrollStateChanged(int paramInt)
    {
    }

    public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
    {
      if ((this.mViewPager.getCurrentItem() < paramInt1) && (this.mScrollBar != null))
        this.mScrollBar.scroll(paramInt1, -paramInt2);
      while (this.mScrollBar == null)
        return;
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
        Fragment localFragment1 = ((HomeTabActivity.TabInfo)this.mTabs.get(this.previousTab)).fragment();
        if ((localFragment1 != null) && ((localFragment1 instanceof OnTabChangedListener)))
          ((OnTabChangedListener)localFragment1).onMoveAway(paramInt);
        Fragment localFragment2 = ((HomeTabActivity.TabInfo)this.mTabs.get(paramInt)).fragment();
        if ((localFragment2 != null) && ((localFragment2 instanceof OnTabChangedListener)))
          ((OnTabChangedListener)localFragment2).onMoveTo(this.previousTab);
      }
      localTabWidget.setDescendantFocusability(i);
      this.previousTab = this.mTabHost.getCurrentTab();
      if (paramInt == 1)
      {
        Util.getDefaultSharedPrefs(this.mActivity).edit().putInt("unread_notification_count", 0).commit();
        setNew(1, false);
      }
    }

    public void restoreState(Parcelable paramParcelable, ClassLoader paramClassLoader)
    {
      String[] arrayOfString = ((HomeTabActivity.TabSavedState)paramParcelable).tags;
      for (int i = 0; i < arrayOfString.length; i++)
      {
        String str = arrayOfString[i];
        Fragment localFragment = this.mActivity.getSupportFragmentManager().findFragmentByTag(str);
        if (localFragment != null)
        {
          ((HomeTabActivity.TabInfo)this.mTabs.get(i)).setFragment(localFragment);
          if ((localFragment instanceof BaseListFragment))
            ((BaseListFragment)localFragment).setScrollListener(new HomeTabActivity.TabScrollListener(this.mActivity, i));
        }
      }
    }

    public Parcelable saveState()
    {
      return new HomeTabActivity.TabSavedState(this.mTabs);
    }

    public void setNew(int paramInt, boolean paramBoolean)
    {
      ((TabIndicator)this.mTabHost.getTabWidget().getChildTabViewAt(paramInt)).setNew(paramBoolean);
    }

    public ArrayList<HomeTabActivity.TabInfo> tabs()
    {
      return this.mTabs;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.HomeTabActivity
 * JD-Core Version:    0.6.2
 */