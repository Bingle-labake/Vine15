package com.google.android.gms.games;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.bg;
import com.google.android.gms.internal.k;

public final class PlayerBuffer extends DataBuffer<Player>
{
  public PlayerBuffer(k paramk)
  {
    super(paramk);
  }

  public Player get(int paramInt)
  {
    return new bg(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.PlayerBuffer
 * JD-Core Version:    0.6.2
 */