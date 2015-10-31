package co.vine.android;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListView;
import android.widget.TextView;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.provider.Vine.Activity;
import co.vine.android.provider.VineDatabaseSQL.ActivityQuery;
import co.vine.android.service.GCMNotificationService;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.ActivityViewHolder;
import co.vine.android.widget.OnTabChangedListener;
import co.vine.android.widget.SpanClickListener;
import java.util.HashMap;

public class ActivityFragment extends BaseListFragment
  implements SpanClickListener, View.OnClickListener, OnTabChangedListener
{
  public static final String ARG_TAKE_FOCUS = "take_focus";
  private static final String EVENT_SOURCE_TITLE = "Activity Feed";
  private static final int LOADED_ID_ACTIVITY = 1;
  private static final int LOADER_ID_PENDING_REQUEST_COUNT = 2;
  private static final int STATED_EXPANDED = 2;
  private static final int STATE_COLLAPSED = 1;
  private static final int STATE_FEW = 3;
  private static final String STATE_FOLLOW_HEADER_ADDED = "state_follow_header_added";
  private static final String STATE_FOLLOW_HEADER_SHOWING = "state_follow_header_showing";
  private static final String STATE_FOLLOW_REQUEST_COUNT = "state_follow_count";
  private static final String STATE_FOLLOW_STATE = "state_follow_state";
  private static final int STATE_NONE = 4;
  private static final String STATE_PRIVATE = "state_private";
  private boolean mFetched;
  private boolean mFocused;
  private LinearLayout mFollowHeader;
  private boolean mFollowHeaderAdded;
  private boolean mFollowHeaderShowing;
  private int mFollowRequestCount;
  private int mFollowState;
  private ImageView mHeaderCollapsed;
  private ImageView mHeaderExpanded;
  private ImageView mHeaderFew;
  private boolean mPrivate;
  private TextView mTextCollapsed;
  private TextView mTextExpanded;
  private TextView mTextFew;

  private void fetchContent(int paramInt)
  {
    fetchContent(paramInt, false);
  }

  private void fetchContent(int paramInt, boolean paramBoolean)
  {
    if (hasPendingRequest(paramInt))
      return;
    this.mFetched = true;
    if (!paramBoolean)
      showProgress(paramInt);
    int i;
    switch (paramInt)
    {
    default:
      i = 1;
    case 2:
    case 1:
    }
    while (true)
    {
      addRequest(this.mAppController.fetchActivity(this.mAppController.getActiveSession(), i, this.mPrivate, isFocused()), paramInt);
      return;
      i = 2;
      continue;
      i = 3;
    }
  }

  private void updateFollowRequestCount()
  {
    getLoaderManager().restartLoader(2, null, this);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.mCursorAdapter = new ActivityAdapter(getActivity(), this.mAppController, this, this, 0);
    this.mListView.setAdapter(this.mCursorAdapter);
    if ((getArguments().getBoolean("take_focus", false)) && (!this.mFetched))
      ((HomeTabActivity)getActivity()).showPage(1, this);
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131361873:
    case 2131361875:
      ProfileActivity.start(getActivity(), ((Long)paramView.getTag()).longValue(), "Activity Feed");
      return;
    case 2131362108:
      this.mFollowState = 2;
      getLoaderManager().restartLoader(1, null, this);
      updateFollowRequestHeader();
      return;
    case 2131362112:
    }
    this.mFollowState = 1;
    getLoaderManager().restartLoader(1, null, this);
    updateFollowRequestHeader();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new ActivityListener();
    if (paramBundle != null)
    {
      if (paramBundle.containsKey("state_private"))
        this.mPrivate = paramBundle.getBoolean("state_private");
      if (paramBundle.containsKey("state_follow_header_added"))
        this.mFollowHeaderAdded = paramBundle.getBoolean("state_follow_header_added");
      if (paramBundle.containsKey("state_follow_header_showing"))
        this.mFollowHeaderShowing = paramBundle.getBoolean("state_follow_header_showing");
      if (paramBundle.containsKey("state_follow_count"))
        this.mFollowRequestCount = paramBundle.getInt("state_follow_count");
      if (paramBundle.containsKey("state_follow_state"))
        this.mFollowState = paramBundle.getInt("state_follow_state");
      return;
    }
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(getActivity());
    this.mPrivate = localSharedPreferences.getBoolean("settings_private", false);
    this.mFollowRequestCount = localSharedPreferences.getInt("settings_follow_pref_count", 0);
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    switch (paramInt)
    {
    default:
      return null;
    case 2:
      return new CursorLoader(getActivity(), Vine.Activity.CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL, new String[] { "notification_id" }, null, null, null);
    case 1:
    }
    if (this.mPrivate)
    {
      switch (this.mFollowState)
      {
      default:
        return new CursorLoader(getActivity(), Vine.Activity.CONTENT_URI, VineDatabaseSQL.ActivityQuery.PROJECTION, null, null, "sort_id DESC, notification_id DESC");
      case 1:
        return new CursorLoader(getActivity(), Vine.Activity.CONTENT_URI, VineDatabaseSQL.ActivityQuery.PROJECTION, null, null, "sort_id DESC, notification_id DESC");
      case 3:
        return new CursorLoader(getActivity(), Vine.Activity.CONTENT_URI_WITH_FOLLOW_REQUESTS, VineDatabaseSQL.ActivityQuery.PROJECTION, null, null, "sort_id DESC, notification_id DESC");
      case 2:
      }
      return new CursorLoader(getActivity(), Vine.Activity.CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL, VineDatabaseSQL.ActivityQuery.PROJECTION, null, null, "sort_id DESC, notification_id DESC");
    }
    return new CursorLoader(getActivity(), Vine.Activity.CONTENT_URI, VineDatabaseSQL.ActivityQuery.PROJECTION, null, null, "sort_id DESC, notification_id DESC");
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = createView(paramLayoutInflater, 2130903109, paramViewGroup);
    updateFollowRequestHeader();
    return localView;
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    ActivityViewHolder localActivityViewHolder;
    if ((paramView.getTag() instanceof ActivityViewHolder))
    {
      localActivityViewHolder = (ActivityViewHolder)paramView.getTag();
      switch (localActivityViewHolder.type)
      {
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      default:
        if (localActivityViewHolder.postId > 0L)
          SingleActivity.start(getActivity(), localActivityViewHolder.postId);
        break;
      case 1:
      case 2:
      case 3:
      case 10:
      case 11:
      case 12:
      }
    }
    while (localActivityViewHolder.userId <= 0L)
    {
      return;
      ProfileActivity.start(getActivity(), localActivityViewHolder.userId, "Activity Feed");
      return;
      if (localActivityViewHolder.isLocked)
      {
        SingleActivity.startLocked(getActivity(), localActivityViewHolder.postId, localActivityViewHolder.username, localActivityViewHolder.userId);
        return;
      }
      SingleActivity.start(getActivity(), localActivityViewHolder.postId);
      return;
    }
    ProfileActivity.start(getActivity(), localActivityViewHolder.userId, "Activity Feed");
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    switch (paramLoader.getId())
    {
    default:
      return;
    case 1:
      super.onLoadFinished(paramLoader, paramCursor);
      if ((this.mCursorAdapter.isEmpty()) && (!this.mFetched))
      {
        fetchContent(3);
        return;
      }
      hideProgress(3);
      if ((this.mFetched) && (this.mCursorAdapter.isEmpty()))
      {
        showSadface(true);
        return;
      }
      if (this.mPrivate)
        updateFollowRequestCount();
      showSadface(false);
      return;
    case 2:
    }
    if (paramCursor != null)
    {
      if ((paramCursor.moveToFirst()) && (paramCursor.getCount() > 0))
        this.mFollowRequestCount = paramCursor.getExtras().getInt("num_reqs", 0);
      paramCursor.close();
    }
    updateFollowRequestHeader();
  }

  public void onMoveAway(int paramInt)
  {
    super.onMoveAway(paramInt);
    this.mFocused = false;
  }

  public void onMoveTo(int paramInt)
  {
    super.onMoveTo(paramInt);
    this.mFocused = true;
    this.mPrivate = Util.getDefaultSharedPrefs(getActivity()).getBoolean("settings_private", false);
    if ((this.mCursorAdapter != null) && (!hasPendingRequest()))
    {
      if (this.mCursorAdapter.isEmpty())
        fetchContent(3);
    }
    else
      return;
    fetchContent(2, true);
  }

  public void onResume()
  {
    super.onResume();
    if (this.mCursorAdapter.getCursor() == null)
    {
      updateFollowRequestCount();
      updateFollowRequestHeader();
      initLoader(1);
      initLoader(2);
    }
    while ((!this.mCursorAdapter.isEmpty()) || (this.mFetched))
      return;
    fetchContent(3);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("state_private", this.mPrivate);
    paramBundle.putBoolean("state_follow_header_showing", this.mFollowHeaderShowing);
    paramBundle.putBoolean("state_follow_header_added", this.mFollowHeaderAdded);
    paramBundle.putInt("state_follow_count", this.mFollowRequestCount);
    paramBundle.putInt("state_follow_state", this.mFollowState);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    if ((this.mRefreshable) && (paramCursor.getInt(12) == 0) && (paramCursor.getCount() <= 400))
      fetchContent(1);
  }

  public void onSpanClicked(View paramView, int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    case 2:
    default:
      switch (paramView.getId())
      {
      default:
        return;
      case 2131361870:
      }
    case 1:
      ProfileActivity.start(getActivity(), ((Long)paramObject).longValue(), "Activity Feed");
      return;
    case 3:
    }
    HashtagActivity.start(getActivity(), (String)paramObject);
    return;
    ProfileActivity.start(getActivity(), ((Long)paramObject).longValue(), "Activity Feed");
  }

  protected void refresh()
  {
    fetchContent(2);
  }

  public void updateFollowRequestHeader()
  {
    int i;
    int j;
    if (this.mPrivate)
    {
      i = this.mFollowState;
      j = this.mFollowRequestCount;
      if (j <= 0)
      {
        if ((this.mFollowHeader != null) && (this.mFollowHeaderShowing))
        {
          this.mFollowHeader.findViewById(2131362107).setLayoutParams(new LinearLayout.LayoutParams(-1, 0));
          this.mFollowHeader.setVisibility(8);
          this.mFollowHeaderShowing = false;
          setRefreshableHeaderOffset(0);
        }
        this.mFollowState = 4;
      }
    }
    else
    {
      return;
    }
    if (!this.mFollowHeaderAdded)
    {
      LinearLayout localLinearLayout = (LinearLayout)LayoutInflater.from(getActivity()).inflate(2130903127, this.mListView, false);
      this.mListView.addHeaderView(localLinearLayout);
      this.mFollowHeader = localLinearLayout;
      this.mFollowHeaderAdded = true;
      setRefreshableHeaderOffset(6);
      this.mHeaderCollapsed = ((ImageView)localLinearLayout.findViewById(2131362108));
      this.mTextCollapsed = ((TextView)localLinearLayout.findViewById(2131362109));
      this.mHeaderExpanded = ((ImageView)localLinearLayout.findViewById(2131362112));
      this.mTextExpanded = ((TextView)localLinearLayout.findViewById(2131362113));
      this.mHeaderFew = ((ImageView)localLinearLayout.findViewById(2131362110));
      this.mTextFew = ((TextView)localLinearLayout.findViewById(2131362111));
      this.mHeaderCollapsed.setOnClickListener(this);
      this.mHeaderExpanded.setOnClickListener(this);
      if (j > 5)
        i = 1;
    }
    if (this.mFollowHeader != null)
    {
      this.mFollowHeader.setVisibility(0);
      setRefreshableHeaderOffset(6);
      this.mFollowHeader.findViewById(2131362107).setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      this.mFollowHeaderShowing = true;
      if ((j <= 5) || (i != 1))
        break label415;
      this.mHeaderCollapsed.setVisibility(0);
      this.mTextCollapsed.setVisibility(0);
      TextView localTextView2 = this.mTextCollapsed;
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(j);
      localTextView2.setText(getString(2131624140, arrayOfObject2));
      this.mHeaderExpanded.setVisibility(8);
      this.mTextExpanded.setVisibility(8);
      this.mHeaderFew.setVisibility(8);
      this.mTextFew.setVisibility(8);
    }
    while (this.mFollowState != i)
    {
      this.mFollowState = i;
      restartLoader();
      return;
      label415: if ((j > 5) && (i == 2))
      {
        this.mHeaderExpanded.setVisibility(0);
        this.mTextExpanded.setVisibility(0);
        TextView localTextView1 = this.mTextExpanded;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(j);
        localTextView1.setText(getString(2131624140, arrayOfObject1));
        this.mHeaderCollapsed.setVisibility(8);
        this.mTextCollapsed.setVisibility(8);
        this.mHeaderFew.setVisibility(8);
        this.mTextFew.setVisibility(8);
      }
      else if (j <= 5)
      {
        i = 3;
        this.mHeaderFew.setVisibility(0);
        this.mTextFew.setVisibility(0);
        this.mTextFew.setText(getString(2131624139));
        this.mHeaderCollapsed.setVisibility(8);
        this.mTextCollapsed.setVisibility(8);
        this.mHeaderExpanded.setVisibility(8);
        this.mTextExpanded.setVisibility(8);
      }
    }
    this.mFollowState = i;
  }

  class ActivityListener extends AppSessionListener
  {
    ActivityListener()
    {
    }

    public void onGetActivityComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3)
    {
      PendingRequest localPendingRequest = ActivityFragment.this.removeRequest(paramString1);
      if (localPendingRequest != null)
      {
        ActivityFragment.this.hideProgress(localPendingRequest.fetchType);
        if ((paramInt1 != 200) && (ActivityFragment.this.mFocused))
          Util.showCenteredToast(ActivityFragment.this.getActivity(), 2131623996);
        SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(ActivityFragment.this.getActivity());
        ActivityFragment.access$102(ActivityFragment.this, localSharedPreferences.getBoolean("settings_private", false));
        if (ActivityFragment.this.mPrivate)
        {
          if (paramInt1 != 200)
            break label200;
          localSharedPreferences.edit().putInt("settings_follow_pref_count", ActivityFragment.this.mFollowRequestCount);
          ActivityFragment.access$202(ActivityFragment.this, paramInt3);
          ActivityFragment.this.updateFollowRequestHeader();
        }
      }
      while (true)
      {
        if ((ActivityFragment.this.mCursorAdapter != null) && (ActivityFragment.this.mCursorAdapter.isEmpty()) && (paramInt2 == 0))
          ActivityFragment.this.showSadface(true);
        ActivityFragment.this.getActivity().startService(GCMNotificationService.getClearNotificationIntent(ActivityFragment.this.getActivity()));
        return;
        label200: ActivityFragment.this.updateFollowRequestCount();
      }
    }

    public void onGetUsersMeComplete(String paramString1, int paramInt, String paramString2, long paramLong, VineUser paramVineUser)
    {
      if ((paramVineUser != null) && (paramVineUser.isPrivate()))
      {
        ActivityFragment.access$102(ActivityFragment.this, true);
        ActivityFragment.this.restartLoader();
        ActivityFragment.this.updateFollowRequestHeader();
      }
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      ((ActivityAdapter)ActivityFragment.this.mCursorAdapter).setUserImages(paramHashMap);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ActivityFragment
 * JD-Core Version:    0.6.2
 */