package co.vine.android.widget;

import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import co.vine.android.api.VinePost;
import co.vine.android.player.SensitiveImageClickListener;
import co.vine.android.util.image.ImageKey;

public abstract class GenericFeedViewHolder
{
  public ImageKey avatarKey;
  public ImageButton comment;
  public LinearLayout commentList;
  public int commentType;
  public TextView comments1;
  public TextView comments2;
  public TextView comments3;
  public TextView comments4;
  public TextView comments5;
  public RelativeLayout commentsContainer;
  public RelativeLayout compactLikesCommentsContainer;
  public TextView compactLikesCommentsCounts;
  public TextView compactRevinersCount;
  public View compactRevinersDivider;
  public TextView description;
  public boolean hasVideoImage;
  public SensitiveImageClickListener imageListener;
  public boolean isVideoImageLoaded;
  public int likeType;
  public ImageButton liked;
  public TextView likers;
  public RelativeLayout likersContainer;
  public TextView location;
  public RelativeLayout locationContainer;
  public ImageView locationIcon;
  public ImageView more;
  public TextView olderComments;
  public RelativeLayout olderCommentsContainer;
  public int position;
  public VinePost post;
  public ImageButton revine;
  public RelativeLayout revineContainer;
  public TextView revineLine;
  public TextView reviners;
  public RelativeLayout revinersContainer;
  public LinearLayout sensitiveTextContainer;
  public TextView timestamp;
  public ImageView userImage;
  public TextView username;
  public ImageKey videoImageKey;
  public ProgressBar videoLoadImage;

  public GenericFeedViewHolder(View paramView)
  {
    this.description = ((TextView)paramView.findViewById(2131361987));
    this.username = ((TextView)paramView.findViewById(2131361962));
    this.location = ((TextView)paramView.findViewById(2131361990));
    this.locationIcon = ((ImageView)paramView.findViewById(2131361989));
    this.timestamp = ((TextView)paramView.findViewById(2131361885));
    this.userImage = ((ImageView)paramView.findViewById(2131361873));
    this.comment = ((ImageButton)paramView.findViewById(2131362013));
    this.likers = ((TextView)paramView.findViewById(2131361993));
    this.reviners = ((TextView)paramView.findViewById(2131361996));
    this.commentList = ((LinearLayout)paramView.findViewById(2131362001));
    this.olderComments = ((TextView)paramView.findViewById(2131362000));
    this.likersContainer = ((RelativeLayout)paramView.findViewById(2131361991));
    this.revinersContainer = ((RelativeLayout)paramView.findViewById(2131361994));
    this.commentsContainer = ((RelativeLayout)paramView.findViewById(2131361997));
    this.olderCommentsContainer = ((RelativeLayout)paramView.findViewById(2131361999));
    this.videoLoadImage = ((ProgressBar)paramView.findViewById(2131361877));
    this.locationContainer = ((RelativeLayout)paramView.findViewById(2131361988));
    this.sensitiveTextContainer = ((LinearLayout)paramView.findViewById(2131361981));
    this.liked = ((ImageButton)paramView.findViewById(2131362012));
    this.more = ((ImageView)paramView.findViewById(2131362015));
    this.comments1 = ((TextView)paramView.findViewById(2131362002));
    this.comments2 = ((TextView)paramView.findViewById(2131362003));
    this.comments3 = ((TextView)paramView.findViewById(2131362004));
    this.comments4 = ((TextView)paramView.findViewById(2131362005));
    this.comments5 = ((TextView)paramView.findViewById(2131362006));
    this.compactLikesCommentsContainer = ((RelativeLayout)paramView.findViewById(2131362007));
    this.compactLikesCommentsCounts = ((TextView)paramView.findViewById(2131362009));
    this.revineContainer = ((RelativeLayout)paramView.findViewById(2131361983));
    this.revineLine = ((TextView)paramView.findViewById(2131361985));
    this.revine = ((ImageButton)paramView.findViewById(2131362014));
    this.compactRevinersCount = ((TextView)paramView.findViewById(2131362011));
    this.compactRevinersDivider = paramView.findViewById(2131362010);
  }

  public abstract View getViewForVideoImage();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.GenericFeedViewHolder
 * JD-Core Version:    0.6.2
 */