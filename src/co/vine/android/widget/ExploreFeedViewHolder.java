package co.vine.android.widget;

import android.view.View;
import android.widget.ImageView;

public class ExploreFeedViewHolder extends GenericFeedViewHolder
{
  public ImageView videoImage;

  public ExploreFeedViewHolder(View paramView)
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
 * Qualified Name:     co.vine.android.widget.ExploreFeedViewHolder
 * JD-Core Version:    0.6.2
 */