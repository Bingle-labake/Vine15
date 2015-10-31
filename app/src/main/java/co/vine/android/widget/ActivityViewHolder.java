package co.vine.android.widget;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import co.vine.android.util.image.ImageKey;

public class ActivityViewHolder
{
  public TextView byline;
  public TextView contentLine;
  public boolean isLocked;
  public long postId;
  public ImageKey targetImageKey;
  public ImageView targetUserImage;
  public int type;
  public long userId;
  public ImageView userImage;
  public ImageKey userImageKey;
  public ImageView userImageOverlay;
  public String username;

  public ActivityViewHolder(View paramView)
  {
    this.userImage = ((ImageView)paramView.findViewById(2131361873));
    this.userImageOverlay = ((ImageView)paramView.findViewById(2131361875));
    this.contentLine = ((TextView)paramView.findViewById(2131361870));
    this.byline = ((TextView)paramView.findViewById(2131361871));
    this.targetUserImage = ((ImageView)paramView.findViewById(2131361874));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.ActivityViewHolder
 * JD-Core Version:    0.6.2
 */