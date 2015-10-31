package com.google.android.gms.appstate;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.c;
import com.google.android.gms.internal.k;

public final class AppStateBuffer extends DataBuffer<AppState>
{
  public AppStateBuffer(k paramk)
  {
    super(paramk);
  }

  public AppState get(int paramInt)
  {
    return new c(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.appstate.AppStateBuffer
 * JD-Core Version:    0.6.2
 */