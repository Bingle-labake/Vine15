package co.vine.android;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.widget.Typefaces;
import co.vine.android.widgets.PromptDialogSupportFragment;

public class ResetPasswordActivity extends BaseControllerActionBarActivity
  implements TextWatcher
{
  private static final int DIALOG_CONFIRMED = 1;
  public static final String EXTRA_EMAIL = "email";
  private EditText mEmail;
  private MenuItem mSend;

  private boolean validate()
  {
    return this.mEmail.length() >= 3;
  }

  public void afterTextChanged(Editable paramEditable)
  {
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903128, false);
    ((InputMethodManager)getSystemService("input_method")).showSoftInputFromInputMethod(getWindow().getDecorView().getWindowToken(), 0);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624214), Boolean.valueOf(true));
    this.mAppSessionListener = new ResetPasswordListener(null);
    this.mEmail = ((EditText)findViewById(2131362114));
    this.mEmail.addTextChangedListener(this);
    this.mEmail.setTypeface(Typefaces.get(this).getContentTypeface(0, 2));
    Bundle localBundle = getIntent().getExtras();
    if ((localBundle != null) && (localBundle.containsKey("email")))
    {
      this.mEmail.setText(localBundle.getString("email"));
      this.mEmail.setSelection(this.mEmail.length());
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755019, paramMenu);
    this.mSend = paramMenu.findItem(2131362196);
    this.mSend.setEnabled(validate());
    return true;
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362196:
    }
    if (validate())
    {
      ProgressDialog localProgressDialog = new ProgressDialog(this, 2131689512);
      localProgressDialog.setProgress(0);
      localProgressDialog.setMessage(getString(2131624085));
      localProgressDialog.show();
      this.mProgressDialog = localProgressDialog;
      this.mAppController.resetPassword(this.mEmail.getText().toString());
    }
    return true;
  }

  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    if (this.mSend != null)
      this.mSend.setEnabled(validate());
  }

  private class ResetPasswordListener extends AppSessionListener
  {
    private ResetPasswordListener()
    {
    }

    public void onResetPasswordComplete(String paramString1, int paramInt, String paramString2)
    {
      ResetPasswordActivity.this.dismissDialog();
      int i;
      switch (paramInt)
      {
      default:
        i = 2131624211;
      case 200:
      case 404:
      }
      while (true)
      {
        PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment.setMessage(i);
        localPromptDialogSupportFragment.setPositiveButton(2131624205);
        localPromptDialogSupportFragment.show(ResetPasswordActivity.this.getSupportFragmentManager());
        return;
        i = 2131624210;
        continue;
        i = 2131624212;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ResetPasswordActivity
 * JD-Core Version:    0.6.2
 */