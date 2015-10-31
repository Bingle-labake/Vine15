package co.vine.android.recorder;

import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import co.vine.android.dragsort.DragSortWidget.DragListener;
import co.vine.android.dragsort.DragSortWidget.RemoveListener;

public class RotatingEditorAdapter extends BaseAdapter
  implements ListAdapter, DragSortWidget.RemoveListener, DragSortWidget.DragListener
{
  SegmentEditorAdapter mAdapter;
  private int mFirstPosition = 0;

  public RotatingEditorAdapter(SegmentEditorAdapter paramSegmentEditorAdapter)
  {
    this.mAdapter = paramSegmentEditorAdapter;
  }

  public boolean areAllItemsEnabled()
  {
    return this.mAdapter.areAllItemsEnabled();
  }

  public void drag(int paramInt1, int paramInt2)
  {
    this.mAdapter.drag(getPositionInAdapter(paramInt1), getPositionInAdapter(paramInt2));
  }

  public int getCount()
  {
    return this.mAdapter.getCount();
  }

  public Object getItem(int paramInt)
  {
    return this.mAdapter.getItem(getPositionInAdapter(paramInt));
  }

  public long getItemId(int paramInt)
  {
    return this.mAdapter.getItemId(getPositionInAdapter(paramInt));
  }

  public int getItemViewType(int paramInt)
  {
    return this.mAdapter.getItemViewType(getPositionInAdapter(paramInt));
  }

  public int getPositionInAdapter(int paramInt)
  {
    return (paramInt + this.mFirstPosition) % this.mAdapter.getCount();
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    return this.mAdapter.getView(getPositionInAdapter(paramInt), paramView, paramViewGroup);
  }

  public int getViewTypeCount()
  {
    return this.mAdapter.getViewTypeCount();
  }

  public boolean hasStableIds()
  {
    return this.mAdapter.hasStableIds();
  }

  public boolean isEmpty()
  {
    return this.mAdapter.isEmpty();
  }

  public boolean isEnabled(int paramInt)
  {
    return this.mAdapter.isEnabled(getPositionInAdapter(paramInt));
  }

  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    if (paramDataSetObserver != null)
      super.registerDataSetObserver(paramDataSetObserver);
    this.mAdapter.registerDataSetObserver(paramDataSetObserver);
  }

  public void remove(int paramInt)
  {
    this.mAdapter.remove(getPositionInAdapter(paramInt));
  }

  public void reset()
  {
    this.mFirstPosition = 0;
    notifyDataSetChanged();
  }

  public void setFirstPosition(int paramInt)
  {
    this.mFirstPosition = ((paramInt + this.mAdapter.getCount()) % this.mAdapter.getCount());
    notifyDataSetChanged();
  }

  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    if (paramDataSetObserver != null)
      super.unregisterDataSetObserver(paramDataSetObserver);
    this.mAdapter.unregisterDataSetObserver(paramDataSetObserver);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RotatingEditorAdapter
 * JD-Core Version:    0.6.2
 */