package co.vine.android.widget;

import android.view.View;
import co.vine.android.player.OldSdkVideoView;

public class SingleExploreFeedViewHolder extends GenericFeedViewHolder
{
  public final OldSdkVideoView videoView;

  public SingleExploreFeedViewHolder(View paramView)
  {
    super(paramView);
    this.videoView = ((OldSdkVideoView)paramView.findViewById(2131361878));
  }

  public View getViewForVideoImage()
  {
    return this.videoView;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.SingleExploreFeedViewHolder
 * JD-Core Version:    0.6.2
 */