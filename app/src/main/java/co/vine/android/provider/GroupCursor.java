package co.vine.android.provider;

import android.database.ContentObservable;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.CursorWrapper;
import android.database.DataSetObservable;
import android.database.DataSetObserver;
import java.util.List;

public abstract class GroupCursor<T> extends CursorWrapper
{
  public static final int LIMIT_DEFAULT = 20;
  private final ContentObservable mContentObservable = new ContentObservable();
  protected Cursor mCursor;
  protected int mCursorPosition = -1;
  protected int mLimit;
  protected List<T> mList;
  protected final GroupCursor<T>.LocalDataSetObservable mLocalDataSetObservable = new LocalDataSetObservable();
  volatile boolean mNeedsDispatchChange;
  volatile boolean mPreparing;
  volatile boolean mSelfChange;

  public GroupCursor(Cursor paramCursor)
  {
    this(paramCursor, 20);
  }

  public GroupCursor(Cursor paramCursor, int paramInt)
  {
    super(paramCursor);
    this.mCursor = paramCursor;
    if (paramInt <= 0);
    for (this.mLimit = 20; ; this.mLimit = paramInt)
    {
      if ((paramCursor != null) && (!paramCursor.isClosed()))
      {
        paramCursor.registerDataSetObserver(new LocalDataSetObserver());
        paramCursor.registerContentObserver(new LocalContentObserver());
      }
      return;
    }
  }

  public int getCount()
  {
    if (this.mList != null)
      return this.mList.size();
    return 0;
  }

  public T getItem()
  {
    if (this.mList == null)
      return null;
    return this.mList.get(this.mCursorPosition);
  }

  public int getPosition()
  {
    return this.mCursorPosition;
  }

  public boolean moveToFirst()
  {
    return moveToPosition(0);
  }

  public boolean moveToLast()
  {
    return moveToPosition(-1 + this.mList.size());
  }

  public boolean moveToNext()
  {
    return moveToPosition(1 + this.mCursorPosition);
  }

  public boolean moveToPosition(int paramInt)
  {
    int i = getCount();
    if (paramInt <= -1)
    {
      this.mCursorPosition = -1;
      return false;
    }
    if (paramInt >= i)
    {
      this.mCursorPosition = i;
      return false;
    }
    this.mCursorPosition = paramInt;
    return true;
  }

  public boolean moveToPrevious()
  {
    return moveToPosition(-1 + this.mCursorPosition);
  }

  public abstract void onPrepare();

  public final void prepare()
  {
    this.mPreparing = true;
    onPrepare();
    this.mPreparing = false;
    if (this.mNeedsDispatchChange)
    {
      this.mNeedsDispatchChange = false;
      this.mContentObservable.dispatchChange(this.mSelfChange);
    }
  }

  public void registerContentObserver(ContentObserver paramContentObserver)
  {
    this.mContentObservable.registerObserver(paramContentObserver);
  }

  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.mLocalDataSetObservable.registerObserver(paramDataSetObserver);
  }

  public boolean requery()
  {
    LocalDataSetObservable localLocalDataSetObservable = this.mLocalDataSetObservable;
    localLocalDataSetObservable.setNotifyOnChange(false);
    boolean bool1 = this.mCursor.isClosed();
    boolean bool2 = false;
    if (!bool1)
    {
      boolean bool3 = this.mCursor.requery();
      bool2 = false;
      if (bool3)
        bool2 = true;
    }
    prepare();
    localLocalDataSetObservable.setNotifyOnChange(true);
    localLocalDataSetObservable.notifyChanged();
    return bool2;
  }

  public void unregisterContentObserver(ContentObserver paramContentObserver)
  {
    this.mContentObservable.unregisterObserver(paramContentObserver);
  }

  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.mLocalDataSetObservable.unregisterObserver(paramDataSetObserver);
  }

  private class LocalContentObserver extends ContentObserver
  {
    public LocalContentObserver()
    {
      super();
    }

    public void onChange(boolean paramBoolean)
    {
      GroupCursor.this.mSelfChange = paramBoolean;
      if (GroupCursor.this.mPreparing)
      {
        GroupCursor.this.mNeedsDispatchChange = true;
        return;
      }
      GroupCursor.this.mContentObservable.dispatchChange(paramBoolean);
    }
  }

  protected class LocalDataSetObservable extends DataSetObservable
  {
    private boolean mNotifyOnChange = true;

    public LocalDataSetObservable()
    {
    }

    public void notifyChanged()
    {
      if (this.mNotifyOnChange)
        super.notifyChanged();
    }

    public void setNotifyOnChange(boolean paramBoolean)
    {
      this.mNotifyOnChange = paramBoolean;
    }
  }

  private class LocalDataSetObserver extends DataSetObserver
  {
    public LocalDataSetObserver()
    {
    }

    public void onChanged()
    {
      GroupCursor.this.mLocalDataSetObservable.notifyChanged();
    }

    public void onInvalidated()
    {
      GroupCursor.this.mLocalDataSetObservable.notifyInvalidated();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.GroupCursor
 * JD-Core Version:    0.6.2
 */