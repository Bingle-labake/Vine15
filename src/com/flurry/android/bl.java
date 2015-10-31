package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsoluteLayout.LayoutParams;

final class bl extends ck
{
  public final ViewGroup.LayoutParams a(Context paramContext, AdSpaceLayout paramAdSpaceLayout)
  {
    return new AbsoluteLayout.LayoutParams(b(paramContext, paramAdSpaceLayout), c(paramContext, paramAdSpaceLayout), 0, 0);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bl
 * JD-Core Version:    0.6.2
 */