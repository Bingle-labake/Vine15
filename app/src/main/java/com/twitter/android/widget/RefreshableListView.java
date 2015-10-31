package com.twitter.android.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsListView.LayoutParams;
import android.widget.HeaderViewListAdapter;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ListView.FixedViewInfo;
import android.widget.RelativeLayout;
import android.widget.Scroller;
import co.vine.android.util.CrashUtil;
import com.twitter.android.R.attr;
import com.twitter.android.R.id;
import com.twitter.android.R.styleable;
import java.util.ArrayList;
import java.util.Iterator;

public final class RefreshableListView extends ListView
  implements TopScrollable
{
  static final int MODE_ADDED = 1;
  static final int MODE_ATTACHED = 2;
  static final int MODE_POPPED = 16;
  static final int MODE_REFRESHING = 34;
  static final int MODE_REFRESH_STARTED = 32;
  static final int MODE_SCROLLING = 8;
  static final int MODE_SLOP = 64;
  static final int MODE_TRACKING = 4;
  private static final int SMOOTH_SCROLL_MAX_POSITION = 5;
  private RefreshViewListAdapter mAdapter;
  private boolean mAttachedToWindow;
  private AdapterDataSetObserver mDataSetObserver;
  private int mDownY;
  private final int mFooterLayoutId;
  private View mFooterView;
  private final ArrayList<ListView.FixedViewInfo> mFooterViewInfos = new ArrayList();
  private final ArrayList<ListView.FixedViewInfo> mHeaderViewInfos = new ArrayList();
  int mItemCount;
  private final ImageView mLoading;
  private AnimateLoader mLoadingAnimation;
  private int mMode;
  private int mMoveY;
  private final float mPixelScale;
  private final int mPullBackgroundColor;
  private RefreshListener mRefreshListener;
  private final ImageView mRefreshTriangle1;
  private final ImageView mRefreshTriangle2;
  private final ImageView mRefreshTriangle3;
  final RelativeLayout mRefreshView;
  private final ScrollRunnable mScrollRunnable;
  final Scroller mScroller;
  private int mTopPos;
  private final int mTouchSlop;
  private int mWidthMeasureSpec;

  public RefreshableListView(Context paramContext)
  {
    this(paramContext, null);
  }

  public RefreshableListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.refreshableListViewStyle);
  }

  public RefreshableListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.RefreshableListView, paramInt, 0);
    this.mPixelScale = getResources().getDisplayMetrics().density;
    this.mPullBackgroundColor = localTypedArray.getColor(4, -1);
    Drawable localDrawable = localTypedArray.getDrawable(5);
    this.mScroller = new Scroller(paramContext);
    this.mScrollRunnable = new ScrollRunnable();
    RelativeLayout localRelativeLayout = (RelativeLayout)LayoutInflater.from(paramContext).inflate(localTypedArray.getResourceId(0, 0), this, false);
    if (localDrawable != null)
    {
      View localView = localRelativeLayout.findViewById(R.id.refresh_divider);
      localView.setBackgroundDrawable(localDrawable);
      localView.setVisibility(0);
    }
    this.mLoading = ((ImageView)localRelativeLayout.findViewById(R.id.refresh_loading));
    this.mRefreshTriangle1 = ((ImageView)localRelativeLayout.findViewById(R.id.refresh_triangle_1));
    this.mRefreshTriangle2 = ((ImageView)localRelativeLayout.findViewById(R.id.refresh_triangle_2));
    this.mRefreshTriangle3 = ((ImageView)localRelativeLayout.findViewById(R.id.refresh_triangle_3));
    this.mRefreshView = localRelativeLayout;
    this.mTouchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
    ViewGroup.LayoutParams localLayoutParams = localRelativeLayout.getLayoutParams();
    localRelativeLayout.setLayoutParams(new AbsListView.LayoutParams(localLayoutParams.width, localLayoutParams.height, -1));
    this.mFooterLayoutId = localTypedArray.getResourceId(1, 0);
    this.mLoadingAnimation = new AnimateLoader(this.mLoading);
    localTypedArray.recycle();
  }

  private void clearRecycledState(ArrayList<ListView.FixedViewInfo> paramArrayList)
  {
    if (paramArrayList != null)
    {
      Iterator localIterator = paramArrayList.iterator();
      while (localIterator.hasNext())
      {
        ListView.FixedViewInfo localFixedViewInfo = (ListView.FixedViewInfo)localIterator.next();
        AbsListView.LayoutParams localLayoutParams = (AbsListView.LayoutParams)localFixedViewInfo.view.getLayoutParams();
        if (localLayoutParams != null)
          localFixedViewInfo.view.setLayoutParams(new AbsListView.LayoutParams(localLayoutParams.width, localLayoutParams.height, -2));
      }
    }
  }

  private boolean isRefreshable()
  {
    return this.mRefreshListener != null;
  }

  private void silence(Exception paramException, MotionEvent paramMotionEvent)
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(paramMotionEvent.getAction());
    arrayOfObject[1] = Float.valueOf(paramMotionEvent.getX());
    arrayOfObject[2] = Float.valueOf(paramMotionEvent.getY());
    CrashUtil.logException(paramException, "Event was: {}, x: {}, y: {}.", arrayOfObject);
  }

  private void startScroll(int paramInt)
  {
    if (paramInt > 0)
      this.mScrollRunnable.scroll(paramInt);
  }

  public void addFooterView(View paramView, Object paramObject, boolean paramBoolean)
  {
    if (isRefreshable())
    {
      ListView.FixedViewInfo localFixedViewInfo = new ListView.FixedViewInfo(this);
      localFixedViewInfo.view = paramView;
      localFixedViewInfo.data = paramObject;
      localFixedViewInfo.isSelectable = paramBoolean;
      this.mFooterViewInfos.add(localFixedViewInfo);
      return;
    }
    super.addFooterView(paramView, paramObject, paramBoolean);
  }

  public void addHeaderView(View paramView, Object paramObject, boolean paramBoolean)
  {
    if (isRefreshable())
    {
      ListView.FixedViewInfo localFixedViewInfo = new ListView.FixedViewInfo(this);
      localFixedViewInfo.view = paramView;
      localFixedViewInfo.data = paramObject;
      localFixedViewInfo.isSelectable = paramBoolean;
      this.mHeaderViewInfos.add(localFixedViewInfo);
      return;
    }
    super.addHeaderView(paramView, paramObject, paramBoolean);
  }

  void attach(int paramInt)
  {
    RelativeLayout localRelativeLayout = this.mRefreshView;
    ViewGroup.LayoutParams localLayoutParams = localRelativeLayout.getLayoutParams();
    boolean bool = isMode(1);
    int i;
    label49: int i3;
    label97: label105: int m;
    int n;
    if (bool)
    {
      attachViewToParent(localRelativeLayout, 0, localLayoutParams);
      setMode(2);
      if ((bool) && (!localRelativeLayout.isLayoutRequested()))
        break label177;
      i = 1;
      if (i == 0)
        break label193;
      int i1 = ViewGroup.getChildMeasureSpec(this.mWidthMeasureSpec, getListPaddingLeft() + getListPaddingRight(), localLayoutParams.width);
      int i2 = localLayoutParams.height;
      if (i2 <= 0)
        break label183;
      i3 = View.MeasureSpec.makeMeasureSpec(i2, 1073741824);
      localRelativeLayout.measure(i1, i3);
      int j = localRelativeLayout.getMeasuredWidth();
      int k = localRelativeLayout.getMeasuredHeight();
      m = paramInt - k;
      n = getListPaddingLeft();
      if (i == 0)
        break label201;
      localRelativeLayout.layout(n, m, n + j, m + k);
    }
    while (true)
    {
      this.mDataSetObserver.onChanged();
      return;
      addViewInLayout(localRelativeLayout, 0, localLayoutParams, true);
      setMode(1);
      break;
      label177: i = 0;
      break label49;
      label183: i3 = View.MeasureSpec.makeMeasureSpec(0, 0);
      break label97;
      label193: cleanupLayoutState(localRelativeLayout);
      break label105;
      label201: localRelativeLayout.offsetLeftAndRight(n - localRelativeLayout.getLeft());
      localRelativeLayout.offsetTopAndBottom(m - localRelativeLayout.getTop());
    }
  }

  protected int computeVerticalScrollOffset()
  {
    if ((isSmoothScrollbarEnabled()) && (isMode(2)))
    {
      int i = getFirstVisiblePosition();
      int j = getChildCount();
      int k = -1 + this.mItemCount;
      int m = 0;
      if (k > 0)
      {
        m = 0;
        if (i >= 1)
        {
          m = 0;
          if (j > 0)
          {
            View localView = getChildAt(0);
            int n = localView.getTop();
            int i1 = localView.getHeight();
            m = 0;
            if (i1 > 0)
              m = Math.max(100 * (i - 1) - n * 100 / i1 + (int)(100.0F * (getScrollY() / getHeight() * k)), 0);
          }
        }
      }
      return m;
    }
    return super.computeVerticalScrollOffset();
  }

  protected int computeVerticalScrollRange()
  {
    if ((isSmoothScrollbarEnabled()) && (isMode(2)))
    {
      int i = -1 + this.mItemCount;
      int j = getScrollY();
      int k = Math.max(i * 100, 0);
      if (j != 0)
        k += Math.abs((int)(100.0F * (j / getHeight() * i)));
      return k;
    }
    return super.computeVerticalScrollRange();
  }

  void detach()
  {
    if (isMode(2))
    {
      if (this == this.mRefreshView.getParent())
        detachViewFromParent(this.mRefreshView);
      unsetMode(30);
      this.mDataSetObserver.onChanged();
    }
  }

  protected void detachViewsFromParent(int paramInt1, int paramInt2)
  {
    if (isMode(4))
      return;
    super.detachViewsFromParent(paramInt1, paramInt2);
  }

  public int getFooterViewsCount()
  {
    if (isRefreshable())
      return this.mFooterViewInfos.size();
    return super.getFooterViewsCount();
  }

  public int getHeaderViewsCount()
  {
    if (isRefreshable())
    {
      if (isMode(34))
        return 1 + this.mHeaderViewInfos.size();
      return this.mHeaderViewInfos.size();
    }
    return super.getHeaderViewsCount();
  }

  boolean isMode(int paramInt)
  {
    return (paramInt & this.mMode) != 0;
  }

  protected void layoutChildren()
  {
    if (!isRefreshable())
      super.layoutChildren();
    while (isMode(12))
      return;
    if (this.mItemCount == 0)
    {
      clearRecycledState(this.mHeaderViewInfos);
      clearRecycledState(this.mFooterViewInfos);
    }
    super.layoutChildren();
  }

  void offsetChildrenTopAndBottom(int paramInt)
  {
    int i = getChildCount();
    for (int j = 0; j < i; j++)
      getChildAt(j).offsetTopAndBottom(paramInt);
  }

  protected void onAttachedToWindow()
  {
    if ((isRefreshable()) && (this.mAdapter != null))
    {
      this.mAdapter.registerDataSetObserver();
      updateItemCount();
    }
    this.mAttachedToWindow = true;
    super.onAttachedToWindow();
  }

  protected void onDetachedFromWindow()
  {
    if (isRefreshable())
    {
      if (this.mAdapter != null)
        this.mAdapter.unregisterDataSetObserver();
      removeCallbacks(this.mScrollRunnable);
    }
    this.mAttachedToWindow = false;
    super.onDetachedFromWindow();
  }

  protected void onDraw(Canvas paramCanvas)
  {
    if (isRefreshable())
    {
      View localView = getChildAt(0);
      if ((localView != null) && (localView.equals(this.mRefreshView)))
      {
        int i = getScrollX();
        paramCanvas.save();
        paramCanvas.clipRect(i, getScrollY(), i + getWidth(), localView.getBottom());
        paramCanvas.drawColor(this.mPullBackgroundColor);
        paramCanvas.restore();
      }
    }
    super.onDraw(paramCanvas);
  }

  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
  {
    if ((isRefreshable()) && (!this.mAttachedToWindow) && (paramBoolean) && (getSelectedItemPosition() < 0) && (!isInTouchMode()) && (this.mAdapter != null))
      updateItemCount();
    super.onFocusChanged(paramBoolean, paramInt, paramRect);
  }

  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!isRefreshable())
      return super.onInterceptTouchEvent(paramMotionEvent);
    int i = (int)paramMotionEvent.getY();
    int j = i - this.mDownY;
    switch (paramMotionEvent.getAction())
    {
    case 1:
    default:
    case 0:
    case 2:
    }
    try
    {
      while (true)
      {
        boolean bool = super.onInterceptTouchEvent(paramMotionEvent);
        return bool;
        this.mDownY = i;
        this.mMoveY = -2147483648;
        continue;
        if (!isMode(32))
          break;
        this.mMoveY = i;
      }
      View localView;
      if (isMode(2))
      {
        localView = getChildAt(1);
        label113: if (localView == null)
          break label166;
      }
      label166: for (int k = localView.getTop(); ; k = 0)
      {
        this.mMoveY = i;
        if ((getFirstVisiblePosition() != 0) || (k < getListPaddingTop()) || (j <= this.mTouchSlop))
          break;
        return true;
        localView = getChildAt(0);
        break label113;
      }
    }
    catch (IndexOutOfBoundsException|NullPointerException localIndexOutOfBoundsException)
    {
      silence(localIndexOutOfBoundsException, paramMotionEvent);
    }
    return false;
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    updateItemCount();
    this.mWidthMeasureSpec = paramInt1;
    super.onMeasure(paramInt1, paramInt2);
  }

  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    SavedState localSavedState = (SavedState)paramParcelable;
    super.onRestoreInstanceState(localSavedState.getSuperState());
    if (localSavedState.refreshable)
      this.mMode = localSavedState.mode;
  }

  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    localSavedState.refreshable = isRefreshable();
    localSavedState.mode = this.mMode;
    return localSavedState;
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!isRefreshable())
      return super.onTouchEvent(paramMotionEvent);
    int i = 0xFF & paramMotionEvent.getAction();
    int j = (int)paramMotionEvent.getY();
    int k = j - this.mDownY;
    switch (i)
    {
    default:
    case 0:
    case 1:
    case 2:
    }
    try
    {
      while (true)
      {
        boolean bool2 = super.onTouchEvent(paramMotionEvent);
        return bool2;
        this.mDownY = j;
        this.mMoveY = -2147483648;
        setMode(64);
        continue;
        unsetMode(20);
        if ((!isMode(32)) && (isMode(2)))
        {
          View localView3 = getChildAt(0);
          if ((getFirstVisiblePosition() == 0) && (localView3 != null))
          {
            int i2 = localView3.getTop();
            int i3 = localView3.getBottom();
            if (i2 > 0)
            {
              this.mRefreshListener.onRefreshReleased(true);
              startScroll(i2);
            }
            else if (localView3.getBottom() > 0)
            {
              this.mRefreshListener.onRefreshReleased(false);
              startScroll(i3 + getDividerHeight());
              continue;
              if (isMode(32))
              {
                this.mMoveY = j;
              }
              else
              {
                int m;
                View localView1;
                label261: int n;
                label273: int i1;
                if (this.mMoveY != -2147483648)
                {
                  m = j - this.mMoveY;
                  boolean bool1 = isMode(2);
                  if (!bool1)
                    break label434;
                  localView1 = getChildAt(1);
                  if (localView1 == null)
                    break label444;
                  n = localView1.getTop();
                  if (j < this.mMoveY)
                    break label450;
                  i1 = 1;
                  label284: this.mMoveY = j;
                  if ((getFirstVisiblePosition() != 0) || (n < getListPaddingTop()) || (k <= this.mTouchSlop))
                    break label502;
                  requestDisallowInterceptTouchEvent(true);
                  if (isMode(64))
                  {
                    super.onTouchEvent(paramMotionEvent);
                    unsetMode(64);
                  }
                  setChildrenDrawingCacheEnabled(false);
                  setChildrenDrawnWithCacheEnabled(false);
                  if (!bool1)
                    break label488;
                  offsetChildrenTopAndBottom((int)(0.5F * m));
                  invalidate();
                  View localView2 = getChildAt(0);
                  if ((localView2 == null) || (localView2.getTop() < 0))
                    break label456;
                  if ((i1 != 0) && (!isMode(16)))
                  {
                    setMode(16);
                    this.mRefreshListener.onRefreshPulled();
                  }
                }
                while (true)
                {
                  setMode(4);
                  return true;
                  m = k;
                  break;
                  label434: localView1 = getChildAt(0);
                  break label261;
                  label444: n = 0;
                  break label273;
                  label450: i1 = 0;
                  break label284;
                  label456: if ((i1 == 0) && (isMode(16)))
                  {
                    unsetMode(16);
                    this.mRefreshListener.onRefreshCancelled();
                    continue;
                    label488: attach(n - getDividerHeight());
                  }
                }
                label502: detach();
              }
            }
          }
        }
      }
    }
    catch (IndexOutOfBoundsException|NullPointerException localIndexOutOfBoundsException)
    {
      silence(localIndexOutOfBoundsException, paramMotionEvent);
    }
    return false;
  }

  public void refreshMore(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.mFooterView.setVisibility(0);
      return;
    }
    this.mFooterView.setVisibility(8);
  }

  void requestLastChildLayout()
  {
    View localView1 = getChildAt(-1 + getChildCount());
    if ((localView1 != null) && (localView1.getBottom() < getBottom() - getBottomPaddingOffset() - getDividerHeight()))
    {
      View localView2 = getChildAt(0);
      if (localView2 != null)
      {
        int i = localView2.getTop();
        super.layoutChildren();
        offsetChildrenTopAndBottom(i - localView2.getTop());
      }
    }
  }

  @TargetApi(8)
  public boolean scrollTop()
  {
    int i = this.mTopPos;
    if (isMode(34))
      i++;
    if (Build.VERSION.SDK_INT > 7)
    {
      int j = getFirstVisiblePosition();
      View localView = getChildAt(0);
      boolean bool;
      if (j <= i)
      {
        bool = false;
        if (j == i)
        {
          bool = false;
          if (localView != null)
          {
            int k = localView.getTop();
            bool = false;
            if (k >= 0);
          }
        }
      }
      else
      {
        if (j > 5)
          setSelection(i);
        smoothScrollToPosition(i);
        bool = true;
      }
      return bool;
    }
    setSelection(i);
    return true;
  }

  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (isRefreshable())
    {
      if (paramListAdapter != null)
        if ((this.mAdapter == null) || (!this.mAdapter.getWrappedAdapter().equals(paramListAdapter)))
        {
          this.mDataSetObserver = new AdapterDataSetObserver();
          if ((isRefreshable()) && (this.mFooterView == null))
          {
            View localView = LayoutInflater.from(getContext()).inflate(this.mFooterLayoutId, null);
            addFooterView(localView, null, false);
            this.mFooterView = localView.findViewById(R.id.footer_content);
          }
          this.mAdapter = new RefreshViewListAdapter(this.mHeaderViewInfos, this.mFooterViewInfos, paramListAdapter, this.mDataSetObserver);
        }
      for (this.mItemCount = this.mAdapter.getSuperCount(); ; this.mItemCount = 0)
      {
        super.setAdapter(this.mAdapter);
        return;
        this.mAdapter = null;
      }
    }
    super.setAdapter(paramListAdapter);
  }

  void setMode(int paramInt)
  {
    this.mMode = (paramInt | this.mMode);
  }

  public void setRefreshListener(RefreshListener paramRefreshListener)
  {
    if ((!isRefreshable()) && (getHeaderViewsCount() > 0))
      throw new IllegalStateException("setRefreshListener must be called before addHeaderView.");
    if (paramRefreshListener != this.mRefreshListener)
      this.mRefreshListener = paramRefreshListener;
  }

  public void setTopPosition(int paramInt)
  {
    this.mTopPos = paramInt;
  }

  public void setViewYOffset(int paramInt)
  {
    int i = (int)(0.5F + paramInt * this.mPixelScale);
    this.mRefreshView.setPadding(0, 0, 0, i);
  }

  public void startRefresh()
  {
    if ((!isRefreshable()) || ((isMode(32)) && (isMode(2))));
    do
    {
      return;
      setMode(32);
      this.mRefreshTriangle1.setVisibility(4);
      this.mRefreshTriangle2.setVisibility(4);
      this.mRefreshTriangle3.setVisibility(4);
      this.mLoading.setVisibility(0);
      this.mLoadingAnimation.run();
    }
    while (isMode(2));
    this.mDataSetObserver.onChanged();
  }

  public void stopRefresh()
  {
    RefreshListener localRefreshListener = this.mRefreshListener;
    boolean bool;
    int j;
    int k;
    int m;
    View localView;
    if ((localRefreshListener != null) && (isMode(32)))
    {
      this.mLoadingAnimation.cancel();
      int i = getFirstVisiblePosition();
      bool = isMode(2);
      ItemPosition localItemPosition = localRefreshListener.getFirstItemPosition();
      j = localItemPosition.offset;
      k = localItemPosition.position;
      localRefreshListener.onRefreshFinished();
      m = localRefreshListener.getPositionForItemId(localItemPosition.itemId);
      unsetMode(32);
      if (m != k)
        break label206;
      localRefreshListener.onRefreshFinishedNoChange();
      if ((i != 0) || (!isInTouchMode()))
        break label175;
      localView = getChildAt(1);
      if (localView == null)
        break label169;
    }
    label169: for (int n = localView.getTop(); ; n = 0)
    {
      if (bool)
        startScroll(n);
      this.mRefreshTriangle1.setVisibility(0);
      this.mRefreshTriangle2.setVisibility(0);
      this.mRefreshTriangle3.setVisibility(0);
      this.mLoading.setVisibility(4);
      return;
    }
    label175: if (bool)
      detach();
    while (true)
    {
      setSelectionFromTop(k - 1, j);
      break;
      this.mDataSetObserver.onChanged();
    }
    label206: localRefreshListener.onRefreshFinishedNewData();
    if (bool)
      detach();
    while (true)
    {
      setSelectionFromTop(m - 1, j);
      break;
      this.mDataSetObserver.onChanged();
    }
  }

  void unsetMode(int paramInt)
  {
    this.mMode &= (paramInt ^ 0xFFFFFFFF);
  }

  void updateItemCount()
  {
    if (!isRefreshable())
      return;
    if (isMode(34))
    {
      this.mItemCount = (1 + this.mAdapter.getSuperCount());
      return;
    }
    this.mItemCount = this.mAdapter.getSuperCount();
  }

  private class AdapterDataSetObserver extends DataSetObserver
  {
    private final ArrayList<DataSetObserver> mObservers = new ArrayList();

    public AdapterDataSetObserver()
    {
    }

    public void onChanged()
    {
      RefreshableListView.this.updateItemCount();
      synchronized (this.mObservers)
      {
        for (int i = -1 + this.mObservers.size(); i >= 0; i--)
          ((DataSetObserver)this.mObservers.get(i)).onChanged();
        RefreshableListView.this.requestLayout();
        return;
      }
    }

    public void onInvalidated()
    {
      RefreshableListView.this.mItemCount = 0;
      synchronized (this.mObservers)
      {
        for (int i = -1 + this.mObservers.size(); i >= 0; i--)
          ((DataSetObserver)this.mObservers.get(i)).onInvalidated();
        RefreshableListView.this.requestLayout();
        return;
      }
    }

    public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      this.mObservers.add(paramDataSetObserver);
    }

    public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      this.mObservers.remove(paramDataSetObserver);
    }
  }

  class AnimateLoader
    implements Runnable
  {
    int mRotate;
    private ImageView mView;

    public AnimateLoader(ImageView arg2)
    {
      Object localObject;
      this.mView = localObject;
    }

    public void cancel()
    {
      Handler localHandler = RefreshableListView.this.getHandler();
      if (localHandler != null)
        localHandler.removeCallbacks(this);
    }

    public void run()
    {
      this.mRotate = (500 + this.mRotate);
      if (this.mRotate > 10000)
        this.mRotate = 0;
      this.mView.setImageLevel(this.mRotate);
      RefreshableListView.this.postDelayed(this, 32L);
    }
  }

  private class RefreshViewListAdapter extends HeaderViewListAdapter
  {
    private final RefreshableListView.AdapterDataSetObserver mDataSetObserver;
    private boolean mRegistered;

    public RefreshViewListAdapter(ArrayList<ListView.FixedViewInfo> paramListAdapter, ListAdapter paramAdapterDataSetObserver, RefreshableListView.AdapterDataSetObserver arg4)
    {
      super(paramAdapterDataSetObserver, localListAdapter);
      Object localObject;
      this.mDataSetObserver = localObject;
      registerDataSetObserver();
    }

    public int getCount()
    {
      return RefreshableListView.this.mItemCount;
    }

    public Object getItem(int paramInt)
    {
      if (RefreshableListView.this.isMode(34))
      {
        if (paramInt == 0)
          return null;
        return super.getItem(paramInt - 1);
      }
      return super.getItem(paramInt);
    }

    public long getItemId(int paramInt)
    {
      if (RefreshableListView.this.isMode(34))
      {
        if (paramInt == 0)
          return 0L;
        return super.getItemId(paramInt - 1);
      }
      return super.getItemId(paramInt);
    }

    public int getItemViewType(int paramInt)
    {
      if (RefreshableListView.this.isMode(34))
      {
        if (paramInt == 0)
          return -1;
        return super.getItemViewType(paramInt - 1);
      }
      return super.getItemViewType(paramInt);
    }

    int getSuperCount()
    {
      return super.getCount();
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (RefreshableListView.this.isMode(34))
      {
        if (paramInt == 0)
          return RefreshableListView.this.mRefreshView;
        return super.getView(paramInt - 1, paramView, paramViewGroup);
      }
      try
      {
        View localView = super.getView(paramInt, paramView, paramViewGroup);
        return localView;
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        CrashUtil.logException(localIndexOutOfBoundsException);
      }
      return RefreshableListView.this.mRefreshView;
    }

    public boolean isEnabled(int paramInt)
    {
      if (RefreshableListView.this.isMode(34))
        return (paramInt > 0) && (superEnabled(paramInt - 1));
      try
      {
        boolean bool2 = superEnabled(paramInt);
        return bool2;
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        int i = RefreshableListView.this.mHeaderViewInfos.size();
        if (paramInt < i)
          return ((ListView.FixedViewInfo)RefreshableListView.this.mHeaderViewInfos.get(paramInt)).isSelectable;
        int j = paramInt - i;
        RefreshViewListAdapter localRefreshViewListAdapter = RefreshableListView.this.mAdapter;
        int k = 0;
        if (localRefreshViewListAdapter != null)
        {
          k = RefreshableListView.this.mAdapter.getCount();
          if (j < k)
            return RefreshableListView.this.mAdapter.isEnabled(j);
        }
        try
        {
          boolean bool1 = ((ListView.FixedViewInfo)RefreshableListView.this.mFooterViewInfos.get(j - k)).isSelectable;
          return bool1;
        }
        catch (Exception localException)
        {
          CrashUtil.logException(localException);
        }
      }
      return false;
    }

    public final void registerDataSetObserver()
    {
      if (!this.mRegistered)
      {
        super.registerDataSetObserver(this.mDataSetObserver);
        this.mRegistered = true;
      }
    }

    public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      this.mDataSetObserver.registerDataSetObserver(paramDataSetObserver);
    }

    public boolean superEnabled(int paramInt)
    {
      try
      {
        boolean bool2 = super.isEnabled(paramInt);
        return bool2;
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        int i = RefreshableListView.this.mHeaderViewInfos.size();
        if (paramInt < i)
          return ((ListView.FixedViewInfo)RefreshableListView.this.mHeaderViewInfos.get(paramInt)).isSelectable;
        int j = paramInt - i;
        RefreshViewListAdapter localRefreshViewListAdapter = RefreshableListView.this.mAdapter;
        int k = 0;
        if (localRefreshViewListAdapter != null)
        {
          k = RefreshableListView.this.mAdapter.getCount();
          if (j < k)
            return RefreshableListView.this.mAdapter.isEnabled(j);
        }
        try
        {
          boolean bool1 = ((ListView.FixedViewInfo)RefreshableListView.this.mFooterViewInfos.get(j - k)).isSelectable;
          return bool1;
        }
        catch (Exception localException)
        {
          CrashUtil.logException(localException);
        }
      }
      return false;
    }

    public final void unregisterDataSetObserver()
    {
      if (this.mRegistered)
      {
        super.unregisterDataSetObserver(this.mDataSetObserver);
        this.mRegistered = false;
      }
    }

    public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      this.mDataSetObserver.unregisterDataSetObserver(paramDataSetObserver);
    }
  }

  static class SavedState extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public RefreshableListView.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new RefreshableListView.SavedState(paramAnonymousParcel);
      }

      public RefreshableListView.SavedState[] newArray(int paramAnonymousInt)
      {
        return new RefreshableListView.SavedState[paramAnonymousInt];
      }
    };
    public int mode;
    public boolean refreshable;

    public SavedState(Parcel paramParcel)
    {
      super();
      if (paramParcel.readInt() == i);
      while (true)
      {
        this.refreshable = i;
        this.mode = paramParcel.readInt();
        return;
        i = 0;
      }
    }

    public SavedState(Parcelable paramParcelable)
    {
      super();
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      if (this.refreshable);
      for (int i = 1; ; i = 0)
      {
        paramParcel.writeInt(i);
        paramParcel.writeInt(this.mode);
        return;
      }
    }
  }

  private class ScrollRunnable
    implements Runnable
  {
    private static final int AUTO_SCROLL_DURATION = 450;
    private int mLastY;

    ScrollRunnable()
    {
    }

    public void run()
    {
      if (!RefreshableListView.this.isMode(10))
        return;
      Scroller localScroller = RefreshableListView.this.mScroller;
      int i;
      if ((localScroller.timePassed() < 450) && (localScroller.computeScrollOffset()))
      {
        i = 1;
        if (i == 0)
          break label104;
      }
      label104: for (int j = localScroller.getCurrY(); ; j = localScroller.getFinalY())
      {
        int k = this.mLastY - j;
        this.mLastY = j;
        RefreshableListView.this.offsetChildrenTopAndBottom(k);
        RefreshableListView.this.invalidate();
        RefreshableListView.this.requestLastChildLayout();
        if (i == 0)
          break label112;
        RefreshableListView.this.post(this);
        return;
        i = 0;
        break;
      }
      label112: RefreshableListView.this.unsetMode(8);
      if (RefreshableListView.this.isMode(32))
      {
        RefreshableListView.this.setSelectionFromTop(0, j);
        return;
      }
      RefreshableListView.this.detach();
    }

    void scroll(int paramInt)
    {
      this.mLastY = 0;
      RefreshableListView.this.setMode(8);
      RefreshableListView.this.mScroller.abortAnimation();
      RefreshableListView.this.mScroller.startScroll(0, 0, 0, paramInt, 450);
      RefreshableListView.this.post(this);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.twitter.android.widget.RefreshableListView
 * JD-Core Version:    0.6.2
 */