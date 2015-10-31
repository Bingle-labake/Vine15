package co.vine.android;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import co.vine.android.api.TwitterUser;
import co.vine.android.api.VineLogin;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.ContactsHelper;
import co.vine.android.util.ContactsHelper.ContactHelperListener;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.ImageUtils;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import java.util.HashMap;

public class SignUpNameAvatarFragment extends BaseControllerFragment
  implements TextWatcher, View.OnClickListener, PromptDialogSupportFragment.OnDialogDoneListener, SetThumbnailTask.SetThumbnailListener, ImagePicker.Listener, ContactsHelper.ContactHelperListener
{
  public static final String ARG_LOGIN = "user";
  private static final int DIALOG_REMOVE_TAKE_OR_CHOOSE_PHOTO = 3;
  private static final int DIALOG_SET_PHOTO_OR_SKIP = 1;
  private static final int DIALOG_TAKE_OR_CHOOSE_PHOTO = 2;
  public static final int REQUEST_CODE_CHOOSE_PHOTO = 3;
  public static final int REQUEST_CODE_CROP = 2;
  public static final int REQUEST_CODE_TAKE_PHOTO = 1;
  private static final String STATE_PROFILE_URI = "state_pi";
  private boolean mHasPromptedForPhoto;
  private ImagePicker mImagePicker;
  private VineLogin mLogin;
  private EditText mName;
  private MenuItem mNextButton;
  private EditText mPhoneNumber;
  private RelativeLayout mPhoneNumberContainer;
  private boolean mPhotoAttached;
  private ImageView mProfileImage;
  private Uri mProfileUri;
  private Dialog mProgress;
  private TwitterUser mTwitterUser;

  private void addPhoto()
  {
    if (this.mPhotoAttached)
    {
      PromptDialogSupportFragment localPromptDialogSupportFragment2 = PromptDialogSupportFragment.newInstance(3);
      localPromptDialogSupportFragment2.setTargetFragment(this, 0);
      localPromptDialogSupportFragment2.setTitle(2131624354).setPositiveButton(2131624250).setNeutralButton(2131624379).setNegativeButton(2131624021).show(getActivity().getSupportFragmentManager());
      return;
    }
    PromptDialogSupportFragment localPromptDialogSupportFragment1 = PromptDialogSupportFragment.newInstance(2);
    localPromptDialogSupportFragment1.setTargetFragment(this, 0);
    localPromptDialogSupportFragment1.setTitle(2131624354).setPositiveButton(2131624379).setNeutralButton(2131624021).show(getActivity().getSupportFragmentManager());
  }

  private void nextClicked()
  {
    SignUpPagerActivity localSignUpPagerActivity = (SignUpPagerActivity)getActivity();
    localSignUpPagerActivity.setName(this.mName.getText().toString());
    localSignUpPagerActivity.setPhone(this.mPhoneNumber.getText().toString());
    localSignUpPagerActivity.setProfile(this.mProfileUri);
    if (this.mTwitterUser != null)
    {
      this.mTwitterUser.name = this.mName.getText().toString();
      localSignUpPagerActivity.setTwitterUser(this.mTwitterUser);
    }
    localSignUpPagerActivity.toNextStep();
  }

  private boolean onEditorActionClicked(int paramInt, View paramView)
  {
    FragmentActivity localFragmentActivity = getActivity();
    if ((localFragmentActivity != null) && (paramInt == 6) && (validate()))
    {
      ((InputMethodManager)localFragmentActivity.getSystemService("input_method")).hideSoftInputFromWindow(paramView.getWindowToken(), 0);
      onNextClicked(localFragmentActivity);
    }
    return true;
  }

  private boolean onNextClicked(Activity paramActivity)
  {
    if (!showProfilePhotoPrompt())
    {
      SignUpPagerActivity localSignUpPagerActivity = (SignUpPagerActivity)paramActivity;
      localSignUpPagerActivity.setName(this.mName.getText().toString());
      localSignUpPagerActivity.setPhone(this.mPhoneNumber.getText().toString());
      localSignUpPagerActivity.setProfile(this.mImagePicker.getSavedImageUri());
      if (this.mTwitterUser != null)
      {
        this.mTwitterUser.name = this.mName.getText().toString();
        localSignUpPagerActivity.setTwitterUser(this.mTwitterUser);
      }
      nextClicked();
    }
    return true;
  }

  private boolean showProfilePhotoPrompt()
  {
    if ((this.mProfileUri == null) && (!this.mHasPromptedForPhoto) && (!this.mPhotoAttached))
    {
      PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1).setMessage(2131624245).setPositiveButton(2131624276).setNegativeButton(2131624361);
      localPromptDialogSupportFragment.setListener(this);
      try
      {
        localPromptDialogSupportFragment.show(getActivity().getSupportFragmentManager());
        this.mHasPromptedForPhoto = true;
        return true;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        return false;
      }
    }
    return false;
  }

  private boolean validate()
  {
    return (this.mName != null) && (this.mName.length() >= 3);
  }

  public void afterTextChanged(Editable paramEditable)
  {
    if (this.mNextButton != null)
      this.mNextButton.setEnabled(validate());
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    switch (paramInt1)
    {
    default:
    case 1:
    case 3:
    case 2:
    }
    Uri localUri1;
    do
    {
      return;
      if (paramInt2 == -1)
      {
        if (paramInt1 == 1);
        for (Uri localUri2 = this.mProfileUri; ; localUri2 = paramIntent.getData())
        {
          Intent localIntent = new Intent(getActivity(), EditProfileCropActivity.class).putExtra("uri", localUri2);
          getActivity().startActivityForResult(localIntent, 2);
          return;
        }
      }
      this.mProfileUri = null;
      return;
      if ((paramInt2 != -1) || (paramIntent == null))
        break;
      localUri1 = (Uri)paramIntent.getParcelableExtra("uri");
    }
    while (localUri1 == null);
    ImageUtils.deleteTempPic(this.mProfileUri);
    this.mProfileUri = localUri1;
    new SetThumbnailTask(this).execute(new Uri[] { localUri1 });
    return;
    this.mProfileUri = null;
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131362166:
    }
    addPhoto();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppController = AppController.getInstance(getActivity());
    if ((paramBundle != null) && (paramBundle.containsKey("state_pi")))
    {
      this.mProfileUri = ((Uri)paramBundle.getParcelable("state_pi"));
      if (this.mProfileUri != null)
      {
        SetThumbnailTask localSetThumbnailTask = new SetThumbnailTask(this);
        Uri[] arrayOfUri = new Uri[1];
        arrayOfUri[0] = this.mProfileUri;
        localSetThumbnailTask.execute(arrayOfUri);
      }
    }
    setHasOptionsMenu(true);
    ((SignUpPagerActivity)getActivity()).setBarTitle(2131624162);
    Bundle localBundle = getArguments();
    if ((localBundle != null) && (localBundle.containsKey("user")))
      this.mLogin = ((VineLogin)localBundle.getParcelable("user"));
    this.mAppSessionListener = new SignUpListener();
    this.mHasPromptedForPhoto = false;
    this.mImagePicker = new ImagePicker(getActivity(), this, this.mAppController.getActiveId());
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755016, paramMenu);
    this.mNextButton = paramMenu.findItem(2131362191);
    if (this.mNextButton != null)
      this.mNextButton.setEnabled(validate());
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903140, paramViewGroup, false);
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 1:
      switch (paramInt2)
      {
      default:
        return;
      case -2:
        nextClicked();
        return;
      case -1:
      }
      addPhoto();
      return;
    case 2:
      switch (paramInt2)
      {
      case -2:
      default:
        return;
      case -3:
        this.mImagePicker.chooseImage(3);
        return;
      case -1:
      }
      this.mImagePicker.captureImage(1);
      return;
    case 3:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -3:
      this.mImagePicker.captureImage(1);
      return;
    case -1:
      setThumbnailImage(null);
      return;
    case -2:
    }
    this.mImagePicker.chooseImage(3);
  }

  public void onEmailLoaded(String paramString)
  {
  }

  public void onNameLoaded(String paramString)
  {
    if ((TextUtils.isEmpty(this.mName.getText())) && (!TextUtils.isEmpty(paramString)))
      this.mName.setText(paramString);
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362191:
    }
    return onNextClicked(getActivity());
  }

  public void onPhoneNumberLoaded(String paramString)
  {
    if ((this.mPhoneNumber.getVisibility() == 0) && (TextUtils.isEmpty(this.mPhoneNumber.getText())) && (!TextUtils.isEmpty(paramString)))
      this.mPhoneNumber.setText(paramString);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putParcelable("state_pi", this.mProfileUri);
  }

  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    this.mName = ((EditText)paramView.findViewById(2131362167));
    this.mName.addTextChangedListener(this);
    this.mName.setOnEditorActionListener(new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        return SignUpNameAvatarFragment.this.onEditorActionClicked(paramAnonymousInt, SignUpNameAvatarFragment.this.mName);
      }
    });
    this.mPhoneNumberContainer = ((RelativeLayout)paramView.findViewById(2131362130));
    this.mPhoneNumber = ((EditText)paramView.findViewById(2131362161));
    this.mPhoneNumber.addTextChangedListener(this);
    this.mPhoneNumber.setOnEditorActionListener(new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        return SignUpNameAvatarFragment.this.onEditorActionClicked(paramAnonymousInt, SignUpNameAvatarFragment.this.mPhoneNumber);
      }
    });
    this.mProfileImage = ((ImageView)paramView.findViewById(2131362166));
    this.mProfileImage.setOnClickListener(this);
    if (this.mLogin != null)
    {
      ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog.setMessage(getString(2131624151));
      localProgressDialog.setProgress(0);
      localProgressDialog.show();
      this.mProgress = localProgressDialog;
      this.mAppController.fetchTwitterUser(this.mLogin);
    }
    new ContactsHelper(this, this);
  }

  public void setAvatarUrl(Uri paramUri)
  {
    this.mProfileUri = paramUri;
  }

  public void setThumbnailImage(Bitmap paramBitmap)
  {
    if (paramBitmap != null)
    {
      this.mProfileImage.setImageDrawable(new RecyclableBitmapDrawable(this.mProfileImage.getResources(), paramBitmap));
      this.mHasPromptedForPhoto = true;
      this.mPhotoAttached = true;
      return;
    }
    this.mProfileImage.setImageResource(2130837622);
    this.mPhotoAttached = false;
  }

  class SignUpListener extends AppSessionListener
  {
    SignUpListener()
    {
    }

    public void onGetTwitterUserComplete(String paramString1, int paramInt, String paramString2, TwitterUser paramTwitterUser, VineLogin paramVineLogin)
    {
      if ((paramInt != 200) && (paramTwitterUser != null))
      {
        SignUpNameAvatarFragment.this.mName.setText(paramTwitterUser.name);
        SignUpNameAvatarFragment.this.mPhoneNumberContainer.setVisibility(0);
        SignUpNameAvatarFragment.access$402(SignUpNameAvatarFragment.this, null);
        if (!paramTwitterUser.defaultProfileImage)
        {
          localImageKey = new ImageKey(paramTwitterUser.profileUrl);
          localBitmap = SignUpNameAvatarFragment.this.mAppController.getPhotoBitmap(localImageKey);
          if (localBitmap == null)
          {
            SignUpNameAvatarFragment.this.mProfileImage.setImageResource(2130837622);
            SignUpNameAvatarFragment.this.mProfileImage.setTag(localImageKey);
            SignUpNameAvatarFragment.access$602(SignUpNameAvatarFragment.this, false);
            SignUpNameAvatarFragment.access$902(SignUpNameAvatarFragment.this, paramTwitterUser);
          }
        }
      }
      while (SignUpNameAvatarFragment.this.mProgress == null)
        while (true)
        {
          ImageKey localImageKey;
          Bitmap localBitmap;
          return;
          SignUpNameAvatarFragment.this.mProfileImage.setImageDrawable(new RecyclableBitmapDrawable(SignUpNameAvatarFragment.this.mProfileImage.getResources(), localBitmap));
          SignUpNameAvatarFragment.this.mProfileImage.setTag(null);
          SignUpNameAvatarFragment.access$602(SignUpNameAvatarFragment.this, true);
          SignUpNameAvatarFragment.this.mImagePicker.saveProfileImage(localBitmap);
          if (SignUpNameAvatarFragment.this.mProgress != null)
          {
            SignUpNameAvatarFragment.this.mProgress.dismiss();
            continue;
            if (SignUpNameAvatarFragment.this.mProgress != null)
              SignUpNameAvatarFragment.this.mProgress.dismiss();
          }
        }
      SignUpNameAvatarFragment.this.mProgress.dismiss();
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      UrlImage localUrlImage = (UrlImage)paramHashMap.get((ImageKey)SignUpNameAvatarFragment.this.mProfileImage.getTag());
      if ((localUrlImage != null) && (localUrlImage.isValid()))
      {
        SignUpNameAvatarFragment.this.mProfileImage.setImageDrawable(new RecyclableBitmapDrawable(SignUpNameAvatarFragment.this.mProfileImage.getResources(), localUrlImage.bitmap));
        SignUpNameAvatarFragment.access$602(SignUpNameAvatarFragment.this, true);
        SignUpNameAvatarFragment.this.mImagePicker.saveProfileImage(localUrlImage.bitmap);
        if (SignUpNameAvatarFragment.this.mProgress != null)
          SignUpNameAvatarFragment.this.mProgress.dismiss();
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SignUpNameAvatarFragment
 * JD-Core Version:    0.6.2
 */