package com.google.android.gms.games;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.bf;
import com.google.android.gms.internal.k;

public final class GameBuffer extends DataBuffer<Game>
{
  public GameBuffer(k paramk)
  {
    super(paramk);
  }

  public Game get(int paramInt)
  {
    return new bf(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.GameBuffer
 * JD-Core Version:    0.6.2
 */