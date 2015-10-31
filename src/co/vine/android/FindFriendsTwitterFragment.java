package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.ProgressDialog;
import android.content.ContentUris;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.text.style.StyleSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.client.TwitterVineApp;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.provider.Vine.UserGroupsView;
import co.vine.android.provider.VineDatabaseSQL.UsersQuery;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.UserViewHolder;
import com.twitter.android.sdk.Twitter;
import com.twitter.android.widget.ItemPosition;
import java.util.HashMap;

public class FindFriendsTwitterFragment extends BaseListFragment
  implements View.OnClickListener, AdapterView.OnItemClickListener
{
  private static final String EVENT_SOURCE_TITLE = "Find Friends: Twitter";
  private static final String STATE_FETCHED = "fetch";
  private static final String STATE_FRIENDSHIPS = "friendships";
  private static final String STATE_SAFE_TO_LOAD = "safe";
  private StyleSpan[] mBold;
  private boolean mFetched;
  private Friendships mFriendships;
  private int mNewFollowsCount;
  private String[] mProjection;
  private boolean mSafeToLoad;
  private String mSecret;
  private String mSortOrder;
  private String mToken;
  private Twitter mTwitter;

  private void fetchContent(int paramInt)
  {
    this.mFetched = true;
    switch (paramInt)
    {
    default:
      return;
    case 3:
    }
    FragmentActivity localFragmentActivity = getActivity();
    String str = this.mAppController.getActiveSession().getLoginEmail();
    Account localAccount = VineAccountHelper.getAccount(localFragmentActivity, str);
    if (localAccount == null)
    {
      CrashUtil.logException(new VineException("Find Friends Twitter account was null"), "Find Friends Twitter account was null. UniqueLogin: {} ", new Object[] { str });
      Util.showCenteredToast(localFragmentActivity, 2131624126);
      return;
    }
    AccountManager localAccountManager = AccountManager.get(getActivity());
    this.mToken = localAccountManager.getUserData(localAccount, "account_t_token");
    this.mSecret = localAccountManager.getUserData(localAccount, "account_t_secret");
    if ((this.mToken == null) || (this.mSecret == null))
    {
      AppController.startTwitterAuthWithFinish(this.mTwitter, localFragmentActivity);
      return;
    }
    fetchTwitterFriends(this.mToken, this.mSecret);
  }

  private void fetchTwitterFriends(String paramString1, String paramString2)
  {
    ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2131689512);
    localProgressDialog.setProgress(0);
    localProgressDialog.setMessage(getString(2131624132));
    localProgressDialog.show();
    this.mProgressDialog = localProgressDialog;
    this.mAppController.fetchTwitterFriends(this.mAppController.getActiveSession(), paramString1, paramString2);
  }

  private void startProfileActivity(long paramLong)
  {
    ProfileActivity.start(getActivity(), paramLong, "Find Friends: Twitter");
  }

  public ItemPosition getFirstItemPosition()
  {
    return null;
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (this.mCursorAdapter == null)
    {
      this.mProjection = VineDatabaseSQL.UsersQuery.PROJECTION;
      this.mSortOrder = "username ASC";
      this.mCursorAdapter = new UsersAdapter(getActivity(), this.mAppController, true, this, this.mFriendships, 0);
    }
    this.mListView.setAdapter(this.mCursorAdapter);
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
    case 1:
    case 2:
    }
    do
    {
      do
      {
        return;
        if (paramInt2 == -1)
        {
          this.mToken = paramIntent.getStringExtra("tk");
          this.mSecret = paramIntent.getStringExtra("ts");
          fetchTwitterFriends(this.mToken, this.mSecret);
          return;
        }
      }
      while (paramInt2 == 0);
      dismissDialog();
      Util.showCenteredToast(getActivity(), 2131624127);
      return;
    }
    while (paramInt2 != -1);
    this.mToken = paramIntent.getStringExtra("token");
    this.mSecret = paramIntent.getStringExtra("secret");
    fetchTwitterFriends(this.mToken, this.mSecret);
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
    case 2131361939:
    case 2131362177:
    }
    FollowButtonViewHolder localFollowButtonViewHolder;
    do
    {
      return;
      fetchContent(3);
      localFollowButtonViewHolder = (FollowButtonViewHolder)paramView.getTag();
    }
    while (localFollowButtonViewHolder == null);
    if (!localFollowButtonViewHolder.following)
    {
      this.mAppController.followUser(this.mAppController.getActiveSession(), localFollowButtonViewHolder.userId, true);
      this.mFriendships.addFollowing(localFollowButtonViewHolder.userId);
      this.mCursorAdapter.notifyDataSetChanged();
      this.mNewFollowsCount = (1 + this.mNewFollowsCount);
      return;
    }
    this.mAppController.unfollowUser(this.mAppController.getActiveSession(), localFollowButtonViewHolder.userId, true);
    this.mFriendships.removeFollowing(localFollowButtonViewHolder.userId);
    this.mCursorAdapter.notifyDataSetChanged();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    StyleSpan[] arrayOfStyleSpan = new StyleSpan[1];
    arrayOfStyleSpan[0] = new StyleSpan(1);
    this.mBold = arrayOfStyleSpan;
    if (paramBundle != null)
    {
      if (paramBundle.containsKey("fetch"))
        this.mFetched = paramBundle.getBoolean("fetch");
      if (paramBundle.containsKey("friendships"))
        this.mFriendships = ((Friendships)paramBundle.getParcelable("friendships"));
      if (paramBundle.containsKey("safe"))
        this.mSafeToLoad = paramBundle.getBoolean("safe");
    }
    while (true)
    {
      if (!this.mSafeToLoad)
        this.mAppController.removeUsers(this.mAppController.getActiveSession(), 6);
      this.mTwitter = new Twitter(TwitterVineApp.API_KEY, TwitterVineApp.API_SECRET);
      this.mAppSessionListener = new FriendsListener();
      return;
      this.mFriendships = new Friendships();
    }
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), ContentUris.withAppendedId(Vine.UserGroupsView.CONTENT_URI_FIND_FRIENDS_TWITTER, this.mAppController.getActiveId()), this.mProjection, null, null, this.mSortOrder);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903092, paramViewGroup, false);
    this.mListView = ((ListView)localView.findViewById(16908298));
    this.mListView.setEmptyView(localView.findViewById(16908292));
    this.mListView.setOnItemClickListener(this);
    Button localButton = (Button)localView.findViewById(2131361939);
    localButton.setText(Util.getSpannedText(this.mBold, getString(2131624125), '"'));
    localButton.setOnClickListener(this);
    return localView;
  }

  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if ((paramView.getTag() instanceof UserViewHolder))
      startProfileActivity(((UserViewHolder)paramView.getTag()).userId);
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    if ((this.mCursorAdapter.isEmpty()) && (!this.mFetched))
      return;
    hideProgress(3);
  }

  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
    this.mCursorAdapter.swapCursor(null);
  }

  public void onMoveAway(int paramInt)
  {
    super.onMoveAway(paramInt);
    if (this.mFetched)
      if (this.mNewFollowsCount <= 15)
        break label35;
    label35: for (String str = ">15"; ; str = String.valueOf(this.mNewFollowsCount))
    {
      FlurryUtils.trackTwitterNewFollowingCount(str);
      this.mNewFollowsCount = 0;
      return;
    }
  }

  public void onResume()
  {
    super.onResume();
    if ((this.mSafeToLoad) && (this.mCursorAdapter.getCursor() == null))
    {
      initLoader();
      return;
    }
    dismissDialog();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("fetch", this.mFetched);
    paramBundle.putParcelable("friendships", this.mFriendships);
    paramBundle.putBoolean("safe", this.mSafeToLoad);
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    View localView = LayoutInflater.from(getActivity()).inflate(2130903101, null);
    this.mListView.addHeaderView(localView);
    ((TextView)localView.findViewById(2131361957)).setText(2131624128);
  }

  class FriendsListener extends AppSessionListener
  {
    FriendsListener()
    {
    }

    public void onFollowComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((paramString1 != null) && (paramInt != 200))
        FindFriendsTwitterFragment.this.mFriendships.removeFollowing(paramLong);
    }

    public void onGetTwitterFriendsComplete(String paramString1, int paramInt1, String paramString2, int paramInt2)
    {
      FindFriendsTwitterFragment.this.dismissDialog();
      if ((paramString1 != null) && (paramInt1 == 200))
      {
        FlurryUtils.trackFindFriendsTwitterCount(paramInt2);
        return;
      }
      FlurryUtils.trackFindFriendsTwitterFailure();
      Util.showCenteredToast(FindFriendsTwitterFragment.this.getActivity(), 2131624126);
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      ((UsersAdapter)FindFriendsTwitterFragment.this.mCursorAdapter).setUserImages(paramHashMap);
    }

    public void onRemoveUsersComplete(String paramString)
    {
      FindFriendsTwitterFragment.access$002(FindFriendsTwitterFragment.this, true);
      FindFriendsTwitterFragment.this.initLoader();
    }

    public void onUnFollowComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((paramString1 != null) && (paramInt != 200))
        FindFriendsTwitterFragment.this.mFriendships.addFollowing(paramLong);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.FindFriendsTwitterFragment
 * JD-Core Version:    0.6.2
 */