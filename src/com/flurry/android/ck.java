package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup.LayoutParams;

abstract class ck
{
  private ck(byte paramByte)
  {
  }

  public abstract ViewGroup.LayoutParams a(Context paramContext, AdSpaceLayout paramAdSpaceLayout);

  public final int b(Context paramContext, AdSpaceLayout paramAdSpaceLayout)
  {
    if (paramAdSpaceLayout.getAdWidth().intValue() != 0);
    for (int i = 1; i != 0; i = 0)
      return bd.b(paramContext, paramAdSpaceLayout.getAdWidth().intValue());
    return -1;
  }

  public final int c(Context paramContext, AdSpaceLayout paramAdSpaceLayout)
  {
    if (paramAdSpaceLayout.getAdHeight().intValue() != 0);
    for (int i = 1; i != 0; i = 0)
      return bd.b(paramContext, paramAdSpaceLayout.getAdHeight().intValue());
    return l();
  }

  public int l()
  {
    return -2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ck
 * JD-Core Version:    0.6.2
 */