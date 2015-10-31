package com.flurry.android;

import android.content.Context;
import android.view.ViewGroup;

final class cb extends bf
{
  private final ao eo;

  public cb(ao paramao, AdUnit paramAdUnit)
  {
    super(paramAdUnit);
    this.eo = paramao;
  }

  public final void a(Context paramContext, ViewGroup paramViewGroup)
  {
    if (this.eo != null)
      this.eo.f();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.cb
 * JD-Core Version:    0.6.2
 */