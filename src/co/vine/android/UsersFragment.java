package co.vine.android;

import android.content.ContentUris;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ListView;
import android.widget.Toast;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.provider.Vine.UserGroupsView;
import co.vine.android.provider.VineDatabaseSQL.UsersQuery;
import co.vine.android.service.PendingAction;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import java.util.ArrayList;
import java.util.HashMap;

public class UsersFragment extends BaseListFragment
  implements View.OnClickListener
{
  public static final String ARG_POST_ID = "post_id";
  public static final String ARG_PROFILE_ID = "p_id";
  public static final String ARG_USERS_TYPE = "u_type";
  private static final String EVENT_SOURCE_TITLE = "Users List: ";
  private static final String STATE_FRIENDSHIPS = "state_friendships";
  private static final String STATE_LOAD_FLAGS = "state_load_flags";
  boolean mFetched;
  private String mFlurryEventSource;
  private Friendships mFriendships;
  int mLoadFlags;
  long mPostId;
  long mProfileId;
  private String[] mProjection;
  private String mSortOrder;
  int mUsersType;
  private Uri mUsersUri;

  private void fetchContent(int paramInt)
  {
    if (hasPendingRequest(paramInt))
      return;
    this.mFetched = true;
    int i;
    label46: String str;
    switch (paramInt)
    {
    default:
      i = 1;
      int j = this.mUsersType;
      str = null;
      switch (j)
      {
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
      default:
      case 1:
      case 2:
      case 5:
      case 9:
      }
      break;
    case 3:
    case 2:
    case 4:
    case 1:
    }
    while (str != null)
    {
      showProgress(paramInt);
      addRequest(str, paramInt);
      return;
      i = 1;
      break label46;
      i = 2;
      break label46;
      i = 3;
      break label46;
      str = this.mAppController.fetchFollowing(this.mProfileId, i);
      continue;
      str = this.mAppController.fetchFollowers(this.mProfileId, i);
      continue;
      str = this.mAppController.fetchPostLikers(this.mAppController.getActiveSession(), this.mPostId, i);
      continue;
      str = this.mAppController.fetchReviners(this.mAppController.getActiveSession(), this.mPostId, i);
    }
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (this.mCursorAdapter == null)
    {
      this.mProjection = VineDatabaseSQL.UsersQuery.PROJECTION;
      this.mSortOrder = "_id ASC";
      switch (this.mUsersType)
      {
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
      default:
        throw new IllegalArgumentException("Could not process user type " + this.mUsersType);
      case 2:
        this.mUsersUri = ContentUris.withAppendedId(Vine.UserGroupsView.CONTENT_URI_FOLLOWERS, this.mProfileId);
        this.mSortOrder = "order_id DESC";
        this.mFlurryEventSource = "Users List: Followers";
      case 1:
      case 5:
      case 9:
      }
    }
    while (true)
    {
      this.mCursorAdapter = new UsersAdapter(getActivity(), this.mAppController, true, this, this.mFriendships, 0);
      this.mListView.setAdapter(this.mCursorAdapter);
      this.mAppSessionListener = new UsersAppSessionListener();
      return;
      this.mUsersUri = ContentUris.withAppendedId(Vine.UserGroupsView.CONTENT_URI_FOLLOWING, this.mProfileId);
      this.mSortOrder = "order_id DESC";
      this.mFlurryEventSource = "Users List: Following";
      continue;
      this.mUsersUri = ContentUris.withAppendedId(Vine.UserGroupsView.CONTENT_URI_LIKERS, this.mPostId);
      this.mSortOrder = "order_id ASC";
      this.mFlurryEventSource = "Users List: Likers";
      continue;
      this.mUsersUri = ContentUris.withAppendedId(Vine.UserGroupsView.CONTENT_URI_REVINERS, this.mPostId);
      this.mSortOrder = "order_id ASC";
      this.mFlurryEventSource = "Users List: Reviners";
    }
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
    case 2131362177:
    }
    FollowButtonViewHolder localFollowButtonViewHolder;
    do
    {
      return;
      localFollowButtonViewHolder = (FollowButtonViewHolder)paramView.getTag();
    }
    while (localFollowButtonViewHolder == null);
    if (!localFollowButtonViewHolder.following)
    {
      addRequest(this.mAppController.followUser(this.mAppController.getActiveSession(), localFollowButtonViewHolder.userId, false));
      this.mFriendships.addFollowing(localFollowButtonViewHolder.userId);
      this.mCursorAdapter.notifyDataSetChanged();
      return;
    }
    addRequest(this.mAppController.unfollowUser(this.mAppController.getActiveSession(), localFollowButtonViewHolder.userId, false, this.mProfileId));
    this.mFriendships.removeFollowing(localFollowButtonViewHolder.userId);
    this.mCursorAdapter.notifyDataSetChanged();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Bundle localBundle = getArguments();
    this.mUsersType = localBundle.getInt("u_type", -1);
    this.mProfileId = localBundle.getLong("p_id");
    this.mPostId = localBundle.getLong("post_id", -1L);
    if (paramBundle != null)
    {
      this.mLoadFlags = paramBundle.getInt("state_load_flags");
      if (paramBundle.containsKey("state_friendships"))
        this.mFriendships = ((Friendships)paramBundle.getParcelable("state_friendships"));
      return;
    }
    this.mLoadFlags = 0;
    this.mFriendships = new Friendships();
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), this.mUsersUri, this.mProjection, null, null, this.mSortOrder);
  }

  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    if (paramLong > 0L)
      ProfileActivity.start(getActivity(), paramLong, this.mFlurryEventSource);
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    if ((this.mCursorAdapter.isEmpty()) && (!this.mFetched))
    {
      fetchContent(3);
      return;
    }
    hideProgress(3);
  }

  public void onResume()
  {
    super.onResume();
    if (this.mUsersUri != null)
    {
      if (this.mCursorAdapter.getCursor() == null)
      {
        showProgress(3);
        initLoader();
      }
      while (!this.mCursorAdapter.isEmpty())
        return;
      fetchContent(3);
      return;
    }
    hideProgress(3);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putParcelable("state_friendships", this.mFriendships);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    if ((this.mRefreshable) && (paramCursor.getInt(17) == 0) && (paramCursor.getCount() <= 400))
      fetchContent(1);
  }

  protected void refresh()
  {
    fetchContent(2);
  }

  class UsersAppSessionListener extends AppSessionListener
  {
    UsersAppSessionListener()
    {
    }

    public void onCaptchaRequired(String paramString1, String paramString2, PendingAction paramPendingAction)
    {
      if (UsersFragment.this.removeRequest(paramString1) != null)
      {
        UsersFragment.this.mPendingCaptchaRequest = new PendingCaptchaRequest(paramString1, paramPendingAction.actionCode, paramPendingAction.bundle);
        UsersFragment.this.showCaptcha(paramString1, paramString2);
      }
    }

    public void onFollowComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((UsersFragment.this.removeRequest(paramString1) != null) && (paramInt != 200))
      {
        UsersFragment.this.mFriendships.removeFollowing(paramLong);
        UsersFragment.this.mCursorAdapter.notifyDataSetChanged();
      }
    }

    public void onGetUsersComplete(Session paramSession, String paramString1, int paramInt1, String paramString2, int paramInt2, ArrayList<VineUser> paramArrayList, int paramInt3, int paramInt4)
    {
      switch (paramInt1)
      {
      default:
        UsersFragment.this.hideProgress(3);
        Toast.makeText(UsersFragment.this.getActivity(), paramString2, 1).show();
      case 200:
      }
      PendingRequest localPendingRequest;
      do
      {
        return;
        localPendingRequest = UsersFragment.this.removeRequest(paramString1);
      }
      while (localPendingRequest == null);
      UsersFragment.this.hideProgress(localPendingRequest.fetchType);
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      ((UsersAdapter)UsersFragment.this.mCursorAdapter).setUserImages(paramHashMap);
    }

    public void onUnFollowComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((UsersFragment.this.removeRequest(paramString1) != null) && (paramInt != 200))
      {
        UsersFragment.this.mFriendships.addFollowing(paramLong);
        UsersFragment.this.mCursorAdapter.notifyDataSetChanged();
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UsersFragment
 * JD-Core Version:    0.6.2
 */