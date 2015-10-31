package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.ContentUris;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ListView;
import android.widget.RelativeLayout;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.provider.Vine.PostCommentsLikesView;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.widget.GenericTimelineAdapter;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;

public class HomeTimelineFragment extends BaseTimelineFragment
  implements PromptDialogSupportFragment.OnDialogDoneListener
{
  private static final int DIALOG_ADD_WIDGET = 992;
  private static final String EVENT_SOURCE_TITLE = "Home Timeline";
  public static final String PREF_INVITE_BANNER_CLICKED = "inviteBannerWasClicked";
  public static final String PREF_INVITE_BANNER_VIEW_COUNT = "inviteBannerViewCount";
  public static final int REQUEST_FIND_FRIENDS = 0;
  public static final int REQUEST_SETTINGS = 1;
  private RelativeLayout mInviteBanner;

  protected String fetchPosts(int paramInt, boolean paramBoolean)
  {
    this.mAppController.fetchPendingNotificationCount(this.mAppController.getActiveSession());
    return this.mAppController.fetchPosts(this.mAppController.getActiveSession(), 10, this.mAppController.getActiveId(), 1, paramInt, paramBoolean, String.valueOf(this.mAppController.getActiveId()), null, null);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.mListView.setAdapter(this.mFeedAdapter);
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(getActivity());
    if (!localSharedPreferences.getBoolean("inviteBannerWasClicked", false));
    try
    {
      RelativeLayout localRelativeLayout = (RelativeLayout)LayoutInflater.from(getActivity()).inflate(2130903099, this.mListView, false);
      this.mInviteBanner = ((RelativeLayout)localRelativeLayout.findViewById(2131361955));
      this.mInviteBanner.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          FlurryUtils.trackVisitFindFriends("InviteBanner");
          Intent localIntent = new Intent(HomeTimelineFragment.this.getActivity(), FindFriendsActivity.class);
          HomeTimelineFragment.this.getActivity().startActivityForResult(localIntent, 0);
        }
      });
      setRefreshableHeaderOffset(6);
      addHeaderView(localRelativeLayout, null, true);
      l = 1L + localSharedPreferences.getLong("inviteBannerViewCount", 0L);
      localSharedPreferences.edit().putLong("inviteBannerViewCount", l).commit();
      if ((l < 10L) && (l % 5L == 0L))
      {
        FlurryUtils.trackInviteBannerViewed(l);
        FragmentActivity localFragmentActivity = getActivity();
        AccountManager localAccountManager = AccountManager.get(localFragmentActivity);
        Account localAccount = VineAccountHelper.getAccount(localFragmentActivity, this.mAppController.getActiveSession().getLoginEmail());
        if ((localAccount != null) && (AppImpl.getInstance().doAddWidget(localFragmentActivity, localAccountManager, localAccount)) && (!BuildUtil.isAmazon()))
        {
          VineAccountHelper.setAddWidget(localAccountManager, localAccount);
          PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(992);
          localPromptDialogSupportFragment.setTitle(2131624000);
          localPromptDialogSupportFragment.setMessage(2131623999);
          localPromptDialogSupportFragment.setNegativeButton(2131624018);
          localPromptDialogSupportFragment.setPositiveButton(2131624002);
          localPromptDialogSupportFragment.setListener(this);
          localPromptDialogSupportFragment.show(localFragmentActivity.getSupportFragmentManager());
        }
        return;
      }
    }
    catch (Exception localException)
    {
      while (true)
      {
        long l;
        CrashUtil.logException(localException, "Failed to show invite banner, which is ok.", new Object[0]);
        localSharedPreferences.edit().putBoolean("inviteBannerWasClicked", true).commit();
        continue;
        if (l % 10L != 0L);
      }
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if ((paramInt1 == 1) && (paramInt2 == 1))
      this.mFetched = false;
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mFlurryEventSource = "Home Timeline";
    setFocused(true);
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    Uri.Builder localBuilder = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE, this.mAppController.getActiveId()).buildUpon();
    localBuilder.appendQueryParameter("limit", String.valueOf(this.mCursorQuerySize));
    return new CursorLoader(getActivity(), localBuilder.build(), null, null, null, null);
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 992:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -2:
      paramDialogInterface.dismiss();
      return;
    case -1:
    }
    AppImpl.getInstance().setupWidget(getActivity());
    paramDialogInterface.dismiss();
  }

  public void onPause()
  {
    super.onPause();
    this.mFeedAdapter.onPause(isFocused());
  }

  public void onResume()
  {
    super.onResume();
    this.mFeedAdapter.onResume(isFocused());
    this.mFeedAdapter.startLoadingTimeProfiling("HomeTimelineFragment");
    if (this.mCursorAdapter.getCursor() == null)
      initLoader();
    while (!this.mCursorAdapter.isEmpty())
      return;
    fetchContent(3, true);
  }

  public void removeHeader()
  {
    if (this.mInviteBanner != null)
    {
      this.mInviteBanner.setVisibility(8);
      setRefreshableHeaderOffset(0);
    }
  }

  protected boolean trackNewCount()
  {
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.HomeTimelineFragment
 * JD-Core Version:    0.6.2
 */