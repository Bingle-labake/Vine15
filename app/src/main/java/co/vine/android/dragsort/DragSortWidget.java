package co.vine.android.dragsort;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewPropertyAnimator;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.RelativeLayout;
import co.vine.android.animation.SmoothAnimator;

@TargetApi(14)
public class DragSortWidget extends RelativeLayout
  implements View.OnTouchListener, AdapterView.OnItemClickListener, HorizontalListView.OnScrollListener
{
  private static final int DROP_DURATION = 150;
  private static final float FOCUSED_ALPHA = 1.0F;
  public static final int INVALID_POSITION = -1;
  private static final float MAX_SCROLL_SPEED_DENSITY_MULTIPLIER = 0.1F;
  private static final int PICK_UP_CONTENT_DURATION = 130;
  private static final int PICK_UP_DURATION = 0;
  private static final int REMOVE_DURATION = 100;
  private static final float SCROLL_THRESHOLD = 0.33F;
  private static final float SMOOTHNESS = 0.05F;
  private static final int SWAP_DURATION = 100;
  private static final float UNFOCUSED_ALPHA = 0.3F;
  private boolean isFromContentView = false;
  private Drawable mActivatedDrawable;
  private int mActivePointerId;
  private DragSortAdapterWrapper mAdapterWrapper;
  private CheckForLongPress mCheckForLongPress;
  private View mContentView;
  private Rect mContentViewBounds;
  private ContentViewPickUpAnimator mContentViewPickUpAnimator = new ContentViewPickUpAnimator(0.05F, 130);
  private CurrentlyPlayingProvider mCurrentlyPlayingProvider;
  private int mDownPosition;
  private DragListener mDragListener;
  private DragScroller mDragScroller = new DragScroller();
  private DropAnimator mDropAnimator = new DropAnimator(0.05F, 150);
  boolean mDropping = false;
  private Bitmap mFloatBitmap;
  private ImageView mFloatView = null;
  private Drawable mFloatViewActivatedDrawable;
  private float mFloatViewAlpha = 255.0F;
  private int mFloatViewDefaultSize;
  private FloatViewDestroyAnimator mFloatViewDestroyAnimator = new FloatViewDestroyAnimator(0.05F, 100);
  private int mFloatViewHeight;
  private FloatViewInteractionListener mFloatViewInteractionListener;
  private int mFloatViewListPosition = -1;
  private int mFloatViewWidth;
  private int mFloatViewX;
  private int mFloatViewY;
  private int mFocusedPosition;
  private HorizontalListView mListView;
  private float mMaxScrollSpeed;
  private boolean mPickingUpContent = false;
  private RemoveAnimator mRemoveAnimator = new RemoveAnimator(0.05F, 100);
  private RemoveListener mRemoveListener;
  private int mRemovePosition;
  boolean mRemoving = false;
  private SelectionChangedListener mSelectionChangedListener;
  private int mSelectionPosition = -1;
  private int mTouchDownX;
  private int mTouchDownY;
  private int mTouchListPosition;
  private final int mTouchSlop;
  private int mTouchX;
  private int mTouchY;
  private int mXOffsetFromTouch;
  private int mYOffsetFromTouch;

  public DragSortWidget(Context paramContext)
  {
    this(paramContext, null);
  }

  public DragSortWidget(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.dragSortWidgetStyle);
  }

  public DragSortWidget(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.DragSortWidget, paramInt, 0);
    this.mActivatedDrawable = localTypedArray.getDrawable(0);
    this.mFloatViewActivatedDrawable = localTypedArray.getDrawable(1);
    this.mFloatViewDefaultSize = localTypedArray.getDimensionPixelSize(2, 0);
    this.mTouchSlop = ViewConfiguration.get(paramContext).getScaledTouchSlop();
    localTypedArray.recycle();
  }

  private void adjustItem(int paramInt)
  {
    View localView = this.mListView.getChildAt(paramInt - this.mListView.getFirstVisiblePosition());
    if (localView != null)
    {
      if ((this.mFloatView == null) || (paramInt != this.mFloatViewListPosition))
        break label66;
      localView.setVisibility(4);
      localView.setActivated(true);
      if (paramInt != this.mFocusedPosition)
        break label100;
    }
    label66: label100: for (float f = 1.0F; ; f = 0.3F)
    {
      localView.setAlpha(f);
      localView.invalidate();
      return;
      if (paramInt == this.mSelectionPosition)
      {
        localView.setActivated(true);
        localView.setVisibility(0);
        break;
      }
      localView.setActivated(false);
      localView.setVisibility(0);
      break;
    }
  }

  private void adjustItems()
  {
    for (int i = 0; i < this.mListView.getChildCount(); i++)
      adjustItem(i + this.mListView.getFirstVisiblePosition());
  }

  private void createFloatView(int paramInt)
  {
    View localView = this.mListView.getChildAt(paramInt - this.mListView.getFirstVisiblePosition());
    if (localView == null);
    while ((this.mTouchDownX - this.mListView.getLeft() < localView.getLeft()) || (this.mTouchDownY - this.mListView.getTop() < localView.getTop()) || (this.mTouchDownX - this.mListView.getLeft() > localView.getRight()) || (this.mTouchDownY - this.mListView.getTop() > localView.getBottom()))
      return;
    localView.setDrawingCacheQuality(1048576);
    localView.setDrawingCacheEnabled(true);
    this.mFloatBitmap = Bitmap.createBitmap(localView.getDrawingCache());
    localView.setDrawingCacheEnabled(false);
    if (this.mFloatView == null)
      this.mFloatView = new ImageView(this.mListView.getContext());
    this.mFloatView.setImageBitmap(this.mFloatBitmap);
    this.mFloatView.setLayoutParams(new ViewGroup.LayoutParams(localView.getWidth(), localView.getHeight()));
    this.mXOffsetFromTouch = (this.mTouchDownX - (localView.getLeft() + this.mListView.getLeft()));
    this.mYOffsetFromTouch = (this.mTouchDownY - (localView.getTop() + this.mListView.getTop()));
    this.mFloatViewWidth = localView.getWidth();
    this.mFloatViewHeight = localView.getHeight();
    this.mFloatViewX = (this.mTouchX - this.mXOffsetFromTouch);
    this.mFloatViewY = (this.mTouchY - this.mYOffsetFromTouch);
    this.mFloatViewAlpha = 255.0F;
    adjustItem(paramInt);
  }

  private void createFloatViewFromContentView()
  {
    this.mFloatViewListPosition = this.mSelectionPosition;
    View localView = this.mListView.getChildAt(this.mSelectionPosition - this.mListView.getFirstVisiblePosition());
    this.mContentViewPickUpAnimator.start();
    this.mXOffsetFromTouch = (this.mTouchX - this.mContentViewBounds.left);
    this.mYOffsetFromTouch = (this.mTouchY - this.mContentViewBounds.top);
    this.mFloatViewX = (this.mTouchX - this.mXOffsetFromTouch);
    this.mFloatViewY = (this.mTouchY - this.mYOffsetFromTouch);
    this.mFloatViewWidth = this.mContentViewBounds.width();
    this.mFloatViewHeight = this.mContentViewBounds.height();
    this.mFloatViewAlpha = 255.0F;
    if ((localView == null) && (this.mSelectionPosition >= 0) && (this.mSelectionPosition < this.mListView.getAdapter().getCount()))
      localView = this.mListView.getAdapter().getView(this.mSelectionPosition, null, null);
    this.mFloatBitmap = ((DragSortListItem)localView).getBitmap();
    if (this.mFloatView == null)
      this.mFloatView = new ImageView(this.mListView.getContext());
    this.mFloatView.setImageBitmap(this.mFloatBitmap);
    this.mFloatView.setLayoutParams(new ViewGroup.LayoutParams(this.mFloatViewWidth, this.mFloatViewHeight));
    adjustItem(this.mSelectionPosition);
  }

  private void destroyFloatView()
  {
    if (this.mFloatView != null)
    {
      this.mFloatView.setImageDrawable(null);
      this.mFloatBitmap = null;
      this.mFloatView = null;
    }
  }

  private void dragFloatView(int paramInt1, int paramInt2)
  {
    if ((paramInt1 > -1) && (paramInt2 > -1) && (paramInt1 != paramInt2) && (floatViewIntersectsList()))
    {
      this.mFloatViewListPosition = paramInt2;
      finishSwap(paramInt1, paramInt2);
    }
    while (true)
    {
      handleDragScroll();
      invalidate();
      return;
      if ((floatViewIntersectsList()) && (paramInt1 == paramInt2))
      {
        View localView = this.mListView.getChildAt(this.mListView.getLastVisiblePosition() - this.mListView.getFirstVisiblePosition());
        if ((localView != null) && (this.mFloatViewX > localView.getRight()))
        {
          this.mFloatViewListPosition = this.mListView.getLastVisiblePosition();
          finishSwap(paramInt1, this.mFloatViewListPosition);
        }
      }
      else
      {
        this.mFloatViewListPosition = paramInt1;
      }
    }
  }

  private void finishDrop()
  {
    this.mDropping = false;
    if (this.mFloatViewInteractionListener != null)
      this.mFloatViewInteractionListener.floatViewLanded(this.mFloatViewListPosition);
    destroyFloatView();
    adjustItems();
    invalidate();
  }

  private void finishRemoveSelection()
  {
    if (this.mRemovePosition != -1)
    {
      if (this.mRemoveListener != null)
        this.mRemoveListener.remove(this.mRemovePosition);
      this.mRemovePosition = -1;
      this.mSelectionPosition = -1;
      this.mFocusedPosition = -1;
      if (this.mSelectionChangedListener != null)
        this.mSelectionChangedListener.onSelectionChanged(this.mSelectionPosition, false);
    }
  }

  private void finishSwap(int paramInt1, int paramInt2)
  {
    if (this.mDragListener != null)
    {
      if (paramInt1 < paramInt2)
        for (int j = paramInt1; j < paramInt2; j++)
          if (j >= 0)
          {
            this.mDragListener.drag(j, j + 1);
            triggerSwapAnimation(j, j + 1);
          }
      for (int i = paramInt1; i > paramInt2; i--)
        if (i >= 1)
        {
          this.mDragListener.drag(i, i - 1);
          triggerSwapAnimation(i, i - 1);
        }
    }
    if (paramInt2 != -1)
    {
      this.mSelectionPosition = paramInt2;
      this.mFocusedPosition = paramInt2;
    }
    adjustItems();
  }

  private boolean floatViewIntersectsList()
  {
    return (!this.mPickingUpContent) && (this.mFloatViewX <= this.mListView.getRight()) && (this.mFloatViewY <= this.mListView.getBottom()) && (this.mFloatViewX + this.mFloatViewWidth >= this.mListView.getLeft()) && (this.mFloatViewY + this.mFloatViewHeight >= this.mListView.getTop());
  }

  private int getClosestItemPosition()
  {
    for (int i = 0; i < this.mListView.getChildCount(); i++)
      if (this.mTouchX - this.mListView.getLeft() < this.mListView.getChildAt(i).getRight())
        return i + this.mListView.getFirstVisiblePosition();
    return -1;
  }

  private boolean handleClick(int paramInt, boolean paramBoolean)
  {
    View localView1 = this.mListView.getChildAt(paramInt - this.mListView.getFirstVisiblePosition());
    if (localView1 != null)
    {
      if (this.mSelectionPosition == paramInt)
      {
        localView1.setActivated(false);
        this.mSelectionPosition = -1;
      }
      for (this.mFocusedPosition = -1; ; this.mFocusedPosition = paramInt)
      {
        if (this.mSelectionChangedListener != null)
          this.mSelectionChangedListener.onSelectionChanged(this.mSelectionPosition, paramBoolean);
        adjustItems();
        invalidate();
        return true;
        localView1.setActivated(true);
        if (this.mSelectionPosition != -1)
        {
          View localView2 = this.mListView.getChildAt(this.mSelectionPosition - this.mListView.getFirstVisiblePosition());
          if (localView2 != null)
            localView2.setActivated(false);
        }
        this.mSelectionPosition = paramInt;
      }
    }
    return false;
  }

  private boolean handleContentViewTouch(MotionEvent paramMotionEvent)
  {
    int i = 0xFF & paramMotionEvent.getAction();
    this.mTouchListPosition = getClosestItemPosition();
    switch (i)
    {
    default:
    case 0:
    case 2:
    case 1:
    }
    label235: label241: 
    do
    {
      while (true)
      {
        return false;
        this.mTouchDownX = this.mTouchX;
        this.mTouchDownY = this.mTouchY;
        this.mActivePointerId = paramMotionEvent.getPointerId(0);
        this.mDownPosition = this.mSelectionPosition;
        continue;
        int j = Math.abs(this.mTouchX - this.mTouchDownX);
        int k = Math.abs(this.mTouchY - this.mTouchDownY);
        int m = this.mFloatViewListPosition;
        if (this.mTouchListPosition != -1)
          this.mFloatViewListPosition = this.mTouchListPosition;
        int n;
        if ((this.mFloatViewInteractionListener != null) && (this.mFloatViewInteractionListener.canPickUpFloatView()))
        {
          n = 1;
          if (this.mListView == null)
            break label235;
        }
        for (ListAdapter localListAdapter = this.mListView.getAdapter(); ; localListAdapter = null)
        {
          if ((this.mContentView == null) || (localListAdapter == null) || (localListAdapter.getCount() <= 0) || ((k < this.mTouchSlop) && (j < this.mTouchSlop)) || (this.mFloatView != null) || (n == 0))
            break label241;
          pickUpContentView();
          return true;
          n = 0;
          break;
        }
        if ((this.mFloatView != null) && (!this.mDropping))
        {
          this.mFloatViewX = (this.mTouchX - this.mXOffsetFromTouch);
          this.mFloatViewY = (this.mTouchY - this.mYOffsetFromTouch);
          if (this.mFloatViewInteractionListener != null)
            this.mFloatViewInteractionListener.floatViewMoved();
          dragFloatView(m, this.mFloatViewListPosition);
          return true;
        }
        invalidate();
      }
      this.mDownPosition = -1;
      removeCallbacks(this.mCheckForLongPress);
    }
    while ((this.mFloatView == null) || (this.mDropping));
    if ((this.mFloatViewInteractionListener != null) && (this.mFloatViewInteractionListener.floatViewDropped(this.mFloatViewListPosition)) && (canDelete()))
    {
      this.mFloatViewDestroyAnimator.start();
      removeSelection();
    }
    while (true)
    {
      this.mDragScroller.stopScrolling(true);
      invalidate();
      return true;
      this.mDropAnimator.start();
    }
  }

  private void handleDragScroll()
  {
    boolean bool = floatViewIntersectsList();
    if ((this.mTouchX - this.mListView.getLeft() > 0.33F * (2 * this.mListView.getWidth())) && (bool))
    {
      this.mDragScroller.startScrolling(1);
      return;
    }
    if ((this.mTouchX - this.mListView.getLeft() < 0.33F * this.mListView.getWidth()) && (bool))
    {
      this.mDragScroller.startScrolling(0);
      return;
    }
    this.mDragScroller.stopScrolling(true);
  }

  private boolean handleListViewTouch(MotionEvent paramMotionEvent)
  {
    int i = 0xFF & paramMotionEvent.getAction();
    this.mTouchListPosition = getClosestItemPosition();
    switch (i)
    {
    case 3:
    case 4:
    case 5:
    default:
    case 0:
    case 2:
    case 6:
    case 1:
    }
    label308: 
    do
    {
      do
      {
        int j;
        do
        {
          while (true)
          {
            return false;
            this.mTouchDownX = this.mTouchX;
            this.mTouchDownY = this.mTouchY;
            this.mActivePointerId = paramMotionEvent.getPointerId(0);
            this.mDownPosition = this.mTouchListPosition;
            postDelayed(this.mCheckForLongPress, PICK_UP_DURATION);
          }
          j = this.mFloatViewListPosition;
          if (this.mTouchListPosition != -1)
            this.mFloatViewListPosition = this.mTouchListPosition;
          int k = Math.abs(this.mTouchY - this.mTouchDownY);
          int m = Math.abs(this.mTouchX - this.mTouchDownX);
          if ((this.mFloatViewInteractionListener != null) && (this.mFloatViewInteractionListener.canPickUpFloatView()));
          for (int n = 1; ; n = 0)
          {
            if ((this.mFloatView == null) && (m < this.mTouchSlop) && (k >= this.mTouchSlop) && (this.mTouchY - this.mTouchDownY < 0) && (this.mSelectionPosition != this.mTouchListPosition) && (n != 0))
              handleClick(this.mTouchListPosition, false);
            if ((this.mFloatView != null) || ((m < this.mTouchSlop) && (k < this.mTouchSlop)))
              break label308;
            removeCallbacks(this.mCheckForLongPress);
            if ((n == 0) || (!pickUpView(this.mFloatViewListPosition)))
              break;
            invalidate();
            return true;
          }
        }
        while ((this.mFloatView == null) || (this.mDropping));
        this.mFloatViewX = (this.mTouchX - this.mXOffsetFromTouch);
        this.mFloatViewY = (this.mTouchY - this.mYOffsetFromTouch);
        if (this.mFloatViewInteractionListener != null)
          this.mFloatViewInteractionListener.floatViewMoved();
        dragFloatView(j, this.mFloatViewListPosition);
        return true;
      }
      while (paramMotionEvent.getPointerId((0xFF00 & paramMotionEvent.getAction()) >> 8) != this.mActivePointerId);
      this.mDownPosition = -1;
      removeCallbacks(this.mCheckForLongPress);
    }
    while ((this.mFloatView == null) || (this.mDropping));
    if ((this.mFloatViewInteractionListener != null) && (this.mFloatViewInteractionListener.floatViewDropped(this.mFloatViewListPosition)) && (canDelete()))
    {
      this.mFloatViewDestroyAnimator.start();
      removeSelection();
    }
    while (true)
    {
      this.mDragScroller.stopScrolling(true);
      invalidate();
      return true;
      this.mDropAnimator.start();
    }
  }

  private boolean pickUpContentView()
  {
    if (this.mSelectionPosition == -1)
    {
      int i = this.mCurrentlyPlayingProvider.getCurrentlyPlayingPosition();
      handleClick(i, false);
      this.mFloatViewListPosition = i;
      this.mSelectionPosition = i;
    }
    createFloatViewFromContentView();
    if (this.mFloatViewInteractionListener != null)
      this.mFloatViewInteractionListener.floatViewPickedUp(this.mSelectionPosition);
    invalidate();
    return true;
  }

  private boolean pickUpView(int paramInt)
  {
    if ((paramInt == this.mSelectionPosition) && (paramInt != -1))
    {
      createFloatView(paramInt);
      if (this.mFloatViewInteractionListener != null)
        this.mFloatViewInteractionListener.floatViewPickedUp(paramInt);
      invalidate();
      return true;
    }
    return false;
  }

  private void triggerSwapAnimation(final int paramInt1, int paramInt2)
  {
    View localView = this.mListView.getChildAt(paramInt2 - this.mListView.getFirstVisiblePosition());
    if (localView == null);
    for (final int i = 0; ; i = localView.getLeft())
    {
      final ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
      localViewTreeObserver.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
      {
        public boolean onPreDraw()
        {
          localViewTreeObserver.removeOnPreDrawListener(this);
          View localView = DragSortWidget.this.mListView.getChildAt(paramInt1 - DragSortWidget.this.mListView.getFirstVisiblePosition());
          if (localView != null)
          {
            int i = localView.getLeft();
            localView.setTranslationX(i - i);
            ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(localView, View.TRANSLATION_X, new float[] { 0.0F });
            localObjectAnimator.setDuration(100L);
            localObjectAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
            {
              public void onAnimationUpdate(ValueAnimator paramAnonymous2ValueAnimator)
              {
                DragSortWidget.this.mListView.invalidate();
              }
            });
            localObjectAnimator.start();
          }
          return true;
        }
      });
      return;
    }
  }

  public boolean canDelete()
  {
    return !this.mPickingUpContent;
  }

  public void cleanUp()
  {
    this.mSelectionPosition = -1;
    this.mFocusedPosition = -1;
    this.mRemovePosition = -1;
    this.mDropping = false;
    this.mRemoving = false;
    destroyFloatView();
  }

  protected void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    if (this.mFloatView != null)
    {
      paramCanvas.save();
      paramCanvas.translate(this.mFloatViewX, this.mFloatViewY);
      paramCanvas.clipRect(0, 0, this.mFloatViewWidth, this.mFloatViewHeight);
      paramCanvas.saveLayerAlpha(0.0F, 0.0F, this.mFloatViewWidth, this.mFloatViewHeight, (int)this.mFloatViewAlpha, 31);
      this.mFloatView.layout(0, 0, this.mFloatViewWidth, this.mFloatViewHeight);
      this.mFloatView.draw(paramCanvas);
      paramCanvas.restore();
      paramCanvas.restore();
      this.mFloatViewActivatedDrawable.setBounds(this.mFloatViewX, this.mFloatViewY, this.mFloatViewX + this.mFloatViewWidth, this.mFloatViewY + this.mFloatViewHeight);
      this.mFloatViewActivatedDrawable.setAlpha((int)this.mFloatViewAlpha);
      this.mFloatViewActivatedDrawable.draw(paramCanvas);
    }
    View localView;
    do
    {
      do
        return;
      while (this.mSelectionPosition == -1);
      localView = this.mListView.getChildAt(this.mSelectionPosition - this.mListView.getFirstVisiblePosition());
    }
    while ((localView == null) || (this.mRemoving));
    this.mActivatedDrawable.setBounds(localView.getLeft() + this.mListView.getLeft(), localView.getTop() + this.mListView.getTop(), localView.getRight() + this.mListView.getLeft(), localView.getBottom() + this.mListView.getTop());
    this.mActivatedDrawable.setAlpha(255);
    this.mActivatedDrawable.draw(paramCanvas);
  }

  public boolean floatViewIsFromContentView()
  {
    return this.isFromContentView;
  }

  public Rect getFloatViewBounds()
  {
    if (this.mFloatView != null)
      return new Rect(this.mFloatViewX, this.mFloatViewY, this.mFloatViewX + this.mFloatViewWidth, this.mFloatViewY + this.mFloatViewHeight);
    return null;
  }

  public boolean hasFloatView()
  {
    return this.mFloatView != null;
  }

  public void onFinishInflate()
  {
    this.mListView = ((HorizontalListView)findViewById(16908298));
    this.mListView.setOnTouchListener(this);
    this.mListView.setOnItemClickListener(this);
    this.mListView.setFingerScrollEnabled(true);
    this.mListView.setOnScrollListener(this);
    this.mCheckForLongPress = new CheckForLongPress();
    this.mMaxScrollSpeed = (0.1F * getResources().getDisplayMetrics().xdpi);
  }

  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if ((this.mTouchX - this.mListView.getLeft() >= 0) && (this.mTouchX - this.mListView.getLeft() < this.mListView.getWidth()) && (this.mTouchY - this.mListView.getTop() >= 0) && (this.mTouchY - this.mListView.getTop() < this.mListView.getHeight()))
      handleClick(paramInt, true);
  }

  public void onScroll()
  {
    invalidate(this.mListView.getLeft(), this.mListView.getTop(), this.mListView.getRight(), this.mListView.getRight());
    removeCallbacks(this.mCheckForLongPress);
  }

  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    return onTouch(paramView, paramMotionEvent, 0, 0);
  }

  public boolean onTouch(View paramView, MotionEvent paramMotionEvent, int paramInt1, int paramInt2)
  {
    this.mTouchX = (paramInt1 + ((int)paramMotionEvent.getX() + paramView.getLeft()));
    this.mTouchY = (paramInt2 + ((int)paramMotionEvent.getY() + paramView.getTop()));
    boolean bool;
    if (paramView == this.mListView)
    {
      this.isFromContentView = false;
      bool = handleListViewTouch(paramMotionEvent);
    }
    View localView;
    do
    {
      return bool;
      localView = this.mContentView;
      bool = false;
    }
    while (paramView != localView);
    this.isFromContentView = true;
    return handleContentViewTouch(paramMotionEvent);
  }

  public void releaseReferences()
  {
    setAdapter(null);
    this.mCurrentlyPlayingProvider = null;
    this.mContentView = null;
  }

  public void removeSelection()
  {
    this.mRemoveAnimator.start();
  }

  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (paramListAdapter != null)
    {
      if ((paramListAdapter instanceof FloatViewInteractionListener))
        setFloatViewInteractionListener((FloatViewInteractionListener)paramListAdapter);
      if ((paramListAdapter instanceof DragListener))
        setDragListener((DragListener)paramListAdapter);
      if ((paramListAdapter instanceof RemoveListener))
        setRemoveListener((RemoveListener)paramListAdapter);
      if ((paramListAdapter instanceof SelectionChangedListener))
        setSelectionChangedListener((SelectionChangedListener)paramListAdapter);
      if (this.mAdapterWrapper == null)
        this.mAdapterWrapper = new DragSortAdapterWrapper(getContext());
      this.mAdapterWrapper.setAdapter(paramListAdapter);
      this.mListView.setAdapter(this.mAdapterWrapper);
    }
    do
    {
      return;
      setFloatViewInteractionListener(null);
      setDragListener(null);
      setRemoveListener(null);
      setSelectionChangedListener(null);
      this.mListView.setAdapter(null);
    }
    while (this.mAdapterWrapper == null);
    this.mAdapterWrapper.setAdapter(null);
  }

  public void setContentView(View paramView, Rect paramRect)
  {
    this.mContentView = paramView;
    this.mContentViewBounds = paramRect;
    paramView.setOnTouchListener(this);
  }

  public void setCurrentlyPlayingProvider(CurrentlyPlayingProvider paramCurrentlyPlayingProvider)
  {
    this.mCurrentlyPlayingProvider = paramCurrentlyPlayingProvider;
  }

  public void setDragListener(DragListener paramDragListener)
  {
    this.mDragListener = paramDragListener;
  }

  public void setFirstItem(int paramInt)
  {
    this.mListView.setSelection(paramInt);
    if ((this.mFloatView != null) && (!this.mDropping))
      dragFloatView(this.mFloatViewListPosition, getClosestItemPosition());
  }

  public void setFloatViewInteractionListener(FloatViewInteractionListener paramFloatViewInteractionListener)
  {
    this.mFloatViewInteractionListener = paramFloatViewInteractionListener;
  }

  public void setFocused(int paramInt)
  {
    this.mFocusedPosition = paramInt;
    adjustItems();
    this.mListView.invalidate();
  }

  public void setRemoveListener(RemoveListener paramRemoveListener)
  {
    this.mRemoveListener = paramRemoveListener;
  }

  public void setSelection(int paramInt)
  {
    this.mSelectionPosition = paramInt;
    if (paramInt != -1)
      this.mFocusedPosition = paramInt;
    adjustItems();
    invalidate();
  }

  public void setSelectionChangedListener(SelectionChangedListener paramSelectionChangedListener)
  {
    this.mSelectionChangedListener = paramSelectionChangedListener;
  }

  public class CheckForLongPress
    implements Runnable
  {
    public CheckForLongPress()
    {
    }

    public void run()
    {
      if (DragSortWidget.this.mTouchListPosition == DragSortWidget.this.mDownPosition)
      {
        if (DragSortWidget.this.mTouchListPosition != DragSortWidget.this.mSelectionPosition)
          DragSortWidget.this.handleClick(DragSortWidget.this.mTouchListPosition, false);
        DragSortWidget.access$102(DragSortWidget.this, DragSortWidget.this.mTouchListPosition);
        if (DragSortWidget.this.pickUpView(DragSortWidget.this.mTouchListPosition))
        {
          DragSortWidget.access$702(DragSortWidget.this, DragSortWidget.this.mTouchX - DragSortWidget.this.mXOffsetFromTouch);
          DragSortWidget.access$802(DragSortWidget.this, DragSortWidget.this.mTouchY - DragSortWidget.this.mYOffsetFromTouch);
        }
      }
    }
  }

  private class ContentViewPickUpAnimator extends SmoothAnimator
  {
    private int mFloatViewStartHeight;
    private int mFloatViewStartWidth;
    private int mHeightDelta;
    private int mWidthDelta;
    private float mXOffsetRatio;
    private float mYOffsetRatio;

    public ContentViewPickUpAnimator(float paramInt, int arg3)
    {
      super(paramInt, i);
    }

    public void onStart()
    {
      this.mFloatViewStartWidth = DragSortWidget.this.mContentViewBounds.width();
      this.mFloatViewStartHeight = DragSortWidget.this.mContentViewBounds.height();
      DragSortWidget.access$1402(DragSortWidget.this, this.mFloatViewStartWidth);
      DragSortWidget.access$1502(DragSortWidget.this, this.mFloatViewStartHeight);
      DragSortWidget.access$1602(DragSortWidget.this, DragSortWidget.this.mTouchX - DragSortWidget.this.mContentViewBounds.left);
      DragSortWidget.access$1702(DragSortWidget.this, DragSortWidget.this.mTouchY - DragSortWidget.this.mContentViewBounds.top);
      if (DragSortWidget.this.mContentViewBounds.width() != 0)
        this.mXOffsetRatio = (DragSortWidget.this.mXOffsetFromTouch / (1.0F * DragSortWidget.this.mContentViewBounds.width()));
      if (DragSortWidget.this.mContentViewBounds.height() != 0)
        this.mYOffsetRatio = (DragSortWidget.this.mYOffsetFromTouch / (1.0F * DragSortWidget.this.mContentViewBounds.height()));
      this.mWidthDelta = (DragSortWidget.this.mFloatViewWidth - DragSortWidget.this.mFloatViewDefaultSize);
      this.mHeightDelta = (DragSortWidget.this.mFloatViewHeight - DragSortWidget.this.mFloatViewDefaultSize);
      DragSortWidget.access$2002(DragSortWidget.this, true);
      DragSortWidget.this.invalidate();
    }

    public void onStop()
    {
      DragSortWidget.access$2002(DragSortWidget.this, false);
      DragSortWidget.this.invalidate();
    }

    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      DragSortWidget.access$1402(DragSortWidget.this, (int)(this.mFloatViewStartWidth - paramFloat2 * this.mWidthDelta));
      DragSortWidget.access$1502(DragSortWidget.this, (int)(this.mFloatViewStartHeight - paramFloat2 * this.mHeightDelta));
      int i = DragSortWidget.this.mXOffsetFromTouch;
      int j = DragSortWidget.this.mYOffsetFromTouch;
      DragSortWidget.access$1602(DragSortWidget.this, (int)(DragSortWidget.this.mFloatViewWidth * this.mXOffsetRatio));
      DragSortWidget.access$1702(DragSortWidget.this, (int)(DragSortWidget.this.mFloatViewHeight * this.mYOffsetRatio));
      DragSortWidget.access$702(DragSortWidget.this, i + DragSortWidget.this.mFloatViewX - DragSortWidget.this.mXOffsetFromTouch);
      DragSortWidget.access$802(DragSortWidget.this, j + DragSortWidget.this.mFloatViewY - DragSortWidget.this.mYOffsetFromTouch);
      DragSortWidget.this.invalidate();
    }
  }

  public static abstract interface CurrentlyPlayingProvider
  {
    public abstract int getCurrentlyPlayingPosition();
  }

  public static abstract interface DragListener
  {
    public abstract void drag(int paramInt1, int paramInt2);
  }

  public class DragScroller
    implements Runnable
  {
    public static final int LEFT = 0;
    public static final int RIGHT = 1;
    private float dt;
    private int dx;
    private boolean mAbort;
    private long mCurrTime;
    private long mPrevTime;
    private float mScrollSpeed = 0.0F;
    private boolean mScrolling = false;
    private int scrollDir;
    private long tStart;

    public DragScroller()
    {
    }

    public void run()
    {
      if (this.mAbort)
      {
        this.mScrolling = false;
        return;
      }
      int i = DragSortWidget.this.mFloatViewListPosition;
      int j = DragSortWidget.this.mListView.getFirstVisiblePosition();
      int k = DragSortWidget.this.mListView.getLastVisiblePosition();
      int m = DragSortWidget.this.mListView.getCount();
      int n = DragSortWidget.this.mListView.getWidth();
      int i2;
      if (this.scrollDir == 0)
      {
        View localView2 = DragSortWidget.this.mListView.getChildAt(0);
        if (localView2 == null)
        {
          this.mScrolling = false;
          return;
        }
        if ((j == 0) && (localView2.getLeft() == 0))
        {
          this.mScrolling = false;
          return;
        }
        i2 = DragSortWidget.this.mTouchX - DragSortWidget.this.mListView.getLeft();
        if (i2 < 0)
          i2 = 0;
      }
      int i1;
      for (this.mScrollSpeed = (DragSortWidget.this.mMaxScrollSpeed / (i2 + 1)); ; this.mScrollSpeed = (-DragSortWidget.this.mMaxScrollSpeed / (i1 + 1)))
      {
        this.mCurrTime = SystemClock.uptimeMillis();
        this.dt = ((float)(this.mCurrTime - this.mPrevTime));
        this.dx = Math.round(this.mScrollSpeed * this.dt);
        DragSortWidget.this.mListView.scroll(this.dx, this.dx);
        this.mPrevTime = this.mCurrTime;
        DragSortWidget.access$102(DragSortWidget.this, DragSortWidget.this.getClosestItemPosition());
        if (DragSortWidget.this.mFloatViewListPosition == -1)
          DragSortWidget.access$102(DragSortWidget.this, i);
        DragSortWidget.this.dragFloatView(i, DragSortWidget.this.mFloatViewListPosition);
        DragSortWidget.this.post(this);
        return;
        View localView1 = DragSortWidget.this.mListView.getChildAt(k - j);
        if (localView1 == null)
        {
          this.mScrolling = false;
          return;
        }
        if ((k == m - 1) && (localView1.getRight() <= n))
        {
          this.mScrolling = false;
          return;
        }
        i1 = n - DragSortWidget.this.mTouchX + DragSortWidget.this.mListView.getLeft();
        if (i1 < 0)
          i1 = 0;
      }
    }

    public void startScrolling(int paramInt)
    {
      if (!this.mScrolling)
      {
        this.mAbort = false;
        this.mScrolling = true;
        this.tStart = SystemClock.uptimeMillis();
        this.mPrevTime = this.tStart;
        this.scrollDir = paramInt;
        DragSortWidget.this.post(this);
      }
    }

    public void stopScrolling(boolean paramBoolean)
    {
      if (paramBoolean)
      {
        DragSortWidget.this.mListView.removeCallbacks(this);
        this.mScrolling = false;
        return;
      }
      this.mAbort = true;
    }
  }

  public class DragSortAdapterWrapper extends BaseAdapter
    implements ListAdapter
  {
    private ListAdapter mAdapter;
    private Context mContext;
    private DataSetObserver mObserver = new DataSetObserver()
    {
      public void onChanged()
      {
        DragSortWidget.DragSortAdapterWrapper.this.notifyDataSetChanged();
        DragSortWidget.this.adjustItems();
      }
    };

    public DragSortAdapterWrapper(Context arg2)
    {
      Object localObject;
      this.mContext = localObject;
    }

    public int getCount()
    {
      return this.mAdapter.getCount();
    }

    public Object getItem(int paramInt)
    {
      return this.mAdapter.getItem(paramInt);
    }

    public long getItemId(int paramInt)
    {
      return this.mAdapter.getItemId(paramInt);
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      DragSortWidget.DragSortListItem localDragSortListItem;
      View localView1;
      boolean bool;
      label59: float f;
      label80: ViewGroup.LayoutParams localLayoutParams;
      if (paramView != null)
      {
        localDragSortListItem = (DragSortWidget.DragSortListItem)paramView;
        View localView2 = localDragSortListItem.getChildAt(paramInt);
        localView1 = this.mAdapter.getView(paramInt, localView2, paramViewGroup);
        localDragSortListItem.removeAllViews();
        localDragSortListItem.addView(localView1);
        if (paramInt != DragSortWidget.this.mSelectionPosition)
          break label201;
        bool = true;
        localDragSortListItem.setActivated(bool);
        if (paramInt != DragSortWidget.this.mFocusedPosition)
          break label207;
        f = 1.0F;
        localDragSortListItem.setAlpha(f);
        localLayoutParams = localDragSortListItem.getLayoutParams();
        if ((!DragSortWidget.this.mRemoving) || (paramInt != DragSortWidget.this.mRemovePosition))
          break label214;
      }
      label201: label207: label214: for (localLayoutParams.width = DragSortWidget.RemoveAnimator.access$2700(DragSortWidget.this.mRemoveAnimator); ; localLayoutParams.width = 0)
      {
        localDragSortListItem.setLayoutParams(localLayoutParams);
        if ((DragSortWidget.this.mFloatView == null) || (paramInt != DragSortWidget.this.mFloatViewListPosition))
          break label223;
        localDragSortListItem.setVisibility(4);
        return localDragSortListItem;
        localView1 = this.mAdapter.getView(paramInt, null, paramViewGroup);
        localDragSortListItem = new DragSortWidget.DragSortListItem(DragSortWidget.this, this.mContext);
        break;
        bool = false;
        break label59;
        f = 0.3F;
        break label80;
      }
      label223: localDragSortListItem.setVisibility(0);
      return localDragSortListItem;
    }

    public boolean isEnabled(int paramInt)
    {
      return this.mAdapter.isEnabled(paramInt);
    }

    public void setAdapter(ListAdapter paramListAdapter)
    {
      this.mAdapter = paramListAdapter;
      if (paramListAdapter != null)
        paramListAdapter.registerDataSetObserver(this.mObserver);
    }
  }

  public class DragSortListItem extends ViewGroup
  {
    public boolean hasTransientState = false;

    public DragSortListItem(Context arg2)
    {
      super();
      setLayoutParams(new HorizontalListView.LayoutParams(-2, -1));
    }

    public Bitmap getBitmap()
    {
      View localView = getChildAt(0);
      if (localView != null)
      {
        BitmapDrawable localBitmapDrawable = (BitmapDrawable)localView.getBackground();
        if (localBitmapDrawable != null)
          return localBitmapDrawable.getBitmap();
      }
      return null;
    }

    public void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      if (DragSortWidget.this.mActivatedDrawable != null)
        DragSortWidget.this.mActivatedDrawable.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
      View localView = getChildAt(0);
      if (localView != null)
        localView.layout(0, 0, getMeasuredWidth(), getMeasuredHeight());
    }

    protected void onMeasure(int paramInt1, int paramInt2)
    {
      int i = View.MeasureSpec.getSize(paramInt2);
      int j = View.MeasureSpec.getSize(paramInt1);
      int k = View.MeasureSpec.getMode(paramInt1);
      View localView = getChildAt(0);
      if (localView == null)
      {
        setMeasuredDimension(0, 0);
        return;
      }
      if (localView.isLayoutRequested())
        measureChild(localView, View.MeasureSpec.makeMeasureSpec(0, 0), paramInt2);
      ViewGroup.LayoutParams localLayoutParams;
      if (k == 0)
      {
        localLayoutParams = getLayoutParams();
        if ((localLayoutParams.width <= 0) && (!this.hasTransientState))
          break label97;
      }
      label97: for (j = localLayoutParams.width; ; j = localView.getMeasuredWidth())
      {
        setMeasuredDimension(j, i);
        return;
      }
    }
  }

  private class DropAnimator extends SmoothAnimator
  {
    private float mDeltaX;
    private float mDeltaY;
    private int mTargetPosition;
    private int mTargetX;
    private int mTargetY;

    public DropAnimator(float paramInt, int arg3)
    {
      super(paramInt, i);
    }

    public void onStart()
    {
      this.mTargetPosition = DragSortWidget.this.mFloatViewListPosition;
      View localView = DragSortWidget.this.mListView.getChildAt(this.mTargetPosition - DragSortWidget.this.mListView.getFirstVisiblePosition());
      DragSortWidget.this.mDropping = true;
      if (localView != null)
      {
        this.mTargetY = (localView.getTop() + DragSortWidget.this.mListView.getTop());
        this.mTargetX = (localView.getLeft() + DragSortWidget.this.mListView.getLeft());
      }
      while (true)
      {
        this.mDeltaX = (DragSortWidget.this.mFloatViewX - this.mTargetX);
        this.mDeltaY = (DragSortWidget.this.mFloatViewY - this.mTargetY);
        return;
        DragSortWidget.this.mDropping = false;
        DragSortWidget.this.mFloatViewDestroyAnimator.start();
        cancel();
      }
    }

    public void onStop()
    {
      DragSortWidget.this.finishDrop();
    }

    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      int i = this.mTargetX;
      int j = this.mTargetY;
      View localView = DragSortWidget.this.mListView.getChildAt(this.mTargetPosition - DragSortWidget.this.mListView.getFirstVisiblePosition());
      if (localView != null)
      {
        j = localView.getTop() + DragSortWidget.this.mListView.getTop();
        i = localView.getLeft() + DragSortWidget.this.mListView.getLeft();
      }
      this.mTargetX = i;
      this.mTargetY = j;
      float f = 1.0F - paramFloat2;
      DragSortWidget.access$702(DragSortWidget.this, this.mTargetX + (int)(f * this.mDeltaX));
      DragSortWidget.access$802(DragSortWidget.this, this.mTargetY + (int)(f * this.mDeltaY));
      DragSortWidget.this.invalidate();
    }
  }

  private class FloatViewDestroyAnimator extends SmoothAnimator
  {
    public FloatViewDestroyAnimator(float paramInt, int arg3)
    {
      super(paramInt, i);
    }

    public void onStop()
    {
      DragSortWidget.access$1002(DragSortWidget.this, 0.0F);
      DragSortWidget.access$102(DragSortWidget.this, -1);
      DragSortWidget.this.destroyFloatView();
      DragSortWidget.this.adjustItems();
      DragSortWidget.this.invalidate();
    }

    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      DragSortWidget.access$1002(DragSortWidget.this, 255.0F * (1.0F - paramFloat2) - 50.0F);
      DragSortWidget localDragSortWidget = DragSortWidget.this;
      boolean bool = DragSortWidget.this.mFloatViewAlpha < 0.0F;
      float f = 0.0F;
      if (bool);
      while (true)
      {
        DragSortWidget.access$1002(localDragSortWidget, f);
        DragSortWidget.this.invalidate();
        return;
        f = DragSortWidget.this.mFloatViewAlpha;
      }
    }
  }

  public static abstract interface FloatViewInteractionListener
  {
    public abstract boolean canPickUpFloatView();

    public abstract boolean floatViewDropped(int paramInt);

    public abstract void floatViewLanded(int paramInt);

    public abstract void floatViewMoved();

    public abstract void floatViewPickedUp(int paramInt);
  }

  private class RemoveAnimator extends SmoothAnimator
  {
    private int mWidth;

    public RemoveAnimator(float paramInt, int arg3)
    {
      super(paramInt, i);
    }

    public void onStart()
    {
      DragSortWidget.access$2102(DragSortWidget.this, DragSortWidget.this.mSelectionPosition);
      View localView = DragSortWidget.this.mListView.getChildAt(DragSortWidget.this.mRemovePosition - DragSortWidget.this.mListView.getFirstVisiblePosition());
      if (localView != null)
      {
        this.mWidth = localView.getWidth();
        if (localView != null)
          localView.animate().alpha(0.0F).setDuration(()this.mDurationF).start();
        ((DragSortWidget.DragSortListItem)localView).hasTransientState = true;
        DragSortWidget.this.mRemoving = true;
        return;
      }
      DragSortWidget.this.finishRemoveSelection();
      cancel();
    }

    public void onStop()
    {
      View localView = DragSortWidget.this.mListView.getChildAt(DragSortWidget.this.mRemovePosition - DragSortWidget.this.mListView.getFirstVisiblePosition());
      if (localView != null)
      {
        localView.setVisibility(8);
        localView.animate().cancel();
        localView.setAlpha(1.0F);
        ((DragSortWidget.DragSortListItem)localView).hasTransientState = false;
      }
      DragSortWidget.this.finishRemoveSelection();
      DragSortWidget.this.mRemoving = false;
    }

    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      View localView = DragSortWidget.this.mListView.getChildAt(DragSortWidget.this.mRemovePosition - DragSortWidget.this.mListView.getFirstVisiblePosition());
      if (localView != null)
      {
        this.mWidth = Math.round((1.0F - paramFloat2) * this.mWidth);
        ViewGroup.LayoutParams localLayoutParams = localView.getLayoutParams();
        localLayoutParams.width = this.mWidth;
        localView.setLayoutParams(localLayoutParams);
        DragSortWidget.this.mListView.forceLayout();
      }
      while (true)
      {
        DragSortWidget.this.mListView.invalidate();
        return;
        DragSortWidget.this.finishRemoveSelection();
        DragSortWidget.this.mRemoving = false;
        cancel();
      }
    }
  }

  public static abstract interface RemoveListener
  {
    public abstract void remove(int paramInt);
  }

  public static abstract interface SelectionChangedListener
  {
    public abstract void onSelectionChanged(int paramInt, boolean paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.dragsort.DragSortWidget
 * JD-Core Version:    0.6.2
 */