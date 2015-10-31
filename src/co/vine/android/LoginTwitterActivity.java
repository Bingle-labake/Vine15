package co.vine.android;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.Editable;
import android.text.Spannable;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.LinkMovementMethod;
import android.text.style.StyleSpan;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager.BadTokenException;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import co.vine.android.api.VineError.VineKnownErrors;
import co.vine.android.api.VineLogin;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.util.Util;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.StyledClickableSpan;
import co.vine.android.widget.Typefaces;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;

public class LoginTwitterActivity extends BaseControllerActionBarActivity
  implements TextWatcher, SpanClickListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  private static final int DIALOG_ACTIVATE_ACCOUNT = 1;
  public static final String EXTRA_FINISH = "finish";
  public static final String EXTRA_SCREEN_NAME = "screen_name";
  public static final String EXTRA_SECRET = "secret";
  public static final String EXTRA_TOKEN = "token";
  public static final String EXTRA_USER_ID = "user_id";
  private static final int SPAN_VINE_PP = 1;
  private static final int SPAN_VINE_TOS = 2;
  private static final String STATE_VINE_LOGIN = "vine_login";
  private boolean mFinish;
  private EditText mPassword;
  private MenuItem mSignIn;
  private EditText mUsername;
  private VineLogin mVineLogin;

  public static Intent getIntent(Context paramContext)
  {
    return new Intent(paramContext, LoginTwitterActivity.class);
  }

  public static Intent getIntentWithFinish(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, LoginTwitterActivity.class);
    localIntent.putExtra("finish", true);
    return localIntent;
  }

  private void login(boolean paramBoolean)
  {
    ProgressDialog localProgressDialog;
    if (validate())
    {
      localProgressDialog = new ProgressDialog(this, 2131689512);
      localProgressDialog.setMessage(getString(2131624353));
      localProgressDialog.setProgress(0);
    }
    try
    {
      localProgressDialog.show();
      label37: this.mProgressDialog = localProgressDialog;
      if (!paramBoolean)
      {
        this.mAppController.loginWithxAuth(this.mUsername.getText().toString(), this.mPassword.getText().toString());
        return;
      }
      if (this.mVineLogin != null)
      {
        VineLogin localVineLogin = this.mVineLogin;
        this.mAppController.loginCheckTwitter(localVineLogin.twitterUsername, localVineLogin.twitterToken, localVineLogin.twitterSecret, localVineLogin.twitterUserId, true);
        return;
      }
      Util.showCenteredToast(this, 2131624104);
      return;
    }
    catch (WindowManager.BadTokenException localBadTokenException)
    {
      break label37;
    }
  }

  private boolean validate()
  {
    return (this.mUsername.length() >= 1) && (this.mPassword.length() >= 1);
  }

  public void afterTextChanged(Editable paramEditable)
  {
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903155, false);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624169), Boolean.valueOf(true));
    this.mUsername = ((EditText)findViewById(2131361963));
    this.mUsername.setTypeface(Typefaces.get(this).getContentTypeface(0, 2));
    this.mUsername.addTextChangedListener(this);
    this.mPassword = ((EditText)findViewById(2131361966));
    this.mPassword.setTypeface(Typefaces.get(this).getContentTypeface(0, 2));
    this.mPassword.addTextChangedListener(this);
    this.mPassword.setOnEditorActionListener(new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        if (((paramAnonymousKeyEvent != null) && (paramAnonymousKeyEvent.getKeyCode() == 66)) || (paramAnonymousInt == 6))
          LoginTwitterActivity.this.login(false);
        return false;
      }
    });
    this.mFinish = getIntent().getBooleanExtra("finish", false);
    this.mAppSessionListener = new LoginTwitterListener();
    TextView localTextView = (TextView)findViewById(2131362164);
    StyleSpan[] arrayOfStyleSpan1 = new StyleSpan[2];
    arrayOfStyleSpan1[0] = new StyleSpan(1);
    arrayOfStyleSpan1[1] = new StyleSpan(1);
    Spanned localSpanned = Util.getSpannedText(arrayOfStyleSpan1, getString(2131624171), '"');
    localTextView.setText(localSpanned);
    localTextView.setMovementMethod(LinkMovementMethod.getInstance());
    Spannable localSpannable = (Spannable)localTextView.getText();
    StyleSpan[] arrayOfStyleSpan2 = (StyleSpan[])localSpanned.getSpans(0, localSpanned.length(), StyleSpan.class);
    Resources localResources = getResources();
    int i = localSpanned.getSpanStart(arrayOfStyleSpan2[0]);
    int j = localSpanned.getSpanEnd(arrayOfStyleSpan2[0]);
    StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(2, null, this);
    localStyledClickableSpan1.setColor(localResources.getColor(2131296365));
    Util.safeSetSpan(localSpannable, localStyledClickableSpan1, i, j, 33);
    if ((paramBundle != null) && (paramBundle.containsKey("vine_login")))
      this.mVineLogin = ((VineLogin)paramBundle.getParcelable("vine_login"));
    int k = localSpanned.getSpanStart(arrayOfStyleSpan2[1]);
    int m = localSpanned.getSpanEnd(arrayOfStyleSpan2[1]);
    StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(1, null, this);
    localStyledClickableSpan2.setColor(localResources.getColor(2131296365));
    Util.safeSetSpan(localSpannable, localStyledClickableSpan2, k, m, 33);
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755014, paramMenu);
    this.mSignIn = paramMenu.findItem(2131362195);
    return true;
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 1:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -1:
    }
    login(true);
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362195:
    }
    login(false);
    return true;
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (this.mVineLogin != null)
      paramBundle.putParcelable("vine_login", this.mVineLogin);
  }

  public void onSpanClicked(View paramView, int paramInt, Object paramObject)
  {
    Intent localIntent = new Intent(this, WebViewActivity.class);
    switch (paramInt)
    {
    default:
      return;
    case 1:
      localIntent.putExtra("type", 1);
    case 2:
    }
    while (true)
    {
      startActivity(localIntent);
      return;
      localIntent.putExtra("type", 2);
    }
  }

  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    if (this.mSignIn != null)
      this.mSignIn.setEnabled(validate());
  }

  class LoginTwitterListener extends AppSessionListener
  {
    LoginTwitterListener()
    {
    }

    public void onCheckTwitterComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, boolean paramBoolean, VineUser paramVineUser, VineLogin paramVineLogin)
    {
      if ((paramBoolean) && (paramInt1 == 200))
      {
        LoginTwitterActivity.this.mAppController.loginComplete(LoginTwitterActivity.this.mAppController.getActiveSession(), paramInt1, paramVineUser.username, null, paramVineLogin, paramVineUser.avatarUrl);
        if (LoginTwitterActivity.this.mFinish)
        {
          LoginTwitterActivity.this.finish();
          return;
        }
        StartActivity.toStart(LoginTwitterActivity.this);
        return;
      }
      LoginTwitterActivity.this.dismissDialog();
      if (paramInt1 == 400)
      {
        Intent localIntent = new Intent(LoginTwitterActivity.this, SignUpPagerActivity.class);
        localIntent.putExtra("user", paramVineLogin);
        LoginTwitterActivity.this.startActivity(localIntent);
        return;
      }
      if (paramInt2 == VineError.VineKnownErrors.ACCOUNT_DEACTIVATED.code)
      {
        PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment.setMessage(2131624284);
        localPromptDialogSupportFragment.setTitle(2131624285);
        localPromptDialogSupportFragment.setNegativeButton(2131624018);
        localPromptDialogSupportFragment.setPositiveButton(2131624283);
        localPromptDialogSupportFragment.show(LoginTwitterActivity.this.getSupportFragmentManager());
        return;
      }
      Util.showCenteredToast(LoginTwitterActivity.this, paramString2);
    }

    public void onTwitterxAuthComplete(String paramString1, int paramInt, String paramString2, VineLogin paramVineLogin)
    {
      if (LoginTwitterActivity.this.mFinish)
      {
        if (paramInt == 200)
        {
          if (!LoginTwitterActivity.this.mAppController.isLoggedIn())
          {
            LoginTwitterActivity.this.mAppController.loginCheckTwitter(paramVineLogin.twitterUsername, paramVineLogin.twitterToken, paramVineLogin.twitterSecret, paramVineLogin.twitterUserId, false);
            return;
          }
          Intent localIntent = new Intent();
          localIntent.putExtra("token", paramVineLogin.twitterToken);
          localIntent.putExtra("secret", paramVineLogin.twitterSecret);
          localIntent.putExtra("user_id", paramVineLogin.twitterUserId);
          localIntent.putExtra("screen_name", paramVineLogin.twitterUsername);
          LoginTwitterActivity.this.setResult(-1, localIntent);
          LoginTwitterActivity.this.finish();
          return;
        }
        LoginTwitterActivity.this.dismissDialog();
        Util.showCenteredToast(LoginTwitterActivity.this, 2131624129);
        return;
      }
      if ((paramInt == 200) && (paramVineLogin != null))
      {
        LoginTwitterActivity.access$202(LoginTwitterActivity.this, paramVineLogin);
        LoginTwitterActivity.this.mAppController.loginCheckTwitter(paramVineLogin.twitterUsername, paramVineLogin.twitterToken, paramVineLogin.twitterSecret, paramVineLogin.twitterUserId, false);
        return;
      }
      LoginTwitterActivity.this.dismissDialog();
      if (!TextUtils.isEmpty(paramString2))
      {
        Util.showCenteredToast(LoginTwitterActivity.this, paramString2);
        return;
      }
      Util.showCenteredToast(LoginTwitterActivity.this, 2131624104);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.LoginTwitterActivity
 * JD-Core Version:    0.6.2
 */