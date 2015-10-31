package co.vine.android.widget;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.os.Bundle;
import android.support.v4.widget.CursorAdapter;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.method.MovementMethod;
import android.util.DisplayMetrics;
import android.util.Pair;
import android.util.SparseArray;
import android.view.Display;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import co.vine.android.LikeCache;
import co.vine.android.RevineCache;
import co.vine.android.ViewOffsetResolver;
import co.vine.android.VineException;
import co.vine.android.api.VineComment;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VineLike;
import co.vine.android.api.VinePagedData;
import co.vine.android.api.VinePost;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.SystemUtil;
import co.vine.android.util.SystemUtil.PrefBooleanState;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoCache;
import co.vine.android.util.video.VideoKey;
import com.edisonwang.android.slog.SLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public abstract class GenericVideoAdapter<T extends GenericFeedViewHolder> extends CursorAdapter
{
  protected static final char COMMA = ',';
  protected static final int COMMENT_TYPE_FEW = 1;
  protected static final int COMMENT_TYPE_MANY = 2;
  private static final int HQ_THRESHOLD = 200;
  protected static final char INTERPUNCT = '·';
  protected static final int LIKE_TYPE_MANY = 3;
  protected static final int LIKE_TYPE_MULTIPLE = 2;
  protected static final int LIKE_TYPE_SINGLE = 1;
  public static final int MANY_LIKES_SPAN = 2;
  protected static final int MAX_COMMENT_ITEMS = 5;
  protected static final int MAX_LIKE_ITEMS = 10;
  protected static final char NEWLINE = '\n';
  public static final int OLDER_COMMENTS_SPAN = 3;
  public static final int REVINED_BY_SPAN = 8;
  public static final int REVINERS_SPAN = 7;
  protected static final char SPACE = ' ';
  protected static final int SPAN_FLAGS = 33;
  public static final int SPAN_FOLLOWERS = 5;
  public static final int SPAN_FOLLOWING = 6;
  public static final int TAG_SPAN = 4;
  public static final int USERNAME_SPAN = 1;
  protected final AppController mAppController;
  protected final SparseArray<Bitmap> mAvatars;
  protected final TypefacesSpan mBoldSpan;
  protected boolean mCompactLikesComments;
  protected final Context mContext;
  protected final Bundle mCursorBundle = new Bundle();
  protected final int mDimen;
  protected final HashSet<Integer> mDismissedWarnings;
  protected final String mFollowEventSource;
  protected LikeCache mLikeCache;
  protected String mLoadingTimeTag;
  private Boolean mNormalVideoPlayable;
  protected RevineCache mRevineCache;
  protected final SpanClickListener mSpanClickListener;
  protected long mStartLoadingTime;
  protected final SparseArray<Bitmap> mThumbnails;
  protected final View.OnClickListener mViewClickListener;
  protected final ArrayList<WeakReference<T>> mViewHolders;
  protected ViewOffsetResolver mViewOffsetResolver;
  protected final int mVineGreen;

  public GenericVideoAdapter(Activity paramActivity, LikeCache paramLikeCache, RevineCache paramRevineCache, View.OnClickListener paramOnClickListener, SpanClickListener paramSpanClickListener, String paramString)
  {
    super(paramActivity, null, 2);
    this.mContext = paramActivity;
    this.mAppController = AppController.getInstance(paramActivity);
    this.mViewClickListener = paramOnClickListener;
    this.mSpanClickListener = paramSpanClickListener;
    this.mThumbnails = new SparseArray();
    this.mAvatars = new SparseArray();
    this.mViewHolders = new ArrayList();
    this.mBoldSpan = new TypefacesSpan(null, Typefaces.get(this.mContext).getContentTypeface(0, 3));
    this.mCompactLikesComments = false;
    this.mDismissedWarnings = new HashSet();
    Display localDisplay = paramActivity.getWindowManager().getDefaultDisplay();
    Point localPoint = Util.getDisplaySize(localDisplay);
    localDisplay.getMetrics(new DisplayMetrics());
    int i = 2 * (int)paramActivity.getResources().getDimension(2131427412);
    this.mDimen = (localPoint.x - i);
    this.mVineGreen = paramActivity.getResources().getColor(2131296374);
    this.mCursorBundle.putBoolean("include_list", false);
    this.mLikeCache = paramLikeCache;
    this.mRevineCache = paramRevineCache;
    this.mFollowEventSource = paramString;
  }

  protected void bindAvatar(GenericFeedViewHolder paramGenericFeedViewHolder)
  {
    VinePost localVinePost = paramGenericFeedViewHolder.post;
    int i = paramGenericFeedViewHolder.position;
    ImageView localImageView = paramGenericFeedViewHolder.userImage;
    if (localVinePost.avatarUrl != null)
    {
      if (Util.isDefaultAvatarUrl(localVinePost.avatarUrl))
        Util.safeSetDefaultAvatar(localImageView);
    }
    else
      return;
    ImageKey localImageKey = new ImageKey(localVinePost.avatarUrl);
    Bitmap localBitmap = (Bitmap)this.mAvatars.get(i);
    if (localBitmap != null)
      setImage(localImageView, localBitmap);
    while (true)
    {
      paramGenericFeedViewHolder.avatarKey = localImageKey;
      return;
      setImage(localImageView, this.mAppController.getPhotoBitmap(localImageKey));
    }
  }

  protected VinePost bindCursorToPost(Cursor paramCursor)
  {
    paramCursor.respond(this.mCursorBundle);
    return (VinePost)paramCursor.getExtras().getParcelable("post");
  }

  protected void bindVideoImage(T paramT)
  {
    boolean bool1 = true;
    while (true)
    {
      int i;
      ImageKey localImageKey;
      try
      {
        VinePost localVinePost = paramT.post;
        i = paramT.position;
        boolean bool2;
        if (localVinePost.thumbnailUrl != null)
        {
          bool2 = bool1;
          paramT.hasVideoImage = bool2;
          if ((localVinePost.isExplicit()) && (!this.mDismissedWarnings.contains(Integer.valueOf(i))))
          {
            if (!bool1)
              continue;
            paramT.sensitiveTextContainer.setVisibility(0);
            createSensitiveLisenter(paramT);
          }
        }
        else
        {
          bool2 = false;
          continue;
        }
        bool1 = false;
        continue;
        createInsensitiveListener(paramT);
        if (!paramT.hasVideoImage)
          continue;
        localImageKey = new ImageKey(localVinePost.thumbnailUrl);
        paramT.videoImageKey = localImageKey;
        Bitmap localBitmap = (Bitmap)this.mThumbnails.get(i);
        if (localBitmap != null)
        {
          SLog.d("setting thumbnail for {}", Integer.valueOf(i));
          paramT.isVideoImageLoaded = setImage(paramT.getViewForVideoImage(), localBitmap);
          continue;
        }
      }
      finally
      {
      }
      SLog.d("fetching thumbnail for {}", Integer.valueOf(i));
      paramT.isVideoImageLoaded = setImage(paramT.getViewForVideoImage(), this.mAppController.getPhotoBitmap(localImageKey));
    }
  }

  protected abstract void createInsensitiveListener(T paramT);

  protected abstract void createSensitiveLisenter(T paramT);

  protected void endLoadingTimeProfiling()
  {
    if (this.mStartLoadingTime > 0L)
    {
      long l = 500 * Math.round((float)(timeSinceStartLoadingTime() / 500L));
      this.mStartLoadingTime = 0L;
      SLog.i("Loading time for {} was {}ms.", this.mLoadingTimeTag, Long.valueOf(l));
      FlurryUtils.trackLoadingTime(this.mLoadingTimeTag, l);
    }
  }

  public long getItemId(int paramInt)
  {
    return paramInt;
  }

  protected VideoKey getRequestKey(VinePost paramVinePost, boolean paramBoolean)
  {
    boolean bool2;
    boolean bool1;
    label43: VideoKey localVideoKey1;
    int i;
    if (this.mNormalVideoPlayable == null)
    {
      if (SystemUtil.isNormalVideoPlayable(this.mContext) != SystemUtil.PrefBooleanState.FALSE)
      {
        bool2 = true;
        this.mNormalVideoPlayable = Boolean.valueOf(bool2);
      }
    }
    else
    {
      if (VideoCache.getCurrentAverageSpeed() <= 200)
        break label149;
      bool1 = true;
      SLog.d("Getting HQ Video: {} && {}", Boolean.valueOf(bool1), this.mNormalVideoPlayable);
      localVideoKey1 = new VideoKey(paramVinePost.videoUrl);
      if ((!this.mNormalVideoPlayable.booleanValue()) || (!bool1))
      {
        if ((paramVinePost.videoLowURL == null) || (paramVinePost.videoLowURL.isEmpty()))
          break label154;
        i = 1;
        label104: if (i != 0)
          break label160;
        SLog.e("Low key does NOT exist: forceLowKey {}. ", Boolean.valueOf(paramBoolean), this.mNormalVideoPlayable);
        if ((paramBoolean) || (!this.mNormalVideoPlayable.booleanValue()))
          localVideoKey1 = null;
      }
    }
    label149: label154: label160: VideoKey localVideoKey2;
    do
    {
      return localVideoKey1;
      bool2 = false;
      break;
      bool1 = false;
      break label43;
      i = 0;
      break label104;
      localVideoKey2 = new VideoKey(paramVinePost.videoLowURL);
      if ((paramBoolean) || (!this.mNormalVideoPlayable.booleanValue()))
        return localVideoKey2;
    }
    while (this.mAppController.peekVideoFilePath(localVideoKey1) != null);
    return localVideoKey2;
  }

  public long getStartLoadingTime()
  {
    return this.mStartLoadingTime;
  }

  public boolean hasStableIds()
  {
    return false;
  }

  public boolean isPlaying()
  {
    return false;
  }

  public void notifyDataSetChanged()
  {
    super.notifyDataSetChanged();
    resetStates(true);
  }

  public boolean onBackPressed()
  {
    return false;
  }

  public void onDestroy()
  {
  }

  public void onDestroyView()
  {
  }

  protected void onInvalidRequestKey()
  {
    SLog.e("Invalid request key.");
  }

  public void onLowMemory()
  {
    SLog.e("onLowMemory called.", new VineException());
    this.mThumbnails.clear();
    this.mAvatars.clear();
  }

  public void onPause(boolean paramBoolean)
  {
  }

  public void onResume(boolean paramBoolean)
  {
  }

  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
  }

  public void onTrimMemory(int paramInt)
  {
    if (paramInt != 80)
    {
      SLog.d("onTrimMemory: Adapter has cleaned it's bitmaps: {}, {}.", Integer.valueOf(this.mAvatars.size()), Integer.valueOf(this.mThumbnails.size()));
      this.mAvatars.clear();
      this.mThumbnails.clear();
    }
  }

  protected void onVideoImageObtained(T paramT, boolean paramBoolean)
  {
  }

  public void onVideoPathObtained(HashMap<VideoKey, UrlVideo> paramHashMap)
  {
  }

  protected void resetStates(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.mThumbnails.clear();
      this.mAvatars.clear();
    }
  }

  public void setCompactLikesComments(boolean paramBoolean)
  {
    this.mCompactLikesComments = paramBoolean;
  }

  protected boolean setImage(View paramView, Bitmap paramBitmap)
  {
    if (paramBitmap == null)
    {
      paramView.setBackgroundColor(this.mContext.getResources().getColor(2131296357));
      return false;
    }
    paramView.setBackgroundDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
    return true;
  }

  protected boolean setImage(ImageView paramImageView, Bitmap paramBitmap)
  {
    if (paramBitmap == null)
    {
      paramImageView.setBackgroundColor(this.mContext.getResources().getColor(2131296357));
      paramImageView.setImageBitmap(null);
      return false;
    }
    paramImageView.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
    return true;
  }

  public void setImages(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.mViewHolders.iterator();
    while (localIterator.hasNext())
    {
      WeakReference localWeakReference = (WeakReference)localIterator.next();
      GenericFeedViewHolder localGenericFeedViewHolder = (GenericFeedViewHolder)localWeakReference.get();
      if (localGenericFeedViewHolder == null)
      {
        localArrayList.add(localWeakReference);
      }
      else
      {
        if (localGenericFeedViewHolder.avatarKey != null)
        {
          UrlImage localUrlImage2 = (UrlImage)paramHashMap.get(localGenericFeedViewHolder.avatarKey);
          if ((localUrlImage2 != null) && (localUrlImage2.isValid()))
          {
            setImage(localGenericFeedViewHolder.userImage, localUrlImage2.bitmap);
            SLog.d("found for avatar.");
          }
        }
        if (localGenericFeedViewHolder.videoImageKey != null)
        {
          UrlImage localUrlImage1 = (UrlImage)paramHashMap.get(localGenericFeedViewHolder.videoImageKey);
          if ((localUrlImage1 != null) && (localUrlImage1.isValid()))
          {
            SLog.d("found for video: {}", localUrlImage1.url);
            onVideoImageObtained(localGenericFeedViewHolder, setImage(localGenericFeedViewHolder.getViewForVideoImage(), localUrlImage1.bitmap));
          }
        }
      }
    }
    this.mViewHolders.removeAll(localArrayList);
  }

  public void setOffsetResolver(ViewOffsetResolver paramViewOffsetResolver)
  {
    this.mViewOffsetResolver = paramViewOffsetResolver;
  }

  protected void setRevinersCount(GenericFeedViewHolder paramGenericFeedViewHolder)
  {
    VinePost localVinePost = paramGenericFeedViewHolder.post;
    if (localVinePost.revinersCount > 0)
      paramGenericFeedViewHolder.revinersContainer.setVisibility(0);
    while (true)
    {
      Resources localResources = this.mContext.getResources();
      String str = Util.numberFormat(localResources, localVinePost.revinersCount);
      SpannableString localSpannableString = new SpannableString(localResources.getQuantityString(2131558404, localVinePost.revinersCount, new Object[] { str }));
      StyledClickableSpan localStyledClickableSpan = new StyledClickableSpan(7, new SpanCommentObjectTag(localVinePost.postId, localVinePost.userId), this.mSpanClickListener);
      localStyledClickableSpan.setColor(this.mVineGreen);
      localSpannableString.setSpan(localStyledClickableSpan, 0, localSpannableString.length(), 33);
      localSpannableString.setSpan(this.mBoldSpan, 0, localSpannableString.length(), 33);
      paramGenericFeedViewHolder.reviners.setMovementMethod(LinkMovementMethod.getInstance());
      paramGenericFeedViewHolder.reviners.setText(localSpannableString);
      return;
      paramGenericFeedViewHolder.revinersContainer.setVisibility(8);
    }
  }

  protected void setStyledComments(GenericFeedViewHolder paramGenericFeedViewHolder, VinePagedData<VineComment> paramVinePagedData)
  {
    ArrayList localArrayList1 = paramVinePagedData.items;
    int i = localArrayList1.size();
    paramGenericFeedViewHolder.comments1.setVisibility(8);
    paramGenericFeedViewHolder.comments2.setVisibility(8);
    paramGenericFeedViewHolder.comments3.setVisibility(8);
    paramGenericFeedViewHolder.comments4.setVisibility(8);
    paramGenericFeedViewHolder.comments5.setVisibility(8);
    if (i == 0);
    int j;
    int k;
    label75: VineComment localVineComment;
    do
    {
      return;
      j = 0;
      k = Math.max(i - 5, 0);
      if (k >= i)
        break;
      localVineComment = (VineComment)localArrayList1.get(k);
    }
    while (j >= 5);
    TextView localTextView;
    switch (j)
    {
    default:
      localTextView = paramGenericFeedViewHolder.comments5;
    case 0:
    case 1:
    case 2:
    case 3:
    }
    SpannableStringBuilder localSpannableStringBuilder2;
    int m;
    while (true)
    {
      localTextView.setVisibility(0);
      if (localVineComment.commentSb == null)
      {
        localVineComment.commentSb = new SpannableStringBuilder();
        localSpannableStringBuilder2 = localVineComment.commentSb;
        try
        {
          localSpannableStringBuilder2.append(localVineComment.username).append(' ').append(localVineComment.comment);
          m = localVineComment.username.length();
          StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(1, Long.valueOf(localVineComment.userId), this.mSpanClickListener);
          TypefacesSpan localTypefacesSpan = new TypefacesSpan(null, Typefaces.get(this.mContext).getContentTypeface(0, 3));
          localStyledClickableSpan1.setColor(this.mVineGreen);
          Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan1, 0, m, 33);
          Util.safeSetSpan(localSpannableStringBuilder2, localTypefacesSpan, 0, m, 33);
          if ((localVineComment.transientEntities == null) && (localVineComment.entities != null))
          {
            localVineComment.transientEntities = new ArrayList();
            Iterator localIterator2 = localVineComment.entities.iterator();
            while (true)
              if (localIterator2.hasNext())
              {
                VineEntity localVineEntity2 = (VineEntity)localIterator2.next();
                localVineComment.transientEntities.add(localVineEntity2.clone());
                continue;
                localTextView = paramGenericFeedViewHolder.comments1;
                break;
                localTextView = paramGenericFeedViewHolder.comments2;
                break;
                localTextView = paramGenericFeedViewHolder.comments3;
                break;
                localTextView = paramGenericFeedViewHolder.comments4;
              }
          }
        }
        catch (NullPointerException localNullPointerException)
        {
          Object[] arrayOfObject = new Object[3];
          arrayOfObject[0] = Long.valueOf(localVineComment.commentId);
          arrayOfObject[1] = localVineComment.username;
          arrayOfObject[2] = localVineComment.comment;
          CrashUtil.logException(localNullPointerException, "Comment attribute caused NPE: {} {} {}", arrayOfObject);
        }
      }
    }
    while (true)
    {
      k++;
      j++;
      break label75;
      break;
      ArrayList localArrayList2 = localVineComment.transientEntities;
      if (localArrayList2 != null)
      {
        int n = m + 1;
        try
        {
          Util.adjustEntities(localArrayList2, localSpannableStringBuilder2, n, false);
          Iterator localIterator1 = localArrayList2.iterator();
          while (true)
          {
            if (!localIterator1.hasNext())
              break label683;
            localVineEntity1 = (VineEntity)localIterator1.next();
            if (!localVineEntity1.isUserType())
              break;
            StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(1, Long.valueOf(localVineEntity1.id), this.mSpanClickListener);
            localStyledClickableSpan2.setColor(this.mVineGreen);
            Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan2, localVineEntity1.start, localVineEntity1.end, 33);
          }
        }
        catch (Exception localException)
        {
          VineEntity localVineEntity1;
          while (BuildUtil.isLogsOn())
          {
            RuntimeException localRuntimeException = new RuntimeException(localException);
            throw localRuntimeException;
            if (localVineEntity1.isTagType())
            {
              StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(4, localVineEntity1.title, this.mSpanClickListener);
              localStyledClickableSpan3.setColor(this.mVineGreen);
              Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan3, localVineEntity1.start, localVineEntity1.end, 33);
            }
          }
          CrashUtil.logException(localException, "Failed to adjust entities on " + localVineComment.commentId, new Object[0]);
        }
      }
      label683: MovementMethod localMovementMethod = LinkMovementMethod.getInstance();
      localTextView.setMovementMethod(localMovementMethod);
      SpannableStringBuilder localSpannableStringBuilder1 = localVineComment.commentSb;
      localTextView.setText(localSpannableStringBuilder1);
    }
  }

  protected void setStyledCompactLikesComments(FeedViewHolder paramFeedViewHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    paramFeedViewHolder.likersContainer.setVisibility(8);
    paramFeedViewHolder.commentsContainer.setVisibility(8);
    paramFeedViewHolder.revinersContainer.setVisibility(8);
    Resources localResources = this.mContext.getResources();
    SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder();
    if (paramInt1 > 0)
    {
      localSpannableStringBuilder.append(localResources.getQuantityString(2131558414, paramInt1, new Object[] { Util.numberFormat(localResources, paramInt1) }));
      StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(2, Long.valueOf(paramFeedViewHolder.post.postId), this.mSpanClickListener);
      localStyledClickableSpan3.setColor(localResources.getColor(2131296374));
      Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan3, 0, localSpannableStringBuilder.length(), 33);
    }
    StyledClickableSpan localStyledClickableSpan2;
    int i;
    if (paramInt2 > 0)
    {
      if (localSpannableStringBuilder.length() > 0)
        localSpannableStringBuilder.append(' ').append('·').append(' ');
      localSpannableStringBuilder.append(localResources.getQuantityString(2131558413, paramInt2, new Object[] { Util.numberFormat(localResources, paramInt2) }));
      localStyledClickableSpan2 = new StyledClickableSpan(3, new SpanCommentObjectTag(paramFeedViewHolder.post.postId, paramFeedViewHolder.post.userId), this.mSpanClickListener);
      localStyledClickableSpan2.setColor(localResources.getColor(2131296374));
      i = localSpannableStringBuilder.toString().indexOf('·');
      if (i >= 0)
        break label500;
    }
    label500: for (int j = 0; ; j = i + 2)
    {
      int k = localSpannableStringBuilder.length();
      Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan2, j, k, 33);
      if (localSpannableStringBuilder.length() > 0)
      {
        paramFeedViewHolder.compactLikesCommentsContainer.setVisibility(0);
        Util.safeSetSpan(localSpannableStringBuilder, new TypefacesSpan(null, Typefaces.get(this.mContext).getContentTypeface(0, 3)), 0, localSpannableStringBuilder.length(), 33);
        paramFeedViewHolder.compactLikesCommentsCounts.setMovementMethod(LinkMovementMethod.getInstance());
        paramFeedViewHolder.compactLikesCommentsCounts.setText(localSpannableStringBuilder);
      }
      if (paramInt3 <= 0)
        break;
      paramFeedViewHolder.compactRevinersCount.setVisibility(0);
      paramFeedViewHolder.compactRevinersDivider.setVisibility(0);
      String str = Util.numberFormat(localResources, paramInt3);
      SpannableString localSpannableString = new SpannableString(localResources.getQuantityString(2131558404, paramInt3, new Object[] { str }));
      StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(7, new SpanCommentObjectTag(paramFeedViewHolder.post.postId, paramFeedViewHolder.post.userId), this.mSpanClickListener);
      localStyledClickableSpan1.setColor(this.mVineGreen);
      localSpannableString.setSpan(localStyledClickableSpan1, 0, localSpannableString.length(), 33);
      localSpannableString.setSpan(this.mBoldSpan, 0, localSpannableString.length(), 33);
      paramFeedViewHolder.compactRevinersCount.setMovementMethod(LinkMovementMethod.getInstance());
      paramFeedViewHolder.compactRevinersCount.setText(localSpannableString);
      return;
    }
    paramFeedViewHolder.compactRevinersCount.setVisibility(8);
    paramFeedViewHolder.compactRevinersDivider.setVisibility(8);
  }

  protected void setStyledCompactLikesComments(GenericFeedViewHolder paramGenericFeedViewHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    paramGenericFeedViewHolder.likersContainer.setVisibility(8);
    paramGenericFeedViewHolder.commentsContainer.setVisibility(8);
    paramGenericFeedViewHolder.revinersContainer.setVisibility(8);
    Resources localResources = this.mContext.getResources();
    SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder();
    if (paramInt1 > 0)
    {
      localSpannableStringBuilder.append(localResources.getQuantityString(2131558414, paramInt1, new Object[] { Util.numberFormat(localResources, paramInt1) }));
      StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(2, Long.valueOf(paramGenericFeedViewHolder.post.postId), this.mSpanClickListener);
      localStyledClickableSpan3.setColor(localResources.getColor(2131296374));
      Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan3, 0, localSpannableStringBuilder.length(), 33);
    }
    int i;
    int j;
    if (paramInt2 > 0)
    {
      if (localSpannableStringBuilder.length() > 0)
        localSpannableStringBuilder.append(' ').append('·').append(' ');
      localSpannableStringBuilder.append(localResources.getQuantityString(2131558413, paramInt2, new Object[] { Util.numberFormat(localResources, paramInt2) }));
      StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(3, new SpanCommentObjectTag(paramGenericFeedViewHolder.post.postId, paramGenericFeedViewHolder.post.userId), this.mSpanClickListener);
      localStyledClickableSpan2.setColor(localResources.getColor(2131296374));
      i = localSpannableStringBuilder.toString().indexOf('·');
      if (i < 0)
      {
        j = 0;
        int k = localSpannableStringBuilder.length();
        Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan2, j, k, 33);
      }
    }
    else
    {
      if (localSpannableStringBuilder.length() <= 0)
        break label509;
      paramGenericFeedViewHolder.compactLikesCommentsContainer.setVisibility(0);
      Util.safeSetSpan(localSpannableStringBuilder, new TypefacesSpan(null, Typefaces.get(this.mContext).getContentTypeface(0, 3)), 0, localSpannableStringBuilder.length(), 33);
      paramGenericFeedViewHolder.compactLikesCommentsCounts.setMovementMethod(LinkMovementMethod.getInstance());
      paramGenericFeedViewHolder.compactLikesCommentsCounts.setText(localSpannableStringBuilder);
    }
    while (true)
    {
      if (paramInt3 <= 0)
        break label521;
      paramGenericFeedViewHolder.compactRevinersCount.setVisibility(0);
      paramGenericFeedViewHolder.compactRevinersDivider.setVisibility(0);
      String str = Util.numberFormat(localResources, paramInt3);
      SpannableString localSpannableString = new SpannableString(localResources.getQuantityString(2131558404, paramInt3, new Object[] { str }));
      StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(7, new SpanCommentObjectTag(paramGenericFeedViewHolder.post.postId, paramGenericFeedViewHolder.post.userId), this.mSpanClickListener);
      localStyledClickableSpan1.setColor(this.mVineGreen);
      localSpannableString.setSpan(localStyledClickableSpan1, 0, localSpannableString.length(), 33);
      localSpannableString.setSpan(this.mBoldSpan, 0, localSpannableString.length(), 33);
      paramGenericFeedViewHolder.compactRevinersCount.setMovementMethod(LinkMovementMethod.getInstance());
      paramGenericFeedViewHolder.compactRevinersCount.setText(localSpannableString);
      return;
      j = i + 2;
      break;
      label509: paramGenericFeedViewHolder.compactLikesCommentsContainer.setVisibility(8);
    }
    label521: paramGenericFeedViewHolder.compactRevinersCount.setVisibility(8);
    paramGenericFeedViewHolder.compactRevinersDivider.setVisibility(8);
  }

  protected void setStyledLikers(GenericFeedViewHolder paramGenericFeedViewHolder, int paramInt, VinePagedData<VineLike> paramVinePagedData)
  {
    ArrayList localArrayList1 = paramVinePagedData.items;
    if (localArrayList1 == null)
      CrashUtil.logException(new VineException("Likes were null for post " + paramGenericFeedViewHolder.post.postId));
    int i;
    do
    {
      return;
      ArrayList localArrayList2 = new ArrayList();
      Iterator localIterator1 = localArrayList1.iterator();
      while (localIterator1.hasNext())
      {
        VineLike localVineLike3 = (VineLike)localIterator1.next();
        if (TextUtils.isEmpty(localVineLike3.username))
          localArrayList2.add(localVineLike3);
      }
      localArrayList1.removeAll(localArrayList2);
      i = localArrayList1.size();
    }
    while (i == 0);
    Resources localResources = this.mContext.getResources();
    StringBuilder localStringBuilder = new StringBuilder();
    ArrayList localArrayList3 = new ArrayList(i);
    if (paramInt > 10)
    {
      paramGenericFeedViewHolder.likeType = 3;
      String str3 = localResources.getQuantityString(2131558415, paramInt, new Object[] { Util.numberFormat(localResources, paramInt) });
      localStringBuilder.append(str3);
      TypefacesSpan[] arrayOfTypefacesSpan = new TypefacesSpan[1];
      arrayOfTypefacesSpan[0] = this.mBoldSpan;
      Spanned localSpanned = Util.getSpannedText(arrayOfTypefacesSpan, str3, '"');
      paramGenericFeedViewHolder.likers.setText(localSpanned);
      Spannable localSpannable = (Spannable)paramGenericFeedViewHolder.likers.getText();
      int i8 = localSpanned.getSpanStart(this.mBoldSpan);
      int i9 = localSpanned.getSpanEnd(this.mBoldSpan);
      StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(2, Long.valueOf(paramGenericFeedViewHolder.post.postId), this.mSpanClickListener);
      localStyledClickableSpan3.setColor(localResources.getColor(2131296374));
      Util.safeSetSpan(localSpannable, localStyledClickableSpan3, i8, i9, 33);
      return;
    }
    if (i == 1)
    {
      paramGenericFeedViewHolder.likeType = 1;
      VineLike localVineLike2 = (VineLike)localArrayList1.get(0);
      Object[] arrayOfObject10 = new Object[1];
      arrayOfObject10[0] = localVineLike2.username;
      String str2 = localResources.getQuantityString(2131558415, i, arrayOfObject10);
      int i6 = str2.indexOf('"');
      int i7 = -1 + str2.indexOf('"', i6 + 1);
      localStringBuilder.append(str2.replaceAll(String.valueOf('"'), ""));
      SpannableStringBuilder localSpannableStringBuilder2 = new SpannableStringBuilder(localStringBuilder.toString());
      StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(1, Long.valueOf(((VineLike)localArrayList1.get(0)).userId), this.mSpanClickListener);
      localStyledClickableSpan2.setColor(localResources.getColor(2131296374));
      Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan2, i6, i7, 33);
      Util.safeSetSpan(localSpannableStringBuilder2, new TypefacesSpan(null, Typefaces.get(this.mContext).getContentTypeface(0, 3)), i6, i7, 33);
      paramGenericFeedViewHolder.likers.setText(localSpannableStringBuilder2);
      return;
    }
    paramGenericFeedViewHolder.likeType = 2;
    ArrayList localArrayList4 = new ArrayList(i);
    String str1 = "";
    switch (localArrayList1.size())
    {
    default:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    }
    while (true)
    {
      int j = 0;
      try
      {
        localStringBuilder.append(str1.substring(0, str1.indexOf('"')));
        label622: Iterator localIterator2 = localArrayList1.iterator();
        label629: if (localIterator2.hasNext())
        {
          localVineLike1 = (VineLike)localIterator2.next();
          int m = str1.indexOf('"', j);
          n = str1.indexOf('"', m + 1);
          Pair localPair2 = new Pair(Integer.valueOf(localStringBuilder.length()), Integer.valueOf(localStringBuilder.length() + localVineLike1.username.length()));
          localArrayList3.add(localPair2);
          i1 = m + 1;
          i2 = m + 1;
        }
      }
      catch (Throwable localThrowable2)
      {
        try
        {
          int i1;
          int i2;
          localStringBuilder.append(str1.substring(i1, i2 + localVineLike1.username.length()));
          label753: i3 = str1.indexOf('"', n + 1);
          if (i3 > 0)
            i5 = n + 1;
        }
        catch (Throwable localThrowable2)
        {
          try
          {
            VineLike localVineLike1;
            int n;
            int i3;
            int i5;
            localStringBuilder.append(str1.substring(i5, i3));
            while (true)
            {
              localArrayList4.add(Long.valueOf(localVineLike1.userId));
              j = i3;
              break label629;
              Object[] arrayOfObject9 = new Object[2];
              arrayOfObject9[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject9[1] = ((VineLike)localArrayList1.get(1)).username;
              str1 = localResources.getString(2131624236, arrayOfObject9);
              break;
              Object[] arrayOfObject8 = new Object[3];
              arrayOfObject8[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject8[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject8[2] = ((VineLike)localArrayList1.get(2)).username;
              str1 = localResources.getString(2131624237, arrayOfObject8);
              break;
              Object[] arrayOfObject7 = new Object[4];
              arrayOfObject7[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject7[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject7[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject7[3] = ((VineLike)localArrayList1.get(3)).username;
              str1 = localResources.getString(2131624238, arrayOfObject7);
              break;
              Object[] arrayOfObject6 = new Object[5];
              arrayOfObject6[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject6[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject6[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject6[3] = ((VineLike)localArrayList1.get(3)).username;
              arrayOfObject6[4] = ((VineLike)localArrayList1.get(4)).username;
              str1 = localResources.getString(2131624239, arrayOfObject6);
              break;
              Object[] arrayOfObject5 = new Object[6];
              arrayOfObject5[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject5[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject5[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject5[3] = ((VineLike)localArrayList1.get(3)).username;
              arrayOfObject5[4] = ((VineLike)localArrayList1.get(4)).username;
              arrayOfObject5[5] = ((VineLike)localArrayList1.get(5)).username;
              str1 = localResources.getString(2131624240, arrayOfObject5);
              break;
              Object[] arrayOfObject4 = new Object[7];
              arrayOfObject4[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject4[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject4[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject4[3] = ((VineLike)localArrayList1.get(3)).username;
              arrayOfObject4[4] = ((VineLike)localArrayList1.get(4)).username;
              arrayOfObject4[5] = ((VineLike)localArrayList1.get(5)).username;
              arrayOfObject4[6] = ((VineLike)localArrayList1.get(6)).username;
              str1 = localResources.getString(2131624241, arrayOfObject4);
              break;
              Object[] arrayOfObject3 = new Object[8];
              arrayOfObject3[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject3[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject3[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject3[3] = ((VineLike)localArrayList1.get(3)).username;
              arrayOfObject3[4] = ((VineLike)localArrayList1.get(4)).username;
              arrayOfObject3[5] = ((VineLike)localArrayList1.get(5)).username;
              arrayOfObject3[6] = ((VineLike)localArrayList1.get(6)).username;
              arrayOfObject3[7] = ((VineLike)localArrayList1.get(7)).username;
              str1 = localResources.getString(2131624242, arrayOfObject3);
              break;
              Object[] arrayOfObject2 = new Object[9];
              arrayOfObject2[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject2[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject2[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject2[3] = ((VineLike)localArrayList1.get(3)).username;
              arrayOfObject2[4] = ((VineLike)localArrayList1.get(4)).username;
              arrayOfObject2[5] = ((VineLike)localArrayList1.get(5)).username;
              arrayOfObject2[6] = ((VineLike)localArrayList1.get(6)).username;
              arrayOfObject2[7] = ((VineLike)localArrayList1.get(7)).username;
              arrayOfObject2[8] = ((VineLike)localArrayList1.get(8)).username;
              str1 = localResources.getString(2131624243, arrayOfObject2);
              break;
              Object[] arrayOfObject1 = new Object[10];
              arrayOfObject1[0] = ((VineLike)localArrayList1.get(0)).username;
              arrayOfObject1[1] = ((VineLike)localArrayList1.get(1)).username;
              arrayOfObject1[2] = ((VineLike)localArrayList1.get(2)).username;
              arrayOfObject1[3] = ((VineLike)localArrayList1.get(3)).username;
              arrayOfObject1[4] = ((VineLike)localArrayList1.get(4)).username;
              arrayOfObject1[5] = ((VineLike)localArrayList1.get(5)).username;
              arrayOfObject1[6] = ((VineLike)localArrayList1.get(6)).username;
              arrayOfObject1[7] = ((VineLike)localArrayList1.get(7)).username;
              arrayOfObject1[8] = ((VineLike)localArrayList1.get(8)).username;
              arrayOfObject1[9] = ((VineLike)localArrayList1.get(9)).username;
              str1 = localResources.getString(2131624235, arrayOfObject1);
              break;
              localThrowable1 = localThrowable1;
              CrashUtil.logException(localThrowable1, "Attempted substring: {}", new Object[] { str1 });
              break label622;
              localThrowable2 = localThrowable2;
              CrashUtil.logException(localThrowable2, "Attempted substring: {}", new Object[] { str1 });
              break label753;
              int i4 = n + 1;
              localStringBuilder.append(str1.substring(i4, str1.length()));
            }
          }
          catch (Throwable localThrowable3)
          {
            while (true)
              CrashUtil.logException(localThrowable3, "Attempted substring: {}", new Object[] { str1 });
          }
        }
        SpannableStringBuilder localSpannableStringBuilder1 = new SpannableStringBuilder(localStringBuilder.toString());
        int k = 0;
        Iterator localIterator3 = localArrayList3.iterator();
        while (localIterator3.hasNext())
        {
          Pair localPair1 = (Pair)localIterator3.next();
          long l = ((Long)localArrayList4.get(k)).longValue();
          StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(1, Long.valueOf(l), this.mSpanClickListener);
          localStyledClickableSpan1.setColor(localResources.getColor(2131296374));
          Util.safeSetSpan(localSpannableStringBuilder1, localStyledClickableSpan1, ((Integer)localPair1.first).intValue(), ((Integer)localPair1.second).intValue(), 33);
          Util.safeSetSpan(localSpannableStringBuilder1, new TypefacesSpan(null, Typefaces.get(this.mContext).getContentTypeface(0, 3)), ((Integer)localPair1.first).intValue(), ((Integer)localPair1.second).intValue(), 33);
          k++;
        }
        paramGenericFeedViewHolder.likers.setText(localSpannableStringBuilder1);
      }
    }
  }

  public void showLikedByMe(long paramLong)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = this.mViewHolders.iterator();
    while (localIterator1.hasNext())
    {
      WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
      GenericFeedViewHolder localGenericFeedViewHolder = (GenericFeedViewHolder)localWeakReference2.get();
      if (localGenericFeedViewHolder == null)
      {
        localArrayList.add(localWeakReference2);
      }
      else if ((localGenericFeedViewHolder.post != null) && (localGenericFeedViewHolder.post.postId == paramLong))
      {
        VinePost localVinePost = localGenericFeedViewHolder.post;
        localVinePost.likesCount = (1 + localVinePost.likesCount);
        VinePagedData localVinePagedData = localGenericFeedViewHolder.post.likes;
        VineLike localVineLike = new VineLike();
        Session localSession = this.mAppController.getActiveSession();
        localVineLike.likeId = -1L;
        localVineLike.postId = paramLong;
        localVineLike.username = localSession.getName();
        localVineLike.userId = localSession.getUserId();
        if (localVinePagedData == null)
          localVinePagedData = new VinePagedData();
        if (localVinePagedData.items == null)
          localVinePagedData.items = new ArrayList();
        localVinePagedData.items.add(localVineLike);
        localGenericFeedViewHolder.liked.setImageResource(2130837714);
        if (this.mCompactLikesComments)
        {
          setStyledCompactLikesComments(localGenericFeedViewHolder, localGenericFeedViewHolder.post.likesCount, localGenericFeedViewHolder.post.commentsCount, localGenericFeedViewHolder.post.revinersCount);
        }
        else
        {
          localGenericFeedViewHolder.likersContainer.setVisibility(0);
          setStyledLikers(localGenericFeedViewHolder, localGenericFeedViewHolder.post.likesCount, localGenericFeedViewHolder.post.likes);
        }
      }
    }
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      WeakReference localWeakReference1 = (WeakReference)localIterator2.next();
      this.mViewHolders.remove(localWeakReference1);
    }
  }

  public void showUnlikedByMe(long paramLong)
  {
    ArrayList localArrayList1 = new ArrayList();
    Iterator localIterator1 = this.mViewHolders.iterator();
    while (localIterator1.hasNext())
    {
      WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
      GenericFeedViewHolder localGenericFeedViewHolder = (GenericFeedViewHolder)localWeakReference2.get();
      if (localGenericFeedViewHolder == null)
      {
        localArrayList1.add(localWeakReference2);
      }
      else if ((localGenericFeedViewHolder.post != null) && (localGenericFeedViewHolder.post.postId == paramLong))
      {
        if (localGenericFeedViewHolder.post.likesCount > 0)
        {
          VinePost localVinePost = localGenericFeedViewHolder.post;
          localVinePost.likesCount = (-1 + localVinePost.likesCount);
        }
        if ((localGenericFeedViewHolder.post.likes != null) && (localGenericFeedViewHolder.post.likes.items != null))
        {
          ArrayList localArrayList2 = localGenericFeedViewHolder.post.likes.items;
          Object localObject = null;
          Iterator localIterator3 = localArrayList2.iterator();
          while (localIterator3.hasNext())
          {
            VineLike localVineLike = (VineLike)localIterator3.next();
            if (localVineLike.userId == this.mAppController.getActiveId())
              localObject = localVineLike;
          }
          if (localObject != null)
            localArrayList2.remove(localObject);
        }
        localGenericFeedViewHolder.liked.setImageResource(2130837647);
        if (this.mCompactLikesComments)
        {
          setStyledCompactLikesComments(localGenericFeedViewHolder, localGenericFeedViewHolder.post.likesCount, localGenericFeedViewHolder.post.commentsCount, localGenericFeedViewHolder.post.revinersCount);
        }
        else
        {
          if (localGenericFeedViewHolder.post.likesCount > 0)
            localGenericFeedViewHolder.likersContainer.setVisibility(0);
          while (true)
          {
            setStyledLikers(localGenericFeedViewHolder, localGenericFeedViewHolder.post.likesCount, localGenericFeedViewHolder.post.likes);
            break;
            localGenericFeedViewHolder.likersContainer.setVisibility(8);
          }
        }
      }
    }
    Iterator localIterator2 = localArrayList1.iterator();
    while (localIterator2.hasNext())
    {
      WeakReference localWeakReference1 = (WeakReference)localIterator2.next();
      this.mViewHolders.remove(localWeakReference1);
    }
  }

  public void startLoadingTimeProfiling(String paramString)
  {
    this.mLoadingTimeTag = paramString;
    this.mStartLoadingTime = System.currentTimeMillis();
  }

  public long timeSinceStartLoadingTime()
  {
    return System.currentTimeMillis() - this.mStartLoadingTime;
  }

  public void toggleMute(boolean paramBoolean)
  {
  }

  public void updateRevinedCount(long paramLong, boolean paramBoolean)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = this.mViewHolders.iterator();
    while (localIterator1.hasNext())
    {
      WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
      GenericFeedViewHolder localGenericFeedViewHolder = (GenericFeedViewHolder)localWeakReference2.get();
      if (localGenericFeedViewHolder == null)
      {
        localArrayList.add(localWeakReference2);
      }
      else if ((localGenericFeedViewHolder.post != null) && (localGenericFeedViewHolder.post.postId == paramLong))
      {
        if (paramBoolean)
        {
          VinePost localVinePost2 = localGenericFeedViewHolder.post;
          localVinePost2.revinersCount = (1 + localVinePost2.revinersCount);
          localGenericFeedViewHolder.revine.setImageResource(2130837715);
        }
        while (true)
        {
          if (!this.mCompactLikesComments)
            break label205;
          setStyledCompactLikesComments(localGenericFeedViewHolder, localGenericFeedViewHolder.post.likesCount, localGenericFeedViewHolder.post.commentsCount, localGenericFeedViewHolder.post.revinersCount);
          break;
          if (localGenericFeedViewHolder.post.revinersCount > 0)
          {
            VinePost localVinePost1 = localGenericFeedViewHolder.post;
            localVinePost1.revinersCount = (-1 + localVinePost1.revinersCount);
          }
          localGenericFeedViewHolder.revine.setImageResource(2130837682);
        }
        label205: setRevinersCount(localGenericFeedViewHolder);
      }
    }
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      WeakReference localWeakReference1 = (WeakReference)localIterator2.next();
      this.mViewHolders.remove(localWeakReference1);
    }
  }

  public class SpanCommentObjectTag
  {
    public final long authorId;
    public final long postId;

    public SpanCommentObjectTag(long arg2, long arg4)
    {
      this.postId = ???;
      Object localObject;
      this.authorId = localObject;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.GenericVideoAdapter
 * JD-Core Version:    0.6.2
 */