package co.vine.android.util;

import android.content.Context;
import android.view.View;
import co.vine.android.api.VineError;
import com.flurry.android.FlurryAgent;
import java.util.HashMap;

public class FlurryUtils
{
  private static final String LOADING_KEY = "Loading";
  private static boolean isSignupFailed;
  private static final HashMap<String, String> mLoadingTime = new HashMap();
  private static boolean sRecordingCamera;
  private static boolean sRecordingFocus;
  private static boolean sRecordingGhost;
  private static boolean sRecordingGrid;
  private static boolean sRecordingSession;

  private static String getBucketedTime(long paramLong)
  {
    if (paramLong < 1000L)
      return String.valueOf(100L * (paramLong / 100L)) + "ms";
    return String.valueOf(Math.max(500L * (paramLong / 500L) / 1000.0D, 1.0D) + "s");
  }

  public static void onSignupFailure(boolean paramBoolean, VineError paramVineError, int paramInt)
  {
    isSignupFailed = true;
    FlurryEvent localFlurryEvent = new FlurryEvent("SignupFailure");
    if (paramVineError != null)
      localFlurryEvent.add("errorCode", Integer.valueOf(paramVineError.errorCode)).add("message", paramVineError.message);
    localFlurryEvent.add("isTwitter", Boolean.valueOf(paramBoolean)).add("statusCode", Integer.valueOf(paramInt)).log();
  }

  public static void onSignupSuccess(boolean paramBoolean)
  {
    isSignupFailed = false;
    FlurryEvent.log("SignupSuccess", "isTwitter", Boolean.valueOf(paramBoolean));
  }

  public static void start(Context paramContext)
  {
    try
    {
      FlurryAgent.onStartSession(paramContext, "K5MVVCSN2MQ89JDRWKGY");
      return;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException);
    }
  }

  public static void stop(Context paramContext)
  {
    try
    {
      FlurryAgent.onEndSession(paramContext);
      return;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException);
    }
  }

  public static void trackAbandonedStage(String paramString)
  {
    FlurryEvent.log("Abandon", "stage", paramString);
  }

  public static void trackAddressNewFollowingCount(String paramString)
  {
    FlurryEvent.log("FindFriendsAddressNewFollowing", "Count", paramString);
  }

  public static void trackAttribution()
  {
    FlurryEvent.log("Attribution");
  }

  public static void trackBackFromPostScreen()
  {
    FlurryEvent.log("BackToPreviewFromPostScreen");
  }

  public static void trackBlockUser()
  {
    FlurryEvent.log("BlockUser");
  }

  public static void trackCameraSwitchPressed(View paramView)
  {
    if ((paramView != null) && (!sRecordingCamera))
    {
      sRecordingCamera = true;
      FlurryEvent.log("RecordingCamera");
    }
  }

  public static void trackChangedDescription()
  {
    FlurryEvent.log("Settings_ChangedDescription");
  }

  public static void trackChangedEdition()
  {
    FlurryEvent.log("ChangedEdition");
  }

  public static void trackChangedEmail()
  {
    FlurryEvent.log("Settings_ChangedEmail");
  }

  public static void trackChangedLocation()
  {
    FlurryEvent.log("Settings_ChangedLocation");
  }

  public static void trackChangedName()
  {
    FlurryEvent.log("Settings_ChangedName");
  }

  public static void trackChannelChange(String paramString)
  {
    FlurryEvent.log("PostChannelChange", "channelDetails", paramString);
  }

  public static void trackConnectFacebook()
  {
    FlurryEvent.log("ConnectFacebook");
  }

  public static void trackConnectTwitter()
  {
    FlurryEvent.log("ConnectTwitter");
  }

  public static void trackContentControls()
  {
    FlurryEvent.log("ContentControls");
  }

  public static void trackDeactivateAccount()
  {
    FlurryEvent.log("DeactivateAccount");
  }

  public static void trackDeleteComment()
  {
    FlurryEvent.log("DeleteComment");
  }

  public static void trackDisConnectTwitter()
  {
    FlurryEvent.log("DisconnectTwitter");
  }

  public static void trackFilterProfileReposts(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (paramBoolean1);
    for (String str = "ProfileRepostsHidden"; ; str = "ProfileRepostsShown")
    {
      FlurryEvent.log(str, "Is Following", Boolean.valueOf(paramBoolean2), "Is Me", Boolean.valueOf(paramBoolean3));
      return;
    }
  }

  public static void trackFindFriendsAddressCount(int paramInt)
  {
    FlurryEvent.log("FindFriendsAddressResultsCount", "Result Count", Integer.valueOf(paramInt));
  }

  public static void trackFindFriendsAddressFailure()
  {
    FlurryEvent.log("FindFriendsAddressFailure");
  }

  public static void trackFindFriendsTabSelect(int paramInt)
  {
    FlurryEvent.log("FindFriendsTabSelect", "Address/Twitter/Search", Integer.valueOf(paramInt));
  }

  public static void trackFindFriendsTwitterCount(int paramInt)
  {
    FlurryEvent.log("FindFriendsTwitterResultsCount", "Result Count", Integer.valueOf(paramInt));
  }

  public static void trackFindFriendsTwitterFailure()
  {
    FlurryEvent.log("FindFriendsTwitterFailure");
  }

  public static void trackFocusSwitchPressed(View paramView)
  {
    if ((paramView != null) && (!sRecordingFocus))
    {
      sRecordingFocus = true;
      FlurryEvent.log("RecordingFocus");
    }
  }

  public static void trackFollow(String paramString)
  {
    FlurryEvent.log("Follow", "source", paramString);
  }

  public static void trackGetComments()
  {
    FlurryEvent.log("GetComments");
  }

  public static void trackGetEditions()
  {
    FlurryEvent.log("GetEditions");
  }

  public static void trackGetUser(boolean paramBoolean)
  {
    FlurryEvent.log("ProfileFetch", "self", Boolean.valueOf(paramBoolean));
  }

  public static void trackGhostSwitchPressed(View paramView)
  {
    if ((paramView != null) && (!sRecordingGhost))
    {
      sRecordingGhost = true;
      FlurryEvent.log("RecordingGhost");
    }
  }

  public static void trackGraphTimelineRefreshNewCount(int paramInt)
  {
    FlurryEvent.log("GraphRefreshNewVideoCount", "count", Integer.valueOf(paramInt));
  }

  public static void trackGridSwitchPressed(View paramView)
  {
    if ((paramView != null) && (!sRecordingGrid))
    {
      sRecordingGrid = true;
      FlurryEvent.log("RecordingGrid");
    }
  }

  public static void trackInvite(String paramString1, String paramString2)
  {
    FlurryEvent.log("Invite_" + paramString1, "source", paramString2);
  }

  public static void trackInviteBannerViewed(long paramLong)
  {
    FlurryEvent.log("InviteBannerViews", "ViewCount", ">" + paramLong);
  }

  public static void trackLikePost(long paramLong, String paramString)
  {
    FlurryEvent.log("Like", "postId", Long.valueOf(paramLong), "Source View", paramString);
  }

  public static void trackLoadingTime(String paramString, long paramLong)
  {
    if (BuildUtil.isProduction())
    {
      mLoadingTime.put("Loading", String.valueOf(paramLong));
      FlurryAgent.logEvent("Loading_" + paramString, mLoadingTime);
    }
  }

  public static void trackLockOutSessionCount()
  {
    if (isSignupFailed)
    {
      isSignupFailed = false;
      FlurryEvent.log("SignUpLockOut");
    }
  }

  public static void trackLoginFailure(boolean paramBoolean, int paramInt)
  {
    FlurryEvent.log("LoginFailure", "isTwitter", Boolean.valueOf(paramBoolean), "statusCode", Integer.valueOf(paramInt));
  }

  public static void trackLoginSuccess(boolean paramBoolean)
  {
    FlurryEvent.log("LoginSuccess", "isTwitter", Boolean.valueOf(paramBoolean));
  }

  public static void trackLogout()
  {
    FlurryEvent.log("Logout");
  }

  public static void trackNotificationSettings()
  {
    FlurryEvent.log("NotificationSettings");
  }

  public static void trackPost(boolean paramBoolean)
  {
    FlurryEvent.log("Post", "Vine", Boolean.valueOf(paramBoolean));
  }

  public static void trackPostComment()
  {
    FlurryEvent.log("PostComment");
  }

  public static void trackPreviewAction(String paramString)
  {
    FlurryEvent.log("PreviewAction", "action", paramString);
  }

  public static void trackPrivacyPolicy()
  {
    FlurryEvent.log("PrivacyPolicy");
  }

  public static void trackProfileImageClick(boolean paramBoolean)
  {
    FlurryEvent.log("ProfileImageClick", "self", Boolean.valueOf(paramBoolean));
  }

  public static void trackRecordingDestroy()
  {
  }

  public static void trackRecordingInfo(int paramInt1, long paramLong1, long paramLong2, int paramInt2)
  {
    new FlurryEvent("Recording").add("Duration", Long.valueOf(paramLong1)).add("Wait time", Long.valueOf(paramLong2)).add("Cuts", Integer.valueOf(paramInt2)).add("Phase", Integer.valueOf(paramInt1)).log();
  }

  public static void trackRecordingStart()
  {
    sRecordingCamera = false;
    sRecordingFocus = false;
    sRecordingGrid = false;
    sRecordingGhost = false;
    sRecordingSession = false;
    FlurryEvent.log("RecordingStart");
  }

  public static void trackReportPost()
  {
    FlurryEvent.log("ReportPost");
  }

  public static void trackReportUser()
  {
    FlurryEvent.log("ReportUser");
  }

  public static void trackResetPassword()
  {
    FlurryEvent.log("ResetPassword");
  }

  public static void trackRespondTime(String paramString1, String paramString2, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    String str;
    FlurryEvent localFlurryEvent;
    if (BuildUtil.isProduction())
    {
      StringBuilder localStringBuilder = new StringBuilder().append("Response_");
      if (!paramBoolean)
        break label92;
      str = "video";
      localFlurryEvent = new FlurryEvent(str);
      if (!paramBoolean)
        break label100;
      localFlurryEvent.add("host", paramString1);
    }
    while (true)
    {
      localFlurryEvent.add("statusTime", getBucketedTime(paramLong1)).add("totalTime", getBucketedTime(paramLong2)).log();
      return;
      label92: str = "generic";
      break;
      label100: localFlurryEvent.add("host", paramString1).add("path", paramString2);
    }
  }

  public static void trackRevine(long paramLong, String paramString)
  {
    FlurryEvent.log("Revine", "postId", Long.valueOf(paramLong), "Source View", paramString);
  }

  public static void trackSaveSession(String paramString)
  {
    FlurryEvent.log("SaveSession", "source", paramString);
  }

  public static void trackSearchTags()
  {
    FlurryEvent.log("SearchTags");
  }

  public static void trackSearchUsers()
  {
    FlurryEvent.log("SearchUser");
  }

  public static void trackSeeReviners()
  {
    FlurryEvent.log("SeeReviners");
  }

  public static void trackSessionSwitchPressed(View paramView)
  {
    if ((paramView != null) && (!sRecordingSession))
    {
      sRecordingSession = true;
      FlurryEvent.log("RecordingSession");
    }
  }

  public static void trackSharePost(String paramString, long paramLong)
  {
    FlurryEvent.log("SharePost_" + paramString, "postId", Long.valueOf(paramLong));
  }

  public static void trackShareProfile()
  {
    FlurryEvent.log("ShareProfile");
  }

  public static void trackSonyCameraModeLaunch()
  {
    FlurryEvent.log("Sony_CameraModeLaunch");
  }

  public static void trackSonyCameraModeSessionTime(long paramLong, boolean paramBoolean)
  {
    FlurryEvent.log("Sony_CameraModeFaceTime", "Time", Long.valueOf(paramLong), "LoggedOut", Boolean.valueOf(paramBoolean));
  }

  public static void trackTabChange(String paramString)
  {
    FlurryEvent.log("Page_" + paramString);
  }

  public static void trackTimeLinePageScroll(String paramString, int paramInt)
  {
    FlurryEvent.log("TimeLinePageScroll_" + paramString, "page", Integer.valueOf(paramInt));
  }

  public static void trackTos()
  {
    FlurryEvent.log("TermsOfServiceClicked");
  }

  public static void trackTwitterNewFollowingCount(String paramString)
  {
    FlurryEvent.log("FindFriendsTwitterNewFollowing", "Count", paramString);
  }

  public static void trackUnBlockUser()
  {
    FlurryEvent.log("UnBlockUser");
  }

  public static void trackUnLikePost(String paramString)
  {
    FlurryEvent.log("UnLike", "Source View", paramString);
  }

  public static void trackUnRevine(String paramString)
  {
    FlurryEvent.log("UnRevine", "Source View", paramString);
  }

  public static void trackUnfollow(String paramString)
  {
    FlurryEvent.log("Unfollow", "source", paramString);
  }

  public static void trackValidPullToRefreshRelease(String paramString)
  {
    FlurryEvent.log("ValidPullToRefreshRelease", "source", paramString);
  }

  public static void trackVisitFindFriends(String paramString)
  {
    FlurryEvent.log("VisitFindFriends", "source", paramString);
  }

  public static void trackVisitSearch(String paramString)
  {
    FlurryEvent.log("VisitSearch", "source", paramString);
  }

  public static void trackVisitSettings(String paramString)
  {
    FlurryEvent.log("VisitSettings", "source", paramString);
  }

  public static class FlurryEvent
  {
    private final String mEventName;
    public HashMap<String, String> mInfo;

    public FlurryEvent(String paramString)
    {
      this.mEventName = paramString;
    }

    public static void log(String paramString)
    {
      FlurryAgent.logEvent(paramString);
    }

    public static void log(String paramString1, String paramString2, Object paramObject)
    {
      new FlurryEvent(paramString1).add(paramString2, paramObject).log();
    }

    public static void log(String paramString1, String paramString2, Object paramObject1, String paramString3, Object paramObject2)
    {
      new FlurryEvent(paramString1).add(paramString2, paramObject1).add(paramString3, paramObject2).log();
    }

    public FlurryEvent add(String paramString, Object paramObject)
    {
      if (this.mInfo == null)
        this.mInfo = new HashMap();
      this.mInfo.put(paramString, String.valueOf(paramObject));
      return this;
    }

    public void log()
    {
      if (this.mInfo != null)
      {
        FlurryAgent.logEvent(this.mEventName, this.mInfo);
        return;
      }
      FlurryAgent.logEvent(this.mEventName);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.FlurryUtils
 * JD-Core Version:    0.6.2
 */