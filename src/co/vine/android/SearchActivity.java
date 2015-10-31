package co.vine.android;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TabHost.TabSpec;
import android.widget.TabWidget;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import co.vine.android.util.Util;
import co.vine.android.widget.FragmentTabHost;
import java.lang.ref.WeakReference;

public class SearchActivity extends BaseControllerActionBarActivity
  implements View.OnClickListener, TextView.OnEditorActionListener, TextWatcher
{
  public static final String TAB_TAGS = "tags";
  public static final String TAB_USERS = "users";
  private ImageButton mClear;
  private WeakReference<BaseSearchFragment> mCurrentFragment;
  private EditText mQuery;
  private FragmentTabHost mTabHost;

  private void performSearch()
  {
    this.mQuery.clearFocus();
    Util.setSoftInputVisibility(this, this.mQuery, false);
    if ((this.mCurrentFragment != null) && (this.mCurrentFragment.get() != null))
    {
      ((BaseSearchFragment)this.mCurrentFragment.get()).setQueryText(this.mQuery.getText().toString());
      ((BaseSearchFragment)this.mCurrentFragment.get()).performSearch();
    }
  }

  public void afterTextChanged(Editable paramEditable)
  {
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  public void clearQueryText()
  {
    this.mQuery.setText("");
    this.mQuery.requestFocus();
    Util.setSoftInputVisibility(this, this.mQuery, true);
  }

  @TargetApi(11)
  protected void modernShowDivider()
  {
    if (Build.VERSION.SDK_INT >= 11)
      this.mTabHost.getTabWidget().setShowDividers(0);
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131362120:
    case 2131362121:
    case 2131362123:
    default:
    case 2131362118:
    case 2131362119:
      do
      {
        return;
        Util.setSoftInputVisibility(this, this.mQuery, true);
        return;
        this.mClear.setVisibility(8);
        clearQueryText();
      }
      while ((this.mCurrentFragment == null) || (this.mCurrentFragment.get() == null));
      ((BaseSearchFragment)this.mCurrentFragment.get()).setQueryText("");
      ((BaseSearchFragment)this.mCurrentFragment.get()).cleanSearchResults();
      return;
    case 2131362122:
    case 2131362124:
    }
    performSearch();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903132, true);
    setRequestedOrientation(1);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
    {
      localActionBar.setDisplayShowCustomEnabled(true);
      localActionBar.setCustomView(2130903131);
    }
    EditText localEditText = (EditText)getSupportActionBar().getCustomView().findViewById(2131362118);
    localEditText.setOnEditorActionListener(this);
    localEditText.addTextChangedListener(this);
    localEditText.requestFocus();
    this.mQuery = localEditText;
    ImageButton localImageButton = (ImageButton)findViewById(2131362119);
    localImageButton.setOnClickListener(this);
    this.mClear = localImageButton;
    if (paramBundle == null)
    {
      this.mTabHost = ((FragmentTabHost)findViewById(2131362120));
      this.mTabHost.setup(this, getSupportFragmentManager(), 2131362121);
      LayoutInflater localLayoutInflater = LayoutInflater.from(this);
      Bundle localBundle1 = new Bundle();
      localBundle1.putInt("empty_desc", 2131624188);
      localBundle1.putBoolean("refresh", false);
      TabHost.TabSpec localTabSpec1 = this.mTabHost.newTabSpec("users");
      View localView1 = localLayoutInflater.inflate(2130903134, this.mTabHost.getTabWidget(), false);
      ((TextView)localView1.findViewById(2131362126)).setText(getString(2131624215).toUpperCase());
      ((ImageView)localView1.findViewById(2131362125)).setImageDrawable(getResources().getDrawable(2130837977));
      localTabSpec1.setIndicator(localView1);
      this.mTabHost.addTab(localTabSpec1, UserSearchFragment.class, localBundle1);
      Bundle localBundle2 = new Bundle();
      localBundle2.putInt("empty_desc", 2131624189);
      localBundle2.putBoolean("refresh", false);
      TabHost.TabSpec localTabSpec2 = this.mTabHost.newTabSpec("tags");
      View localView2 = localLayoutInflater.inflate(2130903134, this.mTabHost.getTabWidget(), false);
      ((TextView)localView2.findViewById(2131362126)).setText(getString(2131624378).toUpperCase());
      ((ImageView)localView2.findViewById(2131362125)).setImageDrawable(getResources().getDrawable(2130837982));
      localTabSpec2.setIndicator(localView2);
      this.mTabHost.addTab(localTabSpec2, TagSearchFragment.class, localBundle2);
      modernShowDivider();
    }
  }

  public void onDestroy()
  {
    super.onDestroy();
    this.mTabHost = null;
  }

  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    switch (paramTextView.getId())
    {
    default:
    case 2131362118:
    }
    int i;
    do
    {
      return false;
      i = 2;
      if ((this.mCurrentFragment != null) && (this.mCurrentFragment.get() != null))
        i = ((BaseSearchFragment)this.mCurrentFragment.get()).getMinimumSearchQueryLength();
    }
    while ((paramInt != 3) || (this.mQuery.getText().length() < i));
    performSearch();
    return true;
  }

  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    ImageButton localImageButton = (ImageButton)findViewById(2131362119);
    if (paramCharSequence.length() > 0)
      localImageButton.setVisibility(0);
    while (true)
    {
      if ((this.mCurrentFragment != null) && (this.mCurrentFragment.get() != null))
      {
        if (paramCharSequence.length() < ((BaseSearchFragment)this.mCurrentFragment.get()).getMinimumSearchQueryLength())
          break;
        ((BaseSearchFragment)this.mCurrentFragment.get()).showSearchHint(getResources(), paramCharSequence.toString());
      }
      return;
      localImageButton.setVisibility(8);
    }
    ((BaseSearchFragment)this.mCurrentFragment.get()).hideSearchHint();
  }

  public void restoreQueryText(String paramString)
  {
    this.mQuery.setText(paramString);
    this.mQuery.clearFocus();
    Util.setSoftInputVisibility(this, this.mQuery, false);
  }

  public void setCurrentTab(BaseSearchFragment paramBaseSearchFragment)
  {
    this.mCurrentFragment = new WeakReference(paramBaseSearchFragment);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SearchActivity
 * JD-Core Version:    0.6.2
 */