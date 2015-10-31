package co.vine.android;

import android.app.Activity;
import android.content.ContentUris;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.widget.ListView;
import co.vine.android.client.AppController;
import co.vine.android.provider.Vine.PostCommentsLikesView;
import co.vine.android.widget.GenericTimelineAdapter;
import java.lang.ref.WeakReference;

public class ExploreChannelsFragment extends BaseTimelineFragment
{
  public static final String ARG_CHANNEL_ID = "channelId";
  public static final String ARG_SORT = "sort";
  public static final String ARG_TAG = "tag";
  public static final String CATEGORY_CHANNELS = "channels";
  private static final String EVENT_SOURCE_TITLE = "Explore Channel: ";
  public static final String SORT_POPULAR = "popular";
  public static final String SORT_RECENT = "recent";
  private WeakReference<ExploreChannelsActivity> mCallback;
  private String mChannelId;
  private String mSort;
  private String mTabTag;

  private void handleFocus()
  {
    if ((this.mCallback != null) && (this.mCallback.get() != null))
    {
      if (!((ExploreChannelsActivity)this.mCallback.get()).isShowing(this.mTabTag))
        break label82;
      setFocused(true);
      if (this.mCursorAdapter.isEmpty())
      {
        showProgress(3);
        fetchContent(3, false);
      }
      if (!this.mFeedAdapter.isPlaying())
        this.mFeedAdapter.onResume(true);
    }
    return;
    label82: setFocused(false);
    this.mFeedAdapter.onResume(false);
  }

  public static Bundle prepareArguments(Intent paramIntent, boolean paramBoolean, String paramString1, String paramString2, String paramString3)
  {
    Bundle localBundle = BaseListFragment.prepareArguments(paramIntent, paramBoolean);
    localBundle.putString("channelId", paramString1);
    localBundle.putString("sort", paramString2);
    localBundle.putString("tag", paramString3);
    return localBundle;
  }

  protected String fetchPosts(int paramInt, boolean paramBoolean)
  {
    if (this.mSort.equals("popular"));
    for (int i = 8; ; i = 9)
      return this.mAppController.fetchPosts(this.mAppController.getActiveSession(), 10, this.mAppController.getActiveId(), i, paramInt, paramBoolean, this.mChannelId, this.mSort, null);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.mFeedAdapter.setCompactLikesComments(true);
    this.mListView.setAdapter(this.mFeedAdapter);
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    this.mCallback = new WeakReference((ExploreChannelsActivity)paramActivity);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Bundle localBundle = getArguments();
    this.mChannelId = localBundle.getString("channelId");
    this.mFlurryEventSource = ("Explore Channel: " + this.mChannelId);
    this.mSort = localBundle.getString("sort");
    if (this.mSort == null)
      this.mSort = "popular";
    this.mTabTag = localBundle.getString("tag");
    if (this.mTabTag == null)
      this.mTabTag = "popular";
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    long l = this.mAppController.getActiveId();
    if (Integer.parseInt(this.mChannelId) < 1)
      throw new IllegalArgumentException("You have to specify a channel ID.");
    if ("popular".equals(this.mSort));
    for (Uri localUri = Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_CHANNEL_POPULAR; ; localUri = Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_CHANNEL_RECENT)
    {
      Uri.Builder localBuilder = ContentUris.withAppendedId(localUri, l).buildUpon();
      localBuilder.appendQueryParameter("channel_id", this.mChannelId);
      localBuilder.appendQueryParameter("limit", String.valueOf(this.mCursorQuerySize));
      return new CursorLoader(getActivity(), localBuilder.build(), null, null, null, null);
    }
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    handleFocus();
  }

  public void onPause()
  {
    super.onPause();
    setFocused(false);
    this.mFeedAdapter.onPause(false);
  }

  public void onResume()
  {
    super.onResume();
    handleFocus();
    this.mFeedAdapter.startLoadingTimeProfiling("ExploreChannels");
    if (this.mCursorAdapter.getCursor() == null)
      initLoader();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ExploreChannelsFragment
 * JD-Core Version:    0.6.2
 */