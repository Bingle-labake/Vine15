package co.vine.android.widget;

import android.database.DataSetObserver;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class SectionAdapter extends BaseAdapter
{
  public static final int TYPE_CARDROW = 0;
  public static final int TYPE_NORMAL = 1;
  private static final int VIEW_TYPE_SECTION;
  private final BaseAdapter[] mAdapters;
  private final boolean[] mCardHeaders;
  private final int mDefaultType;
  boolean mNotifyOnChange = true;
  private final int mSectionLayout;
  private final int[] mStringResIds;
  private final int[] mTypes;

  public SectionAdapter(int[] paramArrayOfInt1, int[] paramArrayOfInt2, BaseAdapter[] paramArrayOfBaseAdapter)
  {
    this(null, paramArrayOfInt1, paramArrayOfInt2, paramArrayOfBaseAdapter, 2130903135, 0);
  }

  public SectionAdapter(BaseAdapter[] paramArrayOfBaseAdapter)
  {
    this(null, null, null, paramArrayOfBaseAdapter, 2130903135, 0);
  }

  public SectionAdapter(BaseAdapter[] paramArrayOfBaseAdapter, int paramInt)
  {
    this(null, null, null, paramArrayOfBaseAdapter, 2130903135, paramInt);
  }

  public SectionAdapter(boolean[] paramArrayOfBoolean, int[] paramArrayOfInt1, int[] paramArrayOfInt2, BaseAdapter[] paramArrayOfBaseAdapter, int paramInt1, int paramInt2)
  {
    this.mCardHeaders = paramArrayOfBoolean;
    this.mStringResIds = paramArrayOfInt2;
    this.mAdapters = paramArrayOfBaseAdapter;
    this.mSectionLayout = paramInt1;
    this.mTypes = paramArrayOfInt1;
    this.mDefaultType = paramInt2;
    AdapterDataSetObserver localAdapterDataSetObserver = new AdapterDataSetObserver();
    int i = paramArrayOfBaseAdapter.length;
    for (int j = 0; j < i; j++)
      paramArrayOfBaseAdapter[j].registerDataSetObserver(localAdapterDataSetObserver);
  }

  private boolean hasDivider(int paramInt)
  {
    return (this.mStringResIds != null) && (this.mStringResIds[paramInt] > 0);
  }

  public boolean areAllItemsEnabled()
  {
    int i = this.mAdapters.length;
    for (int j = 0; ; j++)
    {
      int k = 0;
      if (j < i)
      {
        if (hasDivider(j))
          k = 1;
      }
      else
      {
        if ((k != 0) || (!super.areAllItemsEnabled()))
          break;
        return true;
      }
    }
    return false;
  }

  public int getAdapterIndex(int paramInt)
  {
    int i = 0;
    int j = 0;
    BaseAdapter[] arrayOfBaseAdapter = this.mAdapters;
    int k = arrayOfBaseAdapter.length;
    for (int m = 0; ; m++)
    {
      if (m < k)
      {
        j += arrayOfBaseAdapter[m].getCount();
        if (hasDivider(i))
          j++;
        if (paramInt >= j);
      }
      else
      {
        return i;
      }
      i++;
    }
  }

  protected View getAdapterView(BaseAdapter paramBaseAdapter, int paramInt1, int paramInt2, int paramInt3, View paramView, ViewGroup paramViewGroup)
  {
    if (this.mTypes != null)
      this.mTypes[paramInt2];
    while (true)
      return paramBaseAdapter.getView(paramInt3, paramView, paramViewGroup);
  }

  public int getAdjustedPosition(int paramInt1, int paramInt2)
  {
    return paramInt2 - getPositionOffset(paramInt1);
  }

  public int getCount()
  {
    int i = 0;
    int j = 0;
    BaseAdapter[] arrayOfBaseAdapter = this.mAdapters;
    int k = arrayOfBaseAdapter.length;
    for (int m = 0; m < k; m++)
    {
      int n = arrayOfBaseAdapter[m].getCount();
      if (n > 0)
      {
        i += n;
        if (hasDivider(j))
          i++;
      }
      j++;
    }
    return i;
  }

  public Object getItem(int paramInt)
  {
    int i = 0;
    BaseAdapter[] arrayOfBaseAdapter = this.mAdapters;
    int j = arrayOfBaseAdapter.length;
    for (int k = 0; ; k++)
    {
      BaseAdapter localBaseAdapter;
      int m;
      if (k < j)
      {
        localBaseAdapter = arrayOfBaseAdapter[k];
        m = localBaseAdapter.getCount();
        if (m <= 0)
          break label89;
        if (!hasDivider(i))
          break label71;
        m++;
        if (paramInt != 0);
      }
      else
      {
        return null;
      }
      if (paramInt < m)
      {
        return localBaseAdapter.getItem(paramInt - 1);
        label71: if (paramInt < m)
          return localBaseAdapter.getItem(paramInt);
      }
      paramInt -= m;
      label89: i++;
    }
  }

  public long getItemId(int paramInt)
  {
    int i = 0;
    BaseAdapter[] arrayOfBaseAdapter = this.mAdapters;
    int j = arrayOfBaseAdapter.length;
    for (int k = 0; ; k++)
    {
      BaseAdapter localBaseAdapter;
      int m;
      if (k < j)
      {
        localBaseAdapter = arrayOfBaseAdapter[k];
        m = localBaseAdapter.getCount();
        if (m <= 0)
          break label89;
        if (!hasDivider(i))
          break label71;
        m++;
        if (paramInt != 0);
      }
      else
      {
        return 0L;
      }
      if (paramInt < m)
      {
        return localBaseAdapter.getItemId(paramInt - 1);
        label71: if (paramInt < m)
          return localBaseAdapter.getItemId(paramInt);
      }
      paramInt -= m;
      label89: i++;
    }
  }

  public int getItemViewType(int paramInt)
  {
    int i = 1;
    int j = 0;
    for (BaseAdapter localBaseAdapter : this.mAdapters)
    {
      int n = localBaseAdapter.getCount();
      if (n > 0)
      {
        if (hasDivider(j))
        {
          n++;
          if (paramInt == 0)
            return 0;
          if (paramInt < n)
            return i + localBaseAdapter.getItemViewType(paramInt - 1);
        }
        else if (paramInt < n)
        {
          return i + localBaseAdapter.getItemViewType(paramInt);
        }
        paramInt -= n;
      }
      i += localBaseAdapter.getViewTypeCount();
      j++;
    }
    return super.getItemViewType(paramInt);
  }

  public int getMyAdapterIndex(BaseAdapter paramBaseAdapter)
  {
    int i = 0;
    BaseAdapter[] arrayOfBaseAdapter = this.mAdapters;
    int j = arrayOfBaseAdapter.length;
    for (int k = 0; ; k++)
    {
      if ((k >= j) || (arrayOfBaseAdapter[k] == paramBaseAdapter))
        return i;
      i++;
    }
  }

  public int getPositionOffset(int paramInt)
  {
    int i = 0;
    for (int j = 0; j < paramInt; j++)
      i += this.mAdapters[j].getCount();
    return i;
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    LayoutInflater localLayoutInflater = LayoutInflater.from(paramViewGroup.getContext());
    int i = 0;
    int j = 0;
    for (BaseAdapter localBaseAdapter : this.mAdapters)
    {
      int n = localBaseAdapter.getCount();
      if (n > 0)
      {
        if (hasDivider(i))
        {
          n++;
          if (paramInt == 0)
          {
            if (paramView == null)
            {
              paramView = localLayoutInflater.inflate(this.mSectionLayout, paramViewGroup, false);
              View localView = paramView.findViewById(2131361987);
              paramView.setTag(localView);
            }
            int[] arrayOfInt = this.mStringResIds;
            int i1 = arrayOfInt[(i % arrayOfInt.length)];
            if (i1 == 0)
              ((TextView)paramView.getTag()).setText(null);
            while (true)
            {
              return paramView;
              ((TextView)paramView.getTag()).setText(i1);
            }
          }
          if (paramInt < n)
            return getAdapterView(localBaseAdapter, j, i, paramInt - 1, paramView, paramViewGroup);
        }
        else if (paramInt < n)
        {
          return getAdapterView(localBaseAdapter, j, i, paramInt, paramView, paramViewGroup);
        }
        paramInt -= n;
        j++;
      }
      i++;
    }
    return paramView;
  }

  public int getViewTypeCount()
  {
    int i = 0;
    BaseAdapter[] arrayOfBaseAdapter = this.mAdapters;
    int j = arrayOfBaseAdapter.length;
    for (int k = 0; k < j; k++)
      i += arrayOfBaseAdapter[k].getViewTypeCount();
    return i + 1;
  }

  public boolean isEnabled(int paramInt)
  {
    int i = 0;
    for (BaseAdapter localBaseAdapter : this.mAdapters)
    {
      int m = localBaseAdapter.getCount();
      if (m > 0)
      {
        if (hasDivider(i))
        {
          m++;
          if (paramInt == 0)
            return false;
          if (paramInt < m)
            return localBaseAdapter.isEnabled(paramInt - 1);
        }
        else if (paramInt < m)
        {
          return localBaseAdapter.isEnabled(paramInt);
        }
        paramInt -= m;
      }
      i++;
    }
    return super.isEnabled(paramInt);
  }

  public void notifyDataSetChanged()
  {
    super.notifyDataSetChanged();
    this.mNotifyOnChange = true;
  }

  public void setNotifyOnChange(boolean paramBoolean)
  {
    this.mNotifyOnChange = paramBoolean;
  }

  class AdapterDataSetObserver extends DataSetObserver
  {
    AdapterDataSetObserver()
    {
    }

    public void onChanged()
    {
      if (SectionAdapter.this.mNotifyOnChange)
        SectionAdapter.this.notifyDataSetChanged();
    }

    public void onInvalidated()
    {
      SectionAdapter.this.notifyDataSetInvalidated();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.SectionAdapter
 * JD-Core Version:    0.6.2
 */