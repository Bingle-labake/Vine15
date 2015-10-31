package co.vine.android.recorder;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.drawable.BitmapDrawable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import co.vine.android.dragsort.DragSortWidget.DragListener;
import co.vine.android.dragsort.DragSortWidget.RemoveListener;
import co.vine.android.util.ViewUtil;
import java.util.ArrayList;
import java.util.Iterator;

public class SegmentEditorAdapter extends BaseAdapter
  implements ListAdapter, DragSortWidget.RemoveListener, DragSortWidget.DragListener
{
  private static final int NO_LAST_DELETION = -1;
  public boolean hasInitialized;
  private Context mContext;
  private final ArrayList<RecordSegment> mData;
  private final ArrayList<RecordSegment> mDeleted;
  private int mLastDeletedIndex = -1;
  private final int mMargin;
  private final int mSize;

  public SegmentEditorAdapter(SegmentEditorAdapter paramSegmentEditorAdapter)
  {
    this.mDeleted = paramSegmentEditorAdapter.mDeleted;
    this.mData = paramSegmentEditorAdapter.mData;
    this.mContext = paramSegmentEditorAdapter.mContext;
    this.mMargin = paramSegmentEditorAdapter.mMargin;
    this.mSize = paramSegmentEditorAdapter.mSize;
    this.mLastDeletedIndex = paramSegmentEditorAdapter.mLastDeletedIndex;
  }

  public SegmentEditorAdapter(ArrayList<RecordSegment> paramArrayList, Context paramContext, float paramFloat)
  {
    this.mDeleted = new ArrayList();
    this.mData = new ArrayList();
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      RecordSegment localRecordSegment = (RecordSegment)localIterator.next();
      if (!localRecordSegment.removed)
        this.mData.add(localRecordSegment);
    }
    this.hasInitialized = true;
    this.mContext = paramContext;
    this.mMargin = ((int)(2.0F * paramFloat));
    this.mSize = ((int)(64.0F * paramFloat));
  }

  public boolean areAllItemsEnabled()
  {
    return true;
  }

  public boolean canUndoDelete()
  {
    return this.mLastDeletedIndex != -1;
  }

  public void commitDelete()
  {
    this.mLastDeletedIndex = -1;
  }

  public boolean compareTo(ArrayList<RecordSegment> paramArrayList)
  {
    if (paramArrayList == null)
      if (this.mData != null);
    while (true)
    {
      return true;
      return false;
      if ((this.mDeleted.size() > 0) || (paramArrayList.size() != this.mData.size()))
        return false;
      int i = this.mData.size();
      for (int j = 0; j < i; j++)
        if (this.mData.get(j) != paramArrayList.get(j))
          return false;
    }
  }

  public void drag(int paramInt1, int paramInt2)
  {
    if (paramInt1 != paramInt2)
    {
      RecordSegment localRecordSegment = (RecordSegment)this.mData.get(paramInt1);
      this.mData.set(paramInt1, this.mData.get(paramInt2));
      this.mData.set(paramInt2, localRecordSegment);
      notifyDataSetChanged();
    }
  }

  public int getCount()
  {
    return this.mData.size();
  }

  public ArrayList<RecordSegment> getData()
  {
    return this.mData;
  }

  public ArrayList<RecordSegment> getDeleted()
  {
    return this.mDeleted;
  }

  public Object getItem(int paramInt)
  {
    return this.mData.get(paramInt);
  }

  public long getItemId(int paramInt)
  {
    return 0L;
  }

  public int getItemViewType(int paramInt)
  {
    return 0;
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    ViewGroup.MarginLayoutParams localMarginLayoutParams;
    if (paramView == null)
    {
      if (this.mContext == null)
        this.mContext = paramViewGroup.getContext();
      paramView = new View(this.mContext);
      localMarginLayoutParams = new ViewGroup.MarginLayoutParams(this.mSize, this.mSize);
      if (paramInt != -1 + getCount())
        break label151;
    }
    label151: for (int i = 0; ; i = this.mMargin)
    {
      localMarginLayoutParams.bottomMargin = i;
      paramView.setLayoutParams(localMarginLayoutParams);
      RecordSegment localRecordSegment = (RecordSegment)this.mData.get(paramInt);
      if ((localRecordSegment.drawable == null) && (!TextUtils.isEmpty(localRecordSegment.getThumbnailPath())))
        localRecordSegment.drawable = BitmapDrawable.createFromPath(localRecordSegment.getThumbnailPath());
      ViewUtil.setBackground(paramView, ((RecordSegment)this.mData.get(paramInt)).drawable);
      return paramView;
      localMarginLayoutParams = (ViewGroup.MarginLayoutParams)paramView.getLayoutParams();
      break;
    }
  }

  public int getViewTypeCount()
  {
    return 0;
  }

  public boolean hasStableIds()
  {
    return false;
  }

  public boolean isEmpty()
  {
    return this.mData.size() == 0;
  }

  public boolean isEnabled(int paramInt)
  {
    return true;
  }

  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    if (paramDataSetObserver != null)
      super.registerDataSetObserver(paramDataSetObserver);
  }

  public void remove(int paramInt)
  {
    this.mLastDeletedIndex = paramInt;
    this.mDeleted.add(this.mData.remove(paramInt));
    notifyDataSetChanged();
  }

  public void reverse()
  {
    ArrayList localArrayList = new ArrayList(this.mData.size());
    for (int i = -1 + this.mData.size(); i >= 0; i--)
      localArrayList.add(this.mData.get(i));
    this.mData.clear();
    this.mData.addAll(localArrayList);
    notifyDataSetChanged();
  }

  public void undoDelete()
  {
    if (this.mLastDeletedIndex >= 0)
    {
      this.mData.add(this.mLastDeletedIndex, this.mDeleted.remove(-1 + this.mDeleted.size()));
      this.mLastDeletedIndex = -1;
      notifyDataSetChanged();
    }
  }

  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    if (paramDataSetObserver != null)
      super.unregisterDataSetObserver(paramDataSetObserver);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.SegmentEditorAdapter
 * JD-Core Version:    0.6.2
 */