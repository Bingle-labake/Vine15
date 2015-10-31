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
import co.vine.android.provider.Vine.TagSearchResults;
import co.vine.android.provider.VineDatabaseHelper;
import co.vine.android.provider.VineDatabaseSQL.TagsQuery;
import co.vine.android.util.Util;
import co.vine.android.widget.TagViewHolder;
import java.util.concurrent.ExecutorService;

public class TagSearchFragment extends BaseSearchFragment
{
  public void cleanSearchResults()
  {
    this.mExecutor.execute(new Runnable()
    {
      public void run()
      {
        TagSearchFragment.this.mDbHelper.cleanTagSearchResults();
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
      String str = this.mAppController.searchTags(this.mEncodedQueryString, i);
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
    return 3;
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (this.mCursorAdapter == null)
    {
      this.mProjection = VineDatabaseSQL.TagsQuery.PROJECTION;
      this.mSortOrder = "_id ASC";
      this.mCursorAdapter = new TagsAdapter(getActivity(), this.mAppController, 0);
    }
    this.mListView.setAdapter(this.mCursorAdapter);
    this.mAppSessionListener = new TagSearchSessionListener(null);
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), Vine.TagSearchResults.CONTENT_URI, this.mProjection, null, null, this.mSortOrder);
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    Object localObject = paramView.getTag();
    if ((localObject instanceof TagViewHolder))
    {
      TagViewHolder localTagViewHolder = (TagViewHolder)localObject;
      startActivity(ExploreVideoListActivity.getIntent(getActivity(), "tag", localTagViewHolder.tagName));
    }
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    hideProgress(3);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    if ((paramCursor.getInt(4) == 0) && (paramCursor.getCount() <= 400))
      fetchContent(1);
  }

  public void performSearch()
  {
    hideSearchHint();
    cleanSearchResults();
    fetchContent(3);
  }

  private class TagSearchSessionListener extends AppSessionListener
  {
    private TagSearchSessionListener()
    {
    }

    public void onTagSearchComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, int paramInt4)
    {
      PendingRequest localPendingRequest = TagSearchFragment.this.removeRequest(paramString1);
      if (localPendingRequest != null)
      {
        TagSearchFragment.this.hideProgress(localPendingRequest.fetchType);
        switch (paramInt1)
        {
        default:
          if (TextUtils.isEmpty(paramString2))
            paramString2 = TagSearchFragment.this.getString(2131624103);
          Util.showCenteredToast(TagSearchFragment.this.getActivity(), paramString2);
        case 200:
        }
      }
      do
        return;
      while (paramInt2 >= 1);
      TagSearchFragment.this.cleanSearchResults();
      TagSearchFragment.this.showSadface(true, false);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.TagSearchFragment
 * JD-Core Version:    0.6.2
 */