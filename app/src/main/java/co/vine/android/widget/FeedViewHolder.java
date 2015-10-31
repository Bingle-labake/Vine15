package co.vine.android.widget;

import android.view.View;
import android.widget.ImageView;
import co.vine.android.player.OnListVideoClickListener;
import co.vine.android.player.SdkVideoView;

public class FeedViewHolder extends GenericFeedViewHolder
{
  public OnListVideoClickListener listener;
  public ImageView videoImage;
  public SdkVideoView videoView;

  public FeedViewHolder(View paramView)
  {
    super(paramView);
    this.videoImage = ((ImageView)paramView.findViewById(2131361974));
  }

  public View getViewForVideoImage()
  {
    return this.videoImage;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.FeedViewHolder
 * JD-Core Version:    0.6.2
 */