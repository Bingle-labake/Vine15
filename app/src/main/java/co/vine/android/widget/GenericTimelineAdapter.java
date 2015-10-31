package co.vine.android.widget;

import android.app.Activity;
import android.view.View;
import android.widget.ListView;
import co.vine.android.BaseTimelineFragment;
import co.vine.android.LikeCache;
import co.vine.android.RevineCache;
import co.vine.android.ViewOffsetResolver;
import com.edisonwang.android.slog.SLog;

public abstract class GenericTimelineAdapter<T extends GenericFeedViewHolder> extends GenericVideoAdapter<T>
{
  protected final ListView mListView;
  protected final BaseTimelineFragment mTimelineFragment;

  public GenericTimelineAdapter(Activity paramActivity, ListView paramListView, LikeCache paramLikeCache, RevineCache paramRevineCache, BaseTimelineFragment paramBaseTimelineFragment, String paramString)
  {
    super(paramActivity, paramLikeCache, paramRevineCache, paramBaseTimelineFragment, paramBaseTimelineFragment, paramString);
    this.mListView = paramListView;
    this.mListView.setOnScrollListener(paramBaseTimelineFragment);
    this.mListView.setDivider(null);
    this.mTimelineFragment = paramBaseTimelineFragment;
  }

  public View getViewAtPosition(int paramInt)
  {
    ListView localListView = this.mListView;
    ViewOffsetResolver localViewOffsetResolver = this.mViewOffsetResolver;
    int i = 0;
    if (localViewOffsetResolver != null)
      i = this.mViewOffsetResolver.getOffset(this);
    int j = localListView.getHeaderViewsCount();
    int k = localListView.getFirstVisiblePosition() - j - i;
    int m = paramInt - k;
    if ((m < 0) || (m >= localListView.getChildCount()))
    {
      if (SLog.sLogsOn)
      {
        Object[] arrayOfObject1 = new Object[4];
        arrayOfObject1[0] = Integer.valueOf(paramInt);
        arrayOfObject1[1] = Integer.valueOf(m);
        arrayOfObject1[2] = Integer.valueOf(k);
        arrayOfObject1[3] = Integer.valueOf(localListView.getChildCount());
        SLog.w("Unable to get view for desired position, because it's not being displayed on screen: {} {} {} {}.", arrayOfObject1);
      }
      return null;
    }
    if (SLog.sLogsOn)
    {
      Object[] arrayOfObject2 = new Object[4];
      arrayOfObject2[0] = Integer.valueOf(paramInt);
      arrayOfObject2[1] = Integer.valueOf(m);
      arrayOfObject2[2] = Integer.valueOf(k);
      arrayOfObject2[3] = Integer.valueOf(localListView.getChildCount());
      SLog.d("Get view for desired position: {} {} {} {}.", arrayOfObject2);
    }
    return localListView.getChildAt(m);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.GenericTimelineAdapter
 * JD-Core Version:    0.6.2
 */