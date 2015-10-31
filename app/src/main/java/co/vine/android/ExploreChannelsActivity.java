package co.vine.android;

import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.ViewPager;
import android.support.v7.app.ActionBar;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabSpec;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.VineAPI;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.IconTabHost;
import co.vine.android.widget.IconTabHost.OnTabClickedListener;
import co.vine.android.widget.TabIndicator;
import co.vine.android.widget.ViewPagerScrollBar;
import com.twitter.android.widget.TopScrollable;
import java.util.HashMap;
import java.util.List;

public class ExploreChannelsActivity extends BaseTimelineActivity
  implements TabHost.OnTabChangeListener, IconTabHost.OnTabClickedListener
{
  public static final String PARAM_ICON_PATH = "icon";
  public static final String PARAM_NAME = "name";
  public static final String PARAM_NAV_RGB = "navRGB";
  public static final String PARAM_TITLE_RGB = "titleRGB";
  public static final int PATH_SEGMENT_CHANNEL_ID = 0;
  public static final String SORT_POPULAR = "popular";
  public static final String SORT_RECENT = "recent";
  public static final String TAG_POPULAR = "popular";
  public static final String TAG_RECENT = "recent";
  private ImageKey mIconImageKey;
  private ViewPagerScrollBar mScrollBar;
  private IconTabHost mTabHost;
  private HomeTabActivity.TabsAdapter mTabsAdapter;
  private ViewPager mViewPager;

  private void setIconImage(Bitmap paramBitmap)
  {
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
    {
      int i = getResources().getDimensionPixelSize(2131427344);
      Bitmap localBitmap = Bitmap.createScaledBitmap(paramBitmap, i, i, true);
      localActionBar.setIcon(new BitmapDrawable(getResources(), localBitmap));
    }
  }

  private void setupTabs()
  {
    this.mTabHost = ((IconTabHost)findViewById(16908306));
    if (this.mTabHost == null)
      throw new RuntimeException("Your content must have a TabHost whose id attribute is 'android.R.id.tabhost'");
    this.mTabHost.setup();
    this.mViewPager = ((ViewPager)findViewById(2131361926));
  }

  protected BaseTimelineFragment getCurrentTimeLineFragment()
  {
    HomeTabActivity.TabInfo localTabInfo = this.mTabsAdapter.getTab(this.mTabHost.getCurrentTab());
    if (localTabInfo != null)
    {
      String str = localTabInfo.getTag();
      if (!TextUtils.isEmpty(str))
      {
        Fragment localFragment = getSupportFragmentManager().findFragmentByTag(str);
        if ((localFragment instanceof BaseTimelineFragment))
          return (BaseTimelineFragment)localFragment;
      }
    }
    return null;
  }

  public boolean isShowing(String paramString)
  {
    return (paramString != null) && (paramString.equals(this.mTabHost.getCurrentTabTag()));
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    BaseTimelineFragment localBaseTimelineFragment = getCurrentTimeLineFragment();
    if (localBaseTimelineFragment != null)
      localBaseTimelineFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
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
    ExploreChannelsAppSessionListener localExploreChannelsAppSessionListener = new ExploreChannelsAppSessionListener();
    this.mAppSessionListener = localExploreChannelsAppSessionListener;
    Intent localIntent = getIntent();
    if ((localIntent == null) || (localIntent.getData() == null))
      throw new IllegalAccessError("Intent data is null. You must provide a URI in order to view a video list.");
    Uri localUri = localIntent.getData();
    String str1 = (String)localUri.getPathSegments().get(0);
    String str2 = localUri.getQueryParameter("icon");
    String str3 = "#" + localUri.getQueryParameter("navRGB");
    String str4 = "#" + localUri.getQueryParameter("titleRGB");
    String str5 = localUri.getQueryParameter("name");
    if (str5 != null)
      str5 = str5.replace('+', ' ');
    try
    {
      int n = Color.parseColor(str3);
      i = n;
    }
    catch (IllegalArgumentException localIllegalArgumentException1)
    {
      try
      {
        while (true)
        {
          int m = Color.parseColor(str4);
          j = m;
          setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
          ActionBar localActionBar = getSupportActionBar();
          if (localActionBar != null)
          {
            localActionBar.setTitle(str5);
            ColorDrawable localColorDrawable = new ColorDrawable(i);
            localActionBar.setBackgroundDrawable(localColorDrawable);
          }
          int k = Resources.getSystem().getIdentifier("action_bar_title", "id", "android");
          if (k > 0)
          {
            TextView localTextView = (TextView)findViewById(k);
            if (localTextView != null)
              localTextView.setTextColor(j);
          }
          if (!TextUtils.isEmpty(str2))
          {
            String str6 = VineAPI.getInstance(this).getBaseCdnUrl();
            this.mIconImageKey = new ImageKey(str6 + str2);
            Bitmap localBitmap = this.mAppController.getPhotoBitmap(this.mIconImageKey);
            if (localBitmap != null)
              setIconImage(localBitmap);
          }
          this.mScrollBar = ((ViewPagerScrollBar)findViewById(2131361970));
          this.mScrollBar.setLineColor(i);
          this.mScrollBar.setRange(2);
          this.mScrollBar.setVisibility(0);
          this.mViewPager = ((ViewPager)findViewById(2131361926));
          this.mViewPager.setPageMargin(getResources().getDimensionPixelSize(2131427385));
          this.mViewPager.setPageMarginDrawable(2131296265);
          this.mViewPager.setOffscreenPageLimit(1);
          IconTabHost localIconTabHost = this.mTabHost;
          HomeTabActivity.TabsAdapter localTabsAdapter = new HomeTabActivity.TabsAdapter(this, localIconTabHost, this.mViewPager, this.mScrollBar);
          this.mTabsAdapter = localTabsAdapter;
          LayoutInflater localLayoutInflater = LayoutInflater.from(this);
          localIconTabHost.setOnTabChangedListener(this);
          localIconTabHost.setOnTabClickedListener(this);
          Bundle localBundle1 = ExploreChannelsFragment.prepareArguments(localIntent, true, str1, "popular", "popular");
          localBundle1.putInt("empty_desc", 2131624383);
          this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("popular").setIndicator(TabIndicator.newTextIndicator(localLayoutInflater, 2130903086, localIconTabHost, 2131624373, true)), ExploreChannelsFragment.class, localBundle1);
          Bundle localBundle2 = ExploreChannelsFragment.prepareArguments(localIntent, true, str1, "recent", "recent");
          localBundle2.putInt("empty_desc", 2131624383);
          this.mTabsAdapter.addTab(localIconTabHost.newTabSpec("recent").setIndicator(TabIndicator.newTextIndicator(localLayoutInflater, 2130903086, localIconTabHost, 2131624375, true)), ExploreChannelsFragment.class, localBundle2);
          return;
          localIllegalArgumentException1 = localIllegalArgumentException1;
          int i = getResources().getColor(2131296374);
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException2)
      {
        while (true)
          int j = getResources().getColor(2131296358);
      }
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755011, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }

  public void onCurrentTabClicked()
  {
    scrollTop();
  }

  protected void onResume()
  {
    super.onResume();
    this.mTabsAdapter.previousTab = this.mTabHost.getCurrentTab();
  }

  public void onTabChanged(String paramString)
  {
    this.mViewPager.setCurrentItem(this.mTabHost.getCurrentTab());
  }

  public void scrollTop()
  {
    Fragment localFragment = this.mTabsAdapter.getTab(this.mViewPager.getCurrentItem()).fragment();
    if (!(localFragment instanceof BaseListFragment));
    TopScrollable localTopScrollable;
    do
    {
      View localView;
      do
      {
        do
          return;
        while (localFragment == null);
        localView = localFragment.getView();
      }
      while (localView == null);
      localTopScrollable = (TopScrollable)localView.findViewById(16908298);
    }
    while ((localTopScrollable == null) || (localTopScrollable.scrollTop()));
    ((BaseListFragment)localFragment).invokeScrollFirstItem();
  }

  class ExploreChannelsAppSessionListener extends AppSessionListener
  {
    ExploreChannelsAppSessionListener()
    {
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      if ((!paramHashMap.isEmpty()) && (ExploreChannelsActivity.this.mIconImageKey != null))
      {
        UrlImage localUrlImage = (UrlImage)paramHashMap.get(ExploreChannelsActivity.this.mIconImageKey);
        if ((localUrlImage != null) && (localUrlImage.isValid()) && (localUrlImage.bitmap != null))
          ExploreChannelsActivity.this.setIconImage(localUrlImage.bitmap);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ExploreChannelsActivity
 * JD-Core Version:    0.6.2
 */