package co.vine.android;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.util.FlurryUtils;
import co.vine.android.widget.OnTabChangedListener;
import com.twitter.android.widget.ItemPosition;
import com.twitter.android.widget.RefreshListener;
import com.twitter.android.widget.RefreshableListView;
import java.util.ArrayList;
import java.util.Iterator;

public class BaseListFragment extends BaseControllerFragment
  implements AbsListView.OnScrollListener, LoaderManager.LoaderCallbacks<Cursor>, OnTabChangedListener, RefreshListener
{
  public static final String ARG_BG_COLOR = "bg_color";
  public static final String ARG_CHOICE_MODE = "chmode";
  public static final String ARG_DATA = "data";
  public static final String ARG_EMPTY_DESC = "empty_desc";
  public static final String ARG_OWNER_ID = "owner_id";
  public static final String ARG_REFRESHABLE = "refresh";
  protected static final int LOADER_ID_DEFAULT = 0;
  protected static final int PROGRESS_FETCH_DATA = 3;
  protected static final int PROGRESS_FETCH_DATA_NEW_AUTO = 4;
  protected static final int PROGRESS_FETCH_NEWER = 2;
  protected static final int PROGRESS_FETCH_OLDER = 1;
  protected static final int PROGRESS_FIRST_USER = 6;
  protected static final int PROGRESS_LOAD_DATA = 5;
  protected static final int PROGRESS_LOAD_DATA_OLDER = 7;
  protected static final int PROGRESS_NONE = 0;
  private static final String STATE_CURRENT_REQ_IDS = "pending_reqs";
  private static final String STATE_SCROLL_OFF_KEY = "scroll_off";
  private static final String STATE_SCROLL_POS_KEY = "scroll_pos";
  protected int mBgColor;
  protected ChangeObserver mChangeObserver;
  protected int mChoiceMode;
  protected CursorAdapter mCursorAdapter;
  private View mEmpty;
  private ProgressBar mEmptyProgress;
  protected TextView mEmptyText;
  protected int mEmptyTextStringRes;
  private boolean mFocused;
  private final Handler mHandler = new Handler();
  protected ListState mListState;
  protected ListView mListView;
  private int mLoaderId = 0;
  private final AdapterView.OnItemClickListener mOnItemClickListener = new AdapterView.OnItemClickListener()
  {
    public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      BaseListFragment.this.onListItemClick((ListView)paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
    }
  };
  private final AdapterView.OnItemLongClickListener mOnItemLongClickListenerClickListener = new AdapterView.OnItemLongClickListener()
  {
    public boolean onItemLongClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      return BaseListFragment.this.onListItemLongClick((ListView)paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
    }
  };
  protected long mOwnerId;
  protected PendingCaptchaRequest mPendingCaptchaRequest;
  private ArrayList<PendingRequest> mPendingRequests;
  protected ProgressDialog mProgressDialog;
  protected boolean mRefreshable;
  protected boolean mRefreshing;
  private final Runnable mRequestFocus = new Runnable()
  {
    public void run()
    {
      BaseListFragment.this.mListView.focusableViewAvailable(BaseListFragment.this.mListView);
    }
  };
  protected View mSadface;
  private OnScrollListener mScrollListener;
  private int mScrollOffset;
  private int mScrollPos;

  public static Bundle prepareArguments(Intent paramIntent, boolean paramBoolean)
  {
    Bundle localBundle = paramIntent.getExtras();
    if (localBundle == null)
      localBundle = new Bundle();
    localBundle.putParcelable("data", paramIntent.getData());
    localBundle.putBoolean("refresh", paramBoolean);
    return localBundle;
  }

  private void showLoading(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.mListView.setVisibility(8);
      if (this.mSadface != null)
        this.mSadface.setVisibility(8);
      if (this.mEmptyProgress != null)
        this.mEmptyProgress.setVisibility(0);
    }
    do
    {
      return;
      ListView localListView = this.mListView;
      if (!isEmpty())
      {
        localListView.setVisibility(0);
        return;
      }
    }
    while (this.mEmptyProgress == null);
    this.mEmptyProgress.setVisibility(8);
  }

  protected String addRequest(String paramString)
  {
    this.mPendingRequests.add(new PendingRequest(paramString));
    return paramString;
  }

  protected String addRequest(String paramString, int paramInt)
  {
    this.mPendingRequests.add(new PendingRequest(paramString, paramInt));
    return paramString;
  }

  protected View createDefaultView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return createView(paramLayoutInflater, 2130903108, paramViewGroup);
  }

  protected final View createView(LayoutInflater paramLayoutInflater, int paramInt, ViewGroup paramViewGroup)
  {
    View localView1 = paramLayoutInflater.inflate(paramInt, paramViewGroup, false);
    ListView localListView = (ListView)localView1.findViewById(16908298);
    localListView.setOnItemClickListener(this.mOnItemClickListener);
    localListView.setOnItemLongClickListener(this.mOnItemLongClickListenerClickListener);
    localListView.setScrollbarFadingEnabled(true);
    localListView.setOnScrollListener(this);
    localListView.setChoiceMode(this.mChoiceMode);
    int i = this.mBgColor;
    if (i != 0)
    {
      localListView.setBackgroundColor(i);
      localListView.setCacheColorHint(i);
    }
    View localView2 = localView1.findViewById(16908292);
    if (localView2 != null)
    {
      localListView.setEmptyView(localView2);
      this.mEmptyProgress = ((ProgressBar)localView2.findViewById(2131362117));
    }
    this.mEmptyText = ((TextView)localView1.findViewById(2131361889));
    if ((this.mEmptyTextStringRes > 0) && (this.mEmptyText != null))
      this.mEmptyText.setText(this.mEmptyTextStringRes);
    this.mSadface = localView1.findViewById(2131361888);
    this.mEmpty = localView2;
    if (this.mRefreshable)
      ((RefreshableListView)localListView).setRefreshListener(this);
    this.mListView = localListView;
    return localView1;
  }

  protected void dismissDialog()
  {
    if (this.mProgressDialog != null)
    {
      this.mProgressDialog.dismiss();
      this.mProgressDialog = null;
    }
  }

  public ItemPosition getFirstItemPosition()
  {
    ListView localListView = this.mListView;
    if (localListView.getCount() < 1)
      return null;
    int i = localListView.getFirstVisiblePosition();
    int j = localListView.getHeaderViewsCount();
    if (this.mRefreshing)
      j++;
    int k;
    if (i < j)
      k = j;
    for (View localView = localListView.getChildAt(k - i); ; localView = localListView.getChildAt(0))
    {
      long l = localListView.getItemIdAtPosition(k);
      int m = 0;
      if (localView != null)
        m = localView.getTop();
      return new ItemPosition(k, l, m);
      k = i;
    }
  }

  protected int getIdColumnIndex()
  {
    return -1;
  }

  public int getPositionForItemId(long paramLong)
  {
    int i = getIdColumnIndex();
    if (i >= 0)
    {
      Cursor localCursor = this.mCursorAdapter.getCursor();
      if ((localCursor != null) && (localCursor.moveToFirst()))
        do
          if (localCursor.getLong(i) == paramLong)
          {
            int j = localCursor.getPosition() + this.mListView.getHeaderViewsCount();
            if (this.mRefreshing)
              j++;
            return j;
          }
        while (localCursor.moveToNext());
    }
    return 0;
  }

  protected void handleContentChanged()
  {
    ItemPosition localItemPosition = getFirstItemPosition();
    onContentChanged();
    restoreItemPosition(localItemPosition, true);
  }

  protected void handlePendingCaptchaRequest()
  {
    if ((this.mPendingCaptchaRequest != null) && (this.mAppController != null))
    {
      if (this.mPendingCaptchaRequest.state != 2)
        break label57;
      addRequest(this.mAppController.retryRequest(this.mPendingCaptchaRequest.actionCode, this.mPendingCaptchaRequest.bundle));
    }
    while (true)
    {
      this.mPendingCaptchaRequest = null;
      return;
      label57: if (this.mPendingCaptchaRequest.state == 3)
      {
        String str = this.mAppController.generateReqIdForCanceledCaptcha();
        addRequest(str);
        this.mAppController.failRequest(str, this.mPendingCaptchaRequest.actionCode, this.mPendingCaptchaRequest.bundle);
      }
    }
  }

  protected boolean hasPendingRequest()
  {
    return !this.mPendingRequests.isEmpty();
  }

  protected boolean hasPendingRequest(int paramInt)
  {
    if (paramInt != 0)
    {
      Iterator localIterator = this.mPendingRequests.iterator();
      while (localIterator.hasNext())
        if (((PendingRequest)localIterator.next()).fetchType == paramInt)
          return true;
    }
    return false;
  }

  protected void hideProgress(int paramInt)
  {
    switch (paramInt)
    {
    default:
    case 3:
    case 5:
    case 2:
    case 4:
    case 1:
    }
    do
    {
      do
      {
        return;
        showLoading(false);
        return;
        showLoading(false);
      }
      while (!this.mRefreshable);
      ((RefreshableListView)this.mListView).stopRefresh();
      this.mRefreshing = false;
      return;
    }
    while (!this.mRefreshable);
    ((RefreshableListView)this.mListView).refreshMore(false);
  }

  protected void initLoader()
  {
    initLoader(0);
  }

  protected final void initLoader(int paramInt)
  {
    if (this.mChangeObserver == null)
    {
      this.mChangeObserver = new ChangeObserver(this.mHandler);
      this.mLoaderId = paramInt;
    }
    getLoaderManager().initLoader(this.mLoaderId, null, this);
  }

  void invokeScrollFirstItem()
  {
    if (this.mScrollListener != null)
      this.mScrollListener.onScrollFirstItem();
  }

  protected boolean isEmpty()
  {
    ListView localListView = this.mListView;
    return localListView.getCount() - localListView.getHeaderViewsCount() - localListView.getFooterViewsCount() == 0;
  }

  protected boolean isFocused()
  {
    return this.mFocused;
  }

  protected void loadCursor(boolean paramBoolean)
  {
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
    case 11:
    }
    String str;
    do
    {
      do
        return;
      while ((this.mPendingCaptchaRequest == null) || (paramIntent == null));
      str = paramIntent.getStringExtra("rid");
      if ((paramInt2 == -1) && (str.equals(this.mPendingCaptchaRequest.reqId)))
      {
        this.mPendingCaptchaRequest.state = 2;
        return;
      }
    }
    while ((paramInt2 != 2) || (!str.equals(this.mPendingCaptchaRequest.reqId)));
    this.mPendingCaptchaRequest.state = 3;
  }

  protected void onContentChanged()
  {
    onRefreshFinished();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mListState = new ListState();
    if (paramBundle != null)
    {
      this.mScrollPos = paramBundle.getInt("scroll_pos");
      this.mScrollOffset = paramBundle.getInt("scroll_off");
      this.mPendingRequests = paramBundle.getParcelableArrayList("pending_reqs");
      this.mPendingCaptchaRequest = ((PendingCaptchaRequest)paramBundle.getParcelable("state_pending_captcha_request"));
    }
    while (true)
    {
      Bundle localBundle = getArguments();
      if (localBundle == null)
        break;
      this.mRefreshable = localBundle.getBoolean("refresh", true);
      this.mOwnerId = localBundle.getLong("owner_id", this.mAppController.getActiveId());
      if (localBundle.containsKey("chmode"))
        this.mChoiceMode = localBundle.getInt("chmode", 0);
      this.mBgColor = localBundle.getInt("bg_color", 0);
      this.mEmptyTextStringRes = localBundle.getInt("empty_desc", 0);
      return;
      this.mScrollPos = 0;
      this.mScrollOffset = 0;
      this.mPendingRequests = new ArrayList(5);
    }
    this.mRefreshable = true;
    this.mOwnerId = this.mAppController.getActiveId();
    this.mChoiceMode = 0;
    this.mBgColor = 0;
  }

  protected Dialog onCreateDialog(int paramInt)
  {
    return null;
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return null;
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return createDefaultView(paramLayoutInflater, paramViewGroup);
  }

  public void onDestroy()
  {
    if (this.mCursorAdapter != null)
    {
      Cursor localCursor = this.mCursorAdapter.swapCursor(null);
      if ((localCursor != null) && (this.mChangeObserver != null))
        localCursor.unregisterContentObserver(this.mChangeObserver);
    }
    super.onDestroy();
  }

  public void onDestroyView()
  {
    this.mHandler.removeCallbacks(this.mRequestFocus);
    super.onDestroyView();
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
  }

  protected boolean onListItemLongClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    return false;
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    Cursor localCursor = this.mCursorAdapter.getCursor();
    if (localCursor != null)
      localCursor.unregisterContentObserver(this.mChangeObserver);
    if (paramCursor != null)
      paramCursor.registerContentObserver(this.mChangeObserver);
    this.mCursorAdapter.swapCursor(paramCursor);
  }

  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
    Cursor localCursor = this.mCursorAdapter.getCursor();
    if (localCursor != null)
      localCursor.unregisterContentObserver(this.mChangeObserver);
    this.mCursorAdapter.swapCursor(null);
  }

  public void onMoveAway(int paramInt)
  {
    this.mFocused = false;
  }

  public void onMoveTo(int paramInt)
  {
    this.mFocused = true;
  }

  public void onPause()
  {
    super.onPause();
    dismissDialog();
    if (this.mListView.getCount() > 0)
      saveItemPosition(getFirstItemPosition());
  }

  public void onRefreshCancelled()
  {
  }

  public void onRefreshFinished()
  {
    CursorAdapter localCursorAdapter = this.mCursorAdapter;
    if ((localCursorAdapter != null) && (localCursorAdapter.getCursor() != null));
  }

  public void onRefreshFinishedNewData()
  {
  }

  public void onRefreshFinishedNoChange()
  {
  }

  public void onRefreshPulled()
  {
  }

  public void onRefreshReleased(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      FlurryUtils.trackValidPullToRefreshRelease(getClass().getName());
      refresh();
    }
  }

  public void onResume()
  {
    super.onResume();
    int i = -1 + this.mPendingRequests.size();
    if (i >= 0)
    {
      PendingRequest localPendingRequest = (PendingRequest)this.mPendingRequests.get(i);
      if (this.mAppController.isPendingRequest(localPendingRequest.id))
        showProgress(localPendingRequest.fetchType);
      while (true)
      {
        i--;
        break;
        hideProgress(localPendingRequest.fetchType);
        this.mPendingRequests.remove(localPendingRequest);
      }
    }
    restorePosition();
    handlePendingCaptchaRequest();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    savePosition();
    paramBundle.putParcelableArrayList("pending_reqs", this.mPendingRequests);
    paramBundle.putInt("scroll_pos", this.mScrollPos);
    paramBundle.putInt("scroll_off", this.mScrollOffset);
    paramBundle.putParcelable("state_pending_captcha_request", this.mPendingCaptchaRequest);
  }

  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    this.mListState.firstVisibleItem = paramInt1;
    this.mListState.visibleItemCount = paramInt2;
    this.mListState.totalItemCount = paramInt3;
    if (paramInt2 == 0);
    Cursor localCursor;
    do
    {
      do
      {
        return;
        if ((paramInt1 == 0) && (this.mScrollListener != null))
          this.mScrollListener.onScrollFirstItem();
      }
      while ((paramInt1 <= 0) || (this.mCursorAdapter == null) || (paramInt1 + paramInt2 < paramInt3) || (this.mCursorAdapter.getCount() <= 0));
      localCursor = this.mCursorAdapter.getCursor();
    }
    while ((localCursor == null) || (!localCursor.moveToLast()) || (!this.mListState.hasNewScrollState));
    this.mListState.hasNewScrollState = false;
    onScrollLastItem(localCursor);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
  }

  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    this.mListState.hasNewScrollState = true;
    this.mListState.setScrollState(paramInt);
    if (paramInt == 0)
      onScroll(paramAbsListView, this.mListState.firstVisibleItem, this.mListState.visibleItemCount, this.mListState.totalItemCount);
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    this.mHandler.post(this.mRequestFocus);
  }

  protected void refresh()
  {
  }

  protected PendingRequest removeRequest(String paramString)
  {
    ArrayList localArrayList = this.mPendingRequests;
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
      if (((PendingRequest)localArrayList.get(j)).id.equals(paramString))
        return (PendingRequest)localArrayList.remove(j);
    return null;
  }

  protected boolean restartLoader()
  {
    if (this.mChangeObserver == null)
      return false;
    getLoaderManager().restartLoader(this.mLoaderId, null, this);
    return true;
  }

  protected void restoreItemPosition(ItemPosition paramItemPosition, boolean paramBoolean)
  {
  }

  protected void restorePosition()
  {
    this.mListView.setSelectionFromTop(this.mScrollPos, this.mScrollOffset);
  }

  protected void saveItemPosition(ItemPosition paramItemPosition)
  {
  }

  protected void savePosition()
  {
    ListView localListView = this.mListView;
    View localView;
    if (localListView != null)
    {
      localView = localListView.getChildAt(0);
      if (localView == null)
        break label38;
    }
    label38: for (int i = localView.getTop(); ; i = 0)
    {
      this.mScrollPos = localListView.getFirstVisiblePosition();
      this.mScrollOffset = i;
      return;
    }
  }

  protected void setEmptyStringMessage(int paramInt)
  {
    this.mEmptyText.setText(getString(paramInt));
  }

  public void setFocused(boolean paramBoolean)
  {
    this.mFocused = paramBoolean;
  }

  public void setOwnerId(long paramLong)
  {
    this.mOwnerId = paramLong;
  }

  public void setRefreshableHeaderOffset(int paramInt)
  {
    if (this.mRefreshable)
      ((RefreshableListView)this.mListView).setViewYOffset(paramInt);
  }

  void setScrollListener(OnScrollListener paramOnScrollListener)
  {
    this.mScrollListener = paramOnScrollListener;
  }

  public void showDialog(int paramInt)
  {
    Dialog localDialog = onCreateDialog(paramInt);
    if (localDialog != null)
      localDialog.show();
  }

  protected void showProgress(int paramInt)
  {
    switch (paramInt)
    {
    case 6:
    default:
    case 1:
    case 7:
    case 2:
    case 4:
      do
      {
        do
          return;
        while (!this.mRefreshable);
        ((RefreshableListView)this.mListView).refreshMore(true);
        return;
      }
      while (!this.mRefreshable);
      ((RefreshableListView)this.mListView).startRefresh();
      this.mRefreshing = true;
      return;
    case 3:
    case 5:
    }
    showLoading(true);
  }

  protected void showSadface(boolean paramBoolean)
  {
    showSadface(paramBoolean, paramBoolean);
  }

  protected void showSadface(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean1)
      if ((this.mListView != null) && (this.mSadface != null))
      {
        this.mListView.setVisibility(8);
        this.mSadface.setVisibility(0);
        if (!paramBoolean2)
          break label63;
        localView2 = this.mSadface.findViewById(2131361935);
        if (localView2 != null)
          localView2.setVisibility(0);
      }
    label63: 
    while ((this.mListView == null) || (this.mSadface == null))
    {
      View localView1;
      do
      {
        View localView2;
        return;
        localView1 = this.mSadface.findViewById(2131361935);
      }
      while (localView1 == null);
      localView1.setVisibility(8);
      return;
    }
    this.mListView.setVisibility(0);
    this.mSadface.setVisibility(8);
  }

  protected class ChangeObserver extends ContentObserver
  {
    public ChangeObserver(Handler arg2)
    {
      super();
    }

    public boolean deliverSelfNotifications()
    {
      return true;
    }

    public void onChange(boolean paramBoolean)
    {
      if (!BaseListFragment.this.mRefreshing)
        BaseListFragment.this.handleContentChanged();
    }
  }

  static abstract interface OnScrollListener
  {
    public abstract void onScrollFirstItem();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseListFragment
 * JD-Core Version:    0.6.2
 */