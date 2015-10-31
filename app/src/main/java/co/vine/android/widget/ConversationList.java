package co.vine.android.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.ListView;

public class ConversationList extends ListView
  implements AbsListView.OnScrollListener
{
  private View mGetMoreHeaderProgressContainer;
  private GetMoreListener mGetMoreListener;
  private View mProgressView;
  private AbsListView.OnScrollListener mScrollListener;

  public ConversationList(Context paramContext)
  {
    super(paramContext);
  }

  public ConversationList(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public ConversationList(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  public void deactivateRefresh()
  {
    this.mProgressView.setVisibility(8);
  }

  public void hideProgress()
  {
    this.mProgressView.setVisibility(4);
  }

  protected void onFinishInflate()
  {
    super.onFinishInflate();
    super.setOnScrollListener(this);
    this.mGetMoreHeaderProgressContainer = LayoutInflater.from(getContext()).inflate(2130903076, null);
    this.mProgressView = this.mGetMoreHeaderProgressContainer.findViewById(2131361905);
    addHeaderView(this.mGetMoreHeaderProgressContainer, null, false);
  }

  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt2 == 0);
    do
    {
      return;
      if ((this.mGetMoreListener != null) && (paramInt1 == 0) && (this.mProgressView.getVisibility() != 8) && (getChildAt(0) == this.mGetMoreHeaderProgressContainer))
        this.mGetMoreListener.getMore();
    }
    while (this.mScrollListener == null);
    this.mScrollListener.onScroll(paramAbsListView, paramInt1, paramInt2, paramInt3);
  }

  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    if (this.mScrollListener != null)
      this.mScrollListener.onScrollStateChanged(paramAbsListView, paramInt);
  }

  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (getCount() > 0)
      setSelection(-1 + getCount());
  }

  public void reactivateRefresh()
  {
    this.mProgressView.setVisibility(4);
  }

  public void setGetMoreListener(GetMoreListener paramGetMoreListener)
  {
    this.mGetMoreListener = paramGetMoreListener;
  }

  public void setOnScrollListener(AbsListView.OnScrollListener paramOnScrollListener)
  {
    this.mScrollListener = paramOnScrollListener;
  }

  public void showProgress()
  {
    if (this.mProgressView.getVisibility() != 8)
      this.mProgressView.setVisibility(0);
  }

  public static abstract interface GetMoreListener
  {
    public abstract void getMore();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.ConversationList
 * JD-Core Version:    0.6.2
 */