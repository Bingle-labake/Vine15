package co.vine.android;

import android.app.ProgressDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.text.TextUtils;
import android.view.MenuItem;
import co.vine.android.api.TwitterUser;
import co.vine.android.api.VineError;
import co.vine.android.api.VineLogin;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.widget.ConfigurableViewPager;
import java.lang.ref.WeakReference;

public class SignUpPagerActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_FINISH = "finish";
  public static final String EXTRA_LOGIN = "user";
  public static final int FLOW_STEP_DETAILS = 1;
  public static final int FLOW_STEP_NAME_AVATAR = 0;
  private static final int NUM_PAGES = 2;
  private static final String STATE_LOGIN = "s_login";
  private static final String STATE_NAME = "s_name";
  private static final String STATE_PASSWORD = "s_password";
  private static final String STATE_PHONE = "s_phone";
  private static final String STATE_PROFILE = "s_profile";
  private WeakReference<Fragment> mAvatarFrag;
  private WeakReference<Fragment> mDetailsFrag;
  private boolean mFinish;
  private String mLogin;
  private String mName;
  private ConfigurableViewPager mPager;
  private String mPassword;
  private String mPhone;
  private Uri mProfile;
  private TwitterUser mTwitterUser;
  private VineLogin mVineLogin;

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (this.mPager.getCurrentItem())
    {
    default:
    case 0:
    case 1:
    }
    Fragment localFragment1;
    do
    {
      do
      {
        Fragment localFragment2;
        do
        {
          do
            return;
          while (this.mAvatarFrag == null);
          localFragment2 = (Fragment)this.mAvatarFrag.get();
        }
        while (localFragment2 == null);
        localFragment2.onActivityResult(paramInt1, paramInt2, paramIntent);
        return;
      }
      while (this.mDetailsFrag == null);
      localFragment1 = (Fragment)this.mDetailsFrag.get();
    }
    while (localFragment1 == null);
    localFragment1.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onBackPressed()
  {
    if (this.mPager.getCurrentItem() == 0)
    {
      super.onBackPressed();
      return;
    }
    this.mPager.setCurrentItem(-1 + this.mPager.getCurrentItem());
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903138, false);
    Intent localIntent = getIntent();
    if (localIntent != null)
      this.mFinish = localIntent.getBooleanExtra("finish", false);
    this.mPager = ((ConfigurableViewPager)findViewById(2131361926));
    this.mPager.setSwipingEnabled(false);
    this.mPager.setAdapter(new SignUpPagerAdapter(getSupportFragmentManager()));
    this.mAppSessionListener = new SignUpListener();
    this.mVineLogin = ((VineLogin)getIntent().getParcelableExtra("user"));
    if (paramBundle != null)
    {
      this.mLogin = paramBundle.getString("s_login");
      this.mName = paramBundle.getString("s_name");
      this.mPassword = paramBundle.getString("s_password");
      this.mPhone = paramBundle.getString("s_phone");
      this.mProfile = ((Uri)paramBundle.getParcelable("s_profile"));
    }
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 16908332:
    }
    onBackPressed();
    return true;
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putString("s_login", this.mLogin);
    paramBundle.putString("s_password", this.mPassword);
    paramBundle.putString("s_name", this.mName);
    paramBundle.putString("s_phone", this.mPhone);
    paramBundle.putParcelable("s_profile", this.mProfile);
  }

  protected void setBarTitle(int paramInt)
  {
    setupActionBar(null, Boolean.valueOf(true), Integer.valueOf(paramInt), null);
  }

  public void setLogin(String paramString)
  {
    this.mLogin = paramString;
  }

  public void setName(String paramString)
  {
    this.mName = paramString;
  }

  public void setPassword(String paramString)
  {
    this.mPassword = paramString;
  }

  public void setPhone(String paramString)
  {
    this.mPhone = paramString;
  }

  public void setProfile(Uri paramUri)
  {
    this.mProfile = paramUri;
  }

  public void setTwitterUser(TwitterUser paramTwitterUser)
  {
    this.mTwitterUser = paramTwitterUser;
  }

  protected void toNextStep()
  {
    ProgressDialog localProgressDialog2;
    switch (this.mPager.getCurrentItem())
    {
    default:
      return;
    case 0:
      if (this.mTwitterUser != null)
      {
        localProgressDialog2 = new ProgressDialog(this, 2131689512);
        localProgressDialog2.setMessage(getString(2131624167));
        localProgressDialog2.setProgress(0);
      }
      break;
    case 1:
    }
    try
    {
      localProgressDialog2.show();
      this.mProgressDialog = localProgressDialog2;
      this.mAppController.signUp(null, null, this.mName, this.mPhone, this.mProfile, this.mTwitterUser, this.mVineLogin);
      return;
      this.mPager.setCurrentItem(1);
      return;
      localProgressDialog1 = new ProgressDialog(this, 2131689512);
      this.mProgressDialog = localProgressDialog1;
      localProgressDialog1.setProgressStyle(0);
      localProgressDialog1.setMessage(getString(2131624357));
    }
    catch (Exception localException2)
    {
      try
      {
        ProgressDialog localProgressDialog1;
        localProgressDialog1.show();
        label152: this.mAppController.signUp(this.mLogin, this.mPassword, this.mName, this.mPhone, this.mProfile, null, null);
        return;
        localException2 = localException2;
      }
      catch (Exception localException1)
      {
        break label152;
      }
    }
  }

  class SignUpListener extends AppSessionListener
  {
    SignUpListener()
    {
    }

    public void onCheckTwitterComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, boolean paramBoolean, VineUser paramVineUser, VineLogin paramVineLogin)
    {
      if ((paramBoolean) && (paramInt1 == 200))
      {
        SignUpPagerActivity.this.mAppController.loginComplete(SignUpPagerActivity.this.mAppController.getActiveSession(), paramInt1, paramVineUser.username, null, paramVineLogin, paramVineUser.avatarUrl);
        SignUpPagerActivity.this.dismissDialog();
        if (SignUpPagerActivity.this.mFinish)
        {
          SignUpPagerActivity.this.setResult(-1);
          SignUpPagerActivity.this.finish();
          return;
        }
        StartActivity.toStart(SignUpPagerActivity.this);
        return;
      }
      if ((!paramBoolean) && (paramInt1 == 400))
      {
        Intent localIntent = new Intent(SignUpPagerActivity.this, SignUpPagerActivity.class);
        localIntent.putExtra("user", paramVineLogin);
        SignUpPagerActivity.this.startActivity(localIntent);
        return;
      }
      Util.showCenteredToast(SignUpPagerActivity.this, paramString2);
    }

    public void onLoginComplete(Session paramSession, String paramString1, int paramInt1, String paramString2, int paramInt2, VineLogin paramVineLogin)
    {
      SignUpPagerActivity.this.dismissDialog();
      if (paramInt1 == 200)
      {
        Util.showCenteredToast(SignUpPagerActivity.this, SignUpPagerActivity.this.getString(2131624164));
        if (SignUpPagerActivity.this.mFinish)
        {
          SignUpPagerActivity.this.setResult(-1);
          SignUpPagerActivity.this.finish();
          return;
        }
        StartActivity.toStart(SignUpPagerActivity.this);
        SignUpPagerActivity.this.mAppController.getEditions();
        return;
      }
      if (!TextUtils.isEmpty(paramString2))
      {
        Util.showCenteredToast(SignUpPagerActivity.this, paramString2);
        return;
      }
      Util.showCenteredToast(SignUpPagerActivity.this, 2131624101);
    }

    public void onSignUpComplete(String paramString1, int paramInt, String paramString2, VineLogin paramVineLogin, String paramString3, String paramString4, String paramString5)
    {
      if ((paramInt == 200) && (paramVineLogin != null) && (paramVineLogin.userId > 0L))
      {
        switch (paramVineLogin.loginType)
        {
        default:
          return;
        case 1:
          SignUpPagerActivity.this.mAppController.loginComplete(SignUpPagerActivity.this.mAppController.getActiveSession(), paramInt, paramString3, paramString4, paramVineLogin, paramString5);
          SignUpPagerActivity.this.dismissDialog();
          if (SignUpPagerActivity.this.mFinish)
          {
            SignUpPagerActivity.this.setResult(-1);
            SignUpPagerActivity.this.finish();
            return;
          }
          StartActivity.toStart(SignUpPagerActivity.this);
          return;
        case 2:
        }
        if (SignUpPagerActivity.this.mVineLogin != null)
        {
          ProgressDialog localProgressDialog = new ProgressDialog(SignUpPagerActivity.this, 2131689512);
          SignUpPagerActivity.this.mProgressDialog = localProgressDialog;
          localProgressDialog.setProgressStyle(0);
          localProgressDialog.setMessage(SignUpPagerActivity.this.getString(2131624357));
          localProgressDialog.show();
          SignUpPagerActivity.this.mAppController.loginCheckTwitter(SignUpPagerActivity.this.mVineLogin.twitterUsername, SignUpPagerActivity.this.mVineLogin.twitterToken, SignUpPagerActivity.this.mVineLogin.twitterSecret, SignUpPagerActivity.this.mVineLogin.userId, false);
          return;
        }
        FlurryUtils.onSignupFailure(true, new VineError(-1, "mVineLogin is null."), -1);
        SignUpPagerActivity.this.finish();
        return;
      }
      SignUpPagerActivity.this.dismissDialog();
      if (!TextUtils.isEmpty(paramString2))
      {
        Util.showCenteredToast(SignUpPagerActivity.this, paramString2);
        return;
      }
      Util.showCenteredToast(SignUpPagerActivity.this, 2131624101);
    }
  }

  private class SignUpPagerAdapter extends FragmentStatePagerAdapter
  {
    public SignUpPagerAdapter(FragmentManager arg2)
    {
      super();
    }

    public int getCount()
    {
      return 2;
    }

    public Fragment getItem(int paramInt)
    {
      switch (paramInt)
      {
      default:
        throw new IllegalArgumentException("no pager found for " + paramInt);
      case 0:
        SignUpNameAvatarFragment localSignUpNameAvatarFragment = new SignUpNameAvatarFragment();
        if (SignUpPagerActivity.this.mVineLogin != null)
          localSignUpNameAvatarFragment.setArguments(SignUpPagerActivity.this.getIntent().getExtras());
        SignUpPagerActivity.access$102(SignUpPagerActivity.this, new WeakReference(localSignUpNameAvatarFragment));
        return localSignUpNameAvatarFragment;
      case 1:
      }
      SignUpDetailsFragment localSignUpDetailsFragment = new SignUpDetailsFragment();
      SignUpPagerActivity.access$202(SignUpPagerActivity.this, new WeakReference(localSignUpDetailsFragment));
      return localSignUpDetailsFragment;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SignUpPagerActivity
 * JD-Core Version:    0.6.2
 */