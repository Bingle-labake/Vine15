package co.vine.android;

import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import co.vine.android.client.AppSessionListener;
import co.vine.android.widget.GenericTimelineAdapter;

public class SingleFragment extends BaseTimelineFragment
{
  private static final String EVENT_SOURCE_TITLE = "Single Post";
  private final SingleFragmentWrapper mWrapper = new SingleFragmentWrapper();

  private void fetchPostId(int paramInt)
  {
    if (!this.mWrapper.isLocked())
      addRequest(this.mWrapper.fetchPostId(), paramInt);
  }

  protected void fetchContent(int paramInt, boolean paramBoolean)
  {
  }

  protected void fetchPostContent(int paramInt)
  {
    if (!this.mWrapper.isLocked())
      addRequest(this.mWrapper.fetchPostContent(), paramInt);
  }

  protected String fetchPosts(int paramInt, boolean paramBoolean)
  {
    throw new IllegalStateException("Cannot fetch on single post");
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (!this.mWrapper.isLocked())
      this.mListView.setAdapter(this.mFeedAdapter);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (this.mWrapper.onCreate(this, new SinglePostListener()))
      setFocused(true);
    this.mFlurryEventSource = "Single Post";
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return this.mWrapper.onCreateLoader();
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (this.mWrapper.isLocked())
      return this.mWrapper.onCreateLockedView(createView(paramLayoutInflater, 2130903112, paramViewGroup), this);
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }

  public void onPause()
  {
    super.onPause();
    this.mFeedAdapter.onPause(isFocused());
    this.mWrapper.onPause();
  }

  public void onResume()
  {
    super.onResume();
    if (this.mWrapper.onResume())
    {
      this.mFeedAdapter.onResume(isFocused());
      if (this.mCursorAdapter.getCursor() == null)
        initLoader();
      if (!this.mFetched)
      {
        if (this.mWrapper.getPostId() <= 0L)
          break label64;
        fetchPostContent(3);
      }
    }
    label64: 
    while (this.mWrapper.getSharedId() == null)
      return;
    fetchPostId(3);
  }

  class SinglePostListener extends AppSessionListener
  {
    SinglePostListener()
    {
    }

    public void onGetPostIdComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      SingleFragment.this.mWrapper.onGetPostIdComplete(paramLong);
      SingleFragment.this.fetchPostContent(3);
    }

    public void onGetSinglePostComplete(String paramString1, int paramInt, String paramString2)
    {
      SingleFragment.this.mFetched = true;
      SingleFragment.this.restartLoader();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SingleFragment
 * JD-Core Version:    0.6.2
 */