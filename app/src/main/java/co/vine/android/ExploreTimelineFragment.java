package co.vine.android;

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

public class ExploreTimelineFragment extends BaseTimelineFragment
{
  public static final String ARG_CATEGORY = "category";
  public static final String ARG_DATA = "data";
  public static final String ARG_TAG = "tag";
  public static final String CATEGORY_ON_THE_RISE = "trending-people";
  public static final String CATEGORY_POPULAR_NOW = "popular-now";
  public static final String CATEGORY_TAG = "tag";
  public static final String CATEGORY_TIMELINES = "timelines";
  private static final String EVENT_SOURCE_TITLE = "Explore Timeline: ";
  private String mCategory;
  private Uri mData;
  private String mTag;

  public static Bundle prepareArguments(Intent paramIntent, boolean paramBoolean, String paramString1, String paramString2, Uri paramUri)
  {
    Bundle localBundle = BaseListFragment.prepareArguments(paramIntent, paramBoolean);
    localBundle.putString("category", paramString1);
    localBundle.putString("tag", paramString2);
    localBundle.putParcelable("data", paramUri);
    return localBundle;
  }

  protected String fetchPosts(int paramInt, boolean paramBoolean)
  {
    int i;
    if ("trending-people".equals(this.mCategory))
      i = 4;
    while (true)
    {
      return this.mAppController.fetchPosts(this.mAppController.getActiveSession(), 10, this.mAppController.getActiveId(), i, paramInt, paramBoolean, this.mTag, null, this.mData);
      if ("popular-now".equals(this.mCategory))
      {
        i = 5;
      }
      else if ("tag".equals(this.mCategory))
      {
        if (this.mTag == null)
          throw new IllegalArgumentException("You have to specify a tag.");
        i = 6;
      }
      else
      {
        if (!"timelines".equals(this.mCategory))
          break;
        i = 11;
      }
    }
    throw new IllegalArgumentException("You have to specify a category.");
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.mFeedAdapter.setCompactLikesComments(true);
    this.mListView.setAdapter(this.mFeedAdapter);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Bundle localBundle = getArguments();
    this.mCategory = localBundle.getString("category");
    this.mData = ((Uri)localBundle.getParcelable("data"));
    this.mTag = localBundle.getString("tag");
    this.mFlurryEventSource = ("Explore Timeline: " + this.mCategory);
    setFocused(true);
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    long l = this.mAppController.getActiveId();
    Uri.Builder localBuilder;
    if ("trending-people".equals(this.mCategory))
      localBuilder = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_ON_THE_RISE, l).buildUpon();
    while (true)
    {
      localBuilder.appendQueryParameter("limit", String.valueOf(this.mCursorQuerySize));
      return new CursorLoader(getActivity(), localBuilder.build(), null, null, null, null);
      if ("popular-now".equals(this.mCategory))
      {
        localBuilder = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_POPULAR_NOW, l).buildUpon();
      }
      else if ("tag".equals(this.mCategory))
      {
        if (this.mTag == null)
          throw new IllegalArgumentException("You have to specify a tag.");
        localBuilder = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_TAG, l).buildUpon();
        localBuilder.appendQueryParameter("tag_name", this.mTag);
      }
      else
      {
        if (!"timelines".equals(this.mCategory))
          break;
        localBuilder = ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ARBITRARY_TIMELINE, l).buildUpon();
        this.mTag = Uri.encode(this.mData.getPath());
        localBuilder.appendQueryParameter("tag_name", this.mTag);
      }
    }
    throw new IllegalArgumentException("You have to specify a category.");
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
    this.mFeedAdapter.startLoadingTimeProfiling("ExploreTimeline");
    if (this.mCursorAdapter.getCursor() == null)
      initLoader();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ExploreTimelineFragment
 * JD-Core Version:    0.6.2
 */