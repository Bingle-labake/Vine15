package com.twitter.android.widget;

public abstract interface RefreshListener
{
  public abstract ItemPosition getFirstItemPosition();

  public abstract int getPositionForItemId(long paramLong);

  public abstract void onRefreshCancelled();

  public abstract void onRefreshFinished();

  public abstract void onRefreshFinishedNewData();

  public abstract void onRefreshFinishedNoChange();

  public abstract void onRefreshPulled();

  public abstract void onRefreshReleased(boolean paramBoolean);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.twitter.android.widget.RefreshListener
 * JD-Core Version:    0.6.2
 */