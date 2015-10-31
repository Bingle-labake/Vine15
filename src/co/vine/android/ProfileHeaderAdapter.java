package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.text.Spannable;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.FollowStateButton;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.StyledClickableSpan;
import co.vine.android.widget.TabButton;
import java.util.HashMap;

public class ProfileHeaderAdapter extends BaseAdapter
{
  private AppController mAppController;
  private boolean mBlocked;
  private Context mContext;
  private String mFollowEventSource;
  private boolean mHideProfileReposts;
  private ProfileViewHolder mHolder;
  private View.OnClickListener mListener;
  private boolean mLocked;
  private SpanClickListener mProfileSpanClickListener;
  private VineUser mUser;
  private Object[] mWhite;

  public ProfileHeaderAdapter(Context paramContext, AppController paramAppController, View.OnClickListener paramOnClickListener, SpanClickListener paramSpanClickListener, boolean paramBoolean1, boolean paramBoolean2, String paramString, boolean paramBoolean3)
  {
    if (!(paramOnClickListener instanceof View.OnLongClickListener))
      throw new IllegalArgumentException("Param \"listener\" must implement both View.OnClickListener and View.OnLongClickListener");
    this.mContext = paramContext;
    this.mListener = paramOnClickListener;
    this.mAppController = paramAppController;
    Resources localResources = paramContext.getResources();
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = new ForegroundColorSpan(localResources.getColor(2131296358));
    this.mWhite = arrayOfObject;
    this.mProfileSpanClickListener = paramSpanClickListener;
    this.mLocked = paramBoolean1;
    this.mBlocked = paramBoolean2;
    this.mFollowEventSource = paramString;
    this.mHideProfileReposts = paramBoolean3;
  }

  private void setImage(ImageView paramImageView, Bitmap paramBitmap)
  {
    if (paramBitmap == null)
    {
      if ((this.mUser != null) && (this.mUser.userId == this.mAppController.getActiveId()))
      {
        paramImageView.setImageResource(2130837622);
        return;
      }
      paramImageView.setImageDrawable(this.mContext.getResources().getDrawable(2130837612));
      return;
    }
    paramImageView.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
  }

  public void bindUser(VineUser paramVineUser)
  {
    ProfileViewHolder localProfileViewHolder;
    Resources localResources;
    label129: label158: label184: FollowStateButton localFollowStateButton;
    if (this.mHolder != null)
    {
      localProfileViewHolder = this.mHolder;
      localResources = this.mContext.getResources();
      if ((!TextUtils.isEmpty(paramVineUser.avatarUrl)) && (!Util.isDefaultAvatarUrl(paramVineUser.avatarUrl)))
        break label316;
      if (paramVineUser.userId != this.mAppController.getActiveId())
        break label306;
      localProfileViewHolder.imageView.setImageResource(2130837622);
      localProfileViewHolder.imageView.setOnClickListener(this.mListener);
      localProfileViewHolder.imageView.setOnLongClickListener((View.OnLongClickListener)this.mListener);
      localProfileViewHolder.username.setText(paramVineUser.username);
      if (TextUtils.isEmpty(paramVineUser.description))
        break label353;
      localProfileViewHolder.description.setText(paramVineUser.description);
      localProfileViewHolder.description.setVisibility(0);
      if (TextUtils.isEmpty(paramVineUser.location))
        break label365;
      localProfileViewHolder.location.setText(paramVineUser.location);
      localProfileViewHolder.location.setVisibility(0);
      localProfileViewHolder.userId = paramVineUser.userId;
      if (!paramVineUser.isVerified())
        break label377;
      this.mHolder.verified.setVisibility(0);
      localFollowStateButton = localProfileViewHolder.followStateButton;
      if (!this.mBlocked)
        break label392;
      localFollowStateButton.setVisibility(4);
    }
    while (true)
    {
      if (!this.mLocked)
        break label417;
      localProfileViewHolder.posts.setVisibility(8);
      localProfileViewHolder.likes.setVisibility(8);
      localProfileViewHolder.dot.setVisibility(8);
      localProfileViewHolder.followers.setVisibility(8);
      localProfileViewHolder.following.setVisibility(8);
      localProfileViewHolder.profileTabArrow.setVisibility(8);
      localProfileViewHolder.imageFrame.setVisibility(0);
      localProfileViewHolder.progress.setVisibility(8);
      localProfileViewHolder.profileTabArrow.setVisibility(0);
      localProfileViewHolder.profileTabArrow.setOnClickListener(this.mListener);
      this.mUser = paramVineUser;
      return;
      label306: Util.safeSetDefaultAvatar(localProfileViewHolder.imageView);
      break;
      label316: localProfileViewHolder.userImageKey = new ImageKey(paramVineUser.avatarUrl);
      setImage(localProfileViewHolder.imageView, this.mAppController.getPhotoBitmap(localProfileViewHolder.userImageKey));
      break;
      label353: localProfileViewHolder.description.setVisibility(8);
      break label129;
      label365: localProfileViewHolder.location.setVisibility(8);
      break label158;
      label377: this.mHolder.verified.setVisibility(8);
      break label184;
      label392: localFollowStateButton.setUser(this.mAppController.getActiveId(), paramVineUser);
      localFollowStateButton.setOnClickListener(this.mListener);
    }
    label417: TextView localTextView1 = localProfileViewHolder.followers;
    localProfileViewHolder.followers.setVisibility(0);
    Object[] arrayOfObject1 = this.mWhite;
    int i = paramVineUser.followerCount;
    Object[] arrayOfObject2 = new Object[1];
    arrayOfObject2[0] = Util.numberFormat(localResources, paramVineUser.followerCount);
    Spanned localSpanned1 = Util.getSpannedText(arrayOfObject1, localResources.getQuantityString(2131558400, i, arrayOfObject2), '"');
    localTextView1.setText(localSpanned1);
    localTextView1.setMovementMethod(LinkMovementMethod.getInstance());
    Util.safeSetSpan((Spannable)localTextView1.getText(), new StyledClickableSpan(5, null, this.mProfileSpanClickListener), 0, localSpanned1.length(), 33);
    TextView localTextView2 = localProfileViewHolder.following;
    localProfileViewHolder.following.setVisibility(0);
    Object[] arrayOfObject3 = this.mWhite;
    int j = paramVineUser.followingCount;
    Object[] arrayOfObject4 = new Object[1];
    arrayOfObject4[0] = Util.numberFormat(localResources, paramVineUser.followingCount);
    Spanned localSpanned2 = Util.getSpannedText(arrayOfObject3, localResources.getQuantityString(2131558401, j, arrayOfObject4), '"');
    localTextView2.setText(localSpanned2);
    localTextView2.setMovementMethod(LinkMovementMethod.getInstance());
    Util.safeSetSpan((Spannable)localTextView2.getText(), new StyledClickableSpan(6, null, this.mProfileSpanClickListener), 0, localSpanned2.length(), 33);
    localProfileViewHolder.posts.setVisibility(0);
    localProfileViewHolder.likes.setVisibility(0);
    TabButton localTabButton1 = localProfileViewHolder.posts;
    localTabButton1.setSelected(true);
    if (this.mHideProfileReposts);
    for (int k = paramVineUser.authoredPostCount; ; k = paramVineUser.postCount)
    {
      Object[] arrayOfObject5 = new Object[1];
      arrayOfObject5[0] = Util.numberFormat(localResources, k);
      localTabButton1.setText(localResources.getQuantityString(2131558403, k, arrayOfObject5).replace("\"", ""));
      localTabButton1.setOnClickListener(this.mListener);
      TabButton localTabButton2 = localProfileViewHolder.likes;
      int m = paramVineUser.likeCount;
      Object[] arrayOfObject6 = new Object[1];
      arrayOfObject6[0] = Util.numberFormat(localResources, paramVineUser.likeCount);
      localTabButton2.setText(localResources.getQuantityString(2131558402, m, arrayOfObject6).replace("\"", ""));
      localTabButton2.setOnClickListener(this.mListener);
      localProfileViewHolder.dot.setVisibility(0);
      localProfileViewHolder.profileTabArrow.setVisibility(0);
      break;
    }
  }

  public void changeSelectedTab(int paramInt)
  {
    if (this.mHolder == null)
      return;
    switch (paramInt)
    {
    case 2131362057:
    default:
      return;
    case 2131362056:
      this.mHolder.likes.setSelected(false);
      this.mHolder.posts.setSelected(true);
      this.mHolder.profileTabArrow.setVisibility(0);
      return;
    case 2131362058:
    }
    this.mHolder.likes.setSelected(true);
    this.mHolder.posts.setSelected(false);
    this.mHolder.profileTabArrow.setVisibility(8);
  }

  public int getCount()
  {
    return 1;
  }

  public Object getItem(int paramInt)
  {
    return null;
  }

  public long getItemId(int paramInt)
  {
    return 0L;
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView == null)
    {
      paramView = LayoutInflater.from(paramViewGroup.getContext()).inflate(2130903121, paramViewGroup, false);
      this.mHolder = new ProfileViewHolder(paramView);
      this.mHolder.imageFrame.setVisibility(8);
      this.mHolder.progress.setVisibility(0);
      if (this.mUser != null)
        bindUser(this.mUser);
    }
    return paramView;
  }

  public void onImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    if ((this.mHolder != null) && (this.mHolder.userImageKey != null))
    {
      UrlImage localUrlImage = (UrlImage)paramHashMap.get(this.mHolder.userImageKey);
      if (localUrlImage != null)
        setImage(this.mHolder.imageView, localUrlImage.bitmap);
    }
  }

  public void onProfileHeaderClick(View paramView, ProfileFragment paramProfileFragment)
  {
    Context localContext = this.mContext;
    switch (paramView.getId())
    {
    default:
    case 2131362054:
    case 2131362056:
    case 2131362058:
    case 2131361873:
    }
    do
    {
      do
        return;
      while (this.mHolder == null);
      switch (this.mHolder.followStateButton.getState())
      {
      case 4:
      default:
        return;
      case 1:
        FlurryUtils.trackVisitFindFriends("Profile");
        localContext.startActivity(new Intent(localContext, FindFriendsActivity.class));
        return;
      case 3:
        this.mHolder.followStateButton.unfollow();
        paramProfileFragment.addRequest(this.mAppController.unfollowUser(this.mAppController.getActiveSession(), this.mHolder.userId, true));
        FlurryUtils.trackFollow(this.mFollowEventSource);
        return;
      case 2:
      }
      this.mHolder.followStateButton.follow(this.mUser);
      paramProfileFragment.addRequest(this.mAppController.followUser(this.mAppController.getActiveSession(), this.mHolder.userId, true));
      FlurryUtils.trackUnfollow(this.mFollowEventSource);
      return;
      changeSelectedTab(2131362056);
      return;
      changeSelectedTab(2131362058);
      return;
    }
    while (this.mUser == null);
    if (this.mUser.userId == this.mAppController.getActiveId())
    {
      FlurryUtils.trackVisitSettings("Profile");
      localContext.startActivity(new Intent(localContext, SettingsActivity.class));
      return;
    }
    FlurryUtils.trackProfileImageClick(false);
    ImageActivity.start(localContext, this.mUser.avatarUrl, 2131624354);
  }

  public void onProfileHeaderLongClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
    case 2131361873:
    }
    do
      return;
    while ((this.mUser == null) || (this.mUser.userId != this.mAppController.getActiveId()));
    FlurryUtils.trackProfileImageClick(true);
    paramView.performHapticFeedback(0);
    ImageActivity.start(this.mContext, this.mUser.avatarUrl, 2131624354);
  }

  public void updatePostsCount(int paramInt)
  {
    if (this.mHolder != null)
    {
      TabButton localTabButton = this.mHolder.posts;
      Resources localResources = this.mContext.getResources();
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Util.numberFormat(localResources, paramInt);
      localTabButton.setText(localResources.getQuantityString(2131558403, paramInt, arrayOfObject).replace("\"", ""));
    }
  }

  static class ProfileViewHolder
  {
    public TextView description;
    public TextView dot;
    public FollowStateButton followStateButton;
    public TextView followers;
    public TextView following;
    public ImageView imageFrame;
    public ImageView imageView;
    public TabButton likes;
    public TextView location;
    public TabButton posts;
    public ViewGroup profileTabArrow;
    public ProgressBar progress;
    public long userId;
    public ImageKey userImageKey;
    public TextView username;
    public ImageView verified;

    public ProfileViewHolder(View paramView)
    {
      this.imageView = ((ImageView)paramView.findViewById(2131361873));
      this.followStateButton = ((FollowStateButton)paramView.findViewById(2131362054));
      this.username = ((TextView)paramView.findViewById(2131361962));
      this.description = ((TextView)paramView.findViewById(2131362049));
      this.location = ((TextView)paramView.findViewById(2131361990));
      this.followers = ((TextView)paramView.findViewById(2131362051));
      this.following = ((TextView)paramView.findViewById(2131362053));
      this.posts = ((TabButton)paramView.findViewById(2131362056));
      this.likes = ((TabButton)paramView.findViewById(2131362058));
      this.dot = ((TextView)paramView.findViewById(2131362052));
      this.progress = ((ProgressBar)paramView.findViewById(2131362059));
      this.imageFrame = ((ImageView)paramView.findViewById(2131362128));
      this.verified = ((ImageView)paramView.findViewById(2131362048));
      this.profileTabArrow = ((ViewGroup)paramView.findViewById(2131362057));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ProfileHeaderAdapter
 * JD-Core Version:    0.6.2
 */