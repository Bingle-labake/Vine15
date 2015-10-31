package co.vine.android;

import android.app.Activity;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import co.vine.android.client.VineAPI;
import co.vine.android.provider.VineDatabaseHelper;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public abstract class BaseSearchFragment extends BaseListFragment
  implements View.OnClickListener
{
  protected SearchActivity mCallback;
  protected VineDatabaseHelper mDbHelper;
  protected String mEncodedQueryString;
  protected ExecutorService mExecutor;
  protected String[] mProjection;
  protected String mQueryString;
  private TextView mSearchHint;
  private ViewGroup mSearchHintContainer;
  protected String mSortOrder;

  public abstract void cleanSearchResults();

  protected abstract void fetchContent(int paramInt);

  public abstract int getMinimumSearchQueryLength();

  public void hideSearchHint()
  {
    this.mSearchHintContainer.setVisibility(8);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    RelativeLayout localRelativeLayout = (RelativeLayout)getView().findViewById(2131361901);
    ViewGroup localViewGroup = (ViewGroup)LayoutInflater.from(getActivity()).inflate(2130903133, null);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, getResources().getDimensionPixelSize(2131427404));
    localLayoutParams.addRule(10, -1);
    localViewGroup.setLayoutParams(localLayoutParams);
    localViewGroup.setOnClickListener(this.mCallback);
    localRelativeLayout.addView(localViewGroup);
    this.mSearchHint = ((TextView)localViewGroup.findViewById(2131362123));
    this.mSearchHintContainer = localViewGroup;
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    this.mDbHelper = VineDatabaseHelper.getDatabaseHelper(paramActivity);
    this.mExecutor = Executors.newCachedThreadPool();
    if ((paramActivity instanceof SearchActivity))
    {
      this.mCallback = ((SearchActivity)paramActivity);
      return;
    }
    throw new IllegalStateException("BaseSearchFragment instances must be added to a SearchActivity.");
  }

  public void onClick(View paramView)
  {
  }

  public void onDestroy()
  {
    cleanSearchResults();
    super.onDestroy();
  }

  public void onResume()
  {
    super.onResume();
    this.mCallback.setCurrentTab(this);
    initLoader();
    hideProgress(3);
    if (!TextUtils.isEmpty(this.mQueryString))
    {
      this.mCallback.restoreQueryText(this.mQueryString);
      this.mSearchHintContainer.setVisibility(8);
      return;
    }
    this.mCallback.clearQueryText();
  }

  protected abstract void performSearch();

  public void setQueryText(String paramString)
  {
    this.mQueryString = paramString;
    this.mEncodedQueryString = VineAPI.encode(paramString.trim());
  }

  public void showSearchHint(Resources paramResources, String paramString)
  {
    if (paramResources != null)
    {
      if (!this.mSearchHintContainer.isShown())
      {
        this.mSearchHintContainer.setVisibility(0);
        this.mSearchHintContainer.bringToFront();
      }
      this.mSearchHint.setText(paramResources.getString(2131624270, new Object[] { paramString }));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseSearchFragment
 * JD-Core Version:    0.6.2
 */