package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.NotificationManager;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.widget.CursorAdapter;
import android.text.Editable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import co.vine.android.api.VineTag;
import co.vine.android.api.VineUpload;
import co.vine.android.api.VineUpload.PostInfo;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.TwitterVineApp;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.provider.VineSuggestionsProvider;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.RecordSessionManager;
import co.vine.android.service.VineUploadService;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.MediaUtil;
import co.vine.android.util.SonyUtil;
import co.vine.android.util.UploadManager;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.views.SwitchInterface;
import co.vine.android.widget.PopupEditText;
import co.vine.android.widget.PopupEditText.PopupEditTextListener;
import com.edisonwang.android.slog.SLog;
import com.twitter.android.sdk.Twitter;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PostFragment extends BaseControllerFragment
  implements CompoundButton.OnCheckedChangeListener, View.OnClickListener, Filterable, PopupEditText.PopupEditTextListener, View.OnLongClickListener
{
  private static final String AG_FROM_SONY = "f_s";
  private static final String AG_IS_RETRY = "is_retry";
  private static final String AG_PREVIEW_PATH = "preview_path";
  private static final String AG_THUMBNAIL_PATH = "pic_path";
  private static final String AG_VIDEO_PATH = "vid_path";
  private static final int MAX_CHARS = 120;
  private static final int POSTING_DIALOG_DELAY = 750;
  public static final int REQUEST_CODE_ADD_TO_CHANNEL = 3;
  public static final int RESULT_FINISH = 32;
  public static final int RESULT_SAVED = 31;
  private static final String STATE_CHANNEL = "channel";
  private static Toast mToastLengthExceeded;
  private View mAddToChannel;
  private ImageView mAddToChannelIcon;
  private TextView mAddToChannelText;
  private PopupEditText mCaption;
  private long mChannelId;
  private Filter mFilter;
  private ImageView mImagePreview;
  private boolean mIsFromSony;
  private boolean mIsRetry;
  private SwitchInterface mPostFacebook;
  private TextView mPostToFacebookText;
  private TextView mPostToTwitterText;
  private SwitchInterface mPostTwitter;
  private SwitchInterface mPostVine;
  private String mPreviewPath;
  private ProgressDialog mProgress;
  private TagsAutoCompleteAdapter mTagsAdapter;
  private ComposeTokenizer mTokenizer;
  private Twitter mTwitter;
  private CursorAdapter mTypeaheadAdapter;
  private UsersAutoCompleteAdapter mUsersAdapter;
  private String mVideoPath;

  private int captionLength()
  {
    return this.mCaption.getText().toString().trim().length();
  }

  private void insertText(String paramString)
  {
    if (this.mCaption != null)
    {
      int i = this.mCaption.getSelectionStart();
      int j = this.mCaption.getSelectionEnd();
      if ((this.mCaption.getText() != null) && (i >= 0) && (j <= this.mCaption.length()))
        this.mCaption.getText().replace(i, j, paramString);
    }
  }

  public static Bundle prepareArguments(Intent paramIntent, String paramString1, String paramString2, String paramString3, boolean paramBoolean)
  {
    Bundle localBundle = BaseControllerFragment.prepareArguments(paramIntent);
    localBundle.putBoolean("is_retry", paramBoolean);
    localBundle.putString("vid_path", paramString1);
    localBundle.putString("pic_path", paramString2);
    localBundle.putString("preview_path", paramString3);
    return localBundle;
  }

  private void saveToCameraRoll(String paramString)
  {
    SLog.d("Saving to camera roll: {}.", paramString);
    File localFile1 = new File(paramString);
    File localFile2 = RecordConfigUtils.getCameraRollFile(getActivity(), System.currentTimeMillis());
    if (localFile2 == null)
    {
      SLog.d("Failed to find directory.");
      return;
    }
    if ((localFile1.exists()) && (RecordConfigUtils.copySilently(localFile1, localFile2)))
    {
      FragmentActivity localFragmentActivity = getActivity();
      if (localFragmentActivity != null)
        MediaUtil.scanFile(localFragmentActivity, localFile2, null);
      SLog.d("Renamed to finale position! {}, Scan {}.", localFile2, localFile2.getAbsolutePath());
      return;
    }
    SLog.d("Failed to move {}, file is probably already copied.", paramString);
  }

  public Filter getFilter()
  {
    if (this.mFilter == null)
      this.mFilter = new ComposeFilter(this, this.mAppController.getActiveId());
    return this.mFilter;
  }

  public CursorAdapter getPopupAdapter()
  {
    return this.mTypeaheadAdapter;
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    Bundle localBundle = getArguments();
    String str = localBundle.getString("pic_path");
    this.mVideoPath = localBundle.getString("vid_path");
    if (this.mVideoPath == null)
      throw new IllegalArgumentException("Null video path.");
    this.mPreviewPath = localBundle.getString("preview_path");
    this.mIsFromSony = localBundle.getBoolean("f_s");
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeFile(str);
      this.mImagePreview.setImageBitmap(localBitmap);
      VineUpload localVineUpload = UploadManager.getUpload(getActivity(), this.mVideoPath);
      if (localVineUpload != null)
      {
        VineUpload.PostInfo localPostInfo = localVineUpload.getPostInfo();
        if (localPostInfo != null)
          this.mCaption.setText(localPostInfo.caption);
      }
      ((NotificationManager)getActivity().getSystemService("notification")).cancel(this.mVideoPath, 0);
      return;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      while (true)
        CrashUtil.logException(localOutOfMemoryError);
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
      SLog.d("Facebook auth came back: {}", Integer.valueOf(paramInt1));
      if (paramInt2 != -1)
        break label456;
      com.facebook.Session localSession = com.facebook.Session.getActiveSession();
      if (localSession == null)
        break label438;
      if (!localSession.onActivityResult(getActivity(), paramInt1, paramInt2, paramIntent))
        break label427;
      if (localSession.getPermissions().contains("publish_actions"))
      {
        AppController.setPendingFacebookToken(getActivity(), localSession.getAccessToken());
        ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2);
        localProgressDialog.setMessage(getString(2131624158));
        localProgressDialog.setProgress(0);
        localProgressDialog.show();
        this.mProgress = localProgressDialog;
        this.mAppController.sendFacebookToken();
      }
      break;
    case 1:
    case 2:
    case 3:
      long l1;
      String str1;
      do
      {
        do
        {
          return;
          if (paramInt2 == -1)
          {
            String str5 = paramIntent.getStringExtra("screen_name");
            String str6 = paramIntent.getStringExtra("tk");
            String str7 = paramIntent.getStringExtra("ts");
            long l3 = paramIntent.getLongExtra("user_id", 0L);
            this.mAppController.connectTwitter(this.mAppController.getActiveSession(), str5, str6, str7, l3);
            return;
          }
          this.mPostTwitter.setChecked(false);
          return;
          if (paramInt2 == -1)
          {
            String str2 = paramIntent.getStringExtra("screen_name");
            String str3 = paramIntent.getStringExtra("token");
            String str4 = paramIntent.getStringExtra("secret");
            long l2 = paramIntent.getLongExtra("user_id", 0L);
            this.mAppController.connectTwitter(this.mAppController.getActiveSession(), str2, str3, str4, l2);
            return;
          }
          this.mPostTwitter.setChecked(false);
          return;
        }
        while (paramInt2 != -1);
        l1 = paramIntent.getLongExtra("channel_id", -1L);
        str1 = paramIntent.getStringExtra("channel");
      }
      while ((l1 <= -1L) || (TextUtils.isEmpty(str1)));
      this.mAddToChannelText.setText(str1);
      this.mChannelId = l1;
      this.mAddToChannelIcon.setSelected(true);
      FlurryUtils.trackChannelChange(str1 + " (id=" + l1 + ")");
      return;
    }
    getActivity().runOnUiThread(new Runnable()
    {
      public void run()
      {
        Util.showCenteredToast(PostFragment.this.getActivity(), 2131624248);
      }
    });
    this.mAppController.connectToFacebookPublish(this);
    return;
    label427: this.mPostFacebook.setChecked(false);
    return;
    label438: this.mPostFacebook.setChecked(false);
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    return;
    label456: this.mPostFacebook.setChecked(false);
  }

  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    switch (paramCompoundButton.getId())
    {
    default:
    case 2131362026:
    case 2131362034:
    case 2131362030:
    }
    FragmentActivity localFragmentActivity;
    Account localAccount;
    AccountManager localAccountManager;
    do
    {
      do
      {
        do
        {
          return;
          this.mPostTwitter.setEnabled(paramBoolean);
          this.mPostFacebook.setEnabled(paramBoolean);
          if (!paramBoolean)
          {
            this.mPostTwitter.setChecked(false);
            this.mPostToTwitterText.setTextColor(getActivity().getResources().getColor(2131296356));
            this.mPostFacebook.setChecked(false);
            this.mPostToFacebookText.setTextColor(getActivity().getResources().getColor(2131296356));
            return;
          }
          this.mPostToTwitterText.setTextColor(getActivity().getResources().getColor(2131296331));
          this.mPostToFacebookText.setTextColor(getActivity().getResources().getColor(2131296331));
          return;
          if (!this.mPostVine.isChecked())
            this.mPostFacebook.setChecked(false);
          while (!paramBoolean)
          {
            if (this.mPostVine.isChecked())
              break;
            this.mPostTwitter.setChecked(false);
            return;
          }
          if (this.mAppController.getValidFacebookSession(getActivity(), false) == null)
          {
            this.mAppController.connectToFacebookInitialize(this);
            return;
          }
        }
        while (this.mAppController.getPendingFacebookToken() == null);
        this.mAppController.sendFacebookToken();
        return;
      }
      while (!paramBoolean);
      localFragmentActivity = getActivity();
      localAccount = VineAccountHelper.getAccount(localFragmentActivity, this.mAppController.getActiveSession().getLoginEmail());
      localAccountManager = AccountManager.get(localFragmentActivity);
      if ((localAccount == null) || (localAccountManager == null))
      {
        CrashUtil.logException(new VineException("Account or AM is null: " + localAccount + " " + localAccountManager));
        return;
      }
    }
    while (!TextUtils.isEmpty(localAccountManager.getUserData(localAccount, "account_t_token")));
    AppController.startTwitterAuthWithFinish(this.mTwitter, localFragmentActivity);
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131362020:
    }
    Intent localIntent = new Intent(getActivity(), ChannelsListActivity.class);
    localIntent.putExtra("selected_channel", this.mChannelId);
    getActivity().startActivityForResult(localIntent, 3);
  }

  @SuppressLint({"ShowToast"})
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setHasOptionsMenu(true);
    this.mTwitter = new Twitter(TwitterVineApp.API_KEY, TwitterVineApp.API_SECRET);
    this.mAppSessionListener = new PostSessionListener();
    this.mIsRetry = getArguments().getBoolean("is_retry", false);
    mToastLengthExceeded = Toast.makeText(getActivity(), 2131624019, 1);
    mToastLengthExceeded.setGravity(17, 0, 0);
    if (paramBundle == null);
    for (this.mChannelId = -1L; ; this.mChannelId = paramBundle.getLong("channel"))
    {
      this.mUsersAdapter = new UsersAutoCompleteAdapter(getActivity(), this.mAppController);
      this.mTagsAdapter = new TagsAutoCompleteAdapter(getActivity(), this.mAppController);
      this.mTypeaheadAdapter = this.mUsersAdapter;
      return;
    }
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755022, paramMenu);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView1 = paramLayoutInflater.inflate(2130903116, paramViewGroup, false);
    View localView2 = localView1.findViewById(2131362020);
    this.mAddToChannelIcon = ((ImageView)localView2.findViewById(2131362021));
    this.mAddToChannelText = ((TextView)localView2.findViewById(2131362022));
    this.mAddToChannel = localView2;
    this.mPostVine = ((SwitchInterface)localView1.findViewById(2131362026));
    this.mPostTwitter = ((SwitchInterface)localView1.findViewById(2131362030));
    this.mPostFacebook = ((SwitchInterface)localView1.findViewById(2131362034));
    this.mImagePreview = ((ImageView)localView1.findViewById(2131362017));
    PopupEditText localPopupEditText = (PopupEditText)localView1.findViewById(2131362018);
    localPopupEditText.setAdapter(this.mUsersAdapter);
    this.mTokenizer = new ComposeTokenizer(this);
    localPopupEditText.setTokenizer(this.mTokenizer, this, this.mAppController.getTypeaheadThrottle());
    localPopupEditText.setPopupEditTextListener(this);
    this.mCaption = localPopupEditText;
    this.mPostToTwitterText = ((TextView)localView1.findViewById(2131362029));
    this.mPostToFacebookText = ((TextView)localView1.findViewById(2131362033));
    this.mAddToChannel.setOnClickListener(this);
    this.mAddToChannel.setOnLongClickListener(this);
    this.mPostVine.setChecked(true);
    this.mPostVine.setEnabled(true);
    this.mPostVine.setOnCheckedChangeListener(this);
    this.mPostTwitter.setChecked(false);
    this.mPostTwitter.setOnCheckedChangeListener(this);
    this.mPostFacebook.setChecked(false);
    this.mPostFacebook.setOnCheckedChangeListener(this);
    return localView1;
  }

  public void onDestroy()
  {
    super.onDestroy();
    VineSuggestionsProvider.clearRealtimeUserSuggestions();
    VineSuggestionsProvider.clearRealtimeTagSuggestions();
  }

  public void onFiltering(CharSequence paramCharSequence)
  {
    int i = 1;
    String str1;
    String str3;
    String str2;
    if (!TextUtils.isEmpty(paramCharSequence))
    {
      str1 = paramCharSequence.toString();
      if (!str1.startsWith("@"))
        break label116;
      str3 = "mention";
      str2 = str1.substring(i, str1.length());
      int j = this.mAppController.getTypeaheadFetchThreshold(str3);
      if ((!TextUtils.isEmpty(str2)) && (str2.length() >= j))
      {
        if (!"mention".equals(str3))
          break label159;
        if (VineSuggestionsProvider.getRealtimeUserSuggestions(str2) != null)
          break label154;
        label90: if (i != 0)
        {
          if (!"mention".equals(str3))
            break label191;
          this.mAppController.fetchUserTypeahead(str2);
        }
      }
    }
    label116: 
    while (!"tag".equals(str3))
    {
      return;
      if (str1.startsWith("#"))
      {
        str3 = "tag";
        str2 = str1.substring(i, str1.length());
        break;
      }
      str2 = null;
      str3 = null;
      break;
      i = 0;
      break label90;
      if ("tag".equals(str3))
      {
        if (VineSuggestionsProvider.getRealtimeTagSuggestions(str2) == null)
          break label90;
        while (true)
          i = 0;
      }
      i = 0;
      break label90;
    }
    label154: label159: label191: this.mAppController.fetchTagTypeahead(str2);
  }

  public boolean onLongClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return false;
    case 2131362020:
    }
    this.mAddToChannelText.setText(2131624001);
    this.mChannelId = -1L;
    this.mAddToChannelIcon.setSelected(false);
    FlurryUtils.trackChannelChange("Channel removed");
    return true;
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362201:
      if (captionLength() <= 120)
      {
        Editable localEditable = this.mCaption.getText();
        final FragmentActivity localFragmentActivity = getActivity();
        String str1;
        if (this.mPreviewPath != null)
          str1 = this.mPreviewPath;
        while (true)
        {
          saveToCameraRoll(str1);
          String str4;
          if (this.mPostVine.isChecked())
          {
            String str3 = this.mVideoPath;
            if (localEditable != null)
            {
              str4 = localEditable.toString();
              label115: localFragmentActivity.startService(VineUploadService.getPostIntent(localFragmentActivity, str3, str4, this.mPostTwitter.isChecked(), this.mPostFacebook.isChecked(), this.mChannelId, this.mIsRetry, this.mCaption.getEntities(), null));
              localFragmentActivity.startService(VineUploadService.getShowProgressIntent(localFragmentActivity));
              label171: FlurryUtils.trackPost(this.mPostVine.isChecked());
              localFragmentActivity.setResult(31);
            }
          }
          try
          {
            if (this.mPostVine.isChecked())
            {
              if (this.mPreviewPath == null)
                break label337;
              RecordSessionManager.deleteSession(new File(this.mPreviewPath).getParentFile(), "Session Completed.");
            }
            while (true)
            {
              SLog.i("Session folder deleted: {}.", this.mPreviewPath);
              if (!this.mIsFromSony)
                break label404;
              this.mProgress = new ProgressDialog(localFragmentActivity, 2);
              this.mProgress.setMessage(getString(2131624342));
              this.mProgress.show();
              new Handler().postDelayed(new Runnable()
              {
                public void run()
                {
                  localFragmentActivity.startActivity(new Intent(localFragmentActivity, SonyLaunchActivity.class));
                  localFragmentActivity.setResult(32);
                  SonyUtil.endSession(localFragmentActivity);
                  localFragmentActivity.finish();
                }
              }
              , 750L);
              return true;
              str1 = this.mVideoPath;
              break;
              str4 = "";
              break label115;
              localFragmentActivity.startService(VineUploadService.getDiscardIntent(localFragmentActivity, this.mVideoPath));
              break label171;
              label337: String str2 = new File(this.mVideoPath).getName();
              File localFile = RecordSessionManager.getInstance(getActivity()).getFolderFromName(str2);
              if ((localFile != null) && (localFile.exists()))
                RecordSessionManager.deleteSession(localFile, "Done with session.");
            }
          }
          catch (IOException localIOException)
          {
            while (true)
            {
              SLog.e("Failed to delete session folder.", localIOException);
              continue;
              label404: localFragmentActivity.startActivity(new Intent(localFragmentActivity, HomeTabActivity.class).setFlags(67108864));
              localFragmentActivity.finish();
            }
          }
        }
      }
      mToastLengthExceeded.show();
    case 2131362187:
    case 2131362188:
    }
    while (true)
    {
      return true;
      insertText("@");
      continue;
      insertText("#");
    }
  }

  public void onPopupItemSelected(int paramInt1, int paramInt2, CharSequence paramCharSequence, long paramLong)
  {
  }

  public void onPopupShown()
  {
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putLong("channel", this.mChannelId);
  }

  public void setPopupAdapter(String paramString)
  {
    if ("users_adapter".equals(paramString))
      this.mTypeaheadAdapter = this.mUsersAdapter;
    while (true)
    {
      this.mCaption.setAdapter(this.mTypeaheadAdapter);
      return;
      if ("tags_adapter".equals(paramString))
        this.mTypeaheadAdapter = this.mTagsAdapter;
    }
  }

  class PostSessionListener extends AppSessionListener
  {
    PostSessionListener()
    {
    }

    public void onConnectFacebookComplete(String paramString1, int paramInt, String paramString2)
    {
      if (PostFragment.this.mProgress != null)
        PostFragment.this.mProgress.dismiss();
      if (paramInt != 200)
      {
        Util.showCenteredToast(PostFragment.this.getActivity(), 2131624098);
        PostFragment.this.mPostFacebook.setChecked(false);
      }
    }

    public void onConnectTwitterComplete(String paramString1, int paramInt, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong)
    {
      if (paramInt == 200)
      {
        if ((paramLong > 0L) && (!TextUtils.isEmpty(paramString4)) && (!TextUtils.isEmpty(paramString5)))
        {
          VineAccountHelper.saveTwitterInfo(PostFragment.this.getActivity(), PostFragment.this.mAppController.getActiveSession().getLoginEmail(), paramString3, paramString4, paramString5, paramLong);
          PostFragment.this.mPostTwitter.setChecked(true);
        }
        return;
      }
      Util.showCenteredToast(PostFragment.this.getActivity(), paramString2);
      PostFragment.this.mPostTwitter.setChecked(false);
    }

    public void onGetTagTypeAheadComplete(String paramString1, int paramInt, String paramString2, String paramString3, ArrayList<VineTag> paramArrayList)
    {
      if ((paramInt == 200) && (!paramArrayList.isEmpty()))
      {
        VineSuggestionsProvider.addRealtimeTagSuggestions(paramString3, paramArrayList);
        PostFragment.this.mCaption.performFilter(false);
      }
    }

    public void onGetUserTypeAheadComplete(String paramString1, int paramInt, String paramString2, String paramString3, ArrayList<VineUser> paramArrayList)
    {
      if ((paramInt == 200) && (!paramArrayList.isEmpty()))
      {
        VineSuggestionsProvider.addRealtimeUserSuggestions(paramString3, paramArrayList);
        PostFragment.this.mCaption.performFilter(false);
      }
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      super.onPhotoImageLoaded(paramHashMap);
      PostFragment.this.mUsersAdapter.setUserImages(paramHashMap);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.PostFragment
 * JD-Core Version:    0.6.2
 */