package co.vine.android.widget;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Handler;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.util.DisplayMetrics;
import android.util.SparseIntArray;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import co.vine.android.BaseTimelineFragment;
import co.vine.android.CommentsActivity;
import co.vine.android.LikeCache;
import co.vine.android.ProfileActivity;
import co.vine.android.RevineCache;
import co.vine.android.VineException;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VinePagedData;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineRepost;
import co.vine.android.api.VineVenue;
import co.vine.android.client.AppController;
import co.vine.android.player.OldSdkVideoView;
import co.vine.android.player.OnSingleVideoClickedListener;
import co.vine.android.player.SensitiveImageClickListener;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.MuteUtil;
import co.vine.android.util.SystemUtil;
import co.vine.android.util.Util;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoKey;
import com.edisonwang.android.slog.SLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class ExploreFeedAdapter extends GenericTimelineAdapter<ExploreFeedViewHolder>
{
  private final Handler mHandler = new Handler();
  private ExploreFeedViewHolder mShouldBePlayingHolder;
  private long mStartClickTime;
  private boolean mStartedClickOnVideo;
  private final Rect mVideoBox;
  private final OnSingleVideoClickedListener mVideoClicker;
  private final View mVideoLoadProgressBar;
  private final View mVideoOverlay;
  private final OldSdkVideoView mVideoView;
  private boolean mWasResumed = false;

  public ExploreFeedAdapter(Activity paramActivity, ListView paramListView, LikeCache paramLikeCache, RevineCache paramRevineCache, BaseTimelineFragment paramBaseTimelineFragment, String paramString)
  {
    super(paramActivity, paramListView, paramLikeCache, paramRevineCache, paramBaseTimelineFragment, paramString);
    ViewGroup localViewGroup = (ViewGroup)paramActivity.getWindow().getDecorView();
    View localView = localViewGroup.findViewById(2131362182);
    if (localView == null)
    {
      localView = paramActivity.getLayoutInflater().inflate(2130903153, localViewGroup, false);
      localViewGroup.addView(localView);
    }
    this.mVideoOverlay = localView;
    this.mVideoView = ((OldSdkVideoView)this.mVideoOverlay.findViewById(2131361878));
    this.mVideoLoadProgressBar = this.mVideoOverlay.findViewById(2131362183);
    this.mVideoClicker = new OnSingleVideoClickedListener(this.mVideoView);
    this.mVideoOverlay.setOnTouchListener(new View.OnTouchListener()
    {
      public int mInitialY;

      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        int i = (int)paramAnonymousMotionEvent.getX();
        int j = (int)paramAnonymousMotionEvent.getY();
        if (paramAnonymousMotionEvent.getAction() == 0)
        {
          ExploreFeedAdapter.access$002(ExploreFeedAdapter.this, System.currentTimeMillis());
          ExploreFeedAdapter.access$102(ExploreFeedAdapter.this, ExploreFeedAdapter.this.mVideoBox.contains(i, j));
          if (!ExploreFeedAdapter.this.mStartedClickOnVideo)
            this.mInitialY = j;
        }
        while (true)
        {
          return true;
          if (paramAnonymousMotionEvent.getAction() == 1)
          {
            if (System.currentTimeMillis() - ExploreFeedAdapter.this.mStartClickTime <= 'È');
            for (int k = 1; k != 0; k = 0)
            {
              if (!ExploreFeedAdapter.this.mStartedClickOnVideo)
                break label133;
              ExploreFeedAdapter.this.mVideoClicker.onClick();
              return true;
            }
          }
        }
        label133: ExploreFeedAdapter.this.dismissVideo();
        return true;
      }
    });
    Display localDisplay = paramActivity.getWindowManager().getDefaultDisplay();
    Point localPoint = Util.getDisplaySize(localDisplay);
    localDisplay.getMetrics(new DisplayMetrics());
    int i = 2 * (int)paramActivity.getResources().getDimension(2131427412);
    int j = localPoint.x - i;
    RelativeLayout localRelativeLayout = (RelativeLayout)this.mVideoOverlay.findViewById(2131361876);
    ViewGroup.LayoutParams localLayoutParams = localRelativeLayout.getLayoutParams();
    localLayoutParams.height = j;
    localLayoutParams.width = j;
    localRelativeLayout.setLayoutParams(localLayoutParams);
    this.mVideoBox = new Rect(localPoint.x / 2 - j / 2, localPoint.y / 2 - j / 2, localPoint.x / 2 + j / 2, localPoint.y / 2 + j / 2);
    this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener()
    {
      public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        SLog.e("Video error.");
        SLog.d("Tags: {} {}.", ExploreFeedAdapter.this.mShouldBePlayingHolder, ExploreFeedAdapter.this.mVideoView.getTag());
        ExploreFeedViewHolder localExploreFeedViewHolder = (ExploreFeedViewHolder)ExploreFeedAdapter.this.mVideoView.getTag();
        if (localExploreFeedViewHolder != null)
        {
          if (!ExploreFeedAdapter.this.mVideoView.isReportErrorOn())
          {
            SystemUtil.setNormalVideoPlayable(ExploreFeedAdapter.this.mContext, false);
            SLog.e("Replay video using videoLowUrl.");
            ExploreFeedAdapter.this.mVideoView.setReportOpenVideoError(true);
            ExploreFeedAdapter.this.showVideo(localExploreFeedViewHolder, true);
          }
        }
        else
          return true;
        SLog.e("Error still detected.");
        return true;
      }
    });
    this.mVideoView.setLooping(true);
    this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener()
    {
      public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
      {
        SLog.d("Video Prepared.");
        if (ExploreFeedAdapter.this.mVideoOverlay.getVisibility() == 0)
        {
          paramAnonymousMediaPlayer.start();
          ExploreFeedAdapter.this.onVideoStarted();
        }
      }
    });
  }

  private void bindView(ExploreFeedViewHolder paramExploreFeedViewHolder)
  {
    final VinePost localVinePost = paramExploreFeedViewHolder.post;
    int i = paramExploreFeedViewHolder.position;
    bindAvatar(paramExploreFeedViewHolder);
    bindVideoImage(paramExploreFeedViewHolder);
    long l;
    if ((!paramExploreFeedViewHolder.post.isExplicit()) || (this.mDismissedWarnings.contains(Integer.valueOf(i))))
    {
      paramExploreFeedViewHolder.videoImage.setVisibility(0);
      if (localVinePost.repost == null)
        break label337;
      paramExploreFeedViewHolder.revineContainer.setVisibility(0);
      l = localVinePost.repost.userId;
      if (l != this.mAppController.getActiveId())
        break label207;
      paramExploreFeedViewHolder.revineLine.setText(this.mContext.getString(2131624262));
    }
    label106: SpannableStringBuilder localSpannableStringBuilder2;
    label207: label337: VineEntity localVineEntity1;
    label515: label598: RelativeLayout localRelativeLayout1;
    RelativeLayout localRelativeLayout2;
    label897: label1028: boolean bool1;
    while (true)
      if (!TextUtils.isEmpty(localVinePost.description))
      {
        paramExploreFeedViewHolder.description.setVisibility(0);
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
              paramExploreFeedViewHolder.videoImage.setVisibility(4);
              break;
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
              paramExploreFeedViewHolder.revineLine.setMovementMethod(LinkMovementMethod.getInstance());
              paramExploreFeedViewHolder.revineLine.setText(localSpannableStringBuilder3);
              break label106;
              paramExploreFeedViewHolder.revineContainer.setVisibility(8);
              break label106;
            }
        }
        ArrayList localArrayList = localVinePost.transientEntities;
        if (localArrayList != null)
        {
          paramExploreFeedViewHolder.description.setMovementMethod(LinkMovementMethod.getInstance());
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
                  break label1152;
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
            paramExploreFeedViewHolder.description.setText(localVinePost.descriptionSb);
            Resources localResources = this.mContext.getResources();
            if ((localVinePost.venueData == null) || (TextUtils.isEmpty(localVinePost.venueData.venueName)))
              break label1236;
            paramExploreFeedViewHolder.location.setText(localVinePost.venueData.venueName.toUpperCase());
            Drawable localDrawable = localResources.getDrawable(VineVenue.iconMap.get(localVinePost.venueData.displayType));
            paramExploreFeedViewHolder.locationIcon.setImageDrawable(localDrawable);
            paramExploreFeedViewHolder.locationContainer.setVisibility(0);
            if (paramExploreFeedViewHolder.imageListener != null)
              paramExploreFeedViewHolder.imageListener.setPosition(i);
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
            ImageView localImageView = paramExploreFeedViewHolder.userImage;
            View.OnClickListener local8 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                ProfileActivity.start(ExploreFeedAdapter.this.mContext, localVinePost.userId, ExploreFeedAdapter.this.mFollowEventSource);
              }
            };
            localImageView.setOnClickListener(local8);
            paramExploreFeedViewHolder.username.setMovementMethod(LinkMovementMethod.getInstance());
            paramExploreFeedViewHolder.username.setText(localSpannableStringBuilder1);
            paramExploreFeedViewHolder.timestamp.setText(Util.getRelativeTimeString(localResources, localVinePost.created, false));
            ImageButton localImageButton = paramExploreFeedViewHolder.comment;
            View.OnClickListener local9 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                ExploreFeedAdapter.this.mContext.startActivity(new Intent(ExploreFeedAdapter.this.mContext, CommentsActivity.class).putExtra("post_id", localVinePost.postId).putExtra("post_author_id", localVinePost.userId).putExtra("hide_keyboard", false));
              }
            };
            localImageButton.setOnClickListener(local9);
            localRelativeLayout1 = paramExploreFeedViewHolder.likersContainer;
            localRelativeLayout2 = paramExploreFeedViewHolder.commentsContainer;
            RelativeLayout localRelativeLayout3 = paramExploreFeedViewHolder.compactLikesCommentsContainer;
            if (this.mCompactLikesComments)
              break label1285;
            localRelativeLayout3.setVisibility(8);
            if ((localVinePost.likes.items == null) || (localVinePost.likes.items.isEmpty()))
              break label1248;
            localRelativeLayout1.setVisibility(0);
            setStyledLikers(paramExploreFeedViewHolder, localVinePost.likesCount, localVinePost.likes);
            setRevinersCount(paramExploreFeedViewHolder);
            if ((localVinePost.comments.items == null) || (localVinePost.comments.items.isEmpty()))
              break label1275;
            localRelativeLayout2.setVisibility(0);
            setStyledComments(paramExploreFeedViewHolder, localVinePost.comments);
            if (localVinePost.commentsCount <= 5)
              break label1258;
            paramExploreFeedViewHolder.commentType = 2;
            Object[] arrayOfObject1 = new Object[1];
            arrayOfObject1[0] = Util.numberFormat(localResources, -5 + localVinePost.commentsCount);
            String str2 = localResources.getString(2131624382, arrayOfObject1);
            paramExploreFeedViewHolder.olderCommentsContainer.setVisibility(0);
            paramExploreFeedViewHolder.olderComments.setText(str2);
            RelativeLayout localRelativeLayout4 = paramExploreFeedViewHolder.olderCommentsContainer;
            View.OnClickListener local10 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                ExploreFeedAdapter.this.mContext.startActivity(new Intent(ExploreFeedAdapter.this.mContext, CommentsActivity.class).putExtra("post_id", localVinePost.postId).putExtra("post_author_id", localVinePost.userId).putExtra("hide_keyboard", true));
              }
            };
            localRelativeLayout4.setOnClickListener(local10);
            if (!this.mLikeCache.contains(localVinePost.postId))
              break label1305;
            bool1 = this.mLikeCache.isLike(localVinePost.postId);
            localVinePost.setFlagLiked(bool1);
            label1061: if (!bool1)
              break label1344;
            paramExploreFeedViewHolder.liked.setImageResource(2130837714);
          }
        }
      }
    while (true)
    {
      paramExploreFeedViewHolder.liked.setTag(Long.valueOf(localVinePost.postId));
      paramExploreFeedViewHolder.liked.setOnClickListener(this.mViewClickListener);
      paramExploreFeedViewHolder.more.setTag(localVinePost);
      paramExploreFeedViewHolder.more.setOnClickListener(this.mViewClickListener);
      if ((localVinePost.userId != this.mAppController.getActiveId()) && (!localVinePost.isPrivate()))
        break label1357;
      paramExploreFeedViewHolder.revine.setVisibility(8);
      return;
      label1152: if (!localVineEntity1.isTagType())
        break;
      StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(4, localVineEntity1.title, this.mSpanClickListener);
      localStyledClickableSpan3.setColor(this.mVineGreen);
      Util.safeSetSpan(localSpannableStringBuilder2, localStyledClickableSpan3, localVineEntity1.start, localVineEntity1.end, 33);
      break;
      paramExploreFeedViewHolder.description.setText(localVinePost.description);
      break label515;
      paramExploreFeedViewHolder.description.setVisibility(8);
      break label515;
      label1236: paramExploreFeedViewHolder.locationContainer.setVisibility(8);
      break label598;
      label1248: localRelativeLayout1.setVisibility(8);
      break label897;
      label1258: paramExploreFeedViewHolder.olderCommentsContainer.setVisibility(8);
      paramExploreFeedViewHolder.commentType = 1;
      break label1028;
      label1275: localRelativeLayout2.setVisibility(8);
      break label1028;
      label1285: setStyledCompactLikesComments(paramExploreFeedViewHolder, localVinePost.likesCount, localVinePost.commentsCount, localVinePost.revinersCount);
      break label1028;
      label1305: bool1 = localVinePost.isLiked();
      if (bool1)
      {
        this.mLikeCache.like(localVinePost.postId);
        break label1061;
      }
      this.mLikeCache.unlike(localVinePost.postId);
      break label1061;
      label1344: paramExploreFeedViewHolder.liked.setImageResource(2130837647);
    }
    label1357: paramExploreFeedViewHolder.revine.setVisibility(0);
    boolean bool2;
    if (this.mRevineCache.contains(localVinePost.postId))
    {
      bool2 = this.mRevineCache.isRevined(localVinePost.postId);
      localVinePost.setFlagRevined(bool2);
      if (!bool2)
        break label1506;
      paramExploreFeedViewHolder.revine.setImageResource(2130837684);
    }
    while (true)
    {
      paramExploreFeedViewHolder.revine.setTag(localVinePost);
      paramExploreFeedViewHolder.revine.setOnClickListener(this.mViewClickListener);
      return;
      if ((localVinePost.myRepostId > 0L) || (localVinePost.isRevined()));
      for (bool2 = true; ; bool2 = false)
      {
        if (!bool2)
          break label1492;
        this.mRevineCache.putMyRepostId(localVinePost.postId, localVinePost.myRepostId);
        this.mRevineCache.revine(localVinePost.postId);
        break;
      }
      label1492: this.mRevineCache.unRevine(localVinePost.postId);
      break;
      label1506: paramExploreFeedViewHolder.revine.setImageResource(2130837682);
    }
  }

  private boolean dismissVideo()
  {
    SLog.d("Dismiss Video.");
    this.mVideoView.removeVideoUri();
    if (this.mVideoOverlay.getVisibility() == 0)
    {
      this.mVideoOverlay.setVisibility(8);
      if (this.mVideoView.hasStarted())
        this.mVideoView.stopPlayback();
      return true;
    }
    return false;
  }

  private void onVideoStarted()
  {
    SLog.d("Video Started.");
    this.mVideoLoadProgressBar.setVisibility(8);
    this.mHandler.postDelayed(new Runnable()
    {
      public void run()
      {
        if (ExploreFeedAdapter.this.mVideoOverlay.getVisibility() == 0)
          ExploreFeedAdapter.this.mVideoView.setBackgroundDrawable(null);
      }
    }
    , 300L);
  }

  private void showVideo(ExploreFeedViewHolder paramExploreFeedViewHolder, boolean paramBoolean)
  {
    VideoKey localVideoKey;
    if (paramExploreFeedViewHolder != null)
    {
      SLog.d("Show Video: {}.", Boolean.valueOf(paramBoolean));
      this.mShouldBePlayingHolder = paramExploreFeedViewHolder;
      if (!paramBoolean)
        this.mVideoView.setReportOpenVideoError(false);
      localVideoKey = getRequestKey(paramExploreFeedViewHolder.post, paramBoolean);
      if ((localVideoKey == null) && (!paramBoolean))
        onInvalidRequestKey();
    }
    else
    {
      return;
    }
    String str = this.mAppController.getVideoFilePath(localVideoKey);
    this.mVideoView.setTag(paramExploreFeedViewHolder);
    this.mVideoView.setMute(MuteUtil.isMuted(this.mContext));
    this.mVideoView.setBackgroundDrawable(paramExploreFeedViewHolder.videoImage.getBackground());
    this.mVideoLoadProgressBar.setVisibility(0);
    if (str != null)
      this.mVideoView.setVideoPath(str);
    this.mHandler.postDelayed(new Runnable()
    {
      public void run()
      {
        if (ExploreFeedAdapter.this.mVideoOverlay.getVisibility() != 0)
        {
          ExploreFeedAdapter.this.mVideoOverlay.setVisibility(0);
          if (ExploreFeedAdapter.this.mVideoView.hasStarted())
            ExploreFeedAdapter.this.mVideoView.onPrepared();
        }
      }
    }
    , 250L);
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    int i = paramCursor.getPosition();
    ExploreFeedViewHolder localExploreFeedViewHolder = (ExploreFeedViewHolder)paramView.getTag();
    localExploreFeedViewHolder.post = bindCursorToPost(paramCursor);
    localExploreFeedViewHolder.position = i;
    if (localExploreFeedViewHolder.post == null)
    {
      CrashUtil.logException(new VineException("Post was null: " + i));
      return;
    }
    bindView(localExploreFeedViewHolder);
  }

  protected void createInsensitiveListener(ExploreFeedViewHolder paramExploreFeedViewHolder)
  {
    paramExploreFeedViewHolder.sensitiveTextContainer.setVisibility(8);
    paramExploreFeedViewHolder.sensitiveTextContainer.setOnClickListener(null);
    paramExploreFeedViewHolder.sensitiveTextContainer.setClickable(false);
    paramExploreFeedViewHolder.imageListener = new SensitiveImageClickListener(this.mDismissedWarnings)
    {
      public void onClick(View paramAnonymousView)
      {
        View localView = ExploreFeedAdapter.this.getViewAtPosition(this.mPosition);
        if (localView != null)
        {
          ExploreFeedViewHolder localExploreFeedViewHolder = (ExploreFeedViewHolder)localView.getTag();
          if (localExploreFeedViewHolder != null)
            ExploreFeedAdapter.this.showVideo(localExploreFeedViewHolder, false);
        }
      }
    };
    paramExploreFeedViewHolder.videoImage.setOnClickListener(paramExploreFeedViewHolder.imageListener);
  }

  protected void createSensitiveLisenter(final ExploreFeedViewHolder paramExploreFeedViewHolder)
  {
    paramExploreFeedViewHolder.imageListener = new SensitiveImageClickListener(this.mDismissedWarnings)
    {
      public void onClick(View paramAnonymousView)
      {
        ExploreFeedAdapter.this.mDismissedWarnings.add(Integer.valueOf(this.mPosition));
        ExploreFeedAdapter.this.bindVideoImage(paramExploreFeedViewHolder);
        ExploreFeedAdapter.this.showVideo(paramExploreFeedViewHolder, false);
      }
    };
    paramExploreFeedViewHolder.sensitiveTextContainer.setOnClickListener(paramExploreFeedViewHolder.imageListener);
    paramExploreFeedViewHolder.sensitiveTextContainer.setClickable(true);
    paramExploreFeedViewHolder.isVideoImageLoaded = true;
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    View localView = LayoutInflater.from(paramContext).inflate(2130903115, null);
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
    ExploreFeedViewHolder localExploreFeedViewHolder = new ExploreFeedViewHolder(localView);
    localExploreFeedViewHolder.likers.setMovementMethod(LinkMovementMethod.getInstance());
    localView.setTag(localExploreFeedViewHolder);
    this.mViewHolders.add(new WeakReference(localExploreFeedViewHolder));
    return localView;
  }

  public boolean onBackPressed()
  {
    return dismissVideo();
  }

  public void onPause(boolean paramBoolean)
  {
    dismissVideo();
  }

  public void onVideoPathObtained(HashMap<VideoKey, UrlVideo> paramHashMap)
  {
    ExploreFeedViewHolder localExploreFeedViewHolder = this.mShouldBePlayingHolder;
    if (localExploreFeedViewHolder != null)
    {
      String str1 = localExploreFeedViewHolder.post.videoUrl;
      String str2 = localExploreFeedViewHolder.post.videoLowURL;
      Iterator localIterator = paramHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        VideoKey localVideoKey = (VideoKey)localIterator.next();
        UrlVideo localUrlVideo = (UrlVideo)paramHashMap.get(localVideoKey);
        if ((localUrlVideo != null) && (localUrlVideo.isValid()) && (((str1 != null) && (str1.equals(localVideoKey.url))) || ((str2 != null) && (str2.equals(localVideoKey.url)))))
        {
          String str3 = localUrlVideo.getAbsolutePath();
          this.mVideoView.setVideoPath(str3);
        }
      }
    }
  }

  public void toggleMute(boolean paramBoolean)
  {
    super.toggleMute(paramBoolean);
    if (this.mVideoView != null)
      this.mVideoView.setMute(paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.ExploreFeedAdapter
 * JD-Core Version:    0.6.2
 */