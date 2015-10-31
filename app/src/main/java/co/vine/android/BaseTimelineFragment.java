package co.vine.android;

import android.app.ActionBar;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.support.v7.app.ActionBarActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AbsListView;
import android.widget.ListView;
import co.vine.android.api.VineComparatorFactory;
import co.vine.android.api.VineComparatorFactory.VineComparator;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineRepost;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.network.HttpResult;
import co.vine.android.provider.HybridPostCursor;
import co.vine.android.provider.HybridPostCursorExplore;
import co.vine.android.service.PendingAction;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.MuteUtil;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoKey;
import co.vine.android.widget.ExploreFeedAdapter;
import co.vine.android.widget.FeedAdapter;
import co.vine.android.widget.GenericTimelineAdapter;
import co.vine.android.widget.GenericVideoAdapter.SpanCommentObjectTag;
import co.vine.android.widget.SpanClickListener;
import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.SLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public abstract class BaseTimelineFragment extends BaseListFragment
  implements SpanClickListener, View.OnClickListener
{
  private static final int REQUEST_CODE_OPTIONS = 10;
  private static final String STATE_LIKE_CACHE = "state_like_cache";
  private static final String STATE_REVINE_CACHE = "state_revine_cache";
  private ActionBarActivity mCallback;
  protected int mCursorPreviousSize;
  protected int mCursorQuerySize;
  protected GenericTimelineAdapter mFeedAdapter;
  protected boolean mFetched;
  protected String mFlurryEventSource;
  protected final HashSet<View> mHeaderParents = new HashSet();
  protected int mLastFetchType;
  protected LikeCache mLikeCache;
  private final BroadcastReceiver mMuteChangeReceiver = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      if ((paramAnonymousIntent == null) || (paramAnonymousIntent.getAction() == null))
      {
        CrashUtil.log("Something wrong has happened");
        return;
      }
      boolean bool = paramAnonymousIntent.getAction().equals(MuteUtil.ACTION_CHANGED_TO_MUTE);
      BaseTimelineFragment.this.mFeedAdapter.toggleMute(bool);
    }
  };
  protected int mPage;
  protected int mRestoreOffset;
  protected long mRestoreStatusId;
  protected RevineCache mRevineCache;

  private void startReshareActivity(String paramString, Intent paramIntent)
  {
    FragmentActivity localFragmentActivity = getActivity();
    localFragmentActivity.startActivity(ReshareActivity.getReshareIntent(localFragmentActivity, paramString, paramIntent.getExtras()));
  }

  public void addHeaderView(View paramView, Object paramObject, boolean paramBoolean)
  {
    this.mListView.addHeaderView(paramView, paramObject, paramBoolean);
    this.mHeaderParents.add(paramView);
  }

  protected void fetchContent(int paramInt, boolean paramBoolean)
  {
    this.mLastFetchType = paramInt;
    if (hasPendingRequest(paramInt))
      return;
    this.mFetched = true;
    int i;
    switch (paramInt)
    {
    case 3:
    default:
      i = 1;
    case 2:
    case 4:
    case 1:
    }
    while (true)
    {
      if (paramBoolean)
        showProgress(paramInt);
      addRequest(fetchPosts(i, paramBoolean), paramInt);
      return;
      i = 2;
      continue;
      i = 3;
    }
  }

  protected abstract String fetchPosts(int paramInt, boolean paramBoolean);

  public HashSet<View> getHeaderViewParents()
  {
    return this.mHeaderParents;
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    FragmentActivity localFragmentActivity = getActivity();
    if (BuildUtil.isExplore());
    for (this.mFeedAdapter = new ExploreFeedAdapter(localFragmentActivity, this.mListView, this.mLikeCache, this.mRevineCache, this, this.mFlurryEventSource); ; this.mFeedAdapter = new FeedAdapter(localFragmentActivity, this.mListView, this.mLikeCache, this.mRevineCache, this, this.mFlurryEventSource))
    {
      this.mCursorAdapter = this.mFeedAdapter;
      if (BuildUtil.isOldDeviceOrLowEndDevice(localFragmentActivity))
        this.mFeedAdapter.setCompactLikesComments(true);
      return;
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
    case 10:
    }
    label27: String str1;
    do
    {
      long l1;
      do
      {
        long l2;
        do
        {
          break label27;
          do
            return;
          while ((paramInt2 != -1) || (paramIntent == null));
          str1 = paramIntent.getAction();
          if (!"action_report".equals(str1))
            break;
          l2 = paramIntent.getLongExtra("post_id", 0L);
        }
        while (l2 <= 0L);
        addRequest(this.mAppController.reportPost(this.mAppController.getActiveSession(), l2));
        return;
        if (!"action_delete".equals(str1))
          break;
        l1 = paramIntent.getLongExtra("post_id", 0L);
      }
      while (l1 <= 0L);
      addRequest(this.mAppController.deletePost(this.mAppController.getActiveSession(), l1));
      return;
      if ("action_twitter".equals(str1))
      {
        startReshareActivity("twitter", paramIntent);
        return;
      }
      if ("action_facebook".equals(str1))
      {
        startReshareActivity("facebook", paramIntent);
        return;
      }
    }
    while (!"action_other".equals(str1));
    FlurryUtils.trackSharePost("other", paramIntent.getLongExtra("post_id", 0L));
    Resources localResources = getResources();
    String str2 = paramIntent.getStringExtra("name");
    String str3 = paramIntent.getStringExtra("share_url");
    Intent localIntent = new Intent("android.intent.action.SEND");
    localIntent.setType("text/plain");
    localIntent.addFlags(524288);
    localIntent.putExtra("android.intent.extra.SUBJECT", localResources.getString(2131624340, new Object[] { str2 }));
    localIntent.putExtra("android.intent.extra.TEXT", localResources.getString(2131624341, new Object[] { str2, str3 }));
    startActivity(localIntent);
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    if ((paramActivity instanceof ActionBarActivity))
      this.mCallback = ((ActionBarActivity)paramActivity);
  }

  public boolean onBackPressed()
  {
    return this.mFeedAdapter.onBackPressed();
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131362013:
    default:
      return;
    case 2131362012:
      Long localLong = (Long)paramView.getTag();
      if (this.mLikeCache.isLike(localLong.longValue()))
      {
        addRequest(this.mAppController.unlikePost(this.mFlurryEventSource, this.mAppController.getActiveSession(), localLong.longValue(), true));
        this.mLikeCache.unlike(localLong.longValue());
        this.mFeedAdapter.showUnlikedByMe(localLong.longValue());
        return;
      }
      addRequest(this.mAppController.likePost(this.mFlurryEventSource, this.mAppController.getActiveSession(), localLong.longValue(), this.mAppController.getActiveId(), this.mAppController.getActiveSession().getName(), false));
      this.mLikeCache.like(localLong.longValue());
      this.mFeedAdapter.showLikedByMe(localLong.longValue());
      return;
    case 2131362015:
      VinePost localVinePost2 = (VinePost)paramView.getTag();
      boolean bool2;
      boolean bool3;
      label256: Intent localIntent2;
      boolean bool4;
      label305: boolean bool5;
      if (localVinePost2.userId == this.mAppController.getActiveId())
      {
        bool2 = true;
        Intent localIntent1 = new Intent(getActivity(), PostOptionsDialogActivity.class).putExtra("post_id", localVinePost2.postId).putExtra("delete", bool2);
        if (bool2)
          break label442;
        bool3 = true;
        localIntent2 = localIntent1.putExtra("report", bool3);
        if (((localVinePost2.isShareable()) && (!localVinePost2.isPrivate())) || (bool2))
        {
          if ((!localVinePost2.isShareable()) && (!bool2))
            break label448;
          bool4 = true;
          localIntent2.putExtra("post_twitter", bool4);
          if ((!localVinePost2.isShareable()) && (!bool2))
            break label454;
          bool5 = true;
          label332: localIntent2.putExtra("post_facebook", bool5);
          if ((!localVinePost2.isShareable()) && (!bool2))
            break label460;
        }
      }
      label442: label448: label454: label460: for (boolean bool6 = true; ; bool6 = false)
      {
        localIntent2.putExtra("share_other", bool6);
        localIntent2.putExtra("description", localVinePost2.description);
        localIntent2.putExtra("share_url", localVinePost2.shareUrl);
        localIntent2.putExtra("thumbnail_url", localVinePost2.thumbnailUrl);
        localIntent2.putExtra("name", localVinePost2.username);
        getActivity().startActivityForResult(localIntent2, 10);
        return;
        bool2 = false;
        break;
        bool3 = false;
        break label256;
        bool4 = false;
        break label305;
        bool5 = false;
        break label332;
      }
    case 2131362014:
    }
    VinePost localVinePost1 = (VinePost)paramView.getTag();
    if (this.mRevineCache.isRevined(localVinePost1.postId))
    {
      if ((localVinePost1.user != null) && (localVinePost1.user.isFollowing()));
      for (boolean bool1 = true; ; bool1 = false)
      {
        if ((localVinePost1.postId == 0L) && (this.mRevineCache.getMyRepostId(localVinePost1.postId) == 0L))
          Crashlytics.logException(new VineException("Invalid unrevine: post userId " + localVinePost1.userId + " comments count " + localVinePost1.commentsCount + " created at " + localVinePost1.created));
        addRequest(this.mAppController.unRevine(this.mFlurryEventSource, this.mAppController.getActiveSession(), localVinePost1.postId, this.mRevineCache.getMyRepostId(localVinePost1.postId), bool1, localVinePost1.userId, true));
        this.mRevineCache.unRevine(localVinePost1.postId);
        this.mFeedAdapter.updateRevinedCount(localVinePost1.postId, false);
        return;
      }
    }
    addRequest(this.mAppController.revine(this.mFlurryEventSource, this.mAppController.getActiveSession(), localVinePost1.postId, this.mAppController.getActiveSession().getName()));
    this.mRevineCache.revine(localVinePost1.postId);
    this.mFeedAdapter.updateRevinedCount(localVinePost1.postId, true);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new TimeLineSessionListener();
    if ((paramBundle != null) && (paramBundle.containsKey("state_like_cache")))
      this.mLikeCache = ((LikeCache)paramBundle.getParcelable("state_like_cache"));
    for (this.mRevineCache = ((RevineCache)paramBundle.getParcelable("state_revine_cache")); ; this.mRevineCache = new RevineCache())
    {
      this.mCursorQuerySize = Util.getNextCursorSize(0);
      return;
      this.mLikeCache = new LikeCache();
    }
  }

  public abstract Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle);

  public void onDestroy()
  {
    try
    {
      super.onDestroy();
      this.mFeedAdapter.onDestroy();
      return;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException, "Failed to remove timeline fragment", new Object[0]);
    }
  }

  public void onDestroyView()
  {
    this.mFeedAdapter.onDestroyView();
    super.onDestroyView();
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    if ((this.mCursorAdapter.isEmpty()) && (!this.mFetched))
    {
      this.mFeedAdapter.onPause(isFocused());
      fetchContent(3, true);
    }
    label121: 
    while (true)
    {
      return;
      hideProgress(3);
      if (!this.mFetched)
        refreshSilently();
      while (true)
      {
        if (this.mLastFetchType != 7)
          break label121;
        hideProgress(7);
        if ((this.mFeedAdapter == null) || (this.mFeedAdapter.getCursor() == null))
          break label123;
        if (this.mFeedAdapter.getCursor().getCount() > this.mCursorPreviousSize)
          break;
        fetchContent(1, true);
        return;
        showSadface(false);
      }
    }
    label123: CrashUtil.logException(new VineException(), "Possible cursor swapped with null, cursor: {}.", new Object[] { paramCursor });
  }

  public void onMoveAway(int paramInt)
  {
    super.onMoveAway(paramInt);
    this.mFeedAdapter.onPause(isFocused());
  }

  public void onMoveTo(int paramInt)
  {
    super.onMoveTo(paramInt);
    if (this.mCursorAdapter.isEmpty())
      fetchContent(3, true);
    this.mFeedAdapter.onResume(isFocused());
  }

  public void onPause()
  {
    super.onPause();
    getActivity().unregisterReceiver(this.mMuteChangeReceiver);
  }

  public void onResume()
  {
    super.onResume();
    getActivity().registerReceiver(this.mMuteChangeReceiver, MuteUtil.MUTE_INTENT_FILTER);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putParcelable("state_like_cache", this.mLikeCache);
    paramBundle.putParcelable("state_revine_cache", this.mRevineCache);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    Cursor localCursor = this.mFeedAdapter.getCursor();
    if ((this.mRefreshable) && (!localCursor.getExtras().getBoolean("is_last")) && (localCursor.getCount() <= 400))
    {
      this.mFeedAdapter.onPause(isFocused());
      this.mCursorPreviousSize = localCursor.getCount();
      this.mCursorQuerySize = Util.getNextCursorSize(this.mCursorPreviousSize);
      this.mLastFetchType = 7;
      showProgress(7);
      restartLoader();
      this.mPage = (1 + this.mPage);
      FlurryUtils.trackTimeLinePageScroll(getClass().getName(), this.mPage);
    }
  }

  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    try
    {
      super.onScrollStateChanged(paramAbsListView, paramInt);
      this.mFeedAdapter.onScrollStateChanged(paramAbsListView, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void onSpanClicked(View paramView, int paramInt, Object paramObject)
  {
    FragmentActivity localFragmentActivity = getActivity();
    if (localFragmentActivity != null);
    switch (paramInt)
    {
    case 5:
    case 6:
    default:
      return;
    case 2:
      Long localLong = (Long)paramObject;
      Intent localIntent2 = new Intent(localFragmentActivity, UsersActivity.class);
      localIntent2.putExtra("post_id", localLong.longValue());
      localIntent2.putExtra("u_type", 5);
      startActivity(localIntent2);
      return;
    case 1:
      ProfileActivity.start(localFragmentActivity, ((Long)paramObject).longValue(), this.mFlurryEventSource);
      return;
    case 4:
      HashtagActivity.start(localFragmentActivity, (String)paramObject);
      return;
    case 3:
      GenericVideoAdapter.SpanCommentObjectTag localSpanCommentObjectTag2 = (GenericVideoAdapter.SpanCommentObjectTag)paramObject;
      startActivity(new Intent(localFragmentActivity, CommentsActivity.class).putExtra("post_id", localSpanCommentObjectTag2.postId).putExtra("post_author_id", localSpanCommentObjectTag2.authorId).putExtra("hide_keyboard", true));
      return;
    case 7:
      GenericVideoAdapter.SpanCommentObjectTag localSpanCommentObjectTag1 = (GenericVideoAdapter.SpanCommentObjectTag)paramObject;
      Intent localIntent1 = new Intent(localFragmentActivity, UsersActivity.class);
      localIntent1.putExtra("post_id", localSpanCommentObjectTag1.postId);
      localIntent1.putExtra("u_type", 9);
      startActivity(localIntent1);
      return;
    case 8:
    }
    ProfileActivity.start(localFragmentActivity, ((Long)paramObject).longValue(), this.mFlurryEventSource);
  }

  protected void refresh()
  {
    hideProgress(2);
    fetchContent(2, true);
  }

  protected void refreshSilently()
  {
    hideProgress(2);
    fetchContent(2, false);
  }

  protected boolean trackNewCount()
  {
    return false;
  }

  class TimeLineSessionListener extends AppSessionListener
  {
    TimeLineSessionListener()
    {
    }

    public void onCaptchaRequired(String paramString1, String paramString2, PendingAction paramPendingAction)
    {
      if (BaseTimelineFragment.this.removeRequest(paramString1) != null)
      {
        BaseTimelineFragment.this.mPendingCaptchaRequest = new PendingCaptchaRequest(paramString1, paramPendingAction.actionCode, paramPendingAction.bundle);
        BaseTimelineFragment.this.showCaptcha(paramString1, paramString2);
      }
    }

    public void onDeletePostComplete(String paramString1, int paramInt, String paramString2)
    {
      if (BaseTimelineFragment.this.removeRequest(paramString1) != null)
      {
        if (paramInt == 200)
          Util.showCenteredToast(BaseTimelineFragment.this.getActivity(), 2131624218);
      }
      else
        return;
      Util.showCenteredToast(BaseTimelineFragment.this.getActivity(), 2131624219);
    }

    public void onGetCommentsComplete(String paramString1, int paramInt1, String paramString2, long paramLong, int paramInt2)
    {
      super.onGetCommentsComplete(paramString1, paramInt1, paramString2, paramLong, paramInt2);
    }

    public void onGetTimeLineComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, boolean paramBoolean1, ArrayList<VinePost> paramArrayList, String paramString3, int paramInt4, int paramInt5, int paramInt6, long paramLong, boolean paramBoolean2, int paramInt7, String paramString4)
    {
      PendingRequest localPendingRequest = BaseTimelineFragment.this.removeRequest(paramString1);
      Cursor localCursor1;
      VineComparatorFactory.VineComparator localVineComparator;
      ArrayList localArrayList;
      Object localObject;
      if (localPendingRequest != null)
      {
        if ((paramBoolean1) && (paramInt1 == 200))
        {
          if ((SLog.sLogsOn) && (BaseTimelineFragment.this.mFeedAdapter.getStartLoadingTime() > 0L))
            SLog.i("Time since started loading to end fetch: {}ms", Long.valueOf(BaseTimelineFragment.this.mFeedAdapter.timeSinceStartLoadingTime()));
          localCursor1 = BaseTimelineFragment.this.mCursorAdapter.getCursor();
          localVineComparator = VineComparatorFactory.get(paramInt2);
          if ((localCursor1 != null) && (localCursor1.getCount() != 0))
            break label341;
          localArrayList = HybridPostCursor.mergePosts(null, paramArrayList, localVineComparator, BaseTimelineFragment.this.trackNewCount());
          if (localArrayList != null)
          {
            if (!BuildUtil.isOldDeviceOrLowEndDevice(BaseTimelineFragment.this.getActivity()))
              break label399;
            int j = BaseTimelineFragment.this.mCursorQuerySize;
            localObject = new HybridPostCursorExplore(localArrayList, j);
            label157: if (paramInt5 <= 0)
              ((HybridPostCursor)localObject).markLast();
            Cursor localCursor2 = BaseTimelineFragment.this.mCursorAdapter.swapCursor((Cursor)localObject);
            if (BaseTimelineFragment.this.mChangeObserver != null)
            {
              if (localCursor2 != null)
                localCursor2.unregisterContentObserver(BaseTimelineFragment.this.mChangeObserver);
              ((HybridPostCursor)localObject).registerContentObserver(BaseTimelineFragment.this.mChangeObserver);
            }
            BaseTimelineFragment.this.mCursorAdapter.notifyDataSetChanged();
            BaseTimelineFragment.this.mCursorQuerySize = localArrayList.size();
            BaseTimelineFragment.this.mAppController.saveLoadedPosts(paramArrayList, paramInt2, paramString3, paramInt4, paramInt5, paramInt6, paramLong, false);
          }
        }
        switch (localPendingRequest.fetchType)
        {
        default:
          BaseTimelineFragment.this.hideProgress(localPendingRequest.fetchType);
        case 3:
        }
      }
      while (true)
      {
        if ((!TextUtils.isEmpty(paramString4)) && (BaseTimelineFragment.this.mCallback.getActionBar() != null))
          BaseTimelineFragment.this.mCallback.getActionBar().setTitle(paramString4);
        return;
        label341: Bundle localBundle = new Bundle();
        localBundle.putBoolean("include_list", true);
        localCursor1.respond(localBundle);
        localArrayList = HybridPostCursor.mergePosts(localCursor1.getExtras().getParcelableArrayList("extra_posts"), paramArrayList, localVineComparator, BaseTimelineFragment.this.trackNewCount());
        break;
        label399: int i = BaseTimelineFragment.this.mCursorQuerySize;
        localObject = new HybridPostCursor(localArrayList, i);
        break label157;
        if ((BaseTimelineFragment.this.mCursorAdapter != null) && (BaseTimelineFragment.this.mCursorAdapter.isEmpty()) && (paramInt3 == 0))
        {
          BaseTimelineFragment.this.hideProgress(localPendingRequest.fetchType);
          BaseTimelineFragment.this.showSadface(true);
        }
        else
        {
          BaseTimelineFragment.this.showSadface(false);
        }
      }
    }

    public void onLikePost(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((BaseTimelineFragment.this.removeRequest(paramString1) != null) && (paramInt != 200))
      {
        BaseTimelineFragment.this.mLikeCache.removeEntry(paramLong);
        BaseTimelineFragment.this.mFeedAdapter.showUnlikedByMe(paramLong);
        BaseTimelineFragment.this.mCursorAdapter.notifyDataSetChanged();
      }
    }

    public void onLowMemory()
    {
      super.onLowMemory();
      GenericTimelineAdapter localGenericTimelineAdapter = BaseTimelineFragment.this.mFeedAdapter;
      if (localGenericTimelineAdapter != null)
        localGenericTimelineAdapter.onLowMemory();
    }

    public void onPhotoImageError(ImageKey paramImageKey, HttpResult paramHttpResult)
    {
      super.onPhotoImageError(paramImageKey, paramHttpResult);
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      BaseTimelineFragment.this.mFeedAdapter.setImages(paramHashMap);
    }

    public void onReportPostComplete(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if (BaseTimelineFragment.this.removeRequest(paramString1) != null)
      {
        if (paramInt == 200)
          Util.showCenteredToast(BaseTimelineFragment.this.getActivity(), 2131624223);
      }
      else
        return;
      Util.showCenteredToast(BaseTimelineFragment.this.getActivity(), 2131624224);
    }

    public void onRevine(String paramString1, int paramInt, String paramString2, long paramLong, VineRepost paramVineRepost)
    {
      if (BaseTimelineFragment.this.removeRequest(paramString1) != null)
      {
        if (paramInt != 200)
        {
          BaseTimelineFragment.this.mRevineCache.unRevine(paramLong);
          BaseTimelineFragment.this.mCursorAdapter.notifyDataSetChanged();
          BaseTimelineFragment.this.mFeedAdapter.updateRevinedCount(paramLong, false);
        }
      }
      else
        return;
      BaseTimelineFragment.this.mRevineCache.putMyRepostId(paramVineRepost.postId, paramVineRepost.repostId);
    }

    public void onTrimMemory(int paramInt)
    {
      super.onTrimMemory(paramInt);
      GenericTimelineAdapter localGenericTimelineAdapter = BaseTimelineFragment.this.mFeedAdapter;
      if (localGenericTimelineAdapter != null)
        localGenericTimelineAdapter.onTrimMemory(paramInt);
    }

    public void onUnlikePost(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if ((BaseTimelineFragment.this.removeRequest(paramString1) != null) && (paramInt != 200))
      {
        BaseTimelineFragment.this.mLikeCache.like(paramLong);
        BaseTimelineFragment.this.mFeedAdapter.showLikedByMe(paramLong);
        BaseTimelineFragment.this.mCursorAdapter.notifyDataSetChanged();
      }
    }

    public void onUnrevine(String paramString1, int paramInt, String paramString2, long paramLong)
    {
      if (BaseTimelineFragment.this.removeRequest(paramString1) != null)
      {
        if (paramInt != 200)
        {
          BaseTimelineFragment.this.mRevineCache.revine(paramLong);
          BaseTimelineFragment.this.mCursorAdapter.notifyDataSetChanged();
          BaseTimelineFragment.this.mFeedAdapter.updateRevinedCount(paramLong, true);
        }
      }
      else
        return;
      BaseTimelineFragment.this.mRevineCache.removeEntry(paramLong);
    }

    public void onVideoPathError(VideoKey paramVideoKey, HttpResult paramHttpResult)
    {
      Log.e("s", "Download of video failed: " + paramHttpResult.reasonPhrase + " key: " + paramVideoKey.url);
    }

    public void onVideoPathObtained(HashMap<VideoKey, UrlVideo> paramHashMap)
    {
      BaseTimelineFragment.this.mFeedAdapter.onVideoPathObtained(paramHashMap);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseTimelineFragment
 * JD-Core Version:    0.6.2
 */