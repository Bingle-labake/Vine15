package co.vine.android;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.Spannable;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.LinkMovementMethod;
import android.text.style.StyleSpan;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import co.vine.android.util.ContactsHelper;
import co.vine.android.util.ContactsHelper.ContactHelperListener;
import co.vine.android.util.Util;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.StyledClickableSpan;
import co.vine.android.widget.Typefaces;

public class SignUpDetailsFragment extends BaseFragment
  implements TextWatcher, SpanClickListener, ContactsHelper.ContactHelperListener
{
  private static final int SPAN_PRIVACY_POLICY = 1;
  private static final int SPAN_TOS = 2;
  private MenuItem mDoneButton;
  private EditText mEmail;
  private EditText mPassword;
  private EditText mPhone;
  private boolean mWidthResolved;

  private boolean onNextClicked()
  {
    SignUpPagerActivity localSignUpPagerActivity = (SignUpPagerActivity)getActivity();
    if (localSignUpPagerActivity != null)
    {
      localSignUpPagerActivity.setLogin(this.mEmail.getText().toString());
      localSignUpPagerActivity.setPassword(this.mPassword.getText().toString());
      localSignUpPagerActivity.setPhone(this.mPhone.getText().toString());
      localSignUpPagerActivity.toNextStep();
      return true;
    }
    return false;
  }

  private boolean validate()
  {
    return (this.mEmail != null) && (this.mEmail.length() >= 3) && (this.mPassword != null) && (this.mPassword.length() >= 8);
  }

  public void afterTextChanged(Editable paramEditable)
  {
    if (this.mDoneButton != null)
      this.mDoneButton.setEnabled(validate());
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setHasOptionsMenu(true);
    ((SignUpPagerActivity)getActivity()).setBarTitle(2131624162);
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755010, paramMenu);
    MenuItem localMenuItem = paramMenu.findItem(2131362189);
    if (localMenuItem != null)
      localMenuItem.setEnabled(validate());
    this.mDoneButton = localMenuItem;
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903139, paramViewGroup, false);
  }

  public void onEmailLoaded(String paramString)
  {
    if ((TextUtils.isEmpty(this.mEmail.getText())) && (!TextUtils.isEmpty(paramString)))
      this.mEmail.setText(paramString);
  }

  public void onNameLoaded(String paramString)
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
    return onNextClicked();
  }

  public void onPhoneNumberLoaded(String paramString)
  {
    if ((TextUtils.isEmpty(this.mPhone.getText())) && (!TextUtils.isEmpty(paramString)))
      this.mPhone.setText(paramString);
  }

  public void onSpanClicked(View paramView, int paramInt, Object paramObject)
  {
    if (getActivity() == null)
      return;
    Intent localIntent = new Intent(getActivity(), WebViewActivity.class);
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
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    this.mEmail = ((EditText)paramView.findViewById(2131362157));
    this.mEmail.addTextChangedListener(this);
    this.mPassword = ((EditText)paramView.findViewById(2131362159));
    this.mPassword.addTextChangedListener(this);
    this.mPassword.setTypeface(Typefaces.get(getActivity()).getContentTypeface(0, 2));
    this.mPhone = ((EditText)paramView.findViewById(2131362161));
    this.mPhone.setOnEditorActionListener(new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        if ((paramAnonymousInt == 6) && (SignUpDetailsFragment.this.validate()) && (SignUpDetailsFragment.this.getActivity() != null))
        {
          ((InputMethodManager)SignUpDetailsFragment.this.getActivity().getSystemService("input_method")).hideSoftInputFromWindow(SignUpDetailsFragment.this.mPhone.getWindowToken(), 0);
          SignUpDetailsFragment.this.onNextClicked();
        }
        return true;
      }
    });
    TextView localTextView1 = (TextView)paramView.findViewById(2131362164);
    StyleSpan[] arrayOfStyleSpan1 = new StyleSpan[2];
    arrayOfStyleSpan1[0] = new StyleSpan(1);
    arrayOfStyleSpan1[1] = new StyleSpan(1);
    Spanned localSpanned = Util.getSpannedText(arrayOfStyleSpan1, getString(2131624356), '"');
    localTextView1.setText(localSpanned);
    localTextView1.setMovementMethod(LinkMovementMethod.getInstance());
    Spannable localSpannable = (Spannable)localTextView1.getText();
    StyleSpan[] arrayOfStyleSpan2 = (StyleSpan[])localSpanned.getSpans(0, localSpanned.length(), StyleSpan.class);
    Resources localResources = getResources();
    int i = localSpanned.getSpanStart(arrayOfStyleSpan2[0]);
    int j = localSpanned.getSpanEnd(arrayOfStyleSpan2[0]);
    StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(1, null, this);
    localStyledClickableSpan1.setColor(localResources.getColor(2131296365));
    Util.safeSetSpan(localSpannable, localStyledClickableSpan1, i, j, 33);
    int k = localSpanned.getSpanStart(arrayOfStyleSpan2[1]);
    int m = localSpanned.getSpanEnd(arrayOfStyleSpan2[1]);
    StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(2, null, this);
    localStyledClickableSpan2.setColor(localResources.getColor(2131296365));
    Util.safeSetSpan(localSpannable, localStyledClickableSpan2, k, m, 33);
    new ContactsHelper(this, this);
    final EditText localEditText = (EditText)paramView.findViewById(2131362157);
    final TextView localTextView2 = (TextView)paramView.findViewById(2131362158);
    this.mWidthResolved = false;
    localTextView2.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
    {
      public void onGlobalLayout()
      {
        if (SignUpDetailsFragment.this.mWidthResolved)
          return;
        int i = localTextView2.getWidth();
        localEditText.setPadding(i, 0, 0, 0);
        SignUpDetailsFragment.access$302(SignUpDetailsFragment.this, true);
      }
    });
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SignUpDetailsFragment
 * JD-Core Version:    0.6.2
 */