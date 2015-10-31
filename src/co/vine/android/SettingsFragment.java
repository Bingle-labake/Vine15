package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.text.TextWatcher;
import android.util.Log;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.BaseAdapter;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.provider.Vine.Editions;
import co.vine.android.provider.VineDatabaseSQL.EditionsQuery;
import co.vine.android.service.GCMRegistrationService;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.ImageUtils;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import com.edisonwang.android.slog.SLog;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.util.ArrayList;
import java.util.HashMap;

public class SettingsFragment extends BaseControllerFragment
  implements SetThumbnailTask.SetThumbnailListener, PromptDialogSupportFragment.OnDialogDoneListener, View.OnClickListener, ImagePicker.Listener, CompoundButton.OnCheckedChangeListener, LoaderManager.LoaderCallbacks<Cursor>
{
  private static final int DEBUG_TAP_THRESHOLD = 6;
  private static final int DIALOG_CLEAR_CACHE = 6;
  private static final int DIALOG_DEACTIVATE_ACCOUNT = 7;
  private static final int DIALOG_DISCONNECT_TWITTER = 5;
  private static final int DIALOG_LOGOUT = 4;
  private static final int DIALOG_REMOVE_TAKE_OR_CHOOSE_PHOTO = 2;
  private static final int DIALOG_TAKE_OR_CHOOSE_PHOTO = 1;
  private static final int DIALOG_UNSAVED_CHANGES = 3;
  private static final int LOADER_ID_DEFAULT = 0;
  private static final int REQUEST_CODE_CHOOSE_PHOTO = 5;
  private static final int REQUEST_CODE_CROP = 4;
  private static final int REQUEST_CODE_TAKE_PHOTO = 3;
  private static final int REQUEST_GMS_RESOLUTION = 6;
  public static final int RESULT_CACHE_CLEARED = 1;
  private static final String STATE_AVATAR_URI = "state_avatar_url";
  private static final String STATE_DESCRIPTION = "state_desc";
  private static final String STATE_EDITION = "state_edition";
  private static final String STATE_EDITIONS_FETCHED = "state_editions_fetched";
  private static final String STATE_EMAIL = "state_email";
  private static final String STATE_LOCATION = "state_loc";
  private static final String STATE_NAME = "state_name";
  private static final String STATE_PHONE = "state_phone";
  private static final String TAG = "SettingsFragment";
  private ImageView mAlertIcon;
  private AppController mAppController;
  private ImageView mAvatarBorderImageView;
  private ImageView mAvatarImageView;
  private ImageKey mAvatarKey;
  private Uri mAvatarUri;
  private TextView mClearCacheValue;
  private String mDescription;
  private String mEdition;
  private boolean mEditionsFetched = false;
  private Spinner mEditionsSpinner;
  private SharedPreferences.Editor mEditor;
  private String mEmail;
  private ImagePicker mImagePicker;
  private String mLocation;
  private String mName;
  private FrameLayout mNotifications;
  private String mOriginalAvatarUrl;
  private String mOriginalDescription;
  private String mOriginalEdition;
  private String mOriginalEmail;
  private String mOriginalLocation;
  private String mOriginalName;
  private String mOriginalPhone;
  private String mPhone;
  private boolean mPhotoChanged;
  private SharedPreferences mPrefs;
  private ProgressDialog mProgress;
  private EditionsSpinnerAdapter mSpinnerAdapter;
  private Bitmap mThumbnail;
  private boolean mTwitterConnected;
  private boolean mTwitterLogin;
  private int mVersionTapCount;

  private boolean isDirty()
  {
    return (!this.mOriginalName.equals(this.mName)) || (!this.mOriginalEmail.equals(this.mEmail)) || (!this.mOriginalDescription.equals(this.mDescription)) || (!this.mOriginalLocation.equals(this.mLocation)) || (!this.mOriginalPhone.equals(this.mPhone)) || (!this.mOriginalEdition.equals(this.mEdition)) || (this.mPhotoChanged);
  }

  private void resetPrefs()
  {
    SharedPreferences.Editor localEditor = this.mEditor;
    localEditor.putString("settings_profile_name", this.mOriginalName);
    localEditor.putString("settings_profile_description", this.mOriginalDescription);
    localEditor.putString("settings_profile_location", this.mOriginalLocation);
    localEditor.putString("settings_profile_email", this.mOriginalEmail);
    localEditor.putString("settings_profile_phone", this.mOriginalPhone);
    localEditor.putString("settings_profile_avatar_url", this.mOriginalAvatarUrl);
    localEditor.putString("settings_edition", this.mOriginalEdition);
    localEditor.commit();
  }

  private void setOriginalPreferenceValues()
  {
    SharedPreferences localSharedPreferences = this.mPrefs;
    this.mOriginalName = localSharedPreferences.getString("settings_profile_name", "");
    this.mName = this.mOriginalName;
    this.mOriginalDescription = localSharedPreferences.getString("settings_profile_description", "");
    this.mDescription = this.mOriginalDescription;
    this.mOriginalLocation = localSharedPreferences.getString("settings_profile_location", "");
    this.mLocation = this.mOriginalLocation;
    this.mOriginalEmail = localSharedPreferences.getString("settings_profile_email", "");
    this.mEmail = this.mOriginalEmail;
    this.mOriginalPhone = localSharedPreferences.getString("settings_profile_phone", "");
    this.mPhone = this.mOriginalPhone;
    this.mOriginalEdition = localSharedPreferences.getString("settings_edition", "");
    this.mEdition = this.mOriginalEdition;
    this.mTwitterConnected = localSharedPreferences.getBoolean("settings_twitter_connected", false);
    this.mAvatarUri = Uri.parse(localSharedPreferences.getString("settings_profile_avatar_url", ""));
    this.mOriginalAvatarUrl = this.mAvatarUri.toString();
  }

  private void updateProfile(Uri paramUri)
  {
    AppController localAppController;
    Session localSession;
    String str1;
    String str2;
    String str3;
    String str4;
    String str5;
    if (validate())
    {
      if (!this.mOriginalName.equals(this.mName))
        FlurryUtils.trackChangedName();
      if (!this.mOriginalDescription.equals(this.mDescription))
        FlurryUtils.trackChangedDescription();
      if (!this.mOriginalLocation.equals(this.mLocation))
        FlurryUtils.trackChangedLocation();
      if (!this.mOriginalEmail.equals(this.mEmail))
        FlurryUtils.trackChangedEmail();
      if (!this.mOriginalEdition.equals(this.mEdition))
        FlurryUtils.trackChangedEdition();
      localAppController = this.mAppController;
      localSession = this.mAppController.getActiveSession();
      str1 = this.mName;
      str2 = this.mDescription;
      str3 = this.mLocation;
      str4 = this.mEmail;
      str5 = this.mPhone;
      if (!this.mPhotoChanged)
        break label183;
    }
    label183: for (Uri localUri = paramUri; ; localUri = null)
    {
      localAppController.updateProfile(localSession, str1, str2, str3, str4, str5, localUri);
      this.mAppController.updateEdition(this.mAppController.getActiveSession(), this.mEdition);
      return;
    }
  }

  private boolean validate()
  {
    FragmentActivity localFragmentActivity = getActivity();
    if (this.mName.isEmpty())
      if (localFragmentActivity != null)
        Util.showCenteredToast(localFragmentActivity, 2131624181);
    do
    {
      do
      {
        return false;
        if (this.mLocation.length() <= 32)
          break;
      }
      while (localFragmentActivity == null);
      Util.showCenteredToast(localFragmentActivity, 2131623956);
      return false;
      if (this.mDescription.length() <= 140)
        break;
    }
    while (localFragmentActivity == null);
    Util.showCenteredToast(localFragmentActivity, 2131623945);
    return false;
    if (localFragmentActivity != null)
    {
      ProgressDialog localProgressDialog = new ProgressDialog(localFragmentActivity, 2131689512);
      localProgressDialog.setMessage(getString(2131624332));
      localProgressDialog.show();
      this.mProgress = localProgressDialog;
    }
    return true;
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    switch (paramInt1)
    {
    default:
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
    case 3:
    case 5:
    case 4:
    case 1:
    case 2:
      do
      {
        return;
        if (paramInt2 == -1)
        {
          if (paramInt1 == 3);
          for (Uri localUri2 = this.mAvatarUri; ; localUri2 = paramIntent.getData())
          {
            startActivityForResult(new Intent(getActivity(), EditProfileCropActivity.class).putExtra("uri", localUri2), 4);
            return;
          }
        }
        this.mAvatarUri = null;
        return;
        if ((paramInt2 == -1) && (paramIntent != null))
        {
          Uri localUri1 = (Uri)paramIntent.getParcelableExtra("uri");
          if (localUri1 != null)
          {
            ImageUtils.deleteTempPic(this.mAvatarUri);
            this.mAvatarUri = localUri1;
            new SetThumbnailTask(this).execute(new Uri[] { localUri1 });
          }
          this.mPhotoChanged = true;
          return;
        }
        this.mAvatarUri = null;
        return;
        if (paramInt2 == -1)
        {
          String str4 = paramIntent.getStringExtra("screen_name");
          String str5 = paramIntent.getStringExtra("tk");
          String str6 = paramIntent.getStringExtra("ts");
          long l2 = paramIntent.getLongExtra("user_id", 0L);
          ProgressDialog localProgressDialog2 = new ProgressDialog(getActivity(), 2131689512);
          localProgressDialog2.setMessage(getString(2131624353));
          localProgressDialog2.setProgress(0);
          localProgressDialog2.show();
          this.mProgress = localProgressDialog2;
          this.mAppController.connectTwitter(this.mAppController.getActiveSession(), str4, str5, str6, l2);
          return;
        }
        Util.showCenteredToast(getActivity(), 2131624102);
        return;
        if (paramInt2 == -1)
        {
          String str1 = paramIntent.getStringExtra("screen_name");
          String str2 = paramIntent.getStringExtra("token");
          String str3 = paramIntent.getStringExtra("secret");
          long l1 = paramIntent.getLongExtra("user_id", 0L);
          ProgressDialog localProgressDialog1 = new ProgressDialog(getActivity(), 2131689512);
          localProgressDialog1.setMessage(getString(2131624353));
          localProgressDialog1.setProgress(0);
          localProgressDialog1.show();
          this.mProgress = localProgressDialog1;
          this.mAppController.connectTwitter(this.mAppController.getActiveSession(), str1, str2, str3, l1);
          return;
        }
      }
      while (paramInt2 == 0);
      Util.showCenteredToast(getActivity(), 2131624104);
      return;
    case 6:
    }
    if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(getActivity()) == 0)
    {
      if (this.mNotifications != null)
        this.mNotifications.setOnClickListener(this);
      if (this.mAlertIcon != null)
        this.mAlertIcon.setVisibility(8);
      getActivity().startService(GCMRegistrationService.getRegisterIntent(getActivity(), this.mAppController.getActiveId()));
      return;
    }
    Util.showCenteredToast(getActivity(), 2131624386);
  }

  public void onBackPressed()
  {
    FragmentActivity localFragmentActivity = getActivity();
    if ((isDirty()) && (localFragmentActivity != null))
    {
      PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(3);
      localPromptDialogSupportFragment.setMessage(2131624330);
      localPromptDialogSupportFragment.setNeutralButton(2131624296);
      localPromptDialogSupportFragment.setPositiveButton(2131624303);
      localPromptDialogSupportFragment.setTargetFragment(this, 0);
      localPromptDialogSupportFragment.show(localFragmentActivity.getSupportFragmentManager());
    }
    do
    {
      return;
      if (this.mProgress != null)
        this.mProgress.dismiss();
    }
    while (localFragmentActivity == null);
    localFragmentActivity.finish();
  }

  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
    case 2131361873:
    case 2131362140:
    case 2131362154:
    case 2131361965:
    case 2131362131:
    case 2131362132:
    case 2131362137:
    case 2131362139:
    case 2131362138:
    case 2131362146:
    case 2131362150:
    case 2131362149:
    case 2131362151:
    case 2131362153:
    case 2131362155:
      do
      {
        return;
        if ((this.mAvatarUri != null) && (!Util.isDefaultAvatarUrl(this.mAvatarUri.toString())))
        {
          PromptDialogSupportFragment localPromptDialogSupportFragment6 = PromptDialogSupportFragment.newInstance(2);
          localPromptDialogSupportFragment6.setTargetFragment(this, 0);
          localPromptDialogSupportFragment6.setMessage(2131624354).setPositiveButton(2131624250).setNeutralButton(2131624379).setNegativeButton(2131624021).show(getActivity().getSupportFragmentManager());
          return;
        }
        PromptDialogSupportFragment localPromptDialogSupportFragment5 = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment5.setTargetFragment(this, 0);
        localPromptDialogSupportFragment5.setMessage(2131624354).setPositiveButton(2131624379).setNeutralButton(2131624021).show(getActivity().getSupportFragmentManager());
        return;
        if (this.mTwitterLogin)
        {
          PromptDialogSupportFragment localPromptDialogSupportFragment4 = PromptDialogSupportFragment.newInstance(5);
          localPromptDialogSupportFragment4.setMessage(2131624305);
          localPromptDialogSupportFragment4.setPositiveButton(2131624304);
          localPromptDialogSupportFragment4.setNegativeButton(2131624018);
          localPromptDialogSupportFragment4.setTargetFragment(this, 0);
          localPromptDialogSupportFragment4.show(getActivity().getSupportFragmentManager());
          return;
        }
        AppController.startTwitterAuthWithFinish(this.mAppController.getTwitter(), getActivity());
        return;
        PromptDialogSupportFragment localPromptDialogSupportFragment3 = PromptDialogSupportFragment.newInstance(4);
        localPromptDialogSupportFragment3.setMessage(2131624175);
        localPromptDialogSupportFragment3.setPositiveButton(2131624174);
        localPromptDialogSupportFragment3.setNegativeButton(2131624018);
        localPromptDialogSupportFragment3.setTargetFragment(this, 0);
        try
        {
          localPromptDialogSupportFragment3.show(getActivity().getSupportFragmentManager());
          return;
        }
        catch (Exception localException)
        {
          CrashUtil.logException(localException);
          return;
        }
        Intent localIntent6 = new Intent(getActivity(), ResetPasswordActivity.class);
        if (!TextUtils.isEmpty(this.mEmail))
          localIntent6.putExtra("email", this.mEmail);
        startActivity(localIntent6);
        return;
        FlurryUtils.trackContentControls();
        startActivity(new Intent(getActivity(), ContentControlsActivity.class));
        return;
        FlurryUtils.trackNotificationSettings();
        startActivity(new Intent(getActivity(), NotificationSettingsActivity.class));
        return;
        FlurryUtils.trackVisitFindFriends("Settings");
        startActivity(new Intent(getActivity(), FindFriendsActivity.class));
        return;
        FlurryUtils.trackInvite("email", "Settings");
        Intent localIntent5 = new Intent("android.intent.action.SENDTO", Uri.fromParts("mailto", "", null));
        localIntent5.putExtra("android.intent.extra.SUBJECT", getString(2131624119));
        int j = Util.getEmailMessageId();
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Long.valueOf(this.mAppController.getActiveId());
        localIntent5.putExtra("android.intent.extra.TEXT", getString(j, arrayOfObject2));
        startActivity(Intent.createChooser(localIntent5, getString(2131624116)));
        return;
        FlurryUtils.trackInvite("sms", "Settings");
        Intent localIntent4 = new Intent("android.intent.action.VIEW");
        localIntent4.setType("vnd.android-dir/mms-sms");
        int i = Util.getSmsMessageId();
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = String.valueOf(this.mAppController.getActiveId());
        localIntent4.putExtra("sms_body", getString(i, arrayOfObject1));
        startActivity(Intent.createChooser(localIntent4, getString(2131624272)));
        return;
        PromptDialogSupportFragment localPromptDialogSupportFragment2 = PromptDialogSupportFragment.newInstance(6);
        localPromptDialogSupportFragment2.setMessage(2131624290);
        localPromptDialogSupportFragment2.setNegativeButton(2131624018);
        localPromptDialogSupportFragment2.setPositiveButton(2131624289);
        localPromptDialogSupportFragment2.setTargetFragment(this, 0);
        localPromptDialogSupportFragment2.show(getActivity().getSupportFragmentManager());
        return;
        FlurryUtils.trackPrivacyPolicy();
        Intent localIntent3 = new Intent(getActivity(), WebViewActivity.class);
        localIntent3.putExtra("type", 1);
        startActivity(localIntent3);
        return;
        FlurryUtils.trackTos();
        Intent localIntent2 = new Intent(getActivity(), WebViewActivity.class);
        localIntent2.putExtra("type", 2);
        startActivity(localIntent2);
        return;
        FlurryUtils.trackAttribution();
        Intent localIntent1 = new Intent(getActivity(), WebViewActivity.class);
        localIntent1.putExtra("type", 5);
        startActivity(localIntent1);
        return;
        FlurryUtils.trackDeactivateAccount();
        PromptDialogSupportFragment localPromptDialogSupportFragment1 = PromptDialogSupportFragment.newInstance(7);
        localPromptDialogSupportFragment1.setMessage(2131624299);
        localPromptDialogSupportFragment1.setTitle(2131624300);
        localPromptDialogSupportFragment1.setNegativeButton(2131624018);
        localPromptDialogSupportFragment1.setPositiveButton(2131624298);
        localPromptDialogSupportFragment1.setTargetFragment(this, 0);
        localPromptDialogSupportFragment1.show(getActivity().getSupportFragmentManager());
        return;
        this.mVersionTapCount = (1 + this.mVersionTapCount);
        if (this.mVersionTapCount >= 6)
        {
          this.mVersionTapCount = 0;
          startActivity(new Intent(getActivity(), DebugHomeActivity.class));
          return;
        }
      }
      while (this.mVersionTapCount != 5);
      Util.showShortCenteredToast(getActivity(), "One more!");
      return;
    case 2131362152:
      LocaleDialog.newInstance().show(getActivity().getSupportFragmentManager(), "locale");
      return;
    case 2131362134:
    case 2131362135:
    }
    this.mEditionsSpinner.performClick();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setHasOptionsMenu(true);
    this.mPrefs = Util.getDefaultSharedPrefs(getActivity());
    this.mAppSessionListener = new SettingsListener();
    this.mAppController = AppController.getInstance(getActivity());
    this.mImagePicker = new ImagePicker(getActivity(), this, this.mAppController.getActiveId());
    this.mEditor = this.mPrefs.edit();
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), Vine.Editions.CONTENT_URI, VineDatabaseSQL.EditionsQuery.PROJECTION, null, null, null);
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755021, paramMenu);
    paramMenu.findItem(2131362189).setEnabled(true);
    paramMenu.findItem(2131362189).setEnabled(true);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903136, null, false);
    setOriginalPreferenceValues();
    if (paramBundle != null)
    {
      this.mName = paramBundle.getString("state_name");
      this.mDescription = paramBundle.getString("state_desc");
      this.mLocation = paramBundle.getString("state_loc");
      this.mPhone = paramBundle.getString("state_phone");
      this.mEmail = paramBundle.getString("state_email");
      this.mEditionsFetched = paramBundle.getBoolean("state_editions_fetched");
      this.mEdition = paramBundle.getString("state_edition");
      this.mAvatarUri = ((Uri)paramBundle.getParcelable("state_avatar_url"));
    }
    this.mAvatarImageView = ((ImageView)localView.findViewById(2131361873));
    this.mAvatarBorderImageView = ((ImageView)localView.findViewById(2131362128));
    String str;
    if (this.mAvatarUri == null)
      str = "";
    while (true)
    {
      this.mAvatarImageView.setOnClickListener(this);
      label180: TextView localTextView1;
      label645: TextView localTextView2;
      label824: TextView localTextView3;
      if (this.mThumbnail != null)
      {
        this.mAvatarImageView.setImageDrawable(new RecyclableBitmapDrawable(getResources(), this.mThumbnail));
        EditText localEditText1 = (EditText)localView.findViewById(2131362129);
        localEditText1.setText(this.mName);
        TextWatcher local1 = new TextWatcher()
        {
          public void afterTextChanged(Editable paramAnonymousEditable)
          {
          }

          public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
          }

          public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
            SettingsFragment.access$002(SettingsFragment.this, paramAnonymousCharSequence.toString());
          }
        };
        localEditText1.addTextChangedListener(local1);
        EditText localEditText2 = (EditText)localView.findViewById(2131362049);
        localEditText2.setText(this.mDescription);
        localEditText2.setHint(2131624302);
        TextWatcher local2 = new TextWatcher()
        {
          public void afterTextChanged(Editable paramAnonymousEditable)
          {
          }

          public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
          }

          public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
            SettingsFragment.access$102(SettingsFragment.this, paramAnonymousCharSequence.toString());
          }
        };
        localEditText2.addTextChangedListener(local2);
        EditText localEditText3 = (EditText)localView.findViewById(2131361990);
        localEditText3.setText(this.mLocation);
        localEditText3.setHint(2131624316);
        TextWatcher local3 = new TextWatcher()
        {
          public void afterTextChanged(Editable paramAnonymousEditable)
          {
          }

          public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
          }

          public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
            SettingsFragment.access$202(SettingsFragment.this, paramAnonymousCharSequence.toString());
          }
        };
        localEditText3.addTextChangedListener(local3);
        EditText localEditText4 = (EditText)localView.findViewById(2131362114);
        localEditText4.setText(this.mEmail);
        localEditText4.setHint(2131624094);
        localEditText4.setInputType(32);
        TextWatcher local4 = new TextWatcher()
        {
          public void afterTextChanged(Editable paramAnonymousEditable)
          {
          }

          public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
          }

          public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
            SettingsFragment.access$302(SettingsFragment.this, paramAnonymousCharSequence.toString());
          }
        };
        localEditText4.addTextChangedListener(local4);
        EditText localEditText5 = (EditText)localView.findViewById(2131362130);
        localEditText5.setText(this.mPhone);
        localEditText5.setHint(2131624094);
        localEditText5.setInputType(3);
        TextWatcher local5 = new TextWatcher()
        {
          public void afterTextChanged(Editable paramAnonymousEditable)
          {
          }

          public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
          }

          public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
          {
            SettingsFragment.access$402(SettingsFragment.this, paramAnonymousCharSequence.toString());
          }
        };
        localEditText5.addTextChangedListener(local5);
        this.mEditionsSpinner = ((Spinner)localView.findViewById(2131362136));
        this.mEditionsSpinner.setFocusable(false);
        Spinner localSpinner = this.mEditionsSpinner;
        AdapterView.OnItemSelectedListener local6 = new AdapterView.OnItemSelectedListener()
        {
          public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            SettingsFragment.access$502(SettingsFragment.this, SettingsFragment.this.mSpinnerAdapter.getEditionCode(paramAnonymousInt));
          }

          public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView)
          {
          }
        };
        localSpinner.setOnItemSelectedListener(local6);
        localView.findViewById(2131362134).setOnClickListener(this);
        localView.findViewById(2131362135).setOnClickListener(this);
        EditionsSpinnerAdapter localEditionsSpinnerAdapter = new EditionsSpinnerAdapter();
        this.mSpinnerAdapter = localEditionsSpinnerAdapter;
        this.mEditionsSpinner.setAdapter(this.mSpinnerAdapter);
        ((LinearLayout)localView.findViewById(2131361965)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362131)).setOnClickListener(this);
        this.mNotifications = ((FrameLayout)localView.findViewById(2131362132));
        if (!BuildUtil.isGoogle())
          break label1385;
        this.mNotifications.setVisibility(0);
        this.mAlertIcon = ((ImageView)this.mNotifications.findViewById(2131362133));
        final int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(getActivity());
        if (i == 0)
          break label1365;
        View.OnClickListener local7 = new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            GooglePlayServicesUtil.getErrorDialog(i, SettingsFragment.this.getActivity(), 6).show();
          }
        };
        this.mAlertIcon.setVisibility(0);
        this.mAlertIcon.setOnClickListener(local7);
        this.mNotifications.setOnClickListener(local7);
        ((LinearLayout)localView.findViewById(2131362137)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362138)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362139)).setOnClickListener(this);
        LinearLayout localLinearLayout1 = (LinearLayout)localView.findViewById(2131362140);
        localLinearLayout1.setBackgroundResource(2130837616);
        localTextView1 = (TextView)localLinearLayout1.findViewById(2131362141);
        localTextView2 = (TextView)localLinearLayout1.findViewById(2131362142);
        AccountManager localAccountManager = AccountManager.get(getActivity());
        Account localAccount = VineAccountHelper.getAccount(getActivity(), this.mAppController.getActiveSession().getLoginEmail());
        if ((localAccount == null) || (VineAccountHelper.getLoginType(localAccountManager, localAccount) != 2))
          break label1397;
        localTextView1.setText(2131624295);
        localTextView2.setText('@' + VineAccountHelper.getTwitterUsername(localAccountManager, localAccount));
        this.mTwitterLogin = true;
        localLinearLayout1.setOnClickListener(this);
        LinearLayout localLinearLayout2 = (LinearLayout)localView.findViewById(2131362143);
        ((TextView)localView.findViewById(2131362144)).setText(2131624109);
        localTextView3 = (TextView)localView.findViewById(2131362145);
        if (!this.mAppController.isConnectedToFacebook(getActivity()))
          break label1451;
        localTextView3.setText(2131624294);
        label895: localLinearLayout2.setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362146)).setOnClickListener(this);
        ((TextView)localView.findViewById(2131362147)).setText(getString(2131624288));
        this.mClearCacheValue = ((TextView)localView.findViewById(2131362148));
      }
      try
      {
        this.mClearCacheValue.setText(Util.formatFileSize(getResources(), Util.getCacheSize(getActivity())));
        ((LinearLayout)localView.findViewById(2131362149)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362150)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362151)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362153)).setOnClickListener(this);
        ((LinearLayout)localView.findViewById(2131362154)).setOnClickListener(this);
        localLinearLayout3 = (LinearLayout)localView.findViewById(2131362155);
        localTextView4 = (TextView)localView.findViewById(2131362156);
      }
      catch (VineException localVineException)
      {
        try
        {
          LinearLayout localLinearLayout3;
          TextView localTextView4;
          PackageInfo localPackageInfo = getActivity().getPackageManager().getPackageInfo("co.vine.android", 0);
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = localPackageInfo.versionName;
          localTextView4.setText(getString(2131624278, arrayOfObject));
          localLinearLayout3.setOnClickListener(this);
          if (BuildUtil.isI18nOn())
          {
            LinearLayout localLinearLayout4 = (LinearLayout)localView.findViewById(2131362152);
            localLinearLayout4.setOnClickListener(this);
            localLinearLayout4.setVisibility(0);
          }
          return localView;
          str = this.mAvatarUri.toString();
          continue;
          if (!TextUtils.isEmpty(str))
          {
            if (Util.isDefaultAvatarUrl(str))
            {
              this.mAvatarImageView.setImageDrawable(getResources().getDrawable(2130837622));
              this.mThumbnail = null;
              break label180;
            }
            ImageKey localImageKey = new ImageKey(str);
            this.mAvatarKey = localImageKey;
            Bitmap localBitmap = this.mAppController.getPhotoBitmap(this.mAvatarKey);
            if (localBitmap != null)
            {
              ImageView localImageView = this.mAvatarImageView;
              RecyclableBitmapDrawable localRecyclableBitmapDrawable = new RecyclableBitmapDrawable(this.mAvatarImageView.getResources(), localBitmap);
              localImageView.setImageDrawable(localRecyclableBitmapDrawable);
              this.mAvatarBorderImageView.setImageDrawable(getResources().getDrawable(2130837765));
              this.mThumbnail = localBitmap;
              break label180;
            }
            this.mAvatarImageView.setImageDrawable(getResources().getDrawable(2130837612));
            this.mAvatarBorderImageView.setImageDrawable(null);
            this.mThumbnail = null;
            break label180;
          }
          this.mAvatarImageView.setImageDrawable(getResources().getDrawable(2130837622));
          this.mAvatarBorderImageView.setImageDrawable(null);
          break label180;
          label1365: this.mAlertIcon.setVisibility(8);
          this.mNotifications.setOnClickListener(this);
          break label645;
          label1385: this.mNotifications.setVisibility(8);
          break label645;
          label1397: if (this.mTwitterConnected)
          {
            localTextView1.setText(2131624295);
            localTextView2.setText("");
            this.mTwitterLogin = true;
            break label824;
          }
          localTextView2.setText(2131624293);
          localTextView1.setText(2131624292);
          this.mTwitterLogin = false;
          break label824;
          label1451: localTextView3.setText(2131624317);
          break label895;
          localVineException = localVineException;
          CrashUtil.logException(localVineException);
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
          while (true)
            Log.d("SettingsFragment", "Error retrieving package info:", localNameNotFoundException);
        }
      }
    }
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
    case 1:
    case 2:
    case 3:
      FragmentActivity localFragmentActivity;
      do
      {
        return;
        switch (paramInt2)
        {
        case -2:
        default:
          return;
        case -3:
          this.mImagePicker.chooseImage(5);
          return;
        case -1:
        }
        this.mImagePicker.captureImage(3);
        return;
        switch (paramInt2)
        {
        default:
          return;
        case -3:
          this.mImagePicker.captureImage(3);
          return;
        case -1:
          setThumbnailImage(null);
          this.mPhotoChanged = true;
          this.mAvatarUri = Uri.parse("");
          return;
        case -2:
        }
        this.mImagePicker.chooseImage(5);
        return;
        switch (paramInt2)
        {
        default:
          return;
        case -1:
        }
        resetPrefs();
        localFragmentActivity = getActivity();
      }
      while (localFragmentActivity == null);
      localFragmentActivity.finish();
      return;
    case 4:
      switch (paramInt2)
      {
      default:
        return;
      case -1:
      }
      FlurryUtils.trackLogout();
      ProgressDialog localProgressDialog4 = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog4.setMessage(getString(2131624156));
      localProgressDialog4.setProgress(0);
      localProgressDialog4.show();
      this.mProgress = localProgressDialog4;
      this.mAppController.logout(this.mAppController.getActiveSession());
      return;
    case 5:
      switch (paramInt2)
      {
      default:
        return;
      case -1:
      }
      ProgressDialog localProgressDialog3 = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog3.setMessage(getString(2131624306));
      localProgressDialog3.setProgress(0);
      localProgressDialog3.show();
      this.mProgress = localProgressDialog3;
      this.mAppController.disconnectTwitter(this.mAppController.getActiveSession());
      return;
    case 6:
      switch (paramInt2)
      {
      default:
        return;
      case -1:
      }
      ProgressDialog localProgressDialog2 = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog2.setMessage(getString(2131624291));
      localProgressDialog2.setProgress(0);
      localProgressDialog2.show();
      this.mProgress = localProgressDialog2;
      this.mAppController.clearDbCache(true);
      return;
    case 7:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -1:
    }
    ProgressDialog localProgressDialog1 = new ProgressDialog(getActivity(), 2131689512);
    localProgressDialog1.setMessage(getString(2131624301));
    localProgressDialog1.setProgress(0);
    localProgressDialog1.show();
    this.mProgress = localProgressDialog1;
    this.mAppController.deactivateAccount();
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    if (!this.mEditionsFetched)
    {
      this.mAppController.getEditions();
      this.mEditionsFetched = true;
    }
    this.mSpinnerAdapter.changeCursor(paramCursor);
    this.mSpinnerAdapter.setSelectionToUserEdition();
  }

  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362189:
    }
    if (isDirty())
      updateProfile(this.mAvatarUri);
    while (true)
    {
      return true;
      if (this.mProgress != null)
        this.mProgress.dismiss();
      if (getActivity() != null)
        getActivity().finish();
    }
  }

  public void onPause()
  {
    super.onPause();
    if (this.mProgress != null)
      this.mProgress.dismiss();
  }

  public void onResume()
  {
    super.onResume();
    if (this.mSpinnerAdapter.getCursor() == null)
      getLoaderManager().initLoader(0, null, this);
    while ((!this.mSpinnerAdapter.isEmpty()) || (this.mEditionsFetched))
      return;
    this.mEditionsFetched = true;
    this.mAppController.getEditions();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putString("state_name", this.mName);
    paramBundle.putString("state_desc", this.mDescription);
    paramBundle.putString("state_loc", this.mLocation);
    paramBundle.putString("state_phone", this.mPhone);
    paramBundle.putString("state_email", this.mEmail);
    paramBundle.putString("state_edition", this.mEdition);
    paramBundle.putBoolean("state_editions_fetched", this.mEditionsFetched);
    paramBundle.putParcelable("state_avatar_url", this.mAvatarUri);
  }

  public void setAvatarUrl(Uri paramUri)
  {
    this.mAvatarUri = paramUri;
  }

  public void setThumbnailImage(Bitmap paramBitmap)
  {
    this.mAvatarImageView = ((ImageView)getView().findViewById(2131361873));
    this.mAvatarBorderImageView = ((ImageView)getView().findViewById(2131362128));
    Resources localResources = getResources();
    if (paramBitmap != null)
    {
      this.mAvatarImageView.setImageDrawable(new RecyclableBitmapDrawable(getResources(), paramBitmap));
      Drawable localDrawable = localResources.getDrawable(2130837768);
      this.mAvatarBorderImageView.setImageDrawable(localDrawable);
      this.mThumbnail = paramBitmap;
      return;
    }
    this.mAvatarImageView.setImageDrawable(localResources.getDrawable(2130837622));
    this.mAvatarBorderImageView.setImageDrawable(null);
    this.mThumbnail = paramBitmap;
  }

  class EditionsSpinnerAdapter extends BaseAdapter
    implements SpinnerAdapter
  {
    private Cursor mCursor;

    EditionsSpinnerAdapter()
    {
    }

    public void changeCursor(Cursor paramCursor)
    {
      this.mCursor = paramCursor;
      notifyDataSetChanged();
    }

    public int getCount()
    {
      if (this.mCursor != null)
        return this.mCursor.getCount();
      return 0;
    }

    public Object getCursor()
    {
      return this.mCursor;
    }

    public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if ((this.mCursor != null) && (paramInt < this.mCursor.getCount()))
      {
        if (paramView != null);
        for (View localView = paramView; ; localView = LayoutInflater.from(SettingsFragment.this.getActivity()).inflate(2130903083, null))
        {
          TextView localTextView = (TextView)localView.findViewById(2131361930);
          localTextView.setText(getEditionName(paramInt));
          localTextView.setSingleLine(false);
          localView.invalidate();
          return localView;
        }
      }
      return paramView;
    }

    public String getEditionCode(int paramInt)
    {
      if ((this.mCursor != null) && (paramInt < this.mCursor.getCount()))
      {
        this.mCursor.moveToPosition(paramInt);
        return this.mCursor.getString(1);
      }
      return "";
    }

    public String getEditionName(int paramInt)
    {
      if ((this.mCursor != null) && (paramInt < this.mCursor.getCount()))
      {
        this.mCursor.moveToPosition(paramInt);
        return this.mCursor.getString(2);
      }
      return "";
    }

    public Object getItem(int paramInt)
    {
      return null;
    }

    public long getItemId(int paramInt)
    {
      return paramInt;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if ((this.mCursor != null) && (paramInt < this.mCursor.getCount()))
      {
        if (paramView != null);
        for (View localView = paramView; ; localView = LayoutInflater.from(SettingsFragment.this.getActivity()).inflate(2130903083, null))
        {
          TextView localTextView = (TextView)localView.findViewById(2131361930);
          localTextView.setText(getEditionName(paramInt));
          localTextView.setSingleLine(true);
          localTextView.setEllipsize(TextUtils.TruncateAt.END);
          return localView;
        }
      }
      return paramView;
    }

    public void setSelectionToUserEdition()
    {
      if (this.mCursor != null)
      {
        this.mCursor.moveToPosition(-1);
        while (this.mCursor.moveToNext())
          if (this.mCursor.getString(1).equals(SettingsFragment.this.mEdition))
            SettingsFragment.this.mEditionsSpinner.setSelection(this.mCursor.getPosition());
      }
    }
  }

  class SettingsListener extends AppSessionListener
  {
    SettingsListener()
    {
    }

    public void onClearCacheComplete(String paramString1, int paramInt, String paramString2)
    {
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      try
      {
        SettingsFragment.this.mClearCacheValue.setText(Util.formatFileSize(SettingsFragment.this.getResources(), Util.getCacheSize(SettingsFragment.this.getActivity())));
        SettingsFragment.this.getActivity().setResult(1);
        return;
      }
      catch (VineException localVineException)
      {
        while (true)
          CrashUtil.logException(localVineException);
      }
    }

    public void onConnectTwitterComplete(String paramString1, int paramInt, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong)
    {
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      TextView localTextView1 = (TextView)SettingsFragment.this.getView().findViewById(2131362142);
      TextView localTextView2 = (TextView)SettingsFragment.this.getView().findViewById(2131362141);
      if ((paramInt == 200) && (paramLong > 0L) && (!TextUtils.isEmpty(paramString4)) && (!TextUtils.isEmpty(paramString5)))
      {
        localTextView2.setText(2131624295);
        localTextView1.setText('@' + paramString3);
        VineAccountHelper.saveTwitterInfo(SettingsFragment.this.getActivity(), SettingsFragment.this.mAppController.getActiveSession().getLoginEmail(), paramString3, paramString4, paramString5, paramLong);
        SettingsFragment.access$1302(SettingsFragment.this, true);
        SharedPreferences.Editor localEditor = SettingsFragment.this.mPrefs.edit();
        localEditor.putBoolean("settings_twitter_connected", true);
        localEditor.commit();
        return;
      }
      localTextView2.setText(2131624292);
      localTextView1.setText(2131624293);
      SettingsFragment.access$1302(SettingsFragment.this, false);
      if (TextUtils.isEmpty(paramString2))
        paramString2 = SettingsFragment.this.getResources().getString(2131624309);
      Util.showCenteredToast(SettingsFragment.this.getActivity(), paramString2);
    }

    public void onDeactivateAccountComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      int i;
      if (paramBoolean)
      {
        SettingsFragment.this.mAppController.logout(SettingsFragment.this.mAppController.getActiveSession());
        i = 2131624282;
        SLog.d("User account successfully deactivated");
      }
      while (true)
      {
        Util.showCenteredToast(SettingsFragment.this.getActivity(), i);
        return;
        i = 2131624281;
        SLog.d("User account deactivation failed");
      }
    }

    public void onDisconnectTwitterComplete(String paramString1, int paramInt, String paramString2)
    {
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      TextView localTextView1 = (TextView)SettingsFragment.this.getView().findViewById(2131362142);
      TextView localTextView2 = (TextView)SettingsFragment.this.getView().findViewById(2131362141);
      if (paramInt == 200)
      {
        localTextView2.setText(2131624292);
        localTextView1.setText(2131624293);
        VineAccountHelper.removeTwitterInfo(SettingsFragment.this.getActivity(), SettingsFragment.this.mAppController.getActiveSession().getLoginEmail());
        SettingsFragment.access$1302(SettingsFragment.this, false);
        SettingsFragment.this.mEditor.putBoolean("settings_twitter_connected", false);
        SettingsFragment.this.mEditor.commit();
        return;
      }
      if (TextUtils.isEmpty(paramString2))
        paramString2 = SettingsFragment.this.getResources().getString(2131624310);
      Util.showCenteredToast(SettingsFragment.this.getActivity(), paramString2);
    }

    public void onGetEditionsComplete(int paramInt, ArrayList<Pair<String, String>> paramArrayList)
    {
      if (paramInt == 200)
        SettingsFragment.access$1502(SettingsFragment.this, true);
    }

    public void onLogoutComplete(String paramString)
    {
      if ((SettingsFragment.this.getActivity() == null) || (SettingsFragment.this.getActivity().isFinishing()))
        return;
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      StartActivity.toStart(SettingsFragment.this.getActivity());
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      UrlImage localUrlImage = (UrlImage)paramHashMap.get(SettingsFragment.this.mAvatarKey);
      if ((localUrlImage != null) && (localUrlImage.isValid()))
        SettingsFragment.this.mAvatarImageView.setImageDrawable(new RecyclableBitmapDrawable(SettingsFragment.this.mAvatarImageView.getResources(), localUrlImage.bitmap));
    }

    public void onUpdateEditionComplete(String paramString1, int paramInt, String paramString2)
    {
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      if (paramInt == 200)
      {
        SharedPreferences.Editor localEditor = SettingsFragment.this.mEditor;
        localEditor.putString("settings_edition", SettingsFragment.this.mEdition);
        localEditor.commit();
      }
    }

    public void onUpdateProfileComplete(String paramString1, int paramInt, String paramString2, String paramString3)
    {
      if (SettingsFragment.this.mProgress != null)
        SettingsFragment.this.mProgress.dismiss();
      if (paramInt == 200)
      {
        SharedPreferences.Editor localEditor = SettingsFragment.this.mEditor;
        if (!TextUtils.isEmpty(paramString3))
          SettingsFragment.this.mEditor.putString("settings_profile_avatar_url", paramString3);
        localEditor.putString("settings_profile_name", SettingsFragment.this.mName);
        localEditor.putString("settings_profile_description", SettingsFragment.this.mDescription);
        localEditor.putString("settings_profile_location", SettingsFragment.this.mLocation);
        localEditor.putString("settings_profile_email", SettingsFragment.this.mEmail);
        localEditor.putString("settings_profile_phone", SettingsFragment.this.mPhone);
        localEditor.commit();
        if (SettingsFragment.this.getActivity() != null)
          SettingsFragment.this.getActivity().finish();
        return;
      }
      if (TextUtils.isEmpty(paramString2))
      {
        Util.showCenteredToast(SettingsFragment.this.getActivity(), 2131624397);
        return;
      }
      Util.showCenteredToast(SettingsFragment.this.getActivity(), paramString2);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SettingsFragment
 * JD-Core Version:    0.6.2
 */