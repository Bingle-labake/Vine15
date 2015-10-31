package co.vine.android;

public class ListState
{
  public int firstVisibleItem;
  public boolean hasNewScrollState;
  private boolean mDirty;
  private int mScrollState;
  public int totalItemCount;
  public int visibleItemCount;

  public boolean isDirty()
  {
    return this.mDirty;
  }

  public boolean isFling()
  {
    return this.mScrollState == 2;
  }

  public void setDirty(boolean paramBoolean)
  {
    this.mDirty = paramBoolean;
  }

  public void setScrollState(int paramInt)
  {
    this.mScrollState = paramInt;
  }

  public boolean shouldUpdate()
  {
    return (this.mScrollState != 2) && (this.mDirty);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ListState
 * JD-Core Version:    0.6.2
 */