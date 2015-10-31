package com.google.android.gms.internal;

import com.google.android.gms.games.multiplayer.realtime.Room;

public final class by extends m<Room>
{
  public by(k paramk)
  {
    super(paramk);
  }

  protected Room b(int paramInt1, int paramInt2)
  {
    return new bz(this.O, paramInt1, paramInt2);
  }

  protected String getPrimaryDataMarkerColumn()
  {
    return "external_match_id";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.by
 * JD-Core Version:    0.6.2
 */