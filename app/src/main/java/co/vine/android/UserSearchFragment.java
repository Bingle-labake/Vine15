package co.vine.android;

import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.text.TextUtils;
import android.view.View;
import android.widget.ListView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.provider.Vine.UserGroupsView;
import co.vine.android.provider.VineDatabaseHelper;
import co.vine.android.provider.VineDatabaseSQL.UsersQuery;
import co.vine.android.service.PendingAction;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;

public class UserSearchFragment extends BaseSearchFragment
{
  private static final String EVENT_SOURCE_TITLE = "User Search Results";

  public void cleanSearchResults()
  {
    this.mExecutor.execute(new Runnable()
    {
      public void run()
      {
        UserSearchFragment.this.mDbHelper.cleanUserSearchResults();
      }
    });
  }

  protected void fetchContent(int paramInt)
  {
    if (hasPendingRequest(paramInt))
      return;
    int i;
    switch (paramInt)
    {
    default:
      i = 1;
    case 3:
    case 2:
    case 4:
    case 1:
    }
    while (true)
    {
      String str = this.mAppController.searchUsers(this.mEncodedQueryString, i);
      if (str == null)
        break;
      showProgress(paramInt);
      addRequest(str, paramInt);
      return;
      i = 1;
      continue;
      i = 2;
      continue;
      i = 3;
    }
  }

  public int getMinimumSearchQueryLength()
  {
    return 2;
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (this.mCursorAdapter == null)
    {
      this.mProjection = VineDatabaseSQL.UsersQuery.PROJECTION;
      this.mSortOrder = "order_id DESC";
      this.mCursorAdapter = new UsersAdapter(getActivity(), this.mAppController, false, this, null, 0);
    }
    this.mListView.setAdapter(this.mCursorAdapter);
    this.mAppSessionListener = new UserSearchSessionListener(null);
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), Vine.UserGroupsView.CONTENT_URI_USER_SEARCH_RESULTS, this.mProjection, null, null, this.mSortOrder);
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    if (paramLong > 0L)
      ProfileActivity.start(getActivity(), paramLong, "User Search Results");
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    hideProgress(3);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    if ((paramCursor.getInt(17) == 0) && (paramCursor.getCount() <= 400))
      fetchContent(1);
  }

  public void performSearch()
  {
    hideSearchHint();
    cleanSearchResults();
    fetchContent(3);
  }

  private class UserSearchSessionListener extends AppSessionListener
  {
    private UserSearchSessionListener()
    {
    }

    public void onCaptchaRequired(String paramString1, String paramString2, PendingAction paramPendingAction)
    {
      if (UserSearchFragment.this.removeRequest(paramString1) != null)
      {
        UserSearchFragment.this.mPendingCaptchaRequest = new PendingCaptchaRequest(paramString1, paramPendingAction.actionCode, paramPendingAction.bundle);
        UserSearchFragment.this.showCaptcha(paramString1, paramString2);
      }
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      ((UsersAdapter)UserSearchFragment.this.mCursorAdapter).setUserImages(paramHashMap);
    }

    public void onUserSearchComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, int paramInt4)
    {
      PendingRequest localPendingRequest = UserSearchFragment.this.removeRequest(paramString1);
      if (localPendingRequest != null)
      {
        UserSearchFragment.this.hideProgress(localPendingRequest.fetchType);
        switch (paramInt1)
        {
        default:
          if (TextUtils.isEmpty(paramString2))
            paramString2 = UserSearchFragment.this.getString(2131624103);
          Util.showCenteredToast(UserSearchFragment.this.getActivity(), paramString2);
        case 200:
        }
      }
      do
        return;
      while (paramInt2 >= 1);
      UserSearchFragment.this.cleanSearchResults();
      UserSearchFragment.this.showSadface(true, false);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UserSearchFragment
 * JD-Core Version:    0.6.2
 */