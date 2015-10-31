package co.vine.android;

import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListAdapter;
import android.widget.ListView;

public class SupportListActivity extends FragmentActivity
{
  protected ListAdapter mAdapter;
  private boolean mFinishedStart = false;
  private Handler mHandler = new Handler();
  protected ListView mList;
  private AdapterView.OnItemClickListener mOnClickListener = new AdapterView.OnItemClickListener()
  {
    public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      SupportListActivity.this.onListItemClick((ListView)paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
    }
  };
  private Runnable mRequestFocus = new Runnable()
  {
    public void run()
    {
      SupportListActivity.this.mList.focusableViewAvailable(SupportListActivity.this.mList);
    }
  };

  private void ensureList()
  {
    if (this.mList != null)
      return;
    setContentView(17367060);
  }

  public ListAdapter getListAdapter()
  {
    return this.mAdapter;
  }

  public ListView getListView()
  {
    ensureList();
    return this.mList;
  }

  public long getSelectedItemId()
  {
    return this.mList.getSelectedItemId();
  }

  public int getSelectedItemPosition()
  {
    return this.mList.getSelectedItemPosition();
  }

  public void onContentChanged()
  {
    super.onContentChanged();
    View localView = findViewById(16908292);
    this.mList = ((ListView)findViewById(16908298));
    if (this.mList == null)
      throw new RuntimeException("Your content must have a ListView whose id attribute is 'android.R.id.list'");
    if (localView != null)
      this.mList.setEmptyView(localView);
    this.mList.setOnItemClickListener(this.mOnClickListener);
    if (this.mFinishedStart)
      setListAdapter(this.mAdapter);
    this.mHandler.post(this.mRequestFocus);
    this.mFinishedStart = true;
  }

  protected void onDestroy()
  {
    this.mHandler.removeCallbacks(this.mRequestFocus);
    super.onDestroy();
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
  }

  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    ensureList();
    super.onRestoreInstanceState(paramBundle);
  }

  public void setListAdapter(ListAdapter paramListAdapter)
  {
    try
    {
      ensureList();
      this.mAdapter = paramListAdapter;
      this.mList.setAdapter(paramListAdapter);
      return;
    }
    finally
    {
    }
  }

  public void setSelection(int paramInt)
  {
    this.mList.setSelection(paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SupportListActivity
 * JD-Core Version:    0.6.2
 */