package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.TwitterVineApp;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.service.PendingAction;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import com.edisonwang.android.slog.SLog;
import com.twitter.android.sdk.Twitter;
import java.util.HashMap;
import java.util.List;

public class ReshareFragment extends BaseControllerFragment
{
  public static final String ARG_DESCRIPTION = "description";
  public static final String ARG_NETWORK = "network";
  public static final String ARG_POST_ID = "post_id";
  public static final String ARG_SHARE_URL = "share_url";
  public static final String ARG_THUMBNAIL_URL = "thumbnail_url";
  public static final String FRAGMENT_TAG = "reshare";
  private static final int MAX_CHARS_TWITTER = 140;
  public static final String NETWORK_FACEBOOK = "facebook";
  public static final String NETWORK_TWITTER = "twitter";
  private EditText mCaption;
  private String mDescription;
  private String mNetwork;
  private PendingCaptchaRequest mPendingCaptchaRequest;
  private long mPostId;
  private ProgressDialog mProgress;
  private ProgressDialog mShareProgress;
  private String mShareUrl;
  private ImageKey mThumbnailKey;
  private String mThumbnailUrl;
  private ImageView mThumbnailView;
  private Twitter mTwitter;

  private void handlePendingCaptchaRequest()
  {
    if (this.mPendingCaptchaRequest != null)
    {
      if (this.mPendingCaptchaRequest.state != 2)
        break label46;
      this.mAppController.retryRequest(this.mPendingCaptchaRequest.actionCode, this.mPendingCaptchaRequest.bundle);
    }
    while (true)
    {
      this.mPendingCaptchaRequest = null;
      return;
      label46: if (this.mPendingCaptchaRequest.state == 3)
      {
        String str = this.mAppController.generateReqIdForCanceledCaptcha();
        this.mAppController.failRequest(str, this.mPendingCaptchaRequest.actionCode, this.mPendingCaptchaRequest.bundle);
      }
    }
  }

  private void setThumbnailImage(Bitmap paramBitmap)
  {
    if (paramBitmap != null)
    {
      this.mThumbnailView.setImageDrawable(new RecyclableBitmapDrawable(this.mThumbnailView.getResources(), paramBitmap));
      return;
    }
    this.mThumbnailView.setImageBitmap(null);
    this.mThumbnailView.setBackgroundColor(getResources().getColor(2131296357));
  }

  private boolean validateSocialConnect()
  {
    boolean bool2;
    if ("facebook".equals(this.mNetwork))
      bool2 = this.mAppController.isConnectedToFacebook(getActivity());
    boolean bool1;
    do
    {
      return bool2;
      bool1 = "twitter".equals(this.mNetwork);
      bool2 = false;
    }
    while (!bool1);
    return Util.getDefaultSharedPrefs(getActivity()).getBoolean("settings_twitter_connected", false);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if ("facebook".equals(this.mNetwork))
      if (this.mAppController.getValidFacebookSession(getActivity(), false) == null)
        this.mAppController.connectToFacebookInitialize(this);
    while (true)
    {
      this.mCaption.setLines(8);
      this.mCaption.setHorizontallyScrolling(false);
      if (!TextUtils.isEmpty(this.mThumbnailUrl))
      {
        this.mThumbnailKey = new ImageKey(this.mThumbnailUrl);
        setThumbnailImage(this.mAppController.getPhotoBitmap(this.mThumbnailKey));
      }
      if (!TextUtils.isEmpty(this.mDescription))
        this.mCaption.setText(this.mDescription);
      return;
      if (this.mAppController.getPendingFacebookToken() != null)
      {
        this.mAppController.sendFacebookToken();
        continue;
        if ("twitter".equals(this.mNetwork))
        {
          FragmentActivity localFragmentActivity = getActivity();
          Account localAccount = VineAccountHelper.getAccount(localFragmentActivity, this.mAppController.getActiveSession().getLoginEmail());
          AccountManager localAccountManager = AccountManager.get(localFragmentActivity);
          if ((localAccount == null) || (localAccountManager == null))
            CrashUtil.logException(new VineException("Account or AM is null: " + localAccount + " " + localAccountManager));
          else if (TextUtils.isEmpty(localAccountManager.getUserData(localAccount, "account_t_token")))
            AppController.startTwitterAuthWithFinish(this.mTwitter, localFragmentActivity);
        }
      }
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt2 == 0)
      getActivity().finish();
    String str1;
    do
    {
      return;
      if ((paramInt1 != 11) && ((this.mProgress == null) || (!this.mProgress.isShowing())))
      {
        ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2131689512);
        localProgressDialog.setMessage(getString(2131624158));
        localProgressDialog.setProgress(0);
        localProgressDialog.show();
        this.mProgress = localProgressDialog;
      }
      switch (paramInt1)
      {
      default:
      case 1:
      case 2:
      case 11:
      }
      do
      {
        SLog.d("Facebook auth came back: {}", Integer.valueOf(paramInt1));
        if (paramInt2 != -1)
          break;
        com.facebook.Session localSession = com.facebook.Session.getActiveSession();
        if (localSession == null)
          break label451;
        if (!localSession.onActivityResult(getActivity(), paramInt1, paramInt2, paramIntent))
          break;
        if (!localSession.getPermissions().contains("publish_actions"))
          break label427;
        AppController.setPendingFacebookToken(getActivity(), localSession.getAccessToken());
        this.mAppController.sendFacebookToken();
        return;
        if (paramInt2 != -1)
          break;
        String str5 = paramIntent.getStringExtra("screen_name");
        String str6 = paramIntent.getStringExtra("tk");
        String str7 = paramIntent.getStringExtra("ts");
        long l2 = paramIntent.getLongExtra("user_id", 0L);
        this.mAppController.connectTwitter(this.mAppController.getActiveSession(), str5, str6, str7, l2);
        return;
        if (paramInt2 != -1)
          break;
        String str2 = paramIntent.getStringExtra("screen_name");
        String str3 = paramIntent.getStringExtra("token");
        String str4 = paramIntent.getStringExtra("secret");
        long l1 = paramIntent.getLongExtra("user_id", 0L);
        this.mAppController.connectTwitter(this.mAppController.getActiveSession(), str2, str3, str4, l1);
        return;
      }
      while ((this.mPendingCaptchaRequest == null) || (paramIntent == null));
      str1 = paramIntent.getStringExtra("rid");
      if ((this.mShareProgress != null) && (this.mShareProgress.isShowing()))
        this.mShareProgress.hide();
      if ((paramInt2 == -1) && (str1.equals(this.mPendingCaptchaRequest.reqId)))
      {
        this.mPendingCaptchaRequest.state = 2;
        return;
      }
    }
    while ((paramInt2 != 2) || (!str1.equals(this.mPendingCaptchaRequest.reqId)));
    this.mPendingCaptchaRequest.state = 3;
    return;
    label427: getActivity().runOnUiThread(new Runnable()
    {
      public void run()
      {
        Util.showCenteredToast(ReshareFragment.this.getActivity(), 2131624248);
      }
    });
    this.mAppController.connectToFacebookPublish(this);
    return;
    label451: super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new ReshareListener();
    Bundle localBundle = getArguments();
    this.mPostId = localBundle.getLong("post_id");
    this.mDescription = localBundle.getString("description");
    this.mNetwork = localBundle.getString("network");
    this.mShareUrl = localBundle.getString("share_url");
    if (this.mShareUrl == null)
      this.mShareUrl = "";
    this.mThumbnailUrl = localBundle.getString("thumbnail_url");
    if (this.mThumbnailUrl == null)
      this.mThumbnailUrl = "";
    this.mTwitter = new Twitter(TwitterVineApp.API_KEY, TwitterVineApp.API_SECRET);
    if (paramBundle != null)
      this.mPendingCaptchaRequest = ((PendingCaptchaRequest)paramBundle.getParcelable("state_pending_captcha_request"));
    setHasOptionsMenu(true);
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    if (!isDetached())
    {
      paramMenuInflater.inflate(2131755020, paramMenu);
      MenuItem localMenuItem = paramMenu.findItem(2131362189);
      try
      {
        if ("facebook".equals(this.mNetwork))
          localMenuItem.setTitle(getString(2131624333).toUpperCase());
        while (true)
        {
          super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
          return;
          if ("twitter".equals(this.mNetwork))
            localMenuItem.setTitle(getString(2131624334).toUpperCase());
        }
      }
      catch (IllegalStateException localIllegalStateException)
      {
      }
    }
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903129, paramViewGroup, false);
    this.mCaption = ((EditText)localView.findViewById(2131362018));
    this.mThumbnailView = ((ImageView)localView.findViewById(2131362115));
    return localView;
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362189:
    }
    int i = -1 + (140 - this.mShareUrl.length());
    if (("twitter".equals(this.mNetwork)) && (this.mCaption.getText().length() > i))
    {
      FragmentActivity localFragmentActivity = getActivity();
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(i);
      Util.showCenteredToast(localFragmentActivity, getString(2131624259, arrayOfObject));
      return true;
    }
    if (validateSocialConnect())
    {
      ((InputMethodManager)getActivity().getSystemService("input_method")).hideSoftInputFromWindow(this.mCaption.getWindowToken(), 0);
      String str2 = this.mCaption.getText().toString();
      this.mAppController.sharePost(this.mNetwork, str2, this.mPostId);
      ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog.setMessage(getString(2131624351));
      localProgressDialog.setProgress(0);
      localProgressDialog.show();
      this.mShareProgress = localProgressDialog;
      return true;
    }
    String str1 = this.mNetwork.substring(0, 1).toUpperCase() + this.mNetwork.substring(1);
    Util.showCenteredToast(getActivity(), getString(2131624337, new Object[] { str1 }));
    getActivity().finish();
    return true;
  }

  public void onResume()
  {
    super.onResume();
    if (this.mCaption != null)
      Util.setSoftInputVisibility(getActivity(), this.mCaption, true);
    handlePendingCaptchaRequest();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putParcelable("state_pending_captcha_request", this.mPendingCaptchaRequest);
  }

  class ReshareListener extends AppSessionListener
  {
    ReshareListener()
    {
    }

    public void onCaptchaRequired(String paramString1, String paramString2, PendingAction paramPendingAction)
    {
      ReshareFragment.access$502(ReshareFragment.this, new PendingCaptchaRequest(paramString1, paramPendingAction.actionCode, paramPendingAction.bundle));
      ReshareFragment.this.showCaptcha(paramString1, paramString2);
    }

    public void onConnectFacebookComplete(String paramString1, int paramInt, String paramString2)
    {
      if (ReshareFragment.this.mProgress != null)
        ReshareFragment.this.mProgress.dismiss();
      if (paramInt != 200)
      {
        Util.showCenteredToast(ReshareFragment.this.getActivity(), 2131624098);
        ReshareFragment.this.getActivity().finish();
      }
    }

    public void onConnectTwitterComplete(String paramString1, int paramInt, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong)
    {
      if (ReshareFragment.this.mProgress != null)
        ReshareFragment.this.mProgress.dismiss();
      if (paramInt == 200)
      {
        if ((paramLong > 0L) && (!TextUtils.isEmpty(paramString4)) && (!TextUtils.isEmpty(paramString5)))
        {
          VineAccountHelper.saveTwitterInfo(ReshareFragment.this.getActivity(), ReshareFragment.this.mAppController.getActiveSession().getLoginEmail(), paramString3, paramString4, paramString5, paramLong);
          SharedPreferences.Editor localEditor = Util.getDefaultSharedPrefs(ReshareFragment.this.getActivity()).edit();
          localEditor.putBoolean("settings_twitter_connected", true);
          localEditor.commit();
        }
        return;
      }
      Util.showCenteredToast(ReshareFragment.this.getActivity(), paramString2);
      ReshareFragment.this.getActivity().finish();
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      UrlImage localUrlImage = (UrlImage)paramHashMap.get(ReshareFragment.this.mThumbnailKey);
      if ((localUrlImage != null) && (localUrlImage.isValid()))
        ReshareFragment.this.setThumbnailImage(localUrlImage.bitmap);
    }

    public void onSharePostComplete(String paramString1, int paramInt, String paramString2)
    {
      if (ReshareFragment.this.mShareProgress != null)
        ReshareFragment.this.mShareProgress.dismiss();
      if (paramInt != 200)
      {
        if (!TextUtils.isEmpty(paramString2))
          Util.showCenteredToast(ReshareFragment.this.getActivity(), ReshareFragment.this.getString(2131624100, new Object[] { paramString2 }));
        return;
      }
      if ("facebook".equals(ReshareFragment.this.mNetwork))
        Util.showCenteredToast(ReshareFragment.this.getActivity(), 2131624336);
      while (true)
      {
        ReshareFragment.this.getActivity().finish();
        return;
        if ("twitter".equals(ReshareFragment.this.mNetwork))
          Util.showCenteredToast(ReshareFragment.this.getActivity(), 2131624350);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ReshareFragment
 * JD-Core Version:    0.6.2
 */