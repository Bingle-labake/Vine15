package co.vine.android;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.style.StyleSpan;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.BufferType;
import android.widget.TextView.OnEditorActionListener;
import co.vine.android.api.VineError.VineKnownErrors;
import co.vine.android.api.VineLogin;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.util.Util;
import co.vine.android.widget.Typefaces;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;

public class LoginActivity extends BaseControllerActionBarActivity
  implements TextWatcher, View.OnClickListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  private static final int DIALOG_ACTIVATE_ACCOUNT = 1;
  public static final String EXTRA_FINISH = "finish";
  private boolean mFinish;
  private MenuItem mLoginButton;
  private EditText mPassword;
  private EditText mUsername;
  private boolean mWidthResolved;

  public static Intent getIntent(Context paramContext)
  {
    return new Intent(paramContext, LoginActivity.class);
  }

  public static Intent getIntentWithFinish(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, LoginActivity.class);
    localIntent.putExtra("finish", true);
    return localIntent;
  }

  private void login(boolean paramBoolean)
  {
    String str1 = this.mUsername.getText().toString();
    String str2 = this.mPassword.getText().toString();
    ProgressDialog localProgressDialog = new ProgressDialog(this, 2131689512);
    localProgressDialog.setProgressStyle(0);
    localProgressDialog.setMessage(getString(2131624158));
    try
    {
      localProgressDialog.show();
      label56: this.mProgressDialog = localProgressDialog;
      Session localSession = this.mAppController.getSession(str1);
      VineLogin localVineLogin = new VineLogin(null, str1, 0L, null);
      this.mAppController.login(localSession, localVineLogin, str2, paramBoolean);
      return;
    }
    catch (Exception localException)
    {
      break label56;
    }
  }

  private boolean validate()
  {
    return (this.mUsername.length() >= 3) && (this.mPassword.length() >= 8);
  }

  public void afterTextChanged(Editable paramEditable)
  {
    if (this.mLoginButton != null)
      this.mLoginButton.setEnabled(validate());
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  void completeLogin(int paramInt1, String paramString, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      if (paramInt2 == VineError.VineKnownErrors.ACCOUNT_DEACTIVATED.code)
      {
        PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment.setMessage(2131624284);
        localPromptDialogSupportFragment.setTitle(2131624285);
        localPromptDialogSupportFragment.setNegativeButton(2131624018);
        localPromptDialogSupportFragment.setPositiveButton(2131624283);
        localPromptDialogSupportFragment.show(getSupportFragmentManager());
        return;
      }
      break;
    case 200:
      if (!this.mFinish)
        StartActivity.toStart(this);
      finish();
      return;
    }
    Util.showCenteredToast(this, paramString);
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131361968:
    }
    Intent localIntent = new Intent(this, ResetPasswordActivity.class);
    String str = this.mUsername.getText().toString();
    if (!TextUtils.isEmpty(str))
      localIntent.putExtra("email", str);
    startActivity(localIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903103, false);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624161), Boolean.valueOf(true));
    this.mAppSessionListener = new LoginSessionListener();
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
        if ((paramAnonymousInt == 6) && (LoginActivity.this.validate()))
        {
          ((InputMethodManager)LoginActivity.this.getSystemService("input_method")).hideSoftInputFromWindow(LoginActivity.this.mPassword.getWindowToken(), 0);
          LoginActivity.this.login(false);
        }
        return true;
      }
    });
    StyleSpan[] arrayOfStyleSpan = new StyleSpan[1];
    arrayOfStyleSpan[0] = new StyleSpan(1);
    TextView localTextView1 = (TextView)findViewById(2131361968);
    localTextView1.setText(Util.getSpannedText(arrayOfStyleSpan, getString(2131624157), '"'), TextView.BufferType.SPANNABLE);
    localTextView1.setOnClickListener(this);
    Intent localIntent = getIntent();
    if (localIntent != null);
    for (this.mFinish = localIntent.getBooleanExtra("finish", false); ; this.mFinish = false)
    {
      final EditText localEditText = (EditText)findViewById(2131361963);
      final TextView localTextView2 = (TextView)findViewById(2131361964);
      this.mWidthResolved = false;
      localTextView2.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
      {
        public void onGlobalLayout()
        {
          if (LoginActivity.this.mWidthResolved)
            return;
          int i = localTextView2.getWidth();
          localEditText.setPadding(i, 0, 0, 0);
          LoginActivity.access$302(LoginActivity.this, true);
        }
      });
      return;
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755014, paramMenu);
    this.mLoginButton = paramMenu.findItem(2131362195);
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
    case -2:
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
    if (validate())
      login(false);
    return true;
  }

  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  class LoginSessionListener extends AppSessionListener
  {
    LoginSessionListener()
    {
    }

    public void onLoginComplete(Session paramSession, String paramString1, int paramInt1, String paramString2, int paramInt2, VineLogin paramVineLogin)
    {
      LoginActivity.this.completeLogin(paramInt1, paramString2, paramInt2);
      LoginActivity.this.mAppController.getEditions();
      LoginActivity.this.dismissDialog();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.LoginActivity
 * JD-Core Version:    0.6.2
 */