package co.vine.android;

import android.content.ContentUris;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import co.vine.android.api.VineComparatorFactory;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.network.HttpResult;
import co.vine.android.provider.HybridPostCursor;
import co.vine.android.provider.HybridPostCursorExplore;
import co.vine.android.provider.Vine.PostCommentsLikesView;
import co.vine.android.provider.Vine.UserGroupsView;
import co.vine.android.provider.Vine.Users;
import co.vine.android.provider.VineDatabaseHelper;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoKey;
import co.vine.android.widget.GenericTimelineAdapter;
import co.vine.android.widget.SectionAdapter;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.TabButton;
import co.vine.android.widget.TabButton.TabChanger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ProfileFragment extends BaseTimelineFragment
  implements View.OnClickListener, TabButton.TabChanger, ViewOffsetResolver, SpanClickListener, View.OnLongClickListener, AdapterView.OnItemClickListener
{
  public static final String ARG_FOLLOW_EVENT_SOURCE = "event_source";
  public static final String ARG_TAKE_FOCUS = "take_focus";
  public static final String ARG_USER_ID = "user_id";
  public static final String ARG_VANITY_URL = "vanity_url";
  private static final String EVENT_SOURCE_TITLE = "Profile: Tab ";
  private static final int FLAG_PROFILE_INFO = 1;
  private static final int FLAG_PROFILE_LIKES = 4;
  private static final int FLAG_PROFILE_POSTS = 2;
  public static final String FRAGMENT_TAG = "profile";
  private static final int LOADER_ID_HIDE_REPOSTS = 3;
  private static final int LOADER_ID_LIKES = 2;
  private static final int LOADER_ID_POSTS = 1;
  private static final String PREF_PROFILE_FETCH_COUNT = "profile_fetch_count";
  private static final String STATE_HEADER_ADDED = "stated_header_added";
  private static final String STATE_TAB = "state_tab";
  private static final int TAB_LIKES = 2;
  private static final int TAB_POSTS = 1;
  private int mCurrentTab;
  protected int mCursorPreviousLikes;
  protected int mCursorPreviousPosts;
  protected int mCursorQuerySizeLikes;
  protected int mCursorQuerySizePosts;
  private int mFetchFlags;
  protected String mFlurryFollowEventSource;
  private LinearLayout mFollowHeader;
  private boolean mHeaderAdded;
  private boolean mHideProfileReposts;
  private MenuItem mHideRevines;
  private boolean mIsMe;
  private boolean mIsUserBlocked;
  private int mLikePage;
  private RelativeLayout mPendingFollowAccept;
  private RelativeLayout mPendingFollowReject;
  private PopupWindow mPopupWindow;
  private int mPostPage;
  PrivateAccountAdapter mPrivateAdapter;
  ProfileHeaderAdapter mProfileHeaderAdapter;
  private boolean mRepostsEnabled;
  private boolean mRepostsToggled;
  private SectionAdapter mSectionAdapter;
  private boolean mTakeFocus;
  private VineUser mUser;
  private long mUserId;

  private void bindProfileDataAndCounts()
  {
    if (this.mUser == null)
      return;
    if (this.mIsMe)
    {
      SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(getActivity());
      this.mUser.username = localSharedPreferences.getString("settings_profile_name", null);
      this.mUser.description = localSharedPreferences.getString("settings_profile_description", null);
      this.mUser.location = localSharedPreferences.getString("settings_profile_location", null);
      this.mUser.email = localSharedPreferences.getString("settings_profile_email", null);
      this.mUser.phoneNumber = localSharedPreferences.getString("settings_profile_phone", null);
      this.mUser.avatarUrl = localSharedPreferences.getString("settings_profile_avatar_url", null);
      this.mUser.followingCount = localSharedPreferences.getInt("profile_follow_count", 0);
      this.mUser.followerCount = localSharedPreferences.getInt("profile_follower_count", 0);
      this.mUser.authoredPostCount = localSharedPreferences.getInt("profile_authored_post_count", 0);
      this.mUser.postCount = localSharedPreferences.getInt("profile_post_count", 0);
      this.mUser.likeCount = localSharedPreferences.getInt("profile_like_count", 0);
    }
    bindUserData(this.mUser);
  }

  private void initProfile()
  {
    if (this.mFeedAdapter.getCursor() == null)
    {
      initLoader(1);
      initLoader(2);
    }
    if (this.mUser != null)
    {
      bindProfileDataAndCounts();
      hideProgress(3);
      if (this.mProfileHeaderAdapter != null)
        if (this.mCurrentTab != 2)
          break label181;
    }
    label181: for (int i = 2131362058; ; i = 2131362056)
    {
      this.mProfileHeaderAdapter.changeSelectedTab(i);
      return;
      this.mFetchFlags = (0x1 | this.mFetchFlags);
      if (this.mIsMe)
      {
        addRequest(this.mAppController.fetchUsersMe(this.mUserId));
        SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(getActivity());
        int j = localSharedPreferences.getInt("profile_fetch_count", 0);
        if (j % 5 == 0)
          addRequest(this.mAppController.fetchFriends(this.mUserId));
        localSharedPreferences.edit().putInt("profile_fetch_count", j + 1);
        break;
      }
      addRequest(this.mAppController.fetchUser(this.mUserId));
      break;
    }
  }

  private boolean isLocked()
  {
    return (this.mUser != null) && (!this.mIsMe) && ((this.mUser.isPrivateLocked()) || (this.mUser.isBlocked()));
  }

  private void setRevineOptionText(VineUser paramVineUser, boolean paramBoolean)
  {
    MenuItem localMenuItem = this.mHideRevines;
    if (localMenuItem != null)
    {
      if ((paramVineUser != null) && (!paramVineUser.isFollowing()))
        localMenuItem.setVisible(false);
    }
    else
      return;
    if (paramBoolean)
    {
      localMenuItem.setTitle(2131624148);
      return;
    }
    localMenuItem.setTitle(2131624352);
  }

  private void setup()
  {
    if (this.mSectionAdapter == null)
    {
      if (isLocked())
      {
        this.mProfileHeaderAdapter = new ProfileHeaderAdapter(getActivity(), this.mAppController, this, this, true, this.mUser.isBlocked(), this.mFlurryFollowEventSource, this.mHideProfileReposts);
        this.mPrivateAdapter = new PrivateAccountAdapter(this.mUser.isBlocked(), this.mUser.isPrivateLocked());
        BaseAdapter[] arrayOfBaseAdapter2 = new BaseAdapter[2];
        arrayOfBaseAdapter2[0] = this.mProfileHeaderAdapter;
        arrayOfBaseAdapter2[1] = this.mPrivateAdapter;
        this.mSectionAdapter = new SectionAdapter(arrayOfBaseAdapter2);
        this.mListView.setAdapter(this.mSectionAdapter);
        this.mSectionAdapter.notifyDataSetChanged();
      }
    }
    else
      return;
    this.mProfileHeaderAdapter = new ProfileHeaderAdapter(getActivity(), this.mAppController, this, this, false, false, this.mFlurryFollowEventSource, this.mHideProfileReposts);
    BaseAdapter[] arrayOfBaseAdapter1 = new BaseAdapter[2];
    arrayOfBaseAdapter1[0] = this.mProfileHeaderAdapter;
    arrayOfBaseAdapter1[1] = this.mFeedAdapter;
    this.mSectionAdapter = new SectionAdapter(arrayOfBaseAdapter1);
    if (this.mTakeFocus)
      this.mFeedAdapter.onResume(true);
    this.mListView.setAdapter(this.mSectionAdapter);
    this.mFeedAdapter.setOffsetResolver(this);
  }

  private void updateTabSelection()
  {
    if (this.mCurrentTab == 1)
      this.mProfileHeaderAdapter.changeSelectedTab(2131362056);
    while (this.mCurrentTab != 2)
      return;
    this.mProfileHeaderAdapter.changeSelectedTab(2131362058);
  }

  void bindUserData(VineUser paramVineUser)
  {
    if ((paramVineUser.hasFollowApprovalPending()) && (!this.mHeaderAdded))
    {
      LinearLayout localLinearLayout = (LinearLayout)LayoutInflater.from(getActivity()).inflate(2130903093, null, false);
      if (this.mListView != null)
      {
        this.mListView.addHeaderView(localLinearLayout);
        this.mPendingFollowAccept = ((RelativeLayout)localLinearLayout.findViewById(2131361949));
        this.mPendingFollowAccept.setOnClickListener(this);
        this.mPendingFollowReject = ((RelativeLayout)localLinearLayout.findViewById(2131361946));
        this.mPendingFollowReject.setOnClickListener(this);
        this.mFollowHeader = localLinearLayout;
        this.mHeaderAdded = true;
      }
      this.mFollowHeader.setVisibility(0);
    }
    this.mRepostsEnabled = this.mUser.areRepostsEnabled();
    setRevineOptionText(paramVineUser, paramVineUser.areRepostsEnabled());
    this.mProfileHeaderAdapter.bindUser(paramVineUser);
    updateTabSelection();
  }

  public void changeTab(Button paramButton)
  {
    int i = paramButton.getId();
    switch (i)
    {
    case 2131362057:
    default:
    case 2131362058:
    case 2131362056:
    }
    while (true)
    {
      this.mProfileHeaderAdapter.changeSelectedTab(i);
      do
      {
        do
          return;
        while (this.mCurrentTab == 2);
        getLoaderManager().restartLoader(2, null, this);
        this.mCurrentTab = 2;
        this.mFlurryEventSource = "Profile: Tab 2";
        break;
      }
      while (this.mCurrentTab == 1);
      getLoaderManager().restartLoader(1, null, this);
      this.mCurrentTab = 1;
      this.mFlurryEventSource = "Profile: Tab 1";
    }
  }

  protected void fetchContent(int paramInt, boolean paramBoolean)
  {
    this.mLastFetchType = paramInt;
    if (hasPendingRequest(paramInt))
      return;
    int i;
    switch (paramInt)
    {
    case 3:
    default:
      i = 1;
      if (!this.mHideProfileReposts)
        break;
    case 2:
    case 4:
    case 1:
    }
    for (int j = 10; ; j = 2)
    {
      this.mFetchFlags = (0x2 | this.mFetchFlags);
      addRequest(this.mAppController.fetchPosts(this.mAppController.getActiveSession(), 10, this.mUserId, j, i, paramBoolean, String.valueOf(this.mUserId), null, null), paramInt);
      this.mFetchFlags = (0x4 | this.mFetchFlags);
      AppController localAppController = this.mAppController;
      Session localSession = this.mAppController.getActiveSession();
      long l = this.mUserId;
      String str = String.valueOf(this.mUserId);
      addRequest(localAppController.fetchPosts(localSession, 10, l, 3, i, paramBoolean, str, null, null), paramInt);
      return;
      i = 2;
      showProgress(paramInt);
      break;
      i = 3;
      showProgress(paramInt);
      break;
    }
  }

  protected String fetchPosts(int paramInt, boolean paramBoolean)
  {
    throw new IllegalStateException("Don't call fetch posts for ProfileFragment, this fragment handles its own fetching.");
  }

  public int getOffset(BaseAdapter paramBaseAdapter)
  {
    return this.mSectionAdapter.getPositionOffset(this.mSectionAdapter.getMyAdapterIndex(paramBaseAdapter));
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    switch (paramInt1)
    {
    default:
    case 1:
    }
    do
    {
      do
        return;
      while (paramInt2 != 1);
      this.mFetchFlags = 0;
    }
    while (this.mUserId <= 0L);
    addRequest(this.mAppController.fetchFriends(this.mUserId));
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      super.onClick(paramView);
      return;
    case 2131361873:
    case 2131362054:
      this.mProfileHeaderAdapter.onProfileHeaderClick(paramView, this);
      return;
    case 2131362056:
    case 2131362058:
      this.mProfileHeaderAdapter.onProfileHeaderClick(paramView, this);
      changeTab((Button)paramView);
      return;
    case 2131362051:
      onFollowersClicked();
      return;
    case 2131362053:
      onFollowingClicked();
      return;
    case 2131361949:
      this.mAppController.acceptFollowRequest(this.mAppController.getActiveSession(), this.mUserId);
      return;
    case 2131361946:
      this.mAppController.acceptRejectRequest(this.mAppController.getActiveSession(), this.mUserId);
      return;
    case 2131362057:
    }
    if (this.mHideProfileReposts);
    for (int i = 2131624352; ; i = 2131624148)
    {
      String str = getString(i);
      ArrayAdapter localArrayAdapter = new ArrayAdapter(getActivity(), 2130903120, 2131361987, new String[] { str });
      ListView localListView = new ListView(getActivity());
      FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(-1, -2);
      localLayoutParams.topMargin = getResources().getDimensionPixelSize(2131427412);
      localListView.setPadding(0, getResources().getDimensionPixelSize(2131427412), 0, 0);
      localListView.setLayoutParams(localLayoutParams);
      localListView.setAdapter(localArrayAdapter);
      localListView.setSelector(new ColorDrawable(getResources().getColor(17170445)));
      localListView.setOnItemClickListener(this);
      localListView.setDividerHeight(0);
      if (getView() == null)
        break;
      TabButton localTabButton = (TabButton)getView().findViewById(2131362056);
      if ((this.mPopupWindow == null) || (this.mPopupWindow.isShowing()) || (localTabButton == null))
        break;
      this.mPopupWindow.setFocusable(true);
      this.mPopupWindow.setContentView(localListView);
      this.mPopupWindow.setWidth(localTabButton.getMeasuredWidth());
      this.mPopupWindow.setHeight(-2);
      this.mPopupWindow.setBackgroundDrawable(new ColorDrawable(getResources().getColor(2131296358)));
      this.mPopupWindow.showAsDropDown(localTabButton, 0, 0);
      return;
    }
  }

  public void onCreate(Bundle paramBundle)
  {
    int i = 1;
    super.onCreate(paramBundle);
    setHasOptionsMenu(i);
    Bundle localBundle = getArguments();
    this.mUserId = localBundle.getLong("user_id", -1L);
    this.mFlurryEventSource = "Profile: Tab 1";
    this.mFlurryFollowEventSource = localBundle.getString("event_source");
    this.mTakeFocus = localBundle.getBoolean("take_focus", false);
    if (this.mTakeFocus)
      setFocused(i);
    this.mAppSessionListener = new ProfileListener();
    this.mPopupWindow = new PopupWindow(getActivity(), null, 2130772013);
    if (paramBundle != null)
    {
      this.mCurrentTab = paramBundle.getInt("state_tab");
      if (paramBundle.containsKey("stated_header_added"))
        this.mHeaderAdded = paramBundle.getBoolean("stated_header_added");
      this.mCursorQuerySizePosts = Util.getNextCursorSize(0);
      this.mCursorQuerySizeLikes = Util.getNextCursorSize(0);
      showSadface(false);
      this.mRepostsEnabled = i;
      if (this.mUser != null)
        this.mUser.repostsEnabled = i;
      if (localBundle.getStringArrayList("vanity_url") == null)
        break label212;
      this.mAppController.fetchUserId(localBundle.getStringArrayList("vanity_url"));
    }
    label212: 
    while (this.mUserId <= 0L)
    {
      return;
      this.mCurrentTab = i;
      this.mHeaderAdded = false;
      break;
    }
    if (this.mUserId == this.mAppController.getActiveId());
    while (true)
    {
      this.mIsMe = i;
      if (this.mIsMe)
        break;
      this.mAppController.getBlockedUsers();
      return;
      i = 0;
    }
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalStateException("Cannot find loader with id " + paramInt);
    case 1:
      Uri.Builder localBuilder2 = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_USER, this.mUserId).buildUpon();
      localBuilder2.appendQueryParameter("limit", String.valueOf(this.mCursorQuerySizePosts));
      if (this.mHideProfileReposts);
      for (String str = "1"; ; str = "0")
      {
        localBuilder2.appendQueryParameter("hide_profile_reposts", str);
        return new CursorLoader(getActivity(), localBuilder2.build(), null, null, null, null);
      }
    case 2:
      Uri.Builder localBuilder1 = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_USER_LIKES, this.mUserId).buildUpon();
      localBuilder1.appendQueryParameter("limit", String.valueOf(this.mCursorQuerySizeLikes));
      return new CursorLoader(getActivity(), localBuilder1.build(), null, null, null, null);
    case 3:
    }
    Uri localUri = ContentUris.withAppendedId(Vine.Users.CONTENT_URI_HIDE_PROFILE_REPOSTS, this.mUserId);
    return new CursorLoader(getActivity(), localUri, new String[] { "hide_profile_reposts" }, null, null, null);
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    if (!this.mIsMe)
      paramMenuInflater.inflate(2131755018, paramMenu);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return createView(paramLayoutInflater, 2130903110, paramViewGroup);
  }

  public void onFollowersClicked()
  {
    Intent localIntent = new Intent(getActivity(), UsersActivity.class);
    localIntent.putExtra("p_id", this.mUserId);
    localIntent.putExtra("u_type", 2);
    startActivity(localIntent);
  }

  public void onFollowingClicked()
  {
    Intent localIntent = new Intent(getActivity(), UsersActivity.class);
    localIntent.putExtra("p_id", this.mUserId);
    localIntent.putExtra("u_type", 1);
    startActivity(localIntent);
  }

  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    boolean bool1;
    if (!this.mHideProfileReposts)
    {
      bool1 = true;
      this.mHideProfileReposts = bool1;
      this.mRepostsToggled = true;
      boolean bool2 = this.mHideProfileReposts;
      int i = this.mUser.following;
      boolean bool3 = false;
      if (i > 0)
        bool3 = true;
      FlurryUtils.trackFilterProfileReposts(bool2, bool3, this.mIsMe);
      if (!this.mIsMe)
        break label144;
      SharedPreferences.Editor localEditor = Util.getDefaultSharedPrefs(getActivity()).edit();
      localEditor.putBoolean("profile_hide_reposts", this.mHideProfileReposts);
      localEditor.apply();
    }
    while (true)
    {
      if (this.mPopupWindow != null)
        this.mPopupWindow.dismiss();
      this.mFeedAdapter.onPause(isFocused());
      getLoaderManager().restartLoader(1, null, this);
      return;
      bool1 = false;
      break;
      label144: this.mAppController.setHideProfileReposts(this.mUserId, this.mHideProfileReposts);
    }
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    int i = 1;
    Cursor localCursor = this.mFeedAdapter.getCursor();
    switch (paramLoader.getId())
    {
    default:
    case 1:
    case 2:
      label224: label226: 
      do
      {
        while (true)
        {
          return;
          if (this.mCurrentTab == i)
          {
            if (localCursor != null)
              localCursor.unregisterContentObserver(this.mChangeObserver);
            if (paramCursor != null)
              paramCursor.registerContentObserver(this.mChangeObserver);
            this.mFeedAdapter.swapCursor(paramCursor);
            if ((this.mFeedAdapter.isEmpty()) && ((0x2 & this.mFetchFlags) == 0))
              fetchContent(3, i);
            while (true)
            {
              if ((this.mFeedAdapter.isEmpty()) || (this.mLastFetchType != 7))
                break label224;
              hideProgress(7);
              if (this.mFeedAdapter.getCursor() == null)
                break label226;
              if (this.mFeedAdapter.getCursor().getCount() > this.mCursorPreviousPosts)
                break;
              fetchContent(i, i);
              return;
              if (this.mRepostsToggled)
              {
                fetchContent(3, false);
                this.mRepostsToggled = false;
              }
              else
              {
                hideProgress(3);
                if (!this.mFeedAdapter.isEmpty())
                  showSadface(false);
                else
                  showSadface(false);
              }
            }
          }
        }
        CrashUtil.logException(new VineException(), "Possible null cursor after swap.", new Object[0]);
        return;
      }
      while (this.mCurrentTab != 2);
      if (localCursor != null)
        localCursor.unregisterContentObserver(this.mChangeObserver);
      if (paramCursor != null)
        paramCursor.registerContentObserver(this.mChangeObserver);
      this.mFeedAdapter.swapCursor(paramCursor);
      if ((this.mFeedAdapter.isEmpty()) && ((0x4 & this.mFetchFlags) == 0))
        fetchContent(3, i);
      while ((!this.mFeedAdapter.isEmpty()) && (this.mLastFetchType == 7))
      {
        if (this.mFeedAdapter.getCursor().getCount() <= this.mCursorPreviousLikes)
          fetchContent(i, i);
        hideProgress(7);
        return;
        hideProgress(3);
        if (!this.mFeedAdapter.isEmpty())
          showSadface(false);
        else
          showSadface(false);
      }
    case 3:
    }
    if ((paramCursor != null) && (paramCursor.moveToFirst()))
      if (paramCursor.getInt(0) <= 0);
    for (this.mHideProfileReposts = i; ; this.mHideProfileReposts = false)
    {
      this.mSectionAdapter = null;
      setup();
      initProfile();
      return;
      int j = 0;
      break;
    }
  }

  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
    switch (paramLoader.getId())
    {
    default:
      return;
    case 1:
    case 2:
    }
    this.mFeedAdapter.swapCursor(null);
  }

  public boolean onLongClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return false;
    case 2131361873:
    case 2131362054:
    }
    this.mProfileHeaderAdapter.onProfileHeaderLongClick(paramView);
    return true;
  }

  public void onMoveTo(int paramInt)
  {
    super.onMoveTo(paramInt);
    setup();
    bindProfileDataAndCounts();
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    boolean bool = true;
    switch (paramMenuItem.getItemId())
    {
    default:
      bool = super.onOptionsItemSelected(paramMenuItem);
    case 2131362197:
    case 2131362198:
    case 2131362199:
    case 2131362200:
    }
    do
    {
      return bool;
      if (this.mIsUserBlocked)
      {
        this.mAppController.unblockUser(this.mUserId);
        return bool;
      }
      this.mAppController.blockUser(this.mUserId);
      return bool;
      addRequest(this.mAppController.reportPerson(this.mUserId));
      return bool;
      if (this.mRepostsEnabled)
      {
        this.mAppController.disableReposts(this.mUserId);
        return bool;
      }
      this.mAppController.enableReposts(this.mUserId);
      return bool;
    }
    while ((this.mUser == null) || (this.mIsMe));
    FlurryUtils.trackShareProfile();
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.setType("vnd.android-dir/mms-sms");
    int i = Util.getShareProfileMessageId();
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.mUser.username;
    arrayOfObject[bool] = String.valueOf(this.mUser.userId);
    localIntent.putExtra("sms_body", getString(i, arrayOfObject));
    startActivity(Intent.createChooser(localIntent, getString(2131624272)));
    return bool;
  }

  public void onPause()
  {
    super.onPause();
    this.mFeedAdapter.onPause(isFocused());
  }

  public void onPrepareOptionsMenu(Menu paramMenu)
  {
    MenuItem localMenuItem = paramMenu.findItem(2131362197);
    if (localMenuItem != null)
    {
      if (!this.mIsUserBlocked)
        break label57;
      localMenuItem.setTitle(2131624392);
    }
    while (true)
    {
      this.mHideRevines = paramMenu.findItem(2131362199);
      setRevineOptionText(this.mUser, this.mRepostsEnabled);
      return;
      label57: localMenuItem.setTitle(2131624014);
    }
  }

  public void onResume()
  {
    super.onResume();
    showProgress(3);
    if (this.mIsMe)
    {
      this.mHideProfileReposts = Util.getDefaultSharedPrefs(getActivity()).getBoolean("profile_hide_reposts", false);
      setup();
      initProfile();
    }
    while (this.mUserId <= 0L)
      return;
    getLoaderManager().restartLoader(3, null, this);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putInt("state_tab", this.mCurrentTab);
    paramBundle.putBoolean("stated_header_added", this.mHeaderAdded);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    Cursor localCursor = this.mFeedAdapter.getCursor();
    if ((this.mRefreshable) && (!localCursor.getExtras().getBoolean("is_last")) && (localCursor.getCount() <= 400))
    {
      this.mFeedAdapter.onPause(isFocused());
      this.mLastFetchType = 7;
    }
    switch (this.mCurrentTab)
    {
    default:
      return;
    case 1:
      this.mCursorPreviousPosts = localCursor.getCount();
      this.mCursorQuerySizePosts = Util.getNextCursorSize(this.mCursorPreviousPosts);
      showProgress(7);
      getLoaderManager().restartLoader(1, null, this);
      this.mPostPage = (1 + this.mPostPage);
      FlurryUtils.trackTimeLinePageScroll(getClass().getName() + "_Post", this.mPostPage);
      return;
    case 2:
    }
    this.mCursorPreviousLikes = localCursor.getCount();
    this.mCursorQuerySizeLikes = Util.getNextCursorSize(this.mCursorPreviousLikes);
    showProgress(7);
    getLoaderManager().restartLoader(2, null, this);
    this.mLikePage = (1 + this.mLikePage);
    FlurryUtils.trackTimeLinePageScroll(getClass().getName() + "_Like", this.mLikePage);
  }

  public void onSpanClicked(View paramView, int paramInt, Object paramObject)
  {
    FragmentActivity localFragmentActivity = getActivity();
    if (localFragmentActivity == null)
      return;
    new Intent(localFragmentActivity, UsersActivity.class).putExtra("p_id", this.mUserId);
    switch (paramInt)
    {
    default:
      super.onSpanClicked(paramView, paramInt, paramObject);
      return;
    case 5:
      onFollowersClicked();
      return;
    case 6:
    }
    onFollowingClicked();
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    setRefreshableHeaderOffset(6);
    this.mListView.setOnScrollListener(this);
    showProgress(3);
  }

  protected void refresh()
  {
    fetchContent(2, true);
    if (this.mIsMe)
    {
      addRequest(this.mAppController.fetchUsersMe(this.mAppController.getActiveId()));
      return;
    }
    addRequest(this.mAppController.fetchUser(this.mUserId));
  }

  class PrivateAccountAdapter extends BaseAdapter
  {
    boolean blocked;
    boolean priv;

    public PrivateAccountAdapter(boolean paramBoolean1, boolean arg3)
    {
      this.blocked = paramBoolean1;
      boolean bool;
      this.priv = bool;
    }

    public int getCount()
    {
      return 1;
    }

    public Object getItem(int paramInt)
    {
      return null;
    }

    public long getItemId(int paramInt)
    {
      return 0L;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (this.blocked)
        return LayoutInflater.from(ProfileFragment.this.getActivity()).inflate(2130903119, paramViewGroup, false);
      return LayoutInflater.from(ProfileFragment.this.getActivity()).inflate(2130903122, paramViewGroup, false);
    }
  }

  class ProfileListener extends BaseTimelineFragment.TimeLineSessionListener
  {
    ProfileListener()
    {
      super();
    }

    private boolean isUsernameValid()
    {
      return (ProfileFragment.this.mUser != null) && (!TextUtils.isEmpty(ProfileFragment.this.mUser.username));
    }

    public void onBlockUserComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (paramInt == 200)
      {
        ProfileFragment.access$702(ProfileFragment.this, paramBoolean);
        ProfileFragment.this.getActivity().supportInvalidateOptionsMenu();
        if (paramBoolean)
        {
          if (isUsernameValid());
          for (String str = ProfileFragment.this.mUser.username; ; str = ProfileFragment.this.getString(2131624415))
          {
            Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624406, new Object[] { str }));
            VineDatabaseHelper.getDatabaseHelper(ProfileFragment.this.getActivity()).removeUserWithType(ProfileFragment.this.mUserId, 2, true, Vine.UserGroupsView.CONTENT_URI_FOLLOWERS);
            return;
          }
        }
        Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624407));
        return;
      }
      Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624407));
    }

    public void onDeletePostComplete(String paramString1, int paramInt, String paramString2)
    {
      if (paramInt == 200)
        ProfileFragment.this.bindProfileDataAndCounts();
    }

    public void onDisableUserRepostsComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (paramInt == 200)
      {
        ProfileFragment localProfileFragment = ProfileFragment.this;
        boolean bool;
        if (!paramBoolean)
        {
          bool = true;
          ProfileFragment.access$802(localProfileFragment, bool);
          ProfileFragment.this.getActivity().supportInvalidateOptionsMenu();
          if (!paramBoolean)
            break label112;
          if (!isUsernameValid())
            break label98;
        }
        label98: for (String str = ProfileFragment.this.mUser.username; ; str = ProfileFragment.this.getString(2131624416))
        {
          Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624254, new Object[] { str }));
          return;
          bool = false;
          break;
        }
        label112: Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624255));
        return;
      }
      Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624255));
    }

    public void onEnableUserRepostsComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (paramInt == 200)
      {
        ProfileFragment.access$802(ProfileFragment.this, paramBoolean);
        ProfileFragment.this.getActivity().supportInvalidateOptionsMenu();
        if (paramBoolean)
        {
          if (isUsernameValid());
          for (String str = ProfileFragment.this.mUser.username; ; str = ProfileFragment.this.getString(2131624416))
          {
            Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624256, new Object[] { str }));
            return;
          }
        }
        Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624257));
        return;
      }
      Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624257));
    }

    public void onGetBlockedUsersComplete(String paramString1, int paramInt, String paramString2, ArrayList<VineUser> paramArrayList)
    {
      if (paramInt == 200)
      {
        Iterator localIterator = paramArrayList.iterator();
        while (localIterator.hasNext())
          if (((VineUser)localIterator.next()).userId == ProfileFragment.this.mUserId)
            ProfileFragment.access$702(ProfileFragment.this, true);
        ProfileFragment.this.getActivity().supportInvalidateOptionsMenu();
      }
    }

    public void onGetTimeLineComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, boolean paramBoolean1, ArrayList<VinePost> paramArrayList, String paramString3, int paramInt4, int paramInt5, int paramInt6, long paramLong, boolean paramBoolean2, int paramInt7, String paramString4)
    {
      PendingRequest localPendingRequest = ProfileFragment.this.removeRequest(paramString1);
      int i;
      ArrayList localArrayList2;
      int j;
      label228: Object localObject;
      if (localPendingRequest != null)
      {
        if ((paramInt2 != 2) && (paramInt2 != 10))
          break label401;
        i = 1;
        if ((i != 0) && (paramInt1 == 200))
        {
          ProfileFragment.this.mProfileHeaderAdapter.updatePostsCount(paramInt7);
          ProfileFragment.this.mProfileHeaderAdapter.notifyDataSetChanged();
        }
        if ((paramBoolean1) && (paramInt1 == 200))
        {
          if (((paramInt2 == 3) && (ProfileFragment.this.mCurrentTab == 2)) || ((i != 0) && (ProfileFragment.this.mCurrentTab == 1)))
          {
            Cursor localCursor1 = ProfileFragment.this.mCursorAdapter.getCursor();
            ArrayList localArrayList1 = null;
            if (localCursor1 != null)
            {
              int k = localCursor1.getCount();
              localArrayList1 = null;
              if (k > 0)
              {
                Bundle localBundle = new Bundle();
                localBundle.putBoolean("include_list", true);
                localCursor1.respond(localBundle);
                localArrayList1 = localCursor1.getExtras().getParcelableArrayList("extra_posts");
              }
            }
            localArrayList2 = HybridPostCursor.mergePosts(localArrayList1, paramArrayList, VineComparatorFactory.get(paramInt2), false);
            if (localArrayList2 != null)
            {
              if (ProfileFragment.this.mCurrentTab != 1)
                break label407;
              j = ProfileFragment.this.mCursorQuerySizePosts;
              if (!BuildUtil.isOldDeviceOrLowEndDevice(ProfileFragment.this.getActivity()))
                break label419;
              localObject = new HybridPostCursorExplore(localArrayList2, j);
              label254: if (paramInt5 <= 0)
                ((HybridPostCursor)localObject).markLast();
              if (ProfileFragment.this.mChangeObserver == null)
                break label435;
              Cursor localCursor2 = ProfileFragment.this.mCursorAdapter.swapCursor((Cursor)localObject);
              if (localCursor2 != null)
                localCursor2.unregisterContentObserver(ProfileFragment.this.mChangeObserver);
              ((HybridPostCursor)localObject).registerContentObserver(ProfileFragment.this.mChangeObserver);
              label319: ProfileFragment.this.mCursorAdapter.notifyDataSetChanged();
            }
          }
          if (i == 0)
            break label451;
          ProfileFragment.this.mCursorQuerySizePosts = ProfileFragment.this.mCursorAdapter.getCount();
        }
      }
      while (true)
      {
        ProfileFragment.this.mAppController.saveLoadedPosts(paramArrayList, paramInt2, paramString3, paramInt4, paramInt5, paramInt6, paramLong, false);
        if ((i != 0) || (paramInt2 == 3))
          ProfileFragment.this.hideProgress(localPendingRequest.fetchType);
        return;
        label401: i = 0;
        break;
        label407: j = ProfileFragment.this.mCursorQuerySizeLikes;
        break label228;
        label419: localObject = new HybridPostCursor(localArrayList2, j);
        break label254;
        label435: CrashUtil.logException(new VineException("Invalid observer"));
        break label319;
        label451: if (paramInt2 == 3)
          ProfileFragment.this.mCursorQuerySizeLikes = ProfileFragment.this.mCursorAdapter.getCount();
      }
    }

    public void onGetUserComplete(String paramString1, int paramInt, String paramString2, VineUser paramVineUser)
    {
      PendingRequest localPendingRequest = ProfileFragment.this.removeRequest(paramString1);
      if (localPendingRequest != null)
      {
        if (paramInt == 200)
        {
          ProfileFragment.access$202(ProfileFragment.this, paramVineUser);
          if (ProfileFragment.this.isLocked())
          {
            ProfileFragment.access$402(ProfileFragment.this, null);
            ProfileFragment.this.setup();
          }
          if (ProfileFragment.this.mProfileHeaderAdapter != null)
          {
            ProfileFragment.this.bindUserData(ProfileFragment.this.mUser);
            ProfileFragment.this.mProfileHeaderAdapter.notifyDataSetChanged();
          }
        }
        ProfileFragment.this.hideProgress(localPendingRequest.fetchType);
      }
    }

    public void onGetUserIdComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if (paramLong > 0L)
      {
        ProfileFragment.access$602(ProfileFragment.this, paramLong);
        ProfileFragment localProfileFragment = ProfileFragment.this;
        if (ProfileFragment.this.mUserId == ProfileFragment.this.mAppController.getActiveId());
        for (boolean bool = true; ; bool = false)
        {
          ProfileFragment.access$102(localProfileFragment, bool);
          if (!ProfileFragment.this.mIsMe)
            break;
          ProfileFragment.access$1102(ProfileFragment.this, Util.getDefaultSharedPrefs(ProfileFragment.this.getActivity()).getBoolean("profile_hide_reposts", false));
          ProfileFragment.this.setup();
          ProfileFragment.this.initProfile();
          return;
        }
        ProfileFragment.this.mAppController.getBlockedUsers();
        ProfileFragment.this.getLoaderManager().restartLoader(3, null, ProfileFragment.this);
        return;
      }
      ProfileFragment.this.getActivity().finish();
    }

    public void onGetUsersMeComplete(String paramString1, int paramInt, String paramString2, long paramLong, VineUser paramVineUser)
    {
      PendingRequest localPendingRequest = ProfileFragment.this.removeRequest(paramString1);
      if (localPendingRequest != null)
      {
        if ((paramInt == 200) && (ProfileFragment.this.mIsMe))
        {
          ProfileFragment.access$202(ProfileFragment.this, paramVineUser);
          if (paramVineUser != null)
          {
            ProfileFragment.this.bindUserData(paramVineUser);
            ProfileFragment.this.mProfileHeaderAdapter.notifyDataSetChanged();
          }
        }
        ProfileFragment.this.hideProgress(localPendingRequest.fetchType);
      }
    }

    public void onLikePost(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((ProfileFragment.this.removeRequest(paramString1) != null) && (paramInt != 200))
      {
        ProfileFragment.this.mLikeCache.removeEntry(paramLong);
        ProfileFragment.this.mFeedAdapter.showUnlikedByMe(paramLong);
        ProfileFragment.this.mCursorAdapter.notifyDataSetChanged();
      }
    }

    public void onPhotoImageError(ImageKey paramImageKey, HttpResult paramHttpResult)
    {
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      if (ProfileFragment.this.mProfileHeaderAdapter != null)
      {
        ProfileFragment.this.mProfileHeaderAdapter.onImageLoaded(paramHashMap);
        ProfileFragment.this.mFeedAdapter.setImages(paramHashMap);
      }
    }

    public void onReportUserComplete(String paramString1, int paramInt, String paramString2)
    {
      if (paramInt == 200)
      {
        if (isUsernameValid());
        for (String str = ProfileFragment.this.mUser.username; ; str = ProfileFragment.this.getString(2131624416))
        {
          Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624411, new Object[] { str }));
          return;
        }
      }
      Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624412));
    }

    public void onRespondFollowRequestComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean, long paramLong)
    {
      if (paramInt == 200)
      {
        if (ProfileFragment.this.mFollowHeader != null)
        {
          ProfileFragment.this.mFollowHeader.findViewById(2131361945).setLayoutParams(new LinearLayout.LayoutParams(-1, 0));
          ProfileFragment.this.mFollowHeader.setVisibility(8);
        }
        return;
      }
      if (paramBoolean)
      {
        Util.showCenteredToast(ProfileFragment.this.getActivity(), 2131623993);
        return;
      }
      Util.showCenteredToast(ProfileFragment.this.getActivity(), 2131624084);
    }

    public void onTrimMemory(int paramInt)
    {
      super.onTrimMemory(paramInt);
      GenericTimelineAdapter localGenericTimelineAdapter = ProfileFragment.this.mFeedAdapter;
      if (localGenericTimelineAdapter != null)
        localGenericTimelineAdapter.onTrimMemory(paramInt);
    }

    public void onUnblockUserComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (paramInt == 200)
      {
        ProfileFragment localProfileFragment = ProfileFragment.this;
        boolean bool;
        if (!paramBoolean)
        {
          bool = true;
          ProfileFragment.access$702(localProfileFragment, bool);
          ProfileFragment.this.getActivity().supportInvalidateOptionsMenu();
          if (!paramBoolean)
            break label138;
          if (!isUsernameValid())
            break label124;
        }
        label124: for (String str = ProfileFragment.this.mUser.username; ; str = ProfileFragment.this.getString(2131624415))
        {
          Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624413, new Object[] { str }));
          ProfileFragment.this.addRequest(ProfileFragment.this.mAppController.fetchUser(ProfileFragment.this.mUserId));
          return;
          bool = false;
          break;
        }
        label138: Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624407));
        return;
      }
      Util.showDefaultToast(ProfileFragment.this.getActivity(), ProfileFragment.this.getString(2131624414));
    }

    public void onUnlikePost(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((ProfileFragment.this.removeRequest(paramString1) != null) && (paramInt != 200))
      {
        ProfileFragment.this.mLikeCache.like(paramLong);
        ProfileFragment.this.mFeedAdapter.showLikedByMe(paramLong);
        ProfileFragment.this.mCursorAdapter.notifyDataSetChanged();
      }
    }

    public void onVideoPathError(VideoKey paramVideoKey, HttpResult paramHttpResult)
    {
    }

    public void onVideoPathObtained(HashMap<VideoKey, UrlVideo> paramHashMap)
    {
      ProfileFragment.this.mFeedAdapter.onVideoPathObtained(paramHashMap);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ProfileFragment
 * JD-Core Version:    0.6.2
 */