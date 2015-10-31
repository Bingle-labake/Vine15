package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup;

abstract class bf
{
  private final String H;
  private final AdUnit M;

  public bf(AdUnit paramAdUnit)
  {
    this.M = paramAdUnit;
    if (paramAdUnit != null);
    for (String str = paramAdUnit.getAdSpace().toString(); ; str = null)
    {
      this.H = str;
      return;
    }
  }

  public final AdUnit E()
  {
    return this.M;
  }

  public final String Y()
  {
    return this.H;
  }

  public abstract void a(Context paramContext, ViewGroup paramViewGroup);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bf
 * JD-Core Version:    0.6.2
 */