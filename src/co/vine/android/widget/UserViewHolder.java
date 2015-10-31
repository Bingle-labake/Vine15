package co.vine.android.widget;

import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import co.vine.android.util.image.ImageKey;

public class UserViewHolder
{
  public ImageKey avatarUrl;
  public TextView bio;
  public ImageButton followButton;
  public ImageView image;
  public TextView location;
  public long userId;
  public TextView username;
  public ImageView verified;

  public UserViewHolder(View paramView)
  {
    this.username = ((TextView)paramView.findViewById(2131361962));
    this.bio = ((TextView)paramView.findViewById(2131362180));
    this.location = ((TextView)paramView.findViewById(2131362181));
    this.followButton = ((ImageButton)paramView.findViewById(2131362177));
    this.image = ((ImageView)paramView.findViewById(2131361873));
    this.verified = ((ImageView)paramView.findViewById(2131362179));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.UserViewHolder
 * JD-Core Version:    0.6.2
 */