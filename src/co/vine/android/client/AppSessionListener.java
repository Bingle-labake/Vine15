package co.vine.android.client;

import android.util.Pair;
import co.vine.android.api.TwitterUser;
import co.vine.android.api.VineLogin;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineRepost;
import co.vine.android.api.VineTag;
import co.vine.android.api.VineUser;
import co.vine.android.network.HttpResult;
import co.vine.android.service.PendingAction;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoKey;
import com.facebook.SessionState;
import java.util.ArrayList;
import java.util.HashMap;

public abstract class AppSessionListener
{
  public void onBlockUserComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onCaptchaRequired(String paramString1, String paramString2, PendingAction paramPendingAction)
  {
  }

  public void onCheckTwitterComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, boolean paramBoolean, VineUser paramVineUser, VineLogin paramVineLogin)
  {
  }

  public void onClearCacheComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onConnectFacebookComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onConnectTwitterComplete(String paramString1, int paramInt, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong)
  {
  }

  public void onDeactivateAccountComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onDeletePostComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onDisableUserRepostsComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onDisconnectTwitterComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onEnableUserRepostsComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onFacebookSessionChanged(com.facebook.Session paramSession, SessionState paramSessionState, Exception paramException)
  {
  }

  public void onFollowComplete(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onGcmRegistrationComplete(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onGetActivityComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3)
  {
  }

  public void onGetAddressFriendsComplete(String paramString1, int paramInt1, String paramString2, int paramInt2)
  {
  }

  public void onGetBlockedUsersComplete(String paramString1, int paramInt, String paramString2, ArrayList<VineUser> paramArrayList)
  {
  }

  public void onGetChannelsComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onGetCommentsComplete(String paramString1, int paramInt1, String paramString2, long paramLong, int paramInt2)
  {
  }

  public void onGetEditionsComplete(int paramInt, ArrayList<Pair<String, String>> paramArrayList)
  {
  }

  public void onGetPendingNotificationCountComplete(String paramString1, int paramInt1, String paramString2, int paramInt2)
  {
  }

  public void onGetPostIdComplete(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onGetSinglePostComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onGetTagTypeAheadComplete(String paramString1, int paramInt, String paramString2, String paramString3, ArrayList<VineTag> paramArrayList)
  {
  }

  public void onGetTimeLineComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, boolean paramBoolean1, ArrayList<VinePost> paramArrayList, String paramString3, int paramInt4, int paramInt5, int paramInt6, long paramLong, boolean paramBoolean2, int paramInt7, String paramString4)
  {
  }

  public void onGetTwitterAuthUrlComplete(String paramString1, String paramString2)
  {
  }

  public void onGetTwitterFriendsComplete(String paramString1, int paramInt1, String paramString2, int paramInt2)
  {
  }

  public void onGetTwitterUserComplete(String paramString1, int paramInt, String paramString2, TwitterUser paramTwitterUser, VineLogin paramVineLogin)
  {
  }

  public void onGetUserComplete(String paramString1, int paramInt, String paramString2, VineUser paramVineUser)
  {
  }

  public void onGetUserIdComplete(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onGetUserTypeAheadComplete(String paramString1, int paramInt, String paramString2, String paramString3, ArrayList<VineUser> paramArrayList)
  {
  }

  public void onGetUsersComplete(Session paramSession, String paramString1, int paramInt1, String paramString2, int paramInt2, ArrayList<VineUser> paramArrayList, int paramInt3, int paramInt4)
  {
  }

  public void onGetUsersMeComplete(String paramString1, int paramInt, String paramString2, long paramLong, VineUser paramVineUser)
  {
  }

  public void onLikePost(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onLoginComplete(Session paramSession, String paramString1, int paramInt1, String paramString2, int paramInt2, VineLogin paramVineLogin)
  {
  }

  public void onLogoutComplete(String paramString)
  {
  }

  public void onLowMemory()
  {
  }

  public void onPhotoImageError(ImageKey paramImageKey, HttpResult paramHttpResult)
  {
  }

  public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
  {
  }

  public void onPostCommentComplete(String paramString1, int paramInt, String paramString2, long paramLong, String paramString3)
  {
  }

  public void onRemoveUsersComplete(String paramString)
  {
  }

  public void onReportPostComplete(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onReportUserComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onResetPasswordComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onRespondFollowRequestComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean, long paramLong)
  {
  }

  public void onRevine(String paramString1, int paramInt, String paramString2, long paramLong, VineRepost paramVineRepost)
  {
  }

  public void onSharePostComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onSignUpComplete(String paramString1, int paramInt, String paramString2, VineLogin paramVineLogin, String paramString3, String paramString4, String paramString5)
  {
  }

  public void onTagSearchComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, int paramInt4)
  {
  }

  public void onTrimMemory(int paramInt)
  {
  }

  public void onTwitterxAuthComplete(String paramString1, int paramInt, String paramString2, VineLogin paramVineLogin)
  {
  }

  public void onUnFollowComplete(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onUnblockUserComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onUnlikePost(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onUnrevine(String paramString1, int paramInt, String paramString2, long paramLong)
  {
  }

  public void onUpdateEditionComplete(String paramString1, int paramInt, String paramString2)
  {
  }

  public void onUpdateExplicitComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onUpdateFollowEditorsPicksComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onUpdatePrivateComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
  }

  public void onUpdateProfileComplete(String paramString1, int paramInt, String paramString2, String paramString3)
  {
  }

  public void onUserSearchComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, int paramInt4)
  {
  }

  public void onVideoPathError(VideoKey paramVideoKey, HttpResult paramHttpResult)
  {
  }

  public void onVideoPathObtained(HashMap<VideoKey, UrlVideo> paramHashMap)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.AppSessionListener
 * JD-Core Version:    0.6.2
 */