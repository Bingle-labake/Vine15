package com.google.android.gms.games.multiplayer;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.bx;

public final class ParticipantBuffer extends DataBuffer<Participant>
{
  public Participant get(int paramInt)
  {
    return new bx(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.ParticipantBuffer
 * JD-Core Version:    0.6.2
 */