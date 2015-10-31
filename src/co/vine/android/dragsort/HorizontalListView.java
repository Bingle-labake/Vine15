package co.vine.android.dragsort;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.ListAdapter;
import android.widget.Scroller;
import java.util.ArrayList;

public class HorizontalListView extends AdapterView<ListAdapter>
{
  public static final int NO_POSITION = -1;
  private static final int TOUCH_MODE_DONE_WAITING = 2;
  private static final int TOUCH_MODE_DOWN = 0;
  private static final int TOUCH_MODE_FLING = 4;
  private static final int TOUCH_MODE_REST = -1;
  private static final int TOUCH_MODE_SCROLL = 3;
  private static final int TOUCH_MODE_TAP = 1;
  private ListAdapter mAdapter;
  private int mChildFillWidth;
  private ChildWidthListener mChildWidthListener;
  private boolean mClipToPadding;
  private boolean mDataChanged;
  private DataSetObserver mDataSetObserver;
  private Drawable mDivider;
  private Paint mDividerPaint;
  private int mDividerWidth;
  private int mDownPosition;
  private final int mEdgePadding;
  private final float mFillWidthHeightRatio;
  private boolean mFingerScrollEnabled = true;
  private int mFirstVisiblePos = 0;
  private final FlingRunnable mFlingRunnable = new FlingRunnable();
  private int mHeightMeasureSpec;
  private final boolean[] mIsRecycled = new boolean[1];
  private int mItemCount;
  private int mLastX = -2147483648;
  private int mLongPressMillis = ViewConfiguration.getLongPressTimeout();
  private final int mMaximumFlingVelocity;
  private final int mMinimumFlingVelocity;
  private int mMotionPosition;
  private int mMotionX = -2147483648;
  private int mMotionY = -2147483648;
  private AdapterView.OnItemLongClickListener mOnItemLongClickListener;
  private OnScrollListener mOnScrollListener;
  private CheckForLongPress mPendingCheckForLongPress;
  private CheckForTap mPendingCheckForTap;
  private PerformClick mPerformClick;
  private final Recycler mRecycler = new Recycler();
  private Drawable mSelector;
  private Rect mTouchFrame;
  private int mTouchMode = -1;
  private Runnable mTouchModeReset;
  private final int mTouchSlop;
  private VelocityTracker mVelocityTracker;

  public HorizontalListView(Context paramContext)
  {
    this(paramContext, null);
  }

  public HorizontalListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.horizontalListViewStyle);
  }

  public HorizontalListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.HorizontalListView, paramInt, 0);
    Drawable localDrawable = localTypedArray.getDrawable(0);
    if (localDrawable != null)
      setDivider(localDrawable);
    int i = localTypedArray.getDimensionPixelSize(1, 0);
    if (i > 0)
      setDividerWidth(i);
    this.mEdgePadding = localTypedArray.getDimensionPixelSize(2, 0);
    this.mFillWidthHeightRatio = localTypedArray.getFloat(3, 0.0F);
    localTypedArray.recycle();
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(paramContext);
    this.mTouchSlop = localViewConfiguration.getScaledTouchSlop();
    this.mMinimumFlingVelocity = localViewConfiguration.getScaledMinimumFlingVelocity();
    this.mMaximumFlingVelocity = localViewConfiguration.getScaledMaximumFlingVelocity();
  }

  private View attachChild(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    if (!this.mDataChanged)
    {
      View localView2 = this.mRecycler.getActiveView(paramInt1);
      if (localView2 != null)
      {
        layoutChild(localView2, paramInt2, paramInt3, paramBoolean, true);
        return localView2;
      }
    }
    View localView1 = obtainView(paramInt1, this.mIsRecycled);
    layoutChild(localView1, paramInt2, paramInt3, paramBoolean, this.mIsRecycled[0]);
    return localView1;
  }

  private void disallowParentIntercept(boolean paramBoolean)
  {
    ViewParent localViewParent = getParent();
    if (localViewParent != null)
      localViewParent.requestDisallowInterceptTouchEvent(paramBoolean);
  }

  private void fillGap(boolean paramBoolean)
  {
    int i = getChildCount();
    if (paramBoolean)
    {
      if (i > 0);
      for (int k = getChildAt(i - 1).getRight() + this.mDividerWidth; ; k = getPaddingLeft())
      {
        fillRight(i + this.mFirstVisiblePos, k);
        return;
      }
    }
    if (i > 0);
    for (int j = getChildAt(0).getLeft() - this.mDividerWidth; ; j = 0)
    {
      fillLeft(-1 + this.mFirstVisiblePos, j);
      return;
    }
  }

  private void fillLeft(int paramInt1, int paramInt2)
  {
    int i = getPaddingTop();
    int j = getPaddingLeft();
    while ((paramInt2 > j) && (paramInt1 >= 0))
    {
      paramInt2 = attachChild(paramInt1, paramInt2, i, false).getLeft() - this.mDividerWidth;
      paramInt1--;
    }
    if ((this.mItemCount > 0) && (paramInt1 == -1) && (getOverflowLeft() < 0))
    {
      detachAllViewsFromParent();
      this.mFirstVisiblePos = 0;
      fillRight(0, getPaddingLeft());
      return;
    }
    this.mFirstVisiblePos = (paramInt1 + 1);
  }

  private void fillRight(int paramInt1, int paramInt2)
  {
    int i = getPaddingTop();
    int j = getWidth() - getPaddingRight();
    while ((paramInt2 < j) && (paramInt1 < this.mItemCount))
    {
      paramInt2 = attachChild(paramInt1, paramInt2, i, true).getRight() + this.mDividerWidth;
      paramInt1++;
    }
    (paramInt2 - this.mDividerWidth);
    if ((this.mItemCount > 0) && (paramInt1 == this.mItemCount) && (getOverflowRight() < 0) && ((this.mFirstVisiblePos > 0) || (getOverflowLeft() > 0)))
    {
      detachAllViewsFromParent();
      fillLeft(-1 + this.mItemCount, j - this.mEdgePadding);
    }
  }

  private int getOverflowLeft()
  {
    return getPaddingLeft() + this.mEdgePadding - getChildAt(0).getLeft();
  }

  private int getOverflowRight()
  {
    int i = getWidth() - getPaddingRight() - this.mEdgePadding;
    return getChildAt(-1 + getChildCount()).getRight() - i;
  }

  private void layoutChild(View paramView, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if (localLayoutParams == null)
    {
      localLayoutParams = (LayoutParams)generateDefaultLayoutParams();
      paramView.setLayoutParams(localLayoutParams);
    }
    int i4;
    int j;
    label66: int i2;
    label107: int i3;
    label122: int k;
    label130: int m;
    if (paramBoolean2)
      if (paramBoolean1)
      {
        i4 = -1;
        attachViewToParent(paramView, i4, localLayoutParams);
        if ((paramBoolean2) && (!paramView.isLayoutRequested()))
          break label206;
        j = 1;
        if (j == 0)
          break label232;
        int i1 = ViewGroup.getChildMeasureSpec(this.mHeightMeasureSpec, getPaddingTop() + getPaddingBottom(), localLayoutParams.height);
        if (this.mChildFillWidth <= 0)
          break label212;
        i2 = this.mChildFillWidth;
        if (i2 <= 0)
          break label222;
        i3 = View.MeasureSpec.makeMeasureSpec(i2, 1073741824);
        paramView.measure(i3, i1);
        k = paramView.getMeasuredWidth();
        m = paramView.getMeasuredHeight();
        if (!paramBoolean1)
          break label240;
      }
    label206: label212: label222: label232: label240: for (int n = paramInt1; ; n = paramInt1 - k)
    {
      if (j == 0)
        break label249;
      paramView.layout(n, paramInt2, n + k, paramInt2 + m);
      return;
      i4 = 0;
      break;
      if (paramBoolean1);
      for (int i = -1; ; i = 0)
      {
        addViewInLayout(paramView, i, localLayoutParams, true);
        break;
      }
      j = 0;
      break label66;
      i2 = localLayoutParams.width;
      break label107;
      i3 = View.MeasureSpec.makeMeasureSpec(0, 0);
      break label122;
      cleanupLayoutState(paramView);
      break label130;
    }
    label249: paramView.offsetLeftAndRight(n - paramView.getLeft());
    paramView.offsetTopAndBottom(paramInt2 - paramView.getTop());
  }

  private void measureChild(View paramView, int paramInt)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if (localLayoutParams == null)
    {
      localLayoutParams = (LayoutParams)generateDefaultLayoutParams();
      paramView.setLayoutParams(localLayoutParams);
    }
    int i = ViewGroup.getChildMeasureSpec(paramInt, getPaddingTop() + getPaddingBottom(), localLayoutParams.height);
    int j = localLayoutParams.width;
    if (j > 0);
    for (int k = View.MeasureSpec.makeMeasureSpec(j, 1073741824); ; k = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(k, i);
      return;
    }
  }

  private View obtainView(int paramInt, boolean[] paramArrayOfBoolean)
  {
    View localView1 = this.mRecycler.removeRecycleView(paramInt);
    if (localView1 != null)
    {
      View localView2 = this.mAdapter.getView(paramInt, localView1, this);
      if (localView2 != localView1)
      {
        this.mRecycler.addRecycleView(localView1, paramInt);
        return localView2;
      }
      paramArrayOfBoolean[0] = true;
      return localView2;
    }
    return this.mAdapter.getView(paramInt, null, this);
  }

  private boolean performLongPress(View paramView, int paramInt, long paramLong)
  {
    AdapterView.OnItemLongClickListener localOnItemLongClickListener = this.mOnItemLongClickListener;
    boolean bool = false;
    if (localOnItemLongClickListener != null)
      bool = this.mOnItemLongClickListener.onItemLongClick(this, paramView, paramInt, paramLong);
    if (bool)
      performHapticFeedback(0);
    return bool;
  }

  private void recycleVelocityTracker()
  {
    this.mVelocityTracker.recycle();
    this.mVelocityTracker = null;
  }

  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof LayoutParams;
  }

  protected void dispatchDraw(Canvas paramCanvas)
  {
    int i = this.mDividerWidth;
    int j;
    Rect localRect;
    int k;
    int n;
    int i1;
    label95: Paint localPaint;
    int i2;
    int i3;
    label143: int i4;
    int i5;
    label158: int i6;
    if ((i > 0) && (this.mDivider != null))
    {
      j = 1;
      if (j == 0)
        break label342;
      localRect = new Rect();
      localRect.left = getPaddingLeft();
      localRect.right = (getWidth() - getPaddingRight());
      k = getChildCount();
      int m = this.mFirstVisiblePos;
      ListAdapter localListAdapter = this.mAdapter;
      n = getScrollX();
      if ((!isOpaque()) || (super.isOpaque()))
        break label258;
      i1 = 1;
      if ((i1 != 0) && (this.mDividerPaint == null))
        this.mDividerPaint = new Paint();
      localPaint = this.mDividerPaint;
      if (!this.mClipToPadding)
        break label264;
      i2 = getPaddingLeft();
      i3 = getPaddingRight();
      i4 = n + getWidth() - i3;
      i5 = 0;
      if (i5 >= k)
        break label305;
      i6 = getChildAt(i5).getLeft();
      if (i6 > i2)
      {
        if ((!localListAdapter.isEnabled(m + i5)) || ((i5 != k - 1) && (!localListAdapter.isEnabled(1 + (m + i5)))))
          break label273;
        localRect.left = (i6 - i);
        localRect.right = i6;
        drawDivider(paramCanvas, localRect);
      }
    }
    while (true)
    {
      i5++;
      break label158;
      j = 0;
      break;
      label258: i1 = 0;
      break label95;
      label264: i2 = 0;
      i3 = 0;
      break label143;
      label273: if (i1 != 0)
      {
        localRect.left = (i6 - i);
        localRect.right = i6;
        paramCanvas.drawRect(localRect, localPaint);
      }
    }
    label305: if ((k > 0) && (n > 0) && (j != 0))
    {
      localRect.left = i4;
      localRect.right = (i4 + i);
      drawDivider(paramCanvas, localRect);
    }
    label342: super.dispatchDraw(paramCanvas);
  }

  void drawDivider(Canvas paramCanvas, Rect paramRect)
  {
    Drawable localDrawable = this.mDivider;
    localDrawable.setBounds(paramRect);
    localDrawable.draw(paramCanvas);
  }

  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-2, -1);
  }

  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return new LayoutParams(paramLayoutParams);
  }

  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }

  public ListAdapter getAdapter()
  {
    return this.mAdapter;
  }

  public int getDividerWidth()
  {
    return this.mDividerWidth;
  }

  public int getFirstVisiblePosition()
  {
    return this.mFirstVisiblePos;
  }

  public int getLastVisiblePosition()
  {
    return -1 + (this.mFirstVisiblePos + getChildCount());
  }

  public View getSelectedView()
  {
    return null;
  }

  protected void layoutChildren()
  {
    boolean bool = this.mDataChanged;
    int i = this.mFirstVisiblePos;
    Recycler localRecycler = this.mRecycler;
    int j = getChildCount();
    View localView = getChildAt(0);
    if (bool)
      for (int k = 0; k < j; k++)
        localRecycler.addRecycleView(getChildAt(k), i + k);
    localRecycler.fillActiveViews(i, j);
    detachAllViewsFromParent();
    if (localView == null)
      fillRight(i, getPaddingLeft() + this.mEdgePadding);
    while (true)
    {
      localRecycler.recycleActiveViews();
      this.mDataChanged = false;
      return;
      fillRight(i, localView.getLeft());
    }
  }

  final int measureWidthOfChildren(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    ListAdapter localListAdapter = this.mAdapter;
    if (localListAdapter == null)
    {
      j = getPaddingLeft() + getPaddingRight();
      return j;
    }
    int i = getPaddingLeft() + getPaddingRight();
    int j = 0;
    if (paramInt3 == -1)
      paramInt3 = -1 + localListAdapter.getCount();
    Recycler localRecycler = this.mRecycler;
    boolean[] arrayOfBoolean = this.mIsRecycled;
    for (int k = paramInt2; ; k++)
    {
      if (k > paramInt3)
        break label166;
      View localView = obtainView(k, arrayOfBoolean);
      measureChild(localView, paramInt1);
      localRecycler.addRecycleView(localView, -1);
      i += localView.getMeasuredWidth();
      if (i >= paramInt4)
      {
        if ((paramInt5 >= 0) && (k > paramInt5) && (j > 0) && (i != paramInt4))
          break;
        return paramInt4;
      }
      if ((paramInt5 >= 0) && (k >= paramInt5))
        j = i;
    }
    label166: return i;
  }

  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    this.mRecycler.clear();
    if (this.mPendingCheckForTap != null)
      removeCallbacks(this.mPendingCheckForTap);
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if (paramBoolean)
    {
      int i = getChildCount();
      for (int j = 0; j < i; j++)
        getChildAt(j).forceLayout();
    }
    layoutChildren();
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt1);
    int j = View.MeasureSpec.getMode(paramInt2);
    int k = View.MeasureSpec.getSize(paramInt1);
    int m = View.MeasureSpec.getSize(paramInt2);
    int n;
    int i1;
    int i2;
    if (this.mAdapter == null)
    {
      n = 0;
      this.mItemCount = n;
      if ((this.mItemCount <= 0) || ((i != 0) && (j != 0)))
        break label263;
      View localView = obtainView(0, this.mIsRecycled);
      measureChild(localView, paramInt2);
      i1 = localView.getMeasuredWidth();
      i2 = localView.getMeasuredHeight();
      this.mRecycler.addRecycleView(localView, -1);
      label97: if (i != 0)
        break label278;
      k = i1 + (getPaddingLeft() + getPaddingRight());
    }
    while (true)
    {
      if (j == 0)
        m = i2 + (getPaddingTop() + getPaddingBottom());
      this.mChildFillWidth = 0;
      if ((this.mFillWidthHeightRatio > 0.0F) && (this.mItemCount > 0))
      {
        int i3 = this.mDividerWidth * (-1 + this.mItemCount);
        int i4 = (k - 2 * this.mEdgePadding - i3) / this.mItemCount;
        if ((i4 >= m) && (i4 <= this.mFillWidthHeightRatio * m))
          this.mChildFillWidth = i4;
      }
      if (this.mChildWidthListener != null)
        this.mChildWidthListener.onChildWidthMeasured(this.mChildFillWidth);
      setMeasuredDimension(k, m);
      this.mHeightMeasureSpec = paramInt2;
      return;
      n = this.mAdapter.getCount();
      break;
      label263: i1 = getSuggestedMinimumWidth();
      i2 = getSuggestedMinimumHeight();
      break label97;
      label278: if (i == -2147483648)
        k = measureWidthOfChildren(paramInt2, 0, -1, k, -1);
    }
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.mItemCount == 0)
      return (paramMotionEvent.getX() >= 0.0F) && (paramMotionEvent.getX() <= getWidth()) && (paramMotionEvent.getY() >= 0.0F) && (paramMotionEvent.getY() <= getHeight());
    if (this.mVelocityTracker == null)
      this.mVelocityTracker = VelocityTracker.obtain();
    this.mVelocityTracker.addMovement(paramMotionEvent);
    int i = 0xFF & paramMotionEvent.getAction();
    int j = (int)paramMotionEvent.getX();
    int k = (int)paramMotionEvent.getY();
    switch (i)
    {
    default:
    case 0:
    case 1:
    case 2:
    case 3:
    }
    while (true)
    {
      return true;
      int i5 = pointToPosition(j, k);
      this.mDownPosition = i5;
      if ((!this.mDataChanged) && (this.mTouchMode != 4) && (i5 >= 0) && (this.mAdapter.isEnabled(i5)))
      {
        this.mTouchMode = 0;
        if (this.mPendingCheckForTap == null)
        {
          CheckForTap localCheckForTap = new CheckForTap();
          this.mPendingCheckForTap = localCheckForTap;
        }
        postDelayed(this.mPendingCheckForTap, ViewConfiguration.getTapTimeout());
      }
      disallowParentIntercept(true);
      this.mFlingRunnable.stop();
      this.mMotionX = j;
      this.mMotionY = k;
      this.mLastX = -2147483648;
      this.mMotionPosition = i5;
      continue;
      switch (this.mTouchMode)
      {
      default:
        VelocityTracker localVelocityTracker = this.mVelocityTracker;
        localVelocityTracker.computeCurrentVelocity(1000, this.mMaximumFlingVelocity);
        float f = localVelocityTracker.getXVelocity();
        if ((Math.abs(f) > this.mMinimumFlingVelocity) && (this.mFingerScrollEnabled))
          this.mFlingRunnable.start((int)-f);
        break;
      case 0:
      case 1:
      case 2:
      }
      while (true)
      {
        Handler localHandler2 = getHandler();
        if (localHandler2 != null)
          localHandler2.removeCallbacks(this.mPendingCheckForLongPress);
        recycleVelocityTracker();
        this.mMotionY = -2147483648;
        this.mMotionX = -2147483648;
        this.mLastX = -2147483648;
        break;
        int i3 = this.mMotionPosition;
        final View localView = getChildAt(i3 - this.mFirstVisiblePos);
        int i4;
        final PerformClick localPerformClick2;
        if ((j > getPaddingLeft()) && (j < getWidth() - getPaddingRight()))
        {
          i4 = 1;
          if ((localView == null) || (localView.hasFocusable()) || (i4 == 0))
            break label725;
          if (this.mTouchMode != 0)
            localView.setPressed(false);
          if (this.mPerformClick == null)
          {
            PerformClick localPerformClick1 = new PerformClick();
            this.mPerformClick = localPerformClick1;
          }
          localPerformClick2 = this.mPerformClick;
          localPerformClick2.clickMotionPosition = i3;
          localPerformClick2.rememberWindowAttachCount();
          if ((this.mTouchMode != 0) && (this.mTouchMode != 1))
            break label688;
          Handler localHandler3 = getHandler();
          if (localHandler3 != null)
            localHandler3.removeCallbacks(this.mPendingCheckForTap);
          if ((this.mDataChanged) || (!this.mAdapter.isEnabled(i3)))
            break label680;
          this.mTouchMode = 1;
          layoutChildren();
          localView.setPressed(true);
          setPressed(true);
          if (this.mSelector != null)
          {
            Drawable localDrawable = this.mSelector.getCurrent();
            if ((localDrawable != null) && ((localDrawable instanceof TransitionDrawable)))
              ((TransitionDrawable)localDrawable).resetTransition();
          }
          if (this.mTouchModeReset != null)
            removeCallbacks(this.mTouchModeReset);
          Runnable local1 = new Runnable()
          {
            public void run()
            {
              HorizontalListView.access$002(HorizontalListView.this, -1);
              localView.setPressed(false);
              HorizontalListView.this.setPressed(false);
              if ((!HorizontalListView.this.mDataChanged) && (HorizontalListView.this.mMotionPosition == HorizontalListView.this.mDownPosition))
                localPerformClick2.run();
            }
          };
          this.mTouchModeReset = local1;
          postDelayed(this.mTouchModeReset, ViewConfiguration.getPressedStateDuration());
        }
        while (true)
        {
          return true;
          i4 = 0;
          break;
          label680: this.mTouchMode = -1;
        }
        label688: if ((!this.mDataChanged) && (this.mDownPosition == this.mMotionPosition) && (this.mAdapter.isEnabled(i3)))
          localPerformClick2.run();
        label725: this.mTouchMode = -1;
      }
      int m;
      int n;
      if (this.mMotionX != -2147483648)
      {
        if (getChildCount() == 0)
        {
          this.mTouchMode = -1;
          return super.onTouchEvent(paramMotionEvent);
        }
        Handler localHandler1 = getHandler();
        if (localHandler1 != null)
          localHandler1.removeCallbacks(this.mPendingCheckForLongPress);
        m = j - this.mMotionX;
        if (this.mTouchMode != 3)
        {
          if (((this.mFirstVisiblePos == 0) && (getOverflowLeft() == 0) && (m > 0)) || ((getOverflowRight() == 0) && (m < 0)))
          {
            disallowParentIntercept(false);
          }
          else if (this.mMotionY != -2147483648)
          {
            int i2 = k - this.mMotionY;
            if (this.mTouchSlop <= Math.abs(i2))
              disallowParentIntercept(false);
          }
          else if (this.mTouchSlop <= Math.abs(m))
          {
            this.mTouchMode = 3;
          }
        }
        else if (j != this.mLastX)
          if (m > 0)
          {
            n = m - this.mTouchSlop;
            label912: if (this.mLastX == -2147483648)
              break label976;
          }
      }
      else
      {
        label976: for (int i1 = j - this.mLastX; ; i1 = n)
        {
          if (this.mFingerScrollEnabled)
            scroll(m, i1);
          this.mLastX = j;
          this.mMotionX = j;
          this.mMotionY = k;
          break;
          n = m + this.mTouchSlop;
          break label912;
        }
        recycleVelocityTracker();
        this.mMotionX = -2147483648;
        this.mMotionY = -2147483648;
        this.mLastX = -2147483648;
        this.mTouchMode = -1;
      }
    }
  }

  public int pointToPosition(int paramInt1, int paramInt2)
  {
    Rect localRect = this.mTouchFrame;
    if (localRect == null)
    {
      this.mTouchFrame = new Rect();
      localRect = this.mTouchFrame;
    }
    for (int i = -1 + getChildCount(); i >= 0; i--)
    {
      getChildAt(i).getHitRect(localRect);
      if (localRect.contains(paramInt1, paramInt2))
        return i + this.mFirstVisiblePos;
    }
    return -1;
  }

  public boolean scroll(int paramInt1, int paramInt2)
  {
    int i = getChildCount();
    boolean bool1;
    int j;
    int k;
    int n;
    int i1;
    label62: int i2;
    boolean bool2;
    label101: int i3;
    int i4;
    int i8;
    label120: View localView2;
    if (paramInt2 < 0)
    {
      bool1 = true;
      j = getPaddingLeft();
      k = getWidth() - getPaddingRight();
      int m = getChildAt(i - 1).getRight();
      n = getChildAt(0).getLeft();
      if (!bool1)
        break label223;
      i1 = getOverflowRight();
      i2 = this.mFirstVisiblePos;
      if (!bool1)
        break label238;
      if ((i2 + i >= this.mItemCount) && (m + paramInt1 < k - this.mEdgePadding))
        break label232;
      bool2 = true;
      if (!bool2)
        break label377;
      i3 = 0;
      i4 = 0;
      if (!bool1)
        break label292;
      i8 = 0;
      i3 = 0;
      if (i8 < i)
      {
        localView2 = getChildAt(i8);
        int i9 = paramInt1 + localView2.getRight();
        i3 = 0;
        if (i9 < j)
          break label269;
      }
    }
    label269: label292: label347: 
    while (true)
    {
      if (i4 > 0)
      {
        detachViewsFromParent(i3, i4);
        if (bool1)
          this.mFirstVisiblePos = (i4 + this.mFirstVisiblePos);
      }
      int i6 = getChildCount();
      for (int i7 = 0; i7 < i6; i7++)
        getChildAt(i7).offsetLeftAndRight(paramInt1);
      bool1 = false;
      break;
      label223: i1 = getOverflowLeft();
      break label62;
      label232: bool2 = false;
      break label101;
      label238: if ((i2 > 0) || (n + paramInt1 <= j + this.mEdgePadding));
      for (bool2 = true; ; bool2 = false)
        break;
      i4++;
      this.mRecycler.addRecycleView(localView2, i2 + i8);
      i8++;
      break label120;
      for (int i5 = i - 1; ; i5--)
      {
        if (i5 < 0)
          break label347;
        View localView1 = getChildAt(i5);
        if (paramInt1 + localView1.getLeft() <= k)
          break;
        i3 = i5;
        i4++;
        this.mRecycler.addRecycleView(localView1, i2 + i5);
      }
    }
    invalidate();
    if (i1 < Math.abs(paramInt2))
      fillGap(bool1);
    this.mOnScrollListener.onScroll();
    label377: return bool2;
  }

  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (paramListAdapter != this.mAdapter)
    {
      if (this.mDataSetObserver == null)
        this.mDataSetObserver = new AdapterDataSetObserver();
      if (this.mAdapter != null)
        this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
      this.mAdapter = paramListAdapter;
      if (paramListAdapter != null)
      {
        paramListAdapter.registerDataSetObserver(this.mDataSetObserver);
        this.mItemCount = paramListAdapter.getCount();
      }
    }
    else
    {
      return;
    }
    this.mItemCount = 0;
  }

  public void setChildWidthListener(ChildWidthListener paramChildWidthListener)
  {
    this.mChildWidthListener = paramChildWidthListener;
  }

  public void setClipToPadding(boolean paramBoolean)
  {
    super.setClipToPadding(paramBoolean);
    this.mClipToPadding = paramBoolean;
  }

  public void setDivider(Drawable paramDrawable)
  {
    if (paramDrawable != null);
    for (this.mDividerWidth = paramDrawable.getIntrinsicWidth(); ; this.mDividerWidth = 0)
    {
      this.mDivider = paramDrawable;
      requestLayout();
      invalidate();
      return;
    }
  }

  public void setDividerWidth(int paramInt)
  {
    this.mDividerWidth = paramInt;
    requestLayout();
    invalidate();
  }

  public void setFingerScrollEnabled(boolean paramBoolean)
  {
    this.mFingerScrollEnabled = paramBoolean;
  }

  public void setLongPressDuration(int paramInt)
  {
    this.mLongPressMillis = paramInt;
  }

  public void setOnItemLongClickListener(AdapterView.OnItemLongClickListener paramOnItemLongClickListener)
  {
    this.mOnItemLongClickListener = paramOnItemLongClickListener;
  }

  public void setOnScrollListener(DragSortWidget paramDragSortWidget)
  {
    this.mOnScrollListener = paramDragSortWidget;
  }

  public void setPressed(boolean paramBoolean)
  {
    if (getParent() == null)
      super.setPressed(paramBoolean);
  }

  public void setSelection(int paramInt)
  {
    this.mFirstVisiblePos = paramInt;
    detachAllViewsFromParent();
    layoutChildren();
    invalidate();
  }

  private class AdapterDataSetObserver extends DataSetObserver
  {
    public AdapterDataSetObserver()
    {
    }

    public void onChanged()
    {
      HorizontalListView.access$402(HorizontalListView.this, HorizontalListView.this.mAdapter.getCount());
      HorizontalListView.access$102(HorizontalListView.this, true);
      HorizontalListView.this.requestLayout();
    }

    public void onInvalidated()
    {
      HorizontalListView.access$402(HorizontalListView.this, 0);
      HorizontalListView.access$102(HorizontalListView.this, true);
      HorizontalListView.this.requestLayout();
    }
  }

  private class CheckForLongPress
    implements Runnable
  {
    private int mOriginalAttachCount;

    private CheckForLongPress()
    {
    }

    public void rememberWindowAttachCount()
    {
      this.mOriginalAttachCount = HorizontalListView.this.getWindowAttachCount();
    }

    public void run()
    {
      int i = HorizontalListView.this.mMotionPosition;
      View localView = HorizontalListView.this.getChildAt(i - HorizontalListView.this.mFirstVisiblePos);
      if (localView != null)
      {
        int j = HorizontalListView.this.mMotionPosition;
        long l = HorizontalListView.this.mAdapter.getItemId(HorizontalListView.this.mMotionPosition);
        boolean bool1 = sameWindow();
        boolean bool2 = false;
        if (bool1)
        {
          boolean bool3 = HorizontalListView.this.mDataChanged;
          bool2 = false;
          if (!bool3)
            bool2 = HorizontalListView.this.performLongPress(localView, j, l);
        }
        if (bool2)
        {
          HorizontalListView.access$002(HorizontalListView.this, -1);
          HorizontalListView.this.setPressed(false);
          localView.setPressed(false);
        }
      }
      else
      {
        return;
      }
      HorizontalListView.access$002(HorizontalListView.this, 2);
    }

    public boolean sameWindow()
    {
      return (HorizontalListView.this.hasWindowFocus()) && (HorizontalListView.this.getWindowAttachCount() == this.mOriginalAttachCount);
    }
  }

  final class CheckForTap
    implements Runnable
  {
    CheckForTap()
    {
    }

    public void run()
    {
      Drawable localDrawable2;
      if (HorizontalListView.this.mTouchMode == 0)
      {
        HorizontalListView.access$002(HorizontalListView.this, 1);
        View localView = HorizontalListView.this.getChildAt(HorizontalListView.this.mMotionPosition - HorizontalListView.this.mFirstVisiblePos);
        if ((localView != null) && (!localView.hasFocusable()))
          if (!HorizontalListView.this.mDataChanged)
          {
            localView.setPressed(true);
            HorizontalListView.this.setPressed(true);
            HorizontalListView.this.layoutChildren();
            HorizontalListView.this.refreshDrawableState();
            boolean bool = HorizontalListView.this.isLongClickable();
            if (HorizontalListView.this.mSelector != null)
            {
              localDrawable2 = HorizontalListView.this.mSelector.getCurrent();
              if ((localDrawable2 != null) && ((localDrawable2 instanceof TransitionDrawable)))
              {
                if (!bool)
                  break label275;
                ((TransitionDrawable)localDrawable2).startTransition(HorizontalListView.this.mLongPressMillis);
              }
            }
            if (!bool)
              break label286;
            if (HorizontalListView.this.mPendingCheckForLongPress == null)
              HorizontalListView.access$1102(HorizontalListView.this, new HorizontalListView.CheckForLongPress(HorizontalListView.this, null));
            HorizontalListView.this.mPendingCheckForLongPress.rememberWindowAttachCount();
            HorizontalListView.this.postDelayed(HorizontalListView.this.mPendingCheckForLongPress, HorizontalListView.this.mLongPressMillis);
          }
      }
      while (true)
      {
        if (HorizontalListView.this.mSelector != null)
        {
          Drawable localDrawable1 = HorizontalListView.this.mSelector.getCurrent();
          if ((localDrawable1 != null) && ((localDrawable1 instanceof TransitionDrawable)))
            ((TransitionDrawable)localDrawable1).resetTransition();
        }
        HorizontalListView.access$002(HorizontalListView.this, 2);
        return;
        label275: ((TransitionDrawable)localDrawable2).resetTransition();
        break;
        label286: HorizontalListView.access$002(HorizontalListView.this, 2);
      }
    }
  }

  public static abstract interface ChildWidthListener
  {
    public abstract void onChildWidthMeasured(int paramInt);
  }

  private class FlingRunnable
    implements Runnable
  {
    private int mLastFlingX;
    private int mScreenWidth;
    private final Scroller mScroller = new Scroller(HorizontalListView.this.getContext());

    public FlingRunnable()
    {
    }

    public void run()
    {
      int i = HorizontalListView.this.getChildCount();
      if ((HorizontalListView.this.mItemCount == 0) || (i == 0))
      {
        stop();
        return;
      }
      Scroller localScroller = this.mScroller;
      boolean bool1 = localScroller.computeScrollOffset();
      int j = localScroller.getCurrX();
      int k = this.mLastFlingX - j;
      if (k > 0);
      for (int m = Math.min(this.mScreenWidth, k); ; m = Math.max(-this.mScreenWidth, k))
      {
        boolean bool2 = HorizontalListView.this.scroll(m, m);
        if (!bool1)
          break label165;
        if (!bool2)
          break;
        this.mLastFlingX = j;
        HorizontalListView.this.post(this);
        return;
      }
      if (m > 0);
      for (int n = HorizontalListView.this.getOverflowLeft(); ; n = -HorizontalListView.this.getOverflowRight())
      {
        HorizontalListView.this.scroll(n, n);
        stop();
        return;
      }
      label165: stop();
    }

    public void start(int paramInt)
    {
      if (paramInt == 0)
        return;
      HorizontalListView.access$002(HorizontalListView.this, 4);
      this.mScreenWidth = (-1 + (HorizontalListView.this.getWidth() - HorizontalListView.this.getPaddingLeft() - HorizontalListView.this.getPaddingRight()));
      HorizontalListView.this.removeCallbacks(this);
      if (paramInt < 0);
      for (int i = 2147483647; ; i = 0)
      {
        this.mLastFlingX = i;
        this.mScroller.fling(i, 0, paramInt, 0, 0, 2147483647, 0, 2147483647);
        HorizontalListView.this.post(this);
        return;
      }
    }

    public void stop()
    {
      if (HorizontalListView.this.mTouchMode == 4)
      {
        HorizontalListView.access$002(HorizontalListView.this, -1);
        HorizontalListView.this.removeCallbacks(this);
        if (!this.mScroller.isFinished())
        {
          this.mScroller.abortAnimation();
          HorizontalListView.this.invalidate();
        }
      }
    }
  }

  public static class LayoutParams extends ViewGroup.LayoutParams
  {
    public boolean recycled;
    public int recycledPosition;

    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }

    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }

    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
  }

  public static abstract interface OnScrollListener
  {
    public abstract void onScroll();
  }

  private class PerformClick
    implements Runnable
  {
    public int clickMotionPosition;
    private int mOriginalAttachCount;

    public PerformClick()
    {
    }

    public void rememberWindowAttachCount()
    {
      this.mOriginalAttachCount = HorizontalListView.this.getWindowAttachCount();
    }

    public void run()
    {
      if (HorizontalListView.this.mDataChanged);
      ListAdapter localListAdapter;
      int i;
      View localView;
      do
      {
        do
        {
          return;
          localListAdapter = HorizontalListView.this.mAdapter;
          i = this.clickMotionPosition;
        }
        while ((localListAdapter == null) || (HorizontalListView.this.mItemCount <= 0) || (i == -1) || (i >= localListAdapter.getCount()) || (!sameWindow()));
        localView = HorizontalListView.this.getChildAt(i - HorizontalListView.this.mFirstVisiblePos);
      }
      while (localView == null);
      HorizontalListView.this.performItemClick(localView, i, localListAdapter.getItemId(i));
    }

    public boolean sameWindow()
    {
      return (HorizontalListView.this.hasWindowFocus()) && (HorizontalListView.this.getWindowAttachCount() == this.mOriginalAttachCount);
    }
  }

  private class Recycler
  {
    private View[] mActiveViews;
    private int mFirstActivePos;
    private final ArrayList<View> mRecycleViews = new ArrayList();

    public Recycler()
    {
    }

    private void pruneRecycleViews()
    {
      int i = this.mActiveViews.length;
      ArrayList localArrayList = this.mRecycleViews;
      int j = localArrayList.size();
      int k = j - i;
      int m = j - 1;
      for (int n = 0; n < k; n++)
      {
        HorizontalListView.this.removeDetachedView((View)localArrayList.remove(m), false);
        m--;
      }
    }

    public void addRecycleView(View paramView, int paramInt)
    {
      HorizontalListView.LayoutParams localLayoutParams = (HorizontalListView.LayoutParams)paramView.getLayoutParams();
      if (localLayoutParams == null)
        return;
      localLayoutParams.recycledPosition = paramInt;
      localLayoutParams.recycled = true;
      this.mRecycleViews.add(paramView);
    }

    public void clear()
    {
      ArrayList localArrayList = this.mRecycleViews;
      for (int i = -1 + localArrayList.size(); i >= 0; i--)
        HorizontalListView.this.removeDetachedView((View)localArrayList.remove(i), false);
    }

    public void fillActiveViews(int paramInt1, int paramInt2)
    {
      View[] arrayOfView = this.mActiveViews;
      if ((arrayOfView == null) || (arrayOfView.length < paramInt2))
      {
        this.mActiveViews = new View[paramInt2];
        arrayOfView = this.mActiveViews;
      }
      this.mFirstActivePos = paramInt1;
      for (int i = 0; i < paramInt2; i++)
        arrayOfView[i] = HorizontalListView.this.getChildAt(i);
    }

    public View getActiveView(int paramInt)
    {
      if (this.mActiveViews != null)
      {
        int i = paramInt - this.mFirstActivePos;
        View[] arrayOfView = this.mActiveViews;
        if ((i >= 0) && (i < arrayOfView.length))
        {
          View localView = arrayOfView[i];
          arrayOfView[i] = null;
          return localView;
        }
      }
      return null;
    }

    public void recycleActiveViews()
    {
      View[] arrayOfView = this.mActiveViews;
      if (arrayOfView == null)
        return;
      ArrayList localArrayList = this.mRecycleViews;
      for (int i = -1 + arrayOfView.length; i >= 0; i--)
      {
        View localView = arrayOfView[i];
        if (localView != null)
        {
          HorizontalListView.LayoutParams localLayoutParams = (HorizontalListView.LayoutParams)localView.getLayoutParams();
          arrayOfView[i] = null;
          localLayoutParams.recycledPosition = (i + this.mFirstActivePos);
          localArrayList.add(localView);
        }
      }
      pruneRecycleViews();
    }

    public View removeRecycleView(int paramInt)
    {
      ArrayList localArrayList = this.mRecycleViews;
      if (localArrayList.isEmpty())
        return null;
      int i = localArrayList.size();
      for (int j = 0; j < i; j++)
      {
        View localView = (View)localArrayList.get(j);
        if (((HorizontalListView.LayoutParams)localView.getLayoutParams()).recycledPosition == paramInt)
        {
          localArrayList.remove(j);
          return localView;
        }
      }
      return (View)localArrayList.remove(i - 1);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.dragsort.HorizontalListView
 * JD-Core Version:    0.6.2
 */