package co.vine.android.player;

import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;

public class OnVideoListScrollListener
  implements AbsListView.OnScrollListener
{
  private final HasVideoPlayerAdapter adapter;

  public OnVideoListScrollListener(HasVideoPlayerAdapter paramHasVideoPlayerAdapter)
  {
    this.adapter = paramHasVideoPlayerAdapter;
  }

  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    if (paramInt == 0);
    try
    {
      this.adapter.playCurrentPosition();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.OnVideoListScrollListener
 * JD-Core Version:    0.6.2
 */