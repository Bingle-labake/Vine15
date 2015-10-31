package co.vine.android.widget;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Handler;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsListView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import co.vine.android.BaseTimelineFragment;
import co.vine.android.CommentsActivity;
import co.vine.android.LikeCache;
import co.vine.android.ProfileActivity;
import co.vine.android.RevineCache;
import co.vine.android.ViewOffsetResolver;
import co.vine.android.VineException;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VinePagedData;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineRepost;
import co.vine.android.api.VineVenue;
import co.vine.android.client.AppController;
import co.vine.android.player.HasVideoPlayerAdapter;
import co.vine.android.player.OnListVideoClickListener;
import co.vine.android.player.SdkVideoView;
import co.vine.android.player.SensitiveImageClickListener;
import co.vine.android.player.VideoSensitiveImageClickListener;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.LoopManager;
import co.vine.android.util.MuteUtil;
import co.vine.android.util.SystemUtil;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoCache;
import co.vine.android.util.video.VideoKey;
import com.edisonwang.android.slog.SLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class FeedAdapter extends GenericTimelineAdapter<FeedViewHolder>
  implements HasVideoPlayerAdapter
{
  private int currentPlayerCount = 0;
  private int mCurrentPlaying = -2147483648;
  private boolean mFirstPlayed;
  private final Handler mHandler = new Handler();
  private boolean mHasFocus;
  private SdkVideoView mLastPlayer;
  private boolean mMuted;
  private boolean mNeedReleaseOtherPlayers = false;
  private final SparseArray<String> mPaths;
  private final Runnable mPlayCurrentPositionRunnable;
  private final SparseArray<SdkVideoView> mPlayers;
  private final SparseArray<VinePost> mPosts;
  private int mShouldBePlaying = -2147483648;
  private final HashMap<VideoKey, Integer> mUrlReverse;
  private AttributeSet mVideoAttr = null;
  private boolean mWasResumed = false;
  private int maxPlayer = 10;

  public FeedAdapter(Activity paramActivity, ListView paramListView, LikeCache paramLikeCache, RevineCache paramRevineCache, BaseTimelineFragment paramBaseTimelineFragment, String paramString)
  {
    super(paramActivity, paramListView, paramLikeCache, paramRevineCache, paramBaseTimelineFragment, paramString);
    SLog.d("Adapter constructed, accelerated? {}", Boolean.valueOf(paramListView.isHardwareAccelerated()));
    this.mPlayers = new SparseArray();
    this.mPosts = new SparseArray();
    this.mPaths = new SparseArray();
    this.mUrlReverse = new HashMap();
    this.mPlayCurrentPositionRunnable = new PlayCurrentPositionRunnable();
  }

  private void bindView(FeedViewHolder paramFeedViewHolder)
  {
    final VinePost localVinePost = paramFeedViewHolder.post;
    int i = paramFeedViewHolder.position;
    if (shouldShowThumbnail(i))
    {
      SLog.d("Should show thumbnail... {} {}.", Integer.valueOf(i), Integer.valueOf(this.mCurrentPlaying));
      paramFeedViewHolder.videoLoadImage.setVisibility(0);
      paramFeedViewHolder.videoView.setVisibility(4);
    }
    bindAvatar(paramFeedViewHolder);
    bindVideoImage(paramFeedViewHolder);
    long l;
    if ((!paramFeedViewHolder.post.isExplicit()) || (this.mDismissedWarnings.contains(Integer.valueOf(i))))
    {
      paramFeedViewHolder.videoImage.setVisibility(0);
      if (localVinePost.repost == null)
        break label406;
      paramFeedViewHolder.revineContainer.setVisibility(0);
      paramFeedViewHolder.revineLine.setVisibility(0);
      l = localVinePost.repost.userId;
      if (l != this.mAppController.getActiveId())
        break label254;
      paramFeedViewHolder.revineLine.setText(this.mContext.getString(2131624262));
    }
    label153: label254: SpannableStringBuilder localSpannableStringBuilder2;
    label406: VineEntity localVineEntity1;
    label584: RelativeLayout localRelativeLayout1;
    label667: RelativeLayout localRelativeLayout2;
    label979: label1110: boolean bool1;
    while (true)
      if (!TextUtils.isEmpty(localVinePost.description))
      {
        paramFeedViewHolder.description.setVisibility(0);
        if ((localVinePost.transientEntities == null) && (localVinePost.entities != null))
        {
          localVinePost.transientEntities = new ArrayList();
          Iterator localIterator2 = localVinePost.entities.iterator();
          while (true)
            if (localIterator2.hasNext())
            {
              VineEntity localVineEntity2 = (VineEntity)localIterator2.next();
              localVinePost.transientEntities.add(localVineEntity2.clone());
              continue;
              paramFeedViewHolder.videoImage.setVisibility(4);
              break;
              if (localVinePost.repost.username != null)
              {
                Context localContext = this.mContext;
                Object[] arrayOfObject2 = new Object[1];
                arrayOfObject2[0] = localVinePost.repost.username;
                String str3 = localContext.getString(2131624261, arrayOfObject2);
                SpannableStringBuilder localSpannableStringBuilder3 = new SpannableStringBuilder(str3);
                StyledClickableSpan localStyledClickableSpan4 = new StyledClickableSpan(8, Long.valueOf(l), this.mSpanClickListener);
                int j = str3.indexOf(localVinePost.repost.username);
                if (j < 0)
                  j = 0;
                int k = localSpannableStringBuilder3.length();
                Util.safeSetSpan(localSpannableStringBuilder3, localStyledClickableSpan4, j, k, 33);
                paramFeedViewHolder.revineLine.setMovementMethod(LinkMovementMethod.getInstance());
                paramFeedViewHolder.revineLine.setText(localSpannableStringBuilder3);
                break label153;
              }
              paramFeedViewHolder.revineLine.setVisibility(8);
              break label153;
              paramFeedViewHolder.revineContainer.setVisibility(8);
              break label153;
            }
        }
        ArrayList localArrayList = localVinePost.transientEntities;
        if (localArrayList != null)
        {
          paramFeedViewHolder.description.setMovementMethod(LinkMovementMethod.getInstance());
          if (localVinePost.descriptionSb == null)
          {
            localVinePost.descriptionSb = new SpannableStringBuilder(localVinePost.description);
            localSpannableStringBuilder2 = localVinePost.descriptionSb;
            try
            {
              Util.adjustEntities(localArrayList, localSpannableStringBuilder2, 0, false);
              Iterator localIterator1 = localArrayList.iterator();
              while (localIterator1.hasNext())
              {
                localVineEntity1 = (VineEntity)localIterator1.next();
                if (!localVineEntity1.isUserType())
                  break label1296;
                StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(1, Long.valueOf(localVineEntity1.id), this.mSpanClickListener);
                localStyledClickableSpan2.setColor(this.mVineGreen);
                Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan2, localVineEntity1.start, localVineEntity1.end, 33);
              }
            }
            catch (Exception localException)
            {
              CrashUtil.logException(localException);
            }
          }
          else
          {
            paramFeedViewHolder.description.setText(localVinePost.descriptionSb);
            Resources localResources = this.mContext.getResources();
            if ((localVinePost.venueData == null) || (TextUtils.isEmpty(localVinePost.venueData.venueName)))
              break label1380;
            paramFeedViewHolder.location.setText(localVinePost.venueData.venueName.toUpperCase());
            Drawable localDrawable = localResources.getDrawable(VineVenue.iconMap.get(localVinePost.venueData.displayType));
            paramFeedViewHolder.locationIcon.setImageDrawable(localDrawable);
            paramFeedViewHolder.locationContainer.setVisibility(0);
            paramFeedViewHolder.listener.setPosition(i);
            if (paramFeedViewHolder.imageListener != null)
              paramFeedViewHolder.imageListener.setPosition(i);
            String str1 = localVinePost.username;
            if (str1 == null)
            {
              str1 = "";
              CrashUtil.logException(new VineException("Invalid user name for post " + localVinePost.userId));
            }
            SpannableStringBuilder localSpannableStringBuilder1 = new SpannableStringBuilder(str1);
            Util.safeSetSpan(localSpannableStringBuilder1, this.mBoldSpan, 0, str1.length(), 33);
            StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(1, Long.valueOf(localVinePost.userId), this.mSpanClickListener);
            localStyledClickableSpan1.setColor(localResources.getColor(2131296374));
            Util.safeSetSpan(localSpannableStringBuilder1, localStyledClickableSpan1, 0, str1.length(), 33);
            ImageView localImageView = paramFeedViewHolder.userImage;
            View.OnClickListener local4 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                ProfileActivity.start(FeedAdapter.this.mContext, localVinePost.userId, FeedAdapter.this.mFollowEventSource);
              }
            };
            localImageView.setOnClickListener(local4);
            paramFeedViewHolder.username.setMovementMethod(LinkMovementMethod.getInstance());
            paramFeedViewHolder.username.setText(localSpannableStringBuilder1);
            paramFeedViewHolder.timestamp.setText(Util.getRelativeTimeString(localResources, localVinePost.created, false));
            ImageButton localImageButton = paramFeedViewHolder.comment;
            View.OnClickListener local5 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                FeedAdapter.this.mContext.startActivity(new Intent(FeedAdapter.this.mContext, CommentsActivity.class).putExtra("post_id", localVinePost.postId).putExtra("post_author_id", localVinePost.userId).putExtra("hide_keyboard", false));
              }
            };
            localImageButton.setOnClickListener(local5);
            localRelativeLayout1 = paramFeedViewHolder.likersContainer;
            localRelativeLayout2 = paramFeedViewHolder.commentsContainer;
            RelativeLayout localRelativeLayout3 = paramFeedViewHolder.compactLikesCommentsContainer;
            if (this.mCompactLikesComments)
              break label1429;
            localRelativeLayout3.setVisibility(8);
            if ((localVinePost.likes.items == null) || (localVinePost.likes.items.isEmpty()))
              break label1392;
            localRelativeLayout1.setVisibility(0);
            setStyledLikers(paramFeedViewHolder, localVinePost.likesCount, localVinePost.likes);
            setRevinersCount(paramFeedViewHolder);
            if ((localVinePost.comments.items == null) || (localVinePost.comments.items.isEmpty()))
              break label1419;
            localRelativeLayout2.setVisibility(0);
            setStyledComments(paramFeedViewHolder, localVinePost.comments);
            if (localVinePost.commentsCount <= 5)
              break label1402;
            paramFeedViewHolder.commentType = 2;
            Object[] arrayOfObject1 = new Object[1];
            arrayOfObject1[0] = Util.numberFormat(localResources, -5 + localVinePost.commentsCount);
            String str2 = localResources.getString(2131624382, arrayOfObject1);
            paramFeedViewHolder.olderCommentsContainer.setVisibility(0);
            paramFeedViewHolder.olderComments.setText(str2);
            RelativeLayout localRelativeLayout4 = paramFeedViewHolder.olderCommentsContainer;
            View.OnClickListener local6 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                FeedAdapter.this.mContext.startActivity(new Intent(FeedAdapter.this.mContext, CommentsActivity.class).putExtra("post_id", localVinePost.postId).putExtra("post_author_id", localVinePost.userId).putExtra("hide_keyboard", true));
              }
            };
            localRelativeLayout4.setOnClickListener(local6);
            if (!this.mLikeCache.contains(localVinePost.postId))
              break label1449;
            bool1 = this.mLikeCache.isLike(localVinePost.postId);
            localVinePost.setFlagLiked(bool1);
            label1143: if (!bool1)
              break label1488;
            paramFeedViewHolder.liked.setImageResource(2130837714);
          }
        }
      }
    while (true)
    {
      paramFeedViewHolder.liked.setTag(Long.valueOf(localVinePost.postId));
      paramFeedViewHolder.liked.setOnClickListener(this.mViewClickListener);
      paramFeedViewHolder.more.setTag(localVinePost);
      paramFeedViewHolder.more.setOnClickListener(this.mViewClickListener);
      if ((localVinePost.userId != this.mAppController.getActiveId()) && (!localVinePost.isPrivate()))
        break label1501;
      paramFeedViewHolder.revine.setVisibility(8);
      initVideoView(i, paramFeedViewHolder);
      if ((!this.mFirstPlayed) && (i == 0) && (!localVinePost.isExplicit()))
      {
        play(0);
        if ((SLog.sLogsOn) && (this.mStartLoadingTime > 0L))
          SLog.i("Time since started loading to request 0th video to play: {}ms", Long.valueOf(timeSinceStartLoadingTime()));
        this.mFirstPlayed = true;
      }
      return;
      label1296: if (!localVineEntity1.isTagType())
        break;
      StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(4, localVineEntity1.title, this.mSpanClickListener);
      localStyledClickableSpan3.setColor(this.mVineGreen);
      Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan3, localVineEntity1.start, localVineEntity1.end, 33);
      break;
      paramFeedViewHolder.description.setText(localVinePost.description);
      break label584;
      paramFeedViewHolder.description.setVisibility(8);
      break label584;
      label1380: paramFeedViewHolder.locationContainer.setVisibility(8);
      break label667;
      label1392: localRelativeLayout1.setVisibility(8);
      break label979;
      label1402: paramFeedViewHolder.olderCommentsContainer.setVisibility(8);
      paramFeedViewHolder.commentType = 1;
      break label1110;
      label1419: localRelativeLayout2.setVisibility(8);
      break label1110;
      label1429: setStyledCompactLikesComments(paramFeedViewHolder, localVinePost.likesCount, localVinePost.commentsCount, localVinePost.revinersCount);
      break label1110;
      label1449: bool1 = localVinePost.isLiked();
      if (bool1)
      {
        this.mLikeCache.like(localVinePost.postId);
        break label1143;
      }
      this.mLikeCache.unlike(localVinePost.postId);
      break label1143;
      label1488: paramFeedViewHolder.liked.setImageResource(2130837647);
    }
    label1501: paramFeedViewHolder.revine.setVisibility(0);
    boolean bool2;
    if (this.mRevineCache.contains(localVinePost.postId))
    {
      bool2 = this.mRevineCache.isRevined(localVinePost.postId);
      localVinePost.setFlagRevined(bool2);
      label1542: if (!bool2)
        break label1652;
      paramFeedViewHolder.revine.setImageResource(2130837684);
    }
    while (true)
    {
      paramFeedViewHolder.revine.setTag(localVinePost);
      paramFeedViewHolder.revine.setOnClickListener(this.mViewClickListener);
      break;
      if ((localVinePost.myRepostId > 0L) || (localVinePost.isRevined()));
      for (bool2 = true; ; bool2 = false)
      {
        if (!bool2)
          break label1638;
        this.mRevineCache.putMyRepostId(localVinePost.postId, localVinePost.myRepostId);
        this.mRevineCache.revine(localVinePost.postId);
        break;
      }
      label1638: this.mRevineCache.unRevine(localVinePost.postId);
      break label1542;
      label1652: paramFeedViewHolder.revine.setImageResource(2130837682);
    }
  }

  private int calculateCurrentPosition()
  {
    int i = this.mListView.getFirstVisiblePosition();
    ViewOffsetResolver localViewOffsetResolver = this.mViewOffsetResolver;
    int j = 0;
    if (localViewOffsetResolver != null)
      j = this.mViewOffsetResolver.getOffset(this);
    int k = i - j;
    HashSet localHashSet = this.mTimelineFragment.getHeaderViewParents();
    if (localHashSet.size() > 0)
    {
      int n = 0;
      Iterator localIterator = localHashSet.iterator();
      while (localIterator.hasNext())
        if (!((View)localIterator.next()).isShown())
          n++;
      k -= n;
      SLog.d("Try to get current First: {}, missing header count: {}", Integer.valueOf(k), Integer.valueOf(n));
    }
    View localView = getViewAtPosition(k);
    if (localView == null)
      k = -1;
    do
    {
      return k;
      SdkVideoView localSdkVideoView = getLastPlayer();
      int m = 0;
      if (localSdkVideoView != null)
        m = getLastPlayer().getHeight() / 2;
      float f1 = localView.getBottom() + m;
      float f2 = localView.getHeight() + m;
      if (f2 == 0.0F)
        f2 = 1.0F;
      float f3 = f1 / f2;
      SLog.d("Current First: {}, ratio: {}", Integer.valueOf(k), Float.valueOf(f3));
      if ((f3 < 0.5D) || ((k == -1) && (k < -1 + getCount()) && (k + 1 != this.mCurrentPlaying)))
        return k + 1;
    }
    while (k != this.mCurrentPlaying);
    return -1;
  }

  private boolean getExplicit(int paramInt)
  {
    VinePost localVinePost = (VinePost)this.mPosts.get(paramInt);
    return (localVinePost != null) && (localVinePost.isExplicit()) && (!this.mDismissedWarnings.contains(Integer.valueOf(paramInt)));
  }

  private boolean hasPlayerPlaying()
  {
    return (this.mLastPlayer != null) && (!this.mLastPlayer.isPaused());
  }

  private void initVideoView(final int paramInt, final FeedViewHolder paramFeedViewHolder)
  {
    paramFeedViewHolder.videoLoadImage.setVisibility(4);
    final SdkVideoView localSdkVideoView = paramFeedViewHolder.videoView;
    localSdkVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener()
    {
      public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
      {
        if (localSdkVideoView.getPlayingPosition() == FeedAdapter.this.mCurrentPlaying)
          paramAnonymousMediaPlayer.start();
        while (true)
        {
          FeedAdapter.this.endLoadingTimeProfiling();
          paramFeedViewHolder.videoView.setVisibility(0);
          return;
          SLog.e("This video should not be played: {}, {}.", Integer.valueOf(localSdkVideoView.getPlayingPosition()), Integer.valueOf(FeedAdapter.this.mCurrentPlaying));
        }
      }
    });
    localSdkVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener()
    {
      public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        SLog.d("Got error, try recycling it more aggressively: {}, {}", Integer.valueOf(paramAnonymousInt1), Integer.valueOf(paramAnonymousInt2));
        FeedAdapter.access$102(FeedAdapter.this, -1 + FeedAdapter.this.currentPlayerCount);
        FeedAdapter.access$302(FeedAdapter.this, true);
        FeedAdapter.this.releaseOtherPlayers(localSdkVideoView);
        if (!localSdkVideoView.retryOpenVideo(false))
        {
          SLog.e("Replay video using videoLowUrl.");
          FeedAdapter.this.mPaths.remove(paramInt);
          if ((paramFeedViewHolder.post != null) && (paramFeedViewHolder.post.videoLowURL != null))
          {
            paramFeedViewHolder.post.videoUrl = paramFeedViewHolder.post.videoLowURL;
            paramFeedViewHolder.post.videoLowURL = null;
            localSdkVideoView.setReportOpenError(true);
            if (FeedAdapter.this.mCurrentPlaying == paramInt)
              FeedAdapter.this.stopCurrentPlayer();
            FeedAdapter.this.play(paramInt);
          }
        }
        return true;
      }
    });
    localSdkVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener()
    {
      public void onCompletion(MediaPlayer paramAnonymousMediaPlayer)
      {
        paramAnonymousMediaPlayer.seekTo(0);
        paramAnonymousMediaPlayer.start();
        VinePost localVinePost = (VinePost)FeedAdapter.this.mPosts.get(FeedAdapter.this.mCurrentPlaying);
        if (localVinePost != null)
        {
          long l = localVinePost.postId;
          LoopManager.get(FeedAdapter.this.mContext).increment(l);
        }
      }
    });
    this.mPlayers.put(paramInt, localSdkVideoView);
  }

  private boolean preFetch(int paramInt)
  {
    VinePost localVinePost = (VinePost)this.mPosts.get(paramInt);
    if (localVinePost != null)
    {
      VideoKey localVideoKey;
      if (this.mPaths.get(paramInt) == null)
      {
        localVideoKey = getRequestKey((VinePost)this.mPosts.get(paramInt), false);
        SLog.d("Pre-fetch {}: {}", Integer.valueOf(paramInt), localVideoKey);
        if (localVideoKey != null)
        {
          if (localVinePost.thumbnailUrl != null)
          {
            ImageKey localImageKey1 = new ImageKey(localVinePost.thumbnailUrl);
            Bitmap localBitmap1 = this.mAppController.getPhotoBitmap(localImageKey1);
            if (localBitmap1 != null)
              this.mThumbnails.put(paramInt, localBitmap1);
          }
          if (localVinePost.avatarUrl != null)
          {
            ImageKey localImageKey2 = new ImageKey(localVinePost.avatarUrl);
            Bitmap localBitmap2 = this.mAppController.getPhotoBitmap(localImageKey2);
            if (localBitmap2 != null)
              this.mAvatars.put(paramInt, localBitmap2);
          }
          String str = this.mAppController.getVideoFilePath(localVideoKey);
          if (str == null)
            break label178;
          this.mPaths.put(paramInt, str);
        }
      }
      while (true)
      {
        return true;
        label178: this.mUrlReverse.put(localVideoKey, Integer.valueOf(paramInt));
        continue;
        SLog.d("{} is already fetched.", Integer.valueOf(paramInt));
      }
    }
    SLog.d("End of list, no pre-fetching: {} {}", Integer.valueOf(paramInt), Integer.valueOf(getCount()));
    return false;
  }

  private void refreshVideoView(int paramInt, FeedViewHolder paramFeedViewHolder)
  {
    ViewGroup localViewGroup = (ViewGroup)paramFeedViewHolder.videoView.getParent();
    if (this.mVideoAttr == null)
      this.mVideoAttr = paramFeedViewHolder.videoView.getAttributes();
    paramFeedViewHolder.videoView.suspend();
    try
    {
      localViewGroup.removeView(paramFeedViewHolder.videoView);
      paramFeedViewHolder.videoView = new SdkVideoView(this.mContext, this.mVideoAttr);
      paramFeedViewHolder.videoView.setId(2131361878);
      localViewGroup.addView(paramFeedViewHolder.videoView);
      initVideoView(paramInt, paramFeedViewHolder);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      while (true)
        try
        {
          localViewGroup.removeView(paramFeedViewHolder.videoView);
        }
        catch (Exception localException)
        {
          CrashUtil.logException(localRuntimeException, "Weird things are happening.", new Object[0]);
        }
    }
  }

  private boolean shouldShowThumbnail(int paramInt)
  {
    return (this.mCurrentPlaying != paramInt) || (!hasPlayerPlaying());
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    int i = paramCursor.getPosition();
    FeedViewHolder localFeedViewHolder = (FeedViewHolder)paramView.getTag();
    localFeedViewHolder.post = bindCursorToPost(paramCursor);
    localFeedViewHolder.position = i;
    this.mPosts.put(i, localFeedViewHolder.post);
    boolean bool = paramCursor.moveToNext();
    VinePost localVinePost = null;
    if (bool)
    {
      localVinePost = bindCursorToPost(paramCursor);
      this.mPosts.put(paramCursor.getPosition(), localVinePost);
      if (paramCursor.moveToNext())
      {
        this.mPosts.put(paramCursor.getPosition(), bindCursorToPost(paramCursor));
        paramCursor.moveToPrevious();
      }
      paramCursor.moveToPrevious();
    }
    if (localFeedViewHolder.post == null)
    {
      CrashUtil.logException(new VineException("Post was null: " + i + " nextPost is: " + localVinePost));
      return;
    }
    bindView(localFeedViewHolder);
  }

  protected void createInsensitiveListener(FeedViewHolder paramFeedViewHolder)
  {
    paramFeedViewHolder.sensitiveTextContainer.setVisibility(8);
    paramFeedViewHolder.sensitiveTextContainer.setOnClickListener(null);
    paramFeedViewHolder.sensitiveTextContainer.setClickable(false);
  }

  protected void createSensitiveLisenter(FeedViewHolder paramFeedViewHolder)
  {
    paramFeedViewHolder.imageListener = new VideoSensitiveImageClickListener(this, this.mDismissedWarnings);
    paramFeedViewHolder.sensitiveTextContainer.setOnClickListener(paramFeedViewHolder.imageListener);
    paramFeedViewHolder.sensitiveTextContainer.setClickable(true);
    paramFeedViewHolder.isVideoImageLoaded = true;
  }

  protected FeedViewHolder getHolderFromPosition(int paramInt)
  {
    WeakReference localWeakReference = (WeakReference)this.mViewHolders.get(paramInt);
    if (localWeakReference != null)
      return (FeedViewHolder)localWeakReference.get();
    return null;
  }

  public SdkVideoView getLastPlayer()
  {
    return this.mLastPlayer;
  }

  public SdkVideoView getPlayer(int paramInt, boolean paramBoolean)
  {
    return (SdkVideoView)this.mPlayers.get(paramInt);
  }

  public boolean isPlaying()
  {
    return hasPlayerPlaying();
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    View localView = LayoutInflater.from(paramContext).inflate(2130903114, null);
    RelativeLayout localRelativeLayout1 = (RelativeLayout)localView.findViewById(2131361876);
    ViewGroup.LayoutParams localLayoutParams1 = localRelativeLayout1.getLayoutParams();
    localLayoutParams1.height = this.mDimen;
    localLayoutParams1.width = this.mDimen;
    localRelativeLayout1.setLayoutParams(localLayoutParams1);
    RelativeLayout localRelativeLayout2 = (RelativeLayout)localView.findViewById(2131361982);
    ViewGroup.LayoutParams localLayoutParams2 = localRelativeLayout2.getLayoutParams();
    localLayoutParams2.width = this.mDimen;
    localRelativeLayout2.setLayoutParams(localLayoutParams2);
    ImageView localImageView = (ImageView)localView.findViewById(2131361974);
    ViewGroup.LayoutParams localLayoutParams3 = localImageView.getLayoutParams();
    localLayoutParams3.width = this.mDimen;
    localLayoutParams3.height = this.mDimen;
    localImageView.setLayoutParams(localLayoutParams3);
    FeedViewHolder localFeedViewHolder = new FeedViewHolder(localView);
    localFeedViewHolder.videoView = ((SdkVideoView)localView.findViewById(2131361878));
    localFeedViewHolder.listener = new OnListVideoClickListener(this);
    localFeedViewHolder.likers.setMovementMethod(LinkMovementMethod.getInstance());
    localView.findViewById(2131361876).setOnClickListener(localFeedViewHolder.listener);
    localView.setTag(localFeedViewHolder);
    this.mViewHolders.add(new WeakReference(localFeedViewHolder));
    SLog.d("Get view: {}", Integer.valueOf(localFeedViewHolder.videoView.hashCode() % 100));
    return localView;
  }

  public void onDestroy()
  {
    stopCurrentPlayer();
    releaseOtherPlayers(null);
  }

  public void onDestroyView()
  {
    releaseOtherPlayers(null);
  }

  public void onPause(boolean paramBoolean)
  {
    try
    {
      SLog.d("OnPause {}. {}", Boolean.valueOf(paramBoolean), this);
      this.mHasFocus = paramBoolean;
      this.mShouldBePlaying = -2147483648;
      this.mHandler.removeCallbacks(this.mPlayCurrentPositionRunnable);
      releaseOtherPlayers(null);
      resetStates(false);
      this.mWasResumed = false;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void onResume(boolean paramBoolean)
  {
    try
    {
      SLog.d("OnResume {}. {}", Boolean.valueOf(paramBoolean), this);
      if (!this.mWasResumed)
      {
        this.mWasResumed = true;
        this.mShouldBePlaying = -2147483648;
        this.mMuted = MuteUtil.isMuted(this.mContext);
        VideoCache.resetAverageSpeed();
      }
      this.mHasFocus = paramBoolean;
      int i;
      if (this.mHasFocus)
      {
        i = calculateCurrentPosition();
        if (i > 0)
        {
          int j = this.mViewHolders.size();
          if (j <= i);
        }
      }
      try
      {
        FeedViewHolder localFeedViewHolder = getHolderFromPosition(i);
        if (localFeedViewHolder != null)
          bindVideoImage(localFeedViewHolder);
        playCurrentPosition();
        return;
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        while (true)
          SLog.e("Race condition.", localIndexOutOfBoundsException);
      }
    }
    finally
    {
    }
  }

  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    if (paramInt == 0)
      playCurrentPosition();
  }

  protected void onVideoImageObtained(FeedViewHolder paramFeedViewHolder, boolean paramBoolean)
  {
    paramFeedViewHolder.isVideoImageLoaded = paramBoolean;
    playCurrentPosition();
  }

  public void onVideoPathObtained(HashMap<VideoKey, UrlVideo> paramHashMap)
  {
    SLog.d("CALLBACK onVideoPathObtained");
    Iterator localIterator = paramHashMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      VideoKey localVideoKey = (VideoKey)localIterator.next();
      UrlVideo localUrlVideo = (UrlVideo)paramHashMap.get(localVideoKey);
      if ((localUrlVideo.isValid()) && (this.mUrlReverse.get(localVideoKey) != null))
      {
        this.mPaths.put(((Integer)this.mUrlReverse.get(localVideoKey)).intValue(), localUrlVideo.getAbsolutePath());
        if (((Integer)this.mUrlReverse.get(localVideoKey)).intValue() == this.mShouldBePlaying)
          playCurrentPosition();
      }
    }
  }

  public void pauseCurrentPlayer()
  {
    if (hasPlayerPlaying())
    {
      SLog.d("Pause player {}.", Integer.valueOf(this.mLastPlayer.getPlayingPosition()));
      this.mLastPlayer.pause();
    }
  }

  public void play(int paramInt)
  {
    while (true)
    {
      VideoKey localVideoKey;
      try
      {
        SLog.d("play task executing with position {} ", Integer.valueOf(paramInt));
        if (!this.mHasFocus)
          break label334;
        if (this.mPaths.get(paramInt) != null)
        {
          if (preFetch(paramInt + 1))
            preFetch(paramInt + 2);
          SLog.d("{} is in cache or it is already pre-fetched.", Integer.valueOf(paramInt));
          SLog.d("playing file at position {}", Integer.valueOf(paramInt));
          playFile(paramInt);
          return;
        }
        SLog.d("Real fetch for {}.", Integer.valueOf(paramInt));
        VinePost localVinePost = (VinePost)this.mPosts.get(paramInt);
        if (localVinePost == null)
          break label321;
        localVideoKey = getRequestKey(localVinePost, false);
        if (localVideoKey == null)
        {
          onInvalidRequestKey();
          continue;
        }
      }
      finally
      {
      }
      String str = this.mAppController.getVideoFilePath(localVideoKey);
      if (preFetch(paramInt + 1))
        preFetch(paramInt + 2);
      if (str != null)
      {
        this.mPaths.put(paramInt, str);
        SLog.d("playing file at position {}", Integer.valueOf(paramInt));
        playFile(paramInt);
      }
      else
      {
        this.mShouldBePlaying = paramInt;
        this.mUrlReverse.put(localVideoKey, Integer.valueOf(paramInt));
        SLog.d("{} is not in app cache yet.", Integer.valueOf(paramInt));
        pauseCurrentPlayer();
        View localView = getViewAtPosition(paramInt);
        if (localView != null)
        {
          Object localObject2 = localView.getTag();
          if ((localObject2 instanceof FeedViewHolder))
          {
            ((FeedViewHolder)localObject2).videoLoadImage.setVisibility(0);
          }
          else
          {
            CrashUtil.logException(new IllegalStateException("Somehow tag was " + localObject2 + ", view class is '" + localView.getClass().getName() + "'."));
            continue;
            label321: SLog.d("mPosts is {} or the requested position has no post object in it yet, return -1.", this.mPosts);
            continue;
            label334: SLog.d("not playing because not focused.");
          }
        }
      }
    }
  }

  public void playCurrentPosition()
  {
    try
    {
      this.mHandler.removeCallbacks(this.mPlayCurrentPositionRunnable);
      this.mHandler.postDelayed(this.mPlayCurrentPositionRunnable, 50L);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void playFile(int paramInt)
  {
    int i = 1;
    if (paramInt < 0);
    FeedViewHolder localFeedViewHolder;
    SdkVideoView localSdkVideoView;
    String str;
    while (true)
    {
      return;
      View localView;
      try
      {
        SLog.i("Playing item: {}", Integer.valueOf(paramInt));
        localView = getViewAtPosition(paramInt);
        if (localView == null)
        {
          SLog.i("Item is not visible: {}", Integer.valueOf(paramInt));
          continue;
        }
      }
      finally
      {
      }
      localFeedViewHolder = (FeedViewHolder)localView.getTag();
      if (localFeedViewHolder != null)
        if ((!localFeedViewHolder.isVideoImageLoaded) && (localFeedViewHolder.hasVideoImage))
        {
          SLog.i("Waiting for video image to load: {}.", localFeedViewHolder.videoImageKey.url);
          bindVideoImage(localFeedViewHolder);
          bindAvatar(localFeedViewHolder);
          playCurrentPosition();
        }
        else
        {
          localSdkVideoView = localFeedViewHolder.videoView;
          if (localSdkVideoView != this.mLastPlayer)
          {
            SLog.i("Pause previous player.");
            pauseCurrentPlayer();
          }
          str = (String)this.mPaths.get(paramInt);
          if (str != null)
            break;
          SLog.i("Path was cleared.");
        }
    }
    if (!localSdkVideoView.isPathPlaying(str))
      if (SystemUtil.isSinglePlayerEnabled(this.mContext))
        if (SdkVideoView.getCurrentUri() != null)
          break label509;
    while (true)
    {
      label194: if (i == 0)
        refreshVideoView(paramInt, localFeedViewHolder);
      localSdkVideoView = localFeedViewHolder.videoView;
      localSdkVideoView.setMute(this.mMuted);
      if ((this.mNeedReleaseOtherPlayers) && (this.currentPlayerCount >= this.maxPlayer))
        releaseOtherPlayers(localFeedViewHolder.videoView);
      SLog.i("Start playing by set path.");
      localSdkVideoView.setTag(Long.valueOf(localFeedViewHolder.post.postId));
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Long.valueOf(localFeedViewHolder.post.postId);
      CrashUtil.log("Setting video path in feed for post {}", arrayOfObject2);
      localSdkVideoView.setVideoPath(str);
      if ((!localSdkVideoView.isSurfaceReady()) && (localSdkVideoView.getVisibility() != 0))
        localSdkVideoView.setVisibility(0);
      this.currentPlayerCount = (1 + this.currentPlayerCount);
      while (true)
      {
        localSdkVideoView.setPlayingPosition(paramInt);
        localFeedViewHolder.listener.setPosition(paramInt);
        if (localFeedViewHolder.imageListener != null)
          localFeedViewHolder.imageListener.setPosition(paramInt);
        this.mCurrentPlaying = paramInt;
        this.mLastPlayer = localSdkVideoView;
        break;
        if (localSdkVideoView.getPath() == null)
          break label194;
        i = 0;
        break label194;
        if (localFeedViewHolder.videoView.getVisibility() != 0)
          localFeedViewHolder.videoView.setVisibility(0);
        localSdkVideoView.setMute(this.mMuted);
        if (localSdkVideoView.isInPlaybackState())
        {
          SLog.i("Start playing by calling start.");
          localSdkVideoView.start();
        }
        else
        {
          SLog.i("Start playing by set path.");
          localSdkVideoView.setTag(Long.valueOf(localFeedViewHolder.post.postId));
          Object[] arrayOfObject1 = new Object[1];
          arrayOfObject1[0] = Long.valueOf(localFeedViewHolder.post.postId);
          CrashUtil.log("Setting video path in feed for post {}", arrayOfObject1);
          localSdkVideoView.setVideoPath(str);
        }
      }
      label509: i = 0;
    }
  }

  public void releaseOtherPlayers(SdkVideoView paramSdkVideoView)
  {
    try
    {
      Iterator localIterator = this.mViewHolders.iterator();
      while (localIterator.hasNext())
      {
        FeedViewHolder localFeedViewHolder = (FeedViewHolder)((WeakReference)localIterator.next()).get();
        if ((localFeedViewHolder != null) && (paramSdkVideoView != localFeedViewHolder.videoView))
        {
          SLog.d("Releasing player: {}", Integer.valueOf(localFeedViewHolder.position));
          localFeedViewHolder.videoView.suspend();
          this.currentPlayerCount = (-1 + this.currentPlayerCount);
        }
      }
    }
    finally
    {
    }
  }

  protected void resetStates(boolean paramBoolean)
  {
    super.resetStates(paramBoolean);
    stopCurrentPlayer();
    this.mShouldBePlaying = -1;
    this.currentPlayerCount = 0;
    this.mFirstPlayed = false;
    if (paramBoolean)
    {
      this.mPosts.clear();
      this.mPaths.clear();
      this.mUrlReverse.clear();
    }
  }

  public void stopCurrentPlayer()
  {
    if (this.mLastPlayer != null)
    {
      this.mLastPlayer.suspend();
      this.mLastPlayer = null;
      this.mCurrentPlaying = -1;
    }
  }

  public void toggleMute(boolean paramBoolean)
  {
    this.mMuted = paramBoolean;
    SLog.d("Mute state changed to muted? {}.", Boolean.valueOf(paramBoolean));
    SdkVideoView localSdkVideoView = getLastPlayer();
    if (localSdkVideoView != null)
      localSdkVideoView.setMute(this.mMuted);
  }

  public class PlayCurrentPositionRunnable
    implements Runnable
  {
    public PlayCurrentPositionRunnable()
    {
    }

    public void run()
    {
      try
      {
        int i = FeedAdapter.this.calculateCurrentPosition();
        if (i > -1)
        {
          if (FeedAdapter.this.getExplicit(i))
            break label37;
          FeedAdapter.this.play(i);
        }
        while (true)
        {
          return;
          label37: FeedAdapter.this.pauseCurrentPlayer();
        }
      }
      finally
      {
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.FeedAdapter
 * JD-Core Version:    0.6.2
 */